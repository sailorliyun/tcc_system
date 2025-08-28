VERSION 5.00
Begin VB.Form frmQPAV_CEnt221 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "その他マスタメンテナンス"
   ClientHeight    =   5175
   ClientLeft      =   180
   ClientTop       =   1095
   ClientWidth     =   7500
   BeginProperty Font 
      Name            =   "ＭＳ ゴシック"
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
   PaletteMode     =   1  'Z ｵｰﾀﾞｰ
   ScaleHeight     =   5175
   ScaleWidth      =   7500
   StartUpPosition =   2  '画面の中央
   Begin VB.TextBox txtRiritu2 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      IMEMode         =   3  'ｵﾌ固定
      Left            =   3150
      MaxLength       =   2
      TabIndex        =   4
      Text            =   "99"
      Top             =   1890
      Width           =   435
   End
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
      Left            =   150
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   3630
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
      Left            =   5550
      TabIndex        =   9
      Top             =   4350
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
      Left            =   3090
      TabIndex        =   8
      Top             =   4350
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
      Left            =   810
      TabIndex        =   7
      Top             =   4350
      Width           =   1350
   End
   Begin VB.TextBox txtKyoutuNameKana 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   2  'ｵﾌ
      Left            =   2565
      TabIndex        =   2
      Top             =   1470
      Width           =   4095
   End
   Begin VB.TextBox txtKyoutuNameKanji 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      IMEMode         =   4  '全角ひらがな
      Left            =   2565
      TabIndex        =   1
      Top             =   1020
      Width           =   4095
   End
   Begin VB.TextBox txtRiritu1 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2565
      MaxLength       =   2
      TabIndex        =   3
      Text            =   "99"
      Top             =   1890
      Width           =   435
   End
   Begin VB.TextBox txtSyousyoGendogaku 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2565
      MaxLength       =   9
      TabIndex        =   5
      Top             =   2325
      Width           =   2250
   End
   Begin VB.TextBox txtKogutiGendogaku 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2565
      MaxLength       =   9
      TabIndex        =   6
      Top             =   2745
      Width           =   2250
   End
   Begin VB.TextBox txtKyoutuuCD 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2565
      MaxLength       =   10
      TabIndex        =   0
      Text            =   "5555555555"
      Top             =   585
      Width           =   1290
   End
   Begin VB.Label Label4 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   2
      Left            =   3630
      TabIndex        =   20
      Top             =   1980
      Width           =   120
   End
   Begin VB.Label Label4 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "."
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   1
      Left            =   3030
      TabIndex        =   19
      Top             =   2010
      Width           =   120
   End
   Begin VB.Label Label2 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "共通名称（Ｘ）"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   795
      TabIndex        =   15
      Top             =   1530
      Width           =   1575
   End
   Begin VB.Label Label3 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "共通名称（Ｎ）"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   795
      TabIndex        =   14
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Label Label4 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "利率"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
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
      Left            =   1725
      TabIndex        =   13
      Top             =   1965
      Width           =   450
   End
   Begin VB.Label Label5 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "証書限度額"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   1065
      TabIndex        =   12
      Top             =   2385
      Width           =   1125
   End
   Begin VB.Label Label6 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "小口限度額"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   1065
      TabIndex        =   11
      Top             =   2790
      Width           =   1125
   End
   Begin VB.Label Label1 
      Alignment       =   1  '右揃え
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "共通コード"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   285
      Index           =   0
      Left            =   360
      TabIndex        =   10
      Top             =   660
      Width           =   1860
   End
   Begin VB.Label Label7 
      BorderStyle     =   1  '実線
      Height          =   2985
      Left            =   150
      TabIndex        =   16
      Top             =   360
      Width           =   7155
   End
