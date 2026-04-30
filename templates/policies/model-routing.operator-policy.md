# Operator Model Routing Policy Template

Use this to document how your workspace chooses model or agent lanes. Keep provider keys and private account details out of this file.

## Principles

- Route by task risk and evidence needs, not hype.
- Use stronger or more specialized lanes when mistakes are expensive.
- Use independent review lanes for public releases or risky changes.
- Keep sensitive material local when quality and tooling are sufficient.
- Human approval remains the gate for external, destructive, or high-cost actions.

## Routing table

| Work type | Default lane | Upgrade when | Validation |
|---|---|---|---|
| Routine summary | Fast chat model | Source is long, legal, financial, or high-impact | Spot-check against source |
| Repository edit | Coding agent lane | Refactor is broad or tests are unclear | Test/lint/diff review |
| Public docs release | Main assistant + reviewer lane | OpenClaw behavior or safety claims are involved | Link check + redaction scan + freshness review |
| Risk/redaction review | Independent reviewer lane | Publishing public repo, logs, config, or screenshots | Manual explain-every-hit pass |
| Research | Research lane | Recent facts or competing options matter | Cite sources or record search evidence |
| Sensitive review | Local model lane when adequate | Data cannot leave local environment | Local-only evidence and human review |
| External action | Human approval | Always | Explicit approval and closeout evidence |

## Escalation triggers

Escalate to a reviewer or second lane when:

- a public release is planned;
- config examples could be mistaken for real schema;
- a command would change runtime continuity;
- live deploy evidence conflicts with UI status;
- the model is making unsupported claims;
- a redaction scan finds unexplained hits;
- the work crosses more than one system boundary.

## Routing record template

```text
Task:
Selected lane:
Why this lane:
Alternatives considered:
Approval gate:
Validation evidence:
Outcome:
```

## Example

```text
Task: release OpenClaw operator playbook v0.1.0
Selected lane: main builder + freshness reviewer + redaction reviewer + midpoint challenger
Why this lane: public repo needs accuracy, leak prevention, and release blocker review
Alternatives considered: single-pass edit only, rejected due to public release risk
Approval gate: tag/release and external posting require explicit approval
Validation evidence: Markdown link check, redaction scan, Git metadata check, live site smoke
Outcome: release-ready after metadata cleanup and starter kit expansion
```
