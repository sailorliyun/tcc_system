Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt120"  'ƒvƒƒOƒ‰ƒ€–¼
 Public Const gcnsNumeric = "0123456789"     '“ü—Í•¶š§Œä—p‚Ì”’l
 Public Const gcnsstrSysChng = "2001/11/01"    'VƒVƒXƒeƒ€ˆÈ~“ú
    
 Public gstrSysDate   As String 'ƒVƒXƒeƒ€“ú•t
 Public gstrBonusMD1  As String 'ƒ{[ƒiƒXx•¥“ú‚P
 Public gstrBonusMD2  As String 'ƒ{[ƒiƒXx•¥“ú‚Q
    
 '‹‹—^•ÔÏŠz—p
 Type KyuuyoTbl
    intPageKbn   As Integer 'ƒy[ƒW‹æ•ª
    intGyoKbn    As Integer 's‹æ•ª
    strYuusibi   As String  '—Z‘“ú
    strYuusigaku As String  '—Z‘Šz
    strRiritu    As String  'Œ_–ñ—˜—¦
    strKariire   As String  'Ø“ü‹àŠz
    str06Month   As String  '@‚Uƒ–Œ
    str12Month   As String  '‚P‚Qƒ–Œ
    str18Month   As String  '‚P‚Wƒ–Œ
    str24Month   As String  '‚Q‚Sƒ–Œ
    str30Month   As String  '‚R‚Oƒ–Œ
    str36Month   As String  '‚R‚Uƒ–Œ
    str42Month   As String  '‚S‚Qƒ–Œ
    str48Month   As String  '‚S‚Wƒ–Œ
    str54Month   As String  '‚T‚Sƒ–Œ
    str60Month   As String  '‚U‚Oƒ–Œ
 End Type

 'Ü—^•ÔÏŠz—p
 Type SyouyoTbl
    intPageKbn     As Integer 'ƒy[ƒW‹æ•ª
    intGyoKbn      As Integer 's‹æ•ª
    strYuusibi     As String  '—Z‘“ú
    strYuusigaku   As String  '—Z‘Šz
    strRiritu      As String  'Œ_–ñ—˜—¦
    strKariire     As String  'Ø“ü‹àŠz
    strJikaiSyouyo As String  'Ÿ‰ñÜ—^Œ
    str06Kai       As String  '@‚U‰ñ
    str12Kai       As String  '‚P‚Q‰ñ
    str18Kai       As String  '‚P‚W‰ñ
    str24Kai       As String  '‚Q‚S‰ñ
    str30Kai       As String  '‚R‚O‰ñ
    str36Kai       As String  '‚R‚U‰ñ
    str42Kai       As String  '‚S‚Q‰ñ
    str48Kai       As String  '‚S‚W‰ñ
    str54Kai       As String  '‚T‚S‰ñ
    str60Kai       As String  '‚U‚O‰ñ
 End Type

 Public gstrKyuuyoAry() As KyuuyoTbl '‹‹—^•ÔÏŠz—p
 Public gstrSyouyoAry() As SyouyoTbl 'Ü—^•ÔÏŠz—p

 Public gdblRiritu      As Double    'Œ_–ñ—˜—¦
 Public gstrYuusiBi_Fr  As String    '—Z‘“ú_From
 Public gstrYuusiBi_To  As String    '—Z‘“ú_To

 Public lngErrCode           As Long          '´×°º°ÄŞ
 Public strErrDescription    As String        '´×°Ò¯¾°¼Ş



