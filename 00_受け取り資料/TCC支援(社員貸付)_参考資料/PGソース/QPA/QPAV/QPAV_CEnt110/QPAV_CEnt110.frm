VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt110 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�ԍϗ\��\���"
   ClientHeight    =   8580
   ClientLeft      =   300
   ClientTop       =   1710
   ClientWidth     =   14325
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
   ScaleWidth      =   14325
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.PictureBox Picture1 
      Height          =   7425
      Left            =   0
      ScaleHeight     =   7365
      ScaleWidth      =   14265
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   0
      Width           =   14325
      Begin VB.Frame Frame3 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   1215
         Left            =   45
         TabIndex        =   37
         Top             =   -30
         Width           =   14175
         Begin VB.TextBox txtSyainCd 
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
            Index           =   1
            Left            =   2550
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
            Left            =   3705
            TabIndex        =   2
            TabStop         =   0   'False
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtSyainCd 
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
            Index           =   0
            Left            =   2250
            MaxLength       =   1
            TabIndex        =   0
            Top             =   240
            Width           =   270
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
            TabIndex        =   55
            Top             =   780
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
            Left            =   2310
            TabIndex        =   54
            Top             =   630
            Width           =   2235
         End
         Begin VB.Label lblShimei 
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
            Height          =   240
            Left            =   2280
            TabIndex        =   53
            Top             =   900
            Width           =   3750
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
            TabIndex        =   52
            Top             =   210
            Width           =   540
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
            Left            =   6990
            TabIndex        =   51
            Top             =   210
            Width           =   315
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
            TabIndex        =   50
            Top             =   210
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
            Left            =   6000
            TabIndex        =   49
            Top             =   570
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
            Left            =   6990
            TabIndex        =   48
            Top             =   570
            Width           =   405
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
            TabIndex        =   47
            Top             =   915
            Width           =   720
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
            Left            =   6990
            TabIndex        =   46
            Top             =   930
            Width           =   525
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
            Left            =   7740
            TabIndex        =   45
            Top             =   930
            Width           =   2385
         End
         Begin VB.Label lblBirthday 
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
            TabIndex        =   44
            Top             =   915
            Width           =   1305
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
            Left            =   11580
            TabIndex        =   43
            Top             =   540
            Width           =   795
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
            Left            =   11580
            TabIndex        =   42
            Top             =   210
            Width           =   795
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
            TabIndex        =   41
            Top             =   915
            Width           =   720
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
            TabIndex        =   40
            Top             =   540
            Width           =   180
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
            Top             =   210
            Width           =   360
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
            TabIndex        =   38
            Top             =   300
            Width           =   810
         End
      End
      Begin VB.Frame Frame1 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   5010
         Left            =   45
         TabIndex        =   30
         Top             =   1785
         Width           =   14175
         Begin FPSpread.vaSpread sprList 
            Height          =   3840
            Left            =   1170
            TabIndex        =   6
            Top             =   750
            Width           =   11820
            _Version        =   196608
            _ExtentX        =   20849
            _ExtentY        =   6773
            _StockProps     =   64
            MaxCols         =   10
            MaxRows         =   0
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt110.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
         Begin VB.Label Label11 
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
            Left            =   5565
            TabIndex        =   58
            Top             =   405
            Width           =   180
         End
         Begin VB.Label Label9 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
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
            ForeColor       =   &H00000000&
            Height          =   180
            Left            =   4620
            TabIndex        =   57
            Top             =   405
            Width           =   360
         End
         Begin VB.Label lblRiritu 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
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
            Left            =   5445
            TabIndex        =   56
            Top             =   405
            Width           =   60
         End
         Begin VB.Label lblShouyo 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
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
            Left            =   11550
            TabIndex        =   36
            Top             =   375
            Width           =   60
         End
         Begin VB.Label Label10 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�ܗ^�ԍϊz"
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
            Left            =   9630
            TabIndex        =   35
            Top             =   375
            Width           =   900
         End
         Begin VB.Label lblKyuuyo 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
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
            Left            =   8850
            TabIndex        =   34
            Top             =   405
            Width           =   60
         End
         Begin VB.Label Label8 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "���^�ԍϊz"
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
            Left            =   6930
            TabIndex        =   33
            Top             =   405
            Width           =   900
         End
         Begin VB.Label lblYuushi 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
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
            Left            =   3060
            TabIndex        =   32
            Top             =   405
            Width           =   60
         End
         Begin VB.Label Label6 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Z�����z"
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
            Left            =   1320
            TabIndex        =   31
            Top             =   405
            Width           =   720
         End
      End
      Begin VB.Frame Frame2 
         Appearance      =   0  '�ׯ�
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   45
         TabIndex        =   25
         Top             =   1170
         Width           =   14175
         Begin VB.TextBox txtYuusibiD 
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
            Left            =   3930
            MaxLength       =   2
            TabIndex        =   5
            Top             =   180
            Width           =   360
         End
         Begin VB.TextBox txtYuusibiM 
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
            Left            =   3225
            MaxLength       =   2
            TabIndex        =   4
            Top             =   180
            Width           =   345
         End
         Begin VB.TextBox txtYuusibiY 
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
            Left            =   2295
            MaxLength       =   4
            TabIndex        =   3
            Top             =   180
            Width           =   600
         End
         Begin VB.Label Label5 
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
            Left            =   3660
            TabIndex        =   29
            Top             =   285
            Width           =   180
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
            Index           =   0
            Left            =   2970
            TabIndex        =   28
            Top             =   285
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
            Left            =   4365
            TabIndex        =   27
            Top             =   285
            Width           =   180
         End
         Begin VB.Label Label2 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Z����"
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
            Left            =   1620
            TabIndex        =   26
            Top             =   255
            Width           =   540
         End
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "����ޭ�"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   0
         Left            =   11685
         TabIndex        =   7
         Top             =   6870
         Width           =   1215
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
         Height          =   435
         Index           =   1
         Left            =   13005
         TabIndex        =   8
         Top             =   6870
         Width           =   1215
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   15
         Top             =   6930
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   7785
      Width           =   14325
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
         TabIndex        =   9
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
         Index           =   3
         Left            =   2415
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
         Index           =   4
         Left            =   3600
         TabIndex        =   15
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
         TabIndex        =   11
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
         Index           =   7
         Left            =   7155
         TabIndex        =   17
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
         TabIndex        =   18
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
         Left            =   9525
         TabIndex        =   19
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
         Left            =   10710
         TabIndex        =   12
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
         TabIndex        =   20
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
         Left            =   13080
         TabIndex        =   13
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
      Height          =   330
      Left            =   0
      ScaleHeight     =   270
      ScaleWidth      =   14265
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   7440
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
         Left            =   60
         TabIndex        =   22
         Top             =   0
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   330
      Left            =   0
      TabIndex        =   59
      Top             =   8250
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
            TextSave        =   "2009/04/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "16:20"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmQPAV_CEnt110"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
