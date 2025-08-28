Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt050"
 Public bInit_Flg   As Boolean

'*********************************************************
'   SP用データ格納変数
'*********************************************************

 Public lngErrCode           As Long          'ｴﾗｰｺｰﾄﾞ
 Public strErrDescription    As String        'ｴﾗｰﾒｯｾｰｼﾞ
 Public pubstrSakuseibi      As String       '作成日　10→11　画面遷移時作成日引渡し用
 Public gblnEndFlg           As Boolean      '詳細画面→照会画面遷移時処理用
                                             'True=ﾒﾆｭｰ ／ False=前画面
                                            
Type kasitukeTbl
   TorihikiHMS   As String
   Kasituketen   As String
   WSName        As String
   MiseCD        As String
   BumonCD       As String
   SyainCD       As String
   SimeiKanji    As String
   Kingaku       As Long
   Zandaka       As Long
   Gendo         As Long
End Type
 
Public gtblKasituke()   As kasitukeTbl
Public glngTblCnt       As Long

Public gstrSyoriYMD     As String
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "貸付金日報は既に起動されています。" _
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

    frmQPAV_CEnt050.Show 1
 
End Sub

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long  '
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    'スプレッドクリア
    Call gsubSpdClear(frmQPAV_CEnt050.sprList)
    
    'ＳＰ
    '貸付日付
    odbDatabase.Parameters.Add "InStrTorihikiYMD", gstrSyoriYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
    
    'ユーザーID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_CHAR
    
    'コンピューター名称
    odbDatabase.Parameters.Add "InStrCompNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCompNM").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    'カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER

    '貸付時刻 配列
    odbDatabase.Parameters.AddTable "OtStrTorihikiHMS", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '貸付店 配列
    odbDatabase.Parameters.AddTable "OtStrKasituketen", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    'ＷＳ名 配列
    odbDatabase.Parameters.AddTable "OtStrWSName", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 8
    
    '店コード 配列
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '部門コード 配列
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '社員コード 配列
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '氏名漢字 配列
    odbDatabase.Parameters.AddTable "OtStrSimeiKanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '金額 配列
    odbDatabase.Parameters.AddTable "OtNumKingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '残高 配列
    odbDatabase.Parameters.AddTable "OtNumZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '限度額 配列
    odbDatabase.Parameters.AddTable "OtNumGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
       
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt050PkG.QPAP_CEnt050SelList (" & _
            ":InStrTorihikiYMD,:InStrUserID,:InStrCompNM,:InNumMaxRec,:IoNumCursor," & _
            ":OtStrTorihikiHMS,:OtStrKasituketen,:OtStrWSName,:OtStrMiseCD,:OtStrBumonCD," & _
            ":OtStrSyainCD,:OtStrSimeiKanji,:OtNumKingaku,:OtNumZandaka,:OtNumGendo," & _
            ":OtNumRecCount,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Cnt = 0
    Do
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
    
        If Cnt = 0 Then
            '抽出件数を表示する
            'ﾃｰﾌﾞﾙ件数用
            Erase gtblKasituke
            glngTblCnt = 0
        
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = 該当データが存在しません。
                frmQPAV_CEnt050.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt050.txtTouroku(0).SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '配列の再定義
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKasituke(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '貸付時刻
            gtblKasituke(i).TorihikiHMS = odbDatabase.Parameters("OtStrTorihikiHMS").Get_Value(g)
            '貸付店
            gtblKasituke(i).Kasituketen = odbDatabase.Parameters("OtStrKasituketen").Get_Value(g)
            'ＷＳ名
            gtblKasituke(i).WSName = odbDatabase.Parameters("OtStrWSName").Get_Value(g)
            '店コード
            gtblKasituke(i).MiseCD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(g)
            '部門コード
            gtblKasituke(i).BumonCD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(g)
            '社員コード
            gtblKasituke(i).SyainCD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(g)
            '氏名漢字
            gtblKasituke(i).SimeiKanji = odbDatabase.Parameters("OtStrSimeiKanji").Get_Value(g)
            '金額
            gtblKasituke(i).Kingaku = odbDatabase.Parameters("OtNumKingaku").Get_Value(g)
            '残高
            gtblKasituke(i).Zandaka = odbDatabase.Parameters("OtNumZandaka").Get_Value(g)
            '限度額
            gtblKasituke(i).Gendo = odbDatabase.Parameters("OtNumGendo").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   'ループカウント＋１
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    '抽出レコードをリストに表示
    frmQPAV_CEnt050.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 1, i, Left(gtblKasituke(i).TorihikiHMS, 2) & ":" & Mid(gtblKasituke(i).TorihikiHMS, 3, 2) & ":" & Right(gtblKasituke(i).TorihikiHMS, 2))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 2, i, Trim(gtblKasituke(i).Kasituketen))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 3, i, Trim(gtblKasituke(i).WSName))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 4, i, Trim(gtblKasituke(i).MiseCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 5, i, Trim(gtblKasituke(i).BumonCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 6, i, Trim(gtblKasituke(i).SyainCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 7, i, Trim(gtblKasituke(i).SimeiKanji))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 8, i, Format(gtblKasituke(i).Kingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 9, i, Format(gtblKasituke(i).Zandaka, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 10, i, Format(gtblKasituke(i).Gendo, "#,##0"))
        If gtblKasituke(i).Zandaka > gtblKasituke(i).Gendo Then
            Call gsubSetCellText(frmQPAV_CEnt050.sprList, 11, i, "限度額オーバー")
        End If
    Next i
    
    '入力制御処理
    For i = 0 To 2
        frmQPAV_CEnt050.txtTouroku(i).Enabled = False
    Next i
    For i = 0 To 1
        frmQPAV_CEnt050.cmdPrint(i).Enabled = True
    Next i
    frmQPAV_CEnt050.cmdPFK(5).Enabled = False
    frmQPAV_CEnt050.cmdPrint(0).SetFocus

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


