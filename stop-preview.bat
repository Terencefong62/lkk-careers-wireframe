@echo off
echo Stopping preview servers...

for %%P in (3000 4173 8765) do (
  for /f "tokens=5" %%A in ('netstat -aon ^| findstr /R /C:":%%P .*LISTENING"') do (
    echo Freeing port %%P...
    taskkill /PID %%A /F >nul 2>&1
  )
)

echo Done.
echo If a Cursor terminal still looks stuck, click inside it and press Ctrl+C.
pause
