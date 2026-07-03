# OpenClaw and Hermes Complementary Setup

OpenClaw and Hermes can be more useful as complementary operators than as a primary-and-backup hierarchy.

The public-safe pattern is simple: keep one lane accountable for the active user-facing workflow, then use the other lane for focused review, research, recovery planning, or follow-up automation. Do not let both lanes independently execute external actions in the same workflow.

## Role split

| Lane | Good fit | Avoid |
|---|---|---|
| OpenClaw | Multi-channel coordination, workboard-driven execution, browser/session workflows, cron, approval gates, portfolio or repo delivery | Treating every task as a single-chat automation run |
| Hermes | Focused research, recovery review, follow-up automation, self-improving skill experiments, operator-side maintenance | Presenting it as unattended failover or a production administrator |
| Human operator | Approval for risky actions, final public claims, credentials, deployments, service lifecycle, external posting | Rubber-stamping opaque automation |

## Shared brain

Both lanes should point at the same durable knowledge system, but the public repo should not expose raw private logs or local paths.

A safe shared-brain model:

1. raw work captures stay private;
2. reusable notes are digested into a stable wiki or knowledge base;
3. memory keeps only boot facts, safety rules, recent checkpoints, and pointers;
4. public artifacts receive sanitized patterns, not private runtime state.

## Handoff packet

Use a short packet when handing work from one lane to the other:

```text
Task:
Scope in:
Scope out:
Files or public-safe materials:
Approval boundaries:
Evidence needed:
Questions for the other lane:
```

This keeps the second lane from expanding the task beyond the operator's intent.

## Practical operating loop

1. OpenClaw runs the broad workflow: scope, workboard card, execution, validation, and final closeout.
2. Hermes reviews a bounded slice: release risk, recovery checklist, research summary, or follow-up automation candidates.
3. The human operator approves any risky action before it happens.
4. Evidence is recorded in a closeout, then sanitized before any public release.
5. Lessons that should survive future sessions are promoted into durable knowledge, not left only in chat.

## Public wording

Good public wording:

> I use OpenClaw and Hermes as complementary operator lanes: OpenClaw handles broad coordination and approval-gated execution, while Hermes handles focused research, recovery review, and operator-side automation.

Avoid:

> I built an autonomous backup agent that can repair and deploy everything by itself.

## Related guides

- [Harness Engineering](02-harness-engineering.md)
- [Knowledge Operations](03-knowledge-operations.md)
- [Backup and Recovery](04-backup-and-recovery.md)
- [Secondary Operator Lane](09-secondary-operator-lane.md)
- [Research Lane Web Setup](11-research-lane-web-setup.md)
