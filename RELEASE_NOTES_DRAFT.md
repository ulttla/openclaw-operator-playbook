# v0.1.0 — Initial Public Operator Playbook

Initial public release of a practical, public-safe OpenClaw operator playbook.

## Included

- Long Work Window guide, including campaign mode up to 12 hours through chunked runs such as `5h + 5h + 2h`.
- Harness engineering guide for builder, reviewer, research, local, and risk lanes.
- Knowledge operations, backup/recovery, model routing, redaction, and release checklist docs.
- Copy-and-adapt operator starter kit:
  - `AGENTS.operator.example.md`
  - `TOOLS.operator.example.md`
  - `HEARTBEAT.operator.example.md`
  - schema-aware OpenClaw operator starter config
- Practical runbooks for public repo release, static site live verification, and Long Work Window campaigns.
- Operator policy templates for approval gates and model routing.
- GitHub issue/PR templates.
- Validation scripts:
  - `scripts/check_markdown_links.py`
  - `scripts/redaction_scan.sh`
  - `scripts/public_release_audit.sh`

## Validation evidence

- Markdown link check passed.
- Public release audit passed.
- Redaction scan reviewed; hits are documentation examples, placeholders, ignore patterns, or scanner regex strings.
- Git metadata checked; public branch author/committer metadata uses GitHub noreply email and contains no private local hostname suffix.
- gunkr.com portfolio integration live smoke passed after File Manager fallback.

## Known limitations

- Templates are public-safe starters, not private production config.
- Exact channel IDs, provider auth, browser profiles, hostnames, and deployment paths must be adapted locally and kept private.
- OpenClaw config examples should be verified against the current official docs before applying to a live `openclaw.json`.
- Tag and GitHub Release are published for v0.1.0 after explicit approval.
