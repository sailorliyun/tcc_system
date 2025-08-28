Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt170"
    Public gtblJisya    As JisyaTbl
    Public bInit_Flg    As Boolean
    
    Type JisyaTbl
       JisyaCD          As String
       ZaimuCD          As String
       Syozaichi        As String
       KaisyaNM         As String
       FurikomiBK       As String
       KozaNO           As String
       KozaNM           As String
       KamikiM          As String
       KamikiD          As String
       SimokiM          As String
       SimokiD          As String
    End Type
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

Public Sub Main()
'*****************************************************************************************
'   �N���@�l�`�h�m
'*****************************************************************************************
    Dim strCmdLine As String
        
'    �����
    If App.PrevInstance Then
        MsgBox "���Гo�^���e�ύX�����͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt170.Show
    
End Sub

Public Sub gsubSPInit()
'*****************************************************************************************
'   ���Ѓ}�X�^�擾����
'*****************************************************************************************
    Dim strSQL  As String
    Dim i       As Long

On Error GoTo errSPInit

    '�r�o
    '��ЃR�[�h
    odbDatabase.Parameters.Add "OtStrKaisyaCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisyaCD").ServerType = ORATYPE_CHAR
   
    '�����ǃR�[�h
    odbDatabase.Parameters.Add "OtStrZaimuCD", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZaimuCD").ServerType = ORATYPE_VARCHAR2
    
    '���ݒn
    odbDatabase.Parameters.Add "OtStrSyozai", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '��Ж�
    odbDatabase.Parameters.Add "OtStrKaisyaNm", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisyaNm").ServerType = ORATYPE_VARCHAR2
    
    '�U����
    odbDatabase.Parameters.Add "OtStrFurikomi", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFurikomi").ServerType = ORATYPE_VARCHAR2
  
    '�����ԍ�
    odbDatabase.Parameters.Add "OtStrKozaNo", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '��������
    odbDatabase.Parameters.Add "OtStrKozaNm", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNm").ServerType = ORATYPE_VARCHAR2
    
    '����J�n��
    odbDatabase.Parameters.Add "OtStrKamiStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStM").ServerType = ORATYPE_CHAR
   
    '����J�n��
    odbDatabase.Parameters.Add "OtStrKamiStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStD").ServerType = ORATYPE_CHAR
   
    '�����J�n��
    odbDatabase.Parameters.Add "OtStrSimoStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStM").ServerType = ORATYPE_CHAR
   
    '�����J�n��
    odbDatabase.Parameters.Add "OtStrSimoStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStD").ServerType = ORATYPE_CHAR
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170SelList (" & _
             ":OtStrKaisyaCD,:OtStrZaimuCD,:OtStrSyozai,:OtStrKaisyaNm,:OtStrFurikomi,:OtStrKozaNo," & _
             ":OtStrKozaNm,:OtStrKamiStM,:OtStrKamiStD,:OtStrSimoStM,:OtStrSimoStD); END;"

    'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    gtblJisya.JisyaCD = odbDatabase.Parameters("OtStrKaisyaCD")
    gtblJisya.ZaimuCD = odbDatabase.Parameters("OtStrZaimuCD")
    gtblJisya.Syozaichi = odbDatabase.Parameters("OtStrSyozai")
    gtblJisya.KaisyaNM = odbDatabase.Parameters("OtStrKaisyaNm")
    gtblJisya.FurikomiBK = odbDatabase.Parameters("OtStrFurikomi")
    gtblJisya.KozaNO = odbDatabase.Parameters("OtStrKozaNo")
    gtblJisya.KozaNM = odbDatabase.Parameters("OtStrKozaNm")
    gtblJisya.KamikiM = odbDatabase.Parameters("OtStrKamiStM")
    gtblJisya.KamikiD = odbDatabase.Parameters("OtStrKamiStD")
    gtblJisya.SimokiM = odbDatabase.Parameters("OtStrSimoStM")
    gtblJisya.SimokiD = odbDatabase.Parameters("OtStrSimoStD")
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    Exit Sub

errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gsubSPUpd() As Boolean
'*****************************************************************************************
'   ���Ѓ}�X�^�C������
'*****************************************************************************************
    Dim strSQL  As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    '�r�o
    '��ЃR�[�h
    odbDatabase.Parameters.Add "InStrKaisyaCD", Trim(frmQPAV_CEnt170.lblJishaCD.Caption), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKaisyaCD").ServerType = ORATYPE_CHAR
   
    '�����ǃR�[�h
    odbDatabase.Parameters.Add "InStrZaimuCD", Trim(frmQPAV_CEnt170.txtZaimukyokuCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrZaimuCD").ServerType = ORATYPE_VARCHAR2
    
    '���ݒn
    odbDatabase.Parameters.Add "InStrSyozai", Trim(frmQPAV_CEnt170.txtSyozaiti.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '��Ж�
    odbDatabase.Parameters.Add "InStrKaisyaNm", Trim(frmQPAV_CEnt170.txtKaisyaName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKaisyaNm").ServerType = ORATYPE_VARCHAR2
    
    '�U����
    odbDatabase.Parameters.Add "InStrFurikomi", Trim(frmQPAV_CEnt170.txtFurikomiGinko.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrFurikomi").ServerType = ORATYPE_VARCHAR2
  
    '�����ԍ�
    odbDatabase.Parameters.Add "InStrKozaNo", Trim(frmQPAV_CEnt170.txtKouzaBangou.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '��������
    odbDatabase.Parameters.Add "InStrKozaNm", Trim(frmQPAV_CEnt170.txtKouzaMeigi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKozaNm").ServerType = ORATYPE_VARCHAR2
    
    '����J�n��
    odbDatabase.Parameters.Add "InStrKamiStM", Trim(frmQPAV_CEnt170.txtKamikiKaisiMM.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKamiStM").ServerType = ORATYPE_CHAR
   
    '����J�n��
    odbDatabase.Parameters.Add "InStrKamiStD", Trim(frmQPAV_CEnt170.txtKamikiKaisiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKamiStD").ServerType = ORATYPE_CHAR
   
    '�����J�n��
    odbDatabase.Parameters.Add "InStrSimoStM", Trim(frmQPAV_CEnt170.txtSimokiKaisiMM.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimoStM").ServerType = ORATYPE_CHAR
   
    '�����J�n��
    odbDatabase.Parameters.Add "InStrSimoStD", Trim(frmQPAV_CEnt170.txtSimokiKaisiDD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSimoStD").ServerType = ORATYPE_CHAR
    
    '���j���[ID
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT
    
    '�v���O����ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT
    
    '���[�UID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT
    
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    
    '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT
    
    '�����R�[�h
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
    
    '�S���Җ�
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170DatUpd (" & _
             ":InStrKaisyaCD,:InStrZaimuCD,:InStrSyozai,:InStrKaisyaNm,:InStrFurikomi," & _
             ":InStrKozaNo,:InStrKozaNm,:InStrKamiStM,:InStrKamiStD,:InStrSimoStM," & _
             ":InStrSimoStD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
             ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gsubSPUpd = True
    
    Exit Function

errSPInit:
'�G���[����

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
    
    odbDatabase.Parameters.Add "strSikibetu", "170", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170Lock(" & _
             ":strSikibetu,:strProgramID,:strComputerNM,:strOperatorID); END;"

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
        frmQPAV_CEnt170.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
        odbDatabase.LastServerErrReset                      '�װؾ��
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

    odbDatabase.Parameters.Add "strSikibetu", "170", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt170PkG.QPAP_CEnt170UnLock(" _
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


