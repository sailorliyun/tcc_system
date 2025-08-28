Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt010"
    Public bInit_Flg        As Boolean
    Public Act_Row          As Long
    Public gstrCode         As String
    Public gstrNewFlg       As String
    Public gstrKeiyakuYMD   As String
    Public glngGendogaku    As Long
    Public glngKyuyoH       As Long
    Public glngSyoyoH       As Long
    Public gstrHenkoYM      As String
    Public gstrHenkoYM_B    As String
    Public glngKyuyo        As Long
    Public glngSyoyo        As Long

    Type HenkoTbl
       HenkoYM      As String
       Kyuyo        As Long
       Syoyo        As Long
    End Type
 
    Public gtblHenko()      As HenkoTbl
    Public glngTblCnt       As Long
    Public ShimeYMD         As String
 
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����Z���䒠�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt010.Show 1
 
End Sub

Public Function gfuncDaicyoSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long

On Error GoTo errDaicyoSet
    gfuncDaicyoSet = False

    '�r�o
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR

    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�����J�i
    odbDatabase.Parameters.Add "OtStrSimeKn", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeKn").ServerType = ORATYPE_VARCHAR2
   
    '��������
    odbDatabase.Parameters.Add "OtStrSimeKj", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeKj").ServerType = ORATYPE_VARCHAR2
   
    '�X�R�[�h
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
   
    '�X��
    odbDatabase.Parameters.Add "OtStrMiseNM", Space(24), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseNM").ServerType = ORATYPE_VARCHAR2
   
    '�����敪
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
   
    '����R�[�h
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
   
    '���喼
    odbDatabase.Parameters.Add "OtStrBumonNM", Space(24), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonNM").ServerType = ORATYPE_VARCHAR2
   
    '���i�R�[�h
    odbDatabase.Parameters.Add "OtStrSIKAKUCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSIKAKUCD").ServerType = ORATYPE_CHAR
   
    '�����R�[�h
    odbDatabase.Parameters.Add "OtStrTOKYUCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTOKYUCD").ServerType = ORATYPE_CHAR
   
    '���x�z
    odbDatabase.Parameters.Add "OtNumGendo", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGendo").ServerType = ORATYPE_NUMBER

    '�c��
    odbDatabase.Parameters.Add "OtNumZandaka", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZandaka").ServerType = ORATYPE_NUMBER

    '�V�K�t���O
    odbDatabase.Parameters.Add "OtStrNewFLG", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrNewFLG").ServerType = ORATYPE_CHAR
      
    '�c����
    odbDatabase.Parameters.Add "OtStrZandakaYM", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZandakaYM").ServerType = ORATYPE_CHAR
      
    '�����f�[�^���݃t���O�@�@2002/07/23  �ǉ�
    odbDatabase.Parameters.Add "OtStrKogutiUmu", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKogutiUmu").ServerType = ORATYPE_CHAR
      
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010SelList (" & _
            ":InStrSyainCD," & _
            ":OtStrEndFlg," & _
            ":OtStrSimeKn," & _
            ":OtStrSimeKj," & _
            ":OtStrMiseCD," & _
            ":OtStrMiseNM," & _
            ":OtStrTozaiKBN," & _
            ":OtStrBumonCD," & _
            ":OtStrBumonNM," & _
            ":OtStrSIKAKUCD," & _
            ":OtStrTOKYUCD," & _
            ":OtNumGendo," & _
            ":OtNumZandaka," & _
            ":OtStrNewFLG," & _
            ":OtStrZandakaYM," & _
            ":OtStrKogutiUmu); END;"


    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtStrEndFlg") = "0" Then
        'Msg = �Ј����������݂��܂���B
        frmQPAV_CEnt010.lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        frmQPAV_CEnt010.txtSyainCD.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '���o�������e��\������
    frmQPAV_CEnt010.lblKojinmeiKana.Caption = odbDatabase.Parameters("OtStrSimeKn")                 '�l���J�i
    frmQPAV_CEnt010.lblKojinmeiKanji.Caption = odbDatabase.Parameters("OtStrSimeKj")                '�l������
    frmQPAV_CEnt010.lblSyozokutenCD.Caption = odbDatabase.Parameters("OtStrMiseCD")                 '�X�R�[�h
    frmQPAV_CEnt010.lblSyozokuten.Caption = odbDatabase.Parameters("OtStrMiseNM")                   '�X��
    frmQPAV_CEnt010.lblTouzai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")                     '�����敪
    frmQPAV_CEnt010.lblSyozokubumCD.Caption = odbDatabase.Parameters("OtStrBumonCD")                '����R�[�h
    frmQPAV_CEnt010.lblSyozokubum.Caption = odbDatabase.Parameters("OtStrBumonNM")                  '���喼
    frmQPAV_CEnt010.lblSikakuCD.Caption = odbDatabase.Parameters("OtStrSIKAKUCD")                   '���i�R�[�h
    frmQPAV_CEnt010.lblToukyuuCD.Caption = odbDatabase.Parameters("OtStrTOKYUCD")                   '�����R�[�h
    
    'frmQPAV_CEnt010.txtGendogaku.Text = Format(odbDatabase.Parameters("OtNumGendo"), "#,##0")          '���x�z '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
    frmQPAV_CEnt010.txtGendogaku.Text = Format(CStr(odbDatabase.Parameters("OtNumGendo")), "#,##0")     '���x�z '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
    'frmQPAV_CEnt010.lblZandaka.Caption = Format(odbDatabase.Parameters("OtNumZandaka"), "#,##0")       '�c��   '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
    frmQPAV_CEnt010.lblZandaka.Caption = Format(CStr(odbDatabase.Parameters("OtNumZandaka")), "#,##0")  '�c��   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
    
    gstrNewFlg = Trim(odbDatabase.Parameters("OtStrNewFLG"))                                        '�V�K�t���O
    If Trim(odbDatabase.Parameters("OtStrZandakaYM")) = "00000000" Then
        'ShimeYMD = Format(Now, "yyyymmdd")
        ShimeYMD = Format(gdatSysDate, "yyyymmdd")
    Else
        ShimeYMD = odbDatabase.Parameters("OtStrZandakaYM")
    End If
    
    '�����f�[�^���݃`�F�b�N�@2002/07/23  �ǉ�
    If Trim$(odbDatabase.Parameters("OtStrKogutiUmu")) = "0" Then
        MsgBox """�o�^�^�X�V""�{�^����������" & vbCrLf & "�����Z���䒠�̓o�^���s���Ă��������B", vbInformation, "�Ј������䒠"
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoSet = True
    
    Exit Function

errDaicyoSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Sub gsubHensaiSet()
    
    Dim strSQL               As String
    Dim i                    As Long

    Dim lngMax               As Long  '

    Const cnsMaxRec As Long = 100

On Error GoTo errHensaiSet

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt010.sprList)
    frmQPAV_CEnt010.sprList.MaxRows = 0
    For i = 0 To 2
        frmQPAV_CEnt010.cmd_Exec(i).Enabled = False
    Next i
    
    '�r�o
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�ύX�N�� �z��
    odbDatabase.Parameters.AddTable "OtStrHenkoYM", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '���^�ԍϊz �z��
    odbDatabase.Parameters.AddTable "OtNumKyuyo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�ܗ^�ԍϊz �z��
    odbDatabase.Parameters.AddTable "OtNumSyoyo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg," & _
            ":OtStrHenkoYM," & _
            ":OtNumKyuyo," & _
            ":OtNumSyoyo); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '���o������\������
    'ð��ٌ����p
    Erase gtblHenko
    glngTblCnt = 0
    
    If odbDatabase.Parameters("OtNumAryCount") = 0 Then
        frmQPAV_CEnt010.lblKyuuyoHensai.Caption = "10,000"
        frmQPAV_CEnt010.lblSyouyoHensai.Caption = "40,000"
        Call gsubParaRemove(odbDatabase)
        Exit Sub
    End If
    
    '�z��̍Ē�`
    lngMax = odbDatabase.Parameters("OtNumAryCount")
    glngTblCnt = lngMax
    ReDim gtblHenko(lngMax)

    For i = 1 To glngTblCnt
        '�ύX�N��
        gtblHenko(i).HenkoYM = odbDatabase.Parameters("OtStrHenkoYM").Get_Value(i - 1)
        '���^�ԍϊz
        gtblHenko(i).Kyuyo = odbDatabase.Parameters("OtNumKyuyo").Get_Value(i - 1)
        '�ܗ^�ԍϊz
        gtblHenko(i).Syoyo = odbDatabase.Parameters("OtNumSyoyo").Get_Value(i - 1)
    Next i

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt010.sprList.ReDraw = False
    frmQPAV_CEnt010.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 1, i, Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2))
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 2, i, Format(gtblHenko(i).Kyuyo, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt010.sprList, 3, i, Format(gtblHenko(i).Syoyo, "#,##0"))
    Next i
    frmQPAV_CEnt010.sprList.ReDraw = True
    
    frmQPAV_CEnt010.lblKyuuyoHensai.Caption = "10,000"
    frmQPAV_CEnt010.lblSyouyoHensai.Caption = "40,000"
    For i = 1 To glngTblCnt
        'If DateDiff("y", Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2) & "/01", Now) >= 0 Then
        If DateDiff("y", Left(gtblHenko(i).HenkoYM, 4) & "/" & Right(gtblHenko(i).HenkoYM, 2) & "/01", gdatSysDate) >= 0 Then
            frmQPAV_CEnt010.lblKyuuyoHensai.Caption = Format(gtblHenko(i).Kyuyo, "#,##0")
            frmQPAV_CEnt010.lblSyouyoHensai.Caption = Format(gtblHenko(i).Syoyo, "#,##0")
            Exit For ''''2002/03/06�ǉ�  ���x���F���^�ԍρA�ܗ^�ԍύŐV�\��
        End If
    Next i
    
    For i = 1 To 2
        frmQPAV_CEnt010.cmd_Exec(i).Enabled = True
    Next i
    
    Exit Sub

errHensaiSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gfuncHenkoChk() As Boolean

    Dim strSQL               As String

On Error GoTo errHenkoChk
    
    gfuncHenkoChk = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT      '�Ј��R�[�h
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT   '�ύX�N��
    odbDatabase.Parameters("InStrHenkoYM").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '����t���O
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatChk (" & _
            ":InStrSyainCD," & _
            ":InStrHenkoYM," & _
            ":OtStrFlg); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If Trim(odbDatabase.Parameters("OtStrFlg")) = "1" Then
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoChk = True    '����
    Exit Function
  
errHenkoChk:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncDaicyoAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errDaicyoAdd
    
    gfuncDaicyoAdd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrKeiyakuYMD", gstrKeiyakuYMD, ORAPARM_INPUT             '�_��N����
    odbDatabase.Parameters.Add "InNumGendogaku", glngGendogaku, ORAPARM_INPUT               '���x�z
    odbDatabase.Parameters.Add "InNumKyuyoHensai", glngKyuyoH, ORAPARM_INPUT                '���^�ԍϊz
    odbDatabase.Parameters.Add "InNumSyoyoHensai", glngSyoyoH, ORAPARM_INPUT                '�ܗ^�ԍϊz
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010DatAdd (" & _
            ":InStrSyainCD,:InStrKeiyakuYMD,:InNumGendogaku,:InNumKyuyoHensai,:InNumSyoyoHensai," & _
            ":InStrMenuID,:InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD," & _
            ":InStrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDaicyoAdd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoAdd = True    '����
    Exit Function
  
errDaicyoAdd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncDaicyoUpd()

    Dim strSQL               As String

On Error GoTo errDaicyoUpd
    
    gfuncDaicyoUpd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InNumGendogaku", glngGendogaku, ORAPARM_INPUT               '���x�z
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010DatUpd (" & _
            ":InStrSyainCD,:InNumGendogaku,:InStrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDaicyoUpd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoUpd = True    '����
    Exit Function
  
errDaicyoUpd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errHenkoAdd
    
    gfuncHenkoAdd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT                   '�ύX�N��
    odbDatabase.Parameters.Add "InNumKyuyo", glngKyuyo, ORAPARM_INPUT                       '���^�ԍϊz
    odbDatabase.Parameters.Add "InNumSyoyo", glngSyoyo, ORAPARM_INPUT                       '�ܗ^�ԍϊz
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatAdd (" & _
            ":InStrSyainCD,:InStrHenkoYM,:InNumKyuyo,:InNumSyoyo,:InStrMenuID," & _
            ":InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN," & _
            ":InStrBushoCD,:InStrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoAdd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoAdd = True    '����
    Exit Function
  
errHenkoAdd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoUpd()

    Dim strSQL               As String

On Error GoTo errHenkoUpd
    
    gfuncHenkoUpd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrHenkoYM_O", gstrHenkoYM_B, ORAPARM_INPUT               '�ύX�N���C���O
    odbDatabase.Parameters.Add "InStrHenkoYM_N", gstrHenkoYM, ORAPARM_INPUT                 '�ύX�N���C����
    odbDatabase.Parameters.Add "InNumKyuyo", glngKyuyo, ORAPARM_INPUT                       '���^�ԍϊz
    odbDatabase.Parameters.Add "InNumSyoyo", glngSyoyo, ORAPARM_INPUT                       '�ܗ^�ԍϊz
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatUpd (" & _
            ":InStrSyainCD,:InStrHenkoYM_O,:InStrHenkoYM_N,:InNumKyuyo,:InNumSyoyo,:InStrMenuID," & _
            ":InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoUpd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoUpd = True    '����
    Exit Function
  
errHenkoUpd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncHenkoDel()

    Dim strSQL               As String

On Error GoTo errHenkoDel
    
    gfuncHenkoDel = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrHenkoYM", gstrHenkoYM, ORAPARM_INPUT                   '�ύX�N��
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt011DatDel (" & _
            ":InStrSyainCD,:InStrHenkoYM,:InStrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errHenkoDel
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncHenkoDel = True    '����
    Exit Function
  
errHenkoDel:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "010", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 '�L�[�R�[�h�i�Ј��R�[�h)
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010Lock(" & _
             ":strSikibetu,:InStrKeyInfo1,:strProgramID,:strComputerNM,:strOperatorID); END;"

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
        frmQPAV_CEnt010.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
        odbDatabase.LastServerErrReset                      '�װؾ��
        
'        gblnHaita_Lock = True
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

    odbDatabase.Parameters.Add "strSikibetu", "010", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt010PkG.QPAP_CEnt010UnLock(" _
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


