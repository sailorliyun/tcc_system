VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt101 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�l�ݕt����"
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
      Height          =   375
      Index           =   0
      Left            =   12030
      TabIndex        =   3
      Top             =   6615
      Width           =   1065
   End
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
      Height          =   375
      Index           =   1
      Left            =   13170
      TabIndex        =   4
      Top             =   6630
      Width           =   1065
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1245
      Left            =   90
      TabIndex        =   58
      Top             =   390
      Width           =   14235
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   270
         Top             =   360
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.Label lblSyainCD1 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2370
         TabIndex        =   91
         Top             =   330
         Width           =   150
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
         TabIndex        =   83
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
         Left            =   11100
         TabIndex        =   82
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
         Left            =   10620
         TabIndex        =   81
         Top             =   930
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
         TabIndex        =   80
         Top             =   240
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
         TabIndex        =   79
         Top             =   570
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
         TabIndex        =   78
         Top             =   900
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
         Height          =   165
         Index           =   1
         Left            =   7650
         TabIndex        =   77
         Top             =   930
         Width           =   2385
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
         Left            =   6960
         TabIndex        =   76
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
         Left            =   5970
         TabIndex        =   75
         Top             =   960
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
         Left            =   6960
         TabIndex        =   74
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
         Left            =   5970
         TabIndex        =   73
         Top             =   600
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
         Height          =   195
         Index           =   1
         Left            =   7710
         TabIndex        =   72
         Top             =   240
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
         Left            =   6960
         TabIndex        =   71
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
         Left            =   6120
         TabIndex        =   70
         Top             =   240
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
         Height          =   165
         Left            =   2250
         TabIndex        =   69
         Top             =   930
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
         Height          =   165
         Left            =   2280
         TabIndex        =   68
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
         Left            =   1380
         TabIndex        =   67
         Top             =   810
         Width           =   720
      End
      Begin VB.Label lblSyainCD2 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2580
         TabIndex        =   60
         Top             =   330
         Width           =   1080
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
         Left            =   1410
         TabIndex        =   59
         Top             =   330
         Width           =   810
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   4665
      Left            =   105
      TabIndex        =   21
      Top             =   1740
      Width           =   14235
      Begin VB.TextBox txtDateFromD 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   5670
         MaxLength       =   2
         TabIndex        =   2
         Top             =   1230
         Width           =   420
      End
      Begin VB.TextBox txtDateFromM 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   4830
         MaxLength       =   2
         TabIndex        =   1
         Top             =   1230
         Width           =   420
      End
      Begin VB.TextBox txtDateFromY 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  '�̌Œ�
         Left            =   3750
         MaxLength       =   4
         TabIndex        =   0
         Top             =   1230
         Width           =   690
      End
      Begin VB.PictureBox Picture2 
         BackColor       =   &H00800000&
         Height          =   345
         Left            =   2400
         ScaleHeight     =   285
         ScaleWidth      =   915
         TabIndex        =   26
         Top             =   3000
         Width           =   975
         Begin VB.Label Label25 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�ܗ^"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   12
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   240
            Left            =   255
            TabIndex        =   27
            Top             =   15
            Width           =   480
         End
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00800000&
         Height          =   345
         Left            =   2400
         ScaleHeight     =   285
         ScaleWidth      =   915
         TabIndex        =   24
         Top             =   2640
         Width           =   975
         Begin VB.Label Label24 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "���^"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   12
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   240
            Left            =   240
            TabIndex        =   25
            Top             =   30
            Width           =   480
         End
      End
      Begin VB.PictureBox Picture6 
         BackColor       =   &H00800000&
         Height          =   345
         Left            =   2400
         ScaleHeight     =   285
         ScaleWidth      =   915
         TabIndex        =   22
         Top             =   3345
         Width           =   975
         Begin VB.Label Label2 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�v"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   12
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   240
            Left            =   360
            TabIndex        =   23
            Top             =   0
            Width           =   240
         End
      End
      Begin VB.Label lblSyoyoModRisokuAll 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblSyoyoModRisokuAll"
         Height          =   300
         Left            =   11655
         TabIndex        =   106
         Top             =   3045
         Width           =   1905
      End
      Begin VB.Label lblKyuyoModRisokuAll 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblKyuyoModRisokuAll"
         Height          =   300
         Left            =   11655
         TabIndex        =   105
         Top             =   2730
         Width           =   1905
      End
      Begin VB.Label lblSyoyoModAll 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblSyoyoModAll"
         Height          =   300
         Left            =   11655
         TabIndex        =   104
         Top             =   2415
         Width           =   1905
      End
      Begin VB.Label lblKyuyoModAll 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblKyuyoModAll"
         Height          =   300
         Left            =   11655
         TabIndex        =   103
         Top             =   2100
         Width           =   1905
      End
      Begin VB.Label lblModRisoku 
         Alignment       =   1  '�E����
         Caption         =   "lblModRisoku"
         Height          =   225
         Left            =   9660
         TabIndex        =   102
         Top             =   4170
         Width           =   1275
      End
      Begin VB.Label lblModGan 
         Alignment       =   1  '�E����
         Caption         =   "lblModGan"
         Height          =   225
         Left            =   9660
         TabIndex        =   101
         Top             =   3945
         Width           =   1275
      End
      Begin VB.Label lbltxtRisoku 
         Caption         =   "�����F"
         Height          =   225
         Left            =   9030
         TabIndex        =   100
         Top             =   4170
         Width           =   645
      End
      Begin VB.Label lbltxtGan 
         Caption         =   "���{�F"
         Height          =   225
         Left            =   9030
         TabIndex        =   99
         Top             =   3945
         Width           =   645
      End
      Begin VB.Label lblModAnnai 
         Caption         =   "���c���{�A�������z�ɂ͖��������܂܂�Ă��܂��B"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   6825
         TabIndex        =   98
         Top             =   3705
         Width           =   4530
      End
      Begin VB.Label lblSyoyoModRisoku 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblSyoyoModRisoku"
         Height          =   300
         Left            =   11655
         TabIndex        =   97
         Top             =   1785
         Width           =   1905
      End
      Begin VB.Label lblKyuyoModRisoku 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblKyuyoModRisoku"
         Height          =   300
         Left            =   11655
         TabIndex        =   96
         Top             =   1470
         Width           =   1905
      End
      Begin VB.Label lblSyoyoMod 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblSyoyoMod"
         Height          =   300
         Left            =   11655
         TabIndex        =   95
         Top             =   1155
         Width           =   1905
      End
      Begin VB.Label lblKyuyoMod 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblKyuyoMod"
         Height          =   300
         Left            =   11655
         TabIndex        =   94
         Top             =   840
         Width           =   1905
      End
      Begin VB.Label lblSyoyoHen 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblSyoyoHen"
         Height          =   300
         Left            =   11655
         TabIndex        =   93
         Top             =   525
         Width           =   1905
      End
      Begin VB.Label lblKyuyoHen 
         BackColor       =   &H00FF00FF&
         Caption         =   "lblKyuyoHen"
         Height          =   300
         Left            =   11655
         TabIndex        =   92
         Top             =   210
         Width           =   1905
      End
      Begin VB.Label lblTenbikiKyuuyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   10065
         TabIndex        =   90
         Top             =   2640
         Width           =   1185
      End
      Begin VB.Label Label39 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   5370
         TabIndex        =   66
         Top             =   1260
         Width           =   240
      End
      Begin VB.Label Label40 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�N"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   4500
         TabIndex        =   65
         Top             =   1290
         Width           =   240
      End
      Begin VB.Label Label41 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   6210
         TabIndex        =   64
         Top             =   1260
         Width           =   240
      End
      Begin VB.Label Label42 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���Z�N����"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   2250
         TabIndex        =   63
         Top             =   1290
         Width           =   1200
      End
      Begin VB.Label Label48 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         BorderStyle     =   1  '����
         Caption         =   "�ԑ����z"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   345
         Left            =   2310
         TabIndex        =   62
         Top             =   4080
         Width           =   1320
      End
      Begin VB.Label lblHensou 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   390
         Left            =   3720
         TabIndex        =   61
         Top             =   4050
         Width           =   2085
      End
      Begin VB.Label lblKaisuuKyuuyo 
         Alignment       =   1  '�E����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   7470
         TabIndex        =   57
         Top             =   480
         Width           =   735
      End
      Begin VB.Label lblyuusikyuuyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   3375
         TabIndex        =   56
         Top             =   2625
         Width           =   2010
      End
      Begin VB.Label lblYuusibiD 
         Alignment       =   1  '�E����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   240
         Left            =   5700
         TabIndex        =   55
         Top             =   465
         Width           =   330
      End
      Begin VB.Label lblYuusibiM 
         Alignment       =   1  '�E����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   240
         Left            =   4830
         TabIndex        =   54
         Top             =   465
         Width           =   420
      End
      Begin VB.Label lblYuusibiY 
         Alignment       =   1  '�E����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   240
         Left            =   3510
         TabIndex        =   53
         Top             =   480
         Width           =   840
      End
      Begin VB.Label Label47 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�Z����"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   2730
         TabIndex        =   52
         Top             =   480
         Width           =   720
      End
      Begin VB.Label Label46 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�N"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   4500
         TabIndex        =   51
         Top             =   480
         Width           =   240
      End
      Begin VB.Label Label23 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   5370
         TabIndex        =   50
         Top             =   480
         Width           =   240
      End
      Begin VB.Label Label22 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   6210
         TabIndex        =   49
         Top             =   480
         Width           =   240
      End
      Begin VB.Label Label34 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         Caption         =   "�Z���z"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Left            =   3405
         TabIndex        =   48
         Top             =   2370
         Width           =   1965
      End
      Begin VB.Label Label26 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         Caption         =   "�c���{"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   0
         Left            =   5415
         TabIndex        =   47
         Top             =   2370
         Width           =   1965
      End
      Begin VB.Label Label27 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Left            =   7455
         TabIndex        =   46
         Top             =   2370
         Width           =   1185
      End
      Begin VB.Label Label26 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         Caption         =   "�O��ԍϓ�"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   8685
         TabIndex        =   45
         Top             =   2370
         Width           =   1350
      End
      Begin VB.Label Label26 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         BackStyle       =   0  '����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   2
         Left            =   6720
         TabIndex        =   44
         Top             =   480
         Width           =   705
      End
      Begin VB.Label Label26 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         BackStyle       =   0  '����
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   3
         Left            =   8310
         TabIndex        =   43
         Top             =   510
         Width           =   915
      End
      Begin VB.Label Label26 
         Alignment       =   2  '��������
         BackColor       =   &H00800000&
         Caption         =   "�V���z"
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   4
         Left            =   10080
         TabIndex        =   42
         Top             =   2355
         Width           =   1185
      End
      Begin VB.Label lblNokoriKyuuyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   5400
         TabIndex        =   41
         Top             =   2625
         Width           =   1995
      End
      Begin VB.Label lblRisokuKyuuyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   7440
         TabIndex        =   40
         Top             =   2655
         Width           =   1230
      End
      Begin VB.Label lblZenkaiKyuuyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   8685
         TabIndex        =   39
         Top             =   2655
         Width           =   1365
      End
      Begin VB.Label lblRirituKyuuyo 
         Alignment       =   1  '�E����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   9060
         TabIndex        =   38
         Top             =   510
         Width           =   960
      End
      Begin VB.Label lblyuusiSyouyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   3375
         TabIndex        =   37
         Top             =   3000
         Width           =   2010
      End
      Begin VB.Label lblNokoriSyouyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   5400
         TabIndex        =   36
         Top             =   3000
         Width           =   1995
      End
      Begin VB.Label lblRisokuSyouyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   7440
         TabIndex        =   35
         Top             =   3000
         Width           =   1230
      End
      Begin VB.Label lblZenkaiSyouyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   8685
         TabIndex        =   34
         Top             =   3000
         Width           =   1365
      End
      Begin VB.Label lblTenbikiSyouyo 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   10065
         TabIndex        =   33
         Top             =   2985
         Width           =   1185
      End
      Begin VB.Label lblyuusiKei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   3375
         TabIndex        =   32
         Top             =   3360
         Width           =   2010
      End
      Begin VB.Label lblNokoriKei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   5400
         TabIndex        =   31
         Top             =   3360
         Width           =   1995
      End
      Begin VB.Label lblRisokuKei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   7440
         TabIndex        =   30
         Top             =   3360
         Width           =   1230
      End
      Begin VB.Label lblZenkaiKei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   8685
         TabIndex        =   29
         Top             =   3360
         Width           =   1365
      End
      Begin VB.Label lblTenbikiKei 
         Alignment       =   1  '�E����
         BorderStyle     =   1  '����
         BeginProperty Font 
            Name            =   "�l�r �S�V�b�N"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   10065
         TabIndex        =   28
         Top             =   3345
         Width           =   1185
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
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7620
      Width           =   14385
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         TabIndex        =   5
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   11
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
         Index           =   6
         Left            =   6015
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   15
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
         Index           =   11
         Left            =   11955
         TabIndex        =   16
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
         TabIndex        =   9
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
      Left            =   30
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   18
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
         Left            =   0
         TabIndex        =   19
         Top             =   30
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   17
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
            TextSave        =   "12:02"
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
   Begin VB.Label Label31 
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
      Left            =   13680
      TabIndex        =   89
      Top             =   210
      Width           =   180
   End
   Begin VB.Label Label30 
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
      Left            =   13095
      TabIndex        =   88
      Top             =   210
      Width           =   180
   End
   Begin VB.Label Label29 
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
      Left            =   12510
      TabIndex        =   87
      Top             =   210
      Width           =   180
   End
   Begin VB.Label lblDD 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
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
      Left            =   13500
      TabIndex        =   86
      Top             =   210
      Width           =   60
   End
   Begin VB.Label lblMM 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
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
      Left            =   12945
      TabIndex        =   85
      Top             =   210
      Width           =   60
   End
   Begin VB.Label lblYYYY 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
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
      Left            =   12300
      TabIndex        =   84
      Top             =   210
      Width           =   60
   End
