Attribute VB_Name = "basQPAV_CEnt410"
Option Explicit
'************************************************************************************
'  髙島屋クレジット 支援システム
'    サブシステム名： 社員貸付システム（ＰＡ）
'---------------------------------------
'    機能名　　　　： QPAV_CEnt410     完済通知書印刷
'    機能内容　　　： 完済した社員に完済通知書を印刷する
'    モジュール　　： basQPAV_CEnt410
'---------------------------------------
'   作成日　 ： 2005/01/20
'   担当者　 ： FIP SEKINE
'---------------------------------------
'   修正日　 ： 9999/99/99
'   修正内容 ： ＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮ
'************************************************************************************



'フラグ
Public gblnInitFlg             As Boolean    '初期フラグ


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


'システム日付
Public gstrSysDate              As String




'CONST
Public Const gcstrPrjName = "QPAV_CEnt410"



'*************************************************************
'* 起動　ＭＡＩＮ
'*************************************************************
Public Sub Main()
    Dim strCmdLine            As String
    '---------------------------------------------------------
    
    'コマンドライン引数の取得
    strCmdLine = Command()
    
    'コマンドライン引数のチェック
    If strCmdLine = "" Then
        MsgBox "起動パラメータが設定されていません。" _
                , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If

    'コマンドライン引数を編集する
    Call gsubGetCommandLine(strCmdLine)

    gblnInitFlg = True
    
    '画面表示
    frmQPAV_CEnt410.Show

End Sub





'************************************************************************
'   初期処理 （コード名称取得）
'        コードテーブルよりコード名称を取得し配列に格納
'************************************************************************
Public Sub gsubSPInit()
    Dim strSQL               As String
    Dim i                    As Long
       
    Dim strWkAry             As String
       
    Const cnslngAryLen       As Long = 100   '配列の最大桁数
    Const cnsMaxRec          As Long = 100   '配列の件数  及び、１回で取得するＭＡＸの件数
    '---------------------------------------------------

On Error GoTo gsubSPInit_ERR


    'ＳＰ
    'システム日付
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_CHAR
    
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
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410Init("
    strSQL = strSQL & ":OtStrSysDate,"
    strSQL = strSQL & ":OtNumDP4Count,"
    strSQL = strSQL & ":OtStrDP4Ary,"
    strSQL = strSQL & ":OtNumDP5Count,"
    strSQL = strSQL & ":OtStrDP5Ary,"
    strSQL = strSQL & ":OtNumDP6Count,"
    strSQL = strSQL & ":OtStrDP6Ary); END;"

     'SPの実行
    odbDatabase.DbexecuteSQL (strSQL)

    'システム日付
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")

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

gsubSPInit_ERR:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub










