# Documentation Index

This folder contains the public operator playbook.

## Core guides

| Document | Purpose |
|---|---|
| [`00-principles.md`](00-principles.md) | Operating philosophy for AI work as supervised operations |
| [`01-long-work-window.md`](01-long-work-window.md) | Bounded long-running work sessions with checkpoints and closeout |
| [`02-harness-engineering.md`](02-harness-engineering.md) | Routing tasks across coding, review, research, local, and risk lanes |
| [`03-knowledge-operations.md`](03-knowledge-operations.md) | Raw notes, staging, wiki, memory pointers, and audit flow |
| [`04-backup-and-recovery.md`](04-backup-and-recovery.md) | Native OpenClaw backup plus operator restore discipline |
| [`05-model-routing.md`](05-model-routing.md) | Model/lane selection criteria and routing records |
| [`06-redaction-and-safety.md`](06-redaction-and-safety.md) | Public release safety checklist and scanning patterns |
| [`07-release-checklist.md`](07-release-checklist.md) | Pre-tag and pre-announcement release checklist |
| [`glossary.md`](glossary.md) | Key terms used in the playbook |

## Templates

| Path | Use |
|---|---|
| [`../templates/skills/lww.example.SKILL.md`](../templates/skills/lww.example.SKILL.md) | Custom LWW-style skill template |
| [`../templates/prompts/closeout-template.md`](../templates/prompts/closeout-template.md) | End-of-window closeout template |
| [`../templates/prompts/reviewer-packet-template.md`](../templates/prompts/reviewer-packet-template.md) | Packet for independent review lanes |
| [`../templates/config/openclaw.example.json`](../templates/config/openclaw.example.json) | Minimal illustrative OpenClaw-style config fragment |
| [`../templates/config/openclaw.operator-policy.example.json`](../templates/config/openclaw.operator-policy.example.json) | Conceptual operator policy, not a config schema |
| [`../templates/config/backup.example.json`](../templates/config/backup.example.json) | Native backup CLI command examples plus operator checklist |
| [`../templates/config/backup.operator-policy.example.json`](../templates/config/backup.operator-policy.example.json) | Conceptual backup policy checklist, not a config schema |

## Examples

| Path | Use |
|---|---|
| [`../examples/lww-closeout-example.md`](../examples/lww-closeout-example.md) | Example evidence-based closeout |
| [`../examples/harness-review-example.md`](../examples/harness-review-example.md) | Example review packet, finding, fix, and final verdict |