End
Attribute VB_Name = "frmQPAV_CEnt101"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'----------------------------------------------------------------------------------------------
'�X�V���t  �Č��ԍ�  �C���S��        �C�����R
'20090828  0811051  murayama@NBC   �O���[�v�Ј��؏��ݕt���[�������i�P���j
'                                  ���Z�����̓`�F�b�N��ǉ�
'                                 �i�ߋ����̓��͕s�A�������̓��͂͗��������܂ŉƂ���j
'----------------------------------------------------------------------------------------------
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           ����߂��Ή��A�ԑ����z�̎Z�o���@�C��
'----------------------------------------------------------------------------------------------

Dim TenKyuFLG   As String   '10/18 Add
Dim TenSyoFLG   As String   '10/18 Add

Private Sub cmdPrint_Click(Index As Integer)

    Select Case Index
        Case 0
            If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�l�ݕt����") = vbCancel Then
                Exit Sub
            End If
            Call subDataPass
            If gfuncSPAdd = False Then Exit Sub
            Call subPrintReport(crptToWindow)
        Case 1
            If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�l�ݕt����") = vbCancel Then
                Exit Sub
            End If
            Call subDataPass
            If gfuncSPAdd = False Then Exit Sub
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
'        Case 1  '���j���[
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
            Call subCmdJikkou
        Case 10 '�O���
            Unload Me
            Exit Sub
        Case 12 '���
            Call subFormInitialize
            txtDateFromY.SetFocus
    End Select
    
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
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "�l�ݕt���� (" & gstrCommandLine(8) & ")"
    
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

End Sub

Private Sub txtDateFromD_GotFocus()
    
    Call gsubSelectText(txtDateFromD)

End Sub

Private Sub txtDateFromD_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

Private Sub txtDateFromM_Change()
    
    Call gsubMaxCharSkipEX(txtDateFromM, 2)

End Sub

Private Sub txtDateFromM_GotFocus()
    
    Call gsubSelectText(txtDateFromM)

End Sub

Private Sub txtDateFromM_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

Private Sub txtDateFromY_Change()
    
    Call gsubMaxCharSkipEX(txtDateFromY, 4)

End Sub

Private Sub txtDateFromY_GotFocus()
    
    Call gsubSelectText(txtDateFromY)

End Sub

Private Sub txtDateFromY_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
 
    Call subErrKaijo
    
    If funcChk = False Then Exit Sub
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
        
    Call KeisanSet
    
    cmdPrint(0).Enabled = True
    cmdPrint(1).Enabled = True
    cmdPFK(5).Enabled = False
    
    txtDateFromY.Enabled = False
    txtDateFromM.Enabled = False
    txtDateFromD.Enabled = False
    
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents

End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtDateFromY.BackColor = vbWhite
    txtDateFromM.BackColor = vbWhite
    txtDateFromD.BackColor = vbWhite

End Sub

'***********************************************************************************************************
'*��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
    
    '�e�\�����ڃN���A
    lblSyainCD1.Caption = frmQPAV_CEnt100.txtSyainCD1.Text
    lblSyainCD2.Caption = frmQPAV_CEnt100.txtSyainCD2.Text
    
    lblKana.Caption = frmQPAV_CEnt100.lblKana.Caption
    lblShimei.Caption = frmQPAV_CEnt100.lblKanji.Caption
    lblShozoku(0).Caption = frmQPAV_CEnt100.lblShozoku(0).Caption
    lblShozoku(1).Caption = frmQPAV_CEnt100.lblShozoku(1).Caption
    lblTozai.Caption = frmQPAV_CEnt100.lblTozai.Caption
    lblBumon(0).Caption = frmQPAV_CEnt100.lblBumon(0).Caption
    lblBumon(1).Caption = frmQPAV_CEnt100.lblBumon(1).Caption
    lblShikaku.Caption = frmQPAV_CEnt100.lblShikaku.Caption
    lblKyu.Caption = frmQPAV_CEnt100.lblKyu.Caption
    lblSeinengappi.Caption = frmQPAV_CEnt100.lblSeinengappi.Caption
    
    lblYYYY.Caption = frmQPAV_CEnt100.lblYYYY.Caption
    lblMM.Caption = frmQPAV_CEnt100.lblMM.Caption
    lblDD.Caption = frmQPAV_CEnt100.lblDD.Caption
    
    lblYuusibiY.Caption = Year(gVarSpdGetText(frmQPAV_CEnt100.sprList, 1, glngSprCol))
    lblYuusibiM.Caption = Month(gVarSpdGetText(frmQPAV_CEnt100.sprList, 1, glngSprCol))
    lblYuusibiD.Caption = Day(gVarSpdGetText(frmQPAV_CEnt100.sprList, 1, glngSprCol))
    lblRirituKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 3, glngSprCol)
    lblKaisuuKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 4, glngSprCol)
    lblyuusikyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 5, glngSprCol)
    lblyuusiSyouyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 6, glngSprCol)
    lblNokoriKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 7, glngSprCol)
    lblNokoriSyouyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 8, glngSprCol)
    lblZenkaiKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 9, glngSprCol)
    lblZenkaiSyouyo.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 10, glngSprCol)
