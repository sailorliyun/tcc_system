VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt410 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "���ϒʒm�����"
   ClientHeight    =   8550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   14355
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   8550
   ScaleWidth      =   14355
   StartUpPosition =   2  '��ʂ̒���
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   30
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      PrintFileLinesPerPage=   60
      WindowShowCloseBtn=   -1  'True
   End
   Begin VB.CommandButton cmdInitDisp 
      Caption         =   "�����\����"
      Height          =   465
      Left            =   690
      TabIndex        =   8
      Top             =   6630
      Width           =   1305
   End
   Begin VB.CommandButton cmdPrint2 
      Caption         =   "�o�͎҈ꗗ"
      Height          =   465
      Left            =   12780
      TabIndex        =   11
      Top             =   6630
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   5145
      Left            =   120
      TabIndex        =   29
      Top             =   1380
      Width           =   14085
      Begin FPSpread.vaSpread spdIchiran 
         Height          =   4740
         Left            =   540
         TabIndex        =   7
         Top             =   240
         Width           =   12945
         _Version        =   196608
         _ExtentX        =   22834
         _ExtentY        =   8361
         _StockProps     =   64
         MaxCols         =   14
         MaxRows         =   20
         OperationMode   =   3
         ScrollBarExtMode=   -1  'True
         SelectBlockOptions=   0
         SpreadDesigner  =   "frmQPAV_CEnt410.frx":0000
         UserResize      =   2
         VisibleCols     =   5
         VisibleRows     =   20
         ScrollBarTrack  =   3
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1245
      Left            =   120
      TabIndex        =   28
      Top             =   60
      Width           =   14085
      Begin VB.TextBox txtSyainCD1 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   1770
         MaxLength       =   1
         TabIndex        =   2
         Text            =   "9"
         Top             =   750
         Width           =   285
      End
      Begin VB.Frame Frame3 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   10140
         TabIndex        =   34
         Top             =   540
         Width           =   3705
         Begin VB.TextBox txtHakkoubiY 
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            IMEMode         =   3  '�̌Œ�
            Left            =   1110
            MaxLength       =   4
            TabIndex        =   4
            Text            =   "9999"
            Top             =   180
            Width           =   645
         End
         Begin VB.TextBox txtHakkoubiM 
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            IMEMode         =   3  '�̌Œ�
            Left            =   2130
            MaxLength       =   2
            TabIndex        =   5
            Text            =   "99"
            Top             =   180
            Width           =   375
         End
         Begin VB.TextBox txtHakkoubiD 
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            IMEMode         =   3  '�̌Œ�
            Left            =   2880
            MaxLength       =   2
            TabIndex        =   6
            Text            =   "99"
            Top             =   180
            Width           =   375
         End
         Begin VB.Label Label4 
            Caption         =   "�N"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1800
            TabIndex        =   38
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label5 
            Caption         =   "��"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   2550
            TabIndex        =   37
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label7 
            Caption         =   "��"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3300
            TabIndex        =   36
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label8 
            Caption         =   "���s��"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   35
            Top             =   240
            Width           =   915
         End
      End
      Begin VB.TextBox txtSyainCD2 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   2130
         MaxLength       =   7
         TabIndex        =   3
         Text            =   "9999999"
         Top             =   750
         Width           =   975
      End
      Begin VB.TextBox txtKansaibiM 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   2820
         MaxLength       =   2
         TabIndex        =   1
         Text            =   "99"
         Top             =   270
         Width           =   375
      End
      Begin VB.TextBox txtKansaibiY 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   1770
         MaxLength       =   4
         TabIndex        =   0
         Text            =   "9999"
         Top             =   270
         Width           =   645
      End
      Begin VB.Label Label6 
         Caption         =   "�Ј��R�[�h"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   570
         TabIndex        =   33
         Top             =   780
         Width           =   1155
      End
      Begin VB.Label Label3 
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3300
         TabIndex        =   32
         Top             =   330
         Width           =   405
      End
      Begin VB.Label Label2 
         Caption         =   "�N"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2490
         TabIndex        =   31
         Top             =   330
         Width           =   315
      End
      Begin VB.Label Label1 
         Caption         =   "���ϓ�"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   570
         TabIndex        =   30
         Top             =   330
         Width           =   1155
      End
   End
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   8.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   7170
      Width           =   14280
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
         Left            =   60
         TabIndex        =   26
         Top             =   60
         Width           =   12405
      End
   End
   Begin VB.PictureBox picPfMenu 
      Align           =   2  '������
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   8.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   0
      ScaleHeight     =   525
      ScaleWidth      =   14295
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   7590
      Width           =   14355
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:���"
         Height          =   375
         Index           =   12
         Left            =   13140
         TabIndex        =   24
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   11955
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:�O���"
         Height          =   375
         Index           =   10
         Left            =   10725
         TabIndex        =   22
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   9540
         TabIndex        =   21
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   8355
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   7170
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   5985
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:���s"
         Height          =   375
         Index           =   5
         Left            =   4770
         TabIndex        =   17
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   3585
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   2400
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ʰ�޺�߰"
         Height          =   375
         Index           =   2
         Left            =   1215
         TabIndex        =   14
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F1:�ƭ-"
         Height          =   375
         Index           =   1
         Left            =   30
         TabIndex        =   13
         Top             =   90
         Width           =   1155
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "�v���r���["
      Height          =   465
      Index           =   0
      Left            =   9780
      TabIndex        =   9
      Top             =   6630
      Width           =   1185
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "���"
      Height          =   465
      Index           =   1
      Left            =   11070
      TabIndex        =   10
      Top             =   6630
      Width           =   1185
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   27
      Top             =   8175
      Width           =   14355
      _ExtentX        =   25321
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   12841
            MinWidth        =   3528
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3351
            MinWidth        =   3351
            Text            =   "�x�m�ʁ@���Y"
            TextSave        =   "�x�m�ʁ@���Y"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3881
            MinWidth        =   3881
            Text            =   "9999999999999999"
            TextSave        =   "9999999999999999"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "2006/04/06"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "12:36"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmQPAV_CEnt410"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'************************************************************************************
'  �������N���W�b�g �x���V�X�e��
'    �T�u�V�X�e�����F �Ј��ݕt�V�X�e���i�o�`�j
'---------------------------------------
'    �@�\���@�@�@�@�F QPAV_CEnt410     ���ϒʒm�����
'    �@�\���e�@�@�@�F ���ς����Ј��Ɋ��ϒʒm�����������
'    �t�H�[���@�@�@�F frmQPAV_CEnt410  �F ���ϒʒm������w�����
'---------------------------------------
'   �쐬���@ �F 2005/01/20
'   �S���ҁ@ �F FIP SEKINE
'---------------------------------------
'   �C�����@ �F 9999/99/99
'   �C�����e �F �m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m
'************************************************************************************





'�t���O
Private blnNoChangeEvFlg       As Boolean    '�C�x���g�����t���O
Private blnDbFlg               As Boolean    'DB�ڑ�
Private bolwkTblEdit           As Boolean    '����pWK�e�[�u���쐬


'����KEY
Private mstrKeyKansaibiFr      As String     '���ϓ�From   ���P���w��̈� From�� 1��
Private mstrKeyKansaibiTo      As String     '���ϓ�To                     To�� ����
Private mstrKeySyaincd1        As String     '�Ј��R�[�h1
Private mstrKeySyaincd2        As String     '�Ј��R�[�h2

'���[ �����p
Private mstrKeyYushibi         As String     '�Z����  ���Ј��w�莞�ɗZ�����������ɂ���

'Work
Private mstrHakkoubi           As String     '���s��
Private mlngSvCol              As Long       'SORT KEY �Z�[�u�l
Private mintSort               As Integer    'SORT���i0=�����A1=�����A2=�~���j



'CONST
Const cnsTitle                 As String = "���ϒʒm�����"






