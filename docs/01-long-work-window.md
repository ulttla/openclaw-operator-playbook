# Long Work Window

A Long Work Window is a bounded, supervised work session for substantial AI-assisted tasks.

## Why it exists

Normal chat turns are too short for meaningful engineering work. A Long Work Window gives the agent permission to keep moving within a defined scope while still preserving human oversight.

## Operating model

- Window duration: usually 30 minutes to 5 hours.
- Work is split into restartable chunks.
- Check-ins are progress reports, not artificial stopping points.
- Closeout requires evidence, not just a summary.
- External posting, config changes, restarts, secrets, and destructive cleanup remain approval-gated.

## Typical lifecycle

1. Start with a clear scope.
2. Create or update state.
3. Execute useful work until the timebox or gate.
4. Run the smallest meaningful validation.
5. Write closeout evidence.
6. Update checkpoint and next action.

## Example slash-style command design

See [`../templates/skills/lww.example.SKILL.md`](../templates/skills/lww.example.SKILL.md).
