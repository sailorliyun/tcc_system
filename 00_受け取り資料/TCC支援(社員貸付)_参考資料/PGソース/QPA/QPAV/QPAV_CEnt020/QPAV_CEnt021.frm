VERSION 5.00
Begin VB.Form frmQPAV_CEnt021 
   Caption         =   "����������"
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
      Left            =   870
      TabIndex        =   4
      Top             =   4290
      Width           =   1350
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
      Left            =   5145
      MaxLength       =   2
      TabIndex        =   2
      Top             =   1380
      Width           =   375
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
      Left            =   4275
      MaxLength       =   2
      TabIndex        =   1
      Top             =   1380
      Width           =   375
   End
   Begin VB.TextBox txtNyuukingaku 
      Alignment       =   1  '�E����
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
      Left            =   3120
      MaxLength       =   9
      TabIndex        =   3
      Top             =   1995
      Width           =   1830
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
      Left            =   3135
      MaxLength       =   4
      TabIndex        =   0
      Top             =   1380
      Width           =   645
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
      Left            =   3150
      TabIndex        =   5
      Top             =   4290
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
      TabIndex        =   9
      Top             =   4290
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
      Left            =   120
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   3630
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
         Left            =   30
         TabIndex        =   8
         Top             =   60
         Width           =   7095
      End
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
      Left            =   180
      TabIndex        =   19
      Top             =   480
      Width           =   975
   End
   Begin VB.Label lblShainCD 
      BackStyle       =   0  '����
      Caption         =   "Label2"
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
      Left            =   1320
      TabIndex        =   18
      Top             =   480
      Width           =   885
   End
   Begin VB.Label lblShimei 
      BackStyle       =   0  '����
      Caption         =   "Label2"
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
      Left            =   2310
      TabIndex        =   17
      Top             =   480
      Width           =   1605
   End
   Begin VB.Label lblKingaku 
      Alignment       =   1  '�E����
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
      Left            =   3120
      TabIndex        =   16
      Top             =   2640
      Width           =   1815
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
      Left            =   2310
      TabIndex        =   15
      Top             =   2670
      Width           =   450
   End
   Begin VB.Label Label7 
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
      Left            =   5595
      TabIndex        =   14
      Top             =   1440
      Width           =   240
   End
   Begin VB.Label Label6 
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
      Left            =   4740
      TabIndex        =   13
      Top             =   1440
      Width           =   240
   End
   Begin VB.Label Label1 
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
      Index           =   0
      Left            =   3840
      TabIndex        =   12
      Top             =   1440
      Width           =   270
   End
   Begin VB.Label Label8 
      Alignment       =   1  '�E����
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '����
      Caption         =   "�����z"
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
      Left            =   2085
      TabIndex        =   11
      Top             =   2055
      Width           =   675
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
      Left            =   2085
      TabIndex        =   10
      Top             =   1440
      Width           =   675
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
      Height          =   2520
      Index           =   13
      Left            =   150
      TabIndex        =   6
      Top             =   840
      Width           =   7140
   End
End
Attribute VB_Name = "frmQPAV_CEnt021"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
    Dim Nyukingo      As Long
Private Sub cmdBack_Click()
    
    Unload Me

End Sub

Private Sub cmdTorikesi_Click()
    
    Call subFormInitialize
    If txtNyuukinbiYYYY.Enabled = True Then txtNyuukinbiYYYY.SetFocus

End Sub

