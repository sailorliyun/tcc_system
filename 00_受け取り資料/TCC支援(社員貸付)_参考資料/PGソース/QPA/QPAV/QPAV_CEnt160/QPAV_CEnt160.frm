VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt160 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "控除中止処理"
   ClientHeight    =   9435
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
   ScaleHeight     =   9435
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.OptionButton optKoujo 
      Caption         =   "控除しない"
      Height          =   825
      Index           =   0
      Left            =   5400
      Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
      TabIndex        =   4
      Top             =   6360
      Width           =   1545
   End
   Begin VB.OptionButton optKoujo 
      Caption         =   "控除する"
      Height          =   825
      Index           =   1
      Left            =   7140
      Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
      TabIndex        =   5
      Top             =   6360
      Value           =   -1  'True
      Width           =   1545
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "更新"
      Height          =   495
      Left            =   150
      TabIndex        =   6
      Top             =   7440
      Width           =   1065
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1365
      Left            =   120
      TabIndex        =   23
      Top             =   30
      Width           =   14190
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
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   1950
         MaxLength       =   1
         TabIndex        =   0
         Top             =   300
         Width           =   285
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
         Left            =   3390
         TabIndex        =   2
         Top             =   270
         Width           =   1455
      End
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
         Height          =   270
         IMEMode         =   3  'ｵﾌ固定
         Left            =   2280
         MaxLength       =   7
         TabIndex        =   1
         Top             =   300
         Width           =   1005
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
         Left            =   10650
         TabIndex        =   42
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
         Left            =   10800
         TabIndex        =   41
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
         Left            =   10320
         TabIndex        =   40
         Top             =   990
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
         Left            =   11250
         TabIndex        =   39
         Top             =   300
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
         Left            =   11250
         TabIndex        =   38
         Top             =   630
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
         Left            =   11250
         TabIndex        =   37
         Top             =   960
         Width           =   2775
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
         Left            =   7350
         TabIndex        =   36
         Top             =   990
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
         Left            =   6660
         TabIndex        =   35
         Top             =   990
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
         Left            =   5670
         TabIndex        =   34
         Top             =   1020
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
         Left            =   6660
         TabIndex        =   33
         Top             =   660
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
         Left            =   5670
         TabIndex        =   32
         Top             =   660
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
         Left            =   7380
         TabIndex        =   31
         Top             =   300
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
         Left            =   6660
         TabIndex        =   30
         Top             =   300
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
         Left            =   5820
         TabIndex        =   29
         Top             =   300
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
         Left            =   1950
         TabIndex        =   28
         Top             =   990
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
         Left            =   1980
         TabIndex        =   27
         Top             =   720
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
         Left            =   1080
         TabIndex        =   26
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
         Left            =   1050
         TabIndex        =   24
         Top             =   360
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   8475
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
         TabIndex        =   7
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   13
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
         Index           =   6
         Left            =   6015
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
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
         Index           =   9
         Left            =   9570
         TabIndex        =   17
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
         Index           =   11
         Left            =   11955
         TabIndex        =   18
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
         TabIndex        =   11
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
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7995
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
         TabIndex        =   21
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   19
      Top             =   9060
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
            TextSave        =   "2005/06/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "14:06"
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
      Height          =   4770
      Left            =   120
      TabIndex        =   25
      Top             =   1380
      Width           =   14190
      Begin FPSpread.vaSpread sprList 
         Height          =   3615
         Left            =   1980
         TabIndex        =   3
         Top             =   420
         Width           =   10725
         _Version        =   196608
         _ExtentX        =   18918
         _ExtentY        =   6376
         _StockProps     =   64
         MaxCols         =   9
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt160.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'ﾌﾗｯﾄ
      BackColor       =   &H80000004&
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   43
      Top             =   6120
      Width           =   14175
   End
End
Attribute VB_Name = "frmQPAV_CEnt160"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg         As Boolean           '初期フラグ

Private mlngKensuu           As Long     '明細件数

