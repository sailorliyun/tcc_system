VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt030 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�Ј������Z���v�Z��������"
   ClientHeight    =   8580
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
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.OptionButton optSeisan 
      Caption         =   "���Z����"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Index           =   0
      Left            =   150
      Style           =   1  '���̨���
      TabIndex        =   2
      Top             =   1620
      Value           =   -1  'True
      Width           =   1800
   End
   Begin VB.OptionButton optSeisan 
      Caption         =   "���Z���Ȃ�"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Index           =   1
      Left            =   150
      Style           =   1  '���̨���
      TabIndex        =   3
      Top             =   2220
      Width           =   1800
   End
   Begin VB.Frame Frame5 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   4245
      Left            =   90
      TabIndex        =   40
      Top             =   2760
      Width           =   14205
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1830
         TabIndex        =   10
         Top             =   330
         Width           =   8925
         _Version        =   196608
         _ExtentX        =   15743
         _ExtentY        =   6376
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   7
         MaxRows         =   25
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt030.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "���[���"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   525
         Index           =   1
         Left            =   12510
         TabIndex        =   12
         Top             =   3420
         Width           =   1455
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
         Height          =   525
         Index           =   0
         Left            =   11010
         TabIndex        =   11
         Top             =   3420
         Width           =   1455
      End
      Begin VB.Label lblModAnnai2 
         Caption         =   "�܂܂�Ă��܂��B"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   11350
         TabIndex        =   63
         Top             =   1680
         Visible         =   0   'False
         Width           =   2295
      End
      Begin VB.Label lbltxtRisoku 
         Caption         =   "�����F"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   11760
         TabIndex        =   62
         Top             =   2160
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Label lbltxtGan 
         Caption         =   "�����F"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   11760
         TabIndex        =   61
         Top             =   1920
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Label lblModRisoku 
         Alignment       =   1  '�E����
         Caption         =   "9,999,999�~"
         Height          =   255
         Left            =   12240
         TabIndex        =   60
         Top             =   2160
         Visible         =   0   'False
         Width           =   1305
      End
      Begin VB.Label lblModGan 
         Alignment       =   1  '�E����
         Caption         =   "9,999,999�~"
         Height          =   255
         Left            =   12240
         TabIndex        =   59
         Top             =   1920
         Visible         =   0   'False
         Width           =   1305
      End
      Begin VB.Label lblModAnnai1 
         Caption         =   "�������E�����ɂ͖�������"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   11160
         TabIndex        =   58
         Top             =   1440
         Visible         =   0   'False
         Width           =   2415
      End
   End
   Begin VB.Frame fra_Seisan 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   2250
      TabIndex        =   35
      Top             =   1530
      Width           =   12045
      Begin VB.TextBox txtSeisanbiD 
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
         Left            =   3540
         MaxLength       =   2
         TabIndex        =   6
         Top             =   180
         Width           =   345
      End
      Begin VB.TextBox txtSeisanbiM 
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
         Left            =   2820
         MaxLength       =   2
         TabIndex        =   5
         Top             =   180
         Width           =   360
      End
      Begin VB.TextBox txtSeisanbiY 
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
         Left            =   1830
         MaxLength       =   4
         TabIndex        =   4
         Top             =   180
         Width           =   555
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "���Z��"
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
         Left            =   1050
         TabIndex        =   39
         Top             =   240
         Width           =   540
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   3960
         TabIndex        =   38
         Top             =   270
         Width           =   180
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   3240
         TabIndex        =   37
         Top             =   255
         Width           =   180
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   2505
         TabIndex        =   36
         Top             =   255
         Width           =   180
      End
   End
   Begin VB.Frame fra_Hani 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   585
      Left            =   2250
      TabIndex        =   31
      Top             =   2130
      Width           =   12045
      Begin VB.TextBox txtSYuturyokuhani 
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
         Left            =   1830
         MaxLength       =   4
         TabIndex        =   7
         Top             =   210
         Width           =   525
      End
      Begin VB.Frame Frame1 
         BorderStyle     =   0  '�Ȃ�
         Caption         =   "Frame1"
         Height          =   330
         Left            =   2850
         TabIndex        =   32
         Top             =   120
         Width           =   3975
         Begin VB.OptionButton optKamiSimoKi 
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   9
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   0
            Left            =   0
            TabIndex        =   8
            Top             =   120
            Value           =   -1  'True
            Width           =   1725
         End
         Begin VB.OptionButton optKamiSimoKi 
            BeginProperty Font 
               Name            =   "�l�r �o�S�V�b�N"
               Size            =   9
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   390
            Index           =   1
            Left            =   2190
            TabIndex        =   9
            Top             =   30
            Width           =   1755
         End
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "�o�͔͈�"
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
         Left            =   840
         TabIndex        =   34
         Top             =   270
         Width           =   720
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
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
         Height          =   180
         Index           =   0
         Left            =   2460
         TabIndex        =   33
         Top             =   270
         Width           =   180
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   90
      TabIndex        =   29
      Top             =   60
      Width           =   14205
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
         Left            =   3450
         TabIndex        =   1
         Top             =   240
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCd 
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
         Left            =   2160
         MaxLength       =   7
         TabIndex        =   0
         Top             =   270
         Width           =   1035
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   13650
         Top             =   180
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
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
         Left            =   1140
         TabIndex        =   57
         Top             =   900
         Width           =   720
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
         Height          =   165
         Left            =   2160
         TabIndex        =   56
         Top             =   750
         Width           =   2235
      End
      Begin VB.Label lblKanji 
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
         Left            =   2130
         TabIndex        =   55
         Top             =   1020
         Width           =   2235
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
         Index           =   1
         Left            =   6000
         TabIndex        =   54
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
         Left            =   6780
         TabIndex        =   53
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
         Left            =   7620
         TabIndex        =   52
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
         Left            =   5820
         TabIndex        =   51
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
         Left            =   6750
         TabIndex        =   50
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
         Left            =   5820
         TabIndex        =   49
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
         Left            =   6750
         TabIndex        =   48
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
         Left            =   7590
         TabIndex        =   47
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
         Left            =   10950
         TabIndex        =   46
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
         Left            =   11100
         TabIndex        =   45
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
         Left            =   10620
         TabIndex        =   44
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
         Left            =   11550
         TabIndex        =   43
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
         Left            =   11550
         TabIndex        =   42
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
         Left            =   11550
         TabIndex        =   41
         Top             =   930
         Width           =   1305
      End
      Begin VB.Label Label1 
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
         Index           =   0
         Left            =   1140
         TabIndex        =   30
         Top             =   330
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
      TabIndex        =   28
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
         TabIndex        =   13
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
         TabIndex        =   14
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
         TabIndex        =   18
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
         TabIndex        =   19
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
         TabIndex        =   15
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
         TabIndex        =   20
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
         TabIndex        =   21
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
         TabIndex        =   22
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
         TabIndex        =   23
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
         TabIndex        =   16
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
         TabIndex        =   24
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
         TabIndex        =   17
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
      TabIndex        =   26
      TabStop         =   0   'False
      Top             =   7110
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
         TabIndex        =   27
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   25
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
            TextSave        =   "2014/03/27"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "11:54"
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
Attribute VB_Name = "frmQPAV_CEnt030"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                         1.����߂����̖��������E�����\��
'                         2.�������̋敪�u�U���݁v��ǉ�
'----------------------------------------------------------------------------------------------