'                           0808052�FTCC�x���V�X�e���̍č\�z
'                             �E�A�v���P�[�V�����ڍs�Ή�
'                               PKG�̖߂�l������C��
'----------------------------------------------------------------------------------------------

Option Explicit
 Dim blnInit_Flg As Boolean
 Private blnNoChangeEvFlg As Boolean
  
 
 Dim lngFirstCnt As Long '''''''''''
 Dim lngRecCount As Long '''''''''''''''SP�p

'**********************************************************************************************************
'*    FORM LOAD �����
'**********************************************************************************************************
Private Sub Form_Load()
        
    blnInit_Flg = True   '�����t���O
    
    Call subInitScreen   '������ʕҏW����
    
End Sub
'**********************************************************************************************************
'*    FORM UNLOAD �����
'**********************************************************************************************************
Private Sub Form_Unload(CANCEL As Integer)
        
    Call gsubTermOracleDB   '�׸پ���݂̐ؒf
    
End Sub
'**********************************************************************************************************
'*    FORM ACTIVATE �����
'**********************************************************************************************************
Private Sub Form_Activate()
 Dim i As Long
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If blnInit_Flg = True Then     '�����׸� = �݂̏ꍇ
        '�ð���ްү����
        stbSystem.Panels.Item(1).Text = "�������D�D�D"

        Screen.MousePointer = vbHourglass
        Me.Enabled = False

        DoEvents

        '����݂̊m��
        If Not gblnCreateOracleSession() Then
            '���Ѵװ
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�ԍϗ\��\��� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If

        '�ް��ް��̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '���Ѵװ
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�ԍϗ\��\��� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '��ݻ޸��݂̊J�n
        objSession.BeginTrans
        
        '���������pSP�i���ѓ��t�j
        Call gsubSPInit
        
        '�ꗗ�N���A�[
        Call gsubSpdClear(sprList)
        
        '��ʎn��
        Me.Enabled = True
                
        '�ð���ްү���ޏ���
        stbSystem.Panels.Item(1).Text = ""
                
        '�ð���ް�ݒ�
        Call subInitStatusBar(stbSystem)
    
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
        
        '�����׸� = ��
        blnInit_Flg = False

    End If
    
    '�}�E�X�|�C���^�[
    Screen.MousePointer = vbDefault
    
