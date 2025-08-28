Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt190"
    Public Act_Row          As Long
    Public Mode_FLG         As String
    Public gtblMise()       As MiseTbl
    Public gtblSeisan()     As SeisanTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCnt          As Long
    Public ArryCnt          As Long
    Public SelData(6)       As String
    Public UnlF             As Integer
    
    Type MiseTbl
       CD                   As String
       NM                   As String
       Syoyo1               As String
       Syoyo2               As String
       SeisanCD             As String
       SeisanNM             As String
       TozaiE               As String
       TozaiW               As String
    End Type
 
    Type SeisanTbl
        CD                  As String
        NM                  As String
    End Type
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*******************************************************************************************
'   起動　ＭＡＩＮ
'*******************************************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "店マスタメンテナンスは既に起動されています。" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If
'
    'コマンドライン引数の取得
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "起動パラメータが設定されていません。" _
                , vbExclamation Or vbOKOnly, gcstrPrjName

        Exit Sub
    End If

    'コマンドライン引数を編集する
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt190.Show
    
 
End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   店データ取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False
    
    CallCnt = 0
    ArryCnt = 0
    
     'ＳＰ
     'MaxRec
     odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
     odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
     
     '店コード 配列
     odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
     
     '店名称 配列
     odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
     
     '賞与支給日1 配列
     odbDatabase.Parameters.AddTable "OtStrBonusYMD1", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
     
     '賞与支給日2 配列
     odbDatabase.Parameters.AddTable "OtStrBonusYMD2", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
     
     '精算店コード 配列
     odbDatabase.Parameters.AddTable "OtStrSeisanCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
     
     '精算店名称 配列
     odbDatabase.Parameters.AddTable "OtStrSeisanNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
     
     '東西区分（東） 配列
     odbDatabase.Parameters.AddTable "OtStrTozaiKBNE", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
     
     '東西区分（西） 配列
     odbDatabase.Parameters.AddTable "OtStrTozaiKBNW", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
     
     '配列格納件数
     odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
     odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
     
     '検索終了フラグ
     odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
     odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
     'ＳＱＬ文の作成
     strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190SelList (" & _
             ":InNumMaxRec,:OtStrMiseCD,:OtStrMiseNM,:OtStrBonusYMD1,:OtStrBonusYMD2,:OtStrSeisanCD," & _
             ":OtStrSeisanNM,:OtStrTozaiKBNE,:OtStrTozaiKBNW,:OtNumAryCount,:OtStrEndFlg); END;"
    
     Do
    
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCnt = 0 Then
            Erase gtblMise
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
            frmQPAV_CEnt190.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
        
'        ArryCnt = ArryCnt + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCnt = ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        
        glngTblCnt = ArryCnt
        ReDim Preserve gtblMise(ArryCnt)
    
        i = 0
        For j = CallCnt * 100 + 1 To ArryCnt
            '店コード
            gtblMise(j).CD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '店名称
            gtblMise(j).NM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            '賞与支給日1
            If Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)) = "" Then
                gtblMise(j).Syoyo1 = ""
            Else
                gtblMise(j).Syoyo1 = Left(Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)), 2) & "/" _
                                    & Right(Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)), 2)
            End If
            '賞与支給日2
            If Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)) = "" Then
                gtblMise(j).Syoyo2 = ""
            Else
                gtblMise(j).Syoyo2 = Left(Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)), 2) & "/" _
                                    & Right(Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)), 2)
            End If
            '精算店コード
            gtblMise(j).SeisanCD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            '精算店名称
            gtblMise(j).SeisanNM = odbDatabase.Parameters("OtStrSeisanNM").Get_Value(i)
            '東西区分（東）
            gtblMise(j).TozaiE = odbDatabase.Parameters("OtStrTozaiKBNE").Get_Value(i)
            '東西区分（西）
            gtblMise(j).TozaiW = odbDatabase.Parameters("OtStrTozaiKBNW").Get_Value(i)
        
            i = i + 1
        Next j
    
        '呼び出し回数カウントアップ
        CallCnt = CallCnt + 1
        
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
        
    frmQPAV_CEnt190.vaSpread1.MaxRows = ArryCnt
    
    'データをＳＰにセットする
    For i = 1 To ArryCnt
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 1, i, gtblMise(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 2, i, gtblMise(i).NM)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 3, i, gtblMise(i).Syoyo1)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 4, i, gtblMise(i).Syoyo2)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 5, i, gtblMise(i).SeisanCD)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 6, i, gtblMise(i).SeisanNM)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 7, i, gtblMise(i).TozaiE)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 8, i, gtblMise(i).TozaiW)
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

Public Sub gsubSeisanCD_get()
'*******************************************************************************************
'   精算店コード取得
'*******************************************************************************************
    Dim strSQL      As String
    Dim i           As Long
    Dim j           As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    CallCnt = 0
    ArryCnt = 0
    
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
    
     'ＳＱＬ文の作成
     strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190SeisanCDList (" & _
             ":InNumMaxRec,:OtStrSeisanCD,:OtStrSeisanNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
    
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
            Exit Sub
        End If
        
        '配列の再定義
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

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    'データをコンボにセットする
    frmQPAV_CEnt191.cobSeisantenCD.Clear
    For i = 1 To ArryCnt
        frmQPAV_CEnt191.cobSeisantenCD.AddItem gtblSeisan(i).CD
    Next i

    Exit Sub

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gsubSPAdd() As Boolean
'*******************************************************************************************
'   店データ登録
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '店名称
    odbDatabase.Parameters.Add "InStrMiseNM", Trim(frmQPAV_CEnt191.txtMiseName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseNM").ServerType = ORATYPE_VARCHAR2
    
    '賞与支給日1
    odbDatabase.Parameters.Add "InStrBonusYMD1", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM1.Text) _
                                    & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD1").ServerType = ORATYPE_CHAR
    
    '賞与支給日2
    odbDatabase.Parameters.Add "InStrBonusYMD2", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM2.Text) _
                                    & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD2").ServerType = ORATYPE_CHAR
    
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt191.cobSeisantenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '東西区分（東）
    odbDatabase.Parameters.Add "InStrTozaiKBNE", Trim(frmQPAV_CEnt191.cobTouzaiHigasi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNE").ServerType = ORATYPE_CHAR
    
    '東西区分（西）
    odbDatabase.Parameters.Add "InStrTozaiKBNW", Trim(frmQPAV_CEnt191.cobTouzaiNisi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNW").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatAdd (" & _
            ":InStrMiseCD,:InStrMiseNM,:InStrBonusYMD1,:InStrBonusYMD2,:InStrSeisanCD," & _
            ":InStrTozaiKBNE,:InStrTozaiKBNW,:InstrMenuId,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '店コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE02 この店コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt191.txtMiseCD.BackColor = vbRed
        frmQPAV_CEnt191.txtMiseCD.SetFocus
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
'   店データ 修正
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '店コード修正前
    odbDatabase.Parameters.Add "InStrMiseCD_B", Trim(gtblMise(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD_B").ServerType = ORATYPE_CHAR
    
    '店コード修正後
    odbDatabase.Parameters.Add "InStrMiseCD_A", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD_A").ServerType = ORATYPE_CHAR
    
    '店名称
    odbDatabase.Parameters.Add "InStrMiseNM", Trim(frmQPAV_CEnt191.txtMiseName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseNM").ServerType = ORATYPE_VARCHAR2
    
    '賞与支給日1
    odbDatabase.Parameters.Add "InStrBonusYMD1", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM1.Text) _
                                        & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD1").ServerType = ORATYPE_CHAR
    
    '賞与支給日2
    odbDatabase.Parameters.Add "InStrBonusYMD2", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM2.Text) _
                                        & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD2").ServerType = ORATYPE_CHAR
    
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt191.cobSeisantenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '東西区分東
    odbDatabase.Parameters.Add "InStrTozaiKBNE", Trim(frmQPAV_CEnt191.cobTouzaiHigasi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNE").ServerType = ORATYPE_CHAR
    
    '東西区分西
    odbDatabase.Parameters.Add "InStrTozaiKBNW", Trim(frmQPAV_CEnt191.cobTouzaiNisi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNW").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatUpd (" & _
            ":InStrMiseCD_B,:InStrMiseCD_A,:InStrMiseNM,:InStrBonusYMD1,:InStrBonusYMD2," & _
            ":InStrSeisanCD,:InStrTozaiKBNE,:InStrTozaiKBNW,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '店コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE02 この店コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt191.txtMiseCD.BackColor = vbRed
        frmQPAV_CEnt191.txtMiseCD.SetFocus
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
'   店データ 削除
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
        
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
    odbDatabase.Parameters.Add "OtStrMiseF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatDel (" & _
            ":InStrMiseCD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
            ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrMiseF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '精算店コードが店マスタに登録されている時は削除できない
    If Trim(odbDatabase.Parameters("OtStrMiseF")) = "1" Then
        'Msg = この店コードは削除できません。
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE26 " & gstrGetCodeMeisyo(odbDatabase, "E26", "WPO")
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
    
    odbDatabase.Parameters.Add "strSikibetu", "190", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190Lock(" & _
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
        frmQPAV_CEnt190.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "190", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190UnLock(" _
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


