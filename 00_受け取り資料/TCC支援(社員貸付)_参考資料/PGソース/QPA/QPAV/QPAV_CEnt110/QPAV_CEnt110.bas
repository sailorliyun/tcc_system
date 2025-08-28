Attribute VB_Name = "MainModule"
Option Explicit
 Public Const gcstrPrjName = "QYAV_CEnt010"
 Public Const gcnsstrSysChng = "2001/11/01"    '�V�V�X�e���ȍ~��

'*********************************************************
'   SP�p�f�[�^�i�[�ϐ�
'*********************************************************

 Public gstrSysDate             As String        '�V�X�e�����t�i�T�[�o�[�j  5/29 add

 Public gstrSyainCd1            As String        '�Ј��R�[�h�P
 Public gstrSyainCd2            As String        '�Ј��R�[�h�Q
 Public gstrYuusibi             As String        '�Z����
 Public gstrYusiYMD            As String        '�Z���f�[�^�i��؂蕶������j
 Public gstrBonusMD1            As String        '�{�[�i�X�x�����P
 Public gstrBonusMD2            As String        '�{�[�i�X�x�����Q

 Type YoteiTbl
    intPageKBN  As Integer '�y�[�W�敪
    intNenKBN   As Integer '�N�敪
    strKbn      As String  '�敪
    strKijitu   As String  '�ԍϊ���
    strHensai   As String  '�ԍϋ��z
    strZandaka  As String  '�c��
    strKyuGan   As String  '���^���{
    strKyuRsk   As String  '���^����
    strKyuZan   As String  '���^�c��
    strSyoGan   As String  '�ܗ^���{
    strSyoRsk   As String  '�ܗ^����
    strSyoZan   As String  '�ܗ^�c��
 End Type

Public gstrYoteihyouAry()  As YoteiTbl '�\��\�p�z��
Public gstrYoteihyouSort() As YoteiTbl '�\��\�z��\�[�g�p

 Public lngErrCode           As Long          '�װ����
 Public strErrDescription    As String        '�װү����
 
 Public gblnNayoseFlg As Boolean
 
'*************************************************************
'* �N���@�l�`�h�m
'*************************************************************
Public Sub Main()
 
 Dim strCmdLine As String
        
    '�����
    If App.PrevInstance Then
        MsgBox "�ԍϗ\��\����͊��ɋN������Ă��܂��B" _
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

    frmQPAV_CEnt110.Show 1
 
End Sub

'**********************************************************************************************************
'*    ���������pSP�i���ѓ��t�A�������e�j
'**********************************************************************************************************
Public Sub gsubSPInit()
 Dim strWkAry As String
 Dim strSQL As String
 
 On Error GoTo errSPInit
 
    '*SP*
    '���ѓ��t
    odbDatabase.Parameters.Add "OtStrSysDate", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSysDate").ServerType = ORATYPE_VARCHAR2
    
    'SQL���̍쐬
             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110Init("
    strSQL = strSQL & " :OtStrSysDate);END;"
            
    'SP�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
            
    gstrSysDate = odbDatabase.Parameters("OtStrSysDate")
    
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
            
errSPInit:
'�װ����
    
    '�װү���ޕ\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)
    
End Sub
'**********************************************************************************************************
'*  �ԍϗ\��\���׍쐬(�������@�Z������ 2000/03/01 �ȑO�̏���)
'**********************************************************************************************************
Public Sub gSubMakeMeisaiKyuu()
 Dim strYuusibi         As String  '�Z����
 Dim dblRiritu          As Double  '�_�񗘗�
 Dim intHensaiTuki      As Integer '�ԍό���
 Dim lngKyuuyoHensaiAll As Long    '���^�ԍϊz(���z)
 Dim lngSyouyoHensaiAll As Long    '�ܗ^�ԍϊz(���z)
 Dim strSyouyoDate1     As String  '�ܗ^�x�����P
 Dim strSyouyoDate2     As String  '�ܗ^�x�����Q

'--���[�N---------------------
 Dim i                       As Integer
 Dim intKyuuyoCNT            As Integer  ' ���^���扽��ڂ��̐���
 Dim intSyouyoCNT            As Integer  ' �ܗ^���扽��ڂ��̐���
 Dim intNenKBN               As Integer  '�N�敪
 Dim intKBN                  As Integer  '�敪
 Dim strHensaiKijitu         As String   '�ԍϊ���
 Dim strSyouyoKijitu         As String   '�ܗ^����
 Dim lngKyuuyoTeigaku        As Long     '���^��z�ԍϊz_WORK
 Dim lngKyuuyoZan_1          As Long     '���^��1�c��_WORK
 Dim lngKyuuyoHensaiZandaka  As Long     '���^�ԍώc��
 Dim lngSyouyoTeigaku        As Long     '�ܗ^��z�ԍϊz_WORK
 Dim lngSyouyoZan_1          As Long     '�ܗ^��1�c��_WORK
 Dim lngSyouyoHensaiZandaka  As Long     '�ܗ^�ԍώc��
 Dim curTeigaku_0            As Currency '��z_WORK0
 Dim curTeigaku_1            As Currency '��z_WORK1
 Dim curTeigaku_2            As Currency '��z_WORK2
 Dim intSyouyoHensaiKaisuu   As Integer  '�ܗ^�ԍω�
 Dim strSyouyoSiharaiTuki    As String   '�ܗ^�x����
 Dim strHensaiKijitu2        As String   '�ԍϊ���2
 Dim intHensaiKikan          As Integer  '�ԍϊ���
 Dim strZenkaiSyouyoHensaiBi As String   '�O��ܗ^�ԍϓ�
 Dim intSyouyoHensaiKikan    As Integer  '�ܗ^�ԍϊ���
 Dim dblRisoku1              As Double   '����
 Dim dblRisoku2              As Double   '�����Q
 Dim dblKeiyakuriritu        As Double   '�_�񗘗�WK

 Dim Y As Integer
    
 Dim intNenKBN_WK           As Integer

 '�\�[�g���Ɏg�p
 Dim lngSortKey()       As Long

'�X����Ɏg�p�@2002/05/13
 Dim strSyozoku As String

On Error GoTo asd


    '�ϐ��ɃZ�b�g
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '�Z����
    dblRiritu = CDbl(gfncstrDlm2(gstrYusiYMD, 6)) * 0.01            '�_�񗘗�
    intHensaiTuki = CInt(gfncstrDlm2(gstrYusiYMD, 7))               '�ԍό���
    lngKyuuyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 8))          '���^�ԍϊz(���z)
    lngSyouyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 10))         '�ܗ^�ԍϊz(���z)
''''    gstrBonusMD1 = Format$(Left$(gstrBonusMD1, 2) & Right$(gstrBonusMD1, 2), "MMDD")                  '�ܗ^�x�������P
''''    gstrBonusMD2 = Format$(Left$(gstrBonusMD2, 2) & Right$(gstrBonusMD2, 2), "MMDD")                  '�ܗ^�x������2
''''    lngKyuuyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 9))             '�������^�ԍϊz
''''    lngSyouyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 11))            '�����ܗ^�ԍϊz
    

