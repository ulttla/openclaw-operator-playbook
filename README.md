# OpenClaw Operator Playbook

A practical field manual for running a personal AI operator workstation with OpenClaw.

This repository documents patterns for supervised long-running AI work, multi-agent harness routing, structured knowledge management, and backup/recovery operations. It is not a product manual or a dump of a private setup. It is a public-safe playbook: the ideas, templates, and decision rules that can help others build their own operator workflow.

## What this covers

- Long Work Windows: supervised, restartable AI work sessions with checkpoints and evidence-based closeout.
- Harness engineering: when to use Codex, Claude Code, Gemini CLI, local models, or reviewer lanes.
- Knowledge operations: how a personal `gun-wiki` style knowledge base can work with memory, raw notes, staging, and durable wiki pages.
- Backup and recovery: manifest-based backups, restore thinking, and safe example configuration.
- Redaction and safety: what should never be copied from a private AI workstation into a public repo.

## Start here

1. Read [`docs/00-principles.md`](docs/00-principles.md).
2. Read [`docs/01-long-work-window.md`](docs/01-long-work-window.md) for the core operating loop.
3. Read [`docs/02-harness-engineering.md`](docs/02-harness-engineering.md) for task routing.
4. Use [`docs/06-redaction-and-safety.md`](docs/06-redaction-and-safety.md) before publishing any setup file.

## Repository status

Initial public playbook draft. Examples are intentionally sanitized and should be adapted before use.

## Relationship to OpenClaw

This is an independent operator playbook built around OpenClaw workflows. It is not official OpenClaw documentation.
