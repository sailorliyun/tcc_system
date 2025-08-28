Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           分解戻し対応、返送金額の算出方法修正
'----------------------------------------------------------------------------------------------

    Public Const gstrSysChgYMD = "2000/03/01"
    Public Const gcstrPrjName = "QPAV_CEnt100"
    Public blnLoadFlg           As Boolean
    Public glngSprCol           As Long
    Public gstrCode1            As String
    Public gstrCode2            As String
    Public gstrBonusYMD1        As String
    Public gstrBonusYMD2        As String
    Public gstrKyuyoZen1        As String
    Public gstrSyoyoZen1        As String
    Public gstrKyuyoZen2        As String
    Public gstrSyoyoZen2        As String
    Public gstrName             As String
    Public gstrMise             As String
    Public gstrYusiYMD          As String
    Public gstrSeiYMD           As String
    Public gstrTenKBN           As String
    Public gstrKyuyoKBN         As String
    Public gstrSyoyoKBN         As String
    Public glngKyuyoYusi        As Long
    Public glngSyoyoYusi        As Long
    Public glngKyuyoZan         As Long
    Public glngSyoyoZan         As Long
    Public gstrKyuyoStYMD       As String
    Public gstrSyoyoStYMD       As String
    Public gdblRiritu           As Double
    Public glngKyuyoRisoku      As Long
    Public glngSyoyoRisoku      As Long
    Public glngKyuyoTen         As Long
    Public glngSyoyoTen         As Long
    Public gstrZanYMD           As String
    Public gintKyuyoNisu        As Integer
    Public gintSyoyoNisu        As Integer

    Type KeisanTbl
        YusiYMD                 As String
        Riritu                  As Double
        Kaisu                   As Integer
        KyuyoYusi               As Long
        SyoyoYusi               As Long
        KyuyoHen                As Long
        SyoyoHen                As Long
        KyuyoZan                As Long
        SyoyoZan                As Long
'ADD 20100225 0908047 NBC SAWAME START
        KyuyoMod                As Long
        SyoyoMod                As Long
        KyuyoModRisoku          As Long
        SyoyoModRisoku          As Long
        KyuyoModAll             As Long
        SyoyoModAll             As Long
        KyuyoModRisokuAll       As Long
        SyoyoModRisokuAll       As Long
'ADD 20100225 0908047 NBC SAWAME END
    End Type
 
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'10/24 ADD
    Public Const gstrSysChgYMD2 = "2001/11/01"

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "個人貸付明細は既に起動されています。" _
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

    frmQPAV_CEnt100.Show 1
 
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

    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100SelSyainZoku(" & _
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
    frmQPAV_CEnt100.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '個人名カナ
    frmQPAV_CEnt100.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '個人名漢字
    frmQPAV_CEnt100.lblShozoku(0).Caption = odbDatabase.Parameters("OtStrMiseCD")           '店コード
    frmQPAV_CEnt100.lblShozoku(1).Caption = odbDatabase.Parameters("OtStrMiseName")           '店名
    frmQPAV_CEnt100.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '東西区分
    frmQPAV_CEnt100.lblBumon(0).Caption = odbDatabase.Parameters("OtStrBumonCD")             '部門コード
    frmQPAV_CEnt100.lblBumon(1).Caption = odbDatabase.Parameters("OtStrBumonName")             '部門名
    frmQPAV_CEnt100.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '資格コード
    frmQPAV_CEnt100.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '等級コード
    '生年月日編集
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '生年月日
    If IsNull(odbDatabase.Parameters("OtStrBornYMD").Value) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
  
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt100.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt100.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim Month_WORK           As String

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt100.sprList)
    frmQPAV_CEnt100.sprList.ReDraw = False
    frmQPAV_CEnt100.sprList.MaxRows = 0
    
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
    
'ADD 20100225 0908047 NBC SAWAME START
    '給与残高（分解戻し分元本(sysdate以前)） 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高（分解戻し分元本(sysdate以前)） 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与残高（分解戻し分利息(sysdate以前)） 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoModRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高（分解戻し分利息(sysdate以前)） 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoModRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与残高（分解戻し分元本(全て)） 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoModAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高（分解戻し分元本(全て)） 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoModAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '給与残高（分解戻し分利息(全て)） 配列
    odbDatabase.Parameters.AddTable "OtNumKyuyoModRisokuAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '賞与残高（分解戻し分利息(全て)） 配列
    odbDatabase.Parameters.AddTable "OtNumSyoyoModRisokuAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

