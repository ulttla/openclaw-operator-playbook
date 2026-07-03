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

For larger workstations, separate the collaboration surfaces too. For example,
one shared space can be reserved for knowledge-base work while another handles
general two-operator tasks. Public documentation should describe the roles, not
raw channel names, IDs, transcripts, or private runtime details.

## Shared brain pattern

A secondary lane is more useful when it can retrieve the same durable context
as the primary lane. A wiki-first hybrid knowledge system works well here:

- raw captures preserve evidence from long work windows and recovery work;
- staging converts private session context into reusable patterns;
- stable wiki pages become the shared source of truth;
- fast memory stores only pointers, safety rules, and recent checkpoints.

This lets the secondary lane review decisions without copying private runtime
state into public repos.

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

See [`04-backup-and-recovery.md`](04-backup-and-recovery.md) for the broader backup, update, and restart recovery gate pattern.

For a concrete OpenClaw and Hermes role split, see [`12-openclaw-hermes-complementary-setup.md`](12-openclaw-hermes-complementary-setup.md).
