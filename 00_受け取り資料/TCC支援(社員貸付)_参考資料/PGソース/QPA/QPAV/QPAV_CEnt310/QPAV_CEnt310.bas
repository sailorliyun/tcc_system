Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt310"
    'エラー番号
    Public Const gintERR_OK = 0                 '正常
    Public Const gintERR_DATE = 1               '日付ｴﾗｰ
    Public Const gintERR_MIRAI_DATE = 2         '未来日付ｴﾗｰ
    Public Const gintERR_TIME = 3               '時間ｴﾗｰ
    Public Const gintERR_KINGAKU = 4            '金額ｴﾗｰ
    
    Public bInit_Flg        As Boolean          '初期処理ﾌﾗｸﾞ
    Public gstrSysDate      As String           'ｻｰﾊﾞｰｼｽﾃﾑ日付
    Public gstrCode         As String           '社員ｺｰﾄﾞ
    Public gstrYMD          As String           '取引日付
    Public gstrHMS          As String           '取引時間
    Public gstrDelFlg       As String           '削除ﾌﾗｸﾞ

    Public gstrName         As String           '社員名
    Public gstrKingaku      As String           '金額
    Public gintExecNo       As Integer          '実行番号
    Public gblnSonzaiFlg    As Boolean          '存在ﾌﾗｸﾞ
    Public gblnDataSetFlg   As Boolean          'ﾃﾞｰﾀ設定ﾌﾗｸﾞ
    
    '社員マスタT属性
    Type SyainMTbl
        SyainCD1            As String           '社員ｺｰﾄﾞ1
        SyainCD2            As String           '社員ｺｰﾄﾞ2
        SimeiKana           As String           '氏名かな
        SimeiKanji          As String           '氏名漢字
        MiseCD              As String           '店ｺｰﾄﾞ
        MiseName            As String           '店名
        TozaiKBN            As String           '東西区分
        BumonCD             As String           '部門ｺｰﾄﾞ
        BumonName           As String           '部門名
        SikakuCD            As String           '資格ｺｰﾄﾞ
        TokyuCD             As String           '等級ｺｰﾄﾞ
        BornYMD             As String           '生年月日
        TaisyokuYMD         As String           '退職日付
        KyusyoSTYMD         As String           '休職開始日付
        KyusyoEDYMD         As String           '休職終了日付
        SonzaiFlg           As String           '存在ﾌﾗｸﾞ
    End Type
    
    '小口貸付データ属性
    Type KasitukeTbl
        YMD                 As String           '取引日付
        HMS                 As String           '取引時間
        Kingaku             As Long             '金額
        TourokuYMD          As String           '登録日付
        TourokuName         As String           '登録者名
        flg                 As String           'ﾌﾗｸﾞ
    End Type
     
    Public gtblSyainM       As SyainMTbl        '社員ﾏｽﾀ属性
    Public gtblKasituke()   As KasitukeTbl      '小口貸付ﾃﾞｰﾀ属性
    Public glngTblCnt       As Long             'ﾃﾞｰﾀ総件数
'**************************************************************************************************
'* 起動　ＭＡＩＮ
'**************************************************************************************************
Public Sub Main()
 
    Dim strCmdLine          As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "小口融資貸付データ登録は既に起動されています。" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If

    'コマンドライン引数の取得
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "起動パラメータが設定されていません。" _
                , vbExclamation Or vbOKOnly, gcstrPrjName
        
        Exit Sub
    End If
        
    'コマンドライン引数を編集する
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt310.Show
 