End Sub
'**********************************************************************************************************
'*    FORM KEY PRESS �����
'**********************************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    '�װү���ޏ��� & ���]���ډ���
    Call subErrKaijo

    'ENTER Beep������
    If KeyAscii = vbKeyReturn Then KeyAscii = 0
    
End Sub
'**********************************************************************************************************
'*    FORM KEY DOWN �����
'**********************************************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    '�װү���ޏ���
    lblMsg.Caption = ""
    
    '�t�@���N�V�����L�[�ݒ�
    Select Case KeyCode
        Case vbKeyReturn  'Enter
            SendKeys "{TAB}"
        Case vbKeyF1      'F1
            Call cmdPFK_Click(1)
        Case vbKeyF2      'F2
            Call cmdPFK_Click(2)
        Case vbKeyF5      'F5
            Call cmdPFK_Click(5)
        Case vbKeyF7      'F7
            Call cmdPFK_Click(7)
        Case vbKeyF8      'F8
            Call cmdPFK_Click(8)
        Case vbKeyF10     'F10
            Call cmdPFK_Click(10)
        Case vbKeyF12     'F12
            Call cmdPFK_Click(12)
    End Select

End Sub
'******************************************************************************
'*    ���񂹌����{�^��
'******************************************************************************
Private Sub cmdNayose_Click()
 Dim strSyainCd As String

''''    Me.Hide

    Me.Enabled = False
    
    Call subErrKaijo

    '���񂹌�����ʕ\��
    frmQPAV_CEnt111.Show 1

    Me.Enabled = True
    
''''    Me.Show
           
    If Trim$(txtSyainCd(0).Text) = "" And Trim$(txtSyainCd(1).Text) = "" Then
        txtSyainCd(0).SetFocus
    Else
        txtYuusibiY.SetFocus
    End If
    
End Sub


'**********************************************************************************************************
'*    ������ʕҏW����
'**********************************************************************************************************
Private Sub subInitScreen()

    Me.Enabled = False

    '�ð���ްү����
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    
    DoEvents

    '���گ�ޕی�
    sprList.Lock = True

    '�ð���ް�ݒ�
    Call gsubInitStatusBar(stbSystem)

    '̫�і��ݒ�
    If Me.Caption = "�ԍϗ\��\���" Then
        Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    End If
        
    '�ð���ްү���ޏ���
    stbSystem.Panels.Item(1).Text = ""
    lblMsg.Caption = ""
    
'�������������yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/22������������
    '�v���r���[�E����{�^��
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
'�������������yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/22������������
    
    Me.Enabled = True
        
End Sub
'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case index
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
            txtSyainCd(0).SetFocus
    
    End Select
    
End Sub

Private Sub cmdPrint_Click(index As Integer)
 Dim strErrMsg As String '�G���[���b�Z�[�W
 Dim strWrk    As String

    Screen.MousePointer = vbHourglass

    '����p�e�[�u������f�[�^���폜
    If gfncblnDelPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    '���[�p�f�[�^�쐬
    If gfncblnMakPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    Select Case index
        Case 0
            If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�ԍϗ\��\���") = vbCancel Then
                '����p�e�[�u������f�[�^���폜
                If gfncblnDelPrintDat = False Then
                    Screen.MousePointer = vbNormal
                    Exit Sub
                End If
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
            '�N���X�^�����|�[�g�ďo
            Call subPrintReport(crptToWindow)
        
        Case 1
            If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�ԍϗ\��\���") = vbCancel Then
                '����p�e�[�u������f�[�^���폜
                If gfncblnDelPrintDat = False Then
                    Screen.MousePointer = vbNormal
                    Exit Sub
                End If
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
            '�N���X�^�����|�[�g�ďo
            Call subPrintReport(crptToPrinter)
    End Select
        
    '����p�e�[�u������f�[�^���폜
    If gfncblnDelPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    Screen.MousePointer = vbNormal

