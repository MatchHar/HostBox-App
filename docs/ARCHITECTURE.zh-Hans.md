# 架构与信任边界

[English](ARCHITECTURE.md) · [简体中文](ARCHITECTURE.zh-Hans.md) · [繁體中文](ARCHITECTURE.zh-Hant.md)

## 产品边界

HostBox 是部署／维护层，My T 是车辆端 App。TeslaMate 和相关服务器组件运行在
用户控制的基础设施上。可选 Companion 扩展这台自托管服务器；它不是 HostBox
iOS App，也不代表私有 HostBox 源码已公开。

## 数据路径

1. **HostBox → VPS：**通过用户选择的路径直接执行 SSH 和服务健康检查。
2. **VPS → 上游仓库：**下载由已验证稳定目录选定并固定版本的组件。
3. **HostBox → My T：**用户明确操作后，传送不含秘密的 URL，以及同一设备上短时有效的剪贴板包。
4. **My T → My T Server：**只使用一个经过验证的 `base_url`，内部服务留在用户服务器边界内。

HostBox 不会通过开发者运营的 HostBox 服务器中转 SSH 凭据或车辆历史。

## 目录信任

远程目录内容必须带有相邻且有效的 Ed25519 签名。HostBox 会拒绝无效签名、来源
替换、策略违规、可变的“latest”部署行为和目录降级。支持时，容器引用同时固定
版本和摘要；Companion 发布包另有独立摘要。远程内容不能接受时，可使用先前已
验证缓存或 App 内置后备。

公开目录描述部署兼容性；签名私钥和发布实现绝不进入本文件仓库。

## 网络边界

长期公开面应只有一个经过身份验证的 My T Server 入口，通常由 HTTPS／Tunnel
或私有 VPN 保护。数据库、MQTT、TeslaMate 网页、Grafana 和 Companion 都是
内部服务。临时 IP 模式把管理网页留在回环地址，需要访问时使用 SSH 隧道。

## 恢复边界

支持的栈更新前，HostBox 会验证 PostgreSQL 自定义格式备份。拉取失败时恢复配置，
不会假装容器已经切换；开始切换后如启动或健康检查失败，则执行配对的配置／数据库
恢复路径。HostBox 不会静默升级到未经验证的上游版本。
