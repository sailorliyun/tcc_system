Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt520"
    Public bInit_Flg        As Boolean
    Public gstrCode         As String
    Public gstrSysDate      As String          '�V�X�e�����t
    Public gdatSysDate      As Date            '�V�X�e�����t
    Public gblnKizon        As Boolean  'True�F������������AFalse�F���������Ȃ�

    '���گ�ޕ\���p�z���`
    Type KeisanTbl
        Gankin                  As Long     '����
        Risoku                  As Long     '����
    End Type
    Public gtblKeisan()         As KeisanTbl

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "����(��������)�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt520.Show
 
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

    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520SelSyainZoku(" & _
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
    frmQPAV_CEnt520.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt520.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt520.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt520.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt520.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt520.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt520.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt520.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt520.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
    '���N�����ҏW
    If IsNull(odbDatabase.Parameters("OtStrBornYMD")) = False Then
        strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)
    Else
        strEdit = ""
    End If
    
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        frmQPAV_CEnt520.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt520.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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

'*************************************************************
'*  �c���擾
'*  �����Z���v�Z����PKG���ؗp����
'*    ������߂����݂̋��z�Ȃ̂ŁA���̕��͍�������
'*************************************************************
Public Function gfuncGetZandaka() As Boolean

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer
    Dim lngTblCnt           As Long
    
    Dim strYMD1 As String
    Dim strYMD2 As String
    Dim strYMD3 As String

    Const cnsMaxRec As Long = 100

