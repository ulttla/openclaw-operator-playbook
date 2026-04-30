# Principles

## 1. AI work should be operated, not merely chatted with

The core idea is to treat AI assistance as an operating system for work:

- define scope;
- run in bounded work windows;
- checkpoint often;
- verify with evidence;
- keep human approval gates for external, risky, or destructive actions.

## 2. Long-running work must be restartable

A useful AI workflow should survive context resets, gateway restarts, model changes, and interruptions. That means every long task needs:

- a state file or checkpoint;
- a visible closeout summary;
- validation evidence;
- a clear next action.

## 3. Multi-agent does not mean uncontrolled autonomy

The pattern here is supervised orchestration. Agents can propose, build, review, and summarize, but sensitive actions stay approval-gated.

## 4. Public examples must be sanitized

Never publish private paths, account IDs, tokens, webhooks, channel IDs, real hostnames, private prompts, or unreviewed config dumps.