Private Sub cmdName_Click()

    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCd = Right(gstrDat, 7)
        If Trim(Left(gstrDat, 1)) = "" Then
'            Call cmdPFK_Click(5)
        Else
            'Msg = ���̎Ј��R�[�h�͏����Z���𗘗p�ł��܂���B
            lblMsg.Caption = "WPOE34 " & gstrGetCodeMeisyo(odbDatabase, "E34", "WPO")
            txtSyainCd.BackColor = vbRed
            txtSyainCd.SetFocus
        End If
    End If

End Sub

Private Sub cmdPrint_Click(Index As Integer)
    Select Case Index
        Case 0
            If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�Ј������Z���v�Z��") = vbCancel Then
                Exit Sub
            End If
            Call subPrintReport(crptToWindow)
        Case 1
            If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�Ј������Z���v�Z��") = vbCancel Then
                Exit Sub
            End If
            Call subPrintReport(crptToPrinter)
    End Select
End Sub

'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
            Exit Sub
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
            Exit Sub
        Case 12 '���
            Call subFormInitialize
            txtSyainCd.SetFocus
    
    End Select
    
End Sub

'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "�Ј������Z���v�Z�����"
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�Ј������Z���v�Z����� (" & gstrCommandLine(8) & ") " _
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
                                    , "�Ј������Z���v�Z����� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        Call gsubKamiSimoSet
    
        Call GetZanYMD
        
        '��ʏ�����
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
    
