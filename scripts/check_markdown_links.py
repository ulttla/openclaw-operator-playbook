#!/usr/bin/env python3
"""Check local Markdown links in this repository.

This intentionally ignores external links and generated anchors. It verifies that
relative file links resolve to existing paths.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
LINK_RE = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")

errors: list[str] = []

for md in sorted(ROOT.rglob("*.md")):
    if ".git" in md.parts:
        continue
    text = md.read_text(encoding="utf-8", errors="ignore")
    for match in LINK_RE.finditer(text):
        raw = match.group(1).strip()
        if not raw or raw.startswith(("http://", "https://", "mailto:", "#")):
            continue
        target = raw.split("#", 1)[0].strip()
        if not target:
            continue
        target = unquote(target)
        resolved = (md.parent / target).resolve()
        try:
            resolved.relative_to(ROOT)
        except ValueError:
            errors.append(f"{md.relative_to(ROOT)}: link escapes repo: {raw}")
            continue
        if not resolved.exists():
            errors.append(f"{md.relative_to(ROOT)}: missing link target: {raw}")

if errors:
    print("Markdown link check failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("Markdown link check passed")
