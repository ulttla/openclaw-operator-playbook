# Example Harness Review

## Scenario

A builder agent added a public backup guide to an OpenClaw operator playbook. Before release, the operator asks two independent lanes to review it.

## Input packet

```text
Scope: Review public backup guidance.
Files: docs/04-backup-and-recovery.md, templates/config/backup.example.json.
Question: Does this imply fake OpenClaw config or ignore native OpenClaw backup features?
Gate: Do not publish until High/Medium findings are fixed.
```

## Reviewer A finding

```text
Severity: Medium
Finding: backup.example.json looks like a real config schema, but it is only conceptual.
Fix: Rename or label it as a conceptual operator policy and add native CLI examples.
```

## Reviewer B finding

```text
Severity: Medium
Finding: The guide does not mention `openclaw backup create --verify`.
Fix: Add an "OpenClaw already provides" callout and position the playbook as an operator layer.
```

## Builder fix

Before:

```json
{
  "backup": {
    "workspace": "/path/to/workspace",
    "manifest": true
  }
}
```

After:

```json
{
  "$schema_note": "Conceptual backup pattern template, not an OpenClaw config file.",
  "commands": {
    "createAndVerify": "openclaw backup create --verify"
  }
}
```

## Operator verdict

```text
Verdict: agreed
Reason: both reviewers identified the same ambiguity. The fix removes fake-schema risk and acknowledges OpenClaw native backup.
Evidence: diff reviewed and docs updated.
```
