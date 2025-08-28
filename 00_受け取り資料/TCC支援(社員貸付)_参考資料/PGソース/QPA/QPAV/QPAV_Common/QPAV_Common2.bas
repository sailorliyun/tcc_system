Attribute VB_Name = "QPAV_Common2"
Option Explicit

'***************************************************************************
'*  �������Ǘ�   QYA
'*  ���ʃ��W���[��
'***************************************************************************
'***************************************************************************
'*  �@����ԍ��O���ϊ�
'*    �ďo  �F gblnSeachKaiin()
'*    �ԋp�l�F Boolean     True=OK    False=NG
'*--------------------------------------------------------------------------
'*  �A����ԍ������擾
'*    �ďo  �F gblnSeachKaiin()
'*    �ԋp�l�F Boolean     True=OK    False=NG
'***************************************************************************
 
 
'-------------------------------------------------------
'    �@����ԍ��O���ϊ��p  �ϐ�
'-------------------------------------------------------
 Public gstrNaibuKaiinNo      As String  '��������ԍ� �ҏW��  ��ƃR�[�h�{�T�u�����W�L�[�{��������ԍ�
 Public gstrGaibuKaiinNo      As String  '�O������ԍ�



'-------------------------------------------------------
'    �A����ԍ������擾�p  �ϐ�
'-------------------------------------------------------
'        QYAP_CEnt000SelKaiinZoku�̏o�����Ұ��ɏ���
'----IN
 Public gstrKigyoCd           As String  '��ƃR�[�h       �� �@����ԍ��O���ϊ��Ŏ擾��i�[
 Public gstrSubRng            As String  '�T�u�����W�L�[   �� �@����ԍ��O���ϊ��Ŏ擾��i�[
 Public gstrNaibuKaiin        As String  '��������ԍ�     �� �@����ԍ��O���ϊ��Ŏ擾��i�[
'----OUT
 Public gstrHONShimeiKana     As String  '�t���K�i
 Public gstrHONShimeiKan      As String  '����
 Public gstrJTKYuubinNo       As String  '�X�֔ԍ�
 Public gstrJTKJyushoKan      As String  '�Z��������
 Public gstrJTKBanchiKan      As String  '�Ԓn����
 Public gstrJTKkataKan        As String  '��������
 Public gstrJTKTelShigai      As String  '�s�O�ǔ�
 Public gstrJTKTelKyoku       As String  '�ǔ�
 Public gstrJTKTelNo          As String  'Tel�ԍ�
 Public gstrSeinengappi       As String  '���N����
 Public gstrKanriTenCd        As String  '�Ǘ��X�R�[�h
 Public gstrKanriTenMei       As String  '�Ǘ��X����
 Public gstrCardMei           As String  '�J�[�h���i�J�[�h�敪�j
 Public gstrSTSKozaMei        As String  '�����X�e�[�^�X
 Public gstrYukoKigen         As String  '�L������
 Public gstrHakken            As String  '������'''''''''''���g�p
 Public gstrCardKbn           As String  '�J�[�h�敪
 Public gstrGaibuSikibetu     As String  '�O��������ʔԍ�
 Public gstrTozaiKbn          As String  '�����敪
'-------------------------------------------------------
'    �ҏW�� �i�[
 Public gstrTelNoH            As String  '�d�b�ԍ� �ҏW��   XX-XXXX-XXXX
 Public gstrSeinengappiH      As String  '���N���� �ҏW��   ggg e�Nm��d��
 Public gstrYukoKigenH        As String  '�L������ �ҏW��   XXXX/XX
 Public gstrHakkenH           As String  '������   �ҏW��   XXXX/XX/XX'''''''''''���g�p



'*********************************************************************************************
'*�@�@�葱�����F�@��������ԍ��擾���[�`��
'*�@�@���@���@�F�@�O������ԍ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*           �F  gstrGaibuKaiinNo ����ԍ�
'*           �F  strErrMsg�c�G���[���b�Z�[�W
'*           �F  �G���[���b�Z�[�W
'*�@�@�@�\�T�v�F�@��������ԍ��擾
'*********************************************************************************************
Public Function gblnGetNaibuKaiin(gstrGaibuKaiinNo As String, strErrMsg As String) As Boolean

    Dim strKekkaKaiinNo     As String
    Dim lngFukkiCd          As Long
    Dim strKigyouCd         As String
    Dim strSubRengiKey      As String
    Dim strNaibukaiinno     As String
    Dim strHKaiinNO(2)      As String
    Dim clsApp              As Object

    
    
On Error GoTo errblnGetKaiin

    gblnGetNaibuKaiin = False

    '�Ɖ�p����ԍ��`�F�b�N���[�`��(QSAV_ActX4701.DLL)
    Set clsApp = CreateObject("QSAV_ActX4701.ActX4701C")
    Call clsApp.subQSAV_ActX4701(gstrGaibuKaiinNo, lngFukkiCd, strKekkaKaiinNo)
    Set clsApp = Nothing

    '�Y���f�[�^�Ȃ�
    If lngFukkiCd <> 0 Then
        strErrMsg = "WHOE03 " & gstrGetCodeMeisyo(odbDatabase, "E03", "WHO")
        Exit Function
    End If

    '��������ԍ��擾���[�`��(QSAV_ActX3601.DLL)
    Set clsApp = CreateObject("QSAV_ActX3601.ActX3601C")
    Call clsApp.subQSAV_ActX3601(strKekkaKaiinNo, lngFukkiCd, strKigyouCd, strSubRengiKey, _
                                 strNaibukaiinno, odbDatabase)
    Set clsApp = Nothing

    '�Y���f�[�^�Ȃ�
    If lngFukkiCd <> 0 And lngFukkiCd <> 1 Then
        strErrMsg = "WHOE03 " & gstrGetCodeMeisyo(odbDatabase, "E03", "WHO")
        Exit Function
    End If

    '����ԍ��ҏW���[�`��(QSAV_ActX3501.DLL)
    Set clsApp = CreateObject("QSAV_ActX3501.ActX3501C")
    Call clsApp.subQSAV_ActX3501(2, strKekkaKaiinNo, lngFukkiCd, strHKaiinNO(0), strHKaiinNO(1))
    Set clsApp = Nothing

    If lngFukkiCd <> 0 Then
        Exit Function
    End If
    
    gstrNaibuKaiinNo = strKigyouCd & strSubRengiKey & strNaibukaiinno   '��������ԍ�
    
    gstrGaibuKaiinNo = strKekkaKaiinNo                                  '�O������ԍ����i�[
    
    gblnGetNaibuKaiin = True

    Exit Function

errblnGetKaiin:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function


'*********************************************************************************************
'*�@�@�葱�����F�@��������擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@��������擾�r�o���g�p���A������������擾����
'*********************************************************************************************
Public Function gblnSeachKaiin() As Boolean
    
    Dim strSQL As String
    
    
