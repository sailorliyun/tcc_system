VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt510 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "分解・分解戻し入力"
   ClientHeight    =   7215
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
   ScaleHeight     =   7215
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4275
      Left            =   97
      TabIndex        =   21
      Top             =   1440
      Width           =   14190
      Begin VB.CommandButton cmdBunkaiModoshi 
         Caption         =   "分解戻し"
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
         Left            =   8085
         TabIndex        =   41
         Top             =   3720
         Width           =   1455
      End
      Begin VB.CommandButton cmdBunkai 
         Caption         =   "分解"
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
         Left            =   4845
         TabIndex        =   40
         Top             =   3720
         Width           =   1455
      End
      Begin FPSpread.vaSpread sprList 
         Height          =   2970
         Left            =   1132
         TabIndex        =   39
         Top             =   315
         Width           =   12120
         _Version        =   196608
         _ExtentX        =   21378
         _ExtentY        =   5239
         _StockProps     =   64
         MaxCols         =   11
         MaxRows         =   4
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt510.frx":0000
         UserResize      =   0
         VisibleCols     =   11
         VisibleRows     =   4
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   97
      TabIndex        =   19
      Top             =   0
      Width           =   14190
      Begin VB.TextBox txtSyainCD2 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2640
         MaxLength       =   7
         TabIndex        =   1
         Top             =   240
         Width           =   1005
      End
      Begin VB.CommandButton cmdNayose 
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
         Left            =   3720
         TabIndex        =   2
         Top             =   210
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCD1 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2310
         MaxLength       =   1
         TabIndex        =   0
         Top             =   240
         Width           =   285
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
         Left            =   10980
         TabIndex        =   38
         Top             =   240
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
         Left            =   11130
         TabIndex        =   37
         Top             =   570
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
         Left            =   10650
         TabIndex        =   36
         Top             =   930
         Width           =   720
      End
      Begin VB.Label lblShikaku 
         Caption         =   "010"
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
         Left            =   11580
         TabIndex        =   35
         Top             =   240
         Width           =   795
      End
      Begin VB.Label lblKyu 
         Caption         =   "010"
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
         Left            =   11580
         TabIndex        =   34
         Top             =   570
         Width           =   795
      End
      Begin VB.Label lblSeinengappi 
         Caption         =   "010"
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
         Left            =   11580
         TabIndex        =   33
         Top             =   900
         Width           =   2385
      End
      Begin VB.Label lblBumon 
         Caption         =   "ｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱ"
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
         Index           =   1
         Left            =   7680
         TabIndex        =   32
         Top             =   930
         Width           =   2385
      End
      Begin VB.Label lblBumon 
         Caption         =   "999999"
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
         Left            =   6990
         TabIndex        =   31
         Top             =   930
         Width           =   585
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
         Left            =   6000
         TabIndex        =   30
         Top             =   960
         Width           =   720
      End
      Begin VB.Label lblTozai 
         Caption         =   "9"
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
         Left            =   6990
         TabIndex        =   29
         Top             =   600
         Width           =   405
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
         Left            =   6000
         TabIndex        =   28
         Top             =   600
         Width           =   720
      End
      Begin VB.Label lblShozoku 
         Caption         =   "ｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱ"
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
         Index           =   1
         Left            =   7710
         TabIndex        =   27
         Top             =   270
         Width           =   2775
      End
      Begin VB.Label lblShozoku 
         Caption         =   "010"
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
         Left            =   6990
         TabIndex        =   26
         Top             =   240
         Width           =   315
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
         Index           =   1
         Left            =   6150
         TabIndex        =   25
         Top             =   240
         Width           =   540
      End
      Begin VB.Label lblShimei 
         Caption         =   "あああああ　あああああ"
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
         Left            =   2310
         TabIndex        =   24
         Top             =   930
         Width           =   2235
      End
      Begin VB.Label lblKana 
         Caption         =   "ｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱ"
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
         Left            =   2340
         TabIndex        =   23
         Top             =   660
         Width           =   2235
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
         Index           =   4
         Left            =   1410
         TabIndex        =   22
         Top             =   870
         Width           =   720
      End
      Begin VB.Label Label1 
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
         Index           =   0
         Left            =   1350
         TabIndex        =   20
         Top             =   300
         Width           =   810
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
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   6255
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
         TabIndex        =   3
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
         TabIndex        =   4
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
         TabIndex        =   8
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
         TabIndex        =   9
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
         TabIndex        =   5
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
         TabIndex        =   12
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
         TabIndex        =   13
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
         TabIndex        =   6
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
         TabIndex        =   14
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
         TabIndex        =   7
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
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   5790
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
         TabIndex        =   17
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   15
      Top             =   6840
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
            TextSave        =   "2010/03/11"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "12:26"
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
Attribute VB_Name = "frmQPAV_CEnt510"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           新規作成
'----------------------------------------------------------------------------------------------
'20100319  TR1003-011       分解戻し時にメッセージ誤表示
'                           デバッグ用のメッセージボックスを削除する
'----------------------------------------------------------------------------------------------

Private blnInit_Flg         As Boolean           '初期フラグ

'**************************************************************************************************
'*Formロード
'**************************************************************************************************
Private Sub Form_Load()
    
    '------ フォーム名設定 ------
    Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    
    blnInit_Flg = True             '初期フラグ
    
    '初期画面編集処理
    Call SubInitScreen
    
End Sub

'----------------------------------------------------------------------------
'    初期画面編集処理
'----------------------------------------------------------------------------
Private Sub SubInitScreen()
        
    Me.Enabled = False
    
    Call subErrKaijo
    
    '各表示項目クリア
    txtSyainCD1.Text = ""
    txtSyainCD2.Text = ""
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblShozoku(0).Caption = ""
    lblShozoku(1).Caption = ""
    lblTozai.Caption = ""
    lblBumon(0).Caption = ""
    lblBumon(1).Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
    
    '----- Spread Seet 保護 -----
    sprList.Lock = True

    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    '---- ステータスバー設定 ----
    Call gsubInitStatusBar(stbSystem)
    'ステータスバーメッセージ消去
    stbSystem.Panels.Item(1).Text = ""
    
    '各コントロール制御
    cmdNayose.Enabled = True
    cmdPFK(5).Enabled = True
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True
    cmdBunkai.Enabled = False
    cmdBunkaiModoshi.Enabled = False

    Me.Enabled = True

End Sub

'**************************************************************************************************
'   名寄せボタン　Clickイベント:セッションの確立
'**************************************************************************************************
Private Sub cmdNayose_Click()
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCD1 = Left(gstrDat, 1)
        txtSyainCD2 = Right(gstrDat, 7)
        Call cmdPFK_Click(5)
    End If
End Sub

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()
    Dim clsActX490 As QSAV_ActX490.ActX490C
    Dim i As Integer

    If blnInit_Flg = True Then '初期フラグ=オンの場合
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
                                    , "分解・分解戻し入力 (" & gstrCommandLine(8) & ")" _
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
                                    , "分解・分解戻し入力 (" & gstrCommandLine(8) & ")" _
                                    , objSession.LastServerErr, objSession.LastServerErrText)
            '終了
            Unload Me
        End If

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
        
        Me.Enabled = True
        Screen.MousePointer = vbDefault

        'ステータスバーメッセージ消去
        stbSystem.Panels.Item(1).Text = ""

        blnInit_Flg = False   '初期フラグ=オフ
        
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

'*****************************************************************************************
'各ファンクションキー機能
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C

    Select Case Index
        Case 1  'メニュー
            Unload Me
        Case 2  'ハードコピー
            'Call gsubQSAV_ActX1001
        
            'ハードコピー用DLL呼出処理に画面キャプションをパラメータとして追加
            Set clsActX1001 = CreateObject("QSAV_ActX1001.ActX1001C")
            Call clsActX1001.subQSAV_ActX1001(Me.Caption)
            
            Set clsActX1001 = Nothing
        
        Case 5  '実行
            Call subCmdJikkou
        Case 10 '前画面
            Unload Me
        Case 12 '取消
            '排他解除
            Call gblnHaita_Unlock
            Call SubInitScreen
            txtSyainCD1.SetFocus
    End Select
    
End Sub

