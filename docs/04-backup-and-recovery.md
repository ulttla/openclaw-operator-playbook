# Backup and Recovery

A personal AI workstation accumulates prompts, checkpoints, scripts, notes, local state, auth profiles, and workspace artifacts. Backups should be boring, visible, and restorable.

## OpenClaw already provides

OpenClaw has a first-class backup CLI for local OpenClaw state archives:

```bash
openclaw backup create --dry-run --json
openclaw backup create --verify
openclaw backup verify ./YYYY-MM-DD-openclaw-backup.tar.gz
```

The native archive includes a manifest and can cover local state, config, credentials directories, auth profiles, and discovered workspaces depending on flags. Treat this playbook as an operator-level layer around that capability, not as a replacement for it.

## Operator-level pattern

Use the native backup command for OpenClaw state, then add your own operating discipline around it:

- Preview what will be included before important resets or migrations.
- Store archives outside the source state/workspace tree.
- Verify archives immediately after creation.
- Keep a short restore checklist next to the backup policy.
- Maintain prune rules with dry-run support.
- Keep logs or manifests that prove what was backed up and what was skipped.

## Restore thinking

A backup is only useful if you know what recovery looks like. At minimum, document:

1. where the archive lives;
2. what machine or profile it belongs to;
3. whether workspaces are included;
4. which secrets must be re-created instead of restored;
5. the smoke check that proves OpenClaw is usable again.

## Public-safe sharing

Share patterns and redacted templates. Do not publish real destinations, credentials, tokens, OAuth files, hostnames, private paths, or raw archive manifests.

See [`../templates/config/backup.example.json`](../templates/config/backup.example.json) for command examples and [`../templates/config/backup.operator-policy.example.json`](../templates/config/backup.operator-policy.example.json) for a conceptual operator checklist.