''''2001/11/28
'    '�ܗ^�x��������
'''    If Format(Date, "MMDD") < gstrBonusMD1 Then
'    If Format(Date, "MMDD") <= gstrBonusMD1 Then
'        '�ܗ^�x�������P���ܗ^�x�������Q��
'''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
'''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1
'        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'        strSyouyoDate2 = Format$(DateAdd("yyyy", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'''    ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
'    ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
'        '�ܗ^�x�������Q���ܗ^�x�������P��
'''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
'''        strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1
'        strSyouyoDate1 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'        strSyouyoDate2 = Format$(DateAdd("yyyy", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'    ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
'        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
'        strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
'    End If
    If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ�
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
        End If
    Else
        If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ� '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
    End If
    
    intSyouyoHensaiKikan = DateDiff("m", strSyouyoDate1, strSyouyoDate2)
    strZenkaiSyouyoHensaiBi = strYuusibi

    intNenKBN = 1
    intKyuuyoCNT = 1
    intSyouyoCNT = 1
    
    If intHensaiTuki <= 0 Then
        intHensaiTuki = 1
    End If
    
    '�ܗ^�ԍω�
    intSyouyoHensaiKaisuu = Fix(intHensaiTuki / 6)
    For i = 1 To intHensaiTuki Mod 6
        If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate1) Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate2) Then
            intSyouyoHensaiKaisuu = intSyouyoHensaiKaisuu + 1
        End If
    Next i
    If intSyouyoHensaiKaisuu <= 0 Then
        intSyouyoHensaiKaisuu = 1
    End If
  
    strHensaiKijitu = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
  
    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If

    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    '----------------------�����x���z�v�Z---------------------------
    If Val(Format(strYuusibi, "dd")) >= 11 Then
        intHensaiKikan = 30
    Else
        intHensaiKikan = 45
    End If
    dblRisoku2 = (lngKyuuyoHensaiAll * dblRiritu * intHensaiKikan / 12 / 30)
    dblRisoku1 = Int(dblRisoku2)
    If intHensaiTuki <= 1 Then
        lngKyuuyoTeigaku = dblRisoku1 + lngKyuuyoHensaiAll
    Else
        curTeigaku_0 = 0
        curTeigaku_1 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll, 0, 0))
        curTeigaku_2 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll - curTeigaku_1 + dblRisoku2, 0, 0))
        While Abs(curTeigaku_1 - curTeigaku_2) > 0.001 Or Abs(curTeigaku_0 - curTeigaku_2) > 0.001
            curTeigaku_0 = curTeigaku_1: curTeigaku_1 = curTeigaku_2
            curTeigaku_2 = Abs(-Pmt(dblRiritu / 12, intHensaiTuki - 1, lngKyuuyoHensaiAll - (((curTeigaku_0) + (curTeigaku_1)) / 2) + dblRisoku2, 0, 0))
        Wend
        lngKyuuyoTeigaku = Fix(Abs(((curTeigaku_0) + (curTeigaku_1) + (curTeigaku_2)) / 3))
    End If

    If intSyouyoHensaiKikan = 6 Then
        If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
            dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180)
        Else
            dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180)
        End If
        dblRisoku1 = Int(dblRisoku2)
    Else
        dblRisoku2 = (lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180)
        dblRisoku1 = Int(dblRisoku2)
    End If

    If intSyouyoHensaiKaisuu <= 1 Then
        lngSyouyoTeigaku = dblRisoku1 + lngSyouyoHensaiAll
    Else
        curTeigaku_0 = 0
        curTeigaku_1 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll, 0, 0))
        curTeigaku_2 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll - curTeigaku_1 + dblRisoku2, 0, 0))
        While Abs(curTeigaku_1 - curTeigaku_2) > 0.001 Or Abs(curTeigaku_0 - curTeigaku_2) > 0.001
            curTeigaku_0 = curTeigaku_1: curTeigaku_1 = curTeigaku_2
            curTeigaku_2 = Abs(-Pmt(dblRiritu / 2, intSyouyoHensaiKaisuu - 1, lngSyouyoHensaiAll - (((curTeigaku_0) + (curTeigaku_1)) / 2) + dblRisoku2, 0, 0))
        Wend
        lngSyouyoTeigaku = Fix(Abs(((curTeigaku_0) + (curTeigaku_1) + (curTeigaku_2)) / 3))
        If intSyouyoHensaiKikan <> 6 Then
            lngSyouyoTeigaku = gfnclngSyouyoHensai(strYuusibi, dblRiritu, strSyouyoDate1, strSyouyoDate2, intSyouyoHensaiKaisuu, lngSyouyoHensaiAll, dblRisoku1, lngSyouyoTeigaku)
        End If
    End If
    '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    '�����[�N�e�[�u���o�^�p�f�[�^�쐬
    '* �P��ڂ̋��^�ԍό��Əܗ^�ԍό�����v����ꍇ�A�P��ڂ̏ܗ^�ԍϗp�̃f�[�^��ǉ�����
    i = 1
    '* �P��ڂ̋��^�ԍϗp�̃f�[�^��ǉ�����
    If lngKyuuyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
            .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
            .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
            .strKbn = "���^" & Space$(3 - Len(Format$(1, "###"))) & Format$(1, "###") '''''''''''''''�敪
            
            .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
            If strYuusibi < "2000/03/01" Then
                
                '�X����@2002/05/13
                strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                Then
                    If Mid$(.strKijitu, 1, 2) > "11" Then
                        If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"        '04 �ԍϊ���
                        ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 �ԍϊ���
                        End If
                    End If
                End If
            End If
            
            .strHensai = lngKyuuyoTeigaku '�Œ� '''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
            If Val(Format(strYuusibi, "dd")) >= 11 Then
                intHensaiKikan = 30
            Else
                intHensaiKikan = 45
            End If
            dblKeiyakuriritu = dblRiritu * 100
            .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * intHensaiKikan / 12 / 3000)
            .strKyuGan = .strHensai - .strKyuRsk
            If intHensaiTuki = 1 Then
                .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''�ԍϋ��z
            End If
            lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '���^�ԍώc�� �v�Z
            .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''���^�c��
            lngKyuuyoZan_1 = .strKyuZan
            .strZandaka = " "   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�c��
            .strSyoGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
            .strSyoRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
            .strSyoZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
            intKyuuyoCNT = intKyuuyoCNT + 1
            i = i + 1
        End With
    End If
    
    '* �P��ڂ̋��^�ԍό��Əܗ^�ԍό�����v����ꍇ�A�P��ڂ̏ܗ^�ԍϗp�̃f�[�^��ǉ�����
    If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
        
            If lngKyuuyoTeigaku > 0 Then
                .intPageKBN = Fix((intNenKBN + 2) / 3)
            Else
                .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
            End If
            .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
            .strKbn = "�ܗ^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''''''''''''�敪
            
            .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
            If strYuusibi < "2000/03/01" Then
                '�X����@2002/05/13
                strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                Then
                    If Mid$(.strKijitu, 1, 2) > "11" Then
                        If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 �ԍϊ���
                        ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                            .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 �ԍϊ���
                        End If
                    End If
                End If
            End If
            
            .strHensai = lngSyouyoTeigaku '�Œ�i�ܗ^�j'''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
            If intSyouyoHensaiKikan = 6 Then
                If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
                    dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180
                    .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                Else
                    dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180
                    .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                End If
            Else
                dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180
                .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
            End If
            .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
            If intSyouyoHensaiKaisuu = 1 Then
                .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''''''�ԍϋ��z
            End If
            lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan '�ܗ^�ԍώc�� �v�Z
            .strSyoZan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
            lngSyouyoZan_1 = .strSyoZan
            .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�c��
            .strKyuGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
            .strKyuRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^����
            .strKyuZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^�c��
            strZenkaiSyouyoHensaiBi = strSyouyoKijitu
            intSyouyoCNT = intSyouyoCNT + 1
            i = i + 1
        End With
    End If
        
    strHensaiKijitu2 = strHensaiKijitu
    strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)

    ' �����Q��ڈȍ~�̃f�[�^�ǉ�
    intNenKBN_WK = 2
    'While (I <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
    While (intKyuuyoCNT <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
        '* ���^�̃f�[�^�ǉ�
        If lngKyuuyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
            
                .intPageKBN = Fix((intNenKBN + 2) / 3) '''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
                .strKbn = "���^" & Space$(3 - Len(Format$(intKyuuyoCNT, "###"))) & Format$(intKyuuyoCNT, "###") ''''''''''''''�敪
                
                .strKijitu = gvarCnvDate(1, strHensaiKijitu) '''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
                If strYuusibi < "2000/03/01" Then
' �������������������X����@2002/05/13������������������������������������������������������������������������������������������������������������������������������������������������������
                    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                    Then
                        If Mid$(.strKijitu, 1, 2) > "11" Then
                            If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 �ԍϊ���
                            ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 �ԍϊ���
                            End If
                        End If
                    End If
                End If
                
                .strHensai = lngKyuuyoTeigaku '�Œ� ''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblRiritu / 12) ''''''''''''''''''''''''''''''���^����
                .strKyuGan = .strHensai - .strKyuRsk '''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                ' �ŏI��̏ꍇ
                If intHensaiTuki = intKyuuyoCNT Then
                    .strKyuGan = lngKyuuyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                    .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk '''''''''''''''''''''''''''''''''''�ԍϋ��z
                End If
                lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '���^�ԍώc�� �v�Z
                .strKyuZan = lngKyuuyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''���^�c��
                .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍώc��
                .strSyoGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                .strSyoRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                .strSyoZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
                intKyuuyoCNT = intKyuuyoCNT + 1
                i = i + 1
            End With
        End If
        
        '* ���Y���Əܗ^�ԍό�����v����ꍇ�A�ܗ^�ԍϗp�̃f�[�^���ǉ�����
        If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                
                If lngKyuuyoTeigaku > 0 Then
                    .intPageKBN = Fix((intNenKBN + 2) / 3) '''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                Else
                    .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                End If
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
                .strKbn = "�ܗ^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''''''''�敪
                
                '* ����̏ܗ^�ԍϓ��̎Z�o
                If Month(strHensaiKijitu) = Month(strSyouyoDate1) Then
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
                Else
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
                End If
                               
                .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
                If strYuusibi < "2000/03/01" Then
                    '�X����@2002/05/13
                    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
                    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
                    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
                    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
                    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
                    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
                    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
                    Then
                        If Mid$(.strKijitu, 1, 2) > "11" Then
                            If Mid$(.strKijitu, 4, 5) = " 4.30" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ". 6.15"                                      '04 �ԍϊ���
                            ElseIf Mid$(.strKijitu, 4, 5) = "10.31" Then
                                .strKijitu = Mid$(.strKijitu, 1, 2) & ".12. 1"        '04 �ԍϊ���
                            End If
                        End If
                    End If
                End If
                
                .strHensai = lngSyouyoTeigaku '�Œ�i�ܗ^�j'''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                If intSyouyoHensaiKikan = 6 Then
                    If intSyouyoCNT = 1 Then
                        If Month(DateAdd("y", 1, strSyouyoKijitu)) <> Month(strSyouyoKijitu) Then
                            dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21)) / 2 / 180        '���񗘑�
                            .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                        Else
                            dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + (Day(strSyouyoKijitu) - 1 - 30)) / 2 / 180 '���񗘑�
                            .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                        End If
                    Else
                        dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu / 2
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                    End If
                Else
                    If intSyouyoCNT = 1 Then
                        dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * (DateDiff("m", strYuusibi, strSyouyoKijitu) * 30 + IIf(Val(Format(strYuusibi, "dd")) >= 11, 6, 21) + ((10) - 1 - 30)) / 2 / 180 '���񗘑�
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                    Else
                        dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu * DateDiff("m", strZenkaiSyouyoHensaiBi, strSyouyoKijitu) / 12
                        .strSyoRsk = Int(dblRisoku2) '''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                    End If
                End If
                .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                If intSyouyoHensaiKaisuu = intSyouyoCNT Then
                    .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                    .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''�ԍϋ��z
                End If
                lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan '�ܗ^�ԍώc�� �v�Z
                .strSyoZan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
                If intSyouyoCNT = 1 Then
                    lngKyuuyoZan_1 = .strSyoZan
                End If
                .strZandaka = " " '�c��
                .strKyuGan = " " '���^���{
                .strKyuRsk = " " '���^����
                .strKyuZan = " " '���^�c��
                strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                intSyouyoCNT = intSyouyoCNT + 1
                i = i + 1
            End With
        End If
        
        strHensaiKijitu2 = strHensaiKijitu
        strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)


''''2001/12/07  �s�v�i�\���̂ݐV�ܗ^���A�v�Z�͋��ܗ^���ōs��
''''        '������2001/11/28 �ܗ^����2000/03�����ɕς�遫����
''''        If strYuusibi < "2000/03/01" Then
''''            If strHensaiKijitu > "2000/03/01" Then
''''                If strSyouyoDate1 > strSyouyoDate2 Then
''''                    strSyouyoDate1 = Mid$(strSyouyoDate1, 1, 5) & "12/01"
''''                    strSyouyoDate2 = Mid$(strSyouyoDate2, 1, 5) & "06/15"
''''                Else
''''                    strSyouyoDate1 = Mid$(strSyouyoDate1, 1, 5) & "06/15"
''''                    strSyouyoDate2 = Mid$(strSyouyoDate2, 1, 5) & "12/01"
''''                End If
''''            End If
''''        End If
''''        '������2001/11/28 �ܗ^����2000/03�����ɕς�遪����
''''2001/12/07  �s�v�i�\���̂ݐV�ܗ^���A�v�Z�͋��ܗ^���ōs��

        
        ' �P�Q��i�����ܗ^�̎��́A���̏ܗ^�܂Ŋ܂܂��j���ɁA
        ' �ԍϗ\��\�Ɍr�����o�͂����邽�߂̋敪�̃J�E���g�A�b�v
        If ((intNenKBN_WK) Mod 12) = 0 Then
            intNenKBN = intNenKBN + 1
        End If
        intNenKBN_WK = intNenKBN_WK + 1
    
    Wend
    
    '��gstrYoteihyouAry�z��\�[�g...�ܗ^�f�[�^������Ă��邽�߁�
    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            ReDim Preserve lngSortKey(Y)
            ReDim Preserve gstrYoteihyouSort(Y)
            lngSortKey(Y) = CLng(Format(Mid$(.strKijitu, 1, 2), "00") & Format(Mid$(.strKijitu, 4, 2), "00") & Format(Mid$(.strKijitu, 7, 2), "00"))
            gstrYoteihyouSort(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN
            gstrYoteihyouSort(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN
            gstrYoteihyouSort(Y).strHensai = gstrYoteihyouAry(Y).strHensai
            gstrYoteihyouSort(Y).strKbn = gstrYoteihyouAry(Y).strKbn
            gstrYoteihyouSort(Y).strKijitu = gstrYoteihyouAry(Y).strKijitu
            gstrYoteihyouSort(Y).strKyuGan = gstrYoteihyouAry(Y).strKyuGan
            gstrYoteihyouSort(Y).strKyuRsk = gstrYoteihyouAry(Y).strKyuRsk
            gstrYoteihyouSort(Y).strKyuZan = gstrYoteihyouAry(Y).strKyuZan
            gstrYoteihyouSort(Y).strSyoGan = gstrYoteihyouAry(Y).strSyoGan
            gstrYoteihyouSort(Y).strSyoRsk = gstrYoteihyouAry(Y).strSyoRsk
            gstrYoteihyouSort(Y).strSyoZan = gstrYoteihyouAry(Y).strSyoZan
            gstrYoteihyouSort(Y).strZandaka = gstrYoteihyouAry(Y).strZandaka
        End With
    Next Y
    
    For Y = 1 To UBound(gstrYoteihyouAry)
        If Y <> 1 Then
            If lngSortKey(Y) < lngSortKey(Y - 1) Then
                gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouSort(Y - 1).intNenKBN
                If gstrYoteihyouSort(Y).intNenKBN > gstrYoteihyouSort(Y - 1).intNenKBN Then
                    gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN + 1
                End If
                
                
                gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouSort(Y - 1).intPageKBN
                If gstrYoteihyouSort(Y).intPageKBN > gstrYoteihyouSort(Y - 1).intPageKBN Then
                    gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN + 1
                End If
                
                gstrYoteihyouAry(Y).strHensai = gstrYoteihyouSort(Y - 1).strHensai
                gstrYoteihyouAry(Y).strKbn = gstrYoteihyouSort(Y - 1).strKbn
                gstrYoteihyouAry(Y).strKijitu = gstrYoteihyouSort(Y - 1).strKijitu
                gstrYoteihyouAry(Y).strKyuGan = gstrYoteihyouSort(Y - 1).strKyuGan
                gstrYoteihyouAry(Y).strKyuRsk = gstrYoteihyouSort(Y - 1).strKyuRsk
                gstrYoteihyouAry(Y).strKyuZan = gstrYoteihyouSort(Y - 1).strKyuZan
                gstrYoteihyouAry(Y).strSyoGan = gstrYoteihyouSort(Y - 1).strSyoGan
                gstrYoteihyouAry(Y).strSyoRsk = gstrYoteihyouSort(Y - 1).strSyoRsk
                gstrYoteihyouAry(Y).strSyoZan = gstrYoteihyouSort(Y - 1).strSyoZan
                gstrYoteihyouAry(Y).strZandaka = gstrYoteihyouSort(Y - 1).strZandaka
            
                gstrYoteihyouAry(Y - 1).intNenKBN = gstrYoteihyouSort(Y).intNenKBN
                gstrYoteihyouAry(Y - 1).intPageKBN = gstrYoteihyouSort(Y).intPageKBN
                gstrYoteihyouAry(Y - 1).strHensai = gstrYoteihyouSort(Y).strHensai
                gstrYoteihyouAry(Y - 1).strKbn = gstrYoteihyouSort(Y).strKbn
                gstrYoteihyouAry(Y - 1).strKijitu = gstrYoteihyouSort(Y).strKijitu
                gstrYoteihyouAry(Y - 1).strKyuGan = gstrYoteihyouSort(Y).strKyuGan
                gstrYoteihyouAry(Y - 1).strKyuRsk = gstrYoteihyouSort(Y).strKyuRsk
                gstrYoteihyouAry(Y - 1).strKyuZan = gstrYoteihyouSort(Y).strKyuZan
                gstrYoteihyouAry(Y - 1).strSyoGan = gstrYoteihyouSort(Y).strSyoGan
                gstrYoteihyouAry(Y - 1).strSyoRsk = gstrYoteihyouSort(Y).strSyoRsk
                gstrYoteihyouAry(Y - 1).strSyoZan = gstrYoteihyouSort(Y).strSyoZan
                gstrYoteihyouAry(Y - 1).strZandaka = gstrYoteihyouSort(Y).strZandaka
            End If
        End If
    Next Y

    '���c���Z�o��
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            If Trim$(.strKyuZan) <> "" Then
                lngKyuuyoHensaiZandaka = .strKyuZan
            End If
            If Trim$(.strSyoZan) <> "" Then
                lngSyouyoHensaiZandaka = .strSyoZan
            End If
            .strZandaka = lngKyuuyoHensaiZandaka + lngSyouyoHensaiZandaka '�c��
        End With
    Next Y

    Exit Sub

asd:
Exit Sub

End Sub

'**********************************************************************************************************
'*  �ԍϗ\��\���׍쐬_�V�i�Z������2000/03/01�ڍs�̌v�Z�j
'**********************************************************************************************************
Public Sub gSubMakeMeisai()
 Dim strYuusibi         As String  '�Z����
 Dim dblRiritu          As Double  '�_�񗘗�
 Dim intHensaiTuki      As Integer '�ԍό���
 Dim lngKyuuyoHensaiAll As Long    '���^�ԍϊz(���z)
 Dim lngSyouyoHensaiAll As Long    '�ܗ^�ԍϊz(���z)
 Dim strSyouyoDate1     As String  '�ܗ^�x�����P
 Dim strSyouyoDate2     As String  '�ܗ^�x�����Q
 Dim lngKyuuyoHensai    As Long    '�������^�ԍϊz
 Dim lngSyouyoHensai    As Long    '�����ܗ^�ԍϊz
     
'--���[�N---------------------
 Dim i                       As Integer
 Dim intKyuuyoCNT            As Integer ' ���^���扽��ڂ��̐���
 Dim intSyouyoCNT            As Integer ' �ܗ^���扽��ڂ��̐���
 Dim intNenKBN               As Integer '�N�敪
 Dim intKBN                  As Integer '�敪
 Dim strHensaiKijitu         As String  '�ԍϊ���
 Dim strSyouyoKijitu         As String  '�ܗ^����
 Dim lngKyuuyoHensaiZandaka  As Long    '���^�ԍώc��
 Dim lngSyouyoHensaiZandaka  As Long    '�ܗ^�ԍώc��
 Dim intSyouyoHensaiKaisuu   As Integer '�ܗ^�ԍω�
 Dim strSyouyoSiharaiTuki    As String  '�ܗ^�x����
 Dim strZenkaiHensaiKijitu   As String  '�O��ԍϊ���
 Dim intHensaiKikan          As Integer '�ԍϊ���
 Dim strZenkaiSyouyoHensaiBi As String  '�O��ܗ^�ԍϓ�
 Dim dblRisoku1              As Double  '����
 Dim dblRisoku2              As Double  '�����Q
 Dim dblKeiyakuriritu        As Double  '�_�񗘗�
    
 Dim Y As Integer

 Dim intNenKBN_WK             As Integer

 Dim StrWork_20011110_1 As String
 Dim StrWork_20011110_2 As String

 '�\�[�g���Ɏg�p
 Dim lngSortKey()       As Long

'�X����Ɏg�p�@2002/05/13
 Dim strSyozoku As String

On Error GoTo asd

    '�ϐ��ɃZ�b�g
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '�Z����
    dblRiritu = CDbl(gfncstrDlm2(gstrYusiYMD, 6)) * 0.01            '�_�񗘗�
    intHensaiTuki = CInt(gfncstrDlm2(gstrYusiYMD, 7))               '�ԍό���
    lngKyuuyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 8))          '���^�ԍϊz(���z)
    lngSyouyoHensaiAll = CLng(gfncstrDlm2(gstrYusiYMD, 10))         '�ܗ^�ԍϊz(���z)
