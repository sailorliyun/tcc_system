Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt140"

'*********************************************************
'   SP�p�f�[�^�i�[�ϐ�
'*********************************************************
 Public gstrSyoriKbn            As String        '�����敪�@�P:���^�@�Q�F�ܗ^
 Public gstrSyoriYM             As String        '�����N��
 Public gDataAry()              As String        '�T���A���\�W��f�[�^�z��
 Public gMDataAry()             As String        '���T���A���\�W��f�[�^�z��
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gstrBonusYM             As String        '�ŐV�ܗ^�T�����t
 
 Public glngTblCnt              As Long
 
'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�T���A���\����͊��ɋN������Ă��܂��B" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If
'
    '�R�}���h���C�������̎擾
    strCmdLine = Command()

    If strCmdLine = "" Then
        MsgBox "�N���p�����[�^���ݒ肳��Ă��܂���B" _
                , vbExclamation Or vbOKOnly, gcstrPrjName

        Exit Sub
    End If

    '�R�}���h���C��������ҏW����
    Call gsubGetCommandLine(strCmdLine)

    frmQPAV_CEnt140.Show 1
 
End Sub

'************************************************************************
'   ��������
'        ���ޖ��̎擾�E�V�X�e�����t�擾
'************************************************************************
Public Sub gsubSPInit()
Dim strSQL               As String

On Error GoTo errSPInit

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

Public Sub gsubSPGetYM()
Dim strSQL               As String

On Error GoTo errSPInit

    '�r�o
    '�V�X�e�����t
    odbDatabase.Parameters.Add "OtMei", Space(80), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtMei").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140GetYM(" & _
             ":OtMei); END;"
    'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    gstrBonusYM = Trim$(odbDatabase.Parameters("OtMei"))
    
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

