Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                         1.����߂����̖��������E�����\��
'                         2.�������̋敪�u�U���݁v��ǉ�
'----------------------------------------------------------------------------------------------
    
    Public Const gcstrPrjName = "QPAV_CEnt030"
    
    Public blnLoadFlg           As Boolean  '�����t���O
    
    '����M�ϐ�
    Public gstrKamiStM          As String   '����J�n��
    Public gstrKamiStD          As String   '����J�n��
    Public gstrSimoStM          As String   '�����J�n��
    Public gstrSimoStD          As String   '�����J�n��
    Public gstrKamiYMD          As String   '����J�n�N����
    Public gstrSimoYMD          As String   '�����J�n�N����
    Public gstrChuKesYMD        As String   '���Ԍ��Z�N����
    Public gstrKesYMD           As String   '���Z�N����
    Public gstrChuKesM          As String   '���Ԍ��Z��
    Public gstrChuKesD          As String   '���Ԍ��Z��
    Public gstrKesM             As String   '���Z��
    Public gstrKesD             As String   '���Z��
    Public gstrSyuYYYY          As String   '�o�͔N
    Public gstrZanYMD           As String   '�c���X�V��
    
    'SP�p�ϐ�
    Public gstrCode             As String   '�Ј��R�[�h
    Public gstrKbn              As String   '���Z�敪�i�O�F���Z����^�P�F���Z���Ȃ��j
    Public gstrSeiYMD           As String   '���Z��
    Public gstrStrYMD1          As String   '�����J�n���P
    Public gstrStrYMD2          As String   '�����J�n���Q
    Public gstrStrYMD3          As String   '�����J�n���R
    Public gstrEndYMD           As String   '�����I����
    Public gstrSyuYear          As String   '�o�͔N

    '���گ�ޕ\���p�z���`
    Type KeisanTbl
        YMD                     As String   '�N����
        KBN                     As String   '�敪
        YusiKin                 As Long     '�Z�����z
        HenKin                  As Long     '�ԍϋ��z
        Gankin                  As Long     '����
        Risoku                  As Long     '����
        Zandaka                 As Long     '�c��
    End Type
    Public gtblKeisan()         As KeisanTbl
    Public glngTblCnt           As Long
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����Z���v�Z���͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt030.Show
 
End Sub

Public Sub gsubKamiSimoSet()

'���Ѓ}�X�^������J�n�A�����J�n�A���Z�N�������擾����

    Dim strSQL               As String
    Dim i                    As Long

    Dim wk_yyyy             As Integer

On Error GoTo errKamiSimoSet
    
    '�r�o
    '���ЃR�[�h
    odbDatabase.Parameters.Add "InStrCode", "01", ORAPARM_INPUT
    odbDatabase.Parameters("InStrCode").ServerType = ORATYPE_CHAR
    
    '�����ǃR�[�h
    odbDatabase.Parameters.Add "OtStrZaimu", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZaimu").ServerType = ORATYPE_VARCHAR2
    
    '���ݒn
    odbDatabase.Parameters.Add "OtStrSyozai", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSyozai").ServerType = ORATYPE_VARCHAR2
    
    '��Ж�
    odbDatabase.Parameters.Add "OtStrKaisya", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKaisya").ServerType = ORATYPE_VARCHAR2
    
    '�U����s
    odbDatabase.Parameters.Add "OtStrFurikomi", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFurikomi").ServerType = ORATYPE_VARCHAR2
    
    '�����ԍ�
    odbDatabase.Parameters.Add "OtStrKozaNo", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNo").ServerType = ORATYPE_VARCHAR2
    
    '�������`
    odbDatabase.Parameters.Add "OtStrKozaNm", Space(40), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKozaNm").ServerType = ORATYPE_VARCHAR2
    
    '����J�n��
    odbDatabase.Parameters.Add "OtStrKamiStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStM").ServerType = ORATYPE_CHAR
    
    '����J�n��
    odbDatabase.Parameters.Add "OtStrKamiStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKamiStD").ServerType = ORATYPE_CHAR
    
    '�����J�n��
    odbDatabase.Parameters.Add "OtStrSimoStM", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStM").ServerType = ORATYPE_CHAR
    
    '�����J�n��
    odbDatabase.Parameters.Add "OtStrSimoStD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimoStD").ServerType = ORATYPE_CHAR
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrFlg").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt000PkG.QPAP_CEnt000SelJisyaM (" & _
        ":InStrCode," & _
        ":OtStrZaimu," & _
        ":OtStrSyozai," & _
        ":OtStrKaisya," & _
        ":OtStrFurikomi," & _
        ":OtStrKozaNo," & _
        ":OtStrKozaNm," & _
        ":OtStrKamiStM," & _
        ":OtStrKamiStD," & _
        ":OtStrSimoStM," & _
        ":OtStrSimoStD," & _
        ":OtStrFlg); END;"
    
    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.Parameters("OtStrFlg") = "0" Then
        'Msg = ���Ѓf�[�^�����݂��܂���B
        frmQPAV_CEnt030.lblMsg.Caption = "WPOE12 " & gstrGetCodeMeisyo(odbDatabase, "E12", "WPO")
        Call gsubParaRemove(odbDatabase)
        Exit Sub
    End If
        
    '����J�n��
    gstrKamiStM = Format(Trim(odbDatabase.Parameters("OtStrKamiStM")), "00")
    '����J�n��
    gstrKamiStD = Format(Trim(odbDatabase.Parameters("OtStrKamiStD")), "00")
    '�����J�n��
    gstrSimoStM = Format(Trim(odbDatabase.Parameters("OtStrSimoStM")), "00")
    '�����J�n��
    gstrSimoStD = Format(Trim(odbDatabase.Parameters("OtStrSimoStD")), "00")

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���N�����N�x�����肷��B
    If gdatSysDate >= CVDate(Format(gdatSysDate, "YYYY") & "/" & gstrKamiStM & "/" & gstrKamiStD) Then
        wk_yyyy = Val(Format(gdatSysDate, "yyyy"))
    Else
        wk_yyyy = Val(Format(gdatSysDate, "yyyy")) - 1
    End If
    
    '����J�n���Ɖ����J�n���𔻒肵�A����y�щ����̊J�n�N������ݒ肷��B
    If gstrKamiStM <= gstrSimoStM Then
        gstrKamiYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrKamiStM, "00") & "/" & Format(gstrKamiStD, "00")
        gstrSimoYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrSimoStM, "00") & "/" & Format(gstrSimoStD, "00")
    Else
        gstrKamiYMD = Format(wk_yyyy, "0000") & "/" & Format(gstrKamiStM, "00") & "/" & Format(gstrKamiStD, "00")
        gstrSimoYMD = Format(wk_yyyy + 1, "0000") & "/" & Format(gstrSimoStM, "00") & "/" & Format(gstrSimoStD, "00")
    End If
    
    '���Ԍ��Z�N����
    gstrChuKesYMD = Format(DateAdd("d", -1, CVDate(gstrSimoYMD)), "yyyy/mm/dd")
    '���Z�N����
    gstrKesYMD = Format(DateAdd("d", -1, CVDate(DateAdd("yyyy", 1, CVDate(gstrKamiYMD)))), "yyyy/mm/dd")
    '���Ԍ��Z��
    gstrChuKesM = Format(CVDate(gstrChuKesYMD), "mm")
    '���Ԍ��Z��
    gstrChuKesD = Format(CVDate(gstrChuKesYMD), "dd")
    '���Z��
    gstrKesM = Format(CVDate(gstrKesYMD), "mm")
    '���Z��
    gstrKesD = Format(CVDate(gstrKesYMD), "dd")
    '�o�͔N
    gstrSyuYYYY = Format(gstrKamiYMD, "yyyy")
    
    Exit Sub

errKamiSimoSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Public Sub GetZanYMD()

    Dim strSQL               As String

