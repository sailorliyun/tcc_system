Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt060"
    Public bInit_Flg  As Boolean
    Public gstrCode         As String
    Public gstrYMD          As String
    Public gstrHMS          As String
    Public gstrDelFlg       As String

    Type KasitukeTbl
       YMD              As String
       HMS              As String
       Kingaku          As Long
       flg              As String
    End Type
     
    Public gtblKasituke()   As KasitukeTbl
    Public glngTblCnt       As Long

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�ݕt���f�[�^�v�����͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt060.Show
 
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

    strSQL = "BEGIN QPAP_CEnt060PkG.QPAP_CEnt060SelSyainZoku(" & _
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
    frmQPAV_CEnt060.lblFurigana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt060.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt060.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt060.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt060.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt060.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt060.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt060.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt060.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
    '���N�����ҏW
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '���N����
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt060.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt060.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet
    
    gfuncSPSet = False

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt060.sprList)
    frmQPAV_CEnt060.sprList.MaxRows = 0
    
    '�r�o
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR

    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '�J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
      
    '����� �z��
    odbDatabase.Parameters.AddTable "OtStrTorihikiYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
      
    '������� �z��
    odbDatabase.Parameters.AddTable "OtStrTorihikiHMS", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
      
    '���z �z��
    odbDatabase.Parameters.AddTable "OtNumKingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

    '����t���O �z��
    odbDatabase.Parameters.AddTable "OtStrDelFLG", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1

    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
       
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt060PkG.QPAP_CEnt060SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":IoNumCursor," & _
            ":OtStrTorihikiYMD," & _
            ":OtStrTorihikiHMS," & _
            ":OtNumKingaku," & _
            ":OtStrDelFLG," & _
            ":OtNumRecCount," & _
            ":OtNumAryCount," & _
            ":OtStrEndFlg); END;"
    
    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblKasituke
            glngTblCnt = 0
    
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt060.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt060.txtSyainCD.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
        
        End If
    
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKasituke(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�����
            gtblKasituke(i).YMD = odbDatabase.Parameters("OtStrTorihikiYMD").Get_Value(g)
            '�������
            gtblKasituke(i).HMS = odbDatabase.Parameters("OtStrTorihikiHMS").Get_Value(g)
            '���z
            gtblKasituke(i).Kingaku = odbDatabase.Parameters("OtNumKingaku").Get_Value(g)
            '����t���O
            gtblKasituke(i).flg = odbDatabase.Parameters("OtStrDelFLG").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt060.sprList.MaxRows = glngTblCnt

    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt060.sprList, 1, i, Left(gtblKasituke(i).YMD, 4) & "/" & Mid(gtblKasituke(i).YMD, 5, 2) & "/" & Right(gtblKasituke(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt060.sprList, 2, i, Left(gtblKasituke(i).HMS, 2) & ":" & Mid(gtblKasituke(i).HMS, 3, 2) & ":" & Right(gtblKasituke(i).HMS, 2))
        Call gsubSetCellText(frmQPAV_CEnt060.sprList, 3, i, Format(gtblKasituke(i).Kingaku, "#,##0"))
        If gtblKasituke(i).flg = "1" Then
            Call gsubSetCellText(frmQPAV_CEnt060.sprList, 4, i, "��")
        Else
            Call gsubSetCellText(frmQPAV_CEnt060.sprList, 4, i, "")
        End If
    Next i

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

Public Function gfuncSPUpd()

    Dim strSQL               As String

On Error GoTo errSPUpd
    
    gfuncSPUpd = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT                      '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT                   '������t
    odbDatabase.Parameters.Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT                   '�������
    odbDatabase.Parameters.Add "InStrDelFLG", gstrDelFlg, ORAPARM_INPUT                     '����t���O
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt060PkG.QPAP_CEnt060DatUpd ("
    strSQL = strSQL & ":InStrSyainCD,"
    strSQL = strSQL & ":InStrTorihikiYMD,"
    strSQL = strSQL & ":InStrTorihikiHMS,"
    strSQL = strSQL & ":InStrDelFLG,"
    strSQL = strSQL & ":InStrMenuID,"
    strSQL = strSQL & ":InStrModuleID,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM,"
    strSQL = strSQL & ":InStrRiyouKBN,"
    strSQL = strSQL & ":InStrBushoCD,"
    strSQL = strSQL & ":InStrTantoNM"
    strSQL = strSQL & "); END;"

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

Public Function gblnHaita_Lock() As Boolean
'*****************************************************************************************
'   �r������i���b�N�j
'*****************************************************************************************
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errgblnHaita

    gblnHaita_Lock = False
    
    odbDatabase.Parameters.Add "strSikibetu", "060", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                      '�L�[�R�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt060PkG.QPAP_CEnt060Lock(" & _
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
        frmQPAV_CEnt060.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "060", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt060PkG.QPAP_CEnt060UnLock(" _
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




