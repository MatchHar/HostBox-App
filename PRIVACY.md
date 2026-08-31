# Privacy

[English](PRIVACY.md) · [简体中文](PRIVACY.zh-Hans.md) · [繁體中文](PRIVACY.zh-Hant.md)

Last updated: August 30, 2026

The controlling public policy is the
[HostBox privacy policy](https://my-tesla.app/hostbox/privacy/en/). This file
provides a readable repository copy for the HostBox iOS app
(`app.hostbox.ios`).

## Product scope

HostBox is an independent iOS deployment tool for installing and maintaining a
My T Server on a VPS selected by the user. It does not replace Tesla's official
services and does not require an account on a HostBox-operated server.

## On-device connection data

VPS host, port, SSH username, authentication method, bounded deployment state,
and sanitized handoff records are stored on the device. When the user
explicitly enables backup, non-secret connection metadata can sync through the
user's private iCloud account.

Free-form notes, trusted SSH fingerprints, diagnostic logs, passwords, private
keys, API tokens, Grafana credentials, and Cloudflare credentials are excluded
from that backup.

## Credentials

SSH passwords and private keys are stored in iOS Keychain. My T API tokens,
Grafana credentials, and Cloudflare Access service credentials may also be
stored in on-device Keychain when required by a completed deployment. They must
be re-entered after restoring only the non-secret iCloud backup.

A Cloudflare API token supplied for deployment remains in memory for the active
operation and is not written to deployment history, diagnostic logs, Keychain,
or iCloud backup.

## SSH commands and diagnostics

Commands and output entered on the advanced command page remain in bounded
memory while the App is running so that page can be revisited. They are not
kept as permanent history after the App exits and are not uploaded by HostBox.
Deployment steps, outcomes, and bounded diagnostics are stored locally for
retry and maintenance. Users must redact diagnostics before sharing them.

## Handoff to My T

The URL used to open My T carries non-secret connection metadata only. It does
not carry a password, bearer token, or Cloudflare secret. A full connection
package is placed on the same device's local clipboard only after an explicit
HostBox action and expires after five minutes. My T tests the endpoint and asks
before saving or replacing a connection.

## Network access

HostBox connects to the VPS specified by the user for SSH and health checks. It
may access public component catalogs and, when selected, Cloudflare APIs. It can
open My T through a URL scheme for connection import. Remote deployment actions
run on the user's VPS; the VPS password is not uploaded to a HostBox-operated
cloud service.

## Vehicle data

HostBox does not collect Tesla account credentials, vehicle history, trips,
VINs, or locations. Vehicle data remains in the user's TeslaMate instance or
other server components. HostBox does not use cross-app advertising tracking or
the advertising identifier.

## Third parties

The user may choose independent projects and services including TeslaMate,
TeslaMateAPI, Grafana, My T Companion, and Cloudflare. Their licenses, privacy
policies, accounts, and infrastructure remain separate from HostBox.

## Deletion

Deleting a server or completion record removes its related on-device HostBox
Keychain items. Data already installed on the VPS, in iCloud, in My T, or in a
third-party account must be deleted separately by the user in that system.

## Support

Never submit credentials, private keys, live server addresses, `.env` files,
Compose files, database exports, VINs, precise locations, or raw production
logs to a public issue. Use [official support](https://my-tesla.app/support/en/)
for privacy questions and [SECURITY.md](SECURITY.md) for vulnerabilities.