End Sub


'***********************************************************************************************************
'*��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
    
    '�e�\�����ڃN���A
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblShozoku(0).Caption = ""
    lblShozoku(1).Caption = ""
    lblTozai.Caption = ""
    lblBumon(0).Caption = ""
    lblBumon(1).Caption = "�"
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblBirthday.Caption = ""
    txtYuusibiY.Text = ""
    txtYuusibiM.Text = ""
    txtYuusibiD.Text = ""
    lblYuushi.Caption = ""
    lblKyuuyo.Caption = ""
    lblShouyo.Caption = ""
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)

    '�e�R���g���[������
    cmdNayose.Enabled = True
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    txtYuusibiY.Enabled = True
    txtYuusibiM.Enabled = True
    txtYuusibiD.Enabled = True
        
End Sub
'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
End Sub
'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
 Dim strYuusibi As String

'�X����Ɏg�p�@2002/05/13
 Dim strSyozoku As String

On Error GoTo subCmdJikkou

    '�G���[����
    subErrKaijo
            
    '���̫������ċ����I�Ɋe���۰ق�Lost_Focus������
    cmdPFK(5).SetFocus
            
    '�ꗗ���\�������܂Ŏ��s����,���񂹂��g�p�s�E�}�E�X�|�C���^�[(�����v)
    cmdPFK(5).Enabled = False
        
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
            
    '���͍��ڃ`�F�b�N
    If fncNyuuryokuChk = False Then
        GoTo subCmdJikkou
    End If
    
    '�Ј��R�[�h����
    If fncblnSyainDat = False Then
        txtSyainCd(0).Enabled = True
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).Enabled = True
        txtSyainCd(1).BackColor = vbRed
        lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")   '�Y������f�[�^������܂���
        GoTo subCmdJikkou
    End If
    
    '�Y���f�[�^���o
    If fncGetDat = False Then
        lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")   '�Y������f�[�^������܂���
        GoTo subCmdJikkou
    End If
    
    '�Z������ 2000/03/01 �����ɏ����𕪂���
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '�Z����
    
    
    '2001/12/07
    '2002/02/27 "085"���ǉ�
    If strYuusibi < "2000/03/01" Then
        
        '�X����@2002/05/13
