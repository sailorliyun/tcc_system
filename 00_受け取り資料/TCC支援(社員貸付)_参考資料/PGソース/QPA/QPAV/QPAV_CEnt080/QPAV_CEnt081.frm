VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt081 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�Ј��Z���䒠"
   ClientHeight    =   4890
   ClientLeft      =   675
   ClientTop       =   4335
   ClientWidth     =   7500
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
   ScaleHeight     =   4890
   ScaleWidth      =   7500
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.PictureBox Picture1 
      Height          =   3810
      Index           =   1
      Left            =   0
      ScaleHeight     =   3750
      ScaleWidth      =   7440
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   0
      Width           =   7500
      Begin VB.PictureBox Picture6 
         Height          =   2925
         Left            =   165
         ScaleHeight     =   2865
         ScaleWidth      =   7035
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   630
         Width           =   7095
         Begin VB.TextBox txtHensaiTukisu 
            Alignment       =   1  '�E����
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
            Left            =   1710
            MaxLength       =   2
            TabIndex        =   4
            Top             =   1125
            Width           =   375
         End
         Begin VB.TextBox txtYuusiBonus 
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
            Height          =   360
            Left            =   4890
            MaxLength       =   9
            TabIndex        =   6
            Top             =   1965
            Width           =   1575
         End
         Begin VB.TextBox txtYuusiKyuuyo 
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
            Height          =   360
            Left            =   3300
            MaxLength       =   9
            TabIndex        =   5
            Top             =   1965
            Width           =   1575
         End
         Begin VB.ComboBox cboYusiKbn 
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            ItemData        =   "QPAV_CEnt081.frx":0000
            Left            =   1710
            List            =   "QPAV_CEnt081.frx":0002
            Style           =   2  '��ۯ���޳� ؽ�
            TabIndex        =   3
            Top             =   660
            Width           =   2430
         End
         Begin VB.TextBox txtYuusibiD 
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
            Left            =   3240
            TabIndex        =   2
            Top             =   210
            Width           =   330
         End
         Begin VB.TextBox txtYuusibiM 
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
            Left            =   2595
            TabIndex        =   1
            Top             =   210
            Width           =   330
         End
         Begin VB.TextBox txtYuusibiY 
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
            Left            =   1710
            TabIndex        =   0
            Top             =   210
            Width           =   570
         End
         Begin VB.Label lblYuusiBonus 
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
            ForeColor       =   &H00FF0000&
            Height          =   360
            Left            =   4890
            TabIndex        =   42
            Top             =   1965
            Width           =   1575
         End
         Begin VB.Label lblYuusiKyuuyo 
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
            ForeColor       =   &H00FF0000&
            Height          =   360
            Left            =   3300
            TabIndex        =   41
            Top             =   1965
            Width           =   1575
         End
         Begin VB.Label lblHensaiTsuki 
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   1710
            TabIndex        =   40
            Top             =   1125
            Width           =   375
         End
         Begin VB.Label lblYusiKbn 
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
            ForeColor       =   &H00FF0000&
            Height          =   345
            Left            =   1710
            TabIndex        =   39
            Top             =   660
            Width           =   1830
         End
         Begin VB.Label lblYuusibiD 
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   3240
            TabIndex        =   38
            Top             =   210
            Width           =   330
         End
         Begin VB.Label lblYuusibiM 
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   2595
            TabIndex        =   37
            Top             =   210
            Width           =   330
         End
         Begin VB.Label lblYuusibiY 
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   1710
            TabIndex        =   36
            Top             =   210
            Width           =   570
         End
         Begin VB.Label Label11 
            Alignment       =   2  '��������
            BackColor       =   &H00800000&
            BorderStyle     =   1  '����
            Caption         =   "�c��"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   720
            TabIndex        =   34
            Top             =   2340
            Width           =   975
         End
         Begin VB.Label Label8 
            Alignment       =   2  '��������
            BackColor       =   &H00800000&
            BorderStyle     =   1  '����
            Caption         =   "�Z���z"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   720
            TabIndex        =   33
            Top             =   1965
            Width           =   975
         End
         Begin VB.Label Label7 
            Alignment       =   2  '��������
            BackColor       =   &H00800000&
            BorderStyle     =   1  '����
            Caption         =   "���^�ԍϕ�"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   3300
            TabIndex        =   32
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label Label6 
            Alignment       =   2  '��������
            BackColor       =   &H00800000&
            BorderStyle     =   1  '����
            Caption         =   "���v"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   1710
            TabIndex        =   31
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label Label1 
            Alignment       =   2  '��������
            BackColor       =   &H00800000&
            BorderStyle     =   1  '����
            Caption         =   "�ܗ^�ԍϕ�"
            BeginProperty Font 
               Name            =   "�l�r �S�V�b�N"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   4890
            TabIndex        =   30
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label lblPer 
            Alignment       =   1  '�E����
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
            ForeColor       =   &H00C00000&
            Height          =   225
            Left            =   4830
            TabIndex        =   26
            Top             =   720
            Width           =   90
         End
         Begin VB.Label lblZanBonus 
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
            Height          =   360
            Left            =   4890
            TabIndex        =   25
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblZanKei 
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
            Height          =   360
            Left            =   1710
            TabIndex        =   24
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblZanKyuuyo 
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
            Height          =   360
            Left            =   3300
            TabIndex        =   23
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblYuusiKei 
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
            Height          =   360
            Left            =   1710
            TabIndex        =   22
            Top             =   1965
            Width           =   1575
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
            Left            =   5025
            TabIndex        =   21
            Top             =   720
            Width           =   240
         End
         Begin VB.Label Label22 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Z���敪"
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
            Left            =   720
            TabIndex        =   20
            Top             =   720
            Width           =   900
         End
         Begin VB.Label Label21 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "����"
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
            Left            =   2130
            TabIndex        =   19
            Top             =   1185
            Width           =   450
         End
         Begin VB.Label Label10 
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
            Left            =   3600
            TabIndex        =   18
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label9 
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
            Left            =   2970
            TabIndex        =   17
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label3 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�N"
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
            Left            =   2325
            TabIndex        =   16
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label2 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�Z����"
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
            Left            =   720
            TabIndex        =   15
            Top             =   255
            Width           =   675
         End
         Begin VB.Label Label4 
            Alignment       =   1  '�E����
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '����
            Caption         =   "�ԍό���"
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
            Left            =   720
            TabIndex        =   14
            Top             =   1185
            Width           =   900
         End
      End
      Begin VB.Label lblSyainCd 
         BackStyle       =   0  '����
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   1
         Left            =   1530
         TabIndex        =   35
         Top             =   375
         Width           =   750
      End
      Begin VB.Label Label5 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�Ј��R�[�h"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   195
         TabIndex        =   29
         Top             =   345
         Width           =   975
      End
      Begin VB.Label lblSyainCd 
         BackStyle       =   0  '����
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   0
         Left            =   1305
         TabIndex        =   28
         Top             =   375
         Width           =   210
      End
      Begin VB.Label lblShimei 
         BackStyle       =   0  '����
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   2445
         TabIndex        =   27
         Top             =   375
         Width           =   1440
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
      ScaleWidth      =   7440
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   3825
      Width           =   7500
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
         Height          =   255
         Left            =   45
         TabIndex        =   11
         Top             =   45
         Width           =   6990
      End
   End
   Begin VB.CommandButton cmdBack 
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
      Height          =   510
      Left            =   4770
      TabIndex        =   9
      Top             =   4320
      Width           =   1320
   End
   Begin VB.CommandButton cmdTorikesi 
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
      Height          =   510
      Left            =   3150
      TabIndex        =   8
      Top             =   4320
      Width           =   1320
   End
   Begin VB.CommandButton cmdSyori 
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   1545
      TabIndex        =   7
      Top             =   4305
      Width           =   1320
   End
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   90
      Top             =   4365
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      PrintFileLinesPerPage=   60
   End
End
Attribute VB_Name = "frmQPAV_CEnt081"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'----------------------------------------------------------------------------------------------
'�X�V���t  �Č��ԍ�  �C���S��       �C�����R
'20090828  0811051  murayama@NBC  �O���[�v�Ј��؏��ݕt���[������
'                                 �Z�������̓`�F�b�N��ǉ�
'                                 �i�ߋ����̓��͕s�A�������̓��͂͗��������܂ŉƂ���j
'----------------------------------------------------------------------------------------------


Private blnNoChangeEvFlg As Boolean '��ݼ޲���Ė����׸�

Private Type typRiritu
    strQPAH_NAMEN           As String       '���[������
    strQPAH_NAMEX           As String       '�Z�����
    strQPAH_RIRITU          As String       '����
End Type

Private gstrtypRiritu() As typRiritu
    
'************************************************************************
'*    ���s�{�^������������
'************************************************************************
Private Sub cmdSyori_Click()
 Dim strMsg As String     '���b�Z�[�W
 Dim strYusiKbn As String '�Z���敪
 
 '��2002/12/12�� ���̓`�F�b�N�𕜊�����
    '�����̓`�F�b�N(�o�^�A�C���̏ꍇ)��
    If Not gstrSyori = "�� ��" Then
        If fncblnNyuuryokuChk = False Then Exit Sub
    End If
 '��2002/12/12�� ���̓`�F�b�N�𕜊�����

    '���m�F���b�Z�[�W�̓��e��ݒ聡
    Select Case gstrSyori
        Case "�o �^"
            strMsg = "�Z���z       �F " & lblYuusiKei & "�~" & Chr$(10) & Chr$(13) _
                    & "���^�ԍϊz �F " & Format(txtYuusiKyuuyo, "#,##0") & "�~" & Chr$(10) & Chr$(13) _
                    & "�ܗ^�ԍϊz �F " & Format(txtYuusiBonus, "#,##0") & "�~" & Chr$(10) & Chr$(13) _
                    & "�Z������o�^���܂��B��낵���ł����H"
        Case "�C ��"
            strMsg = "�C�����Ă�낵���ł����H"
        Case "�� ��"
            strMsg = "�폜���Ă�낵���ł����H"
    End Select

    If MsgBox(strMsg, vbQuestion + vbOKCancel, "�Ј��Z���䒠") = vbCancel Then
        Exit Sub
    End If

    Screen.MousePointer = vbHourglass

    '���e�l��SP�p�ϐ��Ɋi�[��
    Select Case gstrSyori
    Case "�o �^"
        gstrYusiYMD = txtYuusibiY.Text & txtYuusibiM.Text & txtYuusibiD.Text          '�Z����
        gstrGendogaku = glngSyosyoGendogaku                                           '���x�z
        gstrRiritu = lblPer.Caption                                                   '����
        gstrHensaiTukisu = txtHensaiTukisu.Text                                       '�ԍό���
        gstrKyuyoHensaiAll = CLng(txtYuusiKyuuyo.Text)                                '���^�ԍϑ��z
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '���^�ԍϊz
        gstrSyoyoHensaiAll = CLng(txtYuusiBonus.Text)                                 '�ܗ^�ԍϑ��z
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '�ܗ^�ԍϊz
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '���^�c��
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '�ܗ^�c��
        gstrKojoChusiFlg = ""                                                         '�T�����~�t���O
        gstrKansaiYMD = ""                                                            '���ϓ�
        
            '���(�Z���敪)
'��2002/12/16 �C��
            gstrSyubetu = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_NAMEX             '�Z���敪��sp�����ϐ���
'            Select Case cboYusiKbn.Text
'            Case "��ʃ��[��"
'                strYusiKbn = "1"
'            Case "��ʃ��[���Q"
'                strYusiKbn = "2"
'            Case "��ʃ��[���R"
'                strYusiKbn = "5"
'            Case "���ʃ��[��"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'��2002/12/16 �C��

        '2001/11/20
        '2002/02/27 "085"���ǉ�
        If gstrYusiYMD < "20000301" Then
            If (Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) >= "001" And Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) <= "028") Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "041" Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "085" Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "095" Then
                gstrBonusMD1 = "0430"
                gstrBonusMD2 = "1031"
            End If
        End If
            
            
    Case "�C ��"
        gstrYusiYMD = lblYuusibiY.Caption & lblYuusibiM.Caption & lblYuusibiD.Caption '�Z����
        gstrGendogaku = glngSyosyoGendogaku                                           '���x�z
        gstrRiritu = lblPer.Caption                                                   '����
        gstrHensaiTukisu = txtHensaiTukisu.Text                                       '�ԍό���
        gstrKyuyoHensaiAll = CLng(txtYuusiKyuuyo.Text)                                '���^�ԍϑ��z
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '���^�ԍϊz
        gstrSyoyoHensaiAll = CLng(txtYuusiBonus.Text)                                 '�ܗ^�ԍϑ��z
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '�ܗ^�ԍϊz
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '���^�c��
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '�ܗ^�c��
        gstrKojoChusiFlg = ""                                                         '�T�����~�t���O
        gstrKansaiYMD = ""                                                            '���ϓ�

            '���(�Z���敪)