''''    gstrBonusMD1 = Format$(Left$(gstrBonusMD1, 2) & Right$(gstrBonusMD1, 2), "MMDD")                  '�ܗ^�x�������P
''''    gstrBonusMD2 = Format$(Left$(gstrBonusMD2, 2) & Right$(gstrBonusMD2, 2), "MMDD")                  '�ܗ^�x������2
    lngKyuuyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 9))             '�������^�ԍϊz
    lngSyouyoHensai = CLng(gfncstrDlm2(gstrYusiYMD, 11))            '�����ܗ^�ԍϊz
    
    
    
    '���Z������ 2000/11/10 �̏ꍇ�� ���߂̃{�[�i�X�����U���P�T�ɂ���(�����̂P�Q���P���̃{�[�i�X���𖳎����� )
    If strYuusibi = "2000/11/09" Or strYuusibi = "2000/11/10" Then
        'gstrBonusMD1,gstrBonusMD1���t�]������
' �������X����@2002/05/13��������������������������������������������������������������������������������������������������������������������������������������������������������������������
        strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
        If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
        Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
        Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
        Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
        Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
        Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
        Then
            strSyouyoDate1 = "2001/06/15"
            strSyouyoDate2 = "2001/12/01"
        Else
            If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then '2001/12/06
                If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                Else
                    If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                        strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�'
                        strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ�
                    Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                        strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                        strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                End If
            Else
                If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ� ' 2002/04/27
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�
                Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            End If
        End If
    Else