'ADD 20100225 0908047 NBC SAWAME END
    
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100SelList ("
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
'MOD 20100225 0908047 NBC SAWAME START
'    strSQL = strSQL & ":OtNumSyoyoZan"
    strSQL = strSQL & ":OtNumSyoyoZan,"
    strSQL = strSQL & ":OtNumKyuyoMod,"
    strSQL = strSQL & ":OtNumSyoyoMod,"
    strSQL = strSQL & ":OtNumKyuyoModRisoku,"
    strSQL = strSQL & ":OtNumSyoyoModRisoku,"
    strSQL = strSQL & ":OtNumKyuyoModAll,"
    strSQL = strSQL & ":OtNumSyoyoModAll,"
    strSQL = strSQL & ":OtNumKyuyoModRisokuAll,"
    strSQL = strSQL & ":OtNumSyoyoModRisokuAll"
'MOD 20100225 0908047 NBC SAWAME END
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
                frmQPAV_CEnt100.lblkasituke.Caption = "0"
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt100.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt100.txtSyainCD1.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
            '抽出した内容を表示する
            gstrBonusYMD1 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus1"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus1"), 3, 2)
            gstrBonusYMD2 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus2"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus2"), 3, 2)
            If DateDiff("y", gstrBonusYMD1, gstrBonusYMD2) < 0 Then
                Month_WORK = gstrBonusYMD2
                gstrBonusYMD2 = gstrBonusYMD1
                gstrBonusYMD1 = Month_WORK
            End If
            If Trim(odbDatabase.Parameters("OtStrZanYMD")) <> "" Then
                gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)     '残高更新日
            Else
                gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
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
'ADD 20100225 0908047 NBC SAWAME START
            gtblKeisan(i).KyuyoMod = odbDatabase.Parameters("OtNumKyuyoMod").Get_Value(g)
            gtblKeisan(i).SyoyoMod = odbDatabase.Parameters("OtNumSyoyoMod").Get_Value(g)
            gtblKeisan(i).KyuyoModRisoku = odbDatabase.Parameters("OtNumKyuyoModRisoku").Get_Value(g)
            gtblKeisan(i).SyoyoModRisoku = odbDatabase.Parameters("OtNumSyoyoModRisoku").Get_Value(g)
            gtblKeisan(i).KyuyoModAll = odbDatabase.Parameters("OtNumKyuyoModAll").Get_Value(g)
            gtblKeisan(i).SyoyoModAll = odbDatabase.Parameters("OtNumSyoyoModAll").Get_Value(g)
            gtblKeisan(i).KyuyoModRisokuAll = odbDatabase.Parameters("OtNumKyuyoModRisokuAll").Get_Value(g)
            gtblKeisan(i).SyoyoModRisokuAll = odbDatabase.Parameters("OtNumSyoyoModRisokuAll").Get_Value(g)