''''�X����@2002/05/13�@�폜�@���L�ɕύX        If (Trim$(lblShozoku(0).Caption) >= "001" And Trim$(lblShozoku(0).Caption) <= "028") Or Trim$(lblShozoku(0).Caption) = "041" Or Trim$(lblShozoku(0).Caption) = "085" Or Trim$(lblShozoku(0).Caption) = "095" Then
        strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
        If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
        Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
        Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
        Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
        Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
        Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
        Then
            gstrBonusMD1 = "0430"
            gstrBonusMD2 = "1031"
        End If
    End If
    
    
    If CDate(strYuusibi) < CDate("2000/03/01") Then
        '�f�[�^�v�Z(������)
        Call gSubMakeMeisaiKyuu
    Else
        '�f�[�^�v�Z(�V����)
        Call gSubMakeMeisai
    End If
    
    '�f�[�^�Z�b�g
    Call subDataSet
    
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = True
    cmdPrint(1).Enabled = True
    cmdNayose.Enabled = False
    txtSyainCd(0).Enabled = False
    txtSyainCd(1).Enabled = False
    txtYuusibiY.Enabled = False
    txtYuusibiM.Enabled = False
    txtYuusibiD.Enabled = False
    cmdPrint(0).SetFocus
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""

    Exit Sub

subCmdJikkou:
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    cmdNayose.Enabled = True
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    txtYuusibiY.Enabled = True
    txtYuusibiM.Enabled = True
    txtYuusibiD.Enabled = True
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
End Sub
'*************************************************************************************************
'*���̓`�F�b�N
'*************************************************************************************************
Private Function fncNyuuryokuChk() As Boolean
    
    fncNyuuryokuChk = False
        
    '�Ј��ԍ����̓`�F�b�N
    If Len(Trim$(txtSyainCd(1).Text)) = 0 Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    ElseIf Len(Trim$(txtSyainCd(1).Text)) = 7 Then
        gstrSyainCd1 = Trim$(txtSyainCd(0).Text)
        gstrSyainCd2 = Trim$(txtSyainCd(1).Text)
    Else
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(0).SetFocus
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    End If

    '�Z�����`�F�b�N
    If txtYuusibiY.Text = "" And txtYuusibiM.Text = "" And txtYuusibiD.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        Exit Function
    ElseIf txtYuusibiY.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtYuusibiY.SetFocus
        txtYuusibiY.BackColor = vbRed
        Exit Function
    ElseIf txtYuusibiM.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtYuusibiM.SetFocus
        txtYuusibiM.BackColor = vbRed
        Exit Function
    ElseIf txtYuusibiD.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtYuusibiD.SetFocus
        txtYuusibiD.BackColor = vbRed
        Exit Function
    ElseIf IsDate(Format(Trim$(txtYuusibiY.Text) & "/" & Trim$(txtYuusibiM.Text) & "/" & Trim$(txtYuusibiD.Text), "YYYY/MM/DD")) = False Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '���͍��ڂɌ�肪����܂��B
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        Exit Function
    End If
    
    gstrYuusibi = txtYuusibiY & txtYuusibiM & txtYuusibiD
    
    fncNyuuryokuChk = True

End Function

'*************************************************************************************************
'*  �f�[�^�v�Z >>> �f�[�^�Z�b�g
'*************************************************************************************************
Private Sub subDataSet()
 Dim i          As Long

    sprList.ReDraw = False
    Call gsubSpdClear(sprList)

    lblKyuuyo.Caption = Format$(gfncstrDlm2(gstrYusiYMD, 8), "#,##0")                      '���^�ԍϑ��z
    lblShouyo.Caption = Format$(gfncstrDlm2(gstrYusiYMD, 10), "#,##0")                     '�ܗ^�ԍϑ��z
    lblYuushi.Caption = Format$(CLng(lblKyuuyo.Caption) + CLng(lblShouyo.Caption), "#,##0") '�Z�����z
    lblRiritu.Caption = Format$((CDbl(gfncstrDlm2(gstrYusiYMD, 6))), "##.#0")        '����
    
    '�f�[�^�Z�b�g
    With sprList
        .ReDraw = False
        .MaxRows = UBound(gstrYoteihyouAry)
        For i = 1 To UBound(gstrYoteihyouAry)
            .SetText 1, i, gstrYoteihyouAry(i).strKbn                        '�敪
            .SetText 2, i, gstrYoteihyouAry(i).strKijitu                     '�ԍϊ���''''�Z���� �{ �ԍό���
            .SetText 3, i, Format$(gstrYoteihyouAry(i).strHensai, "#,##0")   '�ԍϋ��z''''���^�ԍ� or �ܗ^�ԍϊz
            .SetText 4, i, Format$(gstrYoteihyouAry(i).strZandaka, "#,##0")  '�c��''''���^�ԍϕ��c�� �{ �ܗ^�ԍϕ��c��
            .SetText 5, i, Format$(gstrYoteihyouAry(i).strKyuGan, "#,##0")   '���^�ԍϕ����{
            .SetText 6, i, Format$(gstrYoteihyouAry(i).strKyuRsk, "#,##0")   '���^�ԍϕ�����
            .SetText 7, i, Format$(gstrYoteihyouAry(i).strKyuZan, "#,##0")   '���^�ԍϕ��c��
            .SetText 8, i, Format$(gstrYoteihyouAry(i).strSyoGan, "#,##0")   '�ܗ^�ԍϕ����{
            .SetText 9, i, Format$(gstrYoteihyouAry(i).strSyoRsk, "#,##0")   '�ܗ^�ԍϕ�����
            .SetText 10, i, Format$(gstrYoteihyouAry(i).strSyoZan, "#,##0")  '�ܗ^�ԍϕ��c��
        Next i

        .ReDraw = True
    End With
    
