# Secondary Operator Lane

A secondary operator lane is a separate assistant or workspace used for audit and recovery support. It is helpful when the primary assistant is degraded, a restart is needed, or an update proposal needs independent review.

This pattern can be implemented with tools such as Hermes, another OpenClaw profile, or a separate local assistant. The public pattern is tool-neutral: the second lane increases resilience only when it remains bounded by approval gates and evidence.

## Responsibilities

- Review update, restart, and rollback plans.
- Check that backup evidence exists before risky changes.
- Re-read sanitized recovery docs when the primary operator loses context.
- Compare smoke-test results against the planned matrix.
- Write or review public-safe closeouts after recovery work.

## Non-goals

- Unattended version updates.
- Credential handling without approval.
- Service restart without a continuation plan.
- Two assistants competing in the same channel or task thread.
- Publishing private recovery logs directly.

## Channel and ownership pattern

Keep one lane responsible for user-facing execution. The secondary lane can observe, audit, or prepare recovery notes, but it should not also answer in the same workflow unless the human operator intentionally switches lanes.

A useful split is:

| Lane | Role |
|---|---|
| Primary operator | User communication, scoped execution, final closeout |
| Secondary operator | Audit, recovery plan review, smoke evidence review |
| Human operator | Approval for risky changes and final accountability |

## Recovery packet

Before the secondary lane recommends a risky action, assemble:

- current symptom or proposed change;
- affected service or repo;
- latest known-good version or commit;
- backup path or native backup archive;
- rollback plan;
- continuation message or checkpoint;
- smoke tests to run after the action;
- known caveats and bypasses.

## Public-safe example

> A secondary operator lane reviewed a proposed control-plane update, confirmed rollback anchors and smoke-test coverage, then recorded a sanitized closeout after the approved change.

This wording shows operational maturity without claiming autonomous production repair.