'��2002/12/16 �C��
            gstrSyubetu = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_NAMEX             '�Z���敪��sp�����ϐ���
'            Select Case cboYusiKbn.Text
'            Case "��ʃ��[��"
'                strYusiKbn = "1"
'            Case "��ʃ��[���Q"
'                strYusiKbn = "2"
'            Case "��ʃ��[���R"
'                strYusiKbn = "5"
'            Case "���ʃ��[��"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'��2002/12/16 �C��
            
    Case "�� ��"
        gstrYusiYMD = lblYuusibiY.Caption & lblYuusibiM.Caption & lblYuusibiD.Caption '�Z����
        gstrGendogaku = "0000"                                                        '���x�z
        gstrRiritu = lblPer.Caption                                                   '����
        gstrHensaiTukisu = lblHensaiTsuki.Caption                                     '�ԍό���
        gstrKyuyoHensaiAll = CLng(lblYuusiKyuuyo.Caption)                             '���^�ԍϑ��z
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '���^�ԍϊz
        gstrSyoyoHensaiAll = CLng(lblYuusiBonus.Caption)                              '�ܗ^�ԍϑ��z
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '�ܗ^�ԍϊz
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '���^�c��
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '�ܗ^�c��
        gstrKojoChusiFlg = ""                                                         '�T�����~�t���O
        gstrKansaiYMD = ""                                                            '���ϓ�
        
