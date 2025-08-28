Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt190"
    Public Act_Row          As Long
    Public Mode_FLG         As String
    Public gtblMise()       As MiseTbl
    Public gtblSeisan()     As SeisanTbl
    Public glngTblCnt       As Long
    Public bInit_Flg        As Boolean
    Public CallCnt          As Long
    Public ArryCnt          As Long
    Public SelData(6)       As String
    Public UnlF             As Integer
    
    Type MiseTbl
       CD                   As String
       NM                   As String
       Syoyo1               As String
       Syoyo2               As String
       SeisanCD             As String
       SeisanNM             As String
       TozaiE               As String
       TozaiW               As String
    End Type
 
    Type SeisanTbl
        CD                  As String
        NM                  As String
    End Type
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*******************************************************************************************
'   �N���@�l�`�h�m
'*******************************************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�X�}�X�^�����e�i���X�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt190.Show
    
 
End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   �X�f�[�^�擾
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False
    
    CallCnt = 0
    ArryCnt = 0
    
     '�r�o
     'MaxRec
     odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
     odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
     
     '�X�R�[�h �z��
     odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
     
     '�X���� �z��
     odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
     
     '�ܗ^�x����1 �z��
     odbDatabase.Parameters.AddTable "OtStrBonusYMD1", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
     
     '�ܗ^�x����2 �z��
     odbDatabase.Parameters.AddTable "OtStrBonusYMD2", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
     
     '���Z�X�R�[�h �z��
     odbDatabase.Parameters.AddTable "OtStrSeisanCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
     
     '���Z�X���� �z��
     odbDatabase.Parameters.AddTable "OtStrSeisanNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
     
     '�����敪�i���j �z��
     odbDatabase.Parameters.AddTable "OtStrTozaiKBNE", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
     
     '�����敪�i���j �z��
     odbDatabase.Parameters.AddTable "OtStrTozaiKBNW", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
     
     '�z��i�[����
     odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
     odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
     
     '�����I���t���O
     odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
     odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
     '�r�p�k���̍쐬
     strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190SelList (" & _
             ":InNumMaxRec,:OtStrMiseCD,:OtStrMiseNM,:OtStrBonusYMD1,:OtStrBonusYMD2,:OtStrSeisanCD," & _
             ":OtStrSeisanNM,:OtStrTozaiKBNE,:OtStrTozaiKBNW,:OtNumAryCount,:OtStrEndFlg); END;"
    
     Do
    
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
        '���o������\������
        'ð��ٌ����p
        If CallCnt = 0 Then
            Erase gtblMise
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
            frmQPAV_CEnt190.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Do
        End If
        
'        ArryCnt = ArryCnt + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCnt = ArryCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        
        glngTblCnt = ArryCnt
        ReDim Preserve gtblMise(ArryCnt)
    
        i = 0
        For j = CallCnt * 100 + 1 To ArryCnt
            '�X�R�[�h
            gtblMise(j).CD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '�X����
            gtblMise(j).NM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            '�ܗ^�x����1
            If Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)) = "" Then
                gtblMise(j).Syoyo1 = ""
            Else
                gtblMise(j).Syoyo1 = Left(Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)), 2) & "/" _
                                    & Right(Trim(odbDatabase.Parameters("OtStrBonusYMD1").Get_Value(i)), 2)
            End If
            '�ܗ^�x����2
            If Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)) = "" Then
                gtblMise(j).Syoyo2 = ""
            Else
                gtblMise(j).Syoyo2 = Left(Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)), 2) & "/" _
                                    & Right(Trim(odbDatabase.Parameters("OtStrBonusYMD2").Get_Value(i)), 2)
            End If
            '���Z�X�R�[�h
            gtblMise(j).SeisanCD = odbDatabase.Parameters("OtStrSeisanCD").Get_Value(i)
            '���Z�X����
            gtblMise(j).SeisanNM = odbDatabase.Parameters("OtStrSeisanNM").Get_Value(i)
            '�����敪�i���j
            gtblMise(j).TozaiE = odbDatabase.Parameters("OtStrTozaiKBNE").Get_Value(i)
            '�����敪�i���j
            gtblMise(j).TozaiW = odbDatabase.Parameters("OtStrTozaiKBNW").Get_Value(i)
        
            i = i + 1
        Next j
    
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCnt = CallCnt + 1
        
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
        
    frmQPAV_CEnt190.vaSpread1.MaxRows = ArryCnt
    
    '�f�[�^���r�o�ɃZ�b�g����
    For i = 1 To ArryCnt
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 1, i, gtblMise(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 2, i, gtblMise(i).NM)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 3, i, gtblMise(i).Syoyo1)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 4, i, gtblMise(i).Syoyo2)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 5, i, gtblMise(i).SeisanCD)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 6, i, gtblMise(i).SeisanNM)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 7, i, gtblMise(i).TozaiE)
        Call gsubSetCellText(frmQPAV_CEnt190.vaSpread1, 8, i, gtblMise(i).TozaiW)
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