End
Attribute VB_Name = "frmQPAV_CEnt221"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Function Chk_err() As Boolean
'*****************************************************************************************
'  各項目の入力・桁数チェック
'*****************************************************************************************
    Chk_err = False
    
    If Chk_txt(txtKyoutuuCD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 共通コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    If Chk_txt(txtKyoutuNameKanji) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 共通名称（N)" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKyoutuNameKanji, 24) = False Then
            'Msg = の入力桁数がオーバーしました｡
            lblMsg.Caption = "WPOE04 共通名称（N)" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKyoutuNameKana) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 共通名称（X)" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKyoutuNameKana, 20) = False Then
            'Msg = の入力桁数がオーバーしました｡
            lblMsg.Caption = "WPOE04 共通名称（X)" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Trim(txtRiritu1.Text) = "" And Trim(txtRiritu2.Text) = "" Then
        txtRiritu1.Text = "0"
        txtRiritu2.Text = "00"
    Else
        If Chk_txt(txtRiritu1) = False Then
            'Msg = が入力されていません。
            lblMsg.Caption = "WPOE01 利率" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Function
        End If
        If Chk_txt(txtRiritu2) = False Then
            'Msg = が入力されていません。
            lblMsg.Caption = "WPOE01 利率" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Function
        End If
    End If
       
    If Trim(txtSyousyoGendogaku.Text) = "" Then
        txtSyousyoGendogaku.Text = "0"
    End If

    If Trim(txtKogutiGendogaku.Text) = "" Then
        txtKogutiGendogaku.Text = "0"
    End If

    Chk_err = True
End Function

