@echo off
setlocal
title EA Generator Client

echo =========================================
echo          EA Generator Client
echo =========================================
echo Starting local service...
echo Browser will open automatically.
echo Press Ctrl+C to stop.
echo.

cd /d "%~dp0"

start "" cmd /c "timeout /t 2 /nobreak >nul && start https://caocaoshuoshuo.com/app"

"%~dp0EA_Generator_Client.exe"

echo.
echo Service stopped.
pause
