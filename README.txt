EA Generator 订阅客户端发布目录 v1.0.4
=====================================

目录说明

1. 本目录既是发布模板，也是客户包生成目录。
2. 根目录保留了源码、config、spec 和构建脚本，方便后续重新打包。
3. 最终给客户的目录为：
   publish_EA_Generator\

客户使用方法

1. 进入 publish_EA_Generator 目录。
2. 双击“启动客户端.bat”，或直接运行“EA_Generator_Client.exe”。
3. 程序启动后会自动打开云端界面：
   https://caocaoshuoshuo.com/app
4. 首次使用请在云端界面填写你自己的 API Provider、API Key 和模型。

说明

- 发布包不包含任何预置 API Key。
- 发布包保留模型列表和常用 Provider 站点，方便客户直接填写自己的配置。
- 如需自动检测 MT5，请保持 config/config.yaml 中 auto_detect: true。
- 若自动检测失败，请在云端界面或 config 文件中填写自己的 MT5 路径。

重新构建

1. 确认本机 Python 环境已安装依赖和 PyInstaller。
2. 在本目录执行：
   build_release.bat
3. 构建完成后，客户可分发目录会生成在：
   publish_EA_Generator\
