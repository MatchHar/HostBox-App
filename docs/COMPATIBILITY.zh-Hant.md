# 相容性和已驗證元件政策

[English](COMPATIBILITY.md) · [简体中文](COMPATIBILITY.zh-Hans.md) · [繁體中文](COMPATIBILITY.zh-Hant.md)

驗證基線日期：2026-08-30

## HostBox 裝置支援

- iOS／iPadOS 17.0 或更新版本。
- 目標裝置包括 iPhone 和 iPad；引導流程按能存取所選 VPS 路徑的個人 Apple 裝置最佳化。
- App Store 公開版本由 Apple 寫入 [`app-store-release.json`](app-store-release.json)，README 徽章也直接讀取 Apple。

## VPS 基線

| 項目 | 支援或建議基線 |
| --- | --- |
| 系統 | 建議 Ubuntu 22.04／24.04 或 Debian 12；自動安裝 Docker 以 apt 系 Ubuntu／Debian 為目標 |
| CPU | `amd64` 或 `arm64`，前提是每個固定元件映像都支援該架構 |
| 記憶體 | 建議 2 GB 以上；1 GB 可能緩慢／OOM；低於 768 MB 會阻止部署 |
| 可用空間 | 建議 20 GB 以上；低於 5 GB 會阻止部署 |
| 網路 | 能存取所需映像儲存庫和所選 Tunnel 服務；可透過使用者選擇的路徑入站 SSH |
| 長期連線 | 建議 HTTPS／Tunnel 或私人 VPN |

對特定 VPS 而言，HostBox 預檢結果具有決定性。未識別或非 apt 系發行版也許能透過
SSH 檢查，但不表示引導式 Docker 安裝獲得支援。

## 伺服器元件相容性

HostBox 只安裝[公開穩定目錄](https://raw.githubusercontent.com/MatchHar/My-T-Companion/main/hostbox/myt-stack.json)
中的組合，並先驗證相鄰簽章和政策。HostBox 設定頁顯示的目標版本具有決定性；
已安裝版本另行顯示，因為現有 VPS 可能落後於目標。

作為稽核記錄，2026-08-30 驗證基線固定 TeslaMate／Grafana 4.2.0、
TeslaMateAPI 1.25.0 和 My T Companion 1.10.36。這是帶日期的歷史記錄，不是
可變的「目前版本」。新目標透過簽章目錄分發，無需修改這條歷史基線。

## 相容性承諾

- 上游新版本在進入簽章穩定目錄前只作為資訊提示。
- 不支援可變映像標籤和自動「跟隨最新版本」部署。
- 目錄升級必須保留單一 My T 入口、備份驗證、健康驗證和配對回復。
- HostBox 內建後備可以有意落後於線上目錄，只按已驗證後備政策使用。
- 手動修改的堆疊可能仍能運作，但自動修復／回復只支援 HostBox 能準確識別其管理服務的情況。
