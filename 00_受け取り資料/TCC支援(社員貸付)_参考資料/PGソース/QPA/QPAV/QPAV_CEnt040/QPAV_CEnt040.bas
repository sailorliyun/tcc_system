Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt040"
 Public bInit_Flg As Boolean

    Type NyukinTbl
       TorokuYMD    As String
       MiseNM       As String
       BumonNM      As String
       SyainCD      As String
       SimeiKanji   As String
       Nyukingaku   As Long
       Zandaka      As Long
       Gendo        As Long
       NyukinYMD    As String
    End Type
     
    Public gtblNyukin()   As NyukinTbl
    Public glngTblCnt       As Long

    Public gstrYMD1         As String
    Public gstrYMD2         As String
    Public gstrKBN          As String
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�����������͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt040.Show 1
 
End Sub

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    Cnt = 0

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt040.sprList)
    frmQPAV_CEnt040.sprList.MaxRows = 0
    
    '�r�o
    '�J�n���t
    odbDatabase.Parameters.Add "InStrYMD1", gstrYMD1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD1").ServerType = ORATYPE_CHAR
 
    '�I�����t
    odbDatabase.Parameters.Add "InStrYMD2", gstrYMD2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD2").ServerType = ORATYPE_CHAR

    '���t�敪
    odbDatabase.Parameters.Add "InStrKBN", gstrKBN, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKBN").ServerType = ORATYPE_CHAR

    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER

    '�J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER

    '�������t �z��
    odbDatabase.Parameters.AddTable "OtStrTorokuYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8

    '�X�� �z��
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '���喼 �z��
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '�Ј��R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '�������� �z��
    odbDatabase.Parameters.AddTable "OtStrSimeikanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    
    '�����z �z��
    odbDatabase.Parameters.AddTable "OtStrNyukingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�c�� �z��
    odbDatabase.Parameters.AddTable "OtStrZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���x�z �z��
    odbDatabase.Parameters.AddTable "OtNumGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '������ �z��
    odbDatabase.Parameters.AddTable "OtNumNyukinYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER

    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
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
    strSQL = "BEGIN QPAP_CEnt040PkG.QPAP_CEnt040SelList (" & _
             ":InStrYMD1," & _
             ":InStrYMD2," & _
             ":InStrKBN," & _
             ":InNumMaxRec," & _
             ":IoNumCursor," & _
             ":OtStrTorokuYMD," & _
             ":OtStrMiseNM," & _
             ":OtStrBumonNM," & _
             ":OtStrSyainCD," & _
             ":OtStrSimeikanji," & _
             ":OtStrNyukingaku," & _
             ":OtStrZandaka," & _
             ":OtNumGendo," & _
             ":OtNumNyukinYMD," & _
             ":OtNumRecCount," & _
             ":OtNumAryCount," & _
             ":OtStrEndFlg," & _
             ":InStrUserID," & _
             ":InStrComputerNM); END;"

    Do
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)

        If Cnt = 0 Then
            '���o������\������
            'ð��ٌ����p
            Erase gtblNyukin
            glngTblCnt = 0
            '���f�[�^������ZERO�̂Ƃ��̓G���[
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                'Msg = �Y���f�[�^�����݂��܂���B
                frmQPAV_CEnt040.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt040.txtTouroku(0).SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
'        If glngTblCnt + odbDatabase.Parameters("OtNumAryCount") > 1000 Then        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
        If glngTblCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
            'Msg = ����ȏ�̃f�[�^�͕\���ł��܂���B
            frmQPAV_CEnt040.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Call gsubParaRemove(odbDatabase)
            Exit Sub
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblNyukin(glngTblCnt)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�������t
            gtblNyukin(i).TorokuYMD = odbDatabase.Parameters("OtStrTorokuYMD").Get_Value(g)
            '�X��
            gtblNyukin(i).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(g)
            '���喼
            gtblNyukin(i).BumonNM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(g)
            '�Ј��R�[�h
            gtblNyukin(i).SyainCD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(g)
            '��������
            gtblNyukin(i).SimeiKanji = odbDatabase.Parameters("OtStrSimeikanji").Get_Value(g)
            '�����z
            gtblNyukin(i).Nyukingaku = odbDatabase.Parameters("OtStrNyukingaku").Get_Value(g)
            '�c��
            gtblNyukin(i).Zandaka = odbDatabase.Parameters("OtStrZandaka").Get_Value(g)
            '���x�z
            gtblNyukin(i).Gendo = odbDatabase.Parameters("OtNumGendo").Get_Value(g)
            '������
            gtblNyukin(i).NyukinYMD = odbDatabase.Parameters("OtNumNyukinYMD").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt040.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 1, i, Left(gtblNyukin(i).TorokuYMD, 4) & "/" & Mid(gtblNyukin(i).TorokuYMD, 5, 2) & "/" & Right(gtblNyukin(i).TorokuYMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 2, i, Trim(gtblNyukin(i).MiseNM))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 3, i, Trim(gtblNyukin(i).BumonNM))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 4, i, Trim(gtblNyukin(i).SyainCD))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 5, i, Trim(gtblNyukin(i).SimeiKanji))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 6, i, Format(gtblNyukin(i).Nyukingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 7, i, Format(gtblNyukin(i).Zandaka, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 8, i, Format(gtblNyukin(i).Gendo, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt040.sprList, 9, i, Left(gtblNyukin(i).NyukinYMD, 4) & "/" & Mid(gtblNyukin(i).NyukinYMD, 5, 2) & "/" & Right(gtblNyukin(i).NyukinYMD, 2))
    Next i
    
    '���͐��䏈��
    For i = 0 To 5
        frmQPAV_CEnt040.txtTouroku(i).Enabled = False
    Next i
    frmQPAV_CEnt040.cboNyukinKBN.Enabled = False
    If gstrKBN = "0" Then
        For i = 0 To 1
            frmQPAV_CEnt040.cmdPrint(i).Enabled = True
        Next i
    End If
    frmQPAV_CEnt040.cmdPFK(5).Enabled = False
    If gstrKBN = "0" Then
        frmQPAV_CEnt040.cmdPrint(0).SetFocus
    Else
        frmQPAV_CEnt040.cmdPFK(12).SetFocus
    End If
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