'*************************************************************************************************
'*���̓`�F�b�N����
'*************************************************************************************************
Private Function funcChk() As Boolean

    Dim sy As String, hy As String
    
    funcChk = False
    
    If txtNyuukinbiYYYY.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtNyuukinbiYYYY.BackColor = vbRed
        txtNyuukinbiYYYY.Enabled = True
        txtNyuukinbiYYYY.SetFocus
        Exit Function
    End If
    txtNyuukinbiYYYY.Text = Format(txtNyuukinbiYYYY.Text, "0000")
    
    If txtNyuukinbiMM.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtNyuukinbiMM.BackColor = vbRed
        txtNyuukinbiMM.Enabled = True
        txtNyuukinbiMM.SetFocus
        Exit Function
    End If
    txtNyuukinbiMM.Text = Format(txtNyuukinbiMM.Text, "00")
    
    If txtNyuukinbiDD.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 ������" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtNyuukinbiDD.BackColor = vbRed
        txtNyuukinbiDD.Enabled = True
        txtNyuukinbiDD.SetFocus
        Exit Function
    End If
    txtNyuukinbiDD.Text = Format(txtNyuukinbiDD.Text, "00")
    
    If Not IsDate(txtNyuukinbiYYYY.Text & "," & txtNyuukinbiMM.Text & "," & txtNyuukinbiDD.Text) Then
        'Msg = �͓��t�œ��͂��ĉ������B
        lblMsg.Caption = "WPOE03 ������" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtNyuukinbiYYYY.BackColor = vbRed
        txtNyuukinbiMM.BackColor = vbRed
        txtNyuukinbiDD.BackColor = vbRed
        txtNyuukinbiYYYY.SetFocus
        Exit Function
    End If

    sy = Left(ShimeYMD, 4) & "/" & Mid(ShimeYMD, 5, 2) & "/" & Mid(ShimeYMD, 7, 2)
    hy = txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text
    'UPD 20080409 NBC ishida ���ߏ����㌎�����������s���Ȃ�����Ή� START
    'If DateDiff("y", hy, sy) > 0 Then
     If DateDiff("y", hy, sy) >= 0 Then
    'UPD 20080409 NBC ishida ���ߏ����㌎�����������s���Ȃ�����Ή� END
        'Msg = ���ߓ��i�j�ȑO�̓��t�͓��͂ł��܂���B
        lblMsg.Caption = "WPOE08 " & gstrGetCodeMeisyoIn(odbDatabase, "E08", "WPO", sy)
        txtNyuukinbiYYYY.BackColor = vbRed
        txtNyuukinbiMM.BackColor = vbRed
        txtNyuukinbiDD.BackColor = vbRed
        txtNyuukinbiYYYY.SetFocus
        Exit Function
    End If
    
    If txtNyuukingaku.Text = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �������z" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtNyuukingaku.BackColor = vbRed
        txtNyuukingaku.Enabled = True
        txtNyuukingaku.SetFocus
        Exit Function
    End If
    txtNyuukingaku.Text = Format(txtNyuukingaku.Text, "#,##0")

    funcChk = True

End Function

Private Sub cmdTouroku_Click()
    Dim strMsg As String
    
    If gintMode <> 2 Then
        If Not funcChk Then                 '���̓`�F�b�N
            Exit Sub
        End If
    End If

    '�ϐ��ɑޔ�
    gstrYMD_B = Format(gVarSpdGetText(frmQPAV_CEnt020.sprList, 1, glngSprCol), "yyyymmdd")
    gstrYMD = Format(txtNyuukinbiYYYY, "0000") & Format(txtNyuukinbiMM, "00") & Format(txtNyuukinbiDD, "00")
    glngKingaku = Format(txtNyuukingaku, "#0")
    
    Select Case gintMode
        Case 0
            If gfuncSPChk = False Then
                'Msg = �͊��ɓo�^����Ă��܂��B
                lblMsg.Caption = "WPOE02 ���̓�����" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
                txtNyuukinbiYYYY.BackColor = vbRed
                txtNyuukinbiMM.BackColor = vbRed
                txtNyuukinbiDD.BackColor = vbRed
                txtNyuukinbiYYYY.SetFocus
                Exit Sub
            End If
            strMsg = "��������o�^���܂��B��낵���ł����H"
        Case 1
            If gstrYMD <> gstrYMD_B Then
                If gfuncSPChk = False Then
                    'Msg = �͊��ɓo�^����Ă��܂��B
                    lblMsg.Caption = "WPOE02 ���̓�����" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
                    txtNyuukinbiYYYY.BackColor = vbRed
                    txtNyuukinbiMM.BackColor = vbRed
                    txtNyuukinbiDD.BackColor = vbRed
                    txtNyuukinbiYYYY.SetFocus
                    Exit Sub
                End If
            End If
            Nyukingo = Val(Format(lblKingaku.Caption, "###0")) + Val(Format(gVarSpdGetText(frmQPAV_CEnt020.sprList, 2, glngSprCol), "###0"))
            Nyukingo = Nyukingo - Val(Format(txtNyuukingaku.Text, "###0"))
            strMsg = "�ύX�O�c�� �F " & lblKingaku & Chr$(10) & Chr$(13) _
                    & "������c�� �F " & Format(Nyukingo, "###,###,###,##0") & Chr$(10) & Chr$(13) _
                    & "���������C�����܂��B��낵���ł����H"
        Case 2
            strMsg = "���������폜���܂��B��낵���ł����H"
    End Select
    
    If MsgBox(strMsg, vbQuestion + vbOKCancel, "�����Z����������") = vbCancel Then
        Exit Sub
    End If
    
    Select Case gintMode
        Case 0
            If gfuncSPAdd = False Then Exit Sub
        Case 1
            If gfuncSPUpd = False Then Exit Sub
        Case 2
            If gfuncSPDel = False Then Exit Sub
    End Select
    
    Unload Me

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyReturn Then
        KeyCode = 0
        SendKeys "{TAB}"
    End If

