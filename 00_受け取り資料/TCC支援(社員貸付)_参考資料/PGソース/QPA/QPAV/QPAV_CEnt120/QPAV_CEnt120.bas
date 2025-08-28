Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt120"  '�v���O������
 Public Const gcnsNumeric = "0123456789"     '���͕�������p�̐��l
 Public Const gcnsstrSysChng = "2001/11/01"    '�V�V�X�e���ȍ~��
    
 Public gstrSysDate   As String '�V�X�e�����t
 Public gstrBonusMD1  As String '�{�[�i�X�x�����P
 Public gstrBonusMD2  As String '�{�[�i�X�x�����Q
    
 '���^�ԍϊz�p
 Type KyuuyoTbl
    intPageKbn   As Integer '�y�[�W�敪
    intGyoKbn    As Integer '�s�敪
    strYuusibi   As String  '�Z����
    strYuusigaku As String  '�Z���z
    strRiritu    As String  '�_�񗘗�
    strKariire   As String  '�ؓ����z
    str06Month   As String  '�@�U����
    str12Month   As String  '�P�Q����
    str18Month   As String  '�P�W����
    str24Month   As String  '�Q�S����
    str30Month   As String  '�R�O����
    str36Month   As String  '�R�U����
    str42Month   As String  '�S�Q����
    str48Month   As String  '�S�W����
    str54Month   As String  '�T�S����
    str60Month   As String  '�U�O����
 End Type

 '�ܗ^�ԍϊz�p
 Type SyouyoTbl
    intPageKbn     As Integer '�y�[�W�敪
    intGyoKbn      As Integer '�s�敪
    strYuusibi     As String  '�Z����
    strYuusigaku   As String  '�Z���z
    strRiritu      As String  '�_�񗘗�
    strKariire     As String  '�ؓ����z
    strJikaiSyouyo As String  '����ܗ^��
    str06Kai       As String  '�@�U��
    str12Kai       As String  '�P�Q��
    str18Kai       As String  '�P�W��
    str24Kai       As String  '�Q�S��
    str30Kai       As String  '�R�O��
    str36Kai       As String  '�R�U��
    str42Kai       As String  '�S�Q��
    str48Kai       As String  '�S�W��
    str54Kai       As String  '�T�S��
    str60Kai       As String  '�U�O��
 End Type

 Public gstrKyuuyoAry() As KyuuyoTbl '���^�ԍϊz�p
 Public gstrSyouyoAry() As SyouyoTbl '�ܗ^�ԍϊz�p

 Public gdblRiritu      As Double    '�_�񗘗�
 Public gstrYuusiBi_Fr  As String    '�Z����_From
 Public gstrYuusiBi_To  As String    '�Z����_To

 Public lngErrCode           As Long          '�װ����
 Public strErrDescription    As String        '�װү����



