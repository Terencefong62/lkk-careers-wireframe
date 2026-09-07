#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-3000}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
URL="http://localhost:${PORT}/index.html"

cd "$ROOT"

echo "Lee Kum Kee Careers wireframe preview"
echo "Preview URL: ${URL}"
echo

if command -v npm >/dev/null 2>&1 && [[ -f package.json ]]; then
  if [[ ! -d node_modules ]]; then
    echo "Installing preview dependencies..."
    npm install
  fi
  echo "Starting preview server on port ${PORT}..."
  echo "Press Ctrl+C to stop."
  npx serve . --listen "$PORT"
elif command -v python3 >/dev/null 2>&1; then
  echo "Node.js not found. Falling back to Python."
  echo "Press Ctrl+C to stop."
  python3 -m http.server "$PORT"
else
  echo "No local server found."
  echo "Open this file directly in your browser:"
  echo "${ROOT}/index.html"
  exit 1
fi