End Sub

'**************************************
'*FORM_KEYPRESS
'**************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
    
    lblMsg.Caption = ""

    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite
    txtNyuukingaku.BackColor = vbWhite

End Sub

'**************************************************************************************************
'*Form���[�h
'**************************************************************************************************
Private Sub Form_Load()
    
'ADD 2006.04.28 by NBC.Nomura >> �@�����̈���E�R�s�[�������{ <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "�����Z���������� (" & gstrCommandLine(8) & ")"
    
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

'***********************************************************************************************************
'*��ʏ�����
'***********************************************************************************************************
Private Sub subFormInitialize()
 
    '�e�\�����ڃN���A
    If gintMode = 0 Then
        txtNyuukinbiYYYY.Text = ""
        txtNyuukinbiMM.Text = ""
        txtNyuukinbiDD.Text = ""
        txtNyuukingaku.Text = ""
        lblKingaku.Caption = ""
    Else
        txtNyuukinbiYYYY.Text = Year(gVarSpdGetText(frmQPAV_CEnt020.sprList, 1, glngSprCol))
        txtNyuukinbiMM.Text = Month(gVarSpdGetText(frmQPAV_CEnt020.sprList, 1, glngSprCol))
        txtNyuukinbiDD.Text = Day(gVarSpdGetText(frmQPAV_CEnt020.sprList, 1, glngSprCol))
        txtNyuukingaku.Text = gVarSpdGetText(frmQPAV_CEnt020.sprList, 2, glngSprCol)
        lblKingaku.Caption = gVarSpdGetText(frmQPAV_CEnt020.sprList, 3, glngSprCol)
    End If
    
    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite
    txtNyuukingaku.BackColor = vbWhite
    
    Select Case gintMode
        Case 0, 1
            txtNyuukinbiYYYY.Enabled = True
            txtNyuukinbiMM.Enabled = True
            txtNyuukinbiDD.Enabled = True
            txtNyuukingaku.Enabled = True
            cmdTorikesi.Enabled = True
        Case 2
            txtNyuukinbiYYYY.Enabled = False
            txtNyuukinbiMM.Enabled = False
            txtNyuukinbiDD.Enabled = False
            txtNyuukingaku.Enabled = False
            cmdTorikesi.Enabled = False
    End Select
    
    cmdTouroku.Enabled = True
    
    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
End Sub

'*******************************************************************************
'   �G���[���b�Z�[�W�{�b�N�X��\������B
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("�����Z����������", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt020.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'******************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtNyuukinbiyyyy_GotFocus()
    Call gsubSelectText(txtNyuukinbiYYYY)
End Sub
Private Sub txtNyuukinbimm_GotFocus()
    Call gsubSelectText(txtNyuukinbiMM)
End Sub
Private Sub txtNyuukinbidd_GotFocus()
    Call gsubSelectText(txtNyuukinbiDD)
End Sub
Private Sub txtNyuukingaku_GotFocus()
    Call gsubSelectText(txtNyuukingaku)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtNyuukinbiyyyy_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txtNyuukinbimm_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txtNyuukinbidd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtNyuukingaku_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890,")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtNyuukinbiyyyy_Change()
    Call gsubMaxCharSkipEX(txtNyuukinbiYYYY, 4)
End Sub

Private Sub txtNyuukinbimm_Change()
    Call gsubMaxCharSkipEX(txtNyuukinbiMM, 2)
End Sub

Private Sub txtNyuukinbidd_Change()
    Call gsubMaxCharSkipEX(txtNyuukinbiDD, 2)
End Sub