'ADD 20100225 0908047 NBC SAWAME END
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '画面に表示
    Call SpreadSet
    frmQPAV_CEnt100.sprList.ReDraw = True
    
    '入力制御処理
    frmQPAV_CEnt100.cmdExec.Enabled = True
    frmQPAV_CEnt100.cmdName.Enabled = False
    frmQPAV_CEnt100.txtSyainCD1.Enabled = False
    frmQPAV_CEnt100.txtSyainCD2.Enabled = False
    frmQPAV_CEnt100.cmdPFK(5).Enabled = False
    
    Exit Sub

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

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
    frmQPAV_CEnt100.sprList.MaxRows = glngTblCnt
    
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
        
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 1, i, Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 2, i, Format(gtblKeisan(i).KyuyoYusi + gtblKeisan(i).SyoyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 3, i, Format(gtblKeisan(i).Riritu, "#0.00") & "%")
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 4, i, Format(gtblKeisan(i).Kaisu, "#0") & "回")
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 5, i, Format(gtblKeisan(i).KyuyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 6, i, Format(gtblKeisan(i).SyoyoYusi, "#,##0"))
'MOD 20100225 0908047 NBC SAWAME START
'        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
'        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 8, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
        '残元本 + 分解戻し分元本（システム日付以前の分）
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 8, i, Format(gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
'MOD 20100225 0908047 NBC SAWAME END
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 9, i, KyuyoZenYMD_WORK)
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 10, i, SyoyoZenYMD_WORK)
'ADD 20100225 0908047 NBC SAWAME START
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 11, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 12, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 13, i, Format(gtblKeisan(i).KyuyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 14, i, Format(gtblKeisan(i).SyoyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 15, i, Format(gtblKeisan(i).KyuyoModRisoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 16, i, Format(gtblKeisan(i).SyoyoModRisoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 17, i, Format(gtblKeisan(i).KyuyoModAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 18, i, Format(gtblKeisan(i).SyoyoModAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 19, i, Format(gtblKeisan(i).KyuyoModRisokuAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 20, i, Format(gtblKeisan(i).SyoyoModRisokuAll, "#,##0"))
'ADD 20100225 0908047 NBC SAWAME END
    Next i
    
    frmQPAV_CEnt100.lblkasituke.Caption = glngTblCnt

End Sub

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '社員コード２
    odbDatabase.Parameters.Add "InStrSimeiKanji", gstrName, ORAPARM_INPUT               '氏名漢字
    odbDatabase.Parameters.Add "InStrMiseNM", gstrMise, ORAPARM_INPUT                   '店名
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '融資日
    odbDatabase.Parameters.Add "InNumKyuyoHen", glngKyuyoYusi, ORAPARM_INPUT            '給与融資額
    odbDatabase.Parameters.Add "InNUMSyoyoHen", glngSyoyoYusi, ORAPARM_INPUT            '賞与融資額
    odbDatabase.Parameters.Add "InNumKyuyoZan", glngKyuyoZan, ORAPARM_INPUT             '給与残高
    odbDatabase.Parameters.Add "InNUMSyoyoZan", glngSyoyoZan, ORAPARM_INPUT             '賞与残高
    odbDatabase.Parameters.Add "InStrKyuyoStr", gstrKyuyoStYMD, ORAPARM_INPUT           '給与利息計算開始日
    odbDatabase.Parameters.Add "InStrSyoyoStr", gstrSyoyoStYMD, ORAPARM_INPUT           '賞与利息計算開始日
    odbDatabase.Parameters.Add "InStrSeisanYMD", gstrSeiYMD, ORAPARM_INPUT              '精算日
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                 '利率
    odbDatabase.Parameters.Add "InNumKyuyoRisoku", glngKyuyoRisoku, ORAPARM_INPUT       '給与利息
    odbDatabase.Parameters.Add "InNumSyoyoRisoku", glngSyoyoRisoku, ORAPARM_INPUT       '賞与利息
    odbDatabase.Parameters.Add "InStrTenbikiKBN", gstrTenKBN, ORAPARM_INPUT             '天引区分
    odbDatabase.Parameters.Add "InNumKyuyoTen", glngKyuyoTen, ORAPARM_INPUT             '給与天引額
    odbDatabase.Parameters.Add "InNumSyoyoTen", glngSyoyoTen, ORAPARM_INPUT             '賞与天引額
    odbDatabase.Parameters.Add "InStrKyuyoKBN", gstrKyuyoKBN, ORAPARM_INPUT             '給与更新区分
    odbDatabase.Parameters.Add "InStrSyoyoKBN", gstrSyoyoKBN, ORAPARM_INPUT             '賞与更新区分
    odbDatabase.Parameters.Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT           '給与日数
    odbDatabase.Parameters.Add "InNumSyoyoNisu", gintSyoyoNisu, ORAPARM_INPUT           '賞与日数
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT         '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100DatAdd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrSimeiKanji,"
    strSQL = strSQL & ":InStrMiseNM,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InNumKyuyoHen,"
    strSQL = strSQL & ":InNUMSyoyoHen,"
    strSQL = strSQL & ":InNumKyuyoZan,"
    strSQL = strSQL & ":InNUMSyoyoZan,"
    strSQL = strSQL & ":InStrKyuyoStr,"
    strSQL = strSQL & ":InStrSyoyoStr,"
    strSQL = strSQL & ":InStrSeisanYMD,"
    strSQL = strSQL & ":InNumRiritu,"
    strSQL = strSQL & ":InNumKyuyoRisoku,"
    strSQL = strSQL & ":InNumSyoyoRisoku,"
    strSQL = strSQL & ":InStrTenbikiKBN,"
    strSQL = strSQL & ":InNumKyuyoTen,"
    strSQL = strSQL & ":InNumSyoyoTen,"
    strSQL = strSQL & ":InStrKyuyoKBN,"
    strSQL = strSQL & ":InStrSyoyoKBN,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumSyoyoNisu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
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

'ADD 20100225 0908047 NBC YOKOYAMA START
'*********************************************************************************************
'*　　手続き名：　控除予定が分解戻しされていないかどうかを判断するSPを呼び出す
'*　　引　数　：　社員CD1、社員CD2、融資日、控除日、給与賞与区分
'*　　結　果　：　True…分解戻し有  False…分解戻し無
'*********************************************************************************************
Public Function gfuncCheckBunkaiModoshi(inStrSyainCD1 As String, _
                                        inStrSyainCD2 As String, _
                                        inStrYushiYMD As String, _
                                        inStrKojoYMD As String, _
                                        inStrYusiKBN As String) As Boolean
   
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errCheckBunkaiModoshi

    gfuncCheckBunkaiModoshi = False
    
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", inStrSyainCD1, ORAPARM_INPUT     '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", inStrSyainCD2, ORAPARM_INPUT     '社員コード２
    odbDatabase.Parameters.Add "InStrYusiYMD", inStrYushiYMD, ORAPARM_INPUT         '融資日
    odbDatabase.Parameters.Add "InStrKojoYMD", inStrKojoYMD, ORAPARM_INPUT          '控除日
    odbDatabase.Parameters.Add "InStrYusiKBN", inStrYusiKBN, ORAPARM_INPUT          '融資区分(３：給与、４：賞与)
    
    odbDatabase.Parameters.Add "OtStrFlg", "0", ORAPARM_OUTPUT                      '存在Flg
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR

    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100CheckModoshi(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":InStrYusiYMD, " & _
             ":InStrKojoYMD, " & _
             ":InStrYusiKBN, " & _
             ":OtStrFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("OtStrFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    gfuncCheckBunkaiModoshi = "1"

    Exit Function
    
errCheckBunkaiModoshi:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'ADD 20100225 0908047 NBC YOKOYAMA END

