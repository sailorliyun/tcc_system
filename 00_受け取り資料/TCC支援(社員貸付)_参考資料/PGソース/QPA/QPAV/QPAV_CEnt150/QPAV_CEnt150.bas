Attribute VB_Name = "MainModule"
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           ����A�o�͔N�����u�Q���i�������j�v�܂��́u�W���i������j�v�̎��̂�
'                           �\�����Ă���u�����������^���A�ܗ^���A���v�v���A�u�T���i�l�������j�v
'                           ����сu�P�P���v�ɂ��\������悤�ύX����B
'20100713  1004091          ���o�����ɂ��铌���敪���폜
'                           �������̃f�[�^����x�ɕ\���E������s��
'----------------------------------------------------------------------------------------------
    Public Const gcstrPrjName = "QPAV_CEnt150"
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
'ADD 20100225 0908047 NBC SAWAME START
    Public gstr14KesM           As String   '���l�������Z��
    Public gstr34KesM           As String   '��O�l�������Z��
'ADD 20100225 0908047 NBC SAWAME END
    
    'SP�p�ϐ�
    Public gstrStrYMD           As String   '�����N����
    Public gstrKBN              As String   '�����敪
    Public gstrKyuyoYMD         As String   '���^���t
    Public gintKyuyoNisu        As Integer  '���^����
    '2003/01/24�����v�Z�C��
    Public gintKyuyoNisuFrom    As String   '���^�����擾���̏W�v�͈�(�n)
    Public gintKyuyoNisuTo      As String   '���^�����擾���̏W�v�͈�(�I)

    Type ZandakaTbl
        Code                    As String
        MiseNM                  As String
        SCount                  As Long
        KCount                  As Long
        SyosyoZandaka           As Long
        KoguchiZandaka          As Long
        SyosyoMisyuK            As Long
        SyosyoMisyuS            As Long
        KoguchiMisyu            As Long
    End Type
 
    Public gtblZandaka()        As ZandakaTbl
    Public glngTblCnt           As Long
    Public gstrSysDate          As String          '�V�X�e�����t
    Public gdatSysDate          As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
'mod 20101119 XXXXXXX imz.Yoshida start
'        MsgBox "�ݕt���c���\�͊��ɋN������Ă��܂��B" _
'            , vbExclamation Or vbOKOnly, gcstrPrjName
        MsgBox "�c���}�C�i�X���X�g�͊��ɋN������Ă��܂��B" _
            , vbExclamation Or vbOKOnly, gcstrPrjName
'mod 20101119 XXXXXXX imz.Yoshida end
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

    frmQPAV_CEnt150.Show 1
 
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
        frmQPAV_CEnt150.lblMsg.Caption = "WPOE12 " & gstrGetCodeMeisyo(odbDatabase, "E12", "WPO")
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
'ADD 20100225 0908047 NBC SAWAME START
    '���l�������Z��
    gstr14KesM = CStr(IIf(CInt(gstrChuKesM) + 3 > 12, CInt(gstrChuKesM) + 3 - 12, CInt(gstrChuKesM) + 3))
    '��O�l�������Z��
    gstr34KesM = CStr(IIf(CInt(gstrKesM) + 3 > 12, CInt(gstrKesM) + 3 - 12, CInt(gstrKesM) + 3))
'ADD 20100225 0908047 NBC SAWAME END
    
    Exit Sub

errKamiSimoSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub


'**********************************************************************************************************************************
'*  Ver2
'*    �ܗ^�c���X�V�O�f�[�^�擾�@�@(QPAY_SYNDAICYOWT���擾)
'**********************************************************************************************************************************
Public Sub gsubSPSet_BeforeUpdate()

    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Dim MiseNM_WORK          As String
    Dim KaisyaNM_WORK         As String
    Dim Count_WORK           As Long
    Dim SyosyoZandaka_WORK   As Long
    Dim KoguchiZandaka_WORK  As Long
    Dim SyosyoMisyuK_WORK    As Long
    Dim SyosyoMisyuS_WORK    As Long
    Dim KoguchiMisyu_WORK    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt150.sprList)
    frmQPAV_CEnt150.sprList.MaxRows = 0
    
    '�r�o
    '�������t
    With odbDatabase.Parameters
        .Add "InStrYMD", gstrStrYMD, ORAPARM_INPUT
        .Item("InStrYMD").ServerType = ORATYPE_CHAR
        
        '�����敪
        .Add "InStrTozaiKBN", gstrKBN, ORAPARM_INPUT
        .Item("InStrTozaiKBN").ServerType = ORATYPE_CHAR
        
        '���Ԍ��Z��
        .Add "InStrTyuSeiMM", gstrChuKesM, ORAPARM_INPUT
        .Item("InStrTyuSeiMM").ServerType = ORATYPE_CHAR
     
        '���Z��
        .Add "InStrSeiMM", gstrKesM, ORAPARM_INPUT
        .Item("InStrSeiMM").ServerType = ORATYPE_CHAR
     
        '���^���t
        .Add "InStrKyuyoYMD", gstrKyuyoYMD, ORAPARM_INPUT
        .Item("InStrKyuyoYMD").ServerType = ORATYPE_CHAR
     
        '���^����
        .Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT
        .Item("InNumKyuyoNisu").ServerType = ORATYPE_NUMBER
    
