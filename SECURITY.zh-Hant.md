# 安全性政策

[English](SECURITY.md) · [简体中文](SECURITY.zh-Hans.md) · [繁體中文](SECURITY.zh-Hant.md)

## 範圍

安全性回報可涉及 HostBox 已公開說明的 SSH 連線、憑證處理、交接、部署安全、
公開文件或簽章元件目錄的信任邊界。私人 App 原始碼不會在這裡發佈。

## 私下回報

懷疑存在漏洞時不要建立公開 Issue。請使用本儲存庫的
[私人漏洞回報](https://github.com/MatchHar/HostBox-App/security/advisories/new)。

可提供受影響版本、iOS 和伺服器系統版本、網路／驗證類型、最少且已移除敏感
內容的重現步驟、影響和安全的概念驗證。絕對不要提交真實密碼、Token、Cookie、
私密金鑰、伺服器地址、指紋、`.env`、Compose 文件、資料庫匯出、VIN 或位置。

## 安全部署基線

- 首次信任以及伺服器意外變更後，都要核對 SSH 主機金鑰指紋。
- 優先使用獨立管理帳號，並採用部署允許的最小權限。
- PostgreSQL、MQTT、Grafana、TeslaMate 網頁和 Companion 連接埠保持私人。
- 長期遠端存取使用 HTTPS、私人 VPN 或 Cloudflare Tunnel。
- 每項秘密都應唯一；出現在日誌或截圖中的秘密必須輪替。
- 不要為了完成升級而略過簽章目錄、摘要、備份、健康檢查或回復失敗。
- 真正依賴備份前先測試還原。

HostBox 文件不會要求使用者在 GitHub Issue 公開私密金鑰、資料庫匯出或完整部署設定。