End Sub
'**************************************************************************************************
'*　　機能概要：　初期処理（サーバーシステム日付取得）
'*　　結　果　：　True…成功  False…失敗
'**************************************************************************************************
Public Function gfuncInit() As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errInit
    gfuncInit = False
    'サーバーシステム日付
    odbDatabase.Parameters.Add "OtStrSysDate", "", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Init(:OtStrSysDate); END;"

     'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)
     
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")
    'サーバーシステム日付編集
    gstrSysDate = CDate(Left(gstrSysDate, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Right(gstrSysDate, 2))
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncInit = True

    Exit Function
    
errInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

''**************************************************************************************************
''*　　機能概要：　手動履歴Tの既存チェックをする
''*　　引　数　：　lngRecCnt…データ検索数
''*　　結　果　：　True…成功  False…失敗
''**************************************************************************************************
Public Function gfuncKgcKasitukeTChk(ByRef lngRecCnt As Long, ByVal lngExecNo As Long) As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errKgcTChk

    gfuncKgcKasitukeTChk = False

    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    '取引日付
    odbDatabase.Parameters.Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
    '取引時間
    odbDatabase.Parameters.Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
    '金額
    odbDatabase.Parameters.Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKingaku").ServerType = ORATYPE_VARCHAR2
    '登録日付
    odbDatabase.Parameters.Add "InStrTourokuYMD", Format(gstrSysDate, "yyyymmdd"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTourokuYMD").ServerType = ORATYPE_CHAR
    '実行No
    odbDatabase.Parameters.Add "InNumExecNo", lngExecNo, ORAPARM_INPUT
    odbDatabase.Parameters("InNumExecNo").ServerType = ORATYPE_NUMBER
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_Cent310KgcKasitukeTChk(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku, " & _
             ":InStrTourokuYMD, " & _
             ":InNumExecNo, " & _
             ":OtNumRecCount); END;"

     'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)

    lngRecCnt = odbDatabase.Parameters("OtNumRecCount")

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncKgcKasitukeTChk = True

    Exit Function

errKgcTChk:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*　　機能概要：　小口融資台帳Tの存在チェックをする
'*　　引　数　：　lngRecCnt…データ検索数
'*　　結　果　：　True…成功  False…失敗
'**************************************************************************************************
Public Function gfuncDaicyoChk(ByRef lngRecCnt As Long) As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errDaicyoChk
    
    gfuncDaicyoChk = False
    
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_Cent310KgcDaicyoChk(" & _
             ":InStrSyainCD, " & _
             ":OtNumRecCount); END;"

     'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)
     
    lngRecCnt = RTrim(odbDatabase.Parameters("OtNumRecCount"))

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoChk = True

    Exit Function
    
errDaicyoChk:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*　　機能概要：　社員属性取得ＳＰを使用し、社員属性情報を取得する
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'**************************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    Dim strSQL              As String           'PL/SQL
    
On Error GoTo errSeachSyain

    gfuncSeachSyain = False
    
    '社員属性取得 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", Space(1), ORAPARM_INPUT    '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT    '社員コード２
        '氏名カナ
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '氏名漢字
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '所属店コード
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '所属店名
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '東西区分
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '所属部門コード
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '所属部門名
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '資格コード
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '等級コード
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '生年月日
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
        '退社月日
    odbDatabase.Parameters.Add "OtStrTaisyokuYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTaisyokuYMD").ServerType = ORATYPE_VARCHAR2
        '休職開始月日
    odbDatabase.Parameters.Add "OtStrKyusyoSTYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKyusyoSTYMD").ServerType = ORATYPE_VARCHAR2
        '休職終了月日
    odbDatabase.Parameters.Add "OtStrKyusyoEDYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKyusyoEDYMD").ServerType = ORATYPE_VARCHAR2
        '存在Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtStrTaisyokuYMD, " & _
             ":OtStrKyusyoSTYMD, " & _
             ":OtStrKyusyoEDYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    gtblSyainM.SonzaiFlg = odbDatabase.Parameters("OtStrSonzaiFlg")
    '該当データあり
    If gtblSyainM.SonzaiFlg = "1" Then
        gtblSyainM.SimeiKana = odbDatabase.Parameters("OtStrSimeiKana")                     '個人名カナ
        gtblSyainM.SimeiKanji = odbDatabase.Parameters("OtStrSimeiKanji")                   '個人名漢字
        gtblSyainM.MiseCD = odbDatabase.Parameters("OtStrMiseCD")                           '店コード
        gtblSyainM.MiseName = odbDatabase.Parameters("OtStrMiseName")                       '店名
        gtblSyainM.TozaiKBN = odbDatabase.Parameters("OtStrTozaiKBN")                       '東西区分
        gtblSyainM.BumonCD = odbDatabase.Parameters("OtStrBumonCD")                         '部門コード
        gtblSyainM.BumonName = odbDatabase.Parameters("OtStrBumonName")                     '部門名
        gtblSyainM.SikakuCD = odbDatabase.Parameters("OtStrSikakuCD")                       '資格コード
        gtblSyainM.TokyuCD = odbDatabase.Parameters("OtStrTokyuCD")                         '等級コード
        gtblSyainM.BornYMD = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)            '生年月日
        gtblSyainM.TaisyokuYMD = Trim$(odbDatabase.Parameters("OtStrTaisyokuYMD").Value)    '退職月日
        gtblSyainM.KyusyoSTYMD = Trim$(odbDatabase.Parameters("OtStrKyusyoSTYMD").Value)    '休職開始月日
        gtblSyainM.KyusyoEDYMD = Trim$(odbDatabase.Parameters("OtStrKyusyoEDYMD").Value)    '休職終了月日
        
        '生年月日編集
        If IsNull(gtblSyainM.BornYMD) Or Trim$(gtblSyainM.BornYMD) = "" Or _
                Trim$(gtblSyainM.BornYMD) = "0" Or Trim$(gtblSyainM.BornYMD) = "00000000" Then
            gtblSyainM.BornYMD = ""
        Else
            gtblSyainM.BornYMD = Mid$(gtblSyainM.BornYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.BornYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.BornYMD, 7, 2)
        End If
    
        '退職開始月日編集
        If IsNull(gtblSyainM.TaisyokuYMD) Or Trim$(gtblSyainM.TaisyokuYMD) = "" Or _
                Trim$(gtblSyainM.TaisyokuYMD) = "0" Or Trim$(gtblSyainM.TaisyokuYMD) = "00000000" Then
            gtblSyainM.TaisyokuYMD = ""
        Else
            gtblSyainM.TaisyokuYMD = Mid$(gtblSyainM.TaisyokuYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.TaisyokuYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.TaisyokuYMD, 7, 2)
        End If
        
        '休職開始月日編集
        If IsNull(gtblSyainM.KyusyoSTYMD) Or Trim$(gtblSyainM.KyusyoSTYMD) = "" Or _
                Trim$(gtblSyainM.KyusyoSTYMD) = "0" Or Trim$(gtblSyainM.KyusyoSTYMD) = "00000000" Then
            gtblSyainM.KyusyoSTYMD = ""
        Else
            gtblSyainM.KyusyoSTYMD = Mid$(gtblSyainM.KyusyoSTYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.KyusyoSTYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.KyusyoSTYMD, 7, 2)
        End If
    
         '休職終了月日編集
        If IsNull(gtblSyainM.KyusyoEDYMD) Or Trim$(gtblSyainM.KyusyoEDYMD) = "" Or _
                Trim$(gtblSyainM.KyusyoEDYMD) = "0" Or Trim$(gtblSyainM.KyusyoEDYMD) = "00000000" Then
            gtblSyainM.KyusyoEDYMD = ""
        Else
            gtblSyainM.KyusyoEDYMD = Mid$(gtblSyainM.KyusyoEDYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.KyusyoEDYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.KyusyoEDYMD, 7, 2)
        End If
   End If

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSeachSyain = True

    Exit Function
    
