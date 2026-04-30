# Heartbeat Instructions

Use this as a public-safe starting point for `HEARTBEAT.md` when you want proactive maintenance without noisy status spam.

## Purpose

A heartbeat is a chance to do useful, bounded work:

- check active long-running work;
- verify pending blockers;
- advance safe same-scope tasks;
- surface only meaningful changes.

## Default behavior

On heartbeat:

1. Check whether there is an active work window, pending approval, or due follow-up.
2. If safe work remains in scope, do a small useful step.
3. If a real blocker exists, report it clearly.
4. If nothing needs attention, stay quiet or return the platform-specific no-op response.

## Notify only for

- completed deliverable;
- real blocker;
- time-sensitive risk;
- approval needed;
- failed scheduled check;
- live/public artifact changed materially.

## Do not notify for

- unchanged state;
- repeated reminders;
- speculative concerns;
- filler progress updates without material delta.

## Safety gates

Heartbeat work must not:

- restart services;
- change OpenClaw config;
- update packages;
- post externally;
- delete data;
- handle credentials;
- rewrite public Git history.

If any of those are needed, ask for approval instead.

## Useful heartbeat checks

```text
Active LWW? Read state and continue or close out.
Pending approval? Do not bypass; remind only if time-sensitive.
Public release pending? Re-run lightweight validation before claiming done.
Live deploy pending? Verify live URL with cache-buster.
Docs changed? Run link check and redaction scan.
```
