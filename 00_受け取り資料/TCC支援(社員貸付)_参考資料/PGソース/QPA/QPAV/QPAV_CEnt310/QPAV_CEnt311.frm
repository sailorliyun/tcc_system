VERSION 5.00
Begin VB.Form frmQPAV_CEnt311 
   BorderStyle     =   3  '�Œ��޲�۸�
   Caption         =   "�����ݕt�f�[�^�o�^"
   ClientHeight    =   5595
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10365
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   10365
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      Height          =   405
      Left            =   600
      ScaleHeight     =   345
      ScaleWidth      =   9315
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   4920
      Width           =   9375
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
         Width           =   9375
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "�߂�"
      Height          =   615
      Left            =   8640
      TabIndex        =   7
      Top             =   4200
      Width           =   1335
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "���s"
      Height          =   615
      Left            =   6960
      TabIndex        =   6
      Top             =   4200
      Width           =   1335
   End
   Begin VB.TextBox txtMoney 
      Alignment       =   1  '�E����
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4440
      MaxLength       =   9
      TabIndex        =   5
      Text            =   "10000"
      Top             =   3720
      Width           =   2775
   End
   Begin VB.TextBox txtMinute 
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   5760
      MaxLength       =   2
      TabIndex        =   4
      Text            =   "12"
      Top             =   3120
      Width           =   495
   End
   Begin VB.TextBox txtHour 
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4440
      MaxLength       =   2
      TabIndex        =   3
      Text            =   "12"
      Top             =   3120
      Width           =   495
   End
   Begin VB.TextBox txtDay 
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   7320
      MaxLength       =   2
      TabIndex        =   2
      Text            =   "1"
      Top             =   2400
      Width           =   495
   End
   Begin VB.TextBox txtMonth 
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6000
      MaxLength       =   2
      TabIndex        =   1
      Text            =   "12"
      Top             =   2400
      Width           =   495
   End
   Begin VB.TextBox txtYear 
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4440
      MaxLength       =   4
      TabIndex        =   0
      Text            =   "2002"
      Top             =   2400
      Width           =   735
   End
   Begin VB.Label Label12 
      Alignment       =   2  '��������
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
      Height          =   330
      Left            =   6360
      TabIndex        =   19
      Top             =   3180
      Width           =   330
   End
   Begin VB.Label Label11 
      Alignment       =   2  '��������
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
      Height          =   330
      Left            =   5040
      TabIndex        =   18
      Top             =   3180
      Width           =   330
   End
   Begin VB.Label Label10 
      Alignment       =   2  '��������
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
      Height          =   330
      Left            =   7920
      TabIndex        =   17
      Top             =   2460
      Width           =   330
   End
   Begin VB.Label Label9 
      Alignment       =   2  '��������
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
      Height          =   330
      Left            =   6600
      TabIndex        =   16
      Top             =   2460
      Width           =   330
   End
   Begin VB.Label Label8 
      Alignment       =   2  '��������
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
      Height          =   330
      Left            =   5280
      TabIndex        =   15
      Top             =   2460
      Width           =   330
   End
   Begin VB.Label lblName 
      BackStyle       =   0  '����
      Caption         =   "�x�m��  ���Y"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   330
      Left            =   4440
      TabIndex        =   14
      Top             =   1080
      Width           =   2175
   End
   Begin VB.Label lblSyainCd 
      BackStyle       =   0  '����
      Caption         =   "1234567"
      BeginProperty Font 
         Name            =   "�l�r �o�S�V�b�N"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   330
      Left            =   4440
      TabIndex        =   13
      Top             =   480
      Width           =   1575
   End
   Begin VB.Label Label5 
      BackStyle       =   0  '����
      Caption         =   "�ݕt���z"
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
      Left            =   2325
      TabIndex        =   12
      Top             =   3780
      Width           =   1095
   End
   Begin VB.Label Label4 
      BackStyle       =   0  '����
      Caption         =   "�ݕt����"
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
      Left            =   2325
      TabIndex        =   11
      Top             =   3180
      Width           =   1095
   End
   Begin VB.Label Label3 
      BackStyle       =   0  '����
      Caption         =   "�ݕt��"
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
      Left            =   2325
      TabIndex        =   10
      Top             =   2460
      Width           =   1095
   End
   Begin VB.Label Label2 
      BackStyle       =   0  '����
      Caption         =   "�Ј�����"
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
      Left            =   2325
      TabIndex        =   9
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackStyle       =   0  '����
      Caption         =   "�Ј��ԍ�"
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
      Left            =   2325
      TabIndex        =   8
      Top             =   480
      Width           =   1095
   End
