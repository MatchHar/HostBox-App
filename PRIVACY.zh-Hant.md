# 隱私權

[English](PRIVACY.md) · [简体中文](PRIVACY.zh-Hans.md) · [繁體中文](PRIVACY.zh-Hant.md)

最後更新：2026 年 8 月 30 日

正式公開政策以[HostBox 隱私權政策](https://my-tesla.app/hostbox/privacy/zh-hant/)為準。
本文件是 HostBox iOS App（`app.hostbox.ios`）便於閱讀的儲存庫副本。

## 產品範圍

HostBox 是在使用者選擇的 VPS 上安裝和維護 My T Server 的獨立 iOS 工具。
它不取代 Tesla 官方服務，也不要求註冊 HostBox 營運的伺服器帳號。

## 裝置上的連線資料

VPS 主機、連接埠、SSH 使用者名稱、驗證方式、有限的部署狀態和已清理的交接
記錄儲存在裝置上。只有使用者明確啟用備份後，不含秘密的連線中繼資料才可透過
使用者的私人 iCloud 同步。

自由填寫的備註、受信任 SSH 指紋、診斷日誌、密碼、私密金鑰、API Token、
Grafana 憑證和 Cloudflare 憑證不會進入該備份。

## 憑證

SSH 密碼和私密金鑰儲存在 iOS Keychain。完成部署需要時，My T API Token、
Grafana 憑證和 Cloudflare Access 服務憑證也可儲存在本機 Keychain。只還原
不含秘密的 iCloud 備份後，這些憑證必須重新輸入。

部署時提供的 Cloudflare API Token 只存在於目前操作的記憶體，不寫入部署
歷史、診斷日誌、Keychain 或 iCloud 備份。

## SSH 指令和診斷

進階指令頁中輸入的指令和輸出只在 App 執行期間保留於有限記憶體，以便返回
查看；App 結束後不會作為長期歷史儲存，也不會由 HostBox 上傳。部署步驟、
結果和有限診斷儲存在本機，用於重試和維護。分享前必須移除敏感內容。

## 交接給 My T

開啟 My T 的 URL 只攜帶不含秘密的連線中繼資料，不包含密碼、Bearer Token
或 Cloudflare 秘密。完整連線套件只有在使用者明確操作後才放入同一裝置的本機
剪貼簿，五分鐘後失效。My T 會測試入口，並在儲存或取代連線前詢問使用者。

## 網路存取

HostBox 連接使用者指定的 VPS，執行 SSH 和健康檢查；也可存取公開元件目錄，
以及使用者選擇時的 Cloudflare API。它可透過 URL scheme 開啟 My T 匯入連線。
遠端部署操作在使用者自己的 VPS 上執行，VPS 密碼不會上傳到 HostBox 營運的雲端服務。

## 車輛資料

HostBox 不收集 Tesla 帳號憑證、車輛歷史、行程、VIN 或位置。車輛資料保留在
使用者的 TeslaMate 執行個體或其他伺服器元件中。HostBox 不進行跨 App 廣告
追蹤，也不使用廣告識別碼。

## 第三方

使用者可以選擇 TeslaMate、TeslaMateAPI、Grafana、My T Companion 和
Cloudflare 等獨立專案或服務。它們的授權、隱私權政策、帳號和基礎設施都與 HostBox 分開。

## 刪除

刪除伺服器或完成記錄會移除相關的本機 HostBox Keychain 項目。已經安裝在 VPS、
iCloud、My T 或第三方帳號中的資料，需要使用者在相應系統中另行刪除。

## 支援

不要在公開 Issue 提交憑證、私密金鑰、真實伺服器地址、`.env`、Compose 文件、
資料庫匯出、VIN、精確位置或原始生產日誌。隱私權問題請使用[官方支援](https://my-tesla.app/support/zh-hant/)，
安全漏洞請閱讀 [SECURITY.zh-Hant.md](SECURITY.zh-Hant.md)。