Exit_Form_Activate:
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False
    
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
    
    Me.Caption = "�Ј������Z���v�Z����� (" & gstrCommandLine(8) & ")"
    
    '��ʏ�����
    blnLoadFlg = True
    sprList.MaxRows = 0

    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    '�g�p���[�N�e�[�u���S�폜
    Call subDelWorkTbl
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt030 = Nothing

End Sub


Private Sub optSeisan_Click(Index As Integer)
    Dim i As Integer
    
    lblMsg.Caption = ""
    Select Case Index
        Case 0      '���Z����
            txtSeisanbiY.Text = Format(gdatSysDate, "yyyy")
            txtSeisanbiM.Text = Format(gdatSysDate, "mm")
            'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
            '25�����f�t�H���g�ŕ\������悤�ɂ���
            'txtSeisanbiD.Text = Format(gdatSysDate, "dd")
            txtSeisanbiD.Text = "25"
            'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END
            txtSeisanbiY.Enabled = True
            txtSeisanbiM.Enabled = True
            txtSeisanbiD.Enabled = True
            txtSeisanbiY.BackColor = vbWhite
            txtSeisanbiM.BackColor = vbWhite
            txtSeisanbiD.BackColor = vbWhite
            txtSYuturyokuhani.BackColor = &H8000000F
            txtSYuturyokuhani.Enabled = False
            txtSYuturyokuhani.Text = gstrSyuYYYY
            If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/" & gstrKamiStD) < 0 Then
                If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/" & gstrSimoStD) < 0 Then
                    optKamiSimoKi(1).Value = True
                Else
                    optKamiSimoKi(0).Value = True
                End If
            Else
                optKamiSimoKi(0).Value = True
            End If
            For i = 0 To 1
                optKamiSimoKi(i).Enabled = False
            Next i
            txtSeisanbiY.SetFocus
        Case 1      '���Z���Ȃ�
            txtSeisanbiY.Text = ""
            txtSeisanbiM.Text = ""
            txtSeisanbiD.Text = ""
            txtSeisanbiY.BackColor = &H8000000F
            txtSeisanbiM.BackColor = &H8000000F
            txtSeisanbiD.BackColor = &H8000000F
            txtSeisanbiY.Enabled = False
            txtSeisanbiM.Enabled = False
            txtSeisanbiD.Enabled = False
            txtSYuturyokuhani.BackColor = vbWhite
            txtSYuturyokuhani.Enabled = True
            For i = 0 To 1
                optKamiSimoKi(i).Enabled = True
            Next i
            If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/" & gstrKamiStD) < 0 Then
                If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/" & gstrSimoStD) < 0 Then
                    optKamiSimoKi(1).Value = True
                Else
                    optKamiSimoKi(0).Value = True
                End If
            Else
                optKamiSimoKi(0).Value = True
            End If
            txtSYuturyokuhani.Text = gstrSyuYYYY
            txtSYuturyokuhani.SetFocus
    End Select
    
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSeisanbid_GotFocus()
    Call gsubSelectText(txtSeisanbiD)
End Sub

'******************************************
'* ���͕�������i�����̂݁j
'******************************************
Private Sub txtSeisanbiD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSeisanbim_Change()
    Call gsubMaxCharSkipEX(txtSeisanbiM, 2)
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSeisanbim_GotFocus()
    Call gsubSelectText(txtSeisanbiM)
End Sub

'******************************************
'* ���͕�������i�����̂݁j
'******************************************
Private Sub txtSeisanbim_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSeisanbiY_Change()
    Call gsubMaxCharSkipEX(txtSeisanbiY, 4)
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSeisanbiY_GotFocus()
    Call gsubSelectText(txtSeisanbiY)
End Sub

