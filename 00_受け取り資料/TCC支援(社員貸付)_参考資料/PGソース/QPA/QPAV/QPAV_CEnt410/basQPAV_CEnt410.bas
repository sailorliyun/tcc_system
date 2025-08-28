Attribute VB_Name = "basQPAV_CEnt410"
Option Explicit
'************************************************************************************
'  �������N���W�b�g �x���V�X�e��
'    �T�u�V�X�e�����F �Ј��ݕt�V�X�e���i�o�`�j
'---------------------------------------
'    �@�\���@�@�@�@�F QPAV_CEnt410     ���ϒʒm�����
'    �@�\���e�@�@�@�F ���ς����Ј��Ɋ��ϒʒm�����������
'    ���W���[���@�@�F basQPAV_CEnt410
'---------------------------------------
'   �쐬���@ �F 2005/01/20
'   �S���ҁ@ �F FIP SEKINE
'---------------------------------------
'   �C�����@ �F 9999/99/99
'   �C�����e �F �m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m
'************************************************************************************



'�t���O
Public gblnInitFlg             As Boolean    '�����t���O


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


'�V�X�e�����t
Public gstrSysDate              As String




'CONST
Public Const gcstrPrjName = "QPAV_CEnt410"



'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
    Dim strCmdLine            As String
    '---------------------------------------------------------
    
    '�R�}���h���C�������̎擾
    strCmdLine = Command()
    
    '�R�}���h���C�������̃`�F�b�N
    If strCmdLine = "" Then
        MsgBox "�N���p�����[�^���ݒ肳��Ă��܂���B" _
                , vbExclamation Or vbOKOnly, gcstrPrjName
        Exit Sub
    End If

    '�R�}���h���C��������ҏW����
    Call gsubGetCommandLine(strCmdLine)

    gblnInitFlg = True
    
    '��ʕ\��
    frmQPAV_CEnt410.Show

End Sub





'************************************************************************
'   �������� �i�R�[�h���̎擾�j
'        �R�[�h�e�[�u�����R�[�h���̂��擾���z��Ɋi�[
'************************************************************************
Public Sub gsubSPInit()
    Dim strSQL               As String
    Dim i                    As Long
       
    Dim strWkAry             As String
       
    Const cnslngAryLen       As Long = 100   '�z��̍ő包��
    Const cnsMaxRec          As Long = 100   '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���
    '---------------------------------------------------

On Error GoTo gsubSPInit_ERR


    '�r�o
    '�V�X�e�����t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_CHAR
    
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
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410Init("
    strSQL = strSQL & ":OtStrSysDate,"
    strSQL = strSQL & ":OtNumDP4Count,"
    strSQL = strSQL & ":OtStrDP4Ary,"
    strSQL = strSQL & ":OtNumDP5Count,"
    strSQL = strSQL & ":OtStrDP5Ary,"
    strSQL = strSQL & ":OtNumDP6Count,"
    strSQL = strSQL & ":OtStrDP6Ary); END;"

     'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�V�X�e�����t
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")

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

gsubSPInit_ERR:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub










