Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt090"
    Public blnLoadFlg           As Boolean
    Public Act_Row              As Long
    
    Public gstrBonusYMD1        As String
    Public gstrBonusYMD2        As String
    Public gstrKyuyoZen         As String
    Public gstrSyoyoZen         As String
    Public gstrKyuyoZen1        As String
    Public gstrSyoyoZen1        As String
    Public gstrKyuyoZen2        As String
    Public gstrSyoyoZen2        As String
    Public gstrZanYMD           As String
    
    Public gstrCode1            As String
    Public gstrCode2            As String
    Public gstrYusiYMD          As String
    Public gstrSeiYMD           As String
    Public glngNyukin           As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
    Public glngRisoku           As Long '精算金額のうちの利息の金額(glngNyukin - glngRisoku = 元本)
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    Type KeisanTbl
        YusiYMD                 As String
        Riritu                  As Double
        Kaisu                   As Integer
        KyuyoYusi               As Long
        SyoyoYusi               As Long
        KyuyoZan                As Long
        SyoyoZan                As Long
        KansaiYMD               As String
        KyuyoHen                As Long
        SyoyoHen                As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
        KyuyoMod                As Long     '給与残高(分解戻し分)
        SyoyoMod                As Long     '賞与残高(分解戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
    End Type
    
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 
    Public gstrSysDate             As String          'システム日付
    Public gdatSysDate             As Date            'システム日付

'10/24 ADD
    Public Const gstrSysChgYMD = "2000/03/01"
    Public Const gstrSysChgYMD2 = "2001/11/01"

'2005/01/26 ADD
'コードテーブル
Type CodeTbl
   CodeNo   As String
   Meisyou  As String
End Type
 
Public gstrCdT_Hakkoubi         As String       '発行日
Public gtblCdT_Hakkousya()      As CodeTbl      '発行者情報 配列
Public gstrCdT_LoanNm           As String       'ローン名称

Public glngCdT_HakkoubiCnt      As Long         '発行日の件数
Public glngCdT_HakkousyaCnt     As Long         '発行者情報の配列の件数
Public glngCdT_LoanNmCnt        As Long         'ローン名称の件数









