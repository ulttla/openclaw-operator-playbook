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

These are example triggers, not a guarantee that `/lww` exists in a default OpenClaw installation.

## Rules

- Work only inside the approved scope.
- Keep destructive, external, credential, restart, and config-change actions approval-gated.
- Write a checkpoint before context reset or restart.
- Close with evidence: tests, build, lint, screenshot, diff, or explicit blocker.

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
