VERSION 5.00
Begin VB.Form frmQPAV_CEnt181 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "���Z�X�}�X�^�����e�i���X"
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
      Left            =   150
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   3270
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
         TabIndex        =   9
         Top             =   30
         Width           =   7095
      End
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
      Left            =   5490
      TabIndex        =   4
      Top             =   4320
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
      TabIndex        =   3
      Top             =   4320
      Width           =   1350
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
      TabIndex        =   2
      Top             =   4320
      Width           =   1350
   End
   Begin VB.TextBox txtSeisanntennName 
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
      Left            =   2790
      TabIndex        =   1
      Top             =   2130
      Width           =   4095
   End
   Begin VB.TextBox txtSeisanntenn 
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
      Left            =   2790
      MaxLength       =   3
      TabIndex        =   0
      Text            =   "555"
      Top             =   1440
      Width           =   495
   End
   Begin VB.Label Label2 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "���Z�X���́i�����j"
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
      Left            =   615
      TabIndex        =   6
      Top             =   2160
      Width           =   2025
   End
   Begin VB.Label Label1 
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
      Left            =   1290
      TabIndex        =   5
      Top             =   1530
      Width           =   1350
   End
   Begin VB.Label Label3 
      BorderStyle     =   1  '����
      Height          =   2445
      Left            =   180
      TabIndex        =   7
      Top             =   690
      Width           =   7125
   End
End
Attribute VB_Name = "frmQPAV_CEnt181"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdTouroku_Click()
'*****************************************************************************************
'  �o�^�E�C���E�폜����
'*****************************************************************************************
    Dim i As Long
    
    If cmdTouroku.Caption <> "�폜" Then
        If Chk_err = False Then Exit Sub
    End If
    
    Select Case cmdTouroku.Caption
        Case "�o�^"
            If MsgBox("�o�^���Ă�낵���ł����H", vbQuestion + vbOKCancel, "���Z�X�}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPAdd = False Then Exit Sub
        Case "�C��"
            If MsgBox("�C�����Ă�낵���ł����H", vbQuestion + vbOKCancel, "���Z�X�}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPUpd = False Then Exit Sub
        Case "�폜"
            If MsgBox("�폜���Ă�낵���ł����H", vbQuestion + vbOKCancel, "���Z�X�}�X�^�����e�i���X") = vbCancel Then
                Exit Sub
            End If
            If gsubSPDel = False Then Exit Sub
    End Select
    Unload Me
End Sub

Private Function Chk_err() As Boolean
'*****************************************************************************************
'   �e���ڂ̓��́E�����`�F�b�N
'*****************************************************************************************
    Chk_err = False
    
    If Chk_txt(txtSeisanntenn) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���Z�X" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtSeisanntenn, 3) = False Then
            'Msg = ���œ��͂��Ă��������B
            lblMsg.Caption = "WPOE06 ���Z�X�͂R" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtSeisanntennName) = False Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ���Z�X����" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtSeisanntennName, 24) = False Then
            'Msg = �̓��͌������I�[�o�[���܂����
            lblMsg.Caption = "WPOE04 ���Z�X" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    Chk_err = True
    
End Function

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
    Call subFormInitialize
    txtSeisanntenn.SetFocus
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'  ENTERKEY��������
'*****************************************************************************************
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If
End Sub

Private Sub Form_Load()
'*****************************************************************************************
'   Form���[�h
'*****************************************************************************************
    Me.Caption = "���Z�X�}�X�^�����e�i���X (" & gstrCommandLine(8) & ")"
    Call subFormInitialize
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
    lblMsg.Caption = ""
    
    'ENTER Beep������
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
End Sub

Private Sub subFormInitialize()
'*****************************************************************************************
'   ��ʏ�����
'*****************************************************************************************
    If ModeF = "�o�^" Then
        txtSeisanntenn.Text = ""
        txtSeisanntennName.Text = ""
    Else
        txtSeisanntenn.Text = gtblSeisan(Act_Row).CD
        txtSeisanntennName.Text = gtblSeisan(Act_Row).NM
    End If

    '�e�L�X�g�̎g�p����
    If ModeF = "�폜" Then
        txtSeisanntenn.Enabled = False
        txtSeisanntennName.Enabled = False
        cmdTorikesi.Enabled = False
    Else
        txtSeisanntenn.Enabled = True
        txtSeisanntennName.Enabled = True
        cmdTorikesi.Enabled = True
    End If
    
    lblMsg.Caption = ""
End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*****************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("���Z�X�}�X�^�����e�i���X", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt180.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub txtSeisanntenn_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   ���͕�������i�����̂݁j
'*****************************************************************************************
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSeisanntenn_Change()
'*****************************************************************************************
'   �e�L�X�g�t���E�o
'*****************************************************************************************
     txtSeisanntenn.BackColor = vbWhite
     Call gsubMaxCharSkipEX(txtSeisanntenn, 3)
End Sub

'*****************************************************************************************
'   �t�H�[�J�X�擾���S�e�L�X�g�I��
'*****************************************************************************************
Private Sub txtSeisanntenn_GotFocus()
    Call gsubSelectText(txtSeisanntenn)
End Sub

Private Sub txtSeisanntennName_GotFocus()
    Call gsubSelectText(txtSeisanntennName)
End Sub

Private Sub txtSeisanntennName_Change()
'*****************************************************************************************
'   �e�L�X�g�̃G���[����
'*****************************************************************************************
    txtSeisanntennName.BackColor = vbWhite
End Sub

