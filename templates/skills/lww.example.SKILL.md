---
name: lww-example
description: Sanitized example of a custom Long Work Window operator skill. This is not a built-in OpenClaw command.
---

# Long Work Window Skill Example

This is a sanitized example for designing your own operator workflow. Adapt it to your own system and verify current OpenClaw skill behavior against the official docs.

## Trigger phrases

- `lww 30m`
- `start a 1h work window`
- `continue for 2h within the current scope`
- `run a 12h campaign for this release`

These are example triggers, not a guarantee that `/lww` exists in a default OpenClaw installation.

For requests above 5 hours, treat the work as a campaign, not a single window. A 12-hour campaign should normally split into `5h + 5h + 2h`, with a closeout/checkpoint/transition gate between chunks.

## Rules

- Work only inside the approved scope.
- Keep destructive, external, credential, restart, and config-change actions approval-gated.
- Write a checkpoint before context reset or restart.
- Close each chunk with evidence: tests, build, lint, screenshot, diff, or explicit blocker.
- Before starting the next campaign chunk, confirm scope, blockers, checkpoint quality, and remaining time.

## Start checklist

- Objective:
- Non-goals:
- Approval gates:
- Primary task:
- Secondary task:
- Fallback task:
- Expected validation:

## Check-in template

```text
Check-in: <material delta>. Evidence: <test/review/diff>. Next: <concrete next action>. Blocker: <none or named blocker>.
```

## Closeout template

- Objective.
- Completed work.
- Evidence.
- Risks or blockers.
- Next action.
