Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt230"
    Public gtblTaisyoku()   As TaisyokuTbl
    Public glngTblCnt       As Long
    Public ArryCNT          As Long
    Public CallCNT          As Long
    Public bInit_Flg        As Boolean

    Type TaisyokuTbl
       YMD                  As String
       CD                   As String
       NM                   As String
       MiseCD               As String
       MiseNM               As String
       KBN                  As String
       BumonCD              As String
       BumonNM              As String
    End Type
     
Public Sub Main()
'*************************************************************
'   起動　ＭＡＩＮ
'*************************************************************
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "退職予定者一覧表は既に起動されています。" _
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

    frmQPAV_CEnt230.Show 1
 
End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   退職予定者データ取得
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

'↓↓↓↓↓↓【Win2000対応】Add by Yokoyama@NBC 2004/04/26↓↓↓↓↓↓
    
    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt230.vaSpread1)
    '呼び出し回数クリア
    CallCNT = 0
    'テーブル件数クリア
    ArryCNT = 0

'↑↑↑↑↑↑【Win2000対応】Add by Yokoyama@NBC 2004/04/26↑↑↑↑↑↑


    'ＳＰ
    '退職予定日付開始日
    odbDatabase.Parameters.Add "InStrTaisyokuYMDSt", Trim(frmQPAV_CEnt230.txtNen1) & _
                               Trim(frmQPAV_CEnt230.txtTuki1) & "01", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMDSt").ServerType = ORATYPE_CHAR
    
    '退職予定日付終了日
    odbDatabase.Parameters.Add "InStrTaisyokuYMDEd", Trim(frmQPAV_CEnt230.txtNen2) & _
                                 Trim(frmQPAV_CEnt230.txtTuki2) & "31", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMDEd").ServerType = ORATYPE_CHAR
    
    'ユーザーID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_CHAR
    
    'コンピューター名称
    odbDatabase.Parameters.Add "InStrCompNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCompNM").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'スプレッド呼び出し回数
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '退職日付 配列
    odbDatabase.Parameters.AddTable "OtStrTaisyokuYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '社員コード 配列
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '社員氏名 配列
    odbDatabase.Parameters.AddTable "OtStrSimei", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
       
    '所属店コード 配列
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '所属店名称 配列
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '東西区分 配列
    odbDatabase.Parameters.AddTable "OtStrTozaiKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
       
    '所属部門コード 配列
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '所属部門名称 配列
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt230PkG.QPAP_CEnt230SelList (" & _
            ":InStrTaisyokuYMDSt,:InStrTaisyokuYMDEd,:InStrUserID,:InStrCompNM,:InNumMaxRec," & _
            ":IoNumSpCnt,:OtStrTaisyokuYMD,:OtStrSyainCD,:OtStrSimei,:OtStrMiseCD,:OtStrMiseNM," & _
            ":OtStrTozaiKBN,:OtStrBumonCD,:OtStrBumonNM,:OtNumAryCount,:OtStrEndFlg); END;"
    Do
        '抽出レコードをリストに表示
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        frmQPAV_CEnt230.vaSpread1.MaxRows = 0
        
        '抽出件数を表示する
        'ﾃｰﾌﾞﾙ件数用
        If CallCNT = 0 Then
            Erase gtblTaisyoku
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt230.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Function
        End If
        
        '配列の再定義
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblTaisyoku(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '退職年月日
            gtblTaisyoku(j).YMD = Left(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 4) & _
                                  Mid(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 5, 2) & _
                                  Right(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 2)

            '社員コード
            gtblTaisyoku(j).CD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(i)
            '社員氏名
            gtblTaisyoku(j).NM = odbDatabase.Parameters("OtStrSimei").Get_Value(i)
            '所属店コード
            gtblTaisyoku(j).MiseCD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '所属部門名称
            gtblTaisyoku(j).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            '東西区分
            gtblTaisyoku(j).KBN = odbDatabase.Parameters("OtStrTozaiKBN").Get_Value(i)
            '所属部門コード
            gtblTaisyoku(j).BumonCD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(i)
            '所属部門名称
            gtblTaisyoku(j).BumonNM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(i)
            i = i + 1
        Next j
        
        '呼び出し回数カウントアップ
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
        
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    frmQPAV_CEnt230.vaSpread1.MaxRows = ArryCNT
    
    'データをＳＰにセットする
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 1, i, Left(gtblTaisyoku(i).YMD, 4) & "/" & Mid(gtblTaisyoku(i).YMD, 5, 2) & "/" & Right(gtblTaisyoku(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 2, i, gtblTaisyoku(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 3, i, gtblTaisyoku(i).NM)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 4, i, gtblTaisyoku(i).MiseCD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 5, i, gtblTaisyoku(i).MiseNM)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 6, i, gtblTaisyoku(i).KBN)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 7, i, gtblTaisyoku(i).BumonCD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 8, i, gtblTaisyoku(i).BumonNM)
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