'��2002/12/16 �C��
'            '���(�Z���敪)
'            Select Case cboYusiKbn.Text
'            Case "��ʃ��[��"
'                strYusiKbn = "1"
'            Case "��ʃ��[���Q"
'                strYusiKbn = "2"
'            Case "��ʃ��[���R"
'                strYusiKbn = "5"
'            Case "���ʃ��[��"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'��2002/12/16 �C��
    End Select
    
    '�����X�ԍϊz���v�Z (�폜�ȊO)
    If Not gstrSyori = "�� ��" Then
        Call gsubKeisan
    End If
    
    '���eSP���s
    Select Case gstrSyori
    Case "�o �^"
        If fncblnTouroku = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    Case "�C ��"
        If fncblnSyusei = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    Case "�� ��"
        If fncblnDelete = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    End Select
    
    '���u�폜�v�ȊO�͈���\��
   
    If Not gstrSyori = "�� ��" Then
    
        '����p�e�[�u������f�[�^���폜
        If gfncblnDelPrintDat = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
        
        '�����׍쐬��
        If gstrYusiYMD <= "20000301" Then
            Call gSubMakeMeisaiKyuu '������
        Else
            Call gSubMakeMeisai     '���ݏ���
        End If
        
        '�����[�pð��ٓo�^SP�ďo��
        If gfncblnMakPrintDat = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    
        If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�ԍϗ\��\���") = vbCancel Then
            '����pð��ق����ް����폜
            If gfncblnDelPrintDat = False Then
                Screen.MousePointer = vbNormal
            End If
            Screen.MousePointer = vbNormal
        Else
            '�ؽ����߰Čďo
            Call subPrintReport(crptToPrinter)
                            
            '����pð��ق����ް����폜
            If gfncblnDelPrintDat = False Then
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
        End If
    End If
    
    Screen.MousePointer = vbNormal
    
    '�q��ʎ��s�����׸�
    gblnExecute = True

    Unload Me
    
End Sub
'******************************************************************************
'*    �߂�{�^������������
'******************************************************************************
Private Sub cmdBack_Click()
    Unload Me
End Sub
'******************************************************************************
'*    ����{�^������������
'******************************************************************************
Private Sub cmdTorikesi_Click()

    '����ʏ����\����
    Call subFormInit
    
    'SetFocus
    Select Case gstrSyori
    
    Case "�o �^"
        txtYuusibiY.SetFocus
    Case "�C ��"
        cboYusiKbn.SetFocus
    Case "�� ��"
        cmdSyori.SetFocus
        
    End Select
    
End Sub
'******************************************************************************
'*    FORM_ACTIVATE �C�x���g
'******************************************************************************
Private Sub Form_Activate()
End Sub
'******************************************************************************
'*    FORM_LOAD �C�x���g
'******************************************************************************
Private Sub Form_Load()

'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "�Ј��Z���䒠 (" & gstrCommandLine(8) & ")"
    lblShimei.Caption = gstrSyainName
    Me.lblSyainCd(0).Caption = gstrSyainCd1
    Me.lblSyainCd(1).Caption = gstrSyainCd2
    cmdSyori.Caption = gstrSyori
    
    '�����\������
    Call subInitScreen
    
    '��ʏ�����
    Call subFormInit
    
    '�q��ʎ��s����t���O������
    gblnExecute = False

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
'******************************************************************************
'*    FORM_KEYPRESS �C�x���g
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    '�װ����
    Call subErrKaijo
End Sub
'******************************************************************************
'*    ��ʏ�����
'******************************************************************************
Private Sub subFormInit()
 Dim i As Integer
 Dim strYusiYMD  As String '�Z����
 Dim lngI        As Long
 
    '�װ����
    Call subErrKaijo
    
    '�����ޯ�����e���
    Call subComboItemGet
    
    Me.cboYusiKbn.Clear
    For lngI = LBound(gstrtypRiritu) To UBound(gstrtypRiritu)
        Me.cboYusiKbn.AddItem gstrtypRiritu(lngI).strQPAH_NAMEN
    Next lngI

'    With cboYusiKbn
'        .Clear
'        .AddItem ("��ʃ��[��")
'        .AddItem ("��ʃ��[���Q")
'        .AddItem ("��ʃ��[���R")
'        .AddItem ("���ʃ��[��")
'    End With
    
    Select Case gstrSyori
    
        Case "�o �^"
            txtYuusibiY.Text = ""
            txtYuusibiM.Text = ""
            txtYuusibiD.Text = ""
            lblPer.Caption = ""
            lblYuusiKei.Caption = ""
            lblZanKei.Caption = ""
            txtYuusiKyuuyo.Text = ""
            txtYuusiBonus.Text = ""
            lblZanKyuuyo.Caption = ""
            lblZanBonus.Caption = ""
            cboYusiKbn.ListIndex = 0 - 1
            txtHensaiTukisu.Text = ""
            
        Case "�C ��"

            '�Z����
            strYusiYMD = gVarSpdGetText(frmQPAV_CEnt080.sprList, 1, glngSprRow)
            lblYuusibiY.Caption = Mid(strYusiYMD, 1, 4)
            lblYuusibiM.Caption = Mid(strYusiYMD, 6, 2)
            lblYuusibiD.Caption = Mid(strYusiYMD, 9, 2)
