VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt520 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "����(��������)"
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
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   7920
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   4980
      Left            =   60
      TabIndex        =   23
      Top             =   1440
      Width           =   14250
      Begin VB.TextBox txtNyukinGanpon 
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
         IMEMode         =   3  '�̌Œ�
         Left            =   6285
         MaxLength       =   9
         TabIndex        =   2
         Top             =   1560
         Width           =   1830
      End
      Begin VB.TextBox txtNyukinTesuryou 
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
         IMEMode         =   3  '�̌Œ�
         Left            =   6285
         MaxLength       =   9
         TabIndex        =   3
         Top             =   1980
         Width           =   1830
      End
      Begin VB.CommandButton cmdTorikeshi 
         Caption         =   "���"
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
         Left            =   6285
         TabIndex        =   4
         Top             =   4290
         Width           =   1830
      End
      Begin VB.Label Label3 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "(�Ó����`�F�b�N�Ȃ�)"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   8280
         TabIndex        =   60
         Top             =   2040
         Width           =   1890
      End
      Begin VB.Label Label2 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "(25�������Ŏ��Z)"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   10440
         TabIndex        =   59
         Top             =   405
         Width           =   1725
      End
      Begin VB.Label lblNyukinYMD 
         Alignment       =   2  '��������
         BorderStyle     =   1  '����
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
         Height          =   315
         Left            =   6285
         TabIndex        =   58
         Top             =   930
         Width           =   1830
      End
      Begin VB.Label Label12 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "������"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   5415
         TabIndex        =   57
         Top             =   1005
         Width           =   675
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�����z(���{)"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
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
         Left            =   4815
         TabIndex        =   56
         Top             =   1620
         Width           =   1275
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�c��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
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
         Left            =   5640
         TabIndex        =   55
         Top             =   3705
         Width           =   450
      End
      Begin VB.Label lblZandaka 
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
         Height          =   315
         Left            =   6285
         TabIndex        =   54
         Top             =   3660
         Width           =   1830
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�����z(�萔��)"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   2
         Left            =   4605
         TabIndex        =   53
         Top             =   2040
         Width           =   1500
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�����z�v"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   3
         Left            =   5205
         TabIndex        =   52
         Top             =   2460
         Width           =   900
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���{"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   4
         Left            =   5655
         TabIndex        =   51
         Top             =   2880
         Width           =   450
      End
      Begin VB.Label Label8 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�萔��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   5
         Left            =   5415
         TabIndex        =   50
         Top             =   3300
         Width           =   675
      End
      Begin VB.Label lblNyukinKei 
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
         Height          =   315
         Left            =   6285
         TabIndex        =   49
         Top             =   2400
         Width           =   1830
      End
      Begin VB.Label lblGanpon 
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
         Height          =   315
         Left            =   6285
         TabIndex        =   48
         Top             =   2820
         Width           =   1830
      End
      Begin VB.Label lblTesuryou 
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
         Height          =   315
         Left            =   6285
         TabIndex        =   47
         Top             =   3240
         Width           =   1830
      End
      Begin VB.Label Label5 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
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
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   0
         Left            =   4350
         TabIndex        =   46
         Top             =   405
         Width           =   450
      End
      Begin VB.Label lblUZandaka 
         Alignment       =   1  '�E����
         BackStyle       =   0  '����
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
         Height          =   225
         Left            =   4980
         TabIndex        =   45
         Top             =   405
         Width           =   1095
      End
      Begin VB.Label Label5 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���{"
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
         Index           =   2
         Left            =   6285
         TabIndex        =   44
         Top             =   405
         Width           =   450
      End
      Begin VB.Label lblUGanpon 
         Alignment       =   1  '�E����
         BackStyle       =   0  '����
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
         Height          =   225
         Left            =   6870
         TabIndex        =   43
         Top             =   405
         Width           =   1095
      End
      Begin VB.Label Label5 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�萔��"
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
         Left            =   7980
         TabIndex        =   42
         Top             =   405
         Width           =   885
      End
      Begin VB.Label lblUTesuryou 
         Alignment       =   1  '�E����
         BackStyle       =   0  '����
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
         Height          =   225
         Left            =   8940
         TabIndex        =   41
         Top             =   405
         Width           =   1095
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1350
      Left            =   60
      TabIndex        =   21
      Top             =   30
      Width           =   14250
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   180
         Top             =   180
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
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
         Left            =   3270
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
         Width           =   900
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
         Left            =   11490
         TabIndex        =   40
         Top             =   990
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
         Left            =   11490
         TabIndex        =   39
         Top             =   630
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
         Left            =   11490
         TabIndex        =   38
         Top             =   300
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
         Left            =   10560
         TabIndex        =   37
         Top             =   990
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
         Left            =   11040
         TabIndex        =   36
         Top             =   630
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
         Left            =   10890
         TabIndex        =   35
         Top             =   300
         Width           =   360
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
         Left            =   7680
         TabIndex        =   34
         Top             =   990
         Width           =   2775
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
         Left            =   6840
         TabIndex        =   33
         Top             =   990
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
         Left            =   5910
         TabIndex        =   32
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
         Height          =   285
         Left            =   6840
         TabIndex        =   31
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
         Left            =   5910
         TabIndex        =   30
         Top             =   660
         Width           =   720
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
         Left            =   7710
         TabIndex        =   29
         Top             =   300
         Width           =   2775
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
         TabIndex        =   28
         Top             =   300
         Width           =   795
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
         Left            =   6090
         TabIndex        =   27
         Top             =   300
         Width           =   540
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
         Left            =   2160
         TabIndex        =   26
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
         TabIndex        =   25
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
         Left            =   1140
         TabIndex        =   24
         Top             =   330
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
         Left            =   1170
         TabIndex        =   22
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
      TabIndex        =   20
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   13
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
      TabIndex        =   18
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
         TabIndex        =   19
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   16
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
            TextSave        =   "2010/03/05"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "17:00"
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
Attribute VB_Name = "frmQPAV_CEnt520"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100319  TR1003-002      �����Z���v�Z����ʂ̓����ԍϊz�\�����
'                          PKG���œ����s�̕ԍϋ��z�������{�����ɏC������̂ɔ����A
'                          ���̓`�F�b�N�Ɍ����{������8Byte�����`�F�b�N��ǉ�����
'----------------------------------------------------------------------------------------------

Option Explicit
Private mblnMode As Boolean  'True�F�������[�h�AFalse�F���s���[�h

'*****************************************************************************************
'   ����(�o�^)
'*****************************************************************************************
Private Sub subBunkaiIns()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkaiIns

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", " ", ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InstrNyukinYMD", Format(lblNyukinYMD.Caption, "YYYYMMDD"), ORAPARM_INPUT    '������
    odbDatabase.Parameters.Add "InNumGankin", CDbl(txtNyukinGanpon.Text), ORAPARM_INPUT                '����
    odbDatabase.Parameters.Add "InNumRisoku", CDbl(IIf(txtNyukinTesuryou.Text = "", 0, txtNyukinTesuryou.Text)), ORAPARM_INPUT           '����
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520BunkaiIns (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrNyukinYMD," & _
             ":InNumGankin,:InNumRisoku," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkaiIns:



'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

'*****************************************************************************************
'   ����(�C��)
'*****************************************************************************************
Private Sub subBunkaiUpd()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkaiUpd

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", " ", ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InstrNyukinYMD", Format(lblNyukinYMD.Caption, "YYYYMMDD"), ORAPARM_INPUT    '������
    odbDatabase.Parameters.Add "InNumGankin", CDbl(txtNyukinGanpon.Text), ORAPARM_INPUT                '����
    odbDatabase.Parameters.Add "InNumRisoku", CDbl(IIf(txtNyukinTesuryou.Text = "", 0, txtNyukinTesuryou.Text)), ORAPARM_INPUT           '����
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520BunkaiUpd (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrNyukinYMD," & _
             ":InNumGankin,:InNumRisoku," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkaiUpd:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

'*****************************************************************************************
'   �������
'*****************************************************************************************
Private Sub subBunkaiDel()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkaiDel

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", " ", ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrCode, ORAPARM_INPUT          '�Ј��R�[�h
    odbDatabase.Parameters.Add "InstrNyukinYMD", Format(lblNyukinYMD.Caption, "YYYYMMDD"), ORAPARM_INPUT    '������
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             '���j���[ID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 '�v���O����ID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '�����敪(���p��)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '�����R�[�h
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '�S���Җ�

    '�X�g�A�h�v���V�[�W���N��SQL�쐬
    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520BunkaiDel (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrNyukinYMD," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkaiDel:
'�G���[����
    
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Sub

Private Sub cmdName_Click()
    
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCd = Right(gstrDat, 7)
        If Trim(Left(gstrDat, 1)) = "" Then
            Call cmdPFK_Click(5)
        Else
            'Msg = ���̎Ј��R�[�h�͏����Z���𗘗p�ł��܂���B
            lblMsg.Caption = "WPOE34 " & gstrGetCodeMeisyo(odbDatabase, "E34", "WPO")
            txtSyainCd.BackColor = vbRed
            txtSyainCd.SetFocus
        End If
    End If

End Sub

'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)

    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
        Case 2  '�n�[�h�R�s�[
            '�n�[�h�R�s�[�pDLL�ďo�����ɉ�ʃL���v�V�������p�����[�^�Ƃ��Ēǉ�
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            Set clsActX1001 = Nothing
        Case 5  '���s
            If mblnMode = True Then
                Call subSeach   '����
            Else
                Call subJikkou  '���s
            End If
        Case 10 '�O���
            Call subListPrt
            Unload Me
        Case 12 '���
            Call subFormInitialize
            txtSyainCd.SetFocus
    End Select
    
End Sub

'*****************************************************************************************
'*  ����{�^��
'*****************************************************************************************
Private Sub cmdTorikeshi_Click()
    If MsgBox("�����̎�������Ă�낵���ł����H", vbQuestion + vbOKCancel, "����(��������)") = vbOK Then
        Call subBunkaiDel
        txtNyukinGanpon.Text = ""
        txtNyukinTesuryou.Text = ""
        gblnKizon = False
        cmdTorikeshi.Enabled = False
    End If
        
End Sub

Private Sub Form_Activate()

    Dim ret  As Boolean
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "����(��������) (" & gstrCommandLine(8) & ") " _
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
                                    , "����(��������) (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        '��ʏ�����
        Call subFormInitialize

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
    
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    Me.Caption = "����(��������) (" & gstrCommandLine(8) & ")"
    bInit_Flg = True                            '�����t���O���I��

End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    '�g�p���[�N�e�[�u���S�폜
    Call subDelWorkTbl
    
    '�r������
    Call gblnHaita_Unlock
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt520 = Nothing

End Sub

'******************************************
'*�e�L�X�g�`�F���W
'******************************************
Private Sub txtNyukinGanpon_Change()
    Call subCalc
End Sub
Private Sub txtNyukinTesuryou_Change()
    Call subCalc
End Sub
'******************************************
'*�J���}������
'******************************************
Private Sub txtNyukinGanpon_LostFocus()
    txtNyukinGanpon.MaxLength = 9
    txtNyukinGanpon.Text = Format(txtNyukinGanpon.Text, "#,##0")
End Sub
Private Sub txtNyukinTesuryou_LostFocus()
    txtNyukinTesuryou.MaxLength = 9
    txtNyukinTesuryou.Text = Format(txtNyukinTesuryou.Text, "#,##0")
End Sub
'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyainCd_GotFocus()
    Call gsubSelectText(txtSyainCd)
End Sub
Private Sub txtNyukinGanpon_GotFocus()
    txtNyukinGanpon.Text = Replace(txtNyukinGanpon.Text, ",", "")   '�J���}�����
    txtNyukinGanpon.MaxLength = 7
    Call gsubSelectText(txtNyukinGanpon)
End Sub
Private Sub txtNyukinTesuryou_GotFocus()
    txtNyukinTesuryou.Text = Replace(txtNyukinTesuryou.Text, ",", "")   '�J���}�����
    txtNyukinTesuryou.MaxLength = 7
    Call gsubSelectText(txtNyukinTesuryou)
End Sub
'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyainCd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890,")
End Sub
Private Sub txtNyukinGanpon_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890,")
End Sub
Private Sub txtNyukinTesuryou_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890,")
End Sub

'*************************************************************************************************
'*�@�Ј������Ǝc�����������A�\��
'*************************************************************************************************
Private Sub subSeach()
    
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String
    Dim i          As Long

    Call subErrKaijo
    
    '�r������
    Call gblnHaita_Unlock
    
    cmdPFK(5).SetFocus
    If Trim$(txtSyainCd.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCd.BackColor = vbRed
        txtSyainCd.Enabled = True
        txtSyainCd.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    DoEvents
                
    '�ϐ��ɑޔ�
    gstrCode = txtSyainCd.Text
        
    '�r������
    If Not gblnHaita_Lock Then GoTo exit_subSeach
        
    If gfuncSeachSyain = False Then
        'Msg = �Ј����������݂��܂���B
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCd.BackColor = vbRed
        txtSyainCd.SetFocus
        '�r������
        Call gblnHaita_Unlock
        GoTo exit_subSeach
    End If
    
    '���������V�X�e���������ɐݒ�
    lblNyukinYMD.Caption = Format(DateSerial(Year(gdatSysDate), Month(gdatSysDate) + 1, 0), "YYYY�NMM��DD��")
    
    '�c���擾
    If gfuncGetZandaka = False Then
        txtSyainCd.SetFocus
        '�r������
        Call gblnHaita_Unlock
        GoTo exit_subSeach
    End If
    
    '���������f�[�^����
    If gfuncSearchKizonNyukin = True Then
        If txtNyukinGanpon.Text <> "" Or txtNyukinTesuryou.Text <> "" Then
            cmdTorikeshi.Enabled = True
            gblnKizon = True
        Else
            gblnKizon = False
        End If
    Else
        txtSyainCd.SetFocus
        '�r������
        Call gblnHaita_Unlock
        GoTo exit_subSeach
    End If
    
    Call subCalc
    
    '���͐��䏈��
    cmdPFK(5).Enabled = True
    txtSyainCd.Enabled = False
    cmdName.Enabled = False
    txtNyukinGanpon.Enabled = True
    txtNyukinTesuryou.Enabled = True
    txtNyukinGanpon.SetFocus
    mblnMode = False    '���s���[�h
        
exit_subSeach:
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
    
End Sub

'*************************************************************************************************
'*�@�������s
'*************************************************************************************************
Private Sub subJikkou()
    
    Call subErrKaijo
    
    '���̓`�F�b�N
    If txtNyukinGanpon.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �����z(���{)" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtNyukinGanpon.BackColor = vbRed
        txtNyukinGanpon.Enabled = True
        txtNyukinGanpon.SetFocus
        Exit Sub
    ElseIf IsNumeric(txtNyukinGanpon.Text) = False Then
        'Msg = �̒l���s���ł��B
        lblMsg.Caption = "WPOE47 �����z(���{)" & gstrGetCodeMeisyo(odbDatabase, "E47", "WPO")
        txtNyukinGanpon.BackColor = vbRed
        txtNyukinGanpon.Enabled = True
        txtNyukinGanpon.SetFocus
        Exit Sub
    ElseIf CLng(txtNyukinGanpon.Text) <= 0 Or CLng(txtNyukinGanpon.Text) > CLng(lblUGanpon.Caption) Then
        'Msg = �����z(���{)�͌��{�ȉ��œ��͂��Ă��������B
        lblMsg.Caption = "WPOE40 " & gstrGetCodeMeisyo(odbDatabase, "E40", "WPO")
        txtNyukinGanpon.BackColor = vbRed
        txtNyukinGanpon.Enabled = True
        txtNyukinGanpon.SetFocus
        Exit Sub
    End If
    
    If txtNyukinTesuryou.Text <> "" And IsNumeric(txtNyukinTesuryou.Text) = False Then
        'Msg = �̒l���s���ł��B
        lblMsg.Caption = "WPOE47 �����z(�萔��)" & gstrGetCodeMeisyo(odbDatabase, "E47", "WPO")
        txtNyukinTesuryou.BackColor = vbRed
        txtNyukinTesuryou.Enabled = True
        txtNyukinTesuryou.SetFocus
        Exit Sub
''    ElseIf CLng(txtNyukinTesuryou.Text) <= 0 Or CLng(txtNyukinTesuryou.Text) > CLng(lblUTesuryou.Caption) Then
''        'Msg = �����z(�萔��)�͎萔���ȉ��œ��͂��Ă��������B
''        lblMsg.Caption = "WPOE41 " & gstrGetCodeMeisyo(odbDatabase, "E41", "WPO")
''        txtNyukinTesuryou.BackColor = vbRed
''        txtNyukinTesuryou.Enabled = True
''        txtNyukinTesuryou.SetFocus
''        Exit Sub
    End If
    
'ADD 20100319 TR1003-002 NBC YOKOYAMA START
    If CLng(lblNyukinKei.Caption) >= 10000000 Then
        'Msg = �����z�v 1000���~�ȏ�͓��͂ł��܂���B
        lblMsg.Caption = "WPOE50 " & gstrGetCodeMeisyo(odbDatabase, "E50", "WPO")
        lblNyukinKei.BackColor = vbRed
        txtNyukinTesuryou.SetFocus
        Exit Sub
    End If
'ADD 20100319 TR1003-002 NBC YOKOYAMA END
    
    '�m�F
    If gblnKizon = True Then
        If MsgBox("�����̏C�������Ă�낵���ł����H", vbQuestion + vbOKCancel, "����(��������)") = vbOK Then
            '�C��SP�Ăяo��
            Call subBunkaiUpd
            cmdTorikeshi.Enabled = True
        End If
    Else
        If MsgBox("�����̓o�^�����Ă�낵���ł����H", vbQuestion + vbOKCancel, "����(��������)") = vbOK Then
            '�o�^SP�Ăяo��
            Call subBunkaiIns
            gblnKizon = True
            cmdTorikeshi.Enabled = True
        End If
    End If

End Sub

'*************************************************************
'* �����z�v�A���{�A�萔���A�c�����v�Z
'*************************************************************
Private Sub subCalc()
    lblNyukinKei.Caption = Format(CLng(IIf(IsNumeric(txtNyukinGanpon.Text) = False, 0, txtNyukinGanpon.Text)) + CLng(IIf(IsNumeric(txtNyukinTesuryou.Text) = False, 0, txtNyukinTesuryou.Text)), "#,##0")
    lblGanpon.Caption = Format(CLng(IIf(lblUGanpon.Caption = "", 0, lblUGanpon.Caption)) - CLng(IIf(IsNumeric(txtNyukinGanpon.Text) = False, 0, txtNyukinGanpon.Text)), "#,##0")
    lblTesuryou.Caption = Format(CLng(IIf(lblUTesuryou.Caption = "", 0, lblUTesuryou.Caption)) - CLng(IIf(IsNumeric(txtNyukinTesuryou.Text) = False, 0, txtNyukinTesuryou.Text)), "#,##0")
    lblZandaka.Caption = Format(CLng(IIf(lblGanpon.Caption = "", 0, lblGanpon.Caption)) + CLng(IIf(lblTesuryou.Caption = "", 0, lblTesuryou.Caption)), "#,##0")
End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCd.BackColor = vbWhite
    txtNyukinGanpon.BackColor = vbWhite
    txtNyukinTesuryou.BackColor = vbWhite
'ADD 20100319 TR1003-002 NBC YOKOYAMA START
    lblNyukinKei.BackColor = &H8000000F
'ADD 20100319 TR1003-002 NBC YOKOYAMA END

End Sub

'***********************************************************************************************************
'*��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
 Dim intX As Integer
 
    Call subErrKaijo
    
    '�r������
    Call gblnHaita_Unlock
    
    '�e�\�����ڃN���A
    txtSyainCd.Text = ""
    txtSyainCd.Enabled = True
    
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
    
    lblUZandaka.Caption = ""
    lblUGanpon.Caption = ""
    lblUTesuryou.Caption = ""
    lblNyukinYMD.Caption = ""
    txtNyukinGanpon.Text = ""
    txtNyukinTesuryou.Text = ""
    lblNyukinKei.Caption = ""
    lblGanpon.Caption = ""
    lblTesuryou.Caption = ""
    lblZandaka.Caption = ""
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    '�e�R���g���[������
    cmdName.Enabled = True
    cmdPFK(5).Enabled = True
    cmdTorikeshi.Enabled = False
    txtNyukinGanpon.Enabled = False
    txtNyukinTesuryou.Enabled = False
    mblnMode = True     '�������[�h
        
End Sub

'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("����(��������)", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt520.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub subListPrt()

    If MsgBox("�{�����̓���������o�͂��܂���", vbQuestion + vbYesNo, "����(��������)") = vbNo Then
        Exit Sub
    End If

    'SP���s
    If gfuncListSet = False Then Exit Sub
    
    'CR���
    Call subPrintReport(crptToPrinter)

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
        .ReportFileName = App.Path & "\QPAV_CEnt020.rpt"
        .DiscardSavedData = True
            
        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAJ_NYUKINW"
        
        '���o�������L�q����
        strSelectionFormula = "({QPAJ_NYUKINW.QPAJ_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
                       & " AND {QPAJ_NYUKINW.QPAJ_USERID} =  '" & gstrCommandLine(1) & "')"

        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
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

    strSQL = "BEGIN QPAP_CEnt520PkG.QPAP_CEnt520DelWorkTbl(" & _
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


