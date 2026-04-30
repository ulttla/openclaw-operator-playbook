# Backup and Recovery

A personal AI workstation accumulates prompts, checkpoints, scripts, notes, and local state. Backups should be boring, visible, and restorable.

## Recommended pattern

- Daily backup with a manifest.
- Separate backup destinations where possible.
- Restore drills or at least restore checklists.
- Prune policy with dry-run support.
- Logs that prove what was backed up and what was skipped.

## Public-safe sharing

Share patterns and redacted templates. Do not publish real destinations, credentials, tokens, OAuth files, hostnames, or private paths.

See [`../templates/config/backup.example.json`](../templates/config/backup.example.json).
