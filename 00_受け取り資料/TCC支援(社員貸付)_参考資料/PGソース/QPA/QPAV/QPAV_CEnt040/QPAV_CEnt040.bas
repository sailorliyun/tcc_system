Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt040"
 Public bInit_Flg As Boolean

    Type NyukinTbl
       TorokuYMD    As String
       MiseNM       As String
       BumonNM      As String
       SyainCD      As String
       SimeiKanji   As String
       Nyukingaku   As Long
       Zandaka      As Long
       Gendo        As Long
       NyukinYMD    As String
    End Type
     
    Public gtblNyukin()   As NyukinTbl
    Public glngTblCnt       As Long

    Public gstrYMD1         As String
    Public gstrYMD2         As String
    Public gstrKBN          As String
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "入金日報印刷は既に起動されています。" _
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

    frmQPAV_CEnt040.Show 1
 
End Sub

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt040.sprList)
    frmQPAV_CEnt040.sprList.MaxRows = 0
    
    'ＳＰ
    '開始日付
    odbDatabase.Parameters.Add "InStrYMD1", gstrYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD1").ServerType = ORATYPE_CHAR
 
    '終了日付
    odbDatabase.Parameters.Add "InStrYMD2", gstrYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD2").ServerType = ORATYPE_CHAR

    '日付区分
    odbDatabase.Parameters.Add "InStrKBN", gstrKBN, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKBN").ServerType = ORATYPE_CHAR

    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER

    'カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER

    '処理日付 配列
    odbDatabase.Parameters.AddTable "OtStrTorokuYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8

    '店名 配列
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '部門名 配列
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '社員コード 配列
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '氏名漢字 配列
    odbDatabase.Parameters.AddTable "OtStrSimeikanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    
    '入金額 配列
    odbDatabase.Parameters.AddTable "OtStrNyukingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '残高 配列
    odbDatabase.Parameters.AddTable "OtStrZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '限度額 配列
    odbDatabase.Parameters.AddTable "OtNumGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '入金日 配列
    odbDatabase.Parameters.AddTable "OtNumNyukinYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt040PkG.QPAP_CEnt040SelList (" & _
             ":InStrYMD1," & _
             ":InStrYMD2," & _
             ":InStrKBN," & _
             ":InNumMaxRec," & _
             ":IoNumCursor," & _
             ":OtStrTorokuYMD," & _
             ":OtStrMiseNM," & _
             ":OtStrBumonNM," & _
             ":OtStrSyainCD," & _
             ":OtStrSimeikanji," & _
             ":OtStrNyukingaku," & _
             ":OtStrZandaka," & _
             ":OtNumGendo," & _
             ":OtNumNyukinYMD," & _
             ":OtNumRecCount," & _
             ":OtNumAryCount," & _
             ":OtStrEndFlg," & _
             ":InStrUserID," & _
             ":InStrComputerNM); END;"

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)

        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblNyukin
            glngTblCnt = 0
            '総データ件数がZEROのときはエラー
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt040.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt040.txtTouroku(0).SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
'        If glngTblCnt + odbDatabase.Parameters("OtNumAryCount") > 1000 Then        '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
        If glngTblCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then   '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
            'Msg = これ以上のデータは表示できません。
            frmQPAV_CEnt040.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Call gsubParaRemove(odbDatabase)
            Exit Sub
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblNyukin(glngTblCnt)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '処理日付
            gtblNyukin(i).TorokuYMD = odbDatabase.Parameters("OtStrTorokuYMD").Get_Value(g)
            '店名
            gtblNyukin(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '部門名
            gtblNyukin(i).BumonNM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(g)
            '社員コード
            gtblNyukin(i).SyainCD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(g)
            '氏名漢字
            gtblNyukin(i).SimeiKanji = odbDatabase.Parameters("OtStrSimeikanji").Get_Value(g)
            '入金額
            gtblNyukin(i).Nyukingaku = odbDatabase.Parameters("OtStrNyukingaku").Get_Value(g)
            '残高
            gtblNyukin(i).Zandaka = odbDatabase.Parameters("OtStrZandaka").Get_Value(g)
            '限度額
            gtblNyukin(i).Gendo = odbDatabase.Parameters("OtNumGendo").Get_Value(g)
            '入金日
            gtblNyukin(i).NyukinYMD = odbDatabase.Parameters("OtNumNyukinYMD").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt040.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 1, i, Left(gtblNyukin(i).TorokuYMD, 4) & "/" & Mid(gtblNyukin(i).TorokuYMD, 5, 2) & "/" & Right(gtblNyukin(i).TorokuYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 2, i, Trim(gtblNyukin(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 3, i, Trim(gtblNyukin(i).BumonNM))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 4, i, Trim(gtblNyukin(i).SyainCD))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 5, i, Trim(gtblNyukin(i).SimeiKanji))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 6, i, Format(gtblNyukin(i).Nyukingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 7, i, Format(gtblNyukin(i).Zandaka, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 8, i, Format(gtblNyukin(i).Gendo, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 9, i, Left(gtblNyukin(i).NyukinYMD, 4) & "/" & Mid(gtblNyukin(i).NyukinYMD, 5, 2) & "/" & Right(gtblNyukin(i).NyukinYMD, 2))
    Next i
    
    '入力制御処理
    For i = 0 To 5
        frmQPAV_CEnt040.txtTouroku(i).Enabled = False
    Next i
    frmQPAV_CEnt040.cboNyukinKBN.Enabled = False
    If gstrKBN = "0" Then
        For i = 0 To 1
            frmQPAV_CEnt040.cmdPrint(i).Enabled = True
        Next i
    End If
    frmQPAV_CEnt040.cmdPFK(5).Enabled = False
    If gstrKBN = "0" Then
        frmQPAV_CEnt040.cmdPrint(0).SetFocus
    Else
        frmQPAV_CEnt040.cmdPFK(12).SetFocus
    End If
    Exit Sub

errSPSet:
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


