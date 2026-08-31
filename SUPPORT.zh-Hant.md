# 支援

[English](SUPPORT.md) · [简体中文](SUPPORT.zh-Hans.md) · [繁體中文](SUPPORT.zh-Hant.md)

## 建立 Issue 前

1. 確認 VPS 可從 HostBox 目前使用的網路路徑透過 SSH 存取。
2. 重新開啟部署記錄，找出第一個失敗的 HostBox 步驟。
3. 確認磁碟空間充足，預期容器正在執行。
4. 執行 HostBox 健康驗證；不要略過失敗的備份或回復。
5. 閱讀[設定](docs/SETUP.zh-Hant.md)、[維運](docs/OPERATIONS.zh-Hant.md)和
   [相容性](docs/COMPATIBILITY.zh-Hant.md)。

## 可以安全提供的診斷

可以提供 HostBox 版本／構建號、iOS／iPadOS 版本、裝置型號、伺服器系統名稱
和版本、HostBox 顯示的元件版本、連線模式、不含憑證的驗證類型、失敗步驟名稱、
HTTP 狀態碼以及最少且已移除敏感內容的重現步驟。

不要提供密碼、Token、Cookie、私密金鑰、SSH 指紋、伺服器網域或 IP、`.env`、
Compose 文件、資料庫匯出、原始日誌、VIN、車牌、位置或路線歷史。

## 常見現象

- **SSH 主機發生變更：**停止操作，先核實伺服器指紋為何改變。
- **401／403：**核對入口和驗證方式；疑似洩漏的憑證應輪替，不要發到 Issue。
- **逾時：**檢查防火牆、Tunnel／VPN 狀態、DNS 和所選入口。
- **更新後服務不健康：**保留產生的備份，使用 HostBox 記錄的復原路徑，不要手動刪除卷宗。
- **My T 無法匯入：**在本機剪貼簿套件失效前，於同一部已解鎖裝置重新交接。

## 求助位置

- 產品／設定問題：儲存庫公開後使用 Issue 範本。
- 安全問題：按 [SECURITY.zh-Hant.md](SECURITY.zh-Hant.md) 私下回報。
- 隱私權或 App Store 支援：使用[官方支援](https://my-tesla.app/support/zh-hant/)。
- 上游元件問題：先確認並非 HostBox 支援設定特有，再聯絡相應專案。

這個獨立專案在合理能力範圍內提供支援。
