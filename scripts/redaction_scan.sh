#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"

scan() {
  local label="$1"
  local pattern="$2"
  echo "[$label]"
  if command -v rg >/dev/null 2>&1; then
    rg -n --hidden --glob '!.git/**' "$pattern" "$ROOT" || true
  else
    python3 - "$ROOT" "$pattern" <<'PY'
from pathlib import Path
import re, sys
root = Path(sys.argv[1])
pattern = re.compile(sys.argv[2], re.IGNORECASE)
for path in root.rglob('*'):
    if not path.is_file() or '.git' in path.parts:
        continue
    try:
        text = path.read_text(errors='ignore')
    except Exception:
        continue
    for i, line in enumerate(text.splitlines(), 1):
        if pattern.search(line):
            print(f"{path}:{i}:{line[:240]}")
PY
  fi
}

scan "1/3 secret keywords" '(api[_-]?key|token|secret|password|oauth|cookie|webhook|bearer|private[_-]?key)'
scan "2/3 long IDs / webhook-like strings" '([0-9]{17,20}|[A-Za-z0-9_=-]{32,}|https://discord.com/api/webhooks/)'
scan "3/3 private paths / local network hints" '(/Users/[^ ]+|~/.ssh|tailscale|\.local|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.)'

echo "Review matches manually. Placeholders and documentation examples can be intentional."
