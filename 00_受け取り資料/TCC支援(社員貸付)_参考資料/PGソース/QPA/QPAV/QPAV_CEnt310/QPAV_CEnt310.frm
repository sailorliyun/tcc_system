VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt310 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "小口貸付データ登録"
   ClientHeight    =   9255
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
   ScaleHeight     =   9255
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   6360
      Left            =   90
      TabIndex        =   21
      Top             =   1380
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   5205
         Left            =   2880
         TabIndex        =   1
         Top             =   360
         Width           =   8655
         _Version        =   196608
         _ExtentX        =   15266
         _ExtentY        =   9181
         _StockProps     =   64
         MaxCols         =   6
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt310.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   1455
         Top             =   5745
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
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
         Height          =   375
         Index           =   1
         Left            =   8340
         TabIndex        =   40
         Top             =   5760
         Width           =   1305
      End
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
         Height          =   375
         Index           =   0
         Left            =   4920
         TabIndex        =   39
         Top             =   5760
         Width           =   1305
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   105
      TabIndex        =   18
      Tag             =   "5555555"
      Top             =   0
      Width           =   14175
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
         Left            =   3630
         TabIndex        =   24
         Top             =   270
         Width           =   1455
      End
      Begin VB.TextBox txtSyainCD 
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
         Left            =   2355
         MaxLength       =   7
         TabIndex        =   0
         Top             =   300
         Width           =   975
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
         Height          =   210
         Left            =   6060
         TabIndex        =   38
         Top             =   270
         Width           =   540
      End
      Begin VB.Label lblTenCd 
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
         Left            =   6840
         TabIndex        =   37
         Top             =   270
         Width           =   795
      End
      Begin VB.Label lblTenNm 
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
         Left            =   7680
         TabIndex        =   36
         Top             =   270
         Width           =   2775
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
         TabIndex        =   35
         Top             =   630
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
         Height          =   285
         Left            =   6810
         TabIndex        =   34
         Top             =   630
         Width           =   795
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
         TabIndex        =   33
         Top             =   990
         Width           =   720
      End
      Begin VB.Label lblBumonCd 
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
         Left            =   6810
         TabIndex        =   32
         Top             =   960
         Width           =   795
      End
      Begin VB.Label lblBumonNm 
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
         Left            =   7650
         TabIndex        =   31
         Top             =   960
         Width           =   2775
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
         TabIndex        =   30
         Top             =   270
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
         TabIndex        =   29
         Top             =   600
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
         TabIndex        =   28
         Top             =   960
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
         TabIndex        =   27
         Top             =   270
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
         TabIndex        =   26
         Top             =   600
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
         TabIndex        =   25
         Top             =   930
         Width           =   1305
      End
      Begin VB.Label lblKanji 
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
         Height          =   180
         Left            =   2355
         TabIndex        =   23
         Top             =   1005
         Width           =   2670
      End
      Begin VB.Label lblFurigana 
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
         Height          =   180
         Left            =   2355
         TabIndex        =   22
         Top             =   750
         Width           =   2670
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "氏名"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   1695
         TabIndex        =   20
         Top             =   930
         Width           =   360
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
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
         Height          =   180
         Left            =   1320
         TabIndex        =   19
         Top             =   375
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   8295
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
         TabIndex        =   2
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
         TabIndex        =   3
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
         TabIndex        =   7
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
         TabIndex        =   8
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
         Index           =   6
         Left            =   6015
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   12
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
         Index           =   11
         Left            =   11955
         TabIndex        =   13
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
         TabIndex        =   6
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
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   7815
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
         TabIndex        =   16
         Top             =   60
         Width           =   12405
      End
   End
   Begin VB.PictureBox frmQPAV_CEnt060 
      Align           =   2  '下揃え
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      ScaleHeight     =   315
      ScaleWidth      =   14325
      TabIndex        =   14
      Top             =   8880
      Width           =   14385
      Begin MSComctlLib.StatusBar stbSystem 
         Height          =   375
         Left            =   0
         TabIndex        =   41
         Top             =   0
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
               TextSave        =   "12:16"
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
End
Attribute VB_Name = "frmQPAV_CEnt310"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'**************************************************************************************************
'ボタン押下
'**************************************************************************************************
Private Sub cmdExec_Click(Index As Integer)
    Dim blnRet              As Boolean          '返却値
    Dim lngRecCnt           As Long             'ﾃﾞｰﾀ数
    Dim intErrNo            As Integer          'ｴﾗｰ番号
    Dim strCheck            As String
    
    lblMsg.Caption = ""
    gblnDataSetFlg = False
    gintExecNo = Index
        
    Select Case Index
    Case 0      ' 登録
            
        '変数に退避
        gstrCode = Trim(txtSyainCD.Text)
        gstrName = Trim(lblKanji.Caption)
        gstrYMD = ""
        gstrHMS = ""
        gstrKingaku = ""
            
        '*****退職チェック
        If gtblSyainM.TaisyokuYMD = "" Then
        Else
            If CLng(DateDiff("d", CDate(gtblSyainM.TaisyokuYMD), gstrSysDate)) >= 0 Then
                If MsgBox("この社員は" & gtblSyainM.TaisyokuYMD & "に" & vbCr & _
                                "退職しましたが、当処理を実行してもよろしいですか？", _
                                    vbQuestion + vbOKCancel, "小口貸付データ登録") = vbCancel Then
                    Exit Sub
                End If
            End If
        End If
        
        '*****小口融資台帳T存在チェック
        If gfuncDaicyoChk(lngRecCnt) = False Then Exit Sub
        If lngRecCnt = 0 Then
            If MsgBox("小口融資台帳テーブルに登録されていませんが、当処理を実行してもよろしいですか？", _
                            vbQuestion + vbOKCancel, "小口貸付データ登録") = vbCancel Then
                Exit Sub
            End If
        End If
        
    Case 1      ' 削除
        '*****削除対象チェック
        If gVarSpdGetText(sprList, 4, sprList.ActiveRow) = "●" Then
            '変数に退避
            gstrCode = Trim(txtSyainCD.Text)
            gstrName = Trim(lblKanji.Caption)
            gstrYMD = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 1, sprList.ActiveRow), "yyyymmdd")
            gstrHMS = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 2, sprList.ActiveRow), "hhmmss")
            gstrKingaku = Format(gVarSpdGetText(frmQPAV_CEnt310.sprList, 3, sprList.ActiveRow), "0")
            
        Else
            'Msg = 貸付金額を取消する該当データを選択してください。
            lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
            Exit Sub
        End If
    
        '日付範囲チェック
        If DateCheckNo(gVarSpdGetText(sprList, 1, sprList.ActiveRow)) <> 0 Then
            'Msg = 貸付金額を取消する該当データを選択してください。
            lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
            Exit Sub
        End If
    
    End Select
    
    '画面遷移
    frmQPAV_CEnt311.Show vbModal
    
    '*****更新後再表示処理
    If gblnDataSetFlg = True Then
       'SP実行
        blnRet = gfuncSPGet(lngRecCnt)
        Call funcSPSet
        If lngRecCnt = 0 Then
            cmdExec(1).Enabled = False
        Else
            cmdExec(1).Enabled = True
        End If
    End If