'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "証書貸付入金入力は既に起動されています。" _
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

    frmQPAV_CEnt090.Show
 
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
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrCode1, ORAPARM_INPUT    '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode2, ORAPARM_INPUT    '社員コード２
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

    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090SelSyainZoku(" & _
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
    frmQPAV_CEnt090.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '個人名カナ
    frmQPAV_CEnt090.lblShimei.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '個人名漢字
    frmQPAV_CEnt090.lblShozoku(0).Caption = odbDatabase.Parameters("OtStrMiseCD")           '店コード
    frmQPAV_CEnt090.lblShozoku(1).Caption = odbDatabase.Parameters("OtStrMiseName")           '店名
    frmQPAV_CEnt090.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '東西区分
    frmQPAV_CEnt090.lblBumon(0).Caption = odbDatabase.Parameters("OtStrBumonCD")             '部門コード
    frmQPAV_CEnt090.lblBumon(1).Caption = odbDatabase.Parameters("OtStrBumonName")             '部門名
    frmQPAV_CEnt090.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '資格コード
    frmQPAV_CEnt090.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '等級コード
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
        frmQPAV_CEnt090.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt090.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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
    Dim Month_WORK           As String

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    gfuncSPSet = False

    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt090.sprList)
    frmQPAV_CEnt090.sprList.ReDraw = False
    frmQPAV_CEnt090.sprList.MaxRows = 0
    
    'ＳＰ
    '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    
    '社員コード２
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    
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

    '賞与支給日１
    odbDatabase.Parameters.Add "OtStrBonus1", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBonus1").ServerType = ORATYPE_CHAR
   
    '賞与支給日２
    odbDatabase.Parameters.Add "OtStrBonus2", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBonus2").ServerType = ORATYPE_CHAR

    '残高更新日
    odbDatabase.Parameters.Add "OtStrZanYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZanYMD").ServerType = ORATYPE_CHAR

    '融資日 配列
    odbDatabase.Parameters.AddTable "OtStrYusiYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8

    '利率 配列
    odbDatabase.Parameters.AddTable "OtNumRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '回数 配列
    odbDatabase.Parameters.AddTable "OtNumKaisu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与融資額 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoYusi", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与融資額 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoYusi", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与返済額 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoHen", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与返済額 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoHen", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与残高 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoZan", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoZan", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '給与残高(分解戻し分) 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高(分解戻し分) 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    '完済日 配列
    odbDatabase.Parameters.AddTable "OtStrKansaiYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090SelList ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrBonus1,"
    strSQL = strSQL & ":OtStrBonus2,"
    strSQL = strSQL & ":OtStrZanYMD,"
    strSQL = strSQL & ":OtStrYusiYMD,"
    strSQL = strSQL & ":OtNumRiritu,"
    strSQL = strSQL & ":OtNumKaisu,"
    strSQL = strSQL & ":OtNumKyuyoYusi,"
    strSQL = strSQL & ":OtNumSyoyoYusi,"
    strSQL = strSQL & ":OtNumKyuyoHen,"
    strSQL = strSQL & ":OtNumSyoyoHen,"
    strSQL = strSQL & ":OtNumKyuyoZan,"
    strSQL = strSQL & ":OtNumSyoyoZan,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":OtNumKyuyoMod,"
    strSQL = strSQL & ":OtNumSyoyoMod,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":OtStrKansaiYMD"
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
                frmQPAV_CEnt090.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt090.txtSyainCd1.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
            '抽出した内容を表示する
            gstrBonusYMD1 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus1"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus1"), 3, 2)
            gstrBonusYMD2 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus2"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus2"), 3, 2)
            If DateDiff("y", gstrBonusYMD1, gstrBonusYMD2) < 0 Then
                Month_WORK = gstrBonusYMD2
                gstrBonusYMD2 = gstrBonusYMD1
                gstrBonusYMD1 = Month_WORK
            End If
            If Trim(odbDatabase.Parameters("OtStrZanYMD")) = "" Then
                gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
            Else
                gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)     '残高更新日
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKeisan(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            gtblKeisan(i).YusiYMD = odbDatabase.Parameters("OtStrYusiYMD").Get_Value(g)
            gtblKeisan(i).Riritu = odbDatabase.Parameters("OtNumRiritu").Get_Value(g)
            gtblKeisan(i).Kaisu = odbDatabase.Parameters("OtNumKaisu").Get_Value(g)
            gtblKeisan(i).KyuyoYusi = odbDatabase.Parameters("OtNumKyuyoYusi").Get_Value(g)
            gtblKeisan(i).SyoyoYusi = odbDatabase.Parameters("OtNumSyoyoYusi").Get_Value(g)
            gtblKeisan(i).KyuyoHen = odbDatabase.Parameters("OtNumKyuyoHen").Get_Value(g)
            gtblKeisan(i).SyoyoHen = odbDatabase.Parameters("OtNumSyoyoHen").Get_Value(g)
            gtblKeisan(i).KyuyoZan = odbDatabase.Parameters("OtNumKyuyoZan").Get_Value(g)
            gtblKeisan(i).SyoyoZan = odbDatabase.Parameters("OtNumSyoyoZan").Get_Value(g)
'ADD 20100225 0908047 NBC YOKOYAMA START
            gtblKeisan(i).KyuyoMod = odbDatabase.Parameters("OtNumKyuyoMod").Get_Value(g)   '給与残高(分解戻し分)
            gtblKeisan(i).SyoyoMod = odbDatabase.Parameters("OtNumSyoyoMod").Get_Value(g)   '賞与残高(分解戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
            gtblKeisan(i).KansaiYMD = odbDatabase.Parameters("OtStrKansaiYMD").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '画面に表示
    Call SpreadSet
    frmQPAV_CEnt090.sprList.ReDraw = True
    
    '入力制御処理
    For i = 0 To 2
        frmQPAV_CEnt090.cmdExec(i).Enabled = True
    Next i
    frmQPAV_CEnt090.cmdPFK(5).Enabled = False
    
    frmQPAV_CEnt090.cmdName.Enabled = False
    frmQPAV_CEnt090.txtSyainCd1.Enabled = False
    frmQPAV_CEnt090.txtSyainCd2.Enabled = False
    
    '2005/01/25 From 完済通知書対応
    frmQPAV_CEnt090.cmdPrint.Enabled = True
    '2005/01/25 To   完済通知書対応
    
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

Public Sub SpreadSet()

    Dim i                   As Integer
    Dim KyuyoZenYMD_WORK    As String
    Dim SyoyoZenYMD_WORK    As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    
    Dim YusiYMD_WORK        As String
    Dim KyuyoZan_Work       As Long
    Dim SyoyoZan_Work       As Long
    
    '抽出レコードをリストに表示
    frmQPAV_CEnt090.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        '************************************
        '給与前回返済日、賞与前回返済日を求める
        '************************************
        YusiYMD_WORK = Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2)
        KyuyoZan_Work = gtblKeisan(i).KyuyoZan
        SyoyoZan_Work = gtblKeisan(i).SyoyoZan
        If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(gdatSysDate, "yyyy/mm/01"))) < 0 Then
            KyuyoZenYMD_WORK = ""
        Else
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                KyuyoZenYMD_WORK = Format$(gdatSysDate, "yyyy/mm/25")
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, gdatSysDate), "yyyy/mm/25")
            End If
        End If
        '* 給与の前回返済日の表示の不具合の対応
        If Val(Format(KyuyoZenYMD_WORK, "yyyymm")) = Val(Format(YusiYMD_WORK, "yyyymm")) Then
            KyuyoZenYMD_WORK = ""
        End If
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            SyoyoZenYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            SyoyoZenYMD_WORK = gstrBonusYMD1
        Else
            SyoyoZenYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
            SyoyoZenYMD_WORK = ""
        End If
        gstrKyuyoZen1 = IIf(KyuyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), KyuyoZenYMD_WORK)
        gstrSyoyoZen1 = IIf(SyoyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), SyoyoZenYMD_WORK)
        If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(gdatSysDate, "yyyy/mm/01"))) < 0 Then
            KyuyoZenYMD_WORK = ""
        Else
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                KyuyoZenYMD_WORK = Format$(gdatSysDate, "yyyy/mm/25")
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, gdatSysDate), "yyyy/mm/25")
            End If
        End If
        '* 給与の前回返済日の表示の不具合の対応
        If Val(Format(KyuyoZenYMD_WORK, "yyyymm")) = Val(Format(YusiYMD_WORK, "yyyymm")) Then
            KyuyoZenYMD_WORK = ""
        End If
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            SyoyoZenYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            SyoyoZenYMD_WORK = gstrBonusYMD1
        Else
            SyoyoZenYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
            SyoyoZenYMD_WORK = ""
        End If
        gstrKyuyoZen2 = IIf(IsNull(KyuyoZenYMD_WORK), Null, KyuyoZenYMD_WORK)
        gstrSyoyoZen2 = IIf(IsNull(SyoyoZenYMD_WORK), Null, SyoyoZenYMD_WORK)
        
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 1, i, Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 2, i, Format(gtblKeisan(i).Riritu, "#0.00") & "%")
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 3, i, Format(gtblKeisan(i).Kaisu, "#0") & "回")
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 4, i, Format(gtblKeisan(i).KyuyoYusi + gtblKeisan(i).SyoyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 5, i, Format(gtblKeisan(i).KyuyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 6, i, Format(gtblKeisan(i).SyoyoYusi, "#,##0"))
        If Trim(gtblKeisan(i).KansaiYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 10, i, Left(gtblKeisan(i).KansaiYMD, 4) & "/" & Mid(gtblKeisan(i).KansaiYMD, 5, 2) & "/" & Right(gtblKeisan(i).KansaiYMD, 2))
'ADD 20100225 0908047 NBC YOKOYAMA START
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 11, i, 0)   '給与残高(通常分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 12, i, 0)   '賞与残高(通常分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 13, i, 0)   '給与残高(分解戻し分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 14, i, 0)   '賞与残高(分解戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
        Else
'MOD 20100225 0908047 NBC YOKOYAMA START
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).SyoyoZan, "#,##0"))
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
            '残高　【給与残高(通常分)＋給与残高(分解戻し分)＋賞与残高(通常分)＋賞与残高(分解戻し分)】
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod + gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
            '給与残高　【給与残高(通常分)＋給与残高(分解戻し分)】
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod, "#,##0"))
            '賞与残高　【賞与残高(通常分)＋賞与残高(分解戻し分)】
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, Format(gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
'MOD 20100225 0908047 NBC YOKOYAMA END
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 10, i, "")
'ADD 20100225 0908047 NBC YOKOYAMA START
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 11, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))   '給与残高(通常分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 12, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))   '賞与残高(通常分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 13, i, Format(gtblKeisan(i).KyuyoMod, "#,##0"))   '給与残高(分解戻し分)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 14, i, Format(gtblKeisan(i).SyoyoMod, "#,##0"))   '賞与残高(分解戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
        End If
        gstrKyuyoZen = KyuyoZenYMD_WORK
        gstrSyoyoZen = SyoyoZenYMD_WORK
    Next i

End Sub

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '社員コード２
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '融資日
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrSeiYMD, ORAPARM_INPUT              '入金日
'MOD 20100225 0908047 NBC YOKOYAMA START
    'odbDatabase.Parameters.Add "InNumNyukin", glngNyukin, ORAPARM_INPUT                 '入金額
    odbDatabase.Parameters.Add "InNumNyukin", glngNyukin - glngRisoku, ORAPARM_INPUT    '入金額(精算金額－利息)
'MOD 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
    odbDatabase.Parameters.Add "InNumRisoku", glngRisoku, ORAPARM_INPUT                 '利息
'ADD 20100225 0908047 NBC YOKOYAMA END
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatAdd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrNyukinYMD,"
    strSQL = strSQL & ":InNumNyukin,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":InNumRisoku,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPAdd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPAdd = True    '成功
    Exit Function
  
errSPAdd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPUpd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPUpd
    
    gfuncSPUpd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '社員コード２
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '融資日
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrSeiYMD, ORAPARM_INPUT              '入金日
'MOD 20100225 0908047 NBC YOKOYAMA START
    'odbDatabase.Parameters.Add "InNumNyukin", glngNyukin, ORAPARM_INPUT                 '入金額
    odbDatabase.Parameters.Add "InNumNyukin", glngNyukin - glngRisoku, ORAPARM_INPUT    '入金額(精算金額－利息)
'MOD 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
    odbDatabase.Parameters.Add "InNumRisoku", glngRisoku, ORAPARM_INPUT                 '利息
'ADD 20100225 0908047 NBC YOKOYAMA END
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatUpd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrNyukinYMD,"
    strSQL = strSQL & ":InNumNyukin,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":InNumRisoku,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPUpd
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPUpd = True    '成功
    Exit Function
  
errSPUpd:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPDel() As Boolean

    Dim strSQL               As String

On Error GoTo errSPDel
    
    gfuncSPDel = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '社員コード２
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '融資日
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '担当者名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatDel ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPDel
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True    '成功
    Exit Function
  
errSPDel:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "090", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode1, ORAPARM_INPUT                'キーコード１
    odbDatabase.Parameters.Add "InStrKeyInfo2", gstrCode2, ORAPARM_INPUT                'キーコード２
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090Lock(" & _
             ":strSikibetu,:InStrKeyInfo1,:InStrKeyInfo2,:strProgramID,:strComputerNM,:strOperatorID); END;"

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
        frmQPAV_CEnt090.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "090", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090UnLock(" _
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





'2005/01/26 ADD
'************************************************************************
'   初期処理 （コード名称取得）
'        コードテーブルよりコード名称を取得し配列に格納
'************************************************************************
Public Sub gsubGetCode()
    Dim strSQL               As String
    Dim i                    As Long
       
    Dim strWkAry             As String
       
    Const cnslngAryLen       As Long = 100   '配列の最大桁数
    Const cnsMaxRec          As Long = 100   '配列の件数  及び、１回で取得するＭＡＸの件数
    '---------------------------------------------------

On Error GoTo gsubGetCode_ERR


    'ＳＰ
    '発行日の取得件数
    odbDatabase.Parameters.Add "OtNumDP4Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP4Count").ServerType = ORATYPE_NUMBER
    '発行日の配列
    odbDatabase.Parameters.AddTable "OtStrDP4Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    '発行者情報の取得件数
    odbDatabase.Parameters.Add "OtNumDP5Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP5Count").ServerType = ORATYPE_NUMBER
    '発行者情報名称の配列
    odbDatabase.Parameters.AddTable "OtStrDP5Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    'ローン名称の取得件数
    odbDatabase.Parameters.Add "OtNumDP6Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP6Count").ServerType = ORATYPE_NUMBER
    'ローン名称の配列
    odbDatabase.Parameters.AddTable "OtStrDP6Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    'ＳＱＬ分の作成
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090Init("
    strSQL = strSQL & ":OtNumDP4Count,"
    strSQL = strSQL & ":OtStrDP4Ary,"
    strSQL = strSQL & ":OtNumDP5Count,"
    strSQL = strSQL & ":OtStrDP5Ary,"
    strSQL = strSQL & ":OtNumDP6Count,"
    strSQL = strSQL & ":OtStrDP6Ary); END;"

     'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)

    
    '■■■ 発行日を格納 ■■■
    gstrCdT_Hakkoubi = ""
    glngCdT_HakkoubiCnt = odbDatabase.Parameters("OtNumDP4Count")
    If glngCdT_HakkoubiCnt > 0 Then
        strWkAry = odbDatabase.Parameters("OtStrDP4Ary").Get_Value(0)
        gstrCdT_Hakkoubi = Trim$(gfncstrDlm2(strWkAry, 2))
    End If
    
    '■■■ 発行者情報を配列に格納 ■■■
    glngCdT_HakkousyaCnt = odbDatabase.Parameters("OtNumDP5Count")
    If glngCdT_HakkousyaCnt > 0 Then
        ReDim gtblCdT_Hakkousya(1 To glngCdT_HakkousyaCnt)
        For i = 1 To glngCdT_HakkousyaCnt
            strWkAry = odbDatabase.Parameters("OtStrDP5Ary").Get_Value(i - 1)
            '発行者情報
            gtblCdT_Hakkousya(i).CodeNo = Trim$(gfncstrDlm2(strWkAry, 1))
            gtblCdT_Hakkousya(i).Meisyou = Trim$(gfncstrDlm2(strWkAry, 2))
        Next i
    End If
   
    '■■■ ローン名称を格納 ■■■
    gstrCdT_LoanNm = ""
    glngCdT_LoanNmCnt = odbDatabase.Parameters("OtNumDP6Count")
    If glngCdT_LoanNmCnt > 0 Then
        strWkAry = odbDatabase.Parameters("OtStrDP6Ary").Get_Value(0)
        gstrCdT_LoanNm = Trim$(gfncstrDlm2(strWkAry, 2))
    End If
   
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    Exit Sub

gsubGetCode_ERR:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

























