Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt220"
    Public Act_Row          As Long
    Public ModeF            As String
    Public gtblSonota()     As SonotaTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCNT          As Long
    Public ArryCNT          As Long
    Public UnlF             As Integer
    
    Type SonotaTbl
       CD                   As String
       NM_N                 As String
       NM_X                 As String
       Riritu               As String
       S_Gendo              As String
       K_Gendo              As String
    End Type
     
Public Sub Main()
'*************************************************************
'   起動　ＭＡＩＮ
'*************************************************************
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "その他マスタメンテナンスは既に起動されています。" _
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

    frmQPAV_CEnt220.Show

End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   その他データ取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

    ArryCNT = 0
    CallCNT = 0

    'ＳＰ
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '共通コード 配列
    odbDatabase.Parameters.AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
    '共通名称Ｎ名称 配列
    odbDatabase.Parameters.AddTable "OtStrNameN", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '共通名称Ｘ名称 配列
    odbDatabase.Parameters.AddTable "OtStrNameX", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    
    '利率 配列
    odbDatabase.Parameters.AddTable "OtStrRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '証書限度額 配列
    odbDatabase.Parameters.AddTable "OtStrSGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '小口限度額 配列
    odbDatabase.Parameters.AddTable "OtStrKGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220SelList (" & _
            ":InNumMaxRec,:OtStrCode,:OtStrNameN,:OtStrNameX,:OtStrRiritu,:OtStrSGendo," & _
            ":OtStrKGendo,:OtNumAryCount,:OtStrEndFlg); END;"

    Do
        '抽出レコードをリストに表示
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        frmQPAV_CEnt220.vaSpread1.MaxRows = 0
        
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblSonota
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt220.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Function
        End If
        
        '配列の再定義
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblSonota(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '共通コード
            gtblSonota(j).CD = Trim(odbDatabase.Parameters("OtStrCode").Get_Value(i))
            '共通名称Ｎ
            gtblSonota(j).NM_N = Trim(odbDatabase.Parameters("OtStrNameN").Get_Value(i))
            '共通名称Ｘ
            gtblSonota(j).NM_X = Trim(odbDatabase.Parameters("OtStrNameX").Get_Value(i))
            '利率
            gtblSonota(j).Riritu = Trim(odbDatabase.Parameters("OtStrRiritu").Get_Value(i))
            '証書限度額
            gtblSonota(j).S_Gendo = Trim(odbDatabase.Parameters("OtStrSGendo").Get_Value(i))
            '小口限度額
            gtblSonota(j).K_Gendo = Trim(odbDatabase.Parameters("OtStrKGendo").Get_Value(i))
            i = i + 1
        Next j
        
        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    frmQPAV_CEnt220.vaSpread1.MaxRows = ArryCNT
    
    'データをＳＰにセットする
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 1, i, gtblSonota(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 2, i, gtblSonota(i).NM_N)
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 3, i, gtblSonota(i).NM_X)
        If Left(gtblSonota(i).Riritu, 1) = "." Then
            Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 4, i, "0" & gtblSonota(i).Riritu & "%")
        Else
            Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 4, i, gtblSonota(i).Riritu & "%")
        End If
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 5, i, Format(gtblSonota(i).S_Gendo, "###,##0"))
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 6, i, Format(gtblSonota(i).K_Gendo, "###,##0"))
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
'   その他データ登録
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    'ＳＰ
    '共通コード
    odbDatabase.Parameters.Add "InStrCode", Trim(frmQPAV_CEnt221.txtKyoutuuCD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
    '共通名称Ｎ
    odbDatabase.Parameters.Add "InStrNameN", Trim(frmQPAV_CEnt221.txtKyoutuNameKanji), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameN").ServerType = ORATYPE_VARCHAR2
    
    '共通名称Ｘ
    odbDatabase.Parameters.Add "InStrNameX", Trim(frmQPAV_CEnt221.txtKyoutuNameKana), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameX").ServerType = ORATYPE_VARCHAR2
    
    '利率
    odbDatabase.Parameters.Add "InStrRiritu", Trim(frmQPAV_CEnt221.txtRiritu1) & "." _
                                & Trim(frmQPAV_CEnt221.txtRiritu2), ORAPARM_INPUT
    odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_NUMBER
       
    '証書限度額
    odbDatabase.Parameters.Add "InStrSGendo", Trim(frmQPAV_CEnt221.txtSyousyoGendogaku), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSGendo").ServerType = ORATYPE_NUMBER
    
    '小口限度額
    odbDatabase.Parameters.Add "InStrKGendo", Trim(frmQPAV_CEnt221.txtKogutiGendogaku), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKGendo").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatAdd (" & _
            ":InStrCode,:InStrNameN,:InStrNameX,:InStrRiritu,:InStrSGendo,:InStrKGendo," & _
            ":InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN," & _
            ":InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt221.lblMsg.Caption = "WPOE02 この共通コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt221.txtKyoutuuCD.BackColor = vbRed
        frmQPAV_CEnt221.txtKyoutuuCD.SetFocus
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
    Dim strSQL      As String
    
On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '共通コード修正前
    odbDatabase.Parameters.Add "InStrCode_B", Trim(gtblSonota(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode_B").ServerType = ORATYPE_CHAR
    
    '共通コード修正後
    odbDatabase.Parameters.Add "InStrCode_A", Trim(frmQPAV_CEnt221.txtKyoutuuCD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode_A").ServerType = ORATYPE_CHAR
    
    '共通名称Ｎ
    odbDatabase.Parameters.Add "InStrNameN", Trim(frmQPAV_CEnt221.txtKyoutuNameKanji), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameN").ServerType = ORATYPE_VARCHAR2
    
    '共通名称Ｘ
    odbDatabase.Parameters.Add "InStrNameX", Trim(frmQPAV_CEnt221.txtKyoutuNameKana), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameX").ServerType = ORATYPE_VARCHAR2
       
    '利率
    odbDatabase.Parameters.Add "InStrRiritu", Trim(frmQPAV_CEnt221.txtRiritu1) & "." _
                                & Trim(frmQPAV_CEnt221.txtRiritu2), ORAPARM_INPUT
    odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_NUMBER
    
    '証書限度額
    odbDatabase.Parameters.Add "InStrSGendo", Format(Trim(frmQPAV_CEnt221.txtSyousyoGendogaku), "######0"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSGendo").ServerType = ORATYPE_NUMBER
    
    '小口限度額
    odbDatabase.Parameters.Add "InStrKGendo", Format(Trim(frmQPAV_CEnt221.txtKogutiGendogaku), "######0"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKGendo").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatUpd (" & _
            ":InStrCode_B,:InStrCode_A,:InStrNameN,:InStrNameX,:InStrRiritu,:InStrSGendo," & _
            ":InStrKGendo,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
            ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt221.lblMsg.Caption = "WPOE02 この共通コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt221.txtKyoutuuCD.BackColor = vbRed
        frmQPAV_CEnt221.txtKyoutuuCD.SetFocus
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
    '共通コード
    odbDatabase.Parameters.Add "InStrCode", frmQPAV_CEnt221.txtKyoutuuCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatDel (" & _
             ":InStrCode,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN," & _
             ":InstrBushoCD,:InstrTantoNM); END;"

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
    
    odbDatabase.Parameters.Add "strSikibetu", "220", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220Lock(" & _
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
        frmQPAV_CEnt220.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "220", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220UnLock(" _
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


