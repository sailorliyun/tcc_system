VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt110 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "返済予定表印刷"
   ClientHeight    =   8580
   ClientLeft      =   300
   ClientTop       =   1710
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
   ScaleHeight     =   8580
   ScaleWidth      =   14325
   StartUpPosition =   2  '画面の中央
   Begin VB.PictureBox Picture1 
      Height          =   7425
      Left            =   0
      ScaleHeight     =   7365
      ScaleWidth      =   14265
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   0
      Width           =   14325
      Begin VB.Frame Frame3 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   1215
         Left            =   45
         TabIndex        =   37
         Top             =   -30
         Width           =   14175
         Begin VB.TextBox txtSyainCd 
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
            Index           =   1
            Left            =   2550
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
            Left            =   3705
            TabIndex        =   2
            TabStop         =   0   'False
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtSyainCd 
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
            Index           =   0
            Left            =   2250
            MaxLength       =   1
            TabIndex        =   0
            Top             =   240
            Width           =   270
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
            TabIndex        =   55
            Top             =   780
            Width           =   720
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
            Height          =   165
            Left            =   2310
            TabIndex        =   54
            Top             =   630
            Width           =   2235
         End
         Begin VB.Label lblShimei 
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
            Left            =   2280
            TabIndex        =   53
            Top             =   900
            Width           =   3750
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
            TabIndex        =   52
            Top             =   210
            Width           =   540
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
            Left            =   6990
            TabIndex        =   51
            Top             =   210
            Width           =   315
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
            Index           =   1
            Left            =   7710
            TabIndex        =   50
            Top             =   210
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
            Left            =   6000
            TabIndex        =   49
            Top             =   570
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
            Left            =   6990
            TabIndex        =   48
            Top             =   570
            Width           =   405
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
            TabIndex        =   47
            Top             =   915
            Width           =   720
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
            Left            =   6990
            TabIndex        =   46
            Top             =   930
            Width           =   525
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
            Index           =   1
            Left            =   7740
            TabIndex        =   45
            Top             =   930
            Width           =   2385
         End
         Begin VB.Label lblBirthday 
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
            TabIndex        =   44
            Top             =   915
            Width           =   1305
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
            Left            =   11580
            TabIndex        =   43
            Top             =   540
            Width           =   795
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
            Left            =   11580
            TabIndex        =   42
            Top             =   210
            Width           =   795
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
            TabIndex        =   41
            Top             =   915
            Width           =   720
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
            TabIndex        =   40
            Top             =   540
            Width           =   180
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
            TabIndex        =   39
            Top             =   210
            Width           =   360
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
            TabIndex        =   38
            Top             =   300
            Width           =   810
         End
      End
      Begin VB.Frame Frame1 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   5010
         Left            =   45
         TabIndex        =   30
         Top             =   1785
         Width           =   14175
         Begin FPSpread.vaSpread sprList 
            Height          =   3840
            Left            =   1170
            TabIndex        =   6
            Top             =   750
            Width           =   11820
            _Version        =   196608
            _ExtentX        =   20849
            _ExtentY        =   6773
            _StockProps     =   64
            MaxCols         =   10
            MaxRows         =   0
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt110.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
         Begin VB.Label Label11 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "％"
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
            Left            =   5565
            TabIndex        =   58
            Top             =   405
            Width           =   180
         End
         Begin VB.Label Label9 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "利率"
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
            Left            =   4620
            TabIndex        =   57
            Top             =   405
            Width           =   360
         End
         Begin VB.Label lblRiritu 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
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
            Left            =   5445
            TabIndex        =   56
            Top             =   405
            Width           =   60
         End
         Begin VB.Label lblShouyo 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
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
            Left            =   11550
            TabIndex        =   36
            Top             =   375
            Width           =   60
         End
         Begin VB.Label Label10 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "賞与返済額"
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
            Left            =   9630
            TabIndex        =   35
            Top             =   375
            Width           =   900
         End
         Begin VB.Label lblKyuuyo 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
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
            Left            =   8850
            TabIndex        =   34
            Top             =   405
            Width           =   60
         End
         Begin VB.Label Label8 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "給与返済額"
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
            Left            =   6930
            TabIndex        =   33
            Top             =   405
            Width           =   900
         End
         Begin VB.Label lblYuushi 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
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
            Left            =   3060
            TabIndex        =   32
            Top             =   405
            Width           =   60
         End
         Begin VB.Label Label6 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "融資金額"
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
            Left            =   1320
            TabIndex        =   31
            Top             =   405
            Width           =   720
         End
      End
      Begin VB.Frame Frame2 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   45
         TabIndex        =   25
         Top             =   1170
         Width           =   14175
         Begin VB.TextBox txtYuusibiD 
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
            Left            =   3930
            MaxLength       =   2
            TabIndex        =   5
            Top             =   180
            Width           =   360
         End
         Begin VB.TextBox txtYuusibiM 
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
            Left            =   3225
            MaxLength       =   2
            TabIndex        =   4
            Top             =   180
            Width           =   345
         End
         Begin VB.TextBox txtYuusibiY 
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
            Left            =   2295
            MaxLength       =   4
            TabIndex        =   3
            Top             =   180
            Width           =   600
         End
         Begin VB.Label Label5 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "月"
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
            Left            =   3660
            TabIndex        =   29
            Top             =   285
            Width           =   180
         End
         Begin VB.Label Label4 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "年"
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
            Left            =   2970
            TabIndex        =   28
            Top             =   285
            Width           =   180
         End
         Begin VB.Label Label3 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "日"
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
            Left            =   4365
            TabIndex        =   27
            Top             =   285
            Width           =   180
         End
         Begin VB.Label Label2 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "融資日"
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
            Left            =   1620
            TabIndex        =   26
            Top             =   255
            Width           =   540
         End
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "ﾌﾟﾚﾋﾞｭｰ"
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
         Left            =   11685
         TabIndex        =   7
         Top             =   6870
         Width           =   1215
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
         Left            =   13005
         TabIndex        =   8
         Top             =   6870
         Width           =   1215
      End
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   15
         Top             =   6930
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   7785
      Width           =   14325
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
         TabIndex        =   9
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
         Index           =   3
         Left            =   2415
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
         Index           =   4
         Left            =   3600
         TabIndex        =   15
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
         Index           =   6
         Left            =   5970
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
         Index           =   7
         Left            =   7155
         TabIndex        =   17
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
         Index           =   9
         Left            =   9525
         TabIndex        =   19
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
         TabIndex        =   12
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
         TabIndex        =   20
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
         Left            =   13080
         TabIndex        =   13
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
      Height          =   330
      Left            =   0
      ScaleHeight     =   270
      ScaleWidth      =   14265
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   7440
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
         TabIndex        =   22
         Top             =   0
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   330
      Left            =   0
      TabIndex        =   59
      Top             =   8250
      Width           =   14325
      _ExtentX        =   25268
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14208
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
            Text            =   "富士通　太郎"
            TextSave        =   "富士通　太郎"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2999
            MinWidth        =   2999
            Text            =   "9999999999999999"
            TextSave        =   "9999999999999999"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "2009/04/16"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "16:20"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmQPAV_CEnt110"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20090329  0807073/0808052  0807073：クレジット支援システムの再構築
