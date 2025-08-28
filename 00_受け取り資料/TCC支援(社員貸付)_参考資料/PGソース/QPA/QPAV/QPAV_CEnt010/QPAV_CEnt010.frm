VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt010 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "社員小口融資台帳"
   ClientHeight    =   8925
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
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ｵｰﾀﾞｰ
   ScaleHeight     =   8925
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdExec 
      Caption         =   "登録／更新"
      Height          =   495
      Left            =   210
      TabIndex        =   7
      Top             =   6750
      Width           =   1245
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
      Top             =   7965
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
      Top             =   7500
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
         Left            =   30
         TabIndex        =   22
         Top             =   30
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   8550
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
            TextSave        =   "11:25"
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
   Begin VB.Frame fraJyouken 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   810
      Left            =   180
      TabIndex        =   24
      Top             =   120
      Width           =   14025
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
         Height          =   375
         Left            =   4170
         TabIndex        =   1
         Top             =   270
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCD 
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
         Left            =   2835
         MaxLength       =   7
         TabIndex        =   0
         Top             =   285
         Width           =   1005
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
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
         Height          =   240
         Left            =   1500
         TabIndex        =   25
         Top             =   345
         Width           =   1200
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5670
      Left            =   180
      TabIndex        =   26
      Top             =   960
      Width           =   7155
      Begin VB.TextBox txtGendogaku 
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
         Left            =   2670
         MaxLength       =   9
         TabIndex        =   2
         Top             =   4200
         Width           =   1365
      End
      Begin VB.Label Label7 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "資格コード"
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
         Height          =   240
         Left            =   1110
         TabIndex        =   49
         Top             =   3016
         Width           =   1350
      End
      Begin VB.Label lblSikakuCD 
         Alignment       =   2  '中央揃え
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
         Height          =   240
         Left            =   2670
         TabIndex        =   48
         Top             =   3015
         Width           =   330
      End
      Begin VB.Label Label5 
         Alignment       =   1  '右揃え
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
         Height          =   240
         Left            =   1290
         TabIndex        =   47
         Top             =   1808
         Width           =   1170
      End
      Begin VB.Label lblTouzai 
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
         Height          =   240
         Left            =   2730
         TabIndex        =   46
         Top             =   1808
         Width           =   300
      End
      Begin VB.Label Label13 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "等級コード"
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
         Height          =   240
         Left            =   960
         TabIndex        =   45
         Top             =   3620
         Width           =   1500
      End
      Begin VB.Label Label12 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "残高"
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
         Height          =   240
         Left            =   1980
         TabIndex        =   44
         Top             =   4830
         Width           =   480
      End
      Begin VB.Label Label11 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "限度額"
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
         Height          =   240
         Left            =   1620
         TabIndex        =   43
         Top             =   4224
         Width           =   840
      End
      Begin VB.Label Label6 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "所属部門コード"
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
         Height          =   240
         Left            =   540
         TabIndex        =   42
         Top             =   2412
         Width           =   1920
      End
      Begin VB.Label Label4 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "所属店コード"
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
         Height          =   240
         Left            =   540
         TabIndex        =   41
         Top             =   1204
         Width           =   1920
      End
      Begin VB.Label Label2 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "氏名"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   540
         TabIndex        =   40
         Top             =   600
         Width           =   1920
      End
      Begin VB.Label lblKojinmeiKana 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   2730
         TabIndex        =   39
         Top             =   360
         Width           =   2610
      End
      Begin VB.Label lblSyozokutenCD 
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
         Height          =   240
         Left            =   2730
         TabIndex        =   38
         Top             =   1204
         Width           =   450
      End
      Begin VB.Label lblSyozokubumCD 
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
         Height          =   240
         Left            =   2730
         TabIndex        =   37
         Top             =   2412
         Width           =   780
      End
      Begin VB.Label lblToukyuuCD 
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
         Height          =   240
         Left            =   2730
         TabIndex        =   36
         Top             =   3620
         Width           =   330
      End
      Begin VB.Label lblZandaka 
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
         ForeColor       =   &H00FF0000&
         Height          =   240
         Left            =   2700
         TabIndex        =   35
         Top             =   4830
         Width           =   1395
      End
      Begin VB.Label lblKojinmeiKanji 
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
         Height          =   240
         Left            =   2730
         TabIndex        =   29
         Top             =   660
         Width           =   2610
      End
      Begin VB.Label lblSyozokubum 
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
         Height          =   240
         Left            =   3510
         TabIndex        =   28
         Top             =   2412
         Width           =   3510
      End
      Begin VB.Label lblSyozokuten 
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
         Height          =   210
         Left            =   3240
         TabIndex        =   27
         Top             =   1200
         Width           =   2970
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5670
      Left            =   7380
      TabIndex        =   30
      Top             =   960
      Width           =   6855
      Begin FPSpread.vaSpread sprList 
         Height          =   2280
         Left            =   1110
         TabIndex        =   3
         Top             =   1860
         Width           =   4725
         _Version        =   196608
         _ExtentX        =   8334
         _ExtentY        =   4022
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   3
         MaxRows         =   10
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt010.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.CommandButton cmd_Exec 
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
         Height          =   495
         Index           =   0
         Left            =   780
         TabIndex        =   4
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmd_Exec 
         Caption         =   "修正"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   1
         Left            =   2790
         TabIndex        =   5
         Top             =   4440
         Width           =   1455
      End
      Begin VB.CommandButton cmd_Exec 
         Caption         =   "削除"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   2
         Left            =   4680
         TabIndex        =   6
         Top             =   4440
         Width           =   1455
      End
      Begin VB.Label Label10 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "給与返済額"
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
         Height          =   240
         Left            =   1710
         TabIndex        =   34
         Top             =   600
         Width           =   1350
      End
      Begin VB.Label Label8 
         Alignment       =   1  '右揃え
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "賞与返済額"
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
         Height          =   240
         Left            =   1860
         TabIndex        =   33
         Top             =   1080
         Width           =   1200
      End
      Begin VB.Label lblSyouyoHensai 
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
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3510
         TabIndex        =   32
         Top             =   1080
         Width           =   1395
      End
      Begin VB.Label lblKyuuyoHensai 
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
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3540
         TabIndex        =   31
         Top             =   600
         Width           =   1365
      End
   End
