VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt410 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "完済通知書印刷"
   ClientHeight    =   8550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   14355
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   8550
   ScaleWidth      =   14355
   StartUpPosition =   2  '画面の中央
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   30
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      PrintFileLinesPerPage=   60
      WindowShowCloseBtn=   -1  'True
   End
   Begin VB.CommandButton cmdInitDisp 
      Caption         =   "初期表示順"
      Height          =   465
      Left            =   690
      TabIndex        =   8
      Top             =   6630
      Width           =   1305
   End
   Begin VB.CommandButton cmdPrint2 
      Caption         =   "出力者一覧"
      Height          =   465
      Left            =   12780
      TabIndex        =   11
      Top             =   6630
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5145
      Left            =   120
      TabIndex        =   29
      Top             =   1380
      Width           =   14085
      Begin FPSpread.vaSpread spdIchiran 
         Height          =   4740
         Left            =   540
         TabIndex        =   7
         Top             =   240
         Width           =   12945
         _Version        =   196608
         _ExtentX        =   22834
         _ExtentY        =   8361
         _StockProps     =   64
         MaxCols         =   14
         MaxRows         =   20
         OperationMode   =   3
         ScrollBarExtMode=   -1  'True
         SelectBlockOptions=   0
         SpreadDesigner  =   "frmQPAV_CEnt410.frx":0000
         UserResize      =   2
         VisibleCols     =   5
         VisibleRows     =   20
         ScrollBarTrack  =   3
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1245
      Left            =   120
      TabIndex        =   28
      Top             =   60
      Width           =   14085
      Begin VB.TextBox txtSyainCD1 
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
         Left            =   1770
         MaxLength       =   1
         TabIndex        =   2
         Text            =   "9"
         Top             =   750
         Width           =   285
      End
      Begin VB.Frame Frame3 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   10140
         TabIndex        =   34
         Top             =   540
         Width           =   3705
         Begin VB.TextBox txtHakkoubiY 
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
            Left            =   1110
            MaxLength       =   4
            TabIndex        =   4
            Text            =   "9999"
            Top             =   180
            Width           =   645
         End
         Begin VB.TextBox txtHakkoubiM 
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
            Left            =   2130
            MaxLength       =   2
            TabIndex        =   5
            Text            =   "99"
            Top             =   180
            Width           =   375
         End
         Begin VB.TextBox txtHakkoubiD 
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
            Left            =   2880
            MaxLength       =   2
            TabIndex        =   6
            Text            =   "99"
            Top             =   180
            Width           =   375
         End
         Begin VB.Label Label4 
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
            Height          =   285
            Left            =   1800
            TabIndex        =   38
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label5 
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
            Height          =   285
            Left            =   2550
            TabIndex        =   37
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label7 
            Caption         =   "日"
            BeginProperty Font 
               Name            =   "ＭＳ Ｐゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3300
            TabIndex        =   36
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label8 
            Caption         =   "発行日"
            BeginProperty Font 
               Name            =   "ＭＳ Ｐゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   35
            Top             =   240
            Width           =   915
         End
      End
      Begin VB.TextBox txtSyainCD2 
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
         Left            =   2130
         MaxLength       =   7
         TabIndex        =   3
         Text            =   "9999999"
         Top             =   750
         Width           =   975
      End
      Begin VB.TextBox txtKansaibiM 
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
         Left            =   2820
         MaxLength       =   2
         TabIndex        =   1
         Text            =   "99"
         Top             =   270
         Width           =   375
      End
      Begin VB.TextBox txtKansaibiY 
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
         Left            =   1770
         MaxLength       =   4
         TabIndex        =   0
         Text            =   "9999"
         Top             =   270
         Width           =   645
      End
      Begin VB.Label Label6 
         Caption         =   "社員コード"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   570
         TabIndex        =   33
         Top             =   780
         Width           =   1155
      End
      Begin VB.Label Label3 
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
         Height          =   285
         Left            =   3300
         TabIndex        =   32
         Top             =   330
         Width           =   405
      End
      Begin VB.Label Label2 
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
         Height          =   285
         Left            =   2490
         TabIndex        =   31
         Top             =   330
         Width           =   315
      End
      Begin VB.Label Label1 
         Caption         =   "完済日"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   570
         TabIndex        =   30
         Top             =   330
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
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   7170
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
         TabIndex        =   26
         Top             =   60
         Width           =   12405
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
      ScaleWidth      =   14295
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   7590
      Width           =   14355
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:取消"
         Height          =   375
         Index           =   12
         Left            =   13140
         TabIndex        =   24
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
         Left            =   11955
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:前画面"
         Height          =   375
         Index           =   10
         Left            =   10725
         TabIndex        =   22
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
         Left            =   9540
         TabIndex        =   21
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
         Left            =   8355
         TabIndex        =   20
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
         Left            =   7170
         TabIndex        =   19
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
         Index           =   6
         Left            =   5985
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:実行"
         Height          =   375
         Index           =   5
         Left            =   4770
         TabIndex        =   17
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
         Left            =   3585
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
         Index           =   3
         Left            =   2400
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ﾊｰﾄﾞｺﾋﾟｰ"
         Height          =   375
         Index           =   2
         Left            =   1215
         TabIndex        =   14
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F1:ﾒﾆｭ-"
         Height          =   375
         Index           =   1
         Left            =   30
         TabIndex        =   13
         Top             =   90
         Width           =   1155
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "プレビュー"
      Height          =   465
      Index           =   0
      Left            =   9780
      TabIndex        =   9
      Top             =   6630
      Width           =   1185
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "印刷"
      Height          =   465
      Index           =   1
      Left            =   11070
      TabIndex        =   10
      Top             =   6630
      Width           =   1185
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   27
      Top             =   8175
      Width           =   14355
      _ExtentX        =   25321
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   12841
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
            TextSave        =   "12:36"
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
Attribute VB_Name = "frmQPAV_CEnt410"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'************************************************************************************
'  髙島屋クレジット 支援システム
'    サブシステム名： 社員貸付システム（ＰＡ）
'---------------------------------------
'    機能名　　　　： QPAV_CEnt410     完済通知書印刷
'    機能内容　　　： 完済した社員に完済通知書を印刷する
'    フォーム　　　： frmQPAV_CEnt410  ： 完済通知書印刷指示画面
'---------------------------------------
'   作成日　 ： 2005/01/20
'   担当者　 ： FIP SEKINE
'---------------------------------------
'   修正日　 ： 9999/99/99
'   修正内容 ： ＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮ
'************************************************************************************





'フラグ
Private blnNoChangeEvFlg       As Boolean    'イベント無効フラグ
Private blnDbFlg               As Boolean    'DB接続
Private bolwkTblEdit           As Boolean    '印刷用WKテーブル作成


'検索KEY
Private mstrKeyKansaibiFr      As String     '完済日From   ※単月指定の為 Fromは 1日
Private mstrKeyKansaibiTo      As String     '完済日To                     Toは 末日
Private mstrKeySyaincd1        As String     '社員コード1
Private mstrKeySyaincd2        As String     '社員コード2

'帳票 条件用
Private mstrKeyYushibi         As String     '融資日  ※社員指定時に融資日を条件にする

'Work
Private mstrHakkoubi           As String     '発行日
Private mlngSvCol              As Long       'SORT KEY セーブ値
Private mintSort               As Integer    'SORT順（0=初期、1=昇順、2=降順）



'CONST
Const cnsTitle                 As String = "完済通知書印刷"






