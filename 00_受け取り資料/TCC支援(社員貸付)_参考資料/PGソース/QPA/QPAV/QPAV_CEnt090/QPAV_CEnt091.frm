VERSION 5.00
Begin VB.Form frmQPAV_CEnt091 
   Caption         =   "���ϓ�������"
   ClientHeight    =   5145
   ClientLeft      =   60
   ClientTop       =   315
   ClientWidth     =   7470
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   5145
   ScaleWidth      =   7470
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.CommandButton cmdTouroku 
      Caption         =   "�o�^"
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   840
      TabIndex        =   3
      Top             =   4410
      Width           =   1350
   End
   Begin VB.CommandButton cmdTorikesi 
      Caption         =   "���"
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   3120
      TabIndex        =   4
      Top             =   4410
      Width           =   1350
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "�߂�"
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   5610
      TabIndex        =   5
      Top             =   4410
      Width           =   1350
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
      Left            =   90
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   3780
      Width           =   7155
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
         TabIndex        =   39
         Top             =   30
         Width           =   7095
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   570
      ScaleHeight     =   285
      ScaleWidth      =   1290
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   1680
      Width           =   1350
      Begin VB.Label Label24 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
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
         Index           =   1
         Left            =   315
         TabIndex        =   20
         Top             =   15
         Width           =   720
      End
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H00800000&
      Height          =   315
      Index           =   1
      Left            =   570
      ScaleHeight     =   255
      ScaleWidth      =   1290
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1350
      Begin VB.Label Label25 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�c ��"
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
         Left            =   360
         TabIndex        =   18
         Top             =   15
         Width           =   600
      End
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   1935
      ScaleHeight     =   285
      ScaleWidth      =   1485
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1545
      Begin VB.Label Label26 
         Alignment       =   2  '��������
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
         Index           =   1
         Left            =   60
         TabIndex        =   16
         Top             =   0
         Width           =   1380
      End
   End
   Begin VB.PictureBox Picture4 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   5070
      ScaleHeight     =   285
      ScaleWidth      =   1470
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1535
      Begin VB.Label Label28 
         Alignment       =   2  '��������
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�ܗ^�ԍϕ�"
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
         Left            =   0
         TabIndex        =   14
         Top             =   0
         Width           =   1440
      End
   End
   Begin VB.PictureBox Picture5 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   3480
      ScaleHeight     =   285
      ScaleWidth      =   1515
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1575
      Begin VB.Label Label27 
         Alignment       =   2  '��������
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "���^�ԍϕ�"
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
         Left            =   0
         TabIndex        =   12
         Top             =   30
         Width           =   1470
      End
   End
   Begin VB.TextBox txtNyuukinbiYYYY 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2295
      MaxLength       =   4
      TabIndex        =   0
      Top             =   2760
      Width           =   615
   End
   Begin VB.TextBox txtNyuukinbiMM 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   3255
      MaxLength       =   2
      TabIndex        =   1
      Top             =   2760
      Width           =   375
   End
   Begin VB.TextBox txtNyuukinbiDD 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   3975
      MaxLength       =   2
      TabIndex        =   2
      Top             =   2760
      Width           =   360
   End
   Begin VB.Label Label4 
      BackColor       =   &H00FF80FF&
      BorderStyle     =   1  '����
      Caption         =   "���^(�ʏ�)�@�@�@�@�ܗ^(�ʏ�)�@�@�@�@�@�@�@���^(�߂�)�@�@�@�@�ܗ^(�߂�)"
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   240
      TabIndex        =   49
      Top             =   3240
      Visible         =   0   'False
      Width           =   6960
   End
   Begin VB.Label lblZanSyoyoModo 
      Alignment       =   1  '�E����
      BackColor       =   &H00FF80FF&
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
      Left            =   5640
      TabIndex        =   48
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanKyuyoModo 
      Alignment       =   1  '�E����
      BackColor       =   &H00FF80FF&
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
      Left            =   3960
      TabIndex        =   47
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanSyoyoTujo 
      Alignment       =   1  '�E����
      BackColor       =   &H00FF80FF&
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
      Left            =   1920
      TabIndex        =   46
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanKyuyoTujo 
      Alignment       =   1  '�E����
      BackColor       =   &H00FF80FF&
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
      Left            =   240
      TabIndex        =   45
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblSyainCD1 
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
      Height          =   225
      Left            =   1770
      TabIndex        =   44
      Top             =   360
      Width           =   165
   End
   Begin VB.Label lblKaisu 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   6330
      TabIndex        =   43
      Top             =   810
      Width           =   630
   End
   Begin VB.Label Label9 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�ԍω�"
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
      Left            =   5340
      TabIndex        =   42
      Top             =   810
      Width           =   900
   End
   Begin VB.Label lblRiritu 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   4260
      TabIndex        =   41
      Top             =   810
      Width           =   960
   End
   Begin VB.Label Label2 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�ԍϗ���"
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
      Left            =   3285
      TabIndex        =   40
      Top             =   810
      Width           =   900
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
      Height          =   225
      Left            =   3240
      TabIndex        =   37
      Top             =   360
      Width           =   2715
   End
   Begin VB.Label lblSyainCD2 
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
      Height          =   225
      Left            =   2100
      TabIndex        =   36
      Top             =   360
      Width           =   885
   End
   Begin VB.Label Label5 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�Ј��R�[�h"
      BeginProperty Font 
         Name            =   "�l�r �S�V�b�N"
         Size            =   9.75
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Index           =   1
      Left            =   660
      TabIndex        =   35
      Top             =   360
      Width           =   975
   End
   Begin VB.Label lblYuusibiD 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   2550
      TabIndex        =   33
      Top             =   825
      Width           =   240
   End
   Begin VB.Label lblYuusibiM 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   1965
      TabIndex        =   32
      Top             =   825
      Width           =   240
   End
   Begin VB.Label lblYuusibiY 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   1020
      TabIndex        =   31
      Top             =   825
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
      ForeColor       =   &H00C00000&
      Height          =   315
      Left            =   5040
      TabIndex        =   30
      Top             =   1710
      Width           =   1560
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
      ForeColor       =   &H00C00000&
      Height          =   315
      Left            =   3480
      TabIndex        =   29
      Top             =   1710
      Width           =   1560
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
      Height          =   315
      Left            =   5040
      TabIndex        =   28
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   1920
      TabIndex        =   27
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   3480
      TabIndex        =   26
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   1920
      TabIndex        =   25
      Top             =   1710
      Width           =   1560
   End
   Begin VB.Label Label20 
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
      Left            =   2835
      TabIndex        =   24
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label19 
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
      Left            =   2265
      TabIndex        =   23
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label18 
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
      Left            =   1650
      TabIndex        =   22
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label3 
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
      Left            =   270
      TabIndex        =   21
      Top             =   825
      Width           =   675
   End
   Begin VB.Label Label12 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "���ϓ�"
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
      Left            =   1380
      TabIndex        =   9
      Top             =   2790
      Width           =   675
   End
   Begin VB.Label Label1 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�N"
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
      Left            =   2955
      TabIndex        =   8
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label Label6 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "��"
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
      Left            =   3675
      TabIndex        =   7
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label Label7 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "��"
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
      Left            =   4410
      TabIndex        =   6
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label lblLabel 
      BorderStyle     =   1  '����
      BeginProperty Font 
         Name            =   "�l�r �o����"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   1830
      Index           =   13
      Left            =   90
      TabIndex        =   10
      Top             =   630
      Width           =   7140
   End
   Begin VB.Label lblLabel 
      BorderStyle     =   1  '����
      BeginProperty Font 
         Name            =   "�l�r �o����"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   690
      Index           =   0
      Left            =   90
      TabIndex        =   34
      Top             =   2550
      Width           =   7140
   End
End
Attribute VB_Name = "frmQPAV_CEnt091"
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
'    �t�H�[���@�@�@�F frmQPAV_CEnt091  �F ���ϓ�������
'---------------------------------------
'   �쐬���@ �F ????/??/??
'   �S���ҁ@ �F FIP
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
'
'20100816  TR1006-001�@�@   ���Z�z��0�~�N���A�����s��Ή�
'
'20100816  1004091          �O���[�v�Ј��ݕt�̍����n�ɔ����V�X�e���Ή�
'                           �P�D���ϓ��̓��̓`�F�b�N��ǉ�(�����̉ߋ������͋���)
'
'20100909   TR1009-001      �ܗ^�F�O��V���������݂��Ȃ��ƃG���[�ƂȂ�s��Ή�
'----------------------------------------------------------------------------------------------


Private Sub cmdBack_Click()
    
    Unload Me

End Sub

Private Sub cmdTorikesi_Click()
    
    Call subFormInitialize
    txtNyuukinbiYYYY.SetFocus

End Sub

Private Sub cmdTouroku_Click()

    Dim i As Long
    Dim strMSG As String
    
    If cmdTouroku.Caption <> "���ώ��" Then
        If functext_Check(txtNyuukinbiYYYY) = False Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiYYYY.Text = Format(txtNyuukinbiYYYY.Text, "0000")
        
        If functext_Check(txtNyuukinbiMM) = False Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiMM.Text = Format(txtNyuukinbiMM.Text, "00")
        
        If functext_Check(txtNyuukinbiDD) = False Then
            'Msg = �����͂���Ă��܂���B
            lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiDD.Text = Format(txtNyuukinbiDD.Text, "00")
        
        If Not IsDate(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text) Then
            'Msg = �͓��t�œ��͂��ĉ������B
            lblMsg.Caption = "WPOE03 ������" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
       
        
        'ADD 20100816 1004091 IMZ NISHIKADO START
        If DateDiff("y", txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, gstrZanYMD) >= 0 Then
            'Msg = �ŐV�̎c���X�V��(�j�ȑO�̓��t�͓��͂ł��܂���B
            lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
        'ADD 20100816 1004091 IMZ NISHIKADO END
        
'ADD 20100225 0908047 NBC YOKOYAMA START
        'DEL 20100816 1004091 IMZ NISHIKADO START
        '�I�y�����ߋ���NG
        'If gdatSysDate > Format(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, "YYYY/MM/DD") Then
        '    'Msg = �ߋ����t�͓��͂ł��܂���B
        '    lblMsg.Caption = "WPOE20 " & gstrGetCodeMeisyo(odbDatabase, "E20", "WPO")
        '    txtNyuukinbiYYYY.BackColor = vbRed
        '    txtNyuukinbiMM.BackColor = vbRed
        '    txtNyuukinbiDD.BackColor = vbRed
        '    txtNyuukinbiYYYY.SetFocus
        '    Exit Sub
        'End If
        'DEL 20100816 1004091 IMZ NISHIKADO END
        
        '�I�y�������ȍ~��NG
        If Format(gdatSysDate, "YYYY/MM") <> Format(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text, "YYYY/MM") Then
            'Msg = �����ȍ~�̖������͓��͂ł��܂���B
            lblMsg.Caption = "WPOE49 " & gstrGetCodeMeisyo(odbDatabase, "E49", "WPO")
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END

        'DEL 20100816 1004091 IMZ NISHIKADO START
        'If DateDiff("y", txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, gstrZanYMD) > 0 Then
        '    'Msg = �ŐV�̎c���X�V��(�j�ȑO�̓��t�͓��͂ł��܂���B
        '    lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
        '    txtNyuukinbiYYYY.BackColor = vbRed
        '    txtNyuukinbiMM.BackColor = vbRed
        '    txtNyuukinbiDD.BackColor = vbRed
        '    txtNyuukinbiYYYY.SetFocus
        '    Exit Sub
        'End If
        'DEL 20100816 1004091 IMZ NISHIKADO END
    
    End If
    
    lblMsg.Caption = ""
    
    Call subDataPass
    Select Case cmdTouroku.Caption
        Case "����"
'MOD 20100225 0908047 NBC YOKOYAMA START
            'strMSG = "���Z�z  : " & Format(glngNyukin, "#,##0") & "�~" & vbCr & vbLf & cmdTouroku.Caption & "���Ă�낵���ł����H"
            strMSG = "���Z�z  : " & Format(glngNyukin + CLng(lblZanKyuyoModo.Caption) + CLng(lblZanSyoyoModo.Caption), "#,##0") & "�~" & vbCr & vbLf & cmdTouroku.Caption & "���Ă�낵���ł����H"
'MOD 20100225 0908047 NBC YOKOYAMA END
            If MsgBox(strMSG, vbQuestion + vbOKCancel, "�Ј��Z����������") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPAdd = False Then Exit Sub
        Case "���ϏC��"
'MOD 20100225 0908047 NBC YOKOYAMA START
            'strMSG = "���Z�z  : " & Format(glngNyukin, "#,##0") & "�~" & vbCr & vbLf & cmdTouroku.Caption & "���Ă�낵���ł����H"
            strMSG = "���Z�z  : " & Format(glngNyukin + CLng(lblZanKyuyoModo.Caption) + CLng(lblZanSyoyoModo.Caption), "#,##0") & "�~" & vbCr & vbLf & cmdTouroku.Caption & "���Ă�낵���ł����H"
'MOD 20100225 0908047 NBC YOKOYAMA END
            If MsgBox(strMSG, vbQuestion + vbOKCancel, "�Ј��Z����������") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPUpd = False Then Exit Sub
        Case "���ώ��"
            If MsgBox("���ς�������Ă�낵���ł����H", vbQuestion + vbOKCancel, "�Ј��Z����������") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPDel = False Then Exit Sub
    End Select
    Unload Me

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If

End Sub

'**************************************
'*FORM_KEYPRESS
'**************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    
    Call subErrKaijo

    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
    
End Sub

'-- Start Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
Private Sub Form_Load()

    Dim clsActX490 As QSAV_ActX490.ActX490C
    
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

End Sub
'-- Finish Of ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtNyuukinbiDD_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiDD, 2)

End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtNyuukinbiDD_GotFocus()

    Call gsubSelectText(txtNyuukinbiDD)

End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtNyuukinbiDD_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtNyuukinbiMM_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiMM, 2)

End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtNyuukinbiMM_GotFocus()

    Call gsubSelectText(txtNyuukinbiMM)

End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtNyuukinbiMM_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtNyuukinbiYYYY_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiYYYY, 4)

