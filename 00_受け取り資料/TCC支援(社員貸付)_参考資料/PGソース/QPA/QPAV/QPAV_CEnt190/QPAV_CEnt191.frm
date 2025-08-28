VERSION 5.00
Begin VB.Form frmQPAV_CEnt191 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "店マスタメンテナンス"
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
      Left            =   120
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   3780
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
         TabIndex        =   28
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
      Left            =   5520
      TabIndex        =   11
      Top             =   4440
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
      Left            =   3060
      TabIndex        =   10
      Top             =   4440
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
      TabIndex        =   9
      Top             =   4440
      Width           =   1350
   End
   Begin VB.TextBox txtMiseCD 
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
      Left            =   2580
      MaxLength       =   3
      TabIndex        =   0
      Top             =   600
      Width           =   585
   End
   Begin VB.TextBox txtMiseName 
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
      IMEMode         =   4  '全角ひらがな
      Left            =   2580
      TabIndex        =   1
      Top             =   1050
      Width           =   4335
   End
   Begin VB.TextBox txtSyouyoSIkyuuMM1 
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
      TabIndex        =   2
      Text            =   "55"
      Top             =   1515
      Width           =   405
   End
   Begin VB.TextBox txtSyouyoSIkyuuMM2 
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
      MaxLength       =   2
      TabIndex        =   4
      Top             =   1980
      Width           =   420
   End
   Begin VB.ComboBox cobTouzaiHigasi 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "QPAV_CEnt191.frx":0000
      Left            =   2580
      List            =   "QPAV_CEnt191.frx":0002
      Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
      TabIndex        =   7
      Top             =   2895
      Width           =   540
   End
   Begin VB.ComboBox cobTouzaiNisi 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "QPAV_CEnt191.frx":0004
      Left            =   4905
      List            =   "QPAV_CEnt191.frx":0006
      Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
      TabIndex        =   8
      Top             =   2910
      Width           =   540
   End
   Begin VB.TextBox txtSyouyoSIkyuuDD1 
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
      Left            =   3345
      MaxLength       =   2
      TabIndex        =   3
      Top             =   1545
      Width           =   405
   End
   Begin VB.TextBox txtSyouyoSIkyuuDD2 
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
      Left            =   3345
      MaxLength       =   2
      TabIndex        =   5
      Top             =   1980
      Width           =   420
   End
   Begin VB.ComboBox cobSeisantenCD 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "QPAV_CEnt191.frx":0008
      Left            =   2565
      List            =   "QPAV_CEnt191.frx":000A
      Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
      TabIndex        =   6
      Top             =   2400
      Width           =   735
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
      Height          =   225
      Index           =   0
      Left            =   1110
      TabIndex        =   25
      Top             =   645
      Width           =   1020
   End
   Begin VB.Label Label2 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "店名称（漢字）"
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
      Left            =   705
      TabIndex        =   24
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Label Label3 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "賞与支給日付１"
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
      Left            =   615
      TabIndex        =   23
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label Label4 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "賞与支給日付２"
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
      Left            =   615
      TabIndex        =   22
      Top             =   2010
      Width           =   1575
   End
   Begin VB.Label Label5 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "精算店コード"
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
      Left            =   810
      TabIndex        =   21
      Top             =   2475
      Width           =   1350
   End
   Begin VB.Label Label6 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "東西区分（東）"
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
      Left            =   705
      TabIndex        =   20
      Top             =   2970
      Width           =   1575
   End
   Begin VB.Label Label7 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "（西）"
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
      Left            =   4035
      TabIndex        =   19
      Top             =   2970
      Width           =   795
   End
   Begin VB.Label Label8 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "日"
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
      Left            =   3840
      TabIndex        =   18
      Top             =   2040
      Width           =   195
   End
   Begin VB.Label Label9 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "日"
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
      Left            =   3810
      TabIndex        =   17
      Top             =   1575
      Width           =   225
   End
   Begin VB.Label Label10 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "月"
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
      Left            =   3060
      TabIndex        =   16
      Top             =   2040
      Width           =   195
   End
   Begin VB.Label Label11 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "月"
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
      Left            =   3030
      TabIndex        =   15
      Top             =   1575
      Width           =   225
   End
   Begin VB.Label lblSeisantenCD 
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "ああああああああああ"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   3405
      TabIndex        =   14
      Top             =   2445
      Width           =   2250
   End
   Begin VB.Label lblTouzaiKbnEst 
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "あ"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   3225
      TabIndex        =   13
      Top             =   2970
      Width           =   225
   End
   Begin VB.Label lblTouzaiKbnWst 
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "あ"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   5550
      TabIndex        =   12
      Top             =   2970
      Width           =   225
   End
   Begin VB.Label Label12 
      BorderStyle     =   1  '実線
      Height          =   3285
      Left            =   120
      TabIndex        =   26
      Top             =   330
      Width           =   7185
   End
