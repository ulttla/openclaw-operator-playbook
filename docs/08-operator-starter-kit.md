# Operator Starter Kit

This page is the practical copy-and-adapt path for readers who want something closer to a real working setup than small snippets.

The goal is to share enough structure to be useful without publishing private infrastructure.

## What to copy first

| Source file | Copy to | Purpose |
|---|---|---|
| [`../templates/workspace/AGENTS.operator.example.md`](../templates/workspace/AGENTS.operator.example.md) | `<workspace>/AGENTS.md` | Main operator behavior, approval gates, closeout rules |
| [`../templates/workspace/TOOLS.operator.example.md`](../templates/workspace/TOOLS.operator.example.md) | `<workspace>/TOOLS.md` | Local tool notes, browser/deploy/search habits |
| [`../templates/workspace/HEARTBEAT.operator.example.md`](../templates/workspace/HEARTBEAT.operator.example.md) | `<workspace>/HEARTBEAT.md` | Proactive wake behavior without noisy spam |
| [`../templates/skills/lww.example.SKILL.md`](../templates/skills/lww.example.SKILL.md) | `<workspace>/skills/lww-example/SKILL.md` | Custom long-work-window style skill |
| [`../templates/config/openclaw.operator-starter.example.json5`](../templates/config/openclaw.operator-starter.example.json5) | private config notes | Schema-aware OpenClaw config starting point |
| [`../templates/policies/approval-gates.operator-policy.md`](../templates/policies/approval-gates.operator-policy.md) | private or public-safe policy docs | Approval matrix for risky actions |
| [`../templates/policies/model-routing.operator-policy.md`](../templates/policies/model-routing.operator-policy.md) | private or public-safe policy docs | Model and lane routing policy |
| [`../templates/runbooks/public-repo-release.runbook.md`](../templates/runbooks/public-repo-release.runbook.md) | project runbook | Public repo release procedure |
| [`../templates/runbooks/static-site-live-reflect.runbook.md`](../templates/runbooks/static-site-live-reflect.runbook.md) | project runbook | Static site deploy verification procedure |
| [`../templates/runbooks/long-work-window-campaign.runbook.md`](../templates/runbooks/long-work-window-campaign.runbook.md) | project runbook | 5-12 hour campaign procedure |

Do not copy these files blindly into a public repo after customization. Your customized versions may contain private paths, channel IDs, hostnames, or operating assumptions.

## Setup sequence

### 1. Create workspace policy files

```bash
mkdir -p ~/.openclaw/workspace/skills/lww-example
cp templates/workspace/AGENTS.operator.example.md ~/.openclaw/workspace/AGENTS.md
cp templates/workspace/TOOLS.operator.example.md ~/.openclaw/workspace/TOOLS.md
cp templates/workspace/HEARTBEAT.operator.example.md ~/.openclaw/workspace/HEARTBEAT.md
cp templates/skills/lww.example.SKILL.md ~/.openclaw/workspace/skills/lww-example/SKILL.md
```

Then edit the copied files for your environment.

### 1b. Add practical runbooks

Pick only the runbooks you actually need:

```bash
mkdir -p ~/.openclaw/workspace/runbooks ~/.openclaw/workspace/policies
cp templates/runbooks/public-repo-release.runbook.md ~/.openclaw/workspace/runbooks/
cp templates/runbooks/long-work-window-campaign.runbook.md ~/.openclaw/workspace/runbooks/
cp templates/policies/approval-gates.operator-policy.md ~/.openclaw/workspace/policies/
cp templates/policies/model-routing.operator-policy.md ~/.openclaw/workspace/policies/
```

For a portfolio or static site, also copy:

```bash
cp templates/runbooks/static-site-live-reflect.runbook.md ~/.openclaw/workspace/runbooks/
```

These files are meant to be edited. Replace placeholders with your project names, validation commands, and approval rules.

### 2. Decide your approval posture

Start conservative:

```text
exec.security = allowlist or deny
exec.ask = on-miss or always
strict inline eval = true
```

Then loosen only after you understand the host approval layer.

Remember: OpenClaw exec approvals are layered. `tools.exec.*` config and host-local approvals both matter.

### 3. Define model routing policy

Use a simple routing record before adding complexity:

```text
Default chat: strong general model
Fast summaries: cheaper low-latency model
Repo edits: coding agent lane
Public release review: independent reviewer + redaction lane
Sensitive review: local model if quality is sufficient
```

Keep provider keys and auth profiles out of public templates.

### 4. Add one real workflow

Pick one workflow and make it reliable before adding more:

- public docs release;
- static site deploy;
- weekly system check;
- inbox triage;
- research summary;
- long-running coding task.

Write down:

- start condition;
- approval gates;
- validation command;
- closeout format;
- recovery path after reset.

### 5. Validate before trusting it

Run checks after editing public docs or templates:

```bash
python3 scripts/check_markdown_links.py .
bash scripts/redaction_scan.sh .
```

For a private workspace, also inspect:

```bash
git status --short
git log --format='%H %an <%ae> %cn <%ce>'
```

## What to customize

### AGENTS.md

Customize:

- language and tone;
- approval gates;
- project-specific closeout rules;
- when to use subagents or coding agents;
- how to treat public release work.

Do not put:

- API keys;
- real private paths that you plan to publish;
- raw private prompts from users or teams;
- channel IDs or webhook URLs.

### TOOLS.md

Customize:

- browser profile mapping;
- local validation commands;
- deployment checks;
- camera, speaker, or device names if useful;
- SSH host aliases only in private copies.

### HEARTBEAT.md

Customize:

- what deserves a proactive notification;
- which checks can run silently;
- what must never run without approval;
- no-op response convention for your channel.

### OpenClaw config starter

Use [`../templates/config/openclaw.operator-starter.example.json5`](../templates/config/openclaw.operator-starter.example.json5) as a thinking scaffold, then verify current fields against official docs before applying.

Recommended rule: keep public config examples smaller than private config. Public examples should teach structure, not expose your workstation.

## Professional sharing pattern

A strong public setup repo usually has three layers:

| Layer | What it contains | Public? |
|---|---|---|
| Concept | Principles, diagrams, tradeoffs | Yes |
| Starter kit | Redacted templates, placeholders, setup sequence | Yes |
| Private implementation | Real IDs, auth, hostnames, exact browser profiles, secrets | No |

This repo should live in the first two layers. Keep the third layer private.

## Reader checklist

A new reader should be able to answer:

- What should I copy first?
- Which values must I replace?
- Which parts are conceptual rather than real OpenClaw config?
- How do I validate the setup?
- What should never be published?
- Where do I go next if I want long-running work windows?

If the answer is not obvious, improve the starter kit before announcing the release.