'������ϐ�
Public glngPrintCnt        As Long         '�z�񌏐�
Public gvarShiharai1()     As Variant      '�x�����񐔌��z��i�U�����j
Public gvarShiharai2()     As Variant      '�x�����񐔌��z��i�P�Q�����j
Public gvarShiharai3()     As Variant      '�x�����񐔌��z��i�P�W�����j
Public gvarShiharai4()     As Variant      '�x�����񐔌��z��i�Q�S�����j
Public gvarShiharai5()     As Variant      '�x�����񐔌��z��i�R�O�����j
Public gvarShiharai6()     As Variant      '�x�����񐔌��z��i�R�U�����j
Public gvarShiharai7()     As Variant      '�x�����񐔌��z��i�S�Q�����j
Public gvarShiharai8()     As Variant      '�x�����񐔌��z��i�S�W�����j
Public gvarShiharai9()     As Variant      '�x�����񐔌��z��i�T�S�����j
Public gvarShiharai10()    As Variant      '�x�����񐔌��z��i�U�O�����j
Public gvarYuushigaku()    As Variant      '�Z���z
Public gstrKSKbn()         As String       '���^�ܗ^�敪�z��
Public gintPageKbn         As Integer      '�ŋ敪
Public gintGyouKbn         As Integer      '�s�敪
Public gstrYuushiDate      As String       '�Z����
Public gsglRiritu          As Single       '����
Public gstrNextSyouyo      As Single       '����ܗ^��
'
'
''�R�[�h�e�[�u��
'Type CodeTbl
'    CodeNo As String
'    Meisyou As String
'End Type
'
'Public gtblSyori() As CodeTbl
'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�ԋp�z�ꗗ�\�͊��ɋN������Ă��܂��B" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If

    '�R�}���h���C�������̎擾
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "�N���p�����[�^���ݒ肳��Ă��܂���B" _
                , vbExclamation Or vbOKOnly, gcstrPrjName

        Exit Sub
    End If

    '�R�}���h���C��������ҏW����
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt120.Show 1
 
End Sub
'****************************************************************************************************
'*  ���������pSP�i�V�X�e�����t�j
'****************************************************************************************************
Public Sub gsubSPlnit()
 Dim strWkAry As String
 Dim strSQL As String
 Dim i As Long
 Dim strTmp As String
 Const cnsMaxRec As Long = 100
 
 On Error GoTo errSPlnit
 
    '�r�o
    '�V�X�e�����t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2
    '�{�[�i�X�x�����P
    odbDatabase.Parameters.Add "OtStrBonusDate1", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrBonusDate1").ServerType = ORATYPE_VARCHAR2
    '�{�[�i�X�x�����Q
    odbDatabase.Parameters.Add "OtStrBonusDate2", Space(8), ORAPARM_OUTPUT
        odbDatabase.Parameters("OtStrBonusDate2").ServerType = ORATYPE_VARCHAR2
                
    '�r�p�k��
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120Init("
    strSQL = strSQL & " :OtStrSysDate"
    strSQL = strSQL & ",:OtStrBonusDate1"
    strSQL = strSQL & ",:OtStrBonusDate2); END;"
            
    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
            
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate") '�V�X�e�����t
    gstrBonusMD1 = odbDatabase.Parameters("OtStrBonusDate1") '�{�[�i�X�x�����P
    gstrBonusMD2 = odbDatabase.Parameters("OtStrBonusDate2") '�{�[�i�X�x�����Q
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
            
errSPlnit:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
        
End Sub

'**********************************************************************************************************
'*  �ԍϗ\��\���׍쐬
'**********************************************************************************************************
Public Sub gSubMakeMeisai()
 Dim dblRiritu    As Double    '�_�񗘗�
 
'--���[�N----------------------------------------------
 Dim lngYuusi           As Long    '�Z���z_WORK
 Dim strSyouyoDate1     As String  '�ܗ^�x����1_WORK
 Dim strSyouyoDate2     As String  '�ܗ^�x����1_WORK
 Dim dblKeiyakuriritu   As Double  '�_�񗘗�_WORK
 Dim strMonth_1         As String  '��1_WORK
 Dim strMonth_2         As String  '��1_WORK
 Dim strNextSyouyoMonth As String  '����ܗ^��_WORK
 Dim intPage            As Integer '��_WORK
 Dim intGyou            As Integer '�s_WORK
 Dim strYuusiDate       As String  '�Z����_WORK
 Dim strYuusiMae        As String  '�Z�����t�O_WORK
 Dim strYuusiAto        As String  '�Z�����t��_WORK
 Dim lngKyuuyoCNT       As Long    '���^�z�񌏐�
 Dim lngSyouyoCNT       As Long    '�ܗ^�z�񌏐�


 Dim dblWKYuusibi     As Double
 Dim varWKSyouyoDate1 As Variant
 Dim varWKSyouyoDate2 As Variant
 Dim strYuusiYMD_W    As Date

On Error GoTo gSubMakeMeisaiKyuu

    '�ϐ��ɃZ�b�g
    dblRiritu = gdblRiritu                           '�_�񗘗�
    dblKeiyakuriritu = dblRiritu
    
    If Val(Format$(gstrYuusiBi_Fr, "dd")) <= 10 Then '�Z�����t�O
        strYuusiMae = CVDate(Format$(gstrYuusiBi_Fr, "yyyy/mm/") & "10")
    Else
        strYuusiMae = CVDate(Format$(gstrYuusiBi_Fr, "yyyy/mm/") & "25")
    End If
    If Val(Format$(gstrYuusiBi_To, "dd")) <= 10 Then '�Z�����t��
        strYuusiAto = CVDate(Format$(gstrYuusiBi_To, "yyyy/mm/") & "10")
    Else
        strYuusiAto = CVDate(Format$(gstrYuusiBi_To, "yyyy/mm/") & "25")
    End If

'2004/02/18 �䒠�o�^�Ɠ��������ɕύX
    strYuusiYMD_W = Date
    If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ�
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
        End If
        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")

    Else
        If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ� '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
        strMonth_2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
    End If
'�ύX�O
''''    '�ܗ^�x��������
''''''    If Format(Date, "MMDD") < gstrBonusMD1 Then
''''    If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''        '�ܗ^�x�������Q���ܗ^�x�������P��
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
''''        '�ܗ^�x�������Q���ܗ^�x�������P��
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
'2004/02/18 �䒠�o�^�Ɠ��������ɕύX

    '----���^--------------------
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
                    .intPageKbn = intPage      '�y�[�W�敪
                    .intGyoKbn = intGyou       '�s�敪
                    .strYuusibi = strYuusiDate '�Z����
                    .strYuusigaku = " "        '�Z���z
                    .strRiritu = dblRiritu     '�_�񗘗�
                    .str06Month = " "          '�@�U����
                    .str12Month = " "          '�P�Q����
                    .str18Month = " "          '�P�W����
                    .str24Month = " "          '�Q�S����
                    .str30Month = " "          '�R�O����
                    .str36Month = " "          '�R�U����
                    .str42Month = " "          '�S�Q����
                    .str48Month = " "          '�S�W����
                    .str54Month = " "          '�T�S����
                    .str60Month = " "          '�U�O����
                End With
                intGyou = intGyou + 1
                lngKyuuyoCNT = lngKyuuyoCNT + 1
            End If

            dblWKYuusibi = CDate(strYuusiDate)
            varWKSyouyoDate1 = CVar(strSyouyoDate1)
            varWKSyouyoDate2 = CVar(strSyouyoDate2)

            ReDim Preserve gstrKyuuyoAry(lngKyuuyoCNT)
            With gstrKyuuyoAry(lngKyuuyoCNT)
                .intPageKbn = intPage  ''''''''''''''''''''''�y�[�W�敪
                .intGyoKbn = intGyou  '''''''''''''''''''''''�s�敪
                .strYuusibi = strYuusiDate ''''''''''''''''''�Z����
                .strYuusigaku = lngYuusi ''''''''''''''''''''�Z���z
                .strRiritu = dblRiritu ''''''''''''''''''''''�_�񗘗�
                .str06Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 6, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2)  '�@�U����
                .str12Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 12, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�P�Q����
                .str18Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 18, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�P�W����
                .str24Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 24, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�Q�S����
                .str30Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 30, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�R�O����
                .str36Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 36, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�R�U����
                .str42Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 42, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�S�Q����
                .str48Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 48, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�S�W����
                .str54Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 54, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�T�S����
                .str60Month = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, 60, lngYuusi, lngYuusi, varWKSyouyoDate1, varWKSyouyoDate2) '�U�O����
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
    
    '----�ܗ^------------------------
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
                    .intPageKbn = intPage                '�y�[�W�敪
                    .intGyoKbn = intGyou                 '�s�敪
                    .strYuusibi = strYuusiDate           '�Z����
                    .strYuusigaku = " "                  '�Z���z
                    .strRiritu = dblRiritu               '�_�񗘗�
                    .strJikaiSyouyo = strNextSyouyoMonth '����ܗ^��
                    .str06Kai = " "                      '�@�U��
                    .str12Kai = " "                      '�P�Q��
                    .str18Kai = " "                      '�P�W��
                    .str24Kai = " "                      '�Q�S��
                    .str30Kai = " "                      '�R�O��
                    .str36Kai = " "                      '�R�U��
                    .str42Kai = " "                      '�S�Q��
                    .str48Kai = " "                      '�S�W��
                    .str54Kai = " "                      '�T�S��
                    .str60Kai = " "                      '�U�O��
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
'*  ����ԍϊz�Z�o
'*    intHensaiFlg     : ���ԍϊz�Z�o_FLG
'*    strYuusiBi       : �Z����
'*    dblRiritu        : �_�񗘗�
'*    intHensaiTukisuu : �ԍό���
'*    lngKyuuyo        : ���^�ԍϊz
'*    lngSyouyo        : �ܗ^�ԍϊz
'*    varSyouyoDate1   : �ܗ^�x����1
'*    varSyouyoDate2   : �ܗ^�x����2
'*      2004/02/18 �Ј��Z���䒠�o�^�����ƃR�[�h�𓯂��ɂ���B
'************************************************************************************************************
Function gfncstrKeisan(intHensaiFlg As Integer, strYuusibi As Double, dblRiritu As Double, intHensaiTukisuu As Integer, lngKyuuyo As Long, lngSyouyo As Long, varSyouyoDate1 As Variant, varSyouyoDate2 As Variant) As Long
 Dim i                   As Integer
 Dim T                   As Integer
 Dim intNenKBN_WK        As Integer  '�N�敪_WORK
 Dim intKBN_WK           As Integer  '�敪_WORK
 Dim strHensaiKijitu_WK  As Double   '�ԍϊ���_WORK
 Dim strSyouyoKijitu_WK  As Double   '�ܗ^����_WORK
 Dim lngKyuuyoTeigaku_WK As Long     '���^��z�ԍϊz_WORK
 Dim lngKyuuyo1Zan_WK    As Long     '���^��1�c��_WORK
 Dim lngKyuuyoHenZan_WK  As Long     '���^�ԍώc��_WORK
 Dim lngSyouyoTeigaku_WK As Long     '�ܗ^��z�ԍϊz_WORK
 Dim lngSyouyo1Zan_WK    As Long     '�ܗ^��1�c��_WORK
 Dim lngSyouyoHenZan_WK  As Long     '�ܗ^�ԍώc��_WORK
 Dim curTeigaku0_WK      As Currency '��z_WORK0
 Dim curTeigaku1_WK      As Currency '��z_WORK1
 Dim curTeigaku2_WK      As Currency '��z_WORK2
 Dim intSyouyoKaisuu_WK  As Integer  '�ܗ^�ԍω�_WORK
 Dim strSyouyoDate_WK    As Variant  '�ܗ^�x����_WORK
 Dim strHensaiKijitu2_WK As Variant  '�ԍϊ���_WORK2
 Dim strHensaiKikan_WK   As Double   '�ԍϊ���_WORK
 Dim strZenkaiSyouyo_WK  As Variant  '�O��ܗ^�ԍϓ�_WORK
 Dim intSyouyoKikan_WK   As Integer  '�ܗ^�ԍϊ���_WORK
 Dim dblRisoku_WK        As Double    '����_WORK
 Dim dblRisoku2_WK       As Double   '����2_WORK
 Dim strZenkaiKyuuyo     As Variant  '�O�񋋗^�ԍϓ�
 Dim strZenkaiSyouyo     As Variant  '�O��ܗ^�ԍϓ�
 Dim strDaiitiSyouyo     As Variant  '��1��ܗ^�ԍϓ�
 Dim curRisoku           As Currency 'WORK_����
 Dim curZandaka          As Currency 'WORK_�c��
 Dim curSaisyuuHensai    As Currency '�ŏI�ԍϊz
 Dim curTeigaku          As Currency '��z_SAVE

 Dim dblKeiyakuriritu    As Double    '�_�񗘗� (2001/11/01�ȍ~�Ɏg�p)


    '********************************************
    '* �Z������ 2000/03/01 �����ɏ����𕪂���
    '********************************************
    If CVDate(strYuusibi) < CVDate("2000/03/01") Then
        '****************
        '* ���X�̏���
        '****************
        ' ������ �� ���� ���� �ɕϊ�
        If dblRiritu >= 1 Then
            dblRiritu = dblRiritu / 100
        End If
        ' �ܗ^�N�����̏��������� "�P" �ɐݒ�
        If DateDiff("y", varSyouyoDate1, varSyouyoDate2) < 0 Then
            strSyouyoDate_WK = varSyouyoDate1
            varSyouyoDate1 = varSyouyoDate2
            varSyouyoDate2 = strSyouyoDate_WK
        End If
        intSyouyoKikan_WK = DateDiff("m", varSyouyoDate1, varSyouyoDate2)
        strZenkaiSyouyo = strYuusibi
        intNenKBN_WK = 1
        T = 1
        ' �ܗ^�̕ԍω񐔂����߂�
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
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu_WK = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd")))
        End If
        lngKyuuyoHenZan_WK = lngKyuuyo
        lngSyouyoHenZan_WK = lngSyouyo

        '----------------------�x���z�v�Z---------------------------
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
        '* �V��������
        '****************
        ' ������ �� ���� ���� �ɕϊ�
        If dblRiritu >= 1 Then
            dblRiritu = dblRiritu / 100
        End If
        ' �ܗ^�N�����̏��������� "�P" �ɐݒ�
        If DateDiff("y", varSyouyoDate1, varSyouyoDate2) < 0 Then
            strSyouyoDate_WK = varSyouyoDate1
            varSyouyoDate1 = varSyouyoDate2
            varSyouyoDate2 = strSyouyoDate_WK
        End If
        ' �ܗ^�̕ԍω񐔂����߂�
        If intHensaiTukisuu <= 0 Then
            intHensaiTukisuu = 1
        End If
        intSyouyoKaisuu_WK = Fix(intHensaiTukisuu / 6)
        ' ���[�ȁi�P�T��Ȃǂ̂U�Ŋ���؂�Ȃ��j�����ł̕ԍς̏ꍇ�A
        ' ���[�Ȍ����̒��ɏܗ^��������΁A���̉񐔂����Z����
        ' �A���A�t�H�[���i�Ј��Z���䒠�j�ł́A�U�̔{���̉񐔂������͂ł��Ȃ��ׁA
        ' ���肦�Ȃ����A���X�̏��������̂܂܂Ƃ���
        For i = 1 To intHensaiTukisuu Mod 6
            If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate1) Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", varSyouyoDate2) Then
                intSyouyoKaisuu_WK = intSyouyoKaisuu_WK + 1
            End If
        Next i
        If intSyouyoKaisuu_WK <= 0 Then
            intSyouyoKaisuu_WK = 1
        End If
        ' �P��ڂ̋��^�ԍϓ������߂�i�Z�����̗����̂Q�T������j
        strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
        ' �P��ڂ̏ܗ^�ԍϓ������߂�i�Z�����̗����ȍ~�j
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu_WK = CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu_WK = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(varSyouyoDate1, "mm/dd")))
        End If
        lngKyuuyoHenZan_WK = lngKyuuyo
        lngSyouyoHenZan_WK = lngSyouyo
        
        '----------------------�x���z�v�Z---------------------------
        lngKyuuyoTeigaku_WK = 0
        lngSyouyoTeigaku_WK = 0
        '****************************
        '* ���^�̖����̕ԍϊz�̌v�Z
        '****************************
        If intHensaiFlg = 1 Then
            ' �Z�����i�v�Z���鎞�́|�P������j����A�P��ڂ̋��^�ԍϓ��܂ł̊��ԎZ�o
            strHensaiKikan_WK = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strHensaiKijitu_WK))
            
            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
             ' �P��ڂ̋��^�ԍϓ��܂ł̗����v�Z
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                dblRisoku_WK = Fix(lngKyuuyo * dblKeiyakuriritu * strHensaiKikan_WK)
            Else
                dblRisoku2_WK = (lngKyuuyo * dblRiritu * strHensaiKikan_WK / 365)
                dblRisoku_WK = Int(dblRisoku2_WK)
            End If
            
            
            If intHensaiTukisuu <= 1 Then
                ' �P��ł̕ԍς̏ꍇ
                lngKyuuyoTeigaku_WK = curRisoku + lngKyuuyo
            Else
                '* �W���֐��ŋ��߂閈��̕ԍϋ��z
                curTeigaku0_WK = Int(Abs(-Pmt(dblRiritu / 12, intHensaiTukisuu, lngKyuuyo, 0, 0)))
                '* �P��ڗp�̑O��ԍϓ��i�Z�����|�P���j
                strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                '* �P��ڗp�̕ԍϓ��i�Z�����̗����̂Q�T���j
                strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                curZandaka = lngKyuuyo
                '*********************************************************
                '* �P��ڂ���ԍω񐔁|�P��ڂ܂ł̕ԍϗ\��������v�Z���A
                '* �ŏI�ԍςł̕ԍϊz���v�Z����
                '*********************************************************
                For i = 1 To intHensaiTukisuu - 1
                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                    
                    '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
                '* �ŏI�ԍςł̗����v�Z
                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                
                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                Else
                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                End If
                
                '* �ŏI�ԍςł̕ԍϊz
                curSaisyuuHensai = curRisoku + curZandaka
                '* �W���֐��ŋ��߂�����ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                If curTeigaku0_WK = curSaisyuuHensai Then
                    '* ��v����ꍇ�́A�W���֐��ŋ��߂�����ԍϊz�Ƃ���
                    curTeigaku = curTeigaku0_WK
                Else
                    If curTeigaku0_WK < curSaisyuuHensai Then
                        '* �W���֐��ŋ��߂�����ԍϊz���A�ŏI�ԍϊz���傫���ꍇ
                        '*********************************************************
                        '* �W���֐��ŋ��߂�����ԍϊz���{�P�~�����Ȃ���A
                        '* �ŏI�ԍϊz���v�Z���A�ł��߂����z���Z�o����
                        '* �i�A���A����ԍϊz <= �ŏI�ԍϊz �ƂȂ���z�j
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        Do
                            '* ����ԍϊz���P�~���z
                            curTeigaku0_WK = curTeigaku0_WK + 1
                            strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                            strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                            curZandaka = lngKyuuyo
                            For i = 1 To intHensaiTukisuu - 1
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
                            '* �ŏI�ԍςł̗����v�Z
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                            
                            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            '* �ŏI�ԍςł̕ԍϊz
                            curSaisyuuHensai = curRisoku + curZandaka
                            
                            '* ����̃��[�v�̖���ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                            If curTeigaku0_WK < curSaisyuuHensai Then
                                    
                                curTeigaku = curTeigaku0_WK
                                                                    
                            Else
                                '* ����̃��[�v�̖���ԍϊz���A�ŏI�ԍϊz���傫���Ȃ����ꍇ�A
                                '* �v�Z�I�� �|�|�� �P��O�̋��z�𖈉�ԍϊz�Ƃ���
                                Exit Do
                            End If
                        Loop
                    Else
                        '* �ŏI�ԍϊz���A�W���֐��ŋ��߂�����ԍϊz���傫���ꍇ
                        '*********************************************************
                        '* �W���֐��ŋ��߂�����ԍϊz���|�P�~�����Ȃ���A
                        '* �ŏI�ԍϊz���v�Z���A�ł��߂����z���Z�o����
                        '* �i�A���A����ԍϊz <= �ŏI�ԍϊz �ƂȂ���z�j
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        Do
                            '* ����ԍϊz���P�~���z
                            curTeigaku0_WK = curTeigaku0_WK - 1
                            strZenkaiKyuuyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                            strHensaiKijitu_WK = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
                            curZandaka = lngKyuuyo
                            For i = 1 To intHensaiTukisuu - 1
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
                            '* �ŏI�ԍςł̗����v�Z
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiKyuuyo), CVDate(strHensaiKijitu_WK))
                                
                            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            '* �ŏI�ԍςł̕ԍϊz
                            curSaisyuuHensai = curRisoku + curZandaka
                            
                            '* ����̃��[�v�̖���ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                            If curTeigaku0_WK <= curSaisyuuHensai Then
                                '* ����̃��[�v�̖���ԍϊz���A�ŏI�ԍϊz�ȉ��ɂȂ����ꍇ�A
                                '* �v�Z�I�� �|�|�� ����̋��z�𖈉�ԍϊz�Ƃ���
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
        '* �ܗ^�̖���̕ԍϊz�̌v�Z
        '****************************
        If intHensaiFlg = 2 Then
            ' �Z�����i�v�Z���鎞�́|�P������j����A�P��ڂ̏ܗ^�ԍϓ��܂ł̊��ԎZ�o
            strHensaiKikan_WK = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strSyouyoKijitu_WK))
            
            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
             ' �P��ڂ̋��^�ԍϓ��܂ł̗����v�Z
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                dblRisoku_WK = Fix(lngSyouyo * dblKeiyakuriritu * strHensaiKikan_WK)
            Else
                dblRisoku2_WK = (lngSyouyo * dblRiritu * strHensaiKikan_WK / 365)
                dblRisoku_WK = Int(dblRisoku2_WK)
            End If
            
            '* �P��ڂ̏ܗ^�ԍϓ��̑ޔ�
            strDaiitiSyouyo = strSyouyoKijitu_WK
            If intSyouyoKaisuu_WK <= 1 Then
                ' �P��ł̕ԍς̏ꍇ
                lngSyouyoTeigaku_WK = dblRisoku_WK + lngSyouyo
            Else
                '* �W���֐��ŋ��߂閈��̕ԍϋ��z�i�����͏ܗ^�̊Ԋu���ϓ��ȔN�Q��Ɖ��肵�Čv�Z����j
                curTeigaku0_WK = Int(Abs(-Pmt(dblRiritu / 2, intSyouyoKaisuu_WK, lngSyouyo, 0, 0)))
                '* �P��ڗp�̑O��ԍϓ��i�Z�����|�P���j
                strZenkaiSyouyo_WK = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                curZandaka = lngSyouyo
                '*********************************************************
                '* �P��ڂ���ܗ^�̕ԍω񐔁|�P��ڂ܂ł̕ԍϗ\��������v�Z���A
                '* �ŏI�ԍςł̕ԍϊz���v�Z����
                '*********************************************************
                For i = 1 To intSyouyoKaisuu_WK - 1
                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                    
                    '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                    Else
                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                    End If
                    
                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                    strZenkaiSyouyo_WK = strSyouyoKijitu_WK
                    '* ����̏ܗ^���̌v�Z
