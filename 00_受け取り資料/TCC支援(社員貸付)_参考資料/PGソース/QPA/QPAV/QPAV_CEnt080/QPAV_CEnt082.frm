VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt082 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "���񂹓���"
   ClientHeight    =   8250
   ClientLeft      =   585
   ClientTop       =   1500
   ClientWidth     =   14325
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form5"
   LockControls    =   -1  'True
   ScaleHeight     =   8250
   ScaleWidth      =   14325
   StartUpPosition =   2  '��ʂ̒���
   Begin MSComctlLib.ProgressBar prgBar 
      Height          =   240
      Left            =   4245
      TabIndex        =   23
      Top             =   7980
      Visible         =   0   'False
      Width           =   3780
      _ExtentX        =   6668
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   330
      Left            =   0
      TabIndex        =   22
      Top             =   7920
      Width           =   14325
      _ExtentX        =   25268
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14208
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
            Text            =   "�x�m�ʁ@���Y"
            TextSave        =   "�x�m�ʁ@���Y"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
            Text            =   "9999999999999999"
            TextSave        =   "9999999999999999"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "2006/04/21"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "18:53"
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox Picture1 
      Height          =   7005
      Left            =   0
      ScaleHeight     =   6945
      ScaleWidth      =   14265
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   0
      Width           =   14325
      Begin VB.Frame Frame1 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   810
         Left            =   75
         TabIndex        =   20
         Top             =   0
         Width           =   14115
         Begin VB.TextBox txtKaiinsimeiKana 
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            IMEMode         =   6  '���p����
            Left            =   5130
            MaxLength       =   30
            TabIndex        =   0
            Top             =   285
            Width           =   3330
         End
         Begin VB.Label lblLabel 
            Alignment       =   2  '��������
            AutoSize        =   -1  'True
            Caption         =   "�Ј�����(��)"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   225
            Index           =   2
            Left            =   3495
            TabIndex        =   21
            Top             =   345
            Width           =   1395
         End
      End
      Begin VB.Frame Frame2 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   5520
         Left            =   75
         TabIndex        =   19
         Top             =   840
         Width           =   14115
         Begin FPSpread.vaSpread sprList 
            Height          =   4770
            Left            =   405
            TabIndex        =   1
            Top             =   420
            Width           =   13305
            _Version        =   196608
            _ExtentX        =   23469
            _ExtentY        =   8414
            _StockProps     =   64
            MaxCols         =   8
            MaxRows         =   20
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt082.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�� ��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   75
         TabIndex        =   2
         Top             =   6420
         Width           =   1230
      End
   End
   Begin VB.PictureBox picPfMenu 
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   8.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   0
      ScaleHeight     =   420
      ScaleWidth      =   14265
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   7440
      Width           =   14325
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:���"
         Height          =   375
         Index           =   12
         Left            =   13080
         TabIndex        =   7
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   11
         Left            =   11895
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:�O���"
         Height          =   375
         Index           =   10
         Left            =   10710
         TabIndex        =   6
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   9
         Left            =   9525
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   8
         Left            =   8340
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   7
         Left            =   7155
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   6
         Left            =   5970
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:���s"
         Height          =   375
         Index           =   5
         Left            =   4785
         TabIndex        =   5
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   4
         Left            =   3600
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   2415
         TabIndex        =   11
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ʰ�޺�߰"
         Height          =   375
         Index           =   2
         Left            =   1230
         TabIndex        =   4
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Height          =   375
         Index           =   1
         Left            =   45
         TabIndex        =   3
         Top             =   30
         Width           =   1155
      End
   End
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      Height          =   405
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   14265
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   7020
      Width           =   14325
      Begin VB.Label lblMsg 
         BackStyle       =   0  '����
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   285
         Left            =   30
         TabIndex        =   9
         Top             =   30
         Width           =   12405
      End
   End
End
Attribute VB_Name = "frmQPAV_CEnt082"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg       As Boolean     '�����t���O
Private strSyainMyouji    As String      '��������J�i�����@���񂹌����p�ϐ�
Private strSyainNamae     As String      '��������J�i���O�@���񂹌����p�ϐ�
'******************************************************************************
'*    FORM_LOAD �C�x���g
'******************************************************************************
Private Sub Form_Load()
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "���񂹌��� (" & gstrCommandLine(8) & ")"
    
    '����ʏ�����
    Call subFormInitialize
    
