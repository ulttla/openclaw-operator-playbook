# Harness Engineering

Harness engineering is the practice of routing tasks to the right model, tool, or agent lane instead of using one model for everything.

## Example routing matrix

| Task type | Preferred lane | Reason |
|---|---|---|
| Code implementation | Codex or Claude Code | Strong repository editing and iterative debugging |
| Large refactor review | Claude Code or reviewer lane | Good at reading code structure and risk |
| One-shot summary or drafting | Gemini CLI or chat model | Fast generation and broad context synthesis |
| Sensitive local review | Local model lane | Keeps private material local when quality is sufficient |
| Final public wording | Main assistant plus reviewer | Tone, safety, and factual consistency |

## Core pattern

- Planner: defines scope and acceptance criteria.
- Builder: changes files or drafts artifacts.
- Reviewer: checks risks, missing cases, and clarity.
- Fact-checker: verifies claims and evidence.
- Operator: decides what is safe to run or publish.

## Public disclosure note

Model names can be useful to share, but avoid leaking private provider keys, account IDs, cost dashboards, internal endpoints, or private benchmark data.