Public Sub gsubSeisanCD_get()
'*******************************************************************************************
'   ���Z�X�R�[�h�擾
'*******************************************************************************************
    Dim strSQL      As String
    Dim i           As Long
    Dim j           As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    CallCnt = 0
    ArryCnt = 0
    
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
    
     '�r�p�k���̍쐬
     strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190SeisanCDList (" & _
             ":InNumMaxRec,:OtStrSeisanCD,:OtStrSeisanNM,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Do
    
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
            Exit Sub
        End If
        
        '�z��̍Ē�`
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

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    '�f�[�^���R���{�ɃZ�b�g����
    frmQPAV_CEnt191.cobSeisantenCD.Clear
    For i = 1 To ArryCnt
        frmQPAV_CEnt191.cobSeisantenCD.AddItem gtblSeisan(i).CD
    Next i

    Exit Sub

errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gsubSPAdd() As Boolean
'*******************************************************************************************
'   �X�f�[�^�o�^
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPAdd = False
   
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
    
    '�X����
    odbDatabase.Parameters.Add "InStrMiseNM", Trim(frmQPAV_CEnt191.txtMiseName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseNM").ServerType = ORATYPE_VARCHAR2
    
    '�ܗ^�x����1
    odbDatabase.Parameters.Add "InStrBonusYMD1", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM1.Text) _
                                    & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD1").ServerType = ORATYPE_CHAR
    
    '�ܗ^�x����2
    odbDatabase.Parameters.Add "InStrBonusYMD2", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM2.Text) _
                                    & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD2").ServerType = ORATYPE_CHAR
    
    '���Z�X�R�[�h
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt191.cobSeisantenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '�����敪�i���j
    odbDatabase.Parameters.Add "InStrTozaiKBNE", Trim(frmQPAV_CEnt191.cobTouzaiHigasi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNE").ServerType = ORATYPE_CHAR
    
    '�����敪�i���j
    odbDatabase.Parameters.Add "InStrTozaiKBNW", Trim(frmQPAV_CEnt191.cobTouzaiNisi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNW").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatAdd (" & _
            ":InStrMiseCD,:InStrMiseNM,:InStrBonusYMD1,:InStrBonusYMD2,:InStrSeisanCD," & _
            ":InStrTozaiKBNE,:InStrTozaiKBNW,:InstrMenuId,:InstrModuleID,:InstrUserID," & _
            ":InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�X�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE02 ���̓X�R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt191.txtMiseCD.BackColor = vbRed
        frmQPAV_CEnt191.txtMiseCD.SetFocus
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
'   �X�f�[�^ �C��
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPUpd = False
    
    '�r�o
    '�X�R�[�h�C���O
    odbDatabase.Parameters.Add "InStrMiseCD_B", Trim(gtblMise(Act_Row).CD), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD_B").ServerType = ORATYPE_CHAR
    
    '�X�R�[�h�C����
    odbDatabase.Parameters.Add "InStrMiseCD_A", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD_A").ServerType = ORATYPE_CHAR
    
    '�X����
    odbDatabase.Parameters.Add "InStrMiseNM", Trim(frmQPAV_CEnt191.txtMiseName.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseNM").ServerType = ORATYPE_VARCHAR2
    
    '�ܗ^�x����1
    odbDatabase.Parameters.Add "InStrBonusYMD1", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM1.Text) _
                                        & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD1.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD1").ServerType = ORATYPE_CHAR
    
    '�ܗ^�x����2
    odbDatabase.Parameters.Add "InStrBonusYMD2", Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuMM2.Text) _
                                        & Trim(frmQPAV_CEnt191.txtSyouyoSIkyuuDD2.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrBonusYMD2").ServerType = ORATYPE_CHAR
    
    '���Z�X�R�[�h
    odbDatabase.Parameters.Add "InStrSeisanCD", Trim(frmQPAV_CEnt191.cobSeisantenCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeisanCD").ServerType = ORATYPE_CHAR
    
    '�����敪��
    odbDatabase.Parameters.Add "InStrTozaiKBNE", Trim(frmQPAV_CEnt191.cobTouzaiHigasi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNE").ServerType = ORATYPE_CHAR
    
    '�����敪��
    odbDatabase.Parameters.Add "InStrTozaiKBNW", Trim(frmQPAV_CEnt191.cobTouzaiNisi.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozaiKBNW").ServerType = ORATYPE_CHAR
    
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
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatUpd (" & _
            ":InStrMiseCD_B,:InStrMiseCD_A,:InStrMiseNM,:InStrBonusYMD1,:InStrBonusYMD2," & _
            ":InStrSeisanCD,:InStrTozaiKBNE,:InStrTozaiKBNW,:InstrMenuID,:InstrModuleID," & _
            ":InstrUserID,:InstrComputerNM,:InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrDupF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�X�R�[�h�����ɓo�^����Ă����ꍇ
    If Trim(odbDatabase.Parameters("OtStrDupF")) = "1" Then
        'Msg = �͊��ɓo�^����Ă��܂��B
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE02 ���̓X�R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
        frmQPAV_CEnt191.txtMiseCD.BackColor = vbRed
        frmQPAV_CEnt191.txtMiseCD.SetFocus
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
'   �X�f�[�^ �폜
'*******************************************************************************************
    Dim strSQL               As String

On Error GoTo errSPInit
    gsubSPDel = False
    
    '�r�o
    '�X�R�[�h
    odbDatabase.Parameters.Add "InStrMiseCD", Trim(frmQPAV_CEnt191.txtMiseCD.Text), ORAPARM_INPUT
    odbDatabase.Parameters("InStrMiseCD").ServerType = ORATYPE_CHAR
        
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
    odbDatabase.Parameters.Add "OtStrMiseF", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseF").ServerType = ORATYPE_CHAR
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190DatDel (" & _
            ":InStrMiseCD,:InstrMenuID,:InstrModuleID,:InstrUserID,:InstrComputerNM," & _
            ":InstrTozaiKBN,:InstrBushoCD,:InstrTantoNM,:OtStrMiseF); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '���Z�X�R�[�h���X�}�X�^�ɓo�^����Ă��鎞�͍폜�ł��Ȃ�
    If Trim(odbDatabase.Parameters("OtStrMiseF")) = "1" Then
        'Msg = ���̓X�R�[�h�͍폜�ł��܂���B
        frmQPAV_CEnt191.lblMsg.Caption = "WPOE26 " & gstrGetCodeMeisyo(odbDatabase, "E26", "WPO")
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
    
    odbDatabase.Parameters.Add "strSikibetu", "190", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190Lock(" & _
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
        frmQPAV_CEnt190.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "190", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt190PkG.QPAP_CEnt190UnLock(" _
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


