VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt090 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "証書貸付完済入金入力"
   ClientHeight    =   7920
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
   ScaleHeight     =   7920
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   30
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      PrintFileLinesPerPage=   60
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5010
      Left            =   90
      TabIndex        =   26
      Top             =   1410
      Width           =   14250
      Begin VB.CommandButton cmdPrint 
         Caption         =   "完済通知書"
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
         Left            =   11010
         TabIndex        =   7
         Top             =   4440
         Width           =   1455
      End
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1140
         TabIndex        =   3
         Top             =   450
         Width           =   11580
         _Version        =   196608
         _ExtentX        =   20426
         _ExtentY        =   6376
         _StockProps     =   64
         MaxCols         =   14
         MaxRows         =   20
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt090.frx":0000
         UserResize      =   0
         VisibleCols     =   14
         VisibleRows     =   20
      End
      Begin VB.CommandButton cmdexec 
         Caption         =   "完済取消"
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
         Left            =   7860
         TabIndex        =   6
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmdexec 
         Caption         =   "完済修正"
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
         Left            =   6240
         TabIndex        =   5
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmdexec 
         Caption         =   "完済"
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
         Left            =   4620
         TabIndex        =   4
         Top             =   4440
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1350
      Left            =   90
      TabIndex        =   24
      Top             =   60
      Width           =   14250
      Begin VB.TextBox txtSyainCd1 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2130
         MaxLength       =   1
         TabIndex        =   0
         Top             =   330
         Width           =   270
      End
      Begin VB.CommandButton cmdName 
         Caption         =   "名寄せ"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   3570
         TabIndex        =   2
         Top             =   300
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCd2 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2460
         MaxLength       =   7
         TabIndex        =   1
         Top             =   330
         Width           =   900
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "資格"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   10860
         TabIndex        =   43
         Top             =   300
         Width           =   360
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "級"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   2
         Left            =   11010
         TabIndex        =   42
         Top             =   630
         Width           =   180
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "生年月日"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   3
         Left            =   10530
         TabIndex        =   41
         Top             =   990
         Width           =   720
      End
      Begin VB.Label lblShikaku 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11460
         TabIndex        =   40
         Top             =   300
         Width           =   795
      End
      Begin VB.Label lblKyu 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11460
         TabIndex        =   39
         Top             =   630
         Width           =   795
      End
      Begin VB.Label lblSeinengappi 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   11460
         TabIndex        =   38
         Top             =   960
         Width           =   1305
      End
      Begin VB.Label lblBumon 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   285
         Index           =   1
         Left            =   7590
         TabIndex        =   37
         Top             =   990
         Width           =   2775
      End
      Begin VB.Label lblBumon 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   0
         Left            =   6870
         TabIndex        =   36
         Top             =   990
         Width           =   525
      End
      Begin VB.Label Label15 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "所属部門"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5880
         TabIndex        =   35
         Top             =   1020
         Width           =   720
      End
      Begin VB.Label lblTozai 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Left            =   6870
         TabIndex        =   34
         Top             =   660
         Width           =   585
      End
      Begin VB.Label Label13 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "東西区分"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5880
         TabIndex        =   33
         Top             =   660
         Width           =   720
      End
      Begin VB.Label lblShozoku 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   285
         Index           =   1
         Left            =   7590
         TabIndex        =   32
         Top             =   300
         Width           =   2775
      End
      Begin VB.Label lblShozoku 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   0
         Left            =   6870
         TabIndex        =   31
         Top             =   300
         Width           =   525
      End
      Begin VB.Label Label4 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "所属店"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   6030
         TabIndex        =   30
         Top             =   300
         Width           =   540
      End
      Begin VB.Label lblShimei 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   285
         Left            =   2190
         TabIndex        =   29
         Top             =   990
         Width           =   2235
      End
      Begin VB.Label lblKana 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   285
         Left            =   2190
         TabIndex        =   28
         Top             =   720
         Width           =   2235
      End
      Begin VB.Label Label11 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "社員コード"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   1170
         TabIndex        =   27
         Top             =   390
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "社員氏名"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   0
         Left            =   1200
         TabIndex        =   25
         Top             =   870
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   6960
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
         TabIndex        =   8
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   14
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
         TabIndex        =   10
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
         Index           =   7
         Left            =   7200
         TabIndex        =   16
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
         TabIndex        =   17
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
         TabIndex        =   18
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
         TabIndex        =   11
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
         TabIndex        =   19
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
         TabIndex        =   12
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
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   6450
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
         TabIndex        =   22
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   7545
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
            TextSave        =   "2010/02/12"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:35"
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
Attribute VB_Name = "frmQPAV_CEnt090"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'************************************************************************************
'  髙島屋クレジット 支援システム
'    サブシステム名： 社員貸付システム（ＰＡ）
'---------------------------------------
'    機能名　　　　： QPAV_CEnt090     証書貸付完済入金入力
'    機能内容　　　： 証書貸付完済入金入力を行う
'    フォーム　　　： frmQPAV_CEnt090  ： 証書貸付完済入金入力
'---------------------------------------
'   作成日　 ： ????/??/??
'   担当者　 ： FIP
'---------------------------------------
'   修正日　 ： 2005/01/25
'   修正内容 ： 完済通知書印刷機能の追加
'************************************************************************************
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           １．完済日の入力チェックを追加(本日を含む同月未来日のみ可)
'                           ２．分解・分解戻しに対応
'                               ・グリッドと子画面の残高表示に分解戻し中の金額を加える
'                               ・分解戻しを含む契約が完済された場合、分解戻しデータを分解する
'                               ・上記完済が取り消された場合、再び分解戻しにする
'                           ３．賞与の残高取得方法を賞与控除が反映される前の残高を取得するように変更する
'                               (1次の個人貸付明細での対応と同様)
'                           ４．精算金額の計算ロジックを個人貸付明細と同様にする
'                               (最終月が数円安く計算される問題に対応)
'----------------------------------------------------------------------------------------------


