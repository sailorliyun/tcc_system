VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt160 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�T�����~����"
   ClientHeight    =   9435
   ClientLeft      =   180
   ClientTop       =   1095
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
   ScaleHeight     =   9435
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.OptionButton optKoujo 
      Caption         =   "�T�����Ȃ�"
      Height          =   825
      Index           =   0
      Left            =   5400
      Style           =   1  '���̨���
      TabIndex        =   4
      Top             =   6360
      Width           =   1545
   End
   Begin VB.OptionButton optKoujo 
      Caption         =   "�T������"
      Height          =   825
      Index           =   1
      Left            =   7140
      Style           =   1  '���̨���
      TabIndex        =   5
      Top             =   6360
      Value           =   -1  'True
      Width           =   1545
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "�X�V"
      Height          =   495
      Left            =   150
      TabIndex        =   6
      Top             =   7440
      Width           =   1065
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   120
      TabIndex        =   23
      Top             =   30
      Width           =   14190
      Begin VB.TextBox txtSyainCD1 
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
         IMEMode         =   3  '�̌Œ�
         Left            =   1950
         MaxLength       =   1
         TabIndex        =   0
         Top             =   300
         Width           =   285
      End
      Begin VB.CommandButton cmdNayose 
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   3390
         TabIndex        =   2
         Top             =   270
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCD2 
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
         IMEMode         =   3  '�̌Œ�
         Left            =   2280
         MaxLength       =   7
         TabIndex        =   1
         Top             =   300
         Width           =   1005
      End
      Begin VB.Label Label1 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���i"
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
         Index           =   1
         Left            =   10650
         TabIndex        =   42
         Top             =   300
         Width           =   360
      End
      Begin VB.Label Label1 
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
         Index           =   2
         Left            =   10800
         TabIndex        =   41
         Top             =   630
         Width           =   180
      End
      Begin VB.Label Label1 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���N����"
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
         Index           =   3
         Left            =   10320
         TabIndex        =   40
         Top             =   990
         Width           =   720
      End
      Begin VB.Label lblShikaku 
         Caption         =   "010"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11250
         TabIndex        =   39
         Top             =   300
         Width           =   795
      End
      Begin VB.Label lblKyu 
         Caption         =   "010"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11250
         TabIndex        =   38
         Top             =   630
         Width           =   795
      End
      Begin VB.Label lblSeinengappi 
         Caption         =   "010"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11250
         TabIndex        =   37
         Top             =   960
         Width           =   2775
      End
      Begin VB.Label lblBumon 
         Caption         =   "������������������������"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   1
         Left            =   7350
         TabIndex        =   36
         Top             =   990
         Width           =   2385
      End
      Begin VB.Label lblBumon 
         Caption         =   "999999"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   0
         Left            =   6660
         TabIndex        =   35
         Top             =   990
         Width           =   585
      End
      Begin VB.Label Label15 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��������"
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
         Left            =   5670
         TabIndex        =   34
         Top             =   1020
         Width           =   720
      End
      Begin VB.Label lblTozai 
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Left            =   6660
         TabIndex        =   33
         Top             =   660
         Width           =   405
      End
      Begin VB.Label Label13 
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
         Left            =   5670
         TabIndex        =   32
         Top             =   660
         Width           =   720
      End
      Begin VB.Label lblShozoku 
         Caption         =   "������������������������"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   1
         Left            =   7380
         TabIndex        =   31
         Top             =   300
         Width           =   2775
      End
      Begin VB.Label lblShozoku 
         Caption         =   "010"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   0
         Left            =   6660
         TabIndex        =   30
         Top             =   300
         Width           =   315
      End
      Begin VB.Label Label4 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�����X"
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
         Index           =   1
         Left            =   5820
         TabIndex        =   29
         Top             =   300
         Width           =   540
      End
      Begin VB.Label lblShimei 
         Caption         =   "�����������@����������"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Left            =   1950
         TabIndex        =   28
         Top             =   990
         Width           =   2235
      End
      Begin VB.Label lblKana 
         Caption         =   "��������������������"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Left            =   1980
         TabIndex        =   27
         Top             =   720
         Width           =   2235
      End
      Begin VB.Label Label1 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�Ј�����"
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
         Index           =   4
         Left            =   1080
         TabIndex        =   26
         Top             =   870
         Width           =   720
      End
      Begin VB.Label Label1 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�Ј��R�[�h"
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
         Index           =   0
         Left            =   1050
         TabIndex        =   24
         Top             =   360
         Width           =   810
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   8475
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
         TabIndex        =   7
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
         TabIndex        =   8
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
         TabIndex        =   12
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
         TabIndex        =   13
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
         Index           =   6
         Left            =   6015
         TabIndex        =   14
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   17
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
         Index           =   11
         Left            =   11955
         TabIndex        =   18
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
         TabIndex        =   11
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
      Left            =   45
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7995
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
         TabIndex        =   21
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   19
      Top             =   9060
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
            TextSave        =   "2005/06/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "14:06"
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
   Begin VB.Frame Frame2 
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
      Height          =   4770
      Left            =   120
      TabIndex        =   25
      Top             =   1380
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1980
         TabIndex        =   3
         Top             =   420
         Width           =   10725
         _Version        =   196608
         _ExtentX        =   18918
         _ExtentY        =   6376
         _StockProps     =   64
         MaxCols         =   9
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt160.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  '�ׯ�
      BackColor       =   &H80000004&
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   43
      Top             =   6120
      Width           =   14175
   End
End
Attribute VB_Name = "frmQPAV_CEnt160"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg         As Boolean           '�����t���O

Private mlngKensuu           As Long     '���׌���

'���W���[���ϐ��ɐݒ�
Private mlngKyuyoHensai     As Long
Private mlngSyoyoHensai     As Long
Private mlngZanHensai       As Long
Private mStrKojoCyushiFlg   As String

Private mlngTyushiFlg       As Long     'Added by imz.Yoshida 2005/06/16 �T�����~�Ή�


Private Sub cmdExec_Click()
    
    If MsgBox("�T�����~�����X�V���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�T�����~����") = vbCancel Then
        Exit Sub
    End If
    
    '�T�����~�L���X�V
    If blnUpdKoujyo = False Then
        Exit Sub
    End If

    '��ʏ�����
    Call subFormInitialize
    
    txtSyainCD1.SetFocus

End Sub

Private Sub cmdNayose_Click()
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCD1 = Left(gstrDat, 1)
        txtSyainCD2 = Right(gstrDat, 7)
        Call cmdPFK_Click(5)
    End If
End Sub

'**************************************************************************************************
'*Form���[�h
'**************************************************************************************************
Private Sub Form_Load()
    blnInit_Flg = True             '�����t���O
    
    Me.Caption = "�T�����~���� (" & gstrCommandLine(8) & ")"
    
    '��ʏ�����
    Call subFormInitialize

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
    '�r������
    Call gblnHaita_Unlock
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt160 = Nothing

End Sub

'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()
    Dim i As Integer

    If blnInit_Flg = True Then '�����t���O=�I���̏ꍇ
        '�X�e�[�^�X�o�[���b�Z�[�W
        stbSystem.Panels.Item(1).Text = "�������D�D�D"
        Screen.MousePointer = vbHourglass
        Me.Enabled = False
        
        DoEvents

        '�Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�T�����~���� (" & gstrCommandLine(8) & ")" _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If

        '�f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�T�����~���� (" & gstrCommandLine(8) & ")" _
                                    , objSession.LastServerErr, objSession.LastServerErrText)
            '�I��
            Unload Me
        End If

        Me.Enabled = True
        Screen.MousePointer = vbDefault

        '�X�e�[�^�X�o�[���b�Z�[�W����
        stbSystem.Panels.Item(1).Text = ""

        blnInit_Flg = False   '�����t���O=�I�t
        
    End If
    
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

'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
        Case 2  '�n�[�h�R�s�[
            Call gsubQSAV_ActX1001
        Case 5  '���s
            Call subCmdJikkou
        Case 10 '�O���
            Unload Me
        Case 12 '���
            '�r������
            Call gblnHaita_Unlock
            Call subFormInitialize
            txtSyainCD1.SetFocus
    End Select
    
End Sub

'***********************************************************************************************************
'*��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
 Dim intX As Integer
 
    Call subErrKaijo
    
    '�e�\�����ڃN���A
    txtSyainCD1.Text = ""
    txtSyainCD2.Text = ""
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblShozoku(0).Caption = ""
    lblShozoku(1).Caption = ""
    lblTozai.Caption = ""
    lblBumon(0).Caption = ""
    lblBumon(1).Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    optKoujo(1).Value = True
    cmdNayose.Enabled = True
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    '�e�R���g���[������
    cmdPFK(5).Enabled = True
    optKoujo(0).Enabled = False
    optKoujo(1).Enabled = False
    cmdExec.Enabled = False
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True

    mlngTyushiFlg = 0   'Added by imz.Yoshida 2005/06/16 �T�����~�Ή�
    
End Sub

'*************************************************************************************************
'*      ���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String

    '�r������
    Call gblnHaita_Unlock
    
    Call subErrKaijo
    
    '���̫������ċ����I�Ɋe���۰ق�Lost_Focus������
    cmdPFK(5).SetFocus
    
    '�ꗗ���\�������܂Ŏ��s����,���񂹂��g�p�s�E�}�E�X�|�C���^�[(�����v)
    cmdPFK(5).Enabled = False
    cmdNayose.Enabled = False
    Screen.MousePointer = vbHourglass
''    Call subFormInitialize
    
    mlngKyuyoHensai = 0
    mlngSyoyoHensai = 0
    mlngZanHensai = 0
    mStrKojoCyushiFlg = ""
    
    '�X�e�[�^�X�o�[���b�Z�[�W
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents

    If Trim(txtSyainCD1.Text) = "" Then
        gstrSyainCD1 = Space(1)
    Else
        gstrSyainCD1 = Trim$(txtSyainCD1)
    End If
    gstrSyainCD2 = Trim$(txtSyainCD2)

    '�����͂��ꂽ�Ј��R�[�h�`�F�b�N�i�����́A���͌����`�F�b�N�j
    If blnJoukenH = False Then
        cmdPFK(5).Enabled = True
        txtSyainCD2.SetFocus
        cmdNayose.Enabled = True
        Screen.MousePointer = vbDefault
        '�X�e�[�^�X�o�[���b�Z�[�W����
        stbSystem.Panels.Item(1).Text = ""
        Exit Sub
    End If
    
    '�r������
    If gblnHaita_Lock = False Then
        cmdPFK(5).Enabled = True
        txtSyainCD2.SetFocus
        cmdNayose.Enabled = True
        Screen.MousePointer = vbDefault
        '�X�e�[�^�X�o�[���b�Z�[�W����
        stbSystem.Panels.Item(1).Text = ""
        Exit Sub
    End If
    
    '�r�o�p�ϐ��Ɋi�[
    
    '�������������Ј������@���o �� �\��
    ''�Ј��l���璊�o
    If blnSeachSyain = False Then
        'Msg = �Ј����������݂��܂���B
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        Call gsubParaRemove(odbDatabase) '�p�����[�^���
        Me.Enabled = True
        cmdPFK(5).Enabled = True
        cmdNayose.Enabled = True
        txtSyainCD1.SetFocus
        txtSyainCD1.BackColor = vbRed
        txtSyainCD2.BackColor = vbRed
        Screen.MousePointer = vbDefault
        '�X�e�[�^�X�o�[���b�Z�[�W����
        stbSystem.Panels.Item(1).Text = ""
        
        '�r������
        Call gblnHaita_Unlock
        
        Exit Sub
    End If
    
    Call gsubSpdClear(sprList)
    
    '������
    mlngKensuu = 0
    
    sprList.ReDraw = False
    
    ''�����Z���䒠�e�[�u�����璊�o
    If blnGetKogutiInf Then
        Call subSprKoguti
    End If
    
    ''�Ј��Z���䒠�e�[�u�����璊�o
    If blnGetSyainYuInf Then
        Call subSprSyainYu
    End If
    sprList.ReDraw = True
    
    '�e�R���g���[������
    Me.Enabled = True
    
    '�Y�������`�F�b�N
    If mlngKensuu = 0 Then
        cmdPFK(5).Enabled = True
        cmdNayose.Enabled = True
    Else
        optKoujo(0).Enabled = True
        optKoujo(1).Enabled = True
        'Modified by imz.Yoshida 2005/06/16 �T�����~�Ή� ==>
        'If mStrKojoCyushiFlg = "1" Then
        If mStrKojoCyushiFlg = "1" Or mlngTyushiFlg <> 0 Then
        'Modified by imz.Yoshida 2005/06/16 �T�����~�Ή� <==
            optKoujo(0).Value = True
        Else
            optKoujo(1).Value = True
        End If
        txtSyainCD1.Enabled = False
        txtSyainCD2.Enabled = False
        cmdExec.Enabled = True
        sprList.SetFocus
    End If
    
    
'�� ''���͎E���Ă���    cmdOsori.Enabled = True
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""

End Sub

'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�T�����~����", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt160.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCD1.BackColor = vbWhite
    txtSyainCD2.BackColor = vbWhite
End Sub

'********************************************************************************
'   ���͂��ꂽ�Ј��R�[�h���K�؂��ǂ������f����
'********************************************************************************
Private Function blnJoukenH() As Boolean

    blnJoukenH = False
        
    '*****�Ј��R�[�h*****
    '���͌� Check
    If Len(gstrSyainCD2) = 0 Then
        Enabled = True
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCD2.BackColor = vbRed
        txtSyainCD2.SetFocus
        Exit Function
    End If
 
    blnJoukenH = True
    
End Function

'*********************************************************************************************
'*�@�@�葱�����F�@�Ј������擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�Ј������擾�r�o���g�p���A�Ј����������擾����
'*********************************************************************************************
Private Function blnSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errSeachSyain

    blnSeachSyain = False
    
    '�Ј������擾 �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT    '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT    '�Ј��R�[�h�Q
                
        '�����J�i
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '��������
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '�����X�R�[�h
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '�����X��
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '�����敪
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '��������R�[�h
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '�������喼
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '���i�R�[�h
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '�����R�[�h
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '���N����
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
    
    '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '��ʂɕ\��
    lblKana.Caption = Trim$(odbDatabase.Parameters("OtStrSimeiKana").Value)         '�����J�i
    lblShimei.Caption = Trim$(odbDatabase.Parameters("OtStrSimeiKanji").Value)      '��������
    lblShozoku(0).Caption = Trim$(odbDatabase.Parameters("OtStrMiseCD").Value)      '�����X�R�[�h
    lblShozoku(1).Caption = Trim$(odbDatabase.Parameters("OtStrMiseName").Value)    '�����X��
    lblTozai.Caption = Trim$(odbDatabase.Parameters("OtStrTozaiKBN").Value)         '�����敪
    lblBumon(0).Caption = Trim$(odbDatabase.Parameters("OtStrBumonCD").Value)       '��������R�[�h
    lblBumon(1).Caption = Trim$(odbDatabase.Parameters("OtStrBumonName").Value)     '�������喼
    lblShikaku.Caption = Trim$(odbDatabase.Parameters("OtStrSikakuCD").Value)       '���i�R�[�h
    lblKyu.Caption = Trim$(odbDatabase.Parameters("OtStrTokyuCD").Value)            '�����R�[�h
    '���N�����ҏW
    strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '���N����
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        lblSeinengappi.Caption = ""
    Else
        lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
    End If

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    blnSeachSyain = True

    Exit Function
    
errSeachSyain:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'*********************************************************************************************
'*�@�@�葱�����F�@�����ԍϊz���擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�����ԍϊz���擾�r�o���g�p���A�����ԍϊz�����擾����
'*********************************************************************************************
Private Function blnGetKogutiInf() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errGetKogutiInf

    blnGetKogutiInf = False
    
    '�����ԍϊz��� �擾 �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '�Ј��R�[�h�Q
                
    '���^�ԍϊz
    odbDatabase.Parameters.Add "OtNumKyuyoHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumKyuyoHensai").ServerType = ORATYPE_NUMBER
    '�ܗ^�ԍϊz
    odbDatabase.Parameters.Add "OtNumSyoyoHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumSyoyoHensai").ServerType = ORATYPE_NUMBER
    '�ԍώc���z
    odbDatabase.Parameters.Add "OtNumZanHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZanHensai").ServerType = ORATYPE_NUMBER
    '�T�����~Flg
    odbDatabase.Parameters.Add "OtStrKojoCyushiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKojoCyushiFlg").ServerType = ORATYPE_VARCHAR2
    
    '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160GetKogutiInf(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtNumKyuyoHensai, " & _
             ":OtNumSyoyoHensai, " & _
             ":OtNumZanHensai, " & _
             ":OtStrKojoCyushiFlg, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '���W���[���ϐ��ɐݒ�
    mlngKyuyoHensai = odbDatabase.Parameters("OtNumKyuyoHensai").Value
    mlngSyoyoHensai = odbDatabase.Parameters("OtNumSyoyoHensai").Value
    mlngZanHensai = odbDatabase.Parameters("OtNumZanHensai").Value
    mStrKojoCyushiFlg = Trim(odbDatabase.Parameters("OtStrKojoCyushiFlg").Value)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    blnGetKogutiInf = True

    Exit Function
    
errGetKogutiInf:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    �����Z���䒠TBL�擾�����X�v���b�g�ɐݒ�
'***********************************************************************************
Private Sub subSprKoguti()
 Dim StrValue      As String '���ڒl������

    '������
    mlngKensuu = 1

    With sprList
        
        .MaxRows = 1
        
        '���
        .SetText 1, 1, "����"
        '�Z����
        '�ԍό���
        '�Z���z
        '���^�ԍϊz
        StrValue = Format$(CDbl(mlngKyuyoHensai), "#,##0")
        .SetText 5, 1, StrValue
        '�ܗ^�ԍϊz
        StrValue = Format$(CDbl(mlngSyoyoHensai), "#,##0")
        .SetText 6, 1, StrValue
        '�c��
        StrValue = Format$(CDbl(mlngZanHensai), "#,##0")
        .SetText 7, 1, StrValue
    End With

End Sub
'*********************************************************************************************
'*�@�@�葱�����F�@�Ј��Z�����擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�Ј��Z���䒠TBL���A�؏����׏����擾����
'*********************************************************************************************
Private Function blnGetSyainYuInf()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30


On Error GoTo errGetSyainYuInf
    
    blnGetSyainYuInf = False

    '�Ј������擾 �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '�Ј��R�[�h�Q
    
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_CHAR
    '��������(IoNumFetchCount
    odbDatabase.Parameters.Add "IoNumFetchCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumFetchCount").ServerType = ORATYPE_NUMBER
    '����������(IoNumRecCount
    odbDatabase.Parameters.Add "IoNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumRecCount").ServerType = ORATYPE_NUMBER
    '�z��i�[����
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    
    '�؏����� �z��
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtstrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2

    '�r�p�k���쐬
    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160GetSyouMeisaiInf(" & _
    ":InStrPRMSyainCD1," & _
    ":InStrPRMSyainCD2," & _
    ":InNumMaxRec," & _
    ":IoNumFetchCount," & _
    ":IoNumRecCount," & _
    ":OtNumAryCount," & _
    ":OtStrDataAry," & _
    ":OtstrEndFlg); END;"

    '���o���R�[�h�����X�g�ɕ\��
    lngRecCount = 0               '�ϐ��̃N���A
    lngFirstCnt = 1               '�ϐ��̃N���A
    i = 1

    Do
        lngFirstCnt = (i - 1) * cnsMaxRec + 1        '���گ�ނ̊J�n�s�̐ݒ�
        
        '�r�o�̎��s
        odbDatabase.DbexecuteSQL (strSQL)
        
        '���o������\������
        If i = 1 Then
            'ð��ٌ����p
            Erase gDataAry
            glngTblCnt = 0

            '���o������0���̏ꍇ�̓{�^���g�p�s��
            If odbDatabase.Parameters("IoNumRecCount") = 0 Then
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
            '�z��̍Ē�`
            lngMax = odbDatabase.Parameters("IoNumRecCount")
            glngTblCnt = lngMax
            ReDim gDataAry(lngMax)
        End If
        
        '�ŏI�̐ݒ�
'        lngRecCount = lngRecCount + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/23
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/23
        
        For j = lngFirstCnt To lngRecCount
            '�؏����׃f�[�^
            gDataAry(j) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '�I���t���O���P�܂�
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    blnGetSyainYuInf = True

    Exit Function

errGetSyainYuInf:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    �Ј��Z���䒠TBL�擾�����X�v���b�g�ɐݒ�
'***********************************************************************************
Private Sub subSprSyainYu()
 Dim i, j          As Long   '
 Dim StrValue      As String '���ڒl������
 Dim StrDate       As String '���ڒl������
 Dim lngKogKensuu  As Long   '�����Z���䒠����
 Dim lngSyaKensuu  As Long   '�Ј��Z���䒠����
 
 Dim dblKyuZan      As Double
 Dim dblSyoZan      As Double

    '������
    lngKogKensuu = mlngKensuu
    lngSyaKensuu = UBound(gDataAry())
    mlngKensuu = lngKogKensuu + lngSyaKensuu

    With sprList
        '���گ�޼�Ă�MaxRow��ݒ�(max17����������ݒ肷��)
'        If mlngKensuu > 17 Then
            .MaxRows = mlngKensuu
'        End If
        
        '1��̌���
        For i = 1 To lngSyaKensuu
                   
            '�؏����ׂP���R�[�h
            StrDate = gDataAry(i)
            
            j = i + lngKogKensuu
        
            '�ȉ��ꗗ�\���p
            '���
            .SetText 1, j, "�؏�"
            '�Z����
            StrValue = Trim$(gfncstrDlm2(StrDate, 1))
            StrValue = Mid$(StrValue, 1, 4) & "/" & Mid$(StrValue, 5, 2) & "/" & Mid$(StrValue, 7, 2)
            .SetText 2, j, StrValue
            '�ԍό���
            StrValue = Trim$(gfncstrDlm2(StrDate, 5))
            StrValue = Format$(CDbl(StrValue), "#0") + "����"
            .SetText 3, j, StrValue
            '�Z���z
            StrValue = Trim$(gfncstrDlm2(StrDate, 2))
            StrValue = Format$(CDbl(Trim$(gfncstrDlm2(StrDate, 6))) _
                             + CDbl(Trim$(gfncstrDlm2(StrDate, 8))), "#,##0")
            .SetText 4, j, StrValue
            '���^�ԍϊz
            StrValue = Trim$(gfncstrDlm2(StrDate, 6))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 5, j, StrValue
            '�ܗ^�ԍϊz
            StrValue = Trim$(gfncstrDlm2(StrDate, 8))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 6, j, StrValue
            
            If IsNull(gfncstrDlm2(StrDate, 13)) Or Trim(gfncstrDlm2(StrDate, 13)) = "" Then
                '���^�c��
                StrValue = Trim$(gfncstrDlm2(StrDate, 10))
                dblKyuZan = CDbl(StrValue)
                StrValue = Format$(dblKyuZan, "#,##0")
                .SetText 8, j, StrValue
                '�ܗ^�c��
                StrValue = Trim$(gfncstrDlm2(StrDate, 11))
                dblSyoZan = CDbl(StrValue)
                StrValue = Format$(dblSyoZan, "#,##0")
                .SetText 9, j, StrValue
                '�c��
                StrValue = Format$(dblKyuZan + dblSyoZan, "#,##0")
                .SetText 7, j, StrValue
            Else
                '�c��
                .SetText 7, j, "0"
                '���^�c��
                .SetText 8, j, "0"
                '�ܗ^�c��
                .SetText 9, j, "0"
            End If
            
            'Added by imz.Yoshida 2005/06/16 �T�����~�Ή� ==>
            If Trim$(gfncstrDlm2(StrDate, 12)) = "1" Then
                mlngTyushiFlg = mlngTyushiFlg + Trim$(gfncstrDlm2(StrDate, 12))
            End If
            'Added by imz.Yoshida 2005/06/16 �T�����~�Ή� <==
            .RowHeight(j) = 9.55
            
        Next i
        
    End With

End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@�T�����~�t���O�X�V
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c����  False�c���s
'*�@�@�@�\�T�v�F�@�����Z���䒠�A�Ј��Z���䒠TBL�̍T�����~�t���O���X�V����
'*********************************************************************************************
Private Function blnUpdKoujyo() As Boolean
    Dim strSQL      As String
    Dim strEdit     As String
    Dim strKoujyoFlg     As String
    
    
On Error GoTo errUpdKoujyo

    blnUpdKoujyo = False
    
    If optKoujo(0).Value = True Then
        strKoujyoFlg = "1"
    Else
        strKoujyoFlg = ""
    End If
    
    '�X�V �r�o
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '�Ј��R�[�h�Q
    '�T�����~Flg
    odbDatabase.Parameters.Add "InStrKojoCyusiFLG", strKoujyoFlg, ORAPARM_INPUT
    'DB�X�VFlg
    odbDatabase.Parameters.Add "OtUpdateFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtUpdateFlg").ServerType = ORATYPE_VARCHAR2
    
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         '���j���[ID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             '�v���O����ID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         '���[�UID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '�����R�[�h
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ�

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160UpdKoujyo(" & _
             ":InStrPRMSyainCD1," & _
             ":InStrPRMSyainCD2," & _
             ":InStrKojoCyusiFLG," & _
             ":OtUpdateFlg," & _
             ":InstrMenuID," & _
             ":InstrModuleID," & _
             ":InstrUserID," & _
             ":InstrComputerNM," & _
             ":InstrTozaiKBN," & _
             ":InstrBushoCD," & _
             ":InstrTantoNM" & _
             "); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�X�V���s
    If odbDatabase.Parameters("OtUpdateFlg") <> "0" Then
        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
        Exit Function
    End If

    '�X�V����

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    blnUpdKoujyo = True

    Exit Function
    
errUpdKoujyo:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSyainCd1_Change()

    If LenB(StrConv(txtSyainCD1.Text, vbFromUnicode)) = 1 Then
        txtSyainCD1.BackColor = vbWhite
        txtSyainCD2.SetFocus
    End If
    
End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyainCD1_GotFocus()
    Call gsubSelectText(txtSyainCD1)
End Sub
Private Sub txtSyainCD2_GotFocus()
    Call gsubSelectText(txtSyainCD2)
End Sub
'******************************************
'*�Ј��R�[�h���͕�������i�����̂݁j
'******************************************
Private Sub txtSyainCD2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

