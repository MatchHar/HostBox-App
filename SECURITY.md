# Security policy

[English](SECURITY.md) · [简体中文](SECURITY.zh-Hans.md) · [繁體中文](SECURITY.zh-Hant.md)

## Scope

Reports may cover HostBox's documented SSH connection, credential handling,
handoff behavior, deployment safety, public documentation, or the signed
component-catalog trust boundary. The private App source is not published here.

## Private reporting

Do not open a public issue for a suspected vulnerability. Use this repository's
[private vulnerability reporting](https://github.com/MatchHar/HostBox-App/security/advisories/new).

Include affected versions, iOS and server OS versions, the network/authentication
type, minimal redacted reproduction steps, impact, and a safe proof of concept.
Never include a live password, token, cookie, private key, server address,
fingerprint, `.env`, Compose file, database export, VIN, or location.

## Secure deployment baseline

- Verify the SSH host-key fingerprint before first trust and after unexpected
  server changes.
- Prefer a dedicated administrative account and the least privilege compatible
  with deployment.
- Keep PostgreSQL, MQTT, Grafana, TeslaMate web, and Companion ports private.
- Use HTTPS, a private VPN, or Cloudflare Tunnel for persistent remote access.
- Use unique secrets and rotate anything disclosed in logs or screenshots.
- Do not bypass signed-catalog, digest, backup, health-check, or rollback
  failures merely to complete an upgrade.
- Test backup restoration before relying on it.

HostBox documentation never asks users to publish a private key, database dump,
or complete deployment configuration in a GitHub issue.
