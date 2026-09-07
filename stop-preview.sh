#!/bin/bash
# Stop local preview servers for the careers wireframe.

echo "Stopping preview servers..."

if command -v lsof >/dev/null 2>&1; then
  for PORT in 3000 4173 8765; do
    PIDS=$(lsof -ti tcp:"$PORT" 2>/dev/null || true)
    if [[ -n "$PIDS" ]]; then
      echo "Freeing port $PORT..."
      kill $PIDS 2>/dev/null || true
    fi
  done
fi

pkill -f "node .*serve .*--listen" 2>/dev/null || true
pkill -f "npm run preview" 2>/dev/null || true
pkill -f "python3 -m http.server 3000" 2>/dev/null || true
pkill -f "python3 -m http.server 4173" 2>/dev/null || true

echo "Done."
echo "If a Cursor terminal still looks stuck, click inside it and press Ctrl+C."
echo "You can also close that terminal tab with the trash/bin icon."
