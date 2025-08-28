Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt210"
    Public Act_Row      As Long
    Public bInit_Flg    As Boolean
    Public ModeF        As String
    Public gtblSyain()  As SyainTbl
    Public gtblMise()   As MiseTbl
    Public gtblBumon()  As BumonTbl
    Public gtblSeisan() As SeisanTbl
    Public glngTblCnt   As Long
    Public CallCNT      As Long
    Public ArryCNT      As Long
    Public SelData(13)  As String
    Public UnlF         As Integer
    
    Type SyainTbl
       SyainCD1         As String
       SyainCD2         As String
       SimeiKana        As String
       SimeiKanji       As String
       MiseCD           As String
       MiseNM           As String
       TozaiKBN         As String
       BumonCD          As String
       BumonNM          As String
       SeisanCD         As String
       Sikaku           As String
       Tokyu            As String
       BornYMD          As String
       TaisyokuYMD      As String
       KyusyokuStYMD    As String
       KyusyokuEdYMD    As String
    End Type
     
    Type MiseTbl
       CD               As String
       NM               As String
    End Type
    
    Type SeisanTbl
       CD               As String
       NM               As String
    End Type
    
    Type BumonTbl
       CD               As String
       NM               As String
    End Type
    
Public Sub Main()
'*******************************************************************************************
'   起動　ＭＡＩＮ
'*******************************************************************************************
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "社員マスタメンテナンスは既に起動されています。" _
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

    frmQPAV_CEnt210.Show
    