'                           0808052：TCC支援システムの再構築
'                             ・アプリケーション移行対応
'                               PKGの戻り値判定を修正
'----------------------------------------------------------------------------------------------

Option Explicit
 Dim blnInit_Flg As Boolean
 Private blnNoChangeEvFlg As Boolean
  
 
 Dim lngFirstCnt As Long '''''''''''
 Dim lngRecCount As Long '''''''''''''''SP用

'**********************************************************************************************************
'*    FORM LOAD ｲﾍﾞﾝﾄ
'**********************************************************************************************************
Private Sub Form_Load()
        
    blnInit_Flg = True   '初期フラグ
    
    Call subInitScreen   '初期画面編集処理
    
End Sub
'**********************************************************************************************************
'*    FORM UNLOAD ｲﾍﾞﾝﾄ
'**********************************************************************************************************
Private Sub Form_Unload(CANCEL As Integer)
        
    Call gsubTermOracleDB   'ｵﾗｸﾙｾｯｼｮﾝの切断
    
End Sub
'**********************************************************************************************************
'*    FORM ACTIVATE ｲﾍﾞﾝﾄ
'**********************************************************************************************************
Private Sub Form_Activate()
 Dim i As Long
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C

    If blnInit_Flg = True Then     '初期ﾌﾗｸﾞ = ｵﾝの場合
        'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ
        stbSystem.Panels.Item(1).Text = "処理中．．．"

        Screen.MousePointer = vbHourglass
        Me.Enabled = False

        DoEvents

        'ｾｯｼｮﾝの確立
        If Not gblnCreateOracleSession() Then
            'ｼｽﾃﾑｴﾗｰ
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "返済予定表印刷 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If

        'ﾃﾞｰﾀﾍﾞｰｽの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'ｼｽﾃﾑｴﾗｰ
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "返済予定表印刷 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'ﾄﾗﾝｻﾞｸｼｮﾝの開始
        objSession.BeginTrans
        
        '初期処理用SP（ｼｽﾃﾑ日付）
        Call gsubSPInit
        
        '一覧クリアー
        Call gsubSpdClear(sprList)
        
        '画面始動
        Me.Enabled = True
                
        'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ消去
        stbSystem.Panels.Item(1).Text = ""
                
        'ｽﾃｰﾀｽﾊﾞｰ設定
        Call subInitStatusBar(stbSystem)
    
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
        
        '初期ﾌﾗｸﾞ = ｵﾌ
        blnInit_Flg = False

    End If
    
    'マウスポインター
    Screen.MousePointer = vbDefault
    
