VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt230 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "退職予定者一覧表"
   ClientHeight    =   8580
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
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdExec 
      Caption         =   "一覧印刷"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Index           =   1
      Left            =   13020
      TabIndex        =   6
      Top             =   6660
      Width           =   1065
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "プレビュー"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Index           =   0
      Left            =   11850
      TabIndex        =   5
      Top             =   6660
      Width           =   1065
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5430
      Left            =   90
      TabIndex        =   24
      Top             =   1110
      Width           =   14235
      Begin FPSpread.vaSpread vaSpread1 
         Height          =   4785
         Left            =   900
         TabIndex        =   4
         Top             =   360
         Width           =   12195
         _Version        =   196608
         _ExtentX        =   21511
         _ExtentY        =   8440
         _StockProps     =   64
         MaxCols         =   8
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt230.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame fra_Date 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1110
      Left            =   90
      TabIndex        =   23
      Top             =   -15
      Width           =   14235
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   210
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.TextBox txtTuki2 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   8280
         MaxLength       =   2
         TabIndex        =   3
         Text            =   "99"
         Top             =   480
         Width           =   285
      End
      Begin VB.TextBox txtNen2 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   7380
         MaxLength       =   4
         TabIndex        =   2
         Text            =   "9999"
         Top             =   480
         Width           =   525
      End
      Begin VB.TextBox txtTuki1 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   6180
         MaxLength       =   2
         TabIndex        =   1
         Text            =   "99"
         Top             =   480
         Width           =   315
      End
      Begin VB.TextBox txtNen1 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   5280
         MaxLength       =   4
         TabIndex        =   0
         Text            =   "9999"
         Top             =   480
         Width           =   525
      End
      Begin VB.Label Label6 
         Caption         =   "月"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   8670
         TabIndex        =   29
         Top             =   540
         Width           =   225
      End
      Begin VB.Label Label5 
         Caption         =   "年"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   7980
         TabIndex        =   28
         Top             =   540
         Width           =   255
      End
      Begin VB.Label Label3 
         Caption         =   "月 　～"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   6570
         TabIndex        =   27
         Top             =   540
         Width           =   585
      End
      Begin VB.Label Label2 
         Caption         =   "年"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   5910
         TabIndex        =   26
         Top             =   540
         Width           =   255
      End
      Begin VB.Label lblKubun 
         Alignment       =   1  '右揃え
         Caption         =   "退職年月"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   4290
         TabIndex        =   25
         Top             =   540
         Width           =   825
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   7620
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
         TabIndex        =   7
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
         TabIndex        =   8
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
         TabIndex        =   12
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
         TabIndex        =   13
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
         TabIndex        =   9
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
         Index           =   7
         Left            =   7194
         TabIndex        =   15
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
         Index           =   9
         Left            =   9572
         TabIndex        =   17
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
         Index           =   11
         Left            =   11950
         TabIndex        =   18
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
         TabIndex        =   11
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
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7140
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
         TabIndex        =   21
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   19
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
            TextSave        =   "2006/04/06"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "12:46"
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
Attribute VB_Name = "frmQPAV_CEnt230"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
  Option Explicit

Private Sub cmdExec_Click(Index As Integer)
'*******************************************************************************************
'   印刷・プレビューボタン押下処理
'*******************************************************************************************
    Select Case Index
        Case 0
            If MsgBox("プレビューを行います。よろしいですか？", vbQuestion + vbOKCancel, "退職予定者一覧表") = vbCancel Then
                Exit Sub
            End If
            Call subPrintReport(crptToWindow)
        Case 1
            If MsgBox("印刷を行います。よろしいですか？", vbQuestion + vbOKCancel, "退職予定者一覧表") = vbCancel Then
                Exit Sub
            End If
            Call subPrintReport(crptToPrinter)
    End Select

End Sub

Private Sub Form_Load()
'*******************************************************************************************
'   Formロード
'*******************************************************************************************
    
    Me.Caption = "退職予定者一覧表 (" & gstrCommandLine(8) & ")"
    bInit_Flg = True
    
    '画面初期化
    Call subFormInitialize

