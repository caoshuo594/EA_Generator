@echo off
chcp 65001 >nul
title EA Generator Client - Close window to stop

echo =====================================================
echo        EA Generator Client v1.0.4
echo =====================================================
echo.
echo The cloud app will open after the local service starts.
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
