VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt150 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�c���}�C�i�X���X�g"
   ClientHeight    =   8580
   ClientLeft      =   885
   ClientTop       =   2700
   ClientWidth     =   14385
   BeginProperty Font 
      Name            =   "�l�r �S�V�b�N"
      Size            =   9.75
      Charset         =   128
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form13"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.CommandButton cmdPrint 
      Caption         =   "�ꗗ���"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   1
      Left            =   12960
      TabIndex        =   7
      Top             =   6630
      Width           =   1065
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "�v���r���["
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   0
      Left            =   11790
      TabIndex        =   6
      Top             =   6630
      Width           =   1065
   End
   Begin VB.Frame Frame4 
      Appearance      =   0  '�ׯ�
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   5535
      Index           =   1
      Left            =   120
      TabIndex        =   30
      Top             =   1020
      Width           =   14250
      Begin FPSpread.vaSpread sprList 
         Height          =   4965
         Left            =   510
         TabIndex        =   5
         Top             =   300
         Width           =   13290
         _Version        =   196608
         _ExtentX        =   23442
         _ExtentY        =   8758
         _StockProps     =   64
         MaxCols         =   8
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt150.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   945
      Left            =   90
      TabIndex        =   24
      Top             =   30
      Width           =   14250
      Begin VB.ComboBox cobKousin 
         Height          =   315
         ItemData        =   "QPAV_CEnt150.frx":042C
         Left            =   1725
         List            =   "QPAV_CEnt150.frx":0436
         Style           =   2  '��ۯ���޳� ؽ�
         TabIndex        =   0
         Top             =   360
         Width           =   1650
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   13650
         Top             =   270
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.TextBox txtSyuturyokuM 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   7980
         MaxLength       =   2
         TabIndex        =   4
         Top             =   360
         Width           =   330
      End
      Begin VB.TextBox txtSyuturyokuY 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   7170
         MaxLength       =   4
         TabIndex        =   3
         Top             =   360
         Width           =   525
      End
      Begin VB.Frame fraTozai 
         BorderStyle     =   0  '�Ȃ�
         Height          =   510
         Left            =   3510
         TabIndex        =   25
         Top             =   240
         Width           =   2715
         Begin VB.OptionButton optTouzai 
            Caption         =   "��"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   9
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   1
            Left            =   1890
            Style           =   1  '���̨���
            TabIndex        =   2
            Top             =   90
            Visible         =   0   'False
            Width           =   780
         End
         Begin VB.OptionButton optTouzai 
            Caption         =   "��"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   9
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   0
            Left            =   990
            Style           =   1  '���̨���
            TabIndex        =   1
            Top             =   90
            Value           =   -1  'True
            Visible         =   0   'False
            Width           =   780
         End
         Begin VB.Label Label1 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�����敪"
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   9
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   180
            Left            =   180
            TabIndex        =   26
            Top             =   180
            Visible         =   0   'False
            Width           =   720
         End
      End
      Begin VB.Label Label5 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���o�敪"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   915
         TabIndex        =   31
         Top             =   435
         Width           =   720
      End
      Begin VB.Label Label4 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�N"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   7725
         TabIndex        =   29
         Top             =   435
         Width           =   180
      End
      Begin VB.Label Label3 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   8355
         TabIndex        =   28
         Top             =   435
         Width           =   180
      End
      Begin VB.Label Label2 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�o�͔N��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   6375
         TabIndex        =   27
         Top             =   435
         Width           =   720
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
      ScaleWidth      =   14325
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   7620
      Width           =   14385
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F1:�ƭ-"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   60
         TabIndex        =   8
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ʰ�޺�߰"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   1245
         TabIndex        =   9
         Top             =   90
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
         Left            =   2430
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   90
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
         Left            =   3615
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:���s"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   5
         Left            =   4830
         TabIndex        =   10
         Top             =   90
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
         Left            =   6045
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   90
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
         Left            =   7200
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   90
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
         Left            =   8385
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   90
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
         Left            =   9570
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:�O���"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   10
         Left            =   10755
         TabIndex        =   11
         Top             =   90
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
         Left            =   11955
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:���"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   12
         Left            =   13140
         TabIndex        =   12
         Top             =   90
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
      TabIndex        =   21
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
         TabIndex        =   22
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   8205
      Width           =   14385
      _ExtentX        =   25374
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   12894
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
            TextSave        =   "2010/11/20"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "11:32"
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
Attribute VB_Name = "frmQPAV_CEnt150"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           ����A�o�͔N�����u�Q���i�������j�v�܂��́u�W���i������j�v�̎��̂�
'                           �\�����Ă���u�����������^���A�ܗ^���A���v�v���A�u�T���i�l�������j�v
'                           ����сu�P�P���v�ɂ��\������悤�ύX����B
'20100713  1004091          ���o�����ɂ��铌���敪���폜
'                           �������̃f�[�^����x�ɕ\���E������s��
'20101119  XXXXXXX          �N���W�b�g�V�X�e���č\�z�E���[�팸
'                           ��ʃ^�C�g�����u�c���}�C�i�X���X�g�v�ɕύX
'                           �u���c���\�v�E�u���c�����v�\�v�̏o�͏����폜
'----------------------------------------------------------------------------------------------
'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
            Exit Sub
        Case 2  '�n�[�h�R�s�[
            Call gsubQSAV_ActX1001

        Case 5  '���s
            Call subCmdJikkou
            
        Case 10 '�O���
            Unload Me
            Exit Sub
        Case 12 '���
            Call subFormInitialize

