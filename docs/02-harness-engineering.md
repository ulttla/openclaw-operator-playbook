# Harness Engineering

Harness engineering is the practice of routing tasks to the right model, tool, or agent lane instead of using one model for everything.

The goal is not to create noisy debate. The goal is to reduce blind spots by separating builder, reviewer, researcher, risk, and operator responsibilities.

## OpenClaw integration context

OpenClaw can provide native integration surfaces for several lanes: model/provider routing, coding backends such as Codex or Claude Code when configured, skills, session/thread management, and exec approval posture. This guide does not replace those features. It describes the operator decision layer above them: which lane to choose, when to ask for a second opinion, and what evidence to record before publishing.

## Example routing matrix

| Task type | Preferred lane | Reason |
|---|---|---|
| Code implementation | Codex or Claude Code when configured | Strong repository editing and iterative debugging |
| Large refactor review | Independent reviewer lane | Good at reading structure and spotting hidden risk |
| One-shot summary or drafting | Fast chat or research lane | Fast generation and synthesis |
| Sensitive local review | Local model lane | Keeps private material local when quality is sufficient |
| Final public wording | Main assistant plus reviewer | Tone, safety, and factual consistency |
| Release risk | Risk/redaction lane | Prevents leaks, unsafe claims, and publishing mistakes |

## Core roles

- **Planner**: defines scope and acceptance criteria.
- **Builder**: changes files or drafts artifacts.
- **Reviewer**: checks risks, missing cases, and clarity.
- **Fact-checker**: verifies claims and evidence.
- **Operator**: decides what is safe to run or publish.

## Trigger examples

### Example A: implementation review

```text
Task: I changed the backup guide. Review whether it misrepresents OpenClaw native backup features.
Lane: freshness reviewer + risk reviewer.
Evidence requested: exact file findings and suggested wording.
Operator gate: do not publish until High/Medium findings are resolved.
```

### Example B: builder plus reviewer

```text
Task: Add a redaction scan script.
Builder lane: implement the script and README usage.
Reviewer lane: check false positives, missing patterns, and whether the script could leak file contents.
Operator decision: merge only after script passes on the repo.
```

### Example C: public release packet

```text
Scope: public release of a playbook repo.
Artifacts: README, docs, templates, examples.
Questions:
- Are there private paths or IDs?
- Are any config examples fictional but unlabeled?
- Does the repo overclaim official OpenClaw behavior?
- Is there enough evidence for a first release?
```

## Consensus rule

Do not treat a single builder's output as final. For public-facing material, prefer at least one independent review lane. If reviewers disagree, the operator chooses one of:

1. make a smaller fix;
2. run a narrower re-review;
3. stop and ask for human approval;
4. document the tradeoff and proceed.

## Public disclosure note

Model names and lane categories can be useful to share, but avoid leaking private provider keys, account IDs, cost dashboards, internal endpoints, private benchmark data, or raw prompts containing private context.
