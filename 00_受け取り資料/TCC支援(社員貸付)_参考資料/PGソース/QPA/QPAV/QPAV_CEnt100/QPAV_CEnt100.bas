Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           ����߂��Ή��A�ԑ����z�̎Z�o���@�C��
'----------------------------------------------------------------------------------------------

    Public Const gstrSysChgYMD = "2000/03/01"
    Public Const gcstrPrjName = "QPAV_CEnt100"
    Public blnLoadFlg           As Boolean
    Public glngSprCol           As Long
    Public gstrCode1            As String
    Public gstrCode2            As String
    Public gstrBonusYMD1        As String
    Public gstrBonusYMD2        As String
    Public gstrKyuyoZen1        As String
    Public gstrSyoyoZen1        As String
    Public gstrKyuyoZen2        As String
    Public gstrSyoyoZen2        As String
    Public gstrName             As String
    Public gstrMise             As String
    Public gstrYusiYMD          As String
    Public gstrSeiYMD           As String
    Public gstrTenKBN           As String
    Public gstrKyuyoKBN         As String
    Public gstrSyoyoKBN         As String
    Public glngKyuyoYusi        As Long
    Public glngSyoyoYusi        As Long
    Public glngKyuyoZan         As Long
    Public glngSyoyoZan         As Long
    Public gstrKyuyoStYMD       As String
    Public gstrSyoyoStYMD       As String
    Public gdblRiritu           As Double
    Public glngKyuyoRisoku      As Long
    Public glngSyoyoRisoku      As Long
    Public glngKyuyoTen         As Long
    Public glngSyoyoTen         As Long
    Public gstrZanYMD           As String
    Public gintKyuyoNisu        As Integer
    Public gintSyoyoNisu        As Integer

    Type KeisanTbl
        YusiYMD                 As String
        Riritu                  As Double
        Kaisu                   As Integer
        KyuyoYusi               As Long
        SyoyoYusi               As Long
        KyuyoHen                As Long
        SyoyoHen                As Long
        KyuyoZan                As Long
        SyoyoZan                As Long
'ADD 20100225 0908047 NBC SAWAME START
        KyuyoMod                As Long
        SyoyoMod                As Long
        KyuyoModRisoku          As Long
        SyoyoModRisoku          As Long
        KyuyoModAll             As Long
        SyoyoModAll             As Long
        KyuyoModRisokuAll       As Long
        SyoyoModRisokuAll       As Long
'ADD 20100225 0908047 NBC SAWAME END
    End Type
 
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'10/24 ADD
    Public Const gstrSysChgYMD2 = "2001/11/01"

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�l�ݕt���ׂ͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt100.Show 1
 
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

    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100SelSyainZoku(" & _
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
    frmQPAV_CEnt100.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt100.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt100.lblShozoku(0).Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt100.lblShozoku(1).Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt100.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt100.lblBumon(0).Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt100.lblBumon(1).Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt100.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt100.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
    '���N�����ҏW
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '���N����
    If IsNull(odbDatabase.Parameters("OtStrBornYMD").Value) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
  
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt100.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt100.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim Month_WORK           As String

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt100.sprList)
    frmQPAV_CEnt100.sprList.ReDraw = False
    frmQPAV_CEnt100.sprList.MaxRows = 0
    
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
    
'ADD 20100225 0908047 NBC SAWAME START
    '���^�c���i����߂������{(sysdate�ȑO)�j �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c���i����߂������{(sysdate�ȑO)�j �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�c���i����߂�������(sysdate�ȑO)�j �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoModRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c���i����߂�������(sysdate�ȑO)�j �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoModRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�c���i����߂������{(�S��)�j �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoModAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c���i����߂������{(�S��)�j �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoModAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���^�c���i����߂�������(�S��)�j �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyoModRisokuAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�c���i����߂�������(�S��)�j �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyoModRisokuAll", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

