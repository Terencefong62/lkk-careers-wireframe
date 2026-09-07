@echo off
setlocal
cd /d "%~dp0"

echo Lee Kum Kee Careers wireframe preview
echo.

where npm >nul 2>nul
if errorlevel 1 (
  echo Node.js is required. Install it from https://nodejs.org/ and run this again.
  pause
  exit /b 1
)

if not exist node_modules (
  echo Installing preview dependencies...
  call npm install
)

echo Starting preview and opening your browser...
echo Preview URL: http://localhost:4173
echo Press Ctrl+C in this window to stop the server.
echo.

call npm run preview:open