End Sub
'**********************************************************************************************************
'*    FORM KEY PRESS ｲﾍﾞﾝﾄ
'**********************************************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ｴﾗｰﾒｯｾｰｼﾞ消去 & 反転項目解除
    Call subErrKaijo

    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then KeyAscii = 0
    
End Sub
'**********************************************************************************************************
'*    FORM KEY DOWN ｲﾍﾞﾝﾄ
'**********************************************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

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
            Call cmdPFK_Click(5)
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
'******************************************************************************
'*    名寄せ検索ボタン
'******************************************************************************
Private Sub cmdNayose_Click()
 Dim strSyainCd As String

''''    Me.Hide

    Me.Enabled = False
    
    Call subErrKaijo

    '名寄せ検索画面表示
    frmQPAV_CEnt111.Show 1

    Me.Enabled = True
    
''''    Me.Show
           
    If Trim$(txtSyainCd(0).Text) = "" And Trim$(txtSyainCd(1).Text) = "" Then
        txtSyainCd(0).SetFocus
    Else
        txtYuusibiY.SetFocus
    End If
    
End Sub


'**********************************************************************************************************
'*    初期画面編集処理
'**********************************************************************************************************
Private Sub subInitScreen()

    Me.Enabled = False

    'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    
    DoEvents

    'ｽﾌﾟﾚｯﾄﾞ保護
    sprList.Lock = True

    'ｽﾃｰﾀｽﾊﾞｰ設定
    Call gsubInitStatusBar(stbSystem)

    'ﾌｫｰﾑ名設定
    If Me.Caption = "返済予定表印刷" Then
        Me.Caption = Me.Caption & " (" & gstrCommandLine(8) & ")"
    End If
        
    'ｽﾃｰﾀｽﾊﾞｰﾒｯｾｰｼﾞ消去
    stbSystem.Panels.Item(1).Text = ""
    lblMsg.Caption = ""
    
'↓↓↓↓↓↓【Win2000対応】Add by Yokoyama@NBC 2004/04/22↓↓↓↓↓↓
    'プレビュー・印刷ボタン
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
'↑↑↑↑↑↑【Win2000対応】Del by Yokoyama@NBC 2004/04/22↑↑↑↑↑↑
    
    Me.Enabled = True
        
End Sub
'*****************************************************************************************
'各ファンクションキー機能
'*****************************************************************************************
Private Sub cmdPFK_Click(index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case index
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
            txtSyainCd(0).SetFocus
    
    End Select
    
End Sub

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
            If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "返済予定表印刷") = vbCancel Then
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
            If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "返済予定表印刷") = vbCancel Then
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


