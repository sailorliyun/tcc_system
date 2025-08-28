VERSION 5.00
Begin VB.Form frmQPAV_CEnt311 
   BorderStyle     =   3  '固定ﾀﾞｲｱﾛｸﾞ
   Caption         =   "小口貸付データ登録"
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
   StartUpPosition =   2  '画面の中央
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
         TabIndex        =   21
         Top             =   60
         Width           =   9375
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "戻る"
      Height          =   615
      Left            =   8640
      TabIndex        =   7
      Top             =   4200
      Width           =   1335
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "実行"
      Height          =   615
      Left            =   6960
      TabIndex        =   6
      Top             =   4200
      Width           =   1335
   End
   Begin VB.TextBox txtMoney 
      Alignment       =   1  '右揃え
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
         Name            =   "ＭＳ Ｐゴシック"
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
         Name            =   "ＭＳ Ｐゴシック"
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
         Name            =   "ＭＳ Ｐゴシック"
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
         Name            =   "ＭＳ Ｐゴシック"
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
         Name            =   "ＭＳ Ｐゴシック"
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
      Alignment       =   2  '中央揃え
      Caption         =   "分"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      Alignment       =   2  '中央揃え
      Caption         =   "時"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      Alignment       =   2  '中央揃え
      Caption         =   "日"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      Alignment       =   2  '中央揃え
      Caption         =   "月"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      Alignment       =   2  '中央揃え
      Caption         =   "年"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "富士通  太郎"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "1234567"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "貸付金額"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "貸付時間"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "貸付日"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "社員氏名"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
      BackStyle       =   0  '透明
      Caption         =   "社員番号"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
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
'*戻るボタン押下
'**************************************************************************************************
Private Sub cmdCancel_Click()
    Unload Me
End Sub
'**************************************************************************************************
'*実行ボタン押下
'**************************************************************************************************
Private Sub cmdExec_Click()
    Dim TxtDate             As Date             '貸付日付
    Dim strStCheck          As String           '休職開始ﾁｪｯｸ
    Dim strEdCheck          As String           '休職終了ﾁｪｯｸ
    Dim intMsg              As Integer          'ﾒｯｾｰｼﾞ番号
    Dim lngRecCnt           As Long             '手動履歴Tﾃﾞｰﾀ検索数
    Dim intErrNo            As Integer          'ｴﾗｰ番号
    
    Call subErrKaijo
    
    '初期化
    lblMsg.Caption = ""
    strStCheck = ""
    strEdCheck = ""
    intMsg = 0
    
    Select Case gintExecNo
    Case 0      '追加
        '*****テキストチェック
        Call TextCheck(intErrNo)
                
        If intErrNo <> gintERR_OK Then
            
            Select Case intErrNo
            Case gintERR_DATE
                'Msg = 入力項目が誤っています。
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtYear)
                Exit Sub
            
            Case gintERR_MIRAI_DATE
                'Msg = 未来日の入力は出来ません。
                lblMsg.Caption = "WYOE07 " & gstrGetCodeMeisyo(odbDatabase, "E07", "WYO")
                Call subErrSet(txtYear)
                Exit Sub
            
            Case gintERR_TIME
                'Msg = 入力項目が誤っています。
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtHour)
                Exit Sub
            
            Case gintERR_KINGAKU
                'Msg = 入力項目が誤っています。
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                Call subErrSet(txtMoney)
                Exit Sub
            End Select
        End If
        
        '*****貸付日付設定
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
        
        '*****貸付時間設定
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
        
        '*****貸付金額設定
        gstrKingaku = Format(txtMoney, "0")
        
        '*****小口貸付T既存チェック
        If gfuncKgcKasitukeTChk(lngRecCnt, 0) = False Then Exit Sub
        
        If lngRecCnt = 1 Then
            'Msg = は既に登録されてます。
            lblMsg.Caption = "WPOE02 データ" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
            txtYear.BackColor = vbRed
            txtYear.Enabled = True
            txtYear.SetFocus
            Exit Sub
        End If
        
        TxtDate = CDate(txtYear.Text & "/" & txtMonth.Text & "/" & txtDay.Text)
        
        '*****退職チェック
        If gtblSyainM.TaisyokuYMD = "" Then
        Else
            '日付チェック
            strStCheck = DateDiff("d", CDate(gtblSyainM.TaisyokuYMD), TxtDate)
            If CLng(strStCheck) > 0 Then
                'Msg = 入力項目が誤っています。
                lblMsg.Caption = "WYOE06 " & gstrGetCodeMeisyo(odbDatabase, "E06", "WYO")
                txtYear.BackColor = vbRed
                txtYear.Enabled = True
                txtYear.SetFocus
                Exit Sub
            End If
        End If
        
        '*****休職チェック
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
                    
        '休職開始日～休職終了日
        If strStCheck <> "" And strEdCheck <> "" Then
            If CLng(strStCheck) >= 0 And CLng(strEdCheck) <= 0 Then
                intMsg = 1
            End If
        '休職開始日～
        ElseIf strStCheck <> "" And strEdCheck = "" Then
            If CLng(strStCheck) >= 0 Then
                intMsg = 1
            End If
            
        '～休職終了日
        ElseIf strStCheck = "" And strEdCheck <> "" Then
            If CLng(strEdCheck) <= 0 Then
                intMsg = 1
            End If
        End If
        
        Select Case intMsg
        Case 0
            If MsgBox("貸付金額を登録します。よろしいですか？", _
                            vbQuestion + vbOKCancel, "小口貸付データ登録") = vbCancel Then
                Exit Sub
            End If
        Case 1
            If MsgBox("この社員は休職中ですが、当処理を実行してもよろしいですか？", _
                            vbQuestion + vbOKCancel, "小口貸付データ登録") = vbCancel Then
                Exit Sub
            End If
        End Select
            
        '*****データ追加処理
        If gfuncSPIns = True Then
            gblnDataSetFlg = True
        Else
            gblnDataSetFlg = False
        End If
    
    
    Case 1      '削除
        If MsgBox("貸付金額を削除します。よろしいですか？", _
                        vbQuestion + vbOKCancel, "小口貸付データ削除") = vbCancel Then
            Exit Sub
        Else
        
            '*****データ削除処理
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
    
    '*****初期設定
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
        Me.Caption = "小口貸付データ登録"
        cmdExec.Caption = "登録"
        txtYear.SetFocus
    
    Case 1
        Me.Caption = "小口貸付データ削除"
        cmdExec.Caption = "削除"
        txtYear.Enabled = False
        txtMonth.Enabled = False
        txtDay.Enabled = False
        txtHour.Enabled = False
        txtMinute.Enabled = False
        txtMoney.Enabled = False
    End Select
    
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtYear_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtDay_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtHour_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtMinute_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtMoney_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*テキストキー押下
'**************************************************************************************************
Private Sub txtMonth_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        SendKeys ("{TAB}")
    End If
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtYear_GotFocus()
    Call gsubSelectText(txtYear)
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtMonth_GotFocus()
    Call gsubSelectText(txtMonth)
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtDay_GotFocus()
    Call gsubSelectText(txtDay)
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtHour_GotFocus()
    Call gsubSelectText(txtHour)
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtMinute_GotFocus()
    Call gsubSelectText(txtMinute)
