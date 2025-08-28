Attribute VB_Name = "QPAV_Common2"
Option Explicit

'***************************************************************************
'*  発券情報管理   QYA
'*  共通モジュール
'***************************************************************************
'***************************************************************************
'*  ①会員番号外内変換
'*    呼出  ： gblnSeachKaiin()
'*    返却値： Boolean     True=OK    False=NG
'*--------------------------------------------------------------------------
'*  ②会員番号属性取得
'*    呼出  ： gblnSeachKaiin()
'*    返却値： Boolean     True=OK    False=NG
'***************************************************************************
 
 
'-------------------------------------------------------
'    ①会員番号外内変換用  変数
'-------------------------------------------------------
 Public gstrNaibuKaiinNo      As String  '内部会員番号 編集後  企業コード＋サブレンジキー＋内部会員番号
 Public gstrGaibuKaiinNo      As String  '外部会員番号



'-------------------------------------------------------
'    ②会員番号属性取得用  変数
'-------------------------------------------------------
'        QYAP_CEnt000SelKaiinZokuの出力ﾊﾟﾗﾒｰﾀに準拠
'----IN
 Public gstrKigyoCd           As String  '企業コード       ※ ①会員番号外内変換で取得後格納
 Public gstrSubRng            As String  'サブレンジキー   ※ ①会員番号外内変換で取得後格納
 Public gstrNaibuKaiin        As String  '内部会員番号     ※ ①会員番号外内変換で取得後格納
'----OUT
 Public gstrHONShimeiKana     As String  'フリガナ
 Public gstrHONShimeiKan      As String  '氏名
 Public gstrJTKYuubinNo       As String  '郵便番号
 Public gstrJTKJyushoKan      As String  '住所名漢字
 Public gstrJTKBanchiKan      As String  '番地漢字
 Public gstrJTKkataKan        As String  '方書漢字
 Public gstrJTKTelShigai      As String  '市外局番
 Public gstrJTKTelKyoku       As String  '局番
 Public gstrJTKTelNo          As String  'Tel番号
 Public gstrSeinengappi       As String  '生年月日
 Public gstrKanriTenCd        As String  '管理店コード
 Public gstrKanriTenMei       As String  '管理店名称
 Public gstrCardMei           As String  'カード名（カード区分）
 Public gstrSTSKozaMei        As String  '口座ステータス
 Public gstrYukoKigen         As String  '有効期限
 Public gstrHakken            As String  '発券日'''''''''''未使用
 Public gstrCardKbn           As String  'カード区分
 Public gstrGaibuSikibetu     As String  '外部会員識別番号
 Public gstrTozaiKbn          As String  '東西区分
'-------------------------------------------------------
'    編集後 格納
 Public gstrTelNoH            As String  '電話番号 編集後   XX-XXXX-XXXX
 Public gstrSeinengappiH      As String  '生年月日 編集後   ggg e年m月d日
 Public gstrYukoKigenH        As String  '有効期限 編集後   XXXX/XX
 Public gstrHakkenH           As String  '発券日   編集後   XXXX/XX/XX'''''''''''未使用



'*********************************************************************************************
'*　　手続き名：　内部会員番号取得ルーチン
'*　　引　数　：　外部会員番号
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*           ：  gstrGaibuKaiinNo 会員番号
'*           ：  strErrMsg…エラーメッセージ
'*           ：  エラーメッセージ
'*　　機能概要：　内部会員番号取得
'*********************************************************************************************
Public Function gblnGetNaibuKaiin(gstrGaibuKaiinNo As String, strErrMsg As String) As Boolean

    Dim strKekkaKaiinNo     As String
    Dim lngFukkiCd          As Long
    Dim strKigyouCd         As String
    Dim strSubRengiKey      As String
    Dim strNaibukaiinno     As String
    Dim strHKaiinNO(2)      As String
    Dim clsApp              As Object

    
    
