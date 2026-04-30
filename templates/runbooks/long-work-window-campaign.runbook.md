# Long Work Window Campaign Runbook

Use this for a supervised 5-12 hour campaign split into restartable chunks.

## Goal

Run substantial AI-assisted work without losing oversight, evidence, or recovery ability.

## Duration planning

| Request | Default plan |
|---|---|
| 6-7 hours | `5h + 1-2h` |
| 8-10 hours | `5h + 3-5h` |
| 12 hours | `5h + 5h + 2h` |

Each chunk is its own window. Do not treat a campaign as one uninterrupted session.

## Start packet

```text
Campaign ID:
Project:
Scope:
Non-goals:
Approved actions:
Excluded actions:
Chunk plan:
Success delta:
Primary:
Secondary:
Fallback:
Validation expected:
```

## Per-chunk state

```json
{
  "campaign_id": "example-campaign",
  "chunk_index": 1,
  "chunk_count": 3,
  "phase": "execute",
  "state": "active",
  "primary": "build the useful artifact",
  "secondary": "review and redaction",
  "fallback": "checkpoint and handoff",
  "approval_gates": ["external_posting", "config_change", "destructive_cleanup"],
  "evidence": [],
  "blockers": []
}
```

## Check-in format

```text
Check-in:
- Material delta:
- Evidence:
- Next action:
- Blocker:
- Harness state:
```

## Transition gate between chunks

Before starting the next chunk, answer:

- [ ] Did the last chunk produce material work?
- [ ] Are blockers named and approval-gated?
- [ ] Is the next chunk still in the original scope?
- [ ] Is context quality good enough to continue?
- [ ] Is there a checkpoint or manual resume phrase?
- [ ] Are pending external actions still approved?

If any answer is no, stop and ask.

## Closeout evidence

Each chunk closeout should include:

- files changed;
- commits pushed;
- validation output;
- review lanes used;
- approval gates hit;
- remaining work;
- next chunk start condition.

## Under-use guard

If there are more than 15 minutes left and the main task finishes, continue with same-scope work:

- link checks;
- redaction checks;
- docs index updates;
- release checklist;
- examples;
- reviewer packet;
- live smoke;
- checkpoint cleanup.

Do not invent unrelated work just to fill time.
