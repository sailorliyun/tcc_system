Attribute VB_Name = "MainModule"
Option Explicit
    Public Const gcstrPrjName = "QPAV_CEnt230"
    Public gtblTaisyoku()   As TaisyokuTbl
    Public glngTblCnt       As Long
    Public ArryCNT          As Long
    Public CallCNT          As Long
    Public bInit_Flg        As Boolean

    Type TaisyokuTbl
       YMD                  As String
       CD                   As String
       NM                   As String
       MiseCD               As String
       MiseNM               As String
       KBN                  As String
       BumonCD              As String
       BumonNM              As String
    End Type
     
Public Sub Main()
'*************************************************************
'   �N���@�l�`�h�m
'*************************************************************
    Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�ސE�\��҈ꗗ�\�͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt230.Show 1
 
End Sub

Public Function gsubSPInit() As Boolean
'*******************************************************************************************
'   �ސE�\��҃f�[�^�擾
'*******************************************************************************************
    Dim strSQL               As String
    Dim i                    As Long
    Dim j                    As Long
    Const cnsMaxRec As Long = 100

On Error GoTo errSPInit
    gsubSPInit = False

'�������������yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/26������������
    
    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt230.vaSpread1)
    '�Ăяo���񐔃N���A
    CallCNT = 0
    '�e�[�u�������N���A
    ArryCNT = 0

'�������������yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/26������������


    '�r�o
    '�ސE�\����t�J�n��
    odbDatabase.Parameters.Add "InStrTaisyokuYMDSt", Trim(frmQPAV_CEnt230.txtNen1) & _
                               Trim(frmQPAV_CEnt230.txtTuki1) & "01", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMDSt").ServerType = ORATYPE_CHAR
    
    '�ސE�\����t�I����
    odbDatabase.Parameters.Add "InStrTaisyokuYMDEd", Trim(frmQPAV_CEnt230.txtNen2) & _
                                 Trim(frmQPAV_CEnt230.txtTuki2) & "31", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTaisyokuYMDEd").ServerType = ORATYPE_CHAR
    
    '���[�U�[ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_CHAR
    
    '�R���s���[�^�[����
    odbDatabase.Parameters.Add "InStrCompNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCompNM").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '�X�v���b�h�Ăяo����
    odbDatabase.Parameters.Add "IoNumSpCnt", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    
    '�ސE���t �z��
    odbDatabase.Parameters.AddTable "OtStrTaisyokuYMD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '�Ј��R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 8
    
    '�Ј����� �z��
    odbDatabase.Parameters.AddTable "OtStrSimei", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
       
    '�����X�R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '�����X���� �z��
    odbDatabase.Parameters.AddTable "OtStrMiseNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '�����敪 �z��
    odbDatabase.Parameters.AddTable "OtStrTozaiKBN", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 1
       
    '��������R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '�������喼�� �z��
    odbDatabase.Parameters.AddTable "OtStrBumonNM", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
   
    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt230PkG.QPAP_CEnt230SelList (" & _
            ":InStrTaisyokuYMDSt,:InStrTaisyokuYMDEd,:InStrUserID,:InStrCompNM,:InNumMaxRec," & _
            ":IoNumSpCnt,:OtStrTaisyokuYMD,:OtStrSyainCD,:OtStrSimei,:OtStrMiseCD,:OtStrMiseNM," & _
            ":OtStrTozaiKBN,:OtStrBumonCD,:OtStrBumonNM,:OtNumAryCount,:OtStrEndFlg); END;"
    Do
        '���o���R�[�h�����X�g�ɕ\��
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
        frmQPAV_CEnt230.vaSpread1.MaxRows = 0
        
        '���o������\������
        'ð��ٌ����p
        If CallCNT = 0 Then
            Erase gtblTaisyoku
            glngTblCnt = 0
        End If
    
        If odbDatabase.Parameters("OtNumAryCount") = 0 Then
            Call gsubParaRemove(odbDatabase)
            Exit Function
        End If
        
'        If ArryCNT + odbDatabase.Parameters("OtNumAryCount") > 1000 Then       '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        If ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount")) > 1000 Then  '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
            'Msg = ����ȏ�̃f�[�^�͕\���ł��܂���B
            frmQPAV_CEnt230.lblMsg.Caption = "WPOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WPO")
            Exit Function
        End If
        
        '�z��̍Ē�`
'        ArryCNT = ArryCNT + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        ArryCNT = ArryCNT + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        glngTblCnt = ArryCNT
        ReDim Preserve gtblTaisyoku(ArryCNT)
    
        i = 0
        For j = CallCNT * 100 + 1 To ArryCNT
            '�ސE�N����
            gtblTaisyoku(j).YMD = Left(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 4) & _
                                  Mid(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 5, 2) & _
                                  Right(odbDatabase.Parameters("OtStrTaisyokuYMD").Get_Value(i), 2)

            '�Ј��R�[�h
            gtblTaisyoku(j).CD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(i)
            '�Ј�����
            gtblTaisyoku(j).NM = odbDatabase.Parameters("OtStrSimei").Get_Value(i)
            '�����X�R�[�h
            gtblTaisyoku(j).MiseCD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(i)
            '�������喼��
            gtblTaisyoku(j).MiseNM = odbDatabase.Parameters("OtStrMiseNM").Get_Value(i)
            '�����敪
            gtblTaisyoku(j).KBN = odbDatabase.Parameters("OtStrTozaiKBN").Get_Value(i)
            '��������R�[�h
            gtblTaisyoku(j).BumonCD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(i)
            '�������喼��
            gtblTaisyoku(j).BumonNM = odbDatabase.Parameters("OtStrBumonNM").Get_Value(i)
            i = i + 1
        Next j
        
        '�Ăяo���񐔃J�E���g�A�b�v
        CallCNT = CallCNT + 1
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
        
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    frmQPAV_CEnt230.vaSpread1.MaxRows = ArryCNT
    
    '�f�[�^���r�o�ɃZ�b�g����
    For i = 1 To ArryCNT
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 1, i, Left(gtblTaisyoku(i).YMD, 4) & "/" & Mid(gtblTaisyoku(i).YMD, 5, 2) & "/" & Right(gtblTaisyoku(i).YMD, 2))
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 2, i, gtblTaisyoku(i).CD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 3, i, gtblTaisyoku(i).NM)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 4, i, gtblTaisyoku(i).MiseCD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 5, i, gtblTaisyoku(i).MiseNM)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 6, i, gtblTaisyoku(i).KBN)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 7, i, gtblTaisyoku(i).BumonCD)
        Call gsubSetCellText(frmQPAV_CEnt230.vaSpread1, 8, i, gtblTaisyoku(i).BumonNM)
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

