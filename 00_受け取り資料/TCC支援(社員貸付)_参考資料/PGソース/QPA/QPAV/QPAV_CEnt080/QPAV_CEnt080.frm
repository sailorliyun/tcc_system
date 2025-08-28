VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt080 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "社員融資台帳"
   ClientHeight    =   8580
   ClientLeft      =   330
   ClientTop       =   2025
   ClientWidth     =   14355
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
   ScaleHeight     =   8580
   ScaleWidth      =   14355
   StartUpPosition =   2  '画面の中央
   Begin VB.PictureBox Picture1 
      Height          =   7320
      Left            =   0
      ScaleHeight     =   7260
      ScaleWidth      =   14280
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   0
      Width           =   14340
      Begin VB.Frame Frame2 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   5730
         Left            =   90
         TabIndex        =   44
         Top             =   1440
         Width           =   14085
         Begin FPSpread.vaSpread sprList 
            Height          =   4755
            Left            =   495
            TabIndex        =   3
            Top             =   285
            Width           =   13020
            _Version        =   196608
            _ExtentX        =   22966
            _ExtentY        =   8387
            _StockProps     =   64
            AllowCellOverflow=   -1  'True
            MaxCols         =   10
            MaxRows         =   20
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt080.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
         Begin VB.CommandButton cmdSyori 
            Caption         =   "登 録"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   0
            Left            =   5250
            TabIndex        =   4
            Top             =   5160
            Width           =   1095
         End
         Begin VB.CommandButton cmdSyori 
            Caption         =   "修 正"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   1
            Left            =   6585
            TabIndex        =   5
            Top             =   5160
            Width           =   1095
         End
         Begin VB.CommandButton cmdSyori 
            Caption         =   "削 除"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   2
            Left            =   7890
            TabIndex        =   6
            Top             =   5160
            Width           =   1095
         End
         Begin Crystal.CrystalReport CrystalReport 
            Left            =   360
            Top             =   5115
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   348160
            PrintFileLinesPerPage=   60
         End
      End
      Begin VB.Frame Frame1 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   1395
         Left            =   90
         TabIndex        =   24
         Top             =   15
         Width           =   14085
         Begin VB.TextBox txtSyainCd 
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
            Index           =   1
            Left            =   2790
            MaxLength       =   7
            TabIndex        =   1
            Top             =   210
            Width           =   930
         End
         Begin VB.TextBox txtSyainCd 
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
            Index           =   0
            Left            =   2520
            MaxLength       =   1
            TabIndex        =   0
            Top             =   210
            Width           =   240
         End
         Begin VB.CommandButton cmdNayose 
            Caption         =   "名 寄 せ"
            Height          =   360
            Left            =   3765
            TabIndex        =   2
            Top             =   195
            Width           =   1170
         End
         Begin VB.Label Label1 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "社員コード"
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
            Left            =   960
            TabIndex        =   43
            Top             =   240
            Width           =   1125
         End
         Begin VB.Label Label11 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "資 格"
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
            Left            =   10230
            TabIndex        =   42
            Top             =   240
            Width           =   570
         End
         Begin VB.Label Label5 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "社員氏名漢字"
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
            Left            =   960
            TabIndex        =   41
            Top             =   1080
            Width           =   1350
         End
         Begin VB.Label Label13 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "級"
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
            Left            =   10230
            TabIndex        =   40
            Top             =   660
            Width           =   225
         End
         Begin VB.Label Label14 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "生年月日"
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
            Left            =   10230
            TabIndex        =   39
            Top             =   1080
            Width           =   900
         End
         Begin VB.Label Label16 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "所属部門"
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
            Left            =   6000
            TabIndex        =   38
            Top             =   1080
            Width           =   900
         End
         Begin VB.Label Label17 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "所属店"
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
            Left            =   6000
            TabIndex        =   37
            Top             =   240
            Width           =   675
         End
         Begin VB.Label lblShimeiKana 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   2520
            TabIndex        =   36
            Top             =   660
            Width           =   120
         End
         Begin VB.Label lblShimeiKanji 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   2520
            TabIndex        =   35
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblSikakuCd 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   11400
            TabIndex        =   34
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblMiseCd 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   7170
            TabIndex        =   33
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblKyuu 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   11400
            TabIndex        =   32
            Top             =   660
            Width           =   120
         End
         Begin VB.Label lblBumonCd 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   7170
            TabIndex        =   31
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblBirthday 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   11400
            TabIndex        =   30
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblMiseName 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   8100
            TabIndex        =   29
            Top             =   240
            Width           =   120
         End
         Begin VB.Label lblBumonName 
            AutoSize        =   -1  'True
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
            Height          =   225
            Left            =   8100
            TabIndex        =   28
            Top             =   1080
            Width           =   120
         End
         Begin VB.Label lblTozai 
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
            Height          =   285
            Left            =   7170
            TabIndex        =   27
            Top             =   660
            Width           =   795
         End
         Begin VB.Label Label13 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "東西区分"
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
            Index           =   1
            Left            =   6000
            TabIndex        =   26
            Top             =   660
            Width           =   900
         End
         Begin VB.Label Label2 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "社員氏名カナ"
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
            Left            =   960
            TabIndex        =   25
            Top             =   660
            Width           =   1350
         End
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   345
      Left            =   0
      TabIndex        =   22
      Top             =   8235
      Width           =   14355
      _ExtentX        =   25321
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14102
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "2009/07/10"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:12"
         EndProperty
      EndProperty
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
      ScaleWidth      =   14280
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   7755
      Width           =   14340
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
         TabIndex        =   12
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
         Index           =   4
         Left            =   3600
         TabIndex        =   13
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
         Index           =   6
         Left            =   5970
         TabIndex        =   14
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
         TabIndex        =   15
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
         Left            =   8355
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
         Index           =   9
         Left            =   9540
         TabIndex        =   17
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
         Left            =   10725
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
         Index           =   11
         Left            =   11910
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   30
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
         Left            =   13095
         TabIndex        =   11
         Top             =   30
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
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   14280
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   7335
      Width           =   14340
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
End
Attribute VB_Name = "frmQPAV_CEnt080"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg As Boolean           '初期フラグ
Private blnNoChangeEvFlg As Boolean      'ﾁｪﾝｼﾞｲﾍﾞﾝﾄ無効ﾌﾗｸﾞ
Private Const cnsNumeric = "0123456789 "
'******************************************************************************
'*    登録 , 修正 , 削除ボタン押下時処理
'******************************************************************************
Private Sub cmdSyori_Click(Index As Integer)
 Dim S As Variant
 
    Select Case Index
    
    Case 0
        Call subSyori(Index)
    Case Else
    
        'ｽﾌﾟﾚｯﾄﾞの内容の有無ﾁｪｯｸ
        If sprList.GetText(1, sprList.ActiveRow, S) = True Then
    
            '修正・削除は 融資額 = 残高のときのみ更新する。
            If CLng(gVarSpdGetText(sprList, 5, sprList.ActiveRow)) <> CLng(gVarSpdGetText(sprList, 8, sprList.ActiveRow)) Then
                lblMsg.Caption = "残高と融資額が一致していない為処理できません。"
                txtSyainCd(0).Enabled = True
                txtSyainCd(1).Enabled = True
                txtSyainCd(1).SetFocus
                Exit Sub
            End If

            Call subSyori(Index)
        End If
    
    End Select

