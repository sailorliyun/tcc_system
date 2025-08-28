Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                         1.分解戻し分の未収元金・利息表示
'                         2.分解時の区分「振込み」を追加
'----------------------------------------------------------------------------------------------
    
    Public Const gcstrPrjName = "QPAV_CEnt030"
    
    Public blnLoadFlg           As Boolean  '初期フラグ
    
    '自社M変数
    Public gstrKamiStM          As String   '上期開始月
    Public gstrKamiStD          As String   '上期開始日
    Public gstrSimoStM          As String   '下期開始月
    Public gstrSimoStD          As String   '下期開始日
    Public gstrKamiYMD          As String   '上期開始年月日
    Public gstrSimoYMD          As String   '下期開始年月日
    Public gstrChuKesYMD        As String   '中間決算年月日
    Public gstrKesYMD           As String   '決算年月日
    Public gstrChuKesM          As String   '中間決算月
    Public gstrChuKesD          As String   '中間決算日
    Public gstrKesM             As String   '決算月
    Public gstrKesD             As String   '決算日
    Public gstrSyuYYYY          As String   '出力年
    Public gstrZanYMD           As String   '残高更新日
    
    'SP用変数
    Public gstrCode             As String   '社員コード
    Public gstrKbn              As String   '精算区分（０：精算する／１：精算しない）
    Public gstrSeiYMD           As String   '精算日
    Public gstrStrYMD1          As String   '処理開始日１
    Public gstrStrYMD2          As String   '処理開始日２
    Public gstrStrYMD3          As String   '処理開始日３
    Public gstrEndYMD           As String   '処理終了日
    Public gstrSyuYear          As String   '出力年

    'ｽﾌﾟﾚｯﾄﾞ表示用配列定義
    Type KeisanTbl
        YMD                     As String   '年月日
        KBN                     As String   '区分
        YusiKin                 As Long     '融資金額
        HenKin                  As Long     '返済金額
        Gankin                  As Long     '元金
        Risoku                  As Long     '利息
        Zandaka                 As Long     '残高
    End Type
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "小口融資計算書は既に起動されています。" _
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

    frmQPAV_CEnt030.Show
 
End Sub

Public Sub gsubKamiSimoSet()

'自社マスタより上期開始、下期開始、精算年月日を取得する

    Dim strSQL               As String
    Dim i                    As Long

    Dim wk_yyyy             As Integer

