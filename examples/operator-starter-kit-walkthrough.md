# Operator Starter Kit Walkthrough

This example shows how a reader can adapt the public starter kit into a private working setup without copying private details into a public repo.

## Scenario

You maintain a static portfolio site and a public notes repo. You want the agent to help with:

- documentation edits;
- public repo release checks;
- static site smoke tests;
- long-running work windows;
- safe proactive follow-up.

## Step 1: Copy the starter files

```bash
mkdir -p ~/.openclaw/workspace/{skills/lww-example,runbooks,policies}
cp templates/workspace/AGENTS.operator.example.md ~/.openclaw/workspace/AGENTS.md
cp templates/workspace/TOOLS.operator.example.md ~/.openclaw/workspace/TOOLS.md
cp templates/workspace/HEARTBEAT.operator.example.md ~/.openclaw/workspace/HEARTBEAT.md
cp templates/skills/lww.example.SKILL.md ~/.openclaw/workspace/skills/lww-example/SKILL.md
cp templates/runbooks/public-repo-release.runbook.md ~/.openclaw/workspace/runbooks/
cp templates/runbooks/static-site-live-reflect.runbook.md ~/.openclaw/workspace/runbooks/
cp templates/policies/approval-gates.operator-policy.md ~/.openclaw/workspace/policies/
cp templates/policies/model-routing.operator-policy.md ~/.openclaw/workspace/policies/
```

## Step 2: Adapt `AGENTS.md`

Public starter:

```text
Ask before changing live service configuration.
```

Private adaptation:

```text
Ask before changing hosting settings, DNS, CDN cache behavior, OpenClaw config, or service lifecycle.
Normal docs edits and smoke checks are allowed inside approved work windows.
```

Why this helps:

- The public file gives the reusable rule.
- The private file names your real risk boundaries.
- The private file still does not need secrets.

## Step 3: Adapt `TOOLS.md`

Public starter:

```text
Use browser automation only when login state, JavaScript rendering, or UI interaction matters.
```

Private adaptation:

```text
Static site deploy checks:
- Prefer Git deploy.
- If live site is stale, use the documented File Manager fallback for changed files only.
- Always run live smoke with a cache-buster after deploy.
```

Keep exact host panel URLs, account IDs, and internal paths out of public copies.

## Step 4: Adapt approval gates

Public starter:

```text
Force-push public history: ask.
Create tag or GitHub Release: ask.
```

Private adaptation:

```text
Force-push public branches only after recording the old commit hash.
Create v0.x tags only after changelog, link check, redaction scan, and Git metadata check pass.
```

## Step 5: Adapt model routing

Public starter:

```text
Public docs release: main assistant + reviewer lane.
```

Private adaptation:

```text
Public repo release:
- Builder: main assistant or coding lane.
- Freshness: independent reviewer against official docs.
- Risk: redaction reviewer.
- Final: midpoint or final challenger before tag.
```

Avoid recording provider keys, billing details, private benchmarks, or internal endpoint names.

## Step 6: Run a low-risk first window

```text
Run a 30m work window:
Scope: improve README quick start and validate links.
Non-goals: no external post, no config changes, no release tag.
Validation: markdown link check and redaction scan.
```

Expected closeout:

```text
Completed: README quick start clarified.
Evidence: link check passed; redaction scan reviewed.
Blocker: none.
Next: prepare release checklist.
```

## Step 7: Promote only durable lessons

After a few sessions, move stable patterns into:

```text
~/.openclaw/workspace/runbooks/
~/.openclaw/workspace/policies/
~/.openclaw/workspace/skills/
```

Do not overload memory with full procedures. Keep memory as pointers to durable docs.

## Public sharing decision

If you later share your adapted setup, split it into three versions:

| Version | Contains | Share? |
|---|---|---|
| Raw private workspace | real paths, IDs, deployment notes, private preferences | No |
| Redacted template | placeholders, generic host labels, no secrets | Yes |
| Explanation docs | why the workflow exists and how to adapt it | Yes |

This is the difference between a useful public starter kit and a leaked private workstation.
