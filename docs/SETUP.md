# Setup and secure handoff

[English](SETUP.md) · [简体中文](SETUP.zh-Hans.md) · [繁體中文](SETUP.zh-Hant.md)

## 1. Prepare the VPS

Use a fresh or understood Ubuntu 22.04/24.04 or Debian 12 VPS. HostBox
recommends at least 2 GB memory and 20 GB free storage. One GB may be slow or
run out of memory; less than 768 MB or 5 GB free is below the App's deployment
minimum. Confirm outbound access to component registries and any selected
tunnel provider.

Make a provider snapshot if the VPS already contains important workloads.
HostBox targets the services it owns, but a shared server still requires the
administrator to understand port, storage, firewall, DNS, and resource use.

## 2. Add and verify SSH

Enter the VPS address, SSH port, username, and authentication method in
HostBox. Prefer a dedicated administrative account and a private key. Verify
the presented SSH host-key fingerprint through an independent source before
trusting it. An unexpected later fingerprint change must be investigated, not
blindly accepted.

Run **Test Connection** before deployment. Review the detected OS, memory,
storage, Docker, and Compose status.

## 3. Choose the access mode

- **Cloudflare Tunnel:** recommended when the user already controls the domain
  and Cloudflare account. The deployment token is used only during the active
  operation.
- **Private VPN:** suitable when both the iPhone and VPS share a private VPN.
- **Temporary public IP:** intended for initial guided setup. Only the
  authenticated My T API entry should be public; TeslaMate web and Grafana stay
  on VPS loopback and use the computer SSH-tunnel instructions shown by HostBox.

Do not enter the TeslaMate web, Grafana, database, MQTT, or Companion address as
the My T `base_url`.

## 4. Deploy and verify

Select the standard My T Server components. HostBox uses the verified stable
catalog, checks the chosen access policy, and performs health verification.
Keep the App active while it explicitly says the current step requires it.
If a step fails, read the first failure and use retry/recovery rather than
starting unrelated manual changes on the server.

Tesla vehicle authorization is completed in TeslaMate's web interface. It is
not a HostBox or My T account login, and the Tesla credential must never be
posted to this repository.

## 5. Hand off to My T

On the completion page, start the My T handoff. The URL contains only
non-secret metadata. HostBox separately places a local credential package on
the same device's clipboard for five minutes. In My T, test the endpoint and
choose whether to save it as another connection or replace an existing one.

After a successful import, clear any manually copied diagnostic text and keep
the VPS backup/restore plan outside the phone.

## 6. After deployment

- Confirm My T can connect through the intended long-term path.
- Change default third-party dashboard credentials.
- Keep non-API services private.
- Enable provider or encrypted off-server backups.
- Review [operations](OPERATIONS.md) before accepting an update.