'******************************************
'* ���͕�������i�����̂݁j
'******************************************
Private Sub txtSeisanbiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSyainCd_Change()
    Call gsubMaxCharSkipEX(txtSyainCd, 7)
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyainCd_GotFocus()
    Call gsubSelectText(txtSyainCd)
End Sub

'******************************************
'* ���͕�������i�����̂݁j
'******************************************
Private Sub txtSyainCd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSYuturyokuhani_GotFocus()
    Call gsubSelectText(txtSYuturyokuhani)
End Sub

'******************************************
'* ���͕�������i�����̂݁j
'******************************************
Private Sub txtSYuturyokuhani_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'*************************************************************************************************
'*���̓`�F�b�N
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    '�Ј��R�[�h���̓`�F�b�N
    If Trim$(txtSyainCd) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCd.BackColor = vbRed
        txtSyainCd.Enabled = True
        txtSyainCd.SetFocus
        Exit Function
    End If
            
    '�{�^���ʓ��̓`�F�b�N
    If optSeisan(0).Value = True Then
        If Trim$(txtSeisanbiY) = "" Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            txtSeisanbiY.BackColor = vbRed
            txtSeisanbiY.Enabled = True
            txtSeisanbiY.SetFocus
            Exit Function
        End If
        txtSeisanbiY = Format(txtSeisanbiY, "0000")
        
        If Trim$(txtSeisanbiM) = "" Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            txtSeisanbiM.BackColor = vbRed
            txtSeisanbiM.Enabled = True
            txtSeisanbiM.SetFocus
            Exit Function
        End If
        txtSeisanbiM = Format(txtSeisanbiM, "00")
        
        If Trim$(txtSeisanbiD) = "" Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            txtSeisanbiD.BackColor = vbRed
            txtSeisanbiD.Enabled = True
            txtSeisanbiD.SetFocus
            Exit Function
        End If
        txtSeisanbiD = Format(txtSeisanbiD, "00")
        
        If Not IsDate(txtSeisanbiY.Text & "," & txtSeisanbiM.Text & "," & txtSeisanbiD.Text) Then
            'Msg = �͓��t�œ��͂��ĉ������B
            lblMsg.Caption = "WPOE03 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtSeisanbiY.BackColor = vbRed
            txtSeisanbiM.BackColor = vbRed
            txtSeisanbiD.BackColor = vbRed
            txtSeisanbiY.SetFocus
            Exit Function
        End If
        
        If DateDiff("y", txtSeisanbiY.Text & "/" & txtSeisanbiM.Text & "/" & txtSeisanbiD.Text, gstrZanYMD) > 0 Then
            'Msg = �ŐV�̎c���X�V��(�j�ȑO�̓��t�͓��͂ł��܂���B
            lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
            txtSeisanbiY.BackColor = vbRed
            txtSeisanbiM.BackColor = vbRed
            txtSeisanbiD.BackColor = vbRed
            txtSeisanbiY.SetFocus
            Exit Function
        End If
        
'�������������yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/26������������������������������������������������������������������������
    
        'SP�̗����z����Ƀf�[�^�����߂邽�߂ɐ���
        If DateDiff("m", gdatSysDate, txtSeisanbiY.Text & "/" & txtSeisanbiM.Text & "/" & txtSeisanbiD.Text) > 60 Then
            'Msg = ���Z���͂T�N�ȓ��œ��͂��Ă��������B
            lblMsg.Caption = "WHOE35 " & gstrGetCodeMeisyo(odbDatabase, "E35", "WPO")
            txtSeisanbiY.BackColor = vbRed
            txtSeisanbiM.BackColor = vbRed
            txtSeisanbiD.BackColor = vbRed
            txtSeisanbiY.SetFocus
            Exit Function
        End If
    
'�������������yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/26������������������������������������������������������������������������
    
    Else
        If Trim$(txtSYuturyokuhani) = "" Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 �o�͔͈�" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            txtSYuturyokuhani.BackColor = vbRed
            txtSYuturyokuhani.Enabled = True
            txtSYuturyokuhani.SetFocus
            Exit Function
        End If
        txtSYuturyokuhani = Format(txtSYuturyokuhani, "0000")
        
        If Val(txtSYuturyokuhani.Text) < Val(gstrSyuYYYY) - 6 Then
            'Msg = �o�͔͈͂��������w�肳��Ă��܂���B
            lblMsg.Caption = "WPOE15 " & gstrGetCodeMeisyo(odbDatabase, "E15", "WPO")
            txtSYuturyokuhani.BackColor = vbRed
            txtSYuturyokuhani.Enabled = True
            txtSYuturyokuhani.SetFocus
            Exit Function
        End If
        
        If optKamiSimoKi(0).Value = False And optKamiSimoKi(1).Value = False Then
            'Msg = ����܂��͉�����I�����Ă��������B
            lblMsg.Caption = "WPOE16 " & gstrGetCodeMeisyo(odbDatabase, "E16", "WPO")
            Exit Function
        End If
        
        If optKamiSimoKi(0).Value = True Then
            If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/" & gstrKamiStD) > 0 Then
                'Msg = �o�͔͈͂��������w�肳��Ă��܂���B
                lblMsg.Caption = "WPOE15 " & gstrGetCodeMeisyo(odbDatabase, "E15", "WPO")
                txtSYuturyokuhani.BackColor = vbRed
                txtSYuturyokuhani.Enabled = True
                txtSYuturyokuhani.SetFocus
                Exit Function
            End If
        ElseIf optKamiSimoKi(1).Value = True Then
            If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/" & gstrSimoStD) > 0 Then
                'Msg = �o�͔͈͂��������w�肳��Ă��܂���B
                lblMsg.Caption = "WPOE15 " & gstrGetCodeMeisyo(odbDatabase, "E15", "WPO")
                txtSYuturyokuhani.BackColor = vbRed
                txtSYuturyokuhani.Enabled = True
                txtSYuturyokuhani.SetFocus
                Exit Function
            End If
        End If
    End If
    
    funcChk = True

End Function