'        '2003/01/24 �����v�Z�p�W�v�͈�(�n)
        .Add "InNumKyuyoNisuFrom", gintKyuyoNisuFrom, ORAPARM_INPUT
        .Item("InNumKyuyoNisuFrom").ServerType = ORATYPE_NUMBER
'
'        '2003/01/24 �����v�Z�p�W�v�͈�(�I)
        .Add "InNumKyuyoNisuTo", gintKyuyoNisuTo, ORAPARM_INPUT
        .Item("InNumKyuyoNisuTo").ServerType = ORATYPE_NUMBER

        'MaxRec
        .Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
        .Item("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
        '�J�[�\���h�c
        .Add "IoNumCursor", 0, ORAPARM_BOTH
        .Item("IoNumCursor").ServerType = ORATYPE_NUMBER
    
        '����������
        .Add "OtNumRecCount", 0, ORAPARM_BOTH
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    
        '�z��i�[����
        .Add "OtNumAryCount", 0, ORAPARM_OUTPUT
        .Item("OtNumAryCount").ServerType = ORATYPE_NUMBER
        
        '�����I���t���O
        .Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
        .Item("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
        '�R�[�h �z��
        .AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
        '�X�� �z��
        .AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
        '�؏����� �z��
        .AddTable "OtNumSCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�������� �z��
        .AddTable "OtNumKCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏��c�� �z��
        .AddTable "OtNumSyosyoZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�����c�� �z��
        .AddTable "OtNumKoguchiZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏������������^ �z��
        .AddTable "OtNumSyosyoMisyuK", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏����������ܗ^ �z��
        .AddTable "OtNumSyosyoMisyuS", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '������������ �z��
        .AddTable "OtNumKoguchiMisyu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�S���҃R�[�h
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        '�R���s���[�^��
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150SelList_Before ("
    strSQL = strSQL & ":InStrYMD,"
    strSQL = strSQL & ":InStrTozaiKBN,"
    strSQL = strSQL & ":InStrTyuSeiMM,"
    strSQL = strSQL & ":InStrSeiMM,"
    strSQL = strSQL & ":InStrKyuyoYMD,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumKyuyoNisuFrom,"
    strSQL = strSQL & ":InNumKyuyoNisuTo,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrCode,"
    strSQL = strSQL & ":OtStrMiseNM,"
    strSQL = strSQL & ":OtNumSCount,"
    strSQL = strSQL & ":OtNumKCount,"
    strSQL = strSQL & ":OtNumSyosyoZandaka,"
    strSQL = strSQL & ":OtNumKoguchiZandaka,"
    strSQL = strSQL & ":OtNumSyosyoMisyuK,"
    strSQL = strSQL & ":OtNumSyosyoMisyuS,"
    strSQL = strSQL & ":OtNumKoguchiMisyu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        '�r�o�̎��s
        Call odbDatabase.DbexecuteSQL(strSQL)

        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblZandaka
            glngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt150.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt150.txtSyuturyokuY.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblZandaka(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�R�[�h
            gtblZandaka(i).Code = odbDatabase.Parameters("OtStrCode").Get_Value(g)
            '�X��
            gtblZandaka(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '�؏�����
            gtblZandaka(i).SCount = odbDatabase.Parameters("OtNumSCount").Get_Value(g)
            '��������
            gtblZandaka(i).KCount = odbDatabase.Parameters("OtNumKCount").Get_Value(g)
            '�؏��c��
            gtblZandaka(i).SyosyoZandaka = odbDatabase.Parameters("OtNumSyosyoZandaka").Get_Value(g)
            '�����c��
            gtblZandaka(i).KoguchiZandaka = odbDatabase.Parameters("OtNumKoguchiZandaka").Get_Value(g)
            '�؏������������^
            gtblZandaka(i).SyosyoMisyuK = odbDatabase.Parameters("OtNumSyosyoMisyuK").Get_Value(g)
            '�؏������������^
            gtblZandaka(i).SyosyoMisyuS = odbDatabase.Parameters("OtNumSyosyoMisyuS").Get_Value(g)
            '������������
            gtblZandaka(i).KoguchiMisyu = odbDatabase.Parameters("OtNumKoguchiMisyu").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    j = 1
    For i = 1 To glngTblCnt
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "�؏�")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "����")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "�v")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount + gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka + gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS + gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
    Next i
    
    '���͐��䏈��
    '�e�R���g���[������
    frmQPAV_CEnt150.cmdPrint(0).Enabled = True
    frmQPAV_CEnt150.cmdPrint(1).Enabled = True
    frmQPAV_CEnt150.cmdPFK(5).Enabled = False
    frmQPAV_CEnt150.fraTozai.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuY.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuM.Enabled = False
    
    
    Exit Sub

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

'**********************************************************************************************************************************
'*  Ver2
'*    �ܗ^�c���X�V��f�[�^�擾 (QPA8_SYNDAICYOT���擾)
'**********************************************************************************************************************************
Public Sub gsubSPSet_AfterUpdate()

    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Dim MiseNM_WORK          As String
    Dim KaisyaNM_WORK         As String
    Dim Count_WORK           As Long
    Dim SyosyoZandaka_WORK   As Long
    Dim KoguchiZandaka_WORK  As Long
    Dim SyosyoMisyuK_WORK    As Long
    Dim SyosyoMisyuS_WORK    As Long
    Dim KoguchiMisyu_WORK    As Long

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt150.sprList)
    frmQPAV_CEnt150.sprList.MaxRows = 0
    
    With odbDatabase.Parameters
        '�r�o
        '�������t
        .Add "InStrYMD", gstrStrYMD, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
        
        '�����敪
        .Add "InStrTozaiKBN", gstrKBN, ORAPARM_INPUT
        .Item("InStrTozaiKBN").ServerType = ORATYPE_CHAR
        
        '���Ԍ��Z��
        .Add "InStrTyuSeiMM", gstrChuKesM, ORAPARM_INPUT
        .Item("InStrTyuSeiMM").ServerType = ORATYPE_CHAR
     
        '���Z��
        .Add "InStrSeiMM", gstrKesM, ORAPARM_INPUT
        .Item("InStrSeiMM").ServerType = ORATYPE_CHAR
     
        '���^���t
        .Add "InStrKyuyoYMD", gstrKyuyoYMD, ORAPARM_INPUT
        .Item("InStrKyuyoYMD").ServerType = ORATYPE_CHAR
     
        '���^����
        .Add "InNumKyuyoNisu", gintKyuyoNisu, ORAPARM_INPUT
        .Item("InNumKyuyoNisu").ServerType = ORATYPE_NUMBER
     
'        '2003/01/24 �����v�Z�p�W�v�͈�(�n)
        .Add "InNumKyuyoNisuFrom", gintKyuyoNisuFrom, ORAPARM_INPUT
        .Item("InNumKyuyoNisuFrom").ServerType = ORATYPE_NUMBER
'
'        '2003/01/24 �����v�Z�p�W�v�͈�(�I)
        .Add "InNumKyuyoNisuTo", gintKyuyoNisuTo, ORAPARM_INPUT
        .Item("InNumKyuyoNisuTo").ServerType = ORATYPE_NUMBER
     
        'MaxRec
        .Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
        .Item("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
        '�J�[�\���h�c
        .Add "IoNumCursor", 0, ORAPARM_BOTH
        .Item("IoNumCursor").ServerType = ORATYPE_NUMBER
    
        '����������
        .Add "OtNumRecCount", 0, ORAPARM_BOTH
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    
        '�z��i�[����
        .Add "OtNumAryCount", 0, ORAPARM_OUTPUT
        .Item("OtNumAryCount").ServerType = ORATYPE_NUMBER
        
        '�����I���t���O
        .Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
        .Item("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    
        '�R�[�h �z��
        .AddTable "OtStrCode", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 10
    
        '�X�� �z��
        .AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
        '�؏����� �z��
        .AddTable "OtNumSCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�������� �z��
        .AddTable "OtNumKCount", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏��c�� �z��
        .AddTable "OtNumSyosyoZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�����c�� �z��
        .AddTable "OtNumKoguchiZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏������������^ �z��
        .AddTable "OtNumSyosyoMisyuK", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�؏����������ܗ^ �z��
        .AddTable "OtNumSyosyoMisyuS", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '������������ �z��
        .AddTable "OtNumKoguchiMisyu", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
        
        '�S���҃R�[�h
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        '�R���s���[�^��
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150SelList_After ("
    strSQL = strSQL & ":InStrYMD,"
    strSQL = strSQL & ":InStrTozaiKBN,"
    strSQL = strSQL & ":InStrTyuSeiMM,"
    strSQL = strSQL & ":InStrSeiMM,"
    strSQL = strSQL & ":InStrKyuyoYMD,"
    strSQL = strSQL & ":InNumKyuyoNisu,"
    strSQL = strSQL & ":InNumKyuyoNisuFrom,"
    strSQL = strSQL & ":InNumKyuyoNisuTo,"
    strSQL = strSQL & ":InNumMaxRec,"
    strSQL = strSQL & ":IoNumCursor,"
    strSQL = strSQL & ":OtNumRecCount,"
    strSQL = strSQL & ":OtNumAryCount,"
    strSQL = strSQL & ":OtStrEndFlg,"
    strSQL = strSQL & ":OtStrCode,"
    strSQL = strSQL & ":OtStrMiseNM,"
    strSQL = strSQL & ":OtNumSCount,"
    strSQL = strSQL & ":OtNumKCount,"
    strSQL = strSQL & ":OtNumSyosyoZandaka,"
    strSQL = strSQL & ":OtNumKoguchiZandaka,"
    strSQL = strSQL & ":OtNumSyosyoMisyuK,"
    strSQL = strSQL & ":OtNumSyosyoMisyuS,"
    strSQL = strSQL & ":OtNumKoguchiMisyu,"
    strSQL = strSQL & ":InStrUserID,"
    strSQL = strSQL & ":InStrComputerNM"
    strSQL = strSQL & "); END;"

    Do
        '�r�o�̎��s
        Call odbDatabase.DbexecuteSQL(strSQL)

        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblZandaka
            glngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt150.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt150.txtSyuturyokuY.SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblZandaka(glngTblCnt)
        
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�R�[�h
            gtblZandaka(i).Code = odbDatabase.Parameters("OtStrCode").Get_Value(g)
            '�X��
            gtblZandaka(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '�؏�����
            gtblZandaka(i).SCount = odbDatabase.Parameters("OtNumSCount").Get_Value(g)
            '��������
            gtblZandaka(i).KCount = odbDatabase.Parameters("OtNumKCount").Get_Value(g)
            '�؏��c��
            gtblZandaka(i).SyosyoZandaka = odbDatabase.Parameters("OtNumSyosyoZandaka").Get_Value(g)
            '�����c��
            gtblZandaka(i).KoguchiZandaka = odbDatabase.Parameters("OtNumKoguchiZandaka").Get_Value(g)
            '�؏������������^
            gtblZandaka(i).SyosyoMisyuK = odbDatabase.Parameters("OtNumSyosyoMisyuK").Get_Value(g)
            '�؏������������^
            gtblZandaka(i).SyosyoMisyuS = odbDatabase.Parameters("OtNumSyosyoMisyuS").Get_Value(g)
            '������������
            gtblZandaka(i).KoguchiMisyu = odbDatabase.Parameters("OtNumKoguchiMisyu").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    j = 1
    For i = 1 To glngTblCnt
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "�؏�")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "����")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
        frmQPAV_CEnt150.sprList.MaxRows = frmQPAV_CEnt150.sprList.MaxRows + 1
        If Trim(gtblZandaka(i).Code) = "OTHER" Then
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, Trim(gtblZandaka(i).MiseNM))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 1, j, "��������")
        End If
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 2, j, Trim(gtblZandaka(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 3, j, "�v")
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 4, j, Format(gtblZandaka(i).KCount + gtblZandaka(i).SCount, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt150.sprList, 5, j, Format(gtblZandaka(i).KoguchiZandaka + gtblZandaka(i).SyosyoZandaka, "#,##0"))
'DEL 20100225 0908047 NBC SAWAME START
'        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'DEL 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC SAWAME START
        '���l���Z���A��O�l���Z���ǉ�
        If Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrKesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
            Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
                Val(frmQPAV_CEnt150.txtSyuturyokuM.Text) = Val(gstr34KesM) Then
'ADD 20100225 0908047 NBC SAWAME END
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).KoguchiMisyu, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, Format(gtblZandaka(i).SyosyoMisyuS, "#,##0"))
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, Format(gtblZandaka(i).SyosyoMisyuK + gtblZandaka(i).SyosyoMisyuS + gtblZandaka(i).KoguchiMisyu, "#,##0"))
        Else
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 6, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 7, j, "")
            Call gsubSetCellText(frmQPAV_CEnt150.sprList, 8, j, "")
        End If
        j = j + 1
    Next i
    
    '���͐��䏈��
    '�e�R���g���[������
    frmQPAV_CEnt150.cmdPrint(0).Enabled = True
    frmQPAV_CEnt150.cmdPrint(1).Enabled = True
    frmQPAV_CEnt150.cmdPFK(5).Enabled = False
    frmQPAV_CEnt150.fraTozai.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuY.Enabled = False
    frmQPAV_CEnt150.txtSyuturyokuM.Enabled = False
    
    
    Exit Sub

