VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt140 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�T���A���\���"
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
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.CommandButton cmdInst 
      Caption         =   "�f�[�^�쐬"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   10350
      TabIndex        =   4
      Top             =   6630
      Width           =   1185
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
      Height          =   405
      Index           =   1
      Left            =   12810
      TabIndex        =   6
      Top             =   6645
      Width           =   1185
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
      Height          =   405
      Index           =   0
      Left            =   11580
      TabIndex        =   5
      Top             =   6630
      Width           =   1185
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   60
      TabIndex        =   26
      Top             =   1020
      Width           =   14250
      Begin FPSpread.vaSpread sprList 
         Height          =   4755
         Left            =   2100
         TabIndex        =   3
         Top             =   420
         Width           =   8985
         _Version        =   196608
         _ExtentX        =   15849
         _ExtentY        =   8387
         _StockProps     =   64
         MaxCols         =   7
         MaxRows         =   20
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt140.frx":0000
         UserResize      =   0
         VisibleCols     =   7
         VisibleRows     =   20
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   1035
      Left            =   60
      TabIndex        =   23
      Top             =   -15
      Width           =   14250
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   180
         Top             =   270
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.OptionButton optKbn 
         Caption         =   " �܁@�^"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   1
         Left            =   7155
         TabIndex        =   2
         Top             =   555
         Value           =   -1  'True
         Width           =   1140
      End
      Begin VB.OptionButton optKbn 
         Caption         =   " ���@�^"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   0
         Left            =   7155
         TabIndex        =   1
         Top             =   210
         Width           =   990
      End
      Begin VB.ComboBox cobSyoriYM 
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
         Left            =   5070
         Style           =   2  '��ۯ���޳� ؽ�
         TabIndex        =   0
         Top             =   390
         Width           =   1260
      End
      Begin VB.Label lblKIKAN 
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
         Left            =   10800
         TabIndex        =   27
         Top             =   450
         Width           =   60
      End
      Begin VB.Label lblKyuuyo 
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
         Left            =   8370
         TabIndex        =   25
         Top             =   450
         Width           =   60
      End
      Begin VB.Label Label1 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�����N��"
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
         Left            =   4035
         TabIndex        =   24
         Top             =   465
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
      TabIndex        =   22
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
         TabIndex        =   7
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
         Left            =   1249
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
         Index           =   3
         Left            =   2438
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
         Index           =   4
         Left            =   3627
         TabIndex        =   13
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
         Left            =   4816
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
         Left            =   6005
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
         Index           =   7
         Left            =   7194
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
         Index           =   8
         Left            =   8383
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
         Index           =   9
         Left            =   9572
         TabIndex        =   17
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
         Left            =   10761
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
         Index           =   11
         Left            =   11950
         TabIndex        =   18
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
         TabIndex        =   11
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
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   20
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
         TabIndex        =   21
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   19
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
            TextSave        =   "2010/08/19"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:31"
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
Attribute VB_Name = "frmQPAV_CEnt140"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�    �C�����R
'20100809  1004091          �E���o�����ɂ��铌���敪���폜
'                           �@�������̃f�[�^����x�ɕ\���E������s��
'                           �E�V�K���[�̏o�͒ǉ�
'----------------------------------------------------------------------------------------------
'*********************************************************************************************************************
'2005.05.06 Yasui@NBC �T���쐬�s���Ή� �ܗ^�T���쐬�̍쐬�����ɐ�����������
'*********************************************************************************************************************
Option Explicit
 Private blnInitFlg  As Boolean
 Private blnNoChangeEvFlg  As Boolean   '��ݼ� ����� �����t���O
 Dim lngFirstCnt As Long '''''''''''
 Dim lngRecCount As Long '''''''''''''''SP�p
 
 Dim lngHigasiCount As Long '�T���A���\         ���f�[�^����
 Dim lngNisiCount   As Long '�T���A���\         ���f�[�^����
 Dim lngZanCount    As Long '���T���c���ꗗ�\     �f�[�^����

'2005.05.06 Yasui@NBC �T���쐬�s���Ή�  ==>
Private Const strDATE1 As String = "05"
Private Const strDATE2 As String = "26"
'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
'�T���A���\�Ɍ��o����\���p�̕ϐ�
'�T���m�����ܗ^�T�������ύX�ɂȂ����ꍇ�́A���L�̏C�����K�v
Private Const strDATE3 As String = "15"         '���^�T���A���\�̐؂�ւ���(����15��)
Private Const strDATE4 As String = "06"         '�ܗ^�T����(6��)
Private Const strDATE5 As String = "0520"         '�ܗ^�T����(12��)
Private Const strDATE6 As String = "0630"       '6���ܗ^�T���m���(5��20��)
Private Const strDATE7 As String = "12"       '6���ܗ^�T���A���\���o�͂ł���ŏI��(6��30��)
Private Const strDATE8 As String = "1110"       '12���ܗ^�T���m���(11��10��)
Private Const strDATE9 As String = "1231"       '12���ܗ^�T���A���\���o�͂ł���ŏI��(12��31��)
Private Const strDATE10 As String = "0518"      '���^�T���쐬����
Dim strSyoriMMDDHHMI       As String
'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END
Dim strKikan(2) As String
Dim intIDX      As Integer
'2005.05.06 Yasui@NBC �T���쐬�s���Ή�  <==

'****************************************************************************************
'* �ܗ^�f�[�^�쐬�{�^������
'****************************************************************************************
Private Sub cmdInst_Click()

    '�ܗ^�T���ŐV���t�擾
    Call gsubSPGetYM
    
    '�����N��
    gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
    
    '�ŐV�ܗ^�T���쐬�N���`�F�b�N
    If Val(gstrBonusYM) >= Val(gstrSyoriYM) Then
        lblMsg.Caption = "���̏����N���̏ܗ^�T���f�[�^�́A���ɍ쐬����Ă��܂��B"
        Exit Sub
    End If

'2005.05.06 Yasui@NBC �T���쐬�s���Ή� �ܗ^�T���쐬�̍쐬�����ɐ�����������  ==>
    If strDATE1 >= Right(gstrSysDate, 2) Then
        lblMsg.Caption = "WPOE36 " & gstrGetCodeMeisyo(odbDatabase, "E36", "WPO") 'Msg = �T���܂ŁA�ܗ^�T���f�[�^�̍쐬���s���܂���B
        Exit Sub
    End If
    If strDATE2 <= Right(gstrSysDate, 2) Then
        lblMsg.Caption = "WPOE37 " & gstrGetCodeMeisyo(odbDatabase, "E37", "WPO") 'Msg = �Q�U���ȍ~�́A�ܗ^�T���f�[�^�̍쐬���s���܂���B
        Exit Sub
    End If
'2005.05.06 Yasui@NBC �T���쐬�s���Ή�  <==
    
    If MsgBox("�T���f�[�^�쐬���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�T���A���\���") = vbCancel Then
        Exit Sub
    End If
    
    '�X�e�[�^�X�o�[���b�Z�[�W
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    lblMsg.Caption = ""
    DoEvents
    
    '����ʐ���
    Call subGamenSeigyo(False)  '��ʃ��b�N
    
    '�ܗ^�T���f�[�^�쐬
    If blnInstKoujyo = True Then
        lblMsg.Caption = "�T���f�[�^�쐬���I�����܂����B"
    Else
        lblMsg.Caption = "�T���f�[�^�쐬�𒆎~���܂����B"
    End If
    
    '����ʐ������
    Call subGamenSeigyo(True)   '�g�p��
    stbSystem.Panels.Item(1).Text = ""

End Sub

Private Sub cmdPrint_Click(Index As Integer)
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String

    Select Case Index
        Case 0
            If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�T���A���\���") = vbCancel Then
                Exit Sub
            End If
            
'MOD 20100809 1004091 IMZ SHIBUTANI START
'            If lngHigasiCount > 0 Then
'                Call subPrintReport1(crptToWindow, "1") '��
'            End If
'            If lngNisiCount > 0 Then
'                Call subPrintReport1(crptToWindow, "2") '��
'            End If
            
            '�������Z���Ĕ�����s��
            If lngHigasiCount + lngNisiCount > 0 Then
                Call subPrintReport1(crptToWindow)
            End If
'MOD 20100809 1004091 IMZ SHIBUTANI END
            
            If lngZanCount > 0 Then
                Call subPrintReport2(crptToWindow)
            End If
            
            Call subPrintReport3(crptToWindow)

        Case 1
            If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�T���A���\���") = vbCancel Then
                Exit Sub
            End If
            
