Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QPAV_CEnt050"
 Public bInit_Flg   As Boolean

'*********************************************************
'   SP�p�f�[�^�i�[�ϐ�
'*********************************************************

 Public lngErrCode           As Long          '�װ����
 Public strErrDescription    As String        '�װү����
 Public pubstrSakuseibi      As String       '�쐬���@10��11�@��ʑJ�ڎ��쐬�����n���p
 Public gblnEndFlg           As Boolean      '�ڍ׉�ʁ��Ɖ��ʑJ�ڎ������p
                                             'True=�ƭ� �^ False=�O���
                                            
Type kasitukeTbl
   TorihikiHMS   As String
   Kasituketen   As String
   WSName        As String
   MiseCD        As String
   BumonCD       As String
   SyainCD       As String
   SimeiKanji    As String
   Kingaku       As Long
   Zandaka       As Long
   Gendo         As Long
End Type
 
Public gtblKasituke()   As kasitukeTbl
Public glngTblCnt       As Long

Public gstrSyoriYMD     As String
 Public gstrSysDate             As String          '�V�X�e�����t
 Public gdatSysDate             As Date            '�V�X�e�����t

'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�ݕt������͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt050.Show 1
 
End Sub

Public Sub gsubSPSet()

    Dim strSQL               As String
    Dim i                    As Long
    Dim g                    As Long
    Dim lngMax               As Long  '
    Dim Cnt                  As Integer

    Const cnsMaxRec As Long = 100

On Error GoTo errSPSet

    '�X�v���b�h�N���A
    Call gsubSpdClear(frmQPAV_CEnt050.sprList)
    
    '�r�o
    '�ݕt���t
    odbDatabase.Parameters.Add "InStrTorihikiYMD", gstrSyoriYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTorihikiYMD").ServerType = ORATYPE_CHAR
    
    '���[�U�[ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_CHAR
    
    '�R���s���[�^�[����
    odbDatabase.Parameters.Add "InStrCompNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrCompNM").ServerType = ORATYPE_CHAR
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    
    '�J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER

    '�ݕt���� �z��
    odbDatabase.Parameters.AddTable "OtStrTorihikiHMS", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '�ݕt�X �z��
    odbDatabase.Parameters.AddTable "OtStrKasituketen", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '�v�r�� �z��
    odbDatabase.Parameters.AddTable "OtStrWSName", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 8
    
    '�X�R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrMiseCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 3
    
    '����R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrBumonCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 6
    
    '�Ј��R�[�h �z��
    odbDatabase.Parameters.AddTable "OtStrSyainCD", ORAPARM_OUTPUT, ORATYPE_CHAR, cnsMaxRec, 7
    
    '�������� �z��
    odbDatabase.Parameters.AddTable "OtStrSimeiKanji", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 24
    
    '���z �z��
    odbDatabase.Parameters.AddTable "OtNumKingaku", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '�c�� �z��
    odbDatabase.Parameters.AddTable "OtNumZandaka", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec
    
    '���x�z �z��
    odbDatabase.Parameters.AddTable "OtNumGendo", ORAPARM_OUTPUT, ORATYPE_NUMBER, cnsMaxRec

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
    strSQL = "BEGIN QPAP_CEnt050PkG.QPAP_CEnt050SelList (" & _
            ":InStrTorihikiYMD,:InStrUserID,:InStrCompNM,:InNumMaxRec,:IoNumCursor," & _
            ":OtStrTorihikiHMS,:OtStrKasituketen,:OtStrWSName,:OtStrMiseCD,:OtStrBumonCD," & _
            ":OtStrSyainCD,:OtStrSimeiKanji,:OtNumKingaku,:OtNumZandaka,:OtNumGendo," & _
            ":OtNumRecCount,:OtNumAryCount,:OtStrEndFlg); END;"
    
    Cnt = 0
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
                frmQPAV_CEnt050.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                frmQPAV_CEnt050.txtTouroku(0).SetFocus
                Call gsubParaRemove(odbDatabase)
                Exit Sub
            End If
        End If
        
        '�z��̍Ē�`
        lngMax = odbDatabase.Parameters("OtNumAryCount")
        glngTblCnt = glngTblCnt + lngMax
        ReDim Preserve gtblKasituke(lngMax)
    
        g = 0
        For i = glngTblCnt - lngMax + 1 To glngTblCnt
            '�ݕt����
            gtblKasituke(i).TorihikiHMS = odbDatabase.Parameters("OtStrTorihikiHMS").Get_Value(g)
            '�ݕt�X
            gtblKasituke(i).Kasituketen = odbDatabase.Parameters("OtStrKasituketen").Get_Value(g)
            '�v�r��
            gtblKasituke(i).WSName = odbDatabase.Parameters("OtStrWSName").Get_Value(g)
            '�X�R�[�h
            gtblKasituke(i).MiseCD = odbDatabase.Parameters("OtStrMiseCD").Get_Value(g)
            '����R�[�h
            gtblKasituke(i).BumonCD = odbDatabase.Parameters("OtStrBumonCD").Get_Value(g)
            '�Ј��R�[�h
            gtblKasituke(i).SyainCD = odbDatabase.Parameters("OtStrSyainCD").Get_Value(g)
            '��������
            gtblKasituke(i).SimeiKanji = odbDatabase.Parameters("OtStrSimeiKanji").Get_Value(g)
            '���z
            gtblKasituke(i).Kingaku = odbDatabase.Parameters("OtNumKingaku").Get_Value(g)
            '�c��
            gtblKasituke(i).Zandaka = odbDatabase.Parameters("OtNumZandaka").Get_Value(g)
            '���x�z
            gtblKasituke(i).Gendo = odbDatabase.Parameters("OtNumGendo").Get_Value(g)
            g = g + 1
        Next i
        
        Cnt = Cnt + 1   '���[�v�J�E���g�{�P
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"
    

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    '���o���R�[�h�����X�g�ɕ\��
    frmQPAV_CEnt050.sprList.MaxRows = glngTblCnt
    
    For i = 1 To glngTblCnt
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 1, i, Left(gtblKasituke(i).TorihikiHMS, 2) & ":" & Mid(gtblKasituke(i).TorihikiHMS, 3, 2) & ":" & Right(gtblKasituke(i).TorihikiHMS, 2))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 2, i, Trim(gtblKasituke(i).Kasituketen))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 3, i, Trim(gtblKasituke(i).WSName))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 4, i, Trim(gtblKasituke(i).MiseCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 5, i, Trim(gtblKasituke(i).BumonCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 6, i, Trim(gtblKasituke(i).SyainCD))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 7, i, Trim(gtblKasituke(i).SimeiKanji))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 8, i, Format(gtblKasituke(i).Kingaku, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 9, i, Format(gtblKasituke(i).Zandaka, "#,##0"))
        Call gsubSetCellText(frmQPAV_CEnt050.sprList, 10, i, Format(gtblKasituke(i).Gendo, "#,##0"))
        If gtblKasituke(i).Zandaka > gtblKasituke(i).Gendo Then
            Call gsubSetCellText(frmQPAV_CEnt050.sprList, 11, i, "���x�z�I�[�o�[")
        End If
    Next i
    
    '���͐��䏈��
    For i = 0 To 2
        frmQPAV_CEnt050.txtTouroku(i).Enabled = False
    Next i
    For i = 0 To 1
        frmQPAV_CEnt050.cmdPrint(i).Enabled = True
    Next i
    frmQPAV_CEnt050.cmdPFK(5).Enabled = False
    frmQPAV_CEnt050.cmdPrint(0).SetFocus

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


