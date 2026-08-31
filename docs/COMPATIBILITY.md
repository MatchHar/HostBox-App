# Compatibility and verified component policy

[English](COMPATIBILITY.md) · [简体中文](COMPATIBILITY.zh-Hans.md) · [繁體中文](COMPATIBILITY.zh-Hant.md)

Validation baseline date: 2026-08-30

## HostBox device support

- iOS/iPadOS 17.0 or later.
- iPhone and iPad are target device families; the guided flow is optimized for
  a personal Apple device with access to the selected VPS route.
- The public App Store version is read from Apple in
  [`app-store-release.json`](app-store-release.json) and by the README badge.

## VPS baseline

| Item | Supported or recommended baseline |
| --- | --- |
| Distribution | Ubuntu 22.04/24.04 or Debian 12 recommended; automated Docker installation targets apt-based Ubuntu/Debian |
| CPU | `amd64` or `arm64`, subject to availability of every pinned component image |
| Memory | 2 GB or more recommended; 1 GB may be slow/OOM; below 768 MB is blocked |
| Free storage | 20 GB or more recommended; below 5 GB is blocked |
| Network | Outbound access to required registries and the selected tunnel provider; inbound SSH through the user's chosen route |
| Access | HTTPS/Tunnel or private VPN recommended for long-term use |

HostBox preflight is authoritative for a specific VPS. An unrecognized or
non-apt distribution may be inspectable over SSH but is not a promise that the
guided Docker installation is supported.

## Server component compatibility

HostBox installs only the combination in the
[public stable catalog](https://raw.githubusercontent.com/MatchHar/My-T-Companion/main/hostbox/myt-stack.json)
after verifying its adjacent signature and policy. The target version shown in
HostBox Settings is authoritative. Installed versions are displayed separately
because an existing VPS can be behind the target.

For audit context, the 2026-08-30 validation baseline pinned TeslaMate/Grafana
4.2.0, TeslaMateAPI 1.25.0, and My T Companion 1.10.36. This sentence is a dated
record, not a mutable “current version.” New targets are delivered by the
signed catalog and do not require editing this historical baseline.

## Compatibility promises

- A newer upstream release is informational until promoted into the signed
  stable catalog.
- Mutable image tags and automatic “follow latest” deployment are unsupported.
- A catalog upgrade must preserve the single My T entry, backup validation,
  health verification, and paired rollback.
- HostBox's embedded fallback can intentionally be older than the online
  catalog and is used only under its verified fallback policy.
- Manually modified stacks may remain usable, but automatic repair/rollback is
  supported only where HostBox can identify the exact services it owns.
