# 隐私

[English](PRIVACY.md) · [简体中文](PRIVACY.zh-Hans.md) · [繁體中文](PRIVACY.zh-Hant.md)

最后更新：2026 年 8 月 30 日

正式公开政策以[HostBox 隐私政策](https://my-tesla.app/hostbox/privacy/)为准。
本文件是 HostBox iOS App（`app.hostbox.ios`）便于阅读的仓库副本。

## 产品范围

HostBox 是在用户选择的 VPS 上安装和维护 My T Server 的独立 iOS 工具。
它不取代 Tesla 官方服务，也不要求注册 HostBox 运营的服务器账号。

## 设备上的连接数据

VPS 主机、端口、SSH 用户名、验证方式、有限的部署状态和经过清理的交接记录
保存在设备上。只有用户明确启用备份后，不含秘密的连接元数据才可通过用户的
私人 iCloud 同步。

自由填写的备注、可信 SSH 指纹、诊断日志、密码、私钥、API Token、Grafana
凭据和 Cloudflare 凭据不会进入该备份。

## 凭据

SSH 密码和私钥保存在 iOS Keychain。完成部署需要时，My T API Token、
Grafana 凭据和 Cloudflare Access 服务凭据也可保存在本机 Keychain。仅恢复
不含秘密的 iCloud 备份后，这些凭据必须重新输入。

部署时提供的 Cloudflare API Token 只在当前操作的内存中存在，不写入部署
历史、诊断日志、Keychain 或 iCloud 备份。

## SSH 命令和诊断

高级命令页中输入的命令和输出只在 App 运行期间保留于有限内存，以便返回查看；
App 退出后不作为长期历史保存，也不会由 HostBox 上传。部署步骤、结果和有限
诊断保存在本机，用于重试和维护。分享前必须删除敏感内容。

## 交接给 My T

打开 My T 的 URL 只携带不含秘密的连接元数据，不包含密码、Bearer Token 或
Cloudflare 秘密。完整连接包只有在用户明确操作后才放入同一设备的本地剪贴板，
五分钟后过期。My T 会测试入口，并在保存或替换连接前询问用户。

## 网络访问

HostBox 连接用户指定的 VPS，执行 SSH 和健康检查；也可访问公开组件目录，以及
用户选择时的 Cloudflare API。它可通过 URL scheme 打开 My T 导入连接。远程
部署操作在用户自己的 VPS 上运行，VPS 密码不会上传到 HostBox 运营的云服务。

## 车辆数据

HostBox 不收集 Tesla 账号凭据、车辆历史、行程、VIN 或位置。车辆数据保留在
用户的 TeslaMate 实例或其他服务器组件中。HostBox 不进行跨 App 广告追踪，
也不使用广告标识符。

## 第三方

用户可以选择 TeslaMate、TeslaMateAPI、Grafana、My T Companion 和 Cloudflare
等独立项目或服务。它们的许可、隐私政策、账号和基础设施均与 HostBox 分开。

## 删除

删除服务器或完成记录会移除相关的本机 HostBox Keychain 项。已经安装在 VPS、
iCloud、My T 或第三方账号中的数据，需要用户在相应系统中另行删除。

## 支持

不要在公开 Issue 提交凭据、私钥、真实服务器地址、`.env`、Compose 文件、
数据库导出、VIN、精确位置或原始生产日志。隐私问题请使用[官方支持](https://my-tesla.app/support/)，
安全漏洞请阅读 [SECURITY.zh-Hans.md](SECURITY.zh-Hans.md)。
