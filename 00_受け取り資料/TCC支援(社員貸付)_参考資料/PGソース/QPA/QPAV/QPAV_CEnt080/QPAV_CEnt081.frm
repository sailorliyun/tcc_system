VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmQPAV_CEnt081 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "社員融資台帳"
   ClientHeight    =   4890
   ClientLeft      =   675
   ClientTop       =   4335
   ClientWidth     =   7500
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
   ScaleHeight     =   4890
   ScaleWidth      =   7500
   StartUpPosition =   2  '画面の中央
   Begin VB.PictureBox Picture1 
      Height          =   3810
      Index           =   1
      Left            =   0
      ScaleHeight     =   3750
      ScaleWidth      =   7440
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   0
      Width           =   7500
      Begin VB.PictureBox Picture6 
         Height          =   2925
         Left            =   165
         ScaleHeight     =   2865
         ScaleWidth      =   7035
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   630
         Width           =   7095
         Begin VB.TextBox txtHensaiTukisu 
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
            Left            =   1710
            MaxLength       =   2
            TabIndex        =   4
            Top             =   1125
            Width           =   375
         End
         Begin VB.TextBox txtYuusiBonus 
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
            Left            =   4890
            MaxLength       =   9
            TabIndex        =   6
            Top             =   1965
            Width           =   1575
         End
         Begin VB.TextBox txtYuusiKyuuyo 
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
            Left            =   3300
            MaxLength       =   9
            TabIndex        =   5
            Top             =   1965
            Width           =   1575
         End
         Begin VB.ComboBox cboYusiKbn 
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            ItemData        =   "QPAV_CEnt081.frx":0000
            Left            =   1710
            List            =   "QPAV_CEnt081.frx":0002
            Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
            TabIndex        =   3
            Top             =   660
            Width           =   2430
         End
         Begin VB.TextBox txtYuusibiD 
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
            Left            =   3240
            TabIndex        =   2
            Top             =   210
            Width           =   330
         End
         Begin VB.TextBox txtYuusibiM 
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
            Left            =   2595
            TabIndex        =   1
            Top             =   210
            Width           =   330
         End
         Begin VB.TextBox txtYuusibiY 
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
            Left            =   1710
            TabIndex        =   0
            Top             =   210
            Width           =   570
         End
         Begin VB.Label lblYuusiBonus 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   360
            Left            =   4890
            TabIndex        =   42
            Top             =   1965
            Width           =   1575
         End
         Begin VB.Label lblYuusiKyuuyo 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   360
            Left            =   3300
            TabIndex        =   41
            Top             =   1965
            Width           =   1575
         End
         Begin VB.Label lblHensaiTsuki 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   1710
            TabIndex        =   40
            Top             =   1125
            Width           =   375
         End
         Begin VB.Label lblYusiKbn 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   345
            Left            =   1710
            TabIndex        =   39
            Top             =   660
            Width           =   1830
         End
         Begin VB.Label lblYuusibiD 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   3240
            TabIndex        =   38
            Top             =   210
            Width           =   330
         End
         Begin VB.Label lblYuusibiM 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   2595
            TabIndex        =   37
            Top             =   210
            Width           =   330
         End
         Begin VB.Label lblYuusibiY 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00FF0000&
            Height          =   330
            Left            =   1710
            TabIndex        =   36
            Top             =   210
            Width           =   570
         End
         Begin VB.Label Label11 
            Alignment       =   2  '中央揃え
            BackColor       =   &H00800000&
            BorderStyle     =   1  '実線
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
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   720
            TabIndex        =   34
            Top             =   2340
            Width           =   975
         End
         Begin VB.Label Label8 
            Alignment       =   2  '中央揃え
            BackColor       =   &H00800000&
            BorderStyle     =   1  '実線
            Caption         =   "融資額"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   720
            TabIndex        =   33
            Top             =   1965
            Width           =   975
         End
         Begin VB.Label Label7 
            Alignment       =   2  '中央揃え
            BackColor       =   &H00800000&
            BorderStyle     =   1  '実線
            Caption         =   "給与返済分"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   3300
            TabIndex        =   32
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label Label6 
            Alignment       =   2  '中央揃え
            BackColor       =   &H00800000&
            BorderStyle     =   1  '実線
            Caption         =   "合計"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   1710
            TabIndex        =   31
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label Label1 
            Alignment       =   2  '中央揃え
            BackColor       =   &H00800000&
            BorderStyle     =   1  '実線
            Caption         =   "賞与返済分"
            BeginProperty Font 
               Name            =   "ＭＳ ゴシック"
               Size            =   11.25
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFF00&
            Height          =   360
            Left            =   4890
            TabIndex        =   30
            Top             =   1590
            Width           =   1575
         End
         Begin VB.Label lblPer 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00C00000&
            Height          =   225
            Left            =   4830
            TabIndex        =   26
            Top             =   720
            Width           =   90
         End
         Begin VB.Label lblZanBonus 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00C00000&
            Height          =   360
            Left            =   4890
            TabIndex        =   25
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblZanKei 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00C00000&
            Height          =   360
            Left            =   1710
            TabIndex        =   24
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblZanKyuuyo 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00C00000&
            Height          =   360
            Left            =   3300
            TabIndex        =   23
            Top             =   2340
            Width           =   1575
         End
         Begin VB.Label lblYuusiKei 
            Alignment       =   1  '右揃え
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
            ForeColor       =   &H00C00000&
            Height          =   360
            Left            =   1710
            TabIndex        =   22
            Top             =   1965
            Width           =   1575
         End
         Begin VB.Label Label23 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "％"
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
            Left            =   5025
            TabIndex        =   21
            Top             =   720
            Width           =   240
         End
         Begin VB.Label Label22 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "融資区分"
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
            Left            =   720
            TabIndex        =   20
            Top             =   720
            Width           =   900
         End
         Begin VB.Label Label21 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "ヶ月"
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
            Left            =   2130
            TabIndex        =   19
            Top             =   1185
            Width           =   450
         End
         Begin VB.Label Label10 
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
            Left            =   3600
            TabIndex        =   18
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label9 
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
            Left            =   2970
            TabIndex        =   17
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label3 
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
            Left            =   2325
            TabIndex        =   16
            Top             =   255
            Width           =   225
         End
         Begin VB.Label Label2 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "融資日"
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
            Left            =   720
            TabIndex        =   15
            Top             =   255
            Width           =   675
         End
         Begin VB.Label Label4 
            Alignment       =   1  '右揃え
            AutoSize        =   -1  'True
            BackColor       =   &H00C00000&
            BackStyle       =   0  '透明
            Caption         =   "返済月数"
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
            Left            =   720
            TabIndex        =   14
            Top             =   1185
            Width           =   900
         End
      End
      Begin VB.Label lblSyainCd 
         BackStyle       =   0  '透明
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   1
         Left            =   1530
         TabIndex        =   35
         Top             =   375
         Width           =   750
      End
      Begin VB.Label Label5 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "社員コード"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   195
         TabIndex        =   29
         Top             =   345
         Width           =   975
      End
      Begin VB.Label lblSyainCd 
         BackStyle       =   0  '透明
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   165
         Index           =   0
         Left            =   1305
         TabIndex        =   28
         Top             =   375
         Width           =   210
      End
      Begin VB.Label lblShimei 
         BackStyle       =   0  '透明
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   2445
         TabIndex        =   27
         Top             =   375
         Width           =   1440
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
      ScaleWidth      =   7440
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   3825
      Width           =   7500
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
         Height          =   255
         Left            =   45
         TabIndex        =   11
         Top             =   45
         Width           =   6990
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "戻 る"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   4770
      TabIndex        =   9
      Top             =   4320
      Width           =   1320
   End
   Begin VB.CommandButton cmdTorikesi 
      Caption         =   "取 消"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   3150
      TabIndex        =   8
      Top             =   4320
      Width           =   1320
   End
   Begin VB.CommandButton cmdSyori 
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   1545
      TabIndex        =   7
      Top             =   4305
      Width           =   1320
   End
   Begin Crystal.CrystalReport CrystalReport 
      Left            =   90
      Top             =   4365
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      PrintFileLinesPerPage=   60
   End
