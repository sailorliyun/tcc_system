VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt530 
   BorderStyle     =   1  '�Œ�(����)
   Caption         =   "�ݕt���c���\"
   ClientHeight    =   8580
   ClientLeft      =   495
   ClientTop       =   1515
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ���ް
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   Begin VB.OptionButton optKbn 
      Caption         =   "�Ј����[���c���\"
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
      Left            =   6120
      TabIndex        =   25
      Top             =   2520
      Width           =   2775
   End
   Begin VB.OptionButton optKbn 
      Caption         =   "�Ј����[���c���ٓ����X�g"
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
      Left            =   6120
      TabIndex        =   24
      Top             =   3105
      Width           =   2865
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
      Height          =   465
      Index           =   1
      Left            =   12960
      TabIndex        =   3
      Top             =   6630
      Width           =   1065
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
      Height          =   465
      Index           =   0
      Left            =   11790
      TabIndex        =   2
      Top             =   6630
      Width           =   1065
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  '�ׯ�
      ForeColor       =   &H80000008&
      Height          =   945
      Left            =   90
      TabIndex        =   20
      Top             =   30
      Width           =   14250
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   13650
         Top             =   270
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.TextBox txtSyuturyokuM 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   7717
         MaxLength       =   2
         TabIndex        =   1
         Top             =   360
         Width           =   330
      End
      Begin VB.TextBox txtSyuturyokuY 
         BeginProperty Font 
            Name            =   "�l�r �o�S�V�b�N"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   6907
         MaxLength       =   4
         TabIndex        =   0
         Top             =   360
         Width           =   525
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
         Left            =   7462
         TabIndex        =   23
         Top             =   435
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
         Left            =   8092
         TabIndex        =   22
         Top             =   435
         Width           =   180
      End
      Begin VB.Label Label2 
         Alignment       =   1  '�E����
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '����
         Caption         =   "�o�͔N��"
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
         Left            =   5265
         TabIndex        =   21
         Top             =   435
         Width           =   1560
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
      TabIndex        =   19
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
         TabIndex        =   4
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
         TabIndex        =   5
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
         TabIndex        =   9
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
         TabIndex        =   10
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
         Index           =   6
         Left            =   6045
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
         TabIndex        =   13
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
         TabIndex        =   14
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
         TabIndex        =   7
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
         TabIndex        =   8
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   7170
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
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '������
      Height          =   375
      Left            =   0
      TabIndex        =   16
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
            TextSave        =   "2021/03/30"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:07"
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
Attribute VB_Name = "frmQPAV_CEnt530"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'�X�V���t  �Č�/��Q�ԍ�      �C�����R
'20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
'                           �V�K�쐬
'20100716  1004091          �O���[�v�Ј��ݕt�̍����n�ɔ����V�X�e���Ή�
'                            �E�Ј����[���c�����v�\�o�͒ǉ�
'                            �E�Ј����[���c���ٓ����X�g�o�͒ǉ�
'----------------------------------------------------------------------------------------------

'*****************************************************************************************
'�e�t�@���N�V�����L�[�@�\
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
    Select Case Index
        Case 1  '���j���[
            Unload Me
            Exit Sub
        Case 2  '�n�[�h�R�s�[
            Call gsubQSAV_ActX1001

        Case 5  '���s
            blnRptToWindow = False
            Call subJikkou
        Case 10 '�O���
            Unload Me
            Exit Sub
        Case 12 '���
            Call subFormInitialize
    End Select
    
End Sub

'*****************************************************************************************
'  ����^�v���r���[�{�^��
'*****************************************************************************************
Private Sub cmdPrint_Click(Index As Integer)
    
    If Index = 0 Then
        blnRptToWindow = True
    Else
        blnRptToWindow = False
    End If
    
    Call subJikkou

End Sub

'*****************************************************************************************
'  ���[�o��
'*****************************************************************************************
Private Sub subJikkou()
    '���̓`�F�b�N
    If funcChk = False Then
        Exit Sub
    End If
    '�f�[�^����SP
    If funcSearch = False Then
        Exit Sub
    End If
    
    '�m�F
    If blnRptToWindow = True Then
        If MsgBox("�v���r���[���J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�V�O���[�v�Ј��ݕt�c���\") = vbCancel Then
            Exit Sub
        End If
    Else
        If MsgBox("������J�n���܂��B��낵���ł����H", vbQuestion + vbOKCancel, "�V�O���[�v�Ј��ݕt�c���\") = vbCancel Then
            Exit Sub
        End If
    End If
    
    '�o��SP
    If funcSetWorkTable = False Then
        Exit Sub
    End If
    
    '�N�����|
    If blnRptToWindow = True Then
    
        'MOD 20100716 1004091 IMZ NISHIKADO Start
        'Call subPrintReport1(crptToWindow)
        If optKbn(0).Value = True Then
            Call subPrintReport1(crptToWindow)          '�Ј����[���c���\
            Call subPrintReport2(crptToWindow)          '�Ј����[���c�����v�\
        Else
            Call subPrintReport3(crptToWindow, "1")     '�Ј����[���c���ٓ����X�g�i�]���j
            Call subPrintReport3(crptToWindow, "2")     '�Ј����[���c���ٓ����X�g�i�]�o�j
        End If
        'MOD 20100716 1004091 IMZ NISHIKADO End
        
    Else
        
        'MOD 20100716 1004091 IMZ NISHIKADO Start
        'Call subPrintReport1(crptToPrinter)
        If optKbn(0).Value = True Then
            Call subPrintReport1(crptToPrinter)          '�Ј����[���c���\
            Call subPrintReport2(crptToPrinter)          '�Ј����[���c�����v�\
        Else
            Call subPrintReport3(crptToPrinter, "1")     '�Ј����[���c���ٓ����X�g�i�]���j
            Call subPrintReport3(crptToPrinter, "2")     '�Ј����[���c���ٓ����X�g�i�]�o�j
        End If
        'MOD 20100716 1004091 IMZ NISHIKADO End
   
   End If
   
   'ADD 20100716 1004091 IMZ NISHIKADO Start
   '�G���[���e�N���A
   lblMsg.Caption = ""
   'ADD 20100716 1004091 IMZ NISHIKADO End

End Sub

'*************************************************************************************************
'*  ���̓`�F�b�N
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    '�o�͔N���̓`�F�b�N
    If Trim$(txtSyuturyokuY.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuY.Enabled = True
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    txtSyuturyokuY.Text = Format(txtSyuturyokuY.Text, "0000")
    
    '�o�͌����̓`�F�b�N
    If Trim$(txtSyuturyokuM.Text) = "" Then
        'Msg = �����͂���Ă��܂���B
        lblMsg.Caption = "WPOE01 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuM.Enabled = True
        txtSyuturyokuM.SetFocus
        Exit Function
    End If
    txtSyuturyokuM.Text = Format(txtSyuturyokuM.Text, "00")
            
    If Not IsDate(txtSyuturyokuY.Text & "," & txtSyuturyokuM.Text & ",01") Then
        'Msg = �͓��t�œ��͂��ĉ������B
        lblMsg.Caption = "WPOE03 �o�͔N��" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    
    '�����ȍ~��NG
    If Format(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "YYYY/MM") >= Format(gdatSysDate, "YYYY/MM") Then
        'Msg = �����ȍ~�̓��t�͓��͂ł��܂���B
        lblMsg.Caption = "WPOE48 " & gstrGetCodeMeisyo(odbDatabase, "E48", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
        
    funcChk = True

End Function

'*************************************************************************************************
'*  �f�[�^����SP�Ăяo��
'*************************************************************************************************
'*  �߂�l  True�F����
'*          False�F���s/0��
'*************************************************************************************************
Private Function funcSearch() As Boolean
    Dim strSQL               As String
    Dim strYMD               As String
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Dim strYMDZen            As String
    'ADD 20100716 1004091 IMZ NISHIKADO End

On Error GoTo errSPSet
    
    strYMD = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text + 1, 1)), "YYYYMMDD")

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    '�r�o
    With odbDatabase.Parameters
        '�������t
        .Add "InStrYMD", strYMD, ORAPARM_INPUT
        .Item("InStrYMD").ServerType = ORATYPE_CHAR
        
        'ADD 20100716 1004091 IMZ NISHIKADO Start
        '�������t�̑O������
        odbDatabase.Parameters.Add "InStrYMDZen", strYMDZen, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYMDZen").ServerType = ORATYPE_CHAR
        'ADD 20100716 1004091 IMZ NISHIKADO End
        
        '����������
        .Add "OtNumRecCount", 0, ORAPARM_OUTPUT
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    End With

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    If optKbn(0).Value = True Then
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
        '�r�p�k���̍쐬
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530Search ("
        strSQL = strSQL & ":InStrYMD,"
        strSQL = strSQL & ":OtNumRecCount"
        strSQL = strSQL & "); END;"

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Else    '�c���ٓ����X�g
        '�O������
        '�r�p�k���̍쐬
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SearchIdou ("
        strSQL = strSQL & ":InStrYMD,"
        strSQL = strSQL & ":InStrYMDZen,"
        strSQL = strSQL & ":OtNumRecCount"
        strSQL = strSQL & "); END;"
    End If
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    '�r�o�̎��s
    Call odbDatabase.DbexecuteSQL(strSQL)

    '���f�[�^������ZERO�̂Ƃ��̓G���[
    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        'Msg = �Y���f�[�^�����݂��܂���B
        frmQPAV_CEnt530.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        frmQPAV_CEnt530.txtSyuturyokuY.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    funcSearch = True
       
    Exit Function

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
End Function

'*************************************************************************************************
'*  ���[�N�e�[�u���Ƀf�[�^�o�^SP�Ăяo��
'*************************************************************************************************
'*  �߂�l  True�F����
'*          False�F���s
'*************************************************************************************************
Private Function funcSetWorkTable() As Boolean
    Dim strSQL               As String
    Dim strYMD               As String
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Dim strYMDZen            As String
    'ADD 20100716 1004091 IMZ NISHIKADO End

    funcSetWorkTable = False
On Error GoTo errSPSet

    strYMD = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text + 1, 1)), "YYYYMMDD")
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
    'ADD 20100716 1004091 IMZ NISHIKADO End

    '�r�o
    '�������t
    odbDatabase.Parameters.Add "InStrYMD", strYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    '�������t�̑O������
    odbDatabase.Parameters.Add "InStrYMDZen", strYMDZen, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMDZen").ServerType = ORATYPE_CHAR
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    '���[�U�[�h�c
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    If optKbn(0).Value = True Then
    'ADD 20100716 1004091 IMZ NISHIKADO End
        
        '�r�p�k���̍쐬
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SetWorkTable ("
        strSQL = strSQL & ":InStrYMD,:InStrUserID,:InStrComputerNM"
        strSQL = strSQL & "); END;"
        
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Else    '�c���ٓ����X�g
        '�O������
        strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
        '�r�p�k���̍쐬
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SetWorkTableIdou ("
        strSQL = strSQL & ":InStrYMD,:InStrYMDZen,:InStrUserID,:InStrComputerNM"
        strSQL = strSQL & "); END;"
    End If
    'ADD 20100716 1004091 IMZ NISHIKADO End

    '�r�o�̎��s
    Call odbDatabase.DbexecuteSQL(strSQL)

    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)

    funcSetWorkTable = True
       
    Exit Function

errSPSet:
'�G���[����

    '�G���[���b�Z�[�W�\��
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    '�I�u�W�F�N�g�̊J��
    Call gsubParaRemove(odbDatabase)
    
End Function

'**************************************************************************************************
'   Form_Activate�C�x���g:�Z�b�V�����̊m��
'                        :�f�[�^�x�[�X�m��
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        '�I���N���Z�b�V�����̊m��
        If Not gblnCreateOracleSession() Then
            '�V�X�e���G���[
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "�V�ݕt���c���\ (" & gstrCommandLine(8) & ") " _
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
                                    , "�V�ݕt���c���\ (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '�I��
            Unload Me
        End If
        
        '�T�[�o�[���t�擾
        Call gsubGetSysDate
        
        '��ʏ�����
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False

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
    
    Me.Caption = "�V�ݕt���c���\ (" & gstrCommandLine(8) & ")"
    
    '�X�e�[�^�X�o�[�ݒ�
    Call gsubInitStatusBar(stbSystem)
    
    '��ʏ�����
    blnLoadFlg = True

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

    '�g�p���[�N�e�[�u���S�폜
    Call subDelWorkTbl
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    '�Ј����[���c���ٓ����X�g�g�p���[�N�e�[�u���폜
    Call subDelWorkTblIdou
    'ADD 20100716 1004091 IMZ NISHIKADO End
  
    '�׸پ���݂̐ؒf
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt530 = Nothing
    
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyuturyokum_GotFocus()
    Call gsubSelectText(txtSyuturyokuM)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyuturyokum_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'* �t�H�[�J�X�擾���S�e�L�X�g�I��
'******************************************
Private Sub txtSyuturyokuY_GotFocus()
    Call gsubSelectText(txtSyuturyokuY)
End Sub

'******************************************
'*���͕�������i�����̂݁j
'******************************************
Private Sub txtSyuturyokuY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*�t�����E�o
'******************************************
Private Sub txtSyuturyokuY_Change()
    Call gsubMaxCharSkipEX(txtSyuturyokuY, 4)
End Sub

'****************************************
'*�G���[��������
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite

End Sub

'*************************************************************************************************
'* ��ʏ�����
'*************************************************************************************************
Private Sub subFormInitialize()

    txtSyuturyokuY.Text = ""
    txtSyuturyokuM.Text = ""

    '�G���[���b�Z�[�W���N���A
    lblMsg.Caption = ""
    
    txtSyuturyokuY.Enabled = True
    txtSyuturyokuM.Enabled = True
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite
    '�V�X�e�����̑O���ɐݒ�
    txtSyuturyokuY.Text = Format(DateAdd("m", -1, gdatSysDate), "yyyy")
    txtSyuturyokuM.Text = Format(DateAdd("m", -1, gdatSysDate), "MM")
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    optKbn(0).Value = True
    'ADD 20100716 1004091 IMZ NISHIKADO End

    
End Sub

'�N���X�^�����|�[�g
Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer

Dim strMm              As String


    
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt530.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB4_NEWZANDAKAW"
        
        '�p�����[�^���L�q����
'2021030013_�Ј����[���c���\ MOD START 20210330
'        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy�Nmm���x") & "'"
'2021030013_�Ј����[���c���\ MOD END 20210330
        
        '���o�������L�q����
        strSelectionFormula = "{QPB4_NEWZANDAKAW.QPB4_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB4_NEWZANDAKAW.QPB4_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�V�ݕt���c���\ (" & gstrCommandLine(8) & ")"

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

    strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530DelWorkTbl(" & _
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

'ADD 20100716 1004091 IMZ NISHIKADO Start
'�N���X�^�����|�[�g�i�Ј����[���c�����v�\�o�͏����j
Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String       '���o����
Dim strConectPoint      As String       '�A�N�Z�X�|�C���g
Dim intRet              As Integer      '���^�[���l

Dim strMm              As String        '�N��
  
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt531.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB4_NEWZANDAKAW"
        
        '�p�����[�^���L�q����
'2021030013_�Ј����[���c���\ MOD START 20210330
'        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy�Nmm���x") & "'"
'2021030013_�Ј����[���c���\ MOD END 20210330
        
        '���o�������L�q����
        strSelectionFormula = "{QPB4_NEWZANDAKAW.QPB4_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB4_NEWZANDAKAW.QPB4_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�V�ݕt���c���\ (" & gstrCommandLine(8) & ")"

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
    End With
    
End Sub

'�N���X�^�����|�[�g�i�Ј����[���c���ٓ����X�g�o�͏����j
Private Sub subPrintReport3(intDestinationConstants As DestinationConstants, strIdouKBN As String)

Dim strSelectionFormula As String       '���o����
Dim strConectPoint      As String       '�A�N�Z�X�|�C���g
Dim intRet              As Integer      '���^�[���l

Dim strMm              As String        '�N��
   
    '�A�N�Z�X����f�[�^�x�[�X�Ȃǂ��L�q
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        '�N���X�^�����|�[�g�̃t�@�C��������ꏊ���L�q����
        .ReportFileName = App.Path & "\QPAV_CEnt532.rpt"
        .DiscardSavedData = True

        '�L�q���ꂽ�A�N�Z�X�|�C���g�ɐڑ�
        .Connect = strConectPoint

        '���P�[�V�����̐ݒ�
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB7_ZNDKIDOUW"
        
        '�p�����[�^���L�q����
'2021030013_�Ј����[���c���\ MOD START 20210330
'        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee�Nmm���x") & "'"
        .Formulas(0) = "�N��='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy�Nmm���x") & "'"
'2021030013_�Ј����[���c���\ MOD END 20210330
        .Formulas(1) = "�ٓ��敪='" & strIdouKBN & "'"
        
        '���o�������L�q����
        strSelectionFormula = "{QPB7_ZNDKIDOUW.QPB7_IDOUKBN} = '" & strIdouKBN & "'" _
                       & " AND {QPB7_ZNDKIDOUW.QPB7_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB7_ZNDKIDOUW.QPB7_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '���o�������L�q����
        .SelectionFormula = strSelectionFormula
        
        '�o�͐�ݒ�
        .Destination = intDestinationConstants

        '�v���r���[�E�B���h�E�̐ݒ�
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "�V�ݕt���c���\ (" & gstrCommandLine(8) & ")"

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
    End With
    
End Sub

'****************************************************************************************
'* �Ј����[���c���ٓ����X�g�g�p���[�N�e�[�u���폜
'****************************************************************************************
Private Sub subDelWorkTblIdou()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    '���[�U�[�h�c
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    '�R���s���[�^��
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530DelWorkTblIdou(" & _
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

'ADD 20100716 1004091 IMZ NISHIKADO End


