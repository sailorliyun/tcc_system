Attribute VB_Name = "QZAV_Common"
Option Explicit

'******************************************************************
'   アクセスログ対応用標準モジュール
'
'   作成日：2005/05/10
'******************************************************************
'***修正履歴********************************************************
'   xxxx/xx/xx 修正者名 修正内容
'******************************************************************
Public gclsQzaApp As QZAV_ACTX0001.ACTX0001C

Public gvarQZAItemID_TBL   As Variant    '項目ID情報
Public gvarQZABefore_TBL   As Variant    '項目変更前情報
Public gvarQZAAfter_TBL    As Variant    '項目変更後情報
'
Public gstrQZAItemid(19)   As String     '項目ID
Public gstrQZABefore(19)   As String     '項目変更前
Public gstrQZAAfter(19)    As String     '項目変更後

'項目ID
Public Const gcstrHONNIJ01 As String = "HONNIJ01"   '本人情報：氏名漢字
Public Const gcstrHONNIJ02 As String = "HONNIJ02"   '本人情報：氏名カナ
Public Const gcstrHONNIJ03 As String = "HONNIJ03"   '本人情報：氏名ローマ字
Public Const gcstrHONNIJ04 As String = "HONNIJ04"   '本人情報：生年月日
Public Const gcstrHONNIJ05 As String = "HONNIJ05"   '本人情報：性別
Public Const gcstrJITAKJ01 As String = "JITAKJ01"   '自宅情報：電話番号
Public Const gcstrJITAKJ02 As String = "JITAKJ02"   '自宅情報：郵便番号
Public Const gcstrJITAKJ03 As String = "JITAKJ03"   '自宅情報：住所カナ
Public Const gcstrJITAKJ04 As String = "JITAKJ04"   '自宅情報：住所漢字
Public Const gcstrJITAKJ05 As String = "JITAKJ05"   '自宅情報：宛名
Public Const gcstrKOUZAJ01 As String = "KOUZAJ01"   '口座情報：銀行コード
Public Const gcstrKOUZAJ02 As String = "KOUZAJ02"   '口座情報：銀行名
Public Const gcstrKOUZAJ03 As String = "KOUZAJ03"   '口座情報：支店コード
Public Const gcstrKOUZAJ04 As String = "KOUZAJ04"   '口座情報：支店名
Public Const gcstrKOUZAJ05 As String = "KOUZAJ05"   '口座情報：預金種別
Public Const gcstrKOUZAJ06 As String = "KOUZAJ06"   '口座情報：口座番号
Public Const gcstrKOUZAJ07 As String = "KOUZAJ07"   '口座情報：口座名義
Public Const gcstrKOUZAJ08 As String = "KOUZAJ08"   '口座情報：通帳記号・通帳番号
Public Const gcstrTEIKEJ01 As String = "TEIKEJ01"   '提携先情報：カード番号
Public Const gcstrKINMUJ01 As String = "KINMUJ01"   '勤務先情報：名称カナ
Public Const gcstrKINMUJ02 As String = "KINMUJ02"   '勤務先情報：名称漢字
Public Const gcstrKINMUJ03 As String = "KINMUJ03"   '勤務先情報：所属部署
Public Const gcstrKINMUJ04 As String = "KINMUJ04"   '勤務先情報：電話番号
Public Const gcstrKINMUJ05 As String = "KINMUJ05"   '勤務先情報：郵便番号
Public Const gcstrKINMUJ06 As String = "KINMUJ06"   '勤務先情報：住所カナ
Public Const gcstrKINMUJ07 As String = "KINMUJ07"   '勤務先情報：住所漢字
Public Const gcstrKINMUJ08 As String = "KINMUJ08"   '勤務先情報：宛名
Public Const gcstrKAZOKJ01 As String = "KAZOKJ01"   '家族構成情報：氏名漢字
Public Const gcstrKAZOKJ02 As String = "KAZOKJ02"   '家族構成情報：氏名カナ
Public Const gcstrKAZOKJ03 As String = "KAZOKJ03"   '家族構成情報：氏名ローマ字
Public Const gcstrKAZOKJ04 As String = "KAZOKJ04"   '家族構成情報：生年月日
Public Const gcstrKAZOKJ05 As String = "KAZOKJ05"   '家族構成情報：性別
Public Const gcstrKAZOKJ06 As String = "KAZOKJ06"   '家族構成情報：続柄
Public Const gcstrETCINF01 As String = "ETCINF01"   'その他情報：電話番号
Public Const gcstrETCINF02 As String = "ETCINF02"   'その他情報：郵便番号
Public Const gcstrETCINF03 As String = "ETCINF03"   'その他情報：住所カナ
Public Const gcstrETCINF04 As String = "ETCINF04"   'その他情報：住所漢字
Public Const gcstrETCINF05 As String = "ETCINF05"   'その他情報：宛名漢字
Public Const gcstrETCINF06 As String = "ETCINF06"   'その他情報：宛名カナ

