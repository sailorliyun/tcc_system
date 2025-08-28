VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt170 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "自社登録内容変更処理"
   ClientHeight    =   8655
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
   ScaleHeight     =   8655
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdExec 
      Caption         =   "更新"
      Height          =   495
      Left            =   150
      TabIndex        =   10
      Top             =   6630
      Width           =   1275
   End
   Begin VB.Frame fra_Data 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   6525
      Left            =   90
      TabIndex        =   27
      Top             =   0
      Width           =   14250
      Begin VB.TextBox txtZaimukyokuCD 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   0
         Top             =   1305
         Width           =   5295
      End
      Begin VB.TextBox txtSyozaiti 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   1
         Top             =   1800
         Width           =   5295
      End
      Begin VB.TextBox txtKaisyaName 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   2
         Top             =   2340
         Width           =   5295
      End
      Begin VB.TextBox txtFurikomiGinko 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   3
         Top             =   2895
         Width           =   5295
      End
      Begin VB.TextBox txtKouzaBangou 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   4
         Top             =   3435
         Width           =   5295
      End
      Begin VB.TextBox txtKouzaMeigi 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   4  '全角ひらがな
         Left            =   5040
         TabIndex        =   5
         Top             =   3975
         Width           =   5295
      End
      Begin VB.TextBox txtKamikiKaisiMM 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         IMEMode         =   3  'ｵﾌ固定
         Left            =   5040
         MaxLength       =   2
         TabIndex        =   6
         Top             =   4515
         Width           =   420
      End
      Begin VB.TextBox txtSimokiKaisiMM 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         IMEMode         =   3  'ｵﾌ固定
         Left            =   5040
         MaxLength       =   2
         TabIndex        =   8
         Top             =   5055
         Width           =   420
      End
      Begin VB.TextBox txtSimokiKaisiDD 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         IMEMode         =   3  'ｵﾌ固定
         Left            =   5925
         MaxLength       =   2
         TabIndex        =   9
         Top             =   5055
         Width           =   420
      End
      Begin VB.TextBox txtKamikiKaisiDD 
         Alignment       =   1  '右揃え
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         IMEMode         =   3  'ｵﾌ固定
         Left            =   5925
         MaxLength       =   2
         TabIndex        =   7
         Top             =   4515
         Width           =   420
      End
      Begin VB.Label lblJishaCD 
         BorderStyle     =   1  '実線
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   5040
         TabIndex        =   41
         Top             =   780
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "自社コード"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3690
         TabIndex        =   40
         Top             =   840
         Width           =   1200
      End
      Begin VB.Label Label24 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "上期開始月日"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3450
         TabIndex        =   39
         Top             =   4545
         Width           =   1440
      End
      Begin VB.Label Label23 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "下期開始月日"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3450
         TabIndex        =   38
         Top             =   5100
         Width           =   1440
      End
      Begin VB.Label Label22 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "口座名義"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3930
         TabIndex        =   37
         Top             =   4005
         Width           =   960
      End
      Begin VB.Label Label21 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "口座番号"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3930
         TabIndex        =   36
         Top             =   3465
         Width           =   960
      End
      Begin VB.Label Label20 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "振込銀行"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3930
         TabIndex        =   35
         Top             =   2925
         Width           =   960
      End
      Begin VB.Label Label19 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "会社名称"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3930
         TabIndex        =   34
         Top             =   2385
         Width           =   960
      End
      Begin VB.Label Label18 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "所在地"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   4170
         TabIndex        =   33
         Top             =   1830
         Width           =   720
      End
      Begin VB.Label Label17 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "財務局コード"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   3465
         TabIndex        =   32
         Top             =   1335
         Width           =   1440
      End
      Begin VB.Label Label16 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "月"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   5550
         TabIndex        =   31
         Top             =   4605
         Width           =   240
      End
      Begin VB.Label Label15 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "月"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   5550
         TabIndex        =   30
         Top             =   5130
         Width           =   240
      End
      Begin VB.Label Label14 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "日"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   6450
         TabIndex        =   29
         Top             =   4605
         Width           =   240
      End
      Begin VB.Label Label9 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "日"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   6450
         TabIndex        =   28
         Top             =   5145
         Width           =   240
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
      TabIndex        =   26
      TabStop         =   0   'False
      Top             =   7695
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
         TabIndex        =   11
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
         TabIndex        =   12
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
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   90
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Enabled         =   0   'False
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
         TabIndex        =   13
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
         Left            =   6015
         TabIndex        =   18
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
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   21
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
         TabIndex        =   14
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
         TabIndex        =   22
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
         TabIndex        =   15
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
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   7200
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
         TabIndex        =   25
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   23
      Top             =   8280
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
            TextSave        =   "16:34"
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
Attribute VB_Name = "frmQPAV_CEnt170"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click()
'*****************************************************************************************
'   更新ボタン押下処理
'*****************************************************************************************
    If Chk_err = False Then Exit Sub
    
    If MsgBox("更新してよろしいですか？", vbQuestion + vbOKCancel, "自社登録内容変更処理") = vbCancel Then
        Exit Sub
    End If
    
    If gsubSPUpd = False Then Exit Sub