End
Attribute VB_Name = "frmQPAV_CEnt191"
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
    
    If Chk_txt(txtMiseCD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 店コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt2(txtMiseCD, 3) = False Then
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 店コードは３" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtMiseName) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 店名称" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtMiseName, 24) = False Then
            'Msg = の入力桁数がオーバーしました｡
            lblMsg.Caption = "WPOE04 店名称" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    

    If Chk_txt(txtSyouyoSIkyuuMM1) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 賞与支給日付１" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSyouyoSIkyuuMM1.Text = Format(txtSyouyoSIkyuuMM1.Text, "00")
    
    If Chk_txt(txtSyouyoSIkyuuDD1) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 賞与支給日付１" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSyouyoSIkyuuDD1.Text = Format(txtSyouyoSIkyuuDD1.Text, "00")
    
    If IsDate(Format(gdatSysDate, "yyyy") & "/" & txtSyouyoSIkyuuMM1.Text & "/" & txtSyouyoSIkyuuDD1.Text) = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 賞与支給日付１" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSyouyoSIkyuuMM1.BackColor = vbRed
        txtSyouyoSIkyuuDD1.BackColor = vbRed
        txtSyouyoSIkyuuMM1.SetFocus
        Exit Function
    End If
    
    If Chk_txt(txtSyouyoSIkyuuMM2) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 賞与支給日付２" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSyouyoSIkyuuMM2.Text = Format(txtSyouyoSIkyuuMM2.Text, "00")
    
    If Chk_txt(txtSyouyoSIkyuuDD2) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 賞与支給日付２" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSyouyoSIkyuuDD2.Text = Format(txtSyouyoSIkyuuDD2.Text, "00")
    
    If IsDate(Format(gdatSysDate, "yyyy") & "/" & txtSyouyoSIkyuuMM2.Text & "/" & txtSyouyoSIkyuuDD2.Text) = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 賞与支給日付２" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSyouyoSIkyuuMM2.BackColor = vbRed
        txtSyouyoSIkyuuDD2.BackColor = vbRed
        txtSyouyoSIkyuuMM2.SetFocus
        Exit Function
    End If
    
    If Trim$(cobSeisantenCD.Text) = "" Then
        'Msg = 精算店コードが選択されていません。
        lblMsg.Caption = "WPOE28 " & gstrGetCodeMeisyo(odbDatabase, "E28", "WPO")
        cobSeisantenCD.SetFocus
        Exit Function
    End If
        
    Chk_err = True

End Function

