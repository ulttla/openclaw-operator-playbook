# Start Here

Use this path if you want to turn the playbook into a practical operator workspace.

## Choose your path

| If you want... | Start with |
|---|---|
| A fast private workspace bootstrap | 15-minute path below |
| A fuller operator setup | 60-minute path below |
| Reusable procedures | `templates/runbooks/` |
| Risk and routing rules | `templates/policies/` |
| A public release checklist | `docs/07-release-checklist.md` |
| A worked adaptation example | `examples/operator-starter-kit-walkthrough.md` |

## Repository map

```text
docs/                 Guides and operating model
templates/workspace/  Copy-and-adapt AGENTS/TOOLS/HEARTBEAT starters
templates/config/     Public-safe config starters and conceptual policies
templates/runbooks/   Practical procedures for release, deploy, and LWW campaigns
templates/policies/   Approval and model-routing policy templates
examples/             Worked examples and review records
scripts/              Lightweight validation scripts
```

## 15-minute path

1. Read [`docs/00-principles.md`](docs/00-principles.md).
2. Open [`docs/08-operator-starter-kit.md`](docs/08-operator-starter-kit.md).
3. Copy these three workspace files into your private workspace:

   ```bash
   mkdir -p ~/.openclaw/workspace
   cp templates/workspace/AGENTS.operator.example.md ~/.openclaw/workspace/AGENTS.md
   cp templates/workspace/TOOLS.operator.example.md ~/.openclaw/workspace/TOOLS.md
   cp templates/workspace/HEARTBEAT.operator.example.md ~/.openclaw/workspace/HEARTBEAT.md
   ```

4. Replace the placeholders and remove anything that does not fit your risk tolerance.
5. Pick one workflow from `templates/runbooks/` and adapt it.
6. Run one 30-minute low-risk work session.
7. Close with evidence.

## 60-minute path

Use this when you want a more complete starter setup.

```bash
mkdir -p ~/.openclaw/workspace/{skills/lww-example,runbooks,policies}
cp templates/workspace/AGENTS.operator.example.md ~/.openclaw/workspace/AGENTS.md
cp templates/workspace/TOOLS.operator.example.md ~/.openclaw/workspace/TOOLS.md
cp templates/workspace/HEARTBEAT.operator.example.md ~/.openclaw/workspace/HEARTBEAT.md
cp templates/skills/lww.example.SKILL.md ~/.openclaw/workspace/skills/lww-example/SKILL.md
cp templates/runbooks/*.runbook.md ~/.openclaw/workspace/runbooks/
cp templates/policies/*.operator-policy.md ~/.openclaw/workspace/policies/
```

Then read [`examples/operator-starter-kit-walkthrough.md`](examples/operator-starter-kit-walkthrough.md) and adapt the copied files.

## What to customize first

| File | First edits |
|---|---|
| `AGENTS.md` | Language, approval gates, closeout rules |
| `TOOLS.md` | Browser/deploy/search notes and local validation commands |
| `HEARTBEAT.md` | What should trigger proactive notifications |
| `runbooks/public-repo-release.runbook.md` | Your release validation commands and approval gates |
| `policies/model-routing.operator-policy.md` | Your model and review-lane choices |

## What not to publish

Do not publish customized files if they contain:

- tokens or API keys;
- OAuth paths or cookies;
- private channel IDs;
- internal hostnames or private IPs;
- exact deployment targets;
- private prompts or user data;
- raw config dumps from a live workstation.

## Validation before sharing your adapted version

```bash
bash scripts/public_release_audit.sh .
```

Or run individual checks:

```bash
python3 scripts/check_markdown_links.py .
bash scripts/redaction_scan.sh .
git log --format='%H %an <%ae> %cn <%ce>'
```

If you cannot explain every hit, do not publish yet.
