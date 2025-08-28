VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt050 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "貸付金日報印刷"
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
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5985
      Left            =   90
      TabIndex        =   27
      Top             =   1080
      Width           =   14145
      Begin FPSpread.vaSpread sprList 
         Height          =   4965
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   13545
         _Version        =   196608
         _ExtentX        =   23892
         _ExtentY        =   8758
         _StockProps     =   64
         MaxCols         =   11
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt050.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "帳票印刷"
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
         Left            =   12060
         TabIndex        =   5
         Top             =   5490
         Width           =   1365
      End
      Begin VB.CommandButton cmdPrint 
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
         Height          =   375
         Index           =   0
         Left            =   10650
         TabIndex        =   4
         Top             =   5490
         Width           =   1365
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   90
      TabIndex        =   22
      Top             =   75
      Width           =   14145
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   120
         Top             =   180
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.TextBox txtTouroku 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Index           =   1
         Left            =   6240
         MaxLength       =   2
         TabIndex        =   1
         Top             =   390
         Width           =   360
      End
      Begin VB.TextBox txtTouroku 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Index           =   2
         Left            =   6945
         MaxLength       =   2
         TabIndex        =   2
         Tag             =   "2"
         Top             =   390
         Width           =   360
      End
      Begin VB.TextBox txtTouroku 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Index           =   0
         Left            =   5430
         MaxLength       =   4
         TabIndex        =   0
         Top             =   390
         Width           =   495
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "月"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Index           =   0
         Left            =   6675
         TabIndex        =   26
         Top             =   450
         Width           =   180
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "年"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Index           =   0
         Left            =   6015
         TabIndex        =   25
         Top             =   450
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "日"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Index           =   0
         Left            =   7380
         TabIndex        =   24
         Top             =   450
         Width           =   180
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "貸付日付"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   4245
         TabIndex        =   23
         Top             =   450
         Width           =   720
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
      TabIndex        =   21
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
         TabIndex        =   6
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
         Left            =   1245
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   12
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
         Left            =   4830
         TabIndex        =   8
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
         TabIndex        =   13
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
         TabIndex        =   14
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
         TabIndex        =   15
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
         Index           =   9
         Left            =   9570
         TabIndex        =   16
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
         Left            =   10755
         TabIndex        =   9
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
         TabIndex        =   17
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
         TabIndex        =   10
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
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   7110
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
         TabIndex        =   20
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   18
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
            TextSave        =   "12:14"
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
Attribute VB_Name = "frmQPAV_CEnt050"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 Dim blnLoadFlg  As Boolean
 Dim lngFirstCnt As Long '''''''''''
 Dim lngRecCount As Long '''''''''''''''SP用

'*****************************************************************************************
'各ファンクションキー機能
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
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
            txtTouroku(0).SetFocus
    End Select
    
End Sub

Private Sub cmdPrint_Click(Index As Integer)
    Select Case Index
        Case 0
            If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "貸付金日報印刷") = vbOK Then
                Call subPrintReport(crptToWindow)
            End If
        Case 1
            If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "貸付金日報印刷") = vbOK Then
                Call subPrintReport(crptToPrinter)
            End If
    End Select
End Sub

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()


    Dim ret  As Boolean
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "貸付金日報"
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "貸付金日報 (" & gstrCommandLine(8) & ") " _
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
                                    , "貸付金日報 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'サーバー日付取得
        Call gsubGetSysDate
        
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
        
        Me.Enabled = True
        MousePointer = vbDefault
        bInit_Flg = False          '初期 FLG オフ
        Call gsubSelectText(txtTouroku(0))
    End If
            
    
End Sub

'**************************************************************************************************
'*FORM_KEYDOWN ファンクションキー設定
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
        Case vbKeyDelete    'DELキーを押した時
            Call Form_KeyPress(46)
    End Select

End Sub
'**************************************
'*FORM_KEYPRESS
'**************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    'ENTER Beep音消去
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

'**************************************************************************************************
'*Formロード
'**************************************************************************************************
Private Sub Form_Load()
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    Me.Caption = "貸付金日報印刷 (" & gstrCommandLine(8) & ")"
    
    bInit_Flg = True          '初期 FLG オン
    sprList.MaxRows = 0
    
End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
    '使用ワークテーブル全削除
    Call subDelWorkTbl
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt050 = Nothing

End Sub

