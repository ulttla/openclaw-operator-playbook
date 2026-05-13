# Update Safety with Isolated Worktrees

Use this pattern when your operator workstation or secondary assistant has local patches that must survive an upstream update.

## When to use

- The runtime has local hotfixes or operator patches.
- A package update would affect the assistant control plane.
- The upstream delta is large or touches gateway, messaging, restart, browser, search, or model-routing behavior.
- Rollback needs to be proven before promotion.

## Runbook

1. **Snapshot current state**
   - version;
   - current branch/commit;
   - config backup;
   - native backup archive if available.

2. **Preserve local patches**
   - commit or branch them clearly;
   - record what is operator policy versus experimental.

3. **Create a disposable worktree**
   - check out the target upstream in a separate directory;
   - do not run it as the live service yet.

4. **Replay local patches**
   - apply patches in the worktree;
   - record conflicts by category, not as raw private logs.

5. **Plan smoke tests**
   - messaging;
   - restart continuation;
   - memory/search;
   - browser/profile behavior;
   - scheduled jobs;
   - model routing.

6. **Promote only with approval**
   - include rollback anchors;
   - include expected downtime or restart behavior;
   - write a closeout after verification.

## Closeout template

```md
## Update worktree closeout
- target version / branch:
- preserved local patches:
- conflicts found:
- rollback anchor:
- smoke matrix:
- go/no-go:
- remaining caveats:
```

## Public-safe note

Do not publish real paths, branch names that expose private machines, raw configs, tokens, or exact service endpoints. Share the pattern, conflict categories, and evidence shape.
