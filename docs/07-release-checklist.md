# Public Release Checklist

Use this checklist before tagging, announcing, or linking a public operator-playbook release.

## 1. Scope and claims

- [ ] The release goal is clear.
- [ ] Non-goals are explicit.
- [ ] Personal workflow patterns are not presented as built-in OpenClaw features.
- [ ] Config examples are either real, minimal fragments or clearly labeled conceptual templates.

## 2. Redaction and metadata

- [ ] Run the redaction scan:

  ```bash
  bash scripts/redaction_scan.sh .
  ```

- [ ] Manually explain every hit.
- [ ] Check Git author and committer metadata:

  ```bash
  git log --format='%H %an <%ae> %cn <%ce>'
  ```

- [ ] No private hostnames, private paths, tokens, channel IDs, or account IDs appear in tracked files or visible Git metadata.

## 3. Link and reader-path checks

- [ ] Run the Markdown link check:

  ```bash
  python3 scripts/check_markdown_links.py .
  ```

- [ ] Confirm README quick-start links work.
- [ ] Confirm examples and templates are reachable from the docs index.

## 4. Review evidence

For public-facing releases, prefer at least one independent review lane:

- [ ] Docs/readability review.
- [ ] Freshness/accuracy review against current OpenClaw behavior.
- [ ] Redaction/risk review.
- [ ] Midpoint or final challenger for release blockers.

Record findings as either fixed, accepted with reason, or blocked.

## 5. Optional formal release

Only create a tag or GitHub Release after the above checks pass.

Suggested sequence:

```bash
git status --short
git tag v0.1.0
git push origin v0.1.0
```

Then create a GitHub Release with:

- short release summary;
- validation evidence;
- known limitations;
- link to the changelog entry.

## 6. External integration

If another site links to the release, verify the live link directly. Do not rely only on a deploy status message.

For static sites, use a cache-buster and record the evidence:

```bash
python3 scripts/live_smoke.py --cache-buster YYYYMMDD-HHMM
python3 scripts/public_site_check.py --cache-buster YYYYMMDD-HHMM
```