End Sub
'**************************************************************************************************
'名寄せボタン押下
'**************************************************************************************************
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
'**************************************************************************************************
'各ファンクションキー機能
'**************************************************************************************************
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
            txtSyainCD.SetFocus
    End Select
    
End Sub
'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        '*****オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "小口融資貸付データ登録 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        '*****オラクルデータベースの確立
'        If Not gblnConnectOracleDatabase("scott", "tiger", "") Then
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "小口融資貸付データ登録 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        '*****サーバーシステム日付取得
        If gfuncInit = False Then Exit Sub
        
        '*****画面初期化
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
'*FORM_KEYPRESS
'**************************************************************************************************
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
    
    Me.Caption = "小口融資貸付データ登録 (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    bInit_Flg = True
    sprList.MaxRows = 0

End Sub
'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    Dim lngRecCnt As Long
    Dim flg As Boolean
    
    '*****手動履歴T既存チェック
    If gfuncKgcKasitukeTChk(lngRecCnt, 1) = False Then Exit Sub
        
    If lngRecCnt > 0 Then
        '*****帳票印刷
        Call subPrintReport(crptToPrinter)
    End If

    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt310 = Nothing

End Sub

'**************************************************************************************************
'*社員コードフォーカス取得時全テキスト選択
'**************************************************************************************************
Private Sub txtSyainCD_GotFocus()
    
    Call gsubSelectText(txtSyainCD)