Private Sub cmdTouroku_Click()
'*****************************************************************************************
'  登録・修正・削除処理
'*****************************************************************************************
    
    If cmdTouroku.Caption <> "削除" Then
        If Chk_err = False Then Exit Sub
    End If
    
    lblMsg.Caption = ""
    
    Select Case cmdTouroku.Caption
        Case "登録"
            If MsgBox("登録してよろしいですか？", vbQuestion + vbOKCancel, "店マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPAdd = False Then Exit Sub
        Case "修正"
            If MsgBox("修正してよろしいですか？", vbQuestion + vbOKCancel, "店マスタメンテナンス") = vbCancel Then
                Exit Sub
            End If
            If gsubSPUpd = False Then Exit Sub
        Case "削除"
            If MsgBox("削除してよろしいですか？", vbQuestion + vbOKCancel, "店マスタメンテナンス") = vbCancel Then
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
    
    '店コード
    txtMiseCD.Text = SelData(0)
    
    '店名称
    txtMiseName.Text = SelData(1)
    
    '賞与支給日1
    If SelData(2) = "" Then
        txtSyouyoSIkyuuMM1.Text = ""
        txtSyouyoSIkyuuDD1.Text = ""
    Else
        txtSyouyoSIkyuuMM1.Text = Left(SelData(2), 2)
        txtSyouyoSIkyuuDD1.Text = Mid(SelData(2), 4, 2)
    End If
    
    '賞与支給日2
    If SelData(3) = "" Then
        txtSyouyoSIkyuuMM2.Text = ""
        txtSyouyoSIkyuuDD2.Text = ""
    Else
        txtSyouyoSIkyuuMM2.Text = Left(SelData(3), 2)
        txtSyouyoSIkyuuDD2.Text = Mid(SelData(3), 4, 2)
    End If
    
    '精算店コード
    If SelData(4) = "" Then
        cobSeisantenCD.ListIndex = -1
    Else
        cobSeisantenCD.ListIndex = SelData(4)
    End If
    
    '東西区分
''------->【Win2000対応】Del by Yokoyama@NBC 2004/07/12 ------->
''    cobTouzaiHigasi.ListIndex = SelData(5)
''    cobTouzaiNisi.ListIndex = SelData(6)
''<-------【Win2000対応】Del by Yokoyama@NBC 2004/07/12 <-------
''------->【Win2000対応】Add by Yokoyama@NBC 2004/07/12 ------->
    If SelData(5) = "" Then
        cobTouzaiHigasi.ListIndex = -1
    Else
        cobTouzaiHigasi.ListIndex = SelData(5)
    End If
    If SelData(6) = "" Then
        cobTouzaiNisi.ListIndex = -1
    Else
        cobTouzaiNisi.ListIndex = SelData(6)
    End If
''<-------【Win2000対応】Add by Yokoyama@NBC 2004/07/12 <-------

    lblMsg.Caption = ""
    txtMiseCD.SetFocus
End Sub

Private Sub cobTouzaiHigasi_Click()
'*****************************************************************************************
'   東西区分（東） 変更
'*****************************************************************************************
    Select Case cobTouzaiHigasi.ListIndex
        Case -1, 0
            lblTouzaiKbnEst.Caption = ""
        Case 1
            lblTouzaiKbnEst.Caption = "東"
    End Select
End Sub

Private Sub cobTouzaiNisi_Click()
'*****************************************************************************************
'   東西区分（西） 変更
'*****************************************************************************************
    Select Case cobTouzaiNisi.ListIndex
        Case -1, 0
            lblTouzaiKbnWst.Caption = ""
        Case 1
            lblTouzaiKbnWst.Caption = "西"
    End Select
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'   ENTERKEY押下処理
'*****************************************************************************************
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If
End Sub

'*****************************************************************************************
'   Formロード
'*****************************************************************************************
Private Sub Form_Load()
    
    Me.Caption = "店マスタメンテナンス (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    Call subFormInitialize
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
    lblMsg.Caption = ""
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
End Sub
 
Private Sub subFormInitialize()
'*****************************************************************************************
'   画面初期化
'*****************************************************************************************
    Dim i As Integer
    Dim MaxCNT  As Long
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    '各表示項目クリア
    With cobTouzaiHigasi
        .Clear
        .AddItem "0"
        .AddItem "1"
    End With
    
    With cobTouzaiNisi
        .Clear
        .AddItem "0"
        .AddItem "2"
    End With
    cobTouzaiHigasi.ListIndex = -1
    cobTouzaiNisi.ListIndex = -1
    
    '精算店コード
    Call gsubSeisanCD_get
    
    '画面の初期化
    txtMiseCD.Text = ""
    txtMiseName.Text = ""
    txtSyouyoSIkyuuMM1.Text = ""
    txtSyouyoSIkyuuDD1.Text = ""
    txtSyouyoSIkyuuMM2.Text = ""
    txtSyouyoSIkyuuDD2.Text = ""
    lblSeisantenCD.Caption = ""
    lblTouzaiKbnEst = ""
    lblTouzaiKbnWst = ""
    
    For i = 0 To 6
        SelData(i) = ""
    Next i
        
    If Mode_FLG <> "登録" Then
        '画面にデータをセットする

        '店コード
        txtMiseCD.Text = Trim(gtblMise(Act_Row).CD)
        SelData(0) = Trim(gtblMise(Act_Row).CD)
        '店名称
        txtMiseName.Text = gtblMise(Act_Row).NM
        SelData(1) = gtblMise(Act_Row).NM
        '賞与支給日1
        txtSyouyoSIkyuuMM1.Text = Left(Trim(gtblMise(Act_Row).Syoyo1), 2)
        txtSyouyoSIkyuuDD1.Text = Mid(Trim(gtblMise(Act_Row).Syoyo1), 4, 2)
        SelData(2) = Trim(gtblMise(Act_Row).Syoyo1)
        '賞与支給日2
        txtSyouyoSIkyuuMM2.Text = Left(Trim(gtblMise(Act_Row).Syoyo2), 2)
        txtSyouyoSIkyuuDD2.Text = Mid(Trim(gtblMise(Act_Row).Syoyo2), 4, 2)
        SelData(3) = Trim(gtblMise(Act_Row).Syoyo2)
        '精算店コード
        If Trim(gtblMise(Act_Row).SeisanCD) = "" Then
            cobSeisantenCD.ListIndex = -1
            lblSeisantenCD.Caption = ""
        Else
            MaxCNT = cobSeisantenCD.ListCount
            i = 1
            Do Until i = MaxCNT
                If Trim(gtblSeisan(i).CD) = Trim(gtblMise(Act_Row).SeisanCD) Then
                    Exit Do
                End If
                i = i + 1
            Loop
            If i = MaxCNT Then
                cobSeisantenCD.ListIndex = -1
                lblSeisantenCD.Caption = ""
            Else
                cobSeisantenCD.ListIndex = i - 1
                SelData(4) = i - 1
            End If
        End If
        '東西区分
        If Trim(gtblMise(Act_Row).TozaiE) = "" Then
            cobTouzaiHigasi.ListIndex = -1
        Else
            cobTouzaiHigasi.ListIndex = Trim(gtblMise(Act_Row).TozaiE)
        End If
        SelData(5) = cobTouzaiHigasi.ListIndex
        
        If Trim(gtblMise(Act_Row).TozaiW) = "" Then
            cobTouzaiNisi.ListIndex = -1
        ElseIf Trim(gtblMise(Act_Row).TozaiW) = "0" Then
            cobTouzaiNisi.ListIndex = 0
        Else
            cobTouzaiNisi.ListIndex = 1
        End If
        SelData(6) = cobTouzaiNisi.ListIndex
    End If

    Select Case Mode_FLG
        Case "削除"
            txtMiseCD.Enabled = False
            txtMiseName.Enabled = False
            txtSyouyoSIkyuuMM1.Enabled = False
            txtSyouyoSIkyuuDD1.Enabled = False
            txtSyouyoSIkyuuMM2.Enabled = False
            txtSyouyoSIkyuuDD2.Enabled = False
            cobSeisantenCD.Enabled = False
            cobTouzaiHigasi.Enabled = False
            cobTouzaiNisi.Enabled = False
            cmdTorikesi.Enabled = False
        Case Else
            txtMiseCD.Enabled = True
            txtMiseName.Enabled = True
            txtSyouyoSIkyuuMM1.Enabled = True
            txtSyouyoSIkyuuDD1.Enabled = True
            txtSyouyoSIkyuuMM2.Enabled = True
            txtSyouyoSIkyuuDD2.Enabled = True
            cobSeisantenCD.Enabled = True
            cobTouzaiHigasi.Enabled = True
            cobTouzaiNisi.Enabled = True
            cmdTorikesi.Enabled = True
    End Select
    cmdTouroku.Caption = Mode_FLG
    
End Sub

Private Sub cobSeisantenCD_Click()
'*****************************************************************************************
'   店コード 変更
'*****************************************************************************************
    Dim i As Long
    
    i = cobSeisantenCD.ListIndex
    If i = -1 Then
        lblSeisantenCD.Caption = ""
    Else
        lblSeisantenCD.Caption = gtblSeisan(i + 1).NM
    End If
End Sub

'*******************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("店マスタメンテナンス", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt190.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'*******************************************************************************
'   テキストのエラー解除
'*******************************************************************************
Private Sub cobTouzaiNisi_Change()
    cobTouzaiNisi.BackColor = vbWhite
End Sub

Private Sub cobTouzaiHigasi_Change()
    cobTouzaiHigasi.BackColor = vbWhite
End Sub

Private Sub cobSeisantenCD_Change()
    cobSeisantenCD.BackColor = vbWhite
End Sub

Private Sub txtMiseCD_Change()
    Call gsubMaxCharSkipEX(txtMiseCD, 3)
    txtMiseCD.BackColor = vbWhite
End Sub

Private Sub txtMiseName_Change()
    txtMiseName.BackColor = vbWhite
End Sub

Private Sub txtSyouyoSIkyuuDD1_Change()
    Call gsubMaxCharSkipEX(txtSyouyoSIkyuuDD1, 2)
    txtSyouyoSIkyuuMM1.BackColor = vbWhite
    txtSyouyoSIkyuuDD1.BackColor = vbWhite
End Sub

Private Sub txtSyouyoSIkyuuDD2_Change()
    Call gsubMaxCharSkipEX(txtSyouyoSIkyuuDD2, 2)
    txtSyouyoSIkyuuMM2.BackColor = vbWhite
    txtSyouyoSIkyuuDD2.BackColor = vbWhite
End Sub

Private Sub txtSyouyoSIkyuuMM1_Change()
    Call gsubMaxCharSkipEX(txtSyouyoSIkyuuMM1, 2)
    txtSyouyoSIkyuuMM1.BackColor = vbWhite
    txtSyouyoSIkyuuDD1.BackColor = vbWhite
End Sub

Private Sub txtSyouyoSIkyuuMM2_Change()
    Call gsubMaxCharSkipEX(txtSyouyoSIkyuuMM2, 2)
    txtSyouyoSIkyuuMM2.BackColor = vbWhite
    txtSyouyoSIkyuuDD2.BackColor = vbWhite
End Sub

'*******************************************************************************
'   フォーカス取得時全テキスト選択
'*******************************************************************************
Private Sub txtMiseCD_GotFocus()
    Call gsubSelectText(txtMiseCD)
End Sub

Private Sub txtMiseName_GotFocus()
    Call gsubSelectText(txtMiseName)
End Sub

Private Sub txtSyouyoSIkyuuMM1_GotFocus()
    Call gsubSelectText(txtSyouyoSIkyuuMM1)
End Sub

Private Sub txtSyouyoSIkyuuDD1_GotFocus()
    Call gsubSelectText(txtSyouyoSIkyuuDD1)
End Sub


Private Sub txtSyouyoSIkyuuMM2_GotFocus()
    Call gsubSelectText(txtSyouyoSIkyuuMM2)
End Sub

Private Sub txtSyouyoSIkyuuDD2_GotFocus()
    Call gsubSelectText(txtSyouyoSIkyuuDD2)
End Sub

'*******************************************************************************
'   入力文字制御（数字のみ）
'*******************************************************************************
Private Sub txtMiseCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSyouyoSIkyuuMM1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSyouyoSIkyuuDD1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSyouyoSIkyuuMM2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSyouyoSIkyuuDD2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

