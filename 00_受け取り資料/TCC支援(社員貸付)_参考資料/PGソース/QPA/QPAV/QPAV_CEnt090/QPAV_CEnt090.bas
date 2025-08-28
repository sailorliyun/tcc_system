Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt090"
    Public blnLoadFlg           As Boolean
    Public Act_Row              As Long
    
    Public gstrBonusYMD1        As String
    Public gstrBonusYMD2        As String
    Public gstrKyuyoZen         As String
    Public gstrSyoyoZen         As String
    Public gstrKyuyoZen1        As String
    Public gstrSyoyoZen1        As String
    Public gstrKyuyoZen2        As String
    Public gstrSyoyoZen2        As String
    Public gstrZanYMD           As String
    
    Public gstrCode1            As String
    Public gstrCode2            As String
    Public gstrYusiYMD          As String
    Public gstrSeiYMD           As String
    Public glngNyukin           As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
    Public glngRisoku           As Long '���Z���z�̂����̗����̋��z(glngNyukin - glngRisoku = ���{)
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    Type KeisanTbl
        YusiYMD                 As String
        Riritu                  As Double
        Kaisu                   As Integer
        KyuyoYusi               As Long
        SyoyoYusi               As Long
        KyuyoZan                As Long
        SyoyoZan                As Long
        KansaiYMD               As String
        KyuyoHen                As Long
        SyoyoHen                As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
        KyuyoMod                As Long     '���^�c��(����߂���)
        SyoyoMod                As Long     '�ܗ^�c��(����߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
    End Type
    
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 
    Public gstrSysDate             As String          '�V�X�e�����t
    Public gdatSysDate             As Date            '�V�X�e�����t

'10/24 ADD
    Public Const gstrSysChgYMD = "2000/03/01"
    Public Const gstrSysChgYMD2 = "2001/11/01"

'2005/01/26 ADD
'�R�[�h�e�[�u��
Type CodeTbl
   CodeNo   As String
   Meisyou  As String
End Type
 
Public gstrCdT_Hakkoubi         As String       '���s��
Public gtblCdT_Hakkousya()      As CodeTbl      '���s�ҏ�� �z��
Public gstrCdT_LoanNm           As String       '���[������

Public glngCdT_HakkoubiCnt      As Long         '���s���̌���
Public glngCdT_HakkousyaCnt     As Long         '���s�ҏ��̔z��̌���
Public glngCdT_LoanNmCnt        As Long         '���[�����̂̌���









'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�؏��ݕt�������͂͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt090.Show
 
