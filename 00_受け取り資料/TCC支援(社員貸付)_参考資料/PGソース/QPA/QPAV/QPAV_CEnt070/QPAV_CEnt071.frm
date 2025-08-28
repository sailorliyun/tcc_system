VERSION 5.00
Begin VB.Form frmQPAV_CEnt071 
   Caption         =   "利率変更"
   ClientHeight    =   5145
   ClientLeft      =   60
   ClientTop       =   315
   ClientWidth     =   7470
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   5145
   ScaleWidth      =   7470
   StartUpPosition =   2  '画面の中央
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   3150
      Width           =   7155
      Begin VB.Label lblMsg 
         BackStyle       =   0  '透明
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         Top             =   30
         Width           =   7095
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "戻る"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   5490
      TabIndex        =   7
      Top             =   4230
      Width           =   1350
   End
   Begin VB.CommandButton cmdTorikesi 
      Caption         =   "取消"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   3030
      TabIndex        =   6
      Top             =   4230
      Width           =   1350
   End
   Begin VB.CommandButton cmdTouroku 
      Caption         =   "登録"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   750
      TabIndex        =   5
      Top             =   4230
      Width           =   1350
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "登録"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   14.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   210
      TabIndex        =   8
      Top             =   6000
      Width           =   1350
   End
   Begin VB.TextBox txtRiritu1 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2700
      MaxLength       =   2
      TabIndex        =   3
      Top             =   2055
      Width           =   390
   End
   Begin VB.TextBox txtHenkouY 
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2670
      MaxLength       =   4
      TabIndex        =   0
      Top             =   1320
      Width           =   615
   End
   Begin VB.TextBox txtHenkouMM 
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   3660
      MaxLength       =   2
      TabIndex        =   1
      Top             =   1320
      Width           =   390
   End
   Begin VB.TextBox txtHenkouDD 
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   4380
      MaxLength       =   2
      TabIndex        =   2
      Top             =   1320
      Width           =   390
   End
   Begin VB.TextBox txtRiritu2 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   3300
      MaxLength       =   2
      TabIndex        =   4
      Top             =   2055
      Width           =   390
   End
   Begin VB.Label Label6 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "変更日"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   1635
      TabIndex        =   15
      Top             =   1410
      Width           =   675
   End
   Begin VB.Label Label13 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "利率"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   1815
      TabIndex        =   14
      Top             =   2130
      Width           =   450
   End
   Begin VB.Label Label20 
      Alignment       =   2  '中央揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "年"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      Left            =   3330
      TabIndex        =   13
      Top             =   1410
      Width           =   255
   End
   Begin VB.Label Label3 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "月"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   4095
      TabIndex        =   12
      Top             =   1410
      Width           =   225
   End
   Begin VB.Label Label16 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "日～"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   4830
      TabIndex        =   11
      Top             =   1410
      Width           =   450
   End
   Begin VB.Label Label23 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "．"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   3165
      TabIndex        =   10
      Top             =   2220
      Width           =   180
   End
   Begin VB.Label Label29 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "％"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   3810
      TabIndex        =   9
      Top             =   2160
      Width           =   240
   End
   Begin VB.Label lblLabel 
      BorderStyle     =   1  '実線
      BeginProperty Font 
         Name            =   "ＭＳ Ｐ明朝"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   2460
      Index           =   13
      Left            =   150
      TabIndex        =   16
      Top             =   570
      Width           =   7140
   End
End
Attribute VB_Name = "frmQPAV_CEnt071"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBack_Click()
    Unload Me
End Sub

Private Sub cmdTorikesi_Click()
    Dim i As Long
    
    If cmdTouroku.Caption = "登録" Then
        txtHenkouY.Text = ""
        txtHenkouMM.Text = ""
        txtHenkouDD.Text = ""
        txtRiritu1.Text = ""
        txtRiritu2.Text = ""
    ElseIf cmdTouroku.Caption = "修正" Then
        txtHenkouY.Text = Left(gVarSpdGetText(frmQPAV_CEnt070.sprList, 1, Actv_flg), 4)
        txtHenkouMM.Text = Mid(gVarSpdGetText(frmQPAV_CEnt070.sprList, 1, Actv_flg), 6, 2)
        txtHenkouDD.Text = Right(gVarSpdGetText(frmQPAV_CEnt070.sprList, 1, Actv_flg), 2)
        i = InStr(gVarSpdGetText(frmQPAV_CEnt070.sprList, 2, Actv_flg), ".")
        txtRiritu1.Text = Left(gVarSpdGetText(frmQPAV_CEnt070.sprList, 2, Actv_flg), i - 1)
        txtRiritu2.Text = Mid(gVarSpdGetText(frmQPAV_CEnt070.sprList, 2, Actv_flg), i + 1, 2)
    End If
    txtHenkouY.SetFocus
End Sub

Private Function Chk_All() As Boolean

    Dim i As Integer
    Dim ShoriYMD As Variant
    
    Chk_All = False
    
    '変更年
    If Trim(txtHenkouY.Text) = "" Then
        lblMsg.Caption = "変更年が未入力です。"
        txtHenkouY.BackColor = vbRed
        txtHenkouY.SetFocus
        Exit Function
    End If
    txtHenkouY.Text = Format(txtHenkouY.Text, "0000")
    
    '変更月
    If Trim(txtHenkouMM.Text) = "" Then
        lblMsg.Caption = "変更月が未入力です。"
        txtHenkouMM.BackColor = vbRed
        txtHenkouMM.SetFocus
        Exit Function
    End If
    txtHenkouMM.Text = Format(txtHenkouMM.Text, "00")
    
    '変更日
    If Trim(txtHenkouDD.Text) = "" Then
        lblMsg.Caption = "変更日が未入力です。"
        txtHenkouDD.BackColor = vbRed
        txtHenkouDD.SetFocus
        Exit Function
    End If
    txtHenkouDD.Text = Format(txtHenkouDD.Text, "00")
    
    If Not IsDate(txtHenkouY.Text & "," & txtHenkouMM.Text & "," & txtHenkouDD.Text) Then
        lblMsg.Caption = "変更日は日付で入力して下さい。"
        txtHenkouY.BackColor = vbRed
        txtHenkouMM.BackColor = vbRed
        txtHenkouDD.BackColor = vbRed
        txtHenkouY.SetFocus
        Exit Function
    End If
    
    ShoriYMD = CVDate(Format$(txtHenkouY.Text, "0000") & "/" & Format$(txtHenkouMM.Text, "00") & "/" & Format$(txtHenkouDD.Text, "00"))
    
    If DateDiff("y", ShoriYMD, gdatSysDate) > 0 Then
        lblMsg.Caption = "過去日付の入力はできません。"
        txtHenkouY.BackColor = vbRed
        txtHenkouMM.BackColor = vbRed
        txtHenkouDD.BackColor = vbRed
        txtHenkouY.SetFocus
        Exit Function
    End If
    
    '利率（整数部）
    If Trim(txtRiritu1.Text) = "" Then
        lblMsg.Caption = "利率が未入力です。"
        txtRiritu1.BackColor = vbRed
        txtRiritu1.SetFocus
        Exit Function
    End If
    
    '利率（小数部）
    If Trim(txtRiritu2.Text) = "" Then
        lblMsg.Caption = "利率が未入力です。"
        txtRiritu2.BackColor = vbRed
        txtRiritu2.SetFocus
        Exit Function
    End If
    txtRiritu2.Text = Format(txtRiritu2.Text, "00")
    
    Chk_All = True
    
End Function

Private Sub cmdTouroku_Click()
    
    '削除以外のときは、入力チェックを行う。
    If cmdTouroku.Caption <> "削除" Then
        If Chk_All = False Then
            Exit Sub
        End If
    End If
    
    lblMsg.Caption = ""
    
    '変数に退避
    gstrHenkoYMD_B = Format(gVarSpdGetText(frmQPAV_CEnt070.sprList, 1, Actv_flg), "yyyymmdd")
    gstrHenkoYMD = Format(txtHenkouY, "0000") & Format(txtHenkouMM, "00") & Format(txtHenkouDD, "00")
    gdblRiritu = Format(txtRiritu1 & "." & txtRiritu2, "#.00")
    
    Select Case cmdTouroku.Caption
        Case "登録"
            If gfuncSPChk = False Then
                lblMsg.Caption = "この変更年月は既に登録されています。"
                txtHenkouY.BackColor = vbRed
                txtHenkouMM.BackColor = vbRed
                txtHenkouDD.BackColor = vbRed
                txtHenkouY.SetFocus
                Exit Sub
            End If
            If MsgBox("登録してよろしいですか？", vbQuestion + vbOKCancel, "利率変更") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPAdd = False Then Exit Sub
        Case "修正"
            If gstrHenkoYMD <> gstrHenkoYMD_B Then
                If gfuncSPChk = False Then
                    lblMsg.Caption = "この変更年月は既に登録されています。"
                    txtHenkouY.BackColor = vbRed
                    txtHenkouMM.BackColor = vbRed
                    txtHenkouDD.BackColor = vbRed
                    txtHenkouY.SetFocus
                    Exit Sub
                End If
            End If
            If MsgBox("修正してよろしいですか？", vbQuestion + vbOKCancel, "利率変更") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPUpd = False Then Exit Sub
        Case "削除"
            If MsgBox("削除してよろしいですか？", vbQuestion + vbOKCancel, "利率変更") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPDel = False Then Exit Sub
    End Select
    Unload Me
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyReturn Then  'Enter
        SendKeys "{TAB}"
    End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
    
    txtHenkouY.BackColor = vbWhite
    txtHenkouMM.BackColor = vbWhite
    txtHenkouDD.BackColor = vbWhite
    txtRiritu1.BackColor = vbWhite
    txtRiritu2.BackColor = vbWhite
    lblMsg.Caption = ""
    
End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtHenkouY_GotFocus()
    Call gsubSelectText(txtHenkouY)
End Sub
Private Sub txtHenkoumm_GotFocus()
    Call gsubSelectText(txtHenkouMM)
End Sub
Private Sub txtHenkouDD_GotFocus()
    Call gsubSelectText(txtHenkouDD)
End Sub
Private Sub txtriritu1_GotFocus()
    Call gsubSelectText(txtRiritu1)
End Sub
Private Sub txtriritu2_GotFocus()
    Call gsubSelectText(txtRiritu2)
End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txthenkouy_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txthenkoumm_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txthenkoudd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txtriritu1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
Private Sub txtriritu2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*フル桁脱出
'******************************************
Private Sub txthenkouy_Change()
    Call gsubMaxCharSkipEX(txtHenkouY, 4)
End Sub
Private Sub txthenkoumm_Change()
    Call gsubMaxCharSkipEX(txtHenkouMM, 2)
End Sub
Private Sub txthenkoudd_Change()
    Call gsubMaxCharSkipEX(txtHenkouDD, 2)
End Sub
Private Sub txtriritu1_Change()
    Call gsubMaxCharSkipEX(txtRiritu1, 2)
End Sub
Private Sub txtriritu2_Change()
    Call gsubMaxCharSkipEX(txtRiritu2, 2)
End Sub

