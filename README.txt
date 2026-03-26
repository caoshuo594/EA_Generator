EA Generator 客户端发布包 v1.0.5
=================================

使用说明

1. 双击“start_client.bat”，或直接运行“EA_Generator_Client.exe”。
2. 程序启动后会自动打开云端界面：
   https://caocaoshuoshuo.com/app
3. 首次使用请在云端界面中填写你自己的 API Provider、API Key 和模型。
4. 本地客户端负责：
   - 启动本地服务
   - 执行 MT5 编译与回测
   - 与云端界面联动

注意

- 本发布包不包含任何预置 API Key。
- 本发布包不要求额外安装 Python 或第三方依赖库。
- 如需自动检测 MT5，请保持 config/config.yaml 中 auto_detect: true。
- 若自动检测失败，请在云端界面或 config 文件中填写你自己的 MT5 路径。
- 关闭命令行窗口或按 Ctrl+C 即可停止本地服务。