On Error GoTo errSeachKaiin

    gblnSeachKaiin = False
    
    '��������擾 �r�o
    odbDatabase.Parameters.Add "strPRMKigyouCd", Trim$(gstrKigyoCd), ORAPARM_INPUT      '��ƃR�[�h
    odbDatabase.Parameters.Add "strPRMSubRangeKey", Trim$(gstrSubRng), ORAPARM_INPUT   '�T�u�����W�L�[
    odbDatabase.Parameters.Add "strPRMNaibuKaiinNo", Trim$(gstrNaibuKaiin), ORAPARM_INPUT  '��������ԍ�
    
    '�{�l�J�i����
    odbDatabase.Parameters.Add "strHONShimeiKana", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strHONShimeiKana").ServerType = ORATYPE_CHAR
    '�{�l��������
    odbDatabase.Parameters.Add "strHONShimeiKan", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strHONShimeiKan").ServerType = ORATYPE_CHAR
    '�X�֔ԍ�
    odbDatabase.Parameters.Add "strJTKYuubinNo", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKYuubinNo").ServerType = ORATYPE_CHAR
    '�Z������
    odbDatabase.Parameters.Add "strJTKJyushoKan", Space(50), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKJyushoKan").ServerType = ORATYPE_CHAR
    '�Ԓn����
    odbDatabase.Parameters.Add "strJTKBanchiKan", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKBanchiKan").ServerType = ORATYPE_CHAR
    '��������
    odbDatabase.Parameters.Add "strJTKkataKan", Space(64), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKkataKan").ServerType = ORATYPE_CHAR
    '�s�O�ǔ�
    odbDatabase.Parameters.Add "strJTKTelShigai", Space(7), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelShigai").ServerType = ORATYPE_CHAR
    '�ǔ�
    odbDatabase.Parameters.Add "strJTKTelKyoku", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelKyoku").ServerType = ORATYPE_CHAR
    'Tel�ԍ�
    odbDatabase.Parameters.Add "strJTKTelNo", Space(4), ORAPARM_OUTPUT
    odbDatabase.Parameters("strJTKTelNo").ServerType = ORATYPE_CHAR
    '���N����
    odbDatabase.Parameters.Add "strSeinengappi", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strSeinengappi").ServerType = ORATYPE_VARCHAR2
    '�Ǘ��X�R�[�h
    odbDatabase.Parameters.Add "strKanriTenCd", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strKanriTenCd").ServerType = ORATYPE_VARCHAR2
    '�Ǘ��X����
    odbDatabase.Parameters.Add "strKanriTenMei", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("strKanriTenMei").ServerType = ORATYPE_CHAR
    '�J�[�h��
    odbDatabase.Parameters.Add "strCardMei", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("strCardMei").ServerType = ORATYPE_CHAR
    '�����X�e�[�^�X
    odbDatabase.Parameters.Add "strSTSKozaMei", Space(10), ORAPARM_OUTPUT
    odbDatabase.Parameters("strSTSKozaMei").ServerType = ORATYPE_CHAR
    '�L������
    odbDatabase.Parameters.Add "strYukoKigen", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("strYukoKigen").ServerType = ORATYPE_NUMBER
    '������
    odbDatabase.Parameters.Add "strHakken", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strHakken").ServerType = ORATYPE_VARCHAR2
    '�����敪
    odbDatabase.Parameters.Add "strTozaiKbn", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("strTozaiKbn").ServerType = ORATYPE_CHAR
    '�J�[�h�敪
    odbDatabase.Parameters.Add "OtStrCardKbn", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrCardKbn").ServerType = ORATYPE_CHAR
    '�O��������ʔԍ�
    odbDatabase.Parameters.Add "OtStrGKNShikibetuNo", Space(12), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrGKNShikibetuNo").ServerType = ORATYPE_CHAR
    '����Flg
    odbDatabase.Parameters.Add "strSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("strSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    
    strSQL = "BEGIN QYAP_CEnt000PkG.QYAP_CEnt000SelKaiinZoku(" & _
             ":strPRMKigyouCd, " & _
             ":strPRMSubRangeKey, " & _
             ":strPRMNaibuKaiinNo, " & _
             ":strHONShimeiKana, " & _
             ":strHONShimeiKan, " & _
             ":strJTKYuubinNo, " & _
             ":strJTKJyushoKan, " & _
             ":strJTKBanchiKan, " & _
             ":strJTKkataKan, " & _
             ":strJTKTelShigai, " & _
             ":strJTKTelKyoku, " & _
             ":strJTKTelNo, " & _
             ":strSeinengappi, " & _
             ":strKanriTenCd, " & _
             ":strKanriTenMei, " & _
             ":strCardMei, " & _
             ":strSTSKozaMei, " & _
             ":strYukoKigen, " & _
             ":strHakken, " & _
             ":strTozaiKbn, " & _
             ":OtStrCardKbn, " & _
             ":OtStrGKNShikibetuNo, " & _
             ":strSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("strSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If


    '�ϐ��Ɋi�[
    gstrHONShimeiKana = Trim$(odbDatabase.Parameters("strHONShimeiKana").Value)    '�{�l�����J�i
    gstrHONShimeiKan = Trim$(odbDatabase.Parameters("strHONShimeiKan").Value)      '�{�l��������
    gstrJTKYuubinNo = Trim$(odbDatabase.Parameters("strJTKYuubinNo").Value)        '�X�֔ԍ�
    gstrJTKJyushoKan = Trim$(odbDatabase.Parameters("strJTKJyushoKan").Value)      '�Z������
    gstrJTKBanchiKan = Trim$(odbDatabase.Parameters("strJTKBanchiKan").Value)      '�Ԓn����
    gstrJTKkataKan = Trim$(odbDatabase.Parameters("strJTKkataKan").Value)          '��������
    gstrJTKTelShigai = Trim$(odbDatabase.Parameters("strJTKTelShigai").Value)      '�s�O�ǔ�
    gstrJTKTelKyoku = Trim$(odbDatabase.Parameters("strJTKTelKyoku").Value)        '�ǔ�
    gstrJTKTelNo = Trim$(odbDatabase.Parameters("strJTKTelNo").Value)              'Tel�ԍ�
    '�d�b�ԍ�ʲ�ݕҏW
    If gstrJTKTelShigai = "" Then
        If gstrJTKTelKyoku = "" Then
            gstrTelNoH = gstrJTKTelNo
        Else
            gstrTelNoH = gstrJTKTelKyoku & "-" & gstrJTKTelNo
        End If
    Else
        gstrTelNoH = gstrJTKTelShigai & "-" & gstrJTKTelKyoku & "-" & gstrJTKTelNo
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida start
    'gstrSeinengappi = Trim$(odbDatabase.Parameters("strSeinengappi").Value)        '���N����
    If IsNull(odbDatabase.Parameters("strSeinengappi")) = False Then
        gstrSeinengappi = Trim$(odbDatabase.Parameters("strSeinengappi").Value)
    Else
        gstrSeinengappi = ""
    End If
    'MOD 20090423 0807073/0800812 nbc.ishida end
    '���N�����ҏW
    If IsNull(gstrSeinengappi) Or Trim$(gstrSeinengappi) = "" Or Trim$(gstrSeinengappi) = "0" Or Trim$(gstrSeinengappi) = "00000000" Then
        gstrSeinengappiH = ""
    Else
        gstrSeinengappiH = Mid$(gstrSeinengappi, 1, 4) & "/" & Mid$(gstrSeinengappi, 5, 2) & "/" & Mid$(gstrSeinengappi, 7, 2)
        gstrSeinengappiH = Format(gstrSeinengappiH, "ggg e�Nm��d��")
    End If
    gstrKanriTenCd = Trim$(odbDatabase.Parameters("strKanriTenCd").Value)          '�Ǘ��X�R�[�h
    gstrKanriTenMei = Trim$(odbDatabase.Parameters("strKanriTenMei").Value)        '�Ǘ��X����
    gstrCardMei = Trim$(odbDatabase.Parameters("strCardMei").Value)                '�J�[�h�敪����
    gstrSTSKozaMei = Trim$(odbDatabase.Parameters("strSTSKozaMei").Value)          '�����X�e�[�^�X
    gstrYukoKigen = Trim$(odbDatabase.Parameters("strYukoKigen").Value)            '�L������
    '�L�������ҏW
    If gstrYukoKigen = "0" Or gstrYukoKigen = "000000" Or gstrYukoKigen = "" Or IsNull(gstrYukoKigen) = True Then
        gstrYukoKigenH = ""
    Else
        gstrYukoKigenH = Mid$(gstrYukoKigen, 1, 4) & "/" & Mid$(gstrYukoKigen, 5, 2)
    End If
    gstrHakken = Trim$(odbDatabase.Parameters("strHakken").Value)                  '������
    '�������ҏW
    If gstrHakken = "0" Or gstrHakken = "00000000" Or gstrHakken = "" Or IsNull(gstrHakken) = True Then
        gstrHakkenH = ""
    Else
        gstrHakkenH = Mid$(gstrHakken, 1, 4) & "/" & Mid$(gstrHakken, 5, 2) & "/" & Mid$(gstrHakken, 7, 2)
    End If
    gstrTozaiKbn = Trim$(odbDatabase.Parameters("strTozaiKbn").Value)              '�����敪
    gstrCardKbn = Trim$(odbDatabase.Parameters("OtStrCardKbn").Value)              '�J�[�h�敪
    gstrGaibuSikibetu = Trim$(odbDatabase.Parameters("OtStrGKNShikibetuNo").Value) '�O�����ʔԍ�

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)


    gblnSeachKaiin = True

    Exit Function
    
