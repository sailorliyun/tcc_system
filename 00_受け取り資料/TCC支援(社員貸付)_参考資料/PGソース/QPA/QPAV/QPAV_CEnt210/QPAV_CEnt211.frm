VERSION 5.00
Begin VB.Form frmQPAV_CEnt211 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�Ј��}�X�^�����e�i���X"
   ClientHeight    =   5175
   ClientLeft      =   180
   ClientTop       =   1095
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   5175
   ScaleWidth      =   7500
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.TextBox txtKyuusyokuDD2 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   6390
      MaxLength       =   2
      TabIndex        =   21
      Top             =   3420
      Width           =   375
   End
   Begin VB.TextBox txtKyuusyokuMM2 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   5700
      MaxLength       =   2
      TabIndex        =   20
      Top             =   3420
      Width           =   375
   End
   Begin VB.TextBox txtKyuusyokuYYYY2 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   4770
      MaxLength       =   4
      TabIndex        =   19
      Top             =   3420
      Width           =   585
   End
   Begin VB.ComboBox cboSeisanCD 
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
      Left            =   2070
      Style           =   2  '��ۯ���޳� ؽ�
      TabIndex        =   6
      Top             =   1830
      Width           =   870
   End
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
      Left            =   720
      TabIndex        =   22
      Top             =   4530
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
      Left            =   3000
      TabIndex        =   23
      Top             =   4530
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
      Left            =   5460
      TabIndex        =   24
      Top             =   4530
      Width           =   1350
   End
   Begin VB.PictureBox Picture1 
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
      Left            =   180
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   50
      TabStop         =   0   'False
      Top             =   3990
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
         Left            =   60
         TabIndex        =   51
         Top             =   30
         Width           =   7095
      End
   End
   Begin VB.TextBox txtTokyuCD 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   6450
      MaxLength       =   4
      TabIndex        =   9
      Text            =   "55"
      Top             =   2250
      Width           =   375
   End
   Begin VB.TextBox txtSikakuCD 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   4530
      MaxLength       =   4
      TabIndex        =   8
      Text            =   "55"
      Top             =   2250
      Width           =   375
   End
   Begin VB.TextBox txtKojinmeiKana 
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
      IMEMode         =   6  '���p����
      Left            =   2040
      TabIndex        =   2
      Text            =   "����������"
      Top             =   630
      Width           =   1695
   End
   Begin VB.TextBox txtKojinmeiKanji 
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
      IMEMode         =   4  '�S�p�Ђ炪��
      Left            =   4740
      TabIndex        =   3
      Top             =   630
      Width           =   2385
   End
   Begin VB.ComboBox cobSyozokutenCD 
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
      Left            =   2055
      Style           =   2  '��ۯ���޳� ؽ�
      TabIndex        =   4
      Top             =   1020
      Width           =   870
   End
   Begin VB.ComboBox cobTouzaiKbn 
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
      ItemData        =   "QPAV_CEnt211.frx":0000
      Left            =   2055
      List            =   "QPAV_CEnt211.frx":0002
      Style           =   2  '��ۯ���޳� ؽ�
      TabIndex        =   7
      Top             =   2235
      Width           =   510
   End
   Begin VB.ComboBox cobSyozokuBumonCD 
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
      Left            =   2055
      Style           =   2  '��ۯ���޳� ؽ�
      TabIndex        =   5
      Top             =   1425
      Width           =   1245
   End
   Begin VB.TextBox txtSeinenGappiYYYY 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2055
      MaxLength       =   4
      TabIndex        =   10
      Text            =   "9999"
      Top             =   2625
      Width           =   585
   End
   Begin VB.TextBox txtTaisyokuYYYY 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2040
      MaxLength       =   4
      TabIndex        =   13
      Text            =   "9999"
      Top             =   3000
      Width           =   585
   End
   Begin VB.TextBox txtKyuusyokuYYYY1 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2055
      MaxLength       =   4
      TabIndex        =   16
      Top             =   3375
      Width           =   585
   End
   Begin VB.TextBox txtSeinenGappiMM 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2985
      MaxLength       =   2
      TabIndex        =   11
      Text            =   "30"
      Top             =   2625
      Width           =   375
   End
   Begin VB.TextBox txtTaisyokuMM 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2985
      MaxLength       =   2
      TabIndex        =   14
      Top             =   3000
      Width           =   375
   End
   Begin VB.TextBox txtKyuusyokuMM1 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2985
      MaxLength       =   2
      TabIndex        =   17
      Top             =   3375
      Width           =   375
   End
   Begin VB.TextBox txtSeinenGappiDD 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   3675
      MaxLength       =   2
      TabIndex        =   12
      Top             =   2625
      Width           =   375
   End
   Begin VB.TextBox txtTaisyokuDD 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   3675
      MaxLength       =   2
      TabIndex        =   15
      Top             =   3000
      Width           =   375
   End
   Begin VB.TextBox txtKyuusyokuDD1 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   3675
      MaxLength       =   2
      TabIndex        =   18
      Top             =   3375
      Width           =   375
   End
   Begin VB.TextBox txtKojinCD1 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   2070
      MaxLength       =   1
      TabIndex        =   0
      Text            =   "9"
      Top             =   240
      Width           =   285
   End
   Begin VB.TextBox txtKojinCD2 
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
      IMEMode         =   3  '�̌Œ�
      Left            =   4530
      MaxLength       =   7
      TabIndex        =   1
      Text            =   "9304254"
      Top             =   240
      Width           =   975
   End
   Begin VB.Label Label21 
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
      Index           =   1
      Left            =   6810
      TabIndex        =   56
      Top             =   3495
      Width           =   225
   End
   Begin VB.Label Label18 
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
      Index           =   1
      Left            =   6090
      TabIndex        =   55
      Top             =   3495
      Width           =   225
   End
   Begin VB.Label Label15 
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
      Index           =   1
      Left            =   5370
      TabIndex        =   54
      Top             =   3495
      Width           =   225
   End
   Begin VB.Label lblSeisanMeisyou 
      AutoSize        =   -1  'True
      Caption         =   "��������������������������������"
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
      Left            =   3060
      TabIndex        =   53
      Top             =   1860
      Width           =   3600
   End
   Begin VB.Label Label6 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "���Z�X�R�[�h"
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
      Left            =   540
      TabIndex        =   52
      Top             =   1890
      Width           =   1350
   End
   Begin VB.Label Label2 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�����i�J�i�j"
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
      Left            =   630
      TabIndex        =   48
      Top             =   660
      Width           =   1350
   End
   Begin VB.Label Label3 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�i�����j"
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
      Left            =   3810
      TabIndex        =   47
      Top             =   690
      Width           =   900
   End
   Begin VB.Label Label4 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�����X�R�[�h"
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
      Left            =   540
      TabIndex        =   46
      Top             =   1065
      Width           =   1350
   End
   Begin VB.Label Label5 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�����敪"
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
      Left            =   990
      TabIndex        =   45
      Top             =   2295
      Width           =   900
   End
   Begin VB.Label Label6 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "��������R�[�h"
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
      Left            =   315
      TabIndex        =   44
      Top             =   1500
      Width           =   1575
   End
   Begin VB.Label Label8 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "���i�R�[�h"
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
      TabIndex        =   43
      Top             =   2295
      Width           =   1125
   End
   Begin VB.Label Label9 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�����R�[�h"
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
      Left            =   5235
      TabIndex        =   42
      Top             =   2310
      Width           =   1125
   End
   Begin VB.Label Label10 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "���N����"
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
      Left            =   990
      TabIndex        =   41
      Top             =   2685
      Width           =   900
   End
   Begin VB.Label Label11 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�ސE�N����"
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
      Left            =   765
      TabIndex        =   40
      Top             =   3090
      Width           =   1125
   End
   Begin VB.Label Label12 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�x�E�N����"
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
      Left            =   765
      TabIndex        =   39
      Top             =   3495
      Width           =   1125
   End
   Begin VB.Label Label13 
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
      Left            =   2655
      TabIndex        =   38
      Top             =   2715
      Width           =   225
   End
   Begin VB.Label Label14 
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
      Left            =   2655
      TabIndex        =   37
      Top             =   3075
      Width           =   225
   End
   Begin VB.Label Label15 
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
      Index           =   0
      Left            =   2655
      TabIndex        =   36
      Top             =   3450
      Width           =   225
   End
   Begin VB.Label Label16 
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
      Left            =   3375
      TabIndex        =   35
      Top             =   2715
      Width           =   225
   End
   Begin VB.Label Label17 
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
      Left            =   3375
      TabIndex        =   34
      Top             =   3075
      Width           =   225
   End
   Begin VB.Label Label18 
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
      Index           =   0
      Left            =   3375
      TabIndex        =   33
      Top             =   3450
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
      Left            =   4050
      TabIndex        =   32
      Top             =   2715
      Width           =   225
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
      Left            =   4050
      TabIndex        =   31
      Top             =   3075
      Width           =   225
   End
   Begin VB.Label Label21 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�� �` "
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
      Left            =   4065
      TabIndex        =   30
      Top             =   3450
      Width           =   690
   End
   Begin VB.Label lblSyozokutenCD 
      AutoSize        =   -1  'True
      Caption         =   "��������������������������������"
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
      Left            =   3045
      TabIndex        =   29
      Top             =   1095
      Width           =   3600
   End
   Begin VB.Label lblTouzaiKbn 
      AutoSize        =   -1  'True
      Caption         =   "�k"
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
      Left            =   2610
      TabIndex        =   28
      Top             =   2310
      Width           =   225
   End
   Begin VB.Label lblSyozokuBumonCD 
      AutoSize        =   -1  'True
      Caption         =   "��������������������������������"
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
      Left            =   3420
      TabIndex        =   27
      Top             =   1500
      Width           =   3600
   End
   Begin VB.Label Label1 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�Ј��R�[�h(1)"
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
      Left            =   405
      TabIndex        =   26
      Top             =   270
      Width           =   1485
   End
   Begin VB.Label Label7 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�Ј��R�[�h(2)"
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
      Left            =   2955
      TabIndex        =   25
      Top             =   300
      Width           =   1485
   End
   Begin VB.Label Label22 
      BorderStyle     =   1  '����
      Height          =   3765
      Left            =   180
      TabIndex        =   49
      Top             =   120
      Width           =   7155
   End
End
Attribute VB_Name = "frmQPAV_CEnt211"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Load_FLG As String
    
Private Function Chk_err() As Boolean
'*****************************************************************************************
'  �e���ڂ̓��́E�����`�F�b�N
'*****************************************************************************************
    Chk_err = False
        
    If Trim(txtKojinCD1.Text) = "" Then
        txtKojinCD1.Text = " "
    End If
    
    If Chk_txt(txtKojinCD2) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �Ј��R�[�h�i�Q�j" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtKojinCD2, 7) = False Then
            'Msg = ���œ��͂��Ă��������B
            lblMsg.Caption = "WPOE06 �Ј��R�[�h�i�Q�j�͂V" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKojinmeiKana) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �����i�J�i�j" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKojinmeiKana, 15) = False Then
            'Msg = �̓��͌������I�[�o�[���܂����
            lblMsg.Caption = "WPOE04 �����i�J�i�j" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKojinmeiKanji) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �����i�����j" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKojinmeiKanji, 20) = False Then
            'Msg = �̓��͌������I�[�o�[���܂����
            lblMsg.Caption = "WPOE04 �����i�����j" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If cobSyozokutenCD.Text = "" Then
        'Msg = �����X�R�[�h���I������Ă��܂���B
        lblMsg.Caption = "WPOE29 " & gstrGetCodeMeisyo(odbDatabase, "E29", "WPO")
        cobSyozokutenCD.BackColor = vbRed
        cobSyozokutenCD.SetFocus
        Exit Function
    End If
    
    If cobSyozokuBumonCD.Text = "" Then
        'Msg = ��������R�[�h���I������Ă��܂���B
        lblMsg.Caption = "WPOE30 " & gstrGetCodeMeisyo(odbDatabase, "E30", "WPO")
        cobSyozokuBumonCD.BackColor = vbRed
        cobSyozokuBumonCD.SetFocus
        Exit Function
    End If
    
    If cboSeisanCD.Text = "" Then
        'Msg = ���Z�X�R�[�h���I������Ă��܂���B
        lblMsg.Caption = "WPOE31 " & gstrGetCodeMeisyo(odbDatabase, "E31", "WPO")
        cboSeisanCD.BackColor = vbRed
        cboSeisanCD.SetFocus
        Exit Function
    End If
    
    If cobTouzaiKbn.Text = "" Then
        'Msg = �����敪���I������Ă��܂���B
        lblMsg.Caption = "WPOE32 " & gstrGetCodeMeisyo(odbDatabase, "E32", "WPO")
        cobTouzaiKbn.BackColor = vbRed
        cobTouzaiKbn.SetFocus
        Exit Function
    End If
    
    If Chk_txt(txtSikakuCD) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���i�R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtSikakuCD, 2) = False Then
            'Msg = ���œ��͂��Ă��������B
            lblMsg.Caption = "WPOE06 ���i�R�[�h�͂Q" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtTokyuCD) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �����R�[�h" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtTokyuCD, 2) = False Then
            'Msg = ���œ��͂��Ă��������B
            lblMsg.Caption = "WPOE06 �����R�[�h�͂Q" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtSeinenGappiYYYY) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���N����" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    txtSeinenGappiMM.Text = Format(txtSeinenGappiMM.Text, "00")
    If Chk_txt(txtSeinenGappiMM) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���N����" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    txtSeinenGappiDD.Text = Format(txtSeinenGappiDD.Text, "00")
    If Chk_txt(txtSeinenGappiDD) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���N����" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    txtTaisyokuYYYY.Text = Format(txtTaisyokuYYYY.Text, "0000")
    txtTaisyokuMM.Text = Format(txtTaisyokuMM.Text, "00")
    txtTaisyokuDD.Text = Format(txtTaisyokuDD.Text, "00")
    
    If IsDate(txtSeinenGappiYYYY.Text & "/" & txtSeinenGappiMM.Text & "/" & txtSeinenGappiDD.Text) = False Then
        'Msg = �͓��t�œ��͂��ĉ������B
        lblMsg.Caption = "WPOE03 ���N����" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSeinenGappiYYYY.BackColor = vbRed
        txtSeinenGappiMM.BackColor = vbRed
        txtSeinenGappiDD.BackColor = vbRed
        txtSeinenGappiYYYY.SetFocus
        Exit Function
    End If
    
    If txtTaisyokuYYYY.Text <> "" Then
        txtTaisyokuYYYY.Text = Format(txtTaisyokuYYYY.Text, "0000")
        txtTaisyokuMM.Text = Format(txtTaisyokuMM.Text, "00")
        txtTaisyokuDD.Text = Format(txtTaisyokuDD.Text, "00")
        If IsDate(txtTaisyokuYYYY.Text & "/" & txtTaisyokuMM.Text & "/" & txtTaisyokuDD.Text) = False Then
            'Msg = �͓��t�œ��͂��ĉ������B
            lblMsg.Caption = "WPOE03 �ސE�N����" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtTaisyokuYYYY.BackColor = vbRed
            txtTaisyokuMM.BackColor = vbRed
            txtTaisyokuDD.BackColor = vbRed
            txtTaisyokuYYYY.SetFocus
            Exit Function
        End If
    End If

    If txtKyuusyokuYYYY1.Text <> "" Then
        txtKyuusyokuYYYY1.Text = Format(txtKyuusyokuYYYY1.Text, "0000")
        txtKyuusyokuMM1.Text = Format(txtKyuusyokuMM1.Text, "00")
        txtKyuusyokuDD1.Text = Format(txtKyuusyokuDD1.Text, "00")
        If IsDate(txtKyuusyokuYYYY1.Text & "/" & txtKyuusyokuMM1.Text & "/" & txtKyuusyokuDD1.Text) = False Then
            'Msg = �͓��t�œ��͂��ĉ������B
            lblMsg.Caption = "WPOE03 �x�E�J�n��" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtKyuusyokuYYYY1.BackColor = vbRed
            txtKyuusyokuMM1.BackColor = vbRed
            txtKyuusyokuDD1.BackColor = vbRed
            txtKyuusyokuYYYY1.SetFocus
            Exit Function
        End If
    End If

    If txtKyuusyokuYYYY2.Text <> "" Then
        txtKyuusyokuYYYY2.Text = Format(txtKyuusyokuYYYY2.Text, "0000")
        txtKyuusyokuMM2.Text = Format(txtKyuusyokuMM2.Text, "00")
        txtKyuusyokuDD2.Text = Format(txtKyuusyokuDD2.Text, "00")
        If IsDate(txtKyuusyokuYYYY2.Text & "/" & txtKyuusyokuMM2.Text & "/" & txtKyuusyokuDD2.Text) = False Then
            'Msg = �͓��t�œ��͂��ĉ������B
            lblMsg.Caption = "WPOE03 �x�E�I����" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtKyuusyokuYYYY2.BackColor = vbRed
            txtKyuusyokuMM2.BackColor = vbRed
            txtKyuusyokuDD2.BackColor = vbRed
            txtKyuusyokuYYYY2.SetFocus
            Exit Function
        End If
    End If

    If txtKyuusyokuYYYY1.Text & "/" & txtKyuusyokuMM1.Text & "/" & txtKyuusyokuDD1.Text > txtKyuusyokuYYYY2.Text & "/" & txtKyuusyokuMM2.Text & "/" & txtKyuusyokuDD2.Text Then
        txtKyuusyokuYYYY1.BackColor = vbRed
        txtKyuusyokuMM1.BackColor = vbRed
        txtKyuusyokuDD1.BackColor = vbRed
        txtKyuusyokuYYYY2.BackColor = vbRed
        txtKyuusyokuMM2.BackColor = vbRed
        txtKyuusyokuDD2.BackColor = vbRed
        'Msg = ���t�͈͎̔w��Ɍ�肪����܂��B
        lblMsg.Caption = "WPOE14 " & gstrGetCodeMeisyo(odbDatabase, "E14", "WPO")
        txtKyuusyokuYYYY1.SetFocus
        Exit Function
    End If
    
    Chk_err = True