End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@�Ј������擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�Ј������擾�r�o���g�p���A�Ј����������擾����
'*********************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errSeachSyain

    gfuncSeachSyain = False
    
    '�Ј������擾 �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrCode1, ORAPARM_INPUT    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode2, ORAPARM_INPUT    '�Ј��R�[�h�Q
        '�����J�i
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '��������
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '�����X�R�[�h
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '�����X��
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '�����敪
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '��������R�[�h
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '�������喼
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '���i�R�[�h
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '�����R�[�h
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '���N����
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
    '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '��ʂɕ\��
    frmQPAV_CEnt090.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt090.lblShimei.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt090.lblShozoku(0).Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt090.lblShozoku(1).Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt090.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt090.lblBumon(0).Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt090.lblBumon(1).Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt090.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt090.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
    '���N�����ҏW
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '���N����
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt090.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt090.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSeachSyain = True

    Exit Function
    
errSeachSyain:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim Month_WORK           As String

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    gfuncSPSet = False

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt090.sprList)
    frmQPAV_CEnt090.sprList.ReDraw = False
    frmQPAV_CEnt090.sprList.MaxRows = 0
    
    '�r�o
    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    
    '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER

    '�J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER

    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2

    '�ܗ^�x�����P
    odbDatabase.Parameters.Add "OtStrBonus1", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBonus1").ServerType = ORATYPE_CHAR
   
    '�ܗ^�x�����Q
    odbDatabase.Parameters.Add "OtStrBonus2", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBonus2").ServerType = ORATYPE_CHAR

    '�c���X�V��
    odbDatabase.Parameters.Add "OtStrZanYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZanYMD").ServerType = ORATYPE_CHAR

    '�Z���� �z��
    odbDatabase.Parameters.AddTable "OtStrYusiYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8

    '���� �z��
    odbDatabase.Parameters.AddTable "OtNumRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�� �z��
    odbDatabase.Parameters.AddTable "OtNumKaisu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�Z���z �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoYusi", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�Z���z �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoYusi", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�ԍϊz �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoHen", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�ԍϊz �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoHen", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�c�� �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoZan", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c�� �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoZan", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '���^�c��(����߂���) �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c��(����߂���) �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    '���ϓ� �z��
    odbDatabase.Parameters.AddTable "OtStrKansaiYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090SelList ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrBonus1,"
    strSQL = strSQL & ":OtStrBonus2,"
    strSQL = strSQL & ":OtStrZanYMD,"
    strSQL = strSQL & ":OtStrYusiYMD,"
    strSQL = strSQL & ":OtNumRiritu,"
    strSQL = strSQL & ":OtNumKaisu,"
    strSQL = strSQL & ":OtNumKyuyoYusi,"
    strSQL = strSQL & ":OtNumSyoyoYusi,"
    strSQL = strSQL & ":OtNumKyuyoHen,"
    strSQL = strSQL & ":OtNumSyoyoHen,"
    strSQL = strSQL & ":OtNumKyuyoZan,"
    strSQL = strSQL & ":OtNumSyoyoZan,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":OtNumKyuyoMod,"
    strSQL = strSQL & ":OtNumSyoyoMod,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":OtStrKansaiYMD"
    strSQL = strSQL & "); END;"

    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)

        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblKeisan
            glngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt090.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt090.txtSyainCd1.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
            '���o�������e��\������
            gstrBonusYMD1 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus1"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus1"), 3, 2)
            gstrBonusYMD2 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus2"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus2"), 3, 2)
            If DateDiff("y", gstrBonusYMD1, gstrBonusYMD2) < 0 Then
                Month_WORK = gstrBonusYMD2
                gstrBonusYMD2 = gstrBonusYMD1
                gstrBonusYMD1 = Month_WORK
            End If
            If Trim(odbDatabase.Parameters("OtStrZanYMD")) = "" Then
                gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
            Else
                gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)     '�c���X�V��
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKeisan(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            gtblKeisan(i).YusiYMD = odbDatabase.Parameters("OtStrYusiYMD").Get_Value(g)
            gtblKeisan(i).Riritu = odbDatabase.Parameters("OtNumRiritu").Get_Value(g)
            gtblKeisan(i).Kaisu = odbDatabase.Parameters("OtNumKaisu").Get_Value(g)
            gtblKeisan(i).KyuyoYusi = odbDatabase.Parameters("OtNumKyuyoYusi").Get_Value(g)
            gtblKeisan(i).SyoyoYusi = odbDatabase.Parameters("OtNumSyoyoYusi").Get_Value(g)
            gtblKeisan(i).KyuyoHen = odbDatabase.Parameters("OtNumKyuyoHen").Get_Value(g)
            gtblKeisan(i).SyoyoHen = odbDatabase.Parameters("OtNumSyoyoHen").Get_Value(g)
            gtblKeisan(i).KyuyoZan = odbDatabase.Parameters("OtNumKyuyoZan").Get_Value(g)
            gtblKeisan(i).SyoyoZan = odbDatabase.Parameters("OtNumSyoyoZan").Get_Value(g)
'ADD 20100225 0908047 NBC YOKOYAMA START
            gtblKeisan(i).KyuyoMod = odbDatabase.Parameters("OtNumKyuyoMod").Get_Value(g)   '���^�c��(����߂���)
            gtblKeisan(i).SyoyoMod = odbDatabase.Parameters("OtNumSyoyoMod").Get_Value(g)   '�ܗ^�c��(����߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
            gtblKeisan(i).KansaiYMD = odbDatabase.Parameters("OtStrKansaiYMD").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '��ʂɕ\��
    Call SpreadSet
    frmQPAV_CEnt090.sprList.ReDraw = True
    
    '���͐��䏈��
    For i = 0 To 2
        frmQPAV_CEnt090.cmdExec(i).Enabled = True
    Next i
    frmQPAV_CEnt090.cmdPFK(5).Enabled = False
    
    frmQPAV_CEnt090.cmdName.Enabled = False
    frmQPAV_CEnt090.txtSyainCd1.Enabled = False
    frmQPAV_CEnt090.txtSyainCd2.Enabled = False
    
    '2005/01/25 From ���ϒʒm���Ή�
    frmQPAV_CEnt090.cmdPrint.Enabled = True
    '2005/01/25 To   ���ϒʒm���Ή�
    
    gfuncSPSet = True
    Exit Function

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Sub SpreadSet()

    Dim i                   As Integer
    Dim KyuyoZenYMD_WORK    As String
    Dim SyoyoZenYMD_WORK    As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    
    Dim YusiYMD_WORK        As String
    Dim KyuyoZan_Work       As Long
    Dim SyoyoZan_Work       As Long
    
    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt090.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        '************************************
        '���^�O��ԍϓ��A�ܗ^�O��ԍϓ������߂�
        '************************************
        YusiYMD_WORK = Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2)
        KyuyoZan_Work = gtblKeisan(i).KyuyoZan
        SyoyoZan_Work = gtblKeisan(i).SyoyoZan
        If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(gdatSysDate, "yyyy/mm/01"))) < 0 Then
            KyuyoZenYMD_WORK = ""
        Else
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                KyuyoZenYMD_WORK = Format$(gdatSysDate, "yyyy/mm/25")
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, gdatSysDate), "yyyy/mm/25")
            End If
        End If
        '* ���^�̑O��ԍϓ��̕\���̕s��̑Ή�
        If Val(Format(KyuyoZenYMD_WORK, "yyyymm")) = Val(Format(YusiYMD_WORK, "yyyymm")) Then
            KyuyoZenYMD_WORK = ""
        End If
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            SyoyoZenYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            SyoyoZenYMD_WORK = gstrBonusYMD1
        Else
            SyoyoZenYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
            SyoyoZenYMD_WORK = ""
        End If
        gstrKyuyoZen1 = IIf(KyuyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), KyuyoZenYMD_WORK)
        gstrSyoyoZen1 = IIf(SyoyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), SyoyoZenYMD_WORK)
        If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(gdatSysDate, "yyyy/mm/01"))) < 0 Then
            KyuyoZenYMD_WORK = ""
        Else
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                KyuyoZenYMD_WORK = Format$(gdatSysDate, "yyyy/mm/25")
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, gdatSysDate), "yyyy/mm/25")
            End If
        End If
        '* ���^�̑O��ԍϓ��̕\���̕s��̑Ή�
        If Val(Format(KyuyoZenYMD_WORK, "yyyymm")) = Val(Format(YusiYMD_WORK, "yyyymm")) Then
            KyuyoZenYMD_WORK = ""
        End If
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            SyoyoZenYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            SyoyoZenYMD_WORK = gstrBonusYMD1
        Else
            SyoyoZenYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
            SyoyoZenYMD_WORK = ""
        End If
        gstrKyuyoZen2 = IIf(IsNull(KyuyoZenYMD_WORK), Null, KyuyoZenYMD_WORK)
        gstrSyoyoZen2 = IIf(IsNull(SyoyoZenYMD_WORK), Null, SyoyoZenYMD_WORK)
        
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 1, i, Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 2, i, Format(gtblKeisan(i).Riritu, "#0.00") & "%")
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 3, i, Format(gtblKeisan(i).Kaisu, "#0") & "��")
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 4, i, Format(gtblKeisan(i).KyuyoYusi + gtblKeisan(i).SyoyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 5, i, Format(gtblKeisan(i).KyuyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt090.sprList, 6, i, Format(gtblKeisan(i).SyoyoYusi, "#,##0"))
        If Trim(gtblKeisan(i).KansaiYMD) <> "" Then
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, 0)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 10, i, Left(gtblKeisan(i).KansaiYMD, 4) & "/" & Mid(gtblKeisan(i).KansaiYMD, 5, 2) & "/" & Right(gtblKeisan(i).KansaiYMD, 2))
'ADD 20100225 0908047 NBC YOKOYAMA START
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 11, i, 0)   '���^�c��(�ʏ핪)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 12, i, 0)   '�ܗ^�c��(�ʏ핪)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 13, i, 0)   '���^�c��(����߂���)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 14, i, 0)   '�ܗ^�c��(����߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
        Else
'MOD 20100225 0908047 NBC YOKOYAMA START
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).SyoyoZan, "#,##0"))
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
'            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
            '�c���@�y���^�c��(�ʏ핪)�{���^�c��(����߂���)�{�ܗ^�c��(�ʏ핪)�{�ܗ^�c��(����߂���)�z
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod + gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
            '���^�c���@�y���^�c��(�ʏ핪)�{���^�c��(����߂���)�z
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 8, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod, "#,##0"))
            '�ܗ^�c���@�y�ܗ^�c��(�ʏ핪)�{�ܗ^�c��(����߂���)�z
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 9, i, Format(gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
'MOD 20100225 0908047 NBC YOKOYAMA END
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 10, i, "")
'ADD 20100225 0908047 NBC YOKOYAMA START
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 11, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))   '���^�c��(�ʏ핪)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 12, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))   '�ܗ^�c��(�ʏ핪)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 13, i, Format(gtblKeisan(i).KyuyoMod, "#,##0"))   '���^�c��(����߂���)
            Call gsubSetCellText(frmQPAV_CEnt090.sprList, 14, i, Format(gtblKeisan(i).SyoyoMod, "#,##0"))   '�ܗ^�c��(����߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
        End If
        gstrKyuyoZen = KyuyoZenYMD_WORK
        gstrSyoyoZen = SyoyoZenYMD_WORK
    Next i

