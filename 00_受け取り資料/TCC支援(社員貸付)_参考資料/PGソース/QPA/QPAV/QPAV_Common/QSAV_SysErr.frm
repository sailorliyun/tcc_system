VERSION 5.00
Begin VB.Form QSAV_SysErr 
   BorderStyle     =   3  'å≈íË¿ﬁ≤±€∏ﬁ
   Caption         =   "ÉVÉXÉeÉÄÉGÉâÅ["
   ClientHeight    =   4845
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7380
   Icon            =   "QSAV_SysErr.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4845
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'âÊñ ÇÃíÜâõ
   Begin VB.CommandButton cmdOK 
      Caption         =   "ÇnÇj"
      BeginProperty Font 
         Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
         Size            =   12
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   6000
      TabIndex        =   0
      Top             =   4320
      Width           =   1245
   End
   Begin VB.PictureBox Picture1 
      Height          =   4095
      Left            =   120
      ScaleHeight     =   4035
      ScaleWidth      =   7065
      TabIndex        =   1
      Top             =   120
      Width           =   7125
      Begin VB.Frame fraErrJouhou 
         Caption         =   "ÉGÉâÅ[èÓïÒ"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2415
         Left            =   360
         TabIndex        =   10
         Top             =   750
         Width           =   6345
         Begin VB.PictureBox Picture2 
            BorderStyle     =   0  'Ç»Çµ
            Enabled         =   0   'False
            Height          =   1455
            Left            =   1350
            ScaleHeight     =   1455
            ScaleWidth      =   4935
            TabIndex        =   19
            Top             =   870
            Width           =   4935
            Begin VB.TextBox txtErrNaiyou 
               BeginProperty Font 
                  Name            =   "ÇlÇr ÉSÉVÉbÉN"
                  Size            =   9.75
                  Charset         =   128
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   1365
               Left            =   240
               MultiLine       =   -1  'True
               TabIndex        =   20
               Text            =   "QSAV_SysErr.frx":0442
               Top             =   0
               Width           =   4425
            End
         End
         Begin VB.Label Label14 
            BeginProperty Font 
               Name            =   "ÇlÇr ÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   2640
            TabIndex        =   16
            Top             =   1020
            Width           =   2085
         End
         Begin VB.Label lblErrCd 
            Caption         =   "XXXXXXXXXX"
            BeginProperty Font 
               Name            =   "ÇlÇr ÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   1620
            TabIndex        =   15
            Top             =   570
            Width           =   4350
         End
         Begin VB.Label lblFormMei 
            Caption         =   "XXXXXXXXXX"
            BeginProperty Font 
               Name            =   "ÇlÇr ÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   1620
            TabIndex        =   14
            Top             =   270
            Width           =   4350
         End
         Begin VB.Label Label7 
            Caption         =   "ÉGÉâÅ[ì‡óe"
            BeginProperty Font 
               Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   210
            TabIndex        =   13
            Top             =   870
            Width           =   975
         End
         Begin VB.Label Label6 
            Caption         =   "ÉGÉâÅ[ÉRÅ[Éh"
            BeginProperty Font 
               Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   210
            TabIndex        =   12
            Top             =   570
            Width           =   1185
         End
         Begin VB.Label Label5 
            Caption         =   "î≠ê∂å¬èä"
            BeginProperty Font 
               Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   210
            TabIndex        =   11
            Top             =   300
            Width           =   795
         End
      End
      Begin VB.Label Label16 
         Caption         =   "òAóçÇµÇƒÇ≠ÇæÇ≥Ç¢ÅB"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1980
         TabIndex        =   18
         Top             =   3630
         Width           =   1785
      End
      Begin VB.Label Label15 
         Caption         =   "ÉRÉÅÉìÉgÅFÉnÅ[ÉhÉRÉsÅ[ÇéÊÇ¡ÇƒÉVÉXÉeÉÄä«óùé“Ç…"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1020
         TabIndex        =   17
         Top             =   3360
         Width           =   4485
      End
      Begin VB.Label lblNichiji 
         Caption         =   "9999-99-99 99:99:99"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4650
         TabIndex        =   9
         Top             =   390
         Width           =   2085
      End
      Begin VB.Label lblTanmatuID 
         Caption         =   "XXXXXXXXXXXXXXXXXXXX"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4650
         TabIndex        =   8
         Top             =   120
         Width           =   2085
      End
      Begin VB.Label lblUserID 
         Caption         =   "XXXXXXXX"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1860
         TabIndex        =   7
         Top             =   390
         Width           =   1575
      End
      Begin VB.Label lblPgID 
         Caption         =   "XXXXXXXXXXXXXXX"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1860
         TabIndex        =   6
         Top             =   150
         Width           =   1575
      End
      Begin VB.Label Label4 
         Caption         =   "ì˙éû"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3690
         TabIndex        =   5
         Top             =   420
         Width           =   405
      End
      Begin VB.Label Label3 
         Caption         =   "í[ññÇhÇc"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3690
         TabIndex        =   4
         Top             =   150
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "ÉÜÅ[ÉUÅ[ÇhÇc"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   360
         TabIndex        =   3
         Top             =   390
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "ÉvÉçÉOÉâÉÄÇhÇc"
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   360
         TabIndex        =   2
         Top             =   150
         Width           =   1395
      End
   End
End
Attribute VB_Name = "QSAV_SysErr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()

    Unload Me

End Sub

Public Sub subSysErr(strPgID As String, strUserID As String, strTanmatuID As String, strNichiji As String _
                 , strFormMei As String, strErrCd As String, strErrNaiyou As String)
    
    lblPgID = strPgID
    lblUserID = strUserID
    lblTanmatuID = strTanmatuID
    lblNichiji = strNichiji
    lblFormMei = strFormMei
    lblErrCd = strErrCd
    txtErrNaiyou = Mid$(strErrNaiyou, 1, 40) & vbCr & vbLf _
                 & Mid$(strErrNaiyou, 41, 80) & vbCr & vbLf _
                 & Mid$(strErrNaiyou, 81, 120) & vbCr & vbLf _
                 & Mid$(strErrNaiyou, 121, 140)
    
    Me.Show vbModal
    
End Sub
