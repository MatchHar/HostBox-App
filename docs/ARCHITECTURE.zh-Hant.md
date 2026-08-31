# 架構與信任邊界

[English](ARCHITECTURE.md) · [简体中文](ARCHITECTURE.zh-Hans.md) · [繁體中文](ARCHITECTURE.zh-Hant.md)

## 產品邊界

HostBox 是部署／維護層，My T 是車輛端 App。TeslaMate 和相關伺服器元件執行在
使用者控制的基礎設施上。選用 Companion 擴充這部自託管伺服器；它不是 HostBox
iOS App，也不表示私人 HostBox 原始碼已公開。

## 資料路徑

1. **HostBox → VPS：**透過使用者選擇的路徑直接執行 SSH 和服務健康檢查。
2. **VPS → 上游儲存庫：**下載由已驗證穩定目錄選定並固定版本的元件。
3. **HostBox → My T：**使用者明確操作後，傳送不含秘密的 URL，以及同一裝置上短時有效的剪貼簿套件。
4. **My T → My T Server：**只使用一個經過驗證的 `base_url`，內部服務留在使用者伺服器邊界內。

HostBox 不會透過開發者營運的 HostBox 伺服器中轉 SSH 憑證或車輛歷史。

## 目錄信任

遠端目錄內容必須附有相鄰且有效的 Ed25519 簽章。HostBox 會拒絕無效簽章、來源
取代、政策違規、可變的「latest」部署行為和目錄降級。支援時，容器參照同時固定
版本和摘要；Companion 發佈套件另有獨立摘要。遠端內容不能接受時，可使用先前已
驗證快取或 App 內建後備。

公開目錄描述部署相容性；簽章私密金鑰和發佈實作絕不進入本文件儲存庫。

## 網路邊界

長期公開面應只有一個經過身分驗證的 My T Server 入口，通常由 HTTPS／Tunnel
或私人 VPN 保護。資料庫、MQTT、TeslaMate 網頁、Grafana 和 Companion 都是
內部服務。臨時 IP 模式把管理網頁留在回環地址，需要存取時使用 SSH 通道。

## 復原邊界

支援的堆疊更新前，HostBox 會驗證 PostgreSQL 自訂格式備份。拉取失敗時恢復設定，
不會假裝容器已經切換；開始切換後如啟動或健康檢查失敗，則執行配對的設定／資料庫
復原路徑。HostBox 不會靜默升級到未經驗證的上游版本。