End Sub

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '�Z����
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrSeiYMD, ORAPARM_INPUT              '������
'MOD 20100225 0908047 NBC YOKOYAMA START
    'odbDatabase.Parameters.Add "InNumNyukin", glngNyukin, ORAPARM_INPUT                 '�����z
    odbDatabase.Parameters.Add "InNumNyukin", glngNyukin - glngRisoku, ORAPARM_INPUT    '�����z(���Z���z�|����)
'MOD 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
    odbDatabase.Parameters.Add "InNumRisoku", glngRisoku, ORAPARM_INPUT                 '����
'ADD 20100225 0908047 NBC YOKOYAMA END
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatAdd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrNyukinYMD,"
    strSQL = strSQL & ":InNumNyukin,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":InNumRisoku,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPAdd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPAdd = True    '����
    Exit Function
  
errSPAdd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPUpd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPUpd
    
    gfuncSPUpd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '�Z����
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrSeiYMD, ORAPARM_INPUT              '������
'MOD 20100225 0908047 NBC YOKOYAMA START
    'odbDatabase.Parameters.Add "InNumNyukin", glngNyukin, ORAPARM_INPUT                 '�����z
    odbDatabase.Parameters.Add "InNumNyukin", glngNyukin - glngRisoku, ORAPARM_INPUT    '�����z(���Z���z�|����)
