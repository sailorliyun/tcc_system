VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt310 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�����ݕt�f�[�^�o�^"
   ClientHeight    =   9255
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
   ScaleHeight     =   9255
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   6360
      Left            =   90
      TabIndex        =   21
      Top             =   1380
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   5205
         Left            =   2880
         TabIndex        =   1
         Top             =   360
         Width           =   8655
         _Version        =   196608
         _ExtentX        =   15266
         _ExtentY        =   9181
         _StockProps     =   64
         MaxCols         =   6
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt310.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   1455
         Top             =   5745
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�폜"
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
         Left            =   8340
         TabIndex        =   40
         Top             =   5760
         Width           =   1305
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�o�^"
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
         Index           =   0
         Left            =   4920
         TabIndex        =   39
         Top             =   5760
         Width           =   1305
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   105
      TabIndex        =   18
      Tag             =   "5555555"
      Top             =   0
      Width           =   14175
      Begin VB.CommandButton cmdName 
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
         Left            =   3630
         TabIndex        =   24
         Top             =   270
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCD 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  '�̌Œ�
         Left            =   2355
         MaxLength       =   7
         TabIndex        =   0
         Top             =   300
         Width           =   975
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
         Height          =   210
         Left            =   6060
         TabIndex        =   38
         Top             =   270
         Width           =   540
      End
      Begin VB.Label lblTenCd 
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
         Height          =   285
         Left            =   6840
         TabIndex        =   37
         Top             =   270
         Width           =   795
      End
      Begin VB.Label lblTenNm 
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
         Height          =   285
         Left            =   7680
         TabIndex        =   36
         Top             =   270
         Width           =   2775
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
         Left            =   5880
         TabIndex        =   35
         Top             =   630
         Width           =   720
      End
      Begin VB.Label lblTozai 
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
         Height          =   285
         Left            =   6810
         TabIndex        =   34
         Top             =   630
         Width           =   795
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
         Left            =   5880
         TabIndex        =   33
         Top             =   990
         Width           =   720
      End
      Begin VB.Label lblBumonCd 
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
         Left            =   6810
         TabIndex        =   32
         Top             =   960
         Width           =   795
      End
      Begin VB.Label lblBumonNm 
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
         Height          =   285
         Left            =   7650
         TabIndex        =   31
         Top             =   960
         Width           =   2775
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
         Left            =   10860
         TabIndex        =   30
         Top             =   270
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
         Left            =   11010
         TabIndex        =   29
         Top             =   600
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
         Left            =   10530
         TabIndex        =   28
         Top             =   960
         Width           =   720
      End
      Begin VB.Label lblShikaku 
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
         Left            =   11460
         TabIndex        =   27
         Top             =   270
         Width           =   795
      End
      Begin VB.Label lblKyu 
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
         Left            =   11460
         TabIndex        =   26
         Top             =   600
         Width           =   795
      End
      Begin VB.Label lblSeinengappi 
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
         Left            =   11460
         TabIndex        =   25
         Top             =   930
         Width           =   1305
      End
      Begin VB.Label lblKanji 
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
         Height          =   180
         Left            =   2355
         TabIndex        =   23
         Top             =   1005
         Width           =   2670
      End
      Begin VB.Label lblFurigana 
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
         Height          =   180
         Left            =   2355
         TabIndex        =   22
         Top             =   750
         Width           =   2670
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   1695
         TabIndex        =   20
         Top             =   930
         Width           =   360
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   1320
         TabIndex        =   19
         Top             =   375
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   8295
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
         TabIndex        =   2
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
         TabIndex        =   3
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
         TabIndex        =   7
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
         TabIndex        =   8
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
         TabIndex        =   4
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
         TabIndex        =   9
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
         TabIndex        =   10
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
         TabIndex        =   11
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
         TabIndex        =   12
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
         TabIndex        =   5
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
         TabIndex        =   13
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
         TabIndex        =   6
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
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   7815
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
         TabIndex        =   16
         Top             =   60
         Width           =   12405
      End
   End
   Begin VB.PictureBox frmQPAV_CEnt060 
      Align           =   2  '������
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      ScaleHeight     =   315
      ScaleWidth      =   14325
      TabIndex        =   14
      Top             =   8880
      Width           =   14385
      Begin MSComctlLib.StatusBar stbSystem 
         Height          =   375
         Left            =   0
         TabIndex        =   41
         Top             =   0
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
               TextSave        =   "2006/04/06"
            EndProperty
            BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
               Style           =   5
               Alignment       =   1
               TextSave        =   "12:16"
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
End
Attribute VB_Name = "frmQPAV_CEnt310"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'**************************************************************************************************
'�{�^������
'**************************************************************************************************
Private Sub cmdExec_Click(Index As Integer)
    Dim blnRet              As Boolean          '�ԋp�l
    Dim lngRecCnt           As Long             '�ް���
    Dim intErrNo            As Integer          '�װ�ԍ�
    Dim strCheck            As String
    
    lblMsg.Caption = ""
    gblnDataSetFlg = False
    gintExecNo = Index
        
    Select Case Index
    Case 0      ' �o�^
            
        '�ϐ��ɑޔ�
        gstrCode = Trim(txtSyainCD.Text)
        gstrName = Trim(lblKanji.Caption)
        gstrYMD = ""
        gstrHMS = ""
        gstrKingaku = ""
            
        '*****�ސE�`�F�b�N
        If gtblSyainM.TaisyokuYMD = "" Then
        Else
            If CLng(DateDiff("d", CDate(gtblSyainM.TaisyokuYMD), gstrSysDate)) >= 0 Then
                If MsgBox("���̎Ј���" & gtblSyainM.TaisyokuYMD & "��" & vbCr & _
                                "�ސE���܂������A�����������s���Ă���낵���ł����H", _
                                    vbQuestion + vbOKCancel, "�����ݕt�f�[�^�o�^") = vbCancel Then
                    Exit Sub
                End If
            End If
        End If
        
        '*****�����Z���䒠T���݃`�F�b�N
        If gfuncDaicyoChk(lngRecCnt) = False Then Exit Sub
        If lngRecCnt = 0 Then
            If MsgBox("�����Z���䒠�e�[�u���ɓo�^����Ă��܂��񂪁A�����������s���Ă���낵���ł����H", _
                            vbQuestion + vbOKCancel, "�����ݕt�f�[�^�o�^") = vbCancel Then
                Exit Sub
            End If
        End If
        
    Case 1      ' �폜
        '*****�폜�Ώۃ`�F�b�N
        If gVarSpdGetText(sprList, 4, sprList.ActiveRow) = "��" Then
            '�ϐ��ɑޔ�
            gstrCode = Trim(txtSyainCD.Text)
            gstrName = Trim(lblKanji.Caption)
            gstrYMD = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 1, sprList.ActiveRow), "yyyymmdd")
            gstrHMS = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 2, sprList.ActiveRow), "hhmmss")
            gstrKingaku = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 3, sprList.ActiveRow), "0")
            
        Else
            'Msg = �ݕt���z���������Y���f�[�^��I�����Ă��������B
            lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
            Exit Sub
        End If
    
        '���t�͈̓`�F�b�N
        If DateCheckNo(gVarSpdGetText(sprList, 1, sprList.ActiveRow)) <> 0 Then
            'Msg = �ݕt���z���������Y���f�[�^��I�����Ă��������B
            lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
            Exit Sub
        End If
    
    End Select
    
    '��ʑJ��
    frmQPAV_CEnt311.Show vbModal
    
    '*****�X�V��ĕ\������
    If gblnDataSetFlg = True Then
       'SP���s
        blnRet = gfuncSPGet(lngRecCnt)
        Call funcSPSet
        If lngRecCnt = 0 Then
            cmdExec(1).Enabled = False
        Else
            cmdExec(1).Enabled = True
        End If
    End If