'ADD 20100225 0908047 NBC SAWAME END
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100SelList ("
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
'MOD 20100225 0908047 NBC SAWAME START
'    strSQL = strSQL & ":OtNumSyoyoZan"
    strSQL = strSQL & ":OtNumSyoyoZan,"
    strSQL = strSQL & ":OtNumKyuyoMod,"
    strSQL = strSQL & ":OtNumSyoyoMod,"
    strSQL = strSQL & ":OtNumKyuyoModRisoku,"
    strSQL = strSQL & ":OtNumSyoyoModRisoku,"
    strSQL = strSQL & ":OtNumKyuyoModAll,"
    strSQL = strSQL & ":OtNumSyoyoModAll,"
    strSQL = strSQL & ":OtNumKyuyoModRisokuAll,"
    strSQL = strSQL & ":OtNumSyoyoModRisokuAll"
'MOD 20100225 0908047 NBC SAWAME END
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
                frmQPAV_CEnt100.lblkasituke.Caption = "0"
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt100.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt100.txtSyainCD1.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
            '���o�������e��\������
            gstrBonusYMD1 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus1"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus1"), 3, 2)
            gstrBonusYMD2 = Format(gdatSysDate, "yyyy") & "/" & Left(odbDatabase.Parameters("OtStrBonus2"), 2) & "/" & Mid(odbDatabase.Parameters("OtStrBonus2"), 3, 2)
            If DateDiff("y", gstrBonusYMD1, gstrBonusYMD2) < 0 Then
                Month_WORK = gstrBonusYMD2
                gstrBonusYMD2 = gstrBonusYMD1
                gstrBonusYMD1 = Month_WORK
            End If
            If Trim(odbDatabase.Parameters("OtStrZanYMD")) <> "" Then
                gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)     '�c���X�V��
            Else
                gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
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
'ADD 20100225 0908047 NBC SAWAME START
            gtblKeisan(i).KyuyoMod = odbDatabase.Parameters("OtNumKyuyoMod").Get_Value(g)
            gtblKeisan(i).SyoyoMod = odbDatabase.Parameters("OtNumSyoyoMod").Get_Value(g)
            gtblKeisan(i).KyuyoModRisoku = odbDatabase.Parameters("OtNumKyuyoModRisoku").Get_Value(g)
            gtblKeisan(i).SyoyoModRisoku = odbDatabase.Parameters("OtNumSyoyoModRisoku").Get_Value(g)
            gtblKeisan(i).KyuyoModAll = odbDatabase.Parameters("OtNumKyuyoModAll").Get_Value(g)
            gtblKeisan(i).SyoyoModAll = odbDatabase.Parameters("OtNumSyoyoModAll").Get_Value(g)
            gtblKeisan(i).KyuyoModRisokuAll = odbDatabase.Parameters("OtNumKyuyoModRisokuAll").Get_Value(g)
            gtblKeisan(i).SyoyoModRisokuAll = odbDatabase.Parameters("OtNumSyoyoModRisokuAll").Get_Value(g)
