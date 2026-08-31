# Public release checklist

Run this checklist immediately before changing repository visibility to public.

- [ ] `gh repo view MatchHar/HostBox-App` still identifies the intended repository.
- [ ] `scripts/verify-public-boundary.sh` passes after every file is tracked.
- [ ] `scripts/verify-documentation-parity.sh` passes.
- [ ] `scripts/verify-links.sh` passes.
- [ ] `scripts/verify-stable-catalog.py` passes against the live public catalog.
- [ ] GitHub secret scanning/private vulnerability reporting are enabled where available.
- [ ] Branch protection requires documentation safety checks.
- [ ] Repository history contains no source, credentials, production addresses, signing material, build products, or deleted secret files.
- [ ] The App Store record is read from Apple and the README uses the dynamic badge.
- [ ] The official website link is added only after public access works without authentication.
- [ ] HostBox App and App Store submission are not changed for this documentation release.
