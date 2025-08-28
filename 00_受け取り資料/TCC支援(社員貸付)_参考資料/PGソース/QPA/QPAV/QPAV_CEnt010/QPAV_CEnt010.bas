Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt010"
    Public bInit_Flg        As Boolean
    Public Act_Row          As Long
    Public gstrCode         As String
    Public gstrNewFlg       As String
    Public gstrKeiyakuYMD   As String
    Public glngGendogaku    As Long
    Public glngKyuyoH       As Long
    Public glngSyoyoH       As Long
    Public gstrHenkoYM      As String
    Public gstrHenkoYM_B    As String
    Public glngKyuyo        As Long
    Public glngSyoyo        As Long

    Type HenkoTbl
       HenkoYM      As String
       Kyuyo        As Long
       Syoyo        As Long
    End Type
 
    Public gtblHenko()      As HenkoTbl
    Public glngTblCnt       As Long
    Public ShimeYMD         As String
 
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "小口融資台帳は既に起動されています。" _
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

    frmQPAV_CEnt010.Show 1
 
End Sub

Public Function gfuncDaicyoSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long

On Error GoTo errDaicyoSet
    gfuncDaicyoSet = False

    'ＳＰ
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR

    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '氏名カナ
    odbDatabase.Parameters.Add "OtStrSimeKn", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeKn").ServerType = ORATYPE_VARCHAR2
   
    '氏名漢字
    odbDatabase.Parameters.Add "OtStrSimeKj", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeKj").ServerType = ORATYPE_VARCHAR2
   
    '店コード
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
   
    '店名
    odbDatabase.Parameters.Add "OtStrMiseNM", Space(24), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseNM").ServerType = ORATYPE_VARCHAR2
   
    '東西区分
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
   
    '部門コード
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
   
    '部門名
    odbDatabase.Parameters.Add "OtStrBumonNM", Space(24), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonNM").ServerType = ORATYPE_VARCHAR2
   
    '資格コード
    odbDatabase.Parameters.Add "OtStrSIKAKUCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSIKAKUCD").ServerType = ORATYPE_CHAR
   
    '等級コード
    odbDatabase.Parameters.Add "OtStrTOKYUCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTOKYUCD").ServerType = ORATYPE_CHAR
   
    '限度額
    odbDatabase.Parameters.Add "OtNumGendo", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGendo").ServerType = ORATYPE_NUMBER

    '残高
    odbDatabase.Parameters.Add "OtNumZandaka", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZandaka").ServerType = ORATYPE_NUMBER

    '新規フラグ
    odbDatabase.Parameters.Add "OtStrNewFLG", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrNewFLG").ServerType = ORATYPE_CHAR
      
    '残高日
    odbDatabase.Parameters.Add "OtStrZandakaYM", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZandakaYM").ServerType = ORATYPE_CHAR
      
    '小口データ存在フラグ　　2002/07/23  追加
    odbDatabase.Parameters.Add "OtStrKogutiUmu", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKogutiUmu").ServerType = ORATYPE_CHAR
      
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010SelList (" & _
            ":InStrSyainCD," & _
            ":OtStrEndFlg," & _
            ":OtStrSimeKn," & _
            ":OtStrSimeKj," & _
            ":OtStrMiseCD," & _
            ":OtStrMiseNM," & _
            ":OtStrTozaiKBN," & _
            ":OtStrBumonCD," & _
            ":OtStrBumonNM," & _
            ":OtStrSIKAKUCD," & _
            ":OtStrTOKYUCD," & _
            ":OtNumGendo," & _
            ":OtNumZandaka," & _
            ":OtStrNewFLG," & _
            ":OtStrZandakaYM," & _
            ":OtStrKogutiUmu); END;"


    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtStrEndFlg") = "0" Then
        'Msg = 社員属性が存在しません。
        frmQPAV_CEnt010.lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        frmQPAV_CEnt010.txtSyainCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '抽出した内容を表示する
    frmQPAV_CEnt010.lblKojinmeiKana.Caption = odbDatabase.Parameters("OtStrSimeKn")                 '個人名カナ
    frmQPAV_CEnt010.lblKojinmeiKanji.Caption = odbDatabase.Parameters("OtStrSimeKj")                '個人名漢字
    frmQPAV_CEnt010.lblSyozokutenCD.Caption = odbDatabase.Parameters("OtStrMiseCD")                 '店コード
    frmQPAV_CEnt010.lblSyozokuten.Caption = odbDatabase.Parameters("OtStrMiseNM")                   '店名
    frmQPAV_CEnt010.lblTouzai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")                     '東西区分
    frmQPAV_CEnt010.lblSyozokubumCD.Caption = odbDatabase.Parameters("OtStrBumonCD")                '部門コード
    frmQPAV_CEnt010.lblSyozokubum.Caption = odbDatabase.Parameters("OtStrBumonNM")                  '部門名
    frmQPAV_CEnt010.lblSikakuCD.Caption = odbDatabase.Parameters("OtStrSIKAKUCD")                   '資格コード
    frmQPAV_CEnt010.lblToukyuuCD.Caption = odbDatabase.Parameters("OtStrTOKYUCD")                   '等級コード
    
    'frmQPAV_CEnt010.txtGendogaku.Text = Format(odbDatabase.Parameters("OtNumGendo"), "#,##0")          '限度額 '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
    frmQPAV_CEnt010.txtGendogaku.Text = Format(CStr(odbDatabase.Parameters("OtNumGendo")), "#,##0")     '限度額 '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
    'frmQPAV_CEnt010.lblZandaka.Caption = Format(odbDatabase.Parameters("OtNumZandaka"), "#,##0")       '残高   '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
    frmQPAV_CEnt010.lblZandaka.Caption = Format(CStr(odbDatabase.Parameters("OtNumZandaka")), "#,##0")  '残高   '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
    
    gstrNewFlg = Trim(odbDatabase.Parameters("OtStrNewFLG"))                                        '新規フラグ
    If Trim(odbDatabase.Parameters("OtStrZandakaYM")) = "00000000" Then
        'ShimeYMD = Format(Now, "yyyymmdd")
        ShimeYMD = Format(gdatSysDate, "yyyymmdd")
    Else
        ShimeYMD = odbDatabase.Parameters("OtStrZandakaYM")
    End If
    
    '小口データ存在チェック　2002/07/23  追加
    If Trim$(odbDatabase.Parameters("OtStrKogutiUmu")) = "0" Then
        MsgBox """登録／更新""ボタンを押下し" & vbCrLf & "小口融資台帳の登録を行ってください。", vbInformation, "社員小口台帳"
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoSet = True
    
    Exit Function

errDaicyoSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Sub gsubHensaiSet()
    
    Dim strSQL               As String
    Dim i                    As Long

    Dim lngMax               As Long  '

    Const cnsMaxRec As Long = 100

On Error GoTo errHensaiSet

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt010.sprList)
    frmQPAV_CEnt010.sprList.MaxRows = 0
    For i = 0 To 2
        frmQPAV_CEnt010.cmd_Exec(i).Enabled = False
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
   
    '変更年月 配列
    odbDatabase.Parameters.AddTable "OtStrHenkoYM", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '給与返済額 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与返済額 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg," & _
            ":OtStrHenkoYM," & _
            ":OtNumKyuyo," & _
            ":OtNumSyoyo); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '抽出件数を表示する
    'ﾃｰﾌﾞﾙ件数用
    Erase gtblHenko
    glngTblCnt = 0
    
    If odbDatabase.Parameters("OtNumAryCount") = 0 Then
        frmQPAV_CEnt010.lblKyuuyoHensai.Caption = "10,000"
        frmQPAV_CEnt010.lblSyouyoHensai.Caption = "40,000"
        Call gsubParaRemove(odbDatabase)
        Exit Sub
    End If
    
    '配列の再定義
    lngMax = odbDatabase.Parameters("OtNumAryCount")
    glngTblCnt = lngMax
    ReDim gtblHenko(lngMax)

    For i = 1 To glngTblCnt
        '変更年月
        gtblHenko(i).HenkoYM = odbDatabase.Parameters("OtStrHenkoYM").Get_Value(i - 1)
        '給与返済額
        gtblHenko(i).Kyuyo = odbDatabase.Parameters("OtNumKyuyo").Get_Value(i - 1)
        '賞与返済額
        gtblHenko(i).Syoyo = odbDatabase.Parameters("OtNumSyoyo").Get_Value(i - 1)
    Next i

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt010.sprList.ReDraw = False
    frmQPAV_CEnt010.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 1, i, Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2))
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 2, i, Format(gtblHenko(i).Kyuyo, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 3, i, Format(gtblHenko(i).Syoyo, "#,##0"))
    Next i
    frmQPAV_CEnt010.sprList.ReDraw = True
    
    frmQPAV_CEnt010.lblKyuuyoHensai.Caption = "10,000"
    frmQPAV_CEnt010.lblSyouyoHensai.Caption = "40,000"
    For i = 1 To glngTblCnt
        'If DateDiff("y", Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2) & "/01", Now) >= 0 Then
        If DateDiff("y", Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2) & "/01", gdatSysDate) >= 0 Then
            frmQPAV_CEnt010.lblKyuuyoHensai.Caption = Format(gtblHenko(i).Kyuyo, "#,##0")
            frmQPAV_CEnt010.lblSyouyoHensai.Caption = Format(gtblHenko(i).Syoyo, "#,##0")
            Exit For ''''2002/03/06追加  ラベル：給与返済、賞与返済最新表示
        End If
    Next i
    
    For i = 1 To 2
        frmQPAV_CEnt010.cmd_Exec(i).Enabled = True
    Next i
    
    Exit Sub

errHensaiSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gfuncHenkoChk() As Boolean

    Dim strSQL               As String

On Error GoTo errHenkoChk
    
    gfuncHenkoChk = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT      '社員コード
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT   '変更年月
    odbDatabase.Parameters("InStrHenkoYM").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '判定フラグ
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatChk (" & _
            ":InStrSyainCD," & _
            ":InStrHenkoYM," & _
            ":OtStrFlg); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If Trim(odbDatabase.Parameters("OtStrFlg")) = "1" Then
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoChk = True    '成功
    Exit Function
  
errHenkoChk:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncDaicyoAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errDaicyoAdd
    
    gfuncDaicyoAdd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrKeiyakuYMD", gstrKeiyakuYMD, ORAPARM_INPUT             '契約年月日
    odbDatabase.Parameters.Add "InNumGendogaku", glngGendogaku, ORAPARM_INPUT               '限度額
    odbDatabase.Parameters.Add "InNumKyuyoHensai", glngKyuyoH, ORAPARM_INPUT                '給与返済額
    odbDatabase.Parameters.Add "InNumSyoyoHensai", glngSyoyoH, ORAPARM_INPUT                '賞与返済額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010DatAdd (" & _
            ":InStrSyainCD,:InStrKeiyakuYMD,:InNumGendogaku,:InNumKyuyoHensai,:InNumSyoyoHensai," & _
            ":InStrMenuID,:InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD," & _
            ":InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDaicyoAdd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoAdd = True    '成功
    Exit Function
  
errDaicyoAdd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncDaicyoUpd()

    Dim strSQL               As String

On Error GoTo errDaicyoUpd
    
    gfuncDaicyoUpd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InNumGendogaku", glngGendogaku, ORAPARM_INPUT               '限度額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010DatUpd (" & _
            ":InStrSyainCD,:InNumGendogaku,:InStrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDaicyoUpd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoUpd = True    '成功
    Exit Function
  
errDaicyoUpd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errHenkoAdd
    
    gfuncHenkoAdd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT                   '変更年月
    odbDatabase.Parameters.Add "InNumKyuyo", glngKyuyo, ORAPARM_INPUT                       '給与返済額
    odbDatabase.Parameters.Add "InNumSyoyo", glngSyoyo, ORAPARM_INPUT                       '賞与返済額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatAdd (" & _
            ":InStrSyainCD,:InStrHenkoYM,:InNumKyuyo,:InNumSyoyo,:InStrMenuID," & _
            ":InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN," & _
            ":InStrBushoCD,:InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoAdd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoAdd = True    '成功
    Exit Function
  
errHenkoAdd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoUpd()

    Dim strSQL               As String

On Error GoTo errHenkoUpd
    
    gfuncHenkoUpd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrHenkoYM_O", gstrHenkoYM_B, ORAPARM_INPUT               '変更年月修正前
    odbDatabase.Parameters.Add "InStrHenkoYM_N", gstrHenkoYM, ORAPARM_INPUT                 '変更年月修正後
    odbDatabase.Parameters.Add "InNumKyuyo", glngKyuyo, ORAPARM_INPUT                       '給与返済額
    odbDatabase.Parameters.Add "InNumSyoyo", glngSyoyo, ORAPARM_INPUT                       '賞与返済額
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatUpd (" & _
            ":InStrSyainCD,:InStrHenkoYM_O,:InStrHenkoYM_N,:InNumKyuyo,:InNumSyoyo,:InStrMenuID," & _
            ":InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoUpd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoUpd = True    '成功
    Exit Function
  
errHenkoUpd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoDel()

    Dim strSQL               As String

On Error GoTo errHenkoDel
    
    gfuncHenkoDel = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '社員コード
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT                   '変更年月
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatDel (" & _
            ":InStrSyainCD,:InStrHenkoYM,:InStrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoDel
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoDel = True    '成功
    Exit Function
  
errHenkoDel:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "010", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 'キーコード（社員コード)
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010Lock(" & _
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
        frmQPAV_CEnt010.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "010", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010UnLock(" _
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