'モジュール変数に設定
Private mlngKyuyoHensai     As Long
Private mlngSyoyoHensai     As Long
Private mlngZanHensai       As Long
Private mStrKojoCyushiFlg   As String

Private mlngTyushiFlg       As Long     'Added by imz.Yoshida 2005/06/16 控除中止対応


Private Sub cmdExec_Click()
    
    If MsgBox("控除中止情報を更新します。よろしいですか？", vbQuestion + vbOKCancel, "控除中止処理") = vbCancel Then
        Exit Sub
    End If
    
    '控除中止有無更新
    If blnUpdKoujyo = False Then
        Exit Sub
    End If

    '画面初期化
    Call subFormInitialize
    
    txtSyainCD1.SetFocus

End Sub

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
'*Formロード
'**************************************************************************************************
Private Sub Form_Load()
    blnInit_Flg = True             '初期フラグ
    
    Me.Caption = "控除中止処理 (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    Call subFormInitialize

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)
    
    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt160 = Nothing

End Sub

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()
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
                                    , "控除中止処理 (" & gstrCommandLine(8) & ")" _
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
                                    , "控除中止処理 (" & gstrCommandLine(8) & ")" _
                                    , objSession.LastServerErr, objSession.LastServerErrText)
            '終了
            Unload Me
        End If

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
            '排他解除
            Call gblnHaita_Unlock
            Call subFormInitialize
            txtSyainCD1.SetFocus
    End Select
    
End Sub

'***********************************************************************************************************
'*画面初期化
'***********************************************************************************************************
Private Sub subFormInitialize()
 Dim intX As Integer
 
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
    
    optKoujo(1).Value = True
    cmdNayose.Enabled = True
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    '各コントロール制御
    cmdPFK(5).Enabled = True
    optKoujo(0).Enabled = False
    optKoujo(1).Enabled = False
    cmdExec.Enabled = False
    txtSyainCD1.Enabled = True
    txtSyainCD2.Enabled = True

    mlngTyushiFlg = 0   'Added by imz.Yoshida 2005/06/16 控除中止対応
    
End Sub

'*************************************************************************************************
'*      実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String

    '排他解除
    Call gblnHaita_Unlock
    
    Call subErrKaijo
    
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
    
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
    cmdNayose.Enabled = False
    Screen.MousePointer = vbHourglass
''    Call subFormInitialize
    
    mlngKyuyoHensai = 0
    mlngSyoyoHensai = 0
    mlngZanHensai = 0
    mStrKojoCyushiFlg = ""
    
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
        cmdPFK(5).Enabled = True
        txtSyainCD2.SetFocus
        cmdNayose.Enabled = True
        Screen.MousePointer = vbDefault
        'ステータスバーメッセージ消去
        stbSystem.Panels.Item(1).Text = ""
        Exit Sub
    End If
    
    'ＳＰ用変数に格納
    
    '◆◆◆□■□社員属性　抽出 ＆ 表示
    ''社員Ｍから抽出
    If blnSeachSyain = False Then
        'Msg = 社員属性が存在しません。
        lblMsg.Caption = "WPOE13 " & gstrGetCodeMeisyo(odbDatabase, "E13", "WPO")
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
    
    Call gsubSpdClear(sprList)
    
    '総件数
    mlngKensuu = 0
    
    sprList.ReDraw = False
    
    ''小口融資台帳テーブルから抽出
    If blnGetKogutiInf Then
        Call subSprKoguti
    End If
    
    ''社員融資台帳テーブルから抽出
    If blnGetSyainYuInf Then
        Call subSprSyainYu
    End If
    sprList.ReDraw = True
    
    '各コントロール制御
    Me.Enabled = True
    
    '該当件数チェック
    If mlngKensuu = 0 Then
        cmdPFK(5).Enabled = True
        cmdNayose.Enabled = True
    Else
        optKoujo(0).Enabled = True
        optKoujo(1).Enabled = True
        'Modified by imz.Yoshida 2005/06/16 控除中止対応 ==>
        'If mStrKojoCyushiFlg = "1" Then
        If mStrKojoCyushiFlg = "1" Or mlngTyushiFlg <> 0 Then
        'Modified by imz.Yoshida 2005/06/16 控除中止対応 <==
            optKoujo(0).Value = True
        Else
            optKoujo(1).Value = True
        End If
        txtSyainCD1.Enabled = False
        txtSyainCD2.Enabled = False
        cmdExec.Enabled = True
        sprList.SetFocus
    End If
    
    