'MOD 20100809 1004091 IMZ SHIBUTANI START
'            If lngHigasiCount > 0 Then
'                Call subPrintReport1(crptToPrinter, "1") '��
'            End If
'            If lngNisiCount > 0 Then
'                Call subPrintReport1(crptToPrinter, "2") '��
'            End If
            
            '�������Z���Ĕ�����s��
            If lngHigasiCount + lngNisiCount > 0 Then
                Call subPrintReport1(crptToPrinter)
            End If
'MOD 20100809 1004091 IMZ SHIBUTANI END
            
            If lngZanCount > 0 Then
                Call subPrintReport2(crptToPrinter)
            End If
            
            Call subPrintReport3(crptToPrinter)
    
    End Select

End Sub

Private Sub cobSyoriYM_Change()
    If optKbn(0).Value = True Then
        lblKyuuyo.Caption = cobSyoriYM.Text & "�x���^��"
        lblKIKAN.Caption = ""       '2005.05.06 Yasui@NBC �T���쐬�s���Ή�
    Else
        lblKyuuyo.Caption = cobSyoriYM.Text & "�x�ܗ^��"
        '2005.05.06 Yasui@NBC �T���쐬�s���Ή� ==>
        intIDX = IIf(cobSyoriYM.ListIndex <= 0, 0, cobSyoriYM.ListIndex)
        lblKIKAN.Caption = "���o���ԁF" & strKikan(intIDX) & "/26�`" & _
                                strKikan(intIDX + 1) & "/25"
        '2005.05.06 Yasui@NBC �T���쐬�s���Ή� <==
    End If
End Sub

Private Sub cobSyoriYM_Click()
    Call cobSyoriYM_Change
End Sub

'**************************************************************************************************
'*Form���[�h
'**************************************************************************************************
Private Sub Form_Load()
    '�X�e�[�^�X�o�[������
    Call gsubInitStatusBar(stbSystem)
    
    '�t�H�[�����ݒ�
    Me.Caption = "�T���A���\���" & " (" & gstrCommandLine(8) & ")"
            
    '�t���O������
    blnInitFlg = True        '�����t���O�ݒ�i�����j
    blnNoChangeEvFlg = True  '�e�L�X�g�{�b�N�X�`�F���W�C�x���g�i�`�F���W�C�x���g�����j
    
    '�ꗗ�\�N���A
    Call gsubSpdClear(sprList)

    'Spread Seet �ی�
    sprList.Lock = True
    
    '��ʏ�����
    blnInitFlg = True
'    Call subInitScreen

End Sub

'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

    If blnInitFlg Then
        stbSystem.Panels.Item(1).Text = "�������D�D�D"    '�X�e�[�^�X�o�[���b�Z�[�W
        Call subGamenSeigyo(False)                         '��ʃ��b�N
        DoEvents
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�T���A���\��� (" & gstrCommandLine(8) & ")" _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
            Exit Sub
        End If

        '�f�[�^�x�[�X�̊m��
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�T���A���\��� (" & gstrCommandLine(8) & ")" _
                                    , objSession.LastServerErr, objSession.LastServerErrText)
            '�I��
            Unload Me
            Exit Sub
        End If
        
        Call gsubSPInit                     '���������p�r�o(�V�X�e�����t)
        Call subGamenSeigyo(True)           '��ʃ��b�N����
        Call subInitScreen                  '��ʏ�����
        Call subGamenSeigyo(True)           '��ʃ��b�N����
        stbSystem.Panels.Item(1).Text = ""  '�X�e�[�^�X�o�[���b�Z�[�W����
               
        blnInitFlg = False
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
'*** 11/05 �ܗ^�f�[�^�쐬�ǉ� ***
            If cmdInst.Enabled = True Then
                '�ܗ^�T���ŐV���t�擾
                Call gsubSPGetYM
                '�����N��
                gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
                '�ŐV�ܗ^�T���쐬�N���`�F�b�N
                If Val(gstrBonusYM) < Val(gstrSyoriYM) Then
