VERSION 5.00
Begin VB.Form frmQPAV_CEnt091 
   Caption         =   "完済入金入力"
   ClientHeight    =   5145
   ClientLeft      =   60
   ClientTop       =   315
   ClientWidth     =   7470
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   5145
   ScaleWidth      =   7470
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdTouroku 
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
      Height          =   540
      Left            =   840
      TabIndex        =   3
      Top             =   4410
      Width           =   1350
   End
   Begin VB.CommandButton cmdTorikesi 
      Caption         =   "取消"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   3120
      TabIndex        =   4
      Top             =   4410
      Width           =   1350
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "戻る"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   5610
      TabIndex        =   5
      Top             =   4410
      Width           =   1350
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
      Left            =   90
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   3780
      Width           =   7155
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
         Left            =   0
         TabIndex        =   39
         Top             =   30
         Width           =   7095
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   570
      ScaleHeight     =   285
      ScaleWidth      =   1290
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   1680
      Width           =   1350
      Begin VB.Label Label24 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "融資額"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   315
         TabIndex        =   20
         Top             =   15
         Width           =   720
      End
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H00800000&
      Height          =   315
      Index           =   1
      Left            =   570
      ScaleHeight     =   255
      ScaleWidth      =   1290
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1350
      Begin VB.Label Label25 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "残 高"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   360
         TabIndex        =   18
         Top             =   15
         Width           =   600
      End
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   1935
      ScaleHeight     =   285
      ScaleWidth      =   1485
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1545
      Begin VB.Label Label26 
         Alignment       =   2  '中央揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "計"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   60
         TabIndex        =   16
         Top             =   0
         Width           =   1380
      End
   End
   Begin VB.PictureBox Picture4 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   5070
      ScaleHeight     =   285
      ScaleWidth      =   1470
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1535
      Begin VB.Label Label28 
         Alignment       =   2  '中央揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "賞与返済分"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   0
         TabIndex        =   14
         Top             =   0
         Width           =   1440
      End
   End
   Begin VB.PictureBox Picture5 
      BackColor       =   &H00800000&
      Height          =   345
      Index           =   1
      Left            =   3480
      ScaleHeight     =   285
      ScaleWidth      =   1515
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   1350
      Width           =   1575
      Begin VB.Label Label27 
         Alignment       =   2  '中央揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "給与返済分"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFF00&
         Height          =   240
         Index           =   1
         Left            =   0
         TabIndex        =   12
         Top             =   30
         Width           =   1470
      End
   End
   Begin VB.TextBox txtNyuukinbiYYYY 
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
      IMEMode         =   3  'ｵﾌ固定
      Left            =   2295
      MaxLength       =   4
      TabIndex        =   0
      Top             =   2760
      Width           =   615
   End
   Begin VB.TextBox txtNyuukinbiMM 
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
      IMEMode         =   3  'ｵﾌ固定
      Left            =   3255
      MaxLength       =   2
      TabIndex        =   1
      Top             =   2760
      Width           =   375
   End
   Begin VB.TextBox txtNyuukinbiDD 
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
      IMEMode         =   3  'ｵﾌ固定
      Left            =   3975
      MaxLength       =   2
      TabIndex        =   2
      Top             =   2760
      Width           =   360
   End
   Begin VB.Label Label4 
      BackColor       =   &H00FF80FF&
      BorderStyle     =   1  '実線
      Caption         =   "給与(通常)　　　　賞与(通常)　　　　　　　給与(戻し)　　　　賞与(戻し)"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   240
      TabIndex        =   49
      Top             =   3240
      Visible         =   0   'False
      Width           =   6960
   End
   Begin VB.Label lblZanSyoyoModo 
      Alignment       =   1  '右揃え
      BackColor       =   &H00FF80FF&
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
      Height          =   315
      Left            =   5640
      TabIndex        =   48
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanKyuyoModo 
      Alignment       =   1  '右揃え
      BackColor       =   &H00FF80FF&
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
      Height          =   315
      Left            =   3960
      TabIndex        =   47
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanSyoyoTujo 
      Alignment       =   1  '右揃え
      BackColor       =   &H00FF80FF&
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
      Height          =   315
      Left            =   1920
      TabIndex        =   46
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblZanKyuyoTujo 
      Alignment       =   1  '右揃え
      BackColor       =   &H00FF80FF&
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
      Height          =   315
      Left            =   240
      TabIndex        =   45
      Top             =   3480
      Visible         =   0   'False
      Width           =   1560
   End
   Begin VB.Label lblSyainCD1 
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
      Height          =   225
      Left            =   1770
      TabIndex        =   44
      Top             =   360
      Width           =   165
   End
   Begin VB.Label lblKaisu 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   6330
      TabIndex        =   43
      Top             =   810
      Width           =   630
   End
   Begin VB.Label Label9 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "返済回数"
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
      Left            =   5340
      TabIndex        =   42
      Top             =   810
      Width           =   900
   End
   Begin VB.Label lblRiritu 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   4260
      TabIndex        =   41
      Top             =   810
      Width           =   960
   End
   Begin VB.Label Label2 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "返済利率"
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
      Left            =   3285
      TabIndex        =   40
      Top             =   810
      Width           =   900
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
      Height          =   225
      Left            =   3240
      TabIndex        =   37
      Top             =   360
      Width           =   2715
   End
   Begin VB.Label lblSyainCD2 
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
      Height          =   225
      Left            =   2100
      TabIndex        =   36
      Top             =   360
      Width           =   885
   End
   Begin VB.Label Label5 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "社員コード"
      BeginProperty Font 
         Name            =   "ＭＳ ゴシック"
         Size            =   9.75
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Index           =   1
      Left            =   660
      TabIndex        =   35
      Top             =   360
      Width           =   975
   End
   Begin VB.Label lblYuusibiD 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   2550
      TabIndex        =   33
      Top             =   825
      Width           =   240
   End
   Begin VB.Label lblYuusibiM 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   1965
      TabIndex        =   32
      Top             =   825
      Width           =   240
   End
   Begin VB.Label lblYuusibiY 
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
      ForeColor       =   &H00C00000&
      Height          =   225
      Left            =   1020
      TabIndex        =   31
      Top             =   825
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
      ForeColor       =   &H00C00000&
      Height          =   315
      Left            =   5040
      TabIndex        =   30
      Top             =   1710
      Width           =   1560
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
      ForeColor       =   &H00C00000&
      Height          =   315
      Left            =   3480
      TabIndex        =   29
      Top             =   1710
      Width           =   1560
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
      Height          =   315
      Left            =   5040
      TabIndex        =   28
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   1920
      TabIndex        =   27
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   3480
      TabIndex        =   26
      Top             =   2040
      Width           =   1560
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
      Height          =   315
      Left            =   1920
      TabIndex        =   25
      Top             =   1710
      Width           =   1560
   End
   Begin VB.Label Label20 
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
      Left            =   2835
      TabIndex        =   24
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label19 
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
      Left            =   2265
      TabIndex        =   23
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label18 
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
      Left            =   1650
      TabIndex        =   22
      Top             =   825
      Width           =   225
   End
   Begin VB.Label Label3 
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
      Left            =   270
      TabIndex        =   21
      Top             =   825
      Width           =   675
   End
   Begin VB.Label Label12 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "完済日"
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
      Height          =   225
      Left            =   1380
      TabIndex        =   9
      Top             =   2790
      Width           =   675
   End
   Begin VB.Label Label1 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "年"
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
      Height          =   225
      Left            =   2955
      TabIndex        =   8
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label Label6 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "月"
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
      Height          =   225
      Left            =   3675
      TabIndex        =   7
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label Label7 
      Alignment       =   1  '右揃え
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  '透明
      Caption         =   "日"
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
      Height          =   225
      Left            =   4410
      TabIndex        =   6
      Top             =   2820
      Width           =   225
   End
   Begin VB.Label lblLabel 
      BorderStyle     =   1  '実線
      BeginProperty Font 
         Name            =   "ＭＳ Ｐ明朝"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   1830
      Index           =   13
      Left            =   90
      TabIndex        =   10
      Top             =   630
      Width           =   7140
   End
   Begin VB.Label lblLabel 
      BorderStyle     =   1  '実線
      BeginProperty Font 
         Name            =   "ＭＳ Ｐ明朝"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   690
      Index           =   0
      Left            =   90
      TabIndex        =   34
      Top             =   2550
      Width           =   7140
   End