errSeachSyain:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*　　機能概要：　貸付情報を取得する
'*　　引　数　：　lngRecCnt…データ検索数
'*　　結　果　：　True…成功  False…失敗
'**************************************************************************************************
Public Function gfuncSPGet(ByRef lngRecCnt As Long) As Boolean

    Dim strSQL              As String           'PL/SQL
    Dim i                   As Long
    Dim g                   As Long
    Dim lngMax              As Long
    Dim Cnt                 As Integer
    Dim strData             As String           'ﾃﾞｰﾀ

    Const cnsMaxRec As Long = 100

On Error GoTo errSPGet
    
    gfuncSPGet = False

    Cnt = 0
    
    'ＳＰ
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR

    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
      
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    odbDatabase.Parameters("OtStrDataAry").MinimumSize = 200
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
       
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":IoNumCursor," & _
            ":OtStrDataAry," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg); END;"

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblKasituke
            glngTblCnt = 0
    
            lngRecCnt = odbDatabase.Parameters("OtNumRecCount")
            If lngRecCnt = 0 Then
                Exit Do
            End If
        
        End If
    
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKasituke(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            strData = odbDatabase.Parameters("OtStrDataAry").Get_Value(g)

            '取引日
            gtblKasituke(i).YMD = gfncstrDlm(strData)
            '取引時刻
            gtblKasituke(i).HMS = gfncstrDlm(strData)
            '金額
            gtblKasituke(i).Kingaku = gfncstrDlm(strData)
            '登録日付
            gtblKasituke(i).TourokuYMD = gfncstrDlm(strData)
            '登録者名
            gtblKasituke(i).TourokuName = gfncstrDlm(strData)
            '手動フラグ
            gtblKasituke(i).flg = gfncstrDlm(strData)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    Loop Until Trim(odbDatabase.Parameters("OtStrEndFlg")) = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPGet = True
    
    Exit Function

errSPGet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   排他制御（ロック）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "strSikibetu", "310", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 'キーコード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Lock(" & _
             ":strSikibetu," & _
             ":InStrKeyInfo1," & _
             ":strProgramID," & _
             ":strComputerNM," & _
             ":strOperatorID); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    gblnHaita_Lock = True
    
    Exit Function
    
errgblnHaita:
'エラー処理
    
    '排他処理中エラーメッセージ表示
    If odbDatabase.LastServerErr >= 20000 Then   'Msg = 他の端末で処理中です。再度実行して下さい
        frmQPAV_CEnt310.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
        odbDatabase.LastServerErrReset                      'ｴﾗｰﾘｾｯﾄ
        
'        gblnHaita_Lock = True
    Else
        'エラーメッセージ表示
       Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                              gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    End If
                           
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Sub gblnHaita_Unlock()
'*****************************************************************************************
'   排他制御（解除）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgsubUnLock

    odbDatabase.Parameters.Add "strSikibetu", "310", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310UnLock(" _
           & ":strSikibetu,:strComputerNM);END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errgsubUnLock:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub
'**************************************************************************************************
'*　　機能概要：　貸付データを追加する
'*　　引　数　：　なし
'*　　結　果　：　True…成功  False…失敗
'**************************************************************************************************
Public Function gfuncSPIns() As Boolean
    Dim strSQL              As String           'PL/SQL
    
On Error GoTo errSPIns

    gfuncSPIns = False
    
    With odbDatabase.Parameters
        '社員コード
        .Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
        '取引日付
        .Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
        .Item("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
        '取引時間
        .Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
        .Item("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
        '金額
        .Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
        .Item("InStrKingaku").ServerType = ORATYPE_VARCHAR2
        '登録ID
        .Add "InStrTourokuID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrTourokuID").ServerType = ORATYPE_VARCHAR2
        '店コード
        .Add "InStrMiseCd", RTrim(gtblSyainM.MiseCD), ORAPARM_INPUT
        .Item("InStrMiseCd").ServerType = ORATYPE_VARCHAR2
        'メニューID        オペログ用
        .Add "InstrMenuID", "QPA", ORAPARM_INPUT
        .Item("InstrMenuID").ServerType = ORATYPE_VARCHAR2
        'モジュールID      オペログ用
        .Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT
        .Item("InStrModuleID").ServerType = ORATYPE_VARCHAR2
        '登録担当者ID      オペログ用
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        '登録担当者        オペログ用
        .Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
        .Item("InStrTantoNM").ServerType = ORATYPE_VARCHAR2
        'コンピューター名  オペログ用
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        '利用区分          オペログ用
        .Add "InStrRiyouKBN", gstrCommandLine(10), ORAPARM_INPUT
        .Item("InStrRiyouKBN").ServerType = ORATYPE_VARCHAR2
        '部署コード        オペログ用
        .Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
        .Item("InstrBushoCD").ServerType = ORATYPE_VARCHAR2
    End With

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Ins(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku, " & _
             ":InStrTourokuID, " & _
             ":InStrMiseCd, " & _
             ":InstrMenuID, " & _
             ":InStrModuleID, " & _
             ":InStrUserID, " & _
             ":InStrTantoNM, " & _
             ":InStrComputerNM, " & _
             ":InStrRiyouKBN, " & _
             ":InstrBushoCD " & _
             "); END;"

     'SPの実行
    Call odbDatabase.DbexecuteSQL(strSQL)
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPIns = True

    Exit Function
    
errSPIns:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*　　機能概要：　貸付データを削除する
'*　　引　数　：　なし
'*　　結　果　：　True…成功  False…失敗
'**************************************************************************************************
Public Function gfuncSPDel() As Boolean
    Dim strSQL      As String
    
On Error GoTo errSPDel

    gfuncSPDel = False
    
    With odbDatabase.Parameters
        '社員コード
        .Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
        '登録日付
        .Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
        .Item("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
        '登録時間
        .Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
        .Item("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
        '金額
        .Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
        .Item("InStrKingaku").ServerType = ORATYPE_VARCHAR2
        'メニューID        オペログ用
        .Add "InstrMenuID", "QPA", ORAPARM_INPUT
        .Item("InstrMenuID").ServerType = ORATYPE_VARCHAR2
        'モジュールID      オペログ用
        .Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT
        .Item("InStrModuleID").ServerType = ORATYPE_VARCHAR2
        '登録担当者ID      オペログ用
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        '登録担当者        オペログ用
        .Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
        .Item("InStrTantoNM").ServerType = ORATYPE_VARCHAR2
        'コンピューター名  オペログ用
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        '利用区分          オペログ用
        .Add "InStrRiyouKBN", gstrCommandLine(10), ORAPARM_INPUT
        .Item("InStrRiyouKBN").ServerType = ORATYPE_VARCHAR2
        '部署コード        オペログ用
        .Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
        .Item("InstrBushoCD").ServerType = ORATYPE_VARCHAR2
    End With
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Del(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku," & _
             ":InstrMenuID, " & _
             ":InStrModuleID, " & _
             ":InStrUserID, " & _
             ":InStrTantoNM, " & _
             ":InStrComputerNM, " & _
             ":InStrRiyouKBN, " & _
             ":InstrBushoCD); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True

    Exit Function
    
errSPDel:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*　　機能概要：　日付チェック
'*　　引　数　：　strChkDate…チェックする日付
'*　　結　果　：　0…OK  1…過去日付ｴﾗｰ  2…未来日付ｴﾗｰ
'**************************************************************************************************
Public Function DateCheckNo(ByVal strChkDate As String) As Integer
    Dim strLastDate         As String           '過去日付
    Dim strCheck            As String           '返却値（ﾁｪｯｸ用）

    DateCheckNo = gintERR_OK
    
    '過去日付チェック
    '登録日が１日～５日は前々月２６日より当日まで登録ＯＫ
    If Day(CDate(gstrSysDate)) < 6 Then
        strLastDate = CStr(DateAdd("m", -2, CDate(gstrSysDate)))
    
    '登録日が６日以降は前月２６日より当日まで登録ＯＫ
    Else
        strLastDate = CStr(DateAdd("m", -1, CDate(gstrSysDate)))
    End If
    
    strLastDate = Mid(strLastDate, 1, 8)
    strLastDate = strLastDate & "26"

    strCheck = DateDiff("d", CDate(strLastDate), CDate(strChkDate))
    If CLng(strCheck) < 0 Then
        DateCheckNo = gintERR_DATE
        Exit Function
    End If

    '未来日付チェック
    strCheck = DateDiff("d", CDate(gstrSysDate), CDate(strChkDate))
    If CLng(strCheck) > 0 Then
        DateCheckNo = gintERR_MIRAI_DATE
        Exit Function
    End If

End Function


