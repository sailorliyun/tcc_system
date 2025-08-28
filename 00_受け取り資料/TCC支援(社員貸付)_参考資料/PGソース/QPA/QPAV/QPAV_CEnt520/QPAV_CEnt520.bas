Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt520"
    Public bInit_Flg        As Boolean
    Public gstrCode         As String
    Public gstrSysDate      As String          'システム日付
    Public gdatSysDate      As Date            'システム日付
    Public gblnKizon        As Boolean  'True：既存入金あり、False：既存入金なし

    'ｽﾌﾟﾚｯﾄﾞ表示用配列定義
    Type KeisanTbl
        Gankin                  As Long     '元金
        Risoku                  As Long     '利息
    End Type
    Public gtblKeisan()         As KeisanTbl

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "分解(未請求分)は既に起動されています。" _
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

    frmQPAV_CEnt520.Show
 
End Sub

'*********************************************************************************************
'*　　手続き名：　社員属性取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　社員属性取得ＳＰを使用し、社員属性情報を取得する
'*********************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errSeachSyain

    gfuncSeachSyain = False
    
    '社員属性取得 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", Space(1), ORAPARM_INPUT    '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT    '社員コード２
        '氏名カナ
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '氏名漢字
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '所属店コード
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '所属店名
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '東西区分
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '所属部門コード
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '所属部門名
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '資格コード
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '等級コード
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '生年月日
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
    '存在Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    '画面に表示
    frmQPAV_CEnt520.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '個人名カナ
    frmQPAV_CEnt520.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '個人名漢字
    frmQPAV_CEnt520.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '店コード
    frmQPAV_CEnt520.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '店名
    frmQPAV_CEnt520.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '東西区分
    frmQPAV_CEnt520.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '部門コード
    frmQPAV_CEnt520.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '部門名
    frmQPAV_CEnt520.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '資格コード
    frmQPAV_CEnt520.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '等級コード
    '生年月日編集
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt520.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt520.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSeachSyain = True

    Exit Function
    
errSeachSyain:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'*************************************************************
'*  残高取得
'*  小口融資計算書のPKGを借用する
'*    ※分解戻し込みの金額なので、その分は差し引く
'*************************************************************
Public Function gfuncGetZandaka() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim lngTblCnt           As Long
    
    Dim strYMD1 As String
    Dim strYMD2 As String
    Dim strYMD3 As String

    Const cnsMaxRec As Long = 100