'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String
    Dim i         As Long

    Call subErrKaijo
    
    cmdPFK(5).SetFocus
    
    '���̓`�F�b�N
    If funcChk = False Then Exit Sub
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
                
    'SP�p�ϐ��ɑޔ�
    gstrCode = txtSyainCd.Text
    If optKamiSimoKi(0).Value = True Then
        gstrStrYMD1 = txtSYuturyokuhani.Text & gstrKamiStM & gstrKamiStD
        gstrStrYMD2 = Format(DateAdd("m", -2, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/26"), "yyyymmdd")
        gstrStrYMD3 = Format(DateAdd("m", -1, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/25"), "yyyymmdd")
    Else
        gstrStrYMD1 = txtSYuturyokuhani.Text & gstrSimoStM & gstrSimoStD
        gstrStrYMD2 = Format(DateAdd("m", -2, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/26"), "yyyymmdd")
        gstrStrYMD3 = Format(DateAdd("m", -1, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/25"), "yyyymmdd")
    End If
    If optSeisan(0).Value = True Then
        'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
        '���Z����̏ꍇ�́A�I�y���[�V�������̂P������\������悤�ɏC��
        gstrStrYMD1 = Format(gdatSysDate, "yyyymm") & "01"
        gstrStrYMD2 = Format(DateAdd("m", -2, Mid(gstrStrYMD1, 1, 4) & "/" & Mid(gstrStrYMD1, 5, 2) & "/26"), "yyyymmdd")
        gstrStrYMD3 = Format(DateAdd("m", -1, Mid(gstrStrYMD1, 1, 4) & "/" & Mid(gstrStrYMD1, 5, 2) & "/25"), "yyyymmdd")
        'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END
        
        gstrKbn = "0"
        gstrSeiYMD = txtSeisanbiY.Text & txtSeisanbiM.Text & txtSeisanbiD.Text
        gstrEndYMD = gstrSeiYMD
    Else
        gstrKbn = "1"
        gstrSeiYMD = Format(gdatSysDate, "yyyymmdd")
        gstrEndYMD = gstrSeiYMD
    End If
    gstrSyuYear = txtSYuturyokuhani.Text
    
    If gfuncSeachSyain = False Then
        'Msg = �Ј����������݂��܂���B
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCd.SetFocus
        txtSyainCd.BackColor = vbRed
        GoTo Exit_subCmdJikkou
    End If
    
    If Not gfuncSPSet Then
        txtSyainCd.SetFocus
    End If
    
Exit_subCmdJikkou:
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""

End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""

    txtSyainCd.BackColor = vbWhite
    If optSeisan(0).Value = True Then
        txtSeisanbiY.BackColor = vbWhite
        txtSeisanbiM.BackColor = vbWhite
        txtSeisanbiD.BackColor = vbWhite
    Else
        txtSYuturyokuhani.BackColor = vbWhite
    End If
    
End Sub

'*************************************************************************************************
'* ��ʏ�����
'*************************************************************************************************
Private Sub subFormInitialize()
    Dim i As Integer
    
    txtSyainCd.Text = ""
    lblKana.Caption = ""
    lblKanji.Caption = ""
    lblTenCd.Caption = ""
    lblTenNm.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonNm.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    txtSYuturyokuhani.Text = gstrSyuYYYY
    txtSeisanbiY.Text = Format(gdatSysDate, "yyyy")
    txtSeisanbiM.Text = Format(gdatSysDate, "mm")
    'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
    '25�����f�t�H���g�ŕ\������悤�ɂ���
    'txtSeisanbiD.Text = Format(gdatSysDate, "dd")
    txtSeisanbiD.Text = "25"
    'MOD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END
    
    lblMsg.Caption = ""
    
    'Spred Sheet�̏�����
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '�㕔�g�p����
    txtSyainCd.Enabled = True
    txtSeisanbiY.Enabled = True
    txtSeisanbiM.Enabled = True
    txtSeisanbiD.Enabled = True
    txtSeisanbiY.BackColor = vbWhite
    txtSeisanbiM.BackColor = vbWhite
    txtSeisanbiD.BackColor = vbWhite
    txtSYuturyokuhani.BackColor = &H8000000F
    txtSYuturyokuhani.Enabled = False
    optKamiSimoKi(0).Caption = "����i" & Right(Space$(2) & Format(gstrKamiStM, "0"), 2) & "���`" & Right(Space$(2) & Format(gstrChuKesM, "0"), 2) & "���j"
    optKamiSimoKi(1).Caption = "�����i" & Right(Space$(2) & Format(gstrSimoStM, "0"), 2) & "���`" & Right(Space$(2) & Format(gstrKesM, "0"), 2) & "���j"
    If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrKamiStM & "/" & gstrKamiStD) < 0 Then
        If DateDiff("y", gdatSysDate, txtSYuturyokuhani.Text & "/" & gstrSimoStM & "/" & gstrSimoStD) < 0 Then
            optKamiSimoKi(1).Value = True
        Else
            optKamiSimoKi(0).Value = True
        End If
    Else
        optKamiSimoKi(0).Value = True
    End If
    For i = 0 To 1
        optKamiSimoKi(i).Enabled = False
        optSeisan(i).Enabled = True
    Next i
    optSeisan(0).Value = True
    txtSyainCd.BackColor = vbWhite
    cmdName.Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    cmdPFK(5).Enabled = True

    'ADD 20100225 0908047 NBC ISHIDA START
    '�������̃R�����g���\��
    lblModAnnai1.Visible = False
    lblModAnnai2.Visible = False
    lbltxtGan.Visible = False
    lbltxtRisoku.Visible = False
    lblModGan.Visible = False
    lblModRisoku.Visible = False
    lblModGan.Caption = ""
    lblModRisoku.Caption = ""
    'ADD 20100225 0908047 NBC ISHIDA END


End Sub

'�N���X�^�����|�[�g
Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
    
    Dim strSelectionFormula As String
    Dim strConectPoint      As String
    Dim intRet              As Integer
    
    lblMsg.Caption = ""
    Me.Enabled = False
    Me.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "������D�D�D"
    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt030.rpt"
        .DiscardSavedData = True
            
        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAI_KGCKEISANW"
        
        '���o�������L�q����
        strSelectionFormula = "({QPAI_KGCKEISANW.QPAI_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPAI_KGCKEISANW.QPAI_COMPUTERNM} = '" & gstrCommandLine(5) & "')"

        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants
        
        If intDestinationConstants = crptToWindow Then
            .WindowTitle = "�����Z���v�Z��"
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

    strSQL = "BEGIN QPAP_CEnt030PkG.QPAP_CEnt030DelWorkTbl(" & _
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