'*20031030
'���ܗ^���N�x���܂����ꍇ�u* �ŏI�ԍςł̗����v�Z�v�ɂāA���t���}�C�i�X�ɂȂ�s����C��
                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                        '�N�x���܂����ꍇ
                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                        Else
                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                        End If
                    Else
                        '�N�x���܂����Ȃ��ꍇ
                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                        Else
                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                        End If
                    End If
'�C���O�̏�����
'                    If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                        strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                    Else
'                        strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                    End If
'*20031030
                Next i
                '* �ŏI�ԍςł̗����v�Z
                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                
                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                Else
                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                End If
                
                '* �ŏI�ԍςł̕ԍϊz
                curSaisyuuHensai = curRisoku + curZandaka
                '* �W���֐��ŋ��߂�����ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                If curTeigaku0_WK = curSaisyuuHensai Then
                    '* ��v����ꍇ�́A�W���֐��ŋ��߂�����ԍϊz�Ƃ���
                    curTeigaku = curTeigaku0_WK
                Else
                    If curTeigaku0_WK < curSaisyuuHensai Then
                        '* �W���֐��ŋ��߂�����ԍϊz���A�ŏI�ԍϊz���傫���ꍇ
                        '*********************************************************
                        '* ����ԍϊz���P�O�O�O�~�ȏ�̏ꍇ�A���[�v�̉񐔂����炷����
                        '* �W���֐��ŋ��߂�����ԍϊz���{�P�O�O�O�~�����Ȃ���A
                        '* �ŏI�ԍϊz���v�Z���A�ŏI�ԍϊz���Z�o��������ԍϊz����
                        '* �傫���Ȃ����P�O�̋��z�����߂�
                        '* �i�ܗ^�̏ꍇ�A�덷���傫���̂ł��̏�����ǉ�����B
                        '* �@���^�̏ꍇ�͌덷�����Ȃ��̂ł��̏����͂Ȃ��B�j
                        '*********************************************************
                        curTeigaku = curTeigaku0_WK
                        If Int(curTeigaku0_WK / 1000) >= 1 Then
                            Do
                                '* ����ԍϊz���P�~���z
                                curTeigaku0_WK = curTeigaku0_WK + 1000
                                curSaisyuuHensai = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                                strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                                curZandaka = lngSyouyo
                                For i = 1 To intSyouyoKaisuu_WK - 1
                                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo_WK), CVDate(strSyouyoKijitu_WK))
                                    
                                    '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                    Else
                                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                    End If
                                    
                                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                    strZenkaiSyouyo_WK = strSyouyoKijitu_WK

                                    '* ����̏ܗ^���̌v�Z
