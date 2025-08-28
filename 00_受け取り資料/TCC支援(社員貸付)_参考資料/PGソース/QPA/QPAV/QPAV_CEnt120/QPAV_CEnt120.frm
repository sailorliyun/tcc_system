VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt120 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "返済額一覧表"
   ClientHeight    =   8595
   ClientLeft      =   300
   ClientTop       =   1740
   ClientWidth     =   14325
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
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ｵｰﾀﾞｰ
   ScaleHeight     =   8595
   ScaleWidth      =   14325
   StartUpPosition =   2  '画面の中央
   Begin MSComctlLib.ProgressBar prgBar 
      Height          =   195
      Left            =   1425
      TabIndex        =   36
      Top             =   8355
      Visible         =   0   'False
      Width           =   6165
      _ExtentX        =   10874
      _ExtentY        =   344
      _Version        =   393216
      Appearance      =   1
      Max             =   140
   End
   Begin VB.PictureBox Picture2 
      Height          =   7395
      Left            =   0
      ScaleHeight     =   7335
      ScaleWidth      =   14265
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   0
      Width           =   14325
      Begin VB.Frame Frame3 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   825
         Left            =   75
         TabIndex        =   28
         Top             =   -15
         Width           =   14130
         Begin VB.TextBox txtDateY_Fr 
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
            Left            =   5432
            MaxLength       =   4
            TabIndex        =   2
            Text            =   "2001"
            Top             =   300
            Width           =   615
         End
         Begin VB.TextBox txtDateM_Fr 
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
            Left            =   6405
            MaxLength       =   2
            TabIndex        =   3
            Text            =   "12"
            Top             =   300
            Width           =   330
         End
         Begin VB.TextBox txtDateD_Fr 
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
            Left            =   7050
            MaxLength       =   2
            TabIndex        =   4
            Text            =   "12"
            Top             =   300
            Width           =   330
         End
         Begin VB.TextBox txtRiritu 
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
            Index           =   0
            Left            =   2235
            MaxLength       =   2
            TabIndex        =   0
            Text            =   "22"
            Top             =   315
            Width           =   330
         End
         Begin VB.TextBox txtRiritu 
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
            Index           =   1
            Left            =   2745
            MaxLength       =   2
            TabIndex        =   1
            Text            =   "22"
            Top             =   315
            Width           =   330
         End
         Begin VB.Label Label1 
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
            Left            =   1635
            TabIndex        =   35
            Top             =   360
            Width           =   450
         End
         Begin VB.Label Label2 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "融資日付"
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
            Left            =   4470
            TabIndex        =   34
            Top             =   345
            Width           =   900
         End
         Begin VB.Label Label3 
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
            Left            =   7440
            TabIndex        =   33
            Top             =   345
            Width           =   225
         End
         Begin VB.Label Label4 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "年"
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
            Left            =   6120
            TabIndex        =   32
            Top             =   345
            Width           =   225
         End
         Begin VB.Label Label5 
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
            Left            =   6765
            TabIndex        =   31
            Top             =   345
            Width           =   225
         End
         Begin VB.Label Label10 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "％"
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
            Left            =   3150
            TabIndex        =   30
            Top             =   360
            Width           =   225
         End
         Begin VB.Label Label11 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "．"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   225
            Left            =   2625
            TabIndex        =   29
            Top             =   390
            Width           =   255
         End
      End
      Begin VB.Frame Frame1 
         Appearance      =   0  'ﾌﾗｯﾄ
         Caption         =   "給与返済分"
         ForeColor       =   &H00000000&
         Height          =   2955
         Left            =   75
         TabIndex        =   27
         Top             =   855
         Width           =   14130
         Begin FPSpread.vaSpread sprList 
            Height          =   2490
            Index           =   0
            Left            =   705
            TabIndex        =   12
            TabStop         =   0   'False
            Top             =   300
            Width           =   12870
            _Version        =   196608
            _ExtentX        =   22701
            _ExtentY        =   4392
            _StockProps     =   64
            MaxCols         =   11
            MaxRows         =   0
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt120.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
      End
      Begin VB.Frame Frame2 
         Appearance      =   0  'ﾌﾗｯﾄ
         Caption         =   "賞与返済分"
         ForeColor       =   &H00000000&
         Height          =   2940
         Left            =   75
         TabIndex        =   26
         Top             =   3885
         Width           =   14130
         Begin FPSpread.vaSpread sprList 
            Height          =   2490
            Index           =   1
            Left            =   720
            TabIndex        =   13
            TabStop         =   0   'False
            Top             =   270
            Width           =   12870
            _Version        =   196608
            _ExtentX        =   22701
            _ExtentY        =   4392
            _StockProps     =   64
            MaxCols         =   11
            MaxRows         =   0
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt120.frx":05BB
            VisibleCols     =   500
            VisibleRows     =   500
         End
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
         Height          =   435
         Index           =   0
         Left            =   11775
         TabIndex        =   5
         Top             =   6900
         Width           =   1125
      End
      Begin VB.CommandButton cmdPrint 
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
         Left            =   13065
         TabIndex        =   6
         Top             =   6900
         Width           =   1125
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   1395
         Top             =   1215
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
   End
   Begin VB.PictureBox Picture1 
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
      Height          =   330
      Left            =   0
      ScaleHeight     =   270
      ScaleWidth      =   14265
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   7425
      Width           =   14325
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
         Top             =   0
         Width           =   12405
      End
   End
   Begin VB.PictureBox picPfMenu 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   8.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   0
      ScaleHeight     =   420
      ScaleWidth      =   14265
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   7785
      Width           =   14325
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
         Left            =   13080
         TabIndex        =   11
         Top             =   30
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
         Left            =   11895
         TabIndex        =   21
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   10710
         TabIndex        =   10
         Top             =   30
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
         Left            =   9525
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   8340
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   7155
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   5970
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   4785
         TabIndex        =   9
         Top             =   30
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
         Left            =   3600
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   2415
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   1230
         TabIndex        =   8
         Top             =   30
         Width           =   1155
      End
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
         Left            =   45
         TabIndex        =   7
         Top             =   30
         Width           =   1155
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   315
      Left            =   0
      TabIndex        =   24
      Top             =   8280
      Width           =   14325
      _ExtentX        =   25268
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   13838
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
            Text            =   "富士通　太郎"
            TextSave        =   "富士通　太郎"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   3351
            MinWidth        =   3351
            Text            =   "0123456789012345"
            TextSave        =   "0123456789012345"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            Text            =   "2001/01/01"
            TextSave        =   "2004/04/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            Text            =   "55:55"
            TextSave        =   "16:28"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmQPAV_CEnt120"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg As Boolean  '初期フラグ