errSeachKaiin:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function



'*********************************************************************************
'*   10��,16������ҏW
'*�@�@�����F����ԍ�
'*********************************************************************************
Public Function gfncstrKaiinEdit(strKaiinNo As String) As String

    If Trim$(strKaiinNo) = "" Or _
       Trim$(strKaiinNo) = "0" Or _
       Trim$(strKaiinNo) = "0000000000000000" Then
        gfncstrKaiinEdit = ""
    ElseIf Len(strKaiinNo) = 10 Then
        gfncstrKaiinEdit = Mid$(strKaiinNo, 1, 2) & "-" & Mid$(strKaiinNo, 3, 2) & "-" & _
                           Mid$(strKaiinNo, 5, 4) & "-" & Mid$(strKaiinNo, 9, 1) & "-" & _
                           Mid$(strKaiinNo, 10, 1)
    ElseIf Left$(strKaiinNo, 6) = "000000" Then
        gfncstrKaiinEdit = Mid$(strKaiinNo, 7, 2) & "-" & Mid$(strKaiinNo, 9, 2) & "-" & _
                           Mid$(strKaiinNo, 11, 4) & "-" & Mid$(strKaiinNo, 15, 1) & "-" & _
                           Mid$(strKaiinNo, 16, 1)
    Else
        gfncstrKaiinEdit = Mid$(strKaiinNo, 1, 4) & "-" & Mid$(strKaiinNo, 5, 4) & "-" & _
                           Mid$(strKaiinNo, 9, 4) & "-" & Mid$(strKaiinNo, 13, 4)
    End If
    
End Function


