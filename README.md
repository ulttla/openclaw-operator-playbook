# OpenClaw Operator Playbook

A practical field manual for running a personal AI operator workstation with OpenClaw.

This repository documents public-safe patterns for supervised long-running AI work, multi-agent harness routing, structured knowledge management, backup/recovery operations, and release hygiene. It is not official OpenClaw documentation and it is not a dump of a private setup. It is a playbook: the reusable operating model, templates, and decision rules that can help others build their own workflow.

## Who this is for

- People already using OpenClaw who want a more disciplined operating system for AI work.
- Engineers who want to move from ad-hoc prompting to restartable, evidence-based work loops.
- Builders who want to share their setup publicly without leaking private infrastructure.

## Quick start: build your first operator loop

You can use this repo without copying anyone else's private setup.

Start with [`START_HERE.md`](START_HERE.md) if you want the fastest copy-and-adapt path.

1. Read the short principles in [`docs/00-principles.md`](docs/00-principles.md).
2. Copy the workspace starter files from [`docs/08-operator-starter-kit.md`](docs/08-operator-starter-kit.md).
3. Copy [`templates/skills/lww.example.SKILL.md`](templates/skills/lww.example.SKILL.md) into your own notes or workspace as a starting point.
4. Rename the trigger phrases to match your own workflow.
5. Pick one 30-minute low-risk task.
6. Run it with this loop:
   - define scope;
   - write a tiny state/checkpoint;
   - do useful work;
   - validate with one concrete check;
   - write a closeout using [`templates/prompts/closeout-template.md`](templates/prompts/closeout-template.md).
7. Before publishing anything, run the checks in [`docs/06-redaction-and-safety.md`](docs/06-redaction-and-safety.md).

## What this covers

- **Long Work Windows**: supervised, restartable AI work sessions from 30 minutes to 5 hours, plus campaign patterns up to 12 hours through chunked runs such as `5h + 5h + 2h`.
- **Harness engineering**: when to use coding, review, research, local, or risk lanes.
- **Knowledge operations**: how an operator knowledge base can work with memory, raw notes, staging, and durable wiki pages.
- **Backup and recovery**: how to combine OpenClaw's native backup capability with operator-level restore discipline.
- **Redaction and safety**: what should never be copied from a private AI workstation into a public repo.

## OpenClaw already provides primitives

OpenClaw has native capabilities for models, skills, approvals, sessions, and backups. This playbook sits above those primitives and describes how an operator can combine them into a reliable workflow.

Useful OpenClaw surfaces include:

- `openclaw models` for model discovery and defaults.
- `openclaw skills` and workspace `SKILL.md` files for reusable workflows.
- `openclaw approvals` / `openclaw exec-policy` for exec approval posture.
- `openclaw backup create --verify` for first-class local state archives.
- `/new`, `/reset`, `/compact`, and session/thread concepts for context management.

Always verify real config fields against official OpenClaw docs before copying examples into a live `openclaw.json`.

## Recommended reading order

1. [`docs/README.md`](docs/README.md) — full document index.
2. [`docs/00-principles.md`](docs/00-principles.md) — core operating philosophy.
3. [`docs/01-long-work-window.md`](docs/01-long-work-window.md) — the main supervised work loop.
4. [`docs/02-harness-engineering.md`](docs/02-harness-engineering.md) — routing tasks across lanes.
5. [`docs/06-redaction-and-safety.md`](docs/06-redaction-and-safety.md) — required before publishing setup material.
6. [`docs/07-release-checklist.md`](docs/07-release-checklist.md) — use before tagging, announcing, or linking a release.
7. [`docs/08-operator-starter-kit.md`](docs/08-operator-starter-kit.md) — copy-and-adapt starter kit for a practical operator workspace.

## Public-safe example files

The files in `templates/` are examples or conceptual operator policies. They are intentionally sanitized and may not be valid drop-in OpenClaw config files unless explicitly stated. Use them to design your own setup, then check the official docs for exact syntax.

For a more practical starting point, see the operator starter kit:

- [`templates/workspace/AGENTS.operator.example.md`](templates/workspace/AGENTS.operator.example.md)
- [`templates/workspace/TOOLS.operator.example.md`](templates/workspace/TOOLS.operator.example.md)
- [`templates/workspace/HEARTBEAT.operator.example.md`](templates/workspace/HEARTBEAT.operator.example.md)
- [`templates/config/openclaw.operator-starter.example.json5`](templates/config/openclaw.operator-starter.example.json5)
- [`templates/policies/approval-gates.operator-policy.md`](templates/policies/approval-gates.operator-policy.md)
- [`templates/policies/model-routing.operator-policy.md`](templates/policies/model-routing.operator-policy.md)
- [`templates/runbooks/public-repo-release.runbook.md`](templates/runbooks/public-repo-release.runbook.md)
- [`templates/runbooks/long-work-window-campaign.runbook.md`](templates/runbooks/long-work-window-campaign.runbook.md)

## Validation before release

Run the combined public release audit before publishing or tagging a release:

```bash
bash scripts/public_release_audit.sh .
```

Or run the lightweight checks separately:

```bash
bash scripts/redaction_scan.sh .
python3 scripts/check_markdown_links.py .
```

Treat redaction scan hits as review prompts, not automatic proof of failure. Placeholders and documentation examples can be intentional, but every hit should be explainable.

## Relationship to OpenClaw

This is an independent operator playbook built around OpenClaw workflows. It is not official OpenClaw documentation.

## License

MIT. See [`LICENSE`](LICENSE).
