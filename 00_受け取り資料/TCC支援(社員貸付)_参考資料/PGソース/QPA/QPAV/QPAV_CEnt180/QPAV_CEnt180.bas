Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt180"
    Public Act_Row          As Long
    Public ModeF            As String
    Public gtblSeisan()     As SeisanTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCnt          As Long
    Public ArryCnt          As Long
    Public UnlF             As Integer
    
    Type SeisanTbl
        CD                  As String
        NM                  As String
    End Type
 
'*****************************************************************************************
'    起動　ＭＡＩＮ
'*****************************************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "精算店マスタメンテナンスは既に起動されています。" _
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

    frmQPAV_CEnt180.Show
    
End Sub

Public Function gsubSPInit() As Boolean
'*****************************************************************************************
'    精算店データ取得
'*****************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    
    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False
    
    ArryCnt = 0
    CallCnt = 0
    
    'ＳＰ
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER

    '精算店コード 配列
    odbDatabase.Parameters.AddTable "OtStrSeisanCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '精算店名称 配列
    odbDatabase.Parameters.AddTable "OtStrSeisanNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180SelList (" & _
            ":InNumMaxRec,:OtStrSeisanCD,:OtStrSeisanNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
      '抽出レコードをリストに表示
    
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCnt = 0 Then
            Erase gtblSeisan
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '配列の再定義
'        If ArryCnt + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        If ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt180.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
'        ArryCnt = ArryCnt + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCnt = ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCnt
        
        ReDim Preserve gtblSeisan(ArryCnt)
    
        i = 0
        For j = CallCnt * 100 + 1 To ArryCnt
            '精算店コード
            gtblSeisan(j).CD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            '精算店名称
            gtblSeisan(j).NM = odbDatabase.Parameters("OtStrSeisanNM").Get_Value(i)
            
            i = i + 1
        Next j
    
        '呼び出し回数カウントアップ
        CallCnt = CallCnt + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    frmQPAV_CEnt180.vaSpread1.MaxRows = ArryCnt
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
        
    'データをＳＰにセットする
    Call gsubSpdClear(frmQPAV_CEnt180.vaSpread1)
    For i = 1 To ArryCnt
        Call gsubSetCellText(frmQPAV_CEnt180.vaSpread1, 1, i, gtblSeisan(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt180.vaSpread1, 2, i, gtblSeisan(i).NM)
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
'*****************************************************************************************
'   精算店データ登録
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    'ＳＰ
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '精算店名称
    odbDatabase.Parameters.Add "InStrSeisanNM", Trim(frmQPAV_CEnt181.txtSeisanntennName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanNM").ServerType = ORATYPE_VARCHAR2
    
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
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatAdd (" & _
            ":InStrSeisanCD,:InStrSeisanNM,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '登録時に精算店コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE02 この精算店コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt181.txtSeisanntenn.BackColor = vbRed
        frmQPAV_CEnt181.txtSeisanntenn.SetFocus
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
'*****************************************************************************************
'   精算店データ 修正
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '精算店コード修正前
    odbDatabase.Parameters.Add "InStrSeisanCD_B", Trim(gtblSeisan(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD_B").ServerType = ORATYPE_CHAR
    
    '精算店コード修正後
    odbDatabase.Parameters.Add "InStrSeisanCD_A", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD_A").ServerType = ORATYPE_CHAR
    
    '精算店名称
    odbDatabase.Parameters.Add "InStrSeisanNM", Trim(frmQPAV_CEnt181.txtSeisanntennName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanNM").ServerType = ORATYPE_VARCHAR2
    
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
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatUpd (" & _
            ":InStrSeisanCD_B,:InStrSeisanCD_A,:InStrSeisanNM,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '修正時に精算店コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE02 この精算店コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt181.txtSeisanntenn.BackColor = vbRed
        frmQPAV_CEnt181.txtSeisanntenn.SetFocus
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
'*****************************************************************************************
'    精算店データ 削除
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    'ＳＰ
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
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
    
    '可・不可フラグ
    odbDatabase.Parameters.Add "OtStrSeisanF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSeisanF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatDel (" & _
             ":InStrSeisanCD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
             ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrSeisanF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '精算店コードが店マスタに登録されている時は削除できない
    If Trim(odbDatabase.Parameters("OtStrSeisanF")) = "1" Then
        'Msg = この精算店コードは削除できません。
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE25 " & gstrGetCodeMeisyo(odbDatabase, "E25", "WPO")
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
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
    
    odbDatabase.Parameters.Add "strSikibetu", "180", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180Lock(" & _
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
        frmQPAV_CEnt180.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "180", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180UnLock(" _
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


