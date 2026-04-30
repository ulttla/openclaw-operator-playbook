# Reviewer Packet Template

## Scope

What should be reviewed and what is out of scope?

Example: Review public release readiness for docs and templates. Do not change files.

## Files or artifacts changed

List exact files, links, or commits.

Example:

- `README.md`
- `docs/04-backup-and-recovery.md`
- `templates/config/openclaw.example.json`

## What needs review

Ask specific questions.

Example:

- Does any example look like a real OpenClaw config field when it is only conceptual?
- Are private paths or IDs present?
- Are official OpenClaw features described accurately?

## Known risks

Tell reviewers where to focus.

Example:

- Config examples can accidentally imply fake schemas.
- Backup guidance can accidentally ignore OpenClaw's native backup command.

## Evidence already collected

Summarize prior checks.

Example:

- Redaction scan found no secrets.
- Link check passed.

## Questions for reviewer

End with clear output expectations.

Example:

Return go/no-go, severity-ranked findings, and exact suggested fixes.
