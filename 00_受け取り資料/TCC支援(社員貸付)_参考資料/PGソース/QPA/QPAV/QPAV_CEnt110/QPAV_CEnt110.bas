Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QYAV_CEnt010"
 Public Const gcnsstrSysChng = "2001/11/01"    'VƒVƒXƒeƒ€ˆÈ~“ú

'*********************************************************
'   SP—pƒf[ƒ^Ši”[•Ï”
'*********************************************************

 Public gstrSysDate             As String        'ƒVƒXƒeƒ€“ú•tiƒT[ƒo[j  5/29 add

 Public gstrSyainCd1            As String        'ĞˆõƒR[ƒh‚P
 Public gstrSyainCd2            As String        'ĞˆõƒR[ƒh‚Q
 Public gstrYuusibi             As String        '—Z‘“ú
 Public gstrYusiYMD            As String        '—Z‘ƒf[ƒ^i‹æØ‚è•¶š“ü‚èj
 Public gstrBonusMD1            As String        'ƒ{[ƒiƒXx•¥“ú‚P
 Public gstrBonusMD2            As String        'ƒ{[ƒiƒXx•¥“ú‚Q

 Type YoteiTbl
    intPageKBN  As Integer 'ƒy[ƒW‹æ•ª
    intNenKBN   As Integer '”N‹æ•ª
    strKbn      As String  '‹æ•ª
    strKijitu   As String  '•ÔÏŠú“ú
    strHensai   As String  '•ÔÏ‹àŠz
    strZandaka  As String  'c‚
    strKyuGan   As String  '‹‹—^Œ³–{
    strKyuRsk   As String  '‹‹—^—˜‘§
    strKyuZan   As String  '‹‹—^c‚
    strSyoGan   As String  'Ü—^Œ³–{
    strSyoRsk   As String  'Ü—^—˜‘§
    strSyoZan   As String  'Ü—^c‚
 End Type

Public gstrYoteihyouAry()  As YoteiTbl '—\’è•\—p”z—ñ
Public gstrYoteihyouSort() As YoteiTbl '—\’è•\”z—ñƒ\[ƒg—p

 Public lngErrCode           As Long          '´×°º°ÄŞ
 Public strErrDescription    As String        '´×°Ò¯¾°¼Ş
 
 Public gblnNayoseFlg As Boolean
 
'*************************************************************
'* ‹N“®@‚l‚`‚h‚m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '“®ìŠÂ‹«
    If App.PrevInstance Then
        MsgBox "•ÔÏ—\’è•\ˆóü‚ÍŠù‚É‹N“®‚³‚ê‚Ä‚¢‚Ü‚·B" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If
    
    'ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ˆø”‚Ìæ“¾
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "‹N“®ƒpƒ‰ƒ[ƒ^‚ªİ’è‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB" _
                , vbExclamation Or vbOKOnly, gcstrPrjName

        Exit Sub
    End If

    'ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ˆø”‚ğ•ÒW‚·‚é
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt110.Show 1
 
End Sub

'**********************************************************************************************************
'*    ‰Šúˆ——pSPi¼½ÃÑ“ú•tAˆ—“à—ej
'**********************************************************************************************************
Public Sub gsubSPInit()
 Dim strWkAry As String
 Dim strSQL As String
 
 On Error GoTo errSPInit
 
    '*SP*
    '¼½ÃÑ“ú•t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2
    
    'SQL•¶‚Ìì¬
             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110Init("
    strSQL = strSQL & " :OtStrSysDate);END;"
            
    'SP‚ÌÀs
    odbDatabase.DbexecuteSQL (strSQL)
            
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")
    
    'µÌŞ¼Şª¸Ä‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
            
errSPInit:
'´×°ˆ—
    
    '´×°Ò¯¾°¼Ş•\¦
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'µÌŞ¼Şª¸Ä‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)
    
End Sub
'**********************************************************************************************************
'*  •ÔÏ—\’è•\–¾×ì¬(‹Œˆ—@—Z‘“ú‚ª 2000/03/01 ˆÈ‘O‚Ìˆ—)
'**********************************************************************************************************
Public Sub gSubMakeMeisaiKyuu()
 Dim strYuusibi         As String  '—Z‘“ú
 Dim dblRiritu          As Double  'Œ_–ñ—˜—¦
 Dim intHensaiTuki      As Integer '•ÔÏŒ”
 Dim lngKyuuyoHensaiAll As Long    '‹‹—^•ÔÏŠz(‘Šz)
 Dim lngSyouyoHensaiAll As Long    'Ü—^•ÔÏŠz(‘Šz)
 Dim strSyouyoDate1     As String  'Ü—^x•¥“ú‚P
 Dim strSyouyoDate2     As String  'Ü—^x•¥“ú‚Q

'--ƒ[ƒN---------------------
 Dim i                       As Integer
 Dim intKyuuyoCNT            As Integer  ' ‹‹—^‚ª‘æ‰½‰ñ–Ú‚©‚Ì”š
 Dim intSyouyoCNT            As Integer  ' Ü—^‚ª‘æ‰½‰ñ–Ú‚©‚Ì”š
 Dim intNenKBN               As Integer  '”N‹æ•ª
 Dim intKBN                  As Integer  '‹æ•ª
 Dim strHensaiKijitu         As String   '•ÔÏŠú“ú
 Dim strSyouyoKijitu         As String   'Ü—^Šú“ú
 Dim lngKyuuyoTeigaku        As Long     '‹‹—^’èŠz•ÔÏŠz_WORK
 Dim lngKyuuyoZan_1          As Long     '‹‹—^‘æ1c‚_WORK
 Dim lngKyuuyoHensaiZandaka  As Long     '‹‹—^•ÔÏc‚
 Dim lngSyouyoTeigaku        As Long     'Ü—^’èŠz•ÔÏŠz_WORK
 Dim lngSyouyoZan_1          As Long     'Ü—^‘æ1c‚_WORK
 Dim lngSyouyoHensaiZandaka  As Long     'Ü—^•ÔÏc‚
 Dim curTeigaku_0            As Currency '’èŠz_WORK0
 Dim curTeigaku_1            As Currency '’èŠz_WORK1
 Dim curTeigaku_2            As Currency '’èŠz_WORK2
 Dim intSyouyoHensaiKaisuu   As Integer  'Ü—^•ÔÏ‰ñ”
 Dim strSyouyoSiharaiTuki    As String   'Ü—^x•¥Œ
 Dim strHensaiKijitu2        As String   '•ÔÏŠú“ú2
 Dim intHensaiKikan          As Integer  '•ÔÏŠúŠÔ
 Dim strZenkaiSyouyoHensaiBi As String   '‘O‰ñÜ—^•ÔÏ“ú
 Dim intSyouyoHensaiKikan    As Integer  'Ü—^•ÔÏŠúŠÔ
 Dim dblRisoku1              As Double   '—˜‘§
 Dim dblRisoku2              As Double   '—˜‘§‚Q
 Dim dblKeiyakuriritu        As Double   'Œ_–ñ—˜—¦WK

 Dim Y As Integer
    
 Dim intNenKBN_WK           As Integer

 'ƒ\[ƒg‚Ég—p
 Dim lngSortKey()       As Long

'“X”»’è‚Ég—p@2002/05/13
 Dim strSyozoku As String

On Error GoTo asd


    '•Ï”‚ÉƒZƒbƒg
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '—Z‘“ú
    dblRiritu = CDbl(gfncstrDlm2(gstrYusiYMD, 6)) * 0.01            'Œ_–ñ—˜—¦
    intHensaiTuki = CInt(gfncstrDlm2(gstrYusiYMD, 7))               '•ÔÏŒ”
    lngKyuuyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 8))          '‹‹—^•ÔÏŠz(‘Šz)
    lngSyouyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 10))         'Ü—^•ÔÏŠz(‘Šz)
''''    gstrBonusMD1 = Format$(Left$(gstrBonusMD1, 2) & Right$(gstrBonusMD1, 2), "MMDD")                  'Ü—^x•¥Œ“ú‚P
''''    gstrBonusMD2 = Format$(Left$(gstrBonusMD2, 2) & Right$(gstrBonusMD2, 2), "MMDD")                  'Ü—^x•¥Œ“ú2
''''    lngKyuuyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 9))             '–ˆŒ‹‹—^•ÔÏŠz
''''    lngSyouyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 11))            '–ˆŒÜ—^•ÔÏŠz
    

