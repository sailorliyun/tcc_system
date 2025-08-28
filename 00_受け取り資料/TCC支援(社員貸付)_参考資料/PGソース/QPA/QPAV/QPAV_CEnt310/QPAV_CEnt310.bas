Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt310"
    '�G���[�ԍ�
    Public Const gintERR_OK = 0                 '����
    Public Const gintERR_DATE = 1               '���t�װ
    Public Const gintERR_MIRAI_DATE = 2         '�������t�װ
    Public Const gintERR_TIME = 3               '���Դװ
    Public Const gintERR_KINGAKU = 4            '���z�װ
    
    Public bInit_Flg        As Boolean          '���������׸�
    Public gstrSysDate      As String           '���ް���ѓ��t
    Public gstrCode         As String           '�Ј�����
    Public gstrYMD          As String           '������t
    Public gstrHMS          As String           '�������
    Public gstrDelFlg       As String           '�폜�׸�

    Public gstrName         As String           '�Ј���
    Public gstrKingaku      As String           '���z
    Public gintExecNo       As Integer          '���s�ԍ�
    Public gblnSonzaiFlg    As Boolean          '�����׸�
    Public gblnDataSetFlg   As Boolean          '�ް��ݒ��׸�
    
    '�Ј��}�X�^T����
    Type SyainMTbl
        SyainCD1            As String           '�Ј�����1
        SyainCD2            As String           '�Ј�����2
        SimeiKana           As String           '��������
        SimeiKanji          As String           '��������
        MiseCD              As String           '�X����
        MiseName            As String           '�X��
        TozaiKBN            As String           '�����敪
        BumonCD             As String           '���庰��
        BumonName           As String           '���喼
        SikakuCD            As String           '���i����
        TokyuCD             As String           '��������
        BornYMD             As String           '���N����
        TaisyokuYMD         As String           '�ސE���t
        KyusyoSTYMD         As String           '�x�E�J�n���t
        KyusyoEDYMD         As String           '�x�E�I�����t
        SonzaiFlg           As String           '�����׸�
    End Type
    
    '�����ݕt�f�[�^����
    Type KasitukeTbl
        YMD                 As String           '������t
        HMS                 As String           '�������
        Kingaku             As Long             '���z
        TourokuYMD          As String           '�o�^���t
        TourokuName         As String           '�o�^�Җ�
        flg                 As String           '�׸�
    End Type
     
    Public gtblSyainM       As SyainMTbl        '�Ј�Ͻ�����
    Public gtblKasituke()   As KasitukeTbl      '�����ݕt�ް�����
    Public glngTblCnt       As Long             '�ް�������
