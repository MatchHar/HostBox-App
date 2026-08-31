# Support

[English](SUPPORT.md) · [简体中文](SUPPORT.zh-Hans.md) · [繁體中文](SUPPORT.zh-Hant.md)

## Before opening an issue

1. Confirm the VPS is reachable over the same network path used by HostBox.
2. Reopen the deployment record and identify the first failed HostBox step.
3. Confirm free disk space and that the expected containers are running.
4. Run HostBox health verification; do not bypass a failed backup or rollback.
5. Review [setup](docs/SETUP.md), [operations](docs/OPERATIONS.md), and
   [compatibility](docs/COMPATIBILITY.md).

## Safe diagnostic information

You may provide the HostBox version/build, iOS/iPadOS version, device model,
server OS name/version, component versions shown by HostBox, access mode,
authentication type without its credential, the failed step name, HTTP status,
and minimal redacted reproduction steps.

Do not provide passwords, tokens, cookies, private keys, SSH fingerprints,
server hostnames or IPs, `.env`, Compose files, database dumps, raw logs, VINs,
plates, locations, or route history.

## Common symptoms

- **SSH host changed:** stop and verify why the server fingerprint changed.
- **401/403:** verify the chosen endpoint and authentication mode; rotate a
  possibly exposed credential instead of posting it.
- **Timeout:** check firewall, tunnel/VPN state, DNS, and the selected entry.
- **Service unhealthy after update:** keep the generated backup, use HostBox's
  recorded recovery path, and do not manually delete volumes.
- **My T cannot import:** repeat the handoff on the same unlocked device before
  the local clipboard package expires.

## Where to ask

- Product/setup issue: use the repository issue template after public launch.
- Security problem: follow [SECURITY.md](SECURITY.md), never a public issue.
- Privacy or App Store support: use
  [official support](https://my-tesla.app/support/en/).
- Upstream component problem: contact that project only after confirming the
  problem is not specific to HostBox's supported configuration.

Support is provided on a reasonable-effort basis for this independent project.