'-- Start Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    '���쐧����ʔ��菈��
    Set clsActX490 = CreateObject("QSAV_ActX490.ActX490C")
    Set clsActX490.podbDatabase = odbDatabase
    Call clsActX490.subQSAV_ActX490(Me.Name, _
                                    gstrCommandLine(1), _
                                    gstrCommandLine(5), _
                                    gstrCommandLine(8), _
                                    gstrCommandLine(10), _
                                    gstrCommandLine(11))
    Me.Caption = Me.Caption & clsActX490.strHcopyNotName
    Set clsActX490 = Nothing
'-- Finish Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    
    '�����׸ޏ�����
    gblnNayoseFlg = False
    
End Sub
'******************************************************************************
'*    FORM UNLOAD �C�x���g
'******************************************************************************
Private Sub Form_Unload(CANCEL As Integer)
End Sub
'******************************************************************************
'*    FORM_ACTIVATE �C�x���g
'******************************************************************************
Private Sub Form_Activate()
End Sub
'******************************************************************************
'*    FORM_KEYDOWN �t�@���N�V�����L�[�ݒ�
'******************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    Select Case KeyCode
        Case vbKeyReturn   'Enter
            SendKeys "{TAB}"
        Case vbKeyF1   'F1
            Call cmdPFK_Click(1)
        Case vbKeyF2   'F2
            Call cmdPFK_Click(2)
        Case vbKeyF5   'F5
            If cmdPFK(5).Enabled = True Then
                Call cmdPFK_Click(5)
            End If
        Case vbKeyF10   'F10
            Call cmdPFK_Click(10)
        Case vbKeyF12   'F12
            Call cmdPFK_Click(12)
        Case vbKeyDelete    'DEL�L�[����������
            Call Form_KeyPress(46)
        Case vbKeyUp
            Call subErrKaijo
        Case vbKeyDown
            Call subErrKaijo
        Case vbKeyRight
            Call subErrKaijo
        Case vbKeyLeft
            Call subErrKaijo
    End Select

End Sub
'******************************************************************************
'*    FORM_KEYPRESS �C�x���g
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ENTER Beep������
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub
'******************************************************************************
'*    �e�t�@���N�V�����L�[�@�\
'******************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  '���j���[
'            Unload Me
'            Exit Sub
        Case 2  '�n�[�h�R�s�[
'DEL 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
'           Call gsubQSAV_ActX1001
'--Start Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
            '�n�[�h�R�s�[�pDLL�ďo�����ɉ�ʃL���v�V�������p�����[�^�Ƃ��Ēǉ�
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            
            Set clsActX1001 = Nothing
'--Finish Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
        
        Case 5  '���s
            Call subcmdPFK5
        Case 10 '�O���
            Unload Me
            Exit Sub
        Case 12 '���
            Call subFormInitialize
            txtKaiinsimeiKana.SetFocus
    End Select
    
End Sub
'******************************************************************************
'*    ��ʏ�����
'******************************************************************************
Private Sub subFormInitialize()
 Dim intX As Integer
 
    '�e�\�����ڃN���A
    txtKaiinsimeiKana.Text = ""
    lblMsg.Caption = ""
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0

    cmdPFK(5).Enabled = True
    cmdExec.Enabled = False
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    '�e�R���g���[������
    txtKaiinsimeiKana.Enabled = True

End Sub
'******************************************************************************
'*    ���s�{�^������
'******************************************************************************
Private Sub subcmdPFK5()
 Dim intNameSpcPst As Integer '�X�y�[�X�ʒu
 Dim intNameLen    As Integer '������
 Dim strSyainName  As String

    cmdPFK(5).SetFocus

    '�����̓`�F�b�N
    If txtKaiinsimeiKana.Text = "" Then
        lblMsg.Caption = "�Ј������i�J�i�j����͂��Ă��������B"
        txtKaiinsimeiKana.BackColor = vbRed
        txtKaiinsimeiKana.Enabled = True
        txtKaiinsimeiKana.SetFocus
        Exit Sub
    Else
        strSyainName = Trim$(txtKaiinsimeiKana)
    End If
    
    If InStr(strSyainName, " ") = 0 Then
        strSyainMyouji = strSyainName
        strSyainNamae = strSyainName
    Else
        intNameSpcPst = InStr(strSyainName, " ")
        intNameLen = Len(strSyainName)
        strSyainMyouji = Mid(strSyainName, 1, intNameSpcPst - 1)
        strSyainNamae = Mid(strSyainName, intNameSpcPst + 1, intNameLen - intNameSpcPst)
    End If
        
    '�ꗗ���\�������܂Ŏ��s����,���񂹂��g�p�s�E�}�E�X�|�C���^�[(�����v)
    cmdPFK(5).Enabled = False
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
    
    '�����񂹌����pSP�ďo
    If fncblnSyainSearch = False Then
        prgBar.Visible = False
        cmdPFK(5).Enabled = True
        Screen.MousePointer = vbNormal
        stbSystem.Panels.Item(1).Text = ""
        cmdExec.Enabled = False
        txtKaiinsimeiKana.SetFocus
        txtKaiinsimeiKana.Enabled = True
        Exit Sub
    End If
    
    prgBar.Visible = False
    cmdPFK(5).Enabled = False
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    cmdExec.Enabled = True
    cmdExec.SetFocus
    txtKaiinsimeiKana.Enabled = False
    
        
End Sub
'******************************************************************************
'*    �G���[���b�Z�[�W�{�b�N�X��\������B
'******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("���񂹓���", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "YYYY/MM/DD HH:MM:SS"), _
              frmQPAV_CEnt082.Name, _
              strErrCode, _
              strErrMsg)

End Sub
'******************************************************************************
'*    �G���[��������
'******************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtKaiinsimeiKana.BackColor = vbWhite
End Sub



Private Sub sprList_DblClick(ByVal Col As Long, ByVal Row As Long)
    Call cmdExec_Click
End Sub

'******************************************************************************
'*    �e�L�X�g�I��
'******************************************************************************
Private Sub txtKaiinsimeiKana_GotFocus()
    Call gsubSelectText(txtKaiinsimeiKana)
End Sub
'******************************************************************************
'*    ���񂹌����pSP
'******************************************************************************
Private Function fncblnSyainSearch() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���

On Error GoTo errfncblnSyainSearch

    fncblnSyainSearch = False

    lngSpCnt = 0

    '�Ј������J�i����
    odbDatabase.Parameters.Add "InStrSyainMyouji", strSyainMyouji, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainMyouji").ServerType = ORATYPE_VARCHAR2
    '�Ј������J�i���O
    odbDatabase.Parameters.Add "InStrSyainName", strSyainNamae, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainName").ServerType = ORATYPE_VARCHAR2
    '�ő�z��i�[����
    odbDatabase.Parameters.Add "InNumMaxRec", cnslngAryCnt, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '�ďo��
    odbDatabase.Parameters.Add "IoNumSpCnt", lngSpCnt, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    '����������
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    'EndFlg
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '�Ј��f�[�^�z��
    odbDatabase.Parameters.AddTable "OtStrDatAryN", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, 200    '100�s�E200��

             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080SyainSearch("
    strSQL = strSQL & " :InStrSyainMyouji"
    strSQL = strSQL & ",:InStrSyainName"
    strSQL = strSQL & ",:InNumMaxRec"
    strSQL = strSQL & ",:IoNumSpCnt"
    strSQL = strSQL & ",:OtNumRecCount"
    strSQL = strSQL & ",:OtNumAryCount"
    strSQL = strSQL & ",:OtStrEndFlg"
    strSQL = strSQL & ",:OtStrDatAryN); END;"

    i = 1               '�ϐ��̃N���A
    lngSprStartCnt = 0
    lngSprEndCnt = 0

    sprList.ReDraw = False
    Do
        '�}�X�^���ꗗ�̎擾
        odbDatabase.DbexecuteSQL (strSQL)

        If i = 1 Then
            '���Y���ް��L���m�F
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                lblMsg.Caption = "�Y������f�[�^��������܂���B"
                txtKaiinsimeiKana.SetFocus
                Call gsubParaRemove(odbDatabase)
                sprList.ReDraw = True
                Exit Function
            End If
            
            glngSPCount = odbDatabase.Parameters("OtNumRecCount")
            prgBar.Visible = False
            prgBar.Max = glngSPCount
            
            '���ꗗ�̍s���ݒ�(���گ��)
            '����������20�����������ꍇ�ͽ��گ�ލs�������������Ɠ����ɂ���
'            If odbDatabase.Parameters("OtNumRecCount") > 20 Then
                sprList.MaxRows = odbDatabase.Parameters("OtNumRecCount")
'            Else
'                '��������20���ȉ��̏ꍇ20���܂Ž��گ�ނ�\������
'                sprList.MaxRows = 20
'            End If
        End If

        '�ꗗ�̃f�[�^���e��ݒ肷��J�n�ʒu
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1

        '�ꗗ�̏I���ʒu
        If glngSPCount - (i - 1) * cnslngAryCnt > odbDatabase.Parameters("OtNumAryCount") Then
'            lngSprEndCnt = lngSprEndCnt + odbDatabase.Parameters("OtNumAryCount")      '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
            lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
        Else
            lngSprEndCnt = glngSPCount
        End If
        
        '�ꗗ�\ ���ڃZ�b�g
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)

        i = i + 1
        
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    sprList.ReDraw = True

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    fncblnSyainSearch = True

    Exit Function