'MOD 20100713 1004091 IMZ SHIBUTANI START
'            optTouzai(0).SetFocus
            txtSyuturyokuY.SetFocus
'MOD 20100713 1004091 IMZ SHIBUTANI END
    
    End Select
    
End Sub

Private Sub cmdPrint_Click(Index As Integer)
    
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String
'add 20101119 XXXXXXX imz.Yoshida start
    Dim strMSG    As String                 '�m�F�p���b�Z�[�W
    Dim dcINDEX   As DestinationConstants   '�N���X�^�����|�[�g���s�R���g���[��
'add 20101119 XXXXXXX imz.Yoshida end

'mod 20101119 XXXXXXX imz.Yoshida start
'    Select Case Index
'        Case 0
'            If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�O���[�v�Ј��ݕt�c���\") = vbCancel Then
'                Exit Sub
'            End If
'            Call subPrintReport1(crptToWindow)
'            Call subPrintReport2(crptToWindow)
'            Call subPrintReport3(crptToWindow)
'        Case 1
'            If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�O���[�v�Ј��ݕt�c���\") = vbCancel Then
'                Exit Sub
'            End If
'            Call subPrintReport1(crptToPrinter)
'            Call subPrintReport2(crptToPrinter)
'            Call subPrintReport3(crptToPrinter)
'    End Select
    '�m�F���b�Z�[�W�ݒ�
    If Index = 0 Then
        strMSG = "�v���r���[���J�n���܂��B��낵���ł����H"                            '�v���r���[�{�^��������
    Else
        strMSG = "������J�n���܂��B��낵���ł����H"                                  '�ꗗ����{�^��������
    End If

    '�m�F���b�Z�[�W
    If MsgBox(strMSG, vbQuestion + vbOKCancel, Me.Caption) = vbCancel Then Exit Sub
    Me.MousePointer = vbHourglass                                                   '�}�E�X�|�C���^�[
    stbSystem.Panels.Item(1).Text = "�������D�D�D"                                   '�X�e�[�^�X�o�[
    '�N���X�^�����|�[�g���s�ݒ�
    dcINDEX = Index                                                                  '�^�ϊ�
    '�c���}�C�i�X���X�g�N������
    Call subPrintReport3(dcINDEX)
'mod 20101119 XXXXXXX imz.Yoshida end

End Sub


'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "�ݕt���c���\"
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
'mod 20101119 XXXXXXX imz.Yoshida start
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat _
'                                    , "�ݕt���c���\ (" & gstrCommandLine(8) & ") " _
'                                    , CStr(Err.Number), Err.Description)
'            '�I��
'            Unload Me
            GoTo ERROR_SECTION
'mod 20101119 XXXXXXX imz.Yoshida end
        End If
        
        '�I���N���f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