'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg   As String 'エラーメッセージ
    Dim strWrk      As String

    '排他解除
    Call gblnHaita_Unlock
    
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
    
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
    cmdNayose.Enabled = False
    Screen.MousePointer = vbHourglass
    
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents

    If Trim(txtSyainCD1.Text) = "" Then
        gstrSyainCD1 = Space(1)
    Else
        gstrSyainCD1 = Trim$(txtSyainCD1)
    End If
    gstrSyainCD2 = Trim$(txtSyainCD2)

    '◆入力された社員コードチェック（未入力、入力桁数チェック）
    If blnJoukenH = False Then
        cmdPFK(5).Enabled = True
        txtSyainCD2.SetFocus
        cmdNayose.Enabled = True
        Screen.MousePointer = vbDefault
        'ステータスバーメッセージ消去
        stbSystem.Panels.Item(1).Text = ""
        Exit Sub
    End If
    
    '排他制御
    If gblnHaita_Lock = False Then
        Screen.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""
        Exit Sub
    End If
    
    'ＳＰ用変数に格納
    
    '◆◆◆□■□社員属性　抽出 ＆ 表示
    ''社員Ｍから抽出
    If blnSeachSyain = False Then
        'Msg = 該当データが存在しません。
        lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        Call gsubParaRemove(odbDatabase) 'パラメータ解放
        Me.Enabled = True
        cmdPFK(5).Enabled = True
        cmdNayose.Enabled = True
        txtSyainCD1.SetFocus
        txtSyainCD1.BackColor = vbRed
        txtSyainCD2.BackColor = vbRed
        Screen.MousePointer = vbDefault
        'ステータスバーメッセージ消去
        stbSystem.Panels.Item(1).Text = ""
        
        '排他解除
        Call gblnHaita_Unlock
        
        Exit Sub
    End If
    
    'グリッド表示用データ取得
    If blnGetGridData Then
        sprList.Enabled = True
        sprList.SetFocus
        'グリッド表示
        Call subDispList
        cmdBunkai.Enabled = True
        cmdBunkaiModoshi.Enabled = True
    Else
        'Msg = 分解・分解戻し可能なデータがありません。
        lblMsg.Caption = "WPOE42 " & gstrGetCodeMeisyo(odbDatabase, "E42", "WPO")
    End If
    
    '各コントロール制御
    Me.Enabled = True
    txtSyainCD1.Enabled = False
    txtSyainCD2.Enabled = False
    cmdPFK(5).Enabled = False
    cmdNayose.Enabled = False
    
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""
        
End Sub

'*******************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("分解・分解戻し入力", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt510.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCD1.BackColor = vbWhite
    txtSyainCD2.BackColor = vbWhite
End Sub

Private Sub Form_Unload(Cancel As Integer)

    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt510 = Nothing

End Sub

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtSyainCD1_Change()
    
    If LenB(StrConv(txtSyainCD1.Text, vbFromUnicode)) = 1 Then
        txtSyainCD1.BackColor = vbWhite
        txtSyainCD2.SetFocus
    End If

End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtSyainCD1_GotFocus()
    Call gsubSelectText(txtSyainCD1)
End Sub
Private Sub txtSyainCD2_GotFocus()
    Call gsubSelectText(txtSyainCD2)
End Sub
'******************************************
'*社員コード入力文字制御（数字のみ）
'******************************************
Private Sub txtSyainCD2_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub
'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtSyainCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'********************************************************************************
'   入力された社員コードが適切かどうか判断する
'********************************************************************************
Private Function blnJoukenH() As Boolean

    blnJoukenH = False
        
    '*****社員コード*****
    '入力桁 Check
    If Len(gstrSyainCD2) = 0 Then
        Enabled = True
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 社員コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCD2.BackColor = vbRed
        txtSyainCD2.SetFocus
        Exit Function
    End If
    '数字チェック
    If IsNumeric(gstrSyainCD2) = False Then
        Enabled = True
        'Msg = 社員属性が存在しません。
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCD2.BackColor = vbRed
        txtSyainCD2.SetFocus
        Exit Function
    End If
    If Len(gstrSyainCD2) <> 7 Then
        Enabled = True
        'Msg = 桁で入力してください。
        lblMsg.Caption = "WPOE06 社員コードは7" & gstrGetCodeMeisyo(odbDatabase, "E06", "WPO")
        txtSyainCD2.BackColor = vbRed
        txtSyainCD2.SetFocus
        Exit Function
    End If
    
    blnJoukenH = True
    
End Function