'ˆóü•Ï”
Public glngPrintCnt        As Long         '”z—ñŒ”
Public gvarShiharai1()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚U‚©Œj
Public gvarShiharai2()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚P‚Q‚©Œj
Public gvarShiharai3()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚P‚W‚©Œj
Public gvarShiharai4()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚Q‚S‚©Œj
Public gvarShiharai5()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚R‚O‚©Œj
Public gvarShiharai6()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚R‚U‚©Œj
Public gvarShiharai7()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚S‚Q‚©Œj
Public gvarShiharai8()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚S‚W‚©Œj
Public gvarShiharai9()     As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚T‚S‚©Œj
Public gvarShiharai10()    As Variant      'x•¥‚¢‰ñ”Œ”z—ñi‚U‚O‚©Œj
Public gvarYuushigaku()    As Variant      '—Z‘Šz
Public gstrKSKbn()         As String       '‹‹—^Ü—^‹æ•ª”z—ñ
Public gintPageKbn         As Integer      '•Å‹æ•ª
Public gintGyouKbn         As Integer      's‹æ•ª
Public gstrYuushiDate      As String       '—Z‘“ú
Public gsglRiritu          As Single       '—˜—¦
Public gstrNextSyouyo      As Single       'Ÿ‰ñÜ—^Œ
'
'
''ƒR[ƒhƒe[ƒuƒ‹
'Type CodeTbl
'    CodeNo As String
'    Meisyou As String
'End Type
'
'Public gtblSyori() As CodeTbl
'*************************************************************
'* ‹N“®@‚l‚`‚h‚m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '“®ìŠÂ‹«
    If App.PrevInstance Then
        MsgBox "•Ô‹pŠzˆê——•\‚ÍŠù‚É‹N“®‚³‚ê‚Ä‚¢‚Ü‚·B" _
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

    frmQPAV_CEnt120.Show 1
 
End Sub
'****************************************************************************************************
'*  ‰Šúˆ——pSPiƒVƒXƒeƒ€“ú•tj
'****************************************************************************************************
Public Sub gsubSPlnit()
 Dim strWkAry As String
 Dim strSQL As String
 Dim i As Long
 Dim strTmp As String
 Const cnsMaxRec As Long = 100
 
 On Error GoTo errSPlnit
 
    '‚r‚o
    'ƒVƒXƒeƒ€“ú•t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2
    'ƒ{[ƒiƒXx•¥“ú‚P
    odbDatabase.Parameters.Add "OtStrBonusDate1", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrBonusDate1").ServerType = ORATYPE_VARCHAR2
    'ƒ{[ƒiƒXx•¥“ú‚Q
    odbDatabase.Parameters.Add "OtStrBonusDate2", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrBonusDate2").ServerType = ORATYPE_VARCHAR2
                
    '‚r‚p‚k•¶
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120Init("
    strSQL = strSQL & " :OtStrSysDate"
    strSQL = strSQL & ",:OtStrBonusDate1"
    strSQL = strSQL & ",:OtStrBonusDate2); END;"
            
    '‚r‚o‚ÌÀs
    odbDatabase.DbexecuteSQL (strSQL)
            
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate") 'ƒVƒXƒeƒ€“ú•t
    gstrBonusMD1 = odbDatabase.Parameters("OtStrBonusDate1") 'ƒ{[ƒiƒXx•¥“ú‚P
    gstrBonusMD2 = odbDatabase.Parameters("OtStrBonusDate2") 'ƒ{[ƒiƒXx•¥“ú‚Q
    
    'ƒIƒuƒWƒFƒNƒg‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
            
errSPlnit:
'ƒGƒ‰[ˆ—
    
    'ƒGƒ‰[ƒƒbƒZ[ƒW•\¦
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'ƒIƒuƒWƒFƒNƒg‚ÌŠJ•ú
    Call gsubParaRemove(odbDatabase)
        
End Sub

'**********************************************************************************************************
'*  •ÔÏ—\’è•\–¾×ì¬
'**********************************************************************************************************
Public Sub gSubMakeMeisai()
 Dim dblRiritu    As Double    'Œ_–ñ—˜—¦
 
'--ƒ[ƒN----------------------------------------------
 Dim lngYuusi           As Long    '—Z‘Šz_WORK
 Dim strSyouyoDate1     As String  'Ü—^x‹‹Œ1_WORK
 Dim strSyouyoDate2     As String  'Ü—^x‹‹Œ1_WORK
 Dim dblKeiyakuriritu   As Double  'Œ_–ñ—˜—¦_WORK
 Dim strMonth_1         As String  'Œ1_WORK
 Dim strMonth_2         As String  'Œ1_WORK
 Dim strNextSyouyoMonth As String  'Ÿ‰ñÜ—^Œ_WORK
 Dim intPage            As Integer '•Å_WORK
 Dim intGyou            As Integer 's_WORK
 Dim strYuusiDate       As String  '—Z‘“ú_WORK
 Dim strYuusiMae        As String  '—Z‘“ú•t‘O_WORK
 Dim strYuusiAto        As String  '—Z‘“ú•tŒã_WORK
 Dim lngKyuuyoCNT       As Long    '‹‹—^”z—ñŒ”
 Dim lngSyouyoCNT       As Long    'Ü—^”z—ñŒ”


 Dim dblWKYuusibi     As Double
 Dim varWKSyouyoDate1 As Variant
 Dim varWKSyouyoDate2 As Variant
 Dim strYuusiYMD_W    As Date

On Error GoTo gSubMakeMeisaiKyuu

    '•Ï”‚ÉƒZƒbƒg
    dblRiritu = gdblRiritu                           'Œ_–ñ—˜—¦
    dblKeiyakuriritu = dblRiritu
    
    If Val(Format$(gstrYuusiBi_Fr, "dd")) <= 10 Then '—Z‘“ú•t‘O
        strYuusiMae = CVDate(Format$(gstrYuusiBi_Fr, "yyyy/mm/") & "10")
    Else
        strYuusiMae = CVDate(Format$(gstrYuusiBi_Fr, "yyyy/mm/") & "25")
    End If
    If Val(Format$(gstrYuusiBi_To, "dd")) <= 10 Then '—Z‘“ú•tŒã
        strYuusiAto = CVDate(Format$(gstrYuusiBi_To, "yyyy/mm/") & "10")
    Else
        strYuusiAto = CVDate(Format$(gstrYuusiBi_To, "yyyy/mm/") & "25")
    End If

'2004/02/18 ‘ä’ “o˜^‚Æ“¯‚¶ˆ—‚É•ÏX
    strYuusiYMD_W = Date
    If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
        End If
        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")

    Else
        If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12’Ç‰Á '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12’Ç‰Á
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12’Ç‰Á
        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
        strMonth_2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
    End If
'•ÏX‘O
''''    'Ü—^x•¥“ú”»’è
''''''    If Format(Date, "MMDD") < gstrBonusMD1 Then
''''    If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''        'Ü—^x•¥Œ“ú‚Q‚ğÜ—^x•¥Œ“ú‚P‚É
''''''        strSyouyoDate1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strSyouyoDate2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''''    ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
''''    ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
''''        'Ü—^x•¥Œ“ú‚Q‚ğÜ—^x•¥Œ“ú‚P‚É
''''''        strSyouyoDate1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strSyouyoDate2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''    ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
''''''        strSyouyoDate1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''''        strSyouyoDate2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''        strMonth_2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''    End If
'2004/02/18 ‘ä’ “o˜^‚Æ“¯‚¶ˆ—‚É•ÏX

    '----‹‹—^--------------------
    lngKyuuyoCNT = 1
    intPage = 1
    Do While intPage <= 2
        lngYuusi = 50000
        intGyou = 1
        If intPage = 1 Then
            strYuusiDate = CVDate(Format$(strYuusiMae, "yyyy/mm/") & "10")
        Else
            strYuusiDate = CVDate(Format$(strYuusiAto, "yyyy/mm/") & "25")
        End If
        Do While lngYuusi <= 3000000
            If (intGyou Mod 6) = 1 Then
                ReDim Preserve gstrKyuuyoAry(lngKyuuyoCNT)
                With gstrKyuuyoAry(lngKyuuyoCNT)
                    .intPageKbn = intPage      'ƒy[ƒW‹æ•ª
                    .intGyoKbn = intGyou       's‹æ•ª
                    .strYuusibi = strYuusiDate '—Z‘“ú
                    .strYuusigaku = " "        '—Z‘Šz
                    .strRiritu = dblRiritu     'Œ_–ñ—˜—¦
                    .str06Month = " "          '@‚Uƒ–Œ
                    .str12Month = " "          '‚P‚Qƒ–Œ
                    .str18Month = " "          '‚P‚Wƒ–Œ
                    .str24Month = " "          '‚Q‚Sƒ–Œ
                    .str30Month = " "          '‚R‚Oƒ–Œ
                    .str36Month = " "          '‚R‚Uƒ–Œ
                    .str42Month = " "          '‚S‚Qƒ–Œ
                    .str48Month = " "          '‚S‚Wƒ–Œ
                    .str54Month = " "          '‚T‚Sƒ–Œ
                    .str60Month = " "          '‚U‚Oƒ–Œ
                End With
                intGyou = intGyou + 1
                lngKyuuyoCNT = lngKyuuyoCNT + 1
            End If

            dblWKYuusibi = CDate(strYuusiDate)
            varWKSyouyoDate1 = CVar(strSyouyoDate1)
            varWKSyouyoDate2 = CVar(strSyouyoDate2)

            ReDim Preserve gstrKyuuyoAry(lngKyuuyoCNT)
            With gstrKyuuyoAry(lngKyuuyoCNT)
                .intPageKbn = intPage  ''''''''''''''''''''''ƒy[ƒW‹æ•ª
                .intGyoKbn = intGyou  '''''''''''''''''''''''s‹æ•ª
                .strYuusibi = strYuusiDate ''''''''''''''''''—Z‘“ú
                .strYuusigaku = lngYuusi ''''''''''''''''''''—Z‘Šz
                .strRiritu = dblRiritu ''''''''''''''''''''''Œ_–ñ—˜—¦
                .str06Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 6, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)  '@‚Uƒ–Œ
                .str12Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 12, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚P‚Qƒ–Œ
                .str18Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 18, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚P‚Wƒ–Œ
                .str24Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 24, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚Q‚Sƒ–Œ
                .str30Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 30, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚R‚Oƒ–Œ
                .str36Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 36, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚R‚Uƒ–Œ
                .str42Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 42, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚S‚Qƒ–Œ
                .str48Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 48, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚S‚Wƒ–Œ
                .str54Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 54, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚T‚Sƒ–Œ
                .str60Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 60, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '‚U‚Oƒ–Œ
            End With
                        
            If lngYuusi < 1000000 Then
                lngYuusi = lngYuusi + 50000
            Else
                lngYuusi = lngYuusi + 100000
            End If
            intGyou = intGyou + 1
            lngKyuuyoCNT = lngKyuuyoCNT + 1
            DoEvents
            frmQPAV_CEnt120.prgBar.Value = lngKyuuyoCNT
            DoEvents
        Loop
        intPage = intPage + 1
    Loop
    
    '----Ü—^------------------------
    lngSyouyoCNT = 1
    If Val(Format$(strYuusiMae, "dd")) <= 10 Then
        strYuusiDate = CVDate(Format$(strYuusiMae, "yyyy/mm/") & "10")
    Else
        strYuusiDate = CVDate(Format$(strYuusiMae, "yyyy/mm/") & "25")
    End If
    intPage = 1
    Do While DateDiff("y", strYuusiDate, strYuusiAto) >= 0
        strNextSyouyoMonth = Month(strYuusiDate)
        If Int(strNextSyouyoMonth) < Int(strMonth_1) Or Int(strNextSyouyoMonth) >= Int(strMonth_2) Then
            strNextSyouyoMonth = strMonth_1
        Else
            strNextSyouyoMonth = strMonth_2
        End If
        lngYuusi = 50000
        intGyou = 1
        Do While lngYuusi <= 1500000
            If (intGyou Mod 3) = 1 Then
                ReDim Preserve gstrSyouyoAry(lngSyouyoCNT)
                With gstrSyouyoAry(lngSyouyoCNT)
                    .intPageKbn = intPage                'ƒy[ƒW‹æ•ª
                    .intGyoKbn = intGyou                 's‹æ•ª
                    .strYuusibi = strYuusiDate           '—Z‘“ú
                    .strYuusigaku = " "                  '—Z‘Šz
                    .strRiritu = dblRiritu               'Œ_–ñ—˜—¦
                    .strJikaiSyouyo = strNextSyouyoMonth 'Ÿ‰ñÜ—^Œ
                    .str06Kai = " "                      '@‚U‰ñ
                    .str12Kai = " "                      '‚P‚Q‰ñ
                    .str18Kai = " "                      '‚P‚W‰ñ
                    .str24Kai = " "                      '‚Q‚S‰ñ
                    .str30Kai = " "                      '‚R‚O‰ñ
                    .str36Kai = " "                      '‚R‚U‰ñ
                    .str42Kai = " "                      '‚S‚Q‰ñ
                    .str48Kai = " "                      '‚S‚W‰ñ
                    .str54Kai = " "                      '‚T‚S‰ñ
                    .str60Kai = " "                      '‚U‚O‰ñ
                End With
                intGyou = intGyou + 1
                lngSyouyoCNT = lngSyouyoCNT + 1
            End If
            
            dblWKYuusibi = CDate(strYuusiDate)
            varWKSyouyoDate1 = CVar(strSyouyoDate1)
            varWKSyouyoDate2 = CVar(strSyouyoDate2)
            
            ReDim Preserve gstrSyouyoAry(lngSyouyoCNT)
            With gstrSyouyoAry(lngSyouyoCNT)
                .intPageKbn = intPage
                .intGyoKbn = intGyou
                .strYuusibi = strYuusiDate
                .strYuusigaku = lngYuusi
                .strRiritu = dblRiritu
                .strJikaiSyouyo = strNextSyouyoMonth
                .str06Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 6, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str12Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 12, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str18Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 18, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str24Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 24, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str30Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 30, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str36Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 36, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str42Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 42, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str48Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 48, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str54Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 54, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
                .str60Kai = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, 60, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)
            End With
            
            If lngYuusi < 1000000 Then
                lngYuusi = lngYuusi + 50000
            Else
                lngYuusi = lngYuusi + 100000
            End If
            intGyou = intGyou + 1
            lngSyouyoCNT = lngSyouyoCNT + 1
            DoEvents
            frmQPAV_CEnt120.prgBar.Value = lngKyuuyoCNT + lngSyouyoCNT
            DoEvents
        Loop
        If Val(Format$(strYuusiDate, "dd")) <= 10 Then
            strYuusiDate = CVDate(Format$(strYuusiDate, "yyyy/mm/") & "25")
        Else
            strYuusiDate = CVDate(Format$(DateAdd("m", 1, strYuusiDate), "yyyy/mm/") & "10")
        End If
        intPage = intPage + 1
    Loop
    
    frmQPAV_CEnt120.prgBar.Value = 140
    
    Exit Sub

gSubMakeMeisaiKyuu:
    Exit Sub

End Sub
'************************************************************************************************************
'*  –ˆ‰ñ•ÔÏŠzZo
'*    intHensaiFlg     : Œ•ÔÏŠzZo_FLG
'*    strYuusiBi       : —Z‘“ú
'*    dblRiritu        : Œ_–ñ—˜—¦
'*    intHensaiTukisuu : •ÔÏŒ”
'*    lngKyuuyo        : ‹‹—^•ÔÏŠz
'*    lngSyouyo        : Ü—^•ÔÏŠz
'*    varSyouyoDate1   : Ü—^x‹‹Œ1
'*    varSyouyoDate2   : Ü—^x‹‹Œ2
'*      2004/02/18 Ğˆõ—Z‘‘ä’ “o˜^ˆ—‚ÆƒR[ƒh‚ğ“¯‚¶‚É‚·‚éB
'************************************************************************************************************
Function gfncstrKeisan(intHensaiFlg As Integer, strYuusibi As Double, dblRiritu As Double, intHensaiTukisuu As Integer, lngKyuuyo As Long, lngSyouyo As Long, varSyouyoDate1 As Variant, varSyouyoDate2 As Variant) As Long
 Dim i                   As Integer
 Dim T                   As Integer
 Dim intNenKBN_WK        As Integer  '”N‹æ•ª_WORK
 Dim intKBN_WK           As Integer  '‹æ•ª_WORK
 Dim strHensaiKijitu_WK  As Double   '•ÔÏŠú“ú_WORK
 Dim strSyouyoKijitu_WK  As Double   'Ü—^Šú“ú_WORK
 Dim lngKyuuyoTeigaku_WK As Long     '‹‹—^’èŠz•ÔÏŠz_WORK
 Dim lngKyuuyo1Zan_WK    As Long     '‹‹—^‘æ1c‚_WORK
 Dim lngKyuuyoHenZan_WK  As Long     '‹‹—^•ÔÏc‚_WORK
 Dim lngSyouyoTeigaku_WK As Long     'Ü—^’èŠz•ÔÏŠz_WORK
 Dim lngSyouyo1Zan_WK    As Long     'Ü—^‘æ1c‚_WORK
 Dim lngSyouyoHenZan_WK  As Long     'Ü—^•ÔÏc‚_WORK
 Dim curTeigaku0_WK      As Currency '’èŠz_WORK0
 Dim curTeigaku1_WK      As Currency '’èŠz_WORK1
 Dim curTeigaku2_WK      As Currency '’èŠz_WORK2
 Dim intSyouyoKaisuu_WK  As Integer  'Ü—^•ÔÏ‰ñ”_WORK
 Dim strSyouyoDate_WK    As Variant  'Ü—^x‹‹Œ_WORK
 Dim strHensaiKijitu2_WK As Variant  '•ÔÏŠú“ú_WORK2
 Dim strHensaiKikan_WK   As Double   '•ÔÏŠúŠÔ_WORK
 Dim strZenkaiSyouyo_WK  As Variant  '‘O‰ñÜ—^•ÔÏ“ú_WORK
 Dim intSyouyoKikan_WK   As Integer  'Ü—^•ÔÏŠúŠÔ_WORK
 Dim dblRisoku_WK        As Double    '—˜‘§_WORK
 Dim dblRisoku2_WK       As Double   '—˜‘§2_WORK
 Dim strZenkaiKyuuyo     As Variant  '‘O‰ñ‹‹—^•ÔÏ“ú
 Dim strZenkaiSyouyo     As Variant  '‘O‰ñÜ—^•ÔÏ“ú
 Dim strDaiitiSyouyo     As Variant  '‘æ1‰ñÜ—^•ÔÏ“ú
 Dim curRisoku           As Currency 'WORK_—˜‘§
 Dim curZandaka          As Currency 'WORK_c‚
 Dim curSaisyuuHensai    As Currency 'ÅI•ÔÏŠz
 Dim curTeigaku          As Currency '’èŠz_SAVE

 Dim dblKeiyakuriritu    As Double    'Œ_–ñ—˜—¦ (2001/11/01ˆÈ~‚Ég—p)


    '********************************************
    '* —Z‘“ú‚ª 2000/03/01 ‚ğ‹«‚Éˆ—‚ğ•ª‚¯‚é
    '********************************************
    If CVDate(strYuusibi) < CVDate("2000/03/01") Then
        '****************
        '* Œ³X‚Ìˆ—
        '****************
        ' —˜—¦‚ğ “ ‚©‚ç ¬” ‚É•ÏŠ·
        If dblRiritu >= 1 Then
            dblRiritu = dblRiritu / 100
        End If
        ' Ü—^”NŒ“ú‚Ì¬‚³‚¢•û‚ğ "‚P" ‚Éİ’è
        If DateDiff("y", varSyouyoDate1, varSyouyoDate2) < 0 Then
            strSyouyoDate_WK = varSyouyoDate1
            varSyouyoDate1 = varSyouyoDate2
            varSyouyoDate2 = strSyouyoDate_WK
        End If
        intSyouyoKikan_WK = DateDiff("m", varSyouyoDate1, varSyouyoDate2)
        strZenkaiSyouyo = strYuusibi
        intNenKBN_WK = 1
        T = 1
        ' Ü—^‚Ì•ÔÏ‰ñ”‚ğ‹‚ß‚é
        If intHensaiTukisuu <= 0 Then
            intHensaiTukisuu = 1
        End If
        
        intSyouyoKaisuu_WK = Fix(intHensaiTukisuu / 6)
        For i = 1 To intHensaiTukisuu Mod 6
            If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate1) Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate2) Then
                intSyouyoKaisuu_WK = intSyouyoKaisuu_WK + 1
            End If
        Next i
        If intSyouyoKaisuu_WK <= 0 Then intSyouyoKaisuu_WK = 1
        strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu_WK = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd")))
        End If
        lngKyuuyoHenZan_WK = lngKyuuyo
        lngSyouyoHenZan_WK = lngSyouyo

        '----------------------x•¥ŠzŒvZ---------------------------
        lngKyuuyoTeigaku_WK = 0
        lngSyouyoTeigaku_WK = 0
        If intHensaiFlg = 1 Then
            If Val(Format(strYuusibi, "dd")) >= 11 Then
                strHensaiKikan_WK = 30
            Else
                strHensaiKikan_WK = 45
            End If
            dblRisoku2_WK = (lngKyuuyo * dblRiritu * strHensaiKikan_WK / 12 / 30)
            dblRisoku_WK = Int(dblRisoku2_WK)
            If intHensaiTukisuu <= 1 Then
                lngKyuuyoTeigaku_WK = dblRisoku_WK + lngKyuuyo
            Else
                curTeigaku0_WK = 0
                curTeigaku1_WK = Abs(-Pmt(dblRiritu / 12, intHensaiTukisuu - 1, lngKyuuyo, 0, 0))
                curTeigaku2_WK = Abs(-Pmt(dblRiritu / 12, intHensaiTukisuu - 1, lngKyuuyo - curTeigaku1_WK + dblRisoku2_WK, 0, 0))
                While Abs(curTeigaku1_WK - curTeigaku2_WK) > 0.001 Or Abs(curTeigaku0_WK - curTeigaku2_WK) > 0.001
                    curTeigaku0_WK = curTeigaku1_WK: curTeigaku1_WK = curTeigaku2_WK
                    curTeigaku2_WK = Abs(-Pmt(dblRiritu / 12, intHensaiTukisuu - 1, lngKyuuyo - (((curTeigaku0_WK) + (curTeigaku1_WK)) / 2) + dblRisoku2_WK, 0, 0))
                Wend
                lngKyuuyoTeigaku_WK = Fix(Abs(((curTeigaku0_WK) + (curTeigaku1_WK) + (curTeigaku2_WK)) / 3))
            End If
        End If
        If intHensaiFlg = 2 Then
            If intSyouyoKikan_WK = 6 Then
                If Month(DateAdd("y", 1, strSyouyoKijitu_WK)) <> Month(strSyouyoKijitu_WK) Then
                    dblRisoku2_WK = (lngSyouyo * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu_WK) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180)
                Else
                    dblRisoku2_WK = (lngSyouyo * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu_WK) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu_WK) - 1 - 30)) / 2 / 180)
                End If
                dblRisoku_WK = Int(dblRisoku2_WK)
            Else
                dblRisoku2_WK = (lngSyouyo * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu_WK) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180)
                dblRisoku_WK = Int(dblRisoku2_WK)
            End If
            If intSyouyoKaisuu_WK <= 1 Then
                lngSyouyoTeigaku_WK = dblRisoku_WK + lngSyouyo
            Else
                curTeigaku0_WK = 0
                curTeigaku1_WK = Abs(-Pmt(dblRiritu / 2, intSyouyoKaisuu_WK - 1, lngSyouyo, 0, 0))
                curTeigaku2_WK = Abs(-Pmt(dblRiritu / 2, intSyouyoKaisuu_WK - 1, lngSyouyo - curTeigaku1_WK + dblRisoku2_WK, 0, 0))
                While Abs(curTeigaku1_WK - curTeigaku2_WK) > 0.001 Or Abs(curTeigaku0_WK - curTeigaku2_WK) > 0.001
                    curTeigaku0_WK = curTeigaku1_WK: curTeigaku1_WK = curTeigaku2_WK
                    curTeigaku2_WK = Abs(-Pmt(dblRiritu / 2, intSyouyoKaisuu_WK - 1, lngSyouyo - (((curTeigaku0_WK) + (curTeigaku1_WK)) / 2) + dblRisoku2_WK, 0, 0))
                Wend
                lngSyouyoTeigaku_WK = Fix(Abs(((curTeigaku0_WK) + (curTeigaku1_WK) + (curTeigaku2_WK)) / 3))
                If intSyouyoKikan_WK <> 6 Then
                    lngSyouyoTeigaku_WK = gfnclngSyouyoHensai(CDbl(strYuusibi), dblRiritu, varSyouyoDate1, varSyouyoDate2, intSyouyoKaisuu_WK, lngSyouyo, dblRisoku_WK, lngSyouyoTeigaku_WK)
               
                End If
            End If
        End If
        '-------------------------------------------------------------
    Else
        '****************
        '* V‚µ‚¢ˆ—
        '****************
        ' —˜—¦‚ğ “ ‚©‚ç ¬” ‚É•ÏŠ·
        If dblRiritu >= 1 Then
            dblRiritu = dblRiritu / 100
        End If
        ' Ü—^”NŒ“ú‚Ì¬‚³‚¢•û‚ğ "‚P" ‚Éİ’è
        If DateDiff("y", varSyouyoDate1, varSyouyoDate2) < 0 Then
            strSyouyoDate_WK = varSyouyoDate1
            varSyouyoDate1 = varSyouyoDate2
            varSyouyoDate2 = strSyouyoDate_WK
        End If
        ' Ü—^‚Ì•ÔÏ‰ñ”‚ğ‹‚ß‚é
        If intHensaiTukisuu <= 0 Then
            intHensaiTukisuu = 1
        End If
        intSyouyoKaisuu_WK = Fix(intHensaiTukisuu / 6)
        ' ”¼’[‚Èi‚P‚T‰ñ‚È‚Ç‚Ì‚U‚ÅŠ„‚èØ‚ê‚È‚¢jŒ”‚Å‚Ì•ÔÏ‚Ìê‡A
        ' ”¼’[‚ÈŒ”‚Ì’†‚ÉÜ—^“ú‚ª‚ ‚ê‚ÎA‚»‚Ì‰ñ”‚ğ‰ÁZ‚·‚é
        ' ’A‚µAƒtƒH[ƒ€iĞˆõ—Z‘‘ä’ j‚Å‚ÍA‚U‚Ì”{”‚Ì‰ñ”‚µ‚©“ü—Í‚Å‚«‚È‚¢ˆ×A
        ' ‚ ‚è‚¦‚È‚¢‚ªAŒ³X‚Ìˆ—‚ğ‚»‚Ì‚Ü‚Ü‚Æ‚µ‚½
        For i = 1 To intHensaiTukisuu Mod 6
            If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate1) Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate2) Then
                intSyouyoKaisuu_WK = intSyouyoKaisuu_WK + 1
            End If
        Next i
        If intSyouyoKaisuu_WK <= 0 Then
            intSyouyoKaisuu_WK = 1
        End If
        ' ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ“ú‚ğ‹‚ß‚éi—Z‘“ú‚Ì—‚Œ‚Ì‚Q‚T“ú‚©‚çj
        strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
        ' ‚P‰ñ–Ú‚ÌÜ—^•ÔÏ“ú‚ğ‹‚ß‚éi—Z‘“ú‚Ì—‚ŒˆÈ~j
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm") & "/01"))) >= 0 Then                 'ˆêƒ–Œ‘O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu_WK = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd")))
        End If
        lngKyuuyoHenZan_WK = lngKyuuyo
        lngSyouyoHenZan_WK = lngSyouyo
        
        '----------------------x•¥ŠzŒvZ---------------------------
        lngKyuuyoTeigaku_WK = 0
        lngSyouyoTeigaku_WK = 0
        '****************************
        '* ‹‹—^‚Ì–ˆŒ‚Ì•ÔÏŠz‚ÌŒvZ
        '****************************
        If intHensaiFlg = 1 Then
            ' —Z‘“úiŒvZ‚·‚é‚Í|‚P“ú‚·‚éj‚©‚çA‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ“ú‚Ü‚Å‚ÌŠúŠÔZo
            strHensaiKikan_WK = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strHensaiKijitu_WK))
            
            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
             ' ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ“ú‚Ü‚Å‚Ì—˜‘§ŒvZ
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                dblRisoku_WK = Fix(lngKyuuyo * dblKeiyakuriritu * strHensaiKikan_WK)
            Else
                dblRisoku2_WK = (lngKyuuyo * dblRiritu * strHensaiKikan_WK / 365)
                dblRisoku_WK = Int(dblRisoku2_WK)
            End If
            
            
            If intHensaiTukisuu <= 1 Then
                ' ‚P‰ñ‚Å‚Ì•ÔÏ‚Ìê‡
                lngKyuuyoTeigaku_WK = curRisoku + lngKyuuyo
            Else
                '* •W€ŠÖ”‚Å‹‚ß‚é–ˆ‰ñ‚Ì•ÔÏ‹àŠz
                curTeigaku0_WK = Int(Abs(-Pmt(dblRiritu / 12, intHensaiTukisuu, lngKyuuyo, 0, 0)))
                '* ‚P‰ñ–Ú—p‚Ì‘O‰ñ•ÔÏ“úi—Z‘“ú|‚P“új
                strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                '* ‚P‰ñ–Ú—p‚Ì•ÔÏ“úi—Z‘“ú‚Ì—‚Œ‚Ì‚Q‚T“új
                strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                curZandaka = lngKyuuyo
                '*********************************************************
                '* ‚P‰ñ–Ú‚©‚ç•ÔÏ‰ñ”|‚P‰ñ–Ú‚Ü‚Å‚Ì•ÔÏ—\’è‚ğ‡ŸŒvZ‚µA
                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz‚ğŒvZ‚·‚é
                '*********************************************************
                For i = 1 To intHensaiTukisuu - 1
                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                    
                    '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                    Else
                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                    End If
                    
                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                    strZenkaiKyuuyo = strHensaiKijitu_WK
                    strHensaiKijitu_WK = DateAdd("m", 1, strHensaiKijitu_WK)
                Next i
                '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                
                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                Else
                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                End If
                
                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                curSaisyuuHensai = curRisoku + curZandaka
                '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                If curTeigaku0_WK = curSaisyuuHensai Then
                    '* ˆê’v‚·‚éê‡‚ÍA•W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                    curTeigaku = curTeigaku0_WK
                Else
                    If curTeigaku0_WK < curSaisyuuHensai Then
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚æ‚èAÅI•ÔÏŠz‚ª‘å‚«‚¢ê‡
                        '*********************************************************
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ğ{‚P‰~‚¸‚Â‚µ‚È‚ª‚çA
                        '* ÅI•ÔÏŠz‚ğŒvZ‚µAÅ‚à‹ß‚¢‹àŠz‚ğZo‚·‚é
                        '* i’A‚µA–ˆ‰ñ•ÔÏŠz <= ÅI•ÔÏŠz ‚Æ‚È‚é‹àŠzj
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        Do
                            '* –ˆ‰ñ•ÔÏŠz‚ğ‚P‰~‘Šz
                            curTeigaku0_WK = curTeigaku0_WK + 1
                            strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                            strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                            curZandaka = lngKyuuyo
                            For i = 1 To intHensaiTukisuu - 1
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                strZenkaiKyuuyo = strHensaiKijitu_WK
                                strHensaiKijitu_WK = DateAdd("m", 1, strHensaiKijitu_WK)
                            Next i
                            '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                            
                            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                            curSaisyuuHensai = curRisoku + curZandaka
                            
                            '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                            If curTeigaku0_WK < curSaisyuuHensai Then
                                    
                                curTeigaku = curTeigaku0_WK
                                                                    
                            Else
                                '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ªAÅI•ÔÏŠz‚æ‚è‘å‚«‚­‚È‚Á‚½ê‡A
                                '* ŒvZI—¹ ||„ ‚P‰ñ‘O‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                                Exit Do
                            End If
                        Loop
                    Else
                        '* ÅI•ÔÏŠz‚æ‚èA•W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ª‘å‚«‚¢ê‡
                        '*********************************************************
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ğ|‚P‰~‚¸‚Â‚µ‚È‚ª‚çA
                        '* ÅI•ÔÏŠz‚ğŒvZ‚µAÅ‚à‹ß‚¢‹àŠz‚ğZo‚·‚é
                        '* i’A‚µA–ˆ‰ñ•ÔÏŠz <= ÅI•ÔÏŠz ‚Æ‚È‚é‹àŠzj
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        Do
                            '* –ˆ‰ñ•ÔÏŠz‚ğ‚P‰~Œ¸Šz
                            curTeigaku0_WK = curTeigaku0_WK - 1
                            strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                            strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                            curZandaka = lngKyuuyo
                            For i = 1 To intHensaiTukisuu - 1
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                strZenkaiKyuuyo = strHensaiKijitu_WK
                                strHensaiKijitu_WK = DateAdd("m", 1, strHensaiKijitu_WK)
                            Next i
                            '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                            curSaisyuuHensai = curRisoku + curZandaka
                            
                            '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                            If curTeigaku0_WK <= curSaisyuuHensai Then
                                '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ªAÅI•ÔÏŠzˆÈ‰º‚É‚È‚Á‚½ê‡A
                                '* ŒvZI—¹ ||„ ¡‰ñ‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                                curTeigaku = curTeigaku0_WK
                                Exit Do
                            End If
                        
                        Loop
                    End If
                End If
                lngKyuuyoTeigaku_WK = curTeigaku
            End If
        End If
        '****************************
        '* Ü—^‚Ì–ˆ‰ñ‚Ì•ÔÏŠz‚ÌŒvZ
        '****************************
        If intHensaiFlg = 2 Then
            ' —Z‘“úiŒvZ‚·‚é‚Í|‚P“ú‚·‚éj‚©‚çA‚P‰ñ–Ú‚ÌÜ—^•ÔÏ“ú‚Ü‚Å‚ÌŠúŠÔZo
            strHensaiKikan_WK = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strSyouyoKijitu_WK))
            
            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
             ' ‚P‰ñ–Ú‚Ì‹‹—^•ÔÏ“ú‚Ü‚Å‚Ì—˜‘§ŒvZ
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                dblRisoku_WK = Fix(lngSyouyo * dblKeiyakuriritu * strHensaiKikan_WK)
            Else
                dblRisoku2_WK = (lngSyouyo * dblRiritu * strHensaiKikan_WK / 365)
                dblRisoku_WK = Int(dblRisoku2_WK)
            End If
            
            '* ‚P‰ñ–Ú‚ÌÜ—^•ÔÏ“ú‚Ì‘Ş”ğ
            strDaiitiSyouyo = strSyouyoKijitu_WK
            If intSyouyoKaisuu_WK <= 1 Then
                ' ‚P‰ñ‚Å‚Ì•ÔÏ‚Ìê‡
                lngSyouyoTeigaku_WK = dblRisoku_WK + lngSyouyo
            Else
                '* •W€ŠÖ”‚Å‹‚ß‚é–ˆ‰ñ‚Ì•ÔÏ‹àŠzi—˜—¦‚ÍÜ—^‚ÌŠÔŠu‚ª‹Ï“™‚È”N‚Q‰ñ‚Æ‰¼’è‚µ‚ÄŒvZ‚·‚éj
                curTeigaku0_WK = Int(Abs(-Pmt(dblRiritu / 2, intSyouyoKaisuu_WK, lngSyouyo, 0, 0)))
                '* ‚P‰ñ–Ú—p‚Ì‘O‰ñ•ÔÏ“úi—Z‘“ú|‚P“új
                strZenkaiSyouyo_WK = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                curZandaka = lngSyouyo
                '*********************************************************
                '* ‚P‰ñ–Ú‚©‚çÜ—^‚Ì•ÔÏ‰ñ”|‚P‰ñ–Ú‚Ü‚Å‚Ì•ÔÏ—\’è‚ğ‡ŸŒvZ‚µA
                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz‚ğŒvZ‚·‚é
                '*********************************************************
                For i = 1 To intSyouyoKaisuu_WK - 1
                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                    
                    '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                    Else
                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                    End If
                    
                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                    strZenkaiSyouyo_WK = strSyouyoKijitu_WK
                    '* Ÿ‰ñ‚ÌÜ—^“ú‚ÌŒvZ
'*20031030
'ŸÜ—^‚ª”N“x‚ğ‚Ü‚½‚®ê‡u* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZv‚É‚ÄA“ú•t‚ªƒ}ƒCƒiƒX‚É‚È‚é•s‹ï‡‚ğC³
                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                        '”N“x‚ğ‚Ü‚½‚®ê‡
                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                        Else
                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                        End If
                    Else
                        '”N“x‚ğ‚Ü‚½‚ª‚È‚¢ê‡
                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                        Else
                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                        End If
                    End If
'C³‘O‚Ìˆ—«
'                    If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                        strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                    Else
'                        strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                    End If
'*20031030
                Next i
                '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                
                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                Else
                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                End If
                
                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                curSaisyuuHensai = curRisoku + curZandaka
                '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                If curTeigaku0_WK = curSaisyuuHensai Then
                    '* ˆê’v‚·‚éê‡‚ÍA•W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                    curTeigaku = curTeigaku0_WK
                Else
                    If curTeigaku0_WK < curSaisyuuHensai Then
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚æ‚èAÅI•ÔÏŠz‚ª‘å‚«‚¢ê‡
                        '*********************************************************
                        '* –ˆ‰ñ•ÔÏŠz‚ª‚P‚O‚O‚O‰~ˆÈã‚Ìê‡Aƒ‹[ƒv‚Ì‰ñ”‚ğŒ¸‚ç‚·‚½‚ß
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ğ{‚P‚O‚O‚O‰~‚¸‚Â‚µ‚È‚ª‚çA
                        '* ÅI•ÔÏŠz‚ğŒvZ‚µAÅI•ÔÏŠz‚ªZo‚µ‚½–ˆ‰ñ•ÔÏŠz‚æ‚è‚à
                        '* ‘å‚«‚­‚È‚Á‚½‚PŒÂ‘O‚Ì‹àŠz‚ğ‹‚ß‚é
                        '* iÜ—^‚Ìê‡AŒë·‚ª‘å‚«‚¢‚Ì‚Å‚±‚Ìˆ—‚ğ’Ç‰Á‚·‚éB
                        '* @‹‹—^‚Ìê‡‚ÍŒë·‚ª­‚È‚¢‚Ì‚Å‚±‚Ìˆ—‚Í‚È‚¢Bj
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        If Int(curTeigaku0_WK / 1000) >= 1 Then
                            Do
                                '* –ˆ‰ñ•ÔÏŠz‚ğ‚P‰~‘Šz
                                curTeigaku0_WK = curTeigaku0_WK + 1000
                                curSaisyuuHensai = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                                strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                                curZandaka = lngSyouyo
                                For i = 1 To intSyouyoKaisuu_WK - 1
                                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                                    
                                    '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                    Else
                                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                    End If
                                    
                                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                    strZenkaiSyouyo_WK = strSyouyoKijitu_WK

                                    '* Ÿ‰ñ‚ÌÜ—^“ú‚ÌŒvZ
'*20031030
'ŸÜ—^‚ª”N“x‚ğ‚Ü‚½‚®ê‡u* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZv‚É‚ÄA“ú•t‚ªƒ}ƒCƒiƒX‚É‚È‚é•s‹ï‡‚ğC³
                                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                        '”N“x‚ğ‚Ü‚½‚®ê‡
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    Else
                                        '”N“x‚ğ‚Ü‚½‚ª‚È‚¢ê‡
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    End If
'C³‘O‚Ìˆ—«
'                                    If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                                        strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                                    Else
'                                        strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                                    End If
'*20031030
                                Next i
                                '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                    
                                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                                curSaisyuuHensai = curRisoku + curZandaka
                                '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                                If curTeigaku0_WK < curSaisyuuHensai Then
                                    curTeigaku = curTeigaku0_WK
                                Else
                                    '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ªAÅI•ÔÏŠz‚æ‚è‘å‚«‚­‚È‚Á‚½ê‡A
                                    '* ŒvZI—¹ ||„ ‚P‰ñ‘O‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                                    Exit Do
                                End If
                            Loop
                            curTeigaku0_WK = curTeigaku
                        End If
                    Else
                        '* ÅI•ÔÏŠz‚æ‚èA•W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ª‘å‚«‚¢ê‡
                        '*********************************************************
                        '* –ˆ‰ñ•ÔÏŠz‚ª‚P‚O‚O‚O‰~ˆÈã‚Ìê‡Aƒ‹[ƒv‚Ì‰ñ”‚ğŒ¸‚ç‚·‚½‚ß
                        '* •W€ŠÖ”‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ğ|‚P‚O‚O‚O‰~‚¸‚Â‚µ‚È‚ª‚çA
                        '* ÅI•ÔÏŠz‚ğŒvZ‚µAÅI•ÔÏŠz‚ªZo‚µ‚½–ˆ‰ñ•ÔÏŠz‚æ‚è‚à
                        '* ¬‚³‚­‚È‚Á‚½‹àŠz‚ğ‹‚ß‚é
                        '* iÜ—^‚Ìê‡AŒë·‚ª‘å‚«‚¢‚Ì‚Å‚±‚Ìˆ—‚ğ’Ç‰Á‚·‚éB
                        '* @‹‹—^‚Ìê‡‚ÍŒë·‚ª­‚È‚¢‚Ì‚Å‚±‚Ìˆ—‚Í‚È‚¢Bj
                        '*********************************************************
                        If Int(curTeigaku0_WK / 1000) >= 1 Then
                            Do
                                '* –ˆ‰ñ•ÔÏŠz‚ğ‚P‰~Œ¸Šz
                                curTeigaku0_WK = curTeigaku0_WK - 1000
                                strZenkaiSyouyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                                strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                                curZandaka = lngSyouyo
                                For i = 1 To intSyouyoKaisuu_WK - 1
                                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                    
                                    '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                    Else
                                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                    End If
                                    
                                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                    strZenkaiSyouyo = strSyouyoKijitu_WK
                                    '* Ÿ‰ñ‚ÌÜ—^“ú‚ÌŒvZ
'*20031030
'ŸÜ—^‚ª”N“x‚ğ‚Ü‚½‚®ê‡u* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZv‚É‚ÄA“ú•t‚ªƒ}ƒCƒiƒX‚É‚È‚é•s‹ï‡‚ğC³
                                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                        '”N“x‚ğ‚Ü‚½‚®ê‡
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    Else
                                        '”N“x‚ğ‚Ü‚½‚ª‚È‚¢ê‡
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    End If
'                                    If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                                        strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                                    Else
'                                        strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                                    End If
'*20031030

                                Next i
                                '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                
                                '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                                curSaisyuuHensai = curRisoku + curZandaka
                                '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                                If curTeigaku0_WK <= curSaisyuuHensai Then
                                    '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ªAÅI•ÔÏŠzˆÈ‰º‚É‚È‚Á‚½ê‡A
                                    '* ŒvZI—¹ ||„ ¡‰ñ‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                                    curTeigaku = curTeigaku0_WK
                                    Exit Do
                                End If
                            Loop
                            curTeigaku0_WK = curTeigaku
                        End If
                    End If
                    '*********************************************************
                    '* ã‹L‚Å‹‚ß‚½–ˆ‰ñ•ÔÏŠz‚ğ{‚P‰~‚¸‚Â‚µ‚È‚ª‚çA
                    '* ÅI•ÔÏŠz‚ğŒvZ‚µAÅ‚à‹ß‚¢‹àŠz‚ğZo‚·‚é
                    '* i’A‚µA–ˆ‰ñ•ÔÏŠz <= ÅI•ÔÏŠz ‚Æ‚È‚é‹àŠzj
                    '*********************************************************
                    curTeigaku = curTeigaku0_WK
                    Do
                        '* –ˆ‰ñ•ÔÏŠz‚ğ‚P‰~‘Šz
                        curTeigaku0_WK = curTeigaku0_WK + 1
                        strZenkaiSyouyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                        strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                        curZandaka = lngSyouyo
                        For i = 1 To intSyouyoKaisuu_WK - 1
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                            
                            '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                            strZenkaiSyouyo = strSyouyoKijitu_WK
                            '* Ÿ‰ñ‚ÌÜ—^“ú‚ÌŒvZ
'*20031030
'ŸÜ—^‚ª”N“x‚ğ‚Ü‚½‚®ê‡u* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZv‚É‚ÄA“ú•t‚ªƒ}ƒCƒiƒX‚É‚È‚é•s‹ï‡‚ğC³
                            If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                '”N“x‚ğ‚Ü‚½‚®ê‡
                                If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                    'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                    strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                Else
                                    'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                    strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                End If
                            Else
                                '”N“x‚ğ‚Ü‚½‚ª‚È‚¢ê‡
                                If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                    'ŸÜ—^‚Í“~‹G‚Ì‚Í”N“x‚Í•Ï‚í‚ç‚¸
                                    strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                Else
                                    'ŸÜ—^‚ª‰Ä‹G‚Ì”N“x‚É‚P’Ç‰Á
                                    strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                                End If
                            End If

'                            If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                                strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                            Else
'                                strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                            End If
'*20031030

                        Next i
                        '* ÅI•ÔÏ‚Å‚Ì—˜‘§ŒvZ
                        strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                        
                        '/*—˜‘§Zo —Z‘“ú‚ªVƒVƒXƒeƒ€ˆÚsŒã(2001/11/01) */                                                    -- 10/23 UPD
                        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                            dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                            curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                        Else
                            curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                        End If
                        
                        '* ÅI•ÔÏ‚Å‚Ì•ÔÏŠz
                        curSaisyuuHensai = curRisoku + curZandaka
                        '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆAÅI•ÔÏŠz‚Ì”äŠr
                        If curTeigaku0_WK = curSaisyuuHensai Then
                            '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ÆÅI•ÔÏŠz‚ª“™‚µ‚­ê‡A
                            '* ¡‰ñ‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                            curTeigaku = curTeigaku0_WK
                            Exit Do
                        Else
                            If curTeigaku0_WK < curSaisyuuHensai Then
                                curTeigaku = curTeigaku0_WK
                            
                            Else
                                '* ¡‰ñ‚Ìƒ‹[ƒv‚Ì–ˆ‰ñ•ÔÏŠz‚ªAÅI•ÔÏŠz‚æ‚è‘å‚«‚­‚È‚Á‚½ê‡A
                                '* ŒvZI—¹ ||„ ‚P‰ñ‘O‚Ì‹àŠz‚ğ–ˆ‰ñ•ÔÏŠz‚Æ‚·‚é
                                Exit Do
                            End If
                        End If
                    Loop
                End If
                lngSyouyoTeigaku_WK = curTeigaku
            End If
        End If
    End If
  
    gfncstrKeisan = 0
    Select Case intHensaiFlg
        Case 1: gfncstrKeisan = lngKyuuyoTeigaku_WK
        Case 2: gfncstrKeisan = lngSyouyoTeigaku_WK
    End Select

End Function


'*************************************************************************************************************************************************
'     –ˆ‰ñÜ—^•ÔÏŠzZoŠúŠÔ6ƒJŒˆÈŠO
'*************************************************************************************************************************************************
Function gfnclngSyouyoHensai(strYuusibi As Double, dblRiritu As Double, strSyouyoDate1 As Variant, strSyouyoDate2 As Variant, intSyouyoHensaiKaisuu As Integer, lngSyouyoHensaiAll As Long, dblRisoku1 As Double, lngSyouyoTeigaku As Long) As Long
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
' @ ’ •[—pƒf[ƒ^ì¬
'***********************************************************************************************************
Public Function gfncblnMakPrintDat() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim j                 As Long
 Dim intKyuuyoCNT      As Integer
 Const cnsMaxRec       As Long = 200  'ˆê‰ñ‚Åo—Í‚·‚éÅ‘ås” '''''
 Const cnslngAryCnt    As Long = 100   '”z—ñ‚ÌŒ”  ‹y‚ÑA‚P‰ñ‚Åæ“¾‚·‚é‚l‚`‚w‚ÌŒ”
 Dim OraPArray_01      As Object       '01 --‹‹—^^Ü—^”»’èƒtƒ‰ƒO”z—ñ
 Dim OraPArray_02      As Object       '02 --ƒy[ƒW‹æ•ª”z—ñ
 Dim OraPArray_03      As Object       '03 --s‹æ•ª”z—ñ
 Dim OraPArray_04      As Object       '04 --—Z‘Šz”z—ñ
 Dim OraPArray_05      As Object       '05 --x•¥06”z—ñ
 Dim OraPArray_06      As Object       '06 --x•¥12”z—ñ
 Dim OraPArray_07      As Object       '07 --x•¥18”z—ñ
 Dim OraPArray_08      As Object       '08 --x•¥24”z—ñ
 Dim OraPArray_09      As Object       '09 --x•¥30”z—ñ
 Dim OraPArray_10      As Object       '10 --x•¥36”z—ñ
 Dim OraPArray_11      As Object       '11 --x•¥42”z—ñ
 Dim OraPArray_12      As Object       '12 --x•¥48”z—ñ
 Dim OraPArray_13      As Object       '13 --x•¥54”z—ñ
 Dim OraPArray_14      As Object       '14 --x•¥60”z—ñ
 Dim OraPArray_15      As Object       '15 --Ÿ‰ñÜ—^Œ”z—ñ
 Dim OraPArray_16      As Object       '16 --ƒV[ƒPƒ“ƒX”Ô†
 
 Dim StrYuusiYMDWK     As String

On Error GoTo ErrgfncblnMakPrintDat

    gfncblnMakPrintDat = False

    '‚r‚o—pƒpƒ‰ƒ[ƒ^[ƒZƒbƒg
    '”z—ñŒ”
    odbDatabase.Parameters.Add "InNumAryCount", UBound(gstrKyuuyoAry) + UBound(gstrSyouyoAry), ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    'ƒRƒ“ƒsƒ…[ƒ^[–¼
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2
    '—Z‘”NŒ“ú
    StrYuusiYMDWK = Trim$(frmQPAV_CEnt120.txtDateY_Fr.Text) & "/" & Trim$(frmQPAV_CEnt120.txtDateM_Fr.Text) & "/" & Trim$(frmQPAV_CEnt120.txtDateD_Fr.Text)
    odbDatabase.Parameters.Add "InStrYuushiDate", StrYuusiYMDWK, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYuushiDate").ServerType = ORATYPE_VARCHAR2
    '—˜—¦
    odbDatabase.Parameters.Add "InStrRiritu", Trim$(frmQPAV_CEnt120.txtRiritu(0).Text) & "." & Trim$(frmQPAV_CEnt120.txtRiritu(1).Text), ORAPARM_INPUT
        odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_VARCHAR2
    
    '01 ‹‹—^^Ü—^”»’èƒtƒ‰ƒO”z—ñ
              odbDatabase.Parameters.AddTable "InStrKSKbnAry", ORAPARM_INPUT, ORATYPE_CHAR, cnsMaxRec, 1
    Set OraPArray_01 = odbDatabase.Parameters("InStrKSKbnAry")
    '02 ƒy[ƒW‹æ•ª”z—ñ
              odbDatabase.Parameters.AddTable "InNumPageKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 1
    Set OraPArray_02 = odbDatabase.Parameters("InNumPageKBNAry")
    '03 s‹æ•ª”z—ñ
              odbDatabase.Parameters.AddTable "InNumGyouKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_03 = odbDatabase.Parameters("InNumGyouKBNAry")
    '04 —Z‘Šz”z—ñ
              odbDatabase.Parameters.AddTable "InNumYuusigakuAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_04 = odbDatabase.Parameters("InNumYuusigakuAry")
    '05 x•¥06”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai06Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_05 = odbDatabase.Parameters("InNumShiharai06Ary")
    '06 x•¥12”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai12Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_06 = odbDatabase.Parameters("InNumShiharai12Ary")
    '07 x•¥18”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai18Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_07 = odbDatabase.Parameters("InNumShiharai18Ary")
    '08 x•¥24”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai24Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_08 = odbDatabase.Parameters("InNumShiharai24Ary")
    '09 x•¥30”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai30Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_09 = odbDatabase.Parameters("InNumShiharai30Ary")
    '10 x•¥36”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai36Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_10 = odbDatabase.Parameters("InNumShiharai36Ary")
    '11 x•¥42”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai42Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_11 = odbDatabase.Parameters("InNumShiharai42Ary")
    '12 x•¥48”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai48Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_12 = odbDatabase.Parameters("InNumShiharai48Ary")
    '13 x•¥54”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai54Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_13 = odbDatabase.Parameters("InNumShiharai54Ary")
    '14 x•¥60”z—ñ
              odbDatabase.Parameters.AddTable "InNumShiharai60Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_14 = odbDatabase.Parameters("InNumShiharai60Ary")
    '15 Ÿ‰ñÜ—^Œ
              odbDatabase.Parameters.AddTable "InStrJikaiSyouyoAry", ORAPARM_INPUT, ORATYPE_CHAR, cnsMaxRec, 2
    Set OraPArray_15 = odbDatabase.Parameters("InStrJikaiSyouyoAry")
        
    '16 ƒV[ƒPƒ“ƒX”Ô†
              odbDatabase.Parameters.AddTable "InNumSeqNoAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 3
    Set OraPArray_16 = odbDatabase.Parameters("InNumSeqNoAry")
        
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintAdd("
    strSQL = strSQL & " :InNumAryCount"              '”z—ñŒ”
    strSQL = strSQL & ",:InStrCOMPUTERMEI"           'ƒRƒ“ƒsƒ…[ƒ^–¼
    strSQL = strSQL & ",:InStrYuushiDate"            '—Z‘“ú
    strSQL = strSQL & ",:InStrRiritu"                '—˜—¦
    strSQL = strSQL & ",:InStrKSKbnAry"              '‹‹—^^Ü—^”»’èƒtƒ‰ƒO”z—ñ
    strSQL = strSQL & ",:InNumPageKBNAry"            'ƒy[ƒW‹æ•ª”z—ñ
    strSQL = strSQL & ",:InNumGyouKBNAry"            's‹æ•ª”z—ñ
    strSQL = strSQL & ",:InNumYuusigakuAry"          '—Z‘Šz”z—ñ
    strSQL = strSQL & ",:InNumShiharai06Ary"         'x•¥06”z—ñ
    strSQL = strSQL & ",:InNumShiharai12Ary"         'x•¥12”z—ñ
    strSQL = strSQL & ",:InNumShiharai18Ary"         'x•¥18”z—ñ
    strSQL = strSQL & ",:InNumShiharai24Ary"         'x•¥24”z—ñ
    strSQL = strSQL & ",:InNumShiharai30Ary"         'x•¥30”z—ñ
    strSQL = strSQL & ",:InNumShiharai36Ary"         'x•¥36”z—ñ
    strSQL = strSQL & ",:InNumShiharai42Ary"         'x•¥42”z—ñ
    strSQL = strSQL & ",:InNumShiharai48Ary"         'x•¥48”z—ñ
    strSQL = strSQL & ",:InNumShiharai54Ary"         'x•¥54”z—ñ
    strSQL = strSQL & ",:InNumShiharai60Ary"         'x•¥60”z—ñ
    strSQL = strSQL & ",:InStrJikaiSyouyoAry"        'Ÿ‰ñÜ—^Œ
    strSQL = strSQL & ",:InNumSeqNoAry); END;"       'ƒV[ƒPƒ“ƒX”Ô†
 
    i = 1
    
    Do Until i > UBound(gstrKyuuyoAry)
        For j = 1 To cnsMaxRec '
            If i > UBound(gstrKyuuyoAry) Then
                Exit For
            End If
            With gstrKyuuyoAry(i)
                OraPArray_01.Put_value "0", (j - 1)                   '01 ‹‹—^^Ü—^”»’èƒtƒ‰ƒO”z—ñ 0=‹‹—^
                OraPArray_02.Put_value CLng(.intPageKbn), (j - 1)       '02 ƒy[ƒW‹æ•ª
                OraPArray_03.Put_value CLng(.intGyoKbn), (j - 1)       '03 s‹æ•ª
                
                If .strYuusigaku = " " Then                         '04 —Z‘Šz”z—ñ
                    OraPArray_04.Put_value Null, (j - 1)
                Else
                    OraPArray_04.Put_value CLng(.strYuusigaku), (j - 1)
                End If

                If .str06Month = " " Then                             '05 x•¥06”z—ñ
                    OraPArray_05.Put_value Null, (j - 1)
                Else
                    OraPArray_05.Put_value CLng(.str06Month), (j - 1)
                End If
                
                If .str12Month = " " Then                             '06 x•¥12”z—ñ
                    OraPArray_06.Put_value Null, (j - 1)
                Else
                    OraPArray_06.Put_value CLng(.str12Month), (j - 1)
                End If
                
                If .str18Month = " " Then                             '07 x•¥18”z—ñ
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.str18Month), (j - 1)
                End If
                
                If .str24Month = " " Then                             '08 x•¥24”z—ñ
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.str24Month), (j - 1)
                End If
                
                If .str30Month = " " Then                             '09 x•¥30”z—ñ
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.str30Month), (j - 1)
                End If

                If .str36Month = " " Then                             '10 x•¥36”z—ñ
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.str36Month), (j - 1)
                End If

                If .str42Month = " " Then                             '11 x•¥42”z—ñ
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.str42Month), (j - 1)
                End If

                If .str48Month = " " Then                             '12 x•¥48”z—ñ
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.str48Month), (j - 1)
                End If

                If .str54Month = " " Then                             '13 x•¥54”z—ñ
                    OraPArray_13.Put_value Null, (j - 1)
                Else
                    OraPArray_13.Put_value CLng(.str54Month), (j - 1)
                End If

                If .str60Month = " " Then                             '14 x•¥60”z—ñ
                    OraPArray_14.Put_value Null, (j - 1)
                Else
                    OraPArray_14.Put_value CLng(.str60Month), (j - 1)
                End If
                
                OraPArray_15.Put_value " ", (j - 1)                            '15 Ÿ‰ñÜ—^Œ”z—ñ
                
                OraPArray_16.Put_value CLng(j - 1), (j - 1)                      '16 ƒV[ƒPƒ“ƒX”Ô†
                
                
            End With
            i = i + 1
            intKyuuyoCNT = i
        Next j
        
