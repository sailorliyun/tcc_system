VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt080 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�Ј��Z���䒠"
   ClientHeight    =   8580
   ClientLeft      =   330
   ClientTop       =   2025
   ClientWidth     =   14355
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
   ScaleWidth      =   14355
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.PictureBox Picture1 
      Height          =   7320
      Left            =   0
      ScaleHeight     =   7260
      ScaleWidth      =   14280
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   0
      Width           =   14340
      Begin VB.Frame Frame2 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   5730
         Left            =   90
         TabIndex        =   44
         Top             =   1440
         Width           =   14085
         Begin FPSpread.vaSpread sprList 
            Height          =   4755
            Left            =   495
            TabIndex        =   3
            Top             =   285
            Width           =   13020
            _Version        =   196608
            _ExtentX        =   22966
            _ExtentY        =   8387
            _StockProps     =   64
            AllowCellOverflow=   -1  'True
            MaxCols         =   10
            MaxRows         =   20
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt080.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
         Begin VB.CommandButton cmdSyori 
            Caption         =   "�o �^"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   0
            Left            =   5250
            TabIndex        =   4
            Top             =   5160
            Width           =   1095
         End
         Begin VB.CommandButton cmdSyori 
            Caption         =   "�C ��"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   1
            Left            =   6585
            TabIndex        =   5
            Top             =   5160
            Width           =   1095
         End
         Begin VB.CommandButton cmdSyori 
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
            Height          =   435
            Index           =   2
            Left            =   7890
            TabIndex        =   6
            Top             =   5160
            Width           =   1095
         End
         Begin Crystal.CrystalReport CrystalReport 
            Left            =   360
            Top             =   5115
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   348160
            PrintFileLinesPerPage=   60
         End
      End
      Begin VB.Frame Frame1 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   1395
         Left            =   90
         TabIndex        =   24
         Top             =   15
         Width           =   14085
         Begin VB.TextBox txtSyainCd 
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
            IMEMode         =   3  '�̌Œ�
            Index           =   1
            Left            =   2790
            MaxLength       =   7
            TabIndex        =   1
            Top             =   210
            Width           =   930
         End
         Begin VB.TextBox txtSyainCd 
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
            IMEMode         =   3  '�̌Œ�
            Index           =   0
            Left            =   2520
            MaxLength       =   1
            TabIndex        =   0
            Top             =   210
            Width           =   240
         End
         Begin VB.CommandButton cmdNayose 
            Caption         =   "�� �� ��"
            Height          =   360
            Left            =   3765
            TabIndex        =   2
            Top             =   195
            Width           =   1170
         End
         Begin VB.Label Label1 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Ј��R�[�h"
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
            Left            =   960
            TabIndex        =   43
            Top             =   240
            Width           =   1125
         End
         Begin VB.Label Label11 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�� �i"
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
            Left            =   10230
            TabIndex        =   42
            Top             =   240
            Width           =   570
         End
         Begin VB.Label Label5 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Ј���������"
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
            Left            =   960
            TabIndex        =   41
            Top             =   1080
            Width           =   1350
         End
         Begin VB.Label Label13 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "��"
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
            Index           =   0
            Left            =   10230
            TabIndex        =   40
            Top             =   660
            Width           =   225
         End
         Begin VB.Label Label14 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "���N����"
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
            Left            =   10230
            TabIndex        =   39
            Top             =   1080
            Width           =   900
         End
         Begin VB.Label Label16 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "��������"
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
            Left            =   6000
            TabIndex        =   38
            Top             =   1080
            Width           =   900
         End
         Begin VB.Label Label17 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�����X"
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
            Left            =   6000
            TabIndex        =   37
            Top             =   240
            Width           =   675
         End
         Begin VB.Label lblShimeiKana 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   2520
            TabIndex        =   36
            Top             =   660
            Width           =   120
         End
         Begin VB.Label lblShimeiKanji 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   2520
            TabIndex        =   35
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblSikakuCd 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   11400
            TabIndex        =   34
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblMiseCd 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   7170
            TabIndex        =   33
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblKyuu 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   11400
            TabIndex        =   32
            Top             =   660
            Width           =   120
         End
         Begin VB.Label lblBumonCd 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   7170
            TabIndex        =   31
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblBirthday 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   11400
            TabIndex        =   30
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblMiseName 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   8100
            TabIndex        =   29
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblBumonName 
            AutoSize        =   -1  'True
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   225
            Left            =   8100
            TabIndex        =   28
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblTozai 
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   285
            Left            =   7170
            TabIndex        =   27
            Top             =   660
            Width           =   795
         End
         Begin VB.Label Label13 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�����敪"
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
            Index           =   1
            Left            =   6000
            TabIndex        =   26
            Top             =   660
            Width           =   900
         End
         Begin VB.Label Label2 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Ј������J�i"
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
            Left            =   960
            TabIndex        =   25
            Top             =   660
            Width           =   1350
         End
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   345
      Left            =   0
      TabIndex        =   22
      Top             =   8235
      Width           =   14355
      _ExtentX        =   25321
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14102
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "2009/07/10"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:12"
         EndProperty
      EndProperty
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
      ScaleWidth      =   14280
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   7755
      Width           =   14340
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
         Left            =   45
         TabIndex        =   7
         Top             =   30
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
         Left            =   1230
         TabIndex        =   8
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
         Index           =   4
         Left            =   3600
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   4785
         TabIndex        =   9
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
         Index           =   7
         Left            =   7155
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
         Index           =   8
         Left            =   8355
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
         Index           =   9
         Left            =   9540
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   10725
         TabIndex        =   10
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
         Left            =   11910
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   13095
         TabIndex        =   11
         Top             =   30
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
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   14280
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   7335
      Width           =   14340
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
         TabIndex        =   20
         Top             =   60
         Width           =   12405
      End
   End
End
Attribute VB_Name = "frmQPAV_CEnt080"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg As Boolean           '�����t���O
Private blnNoChangeEvFlg As Boolean      '��ݼ޲���Ė����׸�
Private Const cnsNumeric = "0123456789 "
'******************************************************************************
'*    �o�^ , �C�� , �폜�{�^������������
'******************************************************************************
Private Sub cmdSyori_Click(Index As Integer)
 Dim S As Variant
 
    Select Case Index
    
    Case 0
        Call subSyori(Index)
    Case Else
    
        '���گ�ނ̓��e�̗L������
        If sprList.GetText(1, sprList.ActiveRow, S) = True Then
    
            '�C���E�폜�� �Z���z = �c���̂Ƃ��̂ݍX�V����B
            If CLng(gVarSpdGetText(sprList, 5, sprList.ActiveRow)) <> CLng(gVarSpdGetText(sprList, 8, sprList.ActiveRow)) Then
                lblMsg.Caption = "�c���ƗZ���z����v���Ă��Ȃ��׏����ł��܂���B"
                txtSyainCd(0).Enabled = True
                txtSyainCd(1).Enabled = True
                txtSyainCd(1).SetFocus
                Exit Sub
            End If

            Call subSyori(Index)
        End If
    
    End Select

End Sub
'******************************************************************************
'*    FORM_LOAD �����
'******************************************************************************
Private Sub Form_Load()
    
    Me.Caption = "�Ј��Z���䒠 (" & gstrCommandLine(8) & ")"
    
    blnInit_Flg = True
    
    '����ʏ�����
    Call subFormInitialize
    
    blnNoChangeEvFlg = True

End Sub
'******************************************************************************
'*    FORM_UNLOAD �����
'******************************************************************************
Private Sub Form_Unload(CANCEL As Integer)

    '�r������
    Call gsubUnLock

    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
End Sub
'******************************************************************************
'*    FORM_ACTIVATE �����
'*    �Z�b�V�����̊m�� , �f�[�^�x�[�X�m��
'******************************************************************************
Private Sub Form_Activate()
 Dim i As Long

    If blnInit_Flg = True Then     '�����t���O = �I���̏ꍇ
    
        '�X�e�[�^�X�o�[���b�Z�[�W
        stbSystem.Panels.Item(1).Text = "�������D�D�D"

        Screen.MousePointer = vbHourglass
        Me.Enabled = False

        DoEvents

        '���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�Ј��Z���䒠 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            Unload Me
        End If

        '���f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�Ј��Z���䒠 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            Unload Me
        End If

        '���g�����U�N�V�����̊J�n
        objSession.BeginTrans

        '�����������pSP�ďo(�V�X�e�����t)
        Call gsubSPInit

        Call gsubSpdClear(sprList)

        '�o�^�A�C���A�폜�{�^������������
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False

        '�X�e�[�^�X�o�[���b�Z�[�W����
        Me.Enabled = True
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        blnInit_Flg = False           '�����t���O = �I�t

        '�r������
        Call gsubUnLock
        
        blnNoChangeEvFlg = False


    End If

End Sub
'******************************************************************************
'*    FORM_KEYDOWN �t�@���N�V�����L�[�ݒ�
'******************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    Select Case KeyCode
        Case vbKeyReturn   'Enter
            SendKeys "{TAB}"
        Case vbKeyF1       'F1
            Call cmdPFK_Click(1)
        Case vbKeyF2       'F2
            Call cmdPFK_Click(2)
        Case vbKeyF5       'F5
            If cmdPFK(5).Enabled = True Then
                Call cmdPFK_Click(5)
            End If
        Case vbKeyF10      'F10
            Call cmdPFK_Click(10)
        Case vbKeyF12      'F12
            Call cmdPFK_Click(12)
        Case vbKeyDelete   'DEL�L�[����������
            Call Form_KeyPress(46)
    End Select
    
'    If gblnHaitaFlg = True Then
'        frmQPAV_CEnt080!lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
'    End If
    
End Sub
'******************************************************************************
'*    FORM_KEYPRESS �����
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ENTER Beep������
    Call subHantenKaijo

    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
        
End Sub
'******************************************************************************
'*    �t�@���N�V�����L�[�N���b�N����
'******************************************************************************
Private Sub cmdPFK_Click(Index As Integer)

    '�װү���ޏ���
    lblMsg.Caption = ""

    Select Case Index
        Case 1     '���j���[
            Unload Me
            Exit Sub
        Case 2     '�n�[�h�R�s�[
            Call gsubQSAV_ActX1001
            picMsg.Refresh
        Case 5     '���s
            Call subPFK5
        Case 10    '�O���
            Unload Me
            Exit Sub
        Case 12    '���
            Call subCancel
    End Select

    If gblnHaitaFlg = True Then
'        frmQPAV_CEnt080!lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")  '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
        frmQPAV_CEnt080.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
    End If
    
End Sub
'******************************************************************************
'*    F5�u���s�v����
'******************************************************************************
Private Sub subPFK5()

    '���گ�޸ر & �Ј������ر
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    '���گ�޸ر
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True     '����
    cmdPFK(5).Enabled = True     'F5���s
    cmdSyori(0).Enabled = False  '�o�^
    cmdSyori(1).Enabled = False  '�C��
    cmdSyori(2).Enabled = False  '�폜
    txtSyainCd(0).Enabled = True '�Ј��R�[�h1
    txtSyainCd(1).Enabled = True '�Ј��R�[�h7
    
    '�ð���ް������
    Call gsubInitStatusBar(stbSystem)
    '�����̓`�F�b�N
    If fncblnNyuuryokuChk = False Then
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False
        
        gblnHaitaFlg = False
        Exit Sub
    End If
    
    '���r������
    Call gsubUnLock

    '���r������
    gstrKeyInfo1 = gstrSyainCd1
    gstrKeyInfo2 = gstrSyainCd2
    
    If gblnHaita = False Then
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False
'        txtSyainCd(0).SetFocus
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        Call gsubSpdClear(Me.sprList)
        Exit Sub
    End If
    
    '���e�\�����ڃN���A
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    Call gsubSpdClear(sprList)
    
    '���Ј������擾SP�ďo
    If fncblnSyainDat = False Then Exit Sub
    
    txtSyainCd(0).Enabled = False
    txtSyainCd(1).Enabled = False
    cmdNayose.Enabled = False
           
    '���ݕt�f�[�^�擾SP�ďo
    If fncblnKasituke = False Then Exit Sub
    
    '�e�R���g���[���L����
    cmdSyori(0).Enabled = True
    cmdSyori(1).Enabled = True
    cmdSyori(2).Enabled = True
    
End Sub
'******************************************************************************
'*    F7�u�O�Łv����
'******************************************************************************
Private Sub subPFK7()

    'Msg = �O�y�[�W�͂���܂���
    If sprList.DataRowCnt = 0 Or sprList.ActiveRow = 1 Then
        lblMsg.Caption = "WHOE09 " & gstrGetCodeMeisyo(odbDatabase, "E09", "WHO")
        Exit Sub
    End If
    sprList.SetFocus
    SendKeys "{PGUP}"
    
End Sub
'******************************************************************************
'*    F8�u���Łv����
'******************************************************************************
Private Sub subPFK8()

    'Msg = ���y�[�W�͂���܂���
    If sprList.DataRowCnt = 0 Or sprList.DataRowCnt = sprList.ActiveRow Or _
       sprList.DataRowCnt < sprList.MaxRows And sprList.MaxRows = sprList.ActiveRow Then
        lblMsg.Caption = "WHOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WHO")
        Exit Sub
    End If
    sprList.SetFocus
    SendKeys "{PGDN}"
    
End Sub
'******************************************************************************
'*    ��ʏ�����
'******************************************************************************
Private Sub subFormInitialize()
 
    '�e�\�����ڸر
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    '���گ�޸ر
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True     '����
    cmdPFK(5).Enabled = True     'F5���s
    cmdSyori(0).Enabled = False  '�o�^
    cmdSyori(1).Enabled = False  '�C��
    cmdSyori(2).Enabled = False  '�폜
    txtSyainCd(0).Enabled = True '�Ј��R�[�h1
    txtSyainCd(1).Enabled = True '�Ј��R�[�h7
    
    '�ð���ް������
    Call gsubInitStatusBar(stbSystem)
    
    gblnHaitaFlg = False
    
End Sub
'******************************************************************************
'*    �װү�����ޯ���\��
'******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�Ј��Z���䒠", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "YYYY-MM-DD HH:MM:SS"), _
              frmQPAV_CEnt080.Name, _
              strErrCode, _
              strErrMsg)

End Sub
'******************************************************************************
'*    ���񂹌����{�^��
'******************************************************************************
Private Sub cmdNayose_Click()
 Dim strSyainCd As String

    Me.Hide

''''    Me.Enabled = False
    
    Call subHantenKaijo

    '���񂹌�����ʕ\��
    frmQPAV_CEnt082.Show 1

''''    Me.Enabled = True

    Me.Show
        
    If gblnNayoseFlg = True Then
         Call cmdPFK_Click(5)
    End If
    
End Sub
'******************************************************************************
'*    �װ���ڂ� Backcolor �� ��߂�
'*    �װү���ނ�ر����
'******************************************************************************
Private Sub subHantenKaijo()
    '�G���[���b�Z�[�W�N���A
    lblMsg.Caption = ""
    
    '�G���[����Backcolor��߂�
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
End Sub
'******************************************************************************
'*    �����̂ݓ��͉ɂ���
'******************************************************************************
Private Sub txtSyainCD_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 0 Then
        Exit Sub ''''�Ј��R�[�h�P�͕��������͉\
    End If
    
    KeyAscii = gIntFilterKey(KeyAscii, cnsNumeric)
End Sub
'******************************************************************************
'*    �e�L�X�g�I��
'******************************************************************************
Private Sub txtSyainCD_GotFocus(Index As Integer)
    Call gsubSelectText(txtSyainCd(Index))
End Sub
'******************************************************************************
'*    �t�����E�o
'******************************************************************************
Private Sub txtSyainCD_Change(Index As Integer)
    If blnNoChangeEvFlg = True Then Exit Sub
    Select Case Index
    Case 0
        Call gsubMaxCharSkipEX(txtSyainCd(0), 1)
    End Select
End Sub
'******************************************************************************
'*    F12�u����v����
'******************************************************************************
Private Sub subCancel()

    '���r��������
    Call gsubUnLock
    
    '�e�\�����ڃN���A
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    
    Call subHantenKaijo
    
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True
    cmdSyori(0).Enabled = False
    cmdSyori(1).Enabled = False
    cmdSyori(2).Enabled = False
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    
    Call subInitScreen '��ʏ�����
    
    txtSyainCd(0).SetFocus

End Sub
'******************************************************************************
'*    ���̓`�F�b�N
'******************************************************************************
Private Function fncblnNyuuryokuChk()

fncblnNyuuryokuChk = False
    
    Call subHantenKaijo
    
    '���Ј��ԍ����̓`�F�b�N
    If Trim$(txtSyainCd(0).Text) = "" Then
        gstrSyainCd1 = " "
    Else
        gstrSyainCd1 = txtSyainCd(0).Text
    End If
    
    If Len(Trim$(txtSyainCd(1).Text)) = 7 Then
        gstrSyainCd2 = Trim$(txtSyainCd(1).Text)
    Else
        lblMsg.Caption = "���͂Ɍ�肪����܂��B"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    End If
    
fncblnNyuuryokuChk = True
    
End Function
'******************************************************************************
'*    �Ј��ݕt�ꗗ�f�[�^�擾 SP���s
'******************************************************************************
Private Function fncblnKasituke() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���

On Error GoTo errfncblnKasituke

    fncblnKasituke = False

    lngSpCnt = 0

    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '�Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
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
    '�����I���t���O
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '����f�[�^�z��
    odbDatabase.Parameters.AddTable "OtStrDatAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, 200    '100�s�E200��

    'SQL���쐬
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080GetList("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InNumMaxRec"
    strSQL = strSQL & ",:IoNumSpCnt"
    strSQL = strSQL & ",:OtNumRecCount"
    strSQL = strSQL & ",:OtNumAryCount"
    strSQL = strSQL & ",:OtStrEndFlg"
    strSQL = strSQL & ",:OtStrDatAry); END;"

    i = 1               '�ϐ��̃N���A
    lngSprStartCnt = 0
    lngSprEndCnt = 0

    sprList.ReDraw = False
    Do
        'SP���s
        odbDatabase.DbexecuteSQL (strSQL)
        
        If i = 1 Then
            '���Y���ް��L���m�F
            If odbDatabase.Parameters("OtNumAryCount") = 0 Then
                Call subSyainData(2)
                Call gsubParaRemove(odbDatabase)
                sprList.ReDraw = True
                Exit Function
            End If

            '���ꗗ�̍s���ݒ聡
            sprList.MaxRows = odbDatabase.Parameters("OtNumAryCount")
        End If

        '�ꗗ�̃f�[�^���e��ݒ肷��J�n�ʒu
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1

        '�ꗗ�̏I���ʒu
'        lngSprEndCnt = lngSprEndCnt + odbDatabase.Parameters("OtNumAryCount")      '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
        lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))  '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16

        '�ꗗ�\ ���ڃZ�b�g
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)

        i = i + 1

    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    sprList.ReDraw = True

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnKasituke = True

    Exit Function

errfncblnKasituke:
'�G���[����

    '�G���[���b�Z�[�W�\��
    
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    �Y���f�[�^������
'*    �����F 1 = �Ј�����, 2 = �ݕt�f�[�^
'******************************************************************************
Private Sub subSyainData(intData As Integer)

    Select Case intData

    Case 1 '�Ј�����

        '���񂹃{�^���̂ݕ\��
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False '�o�^
        cmdSyori(1).Enabled = False '�C��
        cmdSyori(2).Enabled = False '�폜

        '�G���[���b�Z�[�W�\��
        lblMsg.Caption = "���͂��ꂽ�Ј��R�[�h�͑��݂��܂���B"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        
        '�e�\�����ڃN���A
        lblShimeiKana.Caption = ""
        lblShimeiKanji.Caption = ""
        lblMiseCd.Caption = ""
        lblMiseName.Caption = ""
        lblTozai.Caption = ""
        lblBumonCd.Caption = ""
        lblBumonName.Caption = ""
        lblSikakuCd.Caption = ""
        lblKyuu.Caption = ""
        lblBirthday.Caption = ""
        
        txtSyainCd(0).SetFocus
    
    Case 2 '�ݕt�f�[�^
    
        '���񂹃{�^��,�o�^�{�^���\��
        cmdSyori(0).Enabled = True  '�o�^
        cmdSyori(1).Enabled = False '�C��
        cmdSyori(2).Enabled = False '�폜
    
        '���b�Z�[�W��\��
        lblMsg.Caption = "�ݕt�f�[�^�͂���܂���B"
                
        '�X�v���b�h�����
        Call gsubSpdClear(Me.sprList)

    End Select
      
End Sub
'******************************************************************************
'*    ������ʕҏW����
'******************************************************************************
Private Sub subInitScreen()

    Me.Enabled = False

    '�ð���ްү����
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents

    '���گ�޼�ĕی�
    sprList.Lock = True

    '�ð���ް�ݒ�
    Call gsubInitStatusBar(stbSystem)

    '̫�і��ݒ�
    If Me.Caption = "�Ј��Z���䒠" Then
        Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    End If

    '�ð���ްү���ޏ���
    stbSystem.Panels.Item(1).Text = ""
    lblMsg.Caption = ""

    gblnHaitaFlg = False
    
    Me.Enabled = True

    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    
End Sub
'******************************************************************************
'*    ���͂��ꂽ�Ј��R�[�h�ɑΉ�����l�ݕt���ꗗ��\��
'*    �����F �ꗗ�̊J�n�ʒu , �I���ʒu
'******************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    j = 0
    For i = lngStCnt To lngEdCnt

        strDetail = odbDatabase.Parameters("OtStrDatAry").Get_Value(j)
        j = j + 1
        
        '�Z����
        strWk = gfncstrDlm2(strDetail, 1)
        strWk = Trim$(strWk)
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        sprList.SetText 1, i, strWk
        
        '�Z�����
        strWk = gfncstrDlm2(strDetail, 14)
        strWk = Trim$(strWk)
        sprList.SetText 2, i, strWk
        
        '�_�񗘗�
        strWk = gfncstrDlm2(strDetail, 4)
        strWk = Trim$(Format$(strWk, "#.#0")) & "%"
        sprList.SetText 3, i, strWk
        
        '�ԍό���
        strWk = gfncstrDlm2(strDetail, 5)
        strWk = Trim$(strWk) & "����"
        sprList.SetText 4, i, strWk
        
        '���^�ԍϊz
        strWk = gfncstrDlm2(strDetail, 6)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 6, i, strWk
        
        '�ܗ^�ԍϊz
        strWk = gfncstrDlm2(strDetail, 8)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 7, i, strWk
               
        '���^�c��
        strWk = gfncstrDlm2(strDetail, 10)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 9, i, strWk

        '�ܗ^�c��
        strWk = gfncstrDlm2(strDetail, 11)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 10, i, strWk

        '�Z���z ( ���^�ԍϊz + �ܗ^�ԍϊz )
        Dim strKyuyoYusigaku As String '���^�Z���z
        Dim strSyoyoYusigaku As String '�ܗ^�Z���z
        Dim strYusigaku As String      '�Z���z
        
        strKyuyoYusigaku = gfncstrDlm2(strDetail, 6)
        strSyoyoYusigaku = gfncstrDlm2(strDetail, 8)
        strYusigaku = CLng(strKyuyoYusigaku) + CLng(strSyoyoYusigaku)
        strYusigaku = Format$(strYusigaku, "#,##0")
        sprList.SetText 5, i, strYusigaku
        
        '�c�� ( ���^�c�� + �ܗ^�c�� )
        Dim strKyuyoZandaka As String '���^�c��
        Dim strSyoyoZandaka As String '�ܗ^�c��
        Dim strZandaka As String      '�c��
        
        strKyuyoZandaka = gVarSpdGetText(sprList, 9, i)
        strSyoyoZandaka = gVarSpdGetText(sprList, 10, i)
        strZandaka = CLng(strKyuyoZandaka) + CLng(strSyoyoZandaka)
        strZandaka = Format$(strZandaka, "#,##0")
        sprList.SetText 8, i, strZandaka
                
    Next i
    
    Me.lblMsg.Caption = ""

End Sub
'******************************************************************************
'*    �Ј��f�[�^���Z�b�g
'******************************************************************************
Private Sub subSyainDsp()
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    strDetail = odbDatabase.Parameters("OtStrDatAry")
    
    '�Ј������J�i
    strWk = gfncstrDlm2(strDetail, 1)
    strWk = Trim$(strWk)
    lblShimeiKana.Caption = strWk
    
    '�Ј���������
    strWk = gfncstrDlm2(strDetail, 2)
    strWk = Trim$(strWk)
    lblShimeiKanji.Caption = strWk
    
    '�����X�R�[�h
    strWk = gfncstrDlm2(strDetail, 3)
    strWk = Trim$(strWk)
    lblMiseCd.Caption = strWk
    
    '�����敪(1 = ���A2 = ��)
    strWk = gfncstrDlm2(strDetail, 4)
    strWk = Trim$(strWk)
    If strWk = "1" Then
        lblTozai.Caption = "��"
    ElseIf strWk = "2" Then
        lblTozai.Caption = "��"
    Else
        lblTozai.Caption = ""
    End If
    
    '��������R�[�h
    strWk = gfncstrDlm2(strDetail, 5)
    strWk = Trim$(strWk)
    lblBumonCd.Caption = strWk
    
    '���i�R�[�h
    strWk = gfncstrDlm2(strDetail, 6)
    strWk = Trim$(strWk)
    lblSikakuCd.Caption = strWk
    
    '�����R�[�h
    strWk = gfncstrDlm2(strDetail, 7)
    strWk = Trim$(strWk)
    lblKyuu.Caption = strWk
    
    '���N����
    strWk = gfncstrDlm2(strDetail, 8)
    strWk = Trim$(strWk)
    If Trim(strWk) = "" Then
    Else
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        lblBirthday.Caption = strWk
    End If
    
    '�����X����
    strWk = gfncstrDlm2(strDetail, 12)
    strWk = Trim$(strWk)
    lblMiseName.Caption = strWk
    
    '�������喼��
    strWk = gfncstrDlm2(strDetail, 13)
    strWk = Trim$(strWk)
    lblBumonName.Caption = strWk
     
    '�ܗ^�x�����P
    gstrBonusMD1 = gfncstrDlm2(strDetail, 14)
    gstrBonusMD1 = Trim$(gstrBonusMD1)
    
    '�ܗ^�x�����Q
    gstrBonusMD2 = gfncstrDlm2(strDetail, 15)
    gstrBonusMD2 = Trim$(gstrBonusMD2)

    '�؏����x�z
    glngSyosyoGendogaku = CLng(gfncstrDlm2(strDetail, 16))
    glngSyosyoGendogaku = Trim$(glngSyosyoGendogaku)
       
End Sub
'******************************************************************************
'*    �Ј������擾 SP���s
'*    �ԋp�l�FBoolean (True=OK , False=NG)
'******************************************************************************
Private Function fncblnSyainDat() As Boolean
 Dim strSQL            As String

On Error GoTo errfncblnSyainDat

    fncblnSyainDat = False

    '���e���Ұ����
    '�Ј��ԍ��P
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '�Ј��ԍ��Q
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '���i�f�[�^�z��
    odbDatabase.Parameters.Add "OtStrDatAry", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR2

    '��SQL���쐬
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080SyainDat("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:OtStrDatAry); END;"

    '��SP���s
    odbDatabase.DbexecuteSQL (strSQL)

    'MOD 20090416 00807073/0803012 NBC.ishida start
    'If odbDatabase.Parameters("OtStrDatAry") = "" Then      '�Y���f�[�^�Ȃ�
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) = True Then
    'MOD 20090416 00807073/0803012 NBC.ishida end
        Call subSyainData(1)                                '�Y�����������ďo
        Call gsubParaRemove(odbDatabase)                    '�I�u�W�F�N�g�̊J��
        sprList.ReDraw = True
        Exit Function
    End If

    '���ꗗ�\ ���ڃZ�b�g
    Call subSyainDsp
    
    '�����x�z����
    If glngSyosyoGendogaku = 0 Then
''''�����ύX 2002/04/18        lblMsg.Caption = "���x�z���ݒ肳��Ă��Ȃ��ׁA�o�^�����͍s���܂���B"
        lblMsg.Caption = "�o�^�ł��܂���B�}�X�^�����e�i���X�̊m�F�����ĉ������B"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(0).SetFocus
        Exit Function
    End If

    '���I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnSyainDat = True

    Exit Function

errfncblnSyainDat:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    ���s����
'******************************************************************************
Private Sub subSyori(Index As Integer)

    '���ϐ��Ɋi�[
    gstrSyori = cmdSyori(Index).Caption    '������
    gstrSyainName = lblShimeiKanji.Caption '�Ј�����
    glngSprRow = sprList.ActiveRow         '�I���������گ�ނ̗�
    
    '���q��ʕ\��
    frmQPAV_CEnt081.Show 1
    
    '�����گ�ލĕ\��
    If gblnExecute = True Then
        '���گ�޸ر
        Call gsubSpdClear(sprList)
        If fncblnKasituke = False Then
            cmdSyori(1).Enabled = False
            cmdSyori(2).Enabled = False
            Exit Sub
        End If
        cmdSyori(0).Enabled = True
        cmdSyori(1).Enabled = True
        cmdSyori(2).Enabled = True
    End If
    
    Screen.MousePointer = vbNormal

End Sub