'2005.05.06 Yasui@NBC �T���쐬�s���Ή� �ܗ^�T���쐬�̍쐬�����ɐ�����������  ==>
'                    If MsgBox("�T���f�[�^���쐬����Ă��܂��񂪁A�쐬���܂����H", vbQuestion + vbYesNo, "�T���A���\���") = vbYes Then
'                        '�ܗ^�T���f�[�^�쐬
'                        If InstKoujo = False Then
'                            lblMsg.Caption = "�T���f�[�^�쐬�𒆎~���܂����B"
'                            Exit Sub
'                        End If
'                    End If
                    If strDATE1 < Right(gstrSysDate, 2) And _
                       strDATE2 > Right(gstrSysDate, 2) Then
                        If MsgBox("�T���f�[�^���쐬����Ă��܂��񂪁A�쐬���܂����H", vbQuestion + vbYesNo, "�T���A���\���") = vbYes Then
                            '�ܗ^�T���f�[�^�쐬
                            If InstKoujo = False Then
                                lblMsg.Caption = "�T���f�[�^�쐬�𒆎~���܂����B"
                                Exit Sub
                            End If
                        End If
                    End If
'2005.05.06 Yasui@NBC �T���쐬�s���Ή� <==
                End If
            End If
            Call subInitScreen
            cobSyoriYM.SetFocus
    End Select
    
End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
End Sub

'*************************************************************************************************
'*���s�{�^������
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String '�G���[���b�Z�[�W
    Dim strWrk    As String
    Dim i         As Long
'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
    Dim objTable  As Object
    Dim strSQL    As String

    '���̫������ċ����I�Ɋe���۰ق�Lost_Focus������
    cmdPFK(5).SetFocus
    '�X�e�[�^�X�o�[���b�Z�[�W
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    lblMsg.Caption = ""
    DoEvents
    
    '����ʐ���
    Call subGamenSeigyo(False)          '��ʃ��b�N
    
    '�����N��
    gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
    
    '�����敪
    If optKbn(0).Value = True Then
        gstrSyoriKbn = "1"      '���^
    Else
        gstrSyoriKbn = "2"      '�ܗ^
    End If
'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
    '���s���Ԃ̎擾
    'SQL���̍쐬
    strSQL = "SELECT" _
        & " TO_CHAR(SYSDATE,'MMDDHH24MI')" _
        & " FROM" _
        & " DUAL"

        '���o���s
    If Not gblnOpenOracleTable(objTable, strSQL) Then
        strSyoriMMDDHHMI = "00000000"
    Else
        strSyoriMMDDHHMI = objTable.Fields("TO_CHAR(SYSDATE,'MMDDHH24MI')").Value
    End If
'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END
    
    '�T���A���\�f�[�^�쐬
    If blnGetKoujyo Then
    
'2003/01/20 �ǉ�
        '���T���A���\�̃f�[�^�쐬
        Call blnMakeMekoujyo
'2003/01/20 �ǉ�

        '��ʐ���
        Call subGamenSeigyo(True) '�g�p��
        sprList.Enabled = True
        sprList.SetFocus
        '�T���A���\�f�[�^�X�v���b�g�\��
        Call subDispList
        cobSyoriYM.Enabled = False
        optKbn(0).Enabled = False
        optKbn(1).Enabled = False
        cmdPrint(0).Enabled = True
        cmdPrint(1).Enabled = True
        cmdPFK(5).Enabled = False
'**** 11/02 �ܗ^�f�[�^�쐬�ǉ� ****
        If optKbn(0).Value = True Then  '���^
            cmdInst.Enabled = False
        Else                            '�ܗ^
            cmdInst.Enabled = True
        End If
    Else
        '��ʐ���
        Call subGamenSeigyo(True) '�g�p��
        lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO") 'Msg = �Y���f�[�^�����݂��܂���
    End If

    stbSystem.Panels.Item(1).Text = ""
    
End Sub

'**************************************************************************************************
'   Form_Unload�C�x���g
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

'*** 11/05 �ܗ^�f�[�^�쐬�ǉ� ***
    If cmdInst.Enabled = True Then
        '�ܗ^�T���ŐV���t�擾
        Call gsubSPGetYM
        '�����N��
        gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
        '�ŐV�ܗ^�T���쐬�N���`�F�b�N
        If Val(gstrBonusYM) < Val(gstrSyoriYM) Then
'2005.05.06 Yasui@NBC �T���쐬�s���Ή� �ܗ^�T���쐬�̍쐬�����ɐ����������� ==>
'            If MsgBox("�T���f�[�^���쐬����Ă��܂��񂪁A�쐬���܂����H", vbQuestion + vbYesNo, "�T���A���\���") = vbYes Then
'                '�ܗ^�T���f�[�^�쐬
'                If InstKoujo = False Then
'                    lblMsg.Caption = "�T���f�[�^�쐬�𒆎~���܂����B"
'                    Exit Sub
'                End If
'            End If
            If strDATE1 < Right(gstrSysDate, 2) And _
               strDATE2 > Right(gstrSysDate, 2) Then
                If MsgBox("�T���f�[�^���쐬����Ă��܂��񂪁A�쐬���܂����H", vbQuestion + vbYesNo, "�T���A���\���") = vbYes Then
                    '�ܗ^�T���f�[�^�쐬
                    If InstKoujo = False Then
                        lblMsg.Caption = "�T���f�[�^�쐬�𒆎~���܂����B"
                        Exit Sub
                    End If
                End If
            End If
'2005.05.06 Yasui@NBC �T���쐬�s���Ή� <==
        End If
    End If

    '�g�p���[�N�e�[�u���S�폜
    Call subDelWorkTbl

    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB

    Set frmQPAV_CEnt140 = Nothing
End Sub

Private Sub optKbn_Click(Index As Integer)

    '���^�̏ꍇ
    If Index = 0 Then
       If Right(gstrSysDate, 2) > 15 Then
            cobSyoriYM.ListIndex = 1
       Else
            cobSyoriYM.ListIndex = 0
       End If
       'cobSyoriYM.Enabled = False
       cobSyoriYM.Locked = True
            
        lblKyuuyo.Caption = cobSyoriYM.Text & "�x���^��"
    
        lblKIKAN.Caption = ""       '2005.05.06 Yasui@NBC �T���쐬�s���Ή�
    
    '�ܗ^�̏ꍇ
    Else
        'cobSyoriYM.Enabled = True
        cobSyoriYM.Locked = False
        lblKyuuyo.Caption = cobSyoriYM.Text & "�x�ܗ^��"
    
        '2005.05.06 Yasui@NBC �T���쐬�s���Ή� ==>
        intIDX = IIf(cobSyoriYM.ListIndex <= 0, 0, cobSyoriYM.ListIndex)
        lblKIKAN.Caption = "���o���ԁF" & strKikan(intIDX) & "/26�`" & _
                                strKikan(intIDX + 1) & "/25"
        '2005.05.06 Yasui@NBC �T���쐬�s���Ή� <==
    
    End If
    
End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@�T���A���\�f�[�^�@�쐬���擾
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*********************************************************************************************
Private Function blnGetKoujyo()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30


On Error GoTo errGetKoujyo
    
    blnGetKoujyo = False
    lngHigasiCount = 0      '�T���A���\         ���f�[�^����
    lngNisiCount = 0        '�T���A���\         ���f�[�^����
    lngZanCount = 0         '���T���c���ꗗ�\     �f�[�^����

    '�T���A���\�쐬���擾 �r�o
    odbDatabase.Parameters.Add "InStrSyoriKbn", gstrSyoriKbn, ORAPARM_INPUT     '�Ј��R�[�h�P
    odbDatabase.Parameters.Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT     '�Ј��R�[�h�Q
    
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
    '�T���A���\�f�[�^ �z��
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    
    '�T���A���\     ���f�[�^����
    odbDatabase.Parameters.Add "OtNumHigasiCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumHigasiCount").ServerType = ORATYPE_NUMBER
    '�T���A���\     ���f�[�^����
    odbDatabase.Parameters.Add "OtNumNisiCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumNisiCount").ServerType = ORATYPE_NUMBER
    '���T���c���ꗗ�\ �f�[�^����
    odbDatabase.Parameters.Add "OtNumZanCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZanCount").ServerType = ORATYPE_NUMBER
    
    '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    '�����I���t���O
    odbDatabase.Parameters.Add "OtstrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2

    '�r�p�k���쐬
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140GetKoujyo(" & _
    ":InStrSyoriKbn," & _
    ":InStrSyoriYM," & _
    ":InNumMaxRec," & _
    ":IoNumFetchCount," & _
    ":IoNumRecCount," & _
    ":OtNumAryCount," & _
    ":OtStrDataAry," & _
    ":OtNumHigasiCount," & _
    ":OtNumNisiCount," & _
    ":OtNumZanCount," & _
    ":InStrUserID," & _
    ":InStrComputerNM," & _
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

            '���o������0���̏ꍇ
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
'        lngRecCount = lngRecCount + odbDatabase.Parameters("OtNumAryCount")    '�yWin2000�Ή��zDel by Yokoyama@NBC 2004/04/19
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))     '�yWin2000�Ή��zAdd by Yokoyama@NBC 2004/04/19
        
        For j = lngFirstCnt To lngRecCount
            '�T���A���\�W��f�[�^
            gDataAry(j) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '�I���t���O���P�܂�

    lngHigasiCount = odbDatabase.Parameters("OtNumHigasiCount") '�T���A���\         ���f�[�^����
    lngNisiCount = odbDatabase.Parameters("OtNumNisiCount")     '�T���A���\         ���f�[�^����
    lngZanCount = odbDatabase.Parameters("OtNumZanCount")       '���T���c���ꗗ�\     �f�[�^����
    
    If lngHigasiCount > 0 Or lngNisiCount > 0 Or lngZanCount > 0 Then
        blnGetKoujyo = True
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    Exit Function