End Sub

Private Function Chk_err() As Boolean
'*****************************************************************************************
'   各項目の入力・桁数チェック
'*****************************************************************************************
    Chk_err = False
    
    If Chk_txt(txtZaimukyokuCD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 財務局コード" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtZaimukyokuCD, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 財務局コード" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtSyozaiti) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 所在地" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtSyozaiti, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 所在地" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKaisyaName) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 会社名称" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKaisyaName, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 会社名称" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtFurikomiGinko) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 振込銀行" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtFurikomiGinko, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 振込銀行" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKouzaBangou) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 口座番号" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKouzaBangou, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 口座番号" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKouzaMeigi) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 口座名義" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    Else
        If Chk_lentxt1(txtKouzaMeigi, 40) = False Then
            'Msg = の入力桁数がオーバーしました。
            lblMsg.Caption = "WPOE04 口座名義" & gstrGetCodeMeisyo(odbDatabase, "E04", "WPO")
            Exit Function
        End If
    End If
    
    If Chk_txt(txtKamikiKaisiMM) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 上期開始月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtKamikiKaisiMM.Text = Format(txtKamikiKaisiMM.Text, "00")
    
    If Chk_txt(txtKamikiKaisiDD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 上期開始日" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtKamikiKaisiDD.Text = Format(txtKamikiKaisiDD.Text, "00")
        
    If IsDate(Format(gdatSysDate, "yyyy") & "/" & txtKamikiKaisiMM.Text & "/" & txtKamikiKaisiDD.Text) = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 上期期開始月日" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtKamikiKaisiMM.BackColor = vbRed
        txtKamikiKaisiDD.BackColor = vbRed
        txtKamikiKaisiMM.SetFocus
        Exit Function
    End If
    
    If Chk_txt(txtSimokiKaisiMM) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 下期開始月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSimokiKaisiMM.Text = Format(txtSimokiKaisiMM.Text, "00")
    
    If Chk_txt(txtSimokiKaisiDD) = False Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 下期開始日" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        Exit Function
    End If
    txtSimokiKaisiDD.Text = Format(txtSimokiKaisiDD.Text, "00")
    
    If IsDate(Format(gdatSysDate, "yyyy") & "/" & txtSimokiKaisiMM.Text & "/" & txtSimokiKaisiDD.Text) = False Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 下期期開始月日" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSimokiKaisiMM.BackColor = vbRed
        txtSimokiKaisiDD.BackColor = vbRed
        txtSimokiKaisiMM.SetFocus
        Exit Function
    End If
    
    If Val(txtKamikiKaisiMM.Text) = Val(txtSimokiKaisiMM.Text) Then
        'Msg = 上期開始月と下期期開始月が同じ月になっています。
        lblMsg.Caption = "WPOE23 " & gstrGetCodeMeisyo(odbDatabase, "E23", "WPO")
        txtKamikiKaisiMM.BackColor = vbRed
        txtSimokiKaisiMM.BackColor = vbRed
        txtKamikiKaisiMM.SetFocus
        Exit Function
    End If
    
    Chk_err = True
    
End Function

Private Sub Form_Load()
'*****************************************************************************************
'   Formロード
'*****************************************************************************************
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    Me.Caption = "自社登録内容変更処理 (" & gstrCommandLine(8) & ")"
    bInit_Flg = True
    cmdExec.Enabled = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
'*****************************************************************************************
'   Form Unload
'*****************************************************************************************
    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt170 = Nothing
End Sub

Private Sub Form_Activate()
'*****************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'*****************************************************************************************
    Dim ret  As Boolean
    
    If bInit_Flg = True Then
        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "自社登録内容変更処理 (" & gstrCommandLine(8) & ") " _
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
                                    , "自社登録内容変更処理 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'サーバー日付取得
        Call gsubGetSysDate
            
        '排他解除
        Call gblnHaita_Unlock
        
        '排他制御
        If gblnHaita_Lock = False Then
            Me.Enabled = True
            MousePointer = vbDefault
            fra_Data.Enabled = False
            cmdPFK(12).Enabled = False
            Exit Sub
        End If
        
        Call subFormInitialize
        Call gsubSelectText(txtZaimukyokuCD)
        
        Me.Enabled = True
        MousePointer = vbDefault
        bInit_Flg = False          '初期 FLG オフ
    End If


End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*****************************************************************************************
'   FORM_KEYDOWN ファンクションキー設定
'*****************************************************************************************
    
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

Private Sub Form_KeyPress(KeyAscii As Integer)
'*****************************************************************************************
'   FORM_KEYPRESS
'*****************************************************************************************
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
        
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

Private Sub cmdPFK_Click(Index As Integer)
'*****************************************************************************************
'   各ファンクションキー機能
'*****************************************************************************************
    
    Select Case Index
        Case 1  'メニュー
            Unload Me
        Case 2  'ハードコピー
            Call gsubQSAV_ActX1001
        Case 10 '前画面
            Unload Me
        Case 12 '取消
            Call subFormInitialize
            txtZaimukyokuCD.SetFocus
    End Select
    
End Sub

Private Sub subFormInitialize()
'*****************************************************************************************
'   画面初期化
'*****************************************************************************************
        
    'データの取得
     Call gsubSPInit
    
    'データ表示
    lblJishaCD.Caption = gtblJisya.JisyaCD
    txtZaimukyokuCD.Text = gtblJisya.ZaimuCD
    txtSyozaiti.Text = gtblJisya.Syozaichi
    txtKaisyaName.Text = gtblJisya.KaisyaNM
    txtFurikomiGinko.Text = gtblJisya.FurikomiBK
    txtKouzaBangou.Text = gtblJisya.KozaNO
    txtKouzaMeigi.Text = gtblJisya.KozaNM
    txtKamikiKaisiMM.Text = gtblJisya.KamikiM
    txtKamikiKaisiDD.Text = gtblJisya.KamikiD
    txtSimokiKaisiMM.Text = gtblJisya.SimokiM
    txtSimokiKaisiDD.Text = gtblJisya.SimokiD
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    cmdExec.Enabled = True

End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*****************************************************************************************
'   エラーメッセージボックスを表示する。
'*****************************************************************************************
    
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("自社登録内容変更処理", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt170.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'*****************************************************************************************
'   テキストのエラー解除
'*****************************************************************************************
Private Sub txtFurikomiGinko_Change()
    txtFurikomiGinko.BackColor = vbWhite
End Sub

Private Sub txtKaisyaName_Change()
    txtKaisyaName.BackColor = vbWhite
End Sub

Private Sub txtKamikiKaisiDD_Change()
    txtKamikiKaisiMM.BackColor = vbWhite
    txtKamikiKaisiDD.BackColor = vbWhite
End Sub

Private Sub txtKamikiKaisiMM_Change()
    txtKamikiKaisiMM.BackColor = vbWhite
    txtKamikiKaisiDD.BackColor = vbWhite
    txtSimokiKaisiMM.BackColor = vbWhite
End Sub

Private Sub txtKouzaBangou_Change()
    txtKouzaBangou.BackColor = vbWhite
End Sub

Private Sub txtKouzaMeigi_Change()
    txtKouzaMeigi.BackColor = vbWhite
End Sub

Private Sub txtSimokiKaisiDD_Change()
    txtSimokiKaisiMM.BackColor = vbWhite
    txtSimokiKaisiDD.BackColor = vbWhite
End Sub

Private Sub txtSimokiKaisiMM_Change()
    txtKamikiKaisiMM.BackColor = vbWhite
    txtSimokiKaisiMM.BackColor = vbWhite
    txtSimokiKaisiDD.BackColor = vbWhite
End Sub

Private Sub txtSyozaiti_Change()
    txtSyozaiti.BackColor = vbWhite
End Sub

Private Sub txtZaimukyokuCD_Change()
    txtZaimukyokuCD.BackColor = vbWhite
End Sub

'*****************************************************************************************
'   フォーカス取得時全テキスト選択
'*****************************************************************************************
Private Sub txtZaimukyokuCD_GotFocus()
    Call gsubSelectText(txtZaimukyokuCD)
End Sub

Private Sub txtSyozaiti_GotFocus()
    Call gsubSelectText(txtSyozaiti)
End Sub

Private Sub txtKaisyaName_GotFocus()
    Call gsubSelectText(txtKaisyaName)
End Sub

Private Sub txtFurikomiGinko_GotFocus()
    Call gsubSelectText(txtFurikomiGinko)
End Sub

Private Sub txtKouzaBangou_GotFocus()
    Call gsubSelectText(txtKouzaBangou)
End Sub

Private Sub txtKouzaMeigi_GotFocus()
    Call gsubSelectText(txtKouzaMeigi)
End Sub

Private Sub txtKamikiKaisiMM_GotFocus()
    Call gsubSelectText(txtKamikiKaisiMM)
End Sub

Private Sub txtKamikiKaisidd_GotFocus()
    Call gsubSelectText(txtKamikiKaisiDD)
End Sub

Private Sub txtSimokiKaisiMM_GotFocus()
    Call gsubSelectText(txtSimokiKaisiMM)
End Sub

Private Sub txtSimokiKaisidd_GotFocus()
    Call gsubSelectText(txtSimokiKaisiDD)
End Sub

'*****************************************************************************************
'   入力文字制御（数字のみ）
'*****************************************************************************************
Private Sub txtKamikiKaisiMM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtKamikiKaisidd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSimokiKaisiMM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtSimokiKaisidd_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

