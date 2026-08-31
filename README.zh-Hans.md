# HostBox

[English](README.md) · [简体中文](README.zh-Hans.md) · [繁體中文](README.zh-Hant.md)

[![HostBox App Store 版本](https://img.shields.io/itunes/v/6798103086?label=App%20Store&color=0a84ff)](https://apps.apple.com/app/id6798103086)
[![文档安全检查](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml/badge.svg)](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml)

HostBox 是在 iPhone 上部署和维护自托管 My T Server 的工具。它直接连接
用户选择的 VPS，引导安装 TeslaMate、TeslaMateAPI 和可选的 My T
Companion，验证服务健康状态，再把一个已测试的连接入口交给 My T。

**[下载 HostBox](https://apps.apple.com/app/id6798103086)** ·
[官方介绍与视频](https://my-tesla.app/hostbox/) ·
[隐私政策](https://my-tesla.app/hostbox/privacy/) ·
[支持](https://my-tesla.app/support/)

## 仓库边界

本仓库仅包含官方产品文档和支持资料，不是 HostBox 开源版本。iOS 源码、
SSH／部署实现、生成的 Compose 配置、签名材料、生产基础设施和发布自动化
继续保留在私有仓库。详见 [LICENSE.md](LICENSE.md) 和
[SECURITY.zh-Hans.md](SECURITY.zh-Hans.md)。

## 工作流程

1. 添加 VPS，并使用密码或私钥通过 SSH 验证身份。
2. 运行 My T Server 引导部署，选择临时 IP 或 Cloudflare Tunnel。
3. HostBox 验证所选组件和统一入口。
4. 把不含秘密的交接信息送到 My T，再在同一设备上明确导入凭据包。

My T 只使用完成页显示的一个 `base_url` 和 API Token。不要分别公开
TeslaMate 网页、Grafana、数据库、MQTT 或 Companion 端口。

## 组件与责任

| 组件 | 作用 | 维护方 |
| --- | --- | --- |
| HostBox | VPS 引导部署、验收、维护、备份和回滚编排 | HostBox |
| My T | iOS 车辆体验和已保存的 My T Server 连接 | My T |
| My T Companion | 可选自托管增强、通知和事件桥接 | My T 项目，开源 |
| TeslaMate | 在用户服务器上采集和存储车辆数据 | TeslaMate 项目 |
| TeslaMateAPI | My T 使用的 API 层 | TeslaMateAPI 项目 |
| Cloudflare | 用户自选的可选 Tunnel／Access 提供方 | Cloudflare |

HostBox 是独立产品，与 Tesla、TeslaMate、TeslaMateAPI、Grafana 或
Cloudflare 没有隶属或官方背书关系。

## 要求

- 运行 iOS／iPadOS 17.0 或更高版本的 iPhone 或 iPad。
- 运行受支持 Ubuntu 或 Debian 版本的 VPS，能够联网，并有权执行所选管理操作。
- 有足够空间和内存运行 TeslaMate、PostgreSQL、Grafana、API、MQTT 和可选 Companion。
- 长期使用 HTTPS、私有 VPN 或 Cloudflare Tunnel 等安全入口。临时公开 IP
  模式用于引导设置，只公开经过身份验证的 My T API 入口。

部署前请阅读完整的[兼容性策略](docs/COMPATIBILITY.zh-Hans.md)。

## 文档

- [设置与安全交接](docs/SETUP.zh-Hans.md)
- [架构与信任边界](docs/ARCHITECTURE.zh-Hans.md)
- [更新、备份、回滚和恢复](docs/OPERATIONS.zh-Hans.md)
- [兼容性和已验证组件策略](docs/COMPATIBILITY.zh-Hans.md)
- [隐私](PRIVACY.zh-Hans.md)
- [安全报告](SECURITY.zh-Hans.md)
- [支持与安全诊断](SUPPORT.zh-Hans.md)
- [发布记录](CHANGELOG.zh-Hans.md)
- [第三方声明](THIRD_PARTY_NOTICES.md)

App Store 徽章和 `docs/app-store-release.json` 从 Apple 获取公开版本，文档
不会预测审核状态，也不再手写第二份“当前版本”。HostBox 通过独立签名的
稳定目录取得已验证服务组件版本；上游有新版本并不代表会自动部署，必须先
完成全链路和回滚验证。

## 截图与视频

本地化发布视频和最新产品介绍维护在[HostBox 官方页面](https://my-tesla.app/hostbox/)。
App Store 截图由 Apple 的正式分发页面维护，避免文件仓库出现过期的第二套图库。