On Error GoTo errgfuncGetZandaka
    
    gfuncGetZandaka = False

    Cnt = 0

    strYMD1 = Format(gdatSysDate, "yyyymm") & "01"
    strYMD2 = Format(DateAdd("m", -2, Mid(strYMD1, 1, 4) & "/" & Mid(strYMD1, 5, 2) & "/26"), "yyyymmdd")
    strYMD3 = Format(DateAdd("m", -1, Mid(strYMD1, 1, 4) & "/" & Mid(strYMD1, 5, 2) & "/25"), "yyyymmdd")
    
    '�r�o
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    '���Z�敪
    odbDatabase.Parameters.Add "InStrSeiKBN", "0", ORAPARM_INPUT        '���Z����
    odbDatabase.Parameters("InStrSeiKBN").ServerType = ORATYPE_CHAR
    '���Z�N����
    odbDatabase.Parameters.Add "InStrSeiYMD", Format(frmQPAV_CEnt520.lblNyukinYMD, "YYYYMM") & "25", ORAPARM_INPUT   '������25��
    odbDatabase.Parameters("InStrSeiYMD").ServerType = ORATYPE_CHAR
    '�J�n���t�P
    odbDatabase.Parameters.Add "InStrStrYMD1", strYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD1").ServerType = ORATYPE_CHAR
    '�J�n���t�Q
    odbDatabase.Parameters.Add "InStrStrYMD2", strYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD2").ServerType = ORATYPE_CHAR
    '�J�n���t�R
    odbDatabase.Parameters.Add "InStrStrYMD3", strYMD3, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD3").ServerType = ORATYPE_CHAR
    '�I�����t
    odbDatabase.Parameters.Add "InStrEndYMD", Format(frmQPAV_CEnt520.lblNyukinYMD, "YYYYMM") & "25", ORAPARM_INPUT
    odbDatabase.Parameters("InStrEndYMD").ServerType = ORATYPE_CHAR
    '�o�͔N
    odbDatabase.Parameters.Add "InStrShoYYYY", Mid(gstrSysDate, 1, 4), ORAPARM_INPUT
    odbDatabase.Parameters("InStrShoYYYY").ServerType = ORATYPE_CHAR
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '�J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '�������t �z��
    odbDatabase.Parameters.AddTable "OtStrYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    '�敪 �z��
    odbDatabase.Parameters.AddTable "OtStrKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 4
    '�Z�����z �z��
    odbDatabase.Parameters.AddTable "OtNumYusiKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '�ԍϋ��z �z��
    odbDatabase.Parameters.AddTable "OtNumHenKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '���� �z��
    odbDatabase.Parameters.AddTable "OtNumGanKin", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '���� �z��
    odbDatabase.Parameters.AddTable "OtNumRisoku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '�c�� �z��
    odbDatabase.Parameters.AddTable "OtStrZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '����߂�����
    odbDatabase.Parameters.Add "OtNumGanKinMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '����߂�����
    odbDatabase.Parameters.Add "OtNumRisokuMod", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030SelList ("
    strSQL = strSQL & ":InStrSyainCD,"
    strSQL = strSQL & ":InStrSeiKBN,"
    strSQL = strSQL & ":InStrSeiYMD,"
    strSQL = strSQL & ":InStrStrYMD1,"
    strSQL = strSQL & ":InStrStrYMD2,"
    strSQL = strSQL & ":InStrStrYMD3,"
    strSQL = strSQL & ":InStrEndYMD,"
    strSQL = strSQL & ":InStrShoYYYY,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrYMD,"
    strSQL = strSQL & ":OtStrKBN,"
    strSQL = strSQL & ":OtNumYusiKin,"
    strSQL = strSQL & ":OtNumHenKin,"
    strSQL = strSQL & ":OtNumGanKin,"
    strSQL = strSQL & ":OtNumRisoku,"
    strSQL = strSQL & ":OtStrZandaka,"
    strSQL = strSQL & ":OtNumGanKinMod,"
    strSQL = strSQL & ":OtNumRisokuMod,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)

        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblKeisan
            lngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt520.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt520.txtSyainCd.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        lngTblCnt = lngTblCnt + lngMax
        ReDim Preserve gtblKeisan(lngTblCnt)
        
        g = 0
        For i = lngTblCnt - lngMax + 1 To lngTblCnt
            gtblKeisan(i).Gankin = odbDatabase.Parameters("OtNumGanKin").Get_Value(g)            '����
            gtblKeisan(i).Risoku = odbDatabase.Parameters("OtNumRisoku").Get_Value(g)            '����
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�z��̍ŏI�s(���Z�s)�̂ݎg�p����
    '����߂�������������
    frmQPAV_CEnt520.lblUGanpon = Format(gtblKeisan(lngTblCnt).Gankin - odbDatabase.Parameters("OtNumGankinMod"), "#,##0")
    frmQPAV_CEnt520.lblUTesuryou = Format(gtblKeisan(lngTblCnt).Risoku - odbDatabase.Parameters("OtNumRisokuMod"), "#,##0")
    frmQPAV_CEnt520.lblUZandaka = Format(gtblKeisan(lngTblCnt).Gankin - odbDatabase.Parameters("OtNumGankinMod") _
                                       + gtblKeisan(lngTblCnt).Risoku - odbDatabase.Parameters("OtNumRisokuMod"), "#,##0")
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    
    '******** ���[�N�e�[�u���폜 ********
    '���[�U�[�h�c
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errgfuncGetZandaka
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
   
    gfuncGetZandaka = True
    
    Exit Function

errgfuncGetZandaka:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'*************************************************************
'* ���������f�[�^������
'*************************************************************
Public Function gfuncSearchKizonNyukin() As Boolean

    Dim strSQL               As String

On Error GoTo errgfuncSearchKizonNyukin
    
    gfuncSearchKizonNyukin = False

    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    '������
    odbDatabase.Parameters.Add "InstrNyukinYMD", Format(frmQPAV_CEnt520.lblNyukinYMD.Caption, "YYYYMMDD"), ORAPARM_INPUT
    odbDatabase.Parameters("InstrNyukinYMD").ServerType = ORATYPE_CHAR
    '���{
    odbDatabase.Parameters.Add "OtNumGanpon", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGanpon").ServerType = ORATYPE_NUMBER
    '����
    odbDatabase.Parameters.Add "OtNumRisoku", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRisoku").ServerType = ORATYPE_NUMBER

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520SearchKizonNyukin (" & _
            ":InStrSyainCD," & _
            ":InstrNyukinYMD," & _
            ":OtNumGanpon," & _
            ":OtNumRisoku); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    frmQPAV_CEnt520.txtNyukinGanpon.Text = Format(odbDatabase.Parameters("OtNumGanpon").Value, "#,##0")   '���{
    frmQPAV_CEnt520.txtNyukinTesuryou.Text = Format(odbDatabase.Parameters("OtNumRisoku").Value, "#,##0") '�萔��
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    gfuncSearchKizonNyukin = True
    
    Exit Function

errgfuncSearchKizonNyukin:
'�G���[����

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
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520List (" & _
            ":InStrYMD," & _
            ":OtNumRecCount," & _
            ":OtStrEndFlg," & _
            ":InStrUserID," & _
            ":InStrComputerNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        MsgBox "�{�����̓����f�[�^�͑��݂��܂���B", vbInformation + vbOKOnly, "����(��������)"
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
    
    odbDatabase.Parameters.Add "strSikibetu", "520", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 '�L�[�R�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520Lock(" & _
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
        frmQPAV_CEnt520.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "520", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520UnLock(" _
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