'***********************************************************************************
'    FORM LOAD
'***********************************************************************************
Private Sub Form_Load()

    'フラグ初期化
    blnNoChangeEvFlg = False
    blnDbFlg = False

    'ステータスバー設定
    Call gsubInitStatusBar(stbSystem)
    
    'フォーム名設定
    Me.Caption = cnsTitle & " (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    Call subInitScreen

End Sub

'***********************************************************************************
'    FORM Activate
'***********************************************************************************
Private Sub Form_Activate()

'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If gblnInitFlg = True Then      '初期フラグ = オンの場合
        
        'ステータスバーメッセージ
        stbSystem.Panels.Item(1).Text = "処理中．．．"
        
        '画面制御
        Screen.MousePointer = vbHourglass
        Me.Enabled = False
        
        DoEvents
        
        'セッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , cnsTitle & "(" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
            Exit Sub
        End If
        
        'データベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , cnsTitle & "(" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
            Exit Sub
        End If
        
        'DB接続OK
        blnDbFlg = True
        
        'SP初期処理  コードテーブル初期読込み
        Call gsubSPInit
        
        '起動初期に印刷用WKテーブルクリア（自端末＆オペレータ）
        Call fncblnPrintDataDel
        
        'ステータスバーメッセージ消去
        Me.Enabled = True
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""
        
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
        
        gblnInitFlg = False            '初期フラグ = オフ
    End If

End Sub

'***********************************************************************************
'    FORM QueryUnload
'***********************************************************************************
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

     'ＤＢ接続ＯＫ
    If blnDbFlg = True Then
    
        'WKテーブル削除
        Call fncblnPrintDataDel
        
        'ｵﾗｸﾙｾｯｼｮﾝの切断
        Call gsubTermOracleDB
    
    End If

End Sub


'***********************************************************************************
'    FORM KEY PRESS イベント
'***********************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'エラークリア
    Call subErrCrear

    
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

'***********************************************************************************
'    FORM KEY DOWN イベント
'***********************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    'ファンクションキー設定
    Select Case KeyCode
         Case vbKeyReturn   'Enter
            'エラークリア
            Call subErrCrear
            'TAB
            SendKeys "{TAB}"
         Case vbKeyF1   'F1
            Call cmdPFK_Click(1)
         Case vbKeyF2   'F2
            Call cmdPFK_Click(2)
         Case vbKeyF5   'F5
            If cmdPFK(5).Enabled = True Then
                'エラークリア
                Call subErrCrear
                'F5
                Call cmdPFK_Click(5)
            End If
'         Case vbKeyF7   'F7
'            Call cmdPFK_Click(7)
'         Case vbKeyF8   'F8
'            Call cmdPFK_Click(8)
         Case vbKeyF10  'F10
            Call cmdPFK_Click(10)
         Case vbKeyF12   'F12
            Call cmdPFK_Click(12)
    End Select


End Sub






'***********************************************************************************
'    ファンクションキークリック処理
'***********************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
        
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        '***** メニュー *****
        Case 1
            Unload Me
            Exit Sub
        
        '***** ハードコピー *****
        Case 2
'DEL 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
'           Call gsubQSAV_ActX1001
'--Start Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
            'ハードコピー用DLL呼出処理に画面キャプションをパラメータとして追加
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            
            Set clsActX1001 = Nothing
'--Finish Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
            
            picMsg.Refresh
        
        '***** 実行 *****
        Case 5
            'エラークリア
            Call subErrCrear
            '実行
            Call subExecute
            
        '***** 前頁 *****
        Case 7
'            If spdIchiran.DataRowCnt = 0 Or spdIchiran.ActiveRow = 1 Then
'                lblMsg.Caption = "WHOE09 " & gstrGetCodeMeisyo(odbDatabase, "E09", "WHO")   'Msg = 前ページはありません
'                Exit Sub
'            End If
'            spdIchiran.SetFocus
'            SendKeys "{PGUP}"
        
        '***** 次頁 *****
        Case 8
'            If spdIchiran.DataRowCnt = 0 Or spdIchiran.DataRowCnt <= spdIchiran.ActiveRow Then
'                lblMsg.Caption = "WHOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WHO")   'Msg = 次ページはありません
'                Exit Sub
'            End If
'            spdIchiran.SetFocus
'            SendKeys "{PGDN}"
        
        Case 10 '前画面
            Unload Me
            Exit Sub
        
        '***** 取消 *****
        Case 12
            Call subCancel
    
    End Select
    
End Sub


'***********************************************************************************
'    実行
'***********************************************************************************
Private Sub subExecute()
    
    '画面制御
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '検索条件入力チェック
    If fncbolInputChk = False Then
        '入力エラー
        Exit Sub
    End If
    
    '一覧検索 表示
    If fncblnListSel = False Then
        'ERR OR 該当データなし
        GoTo subExecute_EXIT
    End If
    
    '発行日編集
    Call subHakkoubiEdit
    
    'ボタン制御 ＆ 検索条件入力不可
    If spdIchiran.MaxRows > 0 Then
        '完済通知
        cmdPrint(0).Enabled = True
        cmdPrint(1).Enabled = True
        
        '出力者一覧
