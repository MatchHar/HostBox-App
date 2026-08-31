#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

forbidden_path_pattern='(^|/)(DerivedData|xcuserdata|AppStore|ci_scripts)(/|$)|(^|/)(Package\.swift|Package\.resolved|Podfile|Cartfile|project\.yml|Dockerfile|docker-compose[^/]*|compose[^/]*\.ya?ml)$|\.(swift|m|mm|h|c|cc|cpp|metal|storyboard|xib|pbxproj|ipa|xcarchive|mobileprovision|p12|cer|der|key|pem|sqlite|sql|dump|log)$|\.xcodeproj/|\.xcworkspace/|(^|/)\.env(\.|$)|(^|/)(id_rsa|id_ed25519)(\.|$)'

blocked_paths="$(git ls-files | grep -E "$forbidden_path_pattern" || true)"
if [ -n "$blocked_paths" ]; then
  echo "Public repository path-boundary violation:" >&2
  echo "$blocked_paths" >&2
  exit 1
fi

if git grep -nEI -- '-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|github_pat_[A-Za-z0-9_]{20,}|gh[pousr]_[A-Za-z0-9]{30,}|sk_live_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|CF-Access-Client-Secret[[:space:]]*[:=][[:space:]]*[^<[:space:]]+' -- ':!scripts/verify-public-boundary.sh'; then
  echo "Credential-like content detected." >&2
  exit 1
fi

python3 - <<'PY'
from pathlib import Path
import ipaddress
import re

allowed_suffixes = {".md", ".json", ".yml", ".yaml"}
ipv4 = re.compile(r"(?<![0-9.])(?:\d{1,3}\.){3}\d{1,3}(?![0-9.])")
errors = []
for path in sorted(Path(".").rglob("*")):
    if not path.is_file() or ".git" in path.parts or path.suffix.lower() not in allowed_suffixes:
        continue
    text = path.read_text(encoding="utf-8")
    for match in ipv4.finditer(text):
        raw = match.group(0)
        try:
            address = ipaddress.ip_address(raw)
        except ValueError:
            continue
        allowed = (
            address.is_loopback
            or address.is_unspecified
            or address in ipaddress.ip_network("192.0.2.0/24")
            or address in ipaddress.ip_network("198.51.100.0/24")
            or address in ipaddress.ip_network("203.0.113.0/24")
        )
        if not allowed:
            errors.append(f"{path}:{text.count(chr(10), 0, match.start()) + 1}: non-documentation IPv4 address {raw}")

if errors:
    raise SystemExit("\n".join(errors))
print("No production IPv4 address found in public documentation.")
PY

allowed_scripts='^(scripts/(sync_app_store_release\.py|verify-stable-catalog\.py|verify-links\.sh|verify-documentation-parity\.sh|verify-public-boundary\.sh)|\.githooks/pre-commit)$'
unexpected_executables="$(git ls-files -s | awk '$1 ~ /^1007/ {print $4}' | grep -Ev "$allowed_scripts" || true)"
if [ -n "$unexpected_executables" ]; then
  echo "Unexpected executable outside documentation checks:" >&2
  echo "$unexpected_executables" >&2
  exit 1
fi

echo "Public repository boundary verified."