End Sub
'******************************************************************************
'*    FORM_LOAD ｲﾍﾞﾝﾄ
'******************************************************************************
Private Sub Form_Load()
    
    Me.Caption = "社員融資台帳 (" & gstrCommandLine(8) & ")"
    
    blnInit_Flg = True
    
    '■画面初期化
    Call subFormInitialize
    
    blnNoChangeEvFlg = True

End Sub
'******************************************************************************
'*    FORM_UNLOAD ｲﾍﾞﾝﾄ
'******************************************************************************
Private Sub Form_Unload(CANCEL As Integer)

    '排他解除
    Call gsubUnLock

    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
End Sub
'******************************************************************************
'*    FORM_ACTIVATE ｲﾍﾞﾝﾄ
'*    セッションの確立 , データベース確立
'******************************************************************************
Private Sub Form_Activate()
 Dim i As Long

    If blnInit_Flg = True Then     '初期フラグ = オンの場合
    
        'ステータスバーメッセージ
        stbSystem.Panels.Item(1).Text = "処理中．．．"

        Screen.MousePointer = vbHourglass
        Me.Enabled = False

        DoEvents

        '■セッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "社員融資台帳 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            Unload Me
        End If

        '■データベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "社員融資台帳 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            Unload Me
        End If

        '■トランザクションの開始
        objSession.BeginTrans

        '■初期処理用SP呼出(システム日付)
        Call gsubSPInit

        Call gsubSpdClear(sprList)

        '登録、修正、削除ボタン初期無効化
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False

        'ステータスバーメッセージ消去
        Me.Enabled = True
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        blnInit_Flg = False           '初期フラグ = オフ

        '排他解除
        Call gsubUnLock
        
        blnNoChangeEvFlg = False


    End If