End
Attribute VB_Name = "frmQPAV_CEnt010"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmd_Exec_Click(Index As Integer)
    
    Dim sy As String, hy As String
    
    lblMsg.Caption = ""
    frmQPAV_CEnt011.lblShainCD.Caption = txtSyainCD.Text
    frmQPAV_CEnt011.lblShimei.Caption = lblKojinmeiKanji.Caption
    
    Select Case cmd_Exec(Index).Caption
        Case "修正", "削除"
            If gVarSpdGetText(sprList, sprList.ActiveCol, sprList.ActiveRow) = "" Then
                'Msg = するデータを選択してください。
                lblMsg.Caption = "WPOE05 " & cmd_Exec(Index).Caption & gstrGetCodeMeisyo(odbDatabase, "E05", "WPO")
                Exit Sub
            End If
            
            ''''''↓2002/03/07 入力チェック追加
            '当月以前は変更不可能　指定できるのは未来月のみ
            Act_Row = sprList.ActiveRow
            If CLng(Left(gVarSpdGetText(sprList, 1, Act_Row), 4) & Right(gVarSpdGetText(sprList, 1, Act_Row), 2)) <= CLng(Format(gdatSysDate, "yyyymm")) Then
                lblMsg.Caption = "当月以前の日付は修正／削除を行えません。"
                Exit Sub
            End If
            ''''''↑2002/03/07 入力チェック追加
            
            Act_Row = sprList.ActiveRow
            sy = Left(ShimeYMD, 4) & "/" & Mid(ShimeYMD, 5, 2) & "/" & Mid(ShimeYMD, 7, 2)
            hy = DateAdd("m", 1, gVarSpdGetText(sprList, 1, Act_Row) & "/01")
            hy = Format(DateAdd("y", -1, hy), "yyyy/mm/dd")
            If DateDiff("y", hy, sy) > 0 Then
                'Msg = 締め日（@）以前の日付は修正／削除を行えません。
                lblMsg.Caption = "WPOE07 " & gstrGetCodeMeisyoIn(odbDatabase, "E07", "WPO", sy)
                Exit Sub
            End If
            frmQPAV_CEnt011.txt_Year.Text = Left(gVarSpdGetText(sprList, 1, Act_Row), 4)
            frmQPAV_CEnt011.txt_Month.Text = Right(gVarSpdGetText(sprList, 1, Act_Row), 2)
            frmQPAV_CEnt011.txt_Kyuuyo.Text = gVarSpdGetText(sprList, 2, Act_Row)
            frmQPAV_CEnt011.txt_Syouyo.Text = gVarSpdGetText(sprList, 3, Act_Row)
    End Select

    frmQPAV_CEnt011.txt_Year.BackColor = vbWhite
    frmQPAV_CEnt011.txt_Month.BackColor = vbWhite
    frmQPAV_CEnt011.txt_Kyuuyo.BackColor = vbWhite
    frmQPAV_CEnt011.txt_Syouyo.BackColor = vbWhite
    
    Select Case cmd_Exec(Index).Caption
        Case "削除"
            frmQPAV_CEnt011.txt_Year.Enabled = False
            frmQPAV_CEnt011.txt_Month.Enabled = False
            frmQPAV_CEnt011.txt_Kyuuyo.Enabled = False
            frmQPAV_CEnt011.txt_Syouyo.Enabled = False
            frmQPAV_CEnt011.cmdTorikesi.Enabled = False
        Case Else
            frmQPAV_CEnt011.txt_Year.Enabled = True
            frmQPAV_CEnt011.txt_Month.Enabled = True
            frmQPAV_CEnt011.txt_Kyuuyo.Enabled = True
            frmQPAV_CEnt011.txt_Syouyo.Enabled = True
            frmQPAV_CEnt011.cmdTorikesi.Enabled = True
    End Select
    frmQPAV_CEnt011.cmdTouroku.Caption = cmd_Exec(Index).Caption
    frmQPAV_CEnt011.Show 1
    
    Call gsubHensaiSet
    cmd_Exec(0).Enabled = True
    