'*********************************************************************************************
'*　　手続き名：　社員属性取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　社員属性取得ＳＰを使用し、社員属性情報を取得する
'*********************************************************************************************
Private Function blnSeachSyain() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errSeachSyain

    blnSeachSyain = False
    
    '社員属性取得 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT    '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT    '社員コード２
                
        '氏名カナ
    odbDatabase.Parameters.Add "OtStrSimeiKana", Space(15), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKana").ServerType = ORATYPE_CHAR
        '氏名漢字
    odbDatabase.Parameters.Add "OtStrSimeiKanji", Space(20), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSimeiKanji").ServerType = ORATYPE_CHAR
        '所属店コード
    odbDatabase.Parameters.Add "OtStrMiseCD", Space(3), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseCD").ServerType = ORATYPE_CHAR
        '所属店名
    odbDatabase.Parameters.Add "OtStrMiseName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrMiseName").ServerType = ORATYPE_CHAR
        '東西区分
    odbDatabase.Parameters.Add "OtStrTozaiKBN", Space(1), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTozaiKBN").ServerType = ORATYPE_CHAR
        '所属部門コード
    odbDatabase.Parameters.Add "OtStrBumonCD", Space(6), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonCD").ServerType = ORATYPE_CHAR
        '所属部門名
    odbDatabase.Parameters.Add "OtStrBumonName", Space(30), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBumonName").ServerType = ORATYPE_CHAR
        '資格コード
    odbDatabase.Parameters.Add "OtStrSikakuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSikakuCD").ServerType = ORATYPE_CHAR
        '等級コード
    odbDatabase.Parameters.Add "OtStrTokyuCD", Space(2), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrTokyuCD").ServerType = ORATYPE_CHAR
        '生年月日
    odbDatabase.Parameters.Add "OtStrBornYMD", Space(8), ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrBornYMD").ServerType = ORATYPE_VARCHAR2
    
    '存在Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt510PkG.QPAP_CEnt510SelSyainZoku(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtStrSimeiKana, " & _
             ":OtStrSimeiKanji, " & _
             ":OtStrMiseCD, " & _
             ":OtStrMiseName, " & _
             ":OtStrTozaiKBN, " & _
             ":OtStrBumonCD, " & _
             ":OtStrBumonName, " & _
             ":OtStrSikakuCD, " & _
             ":OtStrTokyuCD, " & _
             ":OtStrBornYMD, " & _
             ":OtstrSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    '画面に表示
    lblKana.Caption = Trim$(odbDatabase.Parameters("OtStrSimeiKana").Value)         '氏名カナ
    lblShimei.Caption = Trim$(odbDatabase.Parameters("OtStrSimeiKanji").Value)      '氏名漢字
    lblShozoku(0).Caption = Trim$(odbDatabase.Parameters("OtStrMiseCD").Value)      '所属店コード
    lblShozoku(1).Caption = Trim$(odbDatabase.Parameters("OtStrMiseName").Value)    '所属店名
    lblTozai.Caption = Trim$(odbDatabase.Parameters("OtStrTozaiKBN").Value)         '東西区分
    lblBumon(0).Caption = Trim$(odbDatabase.Parameters("OtStrBumonCD").Value)       '所属部門コード
    lblBumon(1).Caption = Trim$(odbDatabase.Parameters("OtStrBumonName").Value)     '所属部門名
    lblShikaku.Caption = Trim$(odbDatabase.Parameters("OtStrSikakuCD").Value)       '資格コード
    lblKyu.Caption = Trim$(odbDatabase.Parameters("OtStrTokyuCD").Value)            '等級コード
    '生年月日編集
    strEdit = Trim$(odbDatabase.Parameters("OtStrBornYMD").Value)                   '生年月日
    If IsNull(strEdit) Or Trim$(strEdit) = "" Or Trim$(strEdit) = "0" Or Trim$(strEdit) = "00000000" Then
        lblSeinengappi.Caption = ""
    Else
        lblSeinengappi.Caption = Mid$(strEdit, 1, 4) & "/" & Mid$(strEdit, 5, 2) & "/" & Mid$(strEdit, 7, 2)
    End If

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    blnSeachSyain = True

    Exit Function
    
