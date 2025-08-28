Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt020"
    Public bInit_Flg        As Boolean
    Public gstrCode         As String
    Public gstrYMD_B        As String
    Public gstrYMD          As String
    Public glngKingaku      As Long
    Public glngSprCol       As Long
    Public gintMode         As Integer
    Public ShimeYMD         As String

    Type NyukinTbl
       YMD                  As String
       Kingaku              As Long
       Zandaka              As Long
    End Type
     
    Public gtblNyukin()     As NyukinTbl
    Public glngTblCnt       As Long
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����Z���������͂͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt020.Show
 
End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@�Ј������擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�Ј������擾�r�o���g�p���A�Ј����������擾����
'*********************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errSeachSyain

    gfuncSeachSyain = False
    
    '�Ј������擾 �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", Space(1), ORAPARM_INPUT    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT    '�Ј��R�[�h�Q
        '�����J�i
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '��������
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '�����X�R�[�h
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '�����X��
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '�����敪
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '��������R�[�h
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '�������喼
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '���i�R�[�h
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '�����R�[�h
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '���N����
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
    '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '��ʂɕ\��
    frmQPAV_CEnt020.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt020.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt020.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt020.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt020.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt020.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt020.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt020.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt020.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
    '���N�����ҏW
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '���N����
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt020.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt020.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSeachSyain = True

    Exit Function
    
errSeachSyain:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPSet() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim lngMax               As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet
    
    gfuncSPSet = False

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt020.sprList)
    frmQPAV_CEnt020.sprList.MaxRows = 0
    For i = 0 To 2
        frmQPAV_CEnt020.cmdexec(i).Enabled = False
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
   
    '������ �z��
    odbDatabase.Parameters.AddTable "OtStrNyukinYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
      
    '�����z �z��
    odbDatabase.Parameters.AddTable "OtNumNyukingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '�c�� �z��
    odbDatabase.Parameters.AddTable "OtNumZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '�c����
    odbDatabase.Parameters.Add "OtStrZandakaYM", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZandakaYM").ServerType = ORATYPE_CHAR
      
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg," & _
            ":OtStrNyukinYMD," & _
            ":OtNumNyukingaku," & _
            ":OtNumZandaka," & _
            ":OtStrZandakaYM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '���o������\������
    'ð��ٌ����p
    Erase gtblNyukin
    glngTblCnt = 0

    If odbDatabase.Parameters("OtStrEndFlg") = "0" Then
        'Msg = �Y���f�[�^�����݂��܂���B
        frmQPAV_CEnt020.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        frmQPAV_CEnt020.txtSyainCd.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    If Trim(odbDatabase.Parameters("OtStrZandakaYM")) = "00000000" Then
        ShimeYMD = Format(gdatSysDate, "yyyymmdd")
    Else
        ShimeYMD = odbDatabase.Parameters("OtStrZandakaYM")
    End If
    
    '�z��̍Ē�`
    lngMax = odbDatabase.Parameters("OtNumAryCount")
    glngTblCnt = lngMax
    ReDim gtblNyukin(lngMax)

    For i = 1 To glngTblCnt
        '�����N����
        gtblNyukin(i).YMD = odbDatabase.Parameters("OtStrNyukinYMD").Get_Value(i - 1)
        '�����z
        gtblNyukin(i).Kingaku = odbDatabase.Parameters("OtNumNyukingaku").Get_Value(i - 1)
        '�c��
        gtblNyukin(i).Zandaka = odbDatabase.Parameters("OtNumZandaka").Get_Value(i - 1)
    Next i

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt020.sprList.MaxRows = glngTblCnt

    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 1, i, Left(gtblNyukin(i).YMD, 4) & "/" & Mid(gtblNyukin(i).YMD, 5, 2) & "/" & Right(gtblNyukin(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 2, i, Format(gtblNyukin(i).Kingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt020.sprList, 3, i, Format(gtblNyukin(i).Zandaka, "#,##0"))
    Next i

    If glngTblCnt > 0 Then
        For i = 1 To 2
            frmQPAV_CEnt020.cmdexec(i).Enabled = True
        Next i
    End If
    
    gfuncSPSet = True
    
    Exit Function

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

Public Function gfuncSPChk() As Boolean

    Dim strSQL               As String

On Error GoTo errSPChk
    
    gfuncSPChk = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT      '�Ј��R�[�h
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT     '������
    odbDatabase.Parameters("InStrNyukinYMD").ServerType = ORATYPE_CHAR
    
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT         '����t���O
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_CHAR


    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatChk (" & _
            ":InStrSyainCD," & _
            ":InStrNyukinYMD," & _
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
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT                     '������
    odbDatabase.Parameters.Add "InNumNyukingaku", glngKingaku, ORAPARM_INPUT                '�����z
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
''------->�yWin2000�Ή��zDel by Yokoyama@NBC 2004/07/05 ------->
''    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatAdd (" & _
''            ":InStrSyainCD,:InStrNyukinYMD,:InNumNyukingaku,:InStrMenuID,:InStrModuleID," & _
''            ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrRiyouKBN,:InStrTantoNM); END;"
''<-------�yWin2000�Ή��zDel by Yokoyama@NBC 2004/07/05 <-------
''------->�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/07/05 ------->
''�������R�[�h�̑���ɓ����敪���L�^����Ă����̂��C��
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatAdd (" & _
            ":InStrSyainCD,:InStrNyukinYMD,:InNumNyukingaku,:InStrMenuID,:InStrModuleID," & _
            ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"
''<-------�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/07/05 <-------
    
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
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrNyukinYMD_O", gstrYMD_B, ORAPARM_INPUT                 '�������C���O
    odbDatabase.Parameters.Add "InStrNyukinYMD_N", gstrYMD, ORAPARM_INPUT                   '�������C����
    odbDatabase.Parameters.Add "InNumNyukingaku", glngKingaku, ORAPARM_INPUT                '�����z
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatUpd (" & _
            ":InStrSyainCD,:InStrNyukinYMD_O,:InStrNyukinYMD_N,:InNumNyukingaku:InNumNyukingaku," & _
            ":InStrMenuID,:InStrModuleID,:InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD," & _
            ":InStrTantoNM); END;"

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
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrNyukinYMD", gstrYMD, ORAPARM_INPUT                     '������
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020DatDel (" & _
            ":InStrSyainCD,:InStrNyukinYMD,:InstrMenuID,:InStrModuleID,:InStrUserID," & _
            ":InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

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

Public Function gfuncListSet() As Boolean

    Dim strSQL               As String

On Error GoTo errListSet

    gfuncListSet = False
    
    '�r�o
    '�������t
    odbDatabase.Parameters.Add "InStrYMD", Format(gdatSysDate, "yyyymmdd"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
    
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020List (" & _
            ":InStrYMD," & _
            ":OtNumRecCount," & _
            ":OtStrEndFlg," & _
            ":InStrUserID," & _
            ":InStrComputerNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        MsgBox "�{�����̓����f�[�^�͑��݂��܂���B", vbInformation + vbOKOnly, "�����Z����������"
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncListSet = True
    
    Exit Function

errListSet:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "020", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 '�L�[�R�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020Lock(" & _
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
        frmQPAV_CEnt020.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "020", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt020PkG.QPAP_CEnt020UnLock(" _
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