'***********************************************************************************************************
'*画面初期化
'***********************************************************************************************************
Private Sub subFormInitialize()
    
    '各表示項目クリア
    txtSyainCd(0).Text = ""
    txtSyainCd(1).Text = ""
    lblKana.Caption = ""
    lblShimei.Caption = ""
    lblShozoku(0).Caption = ""
    lblShozoku(1).Caption = ""
    lblTozai.Caption = ""
    lblBumon(0).Caption = ""
    lblBumon(1).Caption = "ﾞ"
    lblShikaku.Caption = ""
    lblKyu.Caption = ""
    lblBirthday.Caption = ""
    txtYuusibiY.Text = ""
    txtYuusibiM.Text = ""
    txtYuusibiD.Text = ""
    lblYuushi.Caption = ""
    lblKyuuyo.Caption = ""
    lblShouyo.Caption = ""
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)

    '各コントロール制御
    cmdNayose.Enabled = True
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    txtYuusibiY.Enabled = True
    txtYuusibiM.Enabled = True
    txtYuusibiD.Enabled = True
        
End Sub
'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyainCd(0).BackColor = vbWhite
    txtSyainCd(1).BackColor = vbWhite
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
End Sub
'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
 Dim strYuusibi As String

'店判定に使用　2002/05/13
 Dim strSyozoku As String

On Error GoTo subCmdJikkou

    'エラー解除
    subErrKaijo
            
    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
            
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
        
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
            
    '入力項目チェック
    If fncNyuuryokuChk = False Then
        GoTo subCmdJikkou
    End If
    
    '社員コード検索
    If fncblnSyainDat = False Then
        txtSyainCd(0).Enabled = True
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(1).Enabled = True
        txtSyainCd(1).BackColor = vbRed
        lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")   '該当するデータがありません
        GoTo subCmdJikkou
    End If
    
    '該当データ抽出
    If fncGetDat = False Then
        lblMsg.Caption = "WHOE02 " & gstrGetCodeMeisyo(odbDatabase, "E02", "WHO")   '該当するデータがありません
        GoTo subCmdJikkou
    End If
    
    '融資日が 2000/03/01 を境に処理を分ける
    strYuusibi = Format$(Mid$(gfncstrDlm2(gstrYusiYMD, 3), 1, 4) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 5, 2) & "/" & Mid$(gfncstrDlm2(gstrYusiYMD, 3), 7, 2), "YYYY/MM/DD") '融資日
    
    
    '2001/12/07
    '2002/02/27 "085"も追加
    If strYuusibi < "2000/03/01" Then
        
        '店判定　2002/05/13