End
Attribute VB_Name = "frmQPAV_CEnt311"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'**************************************************************************************************
'*�߂�{�^������
'**************************************************************************************************
Private Sub cmdCancel_Click()
    Unload Me
End Sub
'**************************************************************************************************
'*���s�{�^������
'**************************************************************************************************
Private Sub cmdExec_Click()
    Dim TxtDate             As Date             '�ݕt���t
    Dim strStCheck          As String           '�x�E�J�n����
    Dim strEdCheck          As String           '�x�E�I������
    Dim intMsg              As Integer          'ү���ޔԍ�
    Dim lngRecCnt           As Long             '�蓮����T�ް�������
    Dim intErrNo            As Integer          '�װ�ԍ�
    
    Call subErrKaijo
    
    '������
    lblMsg.Caption = ""
    strStCheck = ""
    strEdCheck = ""
    intMsg = 0
    
    Select Case gintExecNo
    Case 0      '�ǉ�
        '*****�e�L�X�g�`�F�b�N
        Call TextCheck(intErrNo)
                
        If intErrNo <> gintERR_OK Then
            
            Select Case intErrNo
            Case gintERR_DATE
                'Msg = ���͍��ڂ�����Ă��܂��B
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtYear)
                Exit Sub
            
            Case gintERR_MIRAI_DATE
                'Msg = �������̓��͂͏o���܂���B
                lblMsg.Caption = "WYOE07 " & gstrGetCodeMeisyo(odbDatabase, "E07", "WYO")
                Call subErrSet(txtYear)
                Exit Sub
            
            Case gintERR_TIME
                'Msg = ���͍��ڂ�����Ă��܂��B
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtHour)
                Exit Sub
            
            Case gintERR_KINGAKU
                'Msg = ���͍��ڂ�����Ă��܂��B
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtMoney)
                Exit Sub
            End Select
        End If
        
        '*****�ݕt���t�ݒ�
        gstrYMD = txtYear.Text
        If Len(txtMonth.Text) = 1 Then
            gstrYMD = gstrYMD & "0" & txtMonth.Text
        Else
            gstrYMD = gstrYMD & txtMonth.Text
        End If
        
        If Len(txtDay.Text) = 1 Then
            gstrYMD = gstrYMD & "0" & txtDay.Text
        Else
            gstrYMD = gstrYMD & txtDay.Text
        End If
        
        '*****�ݕt���Ԑݒ�
        If Len(txtHour.Text) = 1 Then
            gstrHMS = "0" & txtHour.Text
        Else
            gstrHMS = txtHour.Text
        End If
        
        If Len(txtMinute.Text) = 1 Then
            gstrHMS = gstrHMS & "0" & txtMinute.Text
        Else
            gstrHMS = gstrHMS & txtMinute.Text
        End If
        gstrHMS = gstrHMS & "00"
        
        '*****�ݕt���z�ݒ�
        gstrKingaku = Format(txtMoney, "0")
        
        '*****�����ݕtT�����`�F�b�N
        If gfuncKgcKasitukeTChk(lngRecCnt, 0) = False Then Exit Sub
        
        If lngRecCnt = 1 Then
            'Msg = �͊��ɓo�^����Ă܂��B
            lblMsg.Caption = "WPOE02 �f�[�^" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
            txtYear.BackColor = vbRed
            txtYear.Enabled = True
            txtYear.SetFocus
            Exit Sub
        End If
        
        TxtDate = CDate(txtYear.Text & "/" & txtMonth.Text & "/" & txtDay.Text)
        
        '*****�ސE�`�F�b�N
        If gtblSyainM.TaisyokuYMD = "" Then
        Else
            '���t�`�F�b�N
            strStCheck = DateDiff("d", CDate(gtblSyainM.TaisyokuYMD), TxtDate)
            If CLng(strStCheck) > 0 Then
                'Msg = ���͍��ڂ�����Ă��܂��B
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                txtYear.BackColor = vbRed
                txtYear.Enabled = True
                txtYear.SetFocus
                Exit Sub
            End If
        End If
        
        '*****�x�E�`�F�b�N
        strStCheck = ""
        strEdCheck = ""
        If gtblSyainM.KyusyoSTYMD = "" Then
        Else
            strStCheck = DateDiff("d", CDate(gtblSyainM.KyusyoSTYMD), TxtDate)
        End If
        
        If gtblSyainM.KyusyoEDYMD = "" Then
        Else
            strEdCheck = DateDiff("d", CDate(gtblSyainM.KyusyoEDYMD), TxtDate)
        End If
                    
        '�x�E�J�n���`�x�E�I����
        If strStCheck <> "" And strEdCheck <> "" Then
            If CLng(strStCheck) >= 0 And CLng(strEdCheck) <= 0 Then
                intMsg = 1
            End If
        '�x�E�J�n���`
        ElseIf strStCheck <> "" And strEdCheck = "" Then
            If CLng(strStCheck) >= 0 Then
                intMsg = 1
            End If
            
        '�`�x�E�I����
        ElseIf strStCheck = "" And strEdCheck <> "" Then
            If CLng(strEdCheck) <= 0 Then
                intMsg = 1
            End If
        End If
        
        Select Case intMsg
        Case 0
            If MsgBox("�ݕt���z��o�^���܂��B��낵���ł����H", _
                            vbQuestion + vbOKCancel, "�����ݕt�f�[�^�o�^") = vbCancel Then
                Exit Sub
            End If
        Case 1
            If MsgBox("���̎Ј��͋x�E���ł����A�����������s���Ă���낵���ł����H", _
                            vbQuestion + vbOKCancel, "�����ݕt�f�[�^�o�^") = vbCancel Then
                Exit Sub
            End If
        End Select
            
        '*****�f�[�^�ǉ�����
        If gfuncSPIns = True Then
            gblnDataSetFlg = True
        Else
            gblnDataSetFlg = False
        End If
    
    
    Case 1      '�폜
        If MsgBox("�ݕt���z���폜���܂��B��낵���ł����H", _
                        vbQuestion + vbOKCancel, "�����ݕt�f�[�^�폜") = vbCancel Then
            Exit Sub
        Else
        
            '*****�f�[�^�폜����
            If Not gfuncSPDel Then
                gblnDataSetFlg = False
                Exit Sub
            Else
                gblnDataSetFlg = True
            End If
            
        End If
    
    End Select

    Unload Me
End Sub
'**************************************************************************************************
'*Form Activate
'**************************************************************************************************
Private Sub Form_Activate()
    
    '*****�����ݒ�
    lblSyainCd.Caption = gstrCode
    lblName.Caption = gstrName
    txtYear.Text = Left(gstrYMD, 4)
    txtMonth.Text = Mid(gstrYMD, 5, 2)
    txtDay.Text = Right(gstrYMD, 2)
    txtHour.Text = Left(gstrHMS, 2)
    txtMinute.Text = Mid(gstrHMS, 3, 2)
    txtMoney = gstrKingaku
        
    Select Case gintExecNo
    Case 0
        Me.Caption = "�����ݕt�f�[�^�o�^"
        cmdExec.Caption = "�o�^"
        txtYear.SetFocus
    
    Case 1
        Me.Caption = "�����ݕt�f�[�^�폜"
        cmdExec.Caption = "�폜"
        txtYear.Enabled = False
        txtMonth.Enabled = False
        txtDay.Enabled = False
        txtHour.Enabled = False
        txtMinute.Enabled = False
        txtMoney.Enabled = False
    End Select
    
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtYear_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtDay_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtHour_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtMinute_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtMoney_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�e�L�X�g�L�[����
'**************************************************************************************************
Private Sub txtMonth_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtYear_GotFocus()
    Call gsubSelectText(txtYear)
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtMonth_GotFocus()
    Call gsubSelectText(txtMonth)
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtDay_GotFocus()
    Call gsubSelectText(txtDay)
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtHour_GotFocus()
    Call gsubSelectText(txtHour)
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtMinute_GotFocus()
    Call gsubSelectText(txtMinute)
End Sub
'**************************************************************************************************
'*�t�H�[�J�X�擾���S�e�L�X�g�I��
'**************************************************************************************************
Private Sub txtMoney_GotFocus()
    Call gsubSelectText(txtMoney)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtYear_Change()
    Call gsubMaxCharSkipEX(txtYear, 4)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtMonth_Change()
    Call gsubMaxCharSkipEX(txtMonth, 2)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtDay_Change()
    Call gsubMaxCharSkipEX(txtDay, 2)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtHour_Change()
    Call gsubMaxCharSkipEX(txtHour, 2)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtMinute_Change()
    Call gsubMaxCharSkipEX(txtMinute, 2)
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X�C�x���g
'**************************************************************************************************
Private Sub txtMoney_Change()
    With txtMoney
        .Text = Format(.Text, "####,###")
        .SelStart = Len(.Text)
    End With
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtYear_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtMonth_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtDay_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtHour_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtMinute_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*���͕�������i�����̂݁j
'**************************************************************************************************
Private Sub txtMoney_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    Set frmQPAV_CEnt311 = Nothing
End Sub
'**************************************************************************************************
'*�e�L�X�g�{�b�N�X���̓`�F�b�N
'**************************************************************************************************
Private Sub TextCheck(ByRef intErrNo As Integer)
    Dim strEndDay           As String           '����

    intErrNo = gintERR_OK
    '*****���t���̓`�F�b�N
    If Len(Trim(txtYear.Text)) < 4 Then       '�N
        intErrNo = gintERR_DATE
        Exit Sub
    End If

    If Trim(txtMonth.Text) = "" Then          '��
        intErrNo = gintERR_DATE
        Exit Sub

    Else
        If CLng(Trim(txtMonth.Text)) > 12 Or CLng(Trim(txtMonth.Text)) < 1 Then
            intErrNo = gintERR_DATE
            Exit Sub
        End If
    End If
    
    If Trim(txtDay.Text) = "" Or CLng(Trim(txtDay.Text)) = 0 Then             '��
        intErrNo = gintERR_DATE
        Exit Sub
    Else
        '�����擾
        strEndDay = CStr(DateSerial(CLng(txtYear.Text), CLng(txtMonth.Text) + 1, 1) - 1)
        If CLng(txtDay.Text) > CLng(Right(strEndDay, 2)) Then
            intErrNo = gintERR_DATE
            Exit Sub
        End If
    
    End If
        
    '*****�ߋ��������t�`�F�b�N
    intErrNo = DateCheckNo(txtYear.Text & "/" & txtMonth.Text & "/" & txtDay.Text)
    If intErrNo <> gintERR_OK Then
        Exit Sub
    End If
    
    '*****���ԓ��̓`�F�b�N
    If Trim(txtHour.Text) = "" Then           '��
        intErrNo = gintERR_TIME
        Exit Sub
    ElseIf CLng(txtHour.Text) > 23 Then
        intErrNo = gintERR_TIME
        Exit Sub
    End If
    
    If Trim(txtMinute.Text) = "" Then         '��
        intErrNo = gintERR_TIME
        Exit Sub
    ElseIf CLng(txtMinute.Text) > 59 Then
        intErrNo = gintERR_TIME
        Exit Sub
    End If

    '*****���z���̓`�F�b�N
    If Trim(txtMoney.Text) = "" Then
        intErrNo = gintERR_KINGAKU
        Exit Sub
    End If
        
End Sub
'**************************************************************************************************
'*�G���[�ݒ菈��
'**************************************************************************************************
Private Sub subErrSet(ByVal objTxtBox As TextBox)
    With objTxtBox
        .BackColor = vbRed
        .Enabled = True
        .SetFocus
    End With
End Sub
'**************************************************************************************************
'*�G���[��������
'**************************************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    txtYear.BackColor = vbWhite
    txtHour.BackColor = vbWhite
    txtMoney.BackColor = vbWhite
End Sub