'ADD 20100225 0908047 NBC SAWAME START
    '�c���{�i���^�A�ܗ^�j
    lblKyuyoHen.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 11, glngSprCol)
    lblSyoyoHen.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 12, glngSprCol)
    '����߂����c���i���^�A�ܗ^�j������߂����t���V�X�e�����t�ȑO��
    lblKyuyoMod.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 13, glngSprCol)
    lblSyoyoMod.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 14, glngSprCol)
    '�c���{�ɑ΂��闘���i���^�A�ܗ^�j��������߂����t�V�X�e�����t�ȑO��
    lblKyuyoModRisoku.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 15, glngSprCol)
    lblSyoyoModRisoku.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 16, glngSprCol)
    '�c���{�i���^����߂����A�ܗ^����߂����j������߂����t�ɂ�����炸�S��
    lblKyuyoModAll.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 17, glngSprCol)
    lblSyoyoModAll.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 18, glngSprCol)
    '����߂��������i���^�A�ܗ^�j������߂����t�ɂ�����炸�S��
    lblKyuyoModRisokuAll.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 19, glngSprCol)
    lblSyoyoModRisokuAll.Caption = gVarSpdGetText(frmQPAV_CEnt100.sprList, 20, glngSprCol)
    '��ʉ��́u����߂����z�\���v�͕���߂����t�ɂ�����炸�S�Ă̋��z��\������
    lblModGan.Caption = Format(Val(Format(lblKyuyoModAll.Caption, "###0")) + Val(Format(lblSyoyoModAll.Caption, "###0")), "#,##0") + "�~"
    lblModRisoku.Caption = Format(Val(Format(lblKyuyoModRisokuAll.Caption, "###0")) + Val(Format(lblSyoyoModRisokuAll.Caption, "###0")), "#,##0") + "�~"
    '����߂����{(�S��) + ����߂�����(�S��) <> 0 �ł���Ε���߂����z�\��
    If Val(Format(lblModGan.Caption, "###0")) + Val(Format(lblModRisoku.Caption, "###0")) <> 0 Then
        lblModGan.Visible = True
        lblModRisoku.Visible = True
        lblModAnnai.Visible = True
        lbltxtGan.Visible = True
        lbltxtRisoku.Visible = True
    Else
        lblModGan.Visible = False
        lblModRisoku.Visible = False
        lblModAnnai.Visible = False
        lbltxtGan.Visible = False
        lbltxtRisoku.Visible = False
    End If
'ADD 20100225 0908047 NBC SAWAME END
    lblTenbikiKyuuyo.Caption = Format(gtblKeisan(glngSprCol).KyuyoHen, "#,##0")
    lblTenbikiSyouyo.Caption = Format(gtblKeisan(glngSprCol).SyoyoHen, "#,##0")
'MOD 20100225 0908047 NBC SAWAME START
'    lblRisokuKyuuyo.Caption = 0
'    lblRisokuSyouyo.Caption = 0
    '����߂��������\��(����߂������V�X�e�����t�ȑO�̕�)
    lblRisokuKyuuyo.Caption = Format(gtblKeisan(glngSprCol).KyuyoModRisoku, "#,##0")
    lblRisokuSyouyo.Caption = Format(gtblKeisan(glngSprCol).SyoyoModRisoku, "#,##0")
'MOD 20100225 0908047 NBC SAWAME END
    lblyuusiKei.Caption = Format(Val(Format(lblyuusikyuuyo.Caption, "###0")) + Val(Format(lblyuusiSyouyo.Caption, "###0")), "#,##0")
    lblNokoriKei.Caption = Format(Val(Format(lblNokoriKyuuyo.Caption, "###0")) + Val(Format(lblNokoriSyouyo.Caption, "###0")), "#,##0")
    lblRisokuKei.Caption = Format(Val(Format(lblRisokuKyuuyo.Caption, "###0")) + Val(Format(lblRisokuSyouyo.Caption, "###0")), "#,##0")
    lblZenkaiKei.Caption = ""
    lblTenbikiKei.Caption = Format(Val(Format(lblTenbikiKyuuyo.Caption, "###0")) + Val(Format(lblTenbikiSyouyo.Caption, "###0")), "#,##0")
    
    txtDateFromY.Text = Format(gdatSysDate, "yyyy")
    txtDateFromM.Text = Format(gdatSysDate, "mm")
    txtDateFromD.Text = Format(gdatSysDate, "dd")
    
    lblHensou.Caption = ""
    
    cmdPFK(5).Enabled = True
    
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    
    txtDateFromY.Enabled = True
    txtDateFromM.Enabled = True
    txtDateFromD.Enabled = True
    
    txtDateFromY.BackColor = vbWhite
    txtDateFromM.BackColor = vbWhite
    txtDateFromD.BackColor = vbWhite
    
'ADD 20100225 0908047 NBC SAWAME START
'��\�����x��
    lblKyuyoHen.Visible = False
    lblSyoyoHen.Visible = False
    lblKyuyoMod.Visible = False
    lblSyoyoMod.Visible = False
    lblKyuyoModRisoku.Visible = False
    lblSyoyoModRisoku.Visible = False
    lblKyuyoModAll.Visible = False
    lblSyoyoModAll.Visible = False
    lblKyuyoModRisokuAll.Visible = False
    lblSyoyoModRisokuAll.Visible = False
'ADD 20100225 0908047 NBC SAWAME END
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)

    '10/18 Add
    TenKyuFLG = ""
    TenSyoFLG = ""

End Sub

Private Function funcChk() As Boolean

    funcChk = False
    
    If txtDateFromY.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtDateFromY.BackColor = vbRed
        txtDateFromY.SetFocus
        Exit Function
    End If
    txtDateFromY.Text = Format(txtDateFromY.Text, "0000")
    
    If txtDateFromM.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtDateFromM.BackColor = vbRed
        txtDateFromM.SetFocus
        Exit Function
    End If
    txtDateFromM.Text = Format(txtDateFromM.Text, "00")
    
    If txtDateFromD.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtDateFromD.BackColor = vbRed
        txtDateFromD.SetFocus
        Exit Function
    End If
    txtDateFromD.Text = Format(txtDateFromD.Text, "00")
    
    If Not IsDate(txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text) Then
        'Msg = �͓��t�œ��͂��ĉ������B
        lblMsg.Caption = "WPOE03 ���Z��" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtDateFromY.BackColor = vbRed
        txtDateFromM.BackColor = vbRed
        txtDateFromD.BackColor = vbRed
        txtDateFromY.SetFocus
        Exit Function
    End If
    
'DEL 20090828 0811051 NBC MURAYAMA START
'    If DateDiff("y", txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text, gstrZanYMD) > 0 Then
'        'Msg = �ŐV�̎c���X�V��(�j�ȑO�̓��t�͓��͂ł��܂���B
'        lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
'        lblMsg.Caption = "�ŐV�̎c���X�V���i" & gstrZanYMD & "�j���O�̓��t�͓��͂ł��܂���B"
'        txtDateFromY.BackColor = vbRed
'        txtDateFromM.BackColor = vbRed
'        txtDateFromD.BackColor = vbRed
'        txtDateFromY.SetFocus
'        Exit Function
'    End If
'DEL 20090828 0811051 NBC MURAYAMA END
    
'MOD 20090828 0811051 NBC MURAYAMA START
    If DateDiff("y", txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text, gdatSysDate) > 0 Then
        '�ߋ����̃`�F�b�N
        lblMsg.Caption = "WPOE20 " & gstrGetCodeMeisyo(odbDatabase, "E20", "WPO")
        txtDateFromY.BackColor = vbRed
        txtDateFromM.BackColor = vbRed
        txtDateFromD.BackColor = vbRed
        txtDateFromY.SetFocus
        Exit Function
        
    ElseIf DateDiff("m", txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text, gdatSysDate) < -1 Then
        '�������̃`�F�b�N
        lblMsg.Caption = "WPOE39 ���X�����" & gstrGetCodeMeisyo(odbDatabase, "E39", "WPO")
        txtDateFromY.BackColor = vbRed
        txtDateFromM.BackColor = vbRed
        txtDateFromD.BackColor = vbRed
        txtDateFromY.SetFocus
        Exit Function
    End If
'MOD 20090828 0811051 NBC MURAYAMA END
    
    funcChk = True
    
End Function

'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�l�ݕt����", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt101.Name, _
              strErrCode, _
              strErrMsg)

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
        .ReportFileName = App.Path & "\QPAV_CEnt100.rpt"
        .DiscardSavedData = True
            
        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAM_SYNKEISANW"
        
        '���o�������L�q����
        strSelectionFormula = "({QPAM_SYNKEISANW.QPAM_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPAM_SYNKEISANW.QPAM_COMPUTERNM} = '" & gstrCommandLine(5) & "')"

        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants
        
        If intDestinationConstants = crptToWindow Then
            .WindowTitle = "�l�ݕt����"
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

Private Sub KeisanSet()
        
    Dim KyuyoZenYMD_WORK    As String
    Dim SyoyoZenYMD_WORK    As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    
    Dim YusiYMD_WORK        As String
    Dim seiYMD_WORK         As String
    Dim KyuyoZan_Work       As Long
    Dim SyoyoZan_Work       As Long
    
    Dim Riritu_Work         As Double   '10/24 Add
    
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama Start
    Dim BeforeBeforeYMD_WORK As Date '�O�X��ܗ^��
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End
    
    YusiYMD_WORK = lblYuusibiY.Caption & "/" & lblYuusibiM.Caption & "/" & lblYuusibiD.Caption
    seiYMD_WORK = txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text
'MOD 20100225 0908047 NBC SAWAME START
'    KyuyoZan_Work = lblNokoriKyuuyo.Caption
'    SyoyoZan_Work = lblNokoriSyouyo.Caption
    '�������񕪉�߂������܂܂Ȃ��c���{�ɖ߂�
    KyuyoZan_Work = lblKyuyoHen.Caption
    SyoyoZan_Work = lblSyoyoHen.Caption
    lblNokoriKyuuyo.Caption = lblKyuyoHen.Caption
    lblNokoriSyouyo.Caption = lblSyoyoHen.Caption
'MOD 20100225 0908047 NBC SAWAME END

    Riritu_Work = Fix(gtblKeisan(glngSprCol).Riritu / 36500 * 1000000) / 1000000       '10/24 Add

'ADD 20100225 0908047 NBC SAWAME START
    '���^�c���{������ꍇ�̂݌v�Z���s���i�c���{������߂����݂̂̏ꍇ�͍s��Ȃ��j
    If CLng(lblKyuyoHen.Caption) <> 0 Then
'ADD 20100225 0908047 NBC SAWAME END
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama Start
    If Day(gdatSysDate) >= 25 And lblZenkaiKyuuyo.Caption <> "" Then
    '���s��25���ȍ~�͓����T�������c������}�C�i�X����
        Dim lngTmpRisoku As Long
        '�O�X��
        BeforeBeforeYMD_WORK = DateAdd("m", -1, lblZenkaiKyuuyo.Caption)
        '�Z�����ȑO�ɂȂ����ꍇ�͒���
        If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
            BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
        End If
'ADD 20100225 0908047 NBC SAWAME START
        '����ԍς̏ꍇ�͗����v�Z�p��BeforeBeforeYMD_WORK�𒲐�
        If Format(lblNokoriKyuuyo.Caption, "###0") = Format(lblyuusikyuuyo.Caption, "###0") Then
            BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
        End If
'ADD 20100225 0908047 NBC SAWAME END
        lngTmpRisoku = Fix(CLng(lblNokoriKyuuyo.Caption) * _
                       DateDiff("y", BeforeBeforeYMD_WORK, lblZenkaiKyuuyo.Caption) * Riritu_Work)
        lblNokoriKyuuyo.Caption = Format(CLng(lblNokoriKyuuyo.Caption) + lngTmpRisoku - CLng(lblTenbikiKyuuyo.Caption), "#,##0")
'DEL 20100225 0908047 NBC SAWAME START
'        '�ŏI���̔��f�ׁ̈A���^�c���c��
'        '(��)10������0925�ȍ~�I�y1025�ȍ~���Z�̏ꍇ�ɉ��̂ق���10���������ψ����ɂȂ�悤�ɒ���
'        '    10���ȍ~���ς̎���KyuyoZan_Work���X�V����邪�A���̂ق��ł͂������
'        If CLng(lblNokoriKyuuyo.Caption) + lngTmpRisoku > CLng(lblTenbikiKyuuyo.Caption) And _
'            DateAdd("m", 1, CDate(lblZenkaiKyuuyo.Caption)) <= CDate(seiYMD_WORK) Then
'            KyuyoZan_Work = CLng(lblNokoriKyuuyo.Caption)
'        End If
'DEL 20100225 0908047 NBC SAWAME END
    End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End

    If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(seiYMD_WORK, "yyyy/mm/01"))) < 0 Then
        KyuyoZenYMD_WORK = ""
    Else
        If Val(Format$(seiYMD_WORK, "dd")) >= 25 Then
            KyuyoZenYMD_WORK = Format$(seiYMD_WORK, "yyyy/mm/25")
        Else
            If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, DateAdd("m", -1, Format$(seiYMD_WORK, "yyyy/mm/01")))) < 0 Then
                KyuyoZenYMD_WORK = ""
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, seiYMD_WORK), "yyyy/mm/25")
            End If
        End If
    End If
    If DateDiff("y", seiYMD_WORK, gstrBonusYMD1) > 0 Then
        SyoyoZenYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD2), "yyyy/mm/dd")
    ElseIf DateDiff("y", seiYMD_WORK, gstrBonusYMD2) > 0 Then
        SyoyoZenYMD_WORK = gstrBonusYMD1
    Else
        SyoyoZenYMD_WORK = gstrBonusYMD2
    End If
    If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
        SyoyoZenYMD_WORK = ""
    End If
    gstrKyuyoZen1 = IIf(KyuyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), KyuyoZenYMD_WORK)
    gstrSyoyoZen1 = IIf(SyoyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), SyoyoZenYMD_WORK)
    lblZenkaiKyuuyo.Caption = KyuyoZenYMD_WORK
    lblZenkaiSyouyo.Caption = SyoyoZenYMD_WORK

    If IsDate(gstrKyuyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrKyuyoZen1) < 0 Then
            lblZenkaiKyuuyo.Caption = ""
        End If
    End If

    If IsDate(gstrSyoyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrSyoyoZen1) < 0 Then
            lblZenkaiSyouyo.Caption = ""
        End If
    End If
'ADD 20100225 0908047 NBC SAWAME START
    '25�������������c���{�ɑ΂��Ă̗����v�Z
    '����ԍς̏ꍇ�͗����v�Z�p��BeforeBeforeYMD_WORK�𒲐�
    '�ŏI���̔��f�ׁ̈A���^�c���c��
    '(��)10������0925�ȍ~�I�y1025�ȍ~���Z�̏ꍇ�ɉ��̂ق���10���������ψ����ɂȂ�悤�ɒ���
    '    10���ȍ~���ς̎���KyuyoZan_Work���X�V����邪�A���̂ق��ł͂������
    '���s��25���ȍ~�A���Z����25���ȍ~�̏ꍇ�͑O�񋋗^����̏����ōX�V����Ă���̂ŏ����\���̑O��ԍϓ��Ɛ��Z�����r����
    If Day(gdatSysDate) >= 25 And lblZenkaiKyuuyo.Caption <> "" Then
        If DatePart("d", seiYMD_WORK) >= 25 And DateDiff("m", gdatSysDate, seiYMD_WORK) > 0 Then
            If CLng(lblNokoriKyuuyo.Caption) + lngTmpRisoku > CLng(lblTenbikiKyuuyo.Caption) And _
                CDate(lblZenkaiKyuuyo.Caption) <= CDate(seiYMD_WORK) Then
                '�V���z�v�Z�p���[�N�Ɏc���{�𔽉f
                KyuyoZan_Work = CLng(lblNokoriKyuuyo.Caption)
            ElseIf CDate(lblZenkaiKyuuyo.Caption) <= CDate(seiYMD_WORK) Then
                '�O��ԍϓ����ŏI��̑O���ɐݒ肷��
                lblZenkaiKyuuyo.Caption = DateAdd("m", -1, lblZenkaiKyuuyo.Caption)
            End If
        Else
            If CLng(lblNokoriKyuuyo.Caption) + lngTmpRisoku > CLng(lblTenbikiKyuuyo.Caption) And _
                DateAdd("m", 1, CDate(lblZenkaiKyuuyo.Caption)) <= CDate(seiYMD_WORK) Then
                '�V���z�v�Z�p���[�N�Ɏc���{�𔽉f
                KyuyoZan_Work = CLng(lblNokoriKyuuyo.Caption)
            ElseIf DateAdd("m", 1, CDate(lblZenkaiKyuuyo.Caption)) <= CDate(seiYMD_WORK) Then
                '�O��ԍϓ����ŏI��̑O���ɐݒ肷��
                lblZenkaiKyuuyo.Caption = DateAdd("m", -1, lblZenkaiKyuuyo.Caption)
            End If
        End If
    End If
'ADD 20100225 0908047 NBC SAWAME END

    '**************************************************
    '* �Z������ "2000/03/01" �����Ɍv�Z���@��ύX
    '**************************************************
    If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD) > 0 Then
        '*******************
        '* �ȑO�̌v�Z��
        '*******************
        '* ���^�̎c���v�Z����ѕ\��
        '�ߋ������͂ɑΉ�
        If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                NextYMD_WORK = DateAdd("m", 1, CVDate(Format$(gdatSysDate, "yyyy/mm") & "/25"))
            Else
                NextYMD_WORK = CVDate(Format$(gdatSysDate, "yyyy/mm") & "/25")
            End If
        Else
'            If Val(Format$(seiYMD_WORK, "dd")) >= 25 Then
'                NextYMD_WORK = DateAdd("m", 1, CVDate(Format$(seiYMD_WORK, "yyyy/mm") & "/25"))
'            Else
'                NextYMD_WORK = CVDate(Format$(seiYMD_WORK, "yyyy/mm") & "/25")
'            End If
            NextYMD_WORK = CVDate(Format$(seiYMD_WORK, "yyyy/mm") & "/25")
        End If
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '***������l������
            If Format(lblNokoriKyuuyo.Caption, "#,##0") = lblyuusikyuuyo.Caption Then   '***����
                lblNokoriKyuuyo.Caption = Format(Format(lblNokoriKyuuyo.Caption, "#,##0") - (Format(lblTenbikiKyuuyo.Caption, "#,##0") - (Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") * (IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 30, 45) / 30) * gtblKeisan(glngSprCol).Riritu / 12 / 100))), "#,##0")
'10/18 Upd Start
'                lblTenbikiKyuuyo.Caption = "0"
                TenKyuFLG = "1"
'10/18 Upd End
            Else
                lblNokoriKyuuyo.Caption = Format(Format(lblNokoriKyuuyo.Caption, "#,##0") - (Format(lblTenbikiKyuuyo.Caption, "#,##0") - (Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") * gtblKeisan(glngSprCol).Riritu / 12 / 100))), "#,##0")
'10/18 Upd Start
'                lblTenbikiKyuuyo.Caption = "0"
                TenKyuFLG = "1"
'10/18 Upd End
            End If
            '***
        Else
            lblNokoriKyuuyo.Caption = Format(lblNokoriKyuuyo.Caption, "#,##0")
        End If

        '* �ܗ^�̎c���v�Z����ѕ\��
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            NextYMD_WORK = gstrBonusYMD1
            BeforeYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            NextYMD_WORK = gstrBonusYMD2
            BeforeYMD_WORK = gstrBonusYMD1
        Else
            NextYMD_WORK = DateAdd("yyyy", 1, gstrBonusYMD1)
            BeforeYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            If DateDiff("m", gstrBonusYMD1, gstrBonusYMD2) = 6 Then
                '***������l������
                If Format(lblNokoriSyouyo.Caption, "#,##0") = Format(lblyuusiSyouyo.Caption, "#,##0") Then
                    If Month(DateAdd("y", 1, gstrSyoyoZen1)) <> Month(gstrSyoyoZen1) Then
                        lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0") - (Format(lblTenbikiSyouyo.Caption, "#,##0") - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21)) / 30) * gtblKeisan(glngSprCol).Riritu / 12 / 100)))
'10/18 Upd Start
'                        lblTenbikiSyouyo.Caption = "0"
                        TenSyoFLG = "1"
'10/18 Upd End
                    Else
                        lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0") - (Format(lblTenbikiSyouyo.Caption, "#,##0") - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) + (Day(gstrSyoyoZen1) - 1 - 30)) / 30) * gtblKeisan(glngSprCol).Riritu / 12 / 100)))
'10/18 Upd Start
'                        lblTenbikiSyouyo.Caption = "0"
                        TenSyoFLG = "1"
'10/18 Upd End
                    End If
                Else
                    lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0") - (Format(lblTenbikiSyouyo.Caption, "#,##0") - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") * gtblKeisan(glngSprCol).Riritu / 2 / 100)))
'10/18 Upd Start
'                    lblTenbikiSyouyo.Caption = "0"
                    TenSyoFLG = "1"
'10/18 Upd End
               End If
                '***
            Else
                '***������l������
                If Format(lblNokoriSyouyo.Caption, "#,##0") = Format(lblyuusiSyouyo.Caption, "#,##0") Then
                    lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0") - (Format(lblTenbikiSyouyo.Caption, "#,##0") - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) + (10 - 1 - 30)) / 30) * gtblKeisan(glngSprCol).Riritu / 12 / 100)))
'10/18 Upd Start
'                    lblTenbikiSyouyo.Caption = "0"
                    TenSyoFLG = "1"
'10/18 Upd End
                Else
                    lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0") - (Format(lblTenbikiSyouyo.Caption, "#,##0") - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") * gtblKeisan(glngSprCol).Riritu * DateDiff("m", BeforeYMD_WORK, NextYMD_WORK) / 12 / 100)))
'10/18 Upd Start
'                    lblTenbikiSyouyo.Caption = "0"
                    TenSyoFLG = "1"
'10/18 Upd End
                End If
                '***
            End If
        Else
            lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0")
        End If
    Else
        '*******************
        '* �V�v�Z��
        '*******************
        '* ���^�̎c���v�Z����ѕ\��
        '* �����݂̔N��������v�Z�����A���̓V���������v�Z����B
        ' �����ݕt�̏ꍇ�́A��������̓V�����ƂȂ�
        If Val(Format$(gdatSysDate, "yyyymm")) = Val(Format$(YusiYMD_WORK, "yyyymm")) Then
            NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd")   ' �����̂Q�T��
        Else
            '�ߋ������͂ɑΉ�
            If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
                If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                    NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd") ' �����̂Q�T��
                Else
                    NextYMD_WORK = Format(Format$(gdatSysDate, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' �����̂Q�T��
                End If
            Else
'                If Val(Format$(seiYMD_WORK, "dd")) >= 25 Then
'                    NextYMD_WORK = Format(DateAdd("m", 1, Format$(seiYMD_WORK, "yyyy/mm") & "/25"), "yyyy/mm/dd") ' ���Z���̗����Q�T��
'                Else
'                    NextYMD_WORK = Format(Format$(seiYMD_WORK, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' ���Z���̂Q�T��
'                End If
                 NextYMD_WORK = Format(Format$(seiYMD_WORK, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' ���Z���̂Q�T��
            End If
        End If
        
        ' ���Z��������̓V�����ȍ~�̏ꍇ�A����V������̌��{���v�Z���\������
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '* ��L�ŋ��߂������̓V����������A�����v�Z�̂��߂̑O��̓V���������v�Z����B
            ' �P�x���V��������Ă��Ȃ��ꍇ�́A�Z�����i�v�Z����ꍇ�́|�P������j�ƂȂ�
            If Format(lblNokoriKyuuyo.Caption, "#,##0") = Format(lblyuusikyuuyo.Caption, "#,##0") Then
                BeforeYMD_WORK = DateAdd("y", -1, YusiYMD_WORK)
            Else
                BeforeYMD_WORK = Format(DateAdd("y", -1, Format(NextYMD_WORK, "yyyy/mm/") & "01"), "yyyy/mm/") & "25"
            End If
'10/24 Upd Start
'                lblNokoriKyuuyo.Caption = Format(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                       - (Format(lblTenbikiKyuuyo.Caption, "#,##0") _
                                       - (Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                       * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                       * gtblKeisan(glngSprCol).Riritu / 36500)))), "#,##0")
                If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
                    lblNokoriKyuuyo.Caption = Format(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                           - (Format(lblTenbikiKyuuyo.Caption, "#,##0") _
                                           - (Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                           * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                           * gtblKeisan(glngSprCol).Riritu / 36500)))), "#,##0")
                Else
                    lblNokoriKyuuyo.Caption = Format(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                           - (Format(lblTenbikiKyuuyo.Caption, "#,##0") _
                                           - (Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                           * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                           * Riritu_Work)))), "#,##0")
                
                End If
'10/24 UpdEnd
'10/18 Upd Start
'            lblTenbikiKyuuyo.Caption = "0"
            TenKyuFLG = "1"
'10/18 Upd End
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama Start
            '���Z�������X��̓V���ȍ~�̏ꍇ�A�������V���v�Z����
            If DatePart("d", gdatSysDate) < 25 _
                And DatePart("d", seiYMD_WORK) >= 25 _
                And DateDiff("m", gdatSysDate, seiYMD_WORK) > 0 Then

                '�������񗘑��v�Z
                lblRisokuKyuuyo.Caption = Format(Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                              * (DateDiff("y", NextYMD_WORK, DateAdd("m", 1, NextYMD_WORK)) _
                                              * Riritu_Work)), "###,0")
'ADD 20100225 0908047 NBC SAWAME START
                '�ŏI�񂪎���̏ꍇ�A�v�Z���̓V���z�v�Z�pWork�͍ŏI�����i�P�񕪁j�������c���{�̂܂܂őΉ�����
                '�����v�Z���������킹��ׁA�O��ԍϓ����ŏI��̑O���ɐݒ�
                If CLng(lblNokoriKyuuyo.Caption) + CLng(lblRisokuKyuuyo.Caption) >= CLng(lblTenbikiKyuuyo.Caption) Then
                    KyuyoZan_Work = CLng(lblNokoriKyuuyo.Caption)   '�ŏI�񂪎��X��̏ꍇ
                Else
                    '�O��ԍϓ����ŏI��̑O���ɐݒ肷��
                    lblZenkaiKyuuyo.Caption = DateAdd("m", -1, lblZenkaiKyuuyo.Caption) '�ŏI�񂪎���̏ꍇ
                End If
'ADD 20100225 0908047 NBC SAWAME END
                lblNokoriKyuuyo.Caption = Format(CLng(lblNokoriKyuuyo.Caption) + CLng(lblRisokuKyuuyo.Caption) - CLng(lblTenbikiKyuuyo.Caption), "#,##0")
            End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End
        Else
            lblNokoriKyuuyo.Caption = Format(lblNokoriKyuuyo.Caption, "#,##0")
        End If
        
        '* �ܗ^�̎c���v�Z����ѕ\��
        '* �����݂̔N��������v�Z�����A���̏ܗ^�V���������v�Z����B
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            NextYMD_WORK = gstrBonusYMD1
            BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD2), "yyyy/mm/dd")
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            NextYMD_WORK = gstrBonusYMD2
            BeforeYMD_WORK = gstrBonusYMD1
        Else
            NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyy/mm/dd")
            BeforeYMD_WORK = gstrBonusYMD2
        End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama Start
'�ܗ^�T���o�b�`��1�����x���Ȃ����̂ŏC��
'�O��ܗ^���ƃI�y����������������c�������񕪈���(BeforeYMD_WORK�̑O�̉�(next�̈�N�O)�`Before�܂ł̗������v�Z)
        If Year(BeforeYMD_WORK) = Year(gdatSysDate) And _
           Month(BeforeYMD_WORK) = Month(gdatSysDate) Then
            Dim tmpNokoriSyoyo As Long
            
            tmpNokoriSyoyo = CLng(lblNokoriSyouyo.Caption)
            '�O�X��͎����1�N�O
            BeforeBeforeYMD_WORK = DateAdd("yyyy", -1, NextYMD_WORK)
            '�Z�����ȑO�ɂȂ����ꍇ�͒���
            If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
                BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
            End If
            
                lblNokoriSyouyo.Caption = Format(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                        - (Format(lblTenbikiSyouyo.Caption, "#,##0") _
                                        - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                        * (DateDiff("y", BeforeBeforeYMD_WORK, CVDate(BeforeYMD_WORK)) _
                                        * Riritu_Work)))), "#,##0")
                If tmpNokoriSyoyo <= CLng(lblTenbikiSyouyo.Caption) Then
                '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
                    lblTenbikiSyouyo.Caption = tmpNokoriSyoyo + Fix(tmpNokoriSyoyo * Riritu_Work * _
                            DateDiff("y", CVDate(DateAdd("yyyy", -1, NextYMD_WORK)), CVDate(BeforeYMD_WORK)))
                    lblTenbikiSyouyo.Caption = Format(lblTenbikiSyouyo.Caption, "#,##0")
                    '�c������   �c���|(�ŏI�V���z�|���i�̓V���z)
                    lblNokoriSyouyo.Caption = CLng(lblNokoriSyouyo.Caption) - (CLng(lblTenbikiSyouyo.Caption) - gtblKeisan(glngSprCol).SyoyoHen)
                    lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0")
                End If
        End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End
        ' ���Z��������̓V�����ȍ~�̏ꍇ�A����V������̌��{���v�Z���\������
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            ' �P�x���V��������Ă��Ȃ��ꍇ�́A�Z�����i�v�Z����ꍇ�́|�P������j�ƂȂ�
            If Format(lblNokoriSyouyo.Caption, "#,##0") = Format(lblyuusiSyouyo.Caption, "#,##0") Then
                BeforeYMD_WORK = Format(DateAdd("y", -1, YusiYMD_WORK), "yyyy/mm/dd")
            End If
'10/24 Upd Start
'            lblNokoriSyouyo.Caption = Format(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                   - (Format(lblTenbikiSyouyo.Caption, "#,##0") _
                                   - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                   * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                   * gtblKeisan(glngSprCol).Riritu / 36500)))), "#,##0")
            If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
               lblNokoriSyouyo.Caption = Format(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                       - (Format(lblTenbikiSyouyo.Caption, "#,##0") _
                                       - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                       * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                       * gtblKeisan(glngSprCol).Riritu / 36500)))), "#,##0")
            Else
               lblNokoriSyouyo.Caption = Format(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                       - (Format(lblTenbikiSyouyo.Caption, "#,##0") _
                                       - (Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                       * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                                       * Riritu_Work)))), "#,##0")
            End If
'10/24 UpdEnd
'10/18 Upd Start
'            lblTenbikiSyouyo.Caption = "0"
            TenSyoFLG = "1"
'10/18 Upd End
        Else
            lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0")
        End If
    End If

'Add 0811051 �؏��v�Z�������� NBC.Yokoyama Start
    '�ŏI���ό��̏ꍇ�͒ʏ�̕ԍϋ��z�ł͂Ȃ��A���m�Ȑ���(�ʏ��肿����Ƒ���)��\������
    If KyuyoZan_Work <= CLng(lblTenbikiKyuuyo.Caption) And _
       Mid(gstrSysDate, 1, 6) <= Mid(Replace(lblZenkaiKyuuyo, "/", ""), 1, 6) Then
    '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
        lblTenbikiKyuuyo.Caption = KyuyoZan_Work + Fix(KyuyoZan_Work * Riritu_Work * _
                (DateDiff("y", DateAdd("m", -1, lblZenkaiKyuuyo.Caption), lblZenkaiKyuuyo.Caption)))
        lblTenbikiKyuuyo.Caption = Format(lblTenbikiKyuuyo.Caption, "#,##0")
        '�c������   �c���|(�ŏI�V���z�|���i�̓V���z)
        lblNokoriKyuuyo.Caption = CLng(lblNokoriKyuuyo.Caption) - (CLng(lblTenbikiKyuuyo.Caption) - gtblKeisan(glngSprCol).KyuyoHen)
        lblNokoriKyuuyo.Caption = Format(lblNokoriKyuuyo.Caption, "#,##0")
    End If

    '���ܗ^
    If SyoyoZan_Work <= CLng(lblTenbikiSyouyo.Caption) And seiYMD_WORK >= NextYMD_WORK Then
    '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
        lblTenbikiSyouyo.Caption = SyoyoZan_Work + Fix(SyoyoZan_Work * Riritu_Work * _
                (DateDiff("y", BeforeYMD_WORK, lblZenkaiSyouyo.Caption)))
        lblTenbikiSyouyo.Caption = Format(lblTenbikiSyouyo.Caption, "#,##0")
        '�c������   �c���|(�ŏI�V���z�|���i�̓V���z)
        lblNokoriSyouyo.Caption = CLng(lblNokoriSyouyo.Caption) - (CLng(lblTenbikiSyouyo.Caption) - gtblKeisan(glngSprCol).SyoyoHen)
        lblNokoriSyouyo.Caption = Format(lblNokoriSyouyo.Caption, "#,##0")
    End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End

'ADD 20100225 0908047 NBC SAWAME START
    End If
'ADD 20100225 0908047 NBC SAWAME END
'10/24 Upd Start
'    lblRisokuKyuuyo.Caption = Format(Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                  * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                                  * gtblKeisan(glngSprCol).Riritu / 36500)), "###,0")
'    lblRisokuSyouyo.Caption = Format(Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                  * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                                  * gtblKeisan(glngSprCol).Riritu / 36500)), "###,0")
    If DateDiff("y", seiYMD_WORK, gstrSysChgYMD2) > 0 Then
        lblRisokuKyuuyo.Caption = Format(Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                      * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                                      * gtblKeisan(glngSprCol).Riritu / 36500)), "###,0")
        lblRisokuSyouyo.Caption = Format(Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                      * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                                      * gtblKeisan(glngSprCol).Riritu / 36500)), "###,0")
    Else
        lblRisokuKyuuyo.Caption = Format(Fix(Format(lblNokoriKyuuyo.Caption, "#,##0") _
                                      * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                                      * Riritu_Work)), "###,0")
        lblRisokuSyouyo.Caption = Format(Fix(Format(lblNokoriSyouyo.Caption, "#,##0") _
                                      * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                                      * Riritu_Work)), "###,0")
    End If
'10/24 UpdEnd

'ADD 20100225 0908047 NBC SAWAME START
    '���^�c���{�A���^�������}�C�i�X�\���̏ꍇ�͐��Z���z�������׃[���ɂ���
    If CLng(Format(lblNokoriKyuuyo.Caption, "###0")) < 0 Then
        lblNokoriKyuuyo.Caption = Format(0, "#,##0")
    End If
    If CLng(Format(lblRisokuKyuuyo.Caption, "###0")) < 0 Then
        lblRisokuKyuuyo.Caption = Format(0, "#,##0")
    End If
    
    '��\�����x���ɔ��f������
    lblKyuyoHen = CLng(Format(lblNokoriKyuuyo.Caption, "###0"))
    lblSyoyoHen = CLng(Format(lblNokoriSyouyo.Caption, "###0"))
    
    '�����^�c�������Z��������̓V�����ȍ~�̏ꍇ�́u����߂����i�S�āj�v�����Z����
    If DatePart("d", seiYMD_WORK) >= 25 Or _
            DateSerial(Year(gdatSysDate), Month(gdatSysDate) + 1, 1) <= seiYMD_WORK Then
        lblNokoriKyuuyo.Caption = Format(Val(Format(lblNokoriKyuuyo.Caption, "###0")) + Val(Format(lblKyuyoModAll.Caption, "###0")), "#,##0")
        lblRisokuKyuuyo.Caption = Format(Val(Format(lblRisokuKyuuyo.Caption, "###0")) + Val(Format(lblKyuyoModRisokuAll.Caption, "###0")), "#,##0")
    Else
        lblNokoriKyuuyo.Caption = Format(Val(Format(lblNokoriKyuuyo.Caption, "###0")) + Val(Format(lblKyuyoMod.Caption, "###0")), "#,##0")
        lblRisokuKyuuyo.Caption = Format(Val(Format(lblRisokuKyuuyo.Caption, "###0")) + Val(Format(lblKyuyoModRisoku.Caption, "###0")), "#,##0")
    End If
    '���ܗ^�c���i6���j�����Z����5/21�`6/14�́Asysdate�ȑO�̂��̂����Z
    If ((DatePart("m", seiYMD_WORK) = 5 And DatePart("d", seiYMD_WORK) >= 21) Or _
    DatePart("m", seiYMD_WORK) = 6) And DateSerial(Year(seiYMD_WORK), 6, 14) >= seiYMD_WORK Then
        lblNokoriSyouyo.Caption = Format(Val(Format(lblNokoriSyouyo.Caption, "###0")) + Val(Format(lblSyoyoMod.Caption, "###0")), "#,##0")
        lblRisokuSyouyo.Caption = Format(Val(Format(lblRisokuSyouyo.Caption, "###0")) + Val(Format(lblSyoyoModRisoku.Caption, "###0")), "#,##0")
    
    '���ܗ^�c��(12��)�����Z����11/11�`11/30�́Asysdate�ȑO�̂��̂����Z
    ElseIf DatePart("m", seiYMD_WORK) = 11 And DatePart("d", seiYMD_WORK) >= 11 And DatePart("d", seiYMD_WORK) <= 30 Then
        lblNokoriSyouyo.Caption = Format(Val(Format(lblNokoriSyouyo.Caption, "###0")) + Val(Format(lblSyoyoMod.Caption, "###0")), "#,##0")
        lblRisokuSyouyo.Caption = Format(Val(Format(lblRisokuSyouyo.Caption, "###0")) + Val(Format(lblSyoyoModRisoku.Caption, "###0")), "#,##0")
    Else
    '��L���Z���ȊO�́u����߂����i�S�āj�v�����Z
        lblNokoriSyouyo.Caption = Format(Val(Format(lblNokoriSyouyo.Caption, "###0")) + Val(Format(lblSyoyoModAll.Caption, "###0")), "#,##0")
        lblRisokuSyouyo.Caption = Format(Val(Format(lblRisokuSyouyo.Caption, "###0")) + Val(Format(lblSyoyoModRisokuAll.Caption, "###0")), "#,##0")
    End If
'ADD 20100225 0908047 NBC SAWAME END

    lblyuusiKei.Caption = Format(Val(Format(lblyuusikyuuyo.Caption, "###0")) + Val(Format(lblyuusiSyouyo.Caption, "###0")), "#,##0")
    lblNokoriKei.Caption = Format(Val(Format(lblNokoriKyuuyo.Caption, "###0")) + Val(Format(lblNokoriSyouyo.Caption, "###0")), "#,##0")
    lblRisokuKei.Caption = Format(Val(Format(lblRisokuKyuuyo.Caption, "###0")) + Val(Format(lblRisokuSyouyo.Caption, "###0")), "#,##0")
    lblTenbikiKei.Caption = Format(Val(Format(lblTenbikiKyuuyo.Caption, "###0")) + Val(Format(lblTenbikiSyouyo.Caption, "###0")), "#,##0")

'10/18 Upd Start
'    lblHensou.Caption = Format(Val(Format(lblNokoriKei.Caption, "###0")) + Val(Format(lblRisokuKei.Caption, "###0")) - Val(Format(lblTenbikiKyuuyo.Caption, "###0")), "#,##0")

'DEL 20100225 0908047 NBC SAWAME START
'    If TenKyuFLG = "" Then
'        lblHensou.Caption = Format(Val(Format(lblNokoriKei.Caption, "###0")) + Val(Format(lblRisokuKei.Caption, "###0")) - Val(Format(lblTenbikiKyuuyo.Caption, "###0")), "#,##0")
'    Else
'DEL 20100225 0908047 NBC SAWAME END
        lblHensou.Caption = Format(Val(Format(lblNokoriKei.Caption, "###0")) + Val(Format(lblRisokuKei.Caption, "###0")), "#,##0")
'DEL 20100225 0908047 NBC SAWAME START
'    End If
'DEL 20100225 0908047 NBC SAWAME END

'10/18 Upd End
    
End Sub

Private Sub subDataPass()

    Dim seiYMD_WORK         As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    Dim KyuyoStYMD_WORK     As String
    Dim SyoyoStYMD_WORK     As String
        
    Dim Riritu_Work         As Double   'Add 0811051 �؏��v�Z�������� NBC.Yokoyama
    
    If Trim(lblSyainCD1.Caption) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = Trim(lblSyainCD1.Caption)
    End If
    gstrCode2 = Trim(lblSyainCD2.Caption)
    gstrName = Trim(lblShimei.Caption)
    gstrMise = Trim(lblShozoku(1).Caption)
    gstrYusiYMD = Format$(Val(lblYuusibiY.Caption), "0000") & Format$(Val(lblYuusibiM.Caption), "00") & Format$(Val(lblYuusibiD.Caption), "00")
    seiYMD_WORK = txtDateFromY.Text & "/" & txtDateFromM.Text & "/" & txtDateFromD.Text
    gstrSeiYMD = Trim(txtDateFromY.Text) & Trim(txtDateFromM.Text) & Trim(txtDateFromD.Text)
    gstrTenKBN = "1"

    '�ߋ������͂ɑΉ�
    If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
        If Val(Format$(gdatSysDate, "dd")) >= 25 Then
            NextYMD_WORK = DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25")
        Else
            NextYMD_WORK = Format$(gdatSysDate, "yyyy/mm") & "/25"
        End If
    Else
        NextYMD_WORK = Format$(seiYMD_WORK, "yyyy/mm") & "/25"
    End If
'Mod 0811051 �؏��v�Z�������� NBC.Yokoyama Start
'���Z��1�`24���̊Ԃ̂ݕ\��
    'If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
    '    gstrKyuyoKBN = "1"
    'Else
    '    gstrKyuyoKBN = "2"
    'End If
'MOD 20100225 0908047 NBC SAWAME START
    '���Z��1�`24���̊ԁA�����A���^�c���{������ꍇ�̂ݕ\��
'    If Day(seiYMD_WORK) >= 1 And Day(seiYMD_WORK) <= 24 Then
    If (Day(seiYMD_WORK) >= 1 And Day(seiYMD_WORK) <= 24) And CLng(lblKyuyoHen.Caption) <> 0 Then
'MOD 20100225 0908047 NBC SAWAME END
        gstrKyuyoKBN = "2"
    Else
        gstrKyuyoKBN = "1"
    End If
'Mod 0811051 �؏��v�Z�������� NBC.Yokoyama End
    
    If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
        NextYMD_WORK = gstrBonusYMD1
''        BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD1), "yyyymmdd")
        BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD1), "yyyy/mm/dd")
    ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
        NextYMD_WORK = gstrBonusYMD2
        BeforeYMD_WORK = gstrBonusYMD1
    Else
''        NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyymmdd")
        NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyy/mm/dd")
        BeforeYMD_WORK = gstrBonusYMD2
    End If
    
    If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
        gstrSyoyoKBN = "1"
    Else
        gstrSyoyoKBN = "2"
    End If
  
    glngKyuyoYusi = Format(lblyuusikyuuyo.Caption, "###0")
    glngSyoyoYusi = Format(lblyuusiSyouyo.Caption, "###0")
    glngKyuyoZan = Format(lblNokoriKyuuyo.Caption, "###0")
    glngSyoyoZan = Format(lblNokoriSyouyo.Caption, "###0")
    
    If Val(Format$(seiYMD_WORK, "dd")) = 25 Then
        gstrKyuyoStYMD = Format(gstrKyuyoZen1, "yyyymmdd")
        KyuyoStYMD_WORK = Format(gstrKyuyoZen1, "yyyy/mm/dd")
    Else
        gstrKyuyoStYMD = Format(DateAdd("d", 1, gstrKyuyoZen1), "yyyymmdd")
        KyuyoStYMD_WORK = Format(DateAdd("d", 1, gstrKyuyoZen1), "yyyy/mm/dd")
    End If
    If DateDiff("d", seiYMD_WORK, gstrSyoyoZen1) = 0 Then
        gstrSyoyoStYMD = Format(gstrSyoyoZen1, "yyyymmdd")
        SyoyoStYMD_WORK = Format(gstrSyoyoZen1, "yyyy/mm/dd")
    Else
        gstrSyoyoStYMD = Format(DateAdd("d", 1, gstrSyoyoZen1), "yyyymmdd")
        SyoyoStYMD_WORK = Format(DateAdd("d", 1, gstrSyoyoZen1), "yyyy/mm/dd")
    End If

'ADD 20100225 0908047 NBC SAWAME START
    '���^�c���{������߂��݂̂̏ꍇ�͗����v�Z�J�n���𐸎Z���ɂ���
    If CLng(lblKyuyoHen.Caption) = 0 Then
        gstrKyuyoStYMD = Format(seiYMD_WORK, "yyyymmdd")
        KyuyoStYMD_WORK = Format(seiYMD_WORK, "yyyy/mm/dd")
    End If
    '�ܗ^�c���{������߂��݂̂̏ꍇ�͗����v�Z�J�n���𐸎Z���ɂ���
    If CLng(lblSyoyoHen.Caption) = 0 Then
        gstrSyoyoStYMD = Format(seiYMD_WORK, "yyyymmdd")
        SyoyoStYMD_WORK = Format(seiYMD_WORK, "yyyy/mm/dd")
    End If
'ADD 20100225 0908047 NBC SAWAME END
       
    gdblRiritu = gtblKeisan(glngSprCol).Riritu
    glngKyuyoRisoku = Format(lblRisokuKyuuyo.Caption, "###0")
    glngSyoyoRisoku = Format(lblRisokuSyouyo.Caption, "###0")
'Del 0811051 �؏��v�Z�������� NBC.Yokoyama
    'glngKyuyoTen = IIf(Trim(lblTenbikiKyuuyo.Caption) = "", 0, Format(lblTenbikiKyuuyo.Caption, "###0"))
'ADD 0811051 �؏��v�Z�������� NBC.Yokoyama Start
    '�ŏI���ό��̏ꍇ�͒ʏ�̕ԍϋ��z�ł͂Ȃ��A���m�Ȑ���(�ʏ��肿����Ƒ���)��\������
'MOD 20100225 0908047 NBC SAWAME START
'    If CLng(lblNokoriKyuuyo.Caption) <= CLng(lblTenbikiKyuuyo.Caption) Then
'        Riritu_Work = Fix(gtblKeisan(glngSprCol).Riritu / 36500 * 1000000) / 1000000
'        '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
'        glngKyuyoTen = glngKyuyoZan + Fix((glngKyuyoZan * Riritu_Work * DateDiff("y", KyuyoStYMD_WORK, DateAdd("d", -1, (DateAdd("m", 1, KyuyoStYMD_WORK)) + 1))))
'    Else
'        glngKyuyoTen = IIf(Trim(lblTenbikiKyuuyo.Caption) = "", 0, Format(lblTenbikiKyuuyo.Caption, "###0"))
'    End If
'    '���ܗ^
'    If CLng(lblNokoriSyouyo.Caption) <= CLng(lblTenbikiSyouyo.Caption) Then
'        Riritu_Work = Fix(gtblKeisan(glngSprCol).Riritu / 36500 * 1000000) / 1000000
'        '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
'        glngSyoyoTen = glngSyoyoZan + Fix(glngSyoyoZan * Riritu_Work * (DateDiff("y", SyoyoStYMD_WORK, NextYMD_WORK) + 1))
'    Else
'        glngSyoyoTen = IIf(Trim(lblTenbikiSyouyo.Caption) = "", 0, Format(lblTenbikiSyouyo.Caption, "###0"))
'    End If
    '�ŏI���ό��̏ꍇ�͒ʏ�̕ԍϋ��z�ł͂Ȃ��A���m�Ȑ���(�ʏ��肿����Ƒ���)��\������
    '���^�c���{������ꍇ�̂ݍs��
    If CLng(lblKyuyoHen.Caption) <> 0 Then
        If CLng(lblKyuyoHen.Caption) <= CLng(lblTenbikiKyuuyo.Caption) Then
            Riritu_Work = Fix(gtblKeisan(glngSprCol).Riritu / 36500 * 1000000) / 1000000
            '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
            glngKyuyoTen = CLng(lblKyuyoHen.Caption) + Fix((CLng(lblKyuyoHen.Caption) * Riritu_Work * DateDiff("y", KyuyoStYMD_WORK, DateAdd("d", -1, (DateAdd("m", 1, KyuyoStYMD_WORK)) + 1))))
        Else
            glngKyuyoTen = IIf(Trim(lblTenbikiKyuuyo.Caption) = "", 0, Format(lblTenbikiKyuuyo.Caption, "###0"))
        End If
    Else
        glngKyuyoTen = 0
    End If
    '���ܗ^
    '�ܗ^�c���{������ꍇ�̂ݍs��
    If CLng(lblSyoyoHen.Caption) <> 0 Then
        If CLng(lblSyoyoHen.Caption) <= CLng(lblTenbikiSyouyo.Caption) Then
            Riritu_Work = Fix(gtblKeisan(glngSprCol).Riritu / 36500 * 1000000) / 1000000
            '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
            glngSyoyoTen = CLng(lblSyoyoHen.Caption) + Fix(CLng(lblSyoyoHen.Caption) * Riritu_Work * (DateDiff("y", SyoyoStYMD_WORK, NextYMD_WORK) + 1))
        Else
            glngSyoyoTen = IIf(Trim(lblTenbikiSyouyo.Caption) = "", 0, Format(lblTenbikiSyouyo.Caption, "###0"))
        End If
    Else
        glngSyoyoTen = 0
    End If
'MOD 20100225 0908047 NBC SAWAME END
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End
'Del 0811051 �؏��v�Z�������� NBC.Yokoyama
    'glngSyoyoTen = IIf(DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD1) Or DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD2), IIf(Trim(lblTenbikiSyouyo.Caption) = "", 0, Format(lblTenbikiSyouyo.Caption, "###0")), 0)
'ADD 0811051 �؏��v�Z�������� NBC.Yokoyama Start
    '�ܗ^�V���͎w������u06/01�`06/14�v�Ɓu11/16�`11/30�v�̊Ԃ̂ݕ\������
'MOD 20100225 0908047 NBC SAWAME START
'    If (Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "0601" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "0614") _
'    Or (Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "1116" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "1130") Then
    '�ܗ^�V���͎w������u06/01�`06/14�v�Ɓu11/16�`11/30�v�̊ԁA�����ܗ^���{���c���Ă���ꍇ�ɕ\��
    If ((Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "0601" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "0614") _
    Or (Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "1116" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "1130")) _
    And CLng(lblSyoyoHen.Caption) <> 0 Then
'MOD 20100225 0908047 NBC SAWAME END
    Else
        glngSyoyoTen = 0
    End If
'Add 0811051 �؏��v�Z�������� NBC.Yokoyama End
    
    If glngKyuyoZan = 0 Then
       gintKyuyoNisu = 0
    Else
       gintKyuyoNisu = DateDiff("y", KyuyoStYMD_WORK, seiYMD_WORK) + IIf(Val(Format$(seiYMD_WORK, "dd")) = 25, 0, 1)
    End If

    If glngSyoyoZan = 0 Then
       gintSyoyoNisu = 0
    Else
'2001/10/15 ���t�v�Z�s��C��
'       gintSyoyoNisu = DateDiff("y", SyoyoStYMD_WORK, seiYMD_WORK) + IIf(Val(Format$(seiYMD_WORK, "dd")) = 25, 0, 1)
       gintSyoyoNisu = DateDiff("y", SyoyoStYMD_WORK, seiYMD_WORK) + IIf(DateDiff("d", seiYMD_WORK, SyoyoStYMD_WORK) = 0, 0, 1)
    End If
    
'ADD 20100225 0908047 NBC SAWAME START
    '���^�c���{������߂��݂̂̎��͗����v�Z�������[���ɂ���
    If CLng(lblKyuyoHen.Caption) = 0 Then
        gintKyuyoNisu = 0
    End If
    '�ܗ^�c���{������߂��݂̂̎��͗����v�Z�������[���ɂ���
    If CLng(lblSyoyoHen.Caption) = 0 Then
        gintSyoyoNisu = 0
    End If
'ADD 20100225 0908047 NBC SAWAME END
'ADD 20100225 0908047 NBC YOKOYAMA START
    '�T���\���������߂��̏ꍇ�͕\�����Ȃ�
    '���^�T��
    If gfuncCheckBunkaiModoshi(lblSyainCD1.Caption, _
                               lblSyainCD2.Caption, _
                               Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2), _
                               Mid(seiYMD_WORK, 1, 7) & "/25", _
                               "3") = "1" Then
        gstrKyuyoKBN = "1"
    End If
    '�ܗ^�T��
    If gfuncCheckBunkaiModoshi(lblSyainCD1.Caption, _
                               lblSyainCD2.Caption, _
                               Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2), _
                               NextYMD_WORK, _
                               "4") = "1" Then
        glngSyoyoTen = 0
    End If
'ADD 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC SAWAME START
    '�V���z�[���̏ꍇ�͓V���z�̕\���敪��"1"(��\��)�ɂ���
    If glngKyuyoTen = 0 Then
        gstrKyuyoKBN = "1"
    End If
    If glngSyoyoTen = 0 Then
        gstrSyoyoKBN = "1"
    End If
'ADD 20100225 0908047 NBC SAWAME END
    
End Sub