Private Sub cmdtouroku_Click()
'*****************************************************************************************
'  登録・修正・削除処理
'*****************************************************************************************
    
    If cmdTouroku.Caption <> "削除" Then
        If Chk_err = False Then Exit Sub
    End If

    lblMsg.Caption = ""
    
    Select Case cmdTouroku.Caption
        Case "登録"
            If MsgBox("登録してよろしいですか？", vbQuestion + vbOKCancel, "その他マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPAdd = False Then Exit Sub
        Case "修正"
            If MsgBox("修正してよろしいですか？", vbQuestion + vbOKCancel, "その他マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPUpd = False Then Exit Sub
        Case "削除"
            If MsgBox("削除してよろしいですか？", vbQuestion + vbOKCancel, "その他マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPDel = False Then Exit Sub
    End Select
    Unload Me
    
End Sub

Private Sub cmdBack_Click()
'*****************************************************************************************
'  戻るボタン押下処理
'*****************************************************************************************
    UnlF = 1
    Unload Me
End Sub

Private Sub cmdTorikesi_Click()
'*****************************************************************************************
'   取消しボタン押下処理
'*****************************************************************************************
    Call subFormInitialize
    txtKyoutuuCD.SetFocus
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'   ENTERKEY押下処理
'*****************************************************************************************
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If
End Sub

Private Sub Form_Load()
'*****************************************************************************************
'   Formロード
'*****************************************************************************************
      
    '画面初期化
    Call subFormInitialize

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
    lblMsg.Caption = ""
End Sub

Private Sub subFormInitialize()
'*****************************************************************************************
'   画面初期化
'*****************************************************************************************
    Dim i As Integer
    Dim j As Integer
    
    txtKyoutuuCD.Text = ""
    txtKyoutuNameKanji.Text = ""
    txtKyoutuNameKana.Text = ""
    txtRiritu1.Text = ""
    txtRiritu2.Text = ""
    txtSyousyoGendogaku.Text = ""
    txtKogutiGendogaku.Text = ""
    
    txtKyoutuuCD.BackColor = vbWhite
    txtKyoutuNameKanji.BackColor = vbWhite
    txtKyoutuNameKana.BackColor = vbWhite
    txtRiritu1.BackColor = vbWhite
    txtRiritu2.BackColor = vbWhite
    txtSyousyoGendogaku.BackColor = vbWhite
    txtKogutiGendogaku.BackColor = vbWhite
    
    If ModeF <> "登録" Then
        txtKyoutuuCD.Text = gtblSonota(Act_Row).CD
        txtKyoutuNameKanji.Text = gtblSonota(Act_Row).NM_N
        txtKyoutuNameKana.Text = gtblSonota(Act_Row).NM_X
        i = InStr(Trim(gtblSonota(Act_Row).Riritu), ".")
        j = Len(Trim(gtblSonota(Act_Row).Riritu))
        
        If i = 0 Then
            txtRiritu1.Text = "0"
            txtRiritu2.Text = "00"
        ElseIf i = 1 Then
            txtRiritu1.Text = "0"
            txtRiritu2.Text = Mid(Trim(gtblSonota(Act_Row).Riritu), i + 1, j - i)
        Else
            txtRiritu1.Text = Left(Trim(gtblSonota(Act_Row).Riritu), i - 1)
            txtRiritu2.Text = Mid(Trim(gtblSonota(Act_Row).Riritu), i + 1, j - i)
        End If
        txtSyousyoGendogaku.Text = Format(Trim(gtblSonota(Act_Row).S_Gendo), "#,###,##0")
        txtKogutiGendogaku.Text = Format(Trim(gtblSonota(Act_Row).K_Gendo), "#,###,##0")
    End If
    
    If ModeF = "削除" Then
        txtKyoutuuCD.Enabled = False
        txtKyoutuNameKanji.Enabled = False
        txtKyoutuNameKana.Enabled = False
        txtRiritu1.Enabled = False
        txtRiritu2.Enabled = False
        txtSyousyoGendogaku.Enabled = False
        txtKogutiGendogaku.Enabled = False
        cmdTorikesi.Enabled = False
    Else
        txtKyoutuuCD.Enabled = True
        txtKyoutuNameKanji.Enabled = True
        txtKyoutuNameKana.Enabled = True
        txtRiritu1.Enabled = True
        txtRiritu2.Enabled = True
        txtSyousyoGendogaku.Enabled = True
        txtKogutiGendogaku.Enabled = True
        cmdTorikesi.Enabled = True
    End If
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   エラーメッセージボックスを表示する。
'*****************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("その他マスタメンテナンス", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt220.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'*****************************************************************************************
'   テキストエラー解除・フル脱出
'*****************************************************************************************
Private Sub txtKogutiGendogaku_Change()
    txtKogutiGendogaku.BackColor = vbWhite
End Sub

Private Sub txtKyoutuNameKana_Change()
    txtKyoutuNameKana.BackColor = vbWhite
End Sub

Private Sub txtKyoutuNameKanji_Change()
    txtKyoutuNameKanji.BackColor = vbWhite
End Sub

Private Sub txtKyoutuuCD_Change()
    Call gsubMaxCharSkipEX(txtKyoutuuCD, 10)
    txtKyoutuuCD.BackColor = vbWhite
End Sub

Private Sub txtRiritu2_Change()
    txtRiritu2.BackColor = vbWhite
End Sub

Private Sub txtSyousyoGendogaku_Change()
    txtSyousyoGendogaku.BackColor = vbWhite
End Sub

'*****************************************************************************************
'   フォーカス取得時全テキスト選択
'*****************************************************************************************
Private Sub txtKyoutuuCD_GotFocus()
    Call gsubSelectText(txtKyoutuuCD)
End Sub

Private Sub txtKyoutuNameKana_GotFocus()
    Call gsubSelectText(txtKyoutuNameKana)
End Sub

Private Sub txtKyoutuNameKanji_GotFocus()
    Call gsubSelectText(txtKyoutuNameKanji)
End Sub

Private Sub txtRiritu1_Change()
    Call gsubMaxCharSkipEX(txtRiritu1, 2)
    txtRiritu1.BackColor = vbWhite
End Sub

Private Sub txtRiritu1_GotFocus()
    Call gsubSelectText(txtRiritu1)
End Sub

Private Sub txtRiritu2_GotFocus()
    Call gsubSelectText(txtRiritu2)
End Sub

Private Sub txtSyousyoGendogaku_GotFocus()
    Call gsubSelectText(txtSyousyoGendogaku)
End Sub

Private Sub txtKogutiGendogaku_GotFocus()
    Call gsubSelectText(txtKogutiGendogaku)
End Sub

'*****************************************************************************************
'   入力文字制御（数字のみ）
'*****************************************************************************************
Private Sub txtRiritu1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtRiritu2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSyousyoGendogaku_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKogutiGendogaku_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKyoutuuCD_KeyPress(KeyAscii As Integer)
''    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

