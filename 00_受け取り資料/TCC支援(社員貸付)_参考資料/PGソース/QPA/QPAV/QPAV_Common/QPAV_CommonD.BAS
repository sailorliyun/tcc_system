Attribute VB_Name = "QSAV_CommonD"
Option Explicit

' ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡
'¡ 
' ¡                                    |||| ‹¤’ÊŠÖ”ˆê—— ||||
'¡ 
' ¡  @‚Pj gsubMaxCharSkipEX(txtTmp As TextBox, _
'¡    @                      lngMaxLength As Long)                                                    ƒtƒ‹Œ…’Eo
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Qj gsubQSAV_ActX1001()                                                                      ƒn[ƒhƒRƒs[
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Rj gsubInitStatusBar(objStb As StatusBar)@@@@@@                                 ƒXƒe[ƒ^ƒXƒo[‰Šú‰»
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Sj gsubGetCommandLine(strCmdLine As String)                  ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ˆø”‚©‚çƒRƒ“ƒsƒ…[ƒ^–¼‚ğæ“¾‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Tj gstrGetErrDateFormat() As String                                   ƒGƒ‰[ƒtƒH[ƒ€‚Ì“ú•tEŠÔ‚ğæ“¾‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Uj gstrChange(vData As Variant) As String                                     ƒf[ƒ^‚ğ•¶š—ñ‚É•ÏŠ·‚·‚éŠÖ”
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Vj gblnfncIsNumberStr(strNumber As String) As Boolean                             •¶š—ñ‚ª”š‚Ì‚İ‚©‚Ç‚¤‚©
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Wj gstrCheckNull(vData As Variant, lngSpaceCount As Long) As String                      ‚m‚t‚k‚kƒ`ƒFƒbƒN
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   @‚Xj gsubSelectText(objTxtbox As Textbox)                                       @@@         ƒeƒLƒXƒg‘I‘ğ
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Oj gIntFilterKey(IntKeyAscii As Integer, StrEnaChr As String) As Integer                   @“ü—Í•¶š§Œä
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Pj gblnCreateOracleSession() As Boolean @@@@@@@@@@ @@              µ×¸Ù¾¯¼®İµÌŞ¼Şª¸Ä‚ğì¬‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Qj gblnConnectOracleDatabase(strConnectUserID As String _
' ¡                          , strConnectPassword As String _
'¡                           , strConnectString As String) As Boolean                  ƒf[ƒ^ƒx[ƒX‚ÆÚ‘±‚·‚éŠÖ”
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Rj gsubTermOracleDB()                                                                ‚c‚a‚ÌƒNƒŠ[ƒ“ƒAƒbƒv
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Sj gblnOpenOracleTable(objTable As Object, strSQL As String) As Boolean                      ÀŞ²Å¾¯Äì¬
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Tj gsubDBErrorMessage(strProgramID As String _
' ¡     @, strFormName As String, strUserID As String _
'¡     @ , strTanmatuID As String, strTime As String)                            ORACLEƒGƒ‰[ƒƒbƒZ[ƒW‚ğæ“¾‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Uj gsubParaRemove(objDatabase As Object)                                       ½Ä±°ÄŞÌßÛ¼°¼Ş¬‚ÌÊß×Ò°ÀŠJ•ú
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Vj gstrGetCodeMeisyo(odbDatabase As Object, vCodeNo As Variant
' ¡                      , strCodeKbn As String) As String                         ƒR[ƒhƒe[ƒuƒ‹‚©‚ç–¼Ì‚ğæ“¾‚·‚é
'¡   PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
' ¡  ‚P‚Wj gstrGetCodeTableSQL(strCodeNo As String, _
'¡                         strCodeKbn As String) As String                        ƒR[ƒhƒe[ƒuƒ‹–|–ó’l‚ğæ“¾‚·‚éSQL
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚P‚Xj gsubSetComboCode(strCode As String, strText() As String)             ”z—ñ‚ÉƒR[ƒh‚s‚Ì–|–ó’l‚ğƒZƒbƒg‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‚Q‚Oj gfncstrDlm(strDlmData As String) As String               @@@@@@ @@@@ ‹æØ‚è•¶š“ü‚èƒf[ƒ^•ª‰ğ
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
' ¡----SpreadŠÖ˜A
' ¡
'¡   ‡@ gsubSpdClear(spd As vaSpread)@@@@@@@@@@@@@@@@@@@@@@@                   ½ÌßÚ¯ÄŞ¸Ø±ˆ—
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‡A gsubSetCellText(ByVal ObjNm As Object,  intCol As Integer,
' ¡                     ByVal intRow As Integer, varVal As Variant,
'¡                     Optional strDefault As String = "")                          ƒXƒvƒŒƒbƒh‚Éƒf[ƒ^‚ğƒZƒbƒg‚·‚é
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡   ‡B gVarSpdGetText(spd As vaSpread, lCol As Long, lRow As Long) As Variant@@@        @w’èƒZƒ‹ƒeƒLƒXƒgæ“¾@@@@@@@@@@@@@@@@@@@      w’èƒZƒ‹ƒeƒLƒXƒgæ“¾
' ¡  PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
'¡ 
' ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡ ¡


'‹¤’ÊƒRƒ}ƒ“ƒhƒ‰ƒCƒ“
Public CentCommandLine As String

Public objSession      As Object       '¾¯¼®İµÌŞ¼Şª¸Ä
Public odbDatabase     As Object       'ÃŞ°ÀÍŞ°½µÌŞ¼Şª¸Ä
Public oSQLStmt        As Object
Public odnsTable       As Object       'µ×¸ÙÃŞ°ÀÍŞ°½ÀŞ²Å¾¯Ä

Public gstrCommandLine() As String     '‹¤’ÊºÏİÄŞ×²İ‚ğ•ªŠ„‚µ‚½“à—e‚ğŠi”[‚µ‚½”z—ñ

'ºİ½ÀİÄ‹Lq
Global Const gcnsstrKugiri = "|"

'*********************************************************************************************
'*@@è‘±‚«–¼F@ƒtƒ‹Œ…’Eo
'*@@ˆø@”@F@ˆø”‚PiÃ·½ÄÎŞ¯¸½µÌŞ¼Şª¸Äj
'*@@@@@@@@ˆø”‚Qiˆø”‚P‚ÌMAX Lengthj
'*@@‹@”\ŠT—vF@ˆø”‚P‚Åw’è‚³‚ê‚½Ã·½ÄÎŞ¯¸½µÌŞ¼Şª¸Ä‚Ì“ü—Í’l‚ªˆø”‚Q‚É’B‚µ‚½ê‡
'*@@@@@@@@Ÿ‚Ì“ü—Í€–Ú‚ÖÌ«°¶½‚ğˆÚ“®‚·‚é
'*********************************************************************************************
Public Sub gsubMaxCharSkipEX(txtTmp As TextBox, lngMaxLength As Long)
Dim strText    As String

    strText = StrConv(txtTmp.Text, vbFromUnicode)
    
    If LenB(strText) = lngMaxLength Then
        SendKeys Chr$(9), True
    End If
    
End Sub

'*********************************************************************************************
'*@@è‘±‚«–¼F@ƒn[ƒhƒRƒs[
'*@@ˆø@”@F@‚È‚µ
'*@@‹@”\ŠT—vF@‰æ–Ê‚Ìƒn[ƒhƒRƒs[‚ğo—Í‚·‚é
'*********************************************************************************************
Public Sub gsubQSAV_ActX1001()
Dim clsApp As Object
    
    Set clsApp = CreateObject("QSAV_ActX1001.ActX1001C")
    
    Call clsApp.subQSAV_ActX1001
    
    Set clsApp = Nothing
    
End Sub

'*********************************************************************************************
'*@@è‘±‚«–¼F@ƒXƒe[ƒ^ƒXƒo[‚ğ‰Šú‰»
'*@@ˆø@”@F@ˆø”‚P@ƒXƒe[ƒ^ƒXƒo[ƒIƒuƒWƒFƒNƒg
'*@@‹@”\ŠT—vF@ƒIƒyƒŒ[ƒ^–¼AƒRƒ“ƒsƒ…[ƒ^–¼‚ğ•\¦
'*********************************************************************************************
Public Sub gsubInitStatusBar(objStb As StatusBar)
    
    '‘æ‚Qƒpƒlƒ‹FƒIƒyƒŒ[ƒ^–¼‚ğ•\¦
    objStb.Panels.Item(2).Text = gstrCommandLine(2)
    
    '‘æ‚Rƒpƒlƒ‹FƒRƒ“ƒsƒ…[ƒ^–¼‚ğ•\¦
    objStb.Panels.Item(3).Text = gstrCommandLine(5)
    
End Sub

'*********************************************************************************************
'*@@è‘±‚«–¼F@ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚Ì€–Úæ“¾
'*@@ˆø@”@F@ˆø”‚PiºÏİÄŞ×²İ‚É‚Äæ“¾‚µ‚½“à—ej
'*@@‹@”\ŠT—vF@ˆø”‚P‚Åw’è‚³‚ê‚½“à—e‚ğ€–Ú’PˆÊ‚É”z—ñ‚ÉŠi”[‚·‚é
'*********************************************************************************************
Public Sub gsubGetCommandLine(strCmdLine As String)
Dim lngCount    As Long
Dim lngStart    As Long
Dim lngLen      As Long
Dim lngStrLen   As Long
    
    lngCount = -1
    
    Do
        lngCount = lngCount + 1
        
        '”z—ñÄİ’è
        ReDim Preserve gstrCommandLine(lngCount)
        
        lngStart = lngLen
        
        '•¶š—ñ”äŠr
        lngLen = InStr(lngStart + 1, strCmdLine, ",")
        
        'ÅI€–Ú‚Ìê‡
        If lngLen = 0 Then
            gstrCommandLine(lngCount) = Mid$(strCmdLine, (lngStart + 1))
            Exit Do
        Else
            lngStrLen = (lngLen - (lngStart + 1))
            gstrCommandLine(lngCount) = Mid$(strCmdLine, (lngStart + 1), lngStrLen)
        End If
    Loop
    
End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ƒGƒ‰[ƒtƒH[ƒ€‚Ì“ú•tEŠÔ‚ğæ“¾‚·‚é
'*@@ˆø@”@F@‚È‚µ
'*@@Œ‹@‰Ê@F@æ“¾‚µ‚½“ú•tEŠÔ
'*@@‹@”\ŠT—vF@ƒGƒ‰[‚ª”­¶‚µ‚½ê‡Aê—p‚ÌÌ«°Ñ‚É“ú•tEŠÔ‚ğ•\¦‚·‚é
'*********************************************************************************************
Public Function gstrGetErrDateFormat() As String
    
    gstrGetErrDateFormat = Format$(Date, "yyyy-mm-dd") & " " & Format$(Time, "hh-nn-ss")
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ÃŞ°À•¶š—ñ•ÏŠ·
'*@@ˆø@”@F@ˆø”‚PiÃŞ°À“à—ej
'*@@Œ‹@‰Ê@F@ˆø”‚ğ•¶š—ñ•ÏŠ·‚µ‚½Œ‹‰Ê
'*@@‹@”\ŠT—vF@ˆø”‚ğ•¶š—ñ‚É•ÏŠ·‚·‚éB
'*********************************************************************************************
Public Function gstrChange(vData As Variant) As String
    
    gstrChange = ""
    
    If Not IsNull(vData) Then
        gstrChange = Trim$(CStr(vData))
    End If
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@•¶š—ñ‚`‚k‚k”’lÁª¯¸
'*@@ˆø@”@F@ˆø”‚Pi•¶š—ñj
'*@@Œ‹@‰Ê@F@booleanifalse¨´×°@true¨‘S‚Ä”’lj
'*@@‹@”\ŠT—vF@ˆø”‚Ì•¶š—ñ‚ª‘S‚Ä”’l‚©‚Ç‚¤‚©Áª¯¸‚·‚éB
'*********************************************************************************************
Public Function gblnfncIsNumberStr(strNumber As String) As Boolean
    Dim i As Integer, j As Integer
    Dim flg As Boolean
    
    gblnfncIsNumberStr = False
    
    If Len(strNumber) <= 0 Then
        Exit Function
    End If
    
    For i = 1 To Len(strNumber)
        flg = False
        
        For j = 0 To 9
            If Trim$(CStr(Mid$(strNumber, i, 1))) = Trim$(CStr(j)) Then
                flg = True
                Exit For
            End If
        Next j
        
        If Not flg Then
            Exit Function
        End If
        
    Next i
    
    gblnfncIsNumberStr = True
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@NullÁª¯¸
'*@@ˆø@”@F@ˆø”‚PiÊŞØ±İÄŒ^j
'*@@@@@@@@ˆø”‚Qiˆø”‚P‚ªNULL‚Ìê‡‚Ì½Íß°½”j
'*@@Œ‹@‰Ê@F@ˆø”‚P‚ªNULL‚ÌA½Íß°½‚ğ•Ô‚µA‚»‚êˆÈŠO‚ÍAˆø”‚P‚ğ•Ô‚·
'*@@‹@”\ŠT—vF@ˆø”‚P‚ªNULL‚©‚Ç‚¤‚©Áª¯¸‚µANULL‚Ìê‡Aˆø”‚Q‚Ì”‚Ì½Íß°½‚ğŒ‹‰Ê‚Æ‚µ‚Ä•Ô‚µA
'*@@@@@@@@ˆø”‚P‚ªNULLˆÈŠO‚Íˆø”‚P‚ğ•Ô‚·BA
'*********************************************************************************************
Public Function gstrCheckNull(vData As Variant, lngSpaceCount As Long) As String
    
    If IsNull(vData) Then
        gstrCheckNull = Space(lngSpaceCount)
    Else
        gstrCheckNull = Trim$(CStr(vData))
    End If
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ƒeƒLƒXƒg‘I‘ğ
'*@@ˆø@”@F@objTxtBox As TextBox
'*@@Œ‹@‰Ê@F
'*@@‹@”\ŠT—vF@ƒeƒLƒXƒgƒ{ƒbƒNƒX“à‚ÌƒeƒLƒXƒg‚ğ‘I‘ğ‚µ‚½ó‘Ô‚É‚·‚é
'*@@”õl    : ŒÄ‚Ño‚µ—á) GotFocus ²ÍŞİÄÌßÛ¼°¼Ş¬‚É‚Ä
'*                   Call gsubSelectText(txtSyoriYY)
'*********************************************************************************************
Public Sub gsubSelectText(objTxtBox As TextBox)
    With objTxtBox
        .SelStart = 0
        .SelLength = Len(.Text)
    End With
End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@“ü—Í•¶š§Œä
'*@@ˆø@”@F@IntKeyAscii As Integer
'*@@@@@@@@StrEnaChr   As String  -- “ü—Í‰Â”\‚È•¶š
'*@@Œ‹@‰Ê@F@Ì¨ÙÀØİ¸ŞŒ‹‰Ê(Integer)
'*@@‹@”\ŠT—vF@“ü—Í•¶š§Œä‚ğs‚¤
'*@@”õl    : ŒÄ‚Ño‚µ—á) KeyPress ²ÍŞİÄÌßÛ¼°¼Ş¬‚É‚Ä
'*                   KeyAscii=gIntFilterKey(KeyAscii,"1234567890")
'*********************************************************************************************
Function gIntFilterKey(IntKeyAscii As Integer, StrEnaChr As String) As Integer
    
    IntKeyAscii = Asc(UCase(Chr(IntKeyAscii)))
    Select Case IntKeyAscii
        Case vbKeyBack ',vbKeyTab,  vbKeyDelete
        Case Asc("C") - 64, Asc("V") - 64, Asc("X") - 64
        Case Else
            If InStr(StrEnaChr, Chr(IntKeyAscii)) = 0 Then
                IntKeyAscii = 0
            End If
    End Select
    gIntFilterKey = IntKeyAscii
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@µ×¸Ù¾¯¼®İ‚Ìì¬
'*@@ˆø@”@F@‚È‚µ
'*@@Œ‹@‰Ê@F@boolean (false¨´×°@ , true¨³íj
'*@@‹@”\ŠT—vF@µ×¸Ù‚Ì¾¯¼®İµÌŞ¼Şª¸Ä‚ğì¬‚·‚é
'*********************************************************************************************
Public Function gblnCreateOracleSession() As Boolean
    
    On Error GoTo ErrExec
    
    'ƒZƒbƒVƒ‡ƒ“Šm—§
    Set objSession = CreateObject("OracleInprocServer.XOraSession")
    
    '³í
    gblnCreateOracleSession = True
    
Exit Function
ErrExec:
    
    'ƒGƒ‰[”­¶
    gblnCreateOracleSession = False
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ÃŞ°ÀÍŞ°½‚ÌÚ‘±
'*@@ˆø@”@F@ˆø”‚PiÕ°»Ş°IDj
'*@@@@@@@@ˆø”‚QiÊß½Ü°ÄŞj
'*@@Œ‹@‰Ê@F@boolean (false¨´×°@ , true¨³íj
'*@@‹@”\ŠT—vF@µ×¸Ù‚Öˆø”‚ÌÕ°»Ş°AÊß½Ü°ÄŞ‚ÅÚ‘±‚·‚é
'*********************************************************************************************
Public Function gblnConnectOracleDatabase(strConnectUserID As String _
    , strConnectPassword As String, strConnectString As String) As Boolean
    
    On Error GoTo ErrExec
    
    'ƒf[ƒ^ƒx[ƒX‚Ö‚ÌÚ‘±
    Set odbDatabase = objSession.OpenDatabase(strConnectString _
                    , (strConnectUserID & "/" & strConnectPassword), ORADB_DEFAULT)
    
    '³í
    gblnConnectOracleDatabase = True
    
Exit Function
ErrExec:
    
    'ƒGƒ‰[”­¶
    gblnConnectOracleDatabase = False
    
End Function

'*********************************************************************************************
'*@@è‘±‚«–¼F@µ×¸Ù¾¯¼®İ‚ÌØ’f
'*@@ˆø@”@F@‚È‚µ
'*@@‹@”\ŠT—vF@µ×¸Ù¾¯¼®İ‚ğŠJ•ú‚·‚é
'*********************************************************************************************
Public Sub gsubTermOracleDB()
    
    'ƒZƒbƒVƒ‡ƒ“‰ğ•ú
    Set odbDatabase = Nothing
    
    Set objSession = Nothing

End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ÀŞ²Å¾¯Äì¬
'*@@ˆø@”@F@ˆø”‚PiµÌŞ¼Şª¸Äj
'*@@@@@@@@ˆø”‚QiSQL•¶Şj
'*@@Œ‹@‰Ê@F@boolean (false¨´×°@ , true¨³íj
'*@@‹@”\ŠT—vF@ˆø”‚P‚ÌµÌŞ¼Şª¸Ä‚Éˆø”‚Q‚ÌSQL•¶‚ğÀs‚µÀŞ²Å¾¯Ä‚ğì¬‚·‚é
'*********************************************************************************************
Public Function gblnOpenOracleTable(objTable As Object, strSQL As String) As Boolean
    
    On Error GoTo ErrExec
    
    'ƒe[ƒuƒ‹‚Ìæ“¾
    Set objTable = odbDatabase.CreateDynaset(strSQL, ORADYN_DEFAULT)
    
    '³í
    gblnOpenOracleTable = True
    
Exit Function
ErrExec:
    
    'ƒGƒ‰[”­¶
    gblnOpenOracleTable = False
    
End Function

'*********************************************************************************************
'*@@è‘±‚«–¼F@ƒIƒ‰ƒNƒ‹ƒGƒ‰[ƒƒbƒZ[ƒW•\¦
'*@@ˆø@”@F@ˆø”‚PiÌßÛ¸Ş×ÑIDj
'*@@@@@@@@ˆø”‚QiÌ«°Ñ–¼j
'*@@@@@@@@ˆø”‚RiÕ°»Ş°IDj
'*@@@@@@@@ˆø”‚Si’[––IDj
'*@@@@@@@@ˆø”‚TiŠÔj
'*@@‹@”\ŠT—vF@ˆø”‚P`‚T‚Ì“à—e‚Æ´×°“à—e‚ğ´×°Ò¯¾°¼ŞÌ«°Ñ‚ğ•\¦‚·‚é
'*********************************************************************************************
Public Sub gsubDBErrorMessage(strProgramID As String _
              , strFormName As String, strUserID As String _
              , strTanmatuID As String, strTime As String)
 Dim lngErrCode          As Long     '´×°º°ÄŞ
 Dim strErrDescription   As String   '´×°Ò¯¾°¼Ş

    'ƒGƒ‰[ˆ—
    If objSession.LastServerErr = 0 Then
        Select Case odbDatabase.LastServerErr
        Case 0  'VBƒGƒ‰[
            lngErrCode = Err.Number
            strErrDescription = Err.Description
        Case Is >= 20000
            'ƒ†[ƒUƒGƒ‰[ˆ—
            lngErrCode = odbDatabase.LastServerErr              '´×°º°ÄŞ
            strErrDescription = odbDatabase.LastServerErrText   '´×°Ò¯¾°¼Ş
            odbDatabase.LastServerErrReset                      '´×°Ø¾¯Ä
'            Exit Sub
        Case Else
            lngErrCode = odbDatabase.LastServerErr              '´×°º°ÄŞ
            strErrDescription = odbDatabase.LastServerErrText   '´×°Ò¯¾°¼Ş
            odbDatabase.LastServerErrReset                      '´×°Ø¾¯Ä
        End Select
    Else
        lngErrCode = objSession.LastServerErr               '´×°º°ÄŞ
        strErrDescription = objSession.LastServerErrText    '´×°Ò¯¾°¼Ş
        objSession.LastServerErrReset                       '´×°Ø¾¯Ä
    End If

    'ƒVƒXƒeƒ€ƒGƒ‰[
    Call QSAV_SysErr.subSysErr(strProgramID, strUserID, strTanmatuID, strTime _
                            , strFormName, CStr(lngErrCode), strErrDescription)

End Sub

'*********************************************************************************************
'*@@è‘±‚«–¼F@½Ä±°ÄŞÌßÛ¼°¼Ş¬‚ÌÊß×Ò°ÀŠJ•ú
'*@@ˆø@”@F@ˆø”‚PiÃŞ°ÀÍŞ°½µÌŞ¼Şª¸Äj
'*@@‹@”\ŠT—vF@½Ä±°ÄŞÌßÛ¼°¼Ş¬‚ÌÊß×Ò°À‚ğ‘S‚ÄŠJ•ú‚·‚é
'*********************************************************************************************
Public Sub gsubParaRemove(objDatabase As Object)
    
    With objDatabase
        Do While .Parameters.Count > 0
            .Parameters.Remove (0)
        Loop
    End With
    
End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ƒR[ƒhƒe[ƒuƒ‹–¼Ìæ“¾
'*@@ˆø@”@F@ˆø”‚PiµÌŞ¼Şª¸Äj
'*@@@@@@@@ˆø”‚Qiº°ÄŞ‡‚j
'*@@@@@@@@ˆø”‚Riº°ÄŞ‹æ•ªj
'*@@Œ‹@‰Ê@F@º°ÄŞÃ°ÌŞÙiËŞ­°j‚Ì–¼Ì‚ğ•Ô‚·B‰Šú’l‚Íhh
'*@@‹@”\ŠT—vF@º°ÄŞÃ°ÌŞÙiËŞ­°j‚Ì–¼Ì‚ğæ“¾‚·‚éB
'*********************************************************************************************
Public Function gstrGetCodeMeisyo(odbDatabase As Object, vCodeNo As Variant, _
                                 strCodeKbn As String) As String
Dim strCodeNo   As String
Dim objTable    As Object
Dim lngRet      As Long
Dim strSQL      As String
    
    On Error GoTo GetCode_Error
    
    gstrGetCodeMeisyo = ""
    
    '•¶š—ñ•ÏŠ·
    strCodeNo = gstrCheckNull(vCodeNo, 0)
    
    '”»’è
    If strCodeNo = "" Then
        Exit Function
    End If
    
    'SQL•¶‚Ìì¬
    strSQL = gstrGetCodeTableSQL(strCodeNo, strCodeKbn)
    
    Set objTable = odbDatabase.CreateDynaset(strSQL, ORADYN_DEFAULT)
    
    'ƒe[ƒuƒ‹ƒI[ƒvƒ“
    If objTable Is Nothing Then
        Exit Function
    End If
    
    'ƒf[ƒ^æ“¾
    If Not objTable.EOF Then
        gstrGetCodeMeisyo = gstrCheckNull(objTable.Fields("QSA3_Mei").Value, 0)
    End If
    
    '‰ğ•ú
    Set objTable = Nothing
    
    Exit Function

GetCode_Error:

    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ƒR[ƒhƒe[ƒuƒ‹‚ÌSQL•¶ì¬
'*@@ˆø@”@F@ˆø”‚Piº°ÄŞ‡‚j
'*@@@@@@@@ˆø”‚Qiº°ÄŞ‹æ•ªj
'*@@Œ‹@‰Ê@F@ˆø”‚É‚Äì¬‚µ‚½SQL•¶
'*@@‹@”\ŠT—vF@ˆø”‚É‚Äº°ÄŞÃ°ÌŞÙQÆ‚ÌSQL•¶‚ğì¬‚·‚éB
'*********************************************************************************************
Public Function gstrGetCodeTableSQL(strCodeNo As String, strCodeKbn As String) As String
Dim strSQL As String
    
    'SQL•¶‚Ìì¬
    strSQL = "SELECT" _
        & " QSA3_Mei" _
        & " FROM" _
        & " QSA3_CodeV" _
        & " WHERE" _
        & " QSA3_PRMCodeKbn = '" & Trim$(strCodeKbn) & "'" _
        & " AND" _
        & " QSA3_PRMCodeNo = '" & Trim$(strCodeNo) & "'"
    
    gstrGetCodeTableSQL = strSQL
    
End Function

'*********************************************************************************************
'*@@è‘±‚«–¼F@º°ÄŞÃ°ÌŞÙ‚Ì–|–ó’l‚ğ”z—ñ‚ÉŠi”[
'*@@ˆø@”@F@ˆø”‚Piº°ÄŞ‹æ•ªj
'*@@‹@”\ŠT—vF@º°ÄŞÃ°ÌŞÙ‚Ì–|–ó’l‚ğ”z—ñ‚ÉŠi”[‚·‚éB
'*********************************************************************************************
Public Function gsubSetComboCode(strCode As String, strText() As String)
Dim objTable    As Object
Dim strSQL      As String
Dim lngIndex    As Long
    
    'SQL•¶‚Ìì¬
    strSQL = "SELECT" _
        & " QSA3_Mei" _
        & " FROM" _
        & " QSA3_CodeV" _
        & " WHERE" _
        & " QSA3_PRMCodeKbn = '" & Trim$(strCode) & "'"
    
    If Not gblnOpenOracleTable(objTable, strSQL) Then
        Exit Function
    End If
    
    If objTable.EOF And objTable.BOF Then
        Exit Function
    End If
    
    ReDim strText(objTable.RecordCount - 1)
    
    objTable.MoveFirst
    
    lngIndex = -1
    
    Do Until objTable.EOF
        lngIndex = lngIndex + 1
        
        strText(lngIndex) = objTable.Fields("QSA3_Mei").Value
        
        objTable.MoveNext
    Loop
    
    Set objTable = Nothing
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F  ‹æØ‚è•¶š“ü‚èƒf[ƒ^•ª‰ğ
'*@@ˆø@”@F@strDlmData EEE ‹æØ‚è•¶š“ü‚èƒf[ƒ^
'*@@Œ‹@‰Ê@F@Ø‚èæ‚ç‚ê‚½æ“ª‚Ìƒf[ƒ^@^@c‚Á‚½ÃŞ°À(strDlmData‚ÉŠi”[)
'*@@‹@”\ŠT—vF@‹æØ‚è•¶š“ü‚è‚Ìƒf[ƒ^‚ğ•ª‰ğ‚·‚é@•ª‰ğ‚µ‚½ƒf[ƒ^‚ÍØ‚èÌ‚Ä‚é
'*********************************************************************************************
Public Function gfncstrDlm(strDlmData As String) As String
    
    If Right$(strDlmData, 1) <> "|" Then
        strDlmData = strDlmData & "|"
    End If
    
    gfncstrDlm = Mid$(strDlmData, 1, InStr(strDlmData, gcnsstrKugiri) - 1)
    strDlmData = Mid$(strDlmData, InStr(strDlmData, gcnsstrKugiri) + 1, Len(strDlmData))
    
End Function

'*********************************************************************************************
'*@@ŠÖ”–¼@F  ‹æØ‚è•¶š“ü‚èƒf[ƒ^•ª‰ğ(ˆÊ’uw’è—L‚è)
'*@@ˆø@”@F@strDlmData EEE ‹æØ‚è•¶š“ü‚èƒf[ƒ^
'*@@        @ lngPosEEEEEE Ø‚èæ‚èˆÊ’u
'*@@Œ‹@‰Ê@F@Ø‚èæ‚ç‚ê‚½ƒf[ƒ^
'*@@‹@”\ŠT—vF@‹æØ‚è•¶š“ü‚è‚Ìƒf[ƒ^‚æ‚èw’èˆÊ’u‚Ìƒf[ƒ^‚ğæ“¾‚·‚é
'*********************************************************************************************
Public Function gfncstrDlm2(ByVal strDlmData As String, lngPos As Long) As String
 Dim i As Long

    gfncstrDlm2 = ""

    For i = 1 To lngPos
        gfncstrDlm2 = gfncstrDlm(strDlmData)
    Next i
    
End Function

'*********************************************************************************************
'*@@è‘±‚«–¼F@½ÌßÚ¯ÄŞ¸Ø±ˆ—
'*@@ˆø‚«”@F@spd As vaSpread  -->  SpreadSheet
'*@@‹@”\ŠT—vF@w’è‚µ‚½½ÌßÚ¯ÄŞ¼°Ä‚Ì“à—e‚ğ¸Ø±‚·‚é
'*********************************************************************************************
Public Sub gsubSpdClear(spd As vaSpread)
Dim i   As Long
    
    With spd
        .ReDraw = False
        .Row = -1
'        .Row2 = .MaxRows
        .Col = -1
'        .Col2 = .MaxCols
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        
        For i = 1 To .MaxRows
            .SelModeSelected = False
        Next
        
        .ReDraw = True
        
    End With
    
End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@ƒXƒvƒŒƒbƒh‚Éƒf[ƒ^‚ğƒZƒbƒg‚·‚é
'*@@ˆø‚«”@F ObjNm      As vaSpread -- SpreadSheet
'*              intCol     As Long     -- —ñ
'*              intRow     As Long     -- s
'*              varVal     As Variant
'*              strDefault As String
'*@@Œ‹@‰Ê@F@w’è‚µ‚½¾Ù‚Ì’l(Variant)
'*@@‹@”\ŠT—vF@SetTextÒ¿¯ÄŞ‚ğCall‚µAŒ‹‰ÊƒeƒLƒXƒg‚ğ•Ô‚·
'*********************************************************************************************
Public Sub gsubSetCellText(ByVal ObjNm As Object, intCol As Integer, ByVal intRow As Integer, varVal As Variant, Optional strDefault As String = "")
    
    With ObjNm
        If IsNull(varVal) Then
            .SetText intCol, intRow, strDefault
        Else
            .SetText intCol, intRow, CStr(varVal)
        End If
    End With
    
End Sub

'*********************************************************************************************
'*@@ŠÖ”–¼@F@w’è¾ÙÃ·½Äæ“¾
'*@@ˆø‚«”@F spd  As vaSpread -- SpreadSheet
'*              lCol As Long     -- —ñ
'*              lRow As Long     -- s
'*@@Œ‹@‰Ê@F@w’è‚µ‚½¾Ù‚Ì’l(Variant)
'*@@‹@”\ŠT—vF@GetTextÒ¿¯ÄŞ‚ğCall‚µAŒ‹‰ÊƒeƒLƒXƒg‚ğ•Ô‚·
'*********************************************************************************************
Public Function gVarSpdGetText(spd As vaSpread, lCol As Long, lRow As Long) As Variant
    Dim VarValue    As Variant
    
    gVarSpdGetText = ""

    If spd.GetText(lCol, lRow, VarValue) Then
        gVarSpdGetText = VarValue
    End If
    
End Function

