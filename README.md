# EA_Generator

EA_Generator 客户端发布仓库，包含可直接运行的 Windows 客户端文件。

## 文件说明

- `EA_Generator_Client.exe`：主程序
- `config/`：配置文件目录
- `启动客户端.bat`：启动脚本

## 快速开始

1. 进入 Releases 页面下载最新压缩包。
2. 解压后保持 `EA_Generator_Client.exe` 与 `config/` 同级。
3. 双击 `启动客户端.bat` 或 `EA_Generator_Client.exe` 启动。
4. 首次使用请在云端界面填写你自己的 API Provider、API Key 和模型。

## 注意事项

- 请勿删除 `config` 目录。
- 仓库不包含真实 API Key；请在本地配置。
- Windows 首次运行可能触发安全提示，请按系统提示允许。
- 如果 MT5 自动检测失败，请在配置页面或 `config/config.yaml` 中填写自己的 MT5 路径。

## 版本

- `v1.0.4`（2026-03-24）：移除预置 API Key 和个人路径，发布 onefile 版客户端
- `v1.0.2`（2026-03-20）：修复慢速模型请求读超时，增加超时重试
- `v1.0.0`（2026-02-10）