errGetKoujyo:
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
 Dim strValue      As String '���ڒl������
 Dim StrDate       As String '���ڒl������

    '������
    lngKensuu = UBound(gDataAry())

    With sprList
        .ReDraw = False
                
        '���گ�޼�Ă�MaxRow��ݒ�(max20����������ݒ肷��
'        If lngKensuu > 20 Then
            .MaxRows = lngKensuu
 '       Else
'            .MaxRows = 20
'        End If
        
        '1��̌���
        For i = 1 To lngKensuu
                   
            '�؏����ׂP���R�[�h
            StrDate = gDataAry(i)
        
            '�ȉ��ꗗ�\���p
            
            '���Z�X�R�[�h
            strValue = Trim$(gfncstrDlm2(StrDate, 1))
            .SetText 1, i, strValue
            '���Z�X��
            strValue = Trim$(gfncstrDlm2(StrDate, 2))
            .SetText 2, i, strValue
            '����
            strValue = Trim$(gfncstrDlm2(StrDate, 3))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 3, i, strValue
            
            '���z���v
            strValue = Trim$(gfncstrDlm2(StrDate, 4))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 4, i, strValue
            
            '�������v
            strValue = Trim$(gfncstrDlm2(StrDate, 5))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 5, i, strValue
            '�������v
            strValue = Trim$(gfncstrDlm2(StrDate, 6))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 6, i, strValue
            '�c�����v
            strValue = Trim$(gfncstrDlm2(StrDate, 7))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 7, i, strValue

            .RowHeight(i) = 9.55
            
        Next i
        
        .ReDraw = True
    
    End With