On Error GoTo errZanYMD
    
    '�r�o
    '�c���X�V��
    odbDatabase.Parameters.Add "OtStrZanYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrZanYMD").ServerType = ORATYPE_CHAR
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030GetZanYMD (" & _
        ":OtStrZanYMD); END;"
    
    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�c���X�V��
    If Not IsNull(odbDatabase.Parameters("OtStrZanYMD")) And Trim(odbDatabase.Parameters("OtStrZanYMD")) <> "" Then
        gstrZanYMD = Left(Trim(odbDatabase.Parameters("OtStrZanYMD")), 4) & "/" & Mid(Trim(odbDatabase.Parameters("OtStrZanYMD")), 5, 2) & "/" & Right(Trim(odbDatabase.Parameters("OtStrZanYMD")), 2)
    Else
        gstrZanYMD = Format(gdatSysDate, "yyyy/mm/dd")
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    Exit Sub

errZanYMD:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

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

    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030SelSyainZoku(" & _
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
    frmQPAV_CEnt030.lblKana.Caption = odbDatabase.Parameters("OtStrSimeiKana")                 '�l���J�i
    frmQPAV_CEnt030.lblKanji.Caption = odbDatabase.Parameters("OtStrSimeiKanji")                '�l������
    frmQPAV_CEnt030.lblTenCd.Caption = odbDatabase.Parameters("OtStrMiseCD")           '�X�R�[�h
    frmQPAV_CEnt030.lblTenNm.Caption = odbDatabase.Parameters("OtStrMiseName")           '�X��
    frmQPAV_CEnt030.lblTozai.Caption = odbDatabase.Parameters("OtStrTozaiKBN")              '�����敪
    frmQPAV_CEnt030.lblBumonCd.Caption = odbDatabase.Parameters("OtStrBumonCD")             '����R�[�h
    frmQPAV_CEnt030.lblBumonNm.Caption = odbDatabase.Parameters("OtStrBumonName")             '���喼
    frmQPAV_CEnt030.lblShikaku.Caption = odbDatabase.Parameters("OtStrSikakuCD")            '���i�R�[�h
    frmQPAV_CEnt030.lblKyu.Caption = odbDatabase.Parameters("OtStrTokyuCD")                 '�����R�[�h
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
        frmQPAV_CEnt030.lblSeinengappi.Caption = ""
    Else
        frmQPAV_CEnt030.lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
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
    Dim strWk                As String ''''2002/03/26 �r�o�ԋp�l[�敪]�ύX�ɔ����@�ҏW�ǉ�

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    gfuncSPSet = False
    
    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt030.sprList)
    
    '�r�o
    '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrSyainCD", gstrCode, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCD").ServerType = ORATYPE_CHAR
    
    '���Z�敪
    odbDatabase.Parameters.Add "InStrSeiKBN", gstrKbn, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeiKBN").ServerType = ORATYPE_CHAR
    
    '���Z�N����
    odbDatabase.Parameters.Add "InStrSeiYMD", gstrSeiYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSeiYMD").ServerType = ORATYPE_CHAR
 
    '�J�n���t�P
    odbDatabase.Parameters.Add "InStrStrYMD1", gstrStrYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD1").ServerType = ORATYPE_CHAR
 
    '�J�n���t�Q
    odbDatabase.Parameters.Add "InStrStrYMD2", gstrStrYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD2").ServerType = ORATYPE_CHAR
 
    '�J�n���t�R
    odbDatabase.Parameters.Add "InStrStrYMD3", gstrStrYMD3, ORAPARM_INPUT
    odbDatabase.Parameters("InStrStrYMD3").ServerType = ORATYPE_CHAR
 
    '�I�����t
    odbDatabase.Parameters.Add "InStrEndYMD", gstrEndYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrEndYMD").ServerType = ORATYPE_CHAR

    '�o�͔N
    odbDatabase.Parameters.Add "InStrShoYYYY", gstrSyuYear, ORAPARM_INPUT
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
    
    'ADD 20100225 0908047 NBC ISHIDA START
    '����߂�����
    odbDatabase.Parameters.Add "OtNumGanKinMod", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumGanKinMod").ServerType = ORATYPE_NUMBER

    '����߂�����
    odbDatabase.Parameters.Add "OtNumRisokuMod", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRisokuMod").ServerType = ORATYPE_NUMBER
    'ADD 20100225 0908047 NBC ISHIDA END

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
    'ADD 20100225 0908047 NBC ISHIDA START
    strSQL = strSQL & ":OtNumGanKinMod,"
    strSQL = strSQL & ":OtNumRisokuMod,"
    'ADD 20100225 0908047 NBC ISHIDA END
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
            glngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt030.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt030.txtSyainCd.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKeisan(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�������t
            gtblKeisan(i).YMD = odbDatabase.Parameters("OtStrYMD").Get_Value(g)
            '�敪
'''''''''''''��2002/03/26 �r�o�ԋp�l[�敪]�ύX�ɔ����@�ҏW�ǉ�
''''''''            gtblKeisan(i).KBN = odbDatabase.Parameters("OtStrKBN").Get_Value(g)
            ' MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
            'Select Case Left(odbDatabase.Parameters("OtStrKBN").Get_Value(g), 1)
            Select Case Right(odbDatabase.Parameters("OtStrKBN").Get_Value(g), 1)
            ' MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
                Case "1"
                    gtblKeisan(i).KBN = "�J�z"
                Case "2"
                    gtblKeisan(i).KBN = "���^"
                Case "3"
                    gtblKeisan(i).KBN = "�ܗ^"
                Case "4"
                    gtblKeisan(i).KBN = "�ݕt"
                Case "5"
                    gtblKeisan(i).KBN = "����"
                Case "6"
                    gtblKeisan(i).KBN = "���Z"
                'ADD 20100225 0908047 NBC ISHIDA START
                Case "7"
                    gtblKeisan(i).KBN = "�U��"
                'ADD 20100225 0908047 NBC ISHIDA END
            End Select
'''''''''''''��2002/03/26 �r�o�ԋp�l[�敪]�ύX�ɔ����@�ҏW�ǉ�
            
            '�Z�����z
            gtblKeisan(i).YusiKin = odbDatabase.Parameters("OtNumYusiKin").Get_Value(g)
            '�ԍϋ��z
            gtblKeisan(i).HenKin = odbDatabase.Parameters("OtNumHenKin").Get_Value(g)
            '����
            gtblKeisan(i).Gankin = odbDatabase.Parameters("OtNumGanKin").Get_Value(g)
            '����
            gtblKeisan(i).Risoku = odbDatabase.Parameters("OtNumRisoku").Get_Value(g)
            '�c��
            gtblKeisan(i).Zandaka = odbDatabase.Parameters("OtStrZandaka").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    'ADD 20100225 0908047 NBC ISHIDA START
    '�������̌����E�����\���Ή�
    If odbDatabase.Parameters("OtNumGanKinMod") <> 0 _
        Or odbDatabase.Parameters("OtNumRisokuMod") <> 0 Then
        
        '�������̌����E�����擾
        frmQPAV_CEnt030.lblModGan = odbDatabase.Parameters("OtNumGanKinMod")
        frmQPAV_CEnt030.lblModRisoku = odbDatabase.Parameters("OtNumRisokuMod")
    
        frmQPAV_CEnt030.lblModGan = Format(frmQPAV_CEnt030.lblModGan.Caption, "#,##0") & "�~"
        frmQPAV_CEnt030.lblModRisoku = Format(frmQPAV_CEnt030.lblModRisoku.Caption, "#,##0") & "�~"
    
    
        '�������̕\��
        frmQPAV_CEnt030.lblModAnnai1.Visible = True
        frmQPAV_CEnt030.lblModAnnai2.Visible = True
        frmQPAV_CEnt030.lbltxtGan.Visible = True
        frmQPAV_CEnt030.lbltxtRisoku.Visible = True
        frmQPAV_CEnt030.lblModGan.Visible = True
        frmQPAV_CEnt030.lblModRisoku.Visible = True

    End If
    'ADD 20100225 0908047 NBC ISHIDA END

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt030.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 1, i, Left(gtblKeisan(i).YMD, 4) & "/" & Mid(gtblKeisan(i).YMD, 5, 2) & "/" & Right(gtblKeisan(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 2, i, Trim(gtblKeisan(i).KBN))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 3, i, Format(gtblKeisan(i).YusiKin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 4, i, Format(gtblKeisan(i).HenKin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 5, i, Format(gtblKeisan(i).Gankin, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 6, i, Format(gtblKeisan(i).Risoku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt030.sprList, 7, i, Format(gtblKeisan(i).Zandaka, "#,##0"))
    Next i
    
    '���͐��䏈��
    '�㕔�g�p����
    frmQPAV_CEnt030.txtSyainCd.Enabled = False
    frmQPAV_CEnt030.cmdName.Enabled = False
    frmQPAV_CEnt030.txtSYuturyokuhani.Enabled = False
    For i = 0 To 1
        frmQPAV_CEnt030.optSeisan(i).Enabled = False
        frmQPAV_CEnt030.optKamiSimoKi(i).Enabled = False
    Next i
    frmQPAV_CEnt030.txtSeisanbiY.Enabled = False
    frmQPAV_CEnt030.txtSeisanbiM.Enabled = False
    frmQPAV_CEnt030.txtSeisanbiD.Enabled = False
    
    '�����g�p����
    For i = 0 To 1
        frmQPAV_CEnt030.cmdPrint(i).Enabled = True
    Next i
    frmQPAV_CEnt030.cmdPFK(5).Enabled = False
    frmQPAV_CEnt030.cmdPrint(0).SetFocus
    
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