'ADD 20100225 0908047 NBC SAWAME END
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '��ʂɕ\��
    Call SpreadSet
    frmQPAV_CEnt100.sprList.ReDraw = True
    
    '���͐��䏈��
    frmQPAV_CEnt100.cmdExec.Enabled = True
    frmQPAV_CEnt100.cmdName.Enabled = False
    frmQPAV_CEnt100.txtSyainCD1.Enabled = False
    frmQPAV_CEnt100.txtSyainCD2.Enabled = False
    frmQPAV_CEnt100.cmdPFK(5).Enabled = False
    
    Exit Sub

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

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
    frmQPAV_CEnt100.sprList.MaxRows = glngTblCnt
    
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
        
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 1, i, Left(gtblKeisan(i).YusiYMD, 4) & "/" & Mid(gtblKeisan(i).YusiYMD, 5, 2) & "/" & Right(gtblKeisan(i).YusiYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 2, i, Format(gtblKeisan(i).KyuyoYusi + gtblKeisan(i).SyoyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 3, i, Format(gtblKeisan(i).Riritu, "#0.00") & "%")
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 4, i, Format(gtblKeisan(i).Kaisu, "#0") & "��")
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 5, i, Format(gtblKeisan(i).KyuyoYusi, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 6, i, Format(gtblKeisan(i).SyoyoYusi, "#,##0"))
'MOD 20100225 0908047 NBC SAWAME START
'        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
'        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 8, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
        '�c���{ + ����߂������{�i�V�X�e�����t�ȑO�̕��j
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 7, i, Format(gtblKeisan(i).KyuyoZan + gtblKeisan(i).KyuyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 8, i, Format(gtblKeisan(i).SyoyoZan + gtblKeisan(i).SyoyoMod, "#,##0"))
'MOD 20100225 0908047 NBC SAWAME END
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 9, i, KyuyoZenYMD_WORK)
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 10, i, SyoyoZenYMD_WORK)
'ADD 20100225 0908047 NBC SAWAME START
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 11, i, Format(gtblKeisan(i).KyuyoZan, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 12, i, Format(gtblKeisan(i).SyoyoZan, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 13, i, Format(gtblKeisan(i).KyuyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 14, i, Format(gtblKeisan(i).SyoyoMod, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 15, i, Format(gtblKeisan(i).KyuyoModRisoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 16, i, Format(gtblKeisan(i).SyoyoModRisoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 17, i, Format(gtblKeisan(i).KyuyoModAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 18, i, Format(gtblKeisan(i).SyoyoModAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 19, i, Format(gtblKeisan(i).KyuyoModRisokuAll, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt100.sprList, 20, i, Format(gtblKeisan(i).SyoyoModRisokuAll, "#,##0"))
'ADD 20100225 0908047 NBC SAWAME END
    Next i
    
    frmQPAV_CEnt100.lblkasituke.Caption = glngTblCnt

End Sub

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrCode1, ORAPARM_INPUT                '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrCode2, ORAPARM_INPUT                '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSimeiKanji", gstrName, ORAPARM_INPUT               '��������
    odbDatabase.Parameters.Add "InStrMiseNM", gstrMise, ORAPARM_INPUT                   '�X��
    odbDatabase.Parameters.Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT               '�Z����
    odbDatabase.Parameters.Add "InNumKyuyoHen", glngKyuyoYusi, ORAPARM_INPUT            '���^�Z���z
    odbDatabase.Parameters.Add "InNUMSyoyoHen", glngSyoyoYusi, ORAPARM_INPUT            '�ܗ^�Z���z
    odbDatabase.Parameters.Add "InNumKyuyoZan", glngKyuyoZan, ORAPARM_INPUT             '���^�c��
    odbDatabase.Parameters.Add "InNUMSyoyoZan", glngSyoyoZan, ORAPARM_INPUT             '�ܗ^�c��
    odbDatabase.Parameters.Add "InStrKyuyoStr", gstrKyuyoStYMD, ORAPARM_INPUT           '���^�����v�Z�J�n��
    odbDatabase.Parameters.Add "InStrSyoyoStr", gstrSyoyoStYMD, ORAPARM_INPUT           '�ܗ^�����v�Z�J�n��
    odbDatabase.Parameters.Add "InStrSeisanYMD", gstrSeiYMD, ORAPARM_INPUT              '���Z��
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                 '����
    odbDatabase.Parameters.Add "InNumKyuyoRisoku", glngKyuyoRisoku, ORAPARM_INPUT       '���^����
    odbDatabase.Parameters.Add "InNumSyoyoRisoku", glngSyoyoRisoku, ORAPARM_INPUT       '�ܗ^����
    odbDatabase.Parameters.Add "InStrTenbikiKBN", gstrTenKBN, ORAPARM_INPUT             '�V���敪
    odbDatabase.Parameters.Add "InNumKyuyoTen", glngKyuyoTen, ORAPARM_INPUT             '���^�V���z
    odbDatabase.Parameters.Add "InNumSyoyoTen", glngSyoyoTen, ORAPARM_INPUT             '�ܗ^�V���z
    odbDatabase.Parameters.Add "InStrKyuyoKBN", gstrKyuyoKBN, ORAPARM_INPUT             '���^�X�V�敪
    odbDatabase.Parameters.Add "InStrSyoyoKBN", gstrSyoyoKBN, ORAPARM_INPUT             '�ܗ^�X�V�敪
    odbDatabase.Parameters.Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT           '���^����
    odbDatabase.Parameters.Add "InNumSyoyoNisu", gintSyoyoNisu, ORAPARM_INPUT           '�ܗ^����
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT         '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100DatAdd ("
    strSQL = strSQL & ":InStrSyainCD1,"
    strSQL = strSQL & ":InStrSyainCD2,"
    strSQL = strSQL & ":InStrSimeiKanji,"
    strSQL = strSQL & ":InStrMiseNM,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InNumKyuyoHen,"
    strSQL = strSQL & ":InNUMSyoyoHen,"
    strSQL = strSQL & ":InNumKyuyoZan,"
    strSQL = strSQL & ":InNUMSyoyoZan,"
    strSQL = strSQL & ":InStrKyuyoStr,"
    strSQL = strSQL & ":InStrSyoyoStr,"
    strSQL = strSQL & ":InStrSeisanYMD,"
    strSQL = strSQL & ":InNumRiritu,"
    strSQL = strSQL & ":InNumKyuyoRisoku,"
    strSQL = strSQL & ":InNumSyoyoRisoku,"
    strSQL = strSQL & ":InStrTenbikiKBN,"
    strSQL = strSQL & ":InNumKyuyoTen,"
    strSQL = strSQL & ":InNumSyoyoTen,"
    strSQL = strSQL & ":InStrKyuyoKBN,"
    strSQL = strSQL & ":InStrSyoyoKBN,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumSyoyoNisu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
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

'ADD 20100225 0908047 NBC YOKOYAMA START
'*********************************************************************************************
'*�@�@�葱�����F�@�T���\�肪����߂�����Ă��Ȃ����ǂ����𔻒f����SP���Ăяo��
'*�@�@���@���@�F�@�Ј�CD1�A�Ј�CD2�A�Z�����A�T�����A���^�ܗ^�敪
'*�@�@���@�ʁ@�F�@True�c����߂��L  False�c����߂���
'*********************************************************************************************
Public Function gfuncCheckBunkaiModoshi(inStrSyainCD1 As String, _
                                        inStrSyainCD2 As String, _
                                        inStrYushiYMD As String, _
                                        inStrKojoYMD As String, _
                                        inStrYusiKBN As String) As Boolean
   
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errCheckBunkaiModoshi

    gfuncCheckBunkaiModoshi = False
    
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", inStrSyainCD1, ORAPARM_INPUT     '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", inStrSyainCD2, ORAPARM_INPUT     '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrYusiYMD", inStrYushiYMD, ORAPARM_INPUT         '�Z����
    odbDatabase.Parameters.Add "InStrKojoYMD", inStrKojoYMD, ORAPARM_INPUT          '�T����
    odbDatabase.Parameters.Add "InStrYusiKBN", inStrYusiKBN, ORAPARM_INPUT          '�Z���敪(�R�F���^�A�S�F�ܗ^)
    
    odbDatabase.Parameters.Add "OtStrFlg", "0", ORAPARM_OUTPUT                      '����Flg
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR

    strSQL = "BEGIN QPAP_CEnt100PkG.QPAP_CEnt100CheckModoshi(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":InStrYusiYMD, " & _
             ":InStrKojoYMD, " & _
             ":InStrYusiKBN, " & _
             ":OtStrFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("OtStrFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncCheckBunkaiModoshi = "1"

    Exit Function
    
errCheckBunkaiModoshi:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'ADD 20100225 0908047 NBC YOKOYAMA END

