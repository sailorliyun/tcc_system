Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt130"

'*********************************************************
'   SP�p�f�[�^�i�[�ϐ�
'*********************************************************
 Public gstrSyainCD1            As String        '�Ј��R�[�h�P
 Public gstrSyainCD2            As String        '�Ј��R�[�h�Q
 Public gstrSysDate             As String        '�V�X�e�����t�i�T�[�o�[�j

    Public gDataAry()               As String


 Public lngErrCode           As Long          '�װ����
 Public strErrDescription    As String        '�װү����
 
 Public pubstrSakuseibi      As String       '�쐬���@10��11�@��ʑJ�ڎ��쐬�����n���p
 
 Public gblnEndFlg           As Boolean      '�ڍ׉�ʁ��Ɖ��ʑJ�ڎ������p
                                             'True=�ƭ� �^ False=�O���
                                            
'****���گ�޼�Ă̒l���i�[����********************
 Public gstrSSHakken    As String            '**
 Public gstrSSSouhu     As String            '**
 Public gstrSSDaisi     As String            '**
 Public gstrSSRiyousya  As String            '**
 Public gstrSSHikiotosi As String            '**
 Public gstrSSEmbos1    As String            '**
 Public gstrSSEmbos2    As String            '**
 Public gstrSSEmbos3    As String            '**
 Public gstrSSEmbos4    As String            '**
 Public gstrSSEmbos5    As String            '**
 Public gstrSSEmbos6    As String            '**
 Public gstrSSEmbos7    As String            '**
 Public gstrSSEmbos8    As String            '**
 Public gstrSSEmbos9    As String            '**
 Public gstrSSTouroku   As String            '**

 '5/15 add
 Public gstrSSNukitoriFlg    As String
 Public gstrSSNukitoriYMD    As String
 Public gstrSSUpdTanto       As String
 Public gstrSSUpdTantoMei    As String
 Public gstrSSUpdYMD         As String

'***********************************************

 Public strHakkouRiyu()      As String '''''���s���R�\���p
 Public strHakkouRiyuName()  As String '''''���s���R�\���p
 
 Public strFaceKbnNo() As String '''''�t�F�C�X�敪�\���p
 Public strFaceKbn()   As String '''''�t�F�C�X�敪�\���p
 

'--------------------------------------- 1/31 TEL���ʗp
 Public strKekkaKbnNo() As String '''''�d�b�J�ʌ��ʋ敪�\���p
 Public strKekkaKbn()   As String '''''�d�b�J�ʌ��ʋ敪�\���p

Type KekkaTbl
   Sakuseibi    As String
   KakuninTel   As String
   Kekka        As String
   TenkyoTel    As String
End Type
 
Public glngTblCnt       As Long
'--------------------------------------- 1/31 TEL���ʗp


'--------------------------------------- 5/29 �X�V��ʗp
 Public gblnUpdFlg            As Boolean      '�X�V����p

 Public gstr012Kakitome       As String
 Public gstr012NukitoriFlg    As String
     
 Public gstrUpdNukiFlg        As String
 Public gstrUpdNukiYmd        As String
 Public gstrUpdTantoCd        As String
 Public gstrUpdTantoMei       As String
 Public gstrUpdDatetime       As String
'--------------------------------------- 5/29 �X�V��ʗp




'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�Ј��Z���⍇�킹�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt130.Show 1
 
End Sub


Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   �r������i���b�N�j
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "InStrSikibetu", "130", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrSyainCD1, ORAPARM_INPUT               '��������ԍ�1
    odbDatabase.Parameters.Add "InStrKeyInfo2", gstrSyainCD2, ORAPARM_INPUT               '��������ԍ�2
    odbDatabase.Parameters.Add "InStrProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130Lock(" & _
             ":InStrSikibetu,:InStrKeyInfo1,:InStrKeyInfo2,:InStrProgramID," & _
             ":InStrComputerNM,:InStrOperatorID); END;"

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
        frmQPAV_CEnt130.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "130", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130UnLock(" _
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