End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtNyuukinbiYYYY_GotFocus()

    Call gsubSelectText(txtNyuukinbiYYYY)

End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtNyuukinbiYYYY_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'****************************************
'*�G���[�`�F�b�N
'****************************************
Private Function functext_Check(txt_Name As TextBox) As Boolean
    
    functext_Check = False
    
    If txt_Name.Text = "" Then
        txt_Name.BackColor = vbRed
        txt_Name.SetFocus
        Exit Function
    End If
    txt_Name.BackColor = vbWhite
    
    functext_Check = True

End Function

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite

End Sub

'****************************************
'*��ʏ�����
'****************************************
Private Sub subFormInitialize()
    
    If cmdTouroku.Caption = "����" Then
        txtNyuukinbiYYYY.Text = Format(gdatSysDate, "yyyy")
        txtNyuukinbiMM.Text = Format(gdatSysDate, "mm")
        txtNyuukinbiDD.Text = Format(gdatSysDate, "dd")
    ElseIf cmdTouroku.Caption = "���ϏC��" Then
        txtNyuukinbiYYYY.Text = Left(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 4)
        txtNyuukinbiMM.Text = Mid(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 6, 2)
        txtNyuukinbiDD.Text = Right(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 2)
    End If
    
    lblMsg.Caption = ""
    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite

End Sub

Private Sub subDataPass()

    Dim KyuyoZenYMD_WORK    As String
    Dim SyoyoZenYMD_WORK    As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    
    Dim YusiYMD_WORK        As String
    Dim seiYMD_WORK         As String
    Dim KyuyoZan_Work       As Long
    Dim SyoyoZan_Work       As Long
    
    Dim ZanKyuyo_WORK       As Long
    Dim ZanBonus_WORK       As Long
    Dim ZanKei_WORK         As Long
    Dim RisokuKyuyo_WORK    As Long
    Dim RisokuBonus_WORK    As Long
    Dim RisokuKei_WORK      As Long
    Dim TenKyuyo_WORK       As Long
    Dim TenBonus_WORK       As Long
    Dim KBNKyuyo_WORK       As String
    Dim KBNBonus_WORK       As String
    Dim KyuyoHen            As Long
    Dim SyoyoHen            As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
    '�v�Z�̂��߂Ƀ��x�������ւ���̂Ō��̒l��ޔ�
    Dim strKyuyo_BK         As String
    Dim strSyoyo_BK         As String
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    Dim Riritu_Work         As Double   '10/24 Add
    
    Riritu_Work = Fix(gtblKeisan(Act_Row).Riritu / 36500 * 1000000) / 1000000       '10/24 Add
    
    If Trim(lblSyainCD1.Caption) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = Trim(lblSyainCD1.Caption)
    End If
    
    gstrCode2 = Trim(lblSyainCD2.Caption)
    
    gstrYusiYMD = Trim(lblYuusibiY.Caption) & Trim(lblYuusibiM.Caption) & Trim(lblYuusibiD.Caption)
    
    '���ώ�����͈ȉ��̏��������Ȃ�
    If cmdTouroku.Caption = "���ώ��" Then Exit Sub
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '���Z���z�v�Z�Ɏg�p����c����lblZanKyuuyo�AlblZanSyouyo����lblZanKyuyoTujo�AlblZanSyoyoTujo�ɕύX����
    strKyuyo_BK = lblZanKyuuyo.Caption
    strSyoyo_BK = lblZanBonus.Caption
    lblZanKyuuyo.Caption = lblZanKyuyoTujo.Caption
    lblZanBonus.Caption = lblZanSyoyoTujo.Caption
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    seiYMD_WORK = txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text
    YusiYMD_WORK = lblYuusibiY.Caption & "/" & lblYuusibiM.Caption & "/" & lblYuusibiD.Caption
    KyuyoHen = gtblKeisan(Act_Row).KyuyoHen
    SyoyoHen = gtblKeisan(Act_Row).SyoyoHen
    
    gstrSeiYMD = Trim(txtNyuukinbiYYYY.Text) & Trim(txtNyuukinbiMM.Text) & Trim(txtNyuukinbiDD.Text)

    KyuyoZan_Work = lblZanKyuuyo.Caption
    SyoyoZan_Work = lblZanBonus.Caption
    
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
    gstrKyuyoZen = KyuyoZenYMD_WORK
    gstrSyoyoZen = SyoyoZenYMD_WORK

    If IsDate(gstrKyuyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrKyuyoZen1) < 0 Then
            gstrKyuyoZen = ""
        End If
    End If
  
    If IsDate(gstrSyoyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrSyoyoZen1) < 0 Then
            gstrSyoyoZen = ""
        End If
    End If

'ADD 20100225 0908047 NBC YOKOYAMA START
    If Day(gdatSysDate) >= 25 And KyuyoZenYMD_WORK <> "" Then
    '���s��25���ȍ~�͓����T�������c������}�C�i�X����
        Dim lngTmpRisoku As Long
        Dim BeforeBeforeYMD_WORK As Date
        '�O�X��
        BeforeBeforeYMD_WORK = DateAdd("m", -1, KyuyoZenYMD_WORK)
        '����T���̔���
        If CLng(lblYuusiKyuuyo.Caption) = CLng(lblZanKyuuyo.Caption) Then
            BeforeBeforeYMD_WORK = CDate(lblYuusibiY.Caption & "/" & lblYuusibiM.Caption & "/" & lblYuusibiD.Caption)
        End If
        '�Z�����ȑO�ɂȂ����ꍇ�͒���
        If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
            BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
        End If
        lngTmpRisoku = Fix(CLng(KyuyoZan_Work) * _
                       DateDiff("y", BeforeBeforeYMD_WORK, KyuyoZenYMD_WORK) * Riritu_Work)
        lblZanKyuuyo.Caption = Format(CLng(lblZanKyuuyo.Caption) + lngTmpRisoku - CLng(KyuyoHen), "#,##0")
    End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    
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
            NextYMD_WORK = CVDate(Format$(seiYMD_WORK, "yyyy/mm") & "/25")
        End If
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '***������l������
            If Format(lblZanKyuuyo.Caption, "#,##0") = lblYuusiKyuuyo.Caption Then   '***����
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    - (Format(KyuyoHen, "#,##0") _
                                    - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    * (IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 30, 45) / 30) _
                                    * gtblKeisan(Act_Row).Riritu / 12 / 100))), "#,##0")
                KyuyoHen = 0
            Else
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    - (Format(KyuyoHen, "#,##0") _
                                    - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    * gtblKeisan(Act_Row).Riritu / 12 / 100))), "#,##0")
                KyuyoHen = 0
            End If
        Else
            ZanKyuyo_WORK = Format(lblZanKyuuyo.Caption, "#,##0")
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
                If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                    If Month(DateAdd("y", 1, gstrSyoyoZen1)) <> Month(gstrSyoyoZen1) Then
                        ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                            - (Format(SyoyoHen, "#,##0") _
                                            - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                            * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                            + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21)) / 30) _
                                            * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                        SyoyoHen = 0
                    Else
                        ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                            - (Format(SyoyoHen, "#,##0") _
                                            - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                            * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                            + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) _
                                            + (Day(gstrSyoyoZen1) - 1 - 30)) / 30) _
                                            * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                        SyoyoHen = 0
                    End If
                Else
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * gtblKeisan(Act_Row).Riritu / 2 / 100)))
                    SyoyoHen = 0
               End If
            Else
                '***������l������
                If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                        + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) _
                                        + (10 - 1 - 30)) / 30) * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                    SyoyoHen = 0
                Else
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * gtblKeisan(Act_Row).Riritu _
                                        * DateDiff("m", BeforeYMD_WORK, NextYMD_WORK) / 12 / 100)))
                    SyoyoHen = 0
                End If
            End If
        Else
            ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
        End If
    Else
        '*******************
        '* �V�v�Z��
        '*******************
        '* ���^�̎c���v�Z
        '* �����݂̔N��������v�Z�����A���̓V���������v�Z����B
        ' �����ݕt�̏ꍇ�́A��������̓V�����ƂȂ�
        If Val(Format$(gdatSysDate, "yyyymm")) = Val(Format$(YusiYMD_WORK, "yyyymm")) Then
            NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd")   ' �����̂Q�T��
        Else
            '�ߋ����Ή�
            If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
                If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                    NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd") ' �����̂Q�T��
                Else
                    NextYMD_WORK = Format(Format$(gdatSysDate, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' �����̂Q�T��
                End If
            Else
                NextYMD_WORK = Format(Format$(seiYMD_WORK, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' �����̂Q�T��
            End If
        End If
        ' ���Z��������̓V�����ȍ~�̏ꍇ�A����V������̌��{���v�Z���\������
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '* ��L�ŋ��߂������̓V����������A�����v�Z�̂��߂̑O��̓V���������v�Z����B
            ' �P�x���V��������Ă��Ȃ��ꍇ�́A�Z�����i�v�Z����ꍇ�́|�P������j�ƂȂ�
            If Format(lblZanKyuuyo.Caption, "#,##0") = Format(lblYuusiKyuuyo.Caption, "#,##0") Then
                BeforeYMD_WORK = DateAdd("y", -1, YusiYMD_WORK)
            Else
                BeforeYMD_WORK = Format(DateAdd("y", -1, Format(NextYMD_WORK, "yyyy/mm/") & "01"), "yyyy/mm/") & "25"
            End If
        
'10/24 Upd Start
'            ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                            - (Format(KyuyoHen, "#,##0") _
                            - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                            * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                            * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                             - (Format(KyuyoHen, "#,##0") _
                             - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                             * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                             * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            Else
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                             - (Format(KyuyoHen, "#,##0") _
                             - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                             * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                             * Riritu_Work)))), "#,##0")
            End If
'10/24 UpdEnd
            KyuyoHen = 0
            
'DEL 20100816 TR1006-001 IMZ NISHIKADO START
''ADD 20100225 0908047 NBC YOKOYAMA START
'            '�c������(�ŏI�T���͕��i�̋��z��菭�����������ꍇ������)
'            If ZanKyuyo_WORK < gtblKeisan(Act_Row).KyuyoHen Then
'                ZanKyuyo_WORK = 0
'            End If
''ADD 20100225 0908047 NBC YOKOYAMA END
'DEL 20100816 TR1006-001 IMZ NISHIKADO END

        Else
            ZanKyuyo_WORK = Format(lblZanKyuuyo.Caption, "#,##0")
        End If
    
        '* �ܗ^�̎c���v�Z
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
'ADD 20100225 0908047 NBC YOKOYAMA START
'�ܗ^�T���o�b�`��1�����x���Ȃ����̂ŏC��
'�O��ܗ^���ƃI�y����������������c�������񕪈���(BeforeYMD_WORK�̑O�̉�(next�̈�N�O)�`Before�܂ł̗������v�Z)
        If Year(BeforeYMD_WORK) = Year(gdatSysDate) And _
           Month(BeforeYMD_WORK) = Month(gdatSysDate) Then
            Dim tmpNokoriSyoyo As Long

            tmpNokoriSyoyo = CLng(lblZanBonus.Caption)
            '�O�X��͎����1�N�O
            BeforeBeforeYMD_WORK = DateAdd("yyyy", -1, NextYMD_WORK)
            '�Z�����ȑO�ɂȂ����ꍇ�͒���
            If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
                BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
            End If

            lblZanBonus.Caption = Format(Format(lblZanBonus.Caption, "#,##0") _
                           - (Format(SyoyoHen, "#,##0") _
                           - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                           * (DateDiff("y", BeforeBeforeYMD_WORK, CVDate(BeforeYMD_WORK)) _
                           * Riritu_Work)))), "#,##0")
            '�c������(�ŏI�T���͕��i�̋��z��菭�����������ꍇ������)
            If CLng(lblZanBonus.Caption) < gtblKeisan(Act_Row).SyoyoHen Then
                lblZanBonus.Caption = "0"
            End If
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
        ' ���Z��������̓V�����ȍ~�̏ꍇ�A����V������̌��{���v�Z���\������
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            ' �P�x���V��������Ă��Ȃ��ꍇ�́A�Z�����i�v�Z����ꍇ�́|�P������j�ƂȂ�
            If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                BeforeYMD_WORK = Format(DateAdd("y", -1, YusiYMD_WORK), "yyyy/mm/dd")
            End If
