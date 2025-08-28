Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt180"
    Public Act_Row          As Long
    Public ModeF            As String
    Public gtblSeisan()     As SeisanTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCnt          As Long
    Public ArryCnt          As Long
    Public UnlF             As Integer
    
    Type SeisanTbl
        CD                  As String
        NM                  As String
    End Type
 
'*****************************************************************************************
'    �N���@�l�`�h�m
'*****************************************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "���Z�X�}�X�^�����e�i���X�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt180.Show
    
End Sub

Public Function gsubSPInit() As Boolean
'*****************************************************************************************
'    ���Z�X�f�[�^�擾
'*****************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    
    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False
    
    ArryCnt = 0
    CallCnt = 0
    
    '�r�o
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER

    '���Z�X�R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrSeisanCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '���Z�X���� �z��
    odbDatabase.Parameters.AddTable "OtStrSeisanNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180SelList (" & _
            ":InNumMaxRec,:OtStrSeisanCD,:OtStrSeisanNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
      '���o���R�[�h�����X�g�ɕ\��
    
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
        '���o������\������
        'ð��ٌ����p
        If CallCnt = 0 Then
            Erase gtblSeisan
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
        '�z��̍Ē�`
'        If ArryCnt + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        If ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
            'Msg = ����ȏ�̃f�[�^�͕\���ł��܂���B
            frmQPAV_CEnt180.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
'        ArryCnt = ArryCnt + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCnt = ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCnt
        
        ReDim Preserve gtblSeisan(ArryCnt)
    
        i = 0
        For j = CallCnt * 100 + 1 To ArryCnt
            '���Z�X�R�[�h
            gtblSeisan(j).CD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            '���Z�X����
            gtblSeisan(j).NM = odbDatabase.Parameters("OtStrSeisanNM").Get_Value(i)
            
            i = i + 1
        Next j
    
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCnt = CallCnt + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    frmQPAV_CEnt180.vaSpread1.MaxRows = ArryCnt
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
        
    '�f�[�^���r�o�ɃZ�b�g����
    Call gsubSpdClear(frmQPAV_CEnt180.vaSpread1)
    For i = 1 To ArryCnt
        Call gsubSetCellText(frmQPAV_CEnt180.vaSpread1, 1, i, gtblSeisan(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt180.vaSpread1, 2, i, gtblSeisan(i).NM)
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
'*****************************************************************************************
'   ���Z�X�f�[�^�o�^
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    '�r�o
    '���Z�X�R�[�h
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '���Z�X����
    odbDatabase.Parameters.Add "InStrSeisanNM", Trim(frmQPAV_CEnt181.txtSeisanntennName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanNM").ServerType = ORATYPE_VARCHAR2
    
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
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatAdd (" & _
            ":InStrSeisanCD,:InStrSeisanNM,:InstrMenuID,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�o�^���ɐ��Z�X�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE02 ���̐��Z�X�R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt181.txtSeisanntenn.BackColor = vbRed
        frmQPAV_CEnt181.txtSeisanntenn.SetFocus
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
'*****************************************************************************************
'   ���Z�X�f�[�^ �C��
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    '�r�o
    '���Z�X�R�[�h�C���O
    odbDatabase.Parameters.Add "InStrSeisanCD_B", Trim(gtblSeisan(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD_B").ServerType = ORATYPE_CHAR
    
    '���Z�X�R�[�h�C����
    odbDatabase.Parameters.Add "InStrSeisanCD_A", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD_A").ServerType = ORATYPE_CHAR
    
    '���Z�X����
    odbDatabase.Parameters.Add "InStrSeisanNM", Trim(frmQPAV_CEnt181.txtSeisanntennName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanNM").ServerType = ORATYPE_VARCHAR2
    
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
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatUpd (" & _
            ":InStrSeisanCD_B,:InStrSeisanCD_A,:InStrSeisanNM,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�C�����ɐ��Z�X�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE02 ���̐��Z�X�R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt181.txtSeisanntenn.BackColor = vbRed
        frmQPAV_CEnt181.txtSeisanntenn.SetFocus
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
'*****************************************************************************************
'    ���Z�X�f�[�^ �폜
'*****************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    '�r�o
    '���Z�X�R�[�h
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt181.txtSeisanntenn.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
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
    
    '�E�s�t���O
    odbDatabase.Parameters.Add "OtStrSeisanF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSeisanF").ServerType = ORATYPE_CHAR
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180DatDel (" & _
             ":InStrSeisanCD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
             ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrSeisanF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '���Z�X�R�[�h���X�}�X�^�ɓo�^����Ă��鎞�͍폜�ł��Ȃ�
    If Trim(odbDatabase.Parameters("OtStrSeisanF")) = "1" Then
        'Msg = ���̐��Z�X�R�[�h�͍폜�ł��܂���B
        frmQPAV_CEnt181.lblMsg.Caption = "WPOE25 " & gstrGetCodeMeisyo(odbDatabase, "E25", "WPO")
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
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
    
    odbDatabase.Parameters.Add "strSikibetu", "180", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180Lock(" & _
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
        frmQPAV_CEnt180.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "180", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt180PkG.QPAP_CEnt180UnLock(" _
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