'◆ ''今は殺しておく    cmdOsori.Enabled = True
    Screen.MousePointer = vbDefault
    stbSystem.Panels.Item(1).Text = ""

End Sub

'*******************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("控除中止処理", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt160.Name, _
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

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160SelSyainZoku(" & _
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
'*　　手続き名：　小口返済額情報取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　小口返済額情報取得ＳＰを使用し、小口返済額情報を取得する
'*********************************************************************************************
Private Function blnGetKogutiInf() As Boolean
    
    Dim strSQL      As String
    Dim strEdit     As String
    
On Error GoTo errGetKogutiInf

    blnGetKogutiInf = False
    
    '小口返済額情報 取得 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '社員コード２
                
    '給与返済額
    odbDatabase.Parameters.Add "OtNumKyuyoHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumKyuyoHensai").ServerType = ORATYPE_NUMBER
    '賞与返済額
    odbDatabase.Parameters.Add "OtNumSyoyoHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumSyoyoHensai").ServerType = ORATYPE_NUMBER
    '返済残高額
    odbDatabase.Parameters.Add "OtNumZanHensai", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZanHensai").ServerType = ORATYPE_NUMBER
    '控除中止Flg
    odbDatabase.Parameters.Add "OtStrKojoCyushiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrKojoCyushiFlg").ServerType = ORATYPE_VARCHAR2
    
    '存在Flg
    odbDatabase.Parameters.Add "OtStrSonzaiFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrSonzaiFlg").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160GetKogutiInf(" & _
             ":InStrPRMSyainCD1, " & _
             ":InStrPRMSyainCD2, " & _
             ":OtNumKyuyoHensai, " & _
             ":OtNumSyoyoHensai, " & _
             ":OtNumZanHensai, " & _
             ":OtStrKojoCyushiFlg, " & _
             ":OtstrSonzaiFlg); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '該当データなし
    If odbDatabase.Parameters("OtStrSonzaiFlg") = "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    'モジュール変数に設定
    mlngKyuyoHensai = odbDatabase.Parameters("OtNumKyuyoHensai").Value
    mlngSyoyoHensai = odbDatabase.Parameters("OtNumSyoyoHensai").Value
    mlngZanHensai = odbDatabase.Parameters("OtNumZanHensai").Value
    mStrKojoCyushiFlg = Trim(odbDatabase.Parameters("OtStrKojoCyushiFlg").Value)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    blnGetKogutiInf = True

    Exit Function
    
errGetKogutiInf:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    小口融資台帳TBL取得情報をスプレットに設定
'***********************************************************************************
Private Sub subSprKoguti()
 Dim StrValue      As String '項目値文字列

    '総件数
    mlngKensuu = 1

    With sprList
        
        .MaxRows = 1
        
        '種別
        .SetText 1, 1, "小口"
        '融資日
        '返済月数
        '融資額
        '給与返済額
        StrValue = Format$(CDbl(mlngKyuyoHensai), "#,##0")
        .SetText 5, 1, StrValue
        '賞与返済額
        StrValue = Format$(CDbl(mlngSyoyoHensai), "#,##0")
        .SetText 6, 1, StrValue
        '残高
        StrValue = Format$(CDbl(mlngZanHensai), "#,##0")
        .SetText 7, 1, StrValue
    End With

End Sub
'*********************************************************************************************
'*　　手続き名：　社員融資情報取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*　　機能概要：　社員融資台帳TBLより、証書明細情報を取得する
'*********************************************************************************************
Private Function blnGetSyainYuInf()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30


On Error GoTo errGetSyainYuInf
    
    blnGetSyainYuInf = False

    '社員属性取得 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '社員コード２
    
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
    
    '証書明細 配列
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtstrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2

    'ＳＱＬ文作成
    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160GetSyouMeisaiInf(" & _
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
'        lngRecCount = lngRecCount + odbDatabase.Parameters("OtNumAryCount")        '【Win2000対応】Del by Yokoyama@NBC 2004/04/23
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))   '【Win2000対応】Add by Yokoyama@NBC 2004/04/23
        
        For j = lngFirstCnt To lngRecCount
            '証書明細データ
            gDataAry(j) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '終了フラグ＝１まで
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    blnGetSyainYuInf = True

    Exit Function