errSeachSyain:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'*********************************************************************************************
'*　　手続き名：　グリッド表示情報取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　グリッド表示情報取得ＳＰを使用し、グリッド表示情報を取得する
'*********************************************************************************************
Private Function blnGetGridData()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30

On Error GoTo errGetGridData
    
    blnGetGridData = False

    'スプレッドクリア
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT
    '社員コード２
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT
    'MaxRec
    odbDatabase.Parameters.Add "InNumMaxRec", cnsMaxRec, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_CHAR
    '処理ｶｳﾝﾄ(IoNumFetchCount
    odbDatabase.Parameters.Add "IoNumFetchCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumFetchCount").ServerType = ORATYPE_NUMBER
    '総検索件数(IoNumRecCount
    odbDatabase.Parameters.Add "IoNumRecCount", 0, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumRecCount").ServerType = ORATYPE_NUMBER
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    '配列
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtstrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2

    'ＳＱＬ文作成
    strSQL = "BEGIN QPAP_CEnt510PkG.QPAP_CEnt510GetGridData(" & _
    ":InStrPRMSyainCD1," & _
    ":InStrPRMSyainCD2," & _
    ":InNumMaxRec," & _
    ":IoNumFetchCount," & _
    ":IoNumRecCount," & _
    ":OtNumAryCount," & _
    ":OtStrDataAry," & _
    ":OtstrEndFlg); END;"

    '抽出レコードをリストに表示
    lngRecCount = 0               '変数のクリア
    lngFirstCnt = 1               '変数のクリア
    i = 1

    Do
        lngFirstCnt = (i - 1) * cnsMaxRec + 1        'ｽﾌﾟﾚｯﾄﾞの開始行の設定
        
        'ＳＰの実行
        odbDatabase.DbexecuteSQL (strSQL)
        
        '抽出件数を表示する
        If i = 1 Then
            'ﾃｰﾌﾞﾙ件数用
            Erase gDataAry
            glngTblCnt = 0

            '抽出件数が0件の場合はボタン使用不可
            If odbDatabase.Parameters("IoNumRecCount") = 0 Then
                Call gsubParaRemove(odbDatabase)
                Exit Function
            End If
            '配列の再定義
            lngMax = odbDatabase.Parameters("IoNumRecCount")
            glngTblCnt = lngMax
            ReDim gDataAry(lngMax)
        End If
        
        '最終の設定
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))
        
        For j = lngFirstCnt - ((i - 1) * cnsMaxRec) To lngRecCount - ((i - 1) * cnsMaxRec)
            gDataAry(j + ((i - 1) * cnsMaxRec)) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '終了フラグ＝１まで
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    blnGetGridData = True

    Exit Function