End Sub

'**************************************************************************************************
'*社員コード入力文字制御（数字のみ）
'**************************************************************************************************
Private Sub txtSyainCD_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub
'**************************************************************************************************
'*実行ボタン処理
'**************************************************************************************************
Private Sub subCmdJikkou()
    Dim i           As Integer
    Dim lngRecCnt   As Long
    Dim intChkNo    As Integer
    
    Call subErrKaijo
    
    '排他解除
    Call gblnHaita_Unlock
    
    cmdPFK(5).SetFocus
    
    If Trim$(txtSyainCD.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 社員コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyainCD.BackColor = vbRed
        txtSyainCD.Enabled = True
        txtSyainCD.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
                
    '変数に退避
    gstrCode = txtSyainCD.Text
        
    '排他制御
    If Not gblnHaita_Lock Then GoTo exit_subCmdJikkou

     If gfuncSeachSyain = False Then
        '排他解除
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    Else
        If gtblSyainM.SonzaiFlg = "1" Then
            lblFurigana.Caption = gtblSyainM.SimeiKana                  '個人名カナ
            lblKanji.Caption = gtblSyainM.SimeiKanji                    '個人名漢字
            lblTenCd.Caption = gtblSyainM.MiseCD                        '店コード
            lblTenNm.Caption = gtblSyainM.MiseName                      '店名
            lblTozai.Caption = gtblSyainM.TozaiKBN                      '東西区分
            lblBumonCd.Caption = gtblSyainM.BumonCD                     '部門コード
            lblBumonNm.Caption = gtblSyainM.BumonName                   '部門名
            lblShikaku.Caption = gtblSyainM.SikakuCD                    '資格コード
            lblKyu.Caption = gtblSyainM.TokyuCD                         '等級コード
            lblSeinengappi.Caption = gtblSyainM.BornYMD                 '生年月日
        Else
            'Msg = 社員属性が存在しません。
            lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
            txtSyainCD.SetFocus
            txtSyainCD.BackColor = vbRed
    
            '排他解除
            Call gblnHaita_Unlock
            GoTo exit_subCmdJikkou
        End If
    End If
    
    '*****退職日付チェック（貸付登録期間前に退職した人かチェック）
    If gtblSyainM.TaisyokuYMD <> "" Then
        intChkNo = DateCheckNo(gtblSyainM.TaisyokuYMD)
    End If
    '*****貸付データ取得
    If gfuncSPGet(lngRecCnt) = False Then
    
        '排他解除
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    
    Else
        ' データ無の場合、メッセージを表示する
        If lngRecCnt = 0 Then
            If intChkNo = gintERR_DATE Then
                'Msg = 退職しました
                lblMsg.Caption = "この社員は退職されています"
                cmdExec(0).Enabled = False
            Else
                'Msg = 該当データが存在しません。
                lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
                cmdExec(0).Enabled = True
                cmdExec(0).SetFocus
            End If
            
            cmdExec(1).Enabled = False
        
        ' データ有の場合、メッセージを表示する
        Else
            '*****スプリッド表示
            Call funcSPSet
            
            If intChkNo = gintERR_DATE Then
                'Msg = 退職しました
                lblMsg.Caption = "この社員は退職しています"
                cmdExec(0).Enabled = False
                cmdExec(1).Enabled = False
            
            Else
                cmdExec(0).Enabled = True
                cmdExec(1).Enabled = True
                cmdExec(0).SetFocus
            End If
        End If
    End If
    
    '入力制御処理
    txtSyainCD.Enabled = False
    cmdName.Enabled = False
    cmdPFK(5).Enabled = False
               
exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
    
End Sub
'**************************************************************************************************
'*エラー解除処理
'**************************************************************************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCD.BackColor = vbWhite

End Sub
'**************************************************************************************************
'*画面初期化
'**************************************************************************************************
Private Sub subFormInitialize()
    Dim i As Integer
    
    '排他解除
    Call gblnHaita_Unlock
    
    '各表示項目クリア
    txtSyainCD.Text = ""
    txtSyainCD.BackColor = vbWhite
    txtSyainCD.Enabled = True
    cmdName.Enabled = True
    lblFurigana.Caption = ""
    lblKanji.Caption = ""
    lblTenCd.Caption = ""
    lblTenNm.Caption = ""
    lblTozai.Caption = ""
    lblBumonCd.Caption = ""
    lblBumonNm.Caption = ""
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblSeinengappi.Caption = ""
    For i = 0 To 1
        cmdExec(i).Enabled = False
    Next i
    cmdPFK(5).Enabled = True
    
    'スプレッドクリア
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
     
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
End Sub
'**************************************************************************************************
'*スプリッド表示
'**************************************************************************************************
Private Sub funcSPSet()
    Dim i                   As Long
    
    'スプレッドクリア
    Call gsubSpdClear(sprList)
    
    '抽出レコードをリストに表示
    sprList.MaxRows = glngTblCnt

    For i = 1 To glngTblCnt
        '貸付日付
        Call gsubSetCellText(sprList, 1, i, Left(gtblKasituke(i).YMD, 4) & "/" & _
                                                Mid(gtblKasituke(i).YMD, 5, 2) & "/" & _
                                                    Right(gtblKasituke(i).YMD, 2))
        '貸付時間
        Call gsubSetCellText(sprList, 2, i, Left(gtblKasituke(i).HMS, 2) & ":" & _
                                                Mid(gtblKasituke(i).HMS, 3, 2) & ":" & _
                                                    Right(gtblKasituke(i).HMS, 2))
        '貸付金額
        Call gsubSetCellText(sprList, 3, i, Format(gtblKasituke(i).Kingaku, "#,##0"))
        
        '手動登録、登録者名、登録日付
        If gtblKasituke(i).flg = "1" Then
            Call gsubSetCellText(sprList, 4, i, "●")
            Call gsubSetCellText(sprList, 5, i, gtblKasituke(i).TourokuName)
            Call gsubSetCellText(sprList, 6, i, Left(gtblKasituke(i).TourokuYMD, 4) & "/" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 5, 2) & "/" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 7, 2) & _
                                                    Space(1) & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 9, 2) & ":" & _
                                                    Mid(gtblKasituke(i).TourokuYMD, 11, 2) & ":" & _
                                                    Right(gtblKasituke(i).TourokuYMD, 2))
        Else
            Call gsubSetCellText(sprList, 4, i, "")
            Call gsubSetCellText(sprList, 5, i, "システム自動")
            Call gsubSetCellText(sprList, 6, i, "")
        End If
    Next i

End Sub

Private Sub subPrintReport(intDestinationConstants As DestinationConstants)

Dim strConectPoint      As String
Dim intRet              As Integer

    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt310.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        .Formulas(0) = "PARA1='" & gstrSysDate & "'"

        '出力先設定
        .Destination = intDestinationConstants

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
        .Reset

    End With

End Sub
