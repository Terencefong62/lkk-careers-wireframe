#!/bin/bash
cd "$(dirname "$0")"

echo "Lee Kum Kee Careers wireframe preview"
echo

if ! command -v npm >/dev/null 2>&1; then
  echo "Node.js is required. Install it from https://nodejs.org/ and run this again."
  read -r -p "Press Enter to close..."
  exit 1
fi

if [[ ! -d node_modules ]]; then
  echo "Installing preview dependencies..."
  npm install
fi

echo "Starting preview and opening your browser..."
echo "Preview URL: http://localhost:4173"
echo "If that port is busy, check the next line in this window for the real URL."
echo "Press Ctrl+C in this window to stop the server."
echo

npm run preview:open