Private blnNoChangeEvFlg As Boolean
Private sglRiritu As Single
'****************************************************************************************************
'*    FORM LOAD イベント
'****************************************************************************************************
Private Sub Form_Load()

    blnInit_Flg = True             '初期フラグ

    '初期画面編集処理
    Call subInitScreen

End Sub
'****************************************************************************************************
'*    FORM UNLOAD イベント
'****************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB

End Sub
'****************************************************************************************************
'*    FORM_ACTIVATE イベント
'****************************************************************************************************
Private Sub Form_Activate()
 Dim i As Long
 Dim intRow As Integer
 Dim varval As Variant

    If blnInit_Flg = True Then     '初期フラグ = オンの場合
        'ステータスバーメッセージ
        stbSystem.Panels.Item(1).Text = "処理中．．．"

        Screen.MousePointer = vbHourglass
        Me.Enabled = False

        DoEvents

        'セッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "返済額一覧表 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If

        'データベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "返済額一覧表 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If

        'トランザクションの開始
        objSession.BeginTrans

        '初期処理用SP（システム日付、処理内容）
        Call gsubSPlnit

        
        Call gsubSpdClear(sprList(0))
        Call gsubSpdClear(sprList(1))
        
        'プレビュー、印刷ボタン無効化
        cmdPrint(0).Enabled = False
        cmdPrint(1).Enabled = False

        'ステータスバーメッセージ消去
        Me.Enabled = True
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""
        
        'ｽﾃｰﾀｽﾊﾞｰ設定
        Call subInitStatusBar(stbSystem)
        
        blnInit_Flg = False           '初期フラグ = オフ

    End If

End Sub
'****************************************************************************************************
'*    FORM KEY DOWN ファンクションキー設定
'****************************************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
 Dim a As Variant

    'ｴﾗｰﾒｯｾｰｼﾞ消去
    lblMsg.Caption = ""

    'ファンクションキー設定
    Select Case KeyCode
         Case vbKeyReturn  'Enter
            SendKeys "{TAB}"
         Case vbKeyF1      'F1
            Call cmdPFK_Click(1)
         Case vbKeyF2      'F2
            Call cmdPFK_Click(2)
         Case vbKeyF5      'F5
            If cmdPFK(5).Enabled = True Then
                Call cmdPFK_Click(5)
                If sprList(0).GetText(11, 10, a) = True Then
                    cmdPrint(0).Enabled = True
                    cmdPrint(1).Enabled = True
                End If
            End If
         Case vbKeyF7      'F7
            Call cmdPFK_Click(7)
         Case vbKeyF8      'F8
            Call cmdPFK_Click(8)
         Case vbKeyF10     'F10
            Call cmdPFK_Click(10)
         Case vbKeyF12     'F12
            Call cmdPFK_Click(12)
    End Select