End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   社員データ取得
'*******************************************************************************************
    Dim strSQL       As String
    Dim i            As Long
    Dim j            As Long
    Dim lngMax       As Long

    Const cnsMaxRec  As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

    CallCNT = 0
    ArryCNT = 0
    
    'ＳＰ
    '社員コード2入力フラグ
    If Trim(frmQPAV_CEnt210.txtSyainCD.Text) = "" Then
        odbDatabase.Parameters.Add "InStrSyainCDF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrSyainCDF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrSyainCDF").ServerType = ORATYPE_CHAR

    '所属店コード入力フラグ
    If Trim(frmQPAV_CEnt210.txtMiseCD.Text) = "" Then
        odbDatabase.Parameters.Add "InStrMiseCDF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrMiseCDF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrMiseCDF").ServerType = ORATYPE_CHAR

    '所属部門コード入力フラグ
    If Trim(frmQPAV_CEnt210.txtBumonCD.Text) = "" Then
        odbDatabase.Parameters.Add "InStrBumonCDF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrBumonCDF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrBumonCDF").ServerType = ORATYPE_CHAR

    '精算店コード入力フラグ
    If Trim(frmQPAV_CEnt210.txtSeisanCD.Text) = "" Then
        odbDatabase.Parameters.Add "InStrSeisanCDF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrSeisanCDF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrSeisanCDF").ServerType = ORATYPE_CHAR

    '退/休区分入力フラグ
    If Trim(frmQPAV_CEnt210.cboTaikyuKBN.ListIndex) = -1 Then
        odbDatabase.Parameters.Add "InStrTaiKyuKBNF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrTaiKyuKBNF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrTaiKyuKBNF").ServerType = ORATYPE_CHAR
    
    '社員コード2
    odbDatabase.Parameters.Add "InStrSyainCD2", Trim(frmQPAV_CEnt210.txtSyainCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    
    '所属店コード
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt210.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '所属部門コード
    odbDatabase.Parameters.Add "InStrBumonCD", Trim(frmQPAV_CEnt210.txtBumonCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt210.txtSeisanCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '退/休区分
    odbDatabase.Parameters.Add "InStrTaiKyuKBN", Trim(frmQPAV_CEnt210.cboTaikyuKBN.ListIndex), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaiKyuKBN").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'ストアド呼び出し回数
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '社員コード1 配列
    odbDatabase.Parameters.AddTable "OtStrSyainCD1", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
    
    '社員コード2 配列
    odbDatabase.Parameters.AddTable "OtStrSyainCD2", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '氏名カナ 配列
    odbDatabase.Parameters.AddTable "OtStrSimeiKana", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 15
    
    '氏名漢字 配列
    odbDatabase.Parameters.AddTable "OtStrSimeiKanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    
    '所属店コード 配列
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '所属名称 配列
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '東西区分 配列
    odbDatabase.Parameters.AddTable "OtStrTozaiKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
    
    '所属部門コード 配列
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '所属部門名称 配列
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '精算店コード 配列
    odbDatabase.Parameters.AddTable "OtStrSeisanCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '資格コード 配列
    odbDatabase.Parameters.AddTable "OtStrSikakuCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 2
    
    '等級コード 配列
    odbDatabase.Parameters.AddTable "OtStrTokyuCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 2
    
    '生年月日 配列
    odbDatabase.Parameters.AddTable "OtStrBornYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '退職年月日 配列
    odbDatabase.Parameters.AddTable "OtStrTaisyokuYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '休職年月開始日 配列
    odbDatabase.Parameters.AddTable "OtStrKyusyoStYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '休職終了年月日 配列
    odbDatabase.Parameters.AddTable "OtStrKyusyoEdYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210SelList (" & _
            ":InStrSyainCDF,:InStrMiseCDF,:InStrBumonCDF,:InStrSeisanCDF,:InStrTaiKyuKBNF,:InStrSyainCD2," & _
            ":InStrMiseCD,:InStrBumonCD,:InStrSeisanCD,:InStrTaiKyuKBN,:InNumMaxRec,:IoNumSpCnt,:OtStrSyainCD1," & _
            ":OtStrSyainCD2,:OtStrSimeiKana,:OtStrSimeiKanji,:OtStrMiseCD,:OtStrMiseNM,:OtStrTozaiKBN," & _
            ":OtStrBumonCD,:OtStrBumonNM,:OtStrSeisanCD,:OtStrSikakuCD,:OtStrTokyuCD,:OtStrBornYMD," & _
            ":OtStrTaisyokuYMD,:OtStrKyusyoStYMD,:OtStrKyusyoEdYMD,:OtNumAryCount,:OtStrEndFlg); END;"

    '抽出レコードをリストに表示

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        frmQPAV_CEnt210.vaSpread1.MaxRows = 0
        
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblSyain
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '配列の再定義
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") >= 1000 Then      '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) >= 1000 Then '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt210.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
        
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")            '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))       '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblSyain(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            gtblSyain(j).SyainCD1 = odbDatabase.Parameters("OtStrSyainCD1").Get_Value(i)
            gtblSyain(j).SyainCD2 = odbDatabase.Parameters("OtStrSyainCD2").Get_Value(i)
            gtblSyain(j).SimeiKana = odbDatabase.Parameters("OtStrSimeiKana").Get_Value(i)
            gtblSyain(j).SimeiKanji = odbDatabase.Parameters("OtStrSimeiKanji").Get_Value(i)
            gtblSyain(j).MiseCD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            gtblSyain(j).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            gtblSyain(j).TozaiKBN = odbDatabase.Parameters("OtStrTozaiKBN").Get_Value(i)
            gtblSyain(j).BumonCD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(i)
            gtblSyain(j).BumonNM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(i)
            gtblSyain(j).SeisanCD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            gtblSyain(j).Sikaku = odbDatabase.Parameters("OtStrSikakuCD").Get_Value(i)
            gtblSyain(j).Tokyu = odbDatabase.Parameters("OtStrTokyuCD").Get_Value(i)
            gtblSyain(j).BornYMD = odbDatabase.Parameters("OtStrBornYMD").Get_Value(i)
            gtblSyain(j).TaisyokuYMD = odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i)
            gtblSyain(j).KyusyokuStYMD = odbDatabase.Parameters("OtStrKyusyoStYMD").Get_Value(i)
            gtblSyain(j).KyusyokuEdYMD = odbDatabase.Parameters("OtStrKyusyoEdYMD").Get_Value(i)
            i = i + 1
        Next j
    
        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    frmQPAV_CEnt210.vaSpread1.MaxRows = ArryCNT
    
    'データをＳＰにセットする
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 1, i, gtblSyain(i).SyainCD1)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 2, i, gtblSyain(i).SyainCD2)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 3, i, gtblSyain(i).SimeiKana)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 4, i, gtblSyain(i).SimeiKanji)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 5, i, gtblSyain(i).MiseCD)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 6, i, gtblSyain(i).MiseNM)
        If gtblSyain(i).TozaiKBN = "0" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 7, i, "")
        ElseIf gtblSyain(i).TozaiKBN = "1" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 7, i, "東")
        Else
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 7, i, "西")
        End If
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 8, i, gtblSyain(i).BumonCD)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 9, i, gtblSyain(i).BumonNM)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 10, i, gtblSyain(i).SeisanCD)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 11, i, gtblSyain(i).Sikaku)
        Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 12, i, gtblSyain(i).Tokyu)
        If Trim(gtblSyain(i).BornYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 13, i, Left(gtblSyain(i).BornYMD, 4) & "/" & _
                                Mid(gtblSyain(i).BornYMD, 5, 2) & "/" & Right(gtblSyain(i).BornYMD, 2))
        End If
        If Trim(gtblSyain(i).TaisyokuYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 14, i, Left(gtblSyain(i).TaisyokuYMD, 4) & "/" & _
                                Mid(gtblSyain(i).TaisyokuYMD, 5, 2) & "/" & Right(gtblSyain(i).TaisyokuYMD, 2))
        End If
        If Trim(gtblSyain(i).KyusyokuStYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 15, i, Left(gtblSyain(i).KyusyokuStYMD, 4) & "/" & _
                                Mid(gtblSyain(i).KyusyokuStYMD, 5, 2) & "/" & Right(gtblSyain(i).KyusyokuStYMD, 2))
        End If
        If Trim(gtblSyain(i).KyusyokuEdYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt210.vaSpread1, 16, i, Left(gtblSyain(i).KyusyokuEdYMD, 4) & "/" & _
                                Mid(gtblSyain(i).KyusyokuEdYMD, 5, 2) & "/" & Right(gtblSyain(i).KyusyokuEdYMD, 2))
        End If
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

