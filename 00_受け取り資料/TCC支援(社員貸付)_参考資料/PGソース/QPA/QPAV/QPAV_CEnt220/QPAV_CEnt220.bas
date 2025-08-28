Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt220"
    Public Act_Row          As Long
    Public ModeF            As String
    Public gtblSonota()     As SonotaTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCNT          As Long
    Public ArryCNT          As Long
    Public UnlF             As Integer
    
    Type SonotaTbl
       CD                   As String
       NM_N                 As String
       NM_X                 As String
       Riritu               As String
       S_Gendo              As String
       K_Gendo              As String
    End Type
     
Public Sub Main()
'*************************************************************
'   �N���@�l�`�h�m
'*************************************************************
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "���̑��}�X�^�����e�i���X�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt220.Show

End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   ���̑��f�[�^�擾
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

    ArryCNT = 0
    CallCNT = 0

    '�r�o
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '���ʃR�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
    '���ʖ��̂m���� �z��
    odbDatabase.Parameters.AddTable "OtStrNameN", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '���ʖ��̂w���� �z��
    odbDatabase.Parameters.AddTable "OtStrNameX", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    
    '���� �z��
    odbDatabase.Parameters.AddTable "OtStrRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�؏����x�z �z��
    odbDatabase.Parameters.AddTable "OtStrSGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�������x�z �z��
    odbDatabase.Parameters.AddTable "OtStrKGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220SelList (" & _
            ":InNumMaxRec,:OtStrCode,:OtStrNameN,:OtStrNameX,:OtStrRiritu,:OtStrSGendo," & _
            ":OtStrKGendo,:OtNumAryCount,:OtStrEndFlg); END;"

    Do
        '���o���R�[�h�����X�g�ɕ\��
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
        frmQPAV_CEnt220.vaSpread1.MaxRows = 0
        
        '���o������\������
        'ð��ٌ����p
        If CallCNT = 0 Then
            Erase gtblSonota
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
            'Msg = ����ȏ�̃f�[�^�͕\���ł��܂���B
            frmQPAV_CEnt220.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Function
        End If
        
        '�z��̍Ē�`
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblSonota(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '���ʃR�[�h
            gtblSonota(j).CD = Trim(odbDatabase.Parameters("OtStrCode").Get_Value(i))
            '���ʖ��̂m
            gtblSonota(j).NM_N = Trim(odbDatabase.Parameters("OtStrNameN").Get_Value(i))
            '���ʖ��̂w
            gtblSonota(j).NM_X = Trim(odbDatabase.Parameters("OtStrNameX").Get_Value(i))
            '����
            gtblSonota(j).Riritu = Trim(odbDatabase.Parameters("OtStrRiritu").Get_Value(i))
            '�؏����x�z
            gtblSonota(j).S_Gendo = Trim(odbDatabase.Parameters("OtStrSGendo").Get_Value(i))
            '�������x�z
            gtblSonota(j).K_Gendo = Trim(odbDatabase.Parameters("OtStrKGendo").Get_Value(i))
            i = i + 1
        Next j
        
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    frmQPAV_CEnt220.vaSpread1.MaxRows = ArryCNT
    
    '�f�[�^���r�o�ɃZ�b�g����
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 1, i, gtblSonota(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 2, i, gtblSonota(i).NM_N)
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 3, i, gtblSonota(i).NM_X)
        If Left(gtblSonota(i).Riritu, 1) = "." Then
            Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 4, i, "0" & gtblSonota(i).Riritu & "%")
        Else
            Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 4, i, gtblSonota(i).Riritu & "%")
        End If
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 5, i, Format(gtblSonota(i).S_Gendo, "###,##0"))
        Call gsubSetCellText(frmQPAV_CEnt220.vaSpread1, 6, i, Format(gtblSonota(i).K_Gendo, "###,##0"))
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
'   ���̑��f�[�^�o�^
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    '�r�o
    '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrCode", Trim(frmQPAV_CEnt221.txtKyoutuuCD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
    '���ʖ��̂m
    odbDatabase.Parameters.Add "InStrNameN", Trim(frmQPAV_CEnt221.txtKyoutuNameKanji), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameN").ServerType = ORATYPE_VARCHAR2
    
    '���ʖ��̂w
    odbDatabase.Parameters.Add "InStrNameX", Trim(frmQPAV_CEnt221.txtKyoutuNameKana), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameX").ServerType = ORATYPE_VARCHAR2
    
    '����
    odbDatabase.Parameters.Add "InStrRiritu", Trim(frmQPAV_CEnt221.txtRiritu1) & "." _
                                & Trim(frmQPAV_CEnt221.txtRiritu2), ORAPARM_INPUT
    odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_NUMBER
       
    '�؏����x�z
    odbDatabase.Parameters.Add "InStrSGendo", Trim(frmQPAV_CEnt221.txtSyousyoGendogaku), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSGendo").ServerType = ORATYPE_NUMBER
    
    '�������x�z
    odbDatabase.Parameters.Add "InStrKGendo", Trim(frmQPAV_CEnt221.txtKogutiGendogaku), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKGendo").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatAdd (" & _
            ":InStrCode,:InStrNameN,:InStrNameX,:InStrRiritu,:InStrSGendo,:InStrKGendo," & _
            ":InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN," & _
            ":InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt221.lblMsg.Caption = "WPOE02 ���̋��ʃR�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt221.txtKyoutuuCD.BackColor = vbRed
        frmQPAV_CEnt221.txtKyoutuuCD.SetFocus
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
    Dim strSQL      As String
    
