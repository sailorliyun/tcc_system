VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt090 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�؏��ݕt���ϓ�������"
   ClientHeight    =   7920
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   7920
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   30
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      PrintFileLinesPerPage=   60
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   5010
      Left            =   90
      TabIndex        =   26
      Top             =   1410
      Width           =   14250
      Begin VB.CommandButton cmdPrint 
         Caption         =   "���ϒʒm��"
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
         Left            =   11010
         TabIndex        =   7
         Top             =   4440
         Width           =   1455
      End
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1140
         TabIndex        =   3
         Top             =   450
         Width           =   11580
         _Version        =   196608
         _ExtentX        =   20426
         _ExtentY        =   6376
         _StockProps     =   64
         MaxCols         =   14
         MaxRows         =   20
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt090.frx":0000
         UserResize      =   0
         VisibleCols     =   14
         VisibleRows     =   20
      End
      Begin VB.CommandButton cmdexec 
         Caption         =   "���ώ��"
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
         Left            =   7860
         TabIndex        =   6
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmdexec 
         Caption         =   "���ϏC��"
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
         Left            =   6240
         TabIndex        =   5
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmdexec 
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
         Height          =   375
         Index           =   0
         Left            =   4620
         TabIndex        =   4
         Top             =   4440
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1350
      Left            =   90
      TabIndex        =   24
      Top             =   60
      Width           =   14250
      Begin VB.TextBox txtSyainCd1 
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
         Left            =   2130
         MaxLength       =   1
         TabIndex        =   0
         Top             =   330
         Width           =   270
      End
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
         Left            =   3570
         TabIndex        =   2
         Top             =   300
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCd2 
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
         Left            =   2460
         MaxLength       =   7
         TabIndex        =   1
         Top             =   330
         Width           =   900
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
         TabIndex        =   43
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
         Left            =   11010
         TabIndex        =   42
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
         Left            =   10530
         TabIndex        =   41
         Top             =   990
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
         TabIndex        =   40
         Top             =   300
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
         TabIndex        =   39
         Top             =   630
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
         TabIndex        =   38
         Top             =   960
         Width           =   1305
      End
      Begin VB.Label lblBumon 
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
         Index           =   1
         Left            =   7590
         TabIndex        =   37
         Top             =   990
         Width           =   2775
      End
      Begin VB.Label lblBumon 
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
         Left            =   6870
         TabIndex        =   36
         Top             =   990
         Width           =   525
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
         TabIndex        =   35
         Top             =   1020
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
         Height          =   165
         Left            =   6870
         TabIndex        =   34
         Top             =   660
         Width           =   585
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
         TabIndex        =   33
         Top             =   660
         Width           =   720
      End
      Begin VB.Label lblShozoku 
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
         Index           =   1
         Left            =   7590
         TabIndex        =   32
         Top             =   300
         Width           =   2775
      End
      Begin VB.Label lblShozoku 
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
         Left            =   6870
         TabIndex        =   31
         Top             =   300
         Width           =   525
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
         Left            =   6030
         TabIndex        =   30
         Top             =   300
         Width           =   540
      End
      Begin VB.Label lblShimei 
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
         Left            =   2190
         TabIndex        =   29
         Top             =   990
         Width           =   2235
      End
      Begin VB.Label lblKana 
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
         Left            =   2190
         TabIndex        =   28
         Top             =   720
         Width           =   2235
      End
      Begin VB.Label Label11 
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
         Left            =   1170
         TabIndex        =   27
         Top             =   390
         Width           =   810
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
         Index           =   0
         Left            =   1200
         TabIndex        =   25
         Top             =   870
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
      Top             =   6960
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
         Left            =   6015
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
      Left            =   45
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   6450
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
      Top             =   7545
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
            TextSave        =   "2010/02/12"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:35"
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
Attribute VB_Name = "frmQPAV_CEnt090"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'************************************************************************************
'  �������N���W�b�g �x���V�X�e��
'    �T�u�V�X�e�����F �Ј��ݕt�V�X�e���i�o�`�j
'---------------------------------------
'    �@�\���@�@�@�@�F QPAV_CEnt090     �؏��ݕt���ϓ�������
'    �@�\���e�@�@�@�F �؏��ݕt���ϓ������͂��s��
'    �t�H�[���@�@�@�F frmQPAV_CEnt090  �F �؏��ݕt���ϓ�������
'---------------------------------------
'   �쐬���@ �F ????/??/??
'   �S���ҁ@ �F FIP
'---------------------------------------
'   �C�����@ �F 2005/01/25
'   �C�����e �F ���ϒʒm������@�\�̒ǉ�
'************************************************************************************
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           �P�D���ϓ��̓��̓`�F�b�N��ǉ�(�{�����܂ޓ����������̂݉�)
'                           �Q�D�����E����߂��ɑΉ�
'                               �E�O���b�h�Ǝq��ʂ̎c���\���ɕ���߂����̋��z��������
'                               �E����߂����܂ތ_�񂪊��ς��ꂽ�ꍇ�A����߂��f�[�^�𕪉�����
'                               �E��L���ς��������ꂽ�ꍇ�A�Ăѕ���߂��ɂ���
'                           �R�D�ܗ^�̎c���擾���@���ܗ^�T�������f�����O�̎c�����擾����悤�ɕύX����
'                               (1���̌l�ݕt���ׂł̑Ή��Ɠ��l)
'                           �S�D���Z���z�̌v�Z���W�b�N���l�ݕt���ׂƓ��l�ɂ���
'                               (�ŏI�������~�����v�Z�������ɑΉ�)
'----------------------------------------------------------------------------------------------


'�t���O
Private blnDbFlg               As Boolean    'DB�ڑ�   2005/02/14

'���[�o�͏���
Private mstrKeyYushibi          As String    '�Z����   2005/01/25





'**************************************************************************************************
'*    Form Load
'**************************************************************************************************
Private Sub Form_Load()

    '2005/02/14
    blnDbFlg = False    '������

    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    Me.Caption = "�؏��ݕt���ϓ������� (" & gstrCommandLine(8) & ")"
    
    blnLoadFlg = True

    sprList.MaxRows = 0

End Sub
'**************************************************************************************************
'   Form Activate       �Z�b�V�����̊m�����f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "�؏��ݕt��������"
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�؏��ݕt�������� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '�I���N���f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�؏��ݕt�������� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        'DB�ڑ�OK    2005/02/14
        blnDbFlg = True
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        '�R�[�h�e�[�u���擾 2005/01/26 ADD
        Call gsubGetCode
        
        '��ʏ�����
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False
   
End Sub

'**************************************************************************************************
'*    Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
'2005/02/14 FROM
'''    '�r������
'''    Call gblnHaita_Unlock
'''
'''    '�׸پ���݂̐ؒf
'''    Call gsubTermOracleDB
    
     '�c�a�ڑ��n�j
    If blnDbFlg = True Then
    
        'WK�e�[�u���폜
        Call fncblnPrintDataDel

        '�r������
        Call gblnHaita_Unlock
    
        '�׸پ���݂̐ؒf
        Call gsubTermOracleDB
    
    End If
'2005/02/14 TO
    
    Set frmQPAV_CEnt090 = Nothing

End Sub

'**************************************************************************************************
'*    FORM KEYDOWN �t�@���N�V�����L�[�ݒ�
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
'*    FORM_KEYPRESS
'**************************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    
    'ENTER Beep������
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub






'**************************************************************************************************
'    PF�L�[�N���b�N     �e�t�@���N�V�����L�[�@�\
'**************************************************************************************************
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
            Call subFormInitialize
            txtSyainCd1.SetFocus
    End Select
    
End Sub


'**************************************************************************************************
'    ���񂹃{�^�� �N���b�N
'**************************************************************************************************
Private Sub cmdName_Click()
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCd1 = Left(gstrDat, 1)
        txtSyainCd2 = Right(gstrDat, 7)
        Call cmdPFK_Click(5)
    End If
End Sub


'**************************************************************************************************
'    �y���ρz�y���ϏC���z�y���ώ���z �{�^�� �N���b�N
'**************************************************************************************************
Private Sub cmdExec_Click(Index As Integer)
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    
    Act_Row = sprList.ActiveRow
    
    Select Case Index
        Case 0
            If gVarSpdGetText(sprList, 10, Act_Row) <> "" Then
                'Msg = ����f�[�^��I�����Ă��������B
                lblMsg.Caption = "WPOE05 " & cmdExec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
            If gVarSpdGetText(sprList, 7, Act_Row) = 0 Then
                'Msg = ���Z������z������܂���B
                lblMsg.Caption = "WPOE33 " & gstrGetCodeMeisyo(odbDatabase, "E33", "WPO")
                Exit Sub
            End If
        Case 1, 2
            If gVarSpdGetText(sprList, 10, Act_Row) = "" Then
                'Msg = ����f�[�^��I�����Ă��������B
                lblMsg.Caption = "WPOE05 " & cmdExec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
        If DateDiff("y", gVarSpdGetText(sprList, 10, Act_Row), gstrZanYMD) > 0 Then
            'Msg = �ŐV�̎c���X�V��(�j�ȑO�̓��t�͓��͂ł��܂���B
            lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
            Exit Sub
        End If
    End Select
    
    frmQPAV_CEnt091.lblSyainCD1.Caption = txtSyainCd1.Text
    frmQPAV_CEnt091.lblSyainCD2.Caption = txtSyainCd2.Text
    frmQPAV_CEnt091.lblShimei.Caption = lblShimei.Caption
    frmQPAV_CEnt091.lblYuusibiY.Caption = Left(gVarSpdGetText(sprList, 1, Act_Row), 4)
    frmQPAV_CEnt091.lblYuusibiM.Caption = Mid(gVarSpdGetText(sprList, 1, Act_Row), 6, 2)
    frmQPAV_CEnt091.lblYuusibiD.Caption = Right(gVarSpdGetText(sprList, 1, Act_Row), 2)
    frmQPAV_CEnt091.lblRiritu.Caption = gVarSpdGetText(sprList, 2, Act_Row)
    frmQPAV_CEnt091.lblKaisu.Caption = gVarSpdGetText(sprList, 3, Act_Row)
    frmQPAV_CEnt091.lblYuusiKei.Caption = gVarSpdGetText(sprList, 4, Act_Row)
    frmQPAV_CEnt091.lblYuusiKyuuyo.Caption = gVarSpdGetText(sprList, 5, Act_Row)
    frmQPAV_CEnt091.lblYuusiBonus.Caption = gVarSpdGetText(sprList, 6, Act_Row)
    If Index = 1 Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        frmQPAV_CEnt091.lblZanKei.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).SyoyoZan, "#,##0")
'        frmQPAV_CEnt091.lblZanKyuuyo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan, "#,##0")
'        frmQPAV_CEnt091.lblZanBonus.Caption = Format(gtblKeisan(Act_Row).SyoyoZan, "#,##0")
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        '����߂������v���X����
        frmQPAV_CEnt091.lblZanKei.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).SyoyoZan _
                                                 + gtblKeisan(Act_Row).KyuyoMod + gtblKeisan(Act_Row).SyoyoMod, "#,##0")
        frmQPAV_CEnt091.lblZanKyuuyo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).KyuyoMod, "#,##0")
        frmQPAV_CEnt091.lblZanBonus.Caption = Format(gtblKeisan(Act_Row).SyoyoZan + gtblKeisan(Act_Row).SyoyoMod, "#,##0")
        '�v���X�O�̒l�͔�\�����x���ɑޔ�
        frmQPAV_CEnt091.lblZanKyuyoTujo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan, "#,##0") '���^(�ʏ핪)
        frmQPAV_CEnt091.lblZanSyoyoTujo.Caption = Format(gtblKeisan(Act_Row).SyoyoZan, "#,##0") '�ܗ^(�ʏ핪)
        frmQPAV_CEnt091.lblZanKyuyoModo.Caption = Format(gtblKeisan(Act_Row).KyuyoMod, "#,##0") '���^(�߂���)
        frmQPAV_CEnt091.lblZanSyoyoModo.Caption = Format(gtblKeisan(Act_Row).SyoyoMod, "#,##0") '�ܗ^(�߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
    Else
        frmQPAV_CEnt091.lblZanKei.Caption = gVarSpdGetText(sprList, 7, Act_Row)
        frmQPAV_CEnt091.lblZanKyuuyo.Caption = gVarSpdGetText(sprList, 8, Act_Row)
        frmQPAV_CEnt091.lblZanBonus.Caption = gVarSpdGetText(sprList, 9, Act_Row)
'ADD 20100225 0908047 NBC YOKOYAMA START
        '�v���X�O�̒l�͔�\�����x���ɑޔ�
        frmQPAV_CEnt091.lblZanKyuyoTujo.Caption = gVarSpdGetText(sprList, 11, Act_Row) '���^(�ʏ핪)
        frmQPAV_CEnt091.lblZanSyoyoTujo.Caption = gVarSpdGetText(sprList, 12, Act_Row) '�ܗ^(�ʏ핪)
        frmQPAV_CEnt091.lblZanKyuyoModo.Caption = gVarSpdGetText(sprList, 13, Act_Row) '���^(�߂���)
        frmQPAV_CEnt091.lblZanSyoyoModo.Caption = gVarSpdGetText(sprList, 14, Act_Row) '�ܗ^(�߂���)
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
'    frmQPAV_CEnt091.lblZanKei.Caption = gVarSpdGetText(sprList, 7, Act_Row)
'    frmQPAV_CEnt091.lblZanKyuuyo.Caption = gVarSpdGetText(sprList, 8, Act_Row)
'    frmQPAV_CEnt091.lblZanBonus.Caption = gVarSpdGetText(sprList, 9, Act_Row)
    
    Select Case Index
        Case 0
            frmQPAV_CEnt091.txtNyuukinbiYYYY.Text = Format(gdatSysDate, "yyyy")
            frmQPAV_CEnt091.txtNyuukinbiMM.Text = Format(gdatSysDate, "mm")
            frmQPAV_CEnt091.txtNyuukinbiDD.Text = Format(gdatSysDate, "dd")
        Case 1, 2
            frmQPAV_CEnt091.txtNyuukinbiYYYY.Text = Left(gVarSpdGetText(sprList, 10, Act_Row), 4)
            frmQPAV_CEnt091.txtNyuukinbiMM.Text = Mid(gVarSpdGetText(sprList, 10, Act_Row), 6, 2)
            frmQPAV_CEnt091.txtNyuukinbiDD.Text = Right(gVarSpdGetText(sprList, 10, Act_Row), 2)
    End Select
    
    If cmdExec(Index).Index = 2 Then
        frmQPAV_CEnt091.txtNyuukinbiYYYY.Enabled = False
        frmQPAV_CEnt091.txtNyuukinbiMM.Enabled = False
        frmQPAV_CEnt091.txtNyuukinbiDD.Enabled = False
        frmQPAV_CEnt091.cmdTorikesi.Enabled = False
    Else
        frmQPAV_CEnt091.txtNyuukinbiYYYY.Enabled = True
        frmQPAV_CEnt091.txtNyuukinbiMM.Enabled = True
        frmQPAV_CEnt091.txtNyuukinbiDD.Enabled = True
        frmQPAV_CEnt091.cmdTorikesi.Enabled = True
    End If
    frmQPAV_CEnt091.cmdTouroku.Caption = cmdExec(Index).Caption

    frmQPAV_CEnt091.Show 1
    
    '��ʍĕ\��
    If Trim(txtSyainCd1.Text) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = txtSyainCd1.Text
    End If
    gstrCode2 = txtSyainCd2.Text
    
    Call gfuncSPSet
    
End Sub

'***********************************************************************************************************
'*    ���ϒʒm�� ����{�^�� �N���b�N
'*    2005/01/25
'***********************************************************************************************************
Private Sub cmdPrint_Click()
    Dim strTmp     As String
    
    '���b�Z�[�W�N���A
    lblMsg.Caption = ""
    
    '���σ`�F�b�N  �I�����ꂽ�s�̃f�[�^�����ς��ǂ����H
    strTmp = gVarSpdGetText(sprList, 10, sprList.ActiveRow)
    If IsDate(strTmp) = False Then
        'Msg = �I�����ꂽ�f�[�^�͊��ς���Ă��܂���B
        lblMsg.Caption = "WPOE05 " & gstrGetCodeMeisyo(odbDatabase, "E38", "WPO")
        Exit Sub
    End If
    
    '����E�v���r���[
    If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "���ϒʒm��") = vbCancel Then
        Exit Sub
    End If
    
    '��ʐ���
    MousePointer = vbHourglass
    Me.Enabled = False
    
    '����f�[�^�쐬  ��1���P�ʂȂ̂ŕK���쐬����
    If fncblnPrintDataEdit = False Then
        '�f�[�^�쐬�G���[
        Exit Sub
    End If
        
    '��ʐ���
    Me.Enabled = True
    MousePointer = vbDefault
        
    '�v���r���[
    Call sub410PrintRep(crptToWindow)