End
Attribute VB_Name = "frmQPAV_CEnt091"
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
'    フォーム　　　： frmQPAV_CEnt091  ： 完済入金入力
'---------------------------------------
'   作成日　 ： ????/??/??
'   担当者　 ： FIP
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
'
'20100816  TR1006-001　　   精算額が0円クリアされる不具合対応
'
'20100816  1004091          グループ社員貸付の債権譲渡に伴うシステム対応
'                           １．完済日の入力チェックを追加(同月の過去日入力許可)
'
'20100909   TR1009-001      賞与：前回天引日が存在しないとエラーとなる不具合対応
'----------------------------------------------------------------------------------------------


Private Sub cmdBack_Click()
    
    Unload Me

End Sub

Private Sub cmdTorikesi_Click()
    
    Call subFormInitialize
    txtNyuukinbiYYYY.SetFocus

End Sub

Private Sub cmdTouroku_Click()

    Dim i As Long
    Dim strMSG As String
    
    If cmdTouroku.Caption <> "完済取消" Then
        If functext_Check(txtNyuukinbiYYYY) = False Then
            'Msg = が入力されていません。
            lblMsg.Caption = "WPOE01 入金日" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiYYYY.Text = Format(txtNyuukinbiYYYY.Text, "0000")
        
        If functext_Check(txtNyuukinbiMM) = False Then
            'Msg = が入力されていません。
            lblMsg.Caption = "WPOE01 入金日" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiMM.Text = Format(txtNyuukinbiMM.Text, "00")
        
        If functext_Check(txtNyuukinbiDD) = False Then
            'Msg = が入力されていません。
            lblMsg.Caption = "WPOE01 入金日" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
            Exit Sub
        End If
        txtNyuukinbiDD.Text = Format(txtNyuukinbiDD.Text, "00")
        
        If Not IsDate(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text) Then
            'Msg = は日付で入力して下さい。
            lblMsg.Caption = "WPOE03 入金日" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
       
        
        'ADD 20100816 1004091 IMZ NISHIKADO START
        If DateDiff("y", txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, gstrZanYMD) >= 0 Then
            'Msg = 最新の残高更新日(）以前の日付は入力できません。
            lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
        'ADD 20100816 1004091 IMZ NISHIKADO END
        