''''店判定　2002/05/13　削除　下記に変更        If (Trim$(lblShozoku(0).Caption) >= "001" And Trim$(lblShozoku(0).Caption) <= "028") Or Trim$(lblShozoku(0).Caption) = "041" Or Trim$(lblShozoku(0).Caption) = "085" Or Trim$(lblShozoku(0).Caption) = "095" Then
        strSyozoku = frmQPAV_CEnt110.lblShozoku(0).Caption
        If strSyozoku = "001" Or strSyozoku = "002" Or strSyozoku = "003" Or strSyozoku = "004" Or strSyozoku = "005" _
        Or strSyozoku = "008" Or strSyozoku = "009" Or strSyozoku = "010" Or strSyozoku = "011" Or strSyozoku = "012" _
        Or strSyozoku = "014" Or strSyozoku = "015" Or strSyozoku = "016" Or strSyozoku = "017" Or strSyozoku = "018" _
        Or strSyozoku = "019" Or strSyozoku = "020" Or strSyozoku = "021" Or strSyozoku = "025" Or strSyozoku = "026" _
        Or strSyozoku = "027" Or strSyozoku = "028" Or strSyozoku = "036" Or strSyozoku = "041" Or strSyozoku = "045" _
        Or strSyozoku = "084" Or strSyozoku = "085" Or strSyozoku = "086" Or strSyozoku = "089" Or strSyozoku = "095" _
        Then
            gstrBonusMD1 = "0430"
            gstrBonusMD2 = "1031"
        End If
    End If
    
    
    If CDate(strYuusibi) < CDate("2000/03/01") Then
        'データ計算(旧処理)
        Call gSubMakeMeisaiKyuu
    Else
        'データ計算(新処理)
        Call gSubMakeMeisai
    End If
    
    'データセット
    Call subDataSet
    
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = True
    cmdPrint(1).Enabled = True
    cmdNayose.Enabled = False
    txtSyainCd(0).Enabled = False
    txtSyainCd(1).Enabled = False
    txtYuusibiY.Enabled = False
    txtYuusibiM.Enabled = False
    txtYuusibiD.Enabled = False
    cmdPrint(0).SetFocus
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""

    Exit Sub

subCmdJikkou:
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    cmdNayose.Enabled = True
    txtSyainCd(0).Enabled = True
    txtSyainCd(1).Enabled = True
    txtYuusibiY.Enabled = True
    txtYuusibiM.Enabled = True
    txtYuusibiD.Enabled = True
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
End Sub
'*************************************************************************************************
'*入力チェック
'*************************************************************************************************
Private Function fncNyuuryokuChk() As Boolean
    
    fncNyuuryokuChk = False
        
    '社員番号入力チェック
    If Len(Trim$(txtSyainCd(1).Text)) = 0 Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    ElseIf Len(Trim$(txtSyainCd(1).Text)) = 7 Then
        gstrSyainCd1 = Trim$(txtSyainCd(0).Text)
        gstrSyainCd2 = Trim$(txtSyainCd(1).Text)
    Else
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtSyainCd(0).BackColor = vbRed
        txtSyainCd(0).SetFocus
        txtSyainCd(1).BackColor = vbRed
        txtSyainCd(1).SetFocus
        Exit Function
    End If

    '融資日チェック
    If txtYuusibiY.Text = "" And txtYuusibiM.Text = "" And txtYuusibiD.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        Exit Function
    ElseIf txtYuusibiY.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtYuusibiY.SetFocus
        txtYuusibiY.BackColor = vbRed
        Exit Function
    ElseIf txtYuusibiM.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtYuusibiM.SetFocus
        txtYuusibiM.BackColor = vbRed
        Exit Function
    ElseIf txtYuusibiD.Text = "" Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtYuusibiD.SetFocus
        txtYuusibiD.BackColor = vbRed
        Exit Function
    ElseIf IsDate(Format(Trim$(txtYuusibiY.Text) & "/" & Trim$(txtYuusibiM.Text) & "/" & Trim$(txtYuusibiD.Text), "YYYY/MM/DD")) = False Then
        lblMsg.Caption = "WHOE01 " & gstrGetCodeMeisyo(odbDatabase, "E01", "WHO")   '入力項目に誤りがあります。
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        Exit Function
    End If
    
    gstrYuusibi = txtYuusibiY & txtYuusibiM & txtYuusibiD
    
    fncNyuuryokuChk = True

End Function

'*************************************************************************************************
'*  データ計算 >>> データセット
'*************************************************************************************************
Private Sub subDataSet()
 Dim i          As Long

    sprList.ReDraw = False
    Call gsubSpdClear(sprList)

    lblKyuuyo.Caption = Format$(gfncstrDlm2(gstrYusiYMD, 8), "#,##0")                      '給与返済総額
    lblShouyo.Caption = Format$(gfncstrDlm2(gstrYusiYMD, 10), "#,##0")                     '賞与返済総額
    lblYuushi.Caption = Format$(CLng(lblKyuuyo.Caption) + CLng(lblShouyo.Caption), "#,##0") '融資金額
    lblRiritu.Caption = Format$((CDbl(gfncstrDlm2(gstrYusiYMD, 6))), "##.#0")        '利率
    
    'データセット
    With sprList
        .ReDraw = False
        .MaxRows = UBound(gstrYoteihyouAry)
        For i = 1 To UBound(gstrYoteihyouAry)
            .SetText 1, i, gstrYoteihyouAry(i).strKbn                        '区分
            .SetText 2, i, gstrYoteihyouAry(i).strKijitu                     '返済期日''''融資日 ＋ 返済月数
            .SetText 3, i, Format$(gstrYoteihyouAry(i).strHensai, "#,##0")   '返済金額''''給与返済 or 賞与返済額
            .SetText 4, i, Format$(gstrYoteihyouAry(i).strZandaka, "#,##0")  '残高''''給与返済分残高 ＋ 賞与返済分残高
            .SetText 5, i, Format$(gstrYoteihyouAry(i).strKyuGan, "#,##0")   '給与返済分元本
            .SetText 6, i, Format$(gstrYoteihyouAry(i).strKyuRsk, "#,##0")   '給与返済分利息
            .SetText 7, i, Format$(gstrYoteihyouAry(i).strKyuZan, "#,##0")   '給与返済分残高
            .SetText 8, i, Format$(gstrYoteihyouAry(i).strSyoGan, "#,##0")   '賞与返済分元本
            .SetText 9, i, Format$(gstrYoteihyouAry(i).strSyoRsk, "#,##0")   '賞与返済分利息
            .SetText 10, i, Format$(gstrYoteihyouAry(i).strSyoZan, "#,##0")  '賞与返済分残高
        Next i

        .ReDraw = True
    End With
    