End
Attribute VB_Name = "frmQPAV_CEnt081"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'----------------------------------------------------------------------------------------------
'更新日付  案件番号  修正担当       修正理由
'20090828  0811051  murayama@NBC  グループ社員証書貸付帳票見直し
'                                 融資日入力チェックを追加
'                                 （過去日の入力不可、未来日の入力は翌月末日まで可とする）
'----------------------------------------------------------------------------------------------


Private blnNoChangeEvFlg As Boolean 'ﾁｪﾝｼﾞｲﾍﾞﾝﾄ無効ﾌﾗｸﾞ

Private Type typRiritu
    strQPAH_NAMEN           As String       'ローン名称
    strQPAH_NAMEX           As String       '融資種別
    strQPAH_RIRITU          As String       '利率
End Type

Private gstrtypRiritu() As typRiritu
    
'************************************************************************
'*    実行ボタン押下時処理
'************************************************************************
Private Sub cmdSyori_Click()
 Dim strMsg As String     'メッセージ
 Dim strYusiKbn As String '融資区分
 
 '☆2002/12/12☆ 入力チェックを復活する
    '■入力チェック(登録、修正の場合)■
    If Not gstrSyori = "削 除" Then
        If fncblnNyuuryokuChk = False Then Exit Sub
    End If
 '☆2002/12/12☆ 入力チェックを復活する

    '■確認メッセージの内容を設定■
    Select Case gstrSyori
        Case "登 録"
            strMsg = "融資額       ： " & lblYuusiKei & "円" & Chr$(10) & Chr$(13) _
                    & "給与返済額 ： " & Format(txtYuusiKyuuyo, "#,##0") & "円" & Chr$(10) & Chr$(13) _
                    & "賞与返済額 ： " & Format(txtYuusiBonus, "#,##0") & "円" & Chr$(10) & Chr$(13) _
                    & "融資情報を登録します。よろしいですか？"
        Case "修 正"
            strMsg = "修正してよろしいですか？"
        Case "削 除"
            strMsg = "削除してよろしいですか？"
    End Select

    If MsgBox(strMsg, vbQuestion + vbOKCancel, "社員融資台帳") = vbCancel Then
        Exit Sub
    End If

    Screen.MousePointer = vbHourglass

    '■各値をSP用変数に格納■
    Select Case gstrSyori
    Case "登 録"
        gstrYusiYMD = txtYuusibiY.Text & txtYuusibiM.Text & txtYuusibiD.Text          '融資日
        gstrGendogaku = glngSyosyoGendogaku                                           '限度額
        gstrRiritu = lblPer.Caption                                                   '利率
        gstrHensaiTukisu = txtHensaiTukisu.Text                                       '返済月数
        gstrKyuyoHensaiAll = CLng(txtYuusiKyuuyo.Text)                                '給与返済総額
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '給与返済額
        gstrSyoyoHensaiAll = CLng(txtYuusiBonus.Text)                                 '賞与返済総額
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '賞与返済額
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '給与残高
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '賞与残高
        gstrKojoChusiFlg = ""                                                         '控除中止フラグ
        gstrKansaiYMD = ""                                                            '完済日
        
            '種別(融資区分)
'☆2002/12/16 修正
            gstrSyubetu = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_NAMEX             '融資区分をsp引数変数へ
'            Select Case cboYusiKbn.Text
'            Case "一般ローン"
'                strYusiKbn = "1"
'            Case "一般ローン２"
'                strYusiKbn = "2"
'            Case "一般ローン３"
'                strYusiKbn = "5"
'            Case "特別ローン"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'☆2002/12/16 修正

        '2001/11/20
        '2002/02/27 "085"も追加
        If gstrYusiYMD < "20000301" Then
            If (Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) >= "001" And Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) <= "028") Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "041" Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "085" Or Trim$(frmQPAV_CEnt080.lblMiseCd.Caption) = "095" Then
                gstrBonusMD1 = "0430"
                gstrBonusMD2 = "1031"
            End If
        End If
            
            
    Case "修 正"
        gstrYusiYMD = lblYuusibiY.Caption & lblYuusibiM.Caption & lblYuusibiD.Caption '融資日
        gstrGendogaku = glngSyosyoGendogaku                                           '限度額
        gstrRiritu = lblPer.Caption                                                   '利率
        gstrHensaiTukisu = txtHensaiTukisu.Text                                       '返済月数
        gstrKyuyoHensaiAll = CLng(txtYuusiKyuuyo.Text)                                '給与返済総額
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '給与返済額
        gstrSyoyoHensaiAll = CLng(txtYuusiBonus.Text)                                 '賞与返済総額
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '賞与返済額
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '給与残高
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '賞与残高
        gstrKojoChusiFlg = ""                                                         '控除中止フラグ
        gstrKansaiYMD = ""                                                            '完済日

            '種別(融資区分)
'☆2002/12/16 修正
            gstrSyubetu = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_NAMEX             '融資区分をsp引数変数へ
'            Select Case cboYusiKbn.Text
'            Case "一般ローン"
'                strYusiKbn = "1"
'            Case "一般ローン２"
'                strYusiKbn = "2"
'            Case "一般ローン３"
'                strYusiKbn = "5"
'            Case "特別ローン"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'☆2002/12/16 修正
            
    Case "削 除"
        gstrYusiYMD = lblYuusibiY.Caption & lblYuusibiM.Caption & lblYuusibiD.Caption '融資日
        gstrGendogaku = "0000"                                                        '限度額
        gstrRiritu = lblPer.Caption                                                   '利率
        gstrHensaiTukisu = lblHensaiTsuki.Caption                                     '返済月数
        gstrKyuyoHensaiAll = CLng(lblYuusiKyuuyo.Caption)                             '給与返済総額
        gstrKyuyoHensai = CLng(lblZanKyuuyo.Caption)                                  '給与返済額
        gstrSyoyoHensaiAll = CLng(lblYuusiBonus.Caption)                              '賞与返済総額
        gstrSyoyoHensai = CLng(lblZanBonus.Caption)                                   '賞与返済額
        gstrKyuyoZandaka = CLng(lblZanKyuuyo.Caption)                                 '給与残高
        gstrSyoyoZandaka = CLng(lblZanBonus.Caption)                                  '賞与残高
        gstrKojoChusiFlg = ""                                                         '控除中止フラグ
        gstrKansaiYMD = ""                                                            '完済日
        
'☆2002/12/16 修正
'            '種別(融資区分)
'            Select Case cboYusiKbn.Text
'            Case "一般ローン"
'                strYusiKbn = "1"
'            Case "一般ローン２"
'                strYusiKbn = "2"
'            Case "一般ローン３"
'                strYusiKbn = "5"
'            Case "特別ローン"
'                strYusiKbn = "4"
'            End Select
'            gstrSyubetu = strYusiKbn
'☆2002/12/16 修正
    End Select
    
    '■月々返済額を計算 (削除以外)
    If Not gstrSyori = "削 除" Then
        Call gsubKeisan
    End If
    
    '■各SP実行
    Select Case gstrSyori
    Case "登 録"
        If fncblnTouroku = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    Case "修 正"
        If fncblnSyusei = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    Case "削 除"
        If fncblnDelete = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    End Select
    
    '■「削除」以外は印刷可能■
   
    If Not gstrSyori = "削 除" Then
    
        '印刷用テーブルからデータを削除
        If gfncblnDelPrintDat = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
        
        '◆明細作成◆
        If gstrYusiYMD <= "20000301" Then
            Call gSubMakeMeisaiKyuu '旧処理
        Else
            Call gSubMakeMeisai     '現在処理
        End If
        
        '◆帳票用ﾃｰﾌﾞﾙ登録SP呼出◆
        If gfncblnMakPrintDat = False Then
            Screen.MousePointer = vbNormal
            Exit Sub
        End If
    
        If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "返済予定表印刷") = vbCancel Then
            '印刷用ﾃｰﾌﾞﾙからﾃﾞｰﾀを削除
            If gfncblnDelPrintDat = False Then
                Screen.MousePointer = vbNormal
            End If
            Screen.MousePointer = vbNormal
        Else
            'ｸﾘｽﾀﾙﾚﾎﾟｰﾄ呼出
            Call subPrintReport(crptToPrinter)
                            
            '印刷用ﾃｰﾌﾞﾙからﾃﾞｰﾀを削除
            If gfncblnDelPrintDat = False Then
                Screen.MousePointer = vbNormal
                Exit Sub
            End If
        End If
    End If
    
    Screen.MousePointer = vbNormal
    
    '子画面実行判定ﾌﾗｸﾞ
    gblnExecute = True

    Unload Me
    
End Sub
'******************************************************************************
'*    戻るボタン押下時処理
'******************************************************************************
Private Sub cmdBack_Click()
    Unload Me
End Sub
'******************************************************************************
'*    取消ボタン押下時処理
'******************************************************************************
Private Sub cmdTorikesi_Click()

    '■画面初期表示■
    Call subFormInit
    
    'SetFocus
    Select Case gstrSyori
    
    Case "登 録"
        txtYuusibiY.SetFocus
    Case "修 正"
        cboYusiKbn.SetFocus
    Case "削 除"
        cmdSyori.SetFocus
        
    End Select
    
End Sub
'******************************************************************************
'*    FORM_ACTIVATE イベント
'******************************************************************************
Private Sub Form_Activate()
End Sub
'******************************************************************************
'*    FORM_LOAD イベント
'******************************************************************************
Private Sub Form_Load()

'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "社員融資台帳 (" & gstrCommandLine(8) & ")"
    lblShimei.Caption = gstrSyainName
    Me.lblSyainCd(0).Caption = gstrSyainCd1
    Me.lblSyainCd(1).Caption = gstrSyainCd2
    cmdSyori.Caption = gstrSyori
    
    '初期表示処理
    Call subInitScreen
    
    '画面初期化
    Call subFormInit
    
    '子画面実行判定フラグ初期化
    gblnExecute = False

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

End Sub
'******************************************************************************
'*    FORM_KEYPRESS イベント
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    'ｴﾗｰ解除
    Call subErrKaijo
End Sub
'******************************************************************************
'*    画面初期化
'******************************************************************************
Private Sub subFormInit()
 Dim i As Integer
 Dim strYusiYMD  As String '融資日
 Dim lngI        As Long
 
    'ｴﾗｰ解除
    Call subErrKaijo
    
    'ｺﾝﾎﾞﾎﾞｯｸｽ内容ｾｯﾄ
    Call subComboItemGet
    
    Me.cboYusiKbn.Clear
    For lngI = LBound(gstrtypRiritu) To UBound(gstrtypRiritu)
        Me.cboYusiKbn.AddItem gstrtypRiritu(lngI).strQPAH_NAMEN
    Next lngI

'    With cboYusiKbn
'        .Clear
'        .AddItem ("一般ローン")
'        .AddItem ("一般ローン２")
'        .AddItem ("一般ローン３")
'        .AddItem ("特別ローン")
'    End With
    
    Select Case gstrSyori
    
        Case "登 録"
            txtYuusibiY.Text = ""
            txtYuusibiM.Text = ""
            txtYuusibiD.Text = ""
            lblPer.Caption = ""
            lblYuusiKei.Caption = ""
            lblZanKei.Caption = ""
            txtYuusiKyuuyo.Text = ""
            txtYuusiBonus.Text = ""
            lblZanKyuuyo.Caption = ""
            lblZanBonus.Caption = ""
            cboYusiKbn.ListIndex = 0 - 1
            txtHensaiTukisu.Text = ""
            
        Case "修 正"

            '融資日
            strYusiYMD = gVarSpdGetText(frmQPAV_CEnt080.sprList, 1, glngSprRow)
            lblYuusibiY.Caption = Mid(strYusiYMD, 1, 4)
            lblYuusibiM.Caption = Mid(strYusiYMD, 6, 2)
            lblYuusibiD.Caption = Mid(strYusiYMD, 9, 2)
'☆2002/12/16 修正
            If Trim(gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)) = "" Then
                Me.cboYusiKbn.ListIndex = -1
            Else
                Me.cboYusiKbn.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)
            End If
''            '融資区分
''            If gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "" Then
''                cboYusiKbn.ListIndex = -1
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "一般ローン" Then
''                cboYusiKbn.ListIndex = 0
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "一般ローン２" Then
''                cboYusiKbn.ListIndex = 1
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "一般ローン３" Then
''                cboYusiKbn.ListIndex = 2
''            ElseIf gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow) = "特別ローン" Then
''                cboYusiKbn.ListIndex = 3
''            Else
''                cboYusiKbn.Text = ""
''            End If
'☆2002/12/16 修正
                        
            'その他各値
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow))
            txtHensaiTukisu.Text = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), 1, i - 2)
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow))
            frmQPAV_CEnt081.lblPer.Caption = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 1)
            i = InStr(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), "ヶ")
            lblYuusiKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 5, glngSprRow)  '融資額合計
            lblZanKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 8, glngSprRow)    '残高合計
            txtYuusiKyuuyo.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 6, glngSprRow)  '給与融資額
            txtYuusiBonus.Text = gVarSpdGetText(frmQPAV_CEnt080.sprList, 7, glngSprRow)   '賞与融資額
            lblZanKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 9, glngSprRow) '給与残高
            lblZanBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 10, glngSprRow) '賞与残高
            
        Case "削 除"
        
            '融資日
            strYusiYMD = gVarSpdGetText(frmQPAV_CEnt080.sprList, 1, glngSprRow)
            lblYuusibiY.Caption = Mid(strYusiYMD, 1, 4)
            lblYuusibiM.Caption = Mid(strYusiYMD, 6, 2)
            lblYuusibiD.Caption = Mid(strYusiYMD, 9, 2)
            
            '融資区分
            lblYusiKbn.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 2, glngSprRow)
            
            'その他各値
'            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow))
'            txtHensaiTukisu.Text = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 2)
            i = Len(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow))
            frmQPAV_CEnt081.lblPer.Caption = Mid(gVarSpdGetText(frmQPAV_CEnt080.sprList, 3, glngSprRow), 1, i - 1)
            i = InStr(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), "ヶ")
            lblHensaiTsuki.Caption = Left(gVarSpdGetText(frmQPAV_CEnt080.sprList, 4, glngSprRow), i - 1)
            lblYuusiKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 5, glngSprRow)
            lblZanKei.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 8, glngSprRow)
            lblYuusiKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 6, glngSprRow)
            lblYuusiBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 7, glngSprRow)
            lblZanKyuuyo.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 9, glngSprRow)
            lblZanBonus.Caption = gVarSpdGetText(frmQPAV_CEnt080.sprList, 10, glngSprRow)
            cmdTorikesi.Enabled = False
    End Select
    
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
'*    エラー解除処理
'******************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    txtYuusibiY.BackColor = vbWhite
    txtYuusibiM.BackColor = vbWhite
    txtYuusibiD.BackColor = vbWhite
    txtHensaiTukisu.BackColor = vbWhite
    txtYuusiKyuuyo.BackColor = vbWhite
    txtYuusiBonus.BackColor = vbWhite
    cboYusiKbn.BackColor = vbWhite
End Sub
'******************************************************************************
'*    融資区分 変更時処理
'******************************************************************************
Private Sub cboYusiKbn_Click()
    
    'コンボボックスのリストインデックスが構造体の配列要素より小さい、若しくは最大より大きい時は処理しない
    If Not (cboYusiKbn.ListIndex >= LBound(gstrtypRiritu)) Then Exit Sub
    If Not (cboYusiKbn.ListIndex <= UBound(gstrtypRiritu)) Then Exit Sub
    
    Me.lblPer.Caption = gstrtypRiritu(cboYusiKbn.ListIndex).strQPAH_RIRITU

'    Select Case cboYusiKbn.ListIndex
'        Case 0
'            lblPer.Caption = "8.00"
'        Case 1
'            lblPer.Caption = "7.50"
'        Case 2
'            lblPer.Caption = "7.00"
'        Case 3
'            lblPer.Caption = "6.50"
'    End Select
End Sub
'******************************************************************************
'*    印刷処理
'******************************************************************************
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
            .WindowTitle = cpubMyPrjName & " (" & gstrCommandLine(8) & ")"
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
        .ReportFileName = App.Path & "\QPAV_CEnt080.rpt"
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
            Call QSAV_SysErr.subSysErr(cpubMyPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
    
    End With
    
    Exit Sub
    
errPrintReport:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, gstrCommandLine(3), _
                            gstrCommandLine(5), gstrGetErrDateFormat)

End Sub

'******************************************************************************
'*    入力チェック
'******************************************************************************
Private Function fncblnNyuuryokuChk() As Boolean

    fncblnNyuuryokuChk = False

    '■融資日 (登録のみ)
    If gstrSyori = "登 録" Then
        If txtYuusibiY.Text = "" Then
            lblMsg.Caption = "融資日が未入力です。"
            txtYuusibiY.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
        
        If txtYuusibiM.Text = "" Then
            lblMsg.Caption = "融資日が未入力です。"
            txtYuusibiM.BackColor = vbRed
            txtYuusibiM.SetFocus
            Exit Function
        End If
        
        If txtYuusibiD.Text = "" Then
            lblMsg.Caption = "融資日が未入力です。"
            txtYuusibiD.BackColor = vbRed
            txtYuusibiD.SetFocus
            Exit Function
        End If
        
        '融資日に入力された値が日付として正しいかチェック
        If IsDate(Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text)) = False Then
            lblMsg.Caption = "入力に誤りがあります。"
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
'☆ 2002/12/12 ☆ 過去分のチェックはしないこととする
'        '過去日の入力を禁止する
'        If Format$(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Mid(gstrSysDate, 7, 2), "YYYY/MM/DD") > Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text) Then
'            lblMsg.Caption = "過去日の入力はできません。"
'            txtYuusibiY.BackColor = vbRed
'            txtYuusibiM.BackColor = vbRed
'            txtYuusibiD.BackColor = vbRed
'            txtYuusibiY.SetFocus
'            Exit Function
'        End If
'☆ 2002/12/12 ☆ 過去分のチェックはしないこととする

'ADD 20090828 0811051 NBC MURAYAMA START
        If Format$(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2) & "/" & Mid(gstrSysDate, 7, 2), "YYYY/MM/DD") > Trim$(txtYuusibiY.Text & "/" & txtYuusibiM.Text & "/" & txtYuusibiD.Text) Then
        '過去日チェック
            lblMsg.Caption = "WPOE20 " & gstrGetCodeMeisyo(odbDatabase, "E20", "WPO")
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            
            Exit Function
        ElseIf (txtYuusibiY.Text & txtYuusibiM.Text) - Format(Mid(gstrSysDate, 1, 4) & "/" & Mid(gstrSysDate, 5, 2), "yyyymm") > 0 Then
        '未来日チェック
            lblMsg.Caption = "WPOE39 翌月より" & gstrGetCodeMeisyo(odbDatabase, "E39", "WPO")
            txtYuusibiY.BackColor = vbRed
            txtYuusibiM.BackColor = vbRed
            txtYuusibiD.BackColor = vbRed
            txtYuusibiY.SetFocus
            Exit Function
        End If
'ADD 20090828 0811051 NBC MURAYAMA END

    End If
    
    '■融資区分
    If cboYusiKbn.Text = "" Then
        lblMsg.Caption = "融資区分が選択されていません。"
        cboYusiKbn.BackColor = vbRed
        cboYusiKbn.SetFocus
        Exit Function
    End If
    
    '■返済月数
    If txtHensaiTukisu.Text = "" Then
        lblMsg.Caption = "返済月数が未入力です。"
        txtHensaiTukisu.BackColor = vbRed
        txtHensaiTukisu.SetFocus
        Exit Function
    End If
    
    If txtHensaiTukisu.Text < 6 Or txtHensaiTukisu.Text > 60 Then
        lblMsg.Caption = "返済月数は６～６０までの値を入力して下さい。"
        txtHensaiTukisu.BackColor = vbRed
        txtHensaiTukisu.SetFocus
        Exit Function
    End If
        
    '■給与返済分
    If txtYuusiKyuuyo.Text = "" Then
        lblMsg.Caption = "給与返済分が未入力です。"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiKyuuyo.SetFocus
        Exit Function
    End If
    
    '■賞与返済分
    If txtYuusiBonus.Text = "" Then
        lblMsg.Caption = "賞与返済分が未入力です。"
        txtYuusiBonus.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If
    
    '■給与＆賞与返済分
    If Trim(txtYuusiKyuuyo.Text) = "0" And Trim(txtYuusiBonus.Text) = "0" Then
        lblMsg.Caption = "有効な値が入力されていません。"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.BackColor = vbRed
        txtYuusiKyuuyo.SetFocus
        Exit Function
    End If
    
    If glngSyosyoGendogaku < CLng(Trim(txtYuusiBonus.Text)) + CLng(Trim(txtYuusiKyuuyo.Text)) Then
        lblMsg.Caption = "限度額オーバーです。"
        txtYuusiBonus.BackColor = vbRed
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If
    
    If CLng(Trim(txtYuusiKyuuyo.Text)) < CLng(Trim(txtYuusiBonus.Text)) Then
        lblMsg.Caption = "賞与返済分は給与返済分より大きい入力はできません。"
        txtYuusiKyuuyo.BackColor = vbRed
        txtYuusiBonus.BackColor = vbRed
        txtYuusiBonus.SetFocus
        Exit Function
    End If

    
    fncblnNyuuryokuChk = True
    
End Function

'******************************************************************************
'*    数字のみ入力可にする
'******************************************************************************
Private Sub txtYuusibiY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusibiM_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusibiD_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtHensaiTukisu_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusiKyuuyo_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
Private Sub txtYuusiBonus_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, gcnsNumeric)
End Sub
'******************************************************************************
'*    テキスト選択
'******************************************************************************
Private Sub txtYuusibiY_GotFocus()
    Call gsubSelectText(txtYuusibiY)
End Sub
Private Sub txtYuusibiM_GotFocus()
    Call gsubSelectText(txtYuusibiM)
End Sub
Private Sub txtYuusibiD_GotFocus()
    Call gsubSelectText(txtYuusibiD)
End Sub
Private Sub txtYuusiKyuuyo_GotFocus()
    Call gsubSelectText(txtYuusiKyuuyo)
End Sub
Private Sub txtYuusiBonus_GotFocus()
    Call gsubSelectText(txtYuusiBonus)
End Sub
Private Sub txtHensaiTukisu_GotFocus()
    Call gsubSelectText(txtHensaiTukisu)
End Sub
'******************************************************************************
'*    フル桁脱出
'******************************************************************************
Private Sub txtYuusibiY_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiY, 4)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiM_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiM, 2)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiD_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtYuusibiD, 2)
    blnNoChangeEvFlg = False
End Sub
Private Sub txtHensaiTukisu_Change()
    If blnNoChangeEvFlg = True Then Exit Sub
    Call gsubMaxCharSkipEX(txtHensaiTukisu, 2)
    blnNoChangeEvFlg = False
End Sub
'******************************************************************************
'*    LOST_FOCUS イベント
'******************************************************************************
Private Sub txtYuusibiM_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiM.Text) <> 2 Then txtYuusibiM.Text = Format$(txtYuusibiM.Text, "00")
    blnNoChangeEvFlg = False
End Sub
Private Sub txtYuusibiD_LostFocus()
    blnNoChangeEvFlg = True
        If Len(txtYuusibiD.Text) <> 2 Then txtYuusibiD.Text = Format$(txtYuusibiD.Text, "00")
    blnNoChangeEvFlg = False
End Sub
'******************************************************************************
'*    LOST_FOCUS 金額ﾌｫｰﾏｯﾄ変換
'******************************************************************************
Private Sub txtYuusiKyuuyo_LostFocus()

    '□給与融資額□
    
    '■登録時処理
    If gstrSyori = "登 録" Then
        If Not txtYuusiKyuuyo.Text = "" Then
            txtYuusiKyuuyo.Text = Format$(txtYuusiKyuuyo.Text, "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            If Not txtYuusiBonus = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiKyuuyo.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        Else
            txtYuusiKyuuyo.Text = "0"
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            If Not txtYuusiBonus = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiKyuuyo.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        End If
        
    '■修正時処理
    ElseIf gstrSyori = "修 正" Then
        If Not txtYuusiKyuuyo.Text = "" Then
            If CLng(lblYuusiKei.Caption) < CLng(txtYuusiKyuuyo.Text) Then
                lblMsg.Caption = "融資合計額よりも大きな値が入力されています。"
                txtYuusiKyuuyo.SetFocus
                txtYuusiKyuuyo.BackColor = vbRed
                Exit Sub
            End If
            txtYuusiKyuuyo.Text = Format$(txtYuusiKyuuyo.Text, "#,##0")
            txtYuusiBonus.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiKyuuyo.Text)), "#,##0")
                
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        Else
            txtYuusiKyuuyo.Text = "0"
            txtYuusiBonus.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiKyuuyo.Text)), "#,##0")
        
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        End If
    End If
    
End Sub
Private Sub txtYuusiBonus_LostFocus()

    '□賞与融資額□
    
    '■登録時処理
    If gstrSyori = "登 録" Then
        If Not txtYuusiBonus.Text = "" Then
            txtYuusiBonus.Text = Format$(txtYuusiBonus.Text, "#,##0")
            lblZanBonus.Caption = txtYuusiBonus.Text
            If Not txtYuusiKyuuyo = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiBonus.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        Else
            txtYuusiBonus.Text = "0"
            lblZanBonus.Caption = txtYuusiBonus.Text
            If Not txtYuusiKyuuyo = "" Then
                lblYuusiKei.Caption = CLng(txtYuusiKyuuyo.Text) + CLng(txtYuusiBonus.Text)
                lblYuusiKei.Caption = Format$(lblYuusiKei.Caption, "#,##0")
                lblZanKei.Caption = lblYuusiKei.Caption
            Else
                lblYuusiKei.Caption = txtYuusiBonus.Text
                lblZanKei.Caption = lblYuusiKei.Caption
            End If
        End If
        
    '■修正時処理
    ElseIf gstrSyori = "修 正" Then
        If Not txtYuusiBonus.Text = "" Then
            If CLng(lblYuusiKei.Caption) < CLng(txtYuusiBonus.Text) Then
                lblMsg.Caption = "融資合計額よりも大きな値が入力されています。"
                txtYuusiBonus.SetFocus
                txtYuusiBonus.BackColor = vbRed
                Exit Sub
            End If
            txtYuusiBonus.Text = Format$(txtYuusiBonus.Text, "#,##0")
            txtYuusiKyuuyo.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiBonus.Text)), "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        Else
            txtYuusiBonus.Text = "0"
            txtYuusiKyuuyo.Text = Format$(CLng(lblYuusiKei.Caption - CLng(txtYuusiBonus.Text)), "#,##0")
            lblZanKyuuyo.Caption = txtYuusiKyuuyo.Text
            lblZanBonus.Caption = txtYuusiBonus.Text
        End If
    End If
    