On Error GoTo errblnGetKaiin

    gblnGetNaibuKaiin = False

    '照会用会員番号チェックルーチン(QSAV_ActX4701.DLL)
    Set clsApp = CreateObject("QSAV_ActX4701.ActX4701C")
    Call clsApp.subQSAV_ActX4701(gstrGaibuKaiinNo, lngFukkiCd, strKekkaKaiinNo)
    Set clsApp = Nothing

    '該当データなし
    If lngFukkiCd <> 0 Then
        strErrMsg = "WHOE03 " & gstrGetCodeMeisyo(odbDatabase, "E03", "WHO")
        Exit Function
    End If

    '内部会員番号取得ルーチン(QSAV_ActX3601.DLL)
    Set clsApp = CreateObject("QSAV_ActX3601.ActX3601C")
    Call clsApp.subQSAV_ActX3601(strKekkaKaiinNo, lngFukkiCd, strKigyouCd, strSubRengiKey, _
                                 strNaibukaiinno, odbDatabase)
    Set clsApp = Nothing

    '該当データなし
    If lngFukkiCd <> 0 And lngFukkiCd <> 1 Then
        strErrMsg = "WHOE03 " & gstrGetCodeMeisyo(odbDatabase, "E03", "WHO")
        Exit Function
    End If

    '会員番号編集ルーチン(QSAV_ActX3501.DLL)
    Set clsApp = CreateObject("QSAV_ActX3501.ActX3501C")
    Call clsApp.subQSAV_ActX3501(2, strKekkaKaiinNo, lngFukkiCd, strHKaiinNO(0), strHKaiinNO(1))
    Set clsApp = Nothing

    If lngFukkiCd <> 0 Then
        Exit Function
    End If
    
    gstrNaibuKaiinNo = strKigyouCd & strSubRengiKey & strNaibukaiinno   '内部会員番号
    
    gstrGaibuKaiinNo = strKekkaKaiinNo                                  '外部会員番号を格納
    
    gblnGetNaibuKaiin = True

    Exit Function

errblnGetKaiin:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function


'*********************************************************************************************
'*　　手続き名：　会員属性取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　会員属性取得ＳＰを使用し、会員属性情報を取得する
'*********************************************************************************************
Public Function gblnSeachKaiin() As Boolean
    
    Dim strSQL As String
    
    
