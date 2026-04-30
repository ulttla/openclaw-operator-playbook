#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

fail=0

section() {
  printf '\n== %s ==\n' "$1"
}

section "git status"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git status --short
else
  echo "Not a Git repository"
  fail=1
fi

section "markdown links"
if [[ -x scripts/check_markdown_links.py ]]; then
  python3 scripts/check_markdown_links.py . || fail=1
else
  echo "Missing scripts/check_markdown_links.py"
  fail=1
fi

section "redaction scan"
if [[ -x scripts/redaction_scan.sh ]]; then
  bash scripts/redaction_scan.sh . || fail=1
else
  echo "Missing scripts/redaction_scan.sh"
  fail=1
fi

section "git metadata scan"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  metadata="$(git log --format='%H %an <%ae> %cn <%ce>' --all)"
  if printf '%s\n' "$metadata" | grep -E '(@[^ >]+\.local>|/Users/|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.)'; then
    echo "FAIL: possible private metadata found in Git history"
    fail=1
  else
    echo "PASS: no obvious private host/path/IP metadata in Git history"
  fi
fi

section "release readiness reminder"
echo "Manual checks still required:"
echo "- explain every redaction scan hit;"
echo "- verify OpenClaw behavior claims against current docs;"
echo "- confirm conceptual templates are labeled;"
echo "- ask before tag, GitHub Release, external posting, or force-push."

exit "$fail"