errfncblnSyainSearch:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    �@�\�F�@���񂹌����ɂ���Ď擾�����Ј��f�[�^���X�v���b�h�ɕ\��
'*    �����F�@�ꗗ�̊J�n�ʒu�A�I���ʒu
'******************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String
 Dim StrWk1      As String
 Dim StrWk2      As String

    j = 0
    For i = lngStCnt To lngEdCnt

        strDetail = odbDatabase.Parameters("OtStrDatAryN").Get_Value(j)
        j = j + 1
        
        '�Ј��R�[�h1 & �Ј��R�[�h2
        StrWk1 = gfncstrDlm2(strDetail, 1)
        StrWk1 = Trim$(StrWk1)
        StrWk2 = gfncstrDlm2(strDetail, 2)
        StrWk2 = Trim$(StrWk2)
        sprList.SetText 1, i, Trim(StrWk1 & StrWk2)
                
        '��������
        strWk = gfncstrDlm2(strDetail, 3)
        strWk = Trim$(strWk)
        sprList.SetText 3, i, strWk
        
        '�����X�R�[�h
        strWk = gfncstrDlm2(strDetail, 4)
        strWk = Trim$(strWk)
        sprList.SetText 4, i, strWk
        
        '�����敪
        strWk = gfncstrDlm2(strDetail, 5)
        strWk = Trim$(strWk)
        If strWk = 1 Then
            sprList.SetText 6, i, "��"
        ElseIf strWk = 2 Then
            sprList.SetText 6, i, "��"
        Else
            sprList.SetText 6, i, ""
        End If
        
        '��������R�[�h
        strWk = gfncstrDlm2(strDetail, 6)
        strWk = Trim$(strWk)
        sprList.SetText 7, i, strWk
                
        '�����X����
        strWk = gfncstrDlm2(strDetail, 13)
        strWk = Trim$(strWk)
        sprList.SetText 5, i, strWk
        
        '�������喼��
        strWk = gfncstrDlm2(strDetail, 14)
        strWk = Trim$(strWk)
        sprList.SetText 8, i, strWk
        
        '�����J�i
        strWk = gfncstrDlm2(strDetail, 15)
        strWk = Trim$(strWk)
        sprList.SetText 2, i, strWk
        
        prgBar.Value = i
    Next i
    
    Me.lblMsg.Caption = ""

End Sub
'******************************************************************************
'*    ����{�^������������
'******************************************************************************
Private Sub cmdExec_Click()
 Dim lngSprRow  As Long    '���گ�ޑI���s
 Dim strSyainCd As String  '�Ј��R�[�h
 Dim S          As Variant
 
    '�I������Ă�����گ�ލs���
    lngSprRow = sprList.ActiveRow
    
    '�I�������s���ް��̗L������
    If sprList.GetText(1, lngSprRow, S) = False Then
        Exit Sub
    End If
    
    'Ҳ�̫�тɎЈ����ނ�ݒ�
    strSyainCd = gVarSpdGetText(sprList, 1, lngSprRow)
    
    If Len(strSyainCd) = 7 Then
        frmQPAV_CEnt080.txtSyainCd(0).Text = " "
        frmQPAV_CEnt080.txtSyainCd(1).Text = strSyainCd
    ElseIf Len(strSyainCd) = 8 Then
        frmQPAV_CEnt080.txtSyainCd(0).Text = Mid(strSyainCd, 1, 1)
        frmQPAV_CEnt080.txtSyainCd(1).Text = Mid(strSyainCd, 2, 7)
    Else
        frmQPAV_CEnt080.txtSyainCd(0).Text = ""
        frmQPAV_CEnt080.txtSyainCd(1).Text = ""
    End If
    
    '�����׸ސݒ�
    gblnNayoseFlg = True
    
    '���񂹌�����ʏI��
    Unload Me
    
End Sub
