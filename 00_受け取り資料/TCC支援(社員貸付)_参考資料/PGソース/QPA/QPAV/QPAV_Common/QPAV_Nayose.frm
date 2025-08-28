VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form QPAV_Nayose 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "名寄せ入力"
   ClientHeight    =   7920
   ClientLeft      =   585
   ClientTop       =   1500
   ClientWidth     =   14385
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form5"
   ScaleHeight     =   7920
   ScaleWidth      =   14385
   Begin VB.PictureBox picPfMenu 
      Align           =   2  '下揃え
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
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
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   6990
      Width           =   14385
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:取消"
         Height          =   375
         Index           =   12
         Left            =   13140
         TabIndex        =   14
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:前画面"
         Height          =   375
         Index           =   10
         Left            =   10755
         TabIndex        =   12
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   11
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:実行"
         Height          =   375
         Index           =   5
         Left            =   4830
         TabIndex        =   7
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ﾊｰﾄﾞｺﾋﾟｰ"
         Height          =   375
         Index           =   2
         Left            =   1245
         TabIndex        =   4
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
         Height          =   375
         Index           =   1
         Left            =   60
         TabIndex        =   3
         Top             =   90
         Width           =   1155
      End
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "決定"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   6090
      Width           =   1125
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5130
      Left            =   90
      TabIndex        =   20
      Top             =   900
      Width           =   14250
      Begin FPSpread.vaSpread sprList 
         Height          =   4665
         Left            =   420
         TabIndex        =   1
         Top             =   270
         Width           =   13455
         _Version        =   196608
         _ExtentX        =   23733
         _ExtentY        =   8229
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   8
         MaxRows         =   20
         OperationMode   =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_Nayose.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   810
      Left            =   90
      TabIndex        =   18
      Top             =   60
      Width           =   14250
      Begin VB.TextBox txtKaiinKanaMei 
         BackColor       =   &H00FFFFFF&
         Height          =   270
         IMEMode         =   6  '半角ｶﾀｶﾅ
         Left            =   5220
         MaxLength       =   30
         TabIndex        =   0
         Top             =   300
         Width           =   3330
      End
      Begin VB.Label lblLabel 
         Alignment       =   2  '中央揃え
         AutoSize        =   -1  'True
         Caption         =   "社員氏名（カナ）"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   2
         Left            =   3570
         TabIndex        =   19
         Top             =   345
         Width           =   1245
      End
   End
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      Height          =   405
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14205
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   6540
      Width           =   14265
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
         Left            =   30
         TabIndex        =   17
         Top             =   30
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   345
      Left            =   0
      TabIndex        =   15
      Top             =   7575
      Width           =   14385
      _ExtentX        =   25374
      _ExtentY        =   609
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
            Text            =   "ＷＷＷＷＷＷＷ"
            TextSave        =   "ＷＷＷＷＷＷＷ"
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
            TextSave        =   "2009/04/25"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "19:18"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "QPAV_Nayose"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click()
'*****************************************************************************************
'   決定キー押下
'*****************************************************************************************

    lblMsg.Caption = ""
    
    gstrDat = gVarSpdGetText(sprList, 1, sprList.ActiveRow)
    Unload Me

End Sub

Private Sub cmdPFK_Click(Index As Integer)
'*****************************************************************************************
'   各ファンクションキー機能
'*****************************************************************************************
    
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
'        Case 1  'メニュー
'            Unload Me
        Case 2  'ハードコピー
'DEL 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
'           Call gsubQSAV_ActX1001
'--Start Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
            'ハードコピー用DLL呼出処理に画面キャプションをパラメータとして追加
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            
            Set clsActX1001 = Nothing
'--Finish Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
        
        Case 5  '実行
            Call subCmdJikkou
        Case 10 '前画面
            Unload Me
        Case 12 '取消
            Call subFormInitialize
            txtKaiinKanaMei.SetFocus
    End Select
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'   FORM_KEYDOWN ファンクションキー設定
'*****************************************************************************************
    
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
        Case vbKeyDelete    'DELキーを押した時
            Call Form_KeyPress(46)
    End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtKaiinKanaMei.BackColor = vbWhite
    
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

Private Sub Form_Load()
'*****************************************************************************************
'   Formロード
'*****************************************************************************************

'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    
    Me.Caption = "名寄せ検索 (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    Call subFormInitialize
    
'-- Start Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    '操作制限画面判定処理
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
'-- Finish Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    
    
End Sub

Private Sub sprList_DblClick(ByVal Col As Long, ByVal Row As Long)
    
    lblMsg.Caption = ""
    
    gstrDat = gVarSpdGetText(sprList, 1, Row)
    Unload Me

End Sub

Private Sub txtKaiinKanaMei_GotFocus()
'*****************************************************************************************
'   フォーカス取得時全テキスト選択
'*****************************************************************************************
    
    Call gsubSelectText(txtKaiinKanaMei)

End Sub

Private Sub subCmdJikkou()
'*****************************************************************************************
'   実行ボタン処理
'*****************************************************************************************
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    
    If txtKaiinKanaMei.Text = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 社員氏名（カナ）" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtKaiinKanaMei.BackColor = vbRed
        txtKaiinKanaMei.Enabled = True
        txtKaiinKanaMei.SetFocus
        Exit Sub
    End If
    
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
    
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
        
    If gsubSPInit = False Then
        'Msg = 該当データが存在しません。
        lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        cmdPFK(5).Enabled = True
        txtKaiinKanaMei.Enabled = True
        txtKaiinKanaMei.SetFocus
        GoTo exit_d
    End If
    
    cmdExec.Enabled = True
    
    txtKaiinKanaMei.Enabled = False
    
exit_d:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
        
End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   エラーメッセージボックスを表示する。
'*****************************************************************************************

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("名寄せ入力", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              QPAV_Nayose.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub subFormInitialize()
'*****************************************************************************************
'   画面初期化
'*****************************************************************************************
 
    '各表示項目クリア
    txtKaiinKanaMei.Text = ""
    txtKaiinKanaMei.BackColor = vbWhite
    sprList.MaxRows = 0
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    cmdPFK(5).Enabled = True
    cmdExec.Enabled = False
    
    'Spred Sheetの初期化
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '各コントロール制御
    txtKaiinKanaMei.Enabled = True

End Sub