'mod 20101119 XXXXXXX imz.Yoshida start
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat _
'                                    , "�ݕt���c���\ (" & gstrCommandLine(8) & ") " _
'                                    , CStr(Err.Number), Err.Description)
'            '�I��
'            Unload Me
            GoTo ERROR_SECTION
'mod 20101119 XXXXXXX imz.Yoshida end
        End If
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        Call gsubKamiSimoSet
        
        '��ʏ�����
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False

'add 20101119 XXXXXXX imz.Yoshida start
    Exit Sub

ERROR_SECTION:
    '�V�X�e���G���[�������̃G���[���b�Z�[�W���ʏ���
    Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                            , gstrCommandLine(5), gstrGetErrDateFormat _
                            , "�c���}�C�i�X���X�g (" & gstrCommandLine(8) & ") " _
                            , CStr(Err.Number), Err.Description)
    Me.Enabled = True                                                               '��ʎg�p�ېݒ�
    MousePointer = vbDefault                                                        '�}�E�X�|�C���^�[
    Unload Me                                                                       '��ʏI��
'add 20101119 XXXXXXX imz.Yoshida end
End Sub

'**************************************************************************************************
'*FORM_KEYDOWN �t�@���N�V�����L�[�ݒ�
'**************************************************************************************************
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
    End Select

End Sub

'**************************************
'*FORM_KEYPRESS
'**************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    'ENTER Beep������
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

'**************************************************************************************************
'*Form���[�h
'**************************************************************************************************
Private Sub Form_Load()
    
'mod 20101119 XXXXXXX imz.Yoshida start
'    Me.Caption = "�ݕt���c���\ (" & gstrCommandLine(8) & ")"
    Me.Caption = "�c���}�C�i�X���X�g (" & gstrCommandLine(8) & ")"
'mod 20101119 XXXXXXX imz.Yoshida end
    '�X�e�[�^�X�o�[�ݒ�
    Call gsubInitStatusBar(stbSystem)
    
    '��ʏ�����
    blnLoadFlg = True

    sprList.MaxRows = 0

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

    '�g�p���[�N�e�[�u���S�폜
    Call subDelWorkTbl
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt150 = Nothing
    
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyuturyokum_GotFocus()
    Call gsubSelectText(txtSyuturyokuM)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyuturyokum_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyuturyokuY_GotFocus()
    Call gsubSelectText(txtSyuturyokuY)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyuturyokuY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSyuturyokuY_Change()
    Call gsubMaxCharSkipEX(txtSyuturyokuY, 4)
End Sub