'10/24 Upd Start
'            ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                         - (Format(SyoyoHen, "#,##0") _
                         - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                         * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                         * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
                ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                             - (Format(SyoyoHen, "#,##0") _
                             - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                             * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                             * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            Else
                ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                             - (Format(SyoyoHen, "#,##0") _
                             - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                             * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                             * Riritu_Work)))), "#,##0")
            End If
'10/24 UpdEnd
            SyoyoHen = 0
'ADD 20100225 0908047 NBC YOKOYAMA START
            '�c������(�ŏI�T���͕��i�̋��z��菭�����������ꍇ������)
            If ZanBonus_WORK < gtblKeisan(Act_Row).SyoyoHen Then
                ZanBonus_WORK = 0
            End If
'ADD 20100225 0908047 NBC YOKOYAMA END
        Else
'MOD 20100225 0908047 NBC YOKOYAMA START
'            ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
            If ZanBonus_WORK = 0 Then
                ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
            End If
'MOD 20100225 0908047 NBC YOKOYAMA END
        End If
    
    End If
        
'10/24 Upd Start
    '���^���̗����v�Z
'    RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    If DateDiff("y", seiYMD_WORK, gstrSysChgYMD2) > 0 Then
        RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    Else
        RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * Riritu_Work)), "###0")
    End If
'10/24 UpdEnd
    
    '�ܗ^���̗����v�Z
