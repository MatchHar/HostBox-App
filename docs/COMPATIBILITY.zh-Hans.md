# 兼容性和已验证组件策略

[English](COMPATIBILITY.md) · [简体中文](COMPATIBILITY.zh-Hans.md) · [繁體中文](COMPATIBILITY.zh-Hant.md)

验证基线日期：2026-08-30

## HostBox 设备支持

- iOS／iPadOS 17.0 或更高版本。
- 目标设备包括 iPhone 和 iPad；引导流程按能访问所选 VPS 路径的个人 Apple 设备优化。
- App Store 公开版本由 Apple 写入 [`app-store-release.json`](app-store-release.json)，README 徽章也直接读取 Apple。

## VPS 基线

| 项目 | 支持或建议基线 |
| --- | --- |
| 系统 | 建议 Ubuntu 22.04／24.04 或 Debian 12；自动安装 Docker 以 apt 系 Ubuntu／Debian 为目标 |
| CPU | `amd64` 或 `arm64`，前提是每个固定组件镜像都支持该架构 |
| 内存 | 建议 2 GB 以上；1 GB 可能缓慢／OOM；低于 768 MB 会阻止部署 |
| 可用空间 | 建议 20 GB 以上；低于 5 GB 会阻止部署 |
| 网络 | 能访问所需镜像仓库和所选 Tunnel 服务；可通过用户选择的路径入站 SSH |
| 长期接入 | 建议 HTTPS／Tunnel 或私有 VPN |

对具体 VPS 而言，HostBox 预检结果具有决定性。未识别或非 apt 系发行版也许能通过
SSH 检查，但不代表引导式 Docker 安装得到支持。

## 服务器组件兼容性

HostBox 只安装[公开稳定目录](https://raw.githubusercontent.com/MatchHar/My-T-Companion/main/hostbox/myt-stack.json)
中的组合，并先验证相邻签名和策略。HostBox 设置页显示的目标版本具有决定性；
已安装版本单独显示，因为现有 VPS 可能落后于目标。

作为审计记录，2026-08-30 验证基线固定 TeslaMate／Grafana 4.2.0、
TeslaMateAPI 1.25.0 和 My T Companion 1.10.36。这是带日期的历史记录，不是
可变的“当前版本”。新目标通过签名目录分发，无需修改这条历史基线。

## 兼容性承诺

- 上游新版本在进入签名稳定目录前只作为信息提示。
- 不支持可变镜像标签和自动“跟随最新版本”部署。
- 目录升级必须保留单一 My T 入口、备份验证、健康验证和配对回滚。
- HostBox 内置后备可以有意落后于在线目录，只按已验证后备策略使用。
- 手工修改的栈可能仍能工作，但自动修复／回滚只支持 HostBox 能准确识别其所管理服务的情况。