End Sub
'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�ԍϗ\��\���", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt110.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'***********************************************************************************************************
'*    �Ј��f�[�^�擾 �r�o ���s
'*        �ԋp�l�FBoolean       True=OK     False=NG
'***********************************************************************************************************
Private Function fncblnSyainDat() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���

On Error GoTo errfncblnSyainDat

    fncblnSyainDat = False

    lngSpCnt = 0
    
    '������ꗗ �r�o
    '�Ј��ԍ��P
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '�Ј��ԍ��Q
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '�Ј��f�[�^
    odbDatabase.Parameters.Add "OtStrDatAry", " ", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110SyainDat("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:OtStrDatAry); END;"


    sprList.ReDraw = False
    
    '�}�X�^���ꗗ�̎擾
    odbDatabase.DbexecuteSQL (strSQL)

    'MOD 20090416 0807073/0803012 NBC.ishida start
    'If Trim$(odbDatabase.Parameters("OtStrDatAry")) = "" Then          '�Y���f�[�^�Ȃ�
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) = True Then
    'MOD 20090416 0807073/0803012 NBC.ishida end
        Call gsubParaRemove(odbDatabase)                         '�I�u�W�F�N�g�̊J��
        sprList.ReDraw = True
        Exit Function
    End If

    '���ڃZ�b�g
    Call subSyainDsp

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnSyainDat = True

    Exit Function

errfncblnSyainDat:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'****************************************************************************************************
'*    �Ј��f�[�^���Z�b�g
'****************************************************************************************************
Private Sub subSyainDsp()
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    strDetail = odbDatabase.Parameters("OtStrDatAry")
    
    '�Ј������J�i
    strWk = gfncstrDlm2(strDetail, 1)
    strWk = Trim$(strWk)
    lblKana.Caption = strWk
    
    '�Ј���������
    strWk = gfncstrDlm2(strDetail, 2)
    strWk = Trim$(strWk)
    lblShimei.Caption = strWk
    
    '�����X�R�[�h
    strWk = gfncstrDlm2(strDetail, 3)
    strWk = Trim$(strWk)
    lblShozoku(0).Caption = strWk
    
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
    lblBumon(0).Caption = strWk
    
    '���i�R�[�h
    strWk = gfncstrDlm2(strDetail, 6)
    strWk = Trim$(strWk)
    lblShikaku.Caption = strWk
    
    '�����R�[�h
    strWk = gfncstrDlm2(strDetail, 7)
    strWk = Trim$(strWk)
    lblKyu.Caption = strWk
    
    '���N����
    strWk = gfncstrDlm2(strDetail, 8)
    strWk = Trim$(strWk)
    If Trim(strWk) = "" Then
    Else
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        lblBirthday.Caption = strWk
    End If
    
    '�����X�R�[�h
    strWk = gfncstrDlm2(strDetail, 12)
    strWk = Trim$(strWk)
    lblShozoku(1).Caption = strWk
    
    '�{�[�i�X�x�����P
    gstrBonusMD1 = gfncstrDlm2(strDetail, 13)
    
    '�{�[�i�X�x�����Q
    gstrBonusMD2 = gfncstrDlm2(strDetail, 14)
    
    '��������R�[�h
    strWk = gfncstrDlm2(strDetail, 15)
    strWk = Trim$(strWk)
    lblBumon(1).Caption = strWk

End Sub
'****************************************************************************************************
'*    �Z���f�[�^�擾
'****************************************************************************************************
Private Function fncGetDat()
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '�z��̌���  �y�сA�P��Ŏ擾����l�`�w�̌���

On Error GoTo errfncblnGetDat

    fncGetDat = False

    lngSpCnt = 0

    '������ꗗ �r�o
    '�Ј��ԍ��P
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '�Ј��ԍ��Q
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '�Z����
    odbDatabase.Parameters.Add "InStrYuusibi", gstrYuusibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYuusibi").ServerType = ORATYPE_CHAR
    '�ԍσf�[�^
    odbDatabase.Parameters.Add "OtStrDatAry", " ", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR2

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110SelList("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYuusibi"
    strSQL = strSQL & ",:OtStrDatAry); END;"
    
    odbDatabase.DbexecuteSQL (strSQL)

'DEL 20090329 0807073/0808052 NBC LIU START
'    If odbDatabase.Parameters("OtStrDatAry") = "" Then          '�Y���f�[�^�Ȃ�
'DEL 20090329 0807073/0808052 NBC LIU END
'ADD 20090329 0807073/0808052 NBC LIU START
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) Then        '�Y���f�[�^�Ȃ�
'ADD 20090329 0807073/0808052 NBC LIU END
        Call gsubParaRemove(odbDatabase)                        '�I�u�W�F�N�g�̊J��
        sprList.ReDraw = True
        Exit Function
    End If

    '���ڃZ�b�g
    gstrYusiYMD = odbDatabase.Parameters("OtStrDatAry")

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncGetDat = True

    Exit Function

errfncblnGetDat:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'�N���X�^�����|�[�g
Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
 Dim strSelectionFormula As String
 Dim strConectPoint      As String
 Dim intRet              As Integer
    
On Error GoTo errPrintReport

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
            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
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
        .ReportFileName = App.Path & "\QPAV_CEnt110.rpt"
        .DiscardSavedData = True
            
        '���o�������L�q����i�R���s���[�^���j
        .SelectionFormula = "{QPAL_HENYOW.QPAL_COMPUTERMEI} = '" & gstrCommandLine(5) & "'"
            
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
    
errPrintReport:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub





'******************************************
'*�t�����E�o
'******************************************

Private Sub txtSyainCd_Change(index As Integer)
    If blnNoChangeEvFlg = True Then Exit Sub
    If index = 0 Then
        Call gsubMaxCharSkipEX(txtSyainCd(index), 1)
    End If
End Sub
Private Sub txtYuusibiY_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiY, 4)
End Sub
Private Sub txtYuusibiM_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiM, 2)
End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyainCD_GotFocus(index As Integer)
    Call gsubSelectText(txtSyainCd(index))