'フラグ
Private blnDbFlg               As Boolean    'DB接続   2005/02/14

'帳票出力条件
Private mstrKeyYushibi          As String    '融資日   2005/01/25





'**************************************************************************************************
'*    Form Load
'**************************************************************************************************
Private Sub Form_Load()

    '2005/02/14
    blnDbFlg = False    '初期化

    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    Me.Caption = "証書貸付完済入金入力 (" & gstrCommandLine(8) & ")"
    
    blnLoadFlg = True

    sprList.MaxRows = 0

End Sub
'**************************************************************************************************
'   Form Activate       セッションの確立＆データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "証書貸付入金入力"
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "証書貸付入金入力 (" & gstrCommandLine(8) & ") " _
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
                                    , "証書貸付入金入力 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'DB接続OK    2005/02/14
        blnDbFlg = True
        
        'サーバー日付取得
        Call gsubGetSysDate
        
        'コードテーブル取得 2005/01/26 ADD
        Call gsubGetCode
        
        '画面初期化
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False
   
End Sub

'**************************************************************************************************
'*    Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
'2005/02/14 FROM
'''    '排他解除
'''    Call gblnHaita_Unlock
'''
'''    'ｵﾗｸﾙｾｯｼｮﾝの切断
'''    Call gsubTermOracleDB
    
     'ＤＢ接続ＯＫ
    If blnDbFlg = True Then
    
        'WKテーブル削除
        Call fncblnPrintDataDel

        '排他解除
        Call gblnHaita_Unlock
    
        'ｵﾗｸﾙｾｯｼｮﾝの切断
        Call gsubTermOracleDB
    
    End If
'2005/02/14 TO
    
    Set frmQPAV_CEnt090 = Nothing

End Sub

'**************************************************************************************************
'*    FORM KEYDOWN ファンクションキー設定
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
'**************************************************************************************************
'*    FORM_KEYPRESS
'**************************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    
    'ENTER Beep音消去
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub






'**************************************************************************************************
'    PFキークリック     各ファンクションキー機能
'**************************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
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
            txtSyainCd1.SetFocus
    End Select
    
End Sub


'**************************************************************************************************
'    名寄せボタン クリック
'**************************************************************************************************
Private Sub cmdName_Click()
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCd1 = Left(gstrDat, 1)
        txtSyainCd2 = Right(gstrDat, 7)
        Call cmdPFK_Click(5)
    End If
End Sub


'**************************************************************************************************
'    【完済】【完済修正】【完済取消】 ボタン クリック
'**************************************************************************************************
Private Sub cmdExec_Click(Index As Integer)
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    
    Act_Row = sprList.ActiveRow
    
    Select Case Index
        Case 0
            If gVarSpdGetText(sprList, 10, Act_Row) <> "" Then
                'Msg = するデータを選択してください。
                lblMsg.Caption = "WPOE05 " & cmdExec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
            If gVarSpdGetText(sprList, 7, Act_Row) = 0 Then
                'Msg = 精算する金額がありません。
                lblMsg.Caption = "WPOE33 " & gstrGetCodeMeisyo(odbDatabase, "E33", "WPO")
                Exit Sub
            End If
        Case 1, 2
            If gVarSpdGetText(sprList, 10, Act_Row) = "" Then
                'Msg = するデータを選択してください。
                lblMsg.Caption = "WPOE05 " & cmdExec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
        If DateDiff("y", gVarSpdGetText(sprList, 10, Act_Row), gstrZanYMD) > 0 Then
            'Msg = 最新の残高更新日(）以前の日付は入力できません。
            lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
            Exit Sub
        End If
    End Select
    
    frmQPAV_CEnt091.lblSyainCD1.Caption = txtSyainCd1.Text
    frmQPAV_CEnt091.lblSyainCD2.Caption = txtSyainCd2.Text
    frmQPAV_CEnt091.lblShimei.Caption = lblShimei.Caption
    frmQPAV_CEnt091.lblYuusibiY.Caption = Left(gVarSpdGetText(sprList, 1, Act_Row), 4)
    frmQPAV_CEnt091.lblYuusibiM.Caption = Mid(gVarSpdGetText(sprList, 1, Act_Row), 6, 2)
    frmQPAV_CEnt091.lblYuusibiD.Caption = Right(gVarSpdGetText(sprList, 1, Act_Row), 2)
    frmQPAV_CEnt091.lblRiritu.Caption = gVarSpdGetText(sprList, 2, Act_Row)
    frmQPAV_CEnt091.lblKaisu.Caption = gVarSpdGetText(sprList, 3, Act_Row)
    frmQPAV_CEnt091.lblYuusiKei.Caption = gVarSpdGetText(sprList, 4, Act_Row)
    frmQPAV_CEnt091.lblYuusiKyuuyo.Caption = gVarSpdGetText(sprList, 5, Act_Row)
    frmQPAV_CEnt091.lblYuusiBonus.Caption = gVarSpdGetText(sprList, 6, Act_Row)
    If Index = 1 Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        frmQPAV_CEnt091.lblZanKei.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).SyoyoZan, "#,##0")
'        frmQPAV_CEnt091.lblZanKyuuyo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan, "#,##0")
'        frmQPAV_CEnt091.lblZanBonus.Caption = Format(gtblKeisan(Act_Row).SyoyoZan, "#,##0")
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        '分解戻し分もプラスする
        frmQPAV_CEnt091.lblZanKei.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).SyoyoZan _
                                                 + gtblKeisan(Act_Row).KyuyoMod + gtblKeisan(Act_Row).SyoyoMod, "#,##0")
        frmQPAV_CEnt091.lblZanKyuuyo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan + gtblKeisan(Act_Row).KyuyoMod, "#,##0")
        frmQPAV_CEnt091.lblZanBonus.Caption = Format(gtblKeisan(Act_Row).SyoyoZan + gtblKeisan(Act_Row).SyoyoMod, "#,##0")
        'プラス前の値は非表示ラベルに退避
        frmQPAV_CEnt091.lblZanKyuyoTujo.Caption = Format(gtblKeisan(Act_Row).KyuyoZan, "#,##0") '給与(通常分)
        frmQPAV_CEnt091.lblZanSyoyoTujo.Caption = Format(gtblKeisan(Act_Row).SyoyoZan, "#,##0") '賞与(通常分)
        frmQPAV_CEnt091.lblZanKyuyoModo.Caption = Format(gtblKeisan(Act_Row).KyuyoMod, "#,##0") '給与(戻し分)
        frmQPAV_CEnt091.lblZanSyoyoModo.Caption = Format(gtblKeisan(Act_Row).SyoyoMod, "#,##0") '賞与(戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
    Else
        frmQPAV_CEnt091.lblZanKei.Caption = gVarSpdGetText(sprList, 7, Act_Row)
        frmQPAV_CEnt091.lblZanKyuuyo.Caption = gVarSpdGetText(sprList, 8, Act_Row)
        frmQPAV_CEnt091.lblZanBonus.Caption = gVarSpdGetText(sprList, 9, Act_Row)
'ADD 20100225 0908047 NBC YOKOYAMA START
        'プラス前の値は非表示ラベルに退避
        frmQPAV_CEnt091.lblZanKyuyoTujo.Caption = gVarSpdGetText(sprList, 11, Act_Row) '給与(通常分)
        frmQPAV_CEnt091.lblZanSyoyoTujo.Caption = gVarSpdGetText(sprList, 12, Act_Row) '賞与(通常分)
        frmQPAV_CEnt091.lblZanKyuyoModo.Caption = gVarSpdGetText(sprList, 13, Act_Row) '給与(戻し分)
        frmQPAV_CEnt091.lblZanSyoyoModo.Caption = gVarSpdGetText(sprList, 14, Act_Row) '賞与(戻し分)
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
'    frmQPAV_CEnt091.lblZanKei.Caption = gVarSpdGetText(sprList, 7, Act_Row)
'    frmQPAV_CEnt091.lblZanKyuuyo.Caption = gVarSpdGetText(sprList, 8, Act_Row)
'    frmQPAV_CEnt091.lblZanBonus.Caption = gVarSpdGetText(sprList, 9, Act_Row)
    
    Select Case Index
        Case 0
            frmQPAV_CEnt091.txtNyuukinbiYYYY.Text = Format(gdatSysDate, "yyyy")
            frmQPAV_CEnt091.txtNyuukinbiMM.Text = Format(gdatSysDate, "mm")
            frmQPAV_CEnt091.txtNyuukinbiDD.Text = Format(gdatSysDate, "dd")
        Case 1, 2
            frmQPAV_CEnt091.txtNyuukinbiYYYY.Text = Left(gVarSpdGetText(sprList, 10, Act_Row), 4)
            frmQPAV_CEnt091.txtNyuukinbiMM.Text = Mid(gVarSpdGetText(sprList, 10, Act_Row), 6, 2)
            frmQPAV_CEnt091.txtNyuukinbiDD.Text = Right(gVarSpdGetText(sprList, 10, Act_Row), 2)
    End Select
    
    If cmdExec(Index).Index = 2 Then
        frmQPAV_CEnt091.txtNyuukinbiYYYY.Enabled = False
        frmQPAV_CEnt091.txtNyuukinbiMM.Enabled = False
        frmQPAV_CEnt091.txtNyuukinbiDD.Enabled = False
        frmQPAV_CEnt091.cmdTorikesi.Enabled = False
    Else
        frmQPAV_CEnt091.txtNyuukinbiYYYY.Enabled = True
        frmQPAV_CEnt091.txtNyuukinbiMM.Enabled = True
        frmQPAV_CEnt091.txtNyuukinbiDD.Enabled = True
        frmQPAV_CEnt091.cmdTorikesi.Enabled = True
    End If
    frmQPAV_CEnt091.cmdTouroku.Caption = cmdExec(Index).Caption

    frmQPAV_CEnt091.Show 1
    
    '画面再表示
    If Trim(txtSyainCd1.Text) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = txtSyainCd1.Text
    End If
    gstrCode2 = txtSyainCd2.Text
    
    Call gfuncSPSet
    
End Sub

'***********************************************************************************************************
'*    完済通知書 印刷ボタン クリック
'*    2005/01/25
'***********************************************************************************************************
Private Sub cmdPrint_Click()
    Dim strTmp     As String
    
    'メッセージクリア
    lblMsg.Caption = ""
    
    '完済チェック  選択された行のデータが完済かどうか？
    strTmp = gVarSpdGetText(sprList, 10, sprList.ActiveRow)
    If IsDate(strTmp) = False Then
        'Msg = 選択されたデータは完済されていません。
        lblMsg.Caption = "WPOE05 " & gstrGetCodeMeisyo(odbDatabase, "E38", "WPO")
        Exit Sub
    End If
    
    '印刷・プレビュー
    If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "完済通知書") = vbCancel Then
        Exit Sub
    End If
    
    '画面制御
    MousePointer = vbHourglass
    Me.Enabled = False
    
    '印刷データ作成  ※1件単位なので必ず作成する
    If fncblnPrintDataEdit = False Then
        'データ作成エラー
        Exit Sub
    End If
        
    '画面制御
    Me.Enabled = True
    MousePointer = vbDefault
        
    'プレビュー
    Call sub410PrintRep(crptToWindow)

End Sub









'***********************************************************************************************************
'*    画面初期化
'***********************************************************************************************************
Private Sub subFormInitialize()
    Dim i           As Integer
 
 
    Call subErrKaijo
 
    '排他解除
    Call gblnHaita_Unlock
    
    txtSyainCd1.Text = ""
    txtSyainCd1.Enabled = True
    txtSyainCd2.Text = ""
    txtSyainCd2.Enabled = True
    cmdName.Enabled = True
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblTozai.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        lblShozoku(i).Caption = ""
        lblBumon(i).Caption = ""
    Next i
    For i = 0 To 2
        cmdExec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    
    '2005/01/25 From 完済通知書対応
    frmQPAV_CEnt090.cmdPrint.Enabled = False
    '2005/01/25 To   完済通知書対応
    
    'Spred Sheetの初期化
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
End Sub


'*************************************************************************************************
'*    実行ボタン（PF5）処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String
    Dim i         As Integer
    
    'エラー解除
    Call subErrKaijo
    
    '排他解除
    Call gblnHaita_Unlock
    
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblTozai.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        lblShozoku(i).Caption = ""
        lblBumon(i).Caption = ""
    Next i
    
    If Trim$(txtSyainCd2.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 社員コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCd2.BackColor = vbRed
        txtSyainCd2.Enabled = True
        txtSyainCd2.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
    
    If Trim(txtSyainCd1.Text) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = txtSyainCd1.Text
    End If
    gstrCode2 = txtSyainCd2.Text
    
    '排他制御
    If Not gblnHaita_Lock Then GoTo Exit_subCmdJikkou
    
    If gfuncSeachSyain = False Then
        'Msg = 社員属性が存在しません。
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCd1.SetFocus
        txtSyainCd1.BackColor = vbRed
        txtSyainCd2.BackColor = vbRed
        '排他解除
        Call gblnHaita_Unlock
        GoTo Exit_subCmdJikkou
    End If
    
    If gfuncSPSet = False Then
        txtSyainCd1.SetFocus
        '排他解除
        Call gblnHaita_Unlock
        GoTo Exit_subCmdJikkou
    End If
    
Exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
        
End Sub


'*************************************************************************************************
'*    エラー解除処理
'*************************************************************************************************
Private Sub subErrKaijo()
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCd1.BackColor = vbWhite
    txtSyainCd2.BackColor = vbWhite

End Sub


'*************************************************************************************************
'    エラーメッセージボックスを表示する。
'*************************************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("証書貸付入金入力", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt090.Name, _
              strErrCode, _
              strErrMsg)

End Sub


'2005/01/26 ADD    ** FROM **
'***********************************************************************************
'    印刷データ作成 SP 発行
'        返却値：Boolean       True=OK     False=NG
'***********************************************************************************
Private Function fncblnPrintDataEdit() As Boolean
    Dim strSQL               As String
    Dim i                    As Long
    
    Dim strVal               As String
    Dim strTmpY              As String
    Dim strTmpM              As String
    Dim strTmpD              As String
    Dim datTmp               As Date
    Dim strTmp               As String
    
    Dim strHakkoubi          As String    '発行日
    Dim strTozai             As String    '東西区分
    Dim strTenCd             As String    '所属店コード
    Dim strTenNm             As String    '所属店名称
    Dim strBumonCd           As String    '所属店コード
    Dim strBumonNm           As String    '所属店名称
    Dim strShimei            As String    '氏名
    Dim strSyainCd1          As String    '社員コード１
    Dim strSyainCd2          As String    '社員コード２
    Dim strYushibi           As String    '融資日
    Dim strYushibiWa         As String    '融資日（和暦）
    Dim strYushiKng          As String    '融資金額
    Dim strKansaibi          As String    '完済日
    Dim strKansaibiWa        As String    '完済日（和暦）
    '----------------------------------------------

On Error GoTo fncblnPrintDataEdit_ERR
    
    '初期化
    fncblnPrintDataEdit = False
    
    '■ データ編集
    '発効日
    If IsDate(gdatSysDate) = True Then
        strHakkoubi = Format(gdatSysDate, "ggg e年m月d日発行")
    Else
        strHakkoubi = ""
    End If
    
    '東西区分
    Select Case Mid$(lblTozai.Caption, 1, 1)
        Case "1": strTozai = "東"
        Case "2": strTozai = "西"
        Case Else: strTozai = ""
    End Select
    
    '所属店
    strTenCd = Trim$(lblShozoku(0).Caption)
    strTenNm = Trim$(lblShozoku(1).Caption)
    '所属部門名
    strBumonCd = Trim$(lblBumon(0).Caption)
    strBumonNm = Trim$(lblBumon(1).Caption)
    '氏名
    If Trim$(lblShimei.Caption) = "" Then
        strShimei = Trim$(lblKana.Caption)
    Else
        strShimei = Trim$(lblShimei.Caption)
    End If
    
    '明細
    '社員コード１
    strSyainCd1 = fncstrMojiEdit(txtSyainCd1.Text, 1, 1)
    '社員コード２
    strSyainCd2 = txtSyainCd2.Text
    'ご融資日
    strVal = gVarSpdGetText(sprList, 1, sprList.ActiveRow)
    If IsDate(strVal) = True Then
        strTmpY = Trim$(Format(strVal, "e"))
        strTmpM = Trim$(Format(strVal, "m"))
        strTmpD = Trim$(Format(strVal, "d"))
        strYushibi = strVal
        strYushibiWa = Format(strVal, "ggg") & " " & _
                       IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "年", strTmpY & "年") & _
                       IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "月", strTmpM & "月") & _
                       IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "日", strTmpD & "日")
        mstrKeyYushibi = strYushibi
    Else
        strYushibi = ""
        strYushibiWa = ""
        mstrKeyYushibi = ""
    End If
    'ご融資額
    strVal = gVarSpdGetText(sprList, 4, sprList.ActiveRow)
    If IsNumeric(strVal) = True Then
        strYushiKng = "\" & fncstrMojiEdit(Format(strVal, "#,##0"), 12, 0)
    Else
        strYushiKng = ""
    End If
    'ご契約終了日
    strVal = gVarSpdGetText(sprList, 10, sprList.ActiveRow)
    If IsDate(strVal) = True Then
        strTmpY = Trim$(Format(strVal, "e"))
        strTmpM = Trim$(Format(strVal, "m"))
        strTmpD = Trim$(Format(strVal, "d"))
        strKansaibi = strVal
        strKansaibiWa = Format(strVal, "ggg") & " " & _
                        IIf(Len(strTmpY) = 1, Space(1) & strTmpY & "年", strTmpY & "年") & _
                        IIf(Len(strTmpM) = 1, Space(1) & strTmpM & "月", strTmpM & "月") & _
                        IIf(Len(strTmpD) = 1, Space(1) & strTmpD & "日", strTmpD & "日")
    Else
        strKansaibi = ""
        strKansaibiWa = ""
    End If

    '印刷データ作成 ＳＰ
    '■01■ オペレータID
    odbDatabase.Parameters.Add "InStrOperatorID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrOperatorID").ServerType = ORATYPE_VARCHAR2
    '■02■ 端末ID
    odbDatabase.Parameters.Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerMei").ServerType = ORATYPE_VARCHAR2
    
    '■03■ 社員コード１
    odbDatabase.Parameters.Add "InStrSyainCd1", strSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_VARCHAR2
    '■04■ 社員コード２
    odbDatabase.Parameters.Add "InStrSyainCd2", strSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_VARCHAR2
    '■05■ 融資日
    odbDatabase.Parameters.Add "InStrYushibi", strYushibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushibi").ServerType = ORATYPE_VARCHAR2
    '■06■ 融資日（和暦）
    odbDatabase.Parameters.Add "InStrYushibiWa", strYushibiWa, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushibiWa").ServerType = ORATYPE_VARCHAR2
    '■07■ 表示用社員氏名
    odbDatabase.Parameters.Add "InStrDispNm", strShimei, ORAPARM_INPUT
    odbDatabase.Parameters("InStrDispNm").ServerType = ORATYPE_VARCHAR2
    '■08■ 所属店コード
    odbDatabase.Parameters.Add "InStrTenCd", strTenCd, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTenCd").ServerType = ORATYPE_VARCHAR2
    '■09■ 所属店名称
    odbDatabase.Parameters.Add "InStrTenNm", strTenNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTenNm").ServerType = ORATYPE_VARCHAR2
    '■10■ 東西区分
    odbDatabase.Parameters.Add "InStrTozai", strTozai, ORAPARM_INPUT
    odbDatabase.Parameters("InStrTozai").ServerType = ORATYPE_VARCHAR2
    '■11■ 所属部門コード
    odbDatabase.Parameters.Add "InStrBumonCd", strBumonCd, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonCd").ServerType = ORATYPE_VARCHAR2
    '■12■ 所属部門名称
    odbDatabase.Parameters.Add "InStrBumonNm", strBumonNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrBumonNm").ServerType = ORATYPE_VARCHAR2
    '■13■ 融資金額
    odbDatabase.Parameters.Add "InStrYushiKng", strYushiKng, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYushiKng").ServerType = ORATYPE_VARCHAR2
    '■14■ 完済日
    odbDatabase.Parameters.Add "InStrKansaibi", strKansaibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibi").ServerType = ORATYPE_VARCHAR2
    '■15■ 完済日（和暦）
    odbDatabase.Parameters.Add "InStrKansaibiWa", strKansaibiWa, ORAPARM_INPUT
    odbDatabase.Parameters("InStrKansaibiWa").ServerType = ORATYPE_VARCHAR2
    
    '固定項目
    '■16■ 　　　　 発行日（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkoubi", strHakkoubi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkoubi").ServerType = ORATYPE_VARCHAR2
    '■17■ 　　　　 発行者情報１（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo1", gtblCdT_Hakkousya(1).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo1").ServerType = ORATYPE_VARCHAR2
    '■18■ 　　　　 発行者情報２（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo2", gtblCdT_Hakkousya(2).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo2").ServerType = ORATYPE_VARCHAR2
    '■19■ 　　　　 発行者情報３（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo3", gtblCdT_Hakkousya(3).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo3").ServerType = ORATYPE_VARCHAR2
    '■20■ 　　　　 発行者情報４（完済通知用）
    odbDatabase.Parameters.Add "InStrHakkouInfo4", gtblCdT_Hakkousya(4).Meisyou, ORAPARM_INPUT
    odbDatabase.Parameters("InStrHakkouInfo4").ServerType = ORATYPE_VARCHAR2
    '■21■ 　　　　 ローン名称（完済通知用）
    odbDatabase.Parameters.Add "InStrLoanNm", gstrCdT_LoanNm, ORAPARM_INPUT
    odbDatabase.Parameters("InStrLoanNm").ServerType = ORATYPE_VARCHAR2
    '■22■ 　　　　 完済通知出力者一覧タイトル  ※ここでは使用しないので未設定
    odbDatabase.Parameters.Add "InStrTitle", "", ORAPARM_INPUT
    odbDatabase.Parameters("InStrTitle").ServerType = ORATYPE_VARCHAR2
    
    
    'SQL文 編集
    strSQL = ""
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090InsWkTbl("
    strSQL = strSQL & ":InStrOperatorID,"               '01 オペレータID
    strSQL = strSQL & ":InStrComputerMei,"              '02 端末ID
    
    strSQL = strSQL & ":InStrSyainCd1,"                 '03 社員コード１
    strSQL = strSQL & ":InStrSyainCd2,"                 '04 社員コード２
    strSQL = strSQL & ":InStrYushibi,"                  '05 融資日
    strSQL = strSQL & ":InStrYushibiWa,"                '06 融資日（和暦）
    strSQL = strSQL & ":InStrDispNm,"                   '07 表示用社員氏名
    strSQL = strSQL & ":InStrTenCd,"                    '08 所属店コード
    strSQL = strSQL & ":InStrTenNm,"                    '09 所属店名称
    strSQL = strSQL & ":InStrTozai,"                    '10 東西区分
    strSQL = strSQL & ":InStrBumonCd,"                  '11 所属部門コード
    strSQL = strSQL & ":InStrBumonNm,"                  '12 所属部門名称
    strSQL = strSQL & ":InStrYushiKng,"                 '13 融資金額
    strSQL = strSQL & ":InStrKansaibi,"                 '14 完済日
    strSQL = strSQL & ":InStrKansaibiWa,"               '15 完済日（和暦）
    
    strSQL = strSQL & ":InStrHakkoubi,"                 '16 発行日（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo1,"              '17 発行者情報１（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo2,"              '18 発行者情報２（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo3,"              '19 発行者情報３（完済通知用）
    strSQL = strSQL & ":InStrHakkouInfo4,"              '20 発行者情報４（完済通知用）
    strSQL = strSQL & ":InStrLoanNm,"                   '21 ローン名称（完済通知用）
    strSQL = strSQL & ":InStrTitle "                    '22 完済通知出力者一覧タイトル
    strSQL = strSQL & "); END;"
    
    
    'SP 実行
    odbDatabase.DbexecuteSQL (strSQL)
    
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
    strSQL = strSQL & "BEGIN QPAP_CEnt090PKG.QPAP_CEnt090DelWkTbl("
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
        strJoken = strJoken & " AND {QPAZ_KansaiWT.QPAZ_Yushibi} = '" & mstrKeyYushibi & "'"
        
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
'2005/01/26 ADD    ** TO **














'*************************************************************************************************
'*    社員コード１ Change     ※フル桁脱出
'*************************************************************************************************
Private Sub txtSyainCd1_Change()
'''    Call gsubMaxCharSkipEX(txtSyainCD1, 1)
    If LenB(StrConv(txtSyainCd1.Text, vbFromUnicode)) = 1 Then
        txtSyainCd1.BackColor = vbWhite
        txtSyainCd2.SetFocus
    End If
End Sub
'*************************************************************************************************
'*    社員コード１ GotFocus     ※フォーカス取得時全テキスト選択
'*************************************************************************************************
Private Sub txtSyainCd1_GotFocus()
    Call gsubSelectText(txtSyainCd1)
End Sub



'*************************************************************************************************
'*    社員コード２ Change    ※フル桁脱出
'*************************************************************************************************
Private Sub txtSyainCd2_Change()
    Call gsubMaxCharSkipEX(txtSyainCd2, 7)
End Sub
'*************************************************************************************************
'*    社員コード２ GotFocus     ※フォーカス取得時全テキスト選択
'*************************************************************************************************
Private Sub txtSyainCd2_GotFocus()
    Call gsubSelectText(txtSyainCd2)
End Sub
'*************************************************************************************************
'*    社員コード２ KeyPress     ※入力文字制御（数字のみ）
'*************************************************************************************************
Private Sub txtSyainCd2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub




'2005/01/26 ADD
'*************************************************************************************************
'*    一覧 クリック
'*************************************************************************************************
Private Sub sprList_Click(ByVal Col As Long, ByVal Row As Long)
    'メッセージクリア
    lblMsg.Caption = ""
End Sub