End Sub
'******************************************************************************
'*    FORM_KEYDOWN ファンクションキー設定
'******************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    Select Case KeyCode
        Case vbKeyReturn   'Enter
            SendKeys "{TAB}"
        Case vbKeyF1       'F1
            Call cmdPFK_Click(1)
        Case vbKeyF2       'F2
            Call cmdPFK_Click(2)
        Case vbKeyF5       'F5
            If cmdPFK(5).Enabled = True Then
                Call cmdPFK_Click(5)
            End If
        Case vbKeyF10      'F10
            Call cmdPFK_Click(10)
        Case vbKeyF12      'F12
            Call cmdPFK_Click(12)
        Case vbKeyDelete   'DELキーを押した時
            Call Form_KeyPress(46)
    End Select
    
'    If gblnHaitaFlg = True Then
'        frmQPAV_CEnt080!lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")
'    End If
    
End Sub
'******************************************************************************
'*    FORM_KEYPRESS ｲﾍﾞﾝﾄ
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ENTER Beep音消去
    Call subHantenKaijo

    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
        
End Sub
'******************************************************************************
'*    ファンクションキークリック処理
'******************************************************************************
Private Sub cmdPFK_Click(Index As Integer)

    'ｴﾗｰﾒｯｾｰｼﾞ消去
    lblMsg.Caption = ""

    Select Case Index
        Case 1     'メニュー
            Unload Me
            Exit Sub
        Case 2     'ハードコピー
            Call gsubQSAV_ActX1001
            picMsg.Refresh
        Case 5     '実行
            Call subPFK5
        Case 10    '前画面
            Unload Me
            Exit Sub
        Case 12    '取消
            Call subCancel
    End Select

    If gblnHaitaFlg = True Then
'        frmQPAV_CEnt080!lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")  '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
        frmQPAV_CEnt080.lblMsg.Caption = "WHOE11 " & gstrGetCodeMeisyo(odbDatabase, "E11", "WHO")   '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
    End If
    