errSPSet:
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

'2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή�
'*********************************************************************************************
'*�@�@�֐����@�F�@�X�e�[�u���ܗ^���擾
'*�@�@���@���@�F�@�����P�i��޼ު�āj
'*�@�@�@�@�@�@�@�@�����Q�i�ܗ^�敪�@�@����F�P�@�����F�ȊO�j
'*�@�@�@�@�@�@�@�@�����R�i�ܗ^�N�����j
'*�@�@���@�ʁ@�F�@�X�e�[�u���̈�ԋ߂��ܗ^����Ԃ��B
'*�@�@�@�\�T�v�F�@�X�e�[�u���̈�ԋ߂��ܗ^����Ԃ��B
'*�@�@�@�\�ǉ��F�@�Q�O�O�Q�N�T���Q�W��
'*********************************************************************************************
Public Function strGetShoyoDate(odbDatabase As Object, strShoyoKbn As String, _
                                 strShoyoDate As String) As String
Dim strCodeNo   As String
Dim objTable    As Object
Dim lngRet      As Long
Dim strSQL      As String
    
    On Error GoTo GetDate_Error
    
    strGetShoyoDate = ""
    
    
    'SQL���̍쐬
    strSQL = gstrGetCodeTableSQL(strShoyoKbn, strShoyoDate)
    
    Set objTable = odbDatabase.CreateDynaset(strSQL, ORADYN_DEFAULT)
    
    '�e�[�u���I�[�v��
    If objTable Is Nothing Then
        GoTo GetDate_Error
    End If
    
    If strShoyoKbn = "1" Then
        '����ܗ^���f�[�^�擾
        If Not objTable.EOF Then
            strGetShoyoDate = objTable.Fields("MAX(QPAE_BONUSYMD1)")
        End If
    Else
        '�����ܗ^���f�[�^�擾
        If Not objTable.EOF Then
            strGetShoyoDate = objTable.Fields("MAX(QPAE_BONUSYMD2)")
        End If
    End If
    
    
    '���
    Set objTable = Nothing
    
    Exit Function