'***********************************************************************************
'    FORM LOAD
'***********************************************************************************
Private Sub Form_Load()

    '�t���O������
    blnNoChangeEvFlg = False
    blnDbFlg = False

    '�X�e�[�^�X�o�[�ݒ�
    Call gsubInitStatusBar(stbSystem)
    
    '�t�H�[�����ݒ�
    Me.Caption = cnsTitle & " (" & gstrCommandLine(8) & ")"
    
    '��ʏ�����
    Call subInitScreen

End Sub

'***********************************************************************************
'    FORM Activate
'***********************************************************************************
Private Sub Form_Activate()

'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If gblnInitFlg = True Then      '�����t���O = �I���̏ꍇ
        
        '�X�e�[�^�X�o�[���b�Z�[�W
        stbSystem.Panels.Item(1).Text = "�������D�D�D"
        
        '��ʐ���
        Screen.MousePointer = vbHourglass
        Me.Enabled = False
        
        DoEvents
        
        '�Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , cnsTitle & "(" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
            Exit Sub
        End If
        
        '�f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , cnsTitle & "(" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
            Exit Sub
        End If
        
        'DB�ڑ�OK
        blnDbFlg = True
        
        'SP��������  �R�[�h�e�[�u�������Ǎ���
        Call gsubSPInit
        
        '�N�������Ɉ���pWK�e�[�u���N���A�i���[�����I�y���[�^�j
        Call fncblnPrintDataDel
        
        '�X�e�[�^�X�o�[���b�Z�[�W����
        Me.Enabled = True
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""
        
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
        
        gblnInitFlg = False            '�����t���O = �I�t
    End If

End Sub

'***********************************************************************************
'    FORM QueryUnload
'***********************************************************************************
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

     '�c�a�ڑ��n�j
    If blnDbFlg = True Then
    
        'WK�e�[�u���폜
        Call fncblnPrintDataDel
        
        '�׸پ���݂̐ؒf
        Call gsubTermOracleDB
    
    End If

End Sub


