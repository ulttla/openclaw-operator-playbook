# Model Routing

Model routing should be based on task requirements, not hype.

## OpenClaw already provides

OpenClaw has native model discovery and configuration surfaces, including model status/list/set/scan commands, provider catalogs, fallbacks, and agent-level defaults. It can also integrate coding and research backends such as Codex, Claude Code, Gemini CLI, local models, and other providers depending on your configuration.

This playbook is about the operator policy on top of those primitives: when to choose one lane over another, how to record the reason, and where human approval remains required.

## Routing criteria

- Context length.
- Code editing strength.
- Latency.
- Cost.
- Privacy needs.
- Tool integration quality.
- Failure mode tolerance.
- Evidence requirements.

## Example routing policy

| Work type | Example lane | Why |
|---|---|---|
| Low-risk summarization | Fast inexpensive chat model | Cheap and quick enough |
| Repository implementation | Coding agent lane such as Codex or Claude Code | Better file editing and iterative debugging |
| Deep design or code critique | Reviewer lane with a different model family | Reduces same-model blind spots |
| Broad research or alternative framing | Research lane such as Gemini CLI | Good breadth and comparison |
| Sensitive local review | Local model lane if quality is sufficient | Keeps private context local |
| External publishing or destructive action | Human approval gate | The operator owns the risk |

## Record the reason

For non-trivial work, write down why a lane was selected:

```text
Task: public repo release review
Lane: risk/redaction reviewer + freshness reviewer
Reason: public release needs leak detection and OpenClaw accuracy check before push
Approval gate: GitHub push approved; LinkedIn posting excluded
Evidence: redaction report + docs freshness report + link check
```

## Avoid fake config

Do not invent config keys to represent routing or approval wishes. Keep conceptual policy in documents or templates, and use real OpenClaw config/approval surfaces for enforcement.

See [`../templates/config/openclaw.example.json`](../templates/config/openclaw.example.json) for a minimal illustrative config fragment and [`../templates/config/openclaw.operator-policy.example.json`](../templates/config/openclaw.operator-policy.example.json) for a conceptual operator-policy template.
