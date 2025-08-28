Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt070"
    Public bInit_Flg As Boolean
    Public Actv_flg As Long
    
    Type RirituTbl
       HenkoYMD                 As String
       Riritu                   As Double
    End Type
     
    Public gtblRiritu()         As RirituTbl
    Public glngTblCnt           As Long
    
    Public gstrHenkoYMD_B       As String       '�ύX�N�����C���O
    Public gstrHenkoYMD         As String       '�ύX�N����
    Public gdblRiritu           As Double       '����
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����ύX���͂͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt070.Show 1
 
End Sub

Public Sub gsubSPInit()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit

    Cnt = 0
    
    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt070.sprList)
    For i = 0 To 2
        frmQPAV_CEnt070.cmdExec(i).Enabled = True
    Next i
    
    '�r�o
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '��������(IoNumFetchCount
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '�ύX�N���� �z��
    odbDatabase.Parameters.AddTable "OtStrHenkoYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
    '���� �z��
    odbDatabase.Parameters.AddTable "OtNumRiritu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '����������(IoNumRecCount
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
       
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070SelList (" & _
            ":InNumMaxRec," & _
            ":IoNumSpCnt," & _
            ":OtStrHenkoYMD," & _
            ":OtNumRiritu," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg); END;"
    
    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblRiritu
            glngTblCnt = 0
            frmQPAV_CEnt070.cmdExec(0).Enabled = True
        
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblRiritu(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�ύX��
            gtblRiritu(i).HenkoYMD = odbDatabase.Parameters("OtStrHenkoYMD").Get_Value(i - 1)
            '����
            gtblRiritu(i).Riritu = odbDatabase.Parameters("OtNumRiritu").Get_Value(i - 1)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt070.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt070.sprList, 1, i, Left(gtblRiritu(i).HenkoYMD, 4) & "/" & Mid(gtblRiritu(i).HenkoYMD, 5, 2) & "/" & Right(gtblRiritu(i).HenkoYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt070.sprList, 2, i, Format(gtblRiritu(i).Riritu, "#.00") & "%")
    Next i
    
    If glngTblCnt > 0 Then
        For i = 1 To 2
            frmQPAV_CEnt070.cmdExec(i).Enabled = True
        Next i
    End If
    
    Exit Sub

errSPInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Public Function gfuncSPChk() As Boolean

    Dim strSQL               As String

On Error GoTo errSPChk
    
    gfuncSPChk = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT '�ύX�N����
    odbDatabase.Parameters("InStrHenkoYMD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '����t���O
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatChk (" & _
            ":InStrHenkoYMD," & _
            ":OtStrFlg); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If Trim(odbDatabase.Parameters("OtStrFlg")) = "1" Then
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPChk = True    '����
    Exit Function
  
errSPChk:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPAdd() As Boolean

    Dim strSQL               As String

On Error GoTo errSPAdd
    
    gfuncSPAdd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT                 '�ύX�N����
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                     '����
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatAdd (" & _
            ":InStrHenkoYMD," & _
            ":InNumRiritu," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPAdd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPAdd = True    '����
    Exit Function
  
errSPAdd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPUpd()

    Dim strSQL               As String

On Error GoTo errSPUpd
    
    gfuncSPUpd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrHenkoYMD_B", gstrHenkoYMD_B, ORAPARM_INPUT             '�ύX�N�����C���O
    odbDatabase.Parameters.Add "InStrHenkoYMD_A", gstrHenkoYMD, ORAPARM_INPUT               '�ύX�N�����C����
    odbDatabase.Parameters.Add "InNumRiritu", gdblRiritu, ORAPARM_INPUT                     '����
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatUpd (" & _
            ":InStrHenkoYMD_B," & _
            ":InStrHenkoYMD_A," & _
            ":InNumRiritu," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPUpd
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPUpd = True    '����
    Exit Function
  
errSPUpd:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPDel()

    Dim strSQL               As String

On Error GoTo errSPDel
    
    gfuncSPDel = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrHenkoYMD", gstrHenkoYMD, ORAPARM_INPUT                 '�ύX�N����
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT             '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070DatDel (" & _
            ":InStrHenkoYMD," & _
            ":InstrMenuID," & _
            ":InstrModuleID," & _
            ":InstrUserID," & _
            ":InstrComputerNM," & _
            ":InstrTozaiKBN," & _
            ":InstrBushoCD," & _
            ":InstrTantoNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errSPDel
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True    '����
    Exit Function
  
errSPDel:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "070", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT      '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070Lock(" & _
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
        frmQPAV_CEnt070.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "070", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt070PkG.QPAP_CEnt070UnLock(" _
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