End Sub
'**************************************************************************************************
'���񂹃{�^������
'**************************************************************************************************
Private Sub cmdName_Click()
    
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCD = Right(gstrDat, 7)
        If Trim(Left(gstrDat, 1)) = "" Then
            Call cmdPFK_Click(5)
        Else
            'Msg = ���̎Ј��R�[�h�͏����Z���𗘗p�ł��܂���B
            lblMsg.Caption = "WPOE34 " & gstrGetCodeMeisyo(odbDatabase, "E34", "WPO")
            txtSyainCD.BackColor = vbRed
            txtSyainCD.SetFocus
        End If
    End If

End Sub
'**************************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'**************************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
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
            Call subCmdJikkou
        Case 10 '�O���
            Unload Me
        Case 12 '���
            Call subFormInitialize
            txtSyainCD.SetFocus
    End Select
    
End Sub
'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        '*****�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�����Z���ݕt�f�[�^�o�^ (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '*****�I���N���f�[�^�x�[�X�̊m��
'        If Not gblnConnectOracleDatabase("scott", "tiger", "") Then
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�����Z���ݕt�f�[�^�o�^ (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '*****�T�[�o�[�V�X�e�����t�擾
        If gfuncInit = False Then Exit Sub
        
        '*****��ʏ�����
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
    
    End If
            
    Me.Enabled = True
    MousePointer = vbDefault
    
    bInit_Flg = False          '���� FLG �I�t

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
'**************************************************************************************************
'*FORM_KEYPRESS
'**************************************************************************************************
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
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    Me.Caption = "�����Z���ݕt�f�[�^�o�^ (" & gstrCommandLine(8) & ")"
    
    '��ʏ�����
    bInit_Flg = True
    sprList.MaxRows = 0

End Sub
'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    Dim lngRecCnt As Long
    Dim flg As Boolean
    
    '*****�蓮����T�����`�F�b�N
    If gfuncKgcKasitukeTChk(lngRecCnt, 1) = False Then Exit Sub
        
    If lngRecCnt > 0 Then
        '*****���[���
        Call subPrintReport(crptToPrinter)
    End If

    '�r������
    Call gblnHaita_Unlock
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt310 = Nothing

End Sub

'**************************************************************************************************
'*�Ј��R�[�h�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtSyainCD_GotFocus()
    
    Call gsubSelectText(txtSyainCD)

End Sub

'**************************************************************************************************
'*�Ј��R�[�h���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtSyainCD_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub
'**************************************************************************************************
'*���s�{�^������
'**************************************************************************************************
Private Sub subCmdJikkou()
    Dim i           As Integer
    Dim lngRecCnt   As Long
    Dim intChkNo    As Integer
    
    Call subErrKaijo
    
    '�r������
    Call gblnHaita_Unlock
    
    cmdPFK(5).SetFocus
    
    If Trim$(txtSyainCD.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCD.BackColor = vbRed
        txtSyainCD.Enabled = True
        txtSyainCD.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
                
    '�ϐ��ɑޔ�
    gstrCode = txtSyainCD.Text
        
    '�r������
    If Not gblnHaita_Lock Then GoTo exit_subCmdJikkou

     If gfuncSeachSyain = False Then
        '�r������
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    Else
        If gtblSyainM.SonzaiFlg = "1" Then
            lblFurigana.Caption = gtblSyainM.SimeiKana                  '�l���J�i
            lblKanji.Caption = gtblSyainM.SimeiKanji                    '�l������
            lblTenCd.Caption = gtblSyainM.MiseCD                        '�X�R�[�h
            lblTenNm.Caption = gtblSyainM.MiseName                      '�X��
            lblTozai.Caption = gtblSyainM.TozaiKBN                      '�����敪
            lblBumonCd.Caption = gtblSyainM.BumonCD                     '����R�[�h
            lblBumonNm.Caption = gtblSyainM.BumonName                   '���喼
            lblShikaku.Caption = gtblSyainM.SikakuCD                    '���i�R�[�h
            lblKyu.Caption = gtblSyainM.TokyuCD                         '�����R�[�h
            lblSeinengappi.Caption = gtblSyainM.BornYMD                 '���N����
        Else
            'Msg = �Ј����������݂��܂���B
            lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
            txtSyainCD.SetFocus
            txtSyainCD.BackColor = vbRed
    
            '�r������
            Call gblnHaita_Unlock
            GoTo exit_subCmdJikkou
        End If
    End If
    
    '*****�ސE���t�`�F�b�N�i�ݕt�o�^���ԑO�ɑސE�����l���`�F�b�N�j
    If gtblSyainM.TaisyokuYMD <> "" Then
        intChkNo = DateCheckNo(gtblSyainM.TaisyokuYMD)
    End If
    '*****�ݕt�f�[�^�擾
    If gfuncSPGet(lngRecCnt) = False Then
    
        '�r������
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    
    Else
        ' �f�[�^���̏ꍇ�A���b�Z�[�W��\������
        If lngRecCnt = 0 Then
            If intChkNo = gintERR_DATE Then
                'Msg = �ސE���܂���
                lblMsg.Caption = "���̎Ј��͑ސE����Ă��܂�"
                cmdExec(0).Enabled = False
            Else
                'Msg = �Y���f�[�^�����݂��܂���B
                lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                cmdExec(0).Enabled = True
                cmdExec(0).SetFocus
            End If
            
            cmdExec(1).Enabled = False
        
        ' �f�[�^�L�̏ꍇ�A���b�Z�[�W��\������
        Else
            '*****�X�v���b�h�\��
            Call funcSPSet
            
            If intChkNo = gintERR_DATE Then
                'Msg = �ސE���܂���
                lblMsg.Caption = "���̎Ј��͑ސE���Ă��܂�"
                cmdExec(0).Enabled = False
                cmdExec(1).Enabled = False
            
            Else
                cmdExec(0).Enabled = True
                cmdExec(1).Enabled = True
                cmdExec(0).SetFocus
            End If
        End If
    End If
    
    '���͐��䏈��
    txtSyainCD.Enabled = False
    cmdName.Enabled = False
    cmdPFK(5).Enabled = False
               
exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
    
End Sub
'**************************************************************************************************
'*�G���[��������
'**************************************************************************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCD.BackColor = vbWhite

End Sub
'**************************************************************************************************
'*��ʏ�����
'**************************************************************************************************
Private Sub subFormInitialize()
    Dim i As Integer
    
    '�r������
    Call gblnHaita_Unlock
    
    '�e�\�����ڃN���A
    txtSyainCD.Text = ""
    txtSyainCD.BackColor = vbWhite
    txtSyainCD.Enabled = True
    cmdName.Enabled = True
    lblFurigana.Caption = ""
    lblKanji.Caption = ""
    lblTenCd.Caption = ""
    lblTenNm.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonNm.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        cmdExec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    
    '�X�v���b�h�N���A
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
     
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
End Sub
'**************************************************************************************************
'*�X�v���b�h�\��
'**************************************************************************************************
Private Sub funcSPSet()
    Dim i                   As Long
    
    '�X�v���b�h�N���A
    Call gsubSpdClear(sprList)
    
    '���o���R�[�h�����X�g�ɕ\��
    sprList.MaxRows = glngTblCnt

    For i = 1 To glngTblCnt
        '�ݕt���t
        Call gsubSetCellText(sprList, 1, i, Left(gtblKasituke(i).YMD, 4) & "/" & _
                                                Mid(gtblKasituke(i).YMD, 5, 2) & "/" & _
                                                    Right(gtblKasituke(i).YMD, 2))
        '�ݕt����
        Call gsubSetCellText(sprList, 2, i, Left(gtblKasituke(i).HMS, 2) & ":" & _
                                                Mid(gtblKasituke(i).HMS, 3, 2) & ":" & _
                                                    Right(gtblKasituke(i).HMS, 2))
        '�ݕt���z
        Call gsubSetCellText(sprList, 3, i, Format(gtblKasituke(i).Kingaku, "#,##0"))
        
        '�蓮�o�^�A�o�^�Җ��A�o�^���t
        If gtblKasituke(i).flg = "1" Then
            Call gsubSetCellText(sprList, 4, i, "��")
            Call gsubSetCellText(sprList, 5, i, gtblKasituke(i).TourokuName)
            Call gsubSetCellText(sprList, 6, i, Left(gtblKasituke(i).TourokuYMD, 4) & "/" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 5, 2) & "/" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 7, 2) & _
                                                    Space(1) & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 9, 2) & ":" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 11, 2) & ":" & _
                                                    Right(gtblKasituke(i).TourokuYMD, 2))
        Else
            Call gsubSetCellText(sprList, 4, i, "")
            Call gsubSetCellText(sprList, 5, i, "�V�X�e������")
            Call gsubSetCellText(sprList, 6, i, "")
        End If
    Next i

End Sub

Private Sub subPrintReport(intDestinationConstants As DestinationConstants)

Dim strConectPoint      As String
Dim intRet              As Integer

    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt310.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        .Formulas(0) = "PARA1='" & gstrSysDate & "'"

        '�o�͐�ݒ�
        .Destination = intDestinationConstants

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