'*20031030
'���ܗ^���N�x���܂����ꍇ�u* �ŏI�ԍςł̗����v�Z�v�ɂāA���t���}�C�i�X�ɂȂ�s����C��
                                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                        '�N�x���܂����ꍇ
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    Else
                                        '�N�x���܂����Ȃ��ꍇ
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    End If
'�C���O�̏�����
'                                    If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
'                                        strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
'                                    Else
'                                        strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate1, "mm/dd"))
'                                    End If
'*20031030
                                Next i
                                '* �ŏI�ԍςł̗����v�Z
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                    
                                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                '* �ŏI�ԍςł̕ԍϊz
                                curSaisyuuHensai = curRisoku + curZandaka
                                '* ����̃��[�v�̖���ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                                If curTeigaku0_WK < curSaisyuuHensai Then
                                    curTeigaku = curTeigaku0_WK
                                Else
                                    '* ����̃��[�v�̖���ԍϊz���A�ŏI�ԍϊz���傫���Ȃ����ꍇ�A
                                    '* �v�Z�I�� �|�|�� �P��O�̋��z�𖈉�ԍϊz�Ƃ���
                                    Exit Do
                                End If
                            Loop
                            curTeigaku0_WK = curTeigaku
                        End If
                    Else
                        '* �ŏI�ԍϊz���A�W���֐��ŋ��߂�����ԍϊz���傫���ꍇ
                        '*********************************************************
                        '* ����ԍϊz���P�O�O�O�~�ȏ�̏ꍇ�A���[�v�̉񐔂����炷����
                        '* �W���֐��ŋ��߂�����ԍϊz���|�P�O�O�O�~�����Ȃ���A
                        '* �ŏI�ԍϊz���v�Z���A�ŏI�ԍϊz���Z�o��������ԍϊz����
                        '* �������Ȃ������z�����߂�
                        '* �i�ܗ^�̏ꍇ�A�덷���傫���̂ł��̏�����ǉ�����B
                        '* �@���^�̏ꍇ�͌덷�����Ȃ��̂ł��̏����͂Ȃ��B�j
                        '*********************************************************
                        If Int(curTeigaku0_WK / 1000) >= 1 Then
                            Do
                                '* ����ԍϊz���P�~���z
                                curTeigaku0_WK = curTeigaku0_WK - 1000
                                strZenkaiSyouyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                                strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                                curZandaka = lngSyouyo
                                For i = 1 To intSyouyoKaisuu_WK - 1
                                    strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                    
                                    '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                        curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                    Else
                                        curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                    End If
                                    
                                    curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                                    strZenkaiSyouyo = strSyouyoKijitu_WK
                                    '* ����̏ܗ^���̌v�Z