'''        '社員コード指定か？  ※社員コード指定でかつ完済日未指定は対象外
'''        If Trim$(mstrKeySyaincd2) <> "" And _
'''            Trim$(mstrKeyKansaibiFr) = "" Then
        '社員コード指定か？  ※社員コード指定は対象外
        If Trim$(mstrKeySyaincd2) <> "" Then
            '社員コード指定  処理対象外
            cmdPrint2.Enabled = False
        Else
            '未指定 処理対象
            cmdPrint2.Enabled = True
        End If
    
        '初期表示順
        cmdInitDisp.Enabled = True
        
        '検索条件 入力不可
        txtKansaibiY.Enabled = False
        txtKansaibiM.Enabled = False
        txtSyainCD1.Enabled = False
        txtSyainCD2.Enabled = False
        
        '実行ボタン 押下不可
        cmdPFK(5).Enabled = False
        
    End If
    
subExecute_EXIT:
    
    '画面制御
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    '一覧表示件数が０件でかつ、入力条件が入力可能状態の場合に
    If spdIchiran.MaxRows = 0 And txtKansaibiY.Enabled = True Then
        txtKansaibiY.SetFocus    '年にフォーカス
    Else
        '一覧表示件数が１件以上でかつ、社員コード指定で
        If spdIchiran.MaxRows > 0 And txtHakkoubiY.Enabled = True Then
            '発行日にフォーカス
            txtHakkoubiY.SetFocus
        Else
            '一覧へフォーカス
            spdIchiran.SetFocus
        End If
    End If
    
End Sub


'***********************************************************************************
'    完済通知書  印刷・プレビュー ボタンクリック
'***********************************************************************************
Private Sub cmdPrint_Click(Index As Integer)
    
    '発行日チェック
    If fncbolHakkoubiChk = False Then
        '入力エラー
        Exit Sub
    End If
    
    '印刷・プレビュー
    If Index = 0 Then
        If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "完済通知書") = vbCancel Then
            Exit Sub
        End If
    Else
        If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "完済通知書") = vbCancel Then
            Exit Sub
        End If
    End If
    
    '画面制御
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '印刷用WKテーブル作成済みか
    If bolwkTblEdit = False Then
        '印刷データ作成
        If fncblnPrintDataEdit = False Then
            '画面制御
            Me.Enabled = True
            Screen.MousePointer = vbDefault
            'データ作成エラー
            Exit Sub
        End If
    End If
    
    '社員コード指定時、融資日をKEYとする
    If Trim$(mstrKeySyaincd2) <> "" Then
        mstrKeyYushibi = gVarSpdGetText(spdIchiran, 6, spdIchiran.ActiveRow)
    End If
    
    '画面制御
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    '印刷・プレビュー
    If Index = 0 Then
        'プレビュー
        Call sub410PrintRep(crptToWindow)
    Else
        '印刷実行
        Call sub410PrintRep(crptToPrinter)
    End If
    
    '印刷用WKテーブル作成済み
    bolwkTblEdit = True
    
End Sub
'***********************************************************************************
'    出力者一覧  ボタンクリック
'***********************************************************************************
Private Sub cmdPrint2_Click()
    Dim datTmp         As Date
    
    Dim strTmpY        As String
    Dim strTmpM        As String
    '---------------------------------
    
    '印刷・プレビュー
    If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "完済通知書") = vbCancel Then
        Exit Sub
    End If
    
    '画面制御
    Screen.MousePointer = vbHourglass
    Me.Enabled = False
    
    '印刷用WKテーブル作成済みか
    If bolwkTblEdit = False Then
        '印刷データ作成
        If fncblnPrintDataEdit = False Then
            'データ作成エラー
            
            '画面制御
            Me.Enabled = True
            Screen.MousePointer = vbDefault
            
            Exit Sub
        End If
    End If
    
    '画面制御
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    
    'プレビュー
    Call sub411PrintRep(crptToWindow)
    
    '印刷用WKテーブル作成済み
    bolwkTblEdit = True
    
End Sub

'***********************************************************************************
'    初期表示順へ ボタンクリック
'***********************************************************************************
Private Sub cmdInitDisp_Click()
    
    '一覧の表示順を初期表示順にする
    With spdIchiran
    
        If spdIchiran.MaxRows > 0 Then
        
            '初期表示順へSORT   所属店コード、社員コード
            .Row = 1     'セルブロックを設定
            .Col = 1
            .Row2 = .MaxRows
            .Col2 = .MaxCols
            
            'SORTパターン
            .SortBy = SS_SORT_BY_ROW
            .SortKey(1) = 4     '第１ソートキー（所属店コード）を設定
            .SortKey(2) = 2     '第２ソートキー（社員コード）を設定
            .SortKey(3) = 6     '第３ソートキー（融資日）を設定
            
            '昇順に並べ替え
            .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
            .SortKeyOrder(2) = SS_SORT_ORDER_ASCENDING
            .SortKeyOrder(3) = SS_SORT_ORDER_ASCENDING
                
            '実行
            .Action = SS_ACTION_SORT
                
            'SAVE値を初期化
            mintSort = 0       '前回ソート順（0=初期 1=昇順 2=降順）
            mlngSvCol = 0      '前回ソートCOL(0=初期 以外=COL)
        
        End If
    End With
    
End Sub





'***********************************************************************************
'    画面初期化
'***********************************************************************************
Private Sub subInitScreen()

    'エラークリア
    Call subErrCrear
    
    'メッセージクリア
    lblMsg.Caption = ""

    '画面項目初期化
    blnNoChangeEvFlg = True
    txtKansaibiY.Text = ""
    txtKansaibiM.Text = ""
    txtSyainCD1.Text = ""
    txtSyainCD2.Text = ""
    txtHakkoubiY.Text = ""
    txtHakkoubiM.Text = ""
    txtHakkoubiD.Text = ""
    blnNoChangeEvFlg = False
    
    '検索条件 入力可
    txtKansaibiY.Enabled = True
    txtKansaibiM.Enabled = True
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True
    
    '一覧表 クリア
    spdIchiran.MaxRows = 0
    
    '初期表示順
    cmdInitDisp.Enabled = False

    '印刷・プレビュー
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    '出力者一覧
    cmdPrint2.Enabled = False

    '発行日
    txtHakkoubiY.Enabled = False
    txtHakkoubiM.Enabled = False
    txtHakkoubiD.Enabled = False
    
    '印刷WKテーブル
    bolwkTblEdit = False  '未作成
    
End Sub


'***********************************************************************************
'    取消
'***********************************************************************************
Private Sub subCancel()

    '画面初期化
    Call subInitScreen
    
    '実行ボタン 押下可
    cmdPFK(5).Enabled = True
    
    '入力条件 完済日 年 にフォーカス
    txtKansaibiY.SetFocus
    
End Sub







'***********************************************************************************
'    発行日 編集
'***********************************************************************************
Private Sub subHakkoubiEdit()
    Dim datTmp         As Date
    '---------------------------------
    
    '社員コード指か？
    If Trim$(mstrKeySyaincd2) <> "" Then
        '社員コードを指定した場合
        '初期値はシステム日付を設定
        txtHakkoubiY.Text = Mid$(gstrSysDate, 1, 4)
        txtHakkoubiM.Text = Mid$(gstrSysDate, 5, 2)
        txtHakkoubiD.Text = Mid$(gstrSysDate, 7, 2)
        '変更 可
        txtHakkoubiY.Enabled = True
        txtHakkoubiM.Enabled = True
        txtHakkoubiD.Enabled = True
    Else
        '社員コードを指定していない場合
        '基準値を設定（完済日の次月 + コードテーブルの発行日
        If IsDate(mstrKeyKansaibiFr) = True Then
            datTmp = DateAdd("m", 1, CDate(mstrKeyKansaibiFr))
            txtHakkoubiY.Text = Format(datTmp, "YYYY")
            txtHakkoubiM.Text = Format(datTmp, "MM")
            txtHakkoubiD.Text = gstrCdT_Hakkoubi
        End If
        '変更 不可  ※社員コードの入力がされた場合の検索は、発行日を変更できる
        txtHakkoubiY.Enabled = False
        txtHakkoubiM.Enabled = False
        txtHakkoubiD.Enabled = False
    End If
    
End Sub

'***********************************************************************************
'    入力チェック
'      引　数： なし
'      返却値： Boolean  ： True=OK  False=NG
'***********************************************************************************
Private Function fncbolInputChk() As Boolean
    Dim intErrNo             As Integer
    
    Dim strTmp               As String
    Dim datTmp               As Date
    '-------------------------------------
    
    
    '初期化
    fncbolInputChk = False
    
    intErrNo = 0
    
    mstrKeyKansaibiFr = ""
    mstrKeyKansaibiTo = ""
    mstrKeySyaincd1 = ""
    mstrKeySyaincd2 = ""
    
    '検索条件表示編集
    If Len(Trim$(txtKansaibiM.Text)) = 1 Then
        blnNoChangeEvFlg = True
        txtKansaibiM.Text = "0" & Trim$(txtKansaibiM.Text)
        blnNoChangeEvFlg = False
    End If
    
    '■■■ 完済日 ■■■
    strTmp = txtKansaibiY.Text & "/" & txtKansaibiM.Text & "/01"
    If IsDate(strTmp) = True Then
        'FROM
        mstrKeyKansaibiFr = Format(strTmp, "YYYY/MM/DD")
        'TO
        datTmp = CDate(mstrKeyKansaibiFr)
        datTmp = DateAdd("m", 1, datTmp)        '翌月1日の取得
        datTmp = DateAdd("d", -1, datTmp)       '翌月1日より前日の取得
        mstrKeyKansaibiTo = Format(datTmp, "YYYY/MM/DD")
    Else
        If Trim$(txtKansaibiY.Text) = "" And _
           Trim$(txtKansaibiM.Text) = "" Then
            '未入力
        Else
            'ERR
            intErrNo = 1
            GoTo fncbolInputChk_ERR
        End If
    End If
    
    '■■■ 社員コード ■■■
    If Trim$(txtSyainCD1.Text) = "" And Trim$(txtSyainCD2.Text) = "" Then
        '未入力
    Else
        '社員コード１のみはエラー ※社員コード２のみは有りえる
        If Trim$(txtSyainCD2.Text) = "" Then
            'ERR
            intErrNo = 2
            GoTo fncbolInputChk_ERR
        Else
            mstrKeySyaincd1 = IIf(txtSyainCD1.Text = "", " ", txtSyainCD1.Text)
            mstrKeySyaincd2 = Trim$(txtSyainCD2.Text)
        End If
    End If
    
    '■■■ 関連チェック ■■■
    If mstrKeyKansaibiFr = "" And mstrKeySyaincd2 = "" Then
        '完済日＆社員コード 未指定
        intErrNo = 3
        GoTo fncbolInputChk_ERR
    End If
    
    'OK
    fncbolInputChk = True
    
    Exit Function

fncbolInputChk_ERR:

    '画面制御 解除
    Me.Enabled = True
    Screen.MousePointer = vbDefault
    

    Select Case intErrNo
        Case 1
            '完済日 年月エラー
            txtKansaibiY.BackColor = vbRed
            txtKansaibiM.BackColor = vbRed
            lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = 入力項目に誤りがあります
            txtKansaibiY.SetFocus
        Case 2
            '社員コード１のみエラー
            txtSyainCD1.BackColor = vbRed
            txtSyainCD2.BackColor = vbRed
            lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = 入力項目に誤りがあります
            txtSyainCD2.SetFocus
        Case 3
            '完済日＆社員コード 未指定
            txtKansaibiY.BackColor = vbRed
            txtKansaibiM.BackColor = vbRed
            txtSyainCD1.BackColor = vbRed
            txtSyainCD2.BackColor = vbRed
            lblMsg.Caption = "WHOE07 " & gstrGetCodeMeisyo(odbDatabase, "E07", "WHO")  'Msg = 検索条件を入力してください
            txtKansaibiY.SetFocus
    End Select
    
    
End Function

'***********************************************************************************
'    発行日チェック
'      引　数： なし
'      返却値： Boolean  ： True=OK  False=NG
'***********************************************************************************
Private Function fncbolHakkoubiChk() As Boolean
    Dim strTmp               As String
    '-------------------------------------
    
    '初期化
    fncbolHakkoubiChk = False
    
    '発行日
    strTmp = txtHakkoubiY.Text & "/" & txtHakkoubiM.Text & "/" & txtHakkoubiD.Text
    If IsDate(strTmp) = True Then
        mstrHakkoubi = Format(strTmp, "ggg e年m月d日発行")
    Else
        'ERR
        GoTo fncbolHakkoubiChk_ERR
    End If
    
    'OK
    fncbolHakkoubiChk = True
    
    Exit Function
    
fncbolHakkoubiChk_ERR:
    'ERR

    txtHakkoubiY.BackColor = vbRed
    txtHakkoubiM.BackColor = vbRed
    txtHakkoubiD.BackColor = vbRed
    lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")  'Msg = 入力項目に誤りがあります
    txtHakkoubiY.SetFocus
    
End Function


'***********************************************************************************
'    エラー解除
'***********************************************************************************
Private Sub subErrCrear()

    'ｴﾗｰﾒｯｾｰｼﾞｸﾘｱ
    lblMsg.Caption = ""
    
    'ｴﾗｰ項目Backcolorを戻す
    txtKansaibiY.BackColor = vbWhite
    txtKansaibiM.BackColor = vbWhite
    txtSyainCD1.BackColor = vbWhite
    txtSyainCD2.BackColor = vbWhite
    
    txtHakkoubiY.BackColor = vbWhite
    txtHakkoubiM.BackColor = vbWhite
    txtHakkoubiD.BackColor = vbWhite
    
End Sub


'***********************************************************************************
'    一覧用データ取得 SP 発行
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnListSel() As Boolean
    Dim strSQL               As String
    Dim lngSprStartCnt       As Long
    Dim lngSprEndCnt         As Long
    Dim i                    As Long
    Dim lngSpCnt             As Long
    
    Const cnslngAryLen       As Long = 150   '配列の最大桁数
    Const cnslngAryCnt       As Long = 35    '配列の件数  及び、１回で取得するＭＡＸの件数
    '----------------------------------------------

On Error GoTo fncblnListSel_ERR
    
    '初期化
    fncblnListSel = False

    lngSpCnt = 0

    '一覧取得 ＳＰ
    '■01■ 検索条件 完済日FROM
    odbDatabase.Parameters.Add "InStrKansaibiFr", mstrKeyKansaibiFr, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiFr").ServerType = ORATYPE_VARCHAR2
    '■02■　 　　　 完済日To
    odbDatabase.Parameters.Add "InStrKansaibiTo", mstrKeyKansaibiTo, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiTo").ServerType = ORATYPE_VARCHAR2
    '■03■ 　　　　 社員コード１
    odbDatabase.Parameters.Add "InStrSyainCd1", mstrKeySyaincd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_VARCHAR2
    '■04■ 　　　　 社員コード２
    odbDatabase.Parameters.Add "InStrSyainCd2", mstrKeySyaincd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_VARCHAR2
    
    '■05■ 最大配列格納件数
    odbDatabase.Parameters.Add "InNumMaxRec", cnslngAryCnt, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '■06■ 処理ｶｳﾝﾄ
    odbDatabase.Parameters.Add "IoNumFetchCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumFetchCount").ServerType = ORATYPE_NUMBER
    '■07■ カーソルＩＤ
    odbDatabase.Parameters.Add "IoNumCursor", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumCursor").ServerType = ORATYPE_NUMBER
    '■08■ 総検索件数
    odbDatabase.Parameters.Add "IoNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumRecCount").ServerType = ORATYPE_NUMBER
    '■09■ ﾚｺｰﾄﾞｶｳﾝﾄ
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '■10■ EndFlg
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '■11■ データ配列
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngAryLen    '200行・150桁
    
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410ListSel("
    strSQL = strSQL & ":InStrKansaibiFr,"               '01 完済日From
    strSQL = strSQL & ":InStrKansaibiTo,"               '02 完済日To
    strSQL = strSQL & ":InStrSyainCd1,"                 '03 社員コード１
    strSQL = strSQL & ":InStrSyainCd2,"                 '04 社員コード２
    strSQL = strSQL & ":InNumMaxRec,"                   '05 最大配列格納件数
    strSQL = strSQL & ":IoNumFetchCount,"               '06 処理ｶｳﾝﾄ
    strSQL = strSQL & ":IoNumCursor,"                   '07 カーソルＩＤ
    strSQL = strSQL & ":IoNumRecCount,"                 '08 総検索件数
    strSQL = strSQL & ":OtNumAryCount,"                 '09 ﾚｺｰﾄﾞｶｳﾝﾄ
    strSQL = strSQL & ":OtStrEndFlg,"                   '10 EndFlg
    strSQL = strSQL & ":OtStrDataAry"                   '11 データ配列
    strSQL = strSQL & "); END;"
    
    i = 1               '変数のクリア
    lngSprStartCnt = 0
    lngSprEndCnt = 0
  
    spdIchiran.ReDraw = False
    Do
        '一覧の取得
        odbDatabase.DbexecuteSQL (strSQL)

        If i = 1 Then
            If odbDatabase.Parameters("IoNumRecCount").Value = 0 Then     '該当データなし
                'オブジェクトの開放
                Call gsubParaRemove(odbDatabase)
                'エラーメッセージ表示*****Msg=該当するデータがありません
                lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")
                spdIchiran.ReDraw = True
                Exit Function
            End If
            spdIchiran.MaxRows = odbDatabase.Parameters("IoNumRecCount").Value   '一覧の行数設定
        End If
        
        '一覧のデータ内容を設定する開始位置
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1
        
        '一覧の終了位置
        lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount").Value)
        
        '一覧表 項目セット
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)
        
        i = i + 1
    
    Loop Until odbDatabase.Parameters("OtStrEndFlg").Value = "1"

    '再描画
    spdIchiran.ReDraw = True

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    '検索表示 OK
    fncblnListSel = True
    
    Exit Function

fncblnListSel_ERR:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    一覧を表示
'        引数： lngStCnt  ： Long    ： 一覧の開始位置
'        　　　 lngEdCnt  ： Long    ： 一覧の終了位置
'***********************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
    Dim i                  As Long
    Dim j                  As Long
    Dim k                  As Long
    Dim strDetail          As String
    Dim strValue           As String
    Dim strTmp             As String
    Dim strTmp1            As String
    Dim strTmp2            As String
    '----------------------------------------------
    
    With spdIchiran
        
        j = 0
        For i = lngStCnt To lngEdCnt
        
            '明細
            strDetail = odbDatabase.Parameters("OtStrDataAry").Get_Value(j)
            j = j + 1
            
            '【01】 東西区分
            strValue = Trim$(gfncstrDlm2(strDetail, 9))
            Select Case strValue
                Case "1": strTmp = "東"
                Case "2": strTmp = "西"
            End Select
            .SetText 1, i, strTmp
            
            '【02】 社員コード  ※社員コード１＋社員コード２
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 1))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 2))
            strTmp = IIf(strTmp1 = "", " ", strTmp1) & strTmp2
            .SetText 2, i, strTmp
            .SetText 9, i, IIf(strTmp1 = "", " ", strTmp1)    '隠し 社員コード１
            .SetText 10, i, strTmp2                           '隠し 社員コード２
            
            '【03】 氏名
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 6))    'カナ氏名
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 7))    '漢字氏名
            If Trim$(strTmp2) = "" Then
                strTmp = Trim$(strTmp1)
            Else
                strTmp = Trim$(strTmp2)
            End If
            .SetText 3, i, strTmp
            
            '【04】 所属店  ※所属店コード & 所属店名
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 8))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 11))
            strTmp = strTmp1 & " " & strTmp2
            .SetText 4, i, strTmp
            .SetText 11, i, strTmp1                           '隠し 所属店コード
            .SetText 12, i, strTmp2                           '隠し 所属店名
            
            '【05】 所属部門  ※所属部門コード & 所属部門名
            strTmp1 = Trim$(gfncstrDlm2(strDetail, 10))
            strTmp2 = Trim$(gfncstrDlm2(strDetail, 12))
            strTmp = strTmp1 & " " & strTmp2
            .SetText 5, i, strTmp
            .SetText 13, i, strTmp1                           '隠し 所属部門コード
            .SetText 14, i, strTmp2                           '隠し 所属部門名
            
            '【06】 融資日
            strValue = Trim$(gfncstrDlm2(strDetail, 3))
            .SetText 6, i, strValue
            
            '【07】 融資金額
            strValue = Trim$(gfncstrDlm2(strDetail, 5))
            strTmp = ""
            If IsNumeric(strValue) = True Then
                strTmp = Format(strValue, "#,###,##0")
            End If
            .SetText 7, i, strTmp
            
            '【08】 完済日
            strValue = Trim$(gfncstrDlm2(strDetail, 4))
            .SetText 8, i, strValue
            
        Next i
    End With

End Sub


'***********************************************************************************
'    印刷データ作成 SP 発行
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataEdit() As Boolean
    Dim strSQL               As String
    Dim i                    As Long
    Dim strTmpY              As String
    Dim strTmpM              As String
    Dim strTmpD              As String
    Dim datTmp               As Date
    Dim strTmp               As String
    
    Dim lngArySetCnt         As Long        '配列格納件数カウンター
    
    Dim str411Title          As String      '完済通知出力者一覧 タイトル
    
    Dim OraPArray1           As Object      '01 社員コード１
    Dim OraPArray2           As Object      '02 社員コード２
    Dim OraPArray3           As Object      '03 融資日
    Dim OraPArray4           As Object      '04 融資日（和暦）
    Dim OraPArray5           As Object      '05 表示用社員氏名
    Dim OraPArray6           As Object      '06 所属店コード
    Dim OraPArray7           As Object      '07 所属店名称
    Dim OraPArray8           As Object      '08 東西区分
    Dim OraPArray9           As Object      '09 所属部門コード
    Dim OraPArray10          As Object      '10 所属部門名称
    Dim OraPArray11          As Object      '11 融資金額
    Dim OraPArray12          As Object      '12 完済日
    Dim OraPArray13          As Object      '13 完済日（和暦）
    
    Const cnslngKeta1        As Long = 1    '01 社員コード１
    Const cnslngKeta2        As Long = 7    '02 社員コード２
    Const cnslngKeta3        As Long = 10   '03 融資日
    Const cnslngKeta4        As Long = 20   '04 融資日（和暦）
    Const cnslngKeta5        As Long = 30   '05 表示用社員氏名
    Const cnslngKeta6        As Long = 3    '06 所属店コード
    Const cnslngKeta7        As Long = 24   '07 所属店名称
    Const cnslngKeta8        As Long = 2    '08 東西区分
    Const cnslngKeta9        As Long = 6    '09 所属部門コード
    Const cnslngKeta10       As Long = 24   '10 所属部門名称
    Const cnslngKeta11       As Long = 13   '11 融資金額
    Const cnslngKeta12       As Long = 10   '12 完済日
    Const cnslngKeta13       As Long = 20   '13 完済日（和暦）
    
    Const cnslngAryCnt       As Long = 2
    '----------------------------------------------

On Error GoTo fncblnPrintDataEdit_ERR
    
    '初期化
    fncblnPrintDataEdit = False
    
    '対象者一覧(411)用タイトル 編集  ※検索条件の完済日の次月
    strTmpY = "　　　　"
    strTmpM = "　　"
    If IsDate(mstrKeyKansaibiFr) = True Then
        datTmp = DateAdd("m", 1, CDate(mstrKeyKansaibiFr))
        strTmpY = StrConv(Format(datTmp, "YYYY"), vbWide)
        strTmpM = StrConv(Format(datTmp, "M"), vbWide)
        str411Title = strTmpY & "年" & _
                      IIf(Len(strTmpM) = 1, "　" & strTmpM, strTmpM) & "月度 完済通知出力者一覧"
    Else
        str411Title = ""
    End If

    '印刷データ作成 ＳＰ
    '■01■ オペレータID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '■02■ 端末ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    '■03■ 配列格納件数
    '配列件数
    odbDatabase.Parameters.Add "InNumAryCount", 0, ORAPARM_INPUT    '最初は０を設定 CALL前に件数を設定
    odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    
    '変動項目  ※配列渡し
    '■04■ 配列01 社員コード１
    odbDatabase.Parameters.AddTable "InStrSyainCd1Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta1
    Set OraPArray1 = odbDatabase.Parameters("InStrSyainCd1Ary")
    '■05■ 配列02 社員コード２
    odbDatabase.Parameters.AddTable "InStrSyainCd2Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta2
    Set OraPArray2 = odbDatabase.Parameters("InStrSyainCd2Ary")
    '■06■ 配列03 融資日
    odbDatabase.Parameters.AddTable "InStrYushibiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta3
    Set OraPArray3 = odbDatabase.Parameters("InStrYushibiAry")
    '■07■ 配列04 融資日（和暦）
    odbDatabase.Parameters.AddTable "InStrYushibiWaAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta4
    Set OraPArray4 = odbDatabase.Parameters("InStrYushibiWaAry")
    '■08■ 配列05 表示用社員氏名
    odbDatabase.Parameters.AddTable "InStrDispNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta5
    Set OraPArray5 = odbDatabase.Parameters("InStrDispNmAry")
    '■09■ 配列06 所属店コード
    odbDatabase.Parameters.AddTable "InStrTenCdAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta6
    Set OraPArray6 = odbDatabase.Parameters("InStrTenCdAry")
    '■10■ 配列07 所属店名称
    odbDatabase.Parameters.AddTable "InStrTenNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta7
    Set OraPArray7 = odbDatabase.Parameters("InStrTenNmAry")
    '■11■ 配列08 東西区分
    odbDatabase.Parameters.AddTable "InStrTozaiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta8
    Set OraPArray8 = odbDatabase.Parameters("InStrTozaiAry")
    '■12■ 配列09 所属部門コード
    odbDatabase.Parameters.AddTable "InStrBumonCdAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta9
    Set OraPArray9 = odbDatabase.Parameters("InStrBumonCdAry")
    '■13■ 配列10 所属部門名称
    odbDatabase.Parameters.AddTable "InStrBumonNmAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta10
    Set OraPArray10 = odbDatabase.Parameters("InStrBumonNmAry")
    '■14■ 配列11 融資金額
    odbDatabase.Parameters.AddTable "InStrYushiKngAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta11
    Set OraPArray11 = odbDatabase.Parameters("InStrYushiKngAry")
    '■15■ 配列12 完済日
    odbDatabase.Parameters.AddTable "InStrKansaibiAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta12
    Set OraPArray12 = odbDatabase.Parameters("InStrKansaibiAry")
    '■16■ 配列13 完済日（和暦）
    odbDatabase.Parameters.AddTable "InStrKansaibiWaAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnslngAryCnt, cnslngKeta13
    Set OraPArray13 = odbDatabase.Parameters("InStrKansaibiWaAry")
    
    '固定項目
    '■17■ 　　　　 発行日（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkoubi", mstrHakkoubi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkoubi").ServerType = ORATYPE_VARCHAR2
    '■18■ 　　　　 発行者情報１（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo1", gtblCdT_Hakkousya(1).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo1").ServerType = ORATYPE_VARCHAR2
    '■19■ 　　　　 発行者情報２（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo2", gtblCdT_Hakkousya(2).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo2").ServerType = ORATYPE_VARCHAR2
    '■20■ 　　　　 発行者情報３（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo3", gtblCdT_Hakkousya(3).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo3").ServerType = ORATYPE_VARCHAR2
    '■21■ 　　　　 発行者情報４（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo4", gtblCdT_Hakkousya(4).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo4").ServerType = ORATYPE_VARCHAR2
    '■22■ 　　　　 ローン名称（完済通知用）
    odbDatabase.Parameters.Add "InStrLoanNm", gstrCdT_LoanNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrLoanNm").ServerType = ORATYPE_VARCHAR2
    '■23■ 　　　　 完済通知出力者一覧タイトル
    odbDatabase.Parameters.Add "InStrTitle", str411Title, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTitle").ServerType = ORATYPE_VARCHAR2
    
    '■23■ 削除フラグ ＳＰ1回目のみ削除（”１”）
    odbDatabase.Parameters.Add "InStrDeleteFlg", "1", ORAPARM_INPUT
    odbDatabase.Parameters("InStrDeleteFlg").ServerType = ORATYPE_CHAR
    
    'SQL文 編集
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410InsWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 オペレータID
    strSQL = strSQL & ":InStrComputerMei,"              '02 端末ID
    
    strSQL = strSQL & ":InNumAryCount,"                 '03 配列格納件数
    strSQL = strSQL & ":InStrSyainCd1Ary,"              '04 社員コード１
    strSQL = strSQL & ":InStrSyainCd2Ary,"              '05 社員コード２
    strSQL = strSQL & ":InStrYushibiAry,"               '06 融資日
    strSQL = strSQL & ":InStrYushibiWaAry,"             '07 融資日（和暦）
    strSQL = strSQL & ":InStrDispNmAry,"                '08 表示用社員氏名
    strSQL = strSQL & ":InStrTenCdAry,"                 '09 所属店コード
    strSQL = strSQL & ":InStrTenNmAry,"                 '10 所属店名称
    strSQL = strSQL & ":InStrTozaiAry,"                 '11 東西区分
    strSQL = strSQL & ":InStrBumonCdAry,"               '12 所属部門コード
    strSQL = strSQL & ":InStrBumonNmAry,"               '13 所属部門名称
    strSQL = strSQL & ":InStrYushiKngAry,"              '14 融資金額
    strSQL = strSQL & ":InStrKansaibiAry,"              '15 完済日
    strSQL = strSQL & ":InStrKansaibiWaAry,"            '16 完済日（和暦）
    
    strSQL = strSQL & ":InStrHakkoubi,"                 '17 発行日（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo1,"              '18 発行者情報１（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo2,"              '19 発行者情報２（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo3,"              '20 発行者情報３（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo4,"              '21 発行者情報４（完済通知用）
    strSQL = strSQL & ":InStrLoanNm,"                   '22 ローン名称（完済通知用）
    strSQL = strSQL & ":InStrTitle,"                    '23 完済通知出力者一覧タイトル
    strSQL = strSQL & ":InStrDeleteFlg "                '24 完済通知出力者一覧タイトル
    strSQL = strSQL & "); END;"
    
    
    '一覧件数分LOOP
    lngArySetCnt = 1
    For i = 1 To spdIchiran.MaxRows
        
        '04 社員コード１
        strTmp = gVarSpdGetText(spdIchiran, 9, i)
        OraPArray1.Put_value Mid$(strTmp, 1, 1), lngArySetCnt - 1
        '05 社員コード２
        strTmp = gVarSpdGetText(spdIchiran, 10, i)
        OraPArray2.Put_value Mid$(strTmp, 1, 7), lngArySetCnt - 1
        '06 融資日
        strTmp = gVarSpdGetText(spdIchiran, 6, i)
        If IsDate(strTmp) = False Then
            strTmp = ""
        End If
        OraPArray3.Put_value strTmp, lngArySetCnt - 1
        '07 融資日（和暦）
        If IsDate(strTmp) = True Then
            strTmpY = Trim$(Format(strTmp, "e"))
            strTmpM = Trim$(Format(strTmp, "m"))
            strTmpD = Trim$(Format(strTmp, "d"))
            strTmp = Format(strTmp, "ggg") & " " & _
                     IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "年", strTmpY & "年") & _
                     IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "月", strTmpM & "月") & _
                     IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "日", strTmpD & "日")
        End If
        OraPArray4.Put_value strTmp, lngArySetCnt - 1
        '08 表示用社員氏名
        strTmp = gVarSpdGetText(spdIchiran, 3, i)
        OraPArray5.Put_value Trim$(strTmp), lngArySetCnt - 1
        '09 所属店コード
        strTmp = gVarSpdGetText(spdIchiran, 11, i)
        OraPArray6.Put_value Mid$(strTmp, 1, 3), lngArySetCnt - 1
        '10 所属店名称
        strTmp = gVarSpdGetText(spdIchiran, 12, i)
        OraPArray7.Put_value Trim$(strTmp), lngArySetCnt - 1
        '11 東西区分
        strTmp = gVarSpdGetText(spdIchiran, 1, i)
        OraPArray8.Put_value Trim$(strTmp), lngArySetCnt - 1
        '12 所属部門コード
        strTmp = gVarSpdGetText(spdIchiran, 13, i)
        OraPArray9.Put_value Mid$(strTmp, 1, 6), lngArySetCnt - 1
        '13 所属部門名称
        strTmp = gVarSpdGetText(spdIchiran, 14, i)
        OraPArray10.Put_value Trim$(strTmp), lngArySetCnt - 1
        '14 融資金額
        strTmp = gVarSpdGetText(spdIchiran, 7, i)
        If IsNumeric(strTmp) = True Then
            strTmp = "\" & fncstrMojiEdit(Format(strTmp, "#,##0"), 12, 0) 'SPACE付加（前）
        Else
            strTmp = ""
        End If
        OraPArray11.Put_value strTmp, lngArySetCnt - 1
        '15 完済日
        strTmp = gVarSpdGetText(spdIchiran, 8, i)
        If IsDate(strTmp) = False Then
            strTmp = ""
        End If
        OraPArray12.Put_value strTmp, lngArySetCnt - 1
        '16 完済日（和暦）
        If IsDate(strTmp) = True Then
            strTmpY = Trim$(Format(strTmp, "e"))
            strTmpM = Trim$(Format(strTmp, "m"))
            strTmpD = Trim$(Format(strTmp, "d"))
            strTmp = Format(strTmp, "ggg") & " " & _
                     IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "年", strTmpY & "年") & _
                     IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "月", strTmpM & "月") & _
                     IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "日", strTmpD & "日")
        End If
        OraPArray13.Put_value strTmp, lngArySetCnt - 1
        
        
        '配列件数の値セット
        odbDatabase.Parameters("InNumAryCount").Value = lngArySetCnt
        
        If lngArySetCnt >= cnslngAryCnt Or _
           i = spdIchiran.MaxRows Then
            '最大件数に達したのでSPをCALL
            'SP 実行
            odbDatabase.DbexecuteSQL (strSQL)
        
            '削除フラグの値のリセット
            odbDatabase.Parameters("InStrDeleteFlg").Value = "0"
        
            lngArySetCnt = 1
        Else
            lngArySetCnt = lngArySetCnt + 1
        End If
    Next i
        
        
    
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    '印刷データ作成 OK
    fncblnPrintDataEdit = True
    
    Exit Function

fncblnPrintDataEdit_ERR:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    印刷データ削除 SP 発行
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataDel() As Boolean
    Dim strSQL               As String
    '----------------------------------------------

On Error GoTo fncblnPrintDataDel_ERR
    
    '初期化
    fncblnPrintDataDel = False

    '印刷データ作成 ＳＰ
    '■01■ オペレータID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '■02■ 端末ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt410PKG.QPAP_CEnt410DelWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 オペレータID
    strSQL = strSQL & ":InStrComputerMei "              '02 端末ID
    strSQL = strSQL & "); END;"
    
    'SP 実行
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    '印刷データ作成 OK
    fncblnPrintDataDel = True
    
    Exit Function

fncblnPrintDataDel_ERR:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function



'***********************************************************************************
'    クリスタルレポート プレビュー・印刷（完済通知）
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Sub sub410PrintRep(intDestinationConstants As DestinationConstants)
    Dim strJoken                As String
    Dim strConectPoint          As String
    Dim intRet                  As Integer
    '--------------------------------------------
    
On Error GoTo sub410PrintRep_ERR

    With CrystalReport
        'アクセスするデータベースなどを記述
        strConectPoint = "  DSN = " & gstrCommandLine(0) & _
                         " ;UID = " & gstrCommandLine(3) & _
                         " ;PWD = " & gstrCommandLine(4)
        
        '記述されたアクセスポイントに接続
        .Connect = strConectPoint
        
        '出力先設定
        .Destination = intDestinationConstants
        
        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then
'''''            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
            .WindowTitle = "完済通知書"
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
        .ReportFileName = App.Path & "\QPAV_CEnt410.rpt"
        .DiscardSavedData = True
            
        '抽出条件を記述する（コンピュータ名）
        strJoken = ""
        strJoken = strJoken & "{QPAZ_KansaiWT.QPAZ_TanmatsuId} = '" & gstrCommandLine(5) & "'"
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_TantoId} = '" & gstrCommandLine(1) & "'"
        If Trim$(mstrKeySyaincd2) <> "" Then
            '社員コード指定  ※選択された行のみ出力対象とする
            strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_Yushibi} = '" & mstrKeyYushibi & "'"
        End If
        .SelectionFormula = strJoken
            
        .DiscardSavedData = True
        
        'クリスタルレポートを実行する
        intRet = .PrintReport
            
        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            'エラーメッセージ表示
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
sub410PrintRep_ERR:
    'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'***********************************************************************************