End Sub
'**************************************************************************************************
'*フォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtMoney_GotFocus()
    Call gsubSelectText(txtMoney)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtYear_Change()
    Call gsubMaxCharSkipEX(txtYear, 4)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtMonth_Change()
    Call gsubMaxCharSkipEX(txtMonth, 2)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtDay_Change()
    Call gsubMaxCharSkipEX(txtDay, 2)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtHour_Change()
    Call gsubMaxCharSkipEX(txtHour, 2)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtMinute_Change()
    Call gsubMaxCharSkipEX(txtMinute, 2)
End Sub
'**************************************************************************************************
'*テキストボックスイベント
'**************************************************************************************************
Private Sub txtMoney_Change()
    With txtMoney
        .Text = Format(.Text, "####,###")
        .SelStart = Len(.Text)
    End With
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtYear_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtMonth_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtDay_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtHour_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtMinute_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'**************************************************************************************************
'*入力文字制御（数字のみ）
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
'*テキストボックス入力チェック
'**************************************************************************************************
Private Sub TextCheck(ByRef intErrNo As Integer)
    Dim strEndDay           As String           '末日

    intErrNo = gintERR_OK
    '*****日付入力チェック
    If Len(Trim(txtYear.Text)) < 4 Then       '年
        intErrNo = gintERR_DATE
        Exit Sub
    End If

    If Trim(txtMonth.Text) = "" Then          '月
        intErrNo = gintERR_DATE
        Exit Sub

    Else
        If CLng(Trim(txtMonth.Text)) > 12 Or CLng(Trim(txtMonth.Text)) < 1 Then
            intErrNo = gintERR_DATE
            Exit Sub
        End If
    End If
    
    If Trim(txtDay.Text) = "" Or CLng(Trim(txtDay.Text)) = 0 Then             '日
        intErrNo = gintERR_DATE
        Exit Sub
    Else
        '末日取得
        strEndDay = CStr(DateSerial(CLng(txtYear.Text), CLng(txtMonth.Text) + 1, 1) - 1)
        If CLng(txtDay.Text) > CLng(Right(strEndDay, 2)) Then
            intErrNo = gintERR_DATE
            Exit Sub
        End If
    
    End If
        
    '*****過去未来日付チェック
    intErrNo = DateCheckNo(txtYear.Text & "/" & txtMonth.Text & "/" & txtDay.Text)
    If intErrNo <> gintERR_OK Then
        Exit Sub
    End If
    
    '*****時間入力チェック
    If Trim(txtHour.Text) = "" Then           '時
        intErrNo = gintERR_TIME
        Exit Sub
    ElseIf CLng(txtHour.Text) > 23 Then
        intErrNo = gintERR_TIME
        Exit Sub
    End If
    
    If Trim(txtMinute.Text) = "" Then         '分
        intErrNo = gintERR_TIME
        Exit Sub
    ElseIf CLng(txtMinute.Text) > 59 Then
        intErrNo = gintERR_TIME
        Exit Sub
    End If

    '*****金額入力チェック
    If Trim(txtMoney.Text) = "" Then
        intErrNo = gintERR_KINGAKU
        Exit Sub
    End If
        
End Sub
'**************************************************************************************************
'*エラー設定処理
'**************************************************************************************************
Private Sub subErrSet(ByVal objTxtBox As TextBox)
    With objTxtBox
        .BackColor = vbRed
        .Enabled = True
        .SetFocus
    End With
End Sub
'**************************************************************************************************
'*エラー解除処理
'**************************************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    txtYear.BackColor = vbWhite
    txtHour.BackColor = vbWhite
    txtMoney.BackColor = vbWhite
End Sub

