#!/usr/bin/env bash
set -euo pipefail

echo "Validating shared MCP configuration..."
python - <<'PY'
import json
from pathlib import Path
base = Path(__file__).resolve().parent.parent
files_to_check = [base / '.mcp' / 'mcp.json']
files_to_check.extend(sorted((base / '.mcp').glob('*.example.json')))
for path in files_to_check:
    with path.open('r', encoding='utf-8') as fh:
        json.load(fh)
print(f"Validated {len(files_to_check)} JSON files.")
PY

echo "Validation complete."
