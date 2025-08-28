VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt210 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "社員マスタメンテナンス"
   ClientHeight    =   8700
   ClientLeft      =   180
   ClientTop       =   1095
   ClientWidth     =   14385
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
   ScaleHeight     =   8700
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdExec 
      Caption         =   "登録"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   0
      Left            =   5190
      TabIndex        =   6
      Top             =   6630
      Width           =   1035
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "修正"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   1
      Left            =   6660
      TabIndex        =   7
      Top             =   6630
      Width           =   1035
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "削除"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   2
      Left            =   8190
      TabIndex        =   8
      Top             =   6630
      Width           =   1035
   End
   Begin VB.Frame fra_Joken 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   90
      TabIndex        =   26
      Top             =   -30
      Width           =   14175
      Begin VB.TextBox txtSyainCD 
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2580
         MaxLength       =   7
         TabIndex        =   0
         Text            =   "9999999"
         Top             =   240
         Width           =   855
      End
      Begin VB.ComboBox cboTaikyuKBN 
         Height          =   315
         ItemData        =   "QPAV_CEnt210.frx":0000
         Left            =   6420
         List            =   "QPAV_CEnt210.frx":0002
         Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
         TabIndex        =   4
         Top             =   750
         Width           =   1035
      End
      Begin VB.TextBox txtBumonCD 
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   10770
         MaxLength       =   6
         TabIndex        =   2
         Text            =   "999999"
         Top             =   210
         Width           =   765
      End
      Begin VB.TextBox txtSeisanCD 
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2580
         MaxLength       =   3
         TabIndex        =   3
         Text            =   "999"
         Top             =   750
         Width           =   435
      End
      Begin VB.TextBox txtMiseCD 
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   6420
         MaxLength       =   3
         TabIndex        =   1
         Text            =   "999"
         Top             =   210
         Width           =   465
      End
      Begin VB.Label Label1 
         Caption         =   "退職/休職区分"
         Height          =   255
         Index           =   4
         Left            =   4860
         TabIndex        =   31
         Top             =   810
         Width           =   1395
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         Caption         =   "精算店コード"
         Height          =   255
         Index           =   3
         Left            =   1080
         TabIndex        =   30
         Top             =   810
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         Caption         =   "所属部門コード"
         Height          =   255
         Index           =   2
         Left            =   9120
         TabIndex        =   29
         Top             =   270
         Width           =   1485
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         Caption         =   "所属店コード"
         Height          =   255
         Index           =   1
         Left            =   4980
         TabIndex        =   28
         Top             =   270
         Width           =   1275
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         Caption         =   "社員コード"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   1440
         TabIndex        =   27
         Top             =   270
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   6045
      Left            =   90
      TabIndex        =   25
      Top             =   1170
      Width           =   14175
      Begin FPSpread.vaSpread vaSpread1 
         Height          =   4995
         Left            =   0
         TabIndex        =   5
         Top             =   240
         Width           =   13875
         _Version        =   196608
         _ExtentX        =   24474
         _ExtentY        =   8811
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
         MaxCols         =   16
         MaxRows         =   30
         OperationMode   =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt210.frx":0004
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
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
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   7740
      Width           =   14385
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F1:ﾒﾆｭ-"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   9
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ﾊｰﾄﾞｺﾋﾟｰ"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   1249
         TabIndex        =   10
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   2438
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   3627
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:実行"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   5
         Left            =   4816
         TabIndex        =   11
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   6005
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   7194
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   8383
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   9572
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:前画面"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   10
         Left            =   10761
         TabIndex        =   12
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         Left            =   11950
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:取消"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
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
         TabIndex        =   13
         Top             =   90
         Width           =   1155
      End
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
      Left            =   45
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   7245
      Width           =   14280
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
         TabIndex        =   23
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   21
      Top             =   8325
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
            Text            =   "富士通　太郎"
            TextSave        =   "富士通　太郎"
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
            TextSave        =   "2014/01/30"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "16:05"
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
Attribute VB_Name = "frmQPAV_CEnt210"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click(Index As Integer)
'*******************************************************************************************
'   登録・修正・削除ボタン押下処理
'*******************************************************************************************
    Dim i As Integer
        
    lblMsg.Caption = ""
    Act_Row = vaSpread1.ActiveRow
    UnlF = 0
    ModeF = cmdExec(Index).Caption
    Me.Enabled = False              'タブ移動制御
    frmQPAV_CEnt211.cmdTouroku.Caption = cmdExec(Index).Caption
    frmQPAV_CEnt211.Show 1
    Me.Enabled = True

    'データ再表示
    If UnlF <> 1 Then
        'ステータスバーメッセージ
        stbSystem.Panels.Item(1).Text = "処理中．．．"
        MousePointer = vbHourglass
        
        If gsubSPInit = True Then
            For i = 0 To 2
                cmdExec(i).Enabled = True
            Next i
        Else
            cmdExec(0).Enabled = True
            For i = 1 To 2
                cmdExec(i).Enabled = False
            Next i
            vaSpread1.MaxRows = 0
        End If
    
        stbSystem.Panels.Item(1).Text = ""
        MousePointer = vbDefault
    End If

End Sub

Private Sub Form_Load()
'*******************************************************************************************
'   Formロード
'*******************************************************************************************
        
    Me.Caption = "社員マスタメンテナンス (" & gstrCommandLine(8) & ")"
    bInit_Flg = True
    
    '画面初期化
    Call subFormInitialize
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
'*******************************************************************************************
'   Form Unload
'*******************************************************************************************
    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt210 = Nothing

End Sub

Private Sub Form_Activate()
'*******************************************************************************************
'   Form_Activateイベント:セッションの確立
'                　　　　:データベース確立
'*******************************************************************************************
    Dim ret  As Boolean
    
    If bInit_Flg = True Then
        MousePointer = vbHourglass
        Me.Enabled = False
                
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "社員マスタメンテナンス (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'オラクルデータベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "社員マスタメンテナンス (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
            
        Me.Enabled = True
        MousePointer = vbDefault
        
        '排他解除
        Call gblnHaita_Unlock
        
        '排他制御
        If gblnHaita_Lock = False Then
            fra_Joken.Enabled = False
            cmdPFK(5).Enabled = False
            Exit Sub
        End If
    
        bInit_Flg = False          '初期 FLG オフ
    End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*******************************************************************************************
'   FORM_KEYDOWN ファンクションキー設定
'*******************************************************************************************
    
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
            If cmdPFK(5).Enabled = True Then
                Call cmdPFK_Click(12)
            End If
        Case vbKeyDelete    'DELキーを押した時
            Call Form_KeyPress(46)
    End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*******************************************************************************************
'   FORM_KEYPRESS
'*******************************************************************************************
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

Private Sub cmdPFK_Click(Index As Integer)
'*******************************************************************************************
'   各ファンクションキー機能
'*******************************************************************************************
    
    Select Case Index
        Case 1  'メニュー
            Unload Me
        Case 2  'ハードコピー
            Call gsubQSAV_ActX1001
        Case 5  '実行
            Call subCmdJikkou
        Case 10 '前画面
            Unload Me
        Case 12 '取消
            Call subFormInitialize
            txtSyainCD.SetFocus
    End Select
    
End Sub

Private Sub subFormInitialize()
'*******************************************************************************************
'   画面初期化
'*******************************************************************************************
    Dim i As Integer
    
    lblMsg.Caption = ""
    
    'Spred Sheetの初期化
    vaSpread1.MaxRows = 0
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    txtSyainCD.Enabled = True
    txtMiseCD.Enabled = True
    txtBumonCD.Enabled = True
    txtSeisanCD.Enabled = True
    cboTaikyuKBN.Enabled = True
    
    txtSyainCD.Text = ""
    txtMiseCD.Text = ""
    txtBumonCD.Text = ""
    txtSeisanCD.Text = ""
    
    With cboTaikyuKBN
        .Clear
        .AddItem "退職"
        .AddItem "休職"
        .AddItem "退休職"
    End With
    cboTaikyuKBN.ListIndex = -1
    
    For i = 0 To 2
        cmdExec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    cmdPFK(12).Enabled = False
    
End Sub

Private Sub subCmdJikkou()
'*******************************************************************************************
'   実行ボタン処理
'*******************************************************************************************
    Dim i As Integer

    '条件が入力されていなかったらエラー
    If Trim(txtSyainCD.Text) = "" And Trim(txtMiseCD.Text) = "" Then
        If Trim(txtBumonCD.Text) = "" And Trim(txtSeisanCD.Text) = "" Then
            If Trim(cboTaikyuKBN.Text) = "" Then
                lblMsg.Caption = "WPOE01 抽出条件" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
                txtSyainCD.SetFocus
                Exit Sub
            End If
        End If
    End If
    
    '条件入力チェック
    If Chk_err = False Then
        Exit Sub
    End If
        
    txtSyainCD.Enabled = False
    txtMiseCD.Enabled = False
    txtBumonCD.Enabled = False
    txtSeisanCD.Enabled = False
    cboTaikyuKBN.Enabled = False
    cmdPFK(5).Enabled = False
    cmdPFK(12).Enabled = True

    MousePointer = vbHourglass
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"

    If gsubSPInit = True Then
        For i = 0 To 2
            cmdExec(i).Enabled = True
        Next i
    Else
        cmdExec(0).Enabled = True
        For i = 1 To 2
            cmdExec(i).Enabled = False
        Next i
        vaSpread1.MaxRows = 0
    End If
    stbSystem.Panels.Item(1).Text = ""
    MousePointer = vbDefault
    
End Sub

Private Function Chk_err() As Boolean
'*******************************************************************************************
'   抽出条件入力チェック
'*******************************************************************************************
    Chk_err = False
    
    If Trim(txtSyainCD) <> "" Then
        If LenB(StrConv(txtSyainCD, vbFromUnicode)) <> 7 Then
            txtSyainCD.BackColor = vbRed
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 社員コードは７" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            txtSyainCD.SetFocus
            Exit Function
        End If
    End If
    
    If Trim(txtMiseCD.Text) <> "" Then
        If LenB(StrConv(txtMiseCD, vbFromUnicode)) <> 3 Then
            txtMiseCD.BackColor = vbRed
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 所属店コードは３" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            txtMiseCD.SetFocus
            Exit Function
        End If
    End If
    
    If Trim(txtBumonCD.Text) <> "" Then
        If LenB(StrConv(txtBumonCD, vbFromUnicode)) <> 6 Then
            txtBumonCD.BackColor = vbRed
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 所属部門コードは６" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            txtBumonCD.SetFocus
            Exit Function
        End If
    End If
    
    If Trim(txtSeisanCD.Text) <> "" Then
        If LenB(StrConv(txtSeisanCD, vbFromUnicode)) <> 3 Then
            txtSeisanCD.BackColor = vbRed
            'Msg = 桁で入力してください。
            lblMsg.Caption = "WPOE06 精算店コードは３" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
            txtSeisanCD.SetFocus
            Exit Function
        End If
    End If
    
    Chk_err = True
End Function

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*******************************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("社員マスタメンテナンス", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt210.Name, _
              strErrCode, _
              strErrMsg)

End Sub
'*******************************************************************************
'   テキストエラー解除・フル脱出
'*******************************************************************************
Private Sub txtBumonCD_Change()
    Call gsubMaxCharSkipEX(txtBumonCD, 6)
    txtBumonCD.BackColor = vbWhite
End Sub

Private Sub txtMiseCD_Change()
    Call gsubMaxCharSkipEX(txtMiseCD, 3)
    txtMiseCD.BackColor = vbWhite
End Sub

Private Sub txtSeisanCD_Change()
    Call gsubMaxCharSkipEX(txtSeisanCD, 3)
    txtSeisanCD.BackColor = vbWhite
End Sub

Private Sub txtSyainCD_Change()
    Call gsubMaxCharSkipEX(txtSyainCD, 7)
    txtSyainCD.BackColor = vbWhite
End Sub

'*******************************************************************************
'   フォーカス取得時全テキスト選択
'*******************************************************************************
Private Sub txtBumonCD_GotFocus()
    Call gsubSelectText(txtBumonCD)
End Sub

Private Sub txtMiseCD_GotFocus()
    Call gsubSelectText(txtMiseCD)
End Sub

Private Sub txtSeisanCD_GotFocus()
    Call gsubSelectText(txtSeisanCD)
End Sub

Private Sub txtSyainCD_GotFocus()
    Call gsubSelectText(txtSyainCD)
End Sub

