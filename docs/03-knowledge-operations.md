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

## Wiki-first hybrid recall

For a mature operator workspace, the durable wiki should become the primary
knowledge layer. Memory stays small and operational: safety rules, recent
checkpoints, boot pointers, and emergency facts. When a task depends on prior
decisions or project knowledge, the preferred lookup order is:

1. search the wiki or a combined memory/wiki corpus;
2. read the source-backed wiki note or mirror;
3. fall back to small durable memory pointers;
4. use raw captures only when stable notes are missing;
5. search the web only when the answer depends on current external facts.

This avoids two failure modes: a memory file that becomes too large to trust,
and a wiki that is rich but invisible to the operator at decision time.

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

## Cross-operator digestion

If two assistants share one knowledge base, keep runtime ownership separate but
make the digestion path common. A useful public-safe pattern is:

- one operator performs broad orchestration and closeout capture;
- another operator reviews research, recovery, or cleanup candidates;
- raw captures are deduplicated before promotion;
- only stable, redacted patterns move into the wiki;
- public repos receive sanitized operating patterns, not private channel logs.