errGetSyainYuInf:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    社員融資台帳TBL取得情報をスプレットに設定
'***********************************************************************************
Private Sub subSprSyainYu()
 Dim i, j          As Long   '
 Dim StrValue      As String '項目値文字列
 Dim StrDate       As String '項目値文字列
 Dim lngKogKensuu  As Long   '小口融資台帳件数
 Dim lngSyaKensuu  As Long   '社員融資台帳件数
 
 Dim dblKyuZan      As Double
 Dim dblSyoZan      As Double

    '総件数
    lngKogKensuu = mlngKensuu
    lngSyaKensuu = UBound(gDataAry())
    mlngKensuu = lngKogKensuu + lngSyaKensuu

    With sprList
        'ｽﾌﾟﾚｯﾄﾞｼｰﾄのMaxRowを設定(max17をこえたら設定する)
'        If mlngKensuu > 17 Then
            .MaxRows = mlngKensuu
'        End If
        
        '1回の件数
        For i = 1 To lngSyaKensuu
                   
            '証書明細１レコード
            StrDate = gDataAry(i)
            
            j = i + lngKogKensuu
        
            '以下一覧表示用
            '種別
            .SetText 1, j, "証書"
            '融資日
            StrValue = Trim$(gfncstrDlm2(StrDate, 1))
            StrValue = Mid$(StrValue, 1, 4) & "/" & Mid$(StrValue, 5, 2) & "/" & Mid$(StrValue, 7, 2)
            .SetText 2, j, StrValue
            '返済月数
            StrValue = Trim$(gfncstrDlm2(StrDate, 5))
            StrValue = Format$(CDbl(StrValue), "#0") + "ヶ月"
            .SetText 3, j, StrValue
            '融資額
            StrValue = Trim$(gfncstrDlm2(StrDate, 2))
            StrValue = Format$(CDbl(Trim$(gfncstrDlm2(StrDate, 6))) _
                             + CDbl(Trim$(gfncstrDlm2(StrDate, 8))), "#,##0")
            .SetText 4, j, StrValue
            '給与返済額
            StrValue = Trim$(gfncstrDlm2(StrDate, 6))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 5, j, StrValue
            '賞与返済額
            StrValue = Trim$(gfncstrDlm2(StrDate, 8))
            StrValue = Format$(CDbl(StrValue), "#,##0")
            .SetText 6, j, StrValue
            
            If IsNull(gfncstrDlm2(StrDate, 13)) Or Trim(gfncstrDlm2(StrDate, 13)) = "" Then
                '給与残高
                StrValue = Trim$(gfncstrDlm2(StrDate, 10))
                dblKyuZan = CDbl(StrValue)
                StrValue = Format$(dblKyuZan, "#,##0")
                .SetText 8, j, StrValue
                '賞与残高
                StrValue = Trim$(gfncstrDlm2(StrDate, 11))
                dblSyoZan = CDbl(StrValue)
                StrValue = Format$(dblSyoZan, "#,##0")
                .SetText 9, j, StrValue
                '残高
                StrValue = Format$(dblKyuZan + dblSyoZan, "#,##0")
                .SetText 7, j, StrValue
            Else
                '残高
                .SetText 7, j, "0"
                '給与残高
                .SetText 8, j, "0"
                '賞与残高
                .SetText 9, j, "0"
            End If
            
            'Added by imz.Yoshida 2005/06/16 控除中止対応 ==>
            If Trim$(gfncstrDlm2(StrDate, 12)) = "1" Then
                mlngTyushiFlg = mlngTyushiFlg + Trim$(gfncstrDlm2(StrDate, 12))
            End If
            'Added by imz.Yoshida 2005/06/16 控除中止対応 <==
            .RowHeight(j) = 9.55
            
        Next i
        
    End With

