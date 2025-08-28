Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt020"
    Public bInit_Flg        As Boolean
    Public gstrCode         As String
    Public gstrYMD_B        As String
    Public gstrYMD          As String
    Public glngKingaku      As Long
    Public glngSprCol       As Long
    Public gintMode         As Integer
    Public ShimeYMD         As String

    Type NyukinTbl
       YMD                  As String
       Kingaku              As Long
       Zandaka              As Long
    End Type
     
    Public gtblNyukin()     As NyukinTbl
    Public glngTblCnt       As Long
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "小口融資入金入力は既に起動されています。" _
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

    frmQPAV_CEnt020.Show
 
End Sub

'*********************************************************************************************
'*　　手続き名：　社員属性取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　社員属性取得ＳＰを使用し、社員属性情報を取得する
'*********************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
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
    '存在Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020SelSyainZoku(" & _
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
             ":OtstrSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    '画面に表示
    frmQPAV_CEnt020.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '個人名カナ
    frmQPAV_CEnt020.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '個人名漢字
    frmQPAV_CEnt020.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '店コード
    frmQPAV_CEnt020.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '店名
    frmQPAV_CEnt020.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '東西区分
    frmQPAV_CEnt020.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '部門コード
    frmQPAV_CEnt020.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '部門名
    frmQPAV_CEnt020.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '資格コード
    frmQPAV_CEnt020.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '等級コード
    '生年月日編集
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '生年月日
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt020.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt020.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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

Public Function gfuncSPSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim lngMax               As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet
    
    gfuncSPSet = False

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt020.sprList)
    frmQPAV_CEnt020.sprList.MaxRows = 0
    For i = 0 To 2
        frmQPAV_CEnt020.cmdexec(i).Enabled = False
    Next i
    
    'ＳＰ
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR

    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '入金日 配列
    odbDatabase.Parameters.AddTable "OtStrNyukinYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
      
    '入金額 配列
    odbDatabase.Parameters.AddTable "OtNumNyukingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '残高 配列
    odbDatabase.Parameters.AddTable "OtNumZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '残高日
    odbDatabase.Parameters.Add "OtStrZandakaYM", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZandakaYM").ServerType = ORATYPE_CHAR
      
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg," & _
            ":OtStrNyukinYMD," & _
            ":OtNumNyukingaku," & _
            ":OtNumZandaka," & _
            ":OtStrZandakaYM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '抽出件数を表示する
    'ﾃｰﾌﾞﾙ件数用
    Erase gtblNyukin
    glngTblCnt = 0

    If odbDatabase.Parameters("OtStrEndFlg") = "0" Then
        'Msg = 該当データが存在しません。
        frmQPAV_CEnt020.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        frmQPAV_CEnt020.txtSyainCd.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    If Trim(odbDatabase.Parameters("OtStrZandakaYM")) = "00000000" Then
        ShimeYMD = Format(gdatSysDate, "yyyymmdd")
    Else
        ShimeYMD = odbDatabase.Parameters("OtStrZandakaYM")
    End If
    
    '配列の再定義
    lngMax = odbDatabase.Parameters("OtNumAryCount")
    glngTblCnt = lngMax
    ReDim gtblNyukin(lngMax)

    For i = 1 To glngTblCnt
        '入金年月日
        gtblNyukin(i).YMD = odbDatabase.Parameters("OtStrNyukinYMD").Get_Value(i - 1)
        '入金額
        gtblNyukin(i).Kingaku = odbDatabase.Parameters("OtNumNyukingaku").Get_Value(i - 1)
        '残高
        gtblNyukin(i).Zandaka = odbDatabase.Parameters("OtNumZandaka").Get_Value(i - 1)
    Next i

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt020.sprList.MaxRows = glngTblCnt

    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 1, i, Left(gtblNyukin(i).YMD, 4) & "/" & Mid(gtblNyukin(i).YMD, 5, 2) & "/" & Right(gtblNyukin(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 2, i, Format(gtblNyukin(i).Kingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 3, i, Format(gtblNyukin(i).Zandaka, "#,##0"))
    Next i

    If glngTblCnt > 0 Then
        For i = 1 To 2
            frmQPAV_CEnt020.cmdexec(i).Enabled = True
        Next i
    End If
    
    gfuncSPSet = True
    
    Exit Function

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPChk() As Boolean

    Dim strSQL               As String

On Error GoTo errSPChk
    
    gfuncSPChk = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT      '社員コード
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT     '入金日
    odbDatabase.Parameters("InStrNyukinYMD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '判定フラグ
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatChk (" & _
            ":InStrSyainCD," & _
            ":InStrNyukinYMD," & _
            ":OtStrFlg); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If Trim(odbDatabase.Parameters("OtStrFlg")) = "1" Then
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPChk = True    '成功
    Exit Function
  
errSPChk:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT                     '入金日
    odbDatabase.Parameters.Add "InNumNyukingaku", glngKingaku, ORAPARM_INPUT                '入金額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
''------->【Win2000対応】Del by Yokoyama@NBC 2004/07/05 ------->
''    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatAdd (" & _
''            ":InStrSyainCD,:InStrNyukinYMD,:InNumNyukingaku,:InStrMenuID,:InStrModuleID," & _
''            ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrRiyouKBN,:InStrTantoNM); END;"
''<-------【Win2000対応】Del by Yokoyama@NBC 2004/07/05 <-------
''------->【Win2000対応】Add by Yokoyama@NBC 2004/07/05 ------->
''★部署コードの代わりに東西区分が記録されていたのを修正
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatAdd (" & _
            ":InStrSyainCD,:InStrNyukinYMD,:InNumNyukingaku,:InStrMenuID,:InStrModuleID," & _
            ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"
''<-------【Win2000対応】Add by Yokoyama@NBC 2004/07/05 <-------
    
    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPAdd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPAdd = True    '成功
    Exit Function
  
errSPAdd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPUpd()

    Dim strSQL               As String

On Error GoTo errSPUpd
    
    gfuncSPUpd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrNyukinYMD_O", gstrYMD_B, ORAPARM_INPUT                 '入金日修正前
    odbDatabase.Parameters.Add "InStrNyukinYMD_N", gstrYMD, ORAPARM_INPUT                   '入金日修正後
    odbDatabase.Parameters.Add "InNumNyukingaku", glngKingaku, ORAPARM_INPUT                '入金額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatUpd (" & _
            ":InStrSyainCD,:InStrNyukinYMD_O,:InStrNyukinYMD_N,:InNumNyukingaku:InNumNyukingaku," & _
            ":InStrMenuID,:InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD," & _
            ":InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPUpd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPUpd = True    '成功
    Exit Function
  
errSPUpd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPDel()

    Dim strSQL               As String

On Error GoTo errSPDel
    
    gfuncSPDel = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT                     '入金日
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatDel (" & _
            ":InStrSyainCD,:InStrNyukinYMD,:InstrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPDel
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True    '成功
    Exit Function
  
errSPDel:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncListSet() As Boolean

    Dim strSQL               As String

On Error GoTo errListSet

    gfuncListSet = False
    
    'ＳＰ
    '処理日付
    odbDatabase.Parameters.Add "InStrYMD", Format(gdatSysDate, "yyyymmdd"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '担当者コード
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020List (" & _
            ":InStrYMD," & _
            ":OtNumRecCount," & _
            ":OtStrEndFlg," & _
            ":InStrUserID," & _
            ":InStrComputerNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        MsgBox "本日分の入金データは存在しません。", vbInformation + vbOKOnly, "小口融資入金入力"
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncListSet = True
    
    Exit Function

errListSet:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "020", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 'キーコード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020Lock(" & _
             ":strSikibetu,:InStrKeyInfo1,:strProgramID,:strComputerNM,:strOperatorID); END;"

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
        frmQPAV_CEnt020.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "020", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020UnLock(" _
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
'************************************************************************
'    サーバー日付取得
'************************************************************************
Public Sub gsubGetSysDate()
Dim strSQL               As String

On Error GoTo errGetSysDate
    'ＳＰ
    'システム日付
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_CHAR
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt000PkG.QPAP_CEnt000SysDate(" & _
             ":OtStrSysDate); END;"
    'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)
    gstrSysDate = Trim$(odbDatabase.Parameters("OtStrSysDate"))
    gdatSysDate = CDate(Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2) & "/" & Mid$(gstrSysDate, 7, 2))
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    Exit Sub

errGetSysDate:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub


