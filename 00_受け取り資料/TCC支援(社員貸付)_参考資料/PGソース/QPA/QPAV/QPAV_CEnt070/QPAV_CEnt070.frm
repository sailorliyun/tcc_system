VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt070 
   Caption         =   "�����ύX"
   ClientHeight    =   7890
   ClientLeft      =   60
   ClientTop       =   315
   ClientWidth     =   14355
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   7890
   ScaleWidth      =   14355
   StartUpPosition =   2  '��ʂ̒���
   Begin VB.Frame Frame2 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   6405
      Left            =   90
      TabIndex        =   20
      Tag             =   "5555555"
      Top             =   60
      Width           =   14205
      Begin FPSpread.vaSpread sprList 
         Height          =   4575
         Left            =   4710
         TabIndex        =   0
         Top             =   810
         Width           =   4335
         _Version        =   196608
         _ExtentX        =   7646
         _ExtentY        =   8070
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   14.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   2
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt070.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�폜"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   14.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   2
         Left            =   7830
         TabIndex        =   3
         Top             =   5670
         Width           =   1350
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�C��"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   14.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   1
         Left            =   6150
         TabIndex        =   2
         Top             =   5670
         Width           =   1350
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "�o�^"
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   14.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   0
         Left            =   4500
         TabIndex        =   1
         Top             =   5670
         Width           =   1350
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   6480
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
         TabIndex        =   18
         Top             =   60
         Width           =   12405
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
      ScaleWidth      =   14295
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   6930
      Width           =   14355
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
         Height          =   375
         Index           =   12
         Left            =   13140
         TabIndex        =   15
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
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:�O���"
         Height          =   375
         Index           =   10
         Left            =   10755
         TabIndex        =   13
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
         Index           =   8
         Left            =   8385
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
         Index           =   7
         Left            =   7200
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
         Index           =   6
         Left            =   6015
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
         Height          =   375
         Index           =   5
         Left            =   4830
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
         Index           =   4
         Left            =   3615
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
         Index           =   3
         Left            =   2430
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ʰ�޺�߰"
         Height          =   375
         Index           =   2
         Left            =   1245
         TabIndex        =   5
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F1:�ƭ-"
         Height          =   375
         Index           =   1
         Left            =   60
         TabIndex        =   4
         Top             =   90
         Width           =   1155
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   19
      Top             =   7515
      Width           =   14355
      _ExtentX        =   25321
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   12392
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
            TextSave        =   "2004/04/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "16:01"
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
Attribute VB_Name = "frmQPAV_CEnt070"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click(Index As Integer)
    Dim i       As Integer
    Dim j       As Integer
    Dim ShoriYMD    As Variant
    
    lblMsg.Caption = ""
    
    Select Case Index
        Case 1, 2         '�C��/�폜
            Actv_flg = sprList.ActiveRow
            ShoriYMD = CVDate(gVarSpdGetText(sprList, 1, Actv_flg))
            If DateDiff("y", ShoriYMD, gdatSysDate) > 0 Then
                'Msg = �ߋ����t�̏C���E�폜�͂ł��܂���B
                lblMsg.Caption = "WPOE19 " & gstrGetCodeMeisyo(odbDatabase, "E19", "WPO")
                Exit Sub
            End If
    End Select
    
    '���͉�ʂ̏�����
    frmQPAV_CEnt071.txtHenkouY.Text = ""
    frmQPAV_CEnt071.txtHenkouMM.Text = ""
    frmQPAV_CEnt071.txtHenkouDD.Text = ""
    frmQPAV_CEnt071.txtRiritu1.Text = ""
    frmQPAV_CEnt071.txtRiritu2.Text = ""
    If Index = 2 Then
        frmQPAV_CEnt071.txtHenkouY.Enabled = False
        frmQPAV_CEnt071.txtHenkouMM.Enabled = False
        frmQPAV_CEnt071.txtHenkouDD.Enabled = False
        frmQPAV_CEnt071.txtRiritu1.Enabled = False
        frmQPAV_CEnt071.txtRiritu2.Enabled = False
        frmQPAV_CEnt071.cmdTorikesi.Enabled = False
    Else
        frmQPAV_CEnt071.txtHenkouY.Enabled = True
        frmQPAV_CEnt071.txtHenkouMM.Enabled = True
        frmQPAV_CEnt071.txtHenkouDD.Enabled = True
        frmQPAV_CEnt071.txtRiritu1.Enabled = True
        frmQPAV_CEnt071.txtRiritu2.Enabled = True
    End If
    frmQPAV_CEnt071.cmdTouroku.Caption = cmdExec(Index).Caption
    
    '�f�[�^�̕\��
    Select Case Index
        Case 1, 2         '�C��/�폜
            Actv_flg = sprList.ActiveRow
            If gVarSpdGetText(sprList, sprList.ActiveCol, Actv_flg) = "" Then
                'Msg = ����f�[�^��I�����Ă��������B
                lblMsg.Caption = "WPOE05 " & cmdExec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
            frmQPAV_CEnt071.txtHenkouY.Text = Left(gVarSpdGetText(sprList, 1, Actv_flg), 4)
            frmQPAV_CEnt071.txtHenkouMM.Text = Mid(gVarSpdGetText(sprList, 1, Actv_flg), 6, 2)
            frmQPAV_CEnt071.txtHenkouDD.Text = Right(gVarSpdGetText(sprList, 1, Actv_flg), 2)
            i = InStr(gVarSpdGetText(sprList, 2, Actv_flg), ".")
            frmQPAV_CEnt071.txtRiritu1.Text = Left(gVarSpdGetText(sprList, 2, Actv_flg), i - 1)
            frmQPAV_CEnt071.txtRiritu2.Text = Mid(gVarSpdGetText(sprList, 2, Actv_flg), i + 1, 2)
    End Select
    
    frmQPAV_CEnt071.Show 1
    Call gsubSPInit
    
End Sub

Private Sub cmdPFK_Click(Index As Integer)
    Select Case Index
        Case 1      '���j���[
            Unload Me
        Case 2      '�n�[�h�R�s�[
            Call gsubQSAV_ActX1001
        Case 10     '�O���
            Unload Me
    End Select
End Sub

Private Sub Form_Activate()

    Dim ret  As Boolean
    
    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "�����ύX����"
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�����ύX���� (" & gstrCommandLine(8) & ") " _
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
                                    , "�����ύX���� (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        '�r������
        If Not gblnHaita_Lock Then
            sprList.MaxRows = 0
            cmdExec(0).Enabled = False
            cmdExec(1).Enabled = False
            cmdExec(2).Enabled = False
            cmdPFK(12).Enabled = False
            GoTo Exit_Form_Activate
        End If
    
        Call gsubSPInit
    End If
    
Exit_Form_Activate:
    Me.Enabled = True
    MousePointer = vbDefault
    bInit_Flg = False          '���� FLG �I�t

End Sub
'*********************************************************************************************
'*�@�@�葱�����F�@̫�т�KeyDown����ċL�q
'*�@�@���@���@�F�@KeyCode As Integer
'*�@�@�@�@�@�@�F�@Shift   As Integer
'*********************************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
         Case vbKeyReturn   'Enter
            SendKeys "{TAB}" 'Tab�������ꂽ�������s��
         Case vbKeyF1   'F1
            Call cmdPFK_Click(1)
         Case vbKeyF2   'F2
            Call cmdPFK_Click(2)
         Case vbKeyF3   'F3
            Call cmdPFK_Click(3)
         Case vbKeyF4   'F4
            Call cmdPFK_Click(4)
         Case vbKeyF5   'F5
            Call cmdPFK_Click(5)
         Case vbKeyF6   'F6
            Call cmdPFK_Click(6)
         Case vbKeyF7   'F7
            Call cmdPFK_Click(7)
         Case vbKeyF8   'F8
            Call cmdPFK_Click(8)
         Case vbKeyF9   'F9
            Call cmdPFK_Click(9)
         Case vbKeyF10   'F10
            Call cmdPFK_Click(10)
         Case vbKeyF11   'F11
            Call cmdPFK_Click(11)
         Case vbKeyF12   'F12
            Call cmdPFK_Click(12)
    End Select

End Sub

'***********************************************************************************
'    FORM KEY PRESS �C�x���g
'***********************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ENTER Beep������
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

'*********************************************************************************************
'*�@�@�葱�����F�@̫�т�Load����ċL�q
'*�@�@���@���@�F�@�Ȃ�
'*********************************************************************************************
Private Sub Form_Load()
    
    '�X�e�[�^�X�o�[�ݒ�
    Call gsubInitStatusBar(stbSystem)
    
    '�t�H�[�����ݒ�
    Me.Caption = "�����ύX����" & " (" & gstrCommandLine(8) & ")"

    bInit_Flg = True          '���� FLG �I��

End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    '�r������
    Call gblnHaita_Unlock
    
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt070 = Nothing

End Sub