'10/24 Upd Start
'    RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                            * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                            * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    If DateDiff("y", seiYMD_WORK, gstrSysChgYMD2) > 0 Then
        RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                        * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    Else
        RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                        * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                        * Riritu_Work)), "###0")
    End If
'10/24 UpdEnd
    
    ZanKei_WORK = Val(ZanKyuyo_WORK) + Val(ZanBonus_WORK)
    RisokuKei_WORK = Val(RisokuKyuyo_WORK) + Val(RisokuBonus_WORK)
    glngNyukin = Val(ZanKei_WORK) + Val(RisokuKei_WORK)
'ADD 20100225 0908047 NBC YOKOYAMA START
    glngRisoku = Val(RisokuKei_WORK)    'SP�Ŏg�p���闘����ޔ�
'ADD 20100225 0908047 NBC YOKOYAMA END

    '�ߋ����Ή�
    If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
        If Val(Format$(gdatSysDate, "dd")) >= 25 Then
            NextYMD_WORK = DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25")
        Else
            NextYMD_WORK = Format$(gdatSysDate, "yyyy/mm") & "/25"
        End If
    Else
        NextYMD_WORK = Format$(seiYMD_WORK, "yyyy/mm") & "/25"
    End If
'MOD 20100225 0908047 NBC YOKOYAMA START
'���Z��1�`24���̊Ԃ̂�
'    If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
'        KBNKyuyo_WORK = "1"
'    Else
'        KBNKyuyo_WORK = "2"
'    End If
    If (Day(seiYMD_WORK) >= 1 And Day(seiYMD_WORK) <= 24) Then
        KBNKyuyo_WORK = "2"
    Else
        KBNKyuyo_WORK = "1"
    End If