''''2001/11/28
'    'Ü—^x•¥“ú”»’è
'''    If Format(Date, "MMDD") < gstrBonusMD1 Then
'    If Format(Date, "MMDD") <= gstrBonusMD1 Then
'        'Ü—^x•¥Œ“ú‚P‚ğÜ—^x•¥Œ“ú‚Q‚É
'''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
'''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1
'        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'        strSyouyoDate2 = Format$(DateAdd("yyyy", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'''    ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
'    ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
'        'Ü—^x•¥Œ“ú‚Q‚ğÜ—^x•¥Œ“ú‚P‚É
'''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
'''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1
'        strSyouyoDate1 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'        strSyouyoDate2 = Format$(DateAdd("yyyy", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'    ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
'        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'        strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'    End If
    If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
        End If
    Else
        If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
    End If
    
    intSyouyoHensaiKikan = DateDiff("m", strSyouyoDate1, strSyouyoDate2)
    strZenkaiSyouyoHensaiBi = strYuusibi

    intNenKBN = 1
    intKyuuyoCNT = 1
    intSyouyoCNT = 1
    
    If intHensaiTuki <= 0 Then
        intHensaiTuki = 1
    End If
    
    'Ü—^•ÔÏ‰ñ”
    intSyouyoHensaiKaisuu = Fix(intHensaiTuki / 6)
    For i = 1 To intHensaiTuki Mod 6
        If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate1) Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate2) Then
            intSyouyoHensaiKaisuu = intSyouyoHensaiKaisuu + 1
        End If
    Next i
    If intSyouyoHensaiKaisuu <= 0 Then
        intSyouyoHensaiKaisuu = 1
    End If
  
    strHensaiKijitu = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
  
    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then 'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If

    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    '----------------------–ˆŒx•¥ŠzŒvZ---------------------------
    If Val(Format(strYuusibi, "dd")) >= 11 Then
        intHensaiKikan = 30
    Else
        intHensaiKikan = 45
    End If
    dblRisoku2 = (lngKyuuyoHensaiAll * dblRiritu * intHensaiKikan / 12 / 30)
    dblRisoku1 = Int(dblRisoku2)
    If intHensaiTuki <= 1 Then
        lngKyuuyoTeigaku = dblRisoku1 + lngKyuuyoHensaiAll
    Else
        curTeigaku_0 = 0
        curTeigaku_1 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll, 0, 0))
        curTeigaku_2 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll - curTeigaku_1 + dblRisoku2, 0, 0))
        While Abs(curTeigaku_1 - curTeigaku_2) > 0.001 Or Abs(curTeigaku_0 - curTeigaku_2) > 0.001
            curTeigaku_0 = curTeigaku_1: curTeigaku_1 = curTeigaku_2
            curTeigaku_2 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll - (((curTeigaku_0) + (curTeigaku_1)) / 2) + dblRisoku2, 0, 0))
        Wend
        lngKyuuyoTeigaku = Fix(Abs(((curTeigaku_0) + (curTeigaku_1) + (curTeigaku_2)) / 3))
    End If

    If intSyouyoHensaiKikan = 6 Then
        If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
            dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180)
        Else
            dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180)
        End If
        dblRisoku1 = Int(dblRisoku2)
    Else
        dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180)
        dblRisoku1 = Int(dblRisoku2)
    End If

    If intSyouyoHensaiKaisuu <= 1 Then
        lngSyouyoTeigaku = dblRisoku1 + lngSyouyoHensaiAll
    Else
        curTeigaku_0 = 0
        curTeigaku_1 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll, 0, 0))
        curTeigaku_2 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll - curTeigaku_1 + dblRisoku2, 0, 0))
        While Abs(curTeigaku_1 - curTeigaku_2) > 0.001 Or Abs(curTeigaku_0 - curTeigaku_2) > 0.001
            curTeigaku_0 = curTeigaku_1: curTeigaku_1 = curTeigaku_2
            curTeigaku_2 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll - (((curTeigaku_0) + (curTeigaku_1)) / 2) + dblRisoku2, 0, 0))
        Wend
        lngSyouyoTeigaku = Fix(Abs(((curTeigaku_0) + (curTeigaku_1) + (curTeigaku_2)) / 3))
        If intSyouyoHensaiKikan <> 6 Then
            lngSyouyoTeigaku = gfnclngSyouyoHensai(strYuusibi, dblRiritu, strSyouyoDate1, strSyouyoDate2, intSyouyoHensaiKaisuu, lngSyouyoHensaiAll, dblRisoku1, lngSyouyoTeigaku)
        End If
    End If
    '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    'Ÿƒ[ƒNƒe[ƒuƒ‹“o˜^—pƒf[ƒ^ì¬
    '* ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏŒ‚ÆÜ—^•ÔÏŒ‚ªˆê’v‚·‚éê‡A‚P‰ñ–Ú‚ÌÜ—^•ÔÏ—p‚Ìƒf[ƒ^‚ğ’Ç‰Á‚·‚é
    i = 1
    '* ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ—p‚Ìƒf[ƒ^‚ğ’Ç‰Á‚·‚é
    If lngKyuuyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
            .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
            .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
            .strKbn = "‹‹—^" & Space$(3 - Len(Format$(1, "###"))) & Format$(1, "###") '''''''''''''''‹æ•ª
            
            .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
            If strYuusibi < "2000/03/01" Then
                
                '“X”»’è@2002/05/13
                strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                Then
                    If Mid$(.strKijitu, 1, 2) > "11" Then
                        If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"        '04 •ÔÏŠú“ú
                        ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 •ÔÏŠú“ú
                        End If
                    End If
                End If
            End If
            
            .strHensai = lngKyuuyoTeigaku 'ŒÅ’è '''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            If Val(Format(strYuusibi, "dd")) >= 11 Then
                intHensaiKikan = 30
            Else
                intHensaiKikan = 45
            End If
            dblKeiyakuriritu = dblRiritu * 100
            .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * intHensaiKikan / 12 / 3000)
            .strKyuGan = .strHensai - .strKyuRsk
            If intHensaiTuki = 1 Then
                .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            End If
            lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '‹‹—^•ÔÏc‚ ŒvZ
            .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^c‚
            lngKyuuyoZan_1 = .strKyuZan
            .strZandaka = " "   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''c‚
            .strSyoGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
            .strSyoRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
            .strSyoZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
            intKyuuyoCNT = intKyuuyoCNT + 1
            i = i + 1
        End With
    End If
    
    '* ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏŒ‚ÆÜ—^•ÔÏŒ‚ªˆê’v‚·‚éê‡A‚P‰ñ–Ú‚ÌÜ—^•ÔÏ—p‚Ìƒf[ƒ^‚ğ’Ç‰Á‚·‚é
    If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
        
            If lngKyuuyoTeigaku > 0 Then
                .intPageKBN = Fix((intNenKBN + 2) / 3)
            Else
                .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
            End If
            .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
            .strKbn = "Ü—^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''''''''''''‹æ•ª
            
            .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
            If strYuusibi < "2000/03/01" Then
                '“X”»’è@2002/05/13
                strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                Then
                    If Mid$(.strKijitu, 1, 2) > "11" Then
                        If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 •ÔÏŠú“ú
                        ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 •ÔÏŠú“ú
                        End If
                    End If
                End If
            End If
            
            .strHensai = lngSyouyoTeigaku 'ŒÅ’èiÜ—^j'''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            If intSyouyoHensaiKikan = 6 Then
                If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
                    dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180
                    .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                Else
                    dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180
                    .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                End If
            Else
                dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180
                .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
            End If
            .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
            If intSyouyoHensaiKaisuu = 1 Then
                .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            End If
            lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan 'Ü—^•ÔÏc‚ ŒvZ
            .strSyoZan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
            lngSyouyoZan_1 = .strSyoZan
            .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''c‚
            .strKyuGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
            .strKyuRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^—˜‘§
            .strKyuZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^c‚
            strZenkaiSyouyoHensaiBi = strSyouyoKijitu
            intSyouyoCNT = intSyouyoCNT + 1
            i = i + 1
        End With
    End If
        
    strHensaiKijitu2 = strHensaiKijitu
    strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)

    ' ŸŸ‚Q‰ñ–ÚˆÈ~‚Ìƒf[ƒ^’Ç‰Á
    intNenKBN_WK = 2
    'While (I <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
    While (intKyuuyoCNT <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
        '* ‹‹—^‚Ìƒf[ƒ^’Ç‰Á
        If lngKyuuyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
            
                .intPageKBN = Fix((intNenKBN + 2) / 3) '''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
                .strKbn = "‹‹—^" & Space$(3 - Len(Format$(intKyuuyoCNT, "###"))) & Format$(intKyuuyoCNT, "###") ''''''''''''''‹æ•ª
                
                .strKijitu = gvarCnvDate(1, strHensaiKijitu) '''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
                If strYuusibi < "2000/03/01" Then
' ŸŸŸŸŸŸŸŸŸ“X”»’è@2002/05/13ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ
                    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                    Then
                        If Mid$(.strKijitu, 1, 2) > "11" Then
                            If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 •ÔÏŠú“ú
                            ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 •ÔÏŠú“ú
                            End If
                        End If
                    End If
                End If
                
                .strHensai = lngKyuuyoTeigaku 'ŒÅ’è ''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblRiritu / 12) ''''''''''''''''''''''''''''''‹‹—^—˜‘§
                .strKyuGan = .strHensai - .strKyuRsk '''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                ' ÅI‰ñ‚Ìê‡
                If intHensaiTuki = intKyuuyoCNT Then
                    .strKyuGan = lngKyuuyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                    .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk '''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                End If
                lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '‹‹—^•ÔÏc‚ ŒvZ
                .strKyuZan = lngKyuuyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^c‚
                .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏc‚
                .strSyoGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                .strSyoRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                .strSyoZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
                intKyuuyoCNT = intKyuuyoCNT + 1
                i = i + 1
            End With
        End If
        
        '* “–ŠYŒ‚ÆÜ—^•ÔÏŒ‚ªˆê’v‚·‚éê‡AÜ—^•ÔÏ—p‚Ìƒf[ƒ^‚à’Ç‰Á‚·‚é
        If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                
                If lngKyuuyoTeigaku > 0 Then
                    .intPageKBN = Fix((intNenKBN + 2) / 3) '''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                Else
                    .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                End If
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
                .strKbn = "Ü—^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''''''''‹æ•ª
                
                '* ¡‰ñ‚ÌÜ—^•ÔÏ“ú‚ÌZo
                If Month(strHensaiKijitu) = Month(strSyouyoDate1) Then
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
                Else
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
                End If
                               
                .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
                If strYuusibi < "2000/03/01" Then
                    '“X”»’è@2002/05/13
                    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                    Then
                        If Mid$(.strKijitu, 1, 2) > "11" Then
                            If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 •ÔÏŠú“ú
                            ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 •ÔÏŠú“ú
                            End If
                        End If
                    End If
                End If
                
                .strHensai = lngSyouyoTeigaku 'ŒÅ’èiÜ—^j'''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                If intSyouyoHensaiKikan = 6 Then
                    If intSyouyoCNT = 1 Then
                        If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
                            dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180        '‰‰ñ—˜‘§
                            .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                        Else
                            dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180 '‰‰ñ—˜‘§
                            .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                        End If
                    Else
                        dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu / 2
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                    End If
                Else
                    If intSyouyoCNT = 1 Then
                        dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180 '‰‰ñ—˜‘§
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                    Else
                        dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu * DateDiff("m", strZenkaiSyouyoHensaiBi, strSyouyoKijitu) / 12
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                    End If
                End If
                .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ´–{
                If intSyouyoHensaiKaisuu = intSyouyoCNT Then
                    .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                    .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                End If
                lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan 'Ü—^•ÔÏc‚ ŒvZ
                .strSyoZan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
                If intSyouyoCNT = 1 Then
                    lngKyuuyoZan_1 = .strSyoZan
                End If
                .strZandaka = " " 'c‚
                .strKyuGan = " " '‹‹—^Œ³–{
                .strKyuRsk = " " '‹‹—^—˜‘§
                .strKyuZan = " " '‹‹—^c‚
                strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                intSyouyoCNT = intSyouyoCNT + 1
                i = i + 1
            End With
        End If
        
        strHensaiKijitu2 = strHensaiKijitu
        strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)


''''2001/12/07  •s—vi•\¦‚Ì‚İVÜ—^“úAŒvZ‚Í‹ŒÜ—^“ú‚Ås‚¤
''''        '«««2001/11/28 Ü—^“ú‚Í2000/03‚ğ‹«‚É•Ï‚í‚é«««
''''        If strYuusibi < "2000/03/01" Then
''''            If strHensaiKijitu > "2000/03/01" Then
''''                If strSyouyoDate1 > strSyouyoDate2 Then
''''                    strSyouyoDate1 = Mid$(strSyouyoDate1, 1, 5) & "12/01"
''''                    strSyouyoDate2 = Mid$(strSyouyoDate2, 1, 5) & "06/15"
''''                Else
''''                    strSyouyoDate1 = Mid$(strSyouyoDate1, 1, 5) & "06/15"
''''                    strSyouyoDate2 = Mid$(strSyouyoDate2, 1, 5) & "12/01"
''''                End If
''''            End If
''''        End If
''''        'ªªª2001/11/28 Ü—^“ú‚Í2000/03‚ğ‹«‚É•Ï‚í‚éªªª
''''2001/12/07  •s—vi•\¦‚Ì‚İVÜ—^“úAŒvZ‚Í‹ŒÜ—^“ú‚Ås‚¤

        
        ' ‚P‚Q‰ñiŸ‚ªÜ—^‚Ì‚ÍAŸ‚ÌÜ—^‚Ü‚ÅŠÜ‚Ü‚ê‚éj–ˆ‚ÉA
        ' •ÔÏ—\’è•\‚ÉŒrü‚ğo—Í‚³‚¹‚é‚½‚ß‚Ì‹æ•ª‚ÌƒJƒEƒ“ƒgƒAƒbƒv
        If ((intNenKBN_WK) Mod 12) = 0 Then
            intNenKBN = intNenKBN + 1
        End If
        intNenKBN_WK = intNenKBN_WK + 1
    
    Wend
    
    '¡gstrYoteihyouAry”z—ñƒ\[ƒg...Ü—^ƒf[ƒ^‚ª‚¸‚ê‚Ä‚¢‚é‚½‚ß¡
    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            ReDim Preserve lngSortKey(Y)
            ReDim Preserve gstrYoteihyouSort(Y)
            lngSortKey(Y) = CLng(Format(Mid$(.strKijitu, 1, 2), "00") & Format(Mid$(.strKijitu, 4, 2), "00") & Format(Mid$(.strKijitu, 7, 2), "00"))
            gstrYoteihyouSort(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN
            gstrYoteihyouSort(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN
            gstrYoteihyouSort(Y).strHensai = gstrYoteihyouAry(Y).strHensai
            gstrYoteihyouSort(Y).strKbn = gstrYoteihyouAry(Y).strKbn
            gstrYoteihyouSort(Y).strKijitu = gstrYoteihyouAry(Y).strKijitu
            gstrYoteihyouSort(Y).strKyuGan = gstrYoteihyouAry(Y).strKyuGan
            gstrYoteihyouSort(Y).strKyuRsk = gstrYoteihyouAry(Y).strKyuRsk
            gstrYoteihyouSort(Y).strKyuZan = gstrYoteihyouAry(Y).strKyuZan
            gstrYoteihyouSort(Y).strSyoGan = gstrYoteihyouAry(Y).strSyoGan
            gstrYoteihyouSort(Y).strSyoRsk = gstrYoteihyouAry(Y).strSyoRsk
            gstrYoteihyouSort(Y).strSyoZan = gstrYoteihyouAry(Y).strSyoZan
            gstrYoteihyouSort(Y).strZandaka = gstrYoteihyouAry(Y).strZandaka
        End With
    Next Y
    
    For Y = 1 To UBound(gstrYoteihyouAry)
        If Y <> 1 Then
            If lngSortKey(Y) < lngSortKey(Y - 1) Then
                gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouSort(Y - 1).intNenKBN
                If gstrYoteihyouSort(Y).intNenKBN > gstrYoteihyouSort(Y - 1).intNenKBN Then
                    gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN + 1
                End If
                
                
                gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouSort(Y - 1).intPageKBN
                If gstrYoteihyouSort(Y).intPageKBN > gstrYoteihyouSort(Y - 1).intPageKBN Then
                    gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN + 1
                End If
                
                gstrYoteihyouAry(Y).strHensai = gstrYoteihyouSort(Y - 1).strHensai
                gstrYoteihyouAry(Y).strKbn = gstrYoteihyouSort(Y - 1).strKbn
                gstrYoteihyouAry(Y).strKijitu = gstrYoteihyouSort(Y - 1).strKijitu
                gstrYoteihyouAry(Y).strKyuGan = gstrYoteihyouSort(Y - 1).strKyuGan
                gstrYoteihyouAry(Y).strKyuRsk = gstrYoteihyouSort(Y - 1).strKyuRsk
                gstrYoteihyouAry(Y).strKyuZan = gstrYoteihyouSort(Y - 1).strKyuZan
                gstrYoteihyouAry(Y).strSyoGan = gstrYoteihyouSort(Y - 1).strSyoGan
                gstrYoteihyouAry(Y).strSyoRsk = gstrYoteihyouSort(Y - 1).strSyoRsk
                gstrYoteihyouAry(Y).strSyoZan = gstrYoteihyouSort(Y - 1).strSyoZan
                gstrYoteihyouAry(Y).strZandaka = gstrYoteihyouSort(Y - 1).strZandaka
            
                gstrYoteihyouAry(Y - 1).intNenKBN = gstrYoteihyouSort(Y).intNenKBN
                gstrYoteihyouAry(Y - 1).intPageKBN = gstrYoteihyouSort(Y).intPageKBN
                gstrYoteihyouAry(Y - 1).strHensai = gstrYoteihyouSort(Y).strHensai
                gstrYoteihyouAry(Y - 1).strKbn = gstrYoteihyouSort(Y).strKbn
                gstrYoteihyouAry(Y - 1).strKijitu = gstrYoteihyouSort(Y).strKijitu
                gstrYoteihyouAry(Y - 1).strKyuGan = gstrYoteihyouSort(Y).strKyuGan
                gstrYoteihyouAry(Y - 1).strKyuRsk = gstrYoteihyouSort(Y).strKyuRsk
                gstrYoteihyouAry(Y - 1).strKyuZan = gstrYoteihyouSort(Y).strKyuZan
                gstrYoteihyouAry(Y - 1).strSyoGan = gstrYoteihyouSort(Y).strSyoGan
                gstrYoteihyouAry(Y - 1).strSyoRsk = gstrYoteihyouSort(Y).strSyoRsk
                gstrYoteihyouAry(Y - 1).strSyoZan = gstrYoteihyouSort(Y).strSyoZan
                gstrYoteihyouAry(Y - 1).strZandaka = gstrYoteihyouSort(Y).strZandaka
            End If
        End If
    Next Y

    '¡c‚Zo¡
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            If Trim$(.strKyuZan) <> "" Then
                lngKyuuyoHensaiZandaka = .strKyuZan
            End If
            If Trim$(.strSyoZan) <> "" Then
                lngSyouyoHensaiZandaka = .strSyoZan
            End If
            .strZandaka = lngKyuuyoHensaiZandaka + lngSyouyoHensaiZandaka 'c‚
        End With
    Next Y

    Exit Sub

asd:
Exit Sub

End Sub

'**********************************************************************************************************
'*  •ÔÏ—\’è•\–¾×ì¬_Vi—Z‘“ú‚ª2000/03/01ˆÚs‚ÌŒvZj
'**********************************************************************************************************
Public Sub gSubMakeMeisai()
 Dim strYuusibi         As String  '—Z‘“ú
 Dim dblRiritu          As Double  'Œ_–ñ—˜—¦
 Dim intHensaiTuki      As Integer '•ÔÏŒ”
 Dim lngKyuuyoHensaiAll As Long    '‹‹—^•ÔÏŠz(‘Šz)
 Dim lngSyouyoHensaiAll As Long    'Ü—^•ÔÏŠz(‘Šz)
 Dim strSyouyoDate1     As String  'Ü—^x•¥“ú‚P
 Dim strSyouyoDate2     As String  'Ü—^x•¥“ú‚Q
 Dim lngKyuuyoHensai    As Long    '–ˆŒ‹‹—^•ÔÏŠz
 Dim lngSyouyoHensai    As Long    '–ˆŒÜ—^•ÔÏŠz
     
'--ƒ[ƒN---------------------
 Dim i                       As Integer
 Dim intKyuuyoCNT            As Integer ' ‹‹—^‚ª‘æ‰½‰ñ–Ú‚©‚Ì”š
 Dim intSyouyoCNT            As Integer ' Ü—^‚ª‘æ‰½‰ñ–Ú‚©‚Ì”š
 Dim intNenKBN               As Integer '”N‹æ•ª
 Dim intKBN                  As Integer '‹æ•ª
 Dim strHensaiKijitu         As String  '•ÔÏŠú“ú
 Dim strSyouyoKijitu         As String  'Ü—^Šú“ú
 Dim lngKyuuyoHensaiZandaka  As Long    '‹‹—^•ÔÏc‚
 Dim lngSyouyoHensaiZandaka  As Long    'Ü—^•ÔÏc‚
 Dim intSyouyoHensaiKaisuu   As Integer 'Ü—^•ÔÏ‰ñ”
 Dim strSyouyoSiharaiTuki    As String  'Ü—^x•¥Œ
 Dim strZenkaiHensaiKijitu   As String  '‘O‰ñ•ÔÏŠú“ú
 Dim intHensaiKikan          As Integer '•ÔÏŠúŠÔ
 Dim strZenkaiSyouyoHensaiBi As String  '‘O‰ñÜ—^•ÔÏ“ú
 Dim dblRisoku1              As Double  '—˜‘§
 Dim dblRisoku2              As Double  '—˜‘§‚Q
 Dim dblKeiyakuriritu        As Double  'Œ_–ñ—˜—¦
    
 Dim Y As Integer

 Dim intNenKBN_WK             As Integer

 Dim StrWork_20011110_1 As String
 Dim StrWork_20011110_2 As String

 'ƒ\[ƒg‚Ég—p
 Dim lngSortKey()       As Long

'“X”»’è‚Ég—p@2002/05/13
 Dim strSyozoku As String

On Error GoTo asd

    '•Ï”‚ÉƒZƒbƒg
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '—Z‘“ú
    dblRiritu = CDbl(gfncstrDlm2(gstrYusiYMD, 6)) * 0.01            'Œ_–ñ—˜—¦
    intHensaiTuki = CInt(gfncstrDlm2(gstrYusiYMD, 7))               '•ÔÏŒ”
    lngKyuuyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 8))          '‹‹—^•ÔÏŠz(‘Šz)
    lngSyouyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 10))         'Ü—^•ÔÏŠz(‘Šz)
''''    gstrBonusMD1 = Format$(Left$(gstrBonusMD1, 2) & Right$(gstrBonusMD1, 2), "MMDD")                  'Ü—^x•¥Œ“ú‚P
''''    gstrBonusMD2 = Format$(Left$(gstrBonusMD2, 2) & Right$(gstrBonusMD2, 2), "MMDD")                  'Ü—^x•¥Œ“ú2
    lngKyuuyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 9))             '–ˆŒ‹‹—^•ÔÏŠz
    lngSyouyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 11))            '–ˆŒÜ—^•ÔÏŠz
    
    
    
    '—Z‘“ú‚ª 2000/11/10 ‚Ìê‡‚Í ’¼‹ß‚Ìƒ{[ƒiƒX“ú‚ğ‚UŒ‚P‚T‚É‚·‚é(’¼‹à‚Ì‚P‚QŒ‚P“ú‚Ìƒ{[ƒiƒX“ú‚ğ–³‹‚·‚é )
    If strYuusibi = "2000/11/09" Or strYuusibi = "2000/11/10" Then
        'gstrBonusMD1,gstrBonusMD1‚ğ‹t“]‚³‚¹‚é
' ŸŸŸ“X”»’è@2002/05/13ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ
        strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
        If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
        Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
        Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
        Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
        Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
        Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
        Then
            strSyouyoDate1 = "2001/06/15"
            strSyouyoDate2 = "2001/12/01"
        Else
            If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then '2001/12/06
                If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                Else
                    If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                        strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á'
                        strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á
                    Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                        strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                        strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                End If
            Else
                If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á ' 2002/04/27
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á
                Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            End If
        End If
    Else
''''        'Ü—^x•¥“ú”»’è
''''''        If Format(Date, "MMDD") < gstrBonusMD1 Then
''''        If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''            'Ü—^x•¥Œ“ú‚P‚ğÜ—^x•¥Œ“ú‚Q‚É
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''            strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''''        ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
''''        ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
''''            'Ü—^x•¥Œ“ú‚Q‚ğÜ—^x•¥Œ“ú‚P‚É
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''            strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''            strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        End If
        If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then '2001/12/06
            If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
            Else
                If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á'
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á
                Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            End If
        Else
            If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á ' 2002/04/27
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
        End If
    End If
    
    ' ‚P‰ñ–Ú‚ÌÜ—^•ÔÏ“ú‚Ü‚Å‚ÌŠúŠÔZo‚Ì‚½‚ß‚ÌŠJn“ú
    strZenkaiSyouyoHensaiBi = DateAdd("y", -1, CVDate(strYuusibi))

    '”N‹æ•ªAÜ—^‚ª‘æ‰½‰ñ–Ú‚©‚Ì”š@‚Ì‰Šú‰»
    intNenKBN = 1
    intKyuuyoCNT = 1
    intSyouyoCNT = 1
    
    ' Ü—^‚Ì•ÔÏ‰ñ”‚ğ‹‚ß‚é
    If intHensaiTuki <= 0 Then intHensaiTuki = 1
    intSyouyoHensaiKaisuu = Fix(intHensaiTuki / 6)
    
    '”¼’[‚È(‚P‚T‰ñ‚È‚Ç‚Ì‚U‚ÅŠ„‚èØ‚ê‚È‚¢)Œ”‚Å‚Ì•ÔÏ‚Ìê‡A”¼’[‚ÈŒ”‚Ì’†‚ÉÜ—^“ú‚ª‚ ‚ê‚ÎA‚»‚Ì‰ñ”‚ğ‰ÁZ‚·‚é
    For i = 1 To intHensaiTuki Mod 6
        If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate1) _
        Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate2) Then
            intSyouyoHensaiKaisuu = intSyouyoHensaiKaisuu + 1
        End If
    Next i
    If intSyouyoHensaiKaisuu <= 0 Then
        intSyouyoHensaiKaisuu = 1
    End If
    
    ' ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ“ú‚ğ‹‚ß‚éi—Z‘“ú‚Ì—‚Œ‚Ì‚Q‚T“ú‚©‚çj
    strHensaiKijitu = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
  
    ' ‚P‰ñ–Ú‚ÌÜ—^•ÔÏ“ú‚ğ‹‚ß‚éi—Z‘“ú‚Ì—‚ŒˆÈ~j
    
    '“X”»’è@2002/05/13
    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
    Then
        '—Z‘“ú‚ª 2000/11/10 ‚Ìê‡‚Í ’¼‹ß‚Ìƒ{[ƒiƒX“ú‚ğ‚UŒ‚P‚T‚É‚·‚é(’¼‹à‚Ì‚P‚QŒ‚P“ú‚Ìƒ{[ƒiƒX“ú‚ğ–³‹‚·‚é )
        If strYuusibi = "2000/11/09" Or strYuusibi = "2000/11/10" Then
            strSyouyoKijitu = "2001/06/15"
        Else
            If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then       'ˆêƒ–Œ‘O
                strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
            ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then   'ˆêƒ–Œ‘O
                strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
            Else
                strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
            End If
        End If
    ''''2003/05/06 «««’Ç‰Á
    Else
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then       'ˆêƒ–Œ‘O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then   'ˆêƒ–Œ‘O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
        End If
    ''''2003/05/06 ªªª’Ç‰Á
    End If
    
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll
    
    i = 1
    
    'Ÿƒ[ƒNƒe[ƒuƒ‹“o˜^—pƒf[ƒ^ì¬
    '* ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ—p‚Ìƒf[ƒ^‚ğ’Ç‰Á‚·‚é
    If lngKyuuyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
            .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
            .intNenKBN = intNenKBN  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
            .strKbn = "‹‹—^" & Space$(3 - Len(Format$(1, "###"))) & Format$(1, "###") '''''''''''''''''''''''''''‹æ•ª
            .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
            .strHensai = CStr(lngKyuuyoHensai) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            ' ‚P‰ñ–Ú‚Ì—˜‘§ŒvZ—pŠúŠÔi—Z‘“ú‚©‚ç‚P‰ñ–Ú‚Ü‚Å‚ÌŠúŠÔj
            intHensaiKikan = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strHensaiKijitu))
            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                ''''''.strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * intHensaiKikan)  ''''''''''''''''''''‹‹—^—˜‘§''''2002/02/19 upd CVar(intHensaiKikan)
                .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''‹‹—^—˜‘§
            Else
                dblKeiyakuriritu = dblRiritu * 100
                .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan) / 36500) ''''''''''''''''''''‹‹—^—˜‘§002/02/19 upd CVar(intHensaiKikan) & 2002/02/25  365‚É‚È‚Á‚Ä‚¢‚½
            End If
            
            .strKyuGan = .strHensai - .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
            If intHensaiTuki = 1 Then
                .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
            End If
            lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan
            .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^•ÔÏc‚
            .strZandaka = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''c‚
            .strSyoGan = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
            .strSyoRsk = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
            .strSyoZan = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
            intKyuuyoCNT = intKyuuyoCNT + 1
            i = i + 1
        End With
    End If

    If strYuusibi <> "2000/11/10" Then    '—Z‘“ú‚ª 2000/11/10 ‚Ìê‡‚Í ’¼‹ß‚Ìƒ{[ƒiƒX“ú‚ğ‚UŒ‚P‚T‚É‚·‚é(’¼‹à‚Ì‚P‚QŒ‚P“ú‚Ìƒ{[ƒiƒX“ú‚ğ–³‹‚·‚é )
        If strYuusibi <> "2000/11/09" Then    '—Z‘“ú‚ª 2000/11/10 ‚Ìê‡‚Í ’¼‹ß‚Ìƒ{[ƒiƒX“ú‚ğ‚UŒ‚P‚T‚É‚·‚é(’¼‹à‚Ì‚P‚QŒ‚P“ú‚Ìƒ{[ƒiƒX“ú‚ğ–³‹‚·‚é )
            '* ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏŒ‚ÆÜ—^•ÔÏŒ‚ªˆê’v‚·‚éê‡A‚P‰ñ–Ú‚ÌÜ—^•ÔÏ—p‚Ìƒf[ƒ^‚ğ’Ç‰Á‚·‚é
            If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
                ReDim Preserve gstrYoteihyouAry(i)
                With gstrYoteihyouAry(i)
                
                    If lngKyuuyoHensai > 0 Then
                      .intPageKBN = Fix((intNenKBN + 2) / 3)
                    Else
                      .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                    End If
                    .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
                    .strKbn = "Ü—^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''‹æ•ª
                    .strKijitu = gvarCnvDate(1, strSyouyoKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
                    .strHensai = CStr(lngSyouyoHensai) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                    ' ‚P‰ñ–Ú‚Ì—˜‘§ŒvZ—pŠúŠÔi—Z‘“ú‚©‚ç‚P‰ñ–Ú‚Ü‚Å‚ÌŠúŠÔj
                    intHensaiKikan = DateDiff("y", CVDate(strZenkaiSyouyoHensaiBi), CVDate(strSyouyoKijitu))
                    '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                        .strSyoRsk = Fix(lngSyouyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan))   ''''''''''''''''''''Ü—^—˜‘§''''2002/02/19 upd CVar(intHensaiKikan)
                    Else
                        dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * CVar(intHensaiKikan) / 365 ''''2002/02/19 upd CVar(intHensaiKikan)
                        .strSyoRsk = Int(dblRisoku2) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                    End If
                    .strSyoGan = .strHensai - .strSyoRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                    If intSyouyoHensaiKaisuu = 1 Then
                        .strSyoGan = lngSyouyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                        .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk ''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                    End If
                    lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan 'Ü—^•ÔÏc‚ ŒvZ
                    .strSyoZan = lngSyouyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
                    .strZandaka = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''c‚
                    .strKyuGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                    .strKyuRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^—˜‘§
                    .strKyuZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^•ÔÏc‚
                    strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                    intSyouyoCNT = intSyouyoCNT + 1
                    i = i + 1
                End With
            End If
        End If
    End If

    strZenkaiHensaiKijitu = strHensaiKijitu
    strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)
  
    ' ŸŸ‚Q‰ñ–ÚˆÈ~‚Ìƒf[ƒ^’Ç‰Á
    intNenKBN_WK = 2
    'While (I <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
    While (intKyuuyoCNT <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
        '* ‹‹—^‚Ìƒf[ƒ^’Ç‰Á
        If lngKyuuyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
                .strKbn = "‹‹—^" & Space$(3 - Len(Format$(intKyuuyoCNT, "###"))) & Format$(intKyuuyoCNT, "###") '‹æ•ª
                .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
                .strHensai = lngKyuuyoHensai ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                ' ‘O‰ñ‚©‚ç¡‰ñ‚Ì—˜‘§ŒvZ—pŠúŠÔ
                intHensaiKikan = DateDiff("y", CVDate(strZenkaiHensaiKijitu), CVDate(strHensaiKijitu))
                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    ''''''.strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblKeiyakuriritu * intHensaiKikan)  ''''''''''''''''''''‹‹—^—˜‘§  2002/_02_19 Upd CVar(intHensaiKikan)
                    .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''‹‹—^—˜‘§
                Else
                    .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblRiritu * CVar(intHensaiKikan) / 365) '''''''''''''''''''''‹‹—^—˜‘§ 2002/_02_19 Upd CVar(intHensaiKikan)
                End If
                
                .strKyuGan = .strHensai - .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                ' ÅI‰ñ‚Ìê‡
                If intHensaiTuki = intKyuuyoCNT Then
                    .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                    .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                End If
                lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '‹‹—^•ÔÏc‚ ŒvZ
                .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^c‚
                .strZandaka = " "
                .strSyoGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                .strSyoRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                .strSyoZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^c‚
                intKyuuyoCNT = intKyuuyoCNT + 1
                i = i + 1
            End With
        End If
        
        '* “–ŠYŒ‚ÆÜ—^•ÔÏŒ‚ªˆê’v‚·‚éê‡AÜ—^•ÔÏ—p‚Ìƒf[ƒ^‚à’Ç‰Á‚·‚é
        If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                
                If lngKyuuyoHensai > 0 Then
                    .intPageKBN = Fix((intNenKBN + 2) / 3)
                Else
                    .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ƒy[ƒW‹æ•ª
                End If
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''”N‹æ•ª
                .strKbn = "Ü—^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''‹æ•ª
                '* ¡‰ñ‚ÌÜ—^•ÔÏ“ú‚ÌZo
                If Month(strHensaiKijitu) = Month(strSyouyoDate1) Then
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
                Else
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
                End If
                .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏŠú“ú
                .strHensai = lngSyouyoHensai '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                ' —˜‘§ŒvZ—pŠúŠÔ
                intHensaiKikan = DateDiff("y", CVDate(strZenkaiSyouyoHensaiBi), CVDate(strSyouyoKijitu))
                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    .strSyoRsk = Fix(lngSyouyoHensaiZandaka * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''Ü—^—˜‘§  2002/_02_19 Upd CVar(intHensaiKikan)
                Else
                    dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu * CVar(intHensaiKikan) / 365 '''2002/_02_19 Upd CVar(intHensaiKikan)
                    .strSyoRsk = Int(dblRisoku2) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^—˜‘§
                End If
                .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                ' ÅI‰ñ‚Ìê‡
                If intSyouyoHensaiKaisuu = intSyouyoCNT Then
                    .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Ü—^Œ³–{
                    .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''•ÔÏ‹àŠz
                End If
                lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan 'Ü—^•ÔÏc‚ ŒvZ
                .strSyoZan = lngSyouyoHensaiZandaka
                .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''c‚
                .strKyuGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^Œ³–{
                .strKyuRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^—˜‘§
                .strKyuZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''‹‹—^•ÔÏc‚
                strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                intSyouyoCNT = intSyouyoCNT + 1
                i = i + 1
            End With
        End If
        
        strZenkaiHensaiKijitu = strHensaiKijitu
        strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)
        
        ' ‚P‚Q‰ñiŸ‚ªÜ—^‚Ì‚ÍAŸ‚ÌÜ—^‚Ü‚ÅŠÜ‚Ü‚ê‚éj–ˆ‚ÉA
        ' •ÔÏ—\’è•\‚ÉŒrü‚ğo—Í‚³‚¹‚é‚½‚ß‚Ì‹æ•ª‚ÌƒJƒEƒ“ƒgƒAƒbƒv
        If ((intNenKBN_WK) Mod 12) = 0 Then
            intNenKBN = intNenKBN + 1
        End If
        intNenKBN_WK = intNenKBN_WK + 1
        
    Wend

    '¡gstrYoteihyouAry”z—ñƒ\[ƒg...Ü—^ƒf[ƒ^‚ª‚¸‚ê‚Ä‚¢‚é‚½‚ß¡
    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            ReDim Preserve lngSortKey(Y)
            ReDim Preserve gstrYoteihyouSort(Y)
            lngSortKey(Y) = CLng(Format(Mid$(.strKijitu, 1, 2), "00") & Format(Mid$(.strKijitu, 4, 2), "00") & Format(Mid$(.strKijitu, 7, 2), "00"))
            gstrYoteihyouSort(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN
            gstrYoteihyouSort(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN
            gstrYoteihyouSort(Y).strHensai = gstrYoteihyouAry(Y).strHensai
            gstrYoteihyouSort(Y).strKbn = gstrYoteihyouAry(Y).strKbn
            gstrYoteihyouSort(Y).strKijitu = gstrYoteihyouAry(Y).strKijitu
            gstrYoteihyouSort(Y).strKyuGan = gstrYoteihyouAry(Y).strKyuGan
            gstrYoteihyouSort(Y).strKyuRsk = gstrYoteihyouAry(Y).strKyuRsk
            gstrYoteihyouSort(Y).strKyuZan = gstrYoteihyouAry(Y).strKyuZan
            gstrYoteihyouSort(Y).strSyoGan = gstrYoteihyouAry(Y).strSyoGan
            gstrYoteihyouSort(Y).strSyoRsk = gstrYoteihyouAry(Y).strSyoRsk
            gstrYoteihyouSort(Y).strSyoZan = gstrYoteihyouAry(Y).strSyoZan
            gstrYoteihyouSort(Y).strZandaka = gstrYoteihyouAry(Y).strZandaka
        End With
    Next Y
    
    For Y = 1 To UBound(gstrYoteihyouAry)
        If Y <> 1 Then
            If lngSortKey(Y) < lngSortKey(Y - 1) Then
                gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouSort(Y - 1).intNenKBN
                gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouSort(Y - 1).intPageKBN
                gstrYoteihyouAry(Y).strHensai = gstrYoteihyouSort(Y - 1).strHensai
                gstrYoteihyouAry(Y).strKbn = gstrYoteihyouSort(Y - 1).strKbn
                gstrYoteihyouAry(Y).strKijitu = gstrYoteihyouSort(Y - 1).strKijitu
                gstrYoteihyouAry(Y).strKyuGan = gstrYoteihyouSort(Y - 1).strKyuGan
                gstrYoteihyouAry(Y).strKyuRsk = gstrYoteihyouSort(Y - 1).strKyuRsk
                gstrYoteihyouAry(Y).strKyuZan = gstrYoteihyouSort(Y - 1).strKyuZan
                gstrYoteihyouAry(Y).strSyoGan = gstrYoteihyouSort(Y - 1).strSyoGan
                gstrYoteihyouAry(Y).strSyoRsk = gstrYoteihyouSort(Y - 1).strSyoRsk
                gstrYoteihyouAry(Y).strSyoZan = gstrYoteihyouSort(Y - 1).strSyoZan
                gstrYoteihyouAry(Y).strZandaka = gstrYoteihyouSort(Y - 1).strZandaka
            
                gstrYoteihyouAry(Y - 1).intNenKBN = gstrYoteihyouSort(Y).intNenKBN
                gstrYoteihyouAry(Y - 1).intPageKBN = gstrYoteihyouSort(Y).intPageKBN
                gstrYoteihyouAry(Y - 1).strHensai = gstrYoteihyouSort(Y).strHensai
                gstrYoteihyouAry(Y - 1).strKbn = gstrYoteihyouSort(Y).strKbn
                gstrYoteihyouAry(Y - 1).strKijitu = gstrYoteihyouSort(Y).strKijitu
                gstrYoteihyouAry(Y - 1).strKyuGan = gstrYoteihyouSort(Y).strKyuGan
                gstrYoteihyouAry(Y - 1).strKyuRsk = gstrYoteihyouSort(Y).strKyuRsk
                gstrYoteihyouAry(Y - 1).strKyuZan = gstrYoteihyouSort(Y).strKyuZan
                gstrYoteihyouAry(Y - 1).strSyoGan = gstrYoteihyouSort(Y).strSyoGan
                gstrYoteihyouAry(Y - 1).strSyoRsk = gstrYoteihyouSort(Y).strSyoRsk
                gstrYoteihyouAry(Y - 1).strSyoZan = gstrYoteihyouSort(Y).strSyoZan
                gstrYoteihyouAry(Y - 1).strZandaka = gstrYoteihyouSort(Y).strZandaka
            End If
        End If
    Next Y



    '¡c‚Zo¡
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            If Trim$(.strKyuZan) <> "" Then
                lngKyuuyoHensaiZandaka = .strKyuZan
            End If
            If Trim$(.strSyoZan) <> "" Then
                lngSyouyoHensaiZandaka = .strSyoZan
            End If
            .strZandaka = lngKyuuyoHensaiZandaka + lngSyouyoHensaiZandaka 'c‚
        End With
    Next Y

asd:
Exit Sub

End Sub

'***********************************************************************************************************
' @ ’ •[—pƒf[ƒ^ì¬
'***********************************************************************************************************
Public Function gfncblnMakPrintDat() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim j                 As Long
 Const cnsMaxRec       As Long = 100  'ˆê‰ñ‚Åo—Í‚·‚éÅ‘ås” '''''
 Const cnslngAryCnt    As Long = 100   '”z—ñ‚ÌŒ”  ‹y‚ÑA‚P‰ñ‚Åæ“¾‚·‚é‚l‚`‚w‚ÌŒ”
 Dim OraPArray_01      As Object       '01 ƒy[ƒW‹æ•ª
 Dim OraPArray_02      As Object       '02 ”N‹æ•ª
 Dim OraPArray_03      As Object       '03 ‹æ•ª
 Dim OraPArray_04      As Object       '04 •ÔÏŠú“ú
 Dim OraPArray_05      As Object       '05 •ÔÏ‹àŠz
 Dim OraPArray_06      As Object       '06 c‚
 Dim OraPArray_07      As Object       '07 ‹‹—^Œ³–{
 Dim OraPArray_08      As Object       '08 ‹‹—^—˜‘§
 Dim OraPArray_09      As Object       '09 ‹‹—^c‚
 Dim OraPArray_10      As Object       '10 Ü—^Œ³–{
 Dim OraPArray_11      As Object       '11 Ü—^—˜‘§
 Dim OraPArray_12      As Object       '12 Ü—^c‚
 
 Dim StrYuusiYMDWK     As String

On Error GoTo ErrgfncblnMakPrintDat

    gfncblnMakPrintDat = False
    
    '‚r‚o—pƒpƒ‰ƒ[ƒ^[ƒZƒbƒg
    'ĞˆõƒR[ƒh‚P
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrSyainCd1, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    'ĞˆõƒR[ƒh‚Q
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrSyainCd2, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    '–¼
    odbDatabase.Parameters.Add "InStrSimei", frmQPAV_CEnt110.lblShimei.Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSimei").ServerType = ORATYPE_VARCHAR2
    '“X–¼
    odbDatabase.Parameters.Add "InStrMiseNm", frmQPAV_CEnt110.lblShozoku(1).Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrMiseNm").ServerType = ORATYPE_VARCHAR2
    '—Z‘”NŒ“ú
    StrYuusiYMDWK = frmQPAV_CEnt110.txtYuusibiY.Text & "/" & frmQPAV_CEnt110.txtYuusibiM.Text & "/" & frmQPAV_CEnt110.txtYuusibiD.Text
    StrYuusiYMDWK = gvarCnvDate(1, StrYuusiYMDWK)
    odbDatabase.Parameters.Add "InStrYusiYMD", StrYuusiYMDWK, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYusiYMD").ServerType = ORATYPE_VARCHAR2
    '—˜—¦
    odbDatabase.Parameters.Add "InStrRiritu", frmQPAV_CEnt110.lblRiritu.Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_VARCHAR2
    '—Z‘‹àŠz
    odbDatabase.Parameters.Add "InNumYusiKng", CLng(frmQPAV_CEnt110.lblYuushi.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumYusiKng").ServerType = ORATYPE_NUMBER
    '‹‹—^•ÔÏŠz
    odbDatabase.Parameters.Add "InNumKyuHensai", CLng(frmQPAV_CEnt110.lblKyuuyo.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumKyuHensai").ServerType = ORATYPE_NUMBER
    'Ü—^•ÔÏŠz
    odbDatabase.Parameters.Add "InNumSyoHensai", CLng(frmQPAV_CEnt110.lblShouyo.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumSyoHensai").ServerType = ORATYPE_NUMBER
    
    '”z—ñŒ”
    odbDatabase.Parameters.Add "InNumAryCount", UBound(gstrYoteihyouAry), ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    
    '01 ƒy[ƒW‹æ•ª”z—ñ
              odbDatabase.Parameters.AddTable "InNumPageKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_01 = odbDatabase.Parameters("InNumPageKBNAry")
    '02 ”N‹æ•ª”z—ñ
              odbDatabase.Parameters.AddTable "InNumNenKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_02 = odbDatabase.Parameters("InNumNenKBNAry")
    '03 ‹æ•ª”z—ñ
              odbDatabase.Parameters.AddTable "InStrKBNAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 10
    Set OraPArray_03 = odbDatabase.Parameters("InStrKBNAry")
    '04 •ÔÏŠú“ú”z—ñ
              odbDatabase.Parameters.AddTable "InStrKijituAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    Set OraPArray_04 = odbDatabase.Parameters("InStrKijituAry")
    '05 •ÔÏ‹àŠz”z—ñ
              odbDatabase.Parameters.AddTable "InNumHensaiAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_05 = odbDatabase.Parameters("InNumHensaiAry")
    '06 c‚”z—ñ
              odbDatabase.Parameters.AddTable "InNumZandakaAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_06 = odbDatabase.Parameters("InNumZandakaAry")
    '07 ‹‹—^Œ³–{”z—ñ
              odbDatabase.Parameters.AddTable "InNumKyuGanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_07 = odbDatabase.Parameters("InNumKyuGanAry")
    '08 ‹‹—^—˜‘§”z—ñ
              odbDatabase.Parameters.AddTable "InNumKyuRskAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_08 = odbDatabase.Parameters("InNumKyuRskAry")
    '09 ‹‹—^c‚”z—ñ
              odbDatabase.Parameters.AddTable "InNumKyuZanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_09 = odbDatabase.Parameters("InNumKyuZanAry")
    '10 Ü—^Œ³–{”z—ñ
              odbDatabase.Parameters.AddTable "InNumSyoGanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_10 = odbDatabase.Parameters("InNumSyoGanAry")
    '11 Ü—^—˜‘§”z—ñ
              odbDatabase.Parameters.AddTable "InNumSyoRskAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_11 = odbDatabase.Parameters("InNumSyoRskAry")
    '12 Ü—^c‚”z—ñ
              odbDatabase.Parameters.AddTable "InNumSyoZanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_12 = odbDatabase.Parameters("InNumSyoZanAry")
    
    'ƒRƒ“ƒsƒ…[ƒ^[–¼
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2
        
             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110PrintAdd("
    strSQL = strSQL & " :InStrSyainCD1"     'ĞˆõƒR[ƒh‚P
    strSQL = strSQL & ",:InStrSyainCD2"     'ĞˆõƒR[ƒh‚Q
    strSQL = strSQL & ",:InStrSimei"        '–¼
    strSQL = strSQL & ",:InStrMiseNm"       '“X–¼
    strSQL = strSQL & ",:InStrYusiYMD"      '—Z‘”NŒ“ú
    strSQL = strSQL & ",:InStrRiritu"       '—˜—¦
    strSQL = strSQL & ",:InNumYusiKng"      '—Z‘‹àŠz
    strSQL = strSQL & ",:InNumKyuHensai"    '‹‹—^•ÔÏŠz
    strSQL = strSQL & ",:InNumSyoHensai"    'Ü—^•ÔÏŠz
    strSQL = strSQL & ",:InNumAryCount"     '”z—ñŒ”
    strSQL = strSQL & ",:InNumPageKBNAry"   'ƒy[ƒW‹æ•ª”z—ñ
    strSQL = strSQL & ",:InNumNenKBNAry"    '”N‹æ•ª”z—ñ
    strSQL = strSQL & ",:InStrKBNAry"       '‹æ•ª”z—ñ
    strSQL = strSQL & ",:InStrKijituAry"    '•ÔÏŠú“ú”z—ñ
    strSQL = strSQL & ",:InNumHensaiAry"    '•ÔÏ‹àŠz”z—ñ
    strSQL = strSQL & ",:InNumZandakaAry"   'c‚”z—ñ
    strSQL = strSQL & ",:InNumKyuGanAry"    '‹‹—^Œ³–{”z—ñ
    strSQL = strSQL & ",:InNumKyuRskAry"    '‹‹—^—˜‘§”z—ñ
    strSQL = strSQL & ",:InNumKyuZanAry"    '‹‹—^c‚”z—ñ
    strSQL = strSQL & ",:InNumSyoGanAry"    'Ü—^Œ³–{”z—ñ
    strSQL = strSQL & ",:InNumSyoRskAry"    'Ü—^—˜‘§”z—ñ
    strSQL = strSQL & ",:InNumSyoZanAry"    'Ü—^c‚”z—ñ
    strSQL = strSQL & ",:InStrCOMPUTERMEI); END;" 'ƒRƒ“ƒsƒ…[ƒ^–¼
 
    i = 1
    
    Do Until i > UBound(gstrYoteihyouAry)
        For j = 1 To cnsMaxRec '
            If i > UBound(gstrYoteihyouAry) Then
                Exit For
            End If
            With gstrYoteihyouAry(i)
                OraPArray_01.Put_value CLng(.intPageKBN), (j - 1) '01 ƒy[ƒW‹æ•ª
                OraPArray_02.Put_value CLng(.intNenKBN), (j - 1)  '02 ”N‹æ•ª
                OraPArray_03.Put_value .strKbn, (j - 1)           '03 ‹æ•ª
                
                
                OraPArray_04.Put_value .strKijitu, (j - 1)        '04 •ÔÏŠú“ú
                
                OraPArray_05.Put_value CLng(.strHensai), (j - 1)  '05 •ÔÏ‹àŠz
                OraPArray_06.Put_value CLng(.strZandaka), (j - 1) '06 c‚
                
                If .strKyuGan = " " Then                          '07 ‹‹—^Œ³–{
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.strKyuGan), (j - 1)
                End If
                If .strKyuRsk = " " Then                          '08 ‹‹—^—˜‘§
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.strKyuRsk), (j - 1)
                End If
                If .strKyuZan = " " Then                          '09 ‹‹—^c‚
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.strKyuZan), (j - 1)
                End If

                If .strSyoGan = " " Then                          '10 Ü—^Œ³–{
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.strSyoGan), (j - 1)
                End If

                If .strSyoRsk = " " Then                          '11 Ü—^—˜‘§
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.strSyoRsk), (j - 1)
                End If

                If .strSyoZan = " " Then                          '12 Ü—^c‚
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.strSyoZan), (j - 1)
                End If
                
            End With
            i = i + 1
        Next j
        
        '”z—ñŒ”‚Ì’lƒZƒbƒg
        odbDatabase.Parameters("InNumAryCount").Value = j - 1
        
        '‚r‚p‚k•¶‚ÌÀs
        odbDatabase.DbexecuteSQL (strSQL)
    
    Loop
 
    'ƒIƒuƒWƒFƒNƒg‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)

    gfncblnMakPrintDat = True

    Exit Function

ErrgfncblnMakPrintDat:
'´×°ˆ—
    
    '´×°Ò¯¾°¼Ş•\¦
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'µÌŞ¼Şª¸Ä‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)

End Function
'***********************************************************************************************************
' @ ’ •[—pƒf[ƒ^íœ
'***********************************************************************************************************
Public Function gfncblnDelPrintDat() As Boolean
 Dim strSQL            As String

On Error GoTo ErrgfncblnDelPrintDat

    gfncblnDelPrintDat = False

    'ƒRƒ“ƒsƒ…[ƒ^[–¼
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110PrintDel("
    strSQL = strSQL & ":InStrCOMPUTERMEI); END;" 'ƒRƒ“ƒsƒ…[ƒ^–¼

    '‚r‚p‚k•¶‚ÌÀs
    odbDatabase.DbexecuteSQL (strSQL)

    'ƒIƒuƒWƒFƒNƒg‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)

    gfncblnDelPrintDat = True

    Exit Function

ErrgfncblnDelPrintDat:
'´×°ˆ—
    
    '´×°Ò¯¾°¼Ş•\¦
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'µÌŞ¼Şª¸Ä‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)

End Function
'*************************************************************************************************************************************************
'     –ˆ‰ñÜ—^•ÔÏŠzZoŠúŠÔ6ƒJŒˆÈŠO
'*************************************************************************************************************************************************
Function gfnclngSyouyoHensai(strYuusibi As String, dblRiritu As Double, strSyouyoDate1 As String, strSyouyoDate2 As String, intSyouyoHensaiKaisuu As Integer, lngSyouyoHensaiAll As Long, dblRisoku1 As Double, lngSyouyoTeigaku As Long) As Long
 Dim T As Integer
 Dim lngTeiGakuHensai_1 As Long   '’èŠz•ÔÏŠz_WORK
 Dim lngTeiGakuHensai_2 As Long   '’èŠz•ÔÏŠz_WORK2
 Dim lngTeiGakuHensai_3 As Long   '’èŠz•ÔÏŠz_•Û‘¶
 Dim lngHensaiSagaku    As Long   '•ÔÏ·Šz_WORK
 Dim lngHensaiSyuukei   As Long   '•ÔÏWŒv_WORK
 Dim lngSyouyoHenZan    As Long   'Ü—^•ÔÏc‚_WORK
 Dim lngSyouyoHenRsk    As Long   'Ü—^•ÔÏ—˜‘§_WORK
 Dim strSyouyoKijitu    As String 'Ü—^Šú“ú_WORK
 Dim strZenkaiSyouyoHen As String '‘O‰ñÜ—^•ÔÏ“ú_WORK
 Dim lngSaisyuHensai    As Long   'ÅI•ÔÏŠz_WORK

 Dim dblKeiyakuriritu    As Double   'ŒXÎƒN—˜—¦ƒ[ƒNiVƒVƒXƒeƒ€2001/11/01ˆÈ~‚Ég—pj

    If lngSyouyoHensaiAll <= 0 Then
        gfnclngSyouyoHensai = 0
        Exit Function
    End If

    '--------------------
    lngTeiGakuHensai_3 = lngSyouyoTeigaku
    lngTeiGakuHensai_1 = lngSyouyoTeigaku

    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then 'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If

    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
    lngTeiGakuHensai_2 = Int(lngHensaiSyuukei / intSyouyoHensaiKaisuu)

    '--------------------
    Do
        lngHensaiSagaku = Abs(lngTeiGakuHensai_1 - lngSaisyuHensai)
        lngTeiGakuHensai_3 = lngTeiGakuHensai_1
        lngTeiGakuHensai_1 = lngTeiGakuHensai_2
        lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
        lngHensaiSyuukei = lngTeiGakuHensai_1
        lngSaisyuHensai = lngTeiGakuHensai_1
        strZenkaiSyouyoHen = strYuusibi
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
        End If
        For T = 2 To intSyouyoHensaiKaisuu
            strZenkaiSyouyoHen = strSyouyoKijitu
            If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
                strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
            Else
                strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
            End If
        
            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
                lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
            Else
                lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
            End If
        
            If T = intSyouyoHensaiKaisuu Then
                lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
                lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
                lngSyouyoHenZan = 0
            Else
                lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
                lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
            End If
        Next T
        lngTeiGakuHensai_2 = Int((lngHensaiSyuukei + 1) / intSyouyoHensaiKaisuu)
    Loop While lngHensaiSagaku > Abs(lngTeiGakuHensai_1 - lngSaisyuHensai)

    '***’èŠz•ÔÏŠz_•Û‘¶({‚P) ‚Ìê‡‚Å·Šz‚ğ‹‚ß‚é
    lngTeiGakuHensai_2 = lngTeiGakuHensai_3
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 + 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If
  
    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
      
    If lngHensaiSagaku > Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 + 1
    End If

    If lngHensaiSagaku = Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 + 1
    End If
    
    '***’èŠz•ÔÏŠz_•Û‘¶(|‚P) ‚Ìê‡‚Å·Šz‚ğ‹‚ß‚é
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 - 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then 'ˆêƒ–Œ‘O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If
  
    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
      
    If lngHensaiSagaku >= Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 - 1
    End If

    gfnclngSyouyoHensai = lngTeiGakuHensai_3

End Function


'***********************************************************************************************************
'  “ú•t•ÏŠ·
'***********************************************************************************************************
Public Function gvarCnvDate(intSyoriFlg As Integer, varHenkanDate As Variant) As Variant
 Dim varHenkanMae As Variant

On Error GoTo TO_ERROR_gvarCnvDate

    gvarCnvDate = Null
  
    varHenkanMae = CVDate(varHenkanDate)

    Select Case intSyoriFlg
'2019/5/7 MOD START ¼—ï‰º2Œ…•\¦‚É•ÏX
'        Case 1: gvarCnvDate = Space(2 - Len(Format$(varHenkanMae, "e"))) & Format$(varHenkanMae, "e.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
'        Case 2: gvarCnvDate = Format$(varHenkanMae, "ge.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
        Case 1: gvarCnvDate = Space(2 - Len(Format$(varHenkanMae, "yy"))) & Format$(varHenkanMae, "yy.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
        Case 2: gvarCnvDate = Format$(varHenkanMae, "yy.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
'2019/5/7 MOD END
    End Select

EXIT_gvarCnvDate:
    Exit Function

TO_ERROR_gvarCnvDate:
    Resume EXIT_gvarCnvDate

End Function