End Sub

Private Sub cmdExec_Click()

    If Not funcChk Then                 '入力チェック
        Exit Sub
    End If
    
    'gstrKeiyakuYMD = Format(Now, "yyyymmdd")            '契約年月日
    gstrKeiyakuYMD = Format(gdatSysDate, "yyyymmdd")            '契約年月日
    glngGendogaku = Format(txtGendogaku, "#0")          '限度額
    glngKyuyoH = Format(lblKyuuyoHensai, "#0")          '給与返済額
    glngSyoyoH = Format(lblSyouyoHensai, "#0")          '賞与返済額
    
    If gstrNewFlg = "0" Then   '追加
        If MsgBox("登録してよろしいですか？", vbQuestion + vbOKCancel, "小口融資台帳") = vbCancel Then
            Exit Sub
        End If
        If gfuncDaicyoAdd = False Then Exit Sub
    Else                        '更新
        If MsgBox("更新してよろしいですか？", vbQuestion + vbOKCancel, "小口融資台帳") = vbCancel Then
            Exit Sub
        End If
        If gfuncDaicyoUpd = False Then Exit Sub
    End If
    
    '画面クリア
    Call subFormInitialize

End Sub

Private Sub cmdName_Click()
    gstrDat = ""
    QPAV_Nayose.Show 1
    If gstrDat <> "" Then
        txtSyainCD = Right(gstrDat, 7)
        If Trim(Left(gstrDat, 1)) = "" Then
            Call cmdPFK_Click(5)
        Else
            'Msg = この社員コードは小口融資を利用できません。
            lblMsg.Caption = "WPOE34 " & gstrGetCodeMeisyo(odbDatabase, "E34", "WPO")
            txtSyainCD.BackColor = vbRed
            txtSyainCD.SetFocus
        End If
    End If
End Sub

'*****************************************************************************************
'各ファンクションキー機能
'*****************************************************************************************
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
            txtSyainCD.SetFocus
    End Select

End Sub

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

    Dim ret  As Boolean
    
    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "小口融資台帳"
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "小口融資台帳 (" & gstrCommandLine(8) & ") " _
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
                                    , "小口融資台帳 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'サーバー日付取得
        Call gsubGetSysDate
        
        '画面初期化
        Call subFormInitialize

    End If
            
    Me.Enabled = True
    MousePointer = vbDefault
    
    bInit_Flg = False          '初期 FLG オフ
    
End Sub

'**************************************************************************************************
'*FORM_KEYDOWN ファンクションキー設定
'**************************************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
        Case vbKeyReturn   'Enter
            KeyCode = 0
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

