Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt070"
    Public bInit_Flg As Boolean
    Public Actv_flg As Long
    
    Type RirituTbl
       HenkoYMD                 As String
       Riritu                   As Double
    End Type
     
    Public gtblRiritu()         As RirituTbl
    Public glngTblCnt           As Long
    
    Public gstrHenkoYMD_B       As String       '変更年月日修正前
    Public gstrHenkoYMD         As String       '変更年月日
    Public gdblRiritu           As Double       '利率
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "利率変更入力は既に起動されています。" _
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

    frmQPAV_CEnt070.Show 1
 
End Sub

Public Sub gsubSPInit()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit

    Cnt = 0
    
    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt070.sprList)
    For i = 0 To 2
        frmQPAV_CEnt070.cmdExec(i).Enabled = True
    Next i
    
    'ＳＰ
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '処理ｶｳﾝﾄ(IoNumFetchCount
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '変更年月日 配列
    odbDatabase.Parameters.AddTable "OtStrHenkoYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
    '利率 配列
    odbDatabase.Parameters.AddTable "OtNumRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '総検索件数(IoNumRecCount
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
       
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070SelList (" & _
            ":InNumMaxRec," & _
            ":IoNumSpCnt," & _
            ":OtStrHenkoYMD," & _
            ":OtNumRiritu," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg); END;"
    
    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblRiritu
            glngTblCnt = 0
            frmQPAV_CEnt070.cmdExec(0).Enabled = True
        
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblRiritu(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '変更日
            gtblRiritu(i).HenkoYMD = odbDatabase.Parameters("OtStrHenkoYMD").Get_Value(i - 1)
            '利率
            gtblRiritu(i).Riritu = odbDatabase.Parameters("OtNumRiritu").Get_Value(i - 1)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt070.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt070.sprList, 1, i, Left(gtblRiritu(i).HenkoYMD, 4) & "/" & Mid(gtblRiritu(i).HenkoYMD, 5, 2) & "/" & Right(gtblRiritu(i).HenkoYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt070.sprList, 2, i, Format(gtblRiritu(i).Riritu, "#.00") & "%")
    Next i
    
    If glngTblCnt > 0 Then
        For i = 1 To 2
            frmQPAV_CEnt070.cmdExec(i).Enabled = True
        Next i
    End If
    
    Exit Sub

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gfuncSPChk() As Boolean

    Dim strSQL               As String

On Error GoTo errSPChk
    
    gfuncSPChk = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT '変更年月日
    odbDatabase.Parameters("InStrHenkoYMD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '判定フラグ
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatChk (" & _
            ":InStrHenkoYMD," & _
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
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT                 '変更年月日
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                     '利率
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatAdd (" & _
            ":InStrHenkoYMD," & _
            ":InNumRiritu," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

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
    odbDatabase.Parameters.Add "InStrHenkoYMD_B", gstrHenkoYMD_B, ORAPARM_INPUT             '変更年月日修正前
    odbDatabase.Parameters.Add "InStrHenkoYMD_A", gstrHenkoYMD, ORAPARM_INPUT               '変更年月日修正後
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                     '利率
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatUpd (" & _
            ":InStrHenkoYMD_B," & _
            ":InStrHenkoYMD_A," & _
            ":InNumRiritu," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

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
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT                 '変更年月日
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatDel (" & _
            ":InStrHenkoYMD," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

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

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   排他制御（ロック）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "strSikibetu", "070", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070Lock(" & _
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
        frmQPAV_CEnt070.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "070", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070UnLock(" _
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