'ADD 20100225 0908047 NBC YOKOYAMA START
        'DEL 20100816 1004091 IMZ NISHIKADO START
        'オペ日より過去はNG
        'If gdatSysDate > Format(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, "YYYY/MM/DD") Then
        '    'Msg = 過去日付は入力できません。
        '    lblMsg.Caption = "WPOE20 " & gstrGetCodeMeisyo(odbDatabase, "E20", "WPO")
        '    txtNyuukinbiYYYY.BackColor = vbRed
        '    txtNyuukinbiMM.BackColor = vbRed
        '    txtNyuukinbiDD.BackColor = vbRed
        '    txtNyuukinbiYYYY.SetFocus
        '    Exit Sub
        'End If
        'DEL 20100816 1004091 IMZ NISHIKADO END
        
        'オペ日翌月以降はNG
        If Format(gdatSysDate, "YYYY/MM") <> Format(txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text, "YYYY/MM") Then
            'Msg = 翌月以降の未来日は入力できません。
            lblMsg.Caption = "WPOE49 " & gstrGetCodeMeisyo(odbDatabase, "E49", "WPO")
            txtNyuukinbiYYYY.BackColor = vbRed
            txtNyuukinbiMM.BackColor = vbRed
            txtNyuukinbiDD.BackColor = vbRed
            txtNyuukinbiYYYY.SetFocus
            Exit Sub
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END

        'DEL 20100816 1004091 IMZ NISHIKADO START
        'If DateDiff("y", txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text, gstrZanYMD) > 0 Then
        '    'Msg = 最新の残高更新日(）以前の日付は入力できません。
        '    lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", gstrZanYMD)
        '    txtNyuukinbiYYYY.BackColor = vbRed
        '    txtNyuukinbiMM.BackColor = vbRed
        '    txtNyuukinbiDD.BackColor = vbRed
        '    txtNyuukinbiYYYY.SetFocus
        '    Exit Sub
        'End If
        'DEL 20100816 1004091 IMZ NISHIKADO END
    
    End If
    
    lblMsg.Caption = ""
    
    Call subDataPass
    Select Case cmdTouroku.Caption
        Case "完済"
'MOD 20100225 0908047 NBC YOKOYAMA START
            'strMSG = "精算額  : " & Format(glngNyukin, "#,##0") & "円" & vbCr & vbLf & cmdTouroku.Caption & "してよろしいですか？"
            strMSG = "精算額  : " & Format(glngNyukin + CLng(lblZanKyuyoModo.Caption) + CLng(lblZanSyoyoModo.Caption), "#,##0") & "円" & vbCr & vbLf & cmdTouroku.Caption & "してよろしいですか？"
'MOD 20100225 0908047 NBC YOKOYAMA END
            If MsgBox(strMSG, vbQuestion + vbOKCancel, "社員融資入金入力") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPAdd = False Then Exit Sub
        Case "完済修正"
'MOD 20100225 0908047 NBC YOKOYAMA START
            'strMSG = "精算額  : " & Format(glngNyukin, "#,##0") & "円" & vbCr & vbLf & cmdTouroku.Caption & "してよろしいですか？"
            strMSG = "精算額  : " & Format(glngNyukin + CLng(lblZanKyuyoModo.Caption) + CLng(lblZanSyoyoModo.Caption), "#,##0") & "円" & vbCr & vbLf & cmdTouroku.Caption & "してよろしいですか？"
'MOD 20100225 0908047 NBC YOKOYAMA END
            If MsgBox(strMSG, vbQuestion + vbOKCancel, "社員融資入金入力") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPUpd = False Then Exit Sub
        Case "完済取消"
            If MsgBox("完済を取消してよろしいですか？", vbQuestion + vbOKCancel, "社員融資入金入力") = vbCancel Then
                Exit Sub
            End If
            If gfuncSPDel = False Then Exit Sub
    End Select
    Unload Me

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyReturn Then
        SendKeys "{TAB}"
    End If

End Sub

'**************************************
'*FORM_KEYPRESS
'**************************************
Private Sub Form_KeyPress(KeyAscii As Integer)
    
    Call subErrKaijo

    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
    
End Sub

'-- Start Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
Private Sub Form_Load()

    Dim clsActX490 As QSAV_ActX490.ActX490C
    
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

End Sub
'-- Finish Of ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtNyuukinbiDD_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiDD, 2)

End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtNyuukinbiDD_GotFocus()

    Call gsubSelectText(txtNyuukinbiDD)

End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtNyuukinbiDD_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtNyuukinbiMM_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiMM, 2)

End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtNyuukinbiMM_GotFocus()

    Call gsubSelectText(txtNyuukinbiMM)

End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtNyuukinbiMM_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtNyuukinbiYYYY_Change()
    
    Call gsubMaxCharSkipEX(txtNyuukinbiYYYY, 4)

