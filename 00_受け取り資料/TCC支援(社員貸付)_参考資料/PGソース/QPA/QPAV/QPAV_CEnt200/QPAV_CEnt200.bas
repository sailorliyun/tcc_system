Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt200"
    Public Act_Row      As Long
    Public bInit_Flg    As Boolean
    Public ModeF        As String
    Public gtblBumon()  As BumonTbl
    Public gtblMise()   As MiseTbl
    Public glngTblCnt   As Long
    Public CallCNT      As Long
    Public ArryCNT      As Long
    Public UnlF         As Integer
    
    Type BumonTbl
       CD   As String
       NM   As String
    End Type
     
    Type MiseTbl
       CD   As String
       NM   As String
    End Type
    
'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "����}�X�^�����e�i���X�͊��ɋN������Ă��܂��B" _
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

    bInit_Flg = True
    frmQPAV_CEnt200.Show
    
 
End Sub

Public Function gsubMiseCD_get() As Boolean
'*******************************************************************************************
'   �X�R�[�h�擾
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    
    gsubMiseCD_get = False
    
    CallCNT = 0
    ArryCNT = 0
    
    '�r�o
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '�X�R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '�X���� �z��
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '����������
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER

    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200MiseCDList (" & _
            ":InNumMaxRec,:OtStrMiseCD,:OtStrMiseNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
        '���o���R�[�h�����X�g�ɕ\��
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
        '���o������\������
        'ð��ٌ����p
        If CallCNT = 0 Then
            Erase gtblMise
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '�z��̍Ē�`
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblMise(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '����R�[�h
            gtblMise(j).CD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '���喼��
            gtblMise(j).NM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            i = i + 1
        Next j
    
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    '�f�[�^���R���{�ɃZ�b�g����
    frmQPAV_CEnt200.cobMiseCD.Clear
    For i = 1 To ArryCNT
        frmQPAV_CEnt200.cobMiseCD.AddItem gtblMise(i).CD
    Next i
    frmQPAV_CEnt200.cobMiseCD.ListIndex = -1
    
    gsubMiseCD_get = True

    Exit Function

errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   ����f�[�^�擾
'*******************************************************************************************
    Dim strSQL              As String
    Dim i                   As Long
    Dim j                   As Long
    Dim SpCnt               As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

    CallCNT = 0
    ArryCNT = 0
    
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt200.cobMiseCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '�X�g�A�h�Ăяo����
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '����R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6

    '���喼�� �z��
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER

    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200SelList (" & _
            ":InStrMiseCD,:InNumMaxRec,:IoNumSpCnt,:OtStrBumonCD,:OtStrBumonNM,:OtNumAryCount," & _
            ":OtStrEndFlg); END;"
    
        '���o���R�[�h�����X�g�ɕ\��
    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
        
        '���o������\������
        'ð��ٌ����p
        If CallCNT = 0 Then
            Erase gtblBumon
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '�z��̍Ē�`
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
            'Msg = ����ȏ�̃f�[�^�͕\���ł��܂���B
            frmQPAV_CEnt200.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
        
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblBumon(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '����R�[�h
            gtblBumon(j).CD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(i)
            '���喼��
            gtblBumon(j).NM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(i)
            i = i + 1
        Next j
        
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    frmQPAV_CEnt200.vaSpread1.MaxRows = ArryCNT
    
    '�f�[�^���r�o�ɃZ�b�g����
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt200.vaSpread1, 1, i, gtblBumon(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt200.vaSpread1, 2, i, gtblBumon(i).NM)
    Next i
    
    gsubSPInit = True
    Exit Function

errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPAdd() As Boolean
'*******************************************************************************************
'   ����f�[�^�o�^
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '����R�[�h
    odbDatabase.Parameters.Add "InStrBumonCD", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
    '���喼��
    odbDatabase.Parameters.Add "InStrBumonNM", frmQPAV_CEnt201.txtBumonMeisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNM").ServerType = ORATYPE_VARCHAR2
    
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
    
    '�d���t���O
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatAdd (" & _
            ":InStrMiseCD,:InStrBumonCD,:InStrBumonNM,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt201.lblMsg.Caption = "WPOE02 ���̕���R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt201.txtBumonCD.BackColor = vbRed
        frmQPAV_CEnt201.txtBumonCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    gsubSPAdd = True
    
    Exit Function
    
errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gsubSPUpd() As Boolean
'*******************************************************************************************
'   ����f�[�^ �C��
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '����R�[�h�C���O
    odbDatabase.Parameters.Add "InStrBumonCD_B", gtblBumon(Act_Row).CD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD_B").ServerType = ORATYPE_CHAR
    
    '����R�[�h�C����
    odbDatabase.Parameters.Add "InStrBumonCD_A", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD_A").ServerType = ORATYPE_CHAR
    
    '���喼��
    odbDatabase.Parameters.Add "InStrBumonNM", frmQPAV_CEnt201.txtBumonMeisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNM").ServerType = ORATYPE_VARCHAR2
       
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

    '�d���t���O
    odbDatabase.Parameters.Add "OtStrDupF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDupF").ServerType = ORATYPE_CHAR
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatUpd (" & _
            ":InStrMiseCD,:InStrBumonCD_B,:InStrBumonCD_A,:InStrBumonNM,:InstrMenuID," & _
            ":InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD," & _
            ":InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt201.lblMsg.Caption = "WPOE02 ���̕���R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt201.txtBumonCD.BackColor = vbRed
        frmQPAV_CEnt201.txtBumonCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
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

Public Function gsubSPDel() As Boolean
'*******************************************************************************************
'   ����f�[�^ �폜
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", frmQPAV_CEnt201.lblMiseCD(0), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '����R�[�h
    odbDatabase.Parameters.Add "InStrBumonCD", frmQPAV_CEnt201.txtBumonCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCD").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200DatDel (" & _
             ":InStrMiseCD,:InStrBumonCD,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
             ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
   
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    gsubSPDel = True
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
    
    odbDatabase.Parameters.Add "strSikibetu", "200", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200Lock(" & _
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
        frmQPAV_CEnt200.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "200", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt200PkG.QPAP_CEnt200UnLock(" _
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