errGetGridData:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    グリッド表示
'***********************************************************************************
Private Sub subDispList()
 Dim i             As Long   '
 Dim j             As Long
 Dim lngKensuu     As Long
 Dim strValue      As String '項目値文字列
 Dim strDataRow    As String '項目値文字列
 
 
 Dim strBeforeRow As String '直前行との比較用
 Dim varTemp      As Variant '直前行の「振」「完」チェック用
 
 Dim dblSeikyuKei As Double '請求合計ワーク
 Dim dblNyukinKei As Double '入金合計ワーク
 
    '総件数
    lngKensuu = UBound(gDataAry())

    With sprList
        .ReDraw = False
                
        .MaxRows = lngKensuu
        j = 1
        '1回の件数
        For i = 1 To lngKensuu
                   
            '証書明細１レコード
            strDataRow = gDataAry(i)
        
            '直前の行が分解メモ＝１、現在の行が分解メモ＝０かつ同一融資日同一入金日の場合は、
            '現在の行はグリッドに入れないで破棄する
            If Trim$(gfncstrDlm2(strBeforeRow, 8)) = "1" _
             And Trim$(gfncstrDlm2(strDataRow, 8)) = "0" _
             And Trim$(gfncstrDlm2(strBeforeRow, 1)) = Trim$(gfncstrDlm2(strDataRow, 1)) _
             And Trim$(gfncstrDlm2(strBeforeRow, 4)) = Trim$(gfncstrDlm2(strDataRow, 4)) Then
                .MaxRows = .MaxRows - 1
                GoTo Continue
            End If
            
            '以下一覧表示用
            
            '融資日
            strValue = Trim$(gfncstrDlm2(strDataRow, 1))
            If strValue = "" Then
                strValue = "小口"
            Else
                strValue = Mid$(strValue, 1, 4) & "/" & Mid$(strValue, 5, 2) & "/" & Mid$(strValue, 7, 2)
            End If
            .SetText 1, j, strValue
            '返済利率
            strValue = Trim$(gfncstrDlm2(strDataRow, 2))
            If strValue <> "" Then
                strValue = Format$(CDbl(strValue), "#0.00") & "%"
            End If
            .SetText 2, j, strValue
            '返済回数
            strValue = Trim$(gfncstrDlm2(strDataRow, 3))
            .SetText 3, j, strValue
            '入金日付
            strValue = Trim$(gfncstrDlm2(strDataRow, 4))    '控除日
            strValue = Mid$(strValue, 1, 4) & "/" & Mid$(strValue, 5, 2) & "/" & Mid$(strValue, 7, 2)
            If Trim$(gfncstrDlm2(strDataRow, 8)) = "2" Then '分解メモ
                If Trim$(gfncstrDlm2(strDataRow, 9)) = "0" Then '賞与メモ
                    strValue = strValue & "   振"
                Else
                    strValue = strValue & " ボ振"
                End If
            Else
                If Trim$(gfncstrDlm2(strDataRow, 9)) = "0" Then '賞与メモ
                    strValue = strValue & ""
                Else
                    strValue = strValue & " ボ"
                End If
            End If
            If Trim$(gfncstrDlm2(strDataRow, 10)) = "1" Then '完済メモ
                strValue = Replace(strValue, "振", "完")
            End If
            .SetText 4, j, strValue
            '請求元本
            If Trim$(gfncstrDlm2(strDataRow, 8)) = "2" Then '分解メモ
                strValue = "0"
            Else
                strValue = Trim$(gfncstrDlm2(strDataRow, 5))
            End If
            .SetText 5, j, Format$(CDbl(strValue), "#,##0")
            dblSeikyuKei = CDbl(strValue)
            '請求手数料
            If Trim$(gfncstrDlm2(strDataRow, 8)) = "2" Then '分解メモ
                strValue = "0"
            Else
                strValue = Trim$(gfncstrDlm2(strDataRow, 6))
            End If
            .SetText 6, j, Format$(CDbl(strValue), "#,##0")
            dblSeikyuKei = dblSeikyuKei + CDbl(strValue)
            '請求合計
            .SetText 7, j, Format$(dblSeikyuKei, "#,##0")
            '入金元本
            .GetText 4, j - 1, varTemp    '前の行の入金日を取得
            If Trim$(gfncstrDlm2(strDataRow, 8)) = "1" _
            Or InStr(1, varTemp, "振") <> 0 _
            Or InStr(1, varTemp, "完") <> 0 Then  '分解メモ＝１ or 上の行に「振」か「完」
                strValue = "0"
            Else
                strValue = Trim$(gfncstrDlm2(strDataRow, 5))
            End If
            .SetText 8, j, Format$(CDbl(strValue), "#,##0")
            dblNyukinKei = CDbl(strValue)
            '入金手数料
            If Trim$(gfncstrDlm2(strDataRow, 8)) = "1" _
            Or InStr(1, varTemp, "振") <> 0 _
            Or InStr(1, varTemp, "完") <> 0 Then  '分解メモ＝１ or 上の行に「振」か「完」
                strValue = "0"
            Else
                strValue = Trim$(gfncstrDlm2(strDataRow, 6))
            End If
            .SetText 9, j, Format$(CDbl(strValue), "#,##0")
            dblNyukinKei = dblNyukinKei + CDbl(strValue)
            '入金合計
            .SetText 10, j, Format$(dblNyukinKei, "#,##0")
            '分解日
            strValue = Trim$(gfncstrDlm2(strDataRow, 7))
            If strValue <> "" Then
                strValue = Mid$(strValue, 1, 4) & "/" & Mid$(strValue, 5, 2) & "/" & Mid$(strValue, 7, 2)
            End If
            .SetText 11, j, strValue
         
            .RowHeight(j) = 9.55
            j = j + 1
Continue:
            strBeforeRow = strDataRow
        Next i
        
        .ReDraw = True
    
    End With

End Sub