On Error GoTo errSPInit
    gsubSPUpd = False
    
    '�r�o
    '���ʃR�[�h�C���O
    odbDatabase.Parameters.Add "InStrCode_B", Trim(gtblSonota(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode_B").ServerType = ORATYPE_CHAR
    
    '���ʃR�[�h�C����
    odbDatabase.Parameters.Add "InStrCode_A", Trim(frmQPAV_CEnt221.txtKyoutuuCD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode_A").ServerType = ORATYPE_CHAR
    
    '���ʖ��̂m
    odbDatabase.Parameters.Add "InStrNameN", Trim(frmQPAV_CEnt221.txtKyoutuNameKanji), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameN").ServerType = ORATYPE_VARCHAR2
    
    '���ʖ��̂w
    odbDatabase.Parameters.Add "InStrNameX", Trim(frmQPAV_CEnt221.txtKyoutuNameKana), ORAPARM_INPUT
    odbDatabase.Parameters("InStrNameX").ServerType = ORATYPE_VARCHAR2
       
    '����
    odbDatabase.Parameters.Add "InStrRiritu", Trim(frmQPAV_CEnt221.txtRiritu1) & "." _
                                & Trim(frmQPAV_CEnt221.txtRiritu2), ORAPARM_INPUT
    odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_NUMBER
    
    '�؏����x�z
    odbDatabase.Parameters.Add "InStrSGendo", Format(Trim(frmQPAV_CEnt221.txtSyousyoGendogaku), "######0"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSGendo").ServerType = ORATYPE_NUMBER
    
    '�������x�z
    odbDatabase.Parameters.Add "InStrKGendo", Format(Trim(frmQPAV_CEnt221.txtKogutiGendogaku), "######0"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrKGendo").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatUpd (" & _
            ":InStrCode_B,:InStrCode_A,:InStrNameN,:InStrNameX,:InStrRiritu,:InStrSGendo," & _
            ":InStrKGendo,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
            ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt221.lblMsg.Caption = "WPOE02 ���̋��ʃR�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt221.txtKyoutuuCD.BackColor = vbRed
        frmQPAV_CEnt221.txtKyoutuuCD.SetFocus
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
    '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrCode", frmQPAV_CEnt221.txtKyoutuuCD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220DatDel (" & _
             ":InStrCode,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM,:InstrTozaiKBN," & _
             ":InstrBushoCD,:InstrTantoNM); END;"

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
    
    odbDatabase.Parameters.Add "strSikibetu", "220", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220Lock(" & _
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
        frmQPAV_CEnt220.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "220", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt220PkG.QPAP_CEnt220UnLock(" _
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


