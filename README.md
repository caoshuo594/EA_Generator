# EA_Generator

EA_Generator Windows 客户端发布仓库。

## 目录说明

- `_internal/`: 客户端运行时依赖
- `config/`: 外置配置目录，默认不包含任何预置 API Key
- `EA_Generator_Client.exe`: Windows 客户端主程序
- `start_client.bat`: 一键启动脚本

## 使用方法

1. 双击 `start_client.bat`，或直接运行 `EA_Generator_Client.exe`
2. 程序会自动启动本地服务并打开云端界面：
   `https://caocaoshuoshuo.com/app`
3. 首次使用时，请在云端界面填写你自己的 API Provider、API Key 和模型

## 说明

- 发布包不包含任何预置 API Key
- 发布包不要求额外安装 Python 或第三方依赖库
- 若自动检测 MT5 失败，可在云端界面或 `config` 目录中填写自己的 MT5 路径