'*************************************************************************************************
'*���̓`�F�b�N
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    If Day(gdatSysDate) > 25 Then
        'Msg = �Q�T���ȍ~�͏o�͂ł��܂���B
        lblMsg.Caption = "WPOE21 " & gstrGetCodeMeisyo(odbDatabase, "E21", "WPO")
        txtSyuturyokuY.Enabled = True
        txtSyuturyokuY.SetFocus
        Exit Function
    End If

    '�o�͔N���̓`�F�b�N
    If Trim$(txtSyuturyokuY.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuY.Enabled = True
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    txtSyuturyokuY.Text = Format(txtSyuturyokuY.Text, "0000")
    
    '�o�͌����̓`�F�b�N
    If Trim$(txtSyuturyokuM.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuM.Enabled = True
        txtSyuturyokuM.SetFocus
        Exit Function
    End If
    txtSyuturyokuM.Text = Format(txtSyuturyokuM.Text, "00")
            
    If Not IsDate(txtSyuturyokuY.Text & "," & txtSyuturyokuM.Text & ",01") Then
        'Msg = �͓��t�œ��͂��ĉ������B
        lblMsg.Caption = "WPOE03 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    
    If Val(Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/01", "yyyymm")) <> Val(Format$(IIf(Day(gdatSysDate) > 25, gdatSysDate, DateAdd("m", -1, gdatSysDate)), "yyyymm")) Then
        'Msg = �o�͔N�������������͂���Ă��܂���B
        lblMsg.Caption = "WPOE22 " & gstrGetCodeMeisyo(odbDatabase, "E22", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    
    funcChk = True

End Function

'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
 
    Dim strStrYMD_Work  As String
    Dim strKyuyoYMD_Work  As String

    Call subErrKaijo
    
    '���̓`�F�b�N
    If funcChk = False Then Exit Sub
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
    cmdPFK(5).SetFocus
                
    'SP�p�ϐ��ɑޔ�
    strStrYMD_Work = Format(DateAdd("d", -1, DateAdd("m", 1, txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/01")), "yyyy/mm/dd")
    gstrStrYMD = Format(strStrYMD_Work, "yyyymmdd")
    
'MOD 20100713 1004091 IMZ SHIBUTANI START
'    If optTouzai(0).Value = True Then
'        gstrKBN = "1"
'    ElseIf optTouzai(1).Value = True Then
'        gstrKBN = "2"
'    Else
'        gstrKBN = "0"
'    End If
    gstrKBN = "0"
'MOD 20100713 1004091 IMZ SHIBUTANI END
    
    strKyuyoYMD_Work = txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/25"
    gstrKyuyoYMD = Format(strKyuyoYMD_Work, "yyyymmdd")
    gintKyuyoNisu = DateDiff("y", strKyuyoYMD_Work, strStrYMD_Work)
    '2003/01/24 �����v�Z�p
    
    gintKyuyoNisuFrom = gstrKyuyoYMD
    gintKyuyoNisuTo = gstrStrYMD
    
    'Ver2
    If cobKousin.ListIndex = 0 Then
        '�ܗ^�c���X�V�O�f�[�^�擾
        Call gsubSPSet_BeforeUpdate
    Else
        '�ܗ^�c���X�V��f�[�^�擾
        Call gsubSPSet_AfterUpdate
    End If
    
    
    stbSystem.Panels.Item(1).Text = ""
    Screen.MousePointer = vbDefault

End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite

End Sub

'*************************************************************************************************
'* ��ʏ�����
'*************************************************************************************************
Private Sub subFormInitialize()

    optTouzai(0).Value = True
    txtSyuturyokuY.Text = ""
    txtSyuturyokuM.Text = ""

    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '�e�R���g���[������
    cobKousin.ListIndex = 0
    
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    
    
    fraTozai.Enabled = True
    txtSyuturyokuY.Enabled = True
    txtSyuturyokuM.Enabled = True
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite
    txtSyuturyokuY.Text = Format(gdatSysDate, "yyyy")
    txtSyuturyokuM.Text = Format(gdatSysDate, "MM")
    
End Sub

'del 20101119 XXXXXXX imz.Yoshida start
''�N���X�^�����|�[�g
'Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)
'
'Dim strSelectionFormula As String
'Dim strConectPoint      As String
'Dim intRet              As Integer
'
'Dim strMm              As String
'
'
'
'    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
'    strConectPoint = "DSN = " & gstrCommandLine(0) & _
'                    ";UID = " & gstrCommandLine(3) & _
'                    ";PWD = " & gstrCommandLine(4)
'
'    With CrystalReport
'        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
'        .ReportFileName = App.Path & "\QPAV_CEnt150.rpt"
'        .DiscardSavedData = True
'
'        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
'        .Connect = strConectPoint
'
'        '���P�[�V�����̐ݒ�
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
'
'        '�p�����[�^���L�q����
''DEL 20100225 0908047 NBC SAWAME START
''        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
''            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
''DEL 20100225 0908047 NBC SAWAME END
''ADD 20100225 0908047 NBC SAWAME START
'        '���l���Z���A��O�l���Z���ǉ�
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstr34KesM) Then
''ADD 20100225 0908047 NBC SAWAME END
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If
'
''2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή�
'
'''''''        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
'
'        If cobKousin.ListIndex = 0 Then
'            '�ܗ^�c���X�V�O�f�[�^���ߔN���i���^�̂ݎc���j
'            .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'        Else
'            '�ܗ^�c���X�V��f�[�^���ߔN���i���^�E�ܗ^���f�c���j
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '�Q���ȏ�W���ȉ��͏���ܗ^�̒��ߓ��t���擾
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^���f �V����") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '�P���͉����ܗ^�̒��ߓ��t���擾�i�������P�Q���R�P���������ɐݒ�j
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            Else
'                '�W���ȏ�͉����ܗ^�̒��ߓ��t���擾
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                               '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            End If
'
'            Call gsubSPSet_AfterUpdate
'        End If
'
'
''2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή� �����܂�
'
'        '���o�������L�q����
'        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
'                       & " AND ({QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} <> 0" _
'                       & " OR   {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} <> 0))"
'
'        '���o�������L�q����
'        .SelectionFormula = strSelectionFormula
'
'        '�o�͐�ݒ�
'        .Destination = intDestinationConstants
'
'        '�v���r���[�E�B���h�E�̐ݒ�
'        If intDestinationConstants = crptToWindow Then
'
'            .WindowTitle = "�l�ʑݕt���c���\ (" & gstrCommandLine(8) & ")"
'
'            If Me.Top < 0 Then
'                .WindowTop = 0
'            Else
'                .WindowTop = Me.Top / Screen.TwipsPerPixelY
'            End If
'
'            If Me.Left < 0 Then
'                .WindowLeft = 0
'            Else
'                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
'            End If
'
'            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
'            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
'        End If
'
'        '�N���X�^�����|�[�g�����s����
'        intRet = .PrintReport
'
'        Me.Enabled = True
'        Me.MousePointer = vbDefault
'        stbSystem.Panels.Item(1).Text = ""
'
'        If intRet = 20545 Then
'            Exit Sub
'        ElseIf intRet <> 0 Then
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
'                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
'        End If
'        .Reset
'    End With
'
'End Sub
'
''�N���X�^�����|�[�g
'Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)
'
'Dim strSelectionFormula As String
'Dim strConectPoint      As String
'Dim intRet              As Integer
'
'Dim strMm               As String
'
'
'    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
'    strConectPoint = "DSN = " & gstrCommandLine(0) & _
'                    ";UID = " & gstrCommandLine(3) & _
'                    ";PWD = " & gstrCommandLine(4)
'
'    With CrystalReport
'        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
'        .ReportFileName = App.Path & "\QPAV_CEnt151.rpt"
'        .DiscardSavedData = True
'
'        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
'        .Connect = strConectPoint
'
'        '���P�[�V�����̐ݒ�
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAX_ZANDAKATOTALW"
'
'        '�p�����[�^���L�q����
''DEL 20100225 0908047 NBC SAWAME START
''        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
''            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
''DEL 20100225 0908047 NBC SAWAME END
''ADD 20100225 0908047 NBC SAWAME START
'        '���l���Z���A��O�l���Z���ǉ�
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstr34KesM) Then
''ADD 20100225 0908047 NBC SAWAME END
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If
'
''2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή�
'
'''''''        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
'
'
'        If cobKousin.ListIndex = 0 Then
'            '�ܗ^�c���X�V�O�f�[�^���ߔN���i���^�̂ݎc���j
'            .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'        Else
'            '�ܗ^�c���X�V��f�[�^���ߔN���i���^�E�ܗ^���f�c���j
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '�Q���ȏ�W���ȉ��͏���ܗ^�̒��ߓ��t���擾
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '�P���͉����ܗ^�̒��ߓ��t���擾�i�������P�Q���R�P���������ɐݒ�j
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            Else
'                '�W���ȏ�͉����ܗ^�̒��ߓ��t���擾
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                               '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'
'            End If
'
'
'            Call gsubSPSet_AfterUpdate
'        End If
'
'
''2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή� �����܂�
'
'
'
'        '���o�������L�q����
''MOD 20100713 1004091 IMZ SHIBUTANI START
''        strSelectionFormula = "({QPAX_ZANDAKATOTALW.QPAX_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAX_ZANDAKATOTALW.QPAX_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
'                       & " AND ({QPAX_ZANDAKATOTALW.QPAX_TOZAIKBNE} ='" & gstrKBN & "'" _
'                       & " OR   {QPAX_ZANDAKATOTALW.QPAX_TOZAIKBNW} = '" & gstrKBN & "'))"
'
'        strSelectionFormula = "({QPAX_ZANDAKATOTALW.QPAX_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAX_ZANDAKATOTALW.QPAX_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
''MOD 20100713 1004091 IMZ SHIBUTANI END
'
'        '���o�������L�q����
'        .SelectionFormula = strSelectionFormula
'
'        '�o�͐�ݒ�
'        .Destination = intDestinationConstants
'
'        '�v���r���[�E�B���h�E�̐ݒ�
'        If intDestinationConstants = crptToWindow Then
'
'            .WindowTitle = "�X�ʑݕt���c���\ (" & gstrCommandLine(8) & ")"
'
'            If Me.Top < 0 Then
'                .WindowTop = 0
'            Else
'                .WindowTop = Me.Top / Screen.TwipsPerPixelY
'            End If
'
'            If Me.Left < 0 Then
'                .WindowLeft = 0
'            Else
'                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
'            End If
'
'            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
'            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
'        End If
'
'        '�N���X�^�����|�[�g�����s����
'        intRet = .PrintReport
'
'        Me.Enabled = True
'        Me.MousePointer = vbDefault
'        stbSystem.Panels.Item(1).Text = ""
'
'        If intRet = 20545 Then
'            Exit Sub
'        ElseIf intRet <> 0 Then
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
'                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
'        End If
'
'        .Reset
'    End With
'
'End Sub
'del 20101119 XXXXXXX imz.Yoshida end

'�N���X�^�����|�[�g 2003/01/24
Private Sub subPrintReport3(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer

Dim strMm              As String


    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt152.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
        
        '�p�����[�^���L�q����
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If

'2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή�
        
''''''        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
        
'        If cobKousin.ListIndex = 0 Then
'            '�ܗ^�c���X�V�O�f�[�^���ߔN���i���^�̂ݎc���j
' '           .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'        Else
'            '�ܗ^�c���X�V��f�[�^���ߔN���i���^�E�ܗ^���f�c���j
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '�Q���ȏ�W���ȉ��͏���ܗ^�̒��ߓ��t���擾
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^���f �V����") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '�P���͉����ܗ^�̒��ߓ��t���擾�i�������P�Q���R�P���������ɐݒ�j
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                              '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            Else
'                '�W���ȏ�͉����ܗ^�̒��ߓ��t���擾
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '�擾���������Q�����ȏ�J�����ꍇ�͏ܗ^�������������Ƃ݂Ȃ�
'                If RTrim(strMm) = "" Then        '�ܗ^�����̌�
'                    .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '�ܗ^�����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x���^ �V����") & "'"
'                    Else                                                               '�ܗ^����̌�
'                        .Formulas(1) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee�Nmm���x�ܗ^ �V����") & "'"
'                    End If
'                End If
'
'            End If
            
            Call gsubSPSet_AfterUpdate
'        End If
        
        
'2002_05_28 �@�\�ǉ��F�ܗ^���\���Ή� �����܂�

        '���o�������L�q����
''------->�yWin2000�Ή��zDel by Yokoyama@NBC 2004/07/12 ------->------->------->------->------->------->
''        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
''                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
''                       & " AND ({QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} <> 0" _
''                       & " OR   {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} <> 0))"
''<-------�yWin2000�Ή��zDel by Yokoyama@NBC 2004/07/12 <-------<-------<-------<-------<-------<-------
''------->�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/07/12 ------->------->------->------->------->------->
''��QPAV_CEnt152.rpt��SQL�N�G���ɂ�����WHERE���������Ɉړ�
        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "')" _
                       & " AND (({QPAQ_ZANDAKAW.QPAQ_SYUBETU} = '1'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} < 0)" _
                       & " OR  ({QPAQ_ZANDAKAW.QPAQ_SYUBETU} = '2'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} < 0))"
''<-------�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/07/12 <-------<-------<-------<-------<-------<-------
        
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula

        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�c���}�C�i�X���X�g (" & gstrCommandLine(8) & ")"

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

        '�N���X�^�����|�[�g�����s����
        intRet = .PrintReport

        Me.Enabled = True
        Me.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
        .Reset
    End With
    
End Sub

'****************************************************************************************
'* �g�p���[�N�e�[�u���S�폜
'****************************************************************************************
Private Sub subDelWorkTbl()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    '���[�U�[�h�c
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDelWorkTbl
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errDelWorkTbl:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
End Sub

