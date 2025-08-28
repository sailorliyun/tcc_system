Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt130"

'*********************************************************
'   SP用データ格納変数
'*********************************************************
 Public gstrSyainCD1            As String        '社員コード１
 Public gstrSyainCD2            As String        '社員コード２
 Public gstrSysDate             As String        'システム日付（サーバー）

    Public gDataAry()               As String


 Public lngErrCode           As Long          'ｴﾗｰｺｰﾄﾞ
 Public strErrDescription    As String        'ｴﾗｰﾒｯｾｰｼﾞ
 
 Public pubstrSakuseibi      As String       '作成日　10→11　画面遷移時作成日引渡し用
 
 Public gblnEndFlg           As Boolean      '詳細画面→照会画面遷移時処理用
                                             'True=ﾒﾆｭｰ ／ False=前画面
                                            
'****ｽﾌﾟﾚｯﾄﾞｼｰﾄの値を格納する********************
 Public gstrSSHakken    As String            '**
 Public gstrSSSouhu     As String            '**
 Public gstrSSDaisi     As String            '**
 Public gstrSSRiyousya  As String            '**
 Public gstrSSHikiotosi As String            '**
 Public gstrSSEmbos1    As String            '**
 Public gstrSSEmbos2    As String            '**
 Public gstrSSEmbos3    As String            '**
 Public gstrSSEmbos4    As String            '**
 Public gstrSSEmbos5    As String            '**
 Public gstrSSEmbos6    As String            '**
 Public gstrSSEmbos7    As String            '**
 Public gstrSSEmbos8    As String            '**
 Public gstrSSEmbos9    As String            '**
 Public gstrSSTouroku   As String            '**

 '5/15 add
 Public gstrSSNukitoriFlg    As String
 Public gstrSSNukitoriYMD    As String
 Public gstrSSUpdTanto       As String
 Public gstrSSUpdTantoMei    As String
 Public gstrSSUpdYMD         As String

'***********************************************

 Public strHakkouRiyu()      As String '''''発行理由表示用
 Public strHakkouRiyuName()  As String '''''発行理由表示用
 
 Public strFaceKbnNo() As String '''''フェイス区分表示用
 Public strFaceKbn()   As String '''''フェイス区分表示用
 

'--------------------------------------- 1/31 TEL結果用
 Public strKekkaKbnNo() As String '''''電話開通結果区分表示用
 Public strKekkaKbn()   As String '''''電話開通結果区分表示用

Type KekkaTbl
   Sakuseibi    As String
   KakuninTel   As String
   Kekka        As String
   TenkyoTel    As String
End Type
 
Public glngTblCnt       As Long
'--------------------------------------- 1/31 TEL結果用


'--------------------------------------- 5/29 更新画面用
 Public gblnUpdFlg            As Boolean      '更新判定用

 Public gstr012Kakitome       As String
 Public gstr012NukitoriFlg    As String
     
 Public gstrUpdNukiFlg        As String
 Public gstrUpdNukiYmd        As String
 Public gstrUpdTantoCd        As String
 Public gstrUpdTantoMei       As String
 Public gstrUpdDatetime       As String
'--------------------------------------- 5/29 更新画面用




'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '動作環境
    If App.PrevInstance Then
        MsgBox "社員融資問合わせは既に起動されています。" _
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

    frmQPAV_CEnt130.Show 1
 
End Sub


Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   排他制御（ロック）
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "InStrSikibetu", "130", ORAPARM_INPUT                      '識別コード
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrSyainCD1, ORAPARM_INPUT               '内部会員番号1
    odbDatabase.Parameters.Add "InStrKeyInfo2", gstrSyainCD2, ORAPARM_INPUT               '内部会員番号2
    odbDatabase.Parameters.Add "InStrProgramID", gcstrPrjName, ORAPARM_INPUT              'プログラムＩＤ
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピュータ名
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT       'オペレータＩＤ

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130Lock(" & _
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
        frmQPAV_CEnt130.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "130", ORAPARM_INPUT                  '識別
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   'コンピューター名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130UnLock(" _
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