End Sub
'****************************************************************************************************
'*    FORM KEY PRESS イベント
'****************************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ｴﾗｰﾒｯｾｰｼﾞ消去 & 反転項目解除
    Call subErrorKaijo

    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub
'****************************************************************************************************
'*  ファンクションキークリック処理
'****************************************************************************************************
Private Sub cmdPFK_Click(index As Integer)
 Dim i1 As Integer
 Dim i2 As Integer
 Dim blnJikkou As Boolean
 Dim varval As Variant
 Dim varA As Variant
 Dim intRow As Integer
 Dim intCol As Integer
 Dim lngAnswer As Long
 Dim lngA As Long
 Dim intKaisuu As Integer
 Dim strhairetu As String

    'ｴﾗｰﾒｯｾｰｼﾞ消去
    lblMsg.Caption = ""

    Select Case index

        Case 1     'メニュー
            Unload Me
            Exit Sub

        Case 2     'ハードコピー
            Call gsubQSAV_ActX1001
            lblMsg.Refresh

        Case 5     '実行
            Call subCmdJikkou
            
        Case 10    '前画面
            Unload Me
            Exit Sub

        Case 12    '取消
            Call subCancel

    End Select

End Sub
'****************************************************************************************************
'*    初期画面編集処理
'****************************************************************************************************
Private Sub subInitScreen()
 Dim intRow As Integer
 Dim varval As Variant
 Dim i      As Integer

    Me.Enabled = False
    
    txtRiritu(0).Text = ""
    txtRiritu(1).Text = ""
    txtDateY_Fr.Text = ""
    txtDateM_Fr.Text = ""
    txtDateD_Fr.Text = ""

    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents

'/* Spread Seet 保護 */
    sprList(0).Lock = True
    sprList(1).Lock = True
'/* ステータスバー設定 */
    Call subInitStatusBar(stbSystem)

'/* フォーム名設定 */
    If Me.Caption = "返済額一覧表" Then
        Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    End If
    
    'ステータスバーメッセージ消去
    stbSystem.Panels.Item(1).Text = ""
    lblMsg.Caption = ""


    Me.Enabled = True

End Sub

'**************************************************************************************
'*    実行ボタン
'**************************************************************************************
Private Sub subCmdJikkou()

    'エラー解除
    Call subErrorKaijo
            
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
            
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
    cmdPFK(1).Enabled = False
    cmdPFK(2).Enabled = False
    cmdPFK(10).Enabled = False
    cmdPFK(12).Enabled = False
        
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
            
    '入力項目チェック
    If fncblnNyuuryokuChk = False Then
        Screen.MousePointer = vbNormal
        cmdPFK(5).Enabled = True
        cmdPFK(1).Enabled = True
        cmdPFK(2).Enabled = True
        cmdPFK(10).Enabled = True
        cmdPFK(12).Enabled = True
        stbSystem.Panels.Item(1).Text = ""
        DoEvents
        Exit Sub
    End If
    
    prgBar.Visible = True
    
    Call gSubMakeMeisai 'データ計算
    
    Call gsubSpdClear(sprList(0)) '給与返済分
    Call gsubSpdClear(sprList(1)) '賞与返済分
    sprList(0).MaxRows = 0
    sprList(1).MaxRows = 0
    
    'データセット
    Call subDataSet
    
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    cmdPFK(5).Enabled = True
    cmdPFK(1).Enabled = True
    cmdPFK(2).Enabled = True
    cmdPFK(10).Enabled = True
    cmdPFK(12).Enabled = True
    cmdPrint(0).Enabled = True
    cmdPrint(1).Enabled = True
    
    prgBar.Visible = False

End Sub
'**********************************************************************************************************
'*     キャンセル処理
'**********************************************************************************************************
Private Sub subCancel()
 Dim i As Long

    '一覧表表示状態の場合
    Call gsubSpdClear(sprList(0)) '給与返済分
    Call gsubSpdClear(sprList(1)) '賞与返済分
    sprList(0).MaxRows = 0
    sprList(1).MaxRows = 0
        
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False

    Call subInitScreen '画面初期化

End Sub

'**********************************************************************************************************
'*    入力チェック
'*    引　数　：fncblnNyuuryokuChk
'*    Type　　:Boolean
'*    返却値　：True:OK   False:NG
'*    SP用変数へ格納
'**********************************************************************************************************
Private Function fncblnNyuuryokuChk() As Boolean
 
    fncblnNyuuryokuChk = False
    
    '◆利率のチェック
    If txtRiritu(0).Text & txtRiritu(1).Text = "" Then
        lblMsg.Caption = "利率が入力されていません。"
        txtRiritu(0).BackColor = vbRed
        txtRiritu(1).BackColor = vbRed
        txtRiritu(0).SetFocus
        Exit Function
    End If
        
    '◆融資日_Fromのチェック
    If Trim(txtDateY_Fr.Text & txtDateM_Fr.Text & txtDateD_Fr.Text) = "" Then
        lblMsg.Caption = "日付が未入力です。"
        txtDateY_Fr.SetFocus
        txtDateY_Fr.BackColor = vbRed
        Exit Function
    ElseIf txtDateY_Fr.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtDateY_Fr.SetFocus
        txtDateY_Fr.BackColor = vbRed
        Exit Function
    ElseIf txtDateM_Fr.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtDateM_Fr.SetFocus
        txtDateM_Fr.BackColor = vbRed
        Exit Function
    ElseIf txtDateD_Fr.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtDateD_Fr.SetFocus
        txtDateD_Fr.BackColor = vbRed
        Exit Function
    ElseIf IsDate(Format(Trim$(txtDateY_Fr.Text) & "/" & Trim$(txtDateM_Fr.Text) & "/" & Trim$(txtDateD_Fr.Text), "YYYY/MM/DD")) = False Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtDateY_Fr.BackColor = vbRed
        txtDateM_Fr.BackColor = vbRed
        txtDateD_Fr.BackColor = vbRed
        txtDateY_Fr.SetFocus
        Exit Function
    End If
    
    '利率
    gdblRiritu = CDbl(txtRiritu(0).Text & "." & txtRiritu(1).Text)
    
    '日付
    gstrYuusiBi_Fr = txtDateY_Fr.Text & "/" & txtDateM_Fr.Text & "/" & txtDateD_Fr.Text
    gstrYuusiBi_To = txtDateY_Fr.Text & "/" & txtDateM_Fr.Text & "/" & txtDateD_Fr.Text
    
    fncblnNyuuryokuChk = True

