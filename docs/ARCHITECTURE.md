# Architecture and trust boundaries

[English](ARCHITECTURE.md) · [简体中文](ARCHITECTURE.zh-Hans.md) · [繁體中文](ARCHITECTURE.zh-Hant.md)

## Product boundary

HostBox is the deployment/maintenance layer. My T is the vehicle-facing App.
TeslaMate and related server components run on infrastructure controlled by the
user. Optional Companion extends that self-hosted server; it is not the HostBox
iOS application and does not make the private HostBox source public.

## Data paths

1. **HostBox → VPS:** direct SSH and service health checks over the route chosen
   by the user.
2. **VPS → upstream registries:** version-pinned component downloads selected
   by the verified stable catalog.
3. **HostBox → My T:** non-secret URL handoff plus a same-device, short-lived
   clipboard package following explicit user action.
4. **My T → My T Server:** one authenticated `base_url`; internal services stay
   behind the user's server boundary.

HostBox does not proxy SSH credentials or vehicle history through a
developer-operated HostBox server.

## Catalog trust

Remote catalog content must be adjacent to a valid Ed25519 signature. HostBox
rejects invalid signatures, source substitution, policy violations, mutable
“latest” deployment behavior, and catalog downgrade. Container references are
pinned by version and digest where supported. Companion release archives have a
separate digest. A previously verified cache or embedded fallback can be used
when remote content cannot be accepted.

The public catalog describes deployment compatibility; the signing private key
and publishing implementation are never part of this documentation repository.

## Network boundary

The durable public surface should be the single authenticated My T Server
entry, normally protected by HTTPS/Tunnel or a private VPN. Database, MQTT,
TeslaMate web, Grafana, and Companion are internal services. Temporary-IP mode
keeps administrative web interfaces on loopback and uses an SSH tunnel when the
user must access them.

## Recovery boundary

Before a supported stack upgrade, HostBox verifies a PostgreSQL custom-format
backup. A pull failure restores configuration without pretending containers
were changed. Once service switching begins, failed startup or health checks
trigger the paired configuration/database recovery path. HostBox does not
silently update to an unverified upstream release.
