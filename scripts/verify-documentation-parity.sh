#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

triplets=(
  "README.md|README.zh-Hans.md|README.zh-Hant.md"
  "PRIVACY.md|PRIVACY.zh-Hans.md|PRIVACY.zh-Hant.md"
  "SECURITY.md|SECURITY.zh-Hans.md|SECURITY.zh-Hant.md"
  "SUPPORT.md|SUPPORT.zh-Hans.md|SUPPORT.zh-Hant.md"
  "CHANGELOG.md|CHANGELOG.zh-Hans.md|CHANGELOG.zh-Hant.md"
  "docs/SETUP.md|docs/SETUP.zh-Hans.md|docs/SETUP.zh-Hant.md"
  "docs/ARCHITECTURE.md|docs/ARCHITECTURE.zh-Hans.md|docs/ARCHITECTURE.zh-Hant.md"
  "docs/OPERATIONS.md|docs/OPERATIONS.zh-Hans.md|docs/OPERATIONS.zh-Hant.md"
  "docs/COMPATIBILITY.md|docs/COMPATIBILITY.zh-Hans.md|docs/COMPATIBILITY.zh-Hant.md"
)

for triplet in "${triplets[@]}"; do
  IFS='|' read -r english simplified traditional <<< "$triplet"
  for file in "$english" "$simplified" "$traditional"; do
    test -s "$file" || { echo "Missing documentation: $file" >&2; exit 1; }
  done
  expected="$(grep -c '^## ' "$english")"
  for file in "$simplified" "$traditional"; do
    count="$(grep -c '^## ' "$file")"
    test "$count" -eq "$expected" || {
      echo "$file has $count H2 sections; expected $expected to match $english" >&2
      exit 1
    }
  done
done

for file in README.md README.zh-Hans.md README.zh-Hant.md; do
  grep -Fq 'img.shields.io/itunes/v/6798103086' "$file" || {
    echo "$file must use Apple's dynamic App Store version badge" >&2
    exit 1
  }
done

for file in docs/COMPATIBILITY*.md; do
  grep -Fq '2026-08-30' "$file" || { echo "$file has no validation baseline" >&2; exit 1; }
  grep -Fq 'myt-stack.json' "$file" || { echo "$file omits the public stable catalog" >&2; exit 1; }
done

if rg -n 'tobiasehlert/teslamateapi:latest|teslamate/teslamate:latest|follow_latest_release["` ]*[:=]["` ]*true' \
  --glob '*.md' .; then
  echo "Documentation contains mutable deployment guidance." >&2
  exit 1
fi

if rg -n 'github\.com/MatchHar/HostBox([/#)]|$)' --glob '*.md' .; then
  echo "Public documentation links to the private HostBox source repository." >&2
  exit 1
fi

echo "Documentation language and version-policy checks passed."
