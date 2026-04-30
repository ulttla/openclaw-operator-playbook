# Static Site Live Reflect Runbook

Use this when a static site source repo is pushed but the live site may still be stale.

## Goal

Prove that a public site reflects the intended source change.

## Inputs

- Site domain:
- Source repo:
- Source commit:
- Changed files:
- Expected live marker:
- Deploy path:
- Fallback path:

## Approval gates

Ask before:

- changing hosting settings;
- purging shared or paid edge cache if it has broad impact;
- replacing live files manually;
- deleting or moving live directories;
- changing DNS, redirects, or build hooks.

## Source verification

```bash
git status --short
git rev-parse --short HEAD
grep -n "EXPECTED_MARKER" path/to/file
```

Confirm:

- [ ] expected marker exists in source;
- [ ] changed file list is minimal;
- [ ] rollback commit or backup path is known.

## Live smoke

Use a cache-buster. Do not trust the hosting panel alone.

```bash
python3 scripts/live_smoke.py --cache-buster YYYYMMDD-HHMM
python3 scripts/public_site_check.py --cache-buster YYYYMMDD-HHMM
```

If the live marker is missing:

```text
Live status: stale
Expected marker: <marker>
Source commit: <hash>
Changed file: <file>
Fallback candidate: <target path>
```

## Manual fallback checklist

Before uploading:

- [ ] Changed file list is explicit.
- [ ] Target path is explicit.
- [ ] File content was built from the source commit.
- [ ] No unrelated files are being replaced.
- [ ] Rollback copy or previous commit is known.

Example changed-file record:

```text
local: dist/index.html
target: /public_html/index.html
reason: homepage link added; Git deploy did not update live site
```

## Post-fallback validation

Run live checks again:

```bash
python3 scripts/live_smoke.py --cache-buster after-fallback-YYYYMMDD-HHMM
python3 scripts/public_site_check.py --cache-buster after-fallback-YYYYMMDD-HHMM
```

Record:

- smoke result;
- reader-path result;
- public marker scan result;
- whether cache purge was needed;
- final live URL.

## Closeout

```text
Source commit: <hash>
Changed files: <list>
Fallback used: yes/no
Live smoke: pass/fail
Public marker scan: pass/fail
Remaining risk: <none or named>
Next action: <next deploy reliability task>
```