On Error GoTo errgfuncGetZandaka
    
    gfuncGetZandaka = False

    Cnt = 0

    strYMD1 = Format(gdatSysDate, "yyyymm") & "01"
    strYMD2 = Format(DateAdd("m", -2, Mid(strYMD1, 1, 4) & "/" & Mid(strYMD1, 5, 2) & "/26"), "yyyymmdd")
    strYMD3 = Format(DateAdd("m", -1, Mid(strYMD1, 1, 4) & "/" & Mid(strYMD1, 5, 2) & "/25"), "yyyymmdd")
    
    'ＳＰ
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    '精算区分
    odbDatabase.Parameters.Add "InStrSeiKBN", "0", ORAPARM_INPUT        '精算する
    odbDatabase.Parameters("InStrSeiKBN").ServerType = ORATYPE_CHAR
    '精算年月日
    odbDatabase.Parameters.Add "InStrSeiYMD", Format(frmQPAV_CEnt520.lblNyukinYMD, "YYYYMM") & "25", ORAPARM_INPUT   '入金月25日
    odbDatabase.Parameters("InStrSeiYMD").ServerType = ORATYPE_CHAR
    '開始日付１
    odbDatabase.Parameters.Add "InStrStrYMD1", strYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD1").ServerType = ORATYPE_CHAR
    '開始日付２
    odbDatabase.Parameters.Add "InStrStrYMD2", strYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD2").ServerType = ORATYPE_CHAR
    '開始日付３
    odbDatabase.Parameters.Add "InStrStrYMD3", strYMD3, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD3").ServerType = ORATYPE_CHAR
    '終了日付
    odbDatabase.Parameters.Add "InStrEndYMD", Format(frmQPAV_CEnt520.lblNyukinYMD, "YYYYMM") & "25", ORAPARM_INPUT
    odbDatabase.Parameters("InStrEndYMD").ServerType = ORATYPE_CHAR
    '出力年
    odbDatabase.Parameters.Add "InStrShoYYYY", Mid(gstrSysDate, 1, 4), ORAPARM_INPUT
    odbDatabase.Parameters("InStrShoYYYY").ServerType = ORATYPE_CHAR
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    'カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '処理日付 配列
    odbDatabase.Parameters.AddTable "OtStrYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    '区分 配列
    odbDatabase.Parameters.AddTable "OtStrKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 4
    '融資金額 配列
    odbDatabase.Parameters.AddTable "OtNumYusiKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '返済金額 配列
    odbDatabase.Parameters.AddTable "OtNumHenKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '元金 配列
    odbDatabase.Parameters.AddTable "OtNumGanKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '利息 配列
    odbDatabase.Parameters.AddTable "OtNumRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '残高 配列
    odbDatabase.Parameters.AddTable "OtStrZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '分解戻し元金
    odbDatabase.Parameters.Add "OtNumGanKinMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '分解戻し利息
    odbDatabase.Parameters.Add "OtNumRisokuMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '担当者コード
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030SelList ("
    strSQL = strSQL & ":InStrSyainCD,"
    strSQL = strSQL & ":InStrSeiKBN,"
    strSQL = strSQL & ":InStrSeiYMD,"
    strSQL = strSQL & ":InStrStrYMD1,"
    strSQL = strSQL & ":InStrStrYMD2,"
    strSQL = strSQL & ":InStrStrYMD3,"
    strSQL = strSQL & ":InStrEndYMD,"
    strSQL = strSQL & ":InStrShoYYYY,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrYMD,"
    strSQL = strSQL & ":OtStrKBN,"
    strSQL = strSQL & ":OtNumYusiKin,"
    strSQL = strSQL & ":OtNumHenKin,"
    strSQL = strSQL & ":OtNumGanKin,"
    strSQL = strSQL & ":OtNumRisoku,"
    strSQL = strSQL & ":OtStrZandaka,"
    strSQL = strSQL & ":OtNumGanKinMod,"
    strSQL = strSQL & ":OtNumRisokuMod,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)

        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblKeisan
            lngTblCnt = 0
            '総データ件数がZEROのときはエラー
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt520.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt520.txtSyainCd.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        lngTblCnt = lngTblCnt + lngMax
        ReDim Preserve gtblKeisan(lngTblCnt)
        
        g = 0
        For i = lngTblCnt - lngMax + 1 To lngTblCnt
            gtblKeisan(i).Gankin = odbDatabase.Parameters("OtNumGanKin").Get_Value(g)            '元金
            gtblKeisan(i).Risoku = odbDatabase.Parameters("OtNumRisoku").Get_Value(g)            '利息
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '配列の最終行(精算行)のみ使用する
    '分解戻し分を差し引く
    frmQPAV_CEnt520.lblUGanpon = Format(gtblKeisan(lngTblCnt).Gankin - odbDatabase.Parameters("OtNumGankinMod"), "#,##0")
    frmQPAV_CEnt520.lblUTesuryou = Format(gtblKeisan(lngTblCnt).Risoku - odbDatabase.Parameters("OtNumRisokuMod"), "#,##0")
    frmQPAV_CEnt520.lblUZandaka = Format(gtblKeisan(lngTblCnt).Gankin - odbDatabase.Parameters("OtNumGankinMod") _
                                       + gtblKeisan(lngTblCnt).Risoku - odbDatabase.Parameters("OtNumRisokuMod"), "#,##0")
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    
    '******** ワークテーブル削除 ********
    'ユーザーＩＤ
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errgfuncGetZandaka
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
   
    gfuncGetZandaka = True
    
    Exit Function

errgfuncGetZandaka:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'*************************************************************
'* 既存入金データを検索
'*************************************************************
Public Function gfuncSearchKizonNyukin() As Boolean

    Dim strSQL               As String

On Error GoTo errgfuncSearchKizonNyukin
    
    gfuncSearchKizonNyukin = False

    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    '入金日
    odbDatabase.Parameters.Add "InstrNyukinYMD", Format(frmQPAV_CEnt520.lblNyukinYMD.Caption, "YYYYMMDD"), ORAPARM_INPUT
    odbDatabase.Parameters("InstrNyukinYMD").ServerType = ORATYPE_CHAR
    '元本
    odbDatabase.Parameters.Add "OtNumGanpon", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGanpon").ServerType = ORATYPE_NUMBER
    '利息
    odbDatabase.Parameters.Add "OtNumRisoku", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRisoku").ServerType = ORATYPE_NUMBER

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520SearchKizonNyukin (" & _
            ":InStrSyainCD," & _
            ":InstrNyukinYMD," & _
            ":OtNumGanpon," & _
            ":OtNumRisoku); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    frmQPAV_CEnt520.txtNyukinGanpon.Text = Format(odbDatabase.Parameters("OtNumGanpon").Value, "#,##0")   '元本
    frmQPAV_CEnt520.txtNyukinTesuryou.Text = Format(odbDatabase.Parameters("OtNumRisoku").Value, "#,##0") '手数料
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    gfuncSearchKizonNyukin = True
    
    Exit Function

errgfuncSearchKizonNyukin:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncListSet() As Boolean

    Dim strSQL               As String

On Error GoTo errListSet

    gfuncListSet = False
    
    'ＳＰ
    '処理日付
    odbDatabase.Parameters.Add "InStrYMD", Format(gdatSysDate, "yyyymmdd"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
    
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

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
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520List (" & _
            ":InStrYMD," & _
            ":OtNumRecCount," & _
            ":OtStrEndFlg," & _
            ":InStrUserID," & _
            ":InStrComputerNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        MsgBox "本日分の入金データは存在しません。", vbInformation + vbOKOnly, "分解(未請求分)"
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncListSet = True
    
    Exit Function

errListSet:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "520", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 'キーコード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520Lock(" & _
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
        frmQPAV_CEnt520.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "520", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520UnLock(" _
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