On Error GoTo errSeachKaiin

    gblnSeachKaiin = False
    
    '会員属性取得 ＳＰ
    odbDatabase.Parameters.Add "strPRMKigyouCd", Trim$(gstrKigyoCd), ORAPARM_INPUT      '企業コード
    odbDatabase.Parameters.Add "strPRMSubRangeKey", Trim$(gstrSubRng), ORAPARM_INPUT   'サブレンジキー
    odbDatabase.Parameters.Add "strPRMNaibuKaiinNo", Trim$(gstrNaibuKaiin), ORAPARM_INPUT  '内部会員番号
    
    '本人カナ氏名
    odbDatabase.Parameters.Add "strHONShimeiKana", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strHONShimeiKana").ServerType = ORATYPE_CHAR
    '本人漢字氏名
    odbDatabase.Parameters.Add "strHONShimeiKan", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strHONShimeiKan").ServerType = ORATYPE_CHAR
    '郵便番号
    odbDatabase.Parameters.Add "strJTKYuubinNo", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKYuubinNo").ServerType = ORATYPE_CHAR
    '住所漢字
    odbDatabase.Parameters.Add "strJTKJyushoKan", Space(50), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKJyushoKan").ServerType = ORATYPE_CHAR
    '番地漢字
    odbDatabase.Parameters.Add "strJTKBanchiKan", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKBanchiKan").ServerType = ORATYPE_CHAR
    '方書漢字
    odbDatabase.Parameters.Add "strJTKkataKan", Space(64), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKkataKan").ServerType = ORATYPE_CHAR
    '市外局番
    odbDatabase.Parameters.Add "strJTKTelShigai", Space(7), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelShigai").ServerType = ORATYPE_CHAR
    '局番
    odbDatabase.Parameters.Add "strJTKTelKyoku", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelKyoku").ServerType = ORATYPE_CHAR
    'Tel番号
    odbDatabase.Parameters.Add "strJTKTelNo", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelNo").ServerType = ORATYPE_CHAR
    '生年月日
    odbDatabase.Parameters.Add "strSeinengappi", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strSeinengappi").ServerType = ORATYPE_VARCHAR2
    '管理店コード
    odbDatabase.Parameters.Add "strKanriTenCd", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strKanriTenCd").ServerType = ORATYPE_VARCHAR2
    '管理店名称
    odbDatabase.Parameters.Add "strKanriTenMei", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("strKanriTenMei").ServerType = ORATYPE_CHAR
    'カード名
    odbDatabase.Parameters.Add "strCardMei", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("strCardMei").ServerType = ORATYPE_CHAR
    '口座ステータス
    odbDatabase.Parameters.Add "strSTSKozaMei", Space(10), ORAPARM_OUTPUT
    odbDatabase.Parameters("strSTSKozaMei").ServerType = ORATYPE_CHAR
    '有効期限
    odbDatabase.Parameters.Add "strYukoKigen", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("strYukoKigen").ServerType = ORATYPE_NUMBER
    '発券日
    odbDatabase.Parameters.Add "strHakken", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strHakken").ServerType = ORATYPE_VARCHAR2
    '東西区分
    odbDatabase.Parameters.Add "strTozaiKbn", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("strTozaiKbn").ServerType = ORATYPE_CHAR
    'カード区分
    odbDatabase.Parameters.Add "OtStrCardKbn", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrCardKbn").ServerType = ORATYPE_CHAR
    '外部会員識別番号
    odbDatabase.Parameters.Add "OtStrGKNShikibetuNo", Space(12), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrGKNShikibetuNo").ServerType = ORATYPE_CHAR
    '存在Flg
    odbDatabase.Parameters.Add "strSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    
    strSQL = "BEGIN QYAP_CEnt000PkG.QYAP_CEnt000SelKaiinZoku(" & _
             ":strPRMKigyouCd, " & _
             ":strPRMSubRangeKey, " & _
             ":strPRMNaibuKaiinNo, " & _
             ":strHONShimeiKana, " & _
             ":strHONShimeiKan, " & _
             ":strJTKYuubinNo, " & _
             ":strJTKJyushoKan, " & _
             ":strJTKBanchiKan, " & _
             ":strJTKkataKan, " & _
             ":strJTKTelShigai, " & _
             ":strJTKTelKyoku, " & _
             ":strJTKTelNo, " & _
             ":strSeinengappi, " & _
             ":strKanriTenCd, " & _
             ":strKanriTenMei, " & _
             ":strCardMei, " & _
             ":strSTSKozaMei, " & _
             ":strYukoKigen, " & _
             ":strHakken, " & _
             ":strTozaiKbn, " & _
             ":OtStrCardKbn, " & _
             ":OtStrGKNShikibetuNo, " & _
             ":strSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("strSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If


    '変数に格納
    gstrHONShimeiKana = Trim$(odbDatabase.Parameters("strHONShimeiKana").Value)    '本人氏名カナ
    gstrHONShimeiKan = Trim$(odbDatabase.Parameters("strHONShimeiKan").Value)      '本人氏名漢字
    gstrJTKYuubinNo = Trim$(odbDatabase.Parameters("strJTKYuubinNo").Value)        '郵便番号
    gstrJTKJyushoKan = Trim$(odbDatabase.Parameters("strJTKJyushoKan").Value)      '住所漢字
    gstrJTKBanchiKan = Trim$(odbDatabase.Parameters("strJTKBanchiKan").Value)      '番地漢字
    gstrJTKkataKan = Trim$(odbDatabase.Parameters("strJTKkataKan").Value)          '方書漢字
    gstrJTKTelShigai = Trim$(odbDatabase.Parameters("strJTKTelShigai").Value)      '市外局番
    gstrJTKTelKyoku = Trim$(odbDatabase.Parameters("strJTKTelKyoku").Value)        '局番
    gstrJTKTelNo = Trim$(odbDatabase.Parameters("strJTKTelNo").Value)              'Tel番号
    '電話番号ﾊｲﾌﾝ編集
    If gstrJTKTelShigai = "" Then
        If gstrJTKTelKyoku = "" Then
            gstrTelNoH = gstrJTKTelNo
        Else
            gstrTelNoH = gstrJTKTelKyoku & "-" & gstrJTKTelNo
        End If
    Else
        gstrTelNoH = gstrJTKTelShigai & "-" & gstrJTKTelKyoku & "-" & gstrJTKTelNo
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'gstrSeinengappi = Trim$(odbDatabase.Parameters("strSeinengappi").Value)        '生年月日
    If IsNull(odbDatabase.Parameters("strSeinengappi")) = False Then
        gstrSeinengappi = Trim$(odbDatabase.Parameters("strSeinengappi").Value)
    Else
        gstrSeinengappi = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
    '生年月日編集
    If IsNull(gstrSeinengappi) Or Trim$(gstrSeinengappi) = "" Or Trim$(gstrSeinengappi) = "0" Or Trim$(gstrSeinengappi) = "00000000" Then
        gstrSeinengappiH = ""
    Else
        gstrSeinengappiH = Mid$(gstrSeinengappi, 1, 4) & "/" & Mid$(gstrSeinengappi, 5, 2) & "/" & Mid$(gstrSeinengappi, 7, 2)
        gstrSeinengappiH = Format(gstrSeinengappiH, "ggg e年m月d日")
    End If
    gstrKanriTenCd = Trim$(odbDatabase.Parameters("strKanriTenCd").Value)          '管理店コード
    gstrKanriTenMei = Trim$(odbDatabase.Parameters("strKanriTenMei").Value)        '管理店名称
    gstrCardMei = Trim$(odbDatabase.Parameters("strCardMei").Value)                'カード区分名称
    gstrSTSKozaMei = Trim$(odbDatabase.Parameters("strSTSKozaMei").Value)          '口座ステータス
    gstrYukoKigen = Trim$(odbDatabase.Parameters("strYukoKigen").Value)            '有効期限
    '有効期限編集
    If gstrYukoKigen = "0" Or gstrYukoKigen = "000000" Or gstrYukoKigen = "" Or IsNull(gstrYukoKigen) = True Then
        gstrYukoKigenH = ""
    Else
        gstrYukoKigenH = Mid$(gstrYukoKigen, 1, 4) & "/" & Mid$(gstrYukoKigen, 5, 2)
    End If
    gstrHakken = Trim$(odbDatabase.Parameters("strHakken").Value)                  '発券日
    '発券日編集
    If gstrHakken = "0" Or gstrHakken = "00000000" Or gstrHakken = "" Or IsNull(gstrHakken) = True Then
        gstrHakkenH = ""
    Else
        gstrHakkenH = Mid$(gstrHakken, 1, 4) & "/" & Mid$(gstrHakken, 5, 2) & "/" & Mid$(gstrHakken, 7, 2)
    End If
    gstrTozaiKbn = Trim$(odbDatabase.Parameters("strTozaiKbn").Value)              '東西区分
    gstrCardKbn = Trim$(odbDatabase.Parameters("OtStrCardKbn").Value)              'カード区分
    gstrGaibuSikibetu = Trim$(odbDatabase.Parameters("OtStrGKNShikibetuNo").Value) '外部識別番号

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)


    gblnSeachKaiin = True

    Exit Function
    