'*20031030
'���ܗ^���N�x���܂����ꍇ�u* �ŏI�ԍςł̗����v�Z�v�ɂāA���t���}�C�i�X�ɂȂ�s����C��
                                    If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                        '�N�x���܂����ꍇ
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                                            strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                        End If
                                    Else
                                        '�N�x���܂����Ȃ��ꍇ
                                        If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                            '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                            strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                        Else
                                            '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
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
                                '* �ŏI�ԍςł̗����v�Z
                                strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                                
                                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                    curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                                Else
                                    curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                                End If
                                
                                '* �ŏI�ԍςł̕ԍϊz
                                curSaisyuuHensai = curRisoku + curZandaka
                                '* ����̃��[�v�̖���ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                                If curTeigaku0_WK <= curSaisyuuHensai Then
                                    '* ����̃��[�v�̖���ԍϊz���A�ŏI�ԍϊz�ȉ��ɂȂ����ꍇ�A
                                    '* �v�Z�I�� �|�|�� ����̋��z�𖈉�ԍϊz�Ƃ���
                                    curTeigaku = curTeigaku0_WK
                                    Exit Do
                                End If
                            Loop
                            curTeigaku0_WK = curTeigaku
                        End If
                    End If
                    '*********************************************************
                    '* ��L�ŋ��߂�����ԍϊz���{�P�~�����Ȃ���A
                    '* �ŏI�ԍϊz���v�Z���A�ł��߂����z���Z�o����
                    '* �i�A���A����ԍϊz <= �ŏI�ԍϊz �ƂȂ���z�j
                    '*********************************************************
                    curTeigaku = curTeigaku0_WK
                    Do
                        '* ����ԍϊz���P�~���z
                        curTeigaku0_WK = curTeigaku0_WK + 1
                        strZenkaiSyouyo = CVDate(DateAdd("y", -1, CVDate(strYuusibi)))
                        strSyouyoKijitu_WK = CVDate(strDaiitiSyouyo)
                        curZandaka = lngSyouyo
                        For i = 1 To intSyouyoKaisuu_WK - 1
                            strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                            
                            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                                curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                            Else
                                curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                            End If
                            
                            curZandaka = curZandaka - (curTeigaku0_WK - curRisoku)
                            strZenkaiSyouyo = strSyouyoKijitu_WK
                            '* ����̏ܗ^���̌v�Z