On Error GoTo errKamiSimoSet
    
    'ＳＰ
    '自社コード
    odbDatabase.Parameters.Add "InStrCode", "01", ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
    '財務局コード
    odbDatabase.Parameters.Add "OtStrZaimu", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZaimu").ServerType = ORATYPE_VARCHAR2
    
    '所在地
    odbDatabase.Parameters.Add "OtStrSyozai", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '会社名
    odbDatabase.Parameters.Add "OtStrKaisya", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisya").ServerType = ORATYPE_VARCHAR2
    
    '振込銀行
    odbDatabase.Parameters.Add "OtStrFurikomi", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFurikomi").ServerType = ORATYPE_VARCHAR2
    
    '口座番号
    odbDatabase.Parameters.Add "OtStrKozaNo", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '口座名義
    odbDatabase.Parameters.Add "OtStrKozaNm", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNm").ServerType = ORATYPE_VARCHAR2
    
    '上期開始月
    odbDatabase.Parameters.Add "OtStrKamiStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStM").ServerType = ORATYPE_CHAR
    
    '上期開始日
    odbDatabase.Parameters.Add "OtStrKamiStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStD").ServerType = ORATYPE_CHAR
    
    '下期開始月
    odbDatabase.Parameters.Add "OtStrSimoStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStM").ServerType = ORATYPE_CHAR
    
    '下期開始日
    odbDatabase.Parameters.Add "OtStrSimoStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStD").ServerType = ORATYPE_CHAR
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt000PkG.QPAP_CEnt000SelJisyaM (" & _
        ":InStrCode," & _
        ":OtStrZaimu," & _
        ":OtStrSyozai," & _
        ":OtStrKaisya," & _
        ":OtStrFurikomi," & _
        ":OtStrKozaNo," & _
        ":OtStrKozaNm," & _
        ":OtStrKamiStM," & _
        ":OtStrKamiStD," & _
        ":OtStrSimoStM," & _
        ":OtStrSimoStD," & _
        ":OtStrFlg); END;"
    
    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtStrFlg") = "0" Then
        'Msg = 自社データが存在しません。
        frmQPAV_CEnt030.lblMsg.Caption = "WPOE12 " & gstrGetCodeMeisyo(odbDatabase, "E12", "WPO")
        Call gsubParaRemove(odbDatabase)
        Exit Sub
    End If
        
    '上期開始月
    gstrKamiStM = Format(Trim(odbDatabase.Parameters("OtStrKamiStM")), "00")
    '上期開始日
    gstrKamiStD = Format(Trim(odbDatabase.Parameters("OtStrKamiStD")), "00")
    '下期開始月
    gstrSimoStM = Format(Trim(odbDatabase.Parameters("OtStrSimoStM")), "00")
    '下期開始日
    gstrSimoStD = Format(Trim(odbDatabase.Parameters("OtStrSimoStD")), "00")

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '今年が何年度か判定する。
    If gdatSysDate >= CVDate(Format(gdatSysDate, "YYYY") & "/" & gstrKamiStM & "/" & gstrKamiStD) Then
        wk_yyyy = Val(Format(gdatSysDate, "yyyy"))
    Else
        wk_yyyy = Val(Format(gdatSysDate, "yyyy")) - 1
    End If
    
    '上期開始月と下期開始月を判定し、上期及び下期の開始年月日を設定する。
    If gstrKamiStM <= gstrSimoStM Then
        gstrKamiYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrKamiStM, "00") & "/" & Format(gstrKamiStD, "00")
        gstrSimoYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrSimoStM, "00") & "/" & Format(gstrSimoStD, "00")
    Else
        gstrKamiYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrKamiStM, "00") & "/" & Format(gstrKamiStD, "00")
        gstrSimoYMD = Format(wk_yyyy + 1, "0000") & "/" & Format(gstrSimoStM, "00") & "/" & Format(gstrSimoStD, "00")
    End If
    
    '中間決算年月日
    gstrChuKesYMD = Format(DateAdd("d", -1, CVDate(gstrSimoYMD)), "yyyy/mm/dd")
    '決算年月日
    gstrKesYMD = Format(DateAdd("d", -1, CVDate(DateAdd("yyyy", 1, CVDate(gstrKamiYMD)))), "yyyy/mm/dd")
    '中間決算月
    gstrChuKesM = Format(CVDate(gstrChuKesYMD), "mm")
    '中間決算日
    gstrChuKesD = Format(CVDate(gstrChuKesYMD), "dd")
    '決算月
    gstrKesM = Format(CVDate(gstrKesYMD), "mm")
    '決算日
    gstrKesD = Format(CVDate(gstrKesYMD), "dd")
    '出力年
    gstrSyuYYYY = Format(gstrKamiYMD, "yyyy")
    
    Exit Sub

errKamiSimoSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

Public Sub GetZanYMD()

    Dim strSQL               As String

On Error GoTo errZanYMD
    
    'ＳＰ
    '残高更新日
    odbDatabase.Parameters.Add "OtStrZanYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZanYMD").ServerType = ORATYPE_CHAR
   
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030GetZanYMD (" & _
        ":OtStrZanYMD); END;"
    
    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

    '残高更新日
    If Not IsNull(odbDatabase.Parameters("OtStrZanYMD")) And Trim(odbDatabase.Parameters("OtStrZanYMD")) <> "" Then
        gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)
    Else
        gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    Exit Sub

