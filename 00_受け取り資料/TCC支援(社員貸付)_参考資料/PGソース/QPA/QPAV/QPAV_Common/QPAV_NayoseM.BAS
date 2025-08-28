Attribute VB_Name = "QPAV_NayoseM"
Option Explicit
    Public gtblSyain()  As SyainTbl
    Public CallCNT      As Long
    Public ArryCNT      As Long
    
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
    End Type

Public Function gsubSPInit() As Boolean
'*****************************************************************************************
'   氏名取得処理
'*****************************************************************************************
    Dim strSQL              As String
    Dim i                   As Long
    Dim j                   As Long
    Dim lngMax              As Long
    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False
    CallCNT = 0
    ArryCNT = 0

    'ＳＰ
    '抽出キー　氏名漢字
    odbDatabase.Parameters.Add "InStrName", Trim(QPAV_Nayose.txtKaiinKanaMei.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrName").ServerType = ORATYPE_VARCHAR2
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
   
    '社員コード１　配列
    odbDatabase.Parameters.AddTable "OtSyainCD1", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
    
    '社員コード２　配列
    odbDatabase.Parameters.AddTable "OtSyainCD2", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '氏名カナ 配列
    odbDatabase.Parameters.AddTable "OtSimeiKana", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 15
       
    '氏名漢字 配列
    odbDatabase.Parameters.AddTable "OtSimeiKanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
       
    '所属店コード 配列
    odbDatabase.Parameters.AddTable "OtMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '所属店名称 配列
    odbDatabase.Parameters.AddTable "OtMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '東西区分 配列
    odbDatabase.Parameters.AddTable "OtTozaiKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
       
    '所属部門コード 配列
    odbDatabase.Parameters.AddTable "OtBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '所属部門名称 配列
    odbDatabase.Parameters.AddTable "OtBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
   
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_ActX010PkG.QPAP_ActX010SelList (" & _
            ":InStrName,:InNumMaxRec,:IoNumSpCnt,:OtSyainCD1,:OtSyainCD2,:OtSimeiKana," & _
            ":OtSimeiKanji,:OtMiseCD,:OtMiseNM,:OtTozaiKBN,:OtBumonCD,:OtBumonNM,:OtNumAryCount," & _
            ":OtStrEndFlg); END;"

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        QPAV_Nayose.sprList.MaxRows = 0
    
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblSyain
        End If

        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '配列の再定義
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
            'Msg = これ以上のデータは表示できません。
            QPAV_Nayose.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
    
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
        ReDim Preserve gtblSyain(ArryCNT)

        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            gtblSyain(j).SyainCD1 = odbDatabase.Parameters("OtSyainCD1").Get_Value(i)
            gtblSyain(j).SyainCD2 = odbDatabase.Parameters("OtSyainCD2").Get_Value(i)
            gtblSyain(j).SimeiKana = odbDatabase.Parameters("OtSimeiKana").Get_Value(i)
            gtblSyain(j).SimeiKanji = odbDatabase.Parameters("OtSimeiKanji").Get_Value(i)
            gtblSyain(j).MiseCD = odbDatabase.Parameters("OtMiseCD").Get_Value(i)
            gtblSyain(j).MiseNM = odbDatabase.Parameters("OtMiseNM").Get_Value(i)
            gtblSyain(j).TozaiKBN = odbDatabase.Parameters("OtTozaiKBN").Get_Value(i)
            gtblSyain(j).BumonCD = odbDatabase.Parameters("OtBumonCD").Get_Value(i)
            gtblSyain(j).BumonNM = odbDatabase.Parameters("OtBumonNM").Get_Value(i)
            i = i + 1
        Next j

        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    QPAV_Nayose.sprList.MaxRows = ArryCNT
    
    'データをＳＰにセットする
    For i = 1 To ArryCNT
        Call gsubSetCellText(QPAV_Nayose.sprList, 1, i, gtblSyain(i).SyainCD1 & Trim(gtblSyain(i).SyainCD2))
        Call gsubSetCellText(QPAV_Nayose.sprList, 2, i, gtblSyain(i).SimeiKana)
        Call gsubSetCellText(QPAV_Nayose.sprList, 3, i, gtblSyain(i).SimeiKanji)
        Call gsubSetCellText(QPAV_Nayose.sprList, 4, i, gtblSyain(i).MiseCD)
        Call gsubSetCellText(QPAV_Nayose.sprList, 5, i, gtblSyain(i).MiseNM)
        Call gsubSetCellText(QPAV_Nayose.sprList, 6, i, gtblSyain(i).TozaiKBN)
        Call gsubSetCellText(QPAV_Nayose.sprList, 7, i, gtblSyain(i).BumonCD)
        Call gsubSetCellText(QPAV_Nayose.sprList, 8, i, gtblSyain(i).BumonNM)
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