'***********************************************************************************
'    FORM KEY PRESS �C�x���g
'***********************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    '�G���[�N���A
    Call subErrCrear

    
    'ENTER Beep������
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

'***********************************************************************************
'    FORM KEY DOWN �C�x���g
'***********************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    '�t�@���N�V�����L�[�ݒ�
    Select Case KeyCode
         Case vbKeyReturn   'Enter
            '�G���[�N���A
            Call subErrCrear
            'TAB
            SendKeys "{TAB}"
         Case vbKeyF1   'F1
            Call cmdPFK_Click(1)
         Case vbKeyF2   'F2
            Call cmdPFK_Click(2)
         Case vbKeyF5   'F5
            If cmdPFK(5).Enabled = True Then
                '�G���[�N���A
                Call subErrCrear
                'F5
                Call cmdPFK_Click(5)
            End If
'         Case vbKeyF7   'F7
'            Call cmdPFK_Click(7)
'         Case vbKeyF8   'F8
'            Call cmdPFK_Click(8)
         Case vbKeyF10  'F10
            Call cmdPFK_Click(10)
         Case vbKeyF12   'F12
            Call cmdPFK_Click(12)
    End Select


End Sub






'***********************************************************************************
'    �t�@���N�V�����L�[�N���b�N����
'***********************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
        
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        '***** ���j���[ *****
        Case 1
            Unload Me
            Exit Sub
        
        '***** �n�[�h�R�s�[ *****
        Case 2
'DEL 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
'           Call gsubQSAV_ActX1001
'--Start Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
            '�n�[�h�R�s�[�pDLL�ďo�����ɉ�ʃL���v�V�������p�����[�^�Ƃ��Ēǉ�
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            
            Set clsActX1001 = Nothing
'--Finish Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
            
            picMsg.Refresh
        
        '***** ���s *****
        Case 5
            '�G���[�N���A
            Call subErrCrear
            '���s
            Call subExecute
            
        '***** �O�� *****
        Case 7
'            If spdIchiran.DataRowCnt = 0 Or spdIchiran.ActiveRow = 1 Then
'                lblMsg.Caption = "WHOE09 " & gstrGetCodeMeisyo(odbDatabase, "E09", "WHO")   'Msg = �O�y�[�W�͂���܂���
'                Exit Sub
'            End If
'            spdIchiran.SetFocus
'            SendKeys "{PGUP}"
        
        '***** ���� *****
        Case 8
'            If spdIchiran.DataRowCnt = 0 Or spdIchiran.DataRowCnt <= spdIchiran.ActiveRow Then
'                lblMsg.Caption = "WHOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WHO")   'Msg = ���y�[�W�͂���܂���
'                Exit Sub
'            End If
'            spdIchiran.SetFocus
'            SendKeys "{PGDN}"
        
        Case 10 '�O���
            Unload Me
            Exit Sub
        
        '***** ��� *****
        Case 12
            Call subCancel
    
    End Select
    
End Sub


'***********************************************************************************
'    ���s
'***********************************************************************************
Private Sub subExecute()
    
    '��ʐ���
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '�����������̓`�F�b�N
    If fncbolInputChk = False Then
        '���̓G���[
        Exit Sub
    End If
    
    '�ꗗ���� �\��
    If fncblnListSel = False Then
        'ERR OR �Y���f�[�^�Ȃ�
        GoTo subExecute_EXIT
    End If
    
    '���s���ҏW
    Call subHakkoubiEdit
    
    '�{�^������ �� �����������͕s��
    If spdIchiran.MaxRows > 0 Then
        '���ϒʒm
        cmdPrint(0).Enabled = True
        cmdPrint(1).Enabled = True
        
        '�o�͎҈ꗗ
'''        '�Ј��R�[�h�w�肩�H  ���Ј��R�[�h�w��ł����ϓ����w��͑ΏۊO
'''        If Trim$(mstrKeySyaincd2) <> "" And _
'''            Trim$(mstrKeyKansaibiFr) = "" Then
        '�Ј��R�[�h�w�肩�H  ���Ј��R�[�h�w��͑ΏۊO
        If Trim$(mstrKeySyaincd2) <> "" Then
            '�Ј��R�[�h�w��  �����ΏۊO
            cmdPrint2.Enabled = False
        Else
            '���w�� �����Ώ�
            cmdPrint2.Enabled = True
        End If
    
        '�����\����
        cmdInitDisp.Enabled = True
        
        '�������� ���͕s��
        txtKansaibiY.Enabled = False
        txtKansaibiM.Enabled = False
        txtSyainCD1.Enabled = False
        txtSyainCD2.Enabled = False
        
        '���s�{�^�� �����s��
        cmdPFK(5).Enabled = False
        
    End If
    
subExecute_EXIT:
    
    '��ʐ���
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    '�ꗗ�\���������O���ł��A���͏��������͉\��Ԃ̏ꍇ��
    If spdIchiran.MaxRows = 0 And txtKansaibiY.Enabled = True Then
        txtKansaibiY.SetFocus    '�N�Ƀt�H�[�J�X
    Else
        '�ꗗ�\���������P���ȏ�ł��A�Ј��R�[�h�w���
        If spdIchiran.MaxRows > 0 And txtHakkoubiY.Enabled = True Then
            '���s���Ƀt�H�[�J�X
            txtHakkoubiY.SetFocus
        Else
            '�ꗗ�փt�H�[�J�X
            spdIchiran.SetFocus
        End If
    End If
    
End Sub


'***********************************************************************************
'    ���ϒʒm��  ����E�v���r���[ �{�^���N���b�N
'***********************************************************************************
Private Sub cmdPrint_Click(Index As Integer)
    
    '���s���`�F�b�N
    If fncbolHakkoubiChk = False Then
        '���̓G���[
        Exit Sub
    End If
    
    '����E�v���r���[
    If Index = 0 Then
        If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "���ϒʒm��") = vbCancel Then
            Exit Sub
        End If
    Else
        If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "���ϒʒm��") = vbCancel Then
            Exit Sub
        End If
    End If
    
    '��ʐ���
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '����pWK�e�[�u���쐬�ς݂�
    If bolwkTblEdit = False Then
        '����f�[�^�쐬
        If fncblnPrintDataEdit = False Then
            '��ʐ���
            Me.Enabled = True
            Screen.MousePointer = vbDefault
            '�f�[�^�쐬�G���[
            Exit Sub
        End If
    End If
    
    '�Ј��R�[�h�w�莞�A�Z������KEY�Ƃ���
    If Trim$(mstrKeySyaincd2) <> "" Then
        mstrKeyYushibi = gVarSpdGetText(spdIchiran, 6, spdIchiran.ActiveRow)
    End If
    
    '��ʐ���
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    '����E�v���r���[
    If Index = 0 Then
        '�v���r���[
        Call sub410PrintRep(crptToWindow)
    Else
        '������s
        Call sub410PrintRep(crptToPrinter)
    End If
    
    '����pWK�e�[�u���쐬�ς�
    bolwkTblEdit = True
    
End Sub
'***********************************************************************************
'    �o�͎҈ꗗ  �{�^���N���b�N
'***********************************************************************************
Private Sub cmdPrint2_Click()
    Dim datTmp         As Date
    
    Dim strTmpY        As String
    Dim strTmpM        As String
    '---------------------------------
    
    '����E�v���r���[
    If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "���ϒʒm��") = vbCancel Then
        Exit Sub
    End If
    
    '��ʐ���
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '����pWK�e�[�u���쐬�ς݂�
    If bolwkTblEdit = False Then
        '����f�[�^�쐬
        If fncblnPrintDataEdit = False Then
            '�f�[�^�쐬�G���[
            
            '��ʐ���
            Me.Enabled = True
            Screen.MousePointer = vbDefault
            
            Exit Sub
        End If
    End If
    
    '��ʐ���
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    '�v���r���[
    Call sub411PrintRep(crptToWindow)
    
    '����pWK�e�[�u���쐬�ς�
    bolwkTblEdit = True
    
End Sub

'***********************************************************************************
'    �����\������ �{�^���N���b�N
'***********************************************************************************
Private Sub cmdInitDisp_Click()
    
    '�ꗗ�̕\�����������\�����ɂ���
    With spdIchiran
    
        If spdIchiran.MaxRows > 0 Then
        
            '�����\������SORT   �����X�R�[�h�A�Ј��R�[�h
            .Row = 1     '�Z���u���b�N��ݒ�
            .Col = 1
            .Row2 = .MaxRows
            .Col2 = .MaxCols
            
            'SORT�p�^�[��
            .SortBy = SS_SORT_BY_ROW
            .SortKey(1) = 4     '��P�\�[�g�L�[�i�����X�R�[�h�j��ݒ�
            .SortKey(2) = 2     '��Q�\�[�g�L�[�i�Ј��R�[�h�j��ݒ�
            .SortKey(3) = 6     '��R�\�[�g�L�[�i�Z�����j��ݒ�
            
            '�����ɕ��בւ�
            .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
            .SortKeyOrder(2) = SS_SORT_ORDER_ASCENDING
            .SortKeyOrder(3) = SS_SORT_ORDER_ASCENDING
                
            '���s
            .Action = SS_ACTION_SORT
                
            'SAVE�l��������
            mintSort = 0       '�O��\�[�g���i0=���� 1=���� 2=�~���j
            mlngSvCol = 0      '�O��\�[�gCOL(0=���� �ȊO=COL)
        
        End If
    End With
    
End Sub





'***********************************************************************************
'    ��ʏ�����
'***********************************************************************************
Private Sub subInitScreen()

    '�G���[�N���A
    Call subErrCrear
    
    '���b�Z�[�W�N���A
    lblMsg.Caption = ""

    '��ʍ��ڏ�����
    blnNoChangeEvFlg = True
    txtKansaibiY.Text = ""
    txtKansaibiM.Text = ""
    txtSyainCD1.Text = ""
    txtSyainCD2.Text = ""
    txtHakkoubiY.Text = ""
    txtHakkoubiM.Text = ""
    txtHakkoubiD.Text = ""
    blnNoChangeEvFlg = False
    
    '�������� ���͉�
    txtKansaibiY.Enabled = True
    txtKansaibiM.Enabled = True
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True
    
    '�ꗗ�\ �N���A
    spdIchiran.MaxRows = 0
    
    '�����\����
    cmdInitDisp.Enabled = False

    '����E�v���r���[
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    '�o�͎҈ꗗ
    cmdPrint2.Enabled = False

    '���s��
    txtHakkoubiY.Enabled = False
    txtHakkoubiM.Enabled = False
    txtHakkoubiD.Enabled = False
    
    '���WK�e�[�u��
    bolwkTblEdit = False  '���쐬
    
End Sub


'***********************************************************************************
'    ���
'***********************************************************************************
Private Sub subCancel()

    '��ʏ�����
    Call subInitScreen
    
    '���s�{�^�� ������
    cmdPFK(5).Enabled = True
    
    '���͏��� ���ϓ� �N �Ƀt�H�[�J�X
    txtKansaibiY.SetFocus
    
End Sub







'***********************************************************************************
'    ���s�� �ҏW
'***********************************************************************************
Private Sub subHakkoubiEdit()
    Dim datTmp         As Date
    '---------------------------------
    
    '�Ј��R�[�h�w���H
    If Trim$(mstrKeySyaincd2) <> "" Then
        '�Ј��R�[�h���w�肵���ꍇ
        '�����l�̓V�X�e�����t��ݒ�
        txtHakkoubiY.Text = Mid$(gstrSysDate, 1, 4)
        txtHakkoubiM.Text = Mid$(gstrSysDate, 5, 2)
        txtHakkoubiD.Text = Mid$(gstrSysDate, 7, 2)
        '�ύX ��
        txtHakkoubiY.Enabled = True
        txtHakkoubiM.Enabled = True
        txtHakkoubiD.Enabled = True
    Else
        '�Ј��R�[�h���w�肵�Ă��Ȃ��ꍇ
        '��l��ݒ�i���ϓ��̎��� + �R�[�h�e�[�u���̔��s��
        If IsDate(mstrKeyKansaibiFr) = True Then
            datTmp = DateAdd("m", 1, CDate(mstrKeyKansaibiFr))
            txtHakkoubiY.Text = Format(datTmp, "YYYY")
            txtHakkoubiM.Text = Format(datTmp, "MM")
            txtHakkoubiD.Text = gstrCdT_Hakkoubi
        End If
        '�ύX �s��  ���Ј��R�[�h�̓��͂����ꂽ�ꍇ�̌����́A���s����ύX�ł���
        txtHakkoubiY.Enabled = False
        txtHakkoubiM.Enabled = False
        txtHakkoubiD.Enabled = False
    End If
    
End Sub

'***********************************************************************************
'    ���̓`�F�b�N
'      ���@���F �Ȃ�
'      �ԋp�l�F Boolean  �F True=OK  False=NG
'***********************************************************************************
Private Function fncbolInputChk() As Boolean
    Dim intErrNo             As Integer
    
    Dim strTmp               As String
    Dim datTmp               As Date
    '-------------------------------------
    
    
    '������
    fncbolInputChk = False
    
    intErrNo = 0
    
    mstrKeyKansaibiFr = ""
    mstrKeyKansaibiTo = ""
    mstrKeySyaincd1 = ""
    mstrKeySyaincd2 = ""
    
    '���������\���ҏW
    If Len(Trim$(txtKansaibiM.Text)) = 1 Then
        blnNoChangeEvFlg = True
        txtKansaibiM.Text = "0" & Trim$(txtKansaibiM.Text)
        blnNoChangeEvFlg = False
    End If
    
    '������ ���ϓ� ������
    strTmp = txtKansaibiY.Text & "/" & txtKansaibiM.Text & "/01"
    If IsDate(strTmp) = True Then
        'FROM
        mstrKeyKansaibiFr = Format(strTmp, "YYYY/MM/DD")
        'TO
        datTmp = CDate(mstrKeyKansaibiFr)
        datTmp = DateAdd("m", 1, datTmp)        '����1���̎擾
        datTmp = DateAdd("d", -1, datTmp)       '����1�����O���̎擾
        mstrKeyKansaibiTo = Format(datTmp, "YYYY/MM/DD")
    Else
        If Trim$(txtKansaibiY.Text) = "" And _
           Trim$(txtKansaibiM.Text) = "" Then
            '������
        Else
            'ERR
            intErrNo = 1
            GoTo fncbolInputChk_ERR
        End If
    End If
    
    '������ �Ј��R�[�h ������
    If Trim$(txtSyainCD1.Text) = "" And Trim$(txtSyainCD2.Text) = "" Then
        '������
    Else
        '�Ј��R�[�h�P�݂̂̓G���[ ���Ј��R�[�h�Q�݂̂͗L�肦��
        If Trim$(txtSyainCD2.Text) = "" Then
            'ERR
            intErrNo = 2
            GoTo fncbolInputChk_ERR
        Else
            mstrKeySyaincd1 = IIf(txtSyainCD1.Text = "", " ", txtSyainCD1.Text)
            mstrKeySyaincd2 = Trim$(txtSyainCD2.Text)
        End If
    End If
    
    '������ �֘A�`�F�b�N ������
    If mstrKeyKansaibiFr = "" And mstrKeySyaincd2 = "" Then
        '���ϓ����Ј��R�[�h ���w��
        intErrNo = 3
        GoTo fncbolInputChk_ERR
    End If
    
    'OK
    fncbolInputChk = True
    
    Exit Function

fncbolInputChk_ERR:

    '��ʐ��� ����
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    

    Select Case intErrNo
        Case 1
            '���ϓ� �N���G���[
            txtKansaibiY.BackColor = vbRed
            txtKansaibiM.BackColor = vbRed
            lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = ���͍��ڂɌ�肪����܂�
            txtKansaibiY.SetFocus
        Case 2
            '�Ј��R�[�h�P�̂݃G���[
            txtSyainCD1.BackColor = vbRed
            txtSyainCD2.BackColor = vbRed
            lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = ���͍��ڂɌ�肪����܂�
            txtSyainCD2.SetFocus
        Case 3
            '���ϓ����Ј��R�[�h ���w��
            txtKansaibiY.BackColor = vbRed
            txtKansaibiM.BackColor = vbRed
            txtSyainCD1.BackColor = vbRed
            txtSyainCD2.BackColor = vbRed
            lblMsg.Caption = "WHOE07 " & gstrGetCodeMeisyo(odbDatabase, "E07", "WHO")  'Msg = ������������͂��Ă�������
            txtKansaibiY.SetFocus
    End Select
    
    
End Function

'***********************************************************************************
'    ���s���`�F�b�N
'      ���@���F �Ȃ�
'      �ԋp�l�F Boolean  �F True=OK  False=NG
'***********************************************************************************
Private Function fncbolHakkoubiChk() As Boolean
    Dim strTmp               As String
    '-------------------------------------
    
    '������
    fncbolHakkoubiChk = False
    
    '���s��
    strTmp = txtHakkoubiY.Text & "/" & txtHakkoubiM.Text & "/" & txtHakkoubiD.Text
    If IsDate(strTmp) = True Then
        mstrHakkoubi = Format(strTmp, "ggg e�Nm��d�����s")
    Else
        'ERR
        GoTo fncbolHakkoubiChk_ERR
    End If
    
    'OK
    fncbolHakkoubiChk = True
    
    Exit Function
    
fncbolHakkoubiChk_ERR:
    'ERR

    txtHakkoubiY.BackColor = vbRed
    txtHakkoubiM.BackColor = vbRed
    txtHakkoubiD.BackColor = vbRed
    lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = ���͍��ڂɌ�肪����܂�
    txtHakkoubiY.SetFocus
    
End Function


'***********************************************************************************
'    �G���[����
'***********************************************************************************
Private Sub subErrCrear()

    '�װү���޸ر
    lblMsg.Caption = ""
    
    '�װ����Backcolor��߂�
    txtKansaibiY.BackColor = vbWhite
    txtKansaibiM.BackColor = vbWhite
    txtSyainCD1.BackColor = vbWhite
    txtSyainCD2.BackColor = vbWhite
    
    txtHakkoubiY.BackColor = vbWhite
    txtHakkoubiM.BackColor = vbWhite
    txtHakkoubiD.BackColor = vbWhite
    
End Sub


'***********************************************************************************
'    �ꗗ�p�f�[�^�擾 SP ���s
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnListSel() As Boolean
    Dim strSQL               As String
    Dim lngSprStartCnt       As Long
    Dim lngSprEndCnt         As Long
    Dim i                    As Long
    Dim lngSpCnt             As Long
    
    Const cnslngAryLen       As Long = 150   '�z��̍ő包��
    Const cnslngAryCnt       As Long = 35    '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���
    '----------------------------------------------

On Error GoTo fncblnListSel_ERR
    
    '������
    fncblnListSel = False

    lngSpCnt = 0

    '�ꗗ�擾 �r�o
    '��01�� �������� ���ϓ�FROM
    odbDatabase.Parameters.Add "InStrKansaibiFr", mstrKeyKansaibiFr, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiFr").ServerType = ORATYPE_VARCHAR2
    '��02���@ �@�@�@ ���ϓ�To
    odbDatabase.Parameters.Add "InStrKansaibiTo", mstrKeyKansaibiTo, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiTo").ServerType = ORATYPE_VARCHAR2
    '��03�� �@�@�@�@ �Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCd1", mstrKeySyaincd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_VARCHAR2
    '��04�� �@�@�@�@ �Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSyainCd2", mstrKeySyaincd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_VARCHAR2
    
    '��05�� �ő�z��i�[����
    odbDatabase.Parameters.Add "InNumMaxRec", cnslngAryCnt, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '��06�� ��������
    odbDatabase.Parameters.Add "IoNumFetchCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumFetchCount").ServerType = ORATYPE_NUMBER
    '��07�� �J�[�\���h�c
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
    '��08�� ����������
    odbDatabase.Parameters.Add "IoNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumRecCount").ServerType = ORATYPE_NUMBER
    '��09�� ں��޶���
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '��10�� EndFlg
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '��11�� �f�[�^�z��
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngAryLen    '200�s�E150��
    
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410ListSel("
    strSQL = strSQL & ":InStrKansaibiFr,"               '01 ���ϓ�From
    strSQL = strSQL & ":InStrKansaibiTo,"               '02 ���ϓ�To
    strSQL = strSQL & ":InStrSyainCd1,"                 '03 �Ј��R�[�h�P
    strSQL = strSQL & ":InStrSyainCd2,"                 '04 �Ј��R�[�h�Q
    strSQL = strSQL & ":InNumMaxRec,"                   '05 �ő�z��i�[����
    strSQL = strSQL & ":IoNumFetchCount,"               '06 ��������
    strSQL = strSQL & ":IoNumCursor,"                   '07 �J�[�\���h�c
    strSQL = strSQL & ":IoNumRecCount,"                 '08 ����������
    strSQL = strSQL & ":OtNumAryCount,"                 '09 ں��޶���
    strSQL = strSQL & ":OtStrEndFlg,"                   '10 EndFlg
    strSQL = strSQL & ":OtStrDataAry"                   '11 �f�[�^�z��
    strSQL = strSQL & "); END;"
    
    i = 1               '�ϐ��̃N���A
    lngSprStartCnt = 0
    lngSprEndCnt = 0
  
    spdIchiran.ReDraw = False
    Do
        '�ꗗ�̎擾
        odbDatabase.DbexecuteSQL (strSQL)

        If i = 1 Then
            If odbDatabase.Parameters("IoNumRecCount").Value = 0 Then     '�Y���f�[�^�Ȃ�
                '�I�u�W�F�N�g�̊J��
                Call gsubParaRemove(odbDatabase)
                '�G���[���b�Z�[�W�\��*****Msg=�Y������f�[�^������܂���
                lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")
                spdIchiran.ReDraw = True
                Exit Function
            End If
            spdIchiran.MaxRows = odbDatabase.Parameters("IoNumRecCount").Value   '�ꗗ�̍s���ݒ�
        End If
        
        '�ꗗ�̃f�[�^���e��ݒ肷��J�n�ʒu
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1
        
        '�ꗗ�̏I���ʒu
        lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount").Value)
        
        '�ꗗ�\ ���ڃZ�b�g
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)
        
        i = i + 1
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg").Value = "1"

    '�ĕ`��
    spdIchiran.ReDraw = True

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    '�����\�� OK
    fncblnListSel = True
    
    Exit Function

fncblnListSel_ERR:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    �ꗗ��\��
'        �����F lngStCnt  �F Long    �F �ꗗ�̊J�n�ʒu
'        �@�@�@ lngEdCnt  �F Long    �F �ꗗ�̏I���ʒu
'***********************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
    Dim i                  As Long
    Dim j                  As Long
    Dim k                  As Long
    Dim strDetail          As String
    Dim strValue           As String
    Dim strTmp             As String
    Dim strTmp1            As String
    Dim strTmp2            As String
    '----------------------------------------------
    
    With spdIchiran
        
        j = 0
        For i = lngStCnt To lngEdCnt
        
            '����
            strDetail = odbDatabase.Parameters("OtStrDataAry").Get_Value(j)
            j = j + 1
            
            '�y01�z �����敪
            strValue = Trim$(gfncstrDlm2(strDetail, 9))
            Select Case strValue
                Case "1": strTmp = "��"
                Case "2": strTmp = "��"
            End Select
            .SetText 1, i, strTmp
            
            '�y02�z �Ј��R�[�h  ���Ј��R�[�h�P�{�Ј��R�[�h�Q
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 1))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 2))
            strTmp = IIf(strTmp1 = "", " ", strTmp1) & strTmp2
            .SetText 2, i, strTmp
            .SetText 9, i, IIf(strTmp1 = "", " ", strTmp1)    '�B�� �Ј��R�[�h�P
            .SetText 10, i, strTmp2                           '�B�� �Ј��R�[�h�Q
            
            '�y03�z ����
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 6))    '�J�i����
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 7))    '��������
            If Trim$(strTmp2) = "" Then
                strTmp = Trim$(strTmp1)
            Else
                strTmp = Trim$(strTmp2)
            End If
            .SetText 3, i, strTmp
            
            '�y04�z �����X  �������X�R�[�h & �����X��
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 8))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 11))
            strTmp = strTmp1 & " " & strTmp2
            .SetText 4, i, strTmp
            .SetText 11, i, strTmp1                           '�B�� �����X�R�[�h
            .SetText 12, i, strTmp2                           '�B�� �����X��
            
            '�y05�z ��������  ����������R�[�h & �������喼
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 10))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 12))
            strTmp = strTmp1 & " " & strTmp2
            .SetText 5, i, strTmp
            .SetText 13, i, strTmp1                           '�B�� ��������R�[�h
            .SetText 14, i, strTmp2                           '�B�� �������喼
            
            '�y06�z �Z����
            strValue = Trim$(gfncstrDlm2(strDetail, 3))
            .SetText 6, i, strValue
            
            '�y07�z �Z�����z
            strValue = Trim$(gfncstrDlm2(strDetail, 5))
            strTmp = ""
            If IsNumeric(strValue) = True Then
                strTmp = Format(strValue, "#,###,##0")
            End If
            .SetText 7, i, strTmp
            
            '�y08�z ���ϓ�
            strValue = Trim$(gfncstrDlm2(strDetail, 4))
            .SetText 8, i, strValue
            
        Next i
    End With

End Sub


'***********************************************************************************
'    ����f�[�^�쐬 SP ���s
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataEdit() As Boolean
    Dim strSQL               As String
    Dim i                    As Long
    Dim strTmpY              As String
    Dim strTmpM              As String
    Dim strTmpD              As String
    Dim datTmp               As Date
    Dim strTmp               As String
    
    Dim lngArySetCnt         As Long        '�z��i�[�����J�E���^�[
    
    Dim str411Title          As String      '���ϒʒm�o�͎҈ꗗ �^�C�g��
    
    Dim OraPArray1           As Object      '01 �Ј��R�[�h�P
    Dim OraPArray2           As Object      '02 �Ј��R�[�h�Q
    Dim OraPArray3           As Object      '03 �Z����
    Dim OraPArray4           As Object      '04 �Z�����i�a��j
    Dim OraPArray5           As Object      '05 �\���p�Ј�����
    Dim OraPArray6           As Object      '06 �����X�R�[�h
    Dim OraPArray7           As Object      '07 �����X����
    Dim OraPArray8           As Object      '08 �����敪
    Dim OraPArray9           As Object      '09 ��������R�[�h
    Dim OraPArray10          As Object      '10 �������喼��
    Dim OraPArray11          As Object      '11 �Z�����z
    Dim OraPArray12          As Object      '12 ���ϓ�
    Dim OraPArray13          As Object      '13 ���ϓ��i�a��j
    
    Const cnslngKeta1        As Long = 1    '01 �Ј��R�[�h�P
    Const cnslngKeta2        As Long = 7    '02 �Ј��R�[�h�Q
    Const cnslngKeta3        As Long = 10   '03 �Z����
    Const cnslngKeta4        As Long = 20   '04 �Z�����i�a��j
    Const cnslngKeta5        As Long = 30   '05 �\���p�Ј�����
    Const cnslngKeta6        As Long = 3    '06 �����X�R�[�h
    Const cnslngKeta7        As Long = 24   '07 �����X����
    Const cnslngKeta8        As Long = 2    '08 �����敪
    Const cnslngKeta9        As Long = 6    '09 ��������R�[�h
    Const cnslngKeta10       As Long = 24   '10 �������喼��
    Const cnslngKeta11       As Long = 13   '11 �Z�����z
    Const cnslngKeta12       As Long = 10   '12 ���ϓ�
    Const cnslngKeta13       As Long = 20   '13 ���ϓ��i�a��j
    
    Const cnslngAryCnt       As Long = 2
    '----------------------------------------------

On Error GoTo fncblnPrintDataEdit_ERR
    
    '������
    fncblnPrintDataEdit = False
    
    '�Ώێ҈ꗗ(411)�p�^�C�g�� �ҏW  �����������̊��ϓ��̎���
    strTmpY = "�@�@�@�@"
    strTmpM = "�@�@"
    If IsDate(mstrKeyKansaibiFr) = True Then
        datTmp = DateAdd("m", 1, CDate(mstrKeyKansaibiFr))
        strTmpY = StrConv(Format(datTmp, "YYYY"), vbWide)
        strTmpM = StrConv(Format(datTmp, "M"), vbWide)
        str411Title = strTmpY & "�N" & _
                      IIf(Len(strTmpM) = 1, "�@" & strTmpM, strTmpM) & "���x ���ϒʒm�o�͎҈ꗗ"
    Else
        str411Title = ""
    End If

    '����f�[�^�쐬 �r�o
    '��01�� �I�y���[�^ID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '��02�� �[��ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    '��03�� �z��i�[����
    '�z�񌏐�
    odbDatabase.Parameters.Add "InNumAryCount", 0, ORAPARM_INPUT    '�ŏ��͂O��ݒ� CALL�O�Ɍ�����ݒ�
    odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�ϓ�����  ���z��n��
    '��04�� �z��01 �Ј��R�[�h�P
    odbDatabase.Parameters.AddTable "InStrSyainCd1Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta1
    Set OraPArray1 = odbDatabase.Parameters("InStrSyainCd1Ary")
    '��05�� �z��02 �Ј��R�[�h�Q
    odbDatabase.Parameters.AddTable "InStrSyainCd2Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta2
    Set OraPArray2 = odbDatabase.Parameters("InStrSyainCd2Ary")
    '��06�� �z��03 �Z����
    odbDatabase.Parameters.AddTable "InStrYushibiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta3
    Set OraPArray3 = odbDatabase.Parameters("InStrYushibiAry")
    '��07�� �z��04 �Z�����i�a��j
    odbDatabase.Parameters.AddTable "InStrYushibiWaAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta4
    Set OraPArray4 = odbDatabase.Parameters("InStrYushibiWaAry")
    '��08�� �z��05 �\���p�Ј�����
    odbDatabase.Parameters.AddTable "InStrDispNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta5
    Set OraPArray5 = odbDatabase.Parameters("InStrDispNmAry")
    '��09�� �z��06 �����X�R�[�h
    odbDatabase.Parameters.AddTable "InStrTenCdAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta6
    Set OraPArray6 = odbDatabase.Parameters("InStrTenCdAry")
    '��10�� �z��07 �����X����
    odbDatabase.Parameters.AddTable "InStrTenNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta7
    Set OraPArray7 = odbDatabase.Parameters("InStrTenNmAry")
    '��11�� �z��08 �����敪
    odbDatabase.Parameters.AddTable "InStrTozaiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta8
    Set OraPArray8 = odbDatabase.Parameters("InStrTozaiAry")
    '��12�� �z��09 ��������R�[�h
    odbDatabase.Parameters.AddTable "InStrBumonCdAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta9
    Set OraPArray9 = odbDatabase.Parameters("InStrBumonCdAry")
    '��13�� �z��10 �������喼��
    odbDatabase.Parameters.AddTable "InStrBumonNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta10
    Set OraPArray10 = odbDatabase.Parameters("InStrBumonNmAry")
    '��14�� �z��11 �Z�����z
    odbDatabase.Parameters.AddTable "InStrYushiKngAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta11
    Set OraPArray11 = odbDatabase.Parameters("InStrYushiKngAry")
    '��15�� �z��12 ���ϓ�
    odbDatabase.Parameters.AddTable "InStrKansaibiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta12
    Set OraPArray12 = odbDatabase.Parameters("InStrKansaibiAry")
    '��16�� �z��13 ���ϓ��i�a��j
    odbDatabase.Parameters.AddTable "InStrKansaibiWaAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta13
    Set OraPArray13 = odbDatabase.Parameters("InStrKansaibiWaAry")
    
    '�Œ荀��
    '��17�� �@�@�@�@ ���s���i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkoubi", mstrHakkoubi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkoubi").ServerType = ORATYPE_VARCHAR2
    '��18�� �@�@�@�@ ���s�ҏ��P�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo1", gtblCdT_Hakkousya(1).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo1").ServerType = ORATYPE_VARCHAR2
    '��19�� �@�@�@�@ ���s�ҏ��Q�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo2", gtblCdT_Hakkousya(2).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo2").ServerType = ORATYPE_VARCHAR2
    '��20�� �@�@�@�@ ���s�ҏ��R�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo3", gtblCdT_Hakkousya(3).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo3").ServerType = ORATYPE_VARCHAR2
    '��21�� �@�@�@�@ ���s�ҏ��S�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo4", gtblCdT_Hakkousya(4).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo4").ServerType = ORATYPE_VARCHAR2
    '��22�� �@�@�@�@ ���[�����́i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrLoanNm", gstrCdT_LoanNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrLoanNm").ServerType = ORATYPE_VARCHAR2
    '��23�� �@�@�@�@ ���ϒʒm�o�͎҈ꗗ�^�C�g��
    odbDatabase.Parameters.Add "InStrTitle", str411Title, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTitle").ServerType = ORATYPE_VARCHAR2
    
    '��23�� �폜�t���O �r�o1��ڂ̂ݍ폜�i�h�P�h�j
    odbDatabase.Parameters.Add "InStrDeleteFlg", "1", ORAPARM_INPUT
    odbDatabase.Parameters("InStrDeleteFlg").ServerType = ORATYPE_CHAR
    
    'SQL�� �ҏW
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410InsWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 �I�y���[�^ID
    strSQL = strSQL & ":InStrComputerMei,"              '02 �[��ID
    
    strSQL = strSQL & ":InNumAryCount,"                 '03 �z��i�[����
    strSQL = strSQL & ":InStrSyainCd1Ary,"              '04 �Ј��R�[�h�P
    strSQL = strSQL & ":InStrSyainCd2Ary,"              '05 �Ј��R�[�h�Q
    strSQL = strSQL & ":InStrYushibiAry,"               '06 �Z����
    strSQL = strSQL & ":InStrYushibiWaAry,"             '07 �Z�����i�a��j
    strSQL = strSQL & ":InStrDispNmAry,"                '08 �\���p�Ј�����
    strSQL = strSQL & ":InStrTenCdAry,"                 '09 �����X�R�[�h
    strSQL = strSQL & ":InStrTenNmAry,"                 '10 �����X����
    strSQL = strSQL & ":InStrTozaiAry,"                 '11 �����敪
    strSQL = strSQL & ":InStrBumonCdAry,"               '12 ��������R�[�h
    strSQL = strSQL & ":InStrBumonNmAry,"               '13 �������喼��
    strSQL = strSQL & ":InStrYushiKngAry,"              '14 �Z�����z
    strSQL = strSQL & ":InStrKansaibiAry,"              '15 ���ϓ�
    strSQL = strSQL & ":InStrKansaibiWaAry,"            '16 ���ϓ��i�a��j
    
    strSQL = strSQL & ":InStrHakkoubi,"                 '17 ���s���i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo1,"              '18 ���s�ҏ��P�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo2,"              '19 ���s�ҏ��Q�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo3,"              '20 ���s�ҏ��R�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo4,"              '21 ���s�ҏ��S�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrLoanNm,"                   '22 ���[�����́i���ϒʒm�p�j
    strSQL = strSQL & ":InStrTitle,"                    '23 ���ϒʒm�o�͎҈ꗗ�^�C�g��
    strSQL = strSQL & ":InStrDeleteFlg "                '24 ���ϒʒm�o�͎҈ꗗ�^�C�g��
    strSQL = strSQL & "); END;"
    
    
    '�ꗗ������LOOP
    lngArySetCnt = 1
    For i = 1 To spdIchiran.MaxRows
        
        '04 �Ј��R�[�h�P
        strTmp = gVarSpdGetText(spdIchiran, 9, i)
        OraPArray1.Put_value Mid$(strTmp, 1, 1), lngArySetCnt - 1
        '05 �Ј��R�[�h�Q
        strTmp = gVarSpdGetText(spdIchiran, 10, i)
        OraPArray2.Put_value Mid$(strTmp, 1, 7), lngArySetCnt - 1
        '06 �Z����
        strTmp = gVarSpdGetText(spdIchiran, 6, i)
        If IsDate(strTmp) = False Then
            strTmp = ""
        End If
        OraPArray3.Put_value strTmp, lngArySetCnt - 1
        '07 �Z�����i�a��j
        If IsDate(strTmp) = True Then
            strTmpY = Trim$(Format(strTmp, "e"))
            strTmpM = Trim$(Format(strTmp, "m"))
            strTmpD = Trim$(Format(strTmp, "d"))
            strTmp = Format(strTmp, "ggg") & " " & _
                     IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "�N", strTmpY & "�N") & _
                     IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "��", strTmpM & "��") & _
                     IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "��", strTmpD & "��")
        End If
        OraPArray4.Put_value strTmp, lngArySetCnt - 1
        '08 �\���p�Ј�����
        strTmp = gVarSpdGetText(spdIchiran, 3, i)
        OraPArray5.Put_value Trim$(strTmp), lngArySetCnt - 1
        '09 �����X�R�[�h
        strTmp = gVarSpdGetText(spdIchiran, 11, i)
        OraPArray6.Put_value Mid$(strTmp, 1, 3), lngArySetCnt - 1
        '10 �����X����
        strTmp = gVarSpdGetText(spdIchiran, 12, i)
        OraPArray7.Put_value Trim$(strTmp), lngArySetCnt - 1
        '11 �����敪
        strTmp = gVarSpdGetText(spdIchiran, 1, i)
        OraPArray8.Put_value Trim$(strTmp), lngArySetCnt - 1
        '12 ��������R�[�h
        strTmp = gVarSpdGetText(spdIchiran, 13, i)
        OraPArray9.Put_value Mid$(strTmp, 1, 6), lngArySetCnt - 1
        '13 �������喼��
        strTmp = gVarSpdGetText(spdIchiran, 14, i)
        OraPArray10.Put_value Trim$(strTmp), lngArySetCnt - 1
        '14 �Z�����z
        strTmp = gVarSpdGetText(spdIchiran, 7, i)
        If IsNumeric(strTmp) = True Then
            strTmp = "\" & fncstrMojiEdit(Format(strTmp, "#,##0"), 12, 0) 'SPACE�t���i�O�j
        Else
            strTmp = ""
        End If
        OraPArray11.Put_value strTmp, lngArySetCnt - 1
        '15 ���ϓ�
        strTmp = gVarSpdGetText(spdIchiran, 8, i)
        If IsDate(strTmp) = False Then
            strTmp = ""
        End If
        OraPArray12.Put_value strTmp, lngArySetCnt - 1
        '16 ���ϓ��i�a��j
        If IsDate(strTmp) = True Then
            strTmpY = Trim$(Format(strTmp, "e"))
            strTmpM = Trim$(Format(strTmp, "m"))
            strTmpD = Trim$(Format(strTmp, "d"))
            strTmp = Format(strTmp, "ggg") & " " & _
                     IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "�N", strTmpY & "�N") & _
                     IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "��", strTmpM & "��") & _
                     IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "��", strTmpD & "��")
        End If
        OraPArray13.Put_value strTmp, lngArySetCnt - 1
        
        
        '�z�񌏐��̒l�Z�b�g
        odbDatabase.Parameters("InNumAryCount").Value = lngArySetCnt
        
        If lngArySetCnt >= cnslngAryCnt Or _
           i = spdIchiran.MaxRows Then
            '�ő匏���ɒB�����̂�SP��CALL
            'SP ���s
            odbDatabase.DbexecuteSQL (strSQL)
        
            '�폜�t���O�̒l�̃��Z�b�g
            odbDatabase.Parameters("InStrDeleteFlg").Value = "0"
        
            lngArySetCnt = 1
        Else
            lngArySetCnt = lngArySetCnt + 1
        End If
    Next i
        
        
    
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    '����f�[�^�쐬 OK
    fncblnPrintDataEdit = True
    
    Exit Function

fncblnPrintDataEdit_ERR:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    ����f�[�^�폜 SP ���s
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataDel() As Boolean
    Dim strSQL               As String
    '----------------------------------------------

On Error GoTo fncblnPrintDataDel_ERR
    
    '������
    fncblnPrintDataDel = False

    '����f�[�^�쐬 �r�o
    '��01�� �I�y���[�^ID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '��02�� �[��ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410DelWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 �I�y���[�^ID
    strSQL = strSQL & ":InStrComputerMei "              '02 �[��ID
    strSQL = strSQL & "); END;"
    
    'SP ���s
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    '����f�[�^�쐬 OK
    fncblnPrintDataDel = True
    
    Exit Function

fncblnPrintDataDel_ERR:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function



'***********************************************************************************
'    �N���X�^�����|�[�g �v���r���[�E����i���ϒʒm�j
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Sub sub410PrintRep(intDestinationConstants As DestinationConstants)
    Dim strJoken                As String
    Dim strConectPoint          As String
    Dim intRet                  As Integer
    '--------------------------------------------
    
On Error GoTo sub410PrintRep_ERR

    With CrystalReport
        '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
        strConectPoint = "  DSN = " & gstrCommandLine(0) & _
                         " ;UID = " & gstrCommandLine(3) & _
                         " ;PWD = " & gstrCommandLine(4)
        
        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants
        
        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then
'''''            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
            .WindowTitle = "���ϒʒm��"
            If Me.Top < 0 Then
                .WindowTop = 0
            Else
                .WindowTop = Me.Top / Screen.TwipsPerPixelY
            End If
            If Me.Left < 0 Then
                .WindowLeft = 0
            Else
                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
            End If
            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
        End If
        
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt410.rpt"
        .DiscardSavedData = True
            
        '���o�������L�q����i�R���s���[�^���j
        strJoken = ""
        strJoken = strJoken & "{QPAZ_KansaiWT.QPAZ_TanmatsuId} = '" & gstrCommandLine(5) & "'"
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_TantoId} = '" & gstrCommandLine(1) & "'"
        If Trim$(mstrKeySyaincd2) <> "" Then
            '�Ј��R�[�h�w��  ���I�����ꂽ�s�̂ݏo�͑ΏۂƂ���
            strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_Yushibi} = '" & mstrKeyYushibi & "'"
        End If
        .SelectionFormula = strJoken
            
        .DiscardSavedData = True
        
        '�N���X�^�����|�[�g�����s����
        intRet = .PrintReport
            
        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            '�G���[���b�Z�[�W�\��
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
sub410PrintRep_ERR:
    '�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'***********************************************************************************
'    �N���X�^�����|�[�g �v���r���[�E����i���ϒʒm�j
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Sub sub411PrintRep(intDestinationConstants As DestinationConstants)
    Dim strJoken                As String
    Dim strConectPoint          As String
    Dim intRet                  As Integer
    '--------------------------------------------
    
On Error GoTo sub411PrintRep_ERR

    With CrystalReport
        '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
        strConectPoint = "  DSN = " & gstrCommandLine(0) & _
                         " ;UID = " & gstrCommandLine(3) & _
                         " ;PWD = " & gstrCommandLine(4)
        
        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants
        
        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then
'''''            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
            .WindowTitle = "���ϒʒm�o�͑Ώێ҈ꗗ"
            If Me.Top < 0 Then
                .WindowTop = 0
            Else
                .WindowTop = Me.Top / Screen.TwipsPerPixelY
            End If
            If Me.Left < 0 Then
                .WindowLeft = 0
            Else
                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
            End If
            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
        End If
        
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt411.rpt"
        .DiscardSavedData = True
            
        '���o�������L�q����i�R���s���[�^���j
        strJoken = ""
        strJoken = strJoken & "{QPAZ_KansaiWT.QPAZ_TanmatsuId} = '" & gstrCommandLine(5) & "'"
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_TantoId} = '" & gstrCommandLine(1) & "'"
        .SelectionFormula = strJoken
            
        .DiscardSavedData = True
        
        '�N���X�^�����|�[�g�����s����
        intRet = .PrintReport
            
        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            '�G���[���b�Z�[�W�\��
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
sub411PrintRep_ERR:
    '�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'***********************************************************************************
'    �����ҏW �i�X�y�[�X���߁j
'    ���@���F strPara_Moji �FString  �F �ҏW���镶����
'    �@�@�@�F intPara_Keta �FInteger �F �ŏI�I�Ȍ���
'    �@�@�@�F intPara_Mode �FInteger �F �擪�ɕt�����邩��납�H  0=�擪  1=��
'    �ԋp�l�F String �F�ҏW���ꂽ���ʕ�����
'***********************************************************************************
Private Function fncstrMojiEdit(strPara_Moji As String, intPara_Keta As Integer, intPara_Mode As Integer) As String
    Dim i        As Integer
    Dim strTmp   As String
    Dim strEdit  As String

    strTmp = StrConv(strPara_Moji, vbFromUnicode)

    If LenB(strTmp) = intPara_Keta Then
        'OK�i������v�̂��ߏ����Ȃ��j
        fncstrMojiEdit = strPara_Moji
    Else
        'NG
        If intPara_Mode = 0 Then
            '�O�ɕt��
            strEdit = ""
            For i = 1 To (intPara_Keta - LenB(strTmp))
                strEdit = strEdit & Space(1)
            Next i
            strEdit = strEdit & strPara_Moji
            fncstrMojiEdit = strEdit
        Else
            '���ɕt��
            strEdit = strPara_Moji
            For i = 1 To (intPara_Keta - LenB(strTmp))
                strEdit = strEdit & Space(1)
            Next i
            fncstrMojiEdit = strEdit
        End If
    End If

End Function







'***********************************************************************************
'    �ꗗ  �N���b�N    �\�����ύX
'***********************************************************************************
Private Sub spdIchiran_Click(ByVal Col As Long, ByVal Row As Long)


    If Row = 0 And Col > 0 Then
        'SORT
        With spdIchiran
            If .MaxRows > 1 Then
                'SORT�p�^�[��
                .Row = 1     '�Z���u���b�N��ݒ�
                .Col = 1
                .Row2 = .MaxRows
                .Col2 = .MaxCols
                .SortBy = SS_SORT_BY_ROW
                .SortKey(1) = Col   '��P�\�[�g�L�[��ݒ�
                
                If mlngSvCol = Col Then
                    '�O���SORT�L�[�Ɠ���
                    
                    Select Case mintSort
                        Case 0, 2   '���� OR �~��
                            'SORT
                            '�����ɕ��בւ�
                            .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
                            
                            mintSort = 1
                        Case 1    '����
                            'SORT
                            '�~���ɕ��בւ�
                            .SortKeyOrder(1) = SS_SORT_ORDER_DESCENDING
                            
                            mintSort = 2
                    End Select
                Else
                    '�O���SORT�L�[�ƈႤ
                    
                    '�����ɕ��בւ�
                    .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
                    
                    mintSort = 1
                End If
                
                '���s
                .Action = SS_ACTION_SORT
                mlngSvCol = Col
            End If
        End With
    End If

End Sub





'***********************************************************************************
'    ���ϓ�FromTo �N  Chenge Event �t�����E�o
'***********************************************************************************
Private Sub txtKansaibiY_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '���ϓ�FromTo �t�����E�o
    Call gsubMaxCharSkipEX(txtKansaibiY, 4)
    
    '�G���[�N���A
    Call subErrCrear

End Sub
'***********************************************************************************
'    ���ϓ�FromTo �N  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtKansaibiY_GotFocus()
    Call gsubSelectText(txtKansaibiY)
End Sub
'***********************************************************************************
'    ���ϓ�FromTo �N  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtKansaibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub


'***********************************************************************************
'    ���ϓ�FromTo ��  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtKansaibiM_GotFocus()
    Call gsubSelectText(txtKansaibiM)
End Sub
'***********************************************************************************
'    ���ϓ�FromTo ��  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtKansaibiM_KeyPress(KeyAscii As Integer)
    '�G���[�N���A
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    ���ϓ�FromTo ��  LostFocus Event
'***********************************************************************************
Private Sub txtKansaibiM_LostFocus()
    If IsNumeric(txtKansaibiM.Text) = True Then
        blnNoChangeEvFlg = True
        txtKansaibiM.Text = Format(txtKansaibiM.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub




'***********************************************************************************
'    �Ј��R�[�h�P  Chenge Event �t�����E�o
'***********************************************************************************
Private Sub txtSyainCD1_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    Call gsubMaxCharSkipEX(txtSyainCD1, 1)
    
    '�G���[�N���A
    Call subErrCrear

End Sub
'***********************************************************************************
'    �Ј��R�[�h�P  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtSyainCD1_GotFocus()
    Call gsubSelectText(txtSyainCD1)
End Sub
'''''''***********************************************************************************
'''''''    �Ј��R�[�h�P  KeyPress Event�@���͕�������
'''''''***********************************************************************************
''''''Private Sub txtSyainCD1_KeyPress(KeyAscii As Integer)
''''''    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
''''''End Sub
'***********************************************************************************
'    �Ј��R�[�h�P  LostFocus Event
'***********************************************************************************
Private Sub txtSyainCD1_LostFocus()
    
    blnNoChangeEvFlg = True
    txtSyainCD1 = StrConv(txtSyainCD1, vbUpperCase)
    blnNoChangeEvFlg = False
    
End Sub


'***********************************************************************************
'    �Ј��R�[�h�Q  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtSyainCD2_GotFocus()
    Call gsubSelectText(txtSyainCD2)
End Sub
'***********************************************************************************
'    �Ј��R�[�h�Q  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtSyainCD2_KeyPress(KeyAscii As Integer)
    '�G���[�N���A
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub



'***********************************************************************************
'    ���s�� �N  Chenge Event �t�����E�o
'***********************************************************************************
Private Sub txtHakkoubiY_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '���s�� �t�����E�o
    Call gsubMaxCharSkipEX(txtHakkoubiY, 4)
    
    '�G���[�N���A
    Call subErrCrear

End Sub
'***********************************************************************************
'    ���s�� �N  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtHakkoubiY_GotFocus()
    Call gsubSelectText(txtHakkoubiY)
End Sub
'***********************************************************************************
'    ���s�� �N  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtHakkoubiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub


'***********************************************************************************
'    ���s�� ��  Chenge Event �t�����E�o
'***********************************************************************************
Private Sub txtHakkoubiM_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '���s�� �t�����E�o
    Call gsubMaxCharSkipEX(txtHakkoubiM, 2)
    
    '�G���[�N���A
    Call subErrCrear

End Sub
'***********************************************************************************
'    ���s�� ��  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtHakkoubiM_GotFocus()
    Call gsubSelectText(txtHakkoubiM)
End Sub
'***********************************************************************************
'    ���s�� ��  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtHakkoubiM_KeyPress(KeyAscii As Integer)
    '�G���[�N���A
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    ���s�� ��  LostFocus Event
'***********************************************************************************
Private Sub txtHakkoubiM_LostFocus()
    If IsNumeric(txtHakkoubiM.Text) = True Then
        blnNoChangeEvFlg = True
        txtHakkoubiM.Text = Format(txtHakkoubiM.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub


'***********************************************************************************
'    ���s�� ��  GotFocus Event�@�e�L�X�g�I��
'***********************************************************************************
Private Sub txtHakkoubiD_GotFocus()
    Call gsubSelectText(txtHakkoubiD)
End Sub
'***********************************************************************************
'    ���s�� ��  KeyPress Event�@���͕�������
'***********************************************************************************
Private Sub txtHakkoubiD_KeyPress(KeyAscii As Integer)
    '�G���[�N���A
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    ���s�� ��  LostFocus Event
'***********************************************************************************
Private Sub txtHakkoubiD_LostFocus()
    If IsNumeric(txtHakkoubiD.Text) = True Then
        blnNoChangeEvFlg = True
        txtHakkoubiD.Text = Format(txtHakkoubiD.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub




