'��2002/12/16 �C��
            If Trim(gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)) = "" Then
                Me.cboYusiKbn.ListIndex = -1
            Else
                Me.cboYusiKbn.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)
            End If
''            '�Z���敪
''            If gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "" Then
''                cboYusiKbn.ListIndex = -1
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "��ʃ��[��" Then
''                cboYusiKbn.ListIndex = 0
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "��ʃ��[���Q" Then
''                cboYusiKbn.ListIndex = 1
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "��ʃ��[���R" Then
''                cboYusiKbn.ListIndex = 2
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "���ʃ��[��" Then
''                cboYusiKbn.ListIndex = 3
''            Else
''                cboYusiKbn.Text = ""
''            End If
'��2002/12/16 �C��
                        
            '���̑��e�l
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow))
            txtHensaiTukisu.Text = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), 1, i - 2)
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow))
            frmQPAV_CEnt081.lblPer.Caption = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 1)
            i = InStr(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), "��")
            lblYuusiKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 5, glngSprRow)  '�Z���z���v
            lblZanKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 8, glngSprRow)    '�c�����v
            txtYuusiKyuuyo.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 6, glngSprRow)  '���^�Z���z
            txtYuusiBonus.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 7, glngSprRow)   '�ܗ^�Z���z
            lblZanKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 9, glngSprRow) '���^�c��
            lblZanBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 10, glngSprRow) '�ܗ^�c��
            
        Case "�� ��"
        
            '�Z����
            strYusiYMD = gVarSpdGetText(frmQPAV_CEnt080.sprList, 1, glngSprRow)
            lblYuusibiY.Caption = Mid(strYusiYMD, 1, 4)
            lblYuusibiM.Caption = Mid(strYusiYMD, 6, 2)
            lblYuusibiD.Caption = Mid(strYusiYMD, 9, 2)
            
            '�Z���敪
            lblYusiKbn.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)
            
            '���̑��e�l
'            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow))
'            txtHensaiTukisu.Text = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 2)
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow))
            frmQPAV_CEnt081.lblPer.Caption = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 1)
            i = InStr(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), "��")
            lblHensaiTsuki.Caption = Left(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), i - 1)
            lblYuusiKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 5, glngSprRow)
            lblZanKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 8, glngSprRow)
            lblYuusiKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 6, glngSprRow)
            lblYuusiBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 7, glngSprRow)
            lblZanKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 9, glngSprRow)
            lblZanBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 10, glngSprRow)
            cmdTorikesi.Enabled = False
    End Select
    
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
'*    �G���[��������
'******************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
    txtHensaiTukisu.BackColor = vbWhite
    txtYuusiKyuuyo.BackColor = vbWhite
    txtYuusiBonus.BackColor = vbWhite
    cboYusiKbn.BackColor = vbWhite
End Sub
'******************************************************************************
'*    �Z���敪 �ύX������
'******************************************************************************
Private Sub cboYusiKbn_Click()
    
    '�R���{�{�b�N�X�̃��X�g�C���f�b�N�X���\���̂̔z��v�f��菬�����A�Ⴕ���͍ő���傫�����͏������Ȃ�
    If Not (cboYusiKbn.ListIndex >= LBound(gstrtypRiritu)) Then Exit Sub
    If Not (cboYusiKbn.ListIndex <= UBound(gstrtypRiritu)) Then Exit Sub
    
    Me.lblPer.Caption = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_RIRITU

'    Select Case cboYusiKbn.ListIndex
'        Case 0
'            lblPer.Caption = "8.00"
'        Case 1
'            lblPer.Caption = "7.50"
'        Case 2
'            lblPer.Caption = "7.00"
'        Case 3
'            lblPer.Caption = "6.50"
'    End Select
End Sub
'******************************************************************************
'*    �������
'******************************************************************************
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
            .WindowTitle = cpubMyPrjName & " (" & gstrCommandLine(8) & ")"
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
        .ReportFileName = App.Path & "\QPAV_CEnt080.rpt"
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
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
errPrintReport:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'******************************************************************************
'*    ���̓`�F�b�N
'******************************************************************************
Private Function fncblnNyuuryokuChk() As Boolean

    fncblnNyuuryokuChk = False

    '���Z���� (�o�^�̂�)
    If gstrSyori = "�o �^" Then
        If txtYuusibiY.Text = "" Then
            lblMsg.Caption = "�Z�����������͂ł��B"
            txtYuusibiY.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
        
        If txtYuusibiM.Text = "" Then
            lblMsg.Caption = "�Z�����������͂ł��B"
            txtYuusibiM.BackColor = vbRed
            txtYuusibiM.SetFocus
            Exit Function
        End If
        
        If txtYuusibiD.Text = "" Then
            lblMsg.Caption = "�Z�����������͂ł��B"
            txtYuusibiD.BackColor = vbRed
            txtYuusibiD.SetFocus
            Exit Function
        End If
        
        '�Z�����ɓ��͂��ꂽ�l�����t�Ƃ��Đ��������`�F�b�N
        If IsDate(Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text)) = False Then
            lblMsg.Caption = "���͂Ɍ�肪����܂��B"
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
'�� 2002/12/12 �� �ߋ����̃`�F�b�N�͂��Ȃ����ƂƂ���
'        '�ߋ����̓��͂��֎~����
'        If Format$(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Mid(gstrSysDate, 7, 2), "YYYY/MM/DD") > Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text) Then
'            lblMsg.Caption = "�ߋ����̓��͂͂ł��܂���B"
'            txtYuusibiY.BackColor = vbRed
'            txtYuusibiM.BackColor = vbRed
'            txtYuusibiD.BackColor = vbRed
'            txtYuusibiY.SetFocus
'            Exit Function
'        End If
'�� 2002/12/12 �� �ߋ����̃`�F�b�N�͂��Ȃ����ƂƂ���

'ADD 20090828 0811051 NBC MURAYAMA START
        If Format$(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Mid(gstrSysDate, 7, 2), "YYYY/MM/DD") > Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text) Then
        '�ߋ����`�F�b�N
            lblMsg.Caption = "WPOE20 " & gstrGetCodeMeisyo(odbDatabase, "E20", "WPO")
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            
            Exit Function
        ElseIf (txtYuusibiY.Text & txtYuusibiM.Text) - Format(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2), "yyyymm") > 0 Then
        '�������`�F�b�N
            lblMsg.Caption = "WPOE39 �������" & gstrGetCodeMeisyo(odbDatabase, "E39", "WPO")
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
'ADD 20090828 0811051 NBC MURAYAMA END

    End If
    
    '���Z���敪
    If cboYusiKbn.Text = "" Then
        lblMsg.Caption = "�Z���敪���I������Ă��܂���B"
        cboYusiKbn.BackColor = vbRed
        cboYusiKbn.SetFocus
        Exit Function
    End If
    
    '���ԍό���
    If txtHensaiTukisu.Text = "" Then
        lblMsg.Caption = "�ԍό����������͂ł��B"
        txtHensaiTukisu.BackColor = vbRed
        txtHensaiTukisu.SetFocus
        Exit Function
    End If
    
    If txtHensaiTukisu.Text < 6 Or txtHensaiTukisu.Text > 60 Then
        lblMsg.Caption = "�ԍό����͂U�`�U�O�܂ł̒l����͂��ĉ������B"
        txtHensaiTukisu.BackColor = vbRed
        txtHensaiTukisu.SetFocus
        Exit Function
    End If
        
    '�����^�ԍϕ�
    If txtYuusiKyuuyo.Text = "" Then
        lblMsg.Caption = "���^�ԍϕ��������͂ł��B"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiKyuuyo.SetFocus
        Exit Function
    End If
    
    '���ܗ^�ԍϕ�
    If txtYuusiBonus.Text = "" Then
        lblMsg.Caption = "�ܗ^�ԍϕ��������͂ł��B"
        txtYuusiBonus.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If
    
    '�����^���ܗ^�ԍϕ�
    If Trim(txtYuusiKyuuyo.Text) = "0" And Trim(txtYuusiBonus.Text) = "0" Then
        lblMsg.Caption = "�L���Ȓl�����͂���Ă��܂���B"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.BackColor = vbRed
        txtYuusiKyuuyo.SetFocus
        Exit Function
    End If
    
    If glngSyosyoGendogaku < CLng(Trim(txtYuusiBonus.Text)) + CLng(Trim(txtYuusiKyuuyo.Text)) Then
        lblMsg.Caption = "���x�z�I�[�o�[�ł��B"
        txtYuusiBonus.BackColor = vbRed
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If
    
    If CLng(Trim(txtYuusiKyuuyo.Text)) < CLng(Trim(txtYuusiBonus.Text)) Then
        lblMsg.Caption = "�ܗ^�ԍϕ��͋��^�ԍϕ����傫�����͂͂ł��܂���B"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If

    
    fncblnNyuuryokuChk = True
    
End Function

'******************************************************************************
'*    �����̂ݓ��͉ɂ���
'******************************************************************************
Private Sub txtYuusibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusibiM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusibiD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtHensaiTukisu_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusiKyuuyo_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusiBonus_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
'******************************************************************************
'*    �e�L�X�g�I��
'******************************************************************************
Private Sub txtYuusibiY_GotFocus()
    Call gsubSelectText(txtYuusibiY)
End Sub
Private Sub txtYuusibiM_GotFocus()
    Call gsubSelectText(txtYuusibiM)
End Sub
Private Sub txtYuusibiD_GotFocus()
    Call gsubSelectText(txtYuusibiD)
End Sub
Private Sub txtYuusiKyuuyo_GotFocus()
    Call gsubSelectText(txtYuusiKyuuyo)
End Sub
Private Sub txtYuusiBonus_GotFocus()
    Call gsubSelectText(txtYuusiBonus)
End Sub
Private Sub txtHensaiTukisu_GotFocus()
    Call gsubSelectText(txtHensaiTukisu)
End Sub
'******************************************************************************
'*    �t�����E�o
'******************************************************************************
Private Sub txtYuusibiY_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiY, 4)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiM_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiM, 2)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiD_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiD, 2)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtHensaiTukisu_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtHensaiTukisu, 2)
    blnNoChangeEvFlg = False
End Sub
'******************************************************************************
'*    LOST_FOCUS �C�x���g
'******************************************************************************
Private Sub txtYuusibiM_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiM.Text) <> 2 Then txtYuusibiM.Text = Format$(txtYuusibiM.Text, "00")
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiD_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiD.Text) <> 2 Then txtYuusibiD.Text = Format$(txtYuusibiD.Text, "00")
    blnNoChangeEvFlg = False
End Sub
'******************************************************************************
'*    LOST_FOCUS ���z̫�ϯĕϊ�
'******************************************************************************
Private Sub txtYuusiKyuuyo_LostFocus()

    '�����^�Z���z��
    
    '���o�^������
    If gstrSyori = "�o �^" Then
        If Not txtYuusiKyuuyo.Text = "" Then
            txtYuusiKyuuyo.Text = Format$(txtYuusiKyuuyo.Text, "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            If Not txtYuusiBonus = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiKyuuyo.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        Else
            txtYuusiKyuuyo.Text = "0"
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            If Not txtYuusiBonus = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiKyuuyo.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        End If
        
    '���C��������
    ElseIf gstrSyori = "�C ��" Then
        If Not txtYuusiKyuuyo.Text = "" Then
            If CLng(lblYuusiKei.Caption) < CLng(txtYuusiKyuuyo.Text) Then
                lblMsg.Caption = "�Z�����v�z�����傫�Ȓl�����͂���Ă��܂��B"
                txtYuusiKyuuyo.SetFocus
                txtYuusiKyuuyo.BackColor = vbRed
                Exit Sub
            End If
            txtYuusiKyuuyo.Text = Format$(txtYuusiKyuuyo.Text, "#,##0")
            txtYuusiBonus.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiKyuuyo.Text)), "#,##0")
                
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        Else
            txtYuusiKyuuyo.Text = "0"
            txtYuusiBonus.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiKyuuyo.Text)), "#,##0")
        
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        End If
    End If
    
