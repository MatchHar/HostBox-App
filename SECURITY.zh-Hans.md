# 安全政策

[English](SECURITY.md) · [简体中文](SECURITY.zh-Hans.md) · [繁體中文](SECURITY.zh-Hant.md)

## 范围

安全报告可涉及 HostBox 已公开说明的 SSH 连接、凭据处理、交接、部署安全、
公开文档或签名组件目录的信任边界。私有 App 源码不会在这里发布。

## 私下报告

怀疑存在漏洞时不要创建公开 Issue。请使用本仓库的
[私密漏洞报告](https://github.com/MatchHar/HostBox-App/security/advisories/new)。

可提供受影响版本、iOS 和服务器系统版本、网络／验证类型、最少且已删除敏感
内容的复现步骤、影响和安全的概念验证。绝对不要提交真实密码、Token、Cookie、
私钥、服务器地址、指纹、`.env`、Compose 文件、数据库导出、VIN 或位置。

## 安全部署基线

- 首次信任以及服务器意外变化后，都要核对 SSH 主机密钥指纹。
- 优先使用独立管理账号，并采用部署允许的最小权限。
- PostgreSQL、MQTT、Grafana、TeslaMate 网页和 Companion 端口保持私有。
- 长期远程访问使用 HTTPS、私有 VPN 或 Cloudflare Tunnel。
- 每项秘密都应唯一；出现在日志或截图中的秘密必须轮换。
- 不要为了完成升级而绕过签名目录、摘要、备份、健康检查或回滚失败。
- 真正依赖备份前先测试恢复。

HostBox 文档不会要求用户在 GitHub Issue 公开私钥、数据库导出或完整部署配置。