'*************************************************************************************************
'*  分解ボタン処理
'*************************************************************************************************
Private Sub cmdBunkai_Click()
   
    '入力チェック
    lblMsg.Caption = ""
    '入金合計0以外はエラー
    If gVarSpdGetText(sprList, 10, sprList.ActiveRow) <> 0 Then
        '分解戻しされていないデータは分解できません。
        lblMsg.Caption = "WPOE43 " & gstrGetCodeMeisyo(odbDatabase, "E43", "WPO")
        Exit Sub
    End If
    '選択行の上の行が「振」はエラー
    If InStr(1, gVarSpdGetText(sprList, 4, sprList.ActiveRow - 1), "振") <> 0 Then
        '既に分解されています。
        lblMsg.Caption = "WPOE44 " & gstrGetCodeMeisyo(odbDatabase, "E44", "WPO")
        Exit Sub
    End If
    
    If MsgBox("選択行を分解してよろしいですか？", vbQuestion + vbOKCancel, "分解・分解戻し入力") = vbCancel Then
        Exit Sub
    End If

    Call subBunkai
    
    'グリッド表示用データ取得
    If blnGetGridData Then
        sprList.Enabled = True
        sprList.SetFocus
        'グリッド表示
        Call subDispList
    End If
    
End Sub

'*************************************************************************************************
'*  分解戻しボタン処理
'*************************************************************************************************
Private Sub cmdBunkaiModoshi_Click()
    
    '入力チェック
    lblMsg.Caption = ""
    '入金合計0はエラー
    If gVarSpdGetText(sprList, 10, sprList.ActiveRow) = 0 Then
        '既に分解戻しされています。
        lblMsg.Caption = "WPOE45 " & gstrGetCodeMeisyo(odbDatabase, "E45", "WPO")
        Exit Sub
    End If
    '「完」はエラー
    If InStr(1, gVarSpdGetText(sprList, 4, sprList.ActiveRow), "完") <> 0 Then
        '完済入力で分解されているデータは分解戻しできません。
        lblMsg.Caption = "WPOE46 " & gstrGetCodeMeisyo(odbDatabase, "E46", "WPO")
        Exit Sub
    End If
    
    If MsgBox("選択行を分解戻ししてよろしいですか？", vbQuestion + vbOKCancel, "分解・分解戻し入力") = vbCancel Then
        Exit Sub
    End If

    If gVarSpdGetText(sprList, 11, sprList.ActiveRow) = "" Then '分解日
        Call subBunkaiModoshiINS
    Else
        Call subBunkaiModoshiUPD
    End If
    
    'グリッド表示用データ取得
    If blnGetGridData Then
        sprList.Enabled = True
        sprList.SetFocus
        'グリッド表示
        Call subDispList
    End If
    
End Sub