End Function

Private Sub cboSeisanCD_Click()
'*****************************************************************************************
'  ���Z�X�R�[�h�I������
'*****************************************************************************************
    cboSeisanCD.BackColor = vbWhite
    If cboSeisanCD.ListIndex = -1 Then
        lblSeisanMeisyou.Caption = ""
    Else
        lblSeisanMeisyou.Caption = gtblSeisan(cboSeisanCD.ListIndex + 1).NM
    End If
End Sub

Private Sub cmdTouroku_Click()
'*****************************************************************************************
'  �o�^�E�C���E�폜����
'*****************************************************************************************
    Dim i As Long
    
'    Me.Enabled = False          '�^�u�ړ�����
    If cmdTouroku.Caption <> "�폜" Then
        If Chk_err = False Then
            Me.Enabled = True
            Exit Sub
        End If
    End If
    
    lblMsg.Caption = ""
'    Me.Enabled = True

    Select Case cmdTouroku.Caption
        Case "�o�^"
            If MsgBox("�o�^���Ă�낵���ł����H", vbQuestion + vbOKCancel, "�Ј��}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPAdd = False Then Exit Sub
        Case "�C��"
            If MsgBox("�C�����Ă�낵���ł����H", vbQuestion + vbOKCancel, "�Ј��}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPUpd = False Then Exit Sub
        Case "�폜"
            If MsgBox("�폜���Ă�낵���ł����H", vbQuestion + vbOKCancel, "�Ј��}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPDel = False Then Exit Sub
    End Select
    Unload Me
End Sub

Private Sub cmdBack_Click()
'*****************************************************************************************
'  �߂�{�^����������
'*****************************************************************************************
    UnlF = 1
    Unload Me
End Sub

Private Sub cmdTorikesi_Click()
'*****************************************************************************************
'   ������{�^����������
'*****************************************************************************************
    
    '�e���ڂ̏�����
    txtKojinCD1.Text = SelData(0)
    txtKojinCD2.Text = SelData(1)
    txtKojinmeiKana.Text = SelData(2)
    txtKojinmeiKanji.Text = SelData(3)
    lblMsg.Caption = ""
    If SelData(4) = "" Then
        cobSyozokutenCD.ListIndex = -1
    Else
        cobSyozokutenCD.ListIndex = SelData(4)
    End If
    If SelData(5) = "" Then
        cobSyozokuBumonCD.ListIndex = -1
    Else
        cobSyozokuBumonCD.ListIndex = SelData(5)
    End If
    If SelData(6) = "" Then
        cboSeisanCD.ListIndex = -1
    Else
        cboSeisanCD.ListIndex = SelData(6)
    End If
    If SelData(7) = "" Then
        cobTouzaiKbn.ListIndex = -1
    Else
        cobTouzaiKbn.ListIndex = SelData(7)
    End If
    txtSikakuCD.Text = SelData(8)
    txtTokyuCD.Text = SelData(9)
    txtSeinenGappiYYYY.Text = Left(SelData(10), 4)
    txtSeinenGappiMM.Text = Mid(SelData(10), 5, 2)
    txtSeinenGappiDD.Text = Right(SelData(10), 2)
    txtTaisyokuYYYY.Text = Left(SelData(11), 4)
    txtTaisyokuMM.Text = Mid(SelData(11), 5, 2)
    txtTaisyokuDD.Text = Right(SelData(11), 2)
    txtKyuusyokuYYYY1.Text = Left(SelData(12), 4)
    txtKyuusyokuMM1.Text = Mid(SelData(12), 5, 2)
    txtKyuusyokuDD1.Text = Right(SelData(12), 2)
    txtKyuusyokuYYYY2.Text = Left(SelData(13), 4)
    txtKyuusyokuMM2.Text = Mid(SelData(13), 5, 2)
    txtKyuusyokuDD2.Text = Right(SelData(13), 2)
    
    txtKojinCD1.BackColor = vbWhite
    txtKojinCD2.BackColor = vbWhite
    txtKojinmeiKana.BackColor = vbWhite
    txtKojinmeiKanji.BackColor = vbWhite
    cobSyozokutenCD.BackColor = vbWhite
    cobSyozokuBumonCD.BackColor = vbWhite
    cboSeisanCD.BackColor = vbWhite
    txtSikakuCD.BackColor = vbWhite
    cobTouzaiKbn.BackColor = vbWhite
    txtTokyuCD.BackColor = vbWhite
    txtSeinenGappiYYYY.BackColor = vbWhite
    txtSeinenGappiMM.BackColor = vbWhite
    txtSeinenGappiDD.BackColor = vbWhite
    txtTaisyokuYYYY.BackColor = vbWhite
    txtTaisyokuMM.BackColor = vbWhite
    txtTaisyokuDD.BackColor = vbWhite
    txtKyuusyokuYYYY1.BackColor = vbWhite
    txtKyuusyokuMM1.BackColor = vbWhite
    txtKyuusyokuDD1.BackColor = vbWhite
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite
    
    txtKojinCD1.SetFocus
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'  ENTERKEY��������
'*****************************************************************************************
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If
End Sub

'*****************************************************************************************
'   Form���[�h
'*****************************************************************************************
Private Sub Form_Load()
   
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
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

'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    lblMsg.Caption = ""
End Sub

'*****************************************************************************************
'   ��ʏ�����
'*****************************************************************************************
Private Sub subFormInitialize()
    Dim i       As Long
    Dim MaxCNT  As Long
    
    Load_FLG = "1"
    
    For i = 0 To 13
        SelData(i) = ""
    Next i
    
    '�����敪�̐ݒ�
    With cobTouzaiKbn
        .AddItem "1"
        .AddItem "2"
    End With

    '�����X�R���{�̐ݒ�
    Call gsubMiseCD_get
    
    '��������R���{�̏�����
    cobSyozokuBumonCD.Clear
    
    '���Z�X�R�[�h�̐ݒ�
    Call gsubSeisanCD_get
    
    '�e���ڂ̏�����
    txtKojinCD1.Text = ""
    txtKojinCD2.Text = ""
    txtKojinmeiKana.Text = ""
    txtKojinmeiKanji.Text = ""
    lblSeisanMeisyou.Caption = ""
    cobSyozokutenCD.ListIndex = -1
    lblSyozokuBumonCD.Caption = ""
    cobSyozokuBumonCD.ListIndex = -1
    lblSyozokutenCD.Caption = ""
    cboSeisanCD.ListIndex = -1
    txtSikakuCD.Text = ""
    cobTouzaiKbn.ListIndex = -1
    lblTouzaiKbn.Caption = ""
    txtTokyuCD.Text = ""
    txtSeinenGappiYYYY.Text = ""
    txtSeinenGappiMM.Text = ""
    txtSeinenGappiDD.Text = ""
    txtTaisyokuYYYY.Text = ""
    txtTaisyokuMM.Text = ""
    txtTaisyokuDD.Text = ""
    txtKyuusyokuYYYY1.Text = ""
    txtKyuusyokuMM1.Text = ""
    txtKyuusyokuDD1.Text = ""
    txtKyuusyokuYYYY2.Text = ""
    txtKyuusyokuMM2.Text = ""
    txtKyuusyokuDD2.Text = ""
    
    txtKojinCD1.BackColor = vbWhite
    txtKojinCD2.BackColor = vbWhite
    txtKojinmeiKana.BackColor = vbWhite
    txtKojinmeiKanji.BackColor = vbWhite
    cobSyozokutenCD.BackColor = vbWhite
    cobSyozokuBumonCD.BackColor = vbWhite
    cboSeisanCD.BackColor = vbWhite
    txtSikakuCD.BackColor = vbWhite
    cobTouzaiKbn.BackColor = vbWhite
    txtTokyuCD.BackColor = vbWhite
    txtSeinenGappiYYYY.BackColor = vbWhite
    txtSeinenGappiMM.BackColor = vbWhite
    txtSeinenGappiDD.BackColor = vbWhite
    txtTaisyokuYYYY.BackColor = vbWhite
    txtTaisyokuMM.BackColor = vbWhite
    txtTaisyokuDD.BackColor = vbWhite
    txtKyuusyokuYYYY1.BackColor = vbWhite
    txtKyuusyokuMM1.BackColor = vbWhite
    txtKyuusyokuDD1.BackColor = vbWhite
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite
    
    '�f�[�^�Z�b�g
    If ModeF <> "�o�^" Then
        '�Ј��R�[�h�P�E�Q
        txtKojinCD1.Text = gtblSyain(Act_Row).SyainCD1
        txtKojinCD2.Text = Trim(gtblSyain(Act_Row).SyainCD2)
        SelData(0) = Trim(gtblSyain(Act_Row).SyainCD1)
        SelData(1) = Trim(gtblSyain(Act_Row).SyainCD2)
        
        '�����ŁE����
        txtKojinmeiKana.Text = Trim(gtblSyain(Act_Row).SimeiKana)
        txtKojinmeiKanji.Text = Trim(gtblSyain(Act_Row).SimeiKanji)
        SelData(2) = Trim(gtblSyain(Act_Row).SimeiKana)
        SelData(3) = Trim(gtblSyain(Act_Row).SimeiKanji)
        
        '�����X�R�[�h�E����
        If Trim(gVarSpdGetText(frmQPAV_CEnt210.vaSpread1, 5, Act_Row)) <> "" Then
            MaxCNT = cobSyozokutenCD.ListCount
            i = 1
            Do Until i = MaxCNT
                If Trim(gVarSpdGetText(frmQPAV_CEnt210.vaSpread1, 5, Act_Row)) = gtblMise(i).CD Then
                    Exit Do
                End If
                i = i + 1
            Loop
            If i < MaxCNT Then
                cobSyozokutenCD.ListIndex = i - 1
                SelData(4) = i - 1
            End If
            
            '��������R���{�̐ݒ�
            Call gsubBumonCD_get
            
            '��������R�[�h�E����
            MaxCNT = cobSyozokuBumonCD.ListCount
            If MaxCNT = 0 Then
                cobSyozokuBumonCD.ListIndex = -1
                SelData(5) = -1
            Else
                i = 1
                Do Until i = MaxCNT
                    If Trim(gVarSpdGetText(frmQPAV_CEnt210.vaSpread1, 8, Act_Row)) = gtblBumon(i).CD Then
                        Exit Do
                    End If
                    i = i + 1
                Loop
                If i < MaxCNT Then
                    cobSyozokuBumonCD.ListIndex = i - 1
                    SelData(5) = i - 1
                End If
            End If
        End If
        
        '���Z�X�R�[�h�E����
        If Trim(gVarSpdGetText(frmQPAV_CEnt210.vaSpread1, 10, Act_Row)) <> "" Then
            MaxCNT = cboSeisanCD.ListCount
            i = 1
            Do Until i = MaxCNT
                If Trim(gVarSpdGetText(frmQPAV_CEnt210.vaSpread1, 10, Act_Row)) = gtblSeisan(i).CD Then
                    Exit Do
                End If
                i = i + 1
            Loop
            If i < MaxCNT Then
                cboSeisanCD.ListIndex = i - 1
                SelData(6) = i - 1
            End If
        End If
        
        '�����敪
        If Trim(gtblSyain(Act_Row).TozaiKBN) <> "" Then
            Select Case Trim(gtblSyain(Act_Row).TozaiKBN)
                Case "1"
                    lblTouzaiKbn.Caption = "��"
                Case "2"
                    lblTouzaiKbn.Caption = "��"
            End Select
            cobTouzaiKbn.ListIndex = Trim(gtblSyain(Act_Row).TozaiKBN) - 1
            SelData(7) = Val(gtblSyain(Act_Row).TozaiKBN) - 1
        End If
        
        '���i�R�[�h
        txtSikakuCD.Text = Trim(gtblSyain(Act_Row).Sikaku)
        SelData(8) = Trim(gtblSyain(Act_Row).Sikaku)

        '�����R�[�h
        txtTokyuCD.Text = Trim(gtblSyain(Act_Row).Tokyu)
        SelData(9) = Trim(gtblSyain(Act_Row).Tokyu)

        '���N����
        txtSeinenGappiYYYY.Text = Left(Trim(gtblSyain(Act_Row).BornYMD), 4)
        txtSeinenGappiMM.Text = Mid(Trim(gtblSyain(Act_Row).BornYMD), 5, 2)
        txtSeinenGappiDD.Text = Right(Trim(gtblSyain(Act_Row).BornYMD), 2)
        SelData(10) = Trim(gtblSyain(Act_Row).BornYMD)

        '�ސE�N����
        txtTaisyokuYYYY.Text = Left(Trim(gtblSyain(Act_Row).TaisyokuYMD), 4)
        txtTaisyokuMM.Text = Mid(Trim(gtblSyain(Act_Row).TaisyokuYMD), 5, 2)
        txtTaisyokuDD.Text = Right(Trim(gtblSyain(Act_Row).TaisyokuYMD), 2)
        SelData(11) = Trim(gtblSyain(Act_Row).TaisyokuYMD)

        '�x�E�N����
        txtKyuusyokuYYYY1.Text = Left(Trim(gtblSyain(Act_Row).KyusyokuStYMD), 4)
        txtKyuusyokuMM1.Text = Mid(Trim(gtblSyain(Act_Row).KyusyokuStYMD), 5, 2)
        txtKyuusyokuDD1.Text = Right(Trim(gtblSyain(Act_Row).KyusyokuStYMD), 2)
        SelData(12) = Trim(gtblSyain(Act_Row).KyusyokuStYMD)
        txtKyuusyokuYYYY2.Text = Left(Trim(gtblSyain(Act_Row).KyusyokuEdYMD), 4)
        txtKyuusyokuMM2.Text = Mid(Trim(gtblSyain(Act_Row).KyusyokuEdYMD), 5, 2)
        txtKyuusyokuDD2.Text = Right(Trim(gtblSyain(Act_Row).KyusyokuEdYMD), 2)
        SelData(13) = Trim(gtblSyain(Act_Row).KyusyokuEdYMD)
    End If
    
    
    If ModeF = "�폜" Then
        txtKojinCD1.Enabled = False
        txtKojinCD2.Enabled = False
        txtKojinmeiKana.Enabled = False
        txtKojinmeiKanji.Enabled = False
        cobSyozokutenCD.Enabled = False
        cobTouzaiKbn.Enabled = False
        cobSyozokuBumonCD.Enabled = False
        cboSeisanCD.Enabled = False
        txtSikakuCD.Enabled = False
        txtTokyuCD.Enabled = False
        txtSeinenGappiYYYY.Enabled = False
        txtSeinenGappiMM.Enabled = False
        txtSeinenGappiDD.Enabled = False
        txtTaisyokuYYYY.Enabled = False
        txtTaisyokuMM.Enabled = False
        txtTaisyokuDD.Enabled = False
        txtKyuusyokuYYYY1.Enabled = False
        txtKyuusyokuMM1.Enabled = False
        txtKyuusyokuDD1.Enabled = False
        txtKyuusyokuYYYY2.Enabled = False
        txtKyuusyokuMM2.Enabled = False
        txtKyuusyokuDD2.Enabled = False
        cmdTorikesi.Enabled = False
    Else
        txtKojinCD1.Enabled = True
        txtKojinCD2.Enabled = True
        txtKojinmeiKana.Enabled = True
        txtKojinmeiKanji.Enabled = True
        cobSyozokutenCD.Enabled = True
        cobTouzaiKbn.Enabled = True
        cobSyozokuBumonCD.Enabled = True
        cboSeisanCD.Enabled = True
        txtSikakuCD.Enabled = True
        txtTokyuCD.Enabled = True
        txtSeinenGappiYYYY.Enabled = True
        txtSeinenGappiMM.Enabled = True
        txtSeinenGappiDD.Enabled = True
        txtTaisyokuYYYY.Enabled = True
        txtTaisyokuMM.Enabled = True
        txtTaisyokuDD.Enabled = True
        txtKyuusyokuYYYY1.Enabled = True
        txtKyuusyokuMM1.Enabled = True
        txtKyuusyokuDD1.Enabled = True
        txtKyuusyokuYYYY2.Enabled = True
        txtKyuusyokuMM2.Enabled = True
        txtKyuusyokuDD2.Enabled = True
        cmdTorikesi.Enabled = True
    End If
    lblMsg.Caption = ""
    Load_FLG = ""

End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*****************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�Ј��}�X�^�����e�i���X", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt210.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub cobSyozokutenCD_Click()
'*****************************************************************************************
'    �����X�R�[�h�I������
'*****************************************************************************************
    cobSyozokutenCD.BackColor = vbWhite
    If cobSyozokutenCD.ListIndex = -1 Then
        lblSyozokutenCD.Caption = ""
    Else
        lblSyozokutenCD.Caption = gtblMise(cobSyozokutenCD.ListIndex + 1).NM
    End If
    
    '����R���{�̐ݒ�
    MousePointer = vbHourglass
    Call gsubBumonCD_get
    lblSyozokuBumonCD.Caption = ""
    MousePointer = vbDefault
End Sub

Private Sub cobSyozokuBumonCD_Click()
'*****************************************************************************************
'   �������R�[�h�I������
'*****************************************************************************************
    cobSyozokuBumonCD.BackColor = vbWhite
    If cobSyozokuBumonCD.ListIndex = -1 Then
        lblSyozokuBumonCD.Caption = ""
    Else
        lblSyozokuBumonCD.Caption = gtblBumon(cobSyozokuBumonCD.ListIndex + 1).NM
    End If
End Sub

Private Sub cobTouzaiKbn_Click()
'*****************************************************************************************
'    �����敪�I������
'*****************************************************************************************
    cobTouzaiKbn.BackColor = vbWhite
    If cobTouzaiKbn.Text = "" Then
        lblTouzaiKbn.Caption = ""
    ElseIf cobTouzaiKbn.Text = "1" Then
        lblTouzaiKbn.Caption = "��"
    Else
        lblTouzaiKbn.Caption = "��"
    End If
End Sub

'*****************************************************************************************
'  �e�L�X�g�t���E�o
'*****************************************************************************************
Private Sub txtKojinCD1_Change()
'    Call gsubMaxCharSkipEX(txtKojinCD1, 1)
    
    If Load_FLG = "" Then
        If LenB(StrConv(txtKojinCD1.Text, vbFromUnicode)) = 1 Then
            txtKojinCD1.BackColor = vbWhite
            txtKojinCD2.SetFocus
        End If
    End If

End Sub

Private Sub txtKojinCD2_Change()
    Call gsubMaxCharSkipEX(txtKojinCD2, 7)
    txtKojinCD2.BackColor = vbWhite
End Sub

Private Sub txtKojinmeiKana_Change()
    txtKojinmeiKana.BackColor = vbWhite
End Sub

Private Sub txtKojinmeiKanji_Change()
    txtKojinmeiKanji.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuDD1_Change()
    Call gsubMaxCharSkipEX(txtKyuusyokuDD1, 2)
    txtKyuusyokuYYYY1.BackColor = vbWhite
    txtKyuusyokuMM1.BackColor = vbWhite
    txtKyuusyokuDD1.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuDD2_Change()

    Call gsubMaxCharSkipEX(txtKyuusyokuDD2, 2)
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite

End Sub

Private Sub txtSikakuCD_Change()
    Call gsubMaxCharSkipEX(txtSikakuCD, 2)
    txtSikakuCD.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuMM1_Change()
    Call gsubMaxCharSkipEX(txtKyuusyokuMM1, 2)
    txtKyuusyokuYYYY1.BackColor = vbWhite
    txtKyuusyokuMM1.BackColor = vbWhite
    txtKyuusyokuDD1.BackColor = vbWhite
End Sub

Private Sub txtTokyuCD_Change()
    Call gsubMaxCharSkipEX(txtTokyuCD, 2)
    txtTokyuCD.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuYYYY1_Change()
    Call gsubMaxCharSkipEX(txtKyuusyokuYYYY1, 4)
    txtKyuusyokuYYYY1.BackColor = vbWhite
    txtKyuusyokuMM1.BackColor = vbWhite
    txtKyuusyokuDD1.BackColor = vbWhite
End Sub

Private Sub txtTaisyokuDD_Change()
    Call gsubMaxCharSkipEX(txtTaisyokuDD, 2)
    txtTaisyokuYYYY.BackColor = vbWhite
    txtTaisyokuMM.BackColor = vbWhite
    txtTaisyokuDD.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuMM2_Change()
    Call gsubMaxCharSkipEX(txtKyuusyokuMM2, 2)
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite
End Sub

Private Sub txtKyuusyokuYYYY2_Change()
    Call gsubMaxCharSkipEX(txtKyuusyokuYYYY2, 4)
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite
End Sub

Private Sub txtTaisyokuMM_Change()
    Call gsubMaxCharSkipEX(txtTaisyokuMM, 2)
    txtTaisyokuYYYY.BackColor = vbWhite
    txtTaisyokuMM.BackColor = vbWhite
    txtTaisyokuDD.BackColor = vbWhite
End Sub

Private Sub txtTaisyokuYYYY_Change()
    Call gsubMaxCharSkipEX(txtTaisyokuYYYY, 4)
    txtTaisyokuYYYY.BackColor = vbWhite
    txtTaisyokuMM.BackColor = vbWhite
    txtTaisyokuDD.BackColor = vbWhite
End Sub

Private Sub txtSeinenGappiDD_Change()
    Call gsubMaxCharSkipEX(txtSeinenGappiDD, 2)
    txtSeinenGappiYYYY.BackColor = vbWhite
    txtSeinenGappiMM.BackColor = vbWhite
    txtSeinenGappiDD.BackColor = vbWhite
End Sub

Private Sub txtSeinenGappiMM_Change()
    Call gsubMaxCharSkipEX(txtSeinenGappiMM, 2)
    txtSeinenGappiYYYY.BackColor = vbWhite
    txtSeinenGappiMM.BackColor = vbWhite
    txtSeinenGappiDD.BackColor = vbWhite
End Sub

Private Sub txtSeinenGappiYYYY_Change()
    Call gsubMaxCharSkipEX(txtSeinenGappiYYYY, 4)
    txtSeinenGappiYYYY.BackColor = vbWhite
    txtSeinenGappiMM.BackColor = vbWhite
    txtSeinenGappiDD.BackColor = vbWhite
End Sub

'*****************************************************************************************
'   �t�H�[�J�X�擾���S�e�L�X�g�I��
'*****************************************************************************************
Private Sub txtKojinCD1_GotFocus()
    Call gsubSelectText(txtKojinCD1)
End Sub

Private Sub txtKojinCD2_GotFocus()
    Call gsubSelectText(txtKojinCD2)
End Sub

Private Sub txtKojinmeiKana_GotFocus()
    Call gsubSelectText(txtKojinmeiKana)
End Sub

Private Sub txtKojinmeiKanji_GotFocus()
    Call gsubSelectText(txtKojinmeiKanji)
End Sub

Private Sub txtSeinenGappiYYYY_GotFocus()
    Call gsubSelectText(txtSeinenGappiYYYY)
End Sub

Private Sub txtSeinenGappiMM_GotFocus()
    Call gsubSelectText(txtSeinenGappiMM)
End Sub

Private Sub txtSeinenGappidd_GotFocus()
    Call gsubSelectText(txtSeinenGappiDD)
End Sub

Private Sub txtSikakuCD_GotFocus()
    Call gsubSelectText(txtSikakuCD)
End Sub

Private Sub txtTaisyokuYYYY_GotFocus()
    Call gsubSelectText(txtTaisyokuYYYY)
End Sub

Private Sub txtTaisyokumm_GotFocus()
    Call gsubSelectText(txtTaisyokuMM)
End Sub

Private Sub txtTaisyokudd_GotFocus()
    Call gsubSelectText(txtTaisyokuDD)
End Sub

Private Sub txtKyuusyokuYYYY1_GotFocus()
    Call gsubSelectText(txtKyuusyokuYYYY1)
End Sub

Private Sub txtKyuusyokuMM1_GotFocus()
    Call gsubSelectText(txtKyuusyokuMM1)
End Sub

Private Sub txtKyuusyokuDD1_GotFocus()
    Call gsubSelectText(txtKyuusyokuDD1)
End Sub

Private Sub txtKyuusyokuYYYY2_GotFocus()
    Call gsubSelectText(txtKyuusyokuYYYY2)
End Sub

Private Sub txtKyuusyokuMM2_GotFocus()
    Call gsubSelectText(txtKyuusyokuMM2)
End Sub

Private Sub txtKyuusyokuDD2_GotFocus()
    Call gsubSelectText(txtKyuusyokuDD2)
    txtKyuusyokuYYYY2.BackColor = vbWhite
    txtKyuusyokuMM2.BackColor = vbWhite
    txtKyuusyokuDD2.BackColor = vbWhite
End Sub

Private Sub txtTokyuCD_GotFocus()
    Call gsubSelectText(txtTokyuCD)
End Sub

'*****************************************************************************************
'   ���͕�������i�����̂݁j
'*****************************************************************************************
Private Sub txtSeinenGappiYYYY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSeinenGappimm_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSeinenGappidd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtTaisyokuYYYY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtTaisyokumm_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtTaisyokudd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokuYYYY1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokuYYYY2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokumm1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokumm2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokudd1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyuusyokudd2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKojinCD2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtTokyuCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSikakuCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

