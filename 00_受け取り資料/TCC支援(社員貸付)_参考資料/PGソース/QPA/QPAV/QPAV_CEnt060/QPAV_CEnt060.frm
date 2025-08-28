VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt060 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "貸付金データ計上取消"
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
      TabIndex        =   23
      Top             =   1380
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   5205
         Left            =   3990
         TabIndex        =   1
         Top             =   330
         Width           =   5175
         _Version        =   196608
         _ExtentX        =   9128
         _ExtentY        =   9181
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
         MaxCols         =   4
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt060.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "復帰"
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
         Left            =   7140
         TabIndex        =   3
         Top             =   5760
         Width           =   1305
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "取消"
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
         Left            =   4830
         TabIndex        =   2
         Top             =   5760
         Width           =   1305
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   90
      TabIndex        =   20
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
         TabIndex        =   26
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
         TabIndex        =   40
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
         TabIndex        =   39
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
         TabIndex        =   38
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
         TabIndex        =   37
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
         TabIndex        =   36
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
         TabIndex        =   35
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
         TabIndex        =   34
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
         TabIndex        =   33
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
         TabIndex        =   32
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
         TabIndex        =   31
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
         TabIndex        =   30
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
         TabIndex        =   29
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
         TabIndex        =   28
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
         TabIndex        =   27
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
         TabIndex        =   25
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
         TabIndex        =   24
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
         TabIndex        =   22
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
         Left            =   1305
         TabIndex        =   21
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
      TabIndex        =   19
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
         TabIndex        =   4
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   10
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
         Index           =   6
         Left            =   6015
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   14
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
         Index           =   11
         Left            =   11955
         TabIndex        =   15
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
         TabIndex        =   8
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
      TabIndex        =   17
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
         TabIndex        =   18
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   16
      Top             =   8880
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
            TextSave        =   "2004/04/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "16:00"
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
Attribute VB_Name = "frmQPAV_CEnt060"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click(Index As Integer)

    lblMsg.Caption = ""
    
    Select Case Index
        Case 0
            If gVarSpdGetText(sprList, sprList.ActiveCol, sprList.ActiveRow) = "" Then
                'Msg = 貸付金額を取消する該当データを選択してください。
                lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
                Exit Sub
            End If
            
            If gVarSpdGetText(sprList, 4, sprList.ActiveRow) = "○" Then
                'Msg = 貸付金額を取消する該当データを選択してください。
                lblMsg.Caption = "WPOE17 " & gstrGetCodeMeisyo(odbDatabase, "E17", "WPO")
                Exit Sub
            End If
            
            If MsgBox("貸付金額を取消ます。よろしいですか？", vbQuestion + vbOKCancel, "貸付金データ計上取消") = vbCancel Then
                Exit Sub
            End If
            
            '変数に退避
            gstrYMD = Format(gVarSpdGetText(frmQPAV_CEnt060.sprList, 1, sprList.ActiveRow), "yyyymmdd")
            gstrHMS = Format(gVarSpdGetText(frmQPAV_CEnt060.sprList, 2, sprList.ActiveRow), "hhmmss")
            gstrDelFlg = "1"
            
        Case 1
            If gVarSpdGetText(sprList, sprList.ActiveCol, sprList.ActiveRow) = "" Then
                'Msg = 貸付金額を復帰する該当データを選択してください。
                lblMsg.Caption = "WPOE18 " & gstrGetCodeMeisyo(odbDatabase, "E18", "WPO")
                Exit Sub
            End If
            
            If gVarSpdGetText(sprList, 4, sprList.ActiveRow) = "" Then
                'Msg = 貸付金額を復帰する該当データを選択してください。
                lblMsg.Caption = "WPOE18 " & gstrGetCodeMeisyo(odbDatabase, "E18", "WPO")
                Exit Sub
            End If
            
            If MsgBox("貸付金額を復帰します。よろしいですか？", vbQuestion + vbOKCancel, "貸付金データ計上取消") = vbCancel Then
                Exit Sub
            End If
            
            '変数に退避
            gstrYMD = Format(gVarSpdGetText(frmQPAV_CEnt060.sprList, 1, sprList.ActiveRow), "yyyymmdd")
            gstrHMS = Format(gVarSpdGetText(frmQPAV_CEnt060.sprList, 2, sprList.ActiveRow), "hhmmss")
            gstrDelFlg = ""
            
    End Select

    If gfuncSPUpd = False Then Exit Sub
    If gfuncSPSet = False Then Exit Sub

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
        
'        gstrFormObjectName = "貸付金データ計上取消"
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "貸付金データ計上取消 (" & gstrCommandLine(8) & ") " _
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
                                    , "貸付金データ計上取消 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
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
    
    Me.Caption = "貸付金データ計上取消 (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    bInit_Flg = True
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
    
    Set frmQPAV_CEnt060 = Nothing

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
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim i As Integer
    
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
        'Msg = 社員属性が存在しません。
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
        txtSyainCD.SetFocus
        txtSyainCD.BackColor = vbRed
        '排他解除
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    End If
    
   'SP実行
    If gfuncSPSet = False Then
        txtSyainCD.SetFocus
        '排他解除
        Call gblnHaita_Unlock
        GoTo exit_subCmdJikkou
    End If
    
    '入力制御処理
    txtSyainCD.Enabled = False
    cmdName.Enabled = False
    cmdPFK(5).Enabled = False
    For i = 0 To 1
        cmdExec(i).Enabled = True
    Next i
               
exit_subCmdJikkou:
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    DoEvents
    
End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCD.BackColor = vbWhite

End Sub

'***********************************************************************************************************
'*画面初期化
'***********************************************************************************************************
Private Sub subFormInitialize()
    Dim i As Integer
    
    '排他解除
    Call gblnHaita_Unlock
    
    '各表示項目クリア
    txtSyainCD.Text = ""
    txtSyainCD.BackColor = vbWhite
    txtSyainCD.Enabled = True
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
