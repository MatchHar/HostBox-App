#!/usr/bin/env python3
"""Read-only structural audit of the public HostBox stable component catalog."""

from __future__ import annotations

import json
import re
import urllib.request

CATALOG_URL = (
    "https://raw.githubusercontent.com/MatchHar/My-T-Companion/"
    "main/hostbox/myt-stack.json"
)
SIGNATURE_URL = CATALOG_URL + ".sig"
PINNED_IMAGES = ("teslamate", "grafana", "teslamateapi", "postgres", "mosquitto", "caddy")


def fetch(url: str) -> bytes:
    request = urllib.request.Request(
        url, headers={"Accept": "application/octet-stream", "User-Agent": "HostBox-Docs-Catalog-Audit/1"}
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read()


def main() -> None:
    raw = fetch(CATALOG_URL)
    signature = fetch(SIGNATURE_URL).strip()
    catalog = json.loads(raw)

    if catalog.get("channel") != "stable" or not catalog.get("revision"):
        raise SystemExit("catalog is not a revisioned stable catalog")
    upstream_components = catalog.get("upstream", {})
    for name in ("teslamate", "teslamateapi", "companion"):
        if upstream_components.get(name, {}).get("follow_latest_release") is not False:
            raise SystemExit(f"{name} is allowed to follow latest release")
    if any(component.get("follow_latest_release") is True for component in upstream_components.values()):
        raise SystemExit("a catalog component explicitly follows the latest release")
    images = catalog.get("images", {})
    digest = re.compile(r"^[^\s:]+(?:/[^\s:]+)*:[^\s@]+@sha256:[0-9a-f]{64}$")
    for name in PINNED_IMAGES:
        if not digest.fullmatch(str(images.get(name, ""))):
            raise SystemExit(f"{name} is not pinned by version and sha256 digest")
    companion = str(images.get("companion", ""))
    if not re.fullmatch(r"myt/companion:\d+\.\d+\.\d+", companion):
        raise SystemExit("Companion is not pinned to an explicit semantic version")
    artifact_digest = str(catalog.get("artifacts", {}).get("companion_archive_sha256", ""))
    if not re.fullmatch(r"[0-9a-f]{64}", artifact_digest):
        raise SystemExit("Companion archive digest is missing")
    if len(signature) < 64:
        raise SystemExit("adjacent catalog signature is missing or unexpectedly short")
    print(f"Stable catalog {catalog['revision']} passed structural policy checks.")


if __name__ == "__main__":
    main()