End Sub
'*******************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("返済予定表印刷", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt110.Name, _
              strErrCode, _
              strErrMsg)

End Sub

'***********************************************************************************************************
'*    社員データ取得 ＳＰ 発行
'*        返却値：Boolean       True=OK     False=NG
'***********************************************************************************************************
Private Function fncblnSyainDat() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '配列の件数  及び、１回で取得するＭＡＸの件数

On Error GoTo errfncblnSyainDat

    fncblnSyainDat = False

    lngSpCnt = 0
    
    '会員情報一覧 ＳＰ
    '社員番号１
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '社員番号２
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '社員データ
    odbDatabase.Parameters.Add "OtStrDatAry", " ", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110SyainDat("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:OtStrDatAry); END;"


    sprList.ReDraw = False
    
    'マスタ情報一覧の取得
    odbDatabase.DbexecuteSQL (strSQL)

    'MOD 20090416 0807073/0803012 NBC.ishida start
    'If Trim$(odbDatabase.Parameters("OtStrDatAry")) = "" Then          '該当データなし
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) = True Then
    'MOD 20090416 0807073/0803012 NBC.ishida end
        Call gsubParaRemove(odbDatabase)                         'オブジェクトの開放
        sprList.ReDraw = True
        Exit Function
    End If

    '項目セット
    Call subSyainDsp

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnSyainDat = True

    Exit Function

errfncblnSyainDat:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'****************************************************************************************************
'*    社員データをセット
'****************************************************************************************************
Private Sub subSyainDsp()
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String

    strDetail = odbDatabase.Parameters("OtStrDatAry")
    
    '社員氏名カナ
    strWk = gfncstrDlm2(strDetail, 1)
    strWk = Trim$(strWk)
    lblKana.Caption = strWk
    
    '社員氏名漢字
    strWk = gfncstrDlm2(strDetail, 2)
    strWk = Trim$(strWk)
    lblShimei.Caption = strWk
    
    '所属店コード
    strWk = gfncstrDlm2(strDetail, 3)
    strWk = Trim$(strWk)
    lblShozoku(0).Caption = strWk
    
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
    lblBumon(0).Caption = strWk
    
    '資格コード
    strWk = gfncstrDlm2(strDetail, 6)
    strWk = Trim$(strWk)
    lblShikaku.Caption = strWk
    
    '等級コード
    strWk = gfncstrDlm2(strDetail, 7)
    strWk = Trim$(strWk)
    lblKyu.Caption = strWk
    
    '生年月日
    strWk = gfncstrDlm2(strDetail, 8)
    strWk = Trim$(strWk)
    If Trim(strWk) = "" Then
    Else
        strWk = Mid$(strWk, 1, 4) & "/" & Mid$(strWk, 5, 2) & "/" & Mid$(strWk, 7, 2)
        lblBirthday.Caption = strWk
    End If
    
    '所属店コード
    strWk = gfncstrDlm2(strDetail, 12)
    strWk = Trim$(strWk)
    lblShozoku(1).Caption = strWk
    
    'ボーナス支払日１
    gstrBonusMD1 = gfncstrDlm2(strDetail, 13)
    
    'ボーナス支払日２
    gstrBonusMD2 = gfncstrDlm2(strDetail, 14)
    
    '所属部門コード
    strWk = gfncstrDlm2(strDetail, 15)
    strWk = Trim$(strWk)
    lblBumon(1).Caption = strWk

End Sub
'****************************************************************************************************
'*    融資データ取得
'****************************************************************************************************
Private Function fncGetDat()
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '配列の件数  及び、１回で取得するＭＡＸの件数

