# 支持

[English](SUPPORT.md) · [简体中文](SUPPORT.zh-Hans.md) · [繁體中文](SUPPORT.zh-Hant.md)

## 创建 Issue 前

1. 确认 VPS 可从 HostBox 当前使用的网络路径通过 SSH 访问。
2. 重新打开部署记录，找出第一个失败的 HostBox 步骤。
3. 确认磁盘空间充足，预期容器正在运行。
4. 运行 HostBox 健康验证；不要绕过失败的备份或回滚。
5. 阅读[设置](docs/SETUP.zh-Hans.md)、[运维](docs/OPERATIONS.zh-Hans.md)和
   [兼容性](docs/COMPATIBILITY.zh-Hans.md)。

## 可以安全提供的诊断

可以提供 HostBox 版本／构建号、iOS／iPadOS 版本、设备型号、服务器系统名称和
版本、HostBox 显示的组件版本、接入模式、不含凭据的验证类型、失败步骤名称、
HTTP 状态码以及最少且已删除敏感内容的复现步骤。

不要提供密码、Token、Cookie、私钥、SSH 指纹、服务器域名或 IP、`.env`、
Compose 文件、数据库导出、原始日志、VIN、车牌、位置或路线历史。

## 常见现象

- **SSH 主机发生变化：**停止操作，先核实服务器指纹为什么改变。
- **401／403：**核对入口和验证方式；疑似泄露的凭据应轮换，不要发到 Issue。
- **超时：**检查防火墙、Tunnel／VPN 状态、DNS 和所选入口。
- **更新后服务不健康：**保留生成的备份，使用 HostBox 记录的恢复路径，不要手动删除卷。
- **My T 无法导入：**在本地剪贴板包过期前，于同一台已解锁设备重新交接。

## 求助位置

- 产品／设置问题：仓库公开后使用 Issue 模板。
- 安全问题：按 [SECURITY.zh-Hans.md](SECURITY.zh-Hans.md) 私下报告。
- 隐私或 App Store 支持：使用[官方支持](https://my-tesla.app/support/)。
- 上游组件问题：先确认并非 HostBox 支持配置特有，再联系相应项目。

这个独立项目在合理能力范围内提供支持。
