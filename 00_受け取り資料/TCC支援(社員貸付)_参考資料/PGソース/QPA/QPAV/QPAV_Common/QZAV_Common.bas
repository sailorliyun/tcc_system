Attribute VB_Name = "QZAV_Common"
Option Explicit

'******************************************************************
'   �A�N�Z�X���O�Ή��p�W�����W���[��
'
'   �쐬���F2005/05/10
'******************************************************************
'***�C������********************************************************
'   xxxx/xx/xx �C���Җ� �C�����e
'******************************************************************
Public gclsQzaApp As QZAV_ACTX0001.ACTX0001C

Public gvarQZAItemID_TBL   As Variant    '����ID���
Public gvarQZABefore_TBL   As Variant    '���ڕύX�O���
Public gvarQZAAfter_TBL    As Variant    '���ڕύX����
'
Public gstrQZAItemid(19)   As String     '����ID
Public gstrQZABefore(19)   As String     '���ڕύX�O
Public gstrQZAAfter(19)    As String     '���ڕύX��

'����ID
Public Const gcstrHONNIJ01 As String = "HONNIJ01"   '�{�l���F��������
Public Const gcstrHONNIJ02 As String = "HONNIJ02"   '�{�l���F�����J�i
Public Const gcstrHONNIJ03 As String = "HONNIJ03"   '�{�l���F�������[�}��
Public Const gcstrHONNIJ04 As String = "HONNIJ04"   '�{�l���F���N����
Public Const gcstrHONNIJ05 As String = "HONNIJ05"   '�{�l���F����
Public Const gcstrJITAKJ01 As String = "JITAKJ01"   '������F�d�b�ԍ�
Public Const gcstrJITAKJ02 As String = "JITAKJ02"   '������F�X�֔ԍ�
Public Const gcstrJITAKJ03 As String = "JITAKJ03"   '������F�Z���J�i
Public Const gcstrJITAKJ04 As String = "JITAKJ04"   '������F�Z������
Public Const gcstrJITAKJ05 As String = "JITAKJ05"   '������F����
Public Const gcstrKOUZAJ01 As String = "KOUZAJ01"   '�������F��s�R�[�h
Public Const gcstrKOUZAJ02 As String = "KOUZAJ02"   '�������F��s��
Public Const gcstrKOUZAJ03 As String = "KOUZAJ03"   '�������F�x�X�R�[�h
Public Const gcstrKOUZAJ04 As String = "KOUZAJ04"   '�������F�x�X��
Public Const gcstrKOUZAJ05 As String = "KOUZAJ05"   '�������F�a�����
Public Const gcstrKOUZAJ06 As String = "KOUZAJ06"   '�������F�����ԍ�
Public Const gcstrKOUZAJ07 As String = "KOUZAJ07"   '�������F�������`
Public Const gcstrKOUZAJ08 As String = "KOUZAJ08"   '�������F�ʒ��L���E�ʒ��ԍ�
Public Const gcstrTEIKEJ01 As String = "TEIKEJ01"   '��g����F�J�[�h�ԍ�
Public Const gcstrKINMUJ01 As String = "KINMUJ01"   '�Ζ�����F���̃J�i
Public Const gcstrKINMUJ02 As String = "KINMUJ02"   '�Ζ�����F���̊���
Public Const gcstrKINMUJ03 As String = "KINMUJ03"   '�Ζ�����F��������
Public Const gcstrKINMUJ04 As String = "KINMUJ04"   '�Ζ�����F�d�b�ԍ�
Public Const gcstrKINMUJ05 As String = "KINMUJ05"   '�Ζ�����F�X�֔ԍ�
Public Const gcstrKINMUJ06 As String = "KINMUJ06"   '�Ζ�����F�Z���J�i
Public Const gcstrKINMUJ07 As String = "KINMUJ07"   '�Ζ�����F�Z������
Public Const gcstrKINMUJ08 As String = "KINMUJ08"   '�Ζ�����F����
Public Const gcstrKAZOKJ01 As String = "KAZOKJ01"   '�Ƒ��\�����F��������
Public Const gcstrKAZOKJ02 As String = "KAZOKJ02"   '�Ƒ��\�����F�����J�i
Public Const gcstrKAZOKJ03 As String = "KAZOKJ03"   '�Ƒ��\�����F�������[�}��
Public Const gcstrKAZOKJ04 As String = "KAZOKJ04"   '�Ƒ��\�����F���N����
Public Const gcstrKAZOKJ05 As String = "KAZOKJ05"   '�Ƒ��\�����F����
Public Const gcstrKAZOKJ06 As String = "KAZOKJ06"   '�Ƒ��\�����F����
Public Const gcstrETCINF01 As String = "ETCINF01"   '���̑����F�d�b�ԍ�
Public Const gcstrETCINF02 As String = "ETCINF02"   '���̑����F�X�֔ԍ�
Public Const gcstrETCINF03 As String = "ETCINF03"   '���̑����F�Z���J�i
Public Const gcstrETCINF04 As String = "ETCINF04"   '���̑����F�Z������
Public Const gcstrETCINF05 As String = "ETCINF05"   '���̑����F��������
Public Const gcstrETCINF06 As String = "ETCINF06"   '���̑����F�����J�i