On Error GoTo errfncblnGetDat

    fncGetDat = False

    lngSpCnt = 0

    '会員情報一覧 ＳＰ
    '社員番号１
    odbDatabase.Parameters.Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd1").ServerType = ORATYPE_CHAR
    '社員番号２
    odbDatabase.Parameters.Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainCd2").ServerType = ORATYPE_CHAR
    '融資日
    odbDatabase.Parameters.Add "InStrYuusibi", gstrYuusibi, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYuusibi").ServerType = ORATYPE_CHAR
    '返済データ
    odbDatabase.Parameters.Add "OtStrDatAry", " ", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrDatAry").ServerType = ORATYPE_VARCHAR2

             strSQL = "BEGIN QPAP_CEnt110PkG.QPAP_CEnt110SelList("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYuusibi"
    strSQL = strSQL & ",:OtStrDatAry); END;"
    
    odbDatabase.DbexecuteSQL (strSQL)

'DEL 20090329 0807073/0808052 NBC LIU START
'    If odbDatabase.Parameters("OtStrDatAry") = "" Then          '該当データなし
'DEL 20090329 0807073/0808052 NBC LIU END
'ADD 20090329 0807073/0808052 NBC LIU START
    If IsNull(odbDatabase.Parameters("OtStrDatAry")) Then        '該当データなし
'ADD 20090329 0807073/0808052 NBC LIU END
        Call gsubParaRemove(odbDatabase)                        'オブジェクトの開放
        sprList.ReDraw = True
        Exit Function
    End If

    '項目セット
    gstrYusiYMD = odbDatabase.Parameters("OtStrDatAry")

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncGetDat = True

    Exit Function

errfncblnGetDat:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'クリスタルレポート
Private Sub subPrintReport(intDestinationConstants As DestinationConstants)
 Dim strSelectionFormula As String
 Dim strConectPoint      As String
 Dim intRet              As Integer
    
On Error GoTo errPrintReport

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
        .ReportFileName = App.Path & "\QPAV_CEnt110.rpt"
        .DiscardSavedData = True
            
        '抽出条件を記述する（コンピュータ名）
        .SelectionFormula = "{QPAL_HENYOW.QPAL_COMPUTERMEI} = '" & gstrCommandLine(5) & "'"
            
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
    
errPrintReport:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub





'******************************************
'*フル桁脱出
'******************************************

Private Sub txtSyainCd_Change(index As Integer)
    If blnNoChangeEvFlg = True Then Exit Sub
    If index = 0 Then
        Call gsubMaxCharSkipEX(txtSyainCd(index), 1)
    End If
End Sub
Private Sub txtYuusibiY_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiY, 4)
End Sub
Private Sub txtYuusibiM_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiM, 2)
End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtSyainCD_GotFocus(index As Integer)
    Call gsubSelectText(txtSyainCd(index))
End Sub

Private Sub txtYuusibiY_GotFocus()
    Call gsubSelectText(txtYuusibiY)
End Sub

Private Sub txtYuusibiM_GotFocus()
    Call gsubSelectText(txtYuusibiM)
End Sub

Private Sub txtYuusibiD_GotFocus()
    Call gsubSelectText(txtYuusibiD)
End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtSyainCD_KeyPress(index As Integer, KeyAscii As Integer)
    If index = 0 Then
        Exit Sub ''''社員コード１は文字も入力可能
    End If
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txtYuusibiD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'**********************************************************************************************************
'*    年  LostFocus Event  フォーマット
'**********************************************************************************************************
Private Sub txtYuusibiY_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiY.Text) <> 4 Then txtYuusibiY.Text = Format$(txtYuusibiY.Text, "0000")
    blnNoChangeEvFlg = False
End Sub

'**********************************************************************************************************
'*    月  LostFocus Event  フォーマット
'**********************************************************************************************************
Private Sub txtYuusibim_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiM.Text) <> 2 Then txtYuusibiM.Text = Format$(txtYuusibiM.Text, "00")
    blnNoChangeEvFlg = False
End Sub
'**********************************************************************************************************
'*    日  LostFocus Event  フォーマット
'**********************************************************************************************************
Private Sub txtYuusibid_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiD.Text) <> 2 Then txtYuusibiD.Text = Format$(txtYuusibiD.Text, "00")
    blnNoChangeEvFlg = False
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