End Sub

Private Sub Form_Unload(Cancel As Integer)
'*****************************************************************************************
'   Form Unload
'*****************************************************************************************
    
    '使用ワークテーブル全削除
    Call subDelWorkTbl
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt230 = Nothing

End Sub

Private Sub Form_Activate()
'*******************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'*******************************************************************************************
    Dim ret  As Boolean
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    If bInit_Flg = True Then
        MousePointer = vbHourglass
        Me.Enabled = False
           
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "退職予定者一覧 (" & gstrCommandLine(8) & ") " _
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
                                    , "退職予定者一覧 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        Me.Enabled = True
        MousePointer = vbDefault
        
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
        
        bInit_Flg = False
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
            If cmdPFK(12).Enabled = True Then
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

'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  'メニュー
            Unload Me
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
            txtNen1.SetFocus
    End Select
    
End Sub

Private Sub subFormInitialize()
'*******************************************************************************************
'   画面初期化
'*******************************************************************************************
    
    txtNen1.Text = ""
    txtTuki1.Text = ""
    txtNen2.Text = ""
    txtTuki2.Text = ""
    txtNen1.Enabled = True
    txtTuki1.Enabled = True
    txtNen2.Enabled = True
    txtTuki2.Enabled = True
    
    cmdPFK(5).Enabled = True
'    cmdPFK(12).Enabled = False
    cmdExec(0).Enabled = False
    cmdExec(1).Enabled = False
    
    lblMsg.Caption = ""
    
    'Spred Sheetの初期化
    vaSpread1.MaxRows = 0
    
    Call gsubInitStatusBar(stbSystem)
        
End Sub

Private Function Chk_err() As Boolean
'*******************************************************************************************
'   入力チェック
'*******************************************************************************************
    Chk_err = False
    
    If Chk_txt(txtNen1) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    If Chk_txt(txtTuki1) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    If Chk_txt(txtNen2) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    If Chk_txt(txtTuki2) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    
    If IsDate(txtNen1 & "/" & txtTuki1 & "/01") = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 年月" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtNen1.BackColor = vbRed
        txtTuki1.BackColor = vbRed
        txtNen1.SetFocus
        Exit Function
    End If
    
    If IsDate(txtNen2 & "/" & txtTuki2 & "/01") = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 年月" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtNen2.BackColor = vbRed
        txtTuki2.BackColor = vbRed
        txtNen2.SetFocus
        Exit Function
    End If
    
    If DateDiff("d", txtNen1 & "/" & txtTuki1 & "/01", txtNen2 & "/" & txtTuki2 & "/01") < 0 Then
        'Msg = 日付の範囲指定に誤りがあります。
        lblMsg.Caption = "WPOE14 " & gstrGetCodeMeisyo(odbDatabase, "E14", "WPO")
        txtNen1.BackColor = vbRed
        txtTuki1.BackColor = vbRed
        txtNen2.BackColor = vbRed
        txtTuki2.BackColor = vbRed
        txtNen1.SetFocus
        Exit Function
    End If

    txtTuki1.Text = Format(txtTuki1.Text, "00")
    txtTuki2.Text = Format(txtTuki2.Text, "00")
    
    Chk_err = True

End Function

Private Sub subCmdJikkou()
'*******************************************************************************************
'   実行ボタン処理
'*******************************************************************************************
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String

    If Chk_err = False Then Exit Sub

    lblMsg.Caption = ""
    
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
    
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    
    Screen.MousePointer = vbHourglass
    
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
'    cmdPFK(12).Enabled = True

    DoEvents
    
    'データ表示
    If gsubSPInit = False Then
        'Msg = 該当データが存在しません。
        lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        Screen.MousePointer = vbNormal
        cmdPFK(5).Enabled = True
        cmdExec(0).Enabled = False
        cmdExec(1).Enabled = False
        txtNen1.Enabled = True
        txtTuki1.Enabled = True
        txtNen2.Enabled = True
        txtTuki2.Enabled = True
        txtNen1.SetFocus
        Exit Sub
    Else
        cmdPFK(5).Enabled = False
        cmdExec(0).Enabled = True
        cmdExec(1).Enabled = True
        txtNen1.Enabled = False
        txtTuki1.Enabled = False
        txtNen2.Enabled = False
        txtTuki2.Enabled = False
    End If
    
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    
End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*******************************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************************

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("退職予定者一覧表", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt230.Name, _
              strErrCode, _
              strErrMsg)