End Function
'*************************************************************************************************
'*  データ計算 >>> データセット
'*************************************************************************************************
Private Sub subDataSet()
 Dim i          As Long
 Dim Y          As Long
 Dim x          As Integer
 
    sprList(0).ReDraw = False
    sprList(1).ReDraw = False
    Call gsubSpdClear(sprList(0))
    Call gsubSpdClear(sprList(1))

    'データセット
    '給与
    Y = 1
    With sprList(0)
        For i = 1 To UBound(gstrKyuuyoAry)
            If Trim$(gstrKyuuyoAry(i).strYuusigaku) <> "" Then
                .MaxRows = Y
                .SetText 1, Y, Format$(gstrKyuuyoAry(i).strYuusigaku, "#,##0") '融資額
                .SetText 2, Y, Format$(gstrKyuuyoAry(i).str06Month, "#,##0")   '　６ヶ月
                .SetText 3, Y, Format$(gstrKyuuyoAry(i).str12Month, "#,##0")   '１２ヶ月
                .SetText 4, Y, Format$(gstrKyuuyoAry(i).str18Month, "#,##0")   '１８ヶ月
                .SetText 5, Y, Format$(gstrKyuuyoAry(i).str24Month, "#,##0")   '２４ヶ月
                .SetText 6, Y, Format$(gstrKyuuyoAry(i).str30Month, "#,##0")   '３０ヶ月
                .SetText 7, Y, Format$(gstrKyuuyoAry(i).str36Month, "#,##0")   '３６ヶ月
                .SetText 8, Y, Format$(gstrKyuuyoAry(i).str42Month, "#,##0")   '４２ヶ月
                .SetText 9, Y, Format$(gstrKyuuyoAry(i).str48Month, "#,##0")   '４８ヶ月
                .SetText 10, Y, Format$(gstrKyuuyoAry(i).str54Month, "#,##0")  '５４ヶ月
                .SetText 11, Y, Format$(gstrKyuuyoAry(i).str60Month, "#,##0")  '６０ヶ月
                Y = Y + 1
            End If
        
        Next i
                
        .MaxRows = .MaxRows + 2
                
        .Row = 1
        .Action = SS_ACTION_INSERT_ROW
        .SetText 1, 1, "毎月10日借入"
        .Col = 1
        .Row = 1
        .TypeHAlign = SS_CELL_H_ALIGN_RIGHT
        .FontSize = 9
        For x = 1 To 11
            .Col = x
            .Row = 1
            .CellBorderType = SS_BORDER_TYPE_RIGHT
            .CellBorderType = SS_BORDER_TYPE_LEFT
            .CellBorderStyle = SS_BORDER_STYLE_SOLID
            .CellBorderColor = vbCyan
            .Action = SS_ACTION_SET_CELL_BORDER
            .BackColor = vbCyan
        Next x
        For x = 1 To 11
            .Col = x
            .Row = 2
            .CellBorderType = SS_BORDER_TYPE_TOP
            .CellBorderStyle = SS_BORDER_STYLE_SOLID
            .CellBorderColor = vbBlue
            .Action = SS_ACTION_SET_CELL_BORDER
        Next x
        
        
        
        .Row = 42
        .Action = SS_ACTION_INSERT_ROW
        .SetText 1, 42, "毎月25日借入"
        .Col = 1
        .Row = 4
        .TypeHAlign = SS_CELL_H_ALIGN_RIGHT
        .FontSize = 9
        For x = 1 To 11
            .Col = x
            .Row = 42
            .CellBorderType = SS_BORDER_TYPE_RIGHT
            .CellBorderType = SS_BORDER_TYPE_LEFT
            .CellBorderStyle = SS_BORDER_STYLE_SOLID
            .CellBorderColor = vbCyan
            .Action = SS_ACTION_SET_CELL_BORDER
            .BackColor = vbCyan
        Next x
        For x = 1 To 11
            .Col = x
            .Row = 43
            .CellBorderType = SS_BORDER_TYPE_TOP
            .CellBorderStyle = SS_BORDER_STYLE_SOLID
            .CellBorderColor = vbBlue
            .Action = SS_ACTION_SET_CELL_BORDER
            .Col = x
            .Row = 41
            .CellBorderType = SS_BORDER_TYPE_BOTTOM
            .CellBorderStyle = SS_BORDER_STYLE_SOLID
            .CellBorderColor = vbBlue
            .Action = SS_ACTION_SET_CELL_BORDER
        Next x
        
        .ReDraw = True
    End With
       
    '賞与
    Y = 1
    With sprList(1)
        For i = 1 To UBound(gstrSyouyoAry)
            If Trim$(gstrSyouyoAry(i).strYuusigaku) <> "" Then
                .MaxRows = Y
                .SetText 1, Y, Format$(gstrSyouyoAry(i).strYuusigaku, "#,##0") '融資額
                .SetText 2, Y, Format$(gstrSyouyoAry(i).str06Kai, "#,##0")   '　６回
                .SetText 3, Y, Format$(gstrSyouyoAry(i).str12Kai, "#,##0")   '１２回
                .SetText 4, Y, Format$(gstrSyouyoAry(i).str18Kai, "#,##0")   '１８回
                .SetText 5, Y, Format$(gstrSyouyoAry(i).str24Kai, "#,##0")   '２４回
                .SetText 6, Y, Format$(gstrSyouyoAry(i).str30Kai, "#,##0")   '３０回
                .SetText 7, Y, Format$(gstrSyouyoAry(i).str36Kai, "#,##0")   '３６回
                .SetText 8, Y, Format$(gstrSyouyoAry(i).str42Kai, "#,##0")   '４２回
                .SetText 9, Y, Format$(gstrSyouyoAry(i).str48Kai, "#,##0")   '４８回
                .SetText 10, Y, Format$(gstrSyouyoAry(i).str54Kai, "#,##0")  '５４回
                .SetText 11, Y, Format$(gstrSyouyoAry(i).str60Kai, "#,##0")  '６０回
                Y = Y + 1
            End If
        Next i
        .ReDraw = True
    End With
    
End Sub

'*******************************************************************************************************
'*    クリスタルレポート
'*******************************************************************************************************
Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
 Dim intRet          As Integer
 Dim strConectPoint  As String
 Dim SyoriNo         As Integer
 Dim CRPath          As String
 Dim WT              As String

    Screen.MousePointer = vbHourglass
    DoEvents

    
    With CrystalReport

        'アクセスするデータベースなどを記述
        strConectPoint = "  DSN = " & gstrCommandLine(0) & _
                         " ;UID = " & gstrCommandLine(3) & _
                         " ;PWD = " & gstrCommandLine(4)


        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAN_HENICHIW"

        '抽出条件を記述する（コンピュータ名）
        .SelectionFormula = "{QPAN_HENICHIW.QPAN_COMPUTERMEI} = '" & gstrCommandLine(5) & "'"

        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then
            .WindowTitle = gcstrPrjName & " (" & gstrCommandLine(8) & ")"
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
        CRPath = App.Path & "\QPAV_CEnt120.rpt"
        
        .ReportFileName = CRPath
        .DiscardSavedData = True

        'クリスタルレポートを実行する
        intRet = .PrintReport
        
        If intRet = 0 Then
            'クリスタルレポートのファイルがある場所を記述する
            CRPath = App.Path & "\QPAV_CEnt121.rpt"
            .ReportFileName = CRPath
            'クリスタルレポートを実行する
            intRet = .PrintReport
        ElseIf intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            'エラーメッセージ表示
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If

    End With

    Screen.MousePointer = vbNormal

    Exit Sub

