VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt130 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�Ј��Z���⍇�킹"
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   9435
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
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
      Height          =   6480
      Left            =   120
      TabIndex        =   22
      Top             =   1440
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1950
         TabIndex        =   3
         Top             =   2670
         Width           =   10485
         _Version        =   196608
         _ExtentX        =   18494
         _ExtentY        =   6376
         _StockProps     =   64
         MaxCols         =   9
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt130.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.Label lblSyoyoZan 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Caption         =   "999,999,999"
         Height          =   315
         Left            =   6660
         TabIndex        =   56
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label lblKyuyoZan 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Caption         =   "999,999,999"
         Height          =   315
         Left            =   5040
         TabIndex        =   55
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "�ܗ^�c��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   9
         Left            =   6660
         TabIndex        =   54
         Top             =   1080
         Width           =   1305
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "���^�c��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   8
         Left            =   5070
         TabIndex        =   53
         Top             =   1080
         Width           =   1305
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "�؏�����"
         Height          =   285
         Index           =   7
         Left            =   1980
         TabIndex        =   52
         Top             =   2460
         Width           =   1275
      End
      Begin VB.Label lblGokei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Caption         =   "999,999,999"
         Height          =   315
         Left            =   8250
         TabIndex        =   51
         Top             =   2010
         Width           =   1335
      End
      Begin VB.Label Label2 
         Caption         =   "���v"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   6
         Left            =   7470
         TabIndex        =   50
         Top             =   2070
         Width           =   495
      End
      Begin VB.Label lblZan 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Caption         =   "999,999,999"
         Height          =   315
         Left            =   8250
         TabIndex        =   49
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "�c��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   5
         Left            =   8280
         TabIndex        =   48
         Top             =   1080
         Width           =   1305
      End
      Begin VB.Label Label2 
         Caption         =   "�؏�"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   4
         Left            =   4290
         TabIndex        =   47
         Top             =   1350
         Width           =   495
      End
      Begin VB.Label lblZandaka 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Height          =   315
         Left            =   8250
         TabIndex        =   46
         Top             =   570
         Width           =   1335
      End
      Begin VB.Label lblSyoyoHensai 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Height          =   315
         Left            =   6660
         TabIndex        =   45
         Top             =   570
         Width           =   1335
      End
      Begin VB.Label lblKyuyoHensai 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         Caption         =   "999,999,999"
         Height          =   315
         Left            =   5040
         TabIndex        =   44
         Top             =   570
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "�c��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   3
         Left            =   8310
         TabIndex        =   43
         Top             =   330
         Width           =   1185
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "�ܗ^�ԍϊz"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   2
         Left            =   6720
         TabIndex        =   42
         Top             =   330
         Width           =   1215
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��������
         Caption         =   "���^�ԍϊz"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   5130
         TabIndex        =   41
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   4290
         TabIndex        =   40
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   120
      TabIndex        =   20
      Top             =   0
      Width           =   14190
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
         Height          =   300
         IMEMode         =   3  '�̌Œ�
         Left            =   2640
         MaxLength       =   7
         TabIndex        =   1
         Top             =   240
         Width           =   1005
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
         Left            =   3720
         TabIndex        =   2
         Top             =   210
         Width           =   1455
      End
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
         Height          =   300
         IMEMode         =   3  '�̌Œ�
         Left            =   2310
         MaxLength       =   1
         TabIndex        =   0
         Top             =   240
         Width           =   285
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
         Left            =   10980
         TabIndex        =   39
         Top             =   240
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
         Left            =   11130
         TabIndex        =   38
         Top             =   570
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
         Left            =   10650
         TabIndex        =   37
         Top             =   930
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
         Left            =   11580
         TabIndex        =   36
         Top             =   240
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
         Left            =   11580
         TabIndex        =   35
         Top             =   570
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
         Left            =   11580
         TabIndex        =   34
         Top             =   900
         Width           =   2385
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
         Left            =   7680
         TabIndex        =   33
         Top             =   930
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
         Left            =   6990
         TabIndex        =   32
         Top             =   930
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
         Left            =   6000
         TabIndex        =   31
         Top             =   960
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
         Left            =   6990
         TabIndex        =   30
         Top             =   600
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
         Left            =   6000
         TabIndex        =   29
         Top             =   600
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
         Left            =   7710
         TabIndex        =   28
         Top             =   270
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
         Left            =   6990
         TabIndex        =   27
         Top             =   240
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
         Left            =   6150
         TabIndex        =   26
         Top             =   240
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
         Left            =   2310
         TabIndex        =   25
         Top             =   930
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
         Left            =   2340
         TabIndex        =   24
         Top             =   660
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
         Left            =   1410
         TabIndex        =   23
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
         Left            =   1350
         TabIndex        =   21
         Top             =   300
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
      TabIndex        =   19
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
         TabIndex        =   4
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   10
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
         TabIndex        =   6
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   14
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
         TabIndex        =   7
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
         TabIndex        =   15
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
         TabIndex        =   8
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
      TabIndex        =   17
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
         TabIndex        =   18
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   16
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
            TextSave        =   "2014/01/30"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:56"
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
Attribute VB_Name = "frmQPAV_CEnt130"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private blnInit_Flg         As Boolean           '�����t���O
Private mdblKyuZanSum       As Double            '�؏��E���^�c���v
Private mdblSyoZanSum       As Double            '�؏��E�ܗ^�c���v