'**************************************************************************************************
'* �N���@�l�`�h�m
'**************************************************************************************************
Public Sub Main()
 
    Dim strCmdLine          As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����Z���ݕt�f�[�^�o�^�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt310.Show
 
End Sub
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@���������i�T�[�o�[�V�X�e�����t�擾�j
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'**************************************************************************************************
Public Function gfuncInit() As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errInit
    gfuncInit = False
    '�T�[�o�[�V�X�e�����t
    odbDatabase.Parameters.Add "OtStrSysDate", "", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Init(:OtStrSysDate); END;"

     'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
     
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")
    '�T�[�o�[�V�X�e�����t�ҏW
    gstrSysDate = CDate(Left(gstrSysDate, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Right(gstrSysDate, 2))
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncInit = True

    Exit Function
    
errInit:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

''**************************************************************************************************
''*�@�@�@�\�T�v�F�@�蓮����T�̊����`�F�b�N������
''*�@�@���@���@�F�@lngRecCnt�c�f�[�^������
''*�@�@���@�ʁ@�F�@True�c����  False�c���s
''**************************************************************************************************
Public Function gfuncKgcKasitukeTChk(ByRef lngRecCnt As Long, ByVal lngExecNo As Long) As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errKgcTChk

    gfuncKgcKasitukeTChk = False

    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    '������t
    odbDatabase.Parameters.Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
    '�������
    odbDatabase.Parameters.Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
    '���z
    odbDatabase.Parameters.Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKingaku").ServerType = ORATYPE_VARCHAR2
    '�o�^���t
    odbDatabase.Parameters.Add "InStrTourokuYMD", Format(gstrSysDate, "yyyymmdd"), ORAPARM_INPUT
    odbDatabase.Parameters("InStrTourokuYMD").ServerType = ORATYPE_CHAR
    '���sNo
    odbDatabase.Parameters.Add "InNumExecNo", lngExecNo, ORAPARM_INPUT
    odbDatabase.Parameters("InNumExecNo").ServerType = ORATYPE_NUMBER
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_Cent310KgcKasitukeTChk(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku, " & _
             ":InStrTourokuYMD, " & _
             ":InNumExecNo, " & _
             ":OtNumRecCount); END;"

     'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    lngRecCnt = odbDatabase.Parameters("OtNumRecCount")

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncKgcKasitukeTChk = True

    Exit Function

errKgcTChk:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@�����Z���䒠T�̑��݃`�F�b�N������
'*�@�@���@���@�F�@lngRecCnt�c�f�[�^������
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'**************************************************************************************************
Public Function gfuncDaicyoChk(ByRef lngRecCnt As Long) As Boolean
    Dim strSQL              As String           'PL/SQL

On Error GoTo errDaicyoChk
    
    gfuncDaicyoChk = False
    
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_Cent310KgcDaicyoChk(" & _
             ":InStrSyainCD, " & _
             ":OtNumRecCount); END;"

     'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
     
    lngRecCnt = RTrim(odbDatabase.Parameters("OtNumRecCount"))

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncDaicyoChk = True

    Exit Function
    
errDaicyoChk:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@�Ј������擾�r�o���g�p���A�Ј����������擾����
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'**************************************************************************************************
Public Function gfuncSeachSyain() As Boolean
    Dim strSQL              As String           'PL/SQL
    
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
        '�ގЌ���
    odbDatabase.Parameters.Add "OtStrTaisyokuYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTaisyokuYMD").ServerType = ORATYPE_VARCHAR2
        '�x�E�J�n����
    odbDatabase.Parameters.Add "OtStrKyusyoSTYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKyusyoSTYMD").ServerType = ORATYPE_VARCHAR2
        '�x�E�I������
    odbDatabase.Parameters.Add "OtStrKyusyoEDYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKyusyoEDYMD").ServerType = ORATYPE_VARCHAR2
        '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310SelSyainZoku(" & _
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
             ":OtStrTaisyokuYMD, " & _
             ":OtStrKyusyoSTYMD, " & _
             ":OtStrKyusyoEDYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    gtblSyainM.SonzaiFlg = odbDatabase.Parameters("OtStrSonzaiFlg")
    '�Y���f�[�^����
    If gtblSyainM.SonzaiFlg = "1" Then
        gtblSyainM.SimeiKana = odbDatabase.Parameters("OtStrSimeiKana")                     '�l���J�i
        gtblSyainM.SimeiKanji = odbDatabase.Parameters("OtStrSimeiKanji")                   '�l������
        gtblSyainM.MiseCD = odbDatabase.Parameters("OtStrMiseCD")                           '�X�R�[�h
        gtblSyainM.MiseName = odbDatabase.Parameters("OtStrMiseName")                       '�X��
        gtblSyainM.TozaiKBN = odbDatabase.Parameters("OtStrTozaiKBN")                       '�����敪
        gtblSyainM.BumonCD = odbDatabase.Parameters("OtStrBumonCD")                         '����R�[�h
        gtblSyainM.BumonName = odbDatabase.Parameters("OtStrBumonName")                     '���喼
        gtblSyainM.SikakuCD = odbDatabase.Parameters("OtStrSikakuCD")                       '���i�R�[�h
        gtblSyainM.TokyuCD = odbDatabase.Parameters("OtStrTokyuCD")                         '�����R�[�h
        gtblSyainM.BornYMD = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)            '���N����
        gtblSyainM.TaisyokuYMD = Trim$(odbDatabase.Parameters("OtStrTaisyokuYMD").Value)    '�ސE����
        gtblSyainM.KyusyoSTYMD = Trim$(odbDatabase.Parameters("OtStrKyusyoSTYMD").Value)    '�x�E�J�n����
        gtblSyainM.KyusyoEDYMD = Trim$(odbDatabase.Parameters("OtStrKyusyoEDYMD").Value)    '�x�E�I������
        
        '���N�����ҏW
        If IsNull(gtblSyainM.BornYMD) Or Trim$(gtblSyainM.BornYMD) = "" Or _
                Trim$(gtblSyainM.BornYMD) = "0" Or Trim$(gtblSyainM.BornYMD) = "00000000" Then
            gtblSyainM.BornYMD = ""
        Else
            gtblSyainM.BornYMD = Mid$(gtblSyainM.BornYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.BornYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.BornYMD, 7, 2)
        End If
    
        '�ސE�J�n�����ҏW
        If IsNull(gtblSyainM.TaisyokuYMD) Or Trim$(gtblSyainM.TaisyokuYMD) = "" Or _
                Trim$(gtblSyainM.TaisyokuYMD) = "0" Or Trim$(gtblSyainM.TaisyokuYMD) = "00000000" Then
            gtblSyainM.TaisyokuYMD = ""
        Else
            gtblSyainM.TaisyokuYMD = Mid$(gtblSyainM.TaisyokuYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.TaisyokuYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.TaisyokuYMD, 7, 2)
        End If
        
        '�x�E�J�n�����ҏW
        If IsNull(gtblSyainM.KyusyoSTYMD) Or Trim$(gtblSyainM.KyusyoSTYMD) = "" Or _
                Trim$(gtblSyainM.KyusyoSTYMD) = "0" Or Trim$(gtblSyainM.KyusyoSTYMD) = "00000000" Then
            gtblSyainM.KyusyoSTYMD = ""
        Else
            gtblSyainM.KyusyoSTYMD = Mid$(gtblSyainM.KyusyoSTYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.KyusyoSTYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.KyusyoSTYMD, 7, 2)
        End If
    
         '�x�E�I�������ҏW
        If IsNull(gtblSyainM.KyusyoEDYMD) Or Trim$(gtblSyainM.KyusyoEDYMD) = "" Or _
                Trim$(gtblSyainM.KyusyoEDYMD) = "0" Or Trim$(gtblSyainM.KyusyoEDYMD) = "00000000" Then
            gtblSyainM.KyusyoEDYMD = ""
        Else
            gtblSyainM.KyusyoEDYMD = Mid$(gtblSyainM.KyusyoEDYMD, 1, 4) & "/" & _
                                        Mid$(gtblSyainM.KyusyoEDYMD, 5, 2) & "/" & _
                                                Mid$(gtblSyainM.KyusyoEDYMD, 7, 2)
        End If
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
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@�ݕt�����擾����
'*�@�@���@���@�F�@lngRecCnt�c�f�[�^������
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'**************************************************************************************************
Public Function gfuncSPGet(ByRef lngRecCnt As Long) As Boolean

    Dim strSQL              As String           'PL/SQL
    Dim i                   As Long
    Dim g                   As Long
    Dim lngMax              As Long
    Dim Cnt                 As Integer
    Dim strData             As String           '�ް�

    Const cnsMaxRec As Long = 100

On Error GoTo errSPGet
    
    gfuncSPGet = False

    Cnt = 0
    
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
      
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    odbDatabase.Parameters("OtStrDataAry").MinimumSize = 200
    
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
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310SelList (" & _
            ":InStrSyainCD," & _
            ":InNumMaxRec," & _
            ":IoNumCursor," & _
            ":OtStrDataAry," & _
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
    
            lngRecCnt = odbDatabase.Parameters("OtNumRecCount")
            If lngRecCnt = 0 Then
                Exit Do
            End If
        
        End If
    
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKasituke(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            strData = odbDatabase.Parameters("OtStrDataAry").Get_Value(g)

            '�����
            gtblKasituke(i).YMD = gfncstrDlm(strData)
            '�������
            gtblKasituke(i).HMS = gfncstrDlm(strData)
            '���z
            gtblKasituke(i).Kingaku = gfncstrDlm(strData)
            '�o�^���t
            gtblKasituke(i).TourokuYMD = gfncstrDlm(strData)
            '�o�^�Җ�
            gtblKasituke(i).TourokuName = gfncstrDlm(strData)
            '�蓮�t���O
            gtblKasituke(i).flg = gfncstrDlm(strData)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    Loop Until Trim(odbDatabase.Parameters("OtStrEndFlg")) = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPGet = True
    
    Exit Function

errSPGet:
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
    
    odbDatabase.Parameters.Add "strSikibetu", "310", ORAPARM_INPUT                      '���ʃR�[�h
    odbDatabase.Parameters.Add "InStrKeyInfo1", gstrCode, ORAPARM_INPUT                 '�L�[�R�[�h
    odbDatabase.Parameters.Add "strProgramID", gcstrPrjName, ORAPARM_INPUT              '�v���O�����h�c
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^��
    odbDatabase.Parameters.Add "strOperatorID", gstrCommandLine(1), ORAPARM_INPUT       '�I�y���[�^�h�c

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Lock(" & _
             ":strSikibetu," & _
             ":InStrKeyInfo1," & _
             ":strProgramID," & _
             ":strComputerNM," & _
             ":strOperatorID); END;"

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
        frmQPAV_CEnt310.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
        
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

    odbDatabase.Parameters.Add "strSikibetu", "310", ORAPARM_INPUT                  '����
    odbDatabase.Parameters.Add "strComputerNM", gstrCommandLine(5), ORAPARM_INPUT   '�R���s���[�^�[��

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310UnLock(" _
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
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@�ݕt�f�[�^��ǉ�����
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'**************************************************************************************************
Public Function gfuncSPIns() As Boolean
    Dim strSQL              As String           'PL/SQL
    
On Error GoTo errSPIns

    gfuncSPIns = False
    
    With odbDatabase.Parameters
        '�Ј��R�[�h
        .Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
        '������t
        .Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
        .Item("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
        '�������
        .Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
        .Item("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
        '���z
        .Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
        .Item("InStrKingaku").ServerType = ORATYPE_VARCHAR2
        '�o�^ID
        .Add "InStrTourokuID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrTourokuID").ServerType = ORATYPE_VARCHAR2
        '�X�R�[�h
        .Add "InStrMiseCd", RTrim(gtblSyainM.MiseCD), ORAPARM_INPUT
        .Item("InStrMiseCd").ServerType = ORATYPE_VARCHAR2
        '���j���[ID        �I�y���O�p
        .Add "InstrMenuID", "QPA", ORAPARM_INPUT
        .Item("InstrMenuID").ServerType = ORATYPE_VARCHAR2
        '���W���[��ID      �I�y���O�p
        .Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT
        .Item("InStrModuleID").ServerType = ORATYPE_VARCHAR2
        '�o�^�S����ID      �I�y���O�p
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        '�o�^�S����        �I�y���O�p
        .Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
        .Item("InStrTantoNM").ServerType = ORATYPE_VARCHAR2
        '�R���s���[�^�[��  �I�y���O�p
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        '���p�敪          �I�y���O�p
        .Add "InStrRiyouKBN", gstrCommandLine(10), ORAPARM_INPUT
        .Item("InStrRiyouKBN").ServerType = ORATYPE_VARCHAR2
        '�����R�[�h        �I�y���O�p
        .Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
        .Item("InstrBushoCD").ServerType = ORATYPE_VARCHAR2
    End With

    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Ins(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku, " & _
             ":InStrTourokuID, " & _
             ":InStrMiseCd, " & _
             ":InstrMenuID, " & _
             ":InStrModuleID, " & _
             ":InStrUserID, " & _
             ":InStrTantoNM, " & _
             ":InStrComputerNM, " & _
             ":InStrRiyouKBN, " & _
             ":InstrBushoCD " & _
             "); END;"

     'SP�̎��s
    Call odbDatabase.DbexecuteSQL(strSQL)
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPIns = True

    Exit Function
    
errSPIns:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@�ݕt�f�[�^���폜����
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'**************************************************************************************************
Public Function gfuncSPDel() As Boolean
    Dim strSQL      As String
    
On Error GoTo errSPDel

    gfuncSPDel = False
    
    With odbDatabase.Parameters
        '�Ј��R�[�h
        .Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
        '�o�^���t
        .Add "InStrTorihikiYMD", gstrYMD, ORAPARM_INPUT
        .Item("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
        '�o�^����
        .Add "InStrTorihikiHMS", gstrHMS, ORAPARM_INPUT
        .Item("InStrTorihikiHMS").ServerType = ORATYPE_VARCHAR2
        '���z
        .Add "InStrKingaku", gstrKingaku, ORAPARM_INPUT
        .Item("InStrKingaku").ServerType = ORATYPE_VARCHAR2
        '���j���[ID        �I�y���O�p
        .Add "InstrMenuID", "QPA", ORAPARM_INPUT
        .Item("InstrMenuID").ServerType = ORATYPE_VARCHAR2
        '���W���[��ID      �I�y���O�p
        .Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT
        .Item("InStrModuleID").ServerType = ORATYPE_VARCHAR2
        '�o�^�S����ID      �I�y���O�p
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        '�o�^�S����        �I�y���O�p
        .Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT
        .Item("InStrTantoNM").ServerType = ORATYPE_VARCHAR2
        '�R���s���[�^�[��  �I�y���O�p
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        '���p�敪          �I�y���O�p
        .Add "InStrRiyouKBN", gstrCommandLine(10), ORAPARM_INPUT
        .Item("InStrRiyouKBN").ServerType = ORATYPE_VARCHAR2
        '�����R�[�h        �I�y���O�p
        .Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT
        .Item("InstrBushoCD").ServerType = ORATYPE_VARCHAR2
    End With
    strSQL = "BEGIN QPAP_CEnt310PkG.QPAP_CEnt310Del(" & _
             ":InStrSyainCD, " & _
             ":InStrTorihikiYMD, " & _
             ":InStrTorihikiHMS, " & _
             ":InStrKingaku," & _
             ":InstrMenuID, " & _
             ":InStrModuleID, " & _
             ":InStrUserID, " & _
             ":InStrTantoNM, " & _
             ":InStrComputerNM, " & _
             ":InStrRiyouKBN, " & _
             ":InstrBushoCD); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfuncSPDel = True

    Exit Function
    
errSPDel:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'**************************************************************************************************
'*�@�@�@�\�T�v�F�@���t�`�F�b�N
'*�@�@���@���@�F�@strChkDate�c�`�F�b�N������t
'*�@�@���@�ʁ@�F�@0�cOK  1�c�ߋ����t�װ  2�c�������t�װ
'**************************************************************************************************
Public Function DateCheckNo(ByVal strChkDate As String) As Integer
    Dim strLastDate         As String           '�ߋ����t
    Dim strCheck            As String           '�ԋp�l�i�����p�j

    DateCheckNo = gintERR_OK
    
    '�ߋ����t�`�F�b�N
    '�o�^�����P���`�T���͑O�X���Q�U����蓖���܂œo�^�n�j
    If Day(CDate(gstrSysDate)) < 6 Then
        strLastDate = CStr(DateAdd("m", -2, CDate(gstrSysDate)))
    
    '�o�^�����U���ȍ~�͑O���Q�U����蓖���܂œo�^�n�j
    Else
        strLastDate = CStr(DateAdd("m", -1, CDate(gstrSysDate)))
    End If
    
    strLastDate = Mid(strLastDate, 1, 8)
    strLastDate = strLastDate & "26"

    strCheck = DateDiff("d", CDate(strLastDate), CDate(strChkDate))
    If CLng(strCheck) < 0 Then
        DateCheckNo = gintERR_DATE
        Exit Function
    End If

    '�������t�`�F�b�N
    strCheck = DateDiff("d", CDate(gstrSysDate), CDate(strChkDate))
    If CLng(strCheck) > 0 Then
        DateCheckNo = gintERR_MIRAI_DATE
        Exit Function
    End If

End Function


