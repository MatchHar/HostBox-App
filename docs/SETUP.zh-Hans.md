# 设置与安全交接

[English](SETUP.md) · [简体中文](SETUP.zh-Hans.md) · [繁體中文](SETUP.zh-Hant.md)

## 1. 准备 VPS

建议使用全新或管理范围明确的 Ubuntu 22.04／24.04 或 Debian 12 VPS。
HostBox 建议至少 2 GB 内存和 20 GB 可用空间。1 GB 可能缓慢或 OOM；低于
768 MB 内存或 5 GB 可用空间则低于 App 的部署最低值。确认可以访问组件镜像
仓库和所选 Tunnel 服务。

如果 VPS 已有重要业务，先创建服务商快照。HostBox 只针对它管理的服务，但共用
服务器仍要求管理员理解端口、存储、防火墙、DNS 和资源占用。

## 2. 添加并验证 SSH

在 HostBox 输入 VPS 地址、SSH 端口、用户名和验证方式。优先使用独立管理账号
和私钥。首次信任前通过另一条可靠渠道核对 SSH 主机密钥指纹；以后意外变化时
必须调查，不能直接接受。

部署前运行“测试连接”，检查识别到的系统、内存、空间、Docker 和 Compose 状态。

## 3. 选择接入方式

- **Cloudflare Tunnel：**适合已经控制域名和 Cloudflare 账号的用户。部署 Token
  只用于当前操作。
- **私有 VPN：**适合 iPhone 和 VPS 在同一私有 VPN 的情况。
- **临时公开 IP：**用于初始引导设置。只能公开经过身份验证的 My T API 入口；
  TeslaMate 网页和 Grafana 保持在 VPS 回环地址，并使用 HostBox 显示的电脑 SSH 隧道说明。

不要把 TeslaMate 网页、Grafana、数据库、MQTT 或 Companion 地址填成 My T 的 `base_url`。

## 4. 部署和验证

选择标准 My T Server 组件。HostBox 使用已验证稳定目录，检查接入策略并执行
健康验证。当 App 明确提示当前步骤需要保持前台时，请保持开启。步骤失败后先看
第一个错误并使用重试／恢复，不要同时在服务器上做无关手工修改。

Tesla 车辆授权在 TeslaMate 网页完成，不是 HostBox 或 My T 账号登录。绝对不要
把 Tesla 凭据发到本仓库。

## 5. 交接给 My T

在完成页启动 My T 交接。URL 只包含不含秘密的元数据；HostBox 会另行把本地
凭据包放到同一设备剪贴板五分钟。在 My T 中测试入口，再选择另存一个连接或替换现有连接。

成功导入后，清除手工复制过的诊断内容，并在手机之外保存 VPS 备份／恢复计划。

## 6. 部署后

- 确认 My T 能通过预定的长期路径连接。
- 修改第三方仪表盘默认凭据。
- 非 API 服务保持私有。
- 启用服务商快照或加密的异地备份。
- 接受更新前阅读[运维说明](OPERATIONS.zh-Hans.md)。