End Sub

Private Sub txtYuusibiY_GotFocus()
    Call gsubSelectText(txtYuusibiY)
End Sub

Private Sub txtYuusibiM_GotFocus()
    Call gsubSelectText(txtYuusibiM)
End Sub

Private Sub txtYuusibiD_GotFocus()
    Call gsubSelectText(txtYuusibiD)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyainCD_KeyPress(index As Integer, KeyAscii As Integer)
    If index = 0 Then
        Exit Sub ''''�Ј��R�[�h�P�͕��������͉\
    End If
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'**********************************************************************************************************
'*    �N  LostFocus Event  �t�H�[�}�b�g
'**********************************************************************************************************
Private Sub txtYuusibiY_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiY.Text) <> 4 Then txtYuusibiY.Text = Format$(txtYuusibiY.Text, "0000")
    blnNoChangeEvFlg = False
End Sub

'**********************************************************************************************************
'*    ��  LostFocus Event  �t�H�[�}�b�g
'**********************************************************************************************************
Private Sub txtYuusibim_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiM.Text) <> 2 Then txtYuusibiM.Text = Format$(txtYuusibiM.Text, "00")
    blnNoChangeEvFlg = False
End Sub
'**********************************************************************************************************
'*    ��  LostFocus Event  �t�H�[�}�b�g
'**********************************************************************************************************
Private Sub txtYuusibid_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiD.Text) <> 2 Then txtYuusibiD.Text = Format$(txtYuusibiD.Text, "00")
    blnNoChangeEvFlg = False
End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@�X�e�[�^�X�o�[��������
'*�@�@���@���@�F�@�����P�@�X�e�[�^�X�o�[�I�u�W�F�N�g
'*�@�@�@�\�T�v�F�@�I�y���[�^���A�R���s���[�^����\��
'*********************************************************************************************
Public Sub subInitStatusBar(objStb As StatusBar)
    
    '��Q�p�l���F�I�y���[�^����\��
    objStb.Panels.Item(2).Text = gstrCommandLine(2)
    
    '��R�p�l���F�R���s���[�^����\��
    objStb.Panels.Item(3).Text = gstrCommandLine(5)
    
End Sub