End Sub

Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
'*******************************************************************************************
'   クリスタルレポート
'*******************************************************************************************
    Dim strSelectionFormula As String
    Dim strConectPoint      As String
    Dim intRet              As Integer
        
    Dim strFileName         As String
    Dim strCaption          As String


    strFileName = "\QPAV_CEnt230.rpt"
    strCaption = "退職休職予定者一覧表"
    
    
    lblMsg.Caption = ""
'    Me.Enabled = False
'    Me.MousePointer = vbHourglass
'    stbSystem.Panels.Item(1).Text = "印刷中．．．"
    

    With CrystalReport
        'アクセスするデータベースなどを記述
        strConectPoint = " DSN = " & gstrCommandLine(0) & _
                        " ;UID = " & gstrCommandLine(3) & _
                        " ;PWD = " & gstrCommandLine(4)
    
        '記述されたアクセスポイントに接続
        .Connect = strConectPoint
        
        '抽出条件を記述する
        strSelectionFormula = "({QPAR_TAISYOKUW.QPAR_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
                       & " AND {QPAR_TAISYOKUW.QPAR_USERID} =  '" & gstrCommandLine(1) & "')"

        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula

        '出力先設定
        .Destination = intDestinationConstants
        
        If intDestinationConstants = crptToWindow Then
            .WindowTitle = strCaption
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
            
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & strFileName
        
        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAR_TAISYOKUW"
        .DiscardSavedData = True
        
        'クリスタルレポートを実行する
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
    End With
    
    Exit Sub

errPrintReport:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)
End Sub

'*******************************************************************************************
'  テキスト反転処理
'*******************************************************************************************
Private Sub txtNen1_GotFocus()
    Call gsubSelectText(txtNen1)
End Sub

Private Sub txtNen2_GotFocus()
    Call gsubSelectText(txtNen2)
End Sub

Private Sub txtTuki1_GotFocus()
    Call gsubSelectText(txtTuki1)
End Sub

Private Sub txtTuki2_GotFocus()
    Call gsubSelectText(txtTuki2)
End Sub

'*******************************************************************************************
'  テキストエラー解除・フル脱出
'*******************************************************************************************
Private Sub txtNen1_Change()
    Call gsubMaxCharSkipEX(txtNen1, 4)
    txtNen1.BackColor = vbWhite
    txtTuki1.BackColor = vbWhite
End Sub

Private Sub txtNen2_Change()
    Call gsubMaxCharSkipEX(txtNen2, 4)
    txtNen2.BackColor = vbWhite
    txtTuki2.BackColor = vbWhite
End Sub

Private Sub txtTuki1_Change()
    Call gsubMaxCharSkipEX(txtTuki1, 2)
    txtNen1.BackColor = vbWhite
    txtTuki1.BackColor = vbWhite
End Sub

Private Sub txtTuki2_Change()
    txtNen2.BackColor = vbWhite
    txtTuki2.BackColor = vbWhite
End Sub

'*****************************************************************************************
'   入力文字制御（数字のみ）
'*****************************************************************************************
Private Sub txtTuki2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtNen1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtTuki1_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtNen2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'****************************************************************************************
'* 使用ワークテーブル全削除
'****************************************************************************************
Private Sub subDelWorkTbl()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    'ユーザーＩＤ
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt230PkG.QPAP_CEnt230DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDelWorkTbl
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errDelWorkTbl:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Sub

