Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt200"
    Public Act_Row      As Long
    Public bInit_Flg    As Boolean
    Public ModeF        As String
    Public gtblBumon()  As BumonTbl
    Public gtblMise()   As MiseTbl
    Public glngTblCnt   As Long
    Public CallCNT      As Long
    Public ArryCNT      As Long
    Public UnlF         As Integer
    
    Type BumonTbl
       CD   As String
       NM   As String
    End Type
     
    Type MiseTbl
       CD   As String
       NM   As String
    End Type
    
'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "部門マスタメンテナンスは既に起動されています。" _
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

    bInit_Flg = True
    frmQPAV_CEnt200.Show
    
 
End Sub

Public Function gsubMiseCD_get() As Boolean
'*******************************************************************************************
'   店コード取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    
    gsubMiseCD_get = False
    
    CallCNT = 0
    ArryCNT = 0
    
    'ＳＰ
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '店コード 配列
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '店名称 配列
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER

    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200MiseCDList (" & _
            ":InNumMaxRec,:OtStrMiseCD,:OtStrMiseNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
        '抽出レコードをリストに表示
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblMise
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '配列の再定義
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblMise(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '部門コード
            gtblMise(j).CD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '部門名称
            gtblMise(j).NM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            i = i + 1
        Next j
    
        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    'データをコンボにセットする
    frmQPAV_CEnt200.cobMiseCD.Clear
    For i = 1 To ArryCNT
        frmQPAV_CEnt200.cobMiseCD.AddItem gtblMise(i).CD
    Next i
    frmQPAV_CEnt200.cobMiseCD.ListIndex = -1
    
    gsubMiseCD_get = True

    Exit Function

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   部門データ取得
'*******************************************************************************************
    Dim strSQL              As String
    Dim i                   As Long
    Dim j                   As Long
    Dim SpCnt               As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

    CallCNT = 0
    ArryCNT = 0
    
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt200.cobMiseCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'ストアド呼び出し回数
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '部門コード 配列
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6

    '部門名称 配列
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER

    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200SelList (" & _
            ":InStrMiseCD,:InNumMaxRec,:IoNumSpCnt,:OtStrBumonCD,:OtStrBumonNM,:OtNumAryCount," & _
            ":OtStrEndFlg); END;"
    
        '抽出レコードをリストに表示
    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblBumon
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '配列の再定義
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt200.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
        
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblBumon(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '部門コード
            gtblBumon(j).CD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(i)
            '部門名称
            gtblBumon(j).NM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(i)
            i = i + 1
        Next j
        
        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    frmQPAV_CEnt200.vaSpread1.MaxRows = ArryCNT
    
    'データをＳＰにセットする
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt200.vaSpread1, 1, i, gtblBumon(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt200.vaSpread1, 2, i, gtblBumon(i).NM)
    Next i
    
    gsubSPInit = True
    Exit Function

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPAdd() As Boolean
'*******************************************************************************************
'   部門データ登録
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '部門コード
    odbDatabase.Parameters.Add "InStrBumonCD", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    '部門名称
    odbDatabase.Parameters.Add "InStrBumonNM", frmQPAV_CEnt201.txtBumonMeisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNM").ServerType = ORATYPE_VARCHAR2
    
    'メニューID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    'プログラムID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    'ユーザID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '部署コード
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '担当者名
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
    
    '重複フラグ
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatAdd (" & _
            ":InStrMiseCD,:InStrBumonCD,:InStrBumonNM,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt201.lblMsg.Caption = "WPOE02 この部門コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt201.txtBumonCD.BackColor = vbRed
        frmQPAV_CEnt201.txtBumonCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    gsubSPAdd = True
    
    Exit Function
    
errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPUpd() As Boolean
'*******************************************************************************************
'   部門データ 修正
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '部門コード修正前
    odbDatabase.Parameters.Add "InStrBumonCD_B", gtblBumon(Act_Row).CD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD_B").ServerType = ORATYPE_CHAR
    
    '部門コード修正後
    odbDatabase.Parameters.Add "InStrBumonCD_A", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD_A").ServerType = ORATYPE_CHAR
    
    '部門名称
    odbDatabase.Parameters.Add "InStrBumonNM", frmQPAV_CEnt201.txtBumonMeisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNM").ServerType = ORATYPE_VARCHAR2
       
    'メニューID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    'プログラムID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    'ユーザID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '部署コード
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '担当者名
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT

    '重複フラグ
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatUpd (" & _
            ":InStrMiseCD,:InStrBumonCD_B,:InStrBumonCD_A,:InStrBumonNM,:InstrMenuID," & _
            ":InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD," & _
            ":InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt201.lblMsg.Caption = "WPOE02 この部門コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt201.txtBumonCD.BackColor = vbRed
        frmQPAV_CEnt201.txtBumonCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gsubSPUpd = True
    Exit Function

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPDel() As Boolean
'*******************************************************************************************
'   部門データ 削除
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '部門コード
    odbDatabase.Parameters.Add "InStrBumonCD", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    'メニューID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    'プログラムID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    'ユーザID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '部署コード
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '担当者名
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatDel (" & _
             ":InStrMiseCD,:InStrBumonCD,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
             ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
   
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    gsubSPDel = True
    Exit Function

errSPInit:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "200", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200Lock(" & _
             ":strSikibetu,:strProgramID,:strComputerNM,:strOperatorID); END;"

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
        frmQPAV_CEnt200.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
        odbDatabase.LastServerErrReset                      'ｴﾗｰﾘｾｯﾄ
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

    odbDatabase.Parameters.Add "strSikibetu", "200", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200UnLock(" _
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


