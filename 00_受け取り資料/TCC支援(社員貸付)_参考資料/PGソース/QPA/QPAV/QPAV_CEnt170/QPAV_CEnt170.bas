Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt170"
    Public gtblJisya    As JisyaTbl
    Public bInit_Flg    As Boolean
    
    Type JisyaTbl
       JisyaCD          As String
       ZaimuCD          As String
       Syozaichi        As String
       KaisyaNM         As String
       FurikomiBK       As String
       KozaNO           As String
       KozaNM           As String
       KamikiM          As String
       KamikiD          As String
       SimokiM          As String
       SimokiD          As String
    End Type
 Public gstrSysDate             As String          'システム日付
 Public gdatSysDate             As Date            'システム日付

Public Sub Main()
'*****************************************************************************************
'   起動　ＭＡＩＮ
'*****************************************************************************************
    Dim strCmdLine As String
        
'    動作環境
    If App.PrevInstance Then
        MsgBox "自社登録内容変更処理は既に起動されています。" _
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

    frmQPAV_CEnt170.Show
    
End Sub

Public Sub gsubSPInit()
'*****************************************************************************************
'   自社マスタ取得処理
'*****************************************************************************************
    Dim strSQL  As String
    Dim i       As Long

On Error GoTo errSPInit

    'ＳＰ
    '会社コード
    odbDatabase.Parameters.Add "OtStrKaisyaCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisyaCD").ServerType = ORATYPE_CHAR
   
    '財務局コード
    odbDatabase.Parameters.Add "OtStrZaimuCD", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZaimuCD").ServerType = ORATYPE_VARCHAR2
    
    '所在地
    odbDatabase.Parameters.Add "OtStrSyozai", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '会社名
    odbDatabase.Parameters.Add "OtStrKaisyaNm", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisyaNm").ServerType = ORATYPE_VARCHAR2
    
    '振込先
    odbDatabase.Parameters.Add "OtStrFurikomi", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFurikomi").ServerType = ORATYPE_VARCHAR2
  
    '口座番号
    odbDatabase.Parameters.Add "OtStrKozaNo", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '口座名称
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
   
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170SelList (" & _
             ":OtStrKaisyaCD,:OtStrZaimuCD,:OtStrSyozai,:OtStrKaisyaNm,:OtStrFurikomi,:OtStrKozaNo," & _
             ":OtStrKozaNm,:OtStrKamiStM,:OtStrKamiStD,:OtStrSimoStM,:OtStrSimoStD); END;"

    'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)

    gtblJisya.JisyaCD = odbDatabase.Parameters("OtStrKaisyaCD")
    gtblJisya.ZaimuCD = odbDatabase.Parameters("OtStrZaimuCD")
    gtblJisya.Syozaichi = odbDatabase.Parameters("OtStrSyozai")
    gtblJisya.KaisyaNM = odbDatabase.Parameters("OtStrKaisyaNm")
    gtblJisya.FurikomiBK = odbDatabase.Parameters("OtStrFurikomi")
    gtblJisya.KozaNO = odbDatabase.Parameters("OtStrKozaNo")
    gtblJisya.KozaNM = odbDatabase.Parameters("OtStrKozaNm")
    gtblJisya.KamikiM = odbDatabase.Parameters("OtStrKamiStM")
    gtblJisya.KamikiD = odbDatabase.Parameters("OtStrKamiStD")
    gtblJisya.SimokiM = odbDatabase.Parameters("OtStrSimoStM")
    gtblJisya.SimokiD = odbDatabase.Parameters("OtStrSimoStD")
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    Exit Sub

errSPInit:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gsubSPUpd() As Boolean
'*****************************************************************************************
'   自社マスタ修正処理
'*****************************************************************************************
    Dim strSQL  As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    'ＳＰ
    '会社コード
    odbDatabase.Parameters.Add "InStrKaisyaCD", Trim(frmQPAV_CEnt170.lblJishaCD.Caption), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKaisyaCD").ServerType = ORATYPE_CHAR
   
    '財務局コード
    odbDatabase.Parameters.Add "InStrZaimuCD", Trim(frmQPAV_CEnt170.txtZaimukyokuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrZaimuCD").ServerType = ORATYPE_VARCHAR2
    
    '所在地
    odbDatabase.Parameters.Add "InStrSyozai", Trim(frmQPAV_CEnt170.txtSyozaiti.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '会社名
    odbDatabase.Parameters.Add "InStrKaisyaNm", Trim(frmQPAV_CEnt170.txtKaisyaName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKaisyaNm").ServerType = ORATYPE_VARCHAR2
    
    '振込先
    odbDatabase.Parameters.Add "InStrFurikomi", Trim(frmQPAV_CEnt170.txtFurikomiGinko.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrFurikomi").ServerType = ORATYPE_VARCHAR2
  
    '口座番号
    odbDatabase.Parameters.Add "InStrKozaNo", Trim(frmQPAV_CEnt170.txtKouzaBangou.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '口座名称
    odbDatabase.Parameters.Add "InStrKozaNm", Trim(frmQPAV_CEnt170.txtKouzaMeigi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKozaNm").ServerType = ORATYPE_VARCHAR2
    
    '上期開始月
    odbDatabase.Parameters.Add "InStrKamiStM", Trim(frmQPAV_CEnt170.txtKamikiKaisiMM.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKamiStM").ServerType = ORATYPE_CHAR
   
    '上期開始日
    odbDatabase.Parameters.Add "InStrKamiStD", Trim(frmQPAV_CEnt170.txtKamikiKaisiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKamiStD").ServerType = ORATYPE_CHAR
   
    '下期開始月
    odbDatabase.Parameters.Add "InStrSimoStM", Trim(frmQPAV_CEnt170.txtSimokiKaisiMM.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimoStM").ServerType = ORATYPE_CHAR
   
    '下期開始日
    odbDatabase.Parameters.Add "InStrSimoStD", Trim(frmQPAV_CEnt170.txtSimokiKaisiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimoStD").ServerType = ORATYPE_CHAR
    
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
    
    'ＳＱＬ文の作成
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170DatUpd (" & _
             ":InStrKaisyaCD,:InStrZaimuCD,:InStrSyozai,:InStrKaisyaNm,:InStrFurikomi," & _
             ":InStrKozaNo,:InStrKozaNm,:InStrKamiStM,:InStrKamiStD,:InStrSimoStM," & _
             ":InStrSimoStD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
             ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)

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

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   排他制御（ロック）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "strSikibetu", "170", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      'コンピュータ名
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170Lock(" & _
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
        frmQPAV_CEnt170.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "170", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170UnLock(" _
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