'    クリスタルレポート プレビュー・印刷（完済通知）
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Sub sub411PrintRep(intDestinationConstants As DestinationConstants)
    Dim strJoken                As String
    Dim strConectPoint          As String
    Dim intRet                  As Integer
    '--------------------------------------------
    
On Error GoTo sub411PrintRep_ERR

    With CrystalReport
        'アクセスするデータベースなどを記述
        strConectPoint = "  DSN = " & gstrCommandLine(0) & _
                         " ;UID = " & gstrCommandLine(3) & _
                         " ;PWD = " & gstrCommandLine(4)
        
        '記述されたアクセスポイントに接続
        .Connect = strConectPoint
        
        '出力先設定
        .Destination = intDestinationConstants
        
        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then
'''''            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
            .WindowTitle = "完済通知出力対象者一覧"
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
        .ReportFileName = App.Path & "\QPAV_CEnt411.rpt"
        .DiscardSavedData = True
            
        '抽出条件を記述する（コンピュータ名）
        strJoken = ""
        strJoken = strJoken & "{QPAZ_KansaiWT.QPAZ_TanmatsuId} = '" & gstrCommandLine(5) & "'"
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_TantoId} = '" & gstrCommandLine(1) & "'"
        .SelectionFormula = strJoken
            
        .DiscardSavedData = True
        
        'クリスタルレポートを実行する
        intRet = .PrintReport
            
        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            'エラーメッセージ表示
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
sub411PrintRep_ERR:
    'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'***********************************************************************************
'    文字編集 （スペース埋め）
'    引　数： strPara_Moji ：String  ： 編集する文字列
'    　　　： intPara_Keta ：Integer ： 最終的な桁数
'    　　　： intPara_Mode ：Integer ： 先頭に付加するか後ろか？  0=先頭  1=後
'    返却値： String ：編集された結果文字列
'***********************************************************************************
Private Function fncstrMojiEdit(strPara_Moji As String, intPara_Keta As Integer, intPara_Mode As Integer) As String
    Dim i        As Integer
    Dim strTmp   As String
    Dim strEdit  As String

    strTmp = StrConv(strPara_Moji, vbFromUnicode)

    If LenB(strTmp) = intPara_Keta Then
        'OK（桁数一致のため処理なし）
        fncstrMojiEdit = strPara_Moji
    Else
        'NG
        If intPara_Mode = 0 Then
            '前に付加
            strEdit = ""
            For i = 1 To (intPara_Keta - LenB(strTmp))
                strEdit = strEdit & Space(1)
            Next i
            strEdit = strEdit & strPara_Moji
            fncstrMojiEdit = strEdit
        Else
            '後ろに付加
            strEdit = strPara_Moji
            For i = 1 To (intPara_Keta - LenB(strTmp))
                strEdit = strEdit & Space(1)
            Next i
            fncstrMojiEdit = strEdit
        End If
    End If

End Function







'***********************************************************************************
'    一覧  クリック    表示順変更
'***********************************************************************************
Private Sub spdIchiran_Click(ByVal Col As Long, ByVal Row As Long)


    If Row = 0 And Col > 0 Then
        'SORT
        With spdIchiran
            If .MaxRows > 1 Then
                'SORTパターン
                .Row = 1     'セルブロックを設定
                .Col = 1
                .Row2 = .MaxRows
                .Col2 = .MaxCols
                .SortBy = SS_SORT_BY_ROW
                .SortKey(1) = Col   '第１ソートキーを設定
                
                If mlngSvCol = Col Then
                    '前回のSORTキーと同じ
                    
                    Select Case mintSort
                        Case 0, 2   '初期 OR 降順
                            'SORT
                            '昇順に並べ替え
                            .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
                            
                            mintSort = 1
                        Case 1    '昇順
                            'SORT
                            '降順に並べ替え
                            .SortKeyOrder(1) = SS_SORT_ORDER_DESCENDING
                            
                            mintSort = 2
                    End Select
                Else
                    '前回のSORTキーと違う
                    
                    '昇順に並べ替え
                    .SortKeyOrder(1) = SS_SORT_ORDER_ASCENDING
                    
                    mintSort = 1
                End If
                
                '実行
                .Action = SS_ACTION_SORT
                mlngSvCol = Col
            End If
        End With
    End If

End Sub





'***********************************************************************************
'    完済日FromTo 年  Chenge Event フル桁脱出
'***********************************************************************************
Private Sub txtKansaibiY_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '完済日FromTo フル桁脱出
    Call gsubMaxCharSkipEX(txtKansaibiY, 4)
    
    'エラークリア
    Call subErrCrear

End Sub
'***********************************************************************************
'    完済日FromTo 年  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtKansaibiY_GotFocus()
    Call gsubSelectText(txtKansaibiY)
End Sub
'***********************************************************************************
'    完済日FromTo 年  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtKansaibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub


'***********************************************************************************
'    完済日FromTo 月  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtKansaibiM_GotFocus()
    Call gsubSelectText(txtKansaibiM)
End Sub
'***********************************************************************************
'    完済日FromTo 月  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtKansaibiM_KeyPress(KeyAscii As Integer)
    'エラークリア
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    完済日FromTo 月  LostFocus Event
'***********************************************************************************
Private Sub txtKansaibiM_LostFocus()
    If IsNumeric(txtKansaibiM.Text) = True Then
        blnNoChangeEvFlg = True
        txtKansaibiM.Text = Format(txtKansaibiM.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub




'***********************************************************************************
'    社員コード１  Chenge Event フル桁脱出
'***********************************************************************************
Private Sub txtSyainCD1_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    Call gsubMaxCharSkipEX(txtSyainCD1, 1)
    
    'エラークリア
    Call subErrCrear

End Sub
'***********************************************************************************
'    社員コード１  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtSyainCD1_GotFocus()
    Call gsubSelectText(txtSyainCD1)
End Sub
'''''''***********************************************************************************
'''''''    社員コード１  KeyPress Event　入力文字制御
'''''''***********************************************************************************
''''''Private Sub txtSyainCD1_KeyPress(KeyAscii As Integer)
''''''    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
''''''End Sub
'***********************************************************************************
'    社員コード１  LostFocus Event
'***********************************************************************************
Private Sub txtSyainCD1_LostFocus()
    
    blnNoChangeEvFlg = True
    txtSyainCD1 = StrConv(txtSyainCD1, vbUpperCase)
    blnNoChangeEvFlg = False
    
End Sub


'***********************************************************************************
'    社員コード２  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtSyainCD2_GotFocus()
    Call gsubSelectText(txtSyainCD2)
End Sub
'***********************************************************************************
'    社員コード２  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtSyainCD2_KeyPress(KeyAscii As Integer)
    'エラークリア
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub



'***********************************************************************************
'    発行日 年  Chenge Event フル桁脱出
'***********************************************************************************
Private Sub txtHakkoubiY_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '発行日 フル桁脱出
    Call gsubMaxCharSkipEX(txtHakkoubiY, 4)
    
    'エラークリア
    Call subErrCrear

End Sub
'***********************************************************************************
'    発行日 年  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtHakkoubiY_GotFocus()
    Call gsubSelectText(txtHakkoubiY)
End Sub
'***********************************************************************************
'    発行日 年  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtHakkoubiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub


'***********************************************************************************
'    発行日 月  Chenge Event フル桁脱出
'***********************************************************************************
Private Sub txtHakkoubiM_Change()

    If blnNoChangeEvFlg = True Then Exit Sub

    '発行日 フル桁脱出
    Call gsubMaxCharSkipEX(txtHakkoubiM, 2)
    
    'エラークリア
    Call subErrCrear

End Sub
'***********************************************************************************
'    発行日 月  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtHakkoubiM_GotFocus()
    Call gsubSelectText(txtHakkoubiM)
End Sub
'***********************************************************************************
'    発行日 月  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtHakkoubiM_KeyPress(KeyAscii As Integer)
    'エラークリア
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    発行日 月  LostFocus Event
'***********************************************************************************
Private Sub txtHakkoubiM_LostFocus()
    If IsNumeric(txtHakkoubiM.Text) = True Then
        blnNoChangeEvFlg = True
        txtHakkoubiM.Text = Format(txtHakkoubiM.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub


'***********************************************************************************
'    発行日 日  GotFocus Event　テキスト選択
'***********************************************************************************
Private Sub txtHakkoubiD_GotFocus()
    Call gsubSelectText(txtHakkoubiD)
End Sub
'***********************************************************************************
'    発行日 日  KeyPress Event　入力文字制御
'***********************************************************************************
Private Sub txtHakkoubiD_KeyPress(KeyAscii As Integer)
    'エラークリア
    Call subErrCrear
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'***********************************************************************************
'    発行日 日  LostFocus Event
'***********************************************************************************
Private Sub txtHakkoubiD_LostFocus()
    If IsNumeric(txtHakkoubiD.Text) = True Then
        blnNoChangeEvFlg = True
        txtHakkoubiD.Text = Format(txtHakkoubiD.Text, "00")
        blnNoChangeEvFlg = False
    End If
End Sub




