'**************************************************************************************************
'*Form���[�h
'**************************************************************************************************
Private Sub Form_Load()
    
    '------ �t�H�[�����ݒ� ------
    Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    
    blnInit_Flg = True             '�����t���O
    
    '������ʕҏW����
    Call SubInitScreen
    
End Sub
'----------------------------------------------------------------------------
'    ������ʕҏW����
'----------------------------------------------------------------------------
Private Sub SubInitScreen()
        
    Me.Enabled = False
    
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
    lblKyuyoHensai.Caption = ""
    lblSyoyoHensai.Caption = ""
    lblZandaka.Caption = ""
    lblZan.Caption = ""
    lblKyuyoZan.Caption = ""
    lblSyoyoZan.Caption = ""
    lblGokei.Caption = ""
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '�X�e�[�^�X�o�[���b�Z�[�W
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
    
    '----- Spread Seet �ی� -----
    sprList.Lock = True

    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '---- �X�e�[�^�X�o�[�ݒ� ----
    Call gsubInitStatusBar(stbSystem)
    '�X�e�[�^�X�o�[���b�Z�[�W����
    stbSystem.Panels.Item(1).Text = ""
    
    '�e�R���g���[������
    cmdNayose.Enabled = True
    cmdPFK(5).Enabled = True
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True

    Me.Enabled = True

End Sub

'**************************************************************************************************
'   ���񂹃{�^���@Click�C�x���g:�Z�b�V�����̊m��
'**************************************************************************************************
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
                                    , "�Ј��Z���⍇�� (" & gstrCommandLine(8) & ")" _
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
                                    , "�Ј��Z���⍇�� (" & gstrCommandLine(8) & ")" _
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
            Call SubInitScreen
            txtSyainCD1.SetFocus
    End Select
    
End Sub