GetDate_Error:

    
End Function


'2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή�
'*********************************************************************************************
'*�@�@�֐����@�F�@�X�e�[�u����SQL���쐬
'*�@�@���@���@�F�@�����P�i���އ��j
'*�@�@�@�@�@�@�@�@�����Q�i���ދ敪�j
'*�@�@���@�ʁ@�F�@�����ɂč쐬����SQL��
'*�@�@�@�\�T�v�F�@�����ɂĺ���ð��َQ�Ƃ�SQL�����쐬����B
'*�@�@�@�\�ǉ��F�@�Q�O�O�Q�N�T���Q�W��
'*********************************************************************************************
Public Function gstrGetCodeTableSQL(strShoyoKbn As String, strShoyoDate As String) As String
Dim strSQL As String
    
    If strShoyoKbn = "1" Then
    
        'SQL���̍쐬
        strSQL = "SELECT" _
            & " MAX(QPAE_BONUSYMD1)" _
            & " FROM" _
            & " QPAE_MISEM" _
            & " WHERE" _
            & " QPAE_BONUSYMD1 <= '" & Trim$(strShoyoDate) & "'"
    Else
  
        'SQL���̍쐬
        strSQL = "SELECT" _
            & " MAX(QPAE_BONUSYMD2)" _
            & " FROM" _
            & " QPAE_MISEM" _
            & " WHERE" _
            & " QPAE_BONUSYMD2 <= '" & Trim$(strShoyoDate) & "'"
  
    End If
    
    gstrGetCodeTableSQL = strSQL
    
End Function