End Sub

'*********************************************************************************************
'*　　手続き名：　控除中止フラグ更新
'*　　引　数　：　なし
'*　　結　果　：　True…成功  False…失敗
'*　　機能概要：　小口融資台帳、社員融資台帳TBLの控除中止フラグを更新する
'*********************************************************************************************
Private Function blnUpdKoujyo() As Boolean
    Dim strSQL      As String
    Dim strEdit     As String
    Dim strKoujyoFlg     As String
    
    
On Error GoTo errUpdKoujyo

    blnUpdKoujyo = False
    
    If optKoujo(0).Value = True Then
        strKoujyoFlg = "1"
    Else
        strKoujyoFlg = ""
    End If
    
    '更新 ＳＰ
    odbDatabase.Parameters.Add "InStrPRMSyainCD1", gstrSyainCD1, ORAPARM_INPUT     '社員コード１
    odbDatabase.Parameters.Add "InStrPRMSyainCD2", gstrSyainCD2, ORAPARM_INPUT     '社員コード２
    '控除中止Flg
    odbDatabase.Parameters.Add "InStrKojoCyusiFLG", strKoujyoFlg, ORAPARM_INPUT
    'DB更新Flg
    odbDatabase.Parameters.Add "OtUpdateFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtUpdateFlg").ServerType = ORATYPE_VARCHAR2
    
    odbDatabase.Parameters.Add "InstrMenuID", gstrCommandLine(8), ORAPARM_INPUT         'メニューID
    odbDatabase.Parameters.Add "InstrModuleID", gcstrPrjName, ORAPARM_INPUT             'プログラムID
    odbDatabase.Parameters.Add "InstrUserID", gstrCommandLine(1), ORAPARM_INPUT         'ユーザID
    odbDatabase.Parameters.Add "InstrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名
    odbDatabase.Parameters.Add "InstrTozaiKBN", Trim$(gstrCommandLine(10)), ORAPARM_INPUT   '東西区分(利用者)
    odbDatabase.Parameters.Add "InstrBushoCD", gstrCommandLine(11), ORAPARM_INPUT       '部署コード
    odbDatabase.Parameters.Add "InstrTantoNM", gstrCommandLine(2), ORAPARM_INPUT        '担当者名

    strSQL = "BEGIN QPAP_CEnt160PkG.QPAP_CEnt160UpdKoujyo(" & _
             ":InStrPRMSyainCD1," & _
             ":InStrPRMSyainCD2," & _
             ":InStrKojoCyusiFLG," & _
             ":OtUpdateFlg," & _
             ":InstrMenuID," & _
             ":InstrModuleID," & _
             ":InstrUserID," & _
             ":InstrComputerNM," & _
             ":InstrTozaiKBN," & _
             ":InstrBushoCD," & _
             ":InstrTantoNM" & _
             "); END;"

     'SPの実行
     odbDatabase.DbexecuteSQL (strSQL)
     
    '更新失敗
    If odbDatabase.Parameters("OtUpdateFlg") <> "0" Then
        Call gsubParaRemove(odbDatabase)  'オブジェクトの開放
        Exit Function
    End If

    '更新成功

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    blnUpdKoujyo = True

    Exit Function
    
errUpdKoujyo:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtSyainCd1_Change()

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