End Sub

'�N���X�^�����|�[�g
'MOD 20100809 1004091 IMZ SHIBUTANI START
'�����FstrTozaiKBN As String�@���폜
'Private Sub subPrintReport1(intDestinationConstants As DestinationConstants, strTozaiKBN As String)
Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)
'MOD 20100809 1004091 IMZ SHIBUTANI END

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String

    strWareki = Format$(cobSyoriYM & "/01", "gggeemmdd")
    strNen = Mid$(strWareki, 3, 2)
    strNen = StrConv(strNen, vbWide)
    strWareki = Left$(strWareki, 2)
    strTuki = StrConv(Format$(Val(Right$(cobSyoriYM, 2)), "##"), vbWide)
    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt140.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAO_KOJOW"
        
        '�p�����[�^���L�q����
        .Formulas(0) = "PARA01='" & strWareki & strNen & "'"
        .Formulas(1) = "PARA02='" & strTuki & "'"
        If gstrSyoriKbn = "1" Then
            .Formulas(2) = "PARA03='���^'"
        Else
            .Formulas(2) = "PARA03='�ܗ^'"
        End If
            
        'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START
        If gstrSyoriKbn = "1" Then
            
            If Mid(strSyoriMMDDHHMI, 3, 4) >= strDATE10 And Mid(strSyoriMMDDHHMI, 3, 2) <= strDATE3 Then
                '���^�T���m������狋�^�T���A���\�̐؂�ւ����܂�(����5���`15��)
                .Formulas(3) = "PARA04='�y�m���z'"
            Else
                .Formulas(3) = "PARA04='�y�m��O�z'"
            End If
        
        Else
            '�ܗ^�T������6��
            If Right$(cobSyoriYM, 2) = strDATE4 Then
                
                '���[�o�͓����ܗ^�T���m�������ܗ^�T���A���\���o�͂ł���ŏI��(5��20���`6��30��)
                If Right(gstrSysDate, 4) >= strDATE5 And Right(gstrSysDate, 4) <= strDATE6 Then
                    .Formulas(3) = "PARA04='�y�m���z'"
                Else
                    .Formulas(3) = "PARA04='�y�m��O�z'"
                End If
            
            '�����N����12��
            ElseIf Right$(cobSyoriYM, 2) = strDATE7 Then
                
                '���[�o�͓����ܗ^�T���m�������ܗ^�T���A���\���o�͂ł���ŏI��(11��10���`12��31��)
                If Right(gstrSysDate, 4) >= strDATE8 And Right(gstrSysDate, 4) <= strDATE9 Then
                    .Formulas(3) = "PARA04='�y�m���z'"
                Else
                    .Formulas(3) = "PARA04='�y�m��O�z'"
                End If
            
            '�����N����6���E12���ȊO
            Else
                .Formulas(3) = "PARA04='�y�m��O�z'"
            End If
        
        End If
        'ADD 0811051 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END