End Sub









'***********************************************************************************************************
'*    ��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
    Dim i           As Integer
 
 
    Call subErrKaijo
 
    '�r������
    Call gblnHaita_Unlock
    
    txtSyainCd1.Text = ""
    txtSyainCd1.Enabled = True
    txtSyainCd2.Text = ""
    txtSyainCd2.Enabled = True
    cmdName.Enabled = True
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblTozai.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        lblShozoku(i).Caption = ""
        lblBumon(i).Caption = ""
    Next i
    For i = 0 To 2
        cmdExec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    
    '2005/01/25 From ���ϒʒm���Ή�
    frmQPAV_CEnt090.cmdPrint.Enabled = False
    '2005/01/25 To   ���ϒʒm���Ή�
    
    'Spred Sheet�̏�����
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
End Sub


'*************************************************************************************************
'*    ���s�{�^���iPF5�j����
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String
    Dim i         As Integer
    
    '�G���[����
    Call subErrKaijo
    
    '�r������
    Call gblnHaita_Unlock
    
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblTozai.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        lblShozoku(i).Caption = ""
        lblBumon(i).Caption = ""
    Next i
    
    If Trim$(txtSyainCd2.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCd2.BackColor = vbRed
        txtSyainCd2.Enabled = True
        txtSyainCd2.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
    
    If Trim(txtSyainCd1.Text) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = txtSyainCd1.Text
    End If
    gstrCode2 = txtSyainCd2.Text
    
    '�r������
    If Not gblnHaita_Lock Then GoTo Exit_subCmdJikkou
    
    If gfuncSeachSyain = False Then
        'Msg = �Ј����������݂��܂���B
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCd1.SetFocus
        txtSyainCd1.BackColor = vbRed
        txtSyainCd2.BackColor = vbRed
        '�r������
        Call gblnHaita_Unlock
        GoTo Exit_subCmdJikkou
    End If
    
    If gfuncSPSet = False Then
        txtSyainCd1.SetFocus
        '�r������
        Call gblnHaita_Unlock
        GoTo Exit_subCmdJikkou
    End If
    
Exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
        
End Sub


'*************************************************************************************************
'*    �G���[��������
'*************************************************************************************************
Private Sub subErrKaijo()
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCd1.BackColor = vbWhite
    txtSyainCd2.BackColor = vbWhite

End Sub


'*************************************************************************************************
'    �G���[���b�Z�[�W�{�b�N�X��\������B
'*************************************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�؏��ݕt��������", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt090.Name, _
              strErrCode, _
              strErrMsg)

