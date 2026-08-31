# 設定與安全交接

[English](SETUP.md) · [简体中文](SETUP.zh-Hans.md) · [繁體中文](SETUP.zh-Hant.md)

## 1. 準備 VPS

建議使用全新或管理範圍明確的 Ubuntu 22.04／24.04 或 Debian 12 VPS。
HostBox 建議至少 2 GB 記憶體和 20 GB 可用空間。1 GB 可能緩慢或 OOM；低於
768 MB 記憶體或 5 GB 可用空間則低於 App 的部署最低值。確認可以存取元件映像
儲存庫和所選 Tunnel 服務。

如果 VPS 已有重要服務，先建立供應商快照。HostBox 只針對它管理的服務，但共用
伺服器仍要求管理員理解連接埠、儲存、防火牆、DNS 和資源使用。

## 2. 加入並驗證 SSH

在 HostBox 輸入 VPS 地址、SSH 連接埠、使用者名稱和驗證方式。優先使用獨立管理
帳號和私密金鑰。首次信任前透過另一條可靠管道核對 SSH 主機金鑰指紋；日後意外
變更時必須調查，不能直接接受。

部署前執行「測試連線」，檢查偵測到的系統、記憶體、空間、Docker 和 Compose 狀態。

## 3. 選擇連線方式

- **Cloudflare Tunnel：**適合已控制網域和 Cloudflare 帳號的使用者。部署 Token
  只用於目前操作。
- **私人 VPN：**適合 iPhone 和 VPS 位於同一私人 VPN 的情況。
- **臨時公開 IP：**用於初始引導設定。只能公開經過身分驗證的 My T API 入口；
  TeslaMate 網頁和 Grafana 保持在 VPS 回環地址，並使用 HostBox 顯示的電腦 SSH 通道說明。

不要把 TeslaMate 網頁、Grafana、資料庫、MQTT 或 Companion 地址填成 My T 的 `base_url`。

## 4. 部署和驗證

選擇標準 My T Server 元件。HostBox 使用已驗證穩定目錄，檢查連線政策並執行
健康驗證。當 App 明確提示目前步驟需要保持前景時，請保持開啟。步驟失敗後先看
第一個錯誤並使用重試／復原，不要同時在伺服器進行無關手動修改。

Tesla 車輛授權在 TeslaMate 網頁完成，不是 HostBox 或 My T 帳號登入。絕對不要
把 Tesla 憑證發到本儲存庫。

## 5. 交接給 My T

在完成頁啟動 My T 交接。URL 只包含不含秘密的中繼資料；HostBox 會另行把本機
憑證套件放到同一裝置剪貼簿五分鐘。在 My T 中測試入口，再選擇另存連線或取代現有連線。

成功匯入後，清除手動複製過的診斷內容，並在手機之外保存 VPS 備份／還原計畫。

## 6. 部署後

- 確認 My T 能透過預定的長期路徑連線。
- 修改第三方儀表板預設憑證。
- 非 API 服務保持私人。
- 啟用供應商快照或加密的異地備份。
- 接受更新前閱讀[維運說明](OPERATIONS.zh-Hant.md)。
