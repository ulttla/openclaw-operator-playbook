# Public Repository Release Runbook

Use this when preparing a public repo that contains operator workflows, templates, or AI-assisted engineering notes.

## Goal

Publish a useful public release without leaking private infrastructure or overstating tool behavior.

## Inputs

- Repository path:
- Target branch:
- Release version:
- Release owner:
- External links to update:
- Announcement channels, if any:

## Approval gates

Ask before:

- creating or pushing a public tag;
- creating a GitHub Release;
- force-pushing public history;
- posting on social platforms;
- publishing private implementation details.

## Preflight

```bash
git status --short
git remote -v
git branch --show-current
git log --format='%h %an <%ae> %cn <%ce>' --max-count=10
```

Confirm:

- [ ] branch is correct;
- [ ] working tree is clean or expected;
- [ ] author and committer email are public-safe;
- [ ] no local hostnames or private domains appear in visible Git metadata.

## Content review

- [ ] README explains who the repo is for.
- [ ] Quick start is copyable.
- [ ] Conceptual files are labeled as conceptual.
- [ ] Real config examples are schema-aware and minimal.
- [ ] Private setup details are not present.
- [ ] License, contributing, and security guidance exist.

## Validation

```bash
bash scripts/public_release_audit.sh .
```

If you prefer separate checks:

```bash
python3 scripts/check_markdown_links.py .
bash scripts/redaction_scan.sh .
```

Manually explain each redaction hit. Expected safe hits include:

- `.gitignore` patterns;
- checklist text that mentions secrets;
- scan script regex strings;
- placeholder examples.

Unexpected hits should block release until fixed.

## Changelog

Update `CHANGELOG.md`:

```markdown
## v0.1.0 (YYYY-MM-DD)

- Initial public release.
- Added copy-and-adapt operator templates.
- Added validation scripts and release checklist.
```

## Tag and release

Only run this after approval:

```bash
git tag v0.1.0
git push origin v0.1.0
gh release create v0.1.0 \
  --title "v0.1.0 — Initial Public Operator Playbook" \
  --notes-file RELEASE_NOTES.md
```

## Release notes structure

```markdown
# v0.1.0 — Initial Public Operator Playbook

## What is included

- Long Work Window guide.
- Operator starter kit.
- Public release checklist.
- Redaction and link-check tooling.

## Validation

- Markdown link check passed.
- Redaction scan reviewed.
- Git metadata checked.

## Known limitations

- Templates are public-safe starters, not private production config.
- Exact channel and provider setup must be adapted locally.
```

## Closeout

Record:

- commit hash;
- tag;
- release URL;
- validation output;
- unresolved risks;
- next action.