errPrintReport:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub
'***********************************************************************************************************
'*    帳票印刷用 SP 発行(印刷用テーブルに登録)
'*        返却値：Boolean       True=OK     False=NG
'***********************************************************************************************************
Private Function fncblnPrintAdd() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim OraPArray1        As Object       '↑のデータ配列用
 Dim OraPArray2        As Object       '↑のデータ配列用
 Dim OraPArray3        As Object       '↑のデータ配列用
 Dim OraPArray4        As Object       '↑のデータ配列用
 Dim OraPArray5        As Object       '↑のデータ配列用
 Dim OraPArray6        As Object       '↑のデータ配列用
 Dim OraPArray7        As Object       '↑のデータ配列用
 Dim OraPArray8        As Object       '↑のデータ配列用
 Dim OraPArray9        As Object       '↑のデータ配列用
 Dim OraPArray10        As Object       '↑のデータ配列用
 Dim OraPArray11        As Object       '↑のデータ配列用
 Dim OraPArray12        As Object       '↑のデータ配列用
 Dim j                 As Long
 Const cnsMaxRec       As Long = 1500  '一回で出力する最大行数 '''''
 Const cnslngAryCnt    As Long = 100   '配列の件数  及び、１回で取得するＭＡＸの件数

On Error GoTo errfncblnPrintAdd

    fncblnPrintAdd = False
    
    
    'ＳＰ
    '配列件数
    odbDatabase.Parameters.Add "InNumAryCount", glngPrintCnt, ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
    'コンピューター名
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_VARCHAR2
    '融資日
    odbDatabase.Parameters.Add "InStrYuushiDate", gstrYuushiDate, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYuushiDate").ServerType = ORATYPE_VARCHAR2
    '利率
    odbDatabase.Parameters.Add "InStrRiritu", gsglRiritu, ORAPARM_INPUT
        odbDatabase.Parameters("InStrRiritu").ServerType = ORATYPE_NUMBER
    '給与賞与区分
    odbDatabase.Parameters.AddTable "InStrKSKbnAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray12 = odbDatabase.Parameters("InStrKSKbnAry")
    '融資額配列
    odbDatabase.Parameters.AddTable "InStrYuushigakuAry", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray1 = odbDatabase.Parameters("InStrYuushigakuAry")
    '支払い配列６
    odbDatabase.Parameters.AddTable "InStrShiharai1Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray2 = odbDatabase.Parameters("InStrShiharai1Ary")
    '支払い配列１２
    odbDatabase.Parameters.AddTable "InStrShiharai2Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray3 = odbDatabase.Parameters("InStrShiharai2Ary")
    '支払い配列１８
    odbDatabase.Parameters.AddTable "InStrShiharai3Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray4 = odbDatabase.Parameters("InStrShiharai3Ary")
    '支払い配列２４
    odbDatabase.Parameters.AddTable "InStrShiharai4Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray5 = odbDatabase.Parameters("InStrShiharai4Ary")
    '支払い配列３０
    odbDatabase.Parameters.AddTable "InStrShiharai5Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray6 = odbDatabase.Parameters("InStrShiharai5Ary")
    '支払い配列３６
    odbDatabase.Parameters.AddTable "InStrShiharai6Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray7 = odbDatabase.Parameters("InStrShiharai6Ary")
    '支払い配列４２
    odbDatabase.Parameters.AddTable "InStrShiharai7Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray8 = odbDatabase.Parameters("InStrShiharai7Ary")
    '支払い配列４８
    odbDatabase.Parameters.AddTable "InStrShiharai8Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray9 = odbDatabase.Parameters("InStrShiharai8Ary")
    '支払い配列５４
    odbDatabase.Parameters.AddTable "InStrShiharai9Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray10 = odbDatabase.Parameters("InStrShiharai9Ary")
    '支払い配列６０
    odbDatabase.Parameters.AddTable "InStrShiharai10Ary", ORAPARM_INPUT, ORATYPE_VARCHAR2, cnsMaxRec, 18
    Set OraPArray11 = odbDatabase.Parameters("InStrShiharai10Ary")
        
        
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintAdd("
    strSQL = strSQL & " :InNumAryCount"
    strSQL = strSQL & ",:InStrCOMPUTERMEI"
    strSQL = strSQL & ",:InStrYuushiDate"
    strSQL = strSQL & ",:InStrRiritu"
    strSQL = strSQL & ",:InStrKSKbnAry"
    strSQL = strSQL & ",:InStrYuushigakuAry"
    strSQL = strSQL & ",:InStrShiharai1Ary"
    strSQL = strSQL & ",:InStrShiharai2Ary"
    strSQL = strSQL & ",:InStrShiharai3Ary"
    strSQL = strSQL & ",:InStrShiharai4Ary"
    strSQL = strSQL & ",:InStrShiharai5Ary"
    strSQL = strSQL & ",:InStrShiharai6Ary"
    strSQL = strSQL & ",:InStrShiharai7Ary"
    strSQL = strSQL & ",:InStrShiharai8Ary"
    strSQL = strSQL & ",:InStrShiharai9Ary"
    strSQL = strSQL & ",:InStrShiharai10Ary); END;"
    
    i = 1   '変数のクリア
    
    Do Until i > glngPrintCnt
        For j = 1 To cnsMaxRec
            If i > glngPrintCnt Then
                Exit For
            End If
            OraPArray1.Put_value gvarYuushigaku(i), (j - 1)
            OraPArray2.Put_value gvarShiharai1(i), (j - 1)
            OraPArray3.Put_value gvarShiharai2(i), (j - 1)
            OraPArray4.Put_value gvarShiharai3(i), (j - 1)
            OraPArray5.Put_value gvarShiharai4(i), (j - 1)
            OraPArray6.Put_value gvarShiharai5(i), (j - 1)
            OraPArray7.Put_value gvarShiharai6(i), (j - 1)
            OraPArray8.Put_value gvarShiharai7(i), (j - 1)
            OraPArray9.Put_value gvarShiharai8(i), (j - 1)
            OraPArray10.Put_value gvarShiharai9(i), (j - 1)
            OraPArray11.Put_value gvarShiharai10(i), (j - 1)
            OraPArray12.Put_value gstrKSKbn(i), (j - 1)
            i = i + 1
        Next j
        
        '配列件数の値セット
        odbDatabase.Parameters("InNumAryCount").Value = j - 1
        
        'ＳＱＬ文の実行
        odbDatabase.DbexecuteSQL (strSQL)
    
    Loop


    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    fncblnPrintAdd = True

    Exit Function

errfncblnPrintAdd:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'***********************************************************************************************************
'*    プリント用テーブルからデータ削除
'*        返却値：Boolean       True=OK     False=NG
'***********************************************************************************************************
Private Function fncblnPrintDel() As Boolean
 Dim strSQL            As String
 Dim i                 As Long
 Dim OraPArray1        As Object       '↑のデータ配列用
 Dim j                 As Long
 Const cnsMaxRec       As Long = 1500  '一回で出力する最大行数 '''''
 Const cnslngAryCnt    As Long = 100   '配列の件数  及び、１回で取得するＭＡＸの件数
 