End Sub
'******************************************************************************
'*    F5「実行」処理
'******************************************************************************
Private Sub subPFK5()

    'ｽﾌﾟﾚｯﾄﾞｸﾘｱ & 社員属性ｸﾘｱ
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    'ｽﾌﾟﾚｯﾄﾞｸﾘｱ
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True     '名寄せ
    cmdPFK(5).Enabled = True     'F5実行
    cmdSyori(0).Enabled = False  '登録
    cmdSyori(1).Enabled = False  '修正
    cmdSyori(2).Enabled = False  '削除
    txtSyainCd(0).Enabled = True '社員コード1
    txtSyainCd(1).Enabled = True '社員コード7
    
    'ｽﾃｰﾀｽﾊﾞｰ初期化
    Call gsubInitStatusBar(stbSystem)
    '■入力チェック
    If fncblnNyuuryokuChk = False Then
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False
        
        gblnHaitaFlg = False
        Exit Sub
    End If
    
    '■排他解除
    Call gsubUnLock

    '■排他制御
    gstrKeyInfo1 = gstrSyainCd1
    gstrKeyInfo2 = gstrSyainCd2
    
    If gblnHaita = False Then
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False
        cmdSyori(1).Enabled = False
        cmdSyori(2).Enabled = False
'        txtSyainCd(0).SetFocus
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        Call gsubSpdClear(Me.sprList)
        Exit Sub
    End If
    
    '■各表示項目クリア
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    Call gsubSpdClear(sprList)
    
    '■社員属性取得SP呼出
    If fncblnSyainDat = False Then Exit Sub
    
    txtSyainCd(0).Enabled = False
    txtSyainCd(1).Enabled = False
    cmdNayose.Enabled = False
           
    '■貸付データ取得SP呼出
    If fncblnKasituke = False Then Exit Sub
    
    '各コントロール有効化
    cmdSyori(0).Enabled = True
    cmdSyori(1).Enabled = True
    cmdSyori(2).Enabled = True
    
End Sub
'******************************************************************************
'*    F7「前頁」処理
'******************************************************************************
Private Sub subPFK7()

    'Msg = 前ページはありません
    If sprList.DataRowCnt = 0 Or sprList.ActiveRow = 1 Then
        lblMsg.Caption = "WHOE09 " & gstrGetCodeMeisyo(odbDatabase, "E09", "WHO")
        Exit Sub
    End If
    sprList.SetFocus
    SendKeys "{PGUP}"
    
End Sub
'******************************************************************************
'*    F8「次頁」処理
'******************************************************************************
Private Sub subPFK8()

    'Msg = 次ページはありません
    If sprList.DataRowCnt = 0 Or sprList.DataRowCnt = sprList.ActiveRow Or _
       sprList.DataRowCnt < sprList.MaxRows And sprList.MaxRows = sprList.ActiveRow Then
        lblMsg.Caption = "WHOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WHO")
        Exit Sub
    End If
    sprList.SetFocus
    SendKeys "{PGDN}"
    
End Sub
'******************************************************************************
'*    画面初期化
'******************************************************************************
Private Sub subFormInitialize()
 
    '各表示項目ｸﾘｱ
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    lblMsg.Caption = ""
    
    'ｽﾌﾟﾚｯﾄﾞｸﾘｱ
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True     '名寄せ
    cmdPFK(5).Enabled = True     'F5実行
    cmdSyori(0).Enabled = False  '登録
    cmdSyori(1).Enabled = False  '修正
    cmdSyori(2).Enabled = False  '削除
    txtSyainCd(0).Enabled = True '社員コード1
    txtSyainCd(1).Enabled = True '社員コード7
    
    'ｽﾃｰﾀｽﾊﾞｰ初期化
    Call gsubInitStatusBar(stbSystem)
    
    gblnHaitaFlg = False
    
End Sub
'******************************************************************************
'*    ｴﾗｰﾒｯｾｰｼﾞﾎﾞｯｸｽ表示
'******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("社員融資台帳", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "YYYY-MM-DD HH:MM:SS"), _
              frmQPAV_CEnt080.Name, _
              strErrCode, _
              strErrMsg)

End Sub
'******************************************************************************
'*    名寄せ検索ボタン
'******************************************************************************
Private Sub cmdNayose_Click()
 Dim strSyainCd As String

    Me.Hide

''''    Me.Enabled = False
    
    Call subHantenKaijo

    '名寄せ検索画面表示
    frmQPAV_CEnt082.Show 1

''''    Me.Enabled = True

    Me.Show
        
    If gblnNayoseFlg = True Then
         Call cmdPFK_Click(5)
    End If
    
End Sub
'******************************************************************************
'*    ｴﾗｰ項目の Backcolor 赤 を戻す
'*    ｴﾗｰﾒｯｾｰｼﾞをｸﾘｱする
'******************************************************************************
Private Sub subHantenKaijo()
    'エラーメッセージクリア
    lblMsg.Caption = ""
    
    'エラー項目Backcolorを戻す
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
End Sub
'******************************************************************************
'*    数字のみ入力可にする
'******************************************************************************
Private Sub txtSyainCD_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 0 Then
        Exit Sub ''''社員コード１は文字も入力可能
    End If
    
    KeyAscii = gIntFilterKey(KeyAscii, cnsNumeric)
End Sub
'******************************************************************************
'*    テキスト選択
'******************************************************************************
Private Sub txtSyainCD_GotFocus(Index As Integer)
    Call gsubSelectText(txtSyainCd(Index))
End Sub
'******************************************************************************
'*    フル桁脱出
'******************************************************************************
Private Sub txtSyainCD_Change(Index As Integer)
    If blnNoChangeEvFlg = True Then Exit Sub
    Select Case Index
    Case 0
        Call gsubMaxCharSkipEX(txtSyainCd(0), 1)
    End Select
End Sub
'******************************************************************************
'*    F12「取消」処理
'******************************************************************************
Private Sub subCancel()

    '■排他解除■
    Call gsubUnLock
    
    '各表示項目クリア
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblShimeiKana.Caption = ""
    lblShimeiKanji.Caption = ""
    lblMiseCd.Caption = ""
    lblMiseName.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonName.Caption = ""
    lblSikakuCd.Caption = ""
    lblKyuu.Caption = ""
    lblBirthday.Caption = ""
    
    Call subHantenKaijo
    
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    cmdNayose.Enabled = True
    cmdSyori(0).Enabled = False
    cmdSyori(1).Enabled = False
    cmdSyori(2).Enabled = False
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    
    Call subInitScreen '画面初期化
    
    txtSyainCd(0).SetFocus

End Sub
'******************************************************************************
'*    入力チェック
'******************************************************************************
Private Function fncblnNyuuryokuChk()

fncblnNyuuryokuChk = False
    
    Call subHantenKaijo
    
    '■社員番号入力チェック
    If Trim$(txtSyainCd(0).Text) = "" Then
        gstrSyainCd1 = " "
    Else
        gstrSyainCd1 = txtSyainCd(0).Text
    End If
    
    If Len(Trim$(txtSyainCd(1).Text)) = 7 Then
        gstrSyainCd2 = Trim$(txtSyainCd(1).Text)
    Else
        lblMsg.Caption = "入力に誤りがあります。"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    End If
    
fncblnNyuuryokuChk = True
    
End Function
'******************************************************************************
'*    社員貸付一覧データ取得 SP発行
'******************************************************************************
Private Function fncblnKasituke() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '配列の件数  及び、１回で取得するＭＡＸの件数

On Error GoTo errfncblnKasituke

    fncblnKasituke = False

    lngSpCnt = 0

    '社員コード１
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '社員コード２
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '最大配列格納件数
    odbDatabase.Parameters.Add "InNumMaxRec", cnslngAryCnt, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '呼出回数
    odbDatabase.Parameters.Add "IoNumSpCnt", lngSpCnt, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '会員データ配列
    odbDatabase.Parameters.AddTable "OtStrDatAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, 200    '100行・200桁

    'SQL文作成
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080GetList("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InNumMaxRec"
    strSQL = strSQL & ",:IoNumSpCnt"
    strSQL = strSQL & ",:OtNumRecCount"
    strSQL = strSQL & ",:OtNumAryCount"
    strSQL = strSQL & ",:OtStrEndFlg"
    strSQL = strSQL & ",:OtStrDatAry); END;"

    i = 1               '変数のクリア
    lngSprStartCnt = 0
    lngSprEndCnt = 0

    sprList.ReDraw = False
    Do
        'SP実行
        odbDatabase.DbexecuteSQL (strSQL)
        
        If i = 1 Then
            '■該当ﾃﾞｰﾀ有無確認
            If odbDatabase.Parameters("OtNumAryCount") = 0 Then
                Call subSyainData(2)
                Call gsubParaRemove(odbDatabase)
                sprList.ReDraw = True
                Exit Function
            End If

            '■一覧の行数設定■
            sprList.MaxRows = odbDatabase.Parameters("OtNumAryCount")
        End If

        '一覧のデータ内容を設定する開始位置
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1

        '一覧の終了位置
'        lngSprEndCnt = lngSprEndCnt + odbDatabase.Parameters("OtNumAryCount")      '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
        lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount"))  '【Win2000対応】Add by Yokoyama@NBC 2004/04/16

        '一覧表 項目セット
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)

        i = i + 1

    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    sprList.ReDraw = True

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnKasituke = True

    Exit Function

errfncblnKasituke:
'エラー処理

    'エラーメッセージ表示
    
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    該当データ無処理
'*    引数： 1 = 社員属性, 2 = 貸付データ
'******************************************************************************
Private Sub subSyainData(intData As Integer)

    Select Case intData

    Case 1 '社員属性

        '名寄せボタンのみ表示
        cmdNayose.Enabled = True
        cmdSyori(0).Enabled = False '登録
        cmdSyori(1).Enabled = False '修正
        cmdSyori(2).Enabled = False '削除

        'エラーメッセージ表示
        lblMsg.Caption = "入力された社員コードは存在しません。"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        
        '各表示項目クリア
        lblShimeiKana.Caption = ""
        lblShimeiKanji.Caption = ""
        lblMiseCd.Caption = ""
        lblMiseName.Caption = ""
        lblTozai.Caption = ""
        lblBumonCd.Caption = ""
        lblBumonName.Caption = ""
        lblSikakuCd.Caption = ""
        lblKyuu.Caption = ""
        lblBirthday.Caption = ""
        
        txtSyainCd(0).SetFocus
    
    Case 2 '貸付データ
    
        '名寄せボタン,登録ボタン表示
        cmdSyori(0).Enabled = True  '登録
        cmdSyori(1).Enabled = False '修正
        cmdSyori(2).Enabled = False '削除
    
        'メッセージを表示
        lblMsg.Caption = "貸付データはありません。"
                
        'スプレッドを空に
        Call gsubSpdClear(Me.sprList)

    End Select
      
End Sub
'******************************************************************************
'*    初期画面編集処理
'******************************************************************************
Private Sub subInitScreen()

    Me.Enabled = False

    'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents

    'ｽﾌﾟﾚｯﾄﾞｼｰﾄ保護
    sprList.Lock = True

    'ｽﾃｰﾀｽﾊﾞｰ設定
    Call gsubInitStatusBar(stbSystem)

    'ﾌｫｰﾑ名設定
    If Me.Caption = "社員融資台帳" Then
        Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    End If

    'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ消去
    stbSystem.Panels.Item(1).Text = ""
    lblMsg.Caption = ""

    gblnHaitaFlg = False
    
    Me.Enabled = True

    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    
End Sub
'******************************************************************************
'*    入力された社員コードに対応する個人貸付情報一覧を表示
'*    引数： 一覧の開始位置 , 終了位置
'******************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    j = 0
    For i = lngStCnt To lngEdCnt

        strDetail = odbDatabase.Parameters("OtStrDatAry").Get_Value(j)
        j = j + 1
        
        '融資日
        strWk = gfncstrDlm2(strDetail, 1)
        strWk = Trim$(strWk)
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        sprList.SetText 1, i, strWk
        
        '融資種別
        strWk = gfncstrDlm2(strDetail, 14)
        strWk = Trim$(strWk)
        sprList.SetText 2, i, strWk
        
        '契約利率
        strWk = gfncstrDlm2(strDetail, 4)
        strWk = Trim$(Format$(strWk, "#.#0")) & "%"
        sprList.SetText 3, i, strWk
        
        '返済月数
        strWk = gfncstrDlm2(strDetail, 5)
        strWk = Trim$(strWk) & "ヶ月"
        sprList.SetText 4, i, strWk
        
        '給与返済額
        strWk = gfncstrDlm2(strDetail, 6)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 6, i, strWk
        
        '賞与返済額
        strWk = gfncstrDlm2(strDetail, 8)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 7, i, strWk
               
        '給与残高
        strWk = gfncstrDlm2(strDetail, 10)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 9, i, strWk

        '賞与残高
        strWk = gfncstrDlm2(strDetail, 11)
        strWk = Trim$(Format$(strWk, "#,##0"))
        sprList.SetText 10, i, strWk

        '融資額 ( 給与返済額 + 賞与返済額 )
        Dim strKyuyoYusigaku As String '給与融資額
        Dim strSyoyoYusigaku As String '賞与融資額
        Dim strYusigaku As String      '融資額
        
        strKyuyoYusigaku = gfncstrDlm2(strDetail, 6)
        strSyoyoYusigaku = gfncstrDlm2(strDetail, 8)
        strYusigaku = CLng(strKyuyoYusigaku) + CLng(strSyoyoYusigaku)
        strYusigaku = Format$(strYusigaku, "#,##0")
        sprList.SetText 5, i, strYusigaku
        
        '残高 ( 給与残高 + 賞与残高 )
        Dim strKyuyoZandaka As String '給与残高
        Dim strSyoyoZandaka As String '賞与残高
        Dim strZandaka As String      '残高
        
        strKyuyoZandaka = gVarSpdGetText(sprList, 9, i)
        strSyoyoZandaka = gVarSpdGetText(sprList, 10, i)
        strZandaka = CLng(strKyuyoZandaka) + CLng(strSyoyoZandaka)
        strZandaka = Format$(strZandaka, "#,##0")
        sprList.SetText 8, i, strZandaka
                
    Next i
    
    Me.lblMsg.Caption = ""

End Sub
'******************************************************************************
'*    社員データをセット
'******************************************************************************
Private Sub subSyainDsp()
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    strDetail = odbDatabase.Parameters("OtStrDatAry")
    
    '社員氏名カナ
    strWk = gfncstrDlm2(strDetail, 1)
    strWk = Trim$(strWk)
    lblShimeiKana.Caption = strWk
    
    '社員氏名漢字
    strWk = gfncstrDlm2(strDetail, 2)
    strWk = Trim$(strWk)
    lblShimeiKanji.Caption = strWk
    
    '所属店コード
    strWk = gfncstrDlm2(strDetail, 3)
    strWk = Trim$(strWk)
    lblMiseCd.Caption = strWk
    
    '東西区分(1 = 東、2 = 西)
    strWk = gfncstrDlm2(strDetail, 4)
    strWk = Trim$(strWk)
    If strWk = "1" Then
        lblTozai.Caption = "東"
    ElseIf strWk = "2" Then
        lblTozai.Caption = "西"
    Else
        lblTozai.Caption = ""
    End If
    
    '所属部門コード
    strWk = gfncstrDlm2(strDetail, 5)
    strWk = Trim$(strWk)
    lblBumonCd.Caption = strWk
    
    '資格コード
    strWk = gfncstrDlm2(strDetail, 6)
    strWk = Trim$(strWk)
    lblSikakuCd.Caption = strWk
    
    '等級コード
    strWk = gfncstrDlm2(strDetail, 7)
    strWk = Trim$(strWk)
    lblKyuu.Caption = strWk
    
    '生年月日
    strWk = gfncstrDlm2(strDetail, 8)
    strWk = Trim$(strWk)
    If Trim(strWk) = "" Then
    Else
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        lblBirthday.Caption = strWk
    End If
    
    '所属店名称
    strWk = gfncstrDlm2(strDetail, 12)
    strWk = Trim$(strWk)
    lblMiseName.Caption = strWk
    
    '所属部門名称
    strWk = gfncstrDlm2(strDetail, 13)
    strWk = Trim$(strWk)
    lblBumonName.Caption = strWk
     
    '賞与支払日１
    gstrBonusMD1 = gfncstrDlm2(strDetail, 14)
    gstrBonusMD1 = Trim$(gstrBonusMD1)
    
    '賞与支払日２
    gstrBonusMD2 = gfncstrDlm2(strDetail, 15)
    gstrBonusMD2 = Trim$(gstrBonusMD2)

    '証書限度額
    glngSyosyoGendogaku = CLng(gfncstrDlm2(strDetail, 16))
    glngSyosyoGendogaku = Trim$(glngSyosyoGendogaku)
       
End Sub
'******************************************************************************
'*    社員属性取得 SP発行
'*    返却値：Boolean (True=OK , False=NG)
'******************************************************************************
Private Function fncblnSyainDat() As Boolean
 Dim strSQL            As String

On Error GoTo errfncblnSyainDat

    fncblnSyainDat = False

    '■各ﾊﾟﾗﾒｰﾀｾｯﾄ
    '社員番号１
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '社員番号２
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '商品データ配列
    odbDatabase.Parameters.Add "OtStrDatAry", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR2

    '■SQL文作成
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080SyainDat("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:OtStrDatAry); END;"

    '■SP実行
    odbDatabase.DbexecuteSQL (strSQL)

    'MOD 20090416 00807073/0803012 NBC.ishida start
    'If odbDatabase.Parameters("OtStrDatAry") = "" Then      '該当データなし
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) = True Then
    'MOD 20090416 00807073/0803012 NBC.ishida end
        Call subSyainData(1)                                '該当無し処理呼出
        Call gsubParaRemove(odbDatabase)                    'オブジェクトの開放
        sprList.ReDraw = True
        Exit Function
    End If

    '■一覧表 項目セット
    Call subSyainDsp
    
    '■限度額ﾁｪｯｸ
    If glngSyosyoGendogaku = 0 Then
''''文言変更 2002/04/18        lblMsg.Caption = "限度額が設定されていない為、登録処理は行えません。"
        lblMsg.Caption = "登録できません。マスタメンテナンスの確認をして下さい。"
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(0).SetFocus
        Exit Function
    End If

    '■オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnSyainDat = True

    Exit Function

errfncblnSyainDat:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    実行処理
'******************************************************************************
Private Sub subSyori(Index As Integer)

    '■変数に格納
    gstrSyori = cmdSyori(Index).Caption    '処理名
    gstrSyainName = lblShimeiKanji.Caption '社員氏名
    glngSprRow = sprList.ActiveRow         '選択したｽﾌﾟﾚｯﾄﾞの列
    
    '■子画面表示
    frmQPAV_CEnt081.Show 1
    
    '■ｽﾌﾟﾚｯﾄﾞ再表示
    If gblnExecute = True Then
        'ｽﾌﾟﾚｯﾄﾞｸﾘｱ
        Call gsubSpdClear(sprList)
        If fncblnKasituke = False Then
            cmdSyori(1).Enabled = False
            cmdSyori(2).Enabled = False
            Exit Sub
        End If
        cmdSyori(0).Enabled = True
        cmdSyori(1).Enabled = True
        cmdSyori(2).Enabled = True
    End If
    
    Screen.MousePointer = vbNormal

End Sub