End Sub

'******************************************
'*フォーカス取得時全テキスト選択
'******************************************
Private Sub txtNyuukinbiYYYY_GotFocus()

    Call gsubSelectText(txtNyuukinbiYYYY)

End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtNyuukinbiYYYY_KeyPress(KeyAscii As Integer)
    
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")

End Sub

'****************************************
'*エラーチェック
'****************************************
Private Function functext_Check(txt_Name As TextBox) As Boolean
    
    functext_Check = False
    
    If txt_Name.Text = "" Then
        txt_Name.BackColor = vbRed
        txt_Name.SetFocus
        Exit Function
    End If
    txt_Name.BackColor = vbWhite
    
    functext_Check = True

End Function

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite

End Sub

'****************************************
'*画面初期化
'****************************************
Private Sub subFormInitialize()
    
    If cmdTouroku.Caption = "完済" Then
        txtNyuukinbiYYYY.Text = Format(gdatSysDate, "yyyy")
        txtNyuukinbiMM.Text = Format(gdatSysDate, "mm")
        txtNyuukinbiDD.Text = Format(gdatSysDate, "dd")
    ElseIf cmdTouroku.Caption = "完済修正" Then
        txtNyuukinbiYYYY.Text = Left(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 4)
        txtNyuukinbiMM.Text = Mid(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 6, 2)
        txtNyuukinbiDD.Text = Right(gVarSpdGetText(frmQPAV_CEnt090.sprList, 10, Act_Row), 2)
    End If
    
    lblMsg.Caption = ""
    txtNyuukinbiYYYY.BackColor = vbWhite
    txtNyuukinbiMM.BackColor = vbWhite
    txtNyuukinbiDD.BackColor = vbWhite

End Sub

Private Sub subDataPass()

    Dim KyuyoZenYMD_WORK    As String
    Dim SyoyoZenYMD_WORK    As String
    Dim NextYMD_WORK        As String
    Dim BeforeYMD_WORK      As String
    
    Dim YusiYMD_WORK        As String
    Dim seiYMD_WORK         As String
    Dim KyuyoZan_Work       As Long
    Dim SyoyoZan_Work       As Long
    
    Dim ZanKyuyo_WORK       As Long
    Dim ZanBonus_WORK       As Long
    Dim ZanKei_WORK         As Long
    Dim RisokuKyuyo_WORK    As Long
    Dim RisokuBonus_WORK    As Long
    Dim RisokuKei_WORK      As Long
    Dim TenKyuyo_WORK       As Long
    Dim TenBonus_WORK       As Long
    Dim KBNKyuyo_WORK       As String
    Dim KBNBonus_WORK       As String
    Dim KyuyoHen            As Long
    Dim SyoyoHen            As Long
'ADD 20100225 0908047 NBC YOKOYAMA START
    '計算のためにラベルを入れ替えるので元の値を退避
    Dim strKyuyo_BK         As String
    Dim strSyoyo_BK         As String
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    Dim Riritu_Work         As Double   '10/24 Add
    
    Riritu_Work = Fix(gtblKeisan(Act_Row).Riritu / 36500 * 1000000) / 1000000       '10/24 Add
    
    If Trim(lblSyainCD1.Caption) = "" Then
        gstrCode1 = Space(1)
    Else
        gstrCode1 = Trim(lblSyainCD1.Caption)
    End If
    
    gstrCode2 = Trim(lblSyainCD2.Caption)
    
    gstrYusiYMD = Trim(lblYuusibiY.Caption) & Trim(lblYuusibiM.Caption) & Trim(lblYuusibiD.Caption)
    
    '完済取消時は以下の処理をしない
    If cmdTouroku.Caption = "完済取消" Then Exit Sub
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '精算金額計算に使用する残高をlblZanKyuuyo、lblZanSyouyoからlblZanKyuyoTujo、lblZanSyoyoTujoに変更する
    strKyuyo_BK = lblZanKyuuyo.Caption
    strSyoyo_BK = lblZanBonus.Caption
    lblZanKyuuyo.Caption = lblZanKyuyoTujo.Caption
    lblZanBonus.Caption = lblZanSyoyoTujo.Caption
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    seiYMD_WORK = txtNyuukinbiYYYY.Text & "/" & txtNyuukinbiMM.Text & "/" & txtNyuukinbiDD.Text
    YusiYMD_WORK = lblYuusibiY.Caption & "/" & lblYuusibiM.Caption & "/" & lblYuusibiD.Caption
    KyuyoHen = gtblKeisan(Act_Row).KyuyoHen
    SyoyoHen = gtblKeisan(Act_Row).SyoyoHen
    
    gstrSeiYMD = Trim(txtNyuukinbiYYYY.Text) & Trim(txtNyuukinbiMM.Text) & Trim(txtNyuukinbiDD.Text)

    KyuyoZan_Work = lblZanKyuuyo.Caption
    SyoyoZan_Work = lblZanBonus.Caption
    
    If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, Format$(seiYMD_WORK, "yyyy/mm/01"))) < 0 Then
        KyuyoZenYMD_WORK = ""
    Else
        If Val(Format$(seiYMD_WORK, "dd")) >= 25 Then
            KyuyoZenYMD_WORK = Format$(seiYMD_WORK, "yyyy/mm/25")
        Else
            If DateDiff("y", YusiYMD_WORK, DateAdd("d", -1, DateAdd("m", -1, Format$(seiYMD_WORK, "yyyy/mm/01")))) < 0 Then
                KyuyoZenYMD_WORK = ""
            Else
                KyuyoZenYMD_WORK = Format$(DateAdd("m", -1, seiYMD_WORK), "yyyy/mm/25")
            End If
        End If
    End If
    If DateDiff("y", seiYMD_WORK, gstrBonusYMD1) > 0 Then
        SyoyoZenYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD2), "yyyy/mm/dd")
    ElseIf DateDiff("y", seiYMD_WORK, gstrBonusYMD2) > 0 Then
        SyoyoZenYMD_WORK = gstrBonusYMD1
    Else
        SyoyoZenYMD_WORK = gstrBonusYMD2
    End If
    If DateDiff("y", YusiYMD_WORK, DateAdd("y", -1, Format$(SyoyoZenYMD_WORK, "yyyy/mm/01"))) < 0 Then
        SyoyoZenYMD_WORK = ""
    End If
    gstrKyuyoZen1 = IIf(KyuyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), KyuyoZenYMD_WORK)
    gstrSyoyoZen1 = IIf(SyoyoZenYMD_WORK = "", Format(DateAdd("d", -1, YusiYMD_WORK), "yyyy/mm/dd"), SyoyoZenYMD_WORK)
    gstrKyuyoZen = KyuyoZenYMD_WORK
    gstrSyoyoZen = SyoyoZenYMD_WORK

    If IsDate(gstrKyuyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrKyuyoZen1) < 0 Then
            gstrKyuyoZen = ""
        End If
    End If
  
    If IsDate(gstrSyoyoZen1) Then
        If DateDiff("y", YusiYMD_WORK, gstrSyoyoZen1) < 0 Then
            gstrSyoyoZen = ""
        End If
    End If

'ADD 20100225 0908047 NBC YOKOYAMA START
    If Day(gdatSysDate) >= 25 And KyuyoZenYMD_WORK <> "" Then
    '実行日25日以降は当月控除分を残高からマイナスする
        Dim lngTmpRisoku As Long
        Dim BeforeBeforeYMD_WORK As Date
        '前々回
        BeforeBeforeYMD_WORK = DateAdd("m", -1, KyuyoZenYMD_WORK)
        '初回控除の判定
        If CLng(lblYuusiKyuuyo.Caption) = CLng(lblZanKyuuyo.Caption) Then
            BeforeBeforeYMD_WORK = CDate(lblYuusibiY.Caption & "/" & lblYuusibiM.Caption & "/" & lblYuusibiD.Caption)
        End If
        '融資日以前になった場合は調整
        If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
            BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
        End If
        lngTmpRisoku = Fix(CLng(KyuyoZan_Work) * _
                       DateDiff("y", BeforeBeforeYMD_WORK, KyuyoZenYMD_WORK) * Riritu_Work)
        lblZanKyuuyo.Caption = Format(CLng(lblZanKyuuyo.Caption) + lngTmpRisoku - CLng(KyuyoHen), "#,##0")
    End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    
    '**************************************************
    '* 融資日が "2000/03/01" を境に計算方法を変更
    '**************************************************
    If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD) > 0 Then
        '*******************
        '* 以前の計算式
        '*******************
        '* 給与の残高計算および表示
        '過去日入力に対応
        If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
            If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                NextYMD_WORK = DateAdd("m", 1, CVDate(Format$(gdatSysDate, "yyyy/mm") & "/25"))
            Else
                NextYMD_WORK = CVDate(Format$(gdatSysDate, "yyyy/mm") & "/25")
            End If
        Else
            NextYMD_WORK = CVDate(Format$(seiYMD_WORK, "yyyy/mm") & "/25")
        End If
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '***初回を考慮する
            If Format(lblZanKyuuyo.Caption, "#,##0") = lblYuusiKyuuyo.Caption Then   '***初回
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    - (Format(KyuyoHen, "#,##0") _
                                    - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    * (IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 30, 45) / 30) _
                                    * gtblKeisan(Act_Row).Riritu / 12 / 100))), "#,##0")
                KyuyoHen = 0
            Else
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    - (Format(KyuyoHen, "#,##0") _
                                    - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                                    * gtblKeisan(Act_Row).Riritu / 12 / 100))), "#,##0")
                KyuyoHen = 0
            End If
        Else
            ZanKyuyo_WORK = Format(lblZanKyuuyo.Caption, "#,##0")
        End If

        '* 賞与の残高計算および表示
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            NextYMD_WORK = gstrBonusYMD1
            BeforeYMD_WORK = DateAdd("yyyy", -1, gstrBonusYMD2)
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            NextYMD_WORK = gstrBonusYMD2
            BeforeYMD_WORK = gstrBonusYMD1
        Else
            NextYMD_WORK = DateAdd("yyyy", 1, gstrBonusYMD1)
            BeforeYMD_WORK = gstrBonusYMD2
        End If
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            If DateDiff("m", gstrBonusYMD1, gstrBonusYMD2) = 6 Then
                '***初回を考慮する
                If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                    If Month(DateAdd("y", 1, gstrSyoyoZen1)) <> Month(gstrSyoyoZen1) Then
                        ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                            - (Format(SyoyoHen, "#,##0") _
                                            - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                            * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                            + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21)) / 30) _
                                            * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                        SyoyoHen = 0
                    Else
                        ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                            - (Format(SyoyoHen, "#,##0") _
                                            - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                            * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                            + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) _
                                            + (Day(gstrSyoyoZen1) - 1 - 30)) / 30) _
                                            * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                        SyoyoHen = 0
                    End If
                Else
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * gtblKeisan(Act_Row).Riritu / 2 / 100)))
                    SyoyoHen = 0
               End If
            Else
                '***初回を考慮する
                If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * ((DateDiff("m", YusiYMD_WORK, gstrSyoyoZen1) * 30 _
                                        + IIf(Val(Format(YusiYMD_WORK, "dd")) >= 11, 6, 21) _
                                        + (10 - 1 - 30)) / 30) * gtblKeisan(Act_Row).Riritu / 12 / 100)))
                    SyoyoHen = 0
                Else
                    ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0") _
                                        - (Format(SyoyoHen, "#,##0") _
                                        - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                                        * gtblKeisan(Act_Row).Riritu _
                                        * DateDiff("m", BeforeYMD_WORK, NextYMD_WORK) / 12 / 100)))
                    SyoyoHen = 0
                End If
            End If
        Else
            ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
        End If
    Else
        '*******************
        '* 新計算式
        '*******************
        '* 給与の残高計算
        '* 今現在の年月日から計算される、次の天引き日を計算する。
        ' 当月貸付の場合は、翌月からの天引きとなる
        If Val(Format$(gdatSysDate, "yyyymm")) = Val(Format$(YusiYMD_WORK, "yyyymm")) Then
            NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd")   ' 翌月の２５日
        Else
            '過去日対応
            If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
                If Val(Format$(gdatSysDate, "dd")) >= 25 Then
                    NextYMD_WORK = Format(DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25"), "yyyy/mm/dd") ' 翌月の２５日
                Else
                    NextYMD_WORK = Format(Format$(gdatSysDate, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' 当月の２５日
                End If
            Else
                NextYMD_WORK = Format(Format$(seiYMD_WORK, "yyyy/mm") & "/25", "yyyy/mm/dd")  ' 当月の２５日
            End If
        End If
        ' 精算日が次回の天引き以降の場合、次回天引き後の元本を計算し表示する
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            '* 上記で求めた次ぎの天引き日から、利息計算のための前回の天引き日を計算する。
            ' １度も天引きされていない場合は、融資日（計算する場合は－１日する）となる
            If Format(lblZanKyuuyo.Caption, "#,##0") = Format(lblYuusiKyuuyo.Caption, "#,##0") Then
                BeforeYMD_WORK = DateAdd("y", -1, YusiYMD_WORK)
            Else
                BeforeYMD_WORK = Format(DateAdd("y", -1, Format(NextYMD_WORK, "yyyy/mm/") & "01"), "yyyy/mm/") & "25"
            End If
        
'10/24 Upd Start
'            ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                            - (Format(KyuyoHen, "#,##0") _
                            - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                            * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                            * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                             - (Format(KyuyoHen, "#,##0") _
                             - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                             * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                             * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            Else
                ZanKyuyo_WORK = Format(Format(lblZanKyuuyo.Caption, "#,##0") _
                             - (Format(KyuyoHen, "#,##0") _
                             - (Fix(Format(lblZanKyuuyo.Caption, "#,##0") _
                             * (DateDiff("y", BeforeYMD_WORK, NextYMD_WORK) _
                             * Riritu_Work)))), "#,##0")
            End If
'10/24 UpdEnd
            KyuyoHen = 0
            
'DEL 20100816 TR1006-001 IMZ NISHIKADO START
''ADD 20100225 0908047 NBC YOKOYAMA START
'            '残高調整(最終控除は普段の金額より少しだけ高い場合がある)
'            If ZanKyuyo_WORK < gtblKeisan(Act_Row).KyuyoHen Then
'                ZanKyuyo_WORK = 0
'            End If
''ADD 20100225 0908047 NBC YOKOYAMA END
'DEL 20100816 TR1006-001 IMZ NISHIKADO END

        Else
            ZanKyuyo_WORK = Format(lblZanKyuuyo.Caption, "#,##0")
        End If
    
        '* 賞与の残高計算
        '* 今現在の年月日から計算される、次の賞与天引き日を計算する。
        If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
            NextYMD_WORK = gstrBonusYMD1
            BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD2), "yyyy/mm/dd")
        ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
            NextYMD_WORK = gstrBonusYMD2
            BeforeYMD_WORK = gstrBonusYMD1
        Else
            NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyy/mm/dd")
            BeforeYMD_WORK = gstrBonusYMD2
        End If
'ADD 20100225 0908047 NBC YOKOYAMA START
'賞与控除バッチが1ヶ月遅くなったので修正
'前回賞与月とオペ月が同じだったら残高から一回分引く(BeforeYMD_WORKの前の回(nextの一年前)～Beforeまでの利息も計算)
        If Year(BeforeYMD_WORK) = Year(gdatSysDate) And _
           Month(BeforeYMD_WORK) = Month(gdatSysDate) Then
            Dim tmpNokoriSyoyo As Long

            tmpNokoriSyoyo = CLng(lblZanBonus.Caption)
            '前々回は次回の1年前
            BeforeBeforeYMD_WORK = DateAdd("yyyy", -1, NextYMD_WORK)
            '融資日以前になった場合は調整
            If BeforeBeforeYMD_WORK <= CDate(YusiYMD_WORK) Then
                BeforeBeforeYMD_WORK = DateAdd("y", -1, CDate(YusiYMD_WORK))
            End If

            lblZanBonus.Caption = Format(Format(lblZanBonus.Caption, "#,##0") _
                           - (Format(SyoyoHen, "#,##0") _
                           - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                           * (DateDiff("y", BeforeBeforeYMD_WORK, CVDate(BeforeYMD_WORK)) _
                           * Riritu_Work)))), "#,##0")
            '残高調整(最終控除は普段の金額より少しだけ高い場合がある)
            If CLng(lblZanBonus.Caption) < gtblKeisan(Act_Row).SyoyoHen Then
                lblZanBonus.Caption = "0"
            End If
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
        ' 精算日が次回の天引き以降の場合、次回天引き後の元本を計算し表示する
        If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
            ' １度も天引きされていない場合は、融資日（計算する場合は－１日する）となる
            If Format(lblZanBonus.Caption, "#,##0") = Format(lblYuusiBonus.Caption, "#,##0") Then
                BeforeYMD_WORK = Format(DateAdd("y", -1, YusiYMD_WORK), "yyyy/mm/dd")
            End If
'10/24 Upd Start
'            ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                         - (Format(SyoyoHen, "#,##0") _
                         - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                         * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                         * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            If DateDiff("y", YusiYMD_WORK, gstrSysChgYMD2) > 0 Then
                ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                             - (Format(SyoyoHen, "#,##0") _
                             - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                             * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                             * gtblKeisan(Act_Row).Riritu / 36500)))), "#,##0")
            Else
                ZanBonus_WORK = Format(Format(lblZanBonus.Caption, "#,##0") _
                             - (Format(SyoyoHen, "#,##0") _
                             - (Fix(Format(lblZanBonus.Caption, "#,##0") _
                             * (DateDiff("y", CVDate(BeforeYMD_WORK), CVDate(NextYMD_WORK)) _
                             * Riritu_Work)))), "#,##0")
            End If
'10/24 UpdEnd
            SyoyoHen = 0
'ADD 20100225 0908047 NBC YOKOYAMA START
            '残高調整(最終控除は普段の金額より少しだけ高い場合がある)
            If ZanBonus_WORK < gtblKeisan(Act_Row).SyoyoHen Then
                ZanBonus_WORK = 0
            End If
'ADD 20100225 0908047 NBC YOKOYAMA END
        Else
'MOD 20100225 0908047 NBC YOKOYAMA START
'            ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
            If ZanBonus_WORK = 0 Then
                ZanBonus_WORK = Format(lblZanBonus.Caption, "#,##0")
            End If
'MOD 20100225 0908047 NBC YOKOYAMA END
        End If
    
    End If
        
'10/24 Upd Start
    '給与分の利息計算
'    RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    If DateDiff("y", seiYMD_WORK, gstrSysChgYMD2) > 0 Then
        RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    Else
        RisokuKyuyo_WORK = Format(Fix(ZanKyuyo_WORK _
                        * (DateDiff("y", gstrKyuyoZen1, seiYMD_WORK) _
                        * Riritu_Work)), "###0")
    End If
'10/24 UpdEnd
    
    '賞与分の利息計算
'10/24 Upd Start
'    RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                            * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                            * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    If DateDiff("y", seiYMD_WORK, gstrSysChgYMD2) > 0 Then
        RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                        * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                        * gtblKeisan(Act_Row).Riritu / 36500)), "###0")
    Else
        RisokuBonus_WORK = Format(Fix(ZanBonus_WORK _
                        * (DateDiff("y", gstrSyoyoZen1, seiYMD_WORK) _
                        * Riritu_Work)), "###0")
    End If
'10/24 UpdEnd
    
    ZanKei_WORK = Val(ZanKyuyo_WORK) + Val(ZanBonus_WORK)
    RisokuKei_WORK = Val(RisokuKyuyo_WORK) + Val(RisokuBonus_WORK)
    glngNyukin = Val(ZanKei_WORK) + Val(RisokuKei_WORK)
'ADD 20100225 0908047 NBC YOKOYAMA START
    glngRisoku = Val(RisokuKei_WORK)    'SPで使用する利息を退避
'ADD 20100225 0908047 NBC YOKOYAMA END

    '過去日対応
    If Val(Format$(gdatSysDate, "yyyymm")) <= Val(Format$(seiYMD_WORK, "yyyymm")) Then
        If Val(Format$(gdatSysDate, "dd")) >= 25 Then
            NextYMD_WORK = DateAdd("m", 1, Format$(gdatSysDate, "yyyy/mm") & "/25")
        Else
            NextYMD_WORK = Format$(gdatSysDate, "yyyy/mm") & "/25"
        End If
    Else
        NextYMD_WORK = Format$(seiYMD_WORK, "yyyy/mm") & "/25"
    End If
