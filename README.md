# HostBox

[English](README.md) · [简体中文](README.zh-Hans.md) · [繁體中文](README.zh-Hant.md)

[![HostBox on the App Store](https://img.shields.io/itunes/v/6798103086?label=App%20Store&color=0a84ff)](https://apps.apple.com/app/id6798103086)
[![Documentation safety](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml/badge.svg)](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml)

HostBox is an iPhone deployment and maintenance tool for a self-hosted My T
Server. It connects directly to a VPS selected by the user, guides installation
of TeslaMate, TeslaMateAPI, and optional My T Companion, verifies service
health, and hands one tested connection entry to My T.

**[Download HostBox](https://apps.apple.com/app/id6798103086)** ·
[Official product page and video](https://my-tesla.app/hostbox/en/) ·
[Privacy policy](https://my-tesla.app/hostbox/privacy/en/) ·
[Support](https://my-tesla.app/support/en/)

## Repository boundary

This repository contains official product documentation and support material.
It is not an open-source release of HostBox. The iOS source, SSH/deployment
implementation, generated Compose configuration, signing material, production
infrastructure, and release automation remain private. See
[LICENSE.md](LICENSE.md) and [SECURITY.md](SECURITY.md).

## How it works

1. Add a VPS and authenticate over SSH with a password or private key.
2. Run the guided My T Server deployment and choose temporary-IP or Cloudflare
   Tunnel access.
3. HostBox verifies the selected components and unified entry point.
4. Transfer the non-secret handoff to My T, then explicitly import the
   credential package on the same device.

My T uses the single `base_url` and API token shown on the completion screen.
TeslaMate web, Grafana, database, MQTT, and Companion ports should not be
published independently.

## Components and responsibility

| Component | Role | Maintained by |
| --- | --- | --- |
| HostBox | Guided VPS deployment, verification, maintenance, backup and rollback orchestration | HostBox |
| My T | iOS vehicle experience and the saved My T Server connection | My T |
| My T Companion | Optional self-hosted enhancements and notification/event bridge | My T project, open source |
| TeslaMate | Vehicle data collection and storage on the user's server | TeslaMate project |
| TeslaMateAPI | API layer used by My T | TeslaMateAPI project |
| Cloudflare | Optional tunnel/access provider selected by the user | Cloudflare |

HostBox is an independent product. It is not affiliated with or endorsed by
Tesla, TeslaMate, TeslaMateAPI, Grafana, or Cloudflare.

## Requirements

- iPhone or iPad running iOS/iPadOS 17.0 or later.
- A VPS running a supported Ubuntu or Debian release, with Internet access and
  an account permitted to perform the requested administrative work.
- Enough storage and memory for TeslaMate, PostgreSQL, Grafana, API, MQTT, and
  optional Companion services.
- A secure long-term access method such as HTTPS, a private VPN, or Cloudflare
  Tunnel. Temporary public-IP mode is intended for guided setup and exposes
  only the authenticated My T API entry.

Read the exact [compatibility policy](docs/COMPATIBILITY.md) before deployment.

## Documentation

- [Setup and secure handoff](docs/SETUP.md)
- [Architecture and trust boundaries](docs/ARCHITECTURE.md)
- [Updates, backups, rollback, and recovery](docs/OPERATIONS.md)
- [Compatibility and verified component policy](docs/COMPATIBILITY.md)
- [Privacy](PRIVACY.md)
- [Security reporting](SECURITY.md)
- [Support and safe diagnostics](SUPPORT.md)
- [Release history](CHANGELOG.md)
- [Third-party notices](THIRD_PARTY_NOTICES.md)

The App Store badge and `docs/app-store-release.json` obtain the public version
from Apple. Documentation does not predict review status or maintain a second
hand-written “current version.” Verified server component versions are supplied
to HostBox through a separately signed stable catalog; a newer upstream release
is not deployed until the complete path and rollback have been validated.

## Screenshots and video

The localized launch video and current product presentation are maintained on
the [official HostBox page](https://my-tesla.app/hostbox/en/). App Store
screenshots are maintained in Apple's signed distribution listing so this
documentation does not become a stale parallel gallery.