End Sub
'******************************************************************************
'*    FORM_KEYDOWN ファンクションキー設定
'******************************************************************************
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyReturn   'Enter
            SendKeys "{TAB}"
        Case vbKeyDelete   'DELキーを押した時
            Call Form_KeyPress(46)
        Case vbKeyUp
            Call subErrKaijo
        Case vbKeyLeft
            Call subErrKaijo
        Case vbKeyRight
            Call subErrKaijo
        Case vbKeyDown
            Call subErrKaijo
    End Select
End Sub
'******************************************************************************
'*    登録処理SP
'******************************************************************************
Private Function fncblnTouroku() As Boolean
 Dim strSQL As String

On Error GoTo errfncblnTouroku
    
    fncblnTouroku = False

    'SP　各パラメータを設定
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT              '社員コード１
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT              '社員コード２
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT                '融資日
        .Add "InStrGendogaku", gstrGendogaku, ORAPARM_INPUT            '限度額
        .Add "InStrSyubetu", gstrSyubetu, ORAPARM_INPUT                '種別
        .Add "InStrRiritu", gstrRiritu, ORAPARM_INPUT                  '利率
        .Add "InStrHensaiTsukisu", gstrHensaiTukisu, ORAPARM_INPUT     '返済月数
        .Add "InStrKyuyoHensaiAll", gstrKyuyoHensaiAll, ORAPARM_INPUT  '給与返済総額
        .Add "InStrKyuyoHensai", gstrKyuyoHensaigaku, ORAPARM_INPUT    '給与返済額
        .Add "InStrSyoyoHensaiAll", gstrSyoyoHensaiAll, ORAPARM_INPUT  '賞与返済総額
        .Add "InStrSyoyoHensai", gstrSyoyoHensaigaku, ORAPARM_INPUT    '賞与返済額
        .Add "InStrKyuyoZandaka", gstrKyuyoZandaka, ORAPARM_INPUT      '給与残高
        .Add "InStrSyoyoZandaka", gstrSyoyoZandaka, ORAPARM_INPUT      '賞与残高
        .Add "InStrKojoChusiFlg", gstrKojoChusiFlg, ORAPARM_INPUT      '控除フラグ
        .Add "InStrKansaiYMD", gstrKansaiYMD, ORAPARM_INPUT            '完済日
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT          'メニューＩＤ（オペログ用）
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT             'モジュールＩＤ（オペログ用）
'2003/02/18 修正
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT        '担当者名（オペログ用）
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT        '担当者名（オペログ用）
'
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT     'コンピューター名（オペログ用）
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT       '東西区分（オペログ用）
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT        '部署コード（オペログ用）
        .Add "OtChouhukuFlg", "0", ORAPARM_OUTPUT                      '重複フラグ
        .Item("OtChouhukuFlg").ServerType = ORATYPE_CHAR
    End With

    'SQL文作成
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatAdd("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYusiYMD"
    strSQL = strSQL & ",:InStrGendogaku"
    strSQL = strSQL & ",:InStrSyubetu"
    strSQL = strSQL & ",:InStrRiritu"
    strSQL = strSQL & ",:InStrHensaiTsukisu"
    strSQL = strSQL & ",:InStrKyuyoHensaiAll"
    strSQL = strSQL & ",:InStrKyuyoHensai"
    strSQL = strSQL & ",:InStrSyoyoHensaiAll"
    strSQL = strSQL & ",:InStrSyoyoHensai"
    strSQL = strSQL & ",:InStrKyuyoZandaka"
    strSQL = strSQL & ",:InStrSyoyoZandaka"
    strSQL = strSQL & ",:InStrKojoChusiFlg"
    strSQL = strSQL & ",:InStrKansaiYMD"
    strSQL = strSQL & ",:InStrMenuId"
    strSQL = strSQL & ",:InStrModuleId"
    strSQL = strSQL & ",:InStrTantoMei"
    strSQL = strSQL & ",:InStrComputerMei"
    strSQL = strSQL & ",:InStrRiyouKbn"
    strSQL = strSQL & ",:InStrBushoCd"
    strSQL = strSQL & ",:OtChouhukuFlg); END;"

    'SP実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    '■エラー時処理
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errfncblnTouroku
    End If
    
    '■重複エラーチェック
    If Trim$(odbDatabase.Parameters("OtChouhukuFlg")) = "1" Then
    
        lblMsg.Caption = "融資日が重複しています。"
        txtYuusibiY.BackColor = vbRed
        txtYuusibiM.BackColor = vbRed
        txtYuusibiD.BackColor = vbRed
        txtYuusibiY.SetFocus
        
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnTouroku = True
    
    Exit Function
  
errfncblnTouroku:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    修正処理SP
'******************************************************************************
Private Function fncblnSyusei() As Boolean
 Dim strSQL         As String

On Error GoTo errfncblnSyusei

    fncblnSyusei = False
    
    'SP　各パラメータを設定
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT              '社員コード１
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT              '社員コード２
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT                '融資日
        .Add "InStrGendogaku", gstrGendogaku, ORAPARM_INPUT            '限度額
        .Add "InStrSyubetu", gstrSyubetu, ORAPARM_INPUT                '種別
        .Add "InStrRiritu", gstrRiritu, ORAPARM_INPUT                  '利率
        .Add "InStrHensaiTsukisu", gstrHensaiTukisu, ORAPARM_INPUT     '返済月数
        .Add "InStrKyuyoHensaiAll", gstrKyuyoHensaiAll, ORAPARM_INPUT  '給与返済総額
        .Add "InStrKyuyoHensai", gstrKyuyoHensaigaku, ORAPARM_INPUT    '給与返済額
        .Add "InStrSyoyoHensaiAll", gstrSyoyoHensaiAll, ORAPARM_INPUT  '賞与返済総額
        .Add "InStrSyoyoHensai", gstrSyoyoHensaigaku, ORAPARM_INPUT    '賞与返済額
        .Add "InStrKyuyoZandaka", gstrKyuyoZandaka, ORAPARM_INPUT      '給与残高
        .Add "InStrSyoyoZandaka", gstrSyoyoZandaka, ORAPARM_INPUT      '賞与残高
        .Add "InStrKojoChusiFlg", gstrKojoChusiFlg, ORAPARM_INPUT      '控除フラグ
        .Add "InStrKansaiYMD", gstrKansaiYMD, ORAPARM_INPUT            '完済日
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT          'メニューＩＤ（オペログ用）
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT             'モジュールＩＤ（オペログ用）
'2003/02/18 修正
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT        '担当者名（オペログ用）
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT        '担当者名（オペログ用）
'
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT     'コンピューター名（オペログ用）
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT       '東西区分（オペログ用）
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT        '部署コード（オペログ用）
    End With
    'SQL文作成
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatUpd("
    strSQL = strSQL & " :InStrSyainCd1"
    strSQL = strSQL & ",:InStrSyainCd2"
    strSQL = strSQL & ",:InStrYusiYMD"
    strSQL = strSQL & ",:InStrGendogaku"
    strSQL = strSQL & ",:InStrSyubetu"
    strSQL = strSQL & ",:InStrRiritu"
    strSQL = strSQL & ",:InStrHensaiTsukisu"
    strSQL = strSQL & ",:InStrKyuyoHensaiAll"
    strSQL = strSQL & ",:InStrKyuyoHensai"
    strSQL = strSQL & ",:InStrSyoyoHensaiAll"
    strSQL = strSQL & ",:InStrSyoyoHensai"
    strSQL = strSQL & ",:InStrKyuyoZandaka"
    strSQL = strSQL & ",:InStrSyoyoZandaka"
    strSQL = strSQL & ",:InStrKojoChusiFlg"
    strSQL = strSQL & ",:InStrKansaiYMD"
    strSQL = strSQL & ",:InStrMenuId"
    strSQL = strSQL & ",:InStrModuleId"
    strSQL = strSQL & ",:InStrTantoMei"
    strSQL = strSQL & ",:InStrComputerMei"
    strSQL = strSQL & ",:InStrRiyouKbn"
    strSQL = strSQL & ",:InStrBushoCd); END;"
    
    'SP実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then    'エラー
        GoTo errfncblnSyusei
    End If

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnSyusei = True
    
    Exit Function
  
errfncblnSyusei:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    削除処理SP
'******************************************************************************
Private Function fncblnDelete() As Boolean
 Dim strSQL As String

On Error GoTo errfncblnDelete

    fncblnDelete = False
    
    'SP ﾊﾟﾗﾒｰﾀ設定
    With odbDatabase.Parameters
        .Add "InStrSyainCd1", gstrSyainCd1, ORAPARM_INPUT           '商品区分
        .Add "InStrSyainCd2", gstrSyainCd2, ORAPARM_INPUT           '商品コード
        .Add "InStrYusiYMD", gstrYusiYMD, ORAPARM_INPUT             '担当者コード（オペログ用）
        .Add "InStrMenuId", gstrCommandLine(8), ORAPARM_INPUT       'メニューＩＤ（オペログ用）
        .Add "InStrModuleId", cpubMyPrjName, ORAPARM_INPUT          'モジュールＩＤ（オペログ用）
'2003/02/18 修正
        .Add "InStrTantoMei", gstrCommandLine(1), ORAPARM_INPUT     '担当者ＩＤ（オペログ用）
'       .Add "InStrTantoMei", gstrCommandLine(2), ORAPARM_INPUT
        .Add "InStrComputerMei", gstrCommandLine(5), ORAPARM_INPUT  'コンピューター名（オペログ用）
        .Add "InStrRiyouKbn", gstrCommandLine(10), ORAPARM_INPUT    '東西区分（オペログ用）
'2003/02/18 修正
        .Add "InStrBushoCd", gstrCommandLine(11), ORAPARM_INPUT      '部署コード（オペログ用）
'        .Add "InStrBushoCd", gstrCommandLine(2), ORAPARM_INPUT
'
    End With
    'SQL文作成
             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080DatDel("
    strSQL = strSQL & ":InStrSyainCd1,"
    strSQL = strSQL & ":InStrSyainCd2,"
    strSQL = strSQL & ":InStrYusiYMD,"
    strSQL = strSQL & ":InStrMenuId,"
    strSQL = strSQL & ":InStrModuleId,"
    strSQL = strSQL & ":InStrTantoMei,"
    strSQL = strSQL & ":InStrComputerMei,"
    strSQL = strSQL & ":InStrRiyouKbn,"
    strSQL = strSQL & ":InStrBushoCd); END;"

    'SP実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then    'エラー
        GoTo errfncblnDelete
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    fncblnDelete = True
    
    Exit Function
  
errfncblnDelete:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Function
'******************************************************************************
'*    初期表示処理
'******************************************************************************
Private Sub subInitScreen()

    Select Case gstrSyori
    
    Case "登 録"
        txtYuusibiY.Visible = True
        txtYuusibiM.Visible = True
        txtYuusibiD.Visible = True
        cboYusiKbn.Visible = True
        txtYuusiKyuuyo.Visible = True
        txtYuusiBonus.Visible = True
        txtHensaiTukisu.Visible = True
        
        lblYuusibiY.Visible = False
        lblYuusibiM.Visible = False
        lblYuusibiD.Visible = False
        lblYusiKbn.Visible = False
        lblYuusiKyuuyo.Visible = False
        lblYuusiBonus.Visible = False
        lblHensaiTsuki.Visible = False
        
    Case "修 正"
        txtYuusibiY.Visible = False
        txtYuusibiM.Visible = False
        txtYuusibiD.Visible = False
        cboYusiKbn.Visible = True
        txtYuusiKyuuyo.Visible = True
        txtYuusiBonus.Visible = True
        txtHensaiTukisu.Visible = True
        
        lblYuusibiY.Visible = True
        lblYuusibiM.Visible = True
        lblYuusibiD.Visible = True
        lblYusiKbn.Visible = False
        lblYuusiKyuuyo.Visible = False
        lblYuusiBonus.Visible = False
        lblHensaiTsuki.Visible = False
        
    Case "削 除"
        txtYuusibiY.Visible = False
        txtYuusibiM.Visible = False
        txtYuusibiD.Visible = False
        cboYusiKbn.Visible = False
        txtYuusiKyuuyo.Visible = False
        txtYuusiBonus.Visible = False
        txtHensaiTukisu.Visible = False
        
        lblYuusibiY.Visible = True
        lblYuusibiM.Visible = True
        lblYuusibiD.Visible = True
        lblYusiKbn.Visible = True
        lblYuusiKyuuyo.Visible = True
        lblYuusiBonus.Visible = True
        lblHensaiTsuki.Visible = True
        
    End Select
    
End Sub
'**********************************************************************************************************
'*    月々返済額計算
'**********************************************************************************************************
Public Sub gsubKeisan()
 Dim dblRiritu          As Double  '契約利率
 
'--ワーク----------------------------------------------
 Dim lngYuusi           As Long    '融資額_WORK
 Dim strSyouyoDate1     As String  '賞与支給月1_WORK
 Dim strSyouyoDate2     As String  '賞与支給月1_WORK
 Dim dblKeiyakuriritu   As Double  '契約利率_WORK
 Dim strMonth_1         As String  '月1_WORK
 Dim strMonth_2         As String  '月1_WORK
 Dim strNextSyouyoMonth As String  '次回賞与月_WORK
 Dim intPage            As Integer '頁_WORK
 Dim intGyou            As Integer '行_WORK
 Dim strYuusiDate       As String  '融資日_WORK
 Dim strYuusiMae        As String  '融資日付前_WORK
 Dim strYuusiAto        As String  '融資日付後_WORK
 Dim lngKyuuyoCNT       As Long    '給与配列件数
 Dim lngSyouyoCNT       As Long    '賞与配列件数

 Dim intKaisuu          As Integer
 Dim dblWKYuusibi       As Double
 Dim varWKSyouyoDate1   As Variant
 Dim varWKSyouyoDate2   As Variant
 Dim lngKyuyoYusigaku   As Long
 Dim lngSyoyoYusigaku   As Long

 Dim strYuusiYMD_W      As String '2001/12/06

On Error GoTo gsubKeisan

    '変数にセット
    dblRiritu = CDbl(gstrRiritu)                 '契約利率
    dblKeiyakuriritu = dblRiritu
    intKaisuu = gstrHensaiTukisu                 '返済月数
    lngKyuyoYusigaku = CLng(gstrKyuyoHensaiAll)
    lngSyoyoYusigaku = CLng(gstrSyoyoHensaiAll)
    
    '賞与支払日判定
''''''    If Format(Date, "MMDD") < gstrBonusMD1 Then
''''    If Format(Date, "MMDD") <= gstrBonusMD1 Then
''''        '賞与支払月日１を賞与支払月日２に
''''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
''''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strSyouyoDate2 = Format$(DateAdd("YYYY", 0, Date), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strMonth_1 = Left$(gstrBonusMD2, 2)
''''        strMonth_2 = Left$(gstrBonusMD1, 2)
''''''    ElseIf Format(Date, "MMDD") > gstrBonusMD2 Then
''''    ElseIf Format(Date, "MMDD") >= gstrBonusMD2 Then
''''        '賞与支払月日２を賞与支払月日１に
''''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & gstrBonusMD2
''''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & gstrBonusMD1
''''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & gstrBonusMD2, "MM")
''''''        strMonth_2 = Format$(Format$(DateAdd("yyyy", -1, Date), "YYYY") & "/" & gstrBonusMD1, "MM")
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strSyouyoDate2 = Format$(DateAdd("YYYY", -1, Date), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strMonth_1 = Left$(gstrBonusMD2, 2)
''''        strMonth_2 = Left$(gstrBonusMD1, 2)
''''    ElseIf Format(Date, "MMDD") > gstrBonusMD1 And Format(Date, "MMDD") < gstrBonusMD2 Then
''''        strSyouyoDate1 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
''''        strSyouyoDate2 = Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
''''        strMonth_1 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2), "MM")
''''        strMonth_2 = Format$(Format$(Date, "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2), "MM")
''''    End If
    strYuusiYMD_W = Mid$(gstrYusiYMD, 1, 4) & "/" & Mid$(gstrYusiYMD, 5, 2) & "/" & Mid$(gstrYusiYMD, 7, 2) '2001/12/06
    If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD1 Then
        If Format(strYuusiYMD_W, "MMDD") >= gstrBonusMD2 Then
            strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        Else
            If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD2, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
                strSyouyoDate1 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12追加'
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12追加
            Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
                strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
                strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
        End If
    Else
        If Format(strYuusiYMD_W, "MM") = Left(gstrBonusMD1, 2) Then '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2) ''''2001/12/12追加 '2002/04/22
            strSyouyoDate2 = Format$(DateAdd("yyyy", 1, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2) ''''2001/12/12追加
        Else '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
            strSyouyoDate1 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD1, 2) & "/" & Right$(gstrBonusMD1, 2)
            strSyouyoDate2 = Format$(DateAdd("yyyy", 0, strYuusiYMD_W), "YYYY") & "/" & Left$(gstrBonusMD2, 2) & "/" & Right$(gstrBonusMD2, 2)
        End If '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''2001/12/12追加
    End If

    
    
    '----給与--------------------
    dblWKYuusibi = CDate(Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2))
    varWKSyouyoDate1 = CVar(strSyouyoDate1)
    varWKSyouyoDate2 = CVar(strSyouyoDate2)

    gstrKyuyoHensaigaku = gfncstrKeisan(1, dblWKYuusibi, dblKeiyakuriritu, intKaisuu, lngKyuyoYusigaku, lngSyoyoYusigaku, varWKSyouyoDate1, varWKSyouyoDate2)  '　６ヶ月
    
    '----賞与------------------------
    dblWKYuusibi = CDate(Mid(gstrYusiYMD, 1, 4) & "/" & Mid(gstrYusiYMD, 5, 2) & "/" & Mid(gstrYusiYMD, 7, 2))
    varWKSyouyoDate1 = CVar(strSyouyoDate1)
    varWKSyouyoDate2 = CVar(strSyouyoDate2)
    
    gstrSyoyoHensaigaku = gfncstrKeisan(2, dblWKYuusibi, dblKeiyakuriritu, intKaisuu, lngKyuyoYusigaku, lngSyoyoYusigaku, varWKSyouyoDate1, varWKSyouyoDate2)

    Exit Sub

gsubKeisan:
    Exit Sub

End Sub
'**********************************************************************************************************
'   利率をOTHERマスタよりデータを取得する
'   構造体へセット
'   gstrRiritu.strQPAH_NAMEN    ←  ローン名称
'   gstrRiritu.strQPAH_NAMEX    ←  融資種別
'   gstrRiritu.strQPAH_RIRITU   ←　利率
'**********************************************************************************************************
Private Sub subComboItemGet()
    Dim strSQL          As String
    Dim objTable        As Object
    Dim strGetName      As String
    Dim strGetRiritsu   As String
    Dim strShubetsu     As String
    Dim lngI            As Long
    Dim strWork         As String
    
    Erase gstrtypRiritu

    lngI = 0

    strSQL = ""
    strSQL = strSQL & "SELECT"
    strSQL = strSQL & " QPAH_PRMCODE"
    strSQL = strSQL & ",QPAH_NAMEN"
    strSQL = strSQL & ",QPAH_NAMEX"
    strSQL = strSQL & ",QPAH_RIRITU "
    strSQL = strSQL & "FROM "
    strSQL = strSQL & "QPAH_OTHERM "
    strSQL = strSQL & "WHERE "
    strSQL = strSQL & "SUBSTR(QPAH_PRMCODE,1,7) = 'RIIPPAN' "
    strSQL = strSQL & "OR "
    strSQL = strSQL & "RTRIM(QPAH_PRMCODE) = 'RITOKUBETU'"
    strSQL = strSQL & "ORDER BY QPAH_NAMEX ASC"

    If gblnOpenOracleTable(objTable, strSQL) = False Then
        Set objTable = Nothing
        Exit Sub
    End If
 
    Do Until objTable.EOF = True
        ReDim Preserve gstrtypRiritu(lngI)
        
        With gstrtypRiritu(lngI)
            .strQPAH_NAMEN = gstrCheckNull(objTable.Fields.Item("QPAH_NAMEN").Value, 1)
            .strQPAH_NAMEX = gstrCheckNull(objTable.Fields.Item("QPAH_NAMEX").Value, 1)
             strWork = gstrCheckNull(objTable.Fields.Item("QPAH_RIRITU").Value, 1)
            .strQPAH_RIRITU = Format(strWork, "##.#0")
        End With

        objTable.MoveNext
        lngI = lngI + 1
    Loop
    
    Set objTable = Nothing

End Sub