On Error GoTo errfncblnPrintDel

    fncblnPrintDel = False

    'ＳＰ
    '配列件数
    odbDatabase.Parameters.Add "InNumAryCount", glngPrintCnt, ORAPARM_INPUT
        odbDatabase.Parameters("InNumAryCount").ServerType = ORATYPE_NUMBER
        
    'コンピューター名
    odbDatabase.Parameters.Add "InStrCOMPUTERMEI", gstrCommandLine(5), ORAPARM_INPUT
        odbDatabase.Parameters("InStrCOMPUTERMEI").ServerType = ORATYPE_NUMBER
        
             strSQL = "BEGIN QPAP_CEnt120PkG.QPAP_CEnt120PrintDel("
    strSQL = strSQL & " :InNumAryCount"
    strSQL = strSQL & ",:InStrCOMPUTERMEI); END;"
    
    'ＳＱＬ文実行
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    fncblnPrintDel = True

    Exit Function

errfncblnPrintDel:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'****************************************************************************
'*    印刷プレビューボタン_Click イベント
'****************************************************************************
Private Sub cmdPrint_Click(index As Integer)
 Dim strErrMsg As String 'エラーメッセージ
 Dim strWrk    As String

    Screen.MousePointer = vbHourglass

    '印刷用テーブルからデータを削除
    If gfncblnDelPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    '帳票用データ作成
    If gfncblnMakPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    Select Case index
        Case 0
            If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "返済額一覧表") = vbCancel Then
                '印刷用テーブルからデータを削除
                If gfncblnDelPrintDat = False Then
                    Screen.MousePointer = vbNormal
                    Exit Sub
                End If
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
            'クリスタルレポート呼出
            Call subPrintReport(crptToWindow)
        
        Case 1
            If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "返済額一覧表") = vbCancel Then
                '印刷用テーブルからデータを削除
                If gfncblnDelPrintDat = False Then
                    Screen.MousePointer = vbNormal
                    Exit Sub
                End If
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
            'クリスタルレポート呼出
            Call subPrintReport(crptToPrinter)
    End Select
        
    '印刷用テーブルからデータを削除
    If gfncblnDelPrintDat = False Then
        Screen.MousePointer = vbNormal
        Exit Sub
    End If

    Screen.MousePointer = vbNormal