'****** 2001/10/11 �����敪���O�̐l�ɑΉ� ******
        
        '���o�������L�q����
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        If strTozaiKBN = "1" Then
'            strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '0' OR {QPAO_KOJOW.QPAO_TOZAIKBN} = '1')" & _
                             " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'        Else
'            strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '" & strTozaiKBN & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'        End If
'        '���o�������L�q����
'        strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '" & strTozaiKBN & "')" & _
'                         " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
'                         " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
        
        strSelectionFormula = "({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                         " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula

        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�T���A���\ (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   �T���A�����v�\�̏o��
        '----------------------------------------------------------------------
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt143.rpt"
        .DiscardSavedData = True

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�T���A�����v�\ (" & gstrCommandLine(8) & ")"

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
        .Reset
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String
    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt141.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAP_MIKOJOW"
        
        '���o�������L�q����
        strSelectionFormula = "    ({QPAP_MIKOJOW.QPAP_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPAP_MIKOJOW.QPAP_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "���T���c���ꗗ�\ (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   ���T���c���ꗗ���v�\�̏o��
        '----------------------------------------------------------------------
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt144.rpt"
        .DiscardSavedData = True

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "���T���c���ꗗ���v�\ (" & gstrCommandLine(8) & ")"

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
        .Reset
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

Private Sub subPrintReport3(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String
    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt142.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB8_MIKOJORENW"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '���o�������L�q����
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        strSelectionFormula = "    ({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "')"

        strSelectionFormula = "    ({QPB8_MIKOJORENW.QPB8_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPB8_MIKOJORENW.QPB8_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula

        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "���T���A���ꗗ�\ (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   ���T���A���ꗗ���v�\�̏o��
        '----------------------------------------------------------------------
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt145.rpt"
        .DiscardSavedData = True

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "���T���A���ꗗ���v�\ (" & gstrCommandLine(8) & ")"

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
        .Reset
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

'*********************************************************************************
'*   ��ʐ���
'*�@�@�����FblnEnabledFlg=True ��ʎg�p�s��      blnEnabledFlg=False ��ʎg�p��
'*********************************************************************************
Private Sub subGamenSeigyo(blnEnabledFlg As Boolean)
    If blnEnabledFlg = True Then
        Me.MousePointer = vbDefault   '�}�E�X�|�C���^�[�i�m�[�}���j
        Me.Enabled = True             '��ʑ����
    Else
        Me.MousePointer = vbHourglass '�}�E�X�|�C���^�[�i�����v�j
        DoEvents
        Me.Enabled = False            '��ʑ���s��
    End If
End Sub

'***********************************************************************************
'    ��ʏ�����
'***********************************************************************************
Private Sub subInitScreen()
 Dim i As Long
 Dim strTmp As String
 Dim ymd    As Date

    blnNoChangeEvFlg = True
    
    'ComboBox�ݒ�
    '�����N��
    ymd = CVDate(Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2) & "/" & Mid$(gstrSysDate, 7, 2))
    With cobSyoriYM
        .Clear
        .AddItem (Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2))
        .AddItem (Format(DateAdd("m", 1, ymd), "yyyy/mm"))
        If Day(ymd) > 15 Then
            .ListIndex = 1
        Else
            .ListIndex = 0
        End If
    End With

    '2005.05.06 Yasui@NBC �T���쐬�s���Ή� ==>
    strKikan(0) = Format(DateAdd("m", -1, ymd), "yyyy/mm")
    strKikan(1) = Format(ymd, "yyyy/mm")
    strKikan(2) = Format(DateAdd("m", 1, ymd), "yyyy/mm")
    '2005.05.06 Yasui@NBC �T���쐬�s���Ή� <==
    
    '�G���[���b�Z�[�W�N���A
    lblMsg.Caption = ""

    '���^�A�ܗ^�{�^��
    optKbn(0).Value = True
    lblKyuuyo.Caption = cobSyoriYM.Text & "�x���^��"
    
    cobSyoriYM.Enabled = True
    optKbn(0).Enabled = True
    optKbn(1).Enabled = True
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
'**** 11/02 �ܗ^�f�[�^�쐬�ǉ� ****
    cmdInst.Enabled = False

     'Spred Sheet�̏�����
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    

    blnNoChangeEvFlg = False
    
End Sub

'****************************************************************************************
'* �g�p���[�N�e�[�u���S�폜
'****************************************************************************************
Private Sub subDelWorkTbl()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    '���[�U�[�h�c
    With odbDatabase.Parameters
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        '�R���s���[�^��
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With
    
    strSQL = "BEGIN QPAP_CEnt320PkG.QPAP_CEnt320DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    '�X�g�A�h�v���V�[�W���N��
    odbDatabase.DbexecuteSQL (strSQL)

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
    
'****************************************************************************************
'* �ܗ^�f�[�^�쐬�w��
'****************************************************************************************
Private Function InstKoujo() As Boolean

    InstKoujo = False
    
    '�X�e�[�^�X�o�[���b�Z�[�W
    stbSystem.Panels.Item(1).Text = "�������D�D�D"
    lblMsg.Caption = ""
    DoEvents
    
    '����ʐ���
    Call subGamenSeigyo(False)  '��ʃ��b�N
    
    '�ܗ^�T���f�[�^�쐬
    If blnInstKoujyo = False Then
        GoTo Exit_InstKoujo
    End If
    
    InstKoujo = True
    
Exit_InstKoujo:
    '����ʐ������
    Call subGamenSeigyo(True)   '�g�p��
    stbSystem.Panels.Item(1).Text = ""

End Function

'****************************************************************************************
'* �ܗ^�f�[�^�쐬����
'****************************************************************************************
Private Function blnInstKoujyo() As Boolean

    Dim strSQL               As String

On Error GoTo errInstKoujyo

    blnInstKoujyo = False
    
    '�r�o
    odbDatabase.Parameters.Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT               '�����N��
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT         '�S���҃R�[�h
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     '�R���s���[�^��

    '�r�p�k���̍쐬
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140KojoTKousin (" & _
            ":InStrSyoriYM,:InStrUserID,:InStrComputerNM); END;"

    '�r�o�̎��s
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errInstKoujyo
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    blnInstKoujyo = True
    
    Exit Function
  
errInstKoujyo:
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

End Function

'*********************************************************************************************
'*�@�@�葱�����F�@���T���A���\�f�[�^�@�쐬
'*�@�@���@���@�F�@�Ȃ�
'*�@�@���@�ʁ@�F�@True�c�Y���f�[�^�L  False�c�Y���f�[�^����
'*********************************************************************************************
Private Function blnMakeMekoujyo() As Boolean

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long

On Error GoTo errblnMakeMekoujyo
    
    blnMakeMekoujyo = False

    '�T���A���\�쐬���擾 �r�o

    With odbDatabase.Parameters
        .Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT                 '�����N��(�R���{�{�b�N�X�̒��g)
        
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT           '���[�U�[ID
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT       '�R���s���[�^�[��
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        
        .Add "OtstrEndFlg", "0", ORAPARM_OUTPUT                         '�I���t���O
        .Item("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2
    End With

    '�r�p�k���쐬
    strSQL = "BEGIN QPAP_CEnt320PkG.QPAP_CEnt320GetKoujyo(" & _
    ":InStrSyoriYM," & _
    ":InStrUserID," & _
    ":InStrComputerNM," & _
    ":OtstrEndFlg); END;"

    '�r�o�̎��s
    Call odbDatabase.DbexecuteSQL(strSQL)

    If odbDatabase.Parameters("OtstrEndFlg") <> 1 Then
        '�I�u�W�F�N�g�̊J��
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    Exit Function

errblnMakeMekoujyo:
'�G���[����
    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    Err.Clear
End Function
