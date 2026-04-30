# Knowledge Operations

This playbook uses a layered knowledge model inspired by a personal wiki.

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