Private Sub Form_Load()
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)

    Me.Caption = "小口融資台帳 (" & gstrCommandLine(8) & ")"
    bInit_Flg = True                            '初期フラグをオン
    sprList.MaxRows = 0

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt010 = Nothing

End Sub

'******************************************
'*　フル桁脱出
'******************************************
Private Sub txtGendogaku_Change()
'    Call gsubMaxCharSkipEX(txtGendogaku, 9)
End Sub

'******************************************
'*限度額フォーカス取得時全テキスト選択
'******************************************
Private Sub txtGendogaku_GotFocus()
    Call gsubSelectText(txtGendogaku)
End Sub

'******************************************
'*限度額入力文字制御（数字のみ）
'******************************************
Private Sub txtGendogaku_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*　フル桁脱出
'******************************************
Private Sub txtSyainCD_Change()
'    Call gsubMaxCharSkipEX(txtSyainCD, 7)
End Sub

'******************************************
'*社員コードフォーカス取得時全テキスト選択
'******************************************
Private Sub txtSyainCD_GotFocus()
    Call gsubSelectText(txtSyainCD)
End Sub

'******************************************
'*社員コード入力文字制御（数字のみ）
'******************************************
Private Sub txtSyainCD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'*************************************************************************************************
'*入力チェック処理
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    If IsNull(txtGendogaku.Text) Or Trim(txtGendogaku.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 限度額" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtGendogaku.BackColor = vbRed
        txtGendogaku.SetFocus
        Exit Function
    End If
    If Val(txtGendogaku.Text) = 0 Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 限度額" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtGendogaku.BackColor = vbRed
        txtGendogaku.SetFocus
        Exit Function
    End If
    txtGendogaku.Text = Format(txtGendogaku.Text, "#,##0")
    
    funcChk = True

End Function


'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String
    Dim i         As Integer
    
    Call subErrKaijo
    
    '排他解除
    Call gblnHaita_Unlock
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    cmdPFK(5).SetFocus
    
    '入力チェック
    If Trim$(txtSyainCD.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 社員コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCD.BackColor = vbRed
        txtSyainCD.Enabled = True
        txtSyainCD.SetFocus
        GoTo exit_subCmdJikkou
    End If
    
    '変数に退避
    gstrCode = txtSyainCD.Text
    
    '排他制御
    If gblnHaita_Lock = False Then GoTo exit_subCmdJikkou
       
    'SP実行
    If gfuncDaicyoSet = False Then
        '排他解除
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    End If
    
    Call gsubHensaiSet
    
    '入力制御処理
    cmd_Exec(0).Enabled = True
    txtGendogaku.Enabled = True
    txtGendogaku.SetFocus
    cmdPFK(5).Enabled = False
    txtSyainCD.Enabled = False
    cmdExec.Enabled = True
    cmdName.Enabled = False
    
exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""

End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()
    
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtGendogaku.BackColor = vbWhite
    txtSyainCD.BackColor = vbWhite

End Sub

Private Sub subFormInitialize()
    Dim i As Integer
    
    '排他解除
    Call gblnHaita_Unlock
    
    '各表示項目クリア
    txtSyainCD.Text = ""
    txtSyainCD.Enabled = True
    lblKojinmeiKana.Caption = ""
    lblKojinmeiKanji.Caption = ""
    lblSyozokutenCD.Caption = ""
    lblSyozokuten.Caption = ""
    lblTouzai.Caption = ""
    lblSyozokubumCD.Caption = ""
    lblSyozokubum.Caption = ""
    lblSikakuCD.Caption = ""
    lblToukyuuCD.Caption = ""
    txtGendogaku.Text = ""
    txtGendogaku.Enabled = False
    lblKyuuyoHensai.Caption = ""
    lblZandaka.Caption = ""
    lblSyouyoHensai.Caption = ""
    cmdExec.Enabled = False
    
    txtGendogaku.BackColor = vbWhite
    txtSyainCD.BackColor = vbWhite
    
    'Spred Sheetの初期化
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""

    cmdName.Enabled = True
    For i = 0 To 2
        cmd_Exec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    
End Sub

'*******************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("小口融資台帳", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt010.Name, _
              strErrCode, _
              strErrMsg)

End Sub