'*20031030
'���ܗ^���N�x���܂����ꍇ�u* �ŏI�ԍςł̗����v�Z�v�ɂāA���t���}�C�i�X�ɂȂ�s����C��
                            If Year(varSyouyoDate1) <> Year(varSyouyoDate2) Then
                                '�N�x���܂����ꍇ
                                If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                    '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
                                    strSyouyoKijitu_WK = CVDate(Format$(Year(strSyouyoKijitu_WK) + 1, "0000") & "/" & Format$(varSyouyoDate2, "mm/dd"))
                                Else
                                    '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                    strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate1, "mm/dd"))
                                End If
                            Else
                                '�N�x���܂����Ȃ��ꍇ
                                If Month(strSyouyoKijitu_WK) = Month(varSyouyoDate1) Then
                                    '���ܗ^�͓~�G�̎��͔N�x�͕ς�炸
                                    strSyouyoKijitu_WK = CVDate(Format$(strSyouyoKijitu_WK, "yyyy/") & Format$(varSyouyoDate2, "mm/dd"))
                                Else
                                    '���ܗ^���ċG�̎��N�x�ɂP�ǉ�
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
                        '* �ŏI�ԍςł̗����v�Z
                        strHensaiKikan_WK = DateDiff("y", CVDate(strZenkaiSyouyo), CVDate(strSyouyoKijitu_WK))
                        
                        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                            dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                            curRisoku = Fix(curZandaka * dblKeiyakuriritu * strHensaiKikan_WK)
                        Else
                            curRisoku = Int(curZandaka * dblRiritu * strHensaiKikan_WK / 365)
                        End If
                        
                        '* �ŏI�ԍςł̕ԍϊz
                        curSaisyuuHensai = curRisoku + curZandaka
                        '* ����̃��[�v�̖���ԍϊz�ƁA�ŏI�ԍϊz�̔�r
                        If curTeigaku0_WK = curSaisyuuHensai Then
                            '* ����̃��[�v�̖���ԍϊz�ƍŏI�ԍϊz���������ꍇ�A
                            '* ����̋��z�𖈉�ԍϊz�Ƃ���
                            curTeigaku = curTeigaku0_WK
                            Exit Do
                        Else
                            If curTeigaku0_WK < curSaisyuuHensai Then
                                curTeigaku = curTeigaku0_WK
                            
                            Else
                                '* ����̃��[�v�̖���ԍϊz���A�ŏI�ԍϊz���傫���Ȃ����ꍇ�A
                                '* �v�Z�I�� �|�|�� �P��O�̋��z�𖈉�ԍϊz�Ƃ���
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
'     ����ܗ^�ԍϊz�Z�o����6�J���ȊO
'*************************************************************************************************************************************************
Function gfnclngSyouyoHensai(strYuusibi As Double, dblRiritu As Double, strSyouyoDate1 As Variant, strSyouyoDate2 As Variant, intSyouyoHensaiKaisuu As Integer, lngSyouyoHensaiAll As Long, dblRisoku1 As Double, lngSyouyoTeigaku As Long) As Long
 Dim T As Integer
 Dim lngTeiGakuHensai_1 As Long   '��z�ԍϊz_WORK
 Dim lngTeiGakuHensai_2 As Long   '��z�ԍϊz_WORK2
 Dim lngTeiGakuHensai_3 As Long   '��z�ԍϊz_�ۑ�
 Dim lngHensaiSagaku    As Long   '�ԍύ��z_WORK
 Dim lngHensaiSyuukei   As Long   '�ԍϏW�v_WORK
 Dim lngSyouyoHenZan    As Long   '�ܗ^�ԍώc��_WORK
 Dim lngSyouyoHenRsk    As Long   '�ܗ^�ԍϗ���_WORK
 Dim strSyouyoKijitu    As String '�ܗ^����_WORK
 Dim strZenkaiSyouyoHen As String '�O��ܗ^�ԍϓ�_WORK
 Dim lngSaisyuHensai    As Long   '�ŏI�ԍϊz_WORK

 Dim dblKeiyakuriritu    As Double   '�X�΃N�������[�N�i�V�V�X�e��2001/11/01�ȍ~�Ɏg�p�j

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

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then '�ꃖ���O
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
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
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
            
            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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

    '***��z�ԍϊz_�ۑ�(�{�P) �̏ꍇ�ō��z�����߂�
    lngTeiGakuHensai_2 = lngTeiGakuHensai_3
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 + 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
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
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
    
    '***��z�ԍϊz_�ۑ�(�|�P) �̏ꍇ�ō��z�����߂�
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 - 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then '�ꃖ���O
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
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
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
' �@ ���[�p�f�[�^�쐬
'***********************************************************************************************************
Public Function gfncblnMakPrintDat() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim j                 As Long
 Dim intKyuuyoCNT      As Integer
 Const cnsMaxRec       As Long = 200  '���ŏo�͂���ő�s�� '''''
 Const cnslngAryCnt    As Long = 100   '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���
 Dim OraPArray_01      As Object       '01 --���^�^�ܗ^����t���O�z��
 Dim OraPArray_02      As Object       '02 --�y�[�W�敪�z��
 Dim OraPArray_03      As Object       '03 --�s�敪�z��
 Dim OraPArray_04      As Object       '04 --�Z���z�z��
 Dim OraPArray_05      As Object       '05 --�x��06�z��
 Dim OraPArray_06      As Object       '06 --�x��12�z��
 Dim OraPArray_07      As Object       '07 --�x��18�z��
 Dim OraPArray_08      As Object       '08 --�x��24�z��
 Dim OraPArray_09      As Object       '09 --�x��30�z��
 Dim OraPArray_10      As Object       '10 --�x��36�z��
 Dim OraPArray_11      As Object       '11 --�x��42�z��
 Dim OraPArray_12      As Object       '12 --�x��48�z��
 Dim OraPArray_13      As Object       '13 --�x��54�z��
 Dim OraPArray_14      As Object       '14 --�x��60�z��
 Dim OraPArray_15      As Object       '15 --����ܗ^���z��
 Dim OraPArray_16      As Object       '16 --�V�[�P���X�ԍ�
 
 Dim StrYuusiYMDWK     As String

On Error GoTo ErrgfncblnMakPrintDat

    gfncblnMakPrintDat = False

    '�r�o�p�p�����[�^�[�Z�b�g
    '�z�񌏐�
    odbDatabase.Parameters.Add "InNumAryCount", UBound(gstrKyuuyoAry) + UBound(gstrSyouyoAry), ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    '�R���s���[�^�[��
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2
    '�Z���N����
    StrYuusiYMDWK = Trim$(frmQPAV_CEnt120.txtDateY_Fr.Text) & "/" & Trim$(frmQPAV_CEnt120.txtDateM_Fr.Text) & "/" & Trim$(frmQPAV_CEnt120.txtDateD_Fr.Text)
    odbDatabase.Parameters.Add "InStrYuushiDate", StrYuusiYMDWK, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYuushiDate").ServerType = ORATYPE_VARCHAR2
    '����
    odbDatabase.Parameters.Add "InStrRiritu", Trim$(frmQPAV_CEnt120.txtRiritu(0).Text) & "." & Trim$(frmQPAV_CEnt120.txtRiritu(1).Text), ORAPARM_INPUT
        odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_VARCHAR2
    
    '01 ���^�^�ܗ^����t���O�z��
              odbDatabase.Parameters.AddTable "InStrKSKbnAry", ORAPARM_INPUT, ORATYPE_CHAR, cnsMaxRec, 1
    Set OraPArray_01 = odbDatabase.Parameters("InStrKSKbnAry")
    '02 �y�[�W�敪�z��
              odbDatabase.Parameters.AddTable "InNumPageKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 1
    Set OraPArray_02 = odbDatabase.Parameters("InNumPageKBNAry")
    '03 �s�敪�z��
              odbDatabase.Parameters.AddTable "InNumGyouKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_03 = odbDatabase.Parameters("InNumGyouKBNAry")
    '04 �Z���z�z��
              odbDatabase.Parameters.AddTable "InNumYuusigakuAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_04 = odbDatabase.Parameters("InNumYuusigakuAry")
    '05 �x��06�z��
              odbDatabase.Parameters.AddTable "InNumShiharai06Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_05 = odbDatabase.Parameters("InNumShiharai06Ary")
    '06 �x��12�z��
              odbDatabase.Parameters.AddTable "InNumShiharai12Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_06 = odbDatabase.Parameters("InNumShiharai12Ary")
    '07 �x��18�z��
              odbDatabase.Parameters.AddTable "InNumShiharai18Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_07 = odbDatabase.Parameters("InNumShiharai18Ary")
    '08 �x��24�z��
              odbDatabase.Parameters.AddTable "InNumShiharai24Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_08 = odbDatabase.Parameters("InNumShiharai24Ary")
    '09 �x��30�z��
              odbDatabase.Parameters.AddTable "InNumShiharai30Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_09 = odbDatabase.Parameters("InNumShiharai30Ary")
    '10 �x��36�z��
              odbDatabase.Parameters.AddTable "InNumShiharai36Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_10 = odbDatabase.Parameters("InNumShiharai36Ary")
    '11 �x��42�z��
              odbDatabase.Parameters.AddTable "InNumShiharai42Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_11 = odbDatabase.Parameters("InNumShiharai42Ary")
    '12 �x��48�z��
              odbDatabase.Parameters.AddTable "InNumShiharai48Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_12 = odbDatabase.Parameters("InNumShiharai48Ary")
    '13 �x��54�z��
              odbDatabase.Parameters.AddTable "InNumShiharai54Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_13 = odbDatabase.Parameters("InNumShiharai54Ary")
    '14 �x��60�z��
              odbDatabase.Parameters.AddTable "InNumShiharai60Ary", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_14 = odbDatabase.Parameters("InNumShiharai60Ary")
    '15 ����ܗ^��
              odbDatabase.Parameters.AddTable "InStrJikaiSyouyoAry", ORAPARM_INPUT, ORATYPE_CHAR, cnsMaxRec, 2
    Set OraPArray_15 = odbDatabase.Parameters("InStrJikaiSyouyoAry")
        
    '16 �V�[�P���X�ԍ�
              odbDatabase.Parameters.AddTable "InNumSeqNoAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 3
    Set OraPArray_16 = odbDatabase.Parameters("InNumSeqNoAry")
        
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintAdd("
    strSQL = strSQL & " :InNumAryCount"              '�z�񌏐�
    strSQL = strSQL & ",:InStrCOMPUTERMEI"           '�R���s���[�^��
    strSQL = strSQL & ",:InStrYuushiDate"            '�Z����
    strSQL = strSQL & ",:InStrRiritu"                '����
    strSQL = strSQL & ",:InStrKSKbnAry"              '���^�^�ܗ^����t���O�z��
    strSQL = strSQL & ",:InNumPageKBNAry"            '�y�[�W�敪�z��
    strSQL = strSQL & ",:InNumGyouKBNAry"            '�s�敪�z��
    strSQL = strSQL & ",:InNumYuusigakuAry"          '�Z���z�z��
    strSQL = strSQL & ",:InNumShiharai06Ary"         '�x��06�z��
    strSQL = strSQL & ",:InNumShiharai12Ary"         '�x��12�z��
    strSQL = strSQL & ",:InNumShiharai18Ary"         '�x��18�z��
    strSQL = strSQL & ",:InNumShiharai24Ary"         '�x��24�z��
    strSQL = strSQL & ",:InNumShiharai30Ary"         '�x��30�z��
    strSQL = strSQL & ",:InNumShiharai36Ary"         '�x��36�z��
    strSQL = strSQL & ",:InNumShiharai42Ary"         '�x��42�z��
    strSQL = strSQL & ",:InNumShiharai48Ary"         '�x��48�z��
    strSQL = strSQL & ",:InNumShiharai54Ary"         '�x��54�z��
    strSQL = strSQL & ",:InNumShiharai60Ary"         '�x��60�z��
    strSQL = strSQL & ",:InStrJikaiSyouyoAry"        '����ܗ^��
    strSQL = strSQL & ",:InNumSeqNoAry); END;"       '�V�[�P���X�ԍ�
 
    i = 1
    
    Do Until i > UBound(gstrKyuuyoAry)
        For j = 1 To cnsMaxRec '
            If i > UBound(gstrKyuuyoAry) Then
                Exit For
            End If
            With gstrKyuuyoAry(i)
                OraPArray_01.Put_value "0", (j - 1)                   '01 ���^�^�ܗ^����t���O�z�� 0=���^
                OraPArray_02.Put_value CLng(.intPageKbn), (j - 1)       '02 �y�[�W�敪
                OraPArray_03.Put_value CLng(.intGyoKbn), (j - 1)       '03 �s�敪
                
                If .strYuusigaku = " " Then                         '04 �Z���z�z��
                    OraPArray_04.Put_value Null, (j - 1)
                Else
                    OraPArray_04.Put_value CLng(.strYuusigaku), (j - 1)
                End If

                If .str06Month = " " Then                             '05 �x��06�z��
                    OraPArray_05.Put_value Null, (j - 1)
                Else
                    OraPArray_05.Put_value CLng(.str06Month), (j - 1)
                End If
                
                If .str12Month = " " Then                             '06 �x��12�z��
                    OraPArray_06.Put_value Null, (j - 1)
                Else
                    OraPArray_06.Put_value CLng(.str12Month), (j - 1)
                End If
                
                If .str18Month = " " Then                             '07 �x��18�z��
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.str18Month), (j - 1)
                End If
                
                If .str24Month = " " Then                             '08 �x��24�z��
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.str24Month), (j - 1)
                End If
                
                If .str30Month = " " Then                             '09 �x��30�z��
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.str30Month), (j - 1)
                End If

                If .str36Month = " " Then                             '10 �x��36�z��
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.str36Month), (j - 1)
                End If

                If .str42Month = " " Then                             '11 �x��42�z��
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.str42Month), (j - 1)
                End If

                If .str48Month = " " Then                             '12 �x��48�z��
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.str48Month), (j - 1)
                End If

                If .str54Month = " " Then                             '13 �x��54�z��
                    OraPArray_13.Put_value Null, (j - 1)
                Else
                    OraPArray_13.Put_value CLng(.str54Month), (j - 1)
                End If

                If .str60Month = " " Then                             '14 �x��60�z��
                    OraPArray_14.Put_value Null, (j - 1)
                Else
                    OraPArray_14.Put_value CLng(.str60Month), (j - 1)
                End If
                
                OraPArray_15.Put_value " ", (j - 1)                            '15 ����ܗ^���z��
                
                OraPArray_16.Put_value CLng(j - 1), (j - 1)                      '16 �V�[�P���X�ԍ�
                
                
            End With
            i = i + 1
            intKyuuyoCNT = i
        Next j
        
'        '�z�񌏐��̒l�Z�b�g
'        odbDatabase.Parameters("InNumAryCount").Value = j - 1
'        '�r�p�k���̎��s
'        odbDatabase.DbexecuteSQL (strSQL)
    Loop

    i = 1
    j = j + 1
    
    '�ܗ^

    
    Do Until i > UBound(gstrSyouyoAry)
        For j = intKyuuyoCNT To cnsMaxRec '
            If i > UBound(gstrSyouyoAry) Then
                Exit For
            End If
            With gstrSyouyoAry(i)
                OraPArray_01.Put_value "1", (j - 1)                                    '01 ���^�^�ܗ^����t���O�z�� 1=�ܗ^
                OraPArray_02.Put_value CLng(.intPageKbn), (j - 1)      '02 �y�[�W�敪
                OraPArray_03.Put_value CLng(.intGyoKbn), (j - 1)       '03 �s�敪
                
                If .strYuusigaku = " " Then                         '04 �Z���z�z��
                    OraPArray_04.Put_value Null, (j - 1)
                Else
                    OraPArray_04.Put_value CLng(.strYuusigaku), (j - 1)
                End If

                If .str06Kai = " " Then                                '05 �x��06�z��
                    OraPArray_05.Put_value Null, (j - 1)
                Else
                    OraPArray_05.Put_value CLng(.str06Kai), (j - 1)
                End If
                
                If .str12Kai = " " Then                             '06 �x��12�z��
                    OraPArray_06.Put_value Null, (j - 1)
                Else
                    OraPArray_06.Put_value CLng(.str12Kai), (j - 1)
                End If
                
                If .str18Kai = " " Then                             '07 �x��18�z��
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.str18Kai), (j - 1)
                End If
                
                If .str24Kai = " " Then                             '08 �x��24�z��
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.str24Kai), (j - 1)
                End If
                
                If .str30Kai = " " Then                             '09 �x��30�z��
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.str30Kai), (j - 1)
                End If

                If .str36Kai = " " Then                             '10 �x��36�z��
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.str36Kai), (j - 1)
                End If

                If .str42Kai = " " Then                             '11 �x��42�z��
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.str42Kai), (j - 1)
                End If

                If .str48Kai = " " Then                             '12 �x��48�z��
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.str48Kai), (j - 1)
                End If

                If .str54Kai = " " Then                             '13 �x��54�z��
                    OraPArray_13.Put_value Null, (j - 1)
                Else
                    OraPArray_13.Put_value CLng(.str54Kai), (j - 1)
                End If

                If .str60Kai = " " Then                             '14 �x��60�z��
                    OraPArray_14.Put_value Null, (j - 1)
                Else
                    OraPArray_14.Put_value CLng(.str60Kai), (j - 1)
                End If
                
                OraPArray_15.Put_value .strJikaiSyouyo, (j - 1)       '15 ����ܗ^���z��
                                
                OraPArray_16.Put_value (j - 1), (j - 1)                        '16 �V�[�P���X�ԍ�
                
            End With
            i = i + 1
        Next j
        
        '�z�񌏐��̒l�Z�b�g
        odbDatabase.Parameters("InNumAryCount").Value = j - 1
        
        '�r�p�k���̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
    Loop
 
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfncblnMakPrintDat = True

    Exit Function

ErrgfncblnMakPrintDat:
'�װ����
    
    '�װү���ޕ\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************************************
' �@ ���[�p�f�[�^�폜
'***********************************************************************************************************
Public Function gfncblnDelPrintDat() As Boolean
 Dim strSQL            As String

On Error GoTo ErrgfncblnDelPrintDat

    gfncblnDelPrintDat = False

    '�R���s���[�^�[��
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2

             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintDel("
    strSQL = strSQL & ":InStrCOMPUTERMEI); END;" '�R���s���[�^��

    '�r�p�k���̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfncblnDelPrintDat = True

    Exit Function

ErrgfncblnDelPrintDat:
'�װ����
    
    '�װү���ޕ\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)

End Function

