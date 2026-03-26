@echo off
title EA Generator Client

echo =====================================================
echo        EA Generator Client
echo =====================================================
echo.
echo The local client will open the cloud app automatically.
echo   https://caocaoshuoshuo.com/app
echo.
echo Close this window or press Ctrl+C to stop the service.
echo =====================================================
echo.

cd /d "%~dp0"

start "" cmd /c "timeout /t 2 /nobreak >nul && start https://caocaoshuoshuo.com/app"

if exist "EA_Generator_Client.exe" (
    "EA_Generator_Client.exe"
) else (
    python web_server.py
)

echo.
echo Service stopped.
pause