'        '”z—ñŒ”‚Ì’lƒZƒbƒg
'        odbDatabase.Parameters("InNumAryCount").Value = j - 1
'        '‚r‚p‚k•¶‚ÌÀs
'        odbDatabase.DbexecuteSQL (strSQL)
    Loop

    i = 1
    j = j + 1
    
    'Ü—^

    
    Do Until i > UBound(gstrSyouyoAry)
        For j = intKyuuyoCNT To cnsMaxRec '
            If i > UBound(gstrSyouyoAry) Then
                Exit For
            End If
            With gstrSyouyoAry(i)
                OraPArray_01.Put_value "1", (j - 1)                                    '01 ‹‹—^^Ü—^”»’èƒtƒ‰ƒO”z—ñ 1=Ü—^
                OraPArray_02.Put_value CLng(.intPageKbn), (j - 1)      '02 ƒy[ƒW‹æ•ª
                OraPArray_03.Put_value CLng(.intGyoKbn), (j - 1)       '03 s‹æ•ª
                
                If .strYuusigaku = " " Then                         '04 —Z‘Šz”z—ñ
                    OraPArray_04.Put_value Null, (j - 1)
                Else
                    OraPArray_04.Put_value CLng(.strYuusigaku), (j - 1)
                End If

                If .str06Kai = " " Then                                '05 x•¥06”z—ñ
                    OraPArray_05.Put_value Null, (j - 1)
                Else
                    OraPArray_05.Put_value CLng(.str06Kai), (j - 1)
                End If
                
                If .str12Kai = " " Then                             '06 x•¥12”z—ñ
                    OraPArray_06.Put_value Null, (j - 1)
                Else
                    OraPArray_06.Put_value CLng(.str12Kai), (j - 1)
                End If
                
                If .str18Kai = " " Then                             '07 x•¥18”z—ñ
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.str18Kai), (j - 1)
                End If
                
                If .str24Kai = " " Then                             '08 x•¥24”z—ñ
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.str24Kai), (j - 1)
                End If
                
                If .str30Kai = " " Then                             '09 x•¥30”z—ñ
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.str30Kai), (j - 1)
                End If

                If .str36Kai = " " Then                             '10 x•¥36”z—ñ
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.str36Kai), (j - 1)
                End If

                If .str42Kai = " " Then                             '11 x•¥42”z—ñ
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.str42Kai), (j - 1)
                End If

                If .str48Kai = " " Then                             '12 x•¥48”z—ñ
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.str48Kai), (j - 1)
                End If

                If .str54Kai = " " Then                             '13 x•¥54”z—ñ
                    OraPArray_13.Put_value Null, (j - 1)
                Else
                    OraPArray_13.Put_value CLng(.str54Kai), (j - 1)
                End If

                If .str60Kai = " " Then                             '14 x•¥60”z—ñ
                    OraPArray_14.Put_value Null, (j - 1)
                Else
                    OraPArray_14.Put_value CLng(.str60Kai), (j - 1)
                End If
                
                OraPArray_15.Put_value .strJikaiSyouyo, (j - 1)       '15 Ÿ‰ñÜ—^Œ”z—ñ
                                
                OraPArray_16.Put_value (j - 1), (j - 1)                        '16 ƒV[ƒPƒ“ƒX”Ô†
                
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

             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintDel("
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