'MOD 20100225 0908047 NBC YOKOYAMA START
'精算日1～24日の間のみ
'    If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
'        KBNKyuyo_WORK = "1"
'    Else
'        KBNKyuyo_WORK = "2"
'    End If
    If (Day(seiYMD_WORK) >= 1 And Day(seiYMD_WORK) <= 24) Then
        KBNKyuyo_WORK = "2"
    Else
        KBNKyuyo_WORK = "1"
    End If
'MOD 20100225 0908047 NBC YOKOYAMA END

    If DateDiff("y", gdatSysDate, gstrBonusYMD1) > 0 Then
        NextYMD_WORK = gstrBonusYMD1
''        BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD1), "yyyymmdd")
        BeforeYMD_WORK = Format(DateAdd("yyyy", -1, gstrBonusYMD1), "yyyy/mm/dd")
    ElseIf DateDiff("y", gdatSysDate, gstrBonusYMD2) > 0 Then
        NextYMD_WORK = gstrBonusYMD2
        BeforeYMD_WORK = gstrBonusYMD1
    Else
''        NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyymmdd")
        NextYMD_WORK = Format(DateAdd("yyyy", 1, gstrBonusYMD1), "yyyy/mm/dd")
        BeforeYMD_WORK = gstrBonusYMD2
    End If
    If DateDiff("y", NextYMD_WORK, seiYMD_WORK) >= 0 Then
        KBNBonus_WORK = "1"
    Else
        KBNBonus_WORK = "2"
    End If
    
    TenKyuyo_WORK = IIf(Val(KyuyoHen) = 0, 0, KyuyoHen)
'MOD 20100225 0908047 NBC YOKOYAMA START
'賞与天引は指定日が「06/01～06/14」と「11/16～11/30」の間のみ
'    TenBonus_WORK = IIf(DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD1) Or DatePart("m", seiYMD_WORK) = DatePart("m", gstrBonusYMD2), IIf(Val(SyoyoHen) = 0, 0, SyoyoHen), 0)
    If ((Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "0601" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "0614") _
     Or (Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) >= "1116" And Mid(Replace(seiYMD_WORK, "/", ""), 5, 4) <= "1130")) Then
        TenBonus_WORK = SyoyoHen
    Else
        TenBonus_WORK = 0
    End If
'MOD 20100225 0908047 NBC YOKOYAMA END
    If KBNKyuyo_WORK = "2" Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        glngNyukin = glngNyukin - TenKyuyo_WORK
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        If ZanKyuyo_WORK <= TenKyuyo_WORK Then
            '残高調整(最終控除は普段の金額より少しだけ高い場合がある)
            Dim tmpLastKyuyo As Long
            '最終月の天引額＝残元本＋(残元本×一日利息×前回天引日から次回天引日までの日数)
            tmpLastKyuyo = ZanKyuyo_WORK + Fix((ZanKyuyo_WORK * Riritu_Work * DateDiff("y", DateAdd("d", 1, gstrKyuyoZen), DateAdd("m", 1, gstrKyuyoZen) + 1)))
            glngNyukin = glngNyukin - tmpLastKyuyo
        Else
            glngNyukin = glngNyukin - TenKyuyo_WORK
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
    If KBNBonus_WORK = "2" Then
'DEL 20100225 0908047 NBC YOKOYAMA START
'        glngNyukin = glngNyukin - TenBonus_WORK
'DEL 20100225 0908047 NBC YOKOYAMA END
'ADD 20100225 0908047 NBC YOKOYAMA START
        If ZanBonus_WORK <= TenBonus_WORK Then
            '残高調整(最終控除は普段の金額より少しだけ高い場合がある)
            Dim tmpLastSyoyo As Long

'ADD 20100909 TR1009-001 IMZ SHIBUTANI START
            '前回天引日がない時は、前回天引日に融資日（計算上マイナス１日のもの）を設定して処理を行う
            If gstrSyoyoZen = "" Then
                gstrSyoyoZen = gstrSyoyoZen1
            End If
'ADD 20100909 TR1009-001 IMZ SHIBUTANI END

            '最終月の天引額＝残元本＋(残元本×一日利息×前回天引日から次回天引日までの日数)
            tmpLastSyoyo = ZanBonus_WORK + Fix(ZanBonus_WORK * Riritu_Work * DateDiff("y", DateAdd("d", 1, gstrSyoyoZen), CDate(NextYMD_WORK) + 1))
            glngNyukin = glngNyukin - tmpLastSyoyo
        Else
            glngNyukin = glngNyukin - TenBonus_WORK
        End If
'ADD 20100225 0908047 NBC YOKOYAMA END
    End If
    
'ADD 20100225 0908047 NBC YOKOYAMA START
    '最初に変えたLabelを元に戻す
    lblZanKyuuyo.Caption = strKyuyo_BK
    lblZanBonus.Caption = strSyoyo_BK
'ADD 20100225 0908047 NBC YOKOYAMA END
End Sub