''''        '�ܗ^�x��������
''''''        If Format(Date, "MMDD") < gstrBonusMD1 Then
''''        If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''            '�ܗ^�x�������P���ܗ^�x�������Q��
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''            strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''''        ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
''''        ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
''''            '�ܗ^�x�������Q���ܗ^�x�������P��
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''            strSyouyoDate2 = Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
''''            strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''            strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        End If
        If Format(strYuusibi, "MMDD") >= gstrBonusMD1 Then '2001/12/06
            If Format(strYuusibi, "MMDD") >= gstrBonusMD2 Then
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
            Else
                If Format(strYuusibi, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�'
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ�
                Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                    strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                    strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            End If
        Else
            If Format(strYuusibi, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ� ' 2002/04/27
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusibi), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
        End If
    End If
    
    ' �P��ڂ̏ܗ^�ԍϓ��܂ł̊��ԎZ�o�̂��߂̊J�n��
    strZenkaiSyouyoHensaiBi = DateAdd("y", -1, CVDate(strYuusibi))

    '�N�敪�A�ܗ^���扽��ڂ��̐����@�̏�����
    intNenKBN = 1
    intKyuuyoCNT = 1
    intSyouyoCNT = 1
    
    ' �ܗ^�̕ԍω񐔂����߂�
    If intHensaiTuki <= 0 Then intHensaiTuki = 1
    intSyouyoHensaiKaisuu = Fix(intHensaiTuki / 6)
    
    '���[��(�P�T��Ȃǂ̂U�Ŋ���؂�Ȃ�)�����ł̕ԍς̏ꍇ�A���[�Ȍ����̒��ɏܗ^��������΁A���̉񐔂����Z����
    For i = 1 To intHensaiTuki Mod 6
        If DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate1) _
        Or DatePart("m", DateAdd("m", i, strYuusibi)) = DatePart("m", strSyouyoDate2) Then
            intSyouyoHensaiKaisuu = intSyouyoHensaiKaisuu + 1
        End If
    Next i
    If intSyouyoHensaiKaisuu <= 0 Then
        intSyouyoHensaiKaisuu = 1
    End If
    
    ' �P��ڂ̋��^�ԍϓ������߂�i�Z�����̗����̂Q�T������j
    strHensaiKijitu = DateAdd("m", 1, CVDate(Format$(strYuusibi, "yyyy/mm/25")))
  
    ' �P��ڂ̏ܗ^�ԍϓ������߂�i�Z�����̗����ȍ~�j
    
    '�X����@2002/05/13
    strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
    If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
    Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
    Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
    Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
    Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
    Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
    Then
        '���Z������ 2000/11/10 �̏ꍇ�� ���߂̃{�[�i�X�����U���P�T�ɂ���(�����̂P�Q���P���̃{�[�i�X���𖳎����� )
        If strYuusibi = "2000/11/09" Or strYuusibi = "2000/11/10" Then
            strSyouyoKijitu = "2001/06/15"
        Else
            If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then       '�ꃖ���O
                strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
            ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then   '�ꃖ���O
                strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
            Else
                strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
            End If
        End If
    ''''2003/05/06 �������ǉ�
    Else
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then       '�ꃖ���O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then   '�ꃖ���O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
        End If
    ''''2003/05/06 �������ǉ�
    End If
    
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll
    
    i = 1
    
    '�����[�N�e�[�u���o�^�p�f�[�^�쐬
    '* �P��ڂ̋��^�ԍϗp�̃f�[�^��ǉ�����
    If lngKyuuyoHensaiZandaka > 0 Then
        ReDim Preserve gstrYoteihyouAry(i)
        With gstrYoteihyouAry(i)
            .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
            .intNenKBN = intNenKBN  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
            .strKbn = "���^" & Space$(3 - Len(Format$(1, "###"))) & Format$(1, "###") '''''''''''''''''''''''''''�敪
            .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
            .strHensai = CStr(lngKyuuyoHensai) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
            ' �P��ڂ̗����v�Z�p���ԁi�Z��������P��ڂ܂ł̊��ԁj
            intHensaiKikan = DateDiff("y", CVDate(DateAdd("y", -1, CVDate(strYuusibi))), CVDate(strHensaiKijitu))
            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                ''''''.strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * intHensaiKikan)  ''''''''''''''''''''���^����''''2002/02/19 upd CVar(intHensaiKikan)
                .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''���^����
            Else
                dblKeiyakuriritu = dblRiritu * 100
                .strKyuRsk = Fix(lngKyuuyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan) / 36500) ''''''''''''''''''''���^����002/02/19 upd CVar(intHensaiKikan) & 2002/02/25  365�ɂȂ��Ă���
            End If
            
            .strKyuGan = .strHensai - .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
            If intHensaiTuki = 1 Then
                .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
            End If
            lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan
            .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^�ԍώc��
            .strZandaka = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�c��
            .strSyoGan = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
            .strSyoRsk = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
            .strSyoZan = " "   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
            intKyuuyoCNT = intKyuuyoCNT + 1
            i = i + 1
        End With
    End If

    If strYuusibi <> "2000/11/10" Then    '���Z������ 2000/11/10 �̏ꍇ�� ���߂̃{�[�i�X�����U���P�T�ɂ���(�����̂P�Q���P���̃{�[�i�X���𖳎����� )
        If strYuusibi <> "2000/11/09" Then    '���Z������ 2000/11/10 �̏ꍇ�� ���߂̃{�[�i�X�����U���P�T�ɂ���(�����̂P�Q���P���̃{�[�i�X���𖳎����� )
            '* �P��ڂ̋��^�ԍό��Əܗ^�ԍό�����v����ꍇ�A�P��ڂ̏ܗ^�ԍϗp�̃f�[�^��ǉ�����
            If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
                ReDim Preserve gstrYoteihyouAry(i)
                With gstrYoteihyouAry(i)
                
                    If lngKyuuyoHensai > 0 Then
                      .intPageKBN = Fix((intNenKBN + 2) / 3)
                    Else
                      .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                    End If
                    .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
                    .strKbn = "�ܗ^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''�敪
                    .strKijitu = gvarCnvDate(1, strSyouyoKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
                    .strHensai = CStr(lngSyouyoHensai) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                    ' �P��ڂ̗����v�Z�p���ԁi�Z��������P��ڂ܂ł̊��ԁj
                    intHensaiKikan = DateDiff("y", CVDate(strZenkaiSyouyoHensaiBi), CVDate(strSyouyoKijitu))
                    '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                    If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                        dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                        .strSyoRsk = Fix(lngSyouyoHensaiAll * dblKeiyakuriritu * CVar(intHensaiKikan))   ''''''''''''''''''''�ܗ^����''''2002/02/19 upd CVar(intHensaiKikan)
                    Else
                        dblRisoku2 = lngSyouyoHensaiAll * dblRiritu * CVar(intHensaiKikan) / 365 ''''2002/02/19 upd CVar(intHensaiKikan)
                        .strSyoRsk = Int(dblRisoku2) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                    End If
                    .strSyoGan = .strHensai - .strSyoRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                    If intSyouyoHensaiKaisuu = 1 Then
                        .strSyoGan = lngSyouyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                        .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk ''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                    End If
                    lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan '�ܗ^�ԍώc�� �v�Z
                    .strSyoZan = lngSyouyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
                    .strZandaka = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�c��
                    .strKyuGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                    .strKyuRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^����
                    .strKyuZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^�ԍώc��
                    strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                    intSyouyoCNT = intSyouyoCNT + 1
                    i = i + 1
                End With
            End If
        End If
    End If

    strZenkaiHensaiKijitu = strHensaiKijitu
    strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)
  
    ' �����Q��ڈȍ~�̃f�[�^�ǉ�
    intNenKBN_WK = 2
    'While (I <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
    While (intKyuuyoCNT <= intHensaiTuki Or intSyouyoCNT <= intSyouyoHensaiKaisuu) And (lngKyuuyoHensaiZandaka > 0 Or lngSyouyoHensaiZandaka > 0)
        '* ���^�̃f�[�^�ǉ�
        If lngKyuuyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                .intPageKBN = Fix((intNenKBN + 2) / 3) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                .intNenKBN = intNenKBN ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
                .strKbn = "���^" & Space$(3 - Len(Format$(intKyuuyoCNT, "###"))) & Format$(intKyuuyoCNT, "###") '�敪
                .strKijitu = gvarCnvDate(1, strHensaiKijitu) ''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
                .strHensai = lngKyuuyoHensai ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                ' �O�񂩂獡��̗����v�Z�p����
                intHensaiKikan = DateDiff("y", CVDate(strZenkaiHensaiKijitu), CVDate(strHensaiKijitu))
                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    ''''''.strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblKeiyakuriritu * intHensaiKikan)  ''''''''''''''''''''���^����  2002/_02_19 Upd CVar(intHensaiKikan)
                    .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''���^����
                Else
                    .strKyuRsk = Fix(lngKyuuyoHensaiZandaka * dblRiritu * CVar(intHensaiKikan) / 365) '''''''''''''''''''''���^���� 2002/_02_19 Upd CVar(intHensaiKikan)
                End If
                
                .strKyuGan = .strHensai - .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                ' �ŏI��̏ꍇ
                If intHensaiTuki = intKyuuyoCNT Then
                    .strKyuGan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                    .strHensai = lngKyuuyoHensaiZandaka + .strKyuRsk ''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                End If
                lngKyuuyoHensaiZandaka = lngKyuuyoHensaiZandaka - .strKyuGan '���^�ԍώc�� �v�Z
                .strKyuZan = lngKyuuyoHensaiZandaka '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^�c��
                .strZandaka = " "
                .strSyoGan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                .strSyoRsk = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                .strSyoZan = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^�c��
                intKyuuyoCNT = intKyuuyoCNT + 1
                i = i + 1
            End With
        End If
        
        '* ���Y���Əܗ^�ԍό�����v����ꍇ�A�ܗ^�ԍϗp�̃f�[�^���ǉ�����
        If (DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate1) Or DatePart("m", strHensaiKijitu) = DatePart("m", strSyouyoDate2)) And lngSyouyoHensaiZandaka > 0 Then
            ReDim Preserve gstrYoteihyouAry(i)
            With gstrYoteihyouAry(i)
                
                If lngKyuuyoHensai > 0 Then
                    .intPageKBN = Fix((intNenKBN + 2) / 3)
                Else
                    .intPageKBN = 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�y�[�W�敪
                End If
                .intNenKBN = intNenKBN '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�N�敪
                .strKbn = "�ܗ^" & String$(3 - Len(Format$(intSyouyoCNT, "###")), "*") & Format$(intSyouyoCNT, "###") ''�敪
                '* ����̏ܗ^�ԍϓ��̎Z�o
                If Month(strHensaiKijitu) = Month(strSyouyoDate1) Then
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
                Else
                    strSyouyoKijitu = CVDate(Format$(strHensaiKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
                End If
                .strKijitu = gvarCnvDate(1, strSyouyoKijitu) '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϊ���
                .strHensai = lngSyouyoHensai '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                ' �����v�Z�p����
                intHensaiKikan = DateDiff("y", CVDate(strZenkaiSyouyoHensaiBi), CVDate(strSyouyoKijitu))
                '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
                If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                    dblKeiyakuriritu = Fix(dblRiritu / 365 * 1000000) / 1000000
                    .strSyoRsk = Fix(lngSyouyoHensaiZandaka * dblKeiyakuriritu * CVar(intHensaiKikan))  ''''''''''''''''''''�ܗ^����  2002/_02_19 Upd CVar(intHensaiKikan)
                Else
                    dblRisoku2 = lngSyouyoHensaiZandaka * dblRiritu * CVar(intHensaiKikan) / 365 '''2002/_02_19 Upd CVar(intHensaiKikan)
                    .strSyoRsk = Int(dblRisoku2) ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^����
                End If
                .strSyoGan = .strHensai - .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                ' �ŏI��̏ꍇ
                If intSyouyoHensaiKaisuu = intSyouyoCNT Then
                    .strSyoGan = lngSyouyoHensaiZandaka ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�ܗ^���{
                    .strHensai = lngSyouyoHensaiZandaka + .strSyoRsk '''''''''''''''''''''''''''''''''''''''''''''''''''�ԍϋ��z
                End If
                lngSyouyoHensaiZandaka = lngSyouyoHensaiZandaka - .strSyoGan '�ܗ^�ԍώc�� �v�Z
                .strSyoZan = lngSyouyoHensaiZandaka
                .strZandaka = " " ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''�c��
                .strKyuGan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^���{
                .strKyuRsk = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^����
                .strKyuZan = " " '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''���^�ԍώc��
                strZenkaiSyouyoHensaiBi = strSyouyoKijitu
                intSyouyoCNT = intSyouyoCNT + 1
                i = i + 1
            End With
        End If
        
        strZenkaiHensaiKijitu = strHensaiKijitu
        strHensaiKijitu = DateAdd("m", 1, strHensaiKijitu)
        
        ' �P�Q��i�����ܗ^�̎��́A���̏ܗ^�܂Ŋ܂܂��j���ɁA
        ' �ԍϗ\��\�Ɍr�����o�͂����邽�߂̋敪�̃J�E���g�A�b�v
        If ((intNenKBN_WK) Mod 12) = 0 Then
            intNenKBN = intNenKBN + 1
        End If
        intNenKBN_WK = intNenKBN_WK + 1
        
    Wend

    '��gstrYoteihyouAry�z��\�[�g...�ܗ^�f�[�^������Ă��邽�߁�
    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            ReDim Preserve lngSortKey(Y)
            ReDim Preserve gstrYoteihyouSort(Y)
            lngSortKey(Y) = CLng(Format(Mid$(.strKijitu, 1, 2), "00") & Format(Mid$(.strKijitu, 4, 2), "00") & Format(Mid$(.strKijitu, 7, 2), "00"))
            gstrYoteihyouSort(Y).intNenKBN = gstrYoteihyouAry(Y).intNenKBN
            gstrYoteihyouSort(Y).intPageKBN = gstrYoteihyouAry(Y).intPageKBN
            gstrYoteihyouSort(Y).strHensai = gstrYoteihyouAry(Y).strHensai
            gstrYoteihyouSort(Y).strKbn = gstrYoteihyouAry(Y).strKbn
            gstrYoteihyouSort(Y).strKijitu = gstrYoteihyouAry(Y).strKijitu
            gstrYoteihyouSort(Y).strKyuGan = gstrYoteihyouAry(Y).strKyuGan
            gstrYoteihyouSort(Y).strKyuRsk = gstrYoteihyouAry(Y).strKyuRsk
            gstrYoteihyouSort(Y).strKyuZan = gstrYoteihyouAry(Y).strKyuZan
            gstrYoteihyouSort(Y).strSyoGan = gstrYoteihyouAry(Y).strSyoGan
            gstrYoteihyouSort(Y).strSyoRsk = gstrYoteihyouAry(Y).strSyoRsk
            gstrYoteihyouSort(Y).strSyoZan = gstrYoteihyouAry(Y).strSyoZan
            gstrYoteihyouSort(Y).strZandaka = gstrYoteihyouAry(Y).strZandaka
        End With
    Next Y
    
    For Y = 1 To UBound(gstrYoteihyouAry)
        If Y <> 1 Then
            If lngSortKey(Y) < lngSortKey(Y - 1) Then
                gstrYoteihyouAry(Y).intNenKBN = gstrYoteihyouSort(Y - 1).intNenKBN
                gstrYoteihyouAry(Y).intPageKBN = gstrYoteihyouSort(Y - 1).intPageKBN
                gstrYoteihyouAry(Y).strHensai = gstrYoteihyouSort(Y - 1).strHensai
                gstrYoteihyouAry(Y).strKbn = gstrYoteihyouSort(Y - 1).strKbn
                gstrYoteihyouAry(Y).strKijitu = gstrYoteihyouSort(Y - 1).strKijitu
                gstrYoteihyouAry(Y).strKyuGan = gstrYoteihyouSort(Y - 1).strKyuGan
                gstrYoteihyouAry(Y).strKyuRsk = gstrYoteihyouSort(Y - 1).strKyuRsk
                gstrYoteihyouAry(Y).strKyuZan = gstrYoteihyouSort(Y - 1).strKyuZan
                gstrYoteihyouAry(Y).strSyoGan = gstrYoteihyouSort(Y - 1).strSyoGan
                gstrYoteihyouAry(Y).strSyoRsk = gstrYoteihyouSort(Y - 1).strSyoRsk
                gstrYoteihyouAry(Y).strSyoZan = gstrYoteihyouSort(Y - 1).strSyoZan
                gstrYoteihyouAry(Y).strZandaka = gstrYoteihyouSort(Y - 1).strZandaka
            
                gstrYoteihyouAry(Y - 1).intNenKBN = gstrYoteihyouSort(Y).intNenKBN
                gstrYoteihyouAry(Y - 1).intPageKBN = gstrYoteihyouSort(Y).intPageKBN
                gstrYoteihyouAry(Y - 1).strHensai = gstrYoteihyouSort(Y).strHensai
                gstrYoteihyouAry(Y - 1).strKbn = gstrYoteihyouSort(Y).strKbn
                gstrYoteihyouAry(Y - 1).strKijitu = gstrYoteihyouSort(Y).strKijitu
                gstrYoteihyouAry(Y - 1).strKyuGan = gstrYoteihyouSort(Y).strKyuGan
                gstrYoteihyouAry(Y - 1).strKyuRsk = gstrYoteihyouSort(Y).strKyuRsk
                gstrYoteihyouAry(Y - 1).strKyuZan = gstrYoteihyouSort(Y).strKyuZan
                gstrYoteihyouAry(Y - 1).strSyoGan = gstrYoteihyouSort(Y).strSyoGan
                gstrYoteihyouAry(Y - 1).strSyoRsk = gstrYoteihyouSort(Y).strSyoRsk
                gstrYoteihyouAry(Y - 1).strSyoZan = gstrYoteihyouSort(Y).strSyoZan
                gstrYoteihyouAry(Y - 1).strZandaka = gstrYoteihyouSort(Y).strZandaka
            End If
        End If
    Next Y



    '���c���Z�o��
    lngKyuuyoHensaiZandaka = lngKyuuyoHensaiAll
    lngSyouyoHensaiZandaka = lngSyouyoHensaiAll

    For Y = 1 To UBound(gstrYoteihyouAry)
        With gstrYoteihyouAry(Y)
            If Trim$(.strKyuZan) <> "" Then
                lngKyuuyoHensaiZandaka = .strKyuZan
            End If
            If Trim$(.strSyoZan) <> "" Then
                lngSyouyoHensaiZandaka = .strSyoZan
            End If
            .strZandaka = lngKyuuyoHensaiZandaka + lngSyouyoHensaiZandaka '�c��
        End With
    Next Y

asd:
Exit Sub

End Sub

'***********************************************************************************************************
' �@ ���[�p�f�[�^�쐬
'***********************************************************************************************************
Public Function gfncblnMakPrintDat() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim j                 As Long
 Const cnsMaxRec       As Long = 100  '���ŏo�͂���ő�s�� '''''
 Const cnslngAryCnt    As Long = 100   '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���
 Dim OraPArray_01      As Object       '01 �y�[�W�敪
 Dim OraPArray_02      As Object       '02 �N�敪
 Dim OraPArray_03      As Object       '03 �敪
 Dim OraPArray_04      As Object       '04 �ԍϊ���
 Dim OraPArray_05      As Object       '05 �ԍϋ��z
 Dim OraPArray_06      As Object       '06 �c��
 Dim OraPArray_07      As Object       '07 ���^���{
 Dim OraPArray_08      As Object       '08 ���^����
 Dim OraPArray_09      As Object       '09 ���^�c��
 Dim OraPArray_10      As Object       '10 �ܗ^���{
 Dim OraPArray_11      As Object       '11 �ܗ^����
 Dim OraPArray_12      As Object       '12 �ܗ^�c��
 
 Dim StrYuusiYMDWK     As String

On Error GoTo ErrgfncblnMakPrintDat

    gfncblnMakPrintDat = False
    
    '�r�o�p�p�����[�^�[�Z�b�g
    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCD1", gstrSyainCd1, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSyainCD1").ServerType = ORATYPE_CHAR
    '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSyainCD2", gstrSyainCd2, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSyainCD2").ServerType = ORATYPE_CHAR
    '����
    odbDatabase.Parameters.Add "InStrSimei", frmQPAV_CEnt110.lblShimei.Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrSimei").ServerType = ORATYPE_VARCHAR2
    '�X��
    odbDatabase.Parameters.Add "InStrMiseNm", frmQPAV_CEnt110.lblShozoku(1).Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrMiseNm").ServerType = ORATYPE_VARCHAR2
    '�Z���N����
    StrYuusiYMDWK = frmQPAV_CEnt110.txtYuusibiY.Text & "/" & frmQPAV_CEnt110.txtYuusibiM.Text & "/" & frmQPAV_CEnt110.txtYuusibiD.Text
    StrYuusiYMDWK = gvarCnvDate(1, StrYuusiYMDWK)
    odbDatabase.Parameters.Add "InStrYusiYMD", StrYuusiYMDWK, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYusiYMD").ServerType = ORATYPE_VARCHAR2
    '����
    odbDatabase.Parameters.Add "InStrRiritu", frmQPAV_CEnt110.lblRiritu.Caption, ORAPARM_INPUT
        odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_VARCHAR2
    '�Z�����z
    odbDatabase.Parameters.Add "InNumYusiKng", CLng(frmQPAV_CEnt110.lblYuushi.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumYusiKng").ServerType = ORATYPE_NUMBER
    '���^�ԍϊz
    odbDatabase.Parameters.Add "InNumKyuHensai", CLng(frmQPAV_CEnt110.lblKyuuyo.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumKyuHensai").ServerType = ORATYPE_NUMBER
    '�ܗ^�ԍϊz
    odbDatabase.Parameters.Add "InNumSyoHensai", CLng(frmQPAV_CEnt110.lblShouyo.Caption), ORAPARM_INPUT
        odbDatabase.Parameters("InNumSyoHensai").ServerType = ORATYPE_NUMBER
    
    '�z�񌏐�
    odbDatabase.Parameters.Add "InNumAryCount", UBound(gstrYoteihyouAry), ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    
    '01 �y�[�W�敪�z��
              odbDatabase.Parameters.AddTable "InNumPageKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_01 = odbDatabase.Parameters("InNumPageKBNAry")
    '02 �N�敪�z��
              odbDatabase.Parameters.AddTable "InNumNenKBNAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 2
    Set OraPArray_02 = odbDatabase.Parameters("InNumNenKBNAry")
    '03 �敪�z��
              odbDatabase.Parameters.AddTable "InStrKBNAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 10
    Set OraPArray_03 = odbDatabase.Parameters("InStrKBNAry")
    '04 �ԍϊ����z��
              odbDatabase.Parameters.AddTable "InStrKijituAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 20
    Set OraPArray_04 = odbDatabase.Parameters("InStrKijituAry")
    '05 �ԍϋ��z�z��
              odbDatabase.Parameters.AddTable "InNumHensaiAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_05 = odbDatabase.Parameters("InNumHensaiAry")
    '06 �c���z��
              odbDatabase.Parameters.AddTable "InNumZandakaAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_06 = odbDatabase.Parameters("InNumZandakaAry")
    '07 ���^���{�z��
              odbDatabase.Parameters.AddTable "InNumKyuGanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_07 = odbDatabase.Parameters("InNumKyuGanAry")
    '08 ���^�����z��
              odbDatabase.Parameters.AddTable "InNumKyuRskAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_08 = odbDatabase.Parameters("InNumKyuRskAry")
    '09 ���^�c���z��
              odbDatabase.Parameters.AddTable "InNumKyuZanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_09 = odbDatabase.Parameters("InNumKyuZanAry")
    '10 �ܗ^���{�z��
              odbDatabase.Parameters.AddTable "InNumSyoGanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_10 = odbDatabase.Parameters("InNumSyoGanAry")
    '11 �ܗ^�����z��
              odbDatabase.Parameters.AddTable "InNumSyoRskAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_11 = odbDatabase.Parameters("InNumSyoRskAry")
    '12 �ܗ^�c���z��
              odbDatabase.Parameters.AddTable "InNumSyoZanAry", ORAPARM_INPUT, ORATYPE_NUMBER, cnsMaxRec, 7
    Set OraPArray_12 = odbDatabase.Parameters("InNumSyoZanAry")
    
    '�R���s���[�^�[��
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2
        
             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110PrintAdd("
    strSQL = strSQL & " :InStrSyainCD1"     '�Ј��R�[�h�P
    strSQL = strSQL & ",:InStrSyainCD2"     '�Ј��R�[�h�Q
    strSQL = strSQL & ",:InStrSimei"        '����
    strSQL = strSQL & ",:InStrMiseNm"       '�X��
    strSQL = strSQL & ",:InStrYusiYMD"      '�Z���N����
    strSQL = strSQL & ",:InStrRiritu"       '����
    strSQL = strSQL & ",:InNumYusiKng"      '�Z�����z
    strSQL = strSQL & ",:InNumKyuHensai"    '���^�ԍϊz
    strSQL = strSQL & ",:InNumSyoHensai"    '�ܗ^�ԍϊz
    strSQL = strSQL & ",:InNumAryCount"     '�z�񌏐�
    strSQL = strSQL & ",:InNumPageKBNAry"   '�y�[�W�敪�z��
    strSQL = strSQL & ",:InNumNenKBNAry"    '�N�敪�z��
    strSQL = strSQL & ",:InStrKBNAry"       '�敪�z��
    strSQL = strSQL & ",:InStrKijituAry"    '�ԍϊ����z��
    strSQL = strSQL & ",:InNumHensaiAry"    '�ԍϋ��z�z��
    strSQL = strSQL & ",:InNumZandakaAry"   '�c���z��
    strSQL = strSQL & ",:InNumKyuGanAry"    '���^���{�z��
    strSQL = strSQL & ",:InNumKyuRskAry"    '���^�����z��
    strSQL = strSQL & ",:InNumKyuZanAry"    '���^�c���z��
    strSQL = strSQL & ",:InNumSyoGanAry"    '�ܗ^���{�z��
    strSQL = strSQL & ",:InNumSyoRskAry"    '�ܗ^�����z��
    strSQL = strSQL & ",:InNumSyoZanAry"    '�ܗ^�c���z��
    strSQL = strSQL & ",:InStrCOMPUTERMEI); END;" '�R���s���[�^��
 
    i = 1
    
    Do Until i > UBound(gstrYoteihyouAry)
        For j = 1 To cnsMaxRec '
            If i > UBound(gstrYoteihyouAry) Then
                Exit For
            End If
            With gstrYoteihyouAry(i)
                OraPArray_01.Put_value CLng(.intPageKBN), (j - 1) '01 �y�[�W�敪
                OraPArray_02.Put_value CLng(.intNenKBN), (j - 1)  '02 �N�敪
                OraPArray_03.Put_value .strKbn, (j - 1)           '03 �敪
                
                
                OraPArray_04.Put_value .strKijitu, (j - 1)        '04 �ԍϊ���
                
                OraPArray_05.Put_value CLng(.strHensai), (j - 1)  '05 �ԍϋ��z
                OraPArray_06.Put_value CLng(.strZandaka), (j - 1) '06 �c��
                
                If .strKyuGan = " " Then                          '07 ���^���{
                    OraPArray_07.Put_value Null, (j - 1)
                Else
                    OraPArray_07.Put_value CLng(.strKyuGan), (j - 1)
                End If
                If .strKyuRsk = " " Then                          '08 ���^����
                    OraPArray_08.Put_value Null, (j - 1)
                Else
                    OraPArray_08.Put_value CLng(.strKyuRsk), (j - 1)
                End If
                If .strKyuZan = " " Then                          '09 ���^�c��
                    OraPArray_09.Put_value Null, (j - 1)
                Else
                    OraPArray_09.Put_value CLng(.strKyuZan), (j - 1)
                End If

                If .strSyoGan = " " Then                          '10 �ܗ^���{
                    OraPArray_10.Put_value Null, (j - 1)
                Else
                    OraPArray_10.Put_value CLng(.strSyoGan), (j - 1)
                End If

                If .strSyoRsk = " " Then                          '11 �ܗ^����
                    OraPArray_11.Put_value Null, (j - 1)
                Else
                    OraPArray_11.Put_value CLng(.strSyoRsk), (j - 1)
                End If

                If .strSyoZan = " " Then                          '12 �ܗ^�c��
                    OraPArray_12.Put_value Null, (j - 1)
                Else
                    OraPArray_12.Put_value CLng(.strSyoZan), (j - 1)
                End If
                
            End With
            i = i + 1
        Next j
        
        '�z�񌏐��̒l�Z�b�g
        odbDatabase.Parameters("InNumAryCount").Value = j - 1
        
        '�r�p�k���̎��s
        odbDatabase.DbexecuteSQL (strSQL)
    
    Loop
 
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfncblnMakPrintDat = True

    Exit Function

ErrgfncblnMakPrintDat:
'�װ����
    
    '�װү���ޕ\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'***********************************************************************************************************
' �@ ���[�p�f�[�^�폜
'***********************************************************************************************************
Public Function gfncblnDelPrintDat() As Boolean
 Dim strSQL            As String

On Error GoTo ErrgfncblnDelPrintDat

    gfncblnDelPrintDat = False

    '�R���s���[�^�[��
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110PrintDel("
    strSQL = strSQL & ":InStrCOMPUTERMEI); END;" '�R���s���[�^��

    '�r�p�k���̎��s
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    gfncblnDelPrintDat = True

    Exit Function

ErrgfncblnDelPrintDat:
'�װ����
    
    '�װү���ޕ\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '��޼ު�Ă̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'*************************************************************************************************************************************************
'     ����ܗ^�ԍϊz�Z�o����6�J���ȊO
'*************************************************************************************************************************************************
Function gfnclngSyouyoHensai(strYuusibi As String, dblRiritu As Double, strSyouyoDate1 As String, strSyouyoDate2 As String, intSyouyoHensaiKaisuu As Integer, lngSyouyoHensaiAll As Long, dblRisoku1 As Double, lngSyouyoTeigaku As Long) As Long
 Dim T As Integer
 Dim lngTeiGakuHensai_1 As Long   '��z�ԍϊz_WORK
 Dim lngTeiGakuHensai_2 As Long   '��z�ԍϊz_WORK2
 Dim lngTeiGakuHensai_3 As Long   '��z�ԍϊz_�ۑ�
 Dim lngHensaiSagaku    As Long   '�ԍύ��z_WORK
 Dim lngHensaiSyuukei   As Long   '�ԍϏW�v_WORK
 Dim lngSyouyoHenZan    As Long   '�ܗ^�ԍώc��_WORK
 Dim lngSyouyoHenRsk    As Long   '�ܗ^�ԍϗ���_WORK
 Dim strSyouyoKijitu    As String '�ܗ^����_WORK
 Dim strZenkaiSyouyoHen As String '�O��ܗ^�ԍϓ�_WORK
 Dim lngSaisyuHensai    As Long   '�ŏI�ԍϊz_WORK

 Dim dblKeiyakuriritu    As Double   '�X�΃N�������[�N�i�V�V�X�e��2001/11/01�ȍ~�Ɏg�p�j

    If lngSyouyoHensaiAll <= 0 Then
        gfnclngSyouyoHensai = 0
        Exit Function
    End If

    '--------------------
    lngTeiGakuHensai_3 = lngSyouyoTeigaku
    lngTeiGakuHensai_1 = lngSyouyoTeigaku

    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If

    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
    lngTeiGakuHensai_2 = Int(lngHensaiSyuukei / intSyouyoHensaiKaisuu)

    '--------------------
    Do
        lngHensaiSagaku = Abs(lngTeiGakuHensai_1 - lngSaisyuHensai)
        lngTeiGakuHensai_3 = lngTeiGakuHensai_1
        lngTeiGakuHensai_1 = lngTeiGakuHensai_2
        lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
        lngHensaiSyuukei = lngTeiGakuHensai_1
        lngSaisyuHensai = lngTeiGakuHensai_1
        strZenkaiSyouyoHen = strYuusibi
        If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
            strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
        End If
        For T = 2 To intSyouyoHensaiKaisuu
            strZenkaiSyouyoHen = strSyouyoKijitu
            If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
                strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
            Else
                strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
            End If
        
            '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
            If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
                dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
                lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
            Else
                lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
            End If
        
            If T = intSyouyoHensaiKaisuu Then
                lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
                lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
                lngSyouyoHenZan = 0
            Else
                lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
                lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
            End If
        Next T
        lngTeiGakuHensai_2 = Int((lngHensaiSyuukei + 1) / intSyouyoHensaiKaisuu)
    Loop While lngHensaiSagaku > Abs(lngTeiGakuHensai_1 - lngSaisyuHensai)

    '***��z�ԍϊz_�ۑ�(�{�P) �̏ꍇ�ō��z�����߂�
    lngTeiGakuHensai_2 = lngTeiGakuHensai_3
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 + 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then                 '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If
  
    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
      
    If lngHensaiSagaku > Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 + 1
    End If

    If lngHensaiSagaku = Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 + 1
    End If
    
    '***��z�ԍϊz_�ۑ�(�|�P) �̏ꍇ�ō��z�����߂�
    lngTeiGakuHensai_1 = lngTeiGakuHensai_2 - 1
    lngSyouyoHenZan = lngSyouyoHensaiAll - lngTeiGakuHensai_1 + dblRisoku1
    lngHensaiSyuukei = lngTeiGakuHensai_1
    lngSaisyuHensai = lngTeiGakuHensai_1
    strZenkaiSyouyoHen = strYuusibi

    If DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm") & "/01"))) >= 0 Then     '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
    ElseIf DateDiff("y", strYuusibi, DateAdd("y", -1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm") & "/01"))) >= 0 Then '�ꃖ���O
        strSyouyoKijitu = CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
    Else
        strSyouyoKijitu = DateAdd("yyyy", 1, CVDate(Format$(strYuusibi, "yyyy/") & Format$(strSyouyoDate1, "mm/dd")))
    End If
  
    For T = 2 To intSyouyoHensaiKaisuu
        strZenkaiSyouyoHen = strSyouyoKijitu
        If Month(strSyouyoKijitu) = Month(strSyouyoDate1) Then
            strSyouyoKijitu = CVDate(Format$(strSyouyoKijitu, "yyyy/") & Format$(strSyouyoDate2, "mm/dd"))
        Else
            strSyouyoKijitu = CVDate(Format$(DateAdd("yyyy", 1, strSyouyoKijitu), "yyyy/") & Format$(strSyouyoDate1, "mm/dd"))
        End If
        
        '/*�����Z�o �Z�������V�V�X�e���ڍs��(2001/11/01) */                                                    -- 10/23 UPD
        If CDate(Format(strYuusibi, "YYYY/MM/DD")) >= CDate(Format(gcnsstrSysChng, "YYYY/MM/DD")) Then
            dblKeiyakuriritu = Fix(dblRiritu / 12 * 1000000) / 1000000
            lngSyouyoHenRsk = Fix(lngSyouyoHenZan * dblKeiyakuriritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu))
        Else
            lngSyouyoHenRsk = Int(lngSyouyoHenZan * dblRiritu * DateDiff("m", strZenkaiSyouyoHen, strSyouyoKijitu) / 12)
        End If
        
        If T = intSyouyoHensaiKaisuu Then
            lngHensaiSyuukei = lngHensaiSyuukei + lngSyouyoHenZan + lngSyouyoHenRsk
            lngSaisyuHensai = lngSyouyoHenZan + lngSyouyoHenRsk
            lngSyouyoHenZan = 0
        Else
            lngHensaiSyuukei = lngHensaiSyuukei + lngTeiGakuHensai_1
            lngSyouyoHenZan = lngSyouyoHenZan - lngTeiGakuHensai_1 + lngSyouyoHenRsk
        End If
    Next T
      
    If lngHensaiSagaku >= Abs(lngTeiGakuHensai_1 - lngSaisyuHensai) Then
        lngTeiGakuHensai_3 = lngTeiGakuHensai_2 - 1
    End If

    gfnclngSyouyoHensai = lngTeiGakuHensai_3

End Function


'***********************************************************************************************************
'  ���t�ϊ�
'***********************************************************************************************************
Public Function gvarCnvDate(intSyoriFlg As Integer, varHenkanDate As Variant) As Variant
 Dim varHenkanMae As Variant

On Error GoTo TO_ERROR_gvarCnvDate

    gvarCnvDate = Null
  
    varHenkanMae = CVDate(varHenkanDate)

    Select Case intSyoriFlg
'2019/5/7 MOD START ���2���\���ɕύX
'        Case 1: gvarCnvDate = Space(2 - Len(Format$(varHenkanMae, "e"))) & Format$(varHenkanMae, "e.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
'        Case 2: gvarCnvDate = Format$(varHenkanMae, "ge.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
        Case 1: gvarCnvDate = Space(2 - Len(Format$(varHenkanMae, "yy"))) & Format$(varHenkanMae, "yy.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
        Case 2: gvarCnvDate = Format$(varHenkanMae, "yy.") & Space(2 - Len(Format$(varHenkanMae, "m"))) & Format$(varHenkanMae, "m.") & Space(2 - Len(Format$(varHenkanMae, "d"))) & Format$(varHenkanMae, "d")
'2019/5/7 MOD END
    End Select

EXIT_gvarCnvDate:
    Exit Function

TO_ERROR_gvarCnvDate:
    Resume EXIT_gvarCnvDate

End Function


