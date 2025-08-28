Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt140"

'*********************************************************
'   SP用データ格納変数
'*********************************************************
 Public gstrSyoriKbn            As String        '処理区分　１:給与　２：賞与
 Public gstrSyoriYM             As String        '処理年月
 Public gDataAry()              As String        '控除連絡表集約データ配列
 Public gMDataAry()             As String        '未控除連絡表集約データ配列
 Public gstrSysDate             As String          'システム日付
 Public gstrBonusYM             As String        '最新賞与控除日付
 
 Public glngTblCnt              As Long
 
'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "控除連絡表印刷は既に起動されています。" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If
'
    'コマンドライン引数の取得
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "起動パラメータが設定されていません。" _
                , vbExclamation Or vbOKOnly, gcstrPrjName

        Exit Sub
    End If

    'コマンドライン引数を編集する
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt140.Show 1
 
End Sub

'************************************************************************
'   初期処理
'        ｺｰﾄﾞ名称取得・システム日付取得
'************************************************************************
Public Sub gsubSPInit()
Dim strSQL               As String

On Error GoTo errSPInit

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

Public Sub gsubSPGetYM()
Dim strSQL               As String

On Error GoTo errSPInit

    'ＳＰ
    'システム日付
    odbDatabase.Parameters.Add "OtMei", Space(80), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtMei").ServerType = ORATYPE_VARCHAR2
   
    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140GetYM(" & _
             ":OtMei); END;"
    'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)

    gstrBonusYM = Trim$(odbDatabase.Parameters("OtMei"))
    
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

