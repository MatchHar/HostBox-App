# HostBox

[English](README.md) · [简体中文](README.zh-Hans.md) · [繁體中文](README.zh-Hant.md)

[![HostBox App Store 版本](https://img.shields.io/itunes/v/6798103086?label=App%20Store&color=0a84ff)](https://apps.apple.com/app/id6798103086)
[![文件安全檢查](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml/badge.svg)](https://github.com/MatchHar/HostBox-App/actions/workflows/docs.yml)

HostBox 是 iPhone 上的 VPS 工作區與自託管 My T Server 部署工具，整合伺服器
狀態、SSH、Docker 和維護。它直接連接
使用者選擇的 VPS，引導安裝 TeslaMate、TeslaMateAPI 和選用的 My T
Companion，驗證服務健康狀態，再把一個已測試的連線入口交給 My T。

**[下載 HostBox](https://apps.apple.com/app/id6798103086)** ·
[官方介紹與影片](https://my-tesla.app/hostbox/zh-hant/) ·
[隱私權政策](https://my-tesla.app/hostbox/privacy/zh-hant/) ·
[支援](https://my-tesla.app/support/zh-hant/)

## 2026-09-11 發佈 — HostBox 2.01

- 繼續設定、更新或安全移除既有 My T Server，並檢查操作對共用 VPS 的影響範圍。
- 先驗證 Cloudflare API Token，再設定主機名稱；Email 門禁改為選用。
- 選擇 My T 增強與 Tunnel 後，在車主主機名稱前加上 `friend.`，建立獨立的朋友同行分享位址。朋友只取得 My T 中明確授予的臨時分享權限，不會因此取得車主 TeslaMate 網頁的存取權。
- TeslaMate 電池與充電連結使用公開 Grafana 位址。
- iCloud 備份非敏感伺服器與部署資料；密碼、私鑰與 Token 留在裝置上。

朋友同行需要雙方具備相容的 Companion 服務及可連線的 HTTPS 分享位址。請見[設定與分享要求](docs/SETUP.zh-Hant.md)和[具日期的發佈記錄](CHANGELOG.zh-Hant.md)。

## 儲存庫邊界

本儲存庫只包含官方產品文件和支援資料，不是 HostBox 開源版本。iOS 原始碼、
SSH／部署實作、產生的 Compose 設定、簽章材料、生產基礎設施和發佈自動化
仍保留在私人儲存庫。詳見 [LICENSE.md](LICENSE.md) 和
[SECURITY.zh-Hant.md](SECURITY.zh-Hant.md)。

## 工作流程

1. 加入 VPS，並使用密碼或私密金鑰透過 SSH 驗證身分。
2. 執行 My T Server 引導部署，選擇僅本機、臨時公網 IP、已有 HTTPS 網域、
   Cloudflare Tunnel 或 Cloudflare DNS。
3. HostBox 驗證所選元件和統一入口。
4. 把不含秘密的交接資料送到 My T，再於同一裝置明確匯入憑證套件。

My T 只使用完成頁顯示的一個 `base_url` 和 API Token。不要分別公開
TeslaMate 網頁、Grafana、資料庫、MQTT 或 Companion 連接埠。

## 元件與責任

| 元件 | 作用 | 維護方 |
| --- | --- | --- |
| HostBox | VPS 引導部署、驗收、維護、備份和回復編排 | HostBox |
| My T | iOS 車輛體驗和已儲存的 My T Server 連線 | My T |
| My T Companion | 選用自託管擴充、通知和事件橋接 | My T 專案，開源 |
| TeslaMate | 在使用者伺服器上收集和儲存車輛資料 | TeslaMate 專案 |
| TeslaMateAPI | My T 使用的 API 層 | TeslaMateAPI 專案 |
| Cloudflare | 使用者自選的 Tunnel／Access 供應商 | Cloudflare |

HostBox 是獨立產品，與 Tesla、TeslaMate、TeslaMateAPI、Grafana 或
Cloudflare 沒有隸屬或官方背書關係。

## 要求

- 執行 iOS／iPadOS 17.0 或更新版本的 iPhone 或 iPad。
- 執行受支援 Ubuntu 或 Debian 版本的 VPS，可連線網際網路，並有權執行所選管理操作。
- 有足夠空間和記憶體執行 TeslaMate、PostgreSQL、Grafana、API、MQTT 和選用 Companion。
- 長期使用 HTTPS、私人 VPN 或 Cloudflare Tunnel 等安全入口。臨時公開 IP
  模式用於引導設定，只公開經過身分驗證的 My T API 入口。

部署前請閱讀完整的[相容性政策](docs/COMPATIBILITY.zh-Hant.md)。

## 文件

- [設定與安全交接](docs/SETUP.zh-Hant.md)
- [架構與信任邊界](docs/ARCHITECTURE.zh-Hant.md)
- [更新、備份、回復和復原](docs/OPERATIONS.zh-Hant.md)
- [相容性和已驗證元件政策](docs/COMPATIBILITY.zh-Hant.md)
- [隱私權](PRIVACY.zh-Hant.md)
- [安全性回報](SECURITY.zh-Hant.md)
- [支援與安全診斷](SUPPORT.zh-Hant.md)
- [發佈記錄](CHANGELOG.zh-Hant.md)
- [第三方聲明](THIRD_PARTY_NOTICES.md)

App Store 徽章和 `docs/app-store-release.json` 從 Apple 取得公開版本，文件
不會預測審核狀態，也不再手寫第二份「目前版本」。HostBox 透過獨立簽章的
穩定目錄取得已驗證服務元件版本；上游有新版本並不表示會自動部署，必須先
完成全路徑和回復驗證。

## 截圖與影片

觀看 [HostBox 2.01 繁體中文宣傳影片](https://www.my-tesla.app/zh-hant/#hostbox-video)。

[![觀看 HostBox 2.01 繁體中文宣傳影片](https://www.my-tesla.app/assets/promo/hostbox-2.01-zh-hant.jpg)](https://www.my-tesla.app/zh-hant/#hostbox-video)

本地化影片和最新產品介紹由官網統一維護。
App Store 截圖由 Apple 的正式分發頁面維護，避免文件儲存庫出現過期的第二套圖庫。
