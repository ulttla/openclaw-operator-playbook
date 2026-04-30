# Operator Tool Notes

Use this as a public-safe starting point for `TOOLS.md`. Keep shared skills generic and put environment-specific details here.

> Do not publish your real hostnames, private IPs, tokens, channel IDs, SSH aliases, OAuth paths, or provider keys.

## Web search

- Use normal web search for current public information.
- Use browser automation only when login state, JavaScript rendering, or UI interaction matters.
- Prefer official docs and local docs before making claims about OpenClaw behavior.
- For OpenClaw configuration fields, verify against the current configuration docs or schema before editing examples.

## Browser profiles

Record only public-safe labels in shared templates. In your private workspace, map project/channel names to browser profiles.

Example private mapping shape:

```text
project-a -> browser-profile-a
project-b -> browser-profile-b
```

## Deployment validation

For static sites, do not trust deploy status alone. Verify live output directly.

Recommended evidence:

```bash
python3 scripts/live_smoke.py --cache-buster YYYYMMDD-HHMM
python3 scripts/public_site_check.py --cache-buster YYYYMMDD-HHMM
```

If a hosting panel says deploy completed but the live site is stale, record:

- source commit;
- changed files;
- live URL checked;
- expected marker;
- fallback path used;
- post-fallback validation.

## External posting

External posting is approval-gated. Drafts are safe; posting is not.

Before posting, confirm:

- final text;
- destination account;
- whether media is attached;
- whether links are correct;
- whether the user explicitly approved the post.

## Useful local checks

```bash
git status --short
git diff --check
python3 scripts/check_markdown_links.py .
bash scripts/redaction_scan.sh .
```

Treat scan output as a review queue. Documentation examples and placeholders can be intentional, but every hit should be explainable.