'MOD 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
    odbDatabase.Parameters.Add "InNumRisoku", glngRisoku, ORAPARM_INPUT                 '����
'ADD 20100225 0908047 NBC YOKOYAMA END
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatUpd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrNyukinYMD,"
    strSQL = strSQL & ":InNumNyukin,"
'ADD 20100225 0908047 NBC YOKOYAMA START
    strSQL = strSQL & ":InNumRisoku,"
'ADD 20100225 0908047 NBC YOKOYAMA END
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPUpd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPUpd = True    '����
    Exit Function
  
errSPUpd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPDel() As Boolean

    Dim strSQL               As String

On Error GoTo errSPDel
    
    gfuncSPDel = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '�Z����
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090DatDel ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InstrMenuID,"
    strSQL = strSQL & ":InstrModuleID,"
    strSQL = strSQL & ":InstrUserID,"
    strSQL = strSQL & ":InstrComputerNM,"
    strSQL = strSQL & ":InstrTozaiKBN,"
    strSQL = strSQL & ":InstrBushoCD,"
    strSQL = strSQL & ":InstrTantoNM"
    strSQL = strSQL & "); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPDel
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True    '����
    Exit Function
  
errSPDel:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   �r������i���b�N�j
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "strSikibetu", "090", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode1, ORAPARM_INPUT                '�L�[�R�[�h�P
    odbDatabase.Parameters.Add "InStrKeyInfo2", gstrCode2, ORAPARM_INPUT                '�L�[�R�[�h�Q
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090Lock(" & _
             ":strSikibetu,:InStrKeyInfo1,:InStrKeyInfo2,:strProgramID,:strComputerNM,:strOperatorID); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    gblnHaita_Lock = True
    
    Exit Function
    
errgblnHaita:
'�G���[����
    
    '�r���������G���[���b�Z�[�W�\��
    If odbDatabase.LastServerErr >= 20000 Then   'Msg = ���̒[���ŏ������ł��B�ēx���s���ĉ�����
        frmQPAV_CEnt090.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
        odbDatabase.LastServerErrReset                      '�װؾ��
        
'        gblnHaita_Lock = True
    Else
        '�G���[���b�Z�[�W�\��
       Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                              gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    End If
                           
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Sub gblnHaita_Unlock()
'*****************************************************************************************
'   �r������i�����j
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgsubUnLock

    odbDatabase.Parameters.Add "strSikibetu", "090", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt090PkG.QPAP_CEnt090UnLock(" _
           & ":strSikibetu,:strComputerNM);END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errgsubUnLock:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

'************************************************************************
'    �T�[�o�[���t�擾
'************************************************************************
Public Sub gsubGetSysDate()
Dim strSQL               As String

On Error GoTo errGetSysDate
    '�r�o
    '�V�X�e�����t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_CHAR
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt000PkG.QPAP_CEnt000SysDate(" & _
             ":OtStrSysDate); END;"
    'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    gstrSysDate = Trim$(odbDatabase.Parameters("OtStrSysDate"))
    gdatSysDate = CDate(Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2) & "/" & Mid$(gstrSysDate, 7, 2))

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    Exit Sub

errGetSysDate:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub





'2005/01/26 ADD
'************************************************************************
'   �������� �i�R�[�h���̎擾�j
'        �R�[�h�e�[�u�����R�[�h���̂��擾���z��Ɋi�[
'************************************************************************
Public Sub gsubGetCode()
    Dim strSQL               As String
    Dim i                    As Long
       
    Dim strWkAry             As String
       
    Const cnslngAryLen       As Long = 100   '�z��̍ő包��
    Const cnsMaxRec          As Long = 100   '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���
    '---------------------------------------------------

On Error GoTo gsubGetCode_ERR


    '�r�o
    '���s���̎擾����
    odbDatabase.Parameters.Add "OtNumDP4Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP4Count").ServerType = ORATYPE_NUMBER
    '���s���̔z��
    odbDatabase.Parameters.AddTable "OtStrDP4Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    '���s�ҏ��̎擾����
    odbDatabase.Parameters.Add "OtNumDP5Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP5Count").ServerType = ORATYPE_NUMBER
    '���s�ҏ�񖼏̂̔z��
    odbDatabase.Parameters.AddTable "OtStrDP5Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    '���[�����̂̎擾����
    odbDatabase.Parameters.Add "OtNumDP6Count", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumDP6Count").ServerType = ORATYPE_NUMBER
    '���[�����̂̔z��
    odbDatabase.Parameters.AddTable "OtStrDP6Ary", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, cnslngAryLen
    
    '�r�p�k���̍쐬
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090Init("
    strSQL = strSQL & ":OtNumDP4Count,"
    strSQL = strSQL & ":OtStrDP4Ary,"
    strSQL = strSQL & ":OtNumDP5Count,"
    strSQL = strSQL & ":OtStrDP5Ary,"
    strSQL = strSQL & ":OtNumDP6Count,"
    strSQL = strSQL & ":OtStrDP6Ary); END;"

     'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    
    '������ ���s�����i�[ ������
    gstrCdT_Hakkoubi = ""
    glngCdT_HakkoubiCnt = odbDatabase.Parameters("OtNumDP4Count")
    If glngCdT_HakkoubiCnt > 0 Then
        strWkAry = odbDatabase.Parameters("OtStrDP4Ary").Get_Value(0)
        gstrCdT_Hakkoubi = Trim$(gfncstrDlm2(strWkAry, 2))
    End If
    
    '������ ���s�ҏ���z��Ɋi�[ ������
    glngCdT_HakkousyaCnt = odbDatabase.Parameters("OtNumDP5Count")
    If glngCdT_HakkousyaCnt > 0 Then
        ReDim gtblCdT_Hakkousya(1 To glngCdT_HakkousyaCnt)
        For i = 1 To glngCdT_HakkousyaCnt
            strWkAry = odbDatabase.Parameters("OtStrDP5Ary").Get_Value(i - 1)
            '���s�ҏ��
            gtblCdT_Hakkousya(i).CodeNo = Trim$(gfncstrDlm2(strWkAry, 1))
            gtblCdT_Hakkousya(i).Meisyou = Trim$(gfncstrDlm2(strWkAry, 2))
        Next i
    End If
   
    '������ ���[�����̂��i�[ ������
    gstrCdT_LoanNm = ""
    glngCdT_LoanNmCnt = odbDatabase.Parameters("OtNumDP6Count")
    If glngCdT_LoanNmCnt > 0 Then
        strWkAry = odbDatabase.Parameters("OtStrDP6Ary").Get_Value(0)
        gstrCdT_LoanNm = Trim$(gfncstrDlm2(strWkAry, 2))
    End If
   
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    Exit Sub

gsubGetCode_ERR:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

























