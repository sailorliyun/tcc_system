Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt160"

'*********************************************************
'   SP用データ格納変数
'*********************************************************
 Public gstrSyainCD1            As String        '社員コード１
 Public gstrSyainCD2            As String        '社員コード２
 Public gstrSysDate             As String        'システム日付（サーバー）

 Public gKogutiAry()               As String
 Public gDataAry()               As String


 Public lngErrCode           As Long          'ｴﾗｰｺｰﾄﾞ
 Public strErrDescription    As String        'ｴﾗｰﾒｯｾｰｼﾞ
 
 Public pubstrSakuseibi      As String       '作成日　10→11　画面遷移時作成日引渡し用

'***********************************************
 
Public glngTblCnt       As Long

'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "控除中止処理は既に起動されています。" _
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

    frmQPAV_CEnt160.Show 1
 
End Sub

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   排他制御（ロック）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "InStrSikibetu", "160", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrSyainCD1, ORAPARM_INPUT               '内部会員番号1
    odbDatabase.Parameters.Add "InStrKeyInfo2", gstrSyainCD2, ORAPARM_INPUT               '内部会員番号2
    odbDatabase.Parameters.Add "InStrProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160Lock(" & _
             ":InStrSikibetu,:InStrKeyInfo1,:InStrKeyInfo2,:InStrProgramID," & _
             ":InStrComputerNM,:InStrOperatorID); END;"

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
        frmQPAV_CEnt160.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "160", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160UnLock(" _
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