errSeachKaiin:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function



'*********************************************************************************
'*   10桁,16桁会員編集
'*　　引数：会員番号
'*********************************************************************************
Public Function gfncstrKaiinEdit(strKaiinNo As String) As String

    If Trim$(strKaiinNo) = "" Or _
       Trim$(strKaiinNo) = "0" Or _
       Trim$(strKaiinNo) = "0000000000000000" Then
        gfncstrKaiinEdit = ""
    ElseIf Len(strKaiinNo) = 10 Then
        gfncstrKaiinEdit = Mid$(strKaiinNo, 1, 2) & "-" & Mid$(strKaiinNo, 3, 2) & "-" & _
                           Mid$(strKaiinNo, 5, 4) & "-" & Mid$(strKaiinNo, 9, 1) & "-" & _
                           Mid$(strKaiinNo, 10, 1)
    ElseIf Left$(strKaiinNo, 6) = "000000" Then
        gfncstrKaiinEdit = Mid$(strKaiinNo, 7, 2) & "-" & Mid$(strKaiinNo, 9, 2) & "-" & _
                           Mid$(strKaiinNo, 11, 4) & "-" & Mid$(strKaiinNo, 15, 1) & "-" & _
                           Mid$(strKaiinNo, 16, 1)
    Else
        gfncstrKaiinEdit = Mid$(strKaiinNo, 1, 4) & "-" & Mid$(strKaiinNo, 5, 4) & "-" & _
                           Mid$(strKaiinNo, 9, 4) & "-" & Mid$(strKaiinNo, 13, 4)
    End If
    
End Function


