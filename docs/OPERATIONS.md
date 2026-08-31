# Updates, backups, rollback, and recovery

[English](OPERATIONS.md) · [简体中文](OPERATIONS.zh-Hans.md) · [繁體中文](OPERATIONS.zh-Hant.md)

## Update policy

The version offered by HostBox is the version in its verified stable catalog,
not necessarily the newest upstream release. Promotion requires end-to-end
compatibility, access, backup, health, and rollback validation. HostBox reports
new upstream releases separately and does not follow a mutable latest tag.

Before updating, confirm free storage, stable SSH access, provider snapshot or
off-server backup, and a maintenance window. Do not update several components
manually while a HostBox operation is in progress.

## Backup model

For a supported stack upgrade, HostBox first creates and verifies a PostgreSQL
custom-format backup and saves the current deployment configuration needed for
recovery. If backup validation fails, the upgrade stops before service switch.

This transactional backup is not a complete disaster-recovery policy. Keep an
encrypted off-server copy and/or provider snapshot on a separate retention
schedule, and periodically test restoration.

## Rollback behavior

- Failure before container switching restores the saved configuration.
- Failure after switching, during startup or health checks, uses the paired
  configuration and pre-upgrade database recovery path.
- A failed rollback is a stop condition. Preserve the backup and diagnostics;
  do not delete volumes or repeatedly retry destructive manual commands.

## Routine maintenance

- Review component status and installed-versus-target versions in HostBox.
- Apply OS security updates with an understood restart window.
- Monitor free disk space and backup retention.
- Rotate credentials after staff/device changes or possible disclosure.
- Revalidate DNS, TLS, Tunnel/VPN, and SSH fingerprint after infrastructure
  migration.
- Test My T connection after maintenance without publishing internal ports.

## Recovery request

When asking for help, provide only redacted versions, the failed HostBox step,
and high-level health status. Keep backups, Compose files, `.env`, database
exports, credentials, server addresses, and full logs out of public issues.