End Sub

'**********************************************************************************************************
'*    エラー項目の Backcolor 赤 を戻す
'*    エラーメッセージをクリアする
'**********************************************************************************************************
Private Sub subErrorKaijo()
    'エラーメッセージクリア
    lblMsg.Caption = ""
    
    'エラー項目Backcolorを戻す
    txtDateY_Fr.BackColor = vbWhite
    txtDateM_Fr.BackColor = vbWhite
    txtDateD_Fr.BackColor = vbWhite
    txtRiritu(0).BackColor = vbWhite
    txtRiritu(1).BackColor = vbWhite
End Sub

'***************************************************************************************
'*    フル桁脱出
'***************************************************************************************
Private Sub txtRiritu_Change(index As Integer)
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtRiritu(index), 2)
End Sub
Private Sub txtDateY_fr_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtDateY_Fr, 4)
End Sub
Private Sub txtDateM_fr_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtDateM_Fr, 2)
End Sub
'***************************************************************************************
'*    入力文字制御
'***************************************************************************************
Private Sub txtRiritu_KeyPress(index As Integer, KeyAscii As Integer)
    If index = 0 Then
        If KeyAscii = 46 Then
            SendKeys Chr$(9), True
        End If
    End If
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateY_FR_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateM_FR_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateD_FR_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateY_TO_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateM_TO_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtDateD_TO_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
'**********************************************************************************************************
'*    LostFocus Event  フォーマット
'**********************************************************************************************************
Private Sub txtriritu_LostFocus(index As Integer)
    blnNoChangeEvFlg = True
        If index = 0 Then
            If Len(txtRiritu(index).Text) <> 2 Then txtRiritu(index).Text = Format$(txtRiritu(index).Text, "#0")
        ElseIf index = 1 Then
            If Len(txtRiritu(index).Text) <> 2 Then txtRiritu(index).Text = Format$(txtRiritu(index).Text, "00")
        End If
    blnNoChangeEvFlg = False
End Sub
Private Sub txtDateM_fr_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtDateM_Fr.Text) <> 2 Then txtDateM_Fr.Text = Format$(txtDateM_Fr.Text, "00")
    blnNoChangeEvFlg = False
End Sub
Private Sub txtDateD_fr_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtDateD_Fr.Text) <> 2 Then txtDateD_Fr.Text = Format$(txtDateD_Fr.Text, "00")
    blnNoChangeEvFlg = False
End Sub

'***************************************************************************************
'*    テキスト選択
'***************************************************************************************
Private Sub txtRiritu_GotFocus(index As Integer)
    Call gsubSelectText(txtRiritu(index))
End Sub
Private Sub txtDateY_fr_GotFocus()
    Call gsubSelectText(txtDateY_Fr)
End Sub
Private Sub txtDateM_fr_GotFocus()
    Call gsubSelectText(txtDateM_Fr)
End Sub
Private Sub txtDateD_fr_GotFocus()
    Call gsubSelectText(txtDateD_Fr)
End Sub

'*********************************************************************************************
'*　　手続き名：　ステータスバーを初期化
'*　　引　数　：　引数１　ステータスバーオブジェクト
'*　　機能概要：　オペレータ名、コンピュータ名を表示
'*********************************************************************************************
Public Sub subInitStatusBar(objStb As StatusBar)
    
    '第２パネル：オペレータ名を表示
    objStb.Panels.Item(2).Text = gstrCommandLine(2)
    
    '第３パネル：コンピュータ名を表示
    objStb.Panels.Item(3).Text = gstrCommandLine(5)
    
End Sub