Public Sub gsubMiseCD_get()
'*******************************************************************************************
'   店コード取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
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
    
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210MiseList (" & _
            ":InNumMaxRec,:OtStrMiseCD,:OtStrMiseNM,:OtNumAryCount,:OtStrEndFlg); END;"

    '抽出レコードをリストに表示

    Do
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
            Exit Sub
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
    frmQPAV_CEnt211.cobSyozokutenCD.Clear
    For i = 1 To ArryCNT
        frmQPAV_CEnt211.cobSyozokutenCD.AddItem gtblMise(i).CD
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

Public Sub gsubSeisanCD_get()
'*******************************************************************************************
'   精算店コード取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    CallCNT = 0
    ArryCNT = 0
    
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
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210SeisanList (" & _
            ":InNumMaxRec,:OtStrSeisanCD,:OtStrSeisanNM,:OtNumAryCount,:OtStrEndFlg); END;"

    '抽出レコードをリストに表示

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblSeisan
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Sub
        End If
        
        '配列の再定義
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblSeisan(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '部門コード
            gtblSeisan(j).CD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            '部門名称
            gtblSeisan(j).NM = odbDatabase.Parameters("OtStrSeisanNM").Get_Value(i)
            i = i + 1
        Next j

        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    'データをコンボにセットする
    frmQPAV_CEnt211.cboSeisanCD.Clear
    For i = 1 To ArryCNT
        frmQPAV_CEnt211.cboSeisanCD.AddItem gtblSeisan(i).CD
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

Public Sub gsubBumonCD_get()
'*******************************************************************************************
'   部門データ取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    CallCNT = 0
    ArryCNT = 0

    'ＳＰ
    '店コード
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt211.cobSyozokutenCD.Text, ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'スプレッド呼び出しカウント
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
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210BumonList (" & _
            ":InStrMiseCD,:InNumMaxRec,:IoNumSpCnt,:OtStrBumonCD,:OtStrBumonNM,:OtNumAryCount,:OtStrEndFlg); END;"

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
            frmQPAV_CEnt211.cobSyozokuBumonCD.Clear
            frmQPAV_CEnt211.lblSyozokuBumonCD.Caption = ""
            Exit Sub
        End If
        
        '配列の再定義
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

    'データをコンボにセットする
    frmQPAV_CEnt211.cobSyozokuBumonCD.Clear
    For i = 1 To ArryCNT
        frmQPAV_CEnt211.cobSyozokuBumonCD.AddItem gtblBumon(i).CD
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
'   部門データ登録
'*******************************************************************************************
    Dim strSQL               As String

'On Error GoTo errSPInit
    gsubSPAdd = False
   
    'ＳＰ
    '社員コード1
    odbDatabase.Parameters.Add "InStrSyainCD1", frmQPAV_CEnt211.txtKojinCD1.Text, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    
    '社員コード2
    odbDatabase.Parameters.Add "InStrSyainCD2", Trim(frmQPAV_CEnt211.txtKojinCD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    
    '氏名カナ
    odbDatabase.Parameters.Add "InStrSimeiKana", Trim(frmQPAV_CEnt211.txtKojinmeiKana.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimeiKana").ServerType = ORATYPE_CHAR
    
    '氏名漢字
    odbDatabase.Parameters.Add "InStrSimeiKanji", Trim(frmQPAV_CEnt211.txtKojinmeiKanji.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimeiKanji").ServerType = ORATYPE_CHAR
    
    '所属店コード
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt211.cobSyozokutenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt211.cboSeisanCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '東西区分
    odbDatabase.Parameters.Add "InStrTozaiKBN", Trim(frmQPAV_CEnt211.cobTouzaiKbn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBN").ServerType = ORATYPE_CHAR
    
    '所属部門コード
    odbDatabase.Parameters.Add "InStrBumonCD", Trim(frmQPAV_CEnt211.cobSyozokuBumonCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    '資格コード
    odbDatabase.Parameters.Add "InStrSikakuCD", Trim(frmQPAV_CEnt211.txtSikakuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSikakuCD").ServerType = ORATYPE_CHAR
    
    '等級コード
    odbDatabase.Parameters.Add "InStrTokyuCD", Trim(frmQPAV_CEnt211.txtTokyuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTokyuCD").ServerType = ORATYPE_CHAR
    
    '生年月日
    odbDatabase.Parameters.Add "InStrBornYMD", Trim(frmQPAV_CEnt211.txtSeinenGappiYYYY.Text) & _
        Trim(frmQPAV_CEnt211.txtSeinenGappiMM.Text) & Trim(frmQPAV_CEnt211.txtSeinenGappiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBornYMD").ServerType = ORATYPE_CHAR
    
    '退職年月日
    odbDatabase.Parameters.Add "InStrTaisyokuYMD", Trim(frmQPAV_CEnt211.txtTaisyokuYYYY.Text) & _
        Trim(frmQPAV_CEnt211.txtTaisyokuMM.Text) & Trim(frmQPAV_CEnt211.txtTaisyokuDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMD").ServerType = ORATYPE_CHAR
    
    '休職年月開始日
    odbDatabase.Parameters.Add "InStrKyusyoStYMD", Trim(frmQPAV_CEnt211.txtKyuusyokuYYYY1.Text) & _
        Trim(frmQPAV_CEnt211.txtKyuusyokuMM1.Text) & Trim(frmQPAV_CEnt211.txtKyuusyokuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKyusyoStYMD").ServerType = ORATYPE_CHAR
    
    '休職終了年月日
    odbDatabase.Parameters.Add "InStrKyusyoEdYMD", Trim(frmQPAV_CEnt211.txtKyuusyokuYYYY2.Text) & _
        Trim(frmQPAV_CEnt211.txtKyuusyokuMM2.Text) & Trim(frmQPAV_CEnt211.txtKyuusyokuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKyusyoEdYMD").ServerType = ORATYPE_CHAR
    
    'メニューID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    'プログラムID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    'ユーザID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrOpeTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '部署コード
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '担当者名
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
    
    '重複フラグ
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210DatAdd (" & _
            ":InStrSyainCD1,:InStrSyainCD2,:InStrSimeiKana,:InStrSimeiKanji,:InStrMiseCD,:InStrSeisanCD," & _
            ":InStrTozaiKBN,:InStrBumonCD,:InStrSikakuCD,:InStrTokyuCD,:InStrBornYMD,:InStrTaisyokuYMD," & _
            ":InStrKyusyoStYMD,:InStrKyusyoEdYMD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
            ":InstrOpeTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt211.lblMsg.Caption = "WPOE02 この社員コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt211.txtKojinCD2.BackColor = vbRed
        frmQPAV_CEnt211.txtKojinCD2.SetFocus
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
'   社員データ 修正
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '社員コード1修正前
    odbDatabase.Parameters.Add "InStrSyainCD1_B", gtblSyain(Act_Row).SyainCD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1_B").ServerType = ORATYPE_CHAR
    
    '社員コード1修正後
    odbDatabase.Parameters.Add "InStrSyainCD1_A", frmQPAV_CEnt211.txtKojinCD1.Text, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1_A").ServerType = ORATYPE_CHAR
    
    '社員コード2修正前
    odbDatabase.Parameters.Add "InStrSyainCD2_B", gtblSyain(Act_Row).SyainCD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2_B").ServerType = ORATYPE_CHAR
    
    '社員コード2修正後
    odbDatabase.Parameters.Add "InStrSyainCD2_A", Trim(frmQPAV_CEnt211.txtKojinCD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2_A").ServerType = ORATYPE_CHAR
    
    '氏名カナ
    odbDatabase.Parameters.Add "InStrSimeiKana", Trim(frmQPAV_CEnt211.txtKojinmeiKana.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimeiKana").ServerType = ORATYPE_CHAR
    
    '氏名漢字
    odbDatabase.Parameters.Add "InStrSimeiKanji", Trim(frmQPAV_CEnt211.txtKojinmeiKanji.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimeiKanji").ServerType = ORATYPE_CHAR
    
    '所属店コード
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt211.cobSyozokutenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '精算店コード
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt211.cboSeisanCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '東西区分
    odbDatabase.Parameters.Add "InStrTozaiKBN", Trim(frmQPAV_CEnt211.cobTouzaiKbn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBN").ServerType = ORATYPE_CHAR
    
    '所属部門コード
    odbDatabase.Parameters.Add "InStrBumonCD", Trim(frmQPAV_CEnt211.cobSyozokuBumonCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    '資格コード
    odbDatabase.Parameters.Add "InStrSikakuCD", Trim(frmQPAV_CEnt211.txtSikakuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSikakuCD").ServerType = ORATYPE_CHAR
    
    '等級コード
    odbDatabase.Parameters.Add "InStrTokyuCD", Trim(frmQPAV_CEnt211.txtTokyuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTokyuCD").ServerType = ORATYPE_CHAR
    
    '生年月日
    odbDatabase.Parameters.Add "InStrBornYMD", Trim(frmQPAV_CEnt211.txtSeinenGappiYYYY.Text) & _
        Trim(frmQPAV_CEnt211.txtSeinenGappiMM.Text) & Trim(frmQPAV_CEnt211.txtSeinenGappiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBornYMD").ServerType = ORATYPE_CHAR
    
    '退職年月日
    odbDatabase.Parameters.Add "InStrTaisyokuYMD", Trim(frmQPAV_CEnt211.txtTaisyokuYYYY.Text) & _
        Trim(frmQPAV_CEnt211.txtTaisyokuMM.Text) & Trim(frmQPAV_CEnt211.txtTaisyokuDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMD").ServerType = ORATYPE_CHAR
    
    '休職年月開始日
    odbDatabase.Parameters.Add "InStrKyusyoStYMD", Trim(frmQPAV_CEnt211.txtKyuusyokuYYYY1.Text) & _
        Trim(frmQPAV_CEnt211.txtKyuusyokuMM1.Text) & Trim(frmQPAV_CEnt211.txtKyuusyokuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKyusyoStYMD").ServerType = ORATYPE_CHAR
    
    '休職終了年月日
    odbDatabase.Parameters.Add "InStrKyusyoEdYMD", Trim(frmQPAV_CEnt211.txtKyuusyokuYYYY2.Text) & _
        Trim(frmQPAV_CEnt211.txtKyuusyokuMM2.Text) & Trim(frmQPAV_CEnt211.txtKyuusyokuDD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKyusyoEdYMD").ServerType = ORATYPE_CHAR
    
    'メニューID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    'プログラムID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    'ユーザID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    'コンピュータ名
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrOpeTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '部署コード
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '担当者名
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
    
    '重複フラグ
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210DatUpd (" & _
            ":InStrSyainCD1_B,:InStrSyainCD1_A,:InStrSyainCD2_B,:InStrSyainCD2_A,:InStrSimeiKana,:InStrSimeiKanji," & _
            ":InStrMiseCD,:InStrSeisanCD,:InStrTozaiKBN,:InStrBumonCD,:InStrSikakuCD,:InStrTokyuCD,:InStrBornYMD," & _
            ":InStrTaisyokuYMD,:InStrKyusyoStYMD,:InStrKyusyoEdYMD,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrOpeTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'コードが既に登録されていた場合
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = は既に登録されています。
        frmQPAV_CEnt211.lblMsg.Caption = "WPOE02 この社員コード" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt211.txtKojinCD2.BackColor = vbRed
        frmQPAV_CEnt211.txtKojinCD2.SetFocus
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
'   社員データ 削除
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    'ＳＰ
    '社員コード1
    odbDatabase.Parameters.Add "InStrSyainCD1", frmQPAV_CEnt211.txtKojinCD1.Text, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    
    '社員コード2
    odbDatabase.Parameters.Add "InStrSyainCD2", Trim(frmQPAV_CEnt211.txtKojinCD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    
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
    
    '清算フラグ
    If Trim(frmQPAV_CEnt211.cboSeisanCD.Text) = "" Then
        odbDatabase.Parameters.Add "InStrSeisanF", "0", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InStrSeisanF", "1", ORAPARM_INPUT
    End If
    odbDatabase.Parameters("InStrSeisanF").ServerType = ORATYPE_CHAR
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210DatDel (" & _
            ":InStrSyainCD1,:InStrSyainCD2,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:InStrSeisanF); END;"

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
    
    odbDatabase.Parameters.Add "strSikibetu", "210", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210Lock(" & _
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
        frmQPAV_CEnt210.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "210", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt210PkG.QPAP_CEnt210UnLock(" _
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


