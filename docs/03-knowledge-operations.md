# Knowledge Operations

This playbook uses a layered knowledge model inspired by a personal operator knowledge base.

## Layers

| Layer | Purpose |
|---|---|
| Memory | Fast durable facts and pointers |
| Raw notes | Append-only capture of sessions, journals, and observations |
| Staging | Draft knowledge being cleaned and normalized |
| Wiki | Stable, structured, human-readable knowledge |
| Audit | Periodic checks for stale, duplicated, or unsafe content |

## Recommended flow

```text
raw -> staging -> wiki -> audit
```

The goal is not to put everything into memory. The goal is to keep memory small and useful while the wiki carries durable structure.

## One full rotation example

### 1. Raw capture

After a long work session, capture the event once.

```text
raw/dev-journal/2026-01-01_public-playbook-v1.md
```

Include:

- objective;
- files changed;
- validation evidence;
- decisions;
- next action.

### 2. Staging

Later, extract durable lessons from raw notes.

```text
staging/operator-patterns/redaction-before-public-release.md
```

Remove private details and convert session-specific observations into reusable rules.

### 3. Wiki

Promote stable material into a human-readable page.

```text
wiki/operations/public-release-checklist.md
```

This page should be clean enough for future agents and humans to rely on.

### 4. Audit

Periodically check for:

- stale commands;
- duplicated guidance;
- private paths;
- obsolete model/provider assumptions;
- decisions that should be moved back to raw history.

## Pointer discipline

Keep short pointers in memory or checkpoints instead of duplicating the whole wiki page. Example:

```text
Public release safety checklist lives at wiki/operations/public-release-checklist.md.
```

This keeps retrieval fast without making memory a dumping ground.
