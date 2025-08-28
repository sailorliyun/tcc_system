Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           現状、出力年月が「２月（下期末）」または「８月（上期末）」の時のみ
'                           表示している「未収利息給与分、賞与分、合計」を、「５月（四半期末）」
'                           および「１１月」にも表示するよう変更する。
'20100713  1004091          抽出条件にある東西区分を削除
'                           ※東西のデータを一度に表示・印刷を行う
'----------------------------------------------------------------------------------------------
    Public Const gcstrPrjName = "QPAV_CEnt150"
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
'ADD 20100225 0908047 NBC SAWAME START
    Public gstr14KesM           As String   '第一四半期決算月
    Public gstr34KesM           As String   '第三四半期決算月
'ADD 20100225 0908047 NBC SAWAME END
    
    'SP用変数
    Public gstrStrYMD           As String   '処理年月日
    Public gstrKBN              As String   '東西区分
    Public gstrKyuyoYMD         As String   '給与日付
    Public gintKyuyoNisu        As Integer  '給与日数
    '2003/01/24利息計算修正
    Public gintKyuyoNisuFrom    As String   '給与日数取得時の集計範囲(始)
    Public gintKyuyoNisuTo      As String   '給与日数取得時の集計範囲(終)

    Type ZandakaTbl
        Code                    As String
        MiseNM                  As String
        SCount                  As Long
        KCount                  As Long
        SyosyoZandaka           As Long
        KoguchiZandaka          As Long
        SyosyoMisyuK            As Long
        SyosyoMisyuS            As Long
        KoguchiMisyu            As Long
    End Type
 
    Public gtblZandaka()        As ZandakaTbl
    Public glngTblCnt           As Long
    Public gstrSysDate          As String          'システム日付
    Public gdatSysDate          As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
'mod 20101119 XXXXXXX imz.Yoshida start
'        MsgBox "貸付金残高表は既に起動されています。" _
'            , vbExclamation Or vbOKOnly, gcstrPrjName
        MsgBox "残高マイナスリストは既に起動されています。" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
'mod 20101119 XXXXXXX imz.Yoshida end
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

    frmQPAV_CEnt150.Show 1
 
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
        frmQPAV_CEnt150.lblMsg.Caption = "WPOE12 " & gstrGetCodeMeisyo(odbDatabase, "E12", "WPO")
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
'ADD 20100225 0908047 NBC SAWAME START
    '第一四半期決算月
    gstr14KesM = CStr(IIf(CInt(gstrChuKesM) + 3 > 12, CInt(gstrChuKesM) + 3 - 12, CInt(gstrChuKesM) + 3))
    '第三四半期決算月
    gstr34KesM = CStr(IIf(CInt(gstrKesM) + 3 > 12, CInt(gstrKesM) + 3 - 12, CInt(gstrKesM) + 3))
'ADD 20100225 0908047 NBC SAWAME END
    
    Exit Sub

errKamiSimoSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub


'**********************************************************************************************************************************
'*  Ver2
'*    賞与残高更新前データ取得　　(QPAY_SYNDAICYOWTより取得)
'**********************************************************************************************************************************
Public Sub gsubSPSet_BeforeUpdate()

    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Dim MiseNM_WORK          As String
    Dim KaisyaNM_WORK         As String
    Dim Count_WORK           As Long
    Dim SyosyoZandaka_WORK   As Long
    Dim KoguchiZandaka_WORK  As Long
    Dim SyosyoMisyuK_WORK    As Long
    Dim SyosyoMisyuS_WORK    As Long
    Dim KoguchiMisyu_WORK    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt150.sprList)
    frmQPAV_CEnt150.sprList.MaxRows = 0
    
    'ＳＰ
    '処理日付
    With odbDatabase.Parameters
        .Add "InStrYMD", gstrStrYMD, ORAPARM_INPUT
        .Item("InStrYMD").ServerType = ORATYPE_CHAR
        
        '東西区分
        .Add "InStrTozaiKBN", gstrKBN, ORAPARM_INPUT
        .Item("InStrTozaiKBN").ServerType = ORATYPE_CHAR
        
        '中間決算月
        .Add "InStrTyuSeiMM", gstrChuKesM, ORAPARM_INPUT
        .Item("InStrTyuSeiMM").ServerType = ORATYPE_CHAR
     
        '決算月
        .Add "InStrSeiMM", gstrKesM, ORAPARM_INPUT
        .Item("InStrSeiMM").ServerType = ORATYPE_CHAR
     
        '給与日付
        .Add "InStrKyuyoYMD", gstrKyuyoYMD, ORAPARM_INPUT
        .Item("InStrKyuyoYMD").ServerType = ORATYPE_CHAR
     
        '給与日数
        .Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT
        .Item("InNumKyuyoNisu").ServerType = ORATYPE_NUMBER
    
'        '2003/01/24 利息計算用集計範囲(始)
        .Add "InNumKyuyoNisuFrom", gintKyuyoNisuFrom, ORAPARM_INPUT
        .Item("InNumKyuyoNisuFrom").ServerType = ORATYPE_NUMBER
'
'        '2003/01/24 利息計算用集計範囲(終)
        .Add "InNumKyuyoNisuTo", gintKyuyoNisuTo, ORAPARM_INPUT
        .Item("InNumKyuyoNisuTo").ServerType = ORATYPE_NUMBER

        'MaxRec
        .Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
        .Item("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
        'カーソルＩＤ
        .Add "IoNumCursor", 0, ORAPARM_BOTH
        .Item("IoNumCursor").ServerType = ORATYPE_NUMBER
    
        '総検索件数
        .Add "OtNumRecCount", 0, ORAPARM_BOTH
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    
        '配列格納件数
        .Add "OtNumAryCount", 0, ORAPARM_OUTPUT
        .Item("OtNumAryCount").ServerType = ORATYPE_NUMBER
        
        '検索終了フラグ
        .Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
        .Item("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
        'コード 配列
        .AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
        '店名 配列
        .AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
        '証書件数 配列
        .AddTable "OtNumSCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口件数 配列
        .AddTable "OtNumKCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書残高 配列
        .AddTable "OtNumSyosyoZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口残高 配列
        .AddTable "OtNumKoguchiZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書未収利息給与 配列
        .AddTable "OtNumSyosyoMisyuK", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書未収利息賞与 配列
        .AddTable "OtNumSyosyoMisyuS", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口未収利息 配列
        .AddTable "OtNumKoguchiMisyu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '担当者コード
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        'コンピュータ名
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150SelList_Before ("
    strSQL = strSQL & ":InStrYMD,"
    strSQL = strSQL & ":InStrTozaiKBN,"
    strSQL = strSQL & ":InStrTyuSeiMM,"
    strSQL = strSQL & ":InStrSeiMM,"
    strSQL = strSQL & ":InStrKyuyoYMD,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumKyuyoNisuFrom,"
    strSQL = strSQL & ":InNumKyuyoNisuTo,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrCode,"
    strSQL = strSQL & ":OtStrMiseNM,"
    strSQL = strSQL & ":OtNumSCount,"
    strSQL = strSQL & ":OtNumKCount,"
    strSQL = strSQL & ":OtNumSyosyoZandaka,"
    strSQL = strSQL & ":OtNumKoguchiZandaka,"
    strSQL = strSQL & ":OtNumSyosyoMisyuK,"
    strSQL = strSQL & ":OtNumSyosyoMisyuS,"
    strSQL = strSQL & ":OtNumKoguchiMisyu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        'ＳＰの実行
        Call odbDatabase.DbexecuteSQL(strSQL)

        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblZandaka
            glngTblCnt = 0
            '総データ件数がZEROのときはエラー
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt150.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt150.txtSyuturyokuY.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblZandaka(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            'コード
            gtblZandaka(i).Code = odbDatabase.Parameters("OtStrCode").Get_Value(g)
            '店名
            gtblZandaka(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '証書件数
            gtblZandaka(i).SCount = odbDatabase.Parameters("OtNumSCount").Get_Value(g)
            '小口件数
            gtblZandaka(i).KCount = odbDatabase.Parameters("OtNumKCount").Get_Value(g)
            '証書残高
            gtblZandaka(i).SyosyoZandaka = odbDatabase.Parameters("OtNumSyosyoZandaka").Get_Value(g)
            '小口残高
            gtblZandaka(i).KoguchiZandaka = odbDatabase.Parameters("OtNumKoguchiZandaka").Get_Value(g)
            '証書未収利息給与
            gtblZandaka(i).SyosyoMisyuK = odbDatabase.Parameters("OtNumSyosyoMisyuK").Get_Value(g)
            '証書未収利息給与
            gtblZandaka(i).SyosyoMisyuS = odbDatabase.Parameters("OtNumSyosyoMisyuS").Get_Value(g)
            '小口未収利息
            gtblZandaka(i).KoguchiMisyu = odbDatabase.Parameters("OtNumKoguchiMisyu").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    j = 1
    For i = 1 To glngTblCnt
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "証書")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "小口")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "計")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount + gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka + gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS + gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
    Next i
    
    '入力制御処理
    '各コントロール制御
    frmQPAV_CEnt150.cmdPrint(0).Enabled = True
    frmQPAV_CEnt150.cmdPrint(1).Enabled = True
    frmQPAV_CEnt150.cmdPFK(5).Enabled = False
    frmQPAV_CEnt150.fraTozai.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuY.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuM.Enabled = False
    
    
    Exit Sub

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

'**********************************************************************************************************************************
'*  Ver2
'*    賞与残高更新後データ取得 (QPA8_SYNDAICYOTより取得)
'**********************************************************************************************************************************
Public Sub gsubSPSet_AfterUpdate()

    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Dim MiseNM_WORK          As String
    Dim KaisyaNM_WORK         As String
    Dim Count_WORK           As Long
    Dim SyosyoZandaka_WORK   As Long
    Dim KoguchiZandaka_WORK  As Long
    Dim SyosyoMisyuK_WORK    As Long
    Dim SyosyoMisyuS_WORK    As Long
    Dim KoguchiMisyu_WORK    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt150.sprList)
    frmQPAV_CEnt150.sprList.MaxRows = 0
    
    With odbDatabase.Parameters
        'ＳＰ
        '処理日付
        .Add "InStrYMD", gstrStrYMD, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
        
        '東西区分
        .Add "InStrTozaiKBN", gstrKBN, ORAPARM_INPUT
        .Item("InStrTozaiKBN").ServerType = ORATYPE_CHAR
        
        '中間決算月
        .Add "InStrTyuSeiMM", gstrChuKesM, ORAPARM_INPUT
        .Item("InStrTyuSeiMM").ServerType = ORATYPE_CHAR
     
        '決算月
        .Add "InStrSeiMM", gstrKesM, ORAPARM_INPUT
        .Item("InStrSeiMM").ServerType = ORATYPE_CHAR
     
        '給与日付
        .Add "InStrKyuyoYMD", gstrKyuyoYMD, ORAPARM_INPUT
        .Item("InStrKyuyoYMD").ServerType = ORATYPE_CHAR
     
        '給与日数
        .Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT
        .Item("InNumKyuyoNisu").ServerType = ORATYPE_NUMBER
     
'        '2003/01/24 利息計算用集計範囲(始)
        .Add "InNumKyuyoNisuFrom", gintKyuyoNisuFrom, ORAPARM_INPUT
        .Item("InNumKyuyoNisuFrom").ServerType = ORATYPE_NUMBER
'
'        '2003/01/24 利息計算用集計範囲(終)
        .Add "InNumKyuyoNisuTo", gintKyuyoNisuTo, ORAPARM_INPUT
        .Item("InNumKyuyoNisuTo").ServerType = ORATYPE_NUMBER
     
        'MaxRec
        .Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
        .Item("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
        'カーソルＩＤ
        .Add "IoNumCursor", 0, ORAPARM_BOTH
        .Item("IoNumCursor").ServerType = ORATYPE_NUMBER
    
        '総検索件数
        .Add "OtNumRecCount", 0, ORAPARM_BOTH
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    
        '配列格納件数
        .Add "OtNumAryCount", 0, ORAPARM_OUTPUT
        .Item("OtNumAryCount").ServerType = ORATYPE_NUMBER
        
        '検索終了フラグ
        .Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
        .Item("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
        'コード 配列
        .AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
        '店名 配列
        .AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
        '証書件数 配列
        .AddTable "OtNumSCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口件数 配列
        .AddTable "OtNumKCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書残高 配列
        .AddTable "OtNumSyosyoZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口残高 配列
        .AddTable "OtNumKoguchiZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書未収利息給与 配列
        .AddTable "OtNumSyosyoMisyuK", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '証書未収利息賞与 配列
        .AddTable "OtNumSyosyoMisyuS", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '小口未収利息 配列
        .AddTable "OtNumKoguchiMisyu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '担当者コード
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        'コンピュータ名
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150SelList_After ("
    strSQL = strSQL & ":InStrYMD,"
    strSQL = strSQL & ":InStrTozaiKBN,"
    strSQL = strSQL & ":InStrTyuSeiMM,"
    strSQL = strSQL & ":InStrSeiMM,"
    strSQL = strSQL & ":InStrKyuyoYMD,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumKyuyoNisuFrom,"
    strSQL = strSQL & ":InNumKyuyoNisuTo,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrCode,"
    strSQL = strSQL & ":OtStrMiseNM,"
    strSQL = strSQL & ":OtNumSCount,"
    strSQL = strSQL & ":OtNumKCount,"
    strSQL = strSQL & ":OtNumSyosyoZandaka,"
    strSQL = strSQL & ":OtNumKoguchiZandaka,"
    strSQL = strSQL & ":OtNumSyosyoMisyuK,"
    strSQL = strSQL & ":OtNumSyosyoMisyuS,"
    strSQL = strSQL & ":OtNumKoguchiMisyu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        'ＳＰの実行
        Call odbDatabase.DbexecuteSQL(strSQL)

        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblZandaka
            glngTblCnt = 0
            '総データ件数がZEROのときはエラー
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt150.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt150.txtSyuturyokuY.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblZandaka(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            'コード
            gtblZandaka(i).Code = odbDatabase.Parameters("OtStrCode").Get_Value(g)
            '店名
            gtblZandaka(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '証書件数
            gtblZandaka(i).SCount = odbDatabase.Parameters("OtNumSCount").Get_Value(g)
            '小口件数
            gtblZandaka(i).KCount = odbDatabase.Parameters("OtNumKCount").Get_Value(g)
            '証書残高
            gtblZandaka(i).SyosyoZandaka = odbDatabase.Parameters("OtNumSyosyoZandaka").Get_Value(g)
            '小口残高
            gtblZandaka(i).KoguchiZandaka = odbDatabase.Parameters("OtNumKoguchiZandaka").Get_Value(g)
            '証書未収利息給与
            gtblZandaka(i).SyosyoMisyuK = odbDatabase.Parameters("OtNumSyosyoMisyuK").Get_Value(g)
            '証書未収利息給与
            gtblZandaka(i).SyosyoMisyuS = odbDatabase.Parameters("OtNumSyosyoMisyuS").Get_Value(g)
            '小口未収利息
            gtblZandaka(i).KoguchiMisyu = odbDatabase.Parameters("OtNumKoguchiMisyu").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    j = 1
    For i = 1 To glngTblCnt
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "証書")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "小口")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "㈱高島屋")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "計")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount + gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka + gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '第一四決算月、第三四決算月追加
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS + gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
    Next i
    
    '入力制御処理
    '各コントロール制御
    frmQPAV_CEnt150.cmdPrint(0).Enabled = True
    frmQPAV_CEnt150.cmdPrint(1).Enabled = True
    frmQPAV_CEnt150.cmdPFK(5).Enabled = False
    frmQPAV_CEnt150.fraTozai.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuY.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuM.Enabled = False
    
    
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

'2002_05_28 機能追加：賞与日表示対応
'*********************************************************************************************
'*　　関数名　：　店テーブル賞与日取得
'*　　引　数　：　引数１（ｵﾌﾞｼﾞｪｸﾄ）
'*　　　　　　　　引数２（賞与区分　　上期：１　下期：以外）
'*　　　　　　　　引数３（賞与年月日）
'*　　結　果　：　店テーブルの一番近い賞与日を返す。
'*　　機能概要：　店テーブルの一番近い賞与日を返す。
'*　　機能追加：　２００２年５月２８日
'*********************************************************************************************
Public Function strGetShoyoDate(odbDatabase As Object, strShoyoKbn As String, _
                                 strShoyoDate As String) As String
Dim strCodeNo   As String
Dim objTable    As Object
Dim lngRet      As Long
Dim strSQL      As String
    
    On Error GoTo GetDate_Error
    
    strGetShoyoDate = ""
    
    
    'SQL文の作成
    strSQL = gstrGetCodeTableSQL(strShoyoKbn, strShoyoDate)
    
    Set objTable = odbDatabase.CreateDynaset(strSQL, ORADYN_DEFAULT)
    
    'テーブルオープン
    If objTable Is Nothing Then
        GoTo GetDate_Error
    End If
    
    If strShoyoKbn = "1" Then
        '上期賞与日データ取得
        If Not objTable.EOF Then
            strGetShoyoDate = objTable.Fields("MAX(QPAE_BONUSYMD1)")
        End If
    Else
        '下期賞与日データ取得
        If Not objTable.EOF Then
            strGetShoyoDate = objTable.Fields("MAX(QPAE_BONUSYMD2)")
        End If
    End If
    
    
    '解放
    Set objTable = Nothing
    
    Exit Function

GetDate_Error:

    
End Function


'2002_05_28 機能追加：賞与日表示対応
'*********************************************************************************************
'*　　関数名　：　店テーブルのSQL文作成
'*　　引　数　：　引数１（ｺｰﾄﾞ№）
'*　　　　　　　　引数２（ｺｰﾄﾞ区分）
'*　　結　果　：　引数にて作成したSQL文
'*　　機能概要：　引数にてｺｰﾄﾞﾃｰﾌﾞﾙ参照のSQL文を作成する。
'*　　機能追加：　２００２年５月２８日
'*********************************************************************************************
Public Function gstrGetCodeTableSQL(strShoyoKbn As String, strShoyoDate As String) As String
Dim strSQL As String
    
    If strShoyoKbn = "1" Then
    
        'SQL文の作成
        strSQL = "SELECT" _
            & " MAX(QPAE_BONUSYMD1)" _
            & " FROM" _
            & " QPAE_MISEM" _
            & " WHERE" _
            & " QPAE_BONUSYMD1 <= '" & Trim$(strShoyoDate) & "'"
    Else
  
        'SQL文の作成
        strSQL = "SELECT" _
            & " MAX(QPAE_BONUSYMD2)" _
            & " FROM" _
            & " QPAE_MISEM" _
            & " WHERE" _
            & " QPAE_BONUSYMD2 <= '" & Trim$(strShoyoDate) & "'"
  
    End If
    
    gstrGetCodeTableSQL = strSQL
    
End Function