'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg   As String '�G���[���b�Z�[�W
    Dim strWrk      As String

    '�r������
    Call gblnHaita_Unlock
    
    '���̫������ċ����I�Ɋe���۰ق�Lost_Focus������
    cmdPFK(5).SetFocus
    
    '�ꗗ���\�������܂Ŏ��s����,���񂹂��g�p�s�E�}�E�X�|�C���^�[(�����v)
    cmdPFK(5).Enabled = False
    cmdNayose.Enabled = False
    Screen.MousePointer = vbHourglass
''    Call subFormInitialize
    
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
    
    ''�����ԍϊz���擾
    blnGetKogutiInf
    
    Call gsubSpdClear(sprList)
    
    ''�؏����׏��擾
    If blnGetSyouMeisaiInf Then
        sprList.Enabled = True
        sprList.SetFocus
        '�؏����ו\��
        Call subDispList
    End If
   
   '�؏��c���v�\��
   lblKyuyoZan.Caption = Format$(mdblKyuZanSum, "#,##0")
   lblSyoyoZan.Caption = Format$(mdblSyoZanSum, "#,##0")
   lblZan.Caption = Format$(mdblKyuZanSum + mdblSyoZanSum, "#,##0")
   lblGokei.Caption = Format$(CLng(lblZandaka.Caption) + CLng(lblZan.Caption), "#,##0")
   
    
    '�e�R���g���[������
    Me.Enabled = True
    txtSyainCD1.Enabled = False
    txtSyainCD2.Enabled = False
'    cmdPFK(5).Enabled = True
'    cmdNayose.Enabled = True
    
'�� ''���͎E���Ă���    cmdOsori.Enabled = True
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""
        
End Sub

'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�Ј��Z���⍇�킹", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt130.Name, _
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

Private Sub Form_Unload(Cancel As Integer)

    '�r������
    Call gblnHaita_Unlock
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt130 = Nothing

End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSyainCD1_Change()
    
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

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyainCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
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

    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130SelSyainZoku(" & _
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
    
    '����Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130GetKogutiInf(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtNumKyuyoHensai, " & _
             ":OtNumSyoyoHensai, " & _
             ":OtNumZanHensai, " & _
             ":OtstrSonzaiFlg); END;"

     'SP�̎��s
     odbDatabase.DbexecuteSQL (strSQL)
     
    '�Y���f�[�^�Ȃ�
'    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
'        Call gsubParaRemove(odbDatabase)  '�I�u�W�F�N�g�̊J��
'        Exit Function
'    End If

    '��ʂɕ\��
    lblKyuyoHensai.Caption = Format$(odbDatabase.Parameters("OtNumKyuyoHensai").Value, "#,##0") '���^�ԍϊz
    lblSyoyoHensai.Caption = Format$(odbDatabase.Parameters("OtNumSyoyoHensai").Value, "#,##0") '�ܗ^�ԍϊz
    lblZandaka.Caption = Format$(odbDatabase.Parameters("OtNumZanHensai").Value, "#,##0")       '�c���ԍϊz

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

'*********************************************************************************************
'*�@�@�葱�����F�@�؏����׏��擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*�@�@�@�\�T�v�F�@�Ј��Z���䒠TBL���A�؏����׏����擾����
'*********************************************************************************************
Private Function blnGetSyouMeisaiInf()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30


On Error GoTo errGetSyouMeisaiInf
    
    blnGetSyouMeisaiInf = False

    '�X�v���b�h�N���A
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    mdblKyuZanSum = 0
    mdblSyoZanSum = 0
    
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
    strSQL = "BEGIN QPAP_CEnt130PkG.QPAP_CEnt130GetSyouMeisaiInf(" & _
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
'        lngRecCount = lngRecCount + odbDatabase.Parameters("OtNumAryCount")        '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/16
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))   '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/16
        
''        For j = lngFirstCnt To lngRecCount
''            '�؏����׃f�[�^
''            gDataAry(j) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
''        Next j
        For j = lngFirstCnt - ((i - 1) * cnsMaxRec) To lngRecCount - ((i - 1) * cnsMaxRec)
            '�؏����׃f�[�^
            gDataAry(j + ((i - 1) * cnsMaxRec)) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '�I���t���O���P�܂�
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    blnGetSyouMeisaiInf = True

    Exit Function

errGetSyouMeisaiInf:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    �ꗗ�\�\��
'***********************************************************************************
Private Sub subDispList()
 Dim i             As Long   '
 Dim lngKensuu     As Long
 Dim StrValue      As String '���ڒl������
 Dim StrDate       As String '���ڒl������
 
 Dim dblKyuZan      As Double
 Dim dblSyoZan      As Double

 Dim dblKyuHen      As Double
 Dim dblSyoHen      As Double
    
    mdblKyuZanSum = 0           '�؏��E���^�c���v
    mdblSyoZanSum = 0           '�؏��E�ܗ^�c���v

    '������
    lngKensuu = UBound(gDataAry())

    With sprList
        .ReDraw = False
                
        '���گ�޼�Ă�MaxRow��ݒ�(max30����������ݒ肷��
'        If lngKensuu > 15 Then
            .MaxRows = lngKensuu
'        End If
        
        '1��̌���
        For i = 1 To lngKensuu
                   
            '�؏����ׂP���R�[�h
            StrDate = gDataAry(i)
        
            '�ȉ��ꗗ�\���p
            
            '�Z����
            StrValue = Trim$(gfncstrDlm2(StrDate, 1))
            StrValue = Mid$(StrValue, 1, 4) & "/" & Mid$(StrValue, 5, 2) & "/" & Mid$(StrValue, 7, 2)
            .SetText 1, i, StrValue
            '�ԍϗ���
            StrValue = Trim$(gfncstrDlm2(StrDate, 4))
            StrValue = Format$(CDbl(StrValue), "#0.00")
            .SetText 2, i, StrValue & "%"
            '�ԍό���
            StrValue = Trim$(gfncstrDlm2(StrDate, 5))
            StrValue = Format$(CDbl(StrValue), "#0")
            .SetText 3, i, StrValue & "����"
            '�Z���z
'            StrValue = Trim$(gfncstrDlm2(StrDate, 2))
'            StrValue = Format$(CDbl(StrValue), "#,##0")
'            .SetText 4, i, StrValue
            StrValue = Trim$(gfncstrDlm2(StrDate, 6))
            dblKyuHen = CDbl(StrValue)
            StrValue = Trim$(gfncstrDlm2(StrDate, 8))
            dblSyoHen = CDbl(StrValue)
            StrValue = Format$(dblKyuHen + dblSyoHen, "#,##0")
            .SetText 4, i, StrValue
            '���^�ԍϊz
            StrValue = Trim$(gfncstrDlm2(StrDate, 7))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 5, i, StrValue
            '�ܗ^�ԍϊz
            StrValue = Trim$(gfncstrDlm2(StrDate, 9))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 6, i, StrValue
            
            If IsNull(gfncstrDlm2(StrDate, 13)) Or Trim(gfncstrDlm2(StrDate, 13)) = "" Then
                '���^�c��
                StrValue = Trim$(gfncstrDlm2(StrDate, 10))
                dblKyuZan = CDbl(StrValue)
                StrValue = Format$(dblKyuZan, "#,##0")
                .SetText 8, i, StrValue
                '�ܗ^�c��
                StrValue = Trim$(gfncstrDlm2(StrDate, 11))
                dblSyoZan = CDbl(StrValue)
                StrValue = Format$(dblSyoZan, "#,##0")
                .SetText 9, i, StrValue
                '�c��
                StrValue = Format$(dblKyuZan + dblSyoZan, "#,##0")
                .SetText 7, i, StrValue
                '�c���v
                mdblKyuZanSum = mdblKyuZanSum + dblKyuZan
                mdblSyoZanSum = mdblSyoZanSum + dblSyoZan
            Else
                '���^�c��
                .SetText 8, i, "0"
                '�ܗ^�c��
                .SetText 9, i, "0"
                '�c��
                .SetText 7, i, "0"
            End If
            
            .RowHeight(i) = 9.55
            
        Next i
        
        .ReDraw = True
    
    End With

End Sub