'******************************************
'*　フル桁脱出
'******************************************
Private Sub txttouroku_Change(Index As Integer)

    Select Case Index
        Case 0
            Call gsubMaxCharSkipEX(txtTouroku(Index), 4)
        Case 1, 2
            Call gsubMaxCharSkipEX(txtTouroku(Index), 2)
    End Select

End Sub

'******************************************
'*会員№フォーカス取得時全テキスト選択
'******************************************
Private Sub txttouroku_GotFocus(Index As Integer)

    Call gsubSelectText(txtTouroku(Index))

End Sub

'******************************************
'*会員№入力文字制御（数字のみ）
'******************************************
Private Sub txttouroku_KeyPress(Index As Integer, KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'*************************************************************************************************
'*入力チェック処理
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    If IsNull(txtTouroku(0).Text) Or Trim(txtTouroku(0).Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 貸付日付" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtTouroku(0).BackColor = vbRed
        txtTouroku(0).SetFocus
        Exit Function
    End If
    txtTouroku(0).Text = Format(txtTouroku(0).Text, "0000")
    
    If IsNull(txtTouroku(1).Text) Or Trim(txtTouroku(1).Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 貸付日付" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtTouroku(1).BackColor = vbRed
        txtTouroku(1).SetFocus
        Exit Function
    End If
    txtTouroku(1).Text = Format(txtTouroku(1).Text, "00")

    If IsNull(txtTouroku(2).Text) Or Trim(txtTouroku(2).Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 貸付日付" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtTouroku(2).BackColor = vbRed
        txtTouroku(2).SetFocus
        Exit Function
    End If
    txtTouroku(2).Text = Format(txtTouroku(2).Text, "00")

    If Not IsDate(txtTouroku(0).Text & "," & txtTouroku(1).Text & "," & txtTouroku(2).Text) Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 貸付日付" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtTouroku(0).BackColor = vbRed
        txtTouroku(1).BackColor = vbRed
        txtTouroku(2).BackColor = vbRed
        txtTouroku(0).SetFocus
        Exit Function
    End If

    funcChk = True

End Function

'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    
    Call subErrKaijo
    
    cmdPFK(5).SetFocus
    
    '入力チェック
    If Not funcChk Then Exit Sub
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
    
    '変数に退避
    gstrSyoriYMD = Format(txtTouroku(0).Text, "0000") & Format(txtTouroku(1).Text, "00") & Format(txtTouroku(2).Text, "00")
    
    'SP実行
    Call gsubSPSet
    
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""

End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtTouroku(0).BackColor = vbWhite
    txtTouroku(1).BackColor = vbWhite
    txtTouroku(2).BackColor = vbWhite
    
End Sub

'***********************************************************************************************************
'*画面初期化
'***********************************************************************************************************
Private Sub subFormInitialize()
    Dim i As Integer
    
    '各表示項目クリア
    For i = 0 To 2
        txtTouroku(i).Text = ""
        txtTouroku(i).Enabled = True
        txtTouroku(i).BackColor = vbWhite
    Next i
    
    For i = 0 To 1
        cmdPrint(i).Enabled = False
    Next i
    
    cmdPFK(5).Enabled = True
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    'Spred Sheetの初期化
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    'システム日付初期表示
    txtTouroku(0).Text = Format(gdatSysDate, "yyyy")
    txtTouroku(1).Text = Format(gdatSysDate, "mm")
    txtTouroku(2).Text = Format(gdatSysDate, "dd")
    
End Sub

'クリスタルレポート
Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
    Dim strSelectionFormula As String
    Dim strConectPoint      As String
    Dim intRet              As Integer
    Dim strCpubMyTitle      As String
    
    lblMsg.Caption = ""
    Me.Enabled = False
    Me.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "印刷中．．．"
    
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CENT050.rpt"
        strCpubMyTitle = "貸付金日報"
        .DiscardSavedData = True
        '記述されたアクセスポイントに接続
        .Connect = strConectPoint
        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAK_KASITUKEW"
        
        '抽出条件を記述する
        strSelectionFormula = "({QPAK_KASITUKEW.QPAK_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
                       & " AND {QPAK_KASITUKEW.QPAK_USERID} =  '" & gstrCommandLine(1) & "')"

        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula
        
        '出力先設定
        .Destination = intDestinationConstants
        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then
            .WindowTitle = strCpubMyTitle & " (" & gstrCommandLine(8) & ")"
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

    strSQL = "BEGIN QPAP_CEnt050PkG.QPAP_CEnt050DelWorkTbl(" & _
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