'*****************************************************************************************
'   分解戻し(INSERT)
'*****************************************************************************************
Private Sub subBunkaiModoshiINS()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkaiModoshiINS

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT          '社員コード
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT          '社員コード
    'ローン種別
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "1", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "2", ORAPARM_INPUT
    End If
    '融資日
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrYusiYMD", "", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrYusiYMD", gVarSpdGetText(sprList, 1, sprList.ActiveRow), ORAPARM_INPUT
    End If
    '給与賞与区分
    If InStr(1, gVarSpdGetText(sprList, 4, sprList.ActiveRow), "ボ") = 0 Then
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "3", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "4", ORAPARM_INPUT
    End If
    odbDatabase.Parameters.Add "InstrKojoYMD", Mid(gVarSpdGetText(sprList, 4, sprList.ActiveRow), 1, 10), ORAPARM_INPUT            '控除日
    odbDatabase.Parameters.Add "InNumGankin", CDbl(gVarSpdGetText(sprList, 5, sprList.ActiveRow)), ORAPARM_INPUT               '元金
    odbDatabase.Parameters.Add "InNumRisoku", CDbl(gVarSpdGetText(sprList, 6, sprList.ActiveRow)), ORAPARM_INPUT               '利息
    
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt510PkG.QPAP_CEnt510ModoshiINS (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrLoanSyubetsu,:InstrYusiYMD," & _
             ":InstrKyuyoSyoyoKBN,:InstrKojoYMD,:InNumGankin,:InNumRisoku," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"
    
'DEL 20100319 TR1003-011 NBC YOKOYAMA START
'    MsgBox (gstrCommandLine(10))
'DEL 20100319 TR1003-011 NBC YOKOYAMA END

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkaiModoshiINS:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

'*****************************************************************************************
'   分解戻し(UPDATE)
'*****************************************************************************************
Private Sub subBunkaiModoshiUPD()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkaiModoshiUPD

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT          '社員コード
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT          '社員コード
    'ローン種別
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "1", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "2", ORAPARM_INPUT
    End If
    '融資日
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrYusiYMD", "", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrYusiYMD", gVarSpdGetText(sprList, 1, sprList.ActiveRow), ORAPARM_INPUT
    End If
    '給与賞与区分
    If InStr(1, gVarSpdGetText(sprList, 4, sprList.ActiveRow), "ボ") = 0 Then
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "3", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "4", ORAPARM_INPUT
    End If
    odbDatabase.Parameters.Add "InstrKojoYMD", Mid(gVarSpdGetText(sprList, 4, sprList.ActiveRow), 1, 10), ORAPARM_INPUT            '控除日
    
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt510PkG.QPAP_CEnt510ModoshiUPD (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrLoanSyubetsu,:InstrYusiYMD," & _
             ":InstrKyuyoSyoyoKBN,:InstrKojoYMD," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

'DEL 20100319 TR1003-011 NBC YOKOYAMA START
'    MsgBox (gstrCommandLine(10))
'DEL 20100319 TR1003-011 NBC YOKOYAMA END
    
    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkaiModoshiUPD:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub

'*****************************************************************************************
'   分解
'*****************************************************************************************
Private Sub subBunkai()
    Dim strSQL      As String
    Dim OraSqlStmt  As Object

On Error GoTo errsubBunkai

    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT          '社員コード
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT          '社員コード
    'ローン種別
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "1", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrLoanSyubetsu", "2", ORAPARM_INPUT
    End If
    '融資日
    If gVarSpdGetText(sprList, 1, sprList.ActiveRow) = "小口" Then
        odbDatabase.Parameters.Add "InstrYusiYMD", "", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrYusiYMD", gVarSpdGetText(sprList, 1, sprList.ActiveRow), ORAPARM_INPUT
    End If
    '給与賞与区分
    If InStr(1, gVarSpdGetText(sprList, 4, sprList.ActiveRow), "ボ") = 0 Then
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "3", ORAPARM_INPUT
    Else
        odbDatabase.Parameters.Add "InstrKyuyoSyoyoKBN", "4", ORAPARM_INPUT
    End If
    odbDatabase.Parameters.Add "InstrKojoYMD", Mid(gVarSpdGetText(sprList, 4, sprList.ActiveRow), 1, 10), ORAPARM_INPUT        '控除日
    
    odbDatabase.Parameters.Add "InStrMenuID", gstrCommandLine(8), ORAPARM_INPUT             'メニューID
    odbDatabase.Parameters.Add "InStrModuleID", gcstrPrjName, ORAPARM_INPUT                 'プログラムID
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT             '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT         'コンピュータ名
    odbDatabase.Parameters.Add "InStrRiyouKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InStrBushoCD", gstrCommandLine(11), ORAPARM_INPUT           '部署コード
    odbDatabase.Parameters.Add "InStrTantoNM", gstrCommandLine(2), ORAPARM_INPUT            '担当者名

    'ストアドプロシージャ起動SQL作成
    strSQL = "BEGIN QPAP_CEnt510PkG.QPAP_CEnt510Bunkai (" & _
             ":InStrPRMSyainCD1,:InStrPRMSyainCD2,:InstrLoanSyubetsu,:InstrYusiYMD," & _
             ":InstrKyuyoSyoyoKBN,:InstrKojoYMD," & _
             ":InStrMenuID,:InStrModuleID," & _
             ":InStrUserID,:InStrComputerNM,:InStrRiyouKBN,:InStrBushoCD,:InStrTantoNM); END;"

'DEL 20100319 TR1003-011 NBC YOKOYAMA START
'    MsgBox (gstrCommandLine(10))
'DEL 20100319 TR1003-011 NBC YOKOYAMA END
    
    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errsubBunkai:
'エラー処理
    
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                          gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
                           
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Sub


