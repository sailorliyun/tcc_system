VERSION 5.00
Begin VB.Form frmQPAV_CEnt201 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "部門マスタメンテナンス"
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
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   3390
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
         Left            =   90
         TabIndex        =   12
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
      TabIndex        =   4
      Top             =   4410
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
      TabIndex        =   3
      Top             =   4410
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
      TabIndex        =   2
      Top             =   4410
      Width           =   1350
   End
   Begin VB.TextBox txtBumonMeisyou 
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
      Left            =   2805
      TabIndex        =   1
      Top             =   2280
      Width           =   3405
   End
   Begin VB.TextBox txtBumonCD 
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
      Left            =   2805
      TabIndex        =   0
      Text            =   "023106"
      Top             =   1740
      Width           =   945
   End
   Begin VB.Label lblMiseCD 
      Caption         =   "本店"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Index           =   1
      Left            =   3510
      TabIndex        =   10
      Top             =   1320
      Width           =   3375
   End
   Begin VB.Label lblMiseCD 
      Caption         =   "030"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Index           =   0
      Left            =   2880
      TabIndex        =   9
      Top             =   1320
      Width           =   465
   End
   Begin VB.Label Label2 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "部門名称"
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
      Left            =   1470
      TabIndex        =   7
      Top             =   2355
      Width           =   900
   End
   Begin VB.Label Label1 
      Alignment       =   1  '右揃え
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "店コード"
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
      Left            =   510
      TabIndex        =   6
      Top             =   1305
      Width           =   1920
   End
   Begin VB.Label Label3 
      Alignment       =   1  '右揃え
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "部門コード"
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
      Left            =   510
      TabIndex        =   5
      Top             =   1815
      Width           =   1920
   End
   Begin VB.Label Label4 
      BorderStyle     =   1  '実線
      Height          =   2625
      Left            =   150
      TabIndex        =   8
      Top             =   630
      Width           =   7155
   End
End
Attribute VB_Name = "frmQPAV_CEnt201"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBack_Click()
'*****************************************************************************************
'   戻るボタン押下処理
'*****************************************************************************************
    UnlF = 1
    Unload Me
End Sub

Private Sub cmdTorikesi_Click()
'*****************************************************************************************
'   取消しボタン押下処理
'*****************************************************************************************
    Call subForminitialize
    txtBumonCD.SetFocus
End Sub

Private Function Chk_err() As Boolean
'*****************************************************************************************
'  各項目の入力・桁数チェック
'*****************************************************************************************
    Chk_err = False
    
    If Chk_txt(txtBumonCD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 部門コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtBumonCD, 6) = False Then
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 部門コードは６" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtBumonMeisyou) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 部門名称" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtBumonMeisyou, 24) = False Then
            'Msg = の入力桁数がオーバーしました｡
            lblMsg.Caption = "WPOE04 部門名称" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function       '【Win2000対応】Add by Yokoyama@NBC 2004/07/21
        End If
    End If

    Chk_err = True

End Function

Private Sub cmdTouroku_Click()
'*****************************************************************************************
'   登録・修正・削除ボタン押下処理
'*****************************************************************************************
    Dim i As Long
    
    If Chk_err = False Then Exit Sub

    Select Case cmdTouroku.Caption
        Case "登録"
            If MsgBox("登録してよろしいですか？", vbQuestion + vbOKCancel, "部門マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPAdd = False Then Exit Sub
        Case "修正"
            If MsgBox("修正してよろしいですか？", vbQuestion + vbOKCancel, "部門マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPUpd = False Then Exit Sub
        Case "削除"
            If MsgBox("削除してよろしいですか？", vbQuestion + vbOKCancel, "部門マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPDel = False Then Exit Sub
    End Select
    Unload Me
End Sub

Private Sub subForminitialize()
'*****************************************************************************************
'   画面初期化
'*****************************************************************************************
    If ModeF = "登録" Then
        txtBumonCD.Text = ""
        txtBumonMeisyou.Text = ""
    Else
        txtBumonCD.Text = gtblBumon(Act_Row).CD
        txtBumonMeisyou.Text = gtblBumon(Act_Row).NM
    End If
    
    If ModeF = "削除" Then
        txtBumonCD.Enabled = False
        txtBumonMeisyou.Enabled = False
        cmdTorikesi.Enabled = False
    Else
        txtBumonCD.Enabled = True
        txtBumonMeisyou.Enabled = True
        cmdTorikesi.Enabled = True
    End If
    
    lblMsg.Caption = ""
End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   エラーメッセージボックスを表示する。
'*****************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("部門マスタメンテナンス", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt200.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'  ENTERKEY押下処理
'*****************************************************************************************
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    lblMsg.Caption = ""
End Sub

Private Sub Form_Load()
'*****************************************************************************************
'   フォーム表示
'*****************************************************************************************
    Call subForminitialize
End Sub

Private Sub txtBumonMeisyou_Change()
    txtBumonMeisyou.BackColor = vbWhite
End Sub

Private Sub txtBumonCD_Change()
'*******************************************************************************************
'   テキストフル脱出
'*******************************************************************************************
    Call gsubMaxCharSkipEX(txtBumonCD, 6)
    txtBumonCD.BackColor = vbWhite
End Sub

'*******************************************************************************************
'   フォーカス取得時全テキスト選択
'*******************************************************************************************
Private Sub txtbumonCD_GotFocus()
    Call gsubSelectText(txtBumonCD)
End Sub

Private Sub txtbumonmeisyou_GotFocus()
    Call gsubSelectText(txtBumonMeisyou)
End Sub

Private Sub txtBumonCD_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   入力文字制御（数字のみ）
'*****************************************************************************************
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub



