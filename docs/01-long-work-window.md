# Long Work Window

A Long Work Window is a bounded, supervised work session for substantial AI-assisted tasks.

It is not about giving an agent unlimited autonomy. It is about giving the workflow enough time to make real progress while keeping scope, evidence, and approval gates explicit.

## Why it exists

Normal chat turns are often too short for meaningful engineering work. A Long Work Window creates a temporary operating rhythm:

- the goal is defined up front;
- the agent keeps working within that goal;
- check-ins report material progress;
- closeout records evidence and next action;
- risky or external actions remain approval-gated.

## Operating model

- Window duration: usually 30 minutes to 5 hours.
- Longer campaigns should be split into restartable chunks.
- Check-ins are progress reports, not artificial stopping points.
- Closeout requires evidence, not just a summary.
- External posting, config changes, restarts, secrets, and destructive cleanup remain approval-gated.

## Minimal state record

A long work session should have a compact state record. It can be JSON, Markdown, or a simple issue comment.

```json
{
  "window_id": "example-2026-01-01T1000",
  "scope": "publishable docs v1",
  "approval_gates": ["external_posting", "destructive_cleanup"],
  "primary": "write the guide",
  "secondary": "run redaction checks",
  "fallback": "prepare next checkpoint",
  "evidence": [],
  "next_action": "expand the harness example"
}
```

## Lifecycle

### 1. Start with a clear scope

Write the goal and the explicit non-goals.

```text
Goal: make the public playbook useful enough for a first GitHub release.
Non-goals: publish LinkedIn post, change live OpenClaw config, expose private setup files.
```

### 2. Create or update state

Record the start time, scope, reply target or issue link, and approval gates. If the session is interrupted, this becomes the resume point.

### 3. Execute useful work until the timebox or gate

Do not spend the window merely planning. If the primary task finishes early, move to same-scope secondary work such as validation, examples, redaction, docs, or link checks.

### 4. Check in with material delta

A good check-in says what changed, what evidence exists, and what happens next.

```text
Check-in: README quick start added, fake config risk removed, backup guide now references native OpenClaw backup. Next: expand harness example and run redaction scan.
```

### 5. Validate with the smallest meaningful check

Examples:

- markdown link check;
- test/build/lint;
- secret scan;
- live smoke;
- reviewer packet;
- direct diff inspection.

### 6. Close with evidence

Use [`../templates/prompts/closeout-template.md`](../templates/prompts/closeout-template.md). A closeout should make the next session obvious.

## Recovery pattern

If the session resets or the agent loses context:

1. Re-read the checkpoint or state file.
2. Confirm the repo status or artifact state.
3. Resume the first safe next action.
4. Ask for approval only if the next step crosses a gate.

## Example slash-style command design

See [`../templates/skills/lww.example.SKILL.md`](../templates/skills/lww.example.SKILL.md).

This is a custom operator skill example, not a claim that `/lww` is a built-in OpenClaw command. If you build something similar, use OpenClaw's skill system and adapt the trigger names to your own workspace.