'操作ID
Public Const gcstrLOGON001 As String = "LOGON001"   '業務画面初期表示
Public Const gcstrLOGOFF01 As String = "LOGOFF01"   '業務画面終了
Public Const gcstrFKEY0001 As String = "FKEY0001"   'メニュー
Public Const gcstrFKEY0002 As String = "FKEY0002"   'ハードコピー
Public Const gcstrFKEY005I As String = "FKEY005I"   '実行（データ追加処理）
Public Const gcstrFKEY005U As String = "FKEY005U"   '実行（データ修正処理）
Public Const gcstrFKEY005D As String = "FKEY005D"   '実行（データ削除処理）
Public Const gcstrFKEY005R As String = "FKEY005R"   '実行（データ照会処理）
Public Const gcstrFKEY0007 As String = "FKEY0007"   '前ページ
Public Const gcstrFKEY0008 As String = "FKEY0008"   '次ページ
Public Const gcstrFKEY0010 As String = "FKEY0010"   '前画面
Public Const gcstrFKEY0011 As String = "FKEY0011"   '次画面
Public Const gcstrFKEY0012 As String = "FKEY0012"   '取り消し
Public Const gcstrREFCMD01 As String = "REFCMD01"   '照会
Public Const gcstrEXECINS0 As String = "EXECINS0"   '実行（データ追加処理）
Public Const gcstrEXECUPD0 As String = "EXECUPD0"   '実行（データ修正処理）
Public Const gcstrEXECDEL0 As String = "EXECDEL0"   '実行（データ削除処理）
Public Const gcstrEXECREF0 As String = "EXECREF0"   '実行（データ照会処理）
Public Const gcstrPREVIEW0 As String = "PREVIEW0"   'プレビュー
Public Const gcstrPRINT001 As String = "PRINT001"   '印刷
Public Const gcstrCLICKINS As String = "CLICKINS"   'クリック（データ追加処理）
Public Const gcstrCLICKUPD As String = "CLICKUPD"   'クリック（データ更新処理）
Public Const gcstrCLICKDEL As String = "CLICKDEL"   'クリック（データ削除処理）
Public Const gcstrCLICKREF As String = "CLICKREF"   'クリック（データ照会処理）
Public Const gcstrEXEC0001 As String = "EXEC0001"   '実行
Public Const gcstrCSVOUT01 As String = "CSVOUT01"   'ＣＳＶデータ出力
Public Const gcstrSYSLOGON As String = "SYSLOGON"   'システムログオン
Public Const gcstrSYSLOGOF As String = "SYSLOGOF"   'システムログオフ
Public Const gcstrMDBOUT01 As String = "MDBOUT01"   'ＭＤＢデータ出力

'システムID
Public Const gsstrTCCSYSTEM As String = "00000002"  '髙島屋クレジット支援システム
Public Const gsstrFDSSYSTEM As String = "00000003"  'ＦＤＳモニタリングシステム
Public Const gsstrIMGSYSTEM As String = "00000004"  'イメージ管理
Public Const gsstrCTSSYSTEM As String = "00000008"  'インフォメーションシステム（CT-STAGE)

'会社ＩＤ
Public Const gsstrCMPTCC As String = "TCC  "  '髙島屋クレジット