End Sub
Private Sub txtYuusiBonus_LostFocus()

    '���ܗ^�Z���z��
    
    '���o�^������
    If gstrSyori = "�o �^" Then
        If Not txtYuusiBonus.Text = "" Then
            txtYuusiBonus.Text = Format$(txtYuusiBonus.Text, "#,##0")
            lblZanBonus.Caption = txtYuusiBonus.Text
            If Not txtYuusiKyuuyo = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiBonus.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        Else
            txtYuusiBonus.Text = "0"
            lblZanBonus.Caption = txtYuusiBonus.Text
            If Not txtYuusiKyuuyo = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiBonus.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        End If
        
    '���C��������
    ElseIf gstrSyori = "�C ��" Then
        If Not txtYuusiBonus.Text = "" Then
            If CLng(lblYuusiKei.Caption) < CLng(txtYuusiBonus.Text) Then
                lblMsg.Caption = "�Z�����v�z�����傫�Ȓl�����͂���Ă��܂��B"
                txtYuusiBonus.SetFocus
                txtYuusiBonus.BackColor = vbRed
                Exit Sub
            End If
            txtYuusiBonus.Text = Format$(txtYuusiBonus.Text, "#,##0")
            txtYuusiKyuuyo.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiBonus.Text)), "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        Else
            txtYuusiBonus.Text = "0"
            txtYuusiKyuuyo.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiBonus.Text)), "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        End If
    End If
    
End Sub
'******************************************************************************
'*    FORM_KEYDOWN �t�@���N�V�����L�[�ݒ�
'******************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyReturn   'Enter
            SendKeys "{TAB}"
        Case vbKeyDelete   'DEL�L�[����������
            Call Form_KeyPress(46)
        Case vbKeyUp
            Call subErrKaijo
        Case vbKeyLeft
            Call subErrKaijo
        Case vbKeyRight
            Call subErrKaijo
        Case vbKeyDown
            Call subErrKaijo
    End Select
End Sub
'******************************************************************************
'*    �o�^����SP
'******************************************************************************
Private Function fncblnTouroku() As Boolean
 Dim strSQL As String

On Error GoTo errfncblnTouroku
    
    fncblnTouroku = False

    'SP�@�e�p�����[�^��ݒ�
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT              '�Ј��R�[�h�P
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT              '�Ј��R�[�h�Q
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT                '�Z����
        .Add "InStrGendogaku", gstrGendogaku, ORAPARM_INPUT            '���x�z
        .Add "InStrSyubetu", gstrSyubetu, ORAPARM_INPUT                '���
        .Add "InStrRiritu", gstrRiritu, ORAPARM_INPUT                  '����
        .Add "InStrHensaiTsukisu", gstrHensaiTukisu, ORAPARM_INPUT     '�ԍό���
        .Add "InStrKyuyoHensaiAll", gstrKyuyoHensaiAll, ORAPARM_INPUT  '���^�ԍϑ��z
        .Add "InStrKyuyoHensai", gstrKyuyoHensaigaku, ORAPARM_INPUT    '���^�ԍϊz
        .Add "InStrSyoyoHensaiAll", gstrSyoyoHensaiAll, ORAPARM_INPUT  '�ܗ^�ԍϑ��z
        .Add "InStrSyoyoHensai", gstrSyoyoHensaigaku, ORAPARM_INPUT    '�ܗ^�ԍϊz
        .Add "InStrKyuyoZandaka", gstrKyuyoZandaka, ORAPARM_INPUT      '���^�c��
        .Add "InStrSyoyoZandaka", gstrSyoyoZandaka, ORAPARM_INPUT      '�ܗ^�c��
        .Add "InStrKojoChusiFlg", gstrKojoChusiFlg, ORAPARM_INPUT      '�T���t���O
        .Add "InStrKansaiYMD", gstrKansaiYMD, ORAPARM_INPUT            '���ϓ�
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT          '���j���[�h�c�i�I�y���O�p�j
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT             '���W���[���h�c�i�I�y���O�p�j
'2003/02/18 �C��
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT        '�S���Җ��i�I�y���O�p�j
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ��i�I�y���O�p�j
'
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^�[���i�I�y���O�p�j
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT       '�����敪�i�I�y���O�p�j
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT        '�����R�[�h�i�I�y���O�p�j
        .Add "OtChouhukuFlg", "0", ORAPARM_OUTPUT                      '�d���t���O
        .Item("OtChouhukuFlg").ServerType = ORATYPE_CHAR
    End With

    'SQL���쐬
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatAdd("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYusiYMD"
    strSQL = strSQL & ",:InStrGendogaku"
    strSQL = strSQL & ",:InStrSyubetu"
    strSQL = strSQL & ",:InStrRiritu"
    strSQL = strSQL & ",:InStrHensaiTsukisu"
    strSQL = strSQL & ",:InStrKyuyoHensaiAll"
    strSQL = strSQL & ",:InStrKyuyoHensai"
    strSQL = strSQL & ",:InStrSyoyoHensaiAll"
    strSQL = strSQL & ",:InStrSyoyoHensai"
    strSQL = strSQL & ",:InStrKyuyoZandaka"
    strSQL = strSQL & ",:InStrSyoyoZandaka"
    strSQL = strSQL & ",:InStrKojoChusiFlg"
    strSQL = strSQL & ",:InStrKansaiYMD"
    strSQL = strSQL & ",:InStrMenuId"
    strSQL = strSQL & ",:InStrModuleId"
    strSQL = strSQL & ",:InStrTantoMei"
    strSQL = strSQL & ",:InStrComputerMei"
    strSQL = strSQL & ",:InStrRiyouKbn"
    strSQL = strSQL & ",:InStrBushoCd"
    strSQL = strSQL & ",:OtChouhukuFlg); END;"

    'SP���s
    odbDatabase.DbexecuteSQL (strSQL)
    
    '���G���[������
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errfncblnTouroku
    End If
    
    '���d���G���[�`�F�b�N
    If Trim$(odbDatabase.Parameters("OtChouhukuFlg")) = "1" Then
    
        lblMsg.Caption = "�Z�������d�����Ă��܂��B"
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnTouroku = True
    
    Exit Function
  
errfncblnTouroku:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    �C������SP
'******************************************************************************
Private Function fncblnSyusei() As Boolean
 Dim strSQL         As String

On Error GoTo errfncblnSyusei

    fncblnSyusei = False
    
    'SP�@�e�p�����[�^��ݒ�
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT              '�Ј��R�[�h�P
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT              '�Ј��R�[�h�Q
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT                '�Z����
        .Add "InStrGendogaku", gstrGendogaku, ORAPARM_INPUT            '���x�z
        .Add "InStrSyubetu", gstrSyubetu, ORAPARM_INPUT                '���
        .Add "InStrRiritu", gstrRiritu, ORAPARM_INPUT                  '����
        .Add "InStrHensaiTsukisu", gstrHensaiTukisu, ORAPARM_INPUT     '�ԍό���
        .Add "InStrKyuyoHensaiAll", gstrKyuyoHensaiAll, ORAPARM_INPUT  '���^�ԍϑ��z
        .Add "InStrKyuyoHensai", gstrKyuyoHensaigaku, ORAPARM_INPUT    '���^�ԍϊz
        .Add "InStrSyoyoHensaiAll", gstrSyoyoHensaiAll, ORAPARM_INPUT  '�ܗ^�ԍϑ��z
        .Add "InStrSyoyoHensai", gstrSyoyoHensaigaku, ORAPARM_INPUT    '�ܗ^�ԍϊz
        .Add "InStrKyuyoZandaka", gstrKyuyoZandaka, ORAPARM_INPUT      '���^�c��
        .Add "InStrSyoyoZandaka", gstrSyoyoZandaka, ORAPARM_INPUT      '�ܗ^�c��
        .Add "InStrKojoChusiFlg", gstrKojoChusiFlg, ORAPARM_INPUT      '�T���t���O
        .Add "InStrKansaiYMD", gstrKansaiYMD, ORAPARM_INPUT            '���ϓ�
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT          '���j���[�h�c�i�I�y���O�p�j
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT             '���W���[���h�c�i�I�y���O�p�j
'2003/02/18 �C��
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT        '�S���Җ��i�I�y���O�p�j
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT        '�S���Җ��i�I�y���O�p�j
'
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^�[���i�I�y���O�p�j
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT       '�����敪�i�I�y���O�p�j
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT        '�����R�[�h�i�I�y���O�p�j
    End With
    'SQL���쐬
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatUpd("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYusiYMD"
    strSQL = strSQL & ",:InStrGendogaku"
    strSQL = strSQL & ",:InStrSyubetu"
    strSQL = strSQL & ",:InStrRiritu"
    strSQL = strSQL & ",:InStrHensaiTsukisu"
    strSQL = strSQL & ",:InStrKyuyoHensaiAll"
    strSQL = strSQL & ",:InStrKyuyoHensai"
    strSQL = strSQL & ",:InStrSyoyoHensaiAll"
    strSQL = strSQL & ",:InStrSyoyoHensai"
    strSQL = strSQL & ",:InStrKyuyoZandaka"
    strSQL = strSQL & ",:InStrSyoyoZandaka"
    strSQL = strSQL & ",:InStrKojoChusiFlg"
    strSQL = strSQL & ",:InStrKansaiYMD"
    strSQL = strSQL & ",:InStrMenuId"
    strSQL = strSQL & ",:InStrModuleId"
    strSQL = strSQL & ",:InStrTantoMei"
    strSQL = strSQL & ",:InStrComputerMei"
    strSQL = strSQL & ",:InStrRiyouKbn"
    strSQL = strSQL & ",:InStrBushoCd); END;"
    
    'SP���s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then    '�G���[
        GoTo errfncblnSyusei
    End If

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnSyusei = True
    
    Exit Function
  
errfncblnSyusei:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    �폜����SP
'******************************************************************************
Private Function fncblnDelete() As Boolean
 Dim strSQL As String

On Error GoTo errfncblnDelete

    fncblnDelete = False
    
    'SP ���Ұ��ݒ�
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT           '���i�敪
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT           '���i�R�[�h
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT             '�S���҃R�[�h�i�I�y���O�p�j
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT       '���j���[�h�c�i�I�y���O�p�j
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT          '���W���[���h�c�i�I�y���O�p�j
'2003/02/18 �C��
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT     '�S���҂h�c�i�I�y���O�p�j
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT  '�R���s���[�^�[���i�I�y���O�p�j
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT    '�����敪�i�I�y���O�p�j
'2003/02/18 �C��
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT      '�����R�[�h�i�I�y���O�p�j
'        .Add "InStrBushoCd", gstrCommandLine(2), ORAPARM_INPUT
'
    End With
    'SQL���쐬
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatDel("
    strSQL = strSQL & ":InStrSyainCd1,"
    strSQL = strSQL & ":InStrSyainCd2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrMenuId,"
    strSQL = strSQL & ":InStrModuleId,"
    strSQL = strSQL & ":InStrTantoMei,"
    strSQL = strSQL & ":InStrComputerMei,"
    strSQL = strSQL & ":InStrRiyouKbn,"
    strSQL = strSQL & ":InStrBushoCd); END;"

    'SP���s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then    '�G���[
        GoTo errfncblnDelete
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    fncblnDelete = True
    
    Exit Function
  
errfncblnDelete:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    �����\������
'******************************************************************************
Private Sub subInitScreen()

    Select Case gstrSyori
    
    Case "�o �^"
        txtYuusibiY.Visible = True
        txtYuusibiM.Visible = True
        txtYuusibiD.Visible = True
        cboYusiKbn.Visible = True
        txtYuusiKyuuyo.Visible = True
        txtYuusiBonus.Visible = True
        txtHensaiTukisu.Visible = True
        
        lblYuusibiY.Visible = False
        lblYuusibiM.Visible = False
        lblYuusibiD.Visible = False
        lblYusiKbn.Visible = False
        lblYuusiKyuuyo.Visible = False
        lblYuusiBonus.Visible = False
        lblHensaiTsuki.Visible = False
        
    Case "�C ��"
        txtYuusibiY.Visible = False
        txtYuusibiM.Visible = False
        txtYuusibiD.Visible = False
        cboYusiKbn.Visible = True
        txtYuusiKyuuyo.Visible = True
        txtYuusiBonus.Visible = True
        txtHensaiTukisu.Visible = True
        
        lblYuusibiY.Visible = True
        lblYuusibiM.Visible = True
        lblYuusibiD.Visible = True
        lblYusiKbn.Visible = False
        lblYuusiKyuuyo.Visible = False
        lblYuusiBonus.Visible = False
        lblHensaiTsuki.Visible = False
        
    Case "�� ��"
        txtYuusibiY.Visible = False
        txtYuusibiM.Visible = False
        txtYuusibiD.Visible = False
        cboYusiKbn.Visible = False
        txtYuusiKyuuyo.Visible = False
        txtYuusiBonus.Visible = False
        txtHensaiTukisu.Visible = False
        
        lblYuusibiY.Visible = True
        lblYuusibiM.Visible = True
        lblYuusibiD.Visible = True
        lblYusiKbn.Visible = True
        lblYuusiKyuuyo.Visible = True
        lblYuusiBonus.Visible = True
        lblHensaiTsuki.Visible = True
        
    End Select
    
End Sub
'**********************************************************************************************************
'*    ���X�ԍϊz�v�Z
'**********************************************************************************************************
Public Sub gsubKeisan()
 Dim dblRiritu          As Double  '�_�񗘗�
 
'--���[�N----------------------------------------------
 Dim lngYuusi           As Long    '�Z���z_WORK
 Dim strSyouyoDate1     As String  '�ܗ^�x����1_WORK
 Dim strSyouyoDate2     As String  '�ܗ^�x����1_WORK
 Dim dblKeiyakuriritu   As Double  '�_�񗘗�_WORK
 Dim strMonth_1         As String  '��1_WORK
 Dim strMonth_2         As String  '��1_WORK
 Dim strNextSyouyoMonth As String  '����ܗ^��_WORK
 Dim intPage            As Integer '��_WORK
 Dim intGyou            As Integer '�s_WORK
 Dim strYuusiDate       As String  '�Z����_WORK
 Dim strYuusiMae        As String  '�Z�����t�O_WORK
 Dim strYuusiAto        As String  '�Z�����t��_WORK
 Dim lngKyuuyoCNT       As Long    '���^�z�񌏐�
 Dim lngSyouyoCNT       As Long    '�ܗ^�z�񌏐�

 Dim intKaisuu          As Integer
 Dim dblWKYuusibi       As Double
 Dim varWKSyouyoDate1   As Variant
 Dim varWKSyouyoDate2   As Variant
 Dim lngKyuyoYusigaku   As Long
 Dim lngSyoyoYusigaku   As Long

 Dim strYuusiYMD_W      As String '2001/12/06

On Error GoTo gsubKeisan

    '�ϐ��ɃZ�b�g
    dblRiritu = CDbl(gstrRiritu)                 '�_�񗘗�
    dblKeiyakuriritu = dblRiritu
    intKaisuu = gstrHensaiTukisu                 '�ԍό���
    lngKyuyoYusigaku = CLng(gstrKyuyoHensaiAll)
    lngSyoyoYusigaku = CLng(gstrSyoyoHensaiAll)
    
    '�ܗ^�x��������
''''''    If Format(Date, "MMDD") < gstrBonusMD1 Then
''''    If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''        '�ܗ^�x�������P���ܗ^�x�������Q��
''''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
''''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strSyouyoDate2 = Format$(DateAdd("YYYY", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strMonth_1 = Left$(gstrBonusMD2, 2)
''''        strMonth_2 = Left$(gstrBonusMD1, 2)
''''''    ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
''''    ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
''''        '�ܗ^�x�������Q���ܗ^�x�������P��
''''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
''''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strMonth_1 = Left$(gstrBonusMD2, 2)
''''        strMonth_2 = Left$(gstrBonusMD1, 2)
''''    ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''        strMonth_2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''    End If
    strYuusiYMD_W = Mid$(gstrYusiYMD, 1, 4) & "/" & Mid$(gstrYusiYMD, 5, 2) & "/" & Mid$(gstrYusiYMD, 7, 2) '2001/12/06
    If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ�
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
        End If
    Else
        If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12�ǉ� '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12�ǉ�
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12�ǉ�
    End If

    
    
    '----���^--------------------
    dblWKYuusibi = CDate(Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2))
    varWKSyouyoDate1 = CVar(strSyouyoDate1)
    varWKSyouyoDate2 = CVar(strSyouyoDate2)

    gstrKyuyoHensaigaku = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, intKaisuu, lngKyuyoYusigaku, lngSyoyoYusigaku, varWKSyouyoDate1, varWKSyouyoDate2)  '�@�U����
    
    '----�ܗ^------------------------
    dblWKYuusibi = CDate(Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2))
    varWKSyouyoDate1 = CVar(strSyouyoDate1)
    varWKSyouyoDate2 = CVar(strSyouyoDate2)
    
    gstrSyoyoHensaigaku = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, intKaisuu, lngKyuyoYusigaku, lngSyoyoYusigaku, varWKSyouyoDate1, varWKSyouyoDate2)

    Exit Sub

gsubKeisan:
    Exit Sub

End Sub
'**********************************************************************************************************
'   ������OTHER�}�X�^���f�[�^���擾����
'   �\���̂փZ�b�g
'   gstrRiritu.strQPAH_NAMEN    ��  ���[������
'   gstrRiritu.strQPAH_NAMEX    ��  �Z�����
'   gstrRiritu.strQPAH_RIRITU   ���@����
'**********************************************************************************************************
Private Sub subComboItemGet()
    Dim strSQL          As String
    Dim objTable        As Object
    Dim strGetName      As String
    Dim strGetRiritsu   As String
    Dim strShubetsu     As String
    Dim lngI            As Long
    Dim strWork         As String
    
    Erase gstrtypRiritu

    lngI = 0

    strSQL = ""
    strSQL = strSQL & "SELECT"
    strSQL = strSQL & " QPAH_PRMCODE"
    strSQL = strSQL & ",QPAH_NAMEN"
    strSQL = strSQL & ",QPAH_NAMEX"
    strSQL = strSQL & ",QPAH_RIRITU "
    strSQL = strSQL & "FROM "
    strSQL = strSQL & "QPAH_OTHERM "
    strSQL = strSQL & "WHERE "
    strSQL = strSQL & "SUBSTR(QPAH_PRMCODE,1,7) = 'RIIPPAN' "
    strSQL = strSQL & "OR "
    strSQL = strSQL & "RTRIM(QPAH_PRMCODE) = 'RITOKUBETU'"
    strSQL = strSQL & "ORDER BY QPAH_NAMEX ASC"

    If gblnOpenOracleTable(objTable, strSQL) = False Then
        Set objTable = Nothing
        Exit Sub
    End If
 
    Do Until objTable.EOF = True
        ReDim Preserve gstrtypRiritu(lngI)
        
        With gstrtypRiritu(lngI)
            .strQPAH_NAMEN = gstrCheckNull(objTable.Fields.Item("QPAH_NAMEN").Value, 1)
            .strQPAH_NAMEX = gstrCheckNull(objTable.Fields.Item("QPAH_NAMEX").Value, 1)
             strWork = gstrCheckNull(objTable.Fields.Item("QPAH_RIRITU").Value, 1)
            .strQPAH_RIRITU = Format(strWork, "##.#0")
        End With

        objTable.MoveNext
        lngI = lngI + 1
    Loop
    
    Set objTable = Nothing

End Sub

