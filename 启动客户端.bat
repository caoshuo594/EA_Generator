@echo off
chcp 65001 >nul
title EA Generator 客户端 v1.0.5 - 关闭此窗口即可停止服务

echo =====================================================
echo        EA Generator 客户端发布包 v1.0.5
echo =====================================================
echo.
echo 服务启动后，将自动打开云端界面
echo   https://caocaoshuoshuo.com/app
echo.
echo 关闭此窗口或按 Ctrl+C 即可停止服务
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
echo 服务已停止。
pause