'MOD 20100225 0908047 NBC YOKOYAMA END

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
        KBNBonus_WORK = "1"
    Else
        KBNBonus_WORK = "2"
    End If
    
    TenKyuyo_WORK = IIf(Val(KyuyoHen) = 0, 0, KyuyoHen)
'MOD 20100225 0908047 NBC YOKOYAMA START
'�ܗ^�V���͎w������u06/01�`06/14�v�Ɓu11/16�`11/30�v�̊Ԃ̂�
'    TenBonus_WORK = IIf(DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD1) Or DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD2), IIf(Val(SyoyoHen) = 0, 0, SyoyoHen), 0)
    If ((Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "0601" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "0614") _
     Or (Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "1116" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "1130")) Then
        TenBonus_WORK = SyoyoHen
    Else
        TenBonus_WORK = 0
    End If
'MOD 20100225 0908047 NBC YOKOYAMA END
    If KBNKyuyo_WORK = "2" Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        glngNyukin = glngNyukin - TenKyuyo_WORK
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        If ZanKyuyo_WORK <= TenKyuyo_WORK Then
            '�c������(�ŏI�T���͕��i�̋��z��菭�����������ꍇ������)
            Dim tmpLastKyuyo As Long
            '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
            tmpLastKyuyo = ZanKyuyo_WORK + Fix((ZanKyuyo_WORK * Riritu_Work * DateDiff("y", DateAdd("d", 1, gstrKyuyoZen), DateAdd("m", 1, gstrKyuyoZen) + 1)))
            glngNyukin = glngNyukin - tmpLastKyuyo
        Else
            glngNyukin = glngNyukin - TenKyuyo_WORK
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
    If KBNBonus_WORK = "2" Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        glngNyukin = glngNyukin - TenBonus_WORK
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        If ZanBonus_WORK <= TenBonus_WORK Then
            '�c������(�ŏI�T���͕��i�̋��z��菭�����������ꍇ������)
            Dim tmpLastSyoyo As Long

'ADD 20100909 TR1009-001 IMZ SHIBUTANI START
            '�O��V�������Ȃ����́A�O��V�����ɗZ�����i�v�Z��}�C�i�X�P���̂��́j��ݒ肵�ď������s��
            If gstrSyoyoZen = "" Then
                gstrSyoyoZen = gstrSyoyoZen1
            End If
'ADD 20100909 TR1009-001 IMZ SHIBUTANI END

            '�ŏI���̓V���z���c���{�{(�c���{�~��������~�O��V�������玟��V�����܂ł̓���)
            tmpLastSyoyo = ZanBonus_WORK + Fix(ZanBonus_WORK * Riritu_Work * DateDiff("y", DateAdd("d", 1, gstrSyoyoZen), CDate(NextYMD_WORK) + 1))
            glngNyukin = glngNyukin - tmpLastSyoyo
        Else
            glngNyukin = glngNyukin - TenBonus_WORK
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '�ŏ��ɕς���Label�����ɖ߂�
    lblZanKyuuyo.Caption = strKyuyo_BK
    lblZanBonus.Caption = strSyoyo_BK
'ADD 20100225 0908047 NBC YOKOYAMA END
End Sub