'����ID
Public Const gcstrLOGON001 As String = "LOGON001"   '�Ɩ���ʏ����\��
Public Const gcstrLOGOFF01 As String = "LOGOFF01"   '�Ɩ���ʏI��
Public Const gcstrFKEY0001 As String = "FKEY0001"   '���j���[
Public Const gcstrFKEY0002 As String = "FKEY0002"   '�n�[�h�R�s�[
Public Const gcstrFKEY005I As String = "FKEY005I"   '���s�i�f�[�^�ǉ������j
Public Const gcstrFKEY005U As String = "FKEY005U"   '���s�i�f�[�^�C�������j
Public Const gcstrFKEY005D As String = "FKEY005D"   '���s�i�f�[�^�폜�����j
Public Const gcstrFKEY005R As String = "FKEY005R"   '���s�i�f�[�^�Ɖ���j
Public Const gcstrFKEY0007 As String = "FKEY0007"   '�O�y�[�W
Public Const gcstrFKEY0008 As String = "FKEY0008"   '���y�[�W
Public Const gcstrFKEY0010 As String = "FKEY0010"   '�O���
Public Const gcstrFKEY0011 As String = "FKEY0011"   '�����
Public Const gcstrFKEY0012 As String = "FKEY0012"   '������
Public Const gcstrREFCMD01 As String = "REFCMD01"   '�Ɖ�
Public Const gcstrEXECINS0 As String = "EXECINS0"   '���s�i�f�[�^�ǉ������j
Public Const gcstrEXECUPD0 As String = "EXECUPD0"   '���s�i�f�[�^�C�������j
Public Const gcstrEXECDEL0 As String = "EXECDEL0"   '���s�i�f�[�^�폜�����j
Public Const gcstrEXECREF0 As String = "EXECREF0"   '���s�i�f�[�^�Ɖ���j
Public Const gcstrPREVIEW0 As String = "PREVIEW0"   '�v���r���[
Public Const gcstrPRINT001 As String = "PRINT001"   '���
Public Const gcstrCLICKINS As String = "CLICKINS"   '�N���b�N�i�f�[�^�ǉ������j
Public Const gcstrCLICKUPD As String = "CLICKUPD"   '�N���b�N�i�f�[�^�X�V�����j
Public Const gcstrCLICKDEL As String = "CLICKDEL"   '�N���b�N�i�f�[�^�폜�����j
Public Const gcstrCLICKREF As String = "CLICKREF"   '�N���b�N�i�f�[�^�Ɖ���j
Public Const gcstrEXEC0001 As String = "EXEC0001"   '���s
Public Const gcstrCSVOUT01 As String = "CSVOUT01"   '�b�r�u�f�[�^�o��
Public Const gcstrSYSLOGON As String = "SYSLOGON"   '�V�X�e�����O�I��
Public Const gcstrSYSLOGOF As String = "SYSLOGOF"   '�V�X�e�����O�I�t
Public Const gcstrMDBOUT01 As String = "MDBOUT01"   '�l�c�a�f�[�^�o��

'�V�X�e��ID
Public Const gsstrTCCSYSTEM As String = "00000002"  '�������N���W�b�g�x���V�X�e��
Public Const gsstrFDSSYSTEM As String = "00000003"  '�e�c�r���j�^�����O�V�X�e��
Public Const gsstrIMGSYSTEM As String = "00000004"  '�C���[�W�Ǘ�
Public Const gsstrCTSSYSTEM As String = "00000008"  '�C���t�H���[�V�����V�X�e���iCT-STAGE)

'��Ђh�c
Public Const gsstrCMPTCC As String = "TCC  "  '�������N���W�b�g