End Sub


'2005/01/26 ADD    ** FROM **
'***********************************************************************************
'    ����f�[�^�쐬 SP ���s
'        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataEdit() As Boolean
    Dim strSQL               As String
    Dim i                    As Long
    
    Dim strVal               As String
    Dim strTmpY              As String
    Dim strTmpM              As String
    Dim strTmpD              As String
    Dim datTmp               As Date
    Dim strTmp               As String
    
    Dim strHakkoubi          As String    '���s��
    Dim strTozai             As String    '�����敪
    Dim strTenCd             As String    '�����X�R�[�h
    Dim strTenNm             As String    '�����X����
    Dim strBumonCd           As String    '�����X�R�[�h
    Dim strBumonNm           As String    '�����X����
    Dim strShimei            As String    '����
    Dim strSyainCd1          As String    '�Ј��R�[�h�P
    Dim strSyainCd2          As String    '�Ј��R�[�h�Q
    Dim strYushibi           As String    '�Z����
    Dim strYushibiWa         As String    '�Z�����i�a��j
    Dim strYushiKng          As String    '�Z�����z
    Dim strKansaibi          As String    '���ϓ�
    Dim strKansaibiWa        As String    '���ϓ��i�a��j
    '----------------------------------------------

On Error GoTo fncblnPrintDataEdit_ERR
    
    '������
    fncblnPrintDataEdit = False
    
    '�� �f�[�^�ҏW
    '������
    If IsDate(gdatSysDate) = True Then
        strHakkoubi = Format(gdatSysDate, "ggg e�Nm��d�����s")
    Else
        strHakkoubi = ""
    End If
    
    '�����敪
    Select Case Mid$(lblTozai.Caption, 1, 1)
        Case "1": strTozai = "��"
        Case "2": strTozai = "��"
        Case Else: strTozai = ""
    End Select
    
    '�����X
    strTenCd = Trim$(lblShozoku(0).Caption)
    strTenNm = Trim$(lblShozoku(1).Caption)
    '�������喼
    strBumonCd = Trim$(lblBumon(0).Caption)
    strBumonNm = Trim$(lblBumon(1).Caption)
    '����
    If Trim$(lblShimei.Caption) = "" Then
        strShimei = Trim$(lblKana.Caption)
    Else
        strShimei = Trim$(lblShimei.Caption)
    End If
    
    '����
    '�Ј��R�[�h�P
    strSyainCd1 = fncstrMojiEdit(txtSyainCd1.Text, 1, 1)
    '�Ј��R�[�h�Q
    strSyainCd2 = txtSyainCd2.Text
    '���Z����
    strVal = gVarSpdGetText(sprList, 1, sprList.ActiveRow)
    If IsDate(strVal) = True Then
        strTmpY = Trim$(Format(strVal, "e"))
        strTmpM = Trim$(Format(strVal, "m"))
        strTmpD = Trim$(Format(strVal, "d"))
        strYushibi = strVal
        strYushibiWa = Format(strVal, "ggg") & " " & _
                       IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "�N", strTmpY & "�N") & _
                       IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "��", strTmpM & "��") & _
                       IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "��", strTmpD & "��")
        mstrKeyYushibi = strYushibi
    Else
        strYushibi = ""
        strYushibiWa = ""
        mstrKeyYushibi = ""
    End If
    '���Z���z
    strVal = gVarSpdGetText(sprList, 4, sprList.ActiveRow)
    If IsNumeric(strVal) = True Then
        strYushiKng = "\" & fncstrMojiEdit(Format(strVal, "#,##0"), 12, 0)
    Else
        strYushiKng = ""
    End If
    '���_��I����
    strVal = gVarSpdGetText(sprList, 10, sprList.ActiveRow)
    If IsDate(strVal) = True Then
        strTmpY = Trim$(Format(strVal, "e"))
        strTmpM = Trim$(Format(strVal, "m"))
        strTmpD = Trim$(Format(strVal, "d"))
        strKansaibi = strVal
        strKansaibiWa = Format(strVal, "ggg") & " " & _
                        IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "�N", strTmpY & "�N") & _
                        IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "��", strTmpM & "��") & _
                        IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "��", strTmpD & "��")
    Else
        strKansaibi = ""
        strKansaibiWa = ""
    End If

    '����f�[�^�쐬 �r�o
    '��01�� �I�y���[�^ID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '��02�� �[��ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    '��03�� �Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyainCd1", strSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_VARCHAR2
    '��04�� �Ј��R�[�h�Q
    odbDatabase.Parameters.Add "InStrSyainCd2", strSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_VARCHAR2
    '��05�� �Z����
    odbDatabase.Parameters.Add "InStrYushibi", strYushibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushibi").ServerType = ORATYPE_VARCHAR2
    '��06�� �Z�����i�a��j
    odbDatabase.Parameters.Add "InStrYushibiWa", strYushibiWa, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushibiWa").ServerType = ORATYPE_VARCHAR2
    '��07�� �\���p�Ј�����
    odbDatabase.Parameters.Add "InStrDispNm", strShimei, ORAPARM_INPUT
    odbDatabase.Parameters("InStrDispNm").ServerType = ORATYPE_VARCHAR2
    '��08�� �����X�R�[�h
    odbDatabase.Parameters.Add "InStrTenCd", strTenCd, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTenCd").ServerType = ORATYPE_VARCHAR2
    '��09�� �����X����
    odbDatabase.Parameters.Add "InStrTenNm", strTenNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTenNm").ServerType = ORATYPE_VARCHAR2
    '��10�� �����敪
    odbDatabase.Parameters.Add "InStrTozai", strTozai, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozai").ServerType = ORATYPE_VARCHAR2
    '��11�� ��������R�[�h
    odbDatabase.Parameters.Add "InStrBumonCd", strBumonCd, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCd").ServerType = ORATYPE_VARCHAR2
    '��12�� �������喼��
    odbDatabase.Parameters.Add "InStrBumonNm", strBumonNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNm").ServerType = ORATYPE_VARCHAR2
    '��13�� �Z�����z
    odbDatabase.Parameters.Add "InStrYushiKng", strYushiKng, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushiKng").ServerType = ORATYPE_VARCHAR2
    '��14�� ���ϓ�
    odbDatabase.Parameters.Add "InStrKansaibi", strKansaibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibi").ServerType = ORATYPE_VARCHAR2
    '��15�� ���ϓ��i�a��j
    odbDatabase.Parameters.Add "InStrKansaibiWa", strKansaibiWa, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiWa").ServerType = ORATYPE_VARCHAR2
    
    '�Œ荀��
    '��16�� �@�@�@�@ ���s���i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkoubi", strHakkoubi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkoubi").ServerType = ORATYPE_VARCHAR2
    '��17�� �@�@�@�@ ���s�ҏ��P�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo1", gtblCdT_Hakkousya(1).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo1").ServerType = ORATYPE_VARCHAR2
    '��18�� �@�@�@�@ ���s�ҏ��Q�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo2", gtblCdT_Hakkousya(2).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo2").ServerType = ORATYPE_VARCHAR2
    '��19�� �@�@�@�@ ���s�ҏ��R�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo3", gtblCdT_Hakkousya(3).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo3").ServerType = ORATYPE_VARCHAR2
    '��20�� �@�@�@�@ ���s�ҏ��S�i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrHakkouInfo4", gtblCdT_Hakkousya(4).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo4").ServerType = ORATYPE_VARCHAR2
    '��21�� �@�@�@�@ ���[�����́i���ϒʒm�p�j
    odbDatabase.Parameters.Add "InStrLoanNm", gstrCdT_LoanNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrLoanNm").ServerType = ORATYPE_VARCHAR2
    '��22�� �@�@�@�@ ���ϒʒm�o�͎҈ꗗ�^�C�g��  �������ł͎g�p���Ȃ��̂Ŗ��ݒ�
    odbDatabase.Parameters.Add "InStrTitle", "", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTitle").ServerType = ORATYPE_VARCHAR2
    
    
    'SQL�� �ҏW
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090InsWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 �I�y���[�^ID
    strSQL = strSQL & ":InStrComputerMei,"              '02 �[��ID
    
    strSQL = strSQL & ":InStrSyainCd1,"                 '03 �Ј��R�[�h�P
    strSQL = strSQL & ":InStrSyainCd2,"                 '04 �Ј��R�[�h�Q
    strSQL = strSQL & ":InStrYushibi,"                  '05 �Z����
    strSQL = strSQL & ":InStrYushibiWa,"                '06 �Z�����i�a��j
    strSQL = strSQL & ":InStrDispNm,"                   '07 �\���p�Ј�����
    strSQL = strSQL & ":InStrTenCd,"                    '08 �����X�R�[�h
    strSQL = strSQL & ":InStrTenNm,"                    '09 �����X����
    strSQL = strSQL & ":InStrTozai,"                    '10 �����敪
    strSQL = strSQL & ":InStrBumonCd,"                  '11 ��������R�[�h
    strSQL = strSQL & ":InStrBumonNm,"                  '12 �������喼��
    strSQL = strSQL & ":InStrYushiKng,"                 '13 �Z�����z
    strSQL = strSQL & ":InStrKansaibi,"                 '14 ���ϓ�
    strSQL = strSQL & ":InStrKansaibiWa,"               '15 ���ϓ��i�a��j
    
    strSQL = strSQL & ":InStrHakkoubi,"                 '16 ���s���i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo1,"              '17 ���s�ҏ��P�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo2,"              '18 ���s�ҏ��Q�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo3,"              '19 ���s�ҏ��R�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrHakkouInfo4,"              '20 ���s�ҏ��S�i���ϒʒm�p�j
    strSQL = strSQL & ":InStrLoanNm,"                   '21 ���[�����́i���ϒʒm�p�j
    strSQL = strSQL & ":InStrTitle "                    '22 ���ϒʒm�o�͎҈ꗗ�^�C�g��
    strSQL = strSQL & "); END;"
    
    
    'SP ���s
    odbDatabase.DbexecuteSQL (strSQL)
    
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
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090DelWkTbl("
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
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_Yushibi} = '" & mstrKeyYushibi & "'"
        
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
'2005/01/26 ADD    ** TO **














'*************************************************************************************************
'*    �Ј��R�[�h�P Change     ���t�����E�o
'*************************************************************************************************
Private Sub txtSyainCd1_Change()
'''    Call gsubMaxCharSkipEX(txtSyainCD1, 1)
    If LenB(StrConv(txtSyainCd1.Text, vbFromUnicode)) = 1 Then
        txtSyainCd1.BackColor = vbWhite
        txtSyainCd2.SetFocus
    End If
End Sub
'*************************************************************************************************
'*    �Ј��R�[�h�P GotFocus     ���t�H�[�J�X�擾���S�e�L�X�g�I��
'*************************************************************************************************
Private Sub txtSyainCd1_GotFocus()
    Call gsubSelectText(txtSyainCd1)
End Sub



'*************************************************************************************************
'*    �Ј��R�[�h�Q Change    ���t�����E�o
'*************************************************************************************************
Private Sub txtSyainCd2_Change()
    Call gsubMaxCharSkipEX(txtSyainCd2, 7)
End Sub
'*************************************************************************************************
'*    �Ј��R�[�h�Q GotFocus     ���t�H�[�J�X�擾���S�e�L�X�g�I��
'*************************************************************************************************
Private Sub txtSyainCd2_GotFocus()
    Call gsubSelectText(txtSyainCd2)
End Sub
'*************************************************************************************************
'*    �Ј��R�[�h�Q KeyPress     �����͕�������i�����̂݁j
'*************************************************************************************************
Private Sub txtSyainCd2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub




'2005/01/26 ADD
'*************************************************************************************************
'*    �ꗗ �N���b�N
'*************************************************************************************************
Private Sub sprList_Click(ByVal Col As Long, ByVal Row As Long)
    '���b�Z�[�W�N���A
    lblMsg.Caption = ""
End Sub