errZanYMD:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

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

    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030SelSyainZoku(" & _
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
    frmQPAV_CEnt030.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '個人名カナ
    frmQPAV_CEnt030.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '個人名漢字
    frmQPAV_CEnt030.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '店コード
    frmQPAV_CEnt030.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '店名
    frmQPAV_CEnt030.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '東西区分
    frmQPAV_CEnt030.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '部門コード
    frmQPAV_CEnt030.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '部門名
    frmQPAV_CEnt030.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '資格コード
    frmQPAV_CEnt030.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '等級コード
    '生年月日編集
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '生年月日
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt030.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt030.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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

Public Function gfuncSPSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim strWk                As String ''''2002/03/26 ＳＰ返却値[区分]変更に伴い　編集追加

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    gfuncSPSet = False
    
    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt030.sprList)
    
    'ＳＰ
    '社員コード
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    '精算区分
    odbDatabase.Parameters.Add "InStrSeiKBN", gstrKbn, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeiKBN").ServerType = ORATYPE_CHAR
    
    '精算年月日
    odbDatabase.Parameters.Add "InStrSeiYMD", gstrSeiYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeiYMD").ServerType = ORATYPE_CHAR
 
    '開始日付１
    odbDatabase.Parameters.Add "InStrStrYMD1", gstrStrYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD1").ServerType = ORATYPE_CHAR
 
    '開始日付２
    odbDatabase.Parameters.Add "InStrStrYMD2", gstrStrYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD2").ServerType = ORATYPE_CHAR
 
    '開始日付３
    odbDatabase.Parameters.Add "InStrStrYMD3", gstrStrYMD3, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD3").ServerType = ORATYPE_CHAR
 
    '終了日付
    odbDatabase.Parameters.Add "InStrEndYMD", gstrEndYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrEndYMD").ServerType = ORATYPE_CHAR

    '出力年
    odbDatabase.Parameters.Add "InStrShoYYYY", gstrSyuYear, ORAPARM_INPUT
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
    
    'ADD 20100225 0908047 NBC ISHIDA START
    '分解戻し元金
    odbDatabase.Parameters.Add "OtNumGanKinMod", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGanKinMod").ServerType = ORATYPE_NUMBER

    '分解戻し利息
    odbDatabase.Parameters.Add "OtNumRisokuMod", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRisokuMod").ServerType = ORATYPE_NUMBER
    'ADD 20100225 0908047 NBC ISHIDA END

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
    'ADD 20100225 0908047 NBC ISHIDA START
    strSQL = strSQL & ":OtNumGanKinMod,"
    strSQL = strSQL & ":OtNumRisokuMod,"
    'ADD 20100225 0908047 NBC ISHIDA END
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
            glngTblCnt = 0
            '総データ件数がZEROのときはエラー
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt030.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt030.txtSyainCd.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKeisan(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '処理日付
            gtblKeisan(i).YMD = odbDatabase.Parameters("OtStrYMD").Get_Value(g)
            '区分
'''''''''''''↓2002/03/26 ＳＰ返却値[区分]変更に伴い　編集追加
''''''''            gtblKeisan(i).KBN = odbDatabase.Parameters("OtStrKBN").Get_Value(g)
            ' MOD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
            'Select Case Left(odbDatabase.Parameters("OtStrKBN").Get_Value(g), 1)
            Select Case Right(odbDatabase.Parameters("OtStrKBN").Get_Value(g), 1)
            ' MOD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
                Case "1"
                    gtblKeisan(i).KBN = "繰越"
                Case "2"
                    gtblKeisan(i).KBN = "給与"
                Case "3"
                    gtblKeisan(i).KBN = "賞与"
                Case "4"
                    gtblKeisan(i).KBN = "貸付"
                Case "5"
                    gtblKeisan(i).KBN = "入金"
                Case "6"
                    gtblKeisan(i).KBN = "清算"
                'ADD 20100225 0908047 NBC ISHIDA START
                Case "7"
                    gtblKeisan(i).KBN = "振込"
                'ADD 20100225 0908047 NBC ISHIDA END
            End Select
'''''''''''''↑2002/03/26 ＳＰ返却値[区分]変更に伴い　編集追加
            
            '融資金額
            gtblKeisan(i).YusiKin = odbDatabase.Parameters("OtNumYusiKin").Get_Value(g)
            '返済金額
            gtblKeisan(i).HenKin = odbDatabase.Parameters("OtNumHenKin").Get_Value(g)
            '元金
            gtblKeisan(i).Gankin = odbDatabase.Parameters("OtNumGanKin").Get_Value(g)
            '利息
            gtblKeisan(i).Risoku = odbDatabase.Parameters("OtNumRisoku").Get_Value(g)
            '残高
            gtblKeisan(i).Zandaka = odbDatabase.Parameters("OtStrZandaka").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'ADD 20100225 0908047 NBC ISHIDA START
    '未収分の元金・利息表示対応
    If odbDatabase.Parameters("OtNumGanKinMod") <> 0 _
        Or odbDatabase.Parameters("OtNumRisokuMod") <> 0 Then
        
        '未収分の元金・利息取得
        frmQPAV_CEnt030.lblModGan = odbDatabase.Parameters("OtNumGanKinMod")
        frmQPAV_CEnt030.lblModRisoku = odbDatabase.Parameters("OtNumRisokuMod")
    
        frmQPAV_CEnt030.lblModGan = Format(frmQPAV_CEnt030.lblModGan.Caption, "#,##0") & "円"
        frmQPAV_CEnt030.lblModRisoku = Format(frmQPAV_CEnt030.lblModRisoku.Caption, "#,##0") & "円"
    
    
        '未収分の表示
        frmQPAV_CEnt030.lblModAnnai1.Visible = True
        frmQPAV_CEnt030.lblModAnnai2.Visible = True
        frmQPAV_CEnt030.lbltxtGan.Visible = True
        frmQPAV_CEnt030.lbltxtRisoku.Visible = True
        frmQPAV_CEnt030.lblModGan.Visible = True
        frmQPAV_CEnt030.lblModRisoku.Visible = True

    End If
    'ADD 20100225 0908047 NBC ISHIDA END

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt030.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 1, i, Left(gtblKeisan(i).YMD, 4) & "/" & Mid(gtblKeisan(i).YMD, 5, 2) & "/" & Right(gtblKeisan(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 2, i, Trim(gtblKeisan(i).KBN))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 3, i, Format(gtblKeisan(i).YusiKin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 4, i, Format(gtblKeisan(i).HenKin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 5, i, Format(gtblKeisan(i).Gankin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 6, i, Format(gtblKeisan(i).Risoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 7, i, Format(gtblKeisan(i).Zandaka, "#,##0"))
    Next i
    
    '入力制御処理
    '上部使用制御
    frmQPAV_CEnt030.txtSyainCd.Enabled = False
    frmQPAV_CEnt030.cmdName.Enabled = False
    frmQPAV_CEnt030.txtSYuturyokuhani.Enabled = False
    For i = 0 To 1
        frmQPAV_CEnt030.optSeisan(i).Enabled = False
        frmQPAV_CEnt030.optKamiSimoKi(i).Enabled = False
    Next i
    frmQPAV_CEnt030.txtSeisanbiY.Enabled = False
    frmQPAV_CEnt030.txtSeisanbiM.Enabled = False
    frmQPAV_CEnt030.txtSeisanbiD.Enabled = False
    
    '下部使用制御
    For i = 0 To 1
        frmQPAV_CEnt030.cmdPrint(i).Enabled = True
    Next i
    frmQPAV_CEnt030.cmdPFK(5).Enabled = False
    frmQPAV_CEnt030.cmdPrint(0).SetFocus
    
    gfuncSPSet = True
    
    Exit Function

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
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


