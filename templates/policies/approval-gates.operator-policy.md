# Operator Approval Gates Template

Use this to make approval boundaries explicit in a personal AI operator workspace.

## Default rule

If an action is external, destructive, expensive, privacy-sensitive, or runtime-affecting, ask first.

## Approval matrix

| Action | Default | Why |
|---|---|---|
| Read files in current workspace | Auto | Reversible and local |
| Edit public-safe docs/templates | Auto after scope is clear | Reversible through Git |
| Run tests, link checks, redaction scans | Auto | Validation step |
| Push normal commits to an approved repo | Auto if pre-approved for the work window | Reversible through Git history, but still public |
| Force-push public history | Ask | Rewrites public state |
| Create tag or GitHub Release | Ask | Public release artifact |
| Post externally | Ask | Acts on user identity or public voice |
| Restart gateway or service | Ask | Runtime continuity risk |
| Change OpenClaw config | Ask | Can affect all future sessions |
| Update package/version | Ask | Rollback and compatibility risk |
| Delete files or cleanup state | Ask unless clearly temporary and scoped | Destructive |
| Handle credentials or OAuth files | Ask | Privacy and security risk |
| Change hosting settings | Ask | Live site availability risk |

## Approval request format

```text
Approval needed:
Goal:
Exact command or action:
Files or services affected:
Risk:
Rollback path:
Validation after action:
```

## Fast approval words

Define your own short approvals only in private workspace policy. Example:

```text
ok / yes / go
```

Do not treat ambiguous reactions or unrelated messages as approval for high-risk actions.

## After approval

- Execute only the approved action.
- If a new high-risk action appears, ask again.
- Validate immediately.
- Record the result in closeout.

## Example

```text
Approval needed:
Goal: remove private hostname from public Git metadata
Exact command: git commit --amend --author="Name <public@example.com>" --no-edit && git push --force-with-lease
Files or services affected: public Git branch history
Risk: rewrites remote branch
Rollback path: previous commit hash recorded before force-push
Validation: git log author/committer metadata contains no private hostnames
```
