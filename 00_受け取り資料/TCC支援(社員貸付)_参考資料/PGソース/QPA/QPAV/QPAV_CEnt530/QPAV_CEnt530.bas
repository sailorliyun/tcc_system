Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt530"
    Public blnLoadFlg           As Boolean  '初期フラグ
    Public blnRptToWindow       As Boolean  'True：プレビュー、False：印刷
    Public gstrSysDate          As String          'システム日付
    Public gdatSysDate          As Date            'システム日付

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "新貸付金残高表は既に起動されています。" _
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

    frmQPAV_CEnt530.Show 1
 
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

