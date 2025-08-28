VERSION 5.00
Begin VB.Form frmQPAV_CEnt011 
   Caption         =   "ï‘çœäzïœçX"
   ClientHeight    =   4755
   ClientLeft      =   60
   ClientTop       =   315
   ClientWidth     =   7470
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   4755
   ScaleWidth      =   7470
   StartUpPosition =   2  'âÊñ ÇÃíÜâõ
   Begin VB.PictureBox Picture1 
      Height          =   2355
      Left            =   150
      ScaleHeight     =   2295
      ScaleWidth      =   7095
      TabIndex        =   11
      Top             =   870
      Width           =   7155
      Begin VB.TextBox txt_Syouyo 
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  'µÃå≈íË
         Left            =   2925
         TabIndex        =   3
         Top             =   1530
         Width           =   1770
      End
      Begin VB.TextBox txt_Month 
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  'µÃå≈íË
         Left            =   4005
         MaxLength       =   2
         TabIndex        =   1
         Top             =   510
         Width           =   420
      End
      Begin VB.TextBox txt_Kyuuyo 
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  'µÃå≈íË
         Left            =   2925
         TabIndex        =   2
         Top             =   1020
         Width           =   1755
      End
      Begin VB.TextBox txt_Year 
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  'µÃå≈íË
         Left            =   2925
         TabIndex        =   0
         Top             =   510
         Width           =   645
      End
      Begin VB.Label Label11 
         Alignment       =   1  'âEëµÇ¶
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  'ìßñæ
         Caption         =   "ããó^"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   1860
         TabIndex        =   17
         Top             =   1080
         Width           =   450
      End
      Begin VB.Label Label5 
         Alignment       =   1  'âEëµÇ¶
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  'ìßñæ
         Caption         =   "ïœçXåé"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
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
         Left            =   1680
         TabIndex        =   15
         Top             =   570
         Width           =   675
      End
      Begin VB.Label Label18 
         Alignment       =   1  'âEëµÇ¶
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  'ìßñæ
         Caption         =   "è‹ó^"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   1875
         TabIndex        =   14
         Top             =   1590
         Width           =   450
      End
      Begin VB.Label Label19 
         Alignment       =   2  'íÜâõëµÇ¶
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  'ìßñæ
         Caption         =   "îN"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   3645
         TabIndex        =   13
         Top             =   570
         Width           =   255
      End
      Begin VB.Label Label22 
         Alignment       =   2  'íÜâõëµÇ¶
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  'ìßñæ
         Caption         =   "åé"
         BeginProperty Font 
            Name            =   "ÇlÇr ÉSÉVÉbÉN"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   4530
         TabIndex        =   12
         Top             =   570
         Width           =   255
      End
   End
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "ÇlÇr ÉSÉVÉbÉN"
         Size            =   8.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   150
      ScaleHeight     =   345
      ScaleWidth      =   7095
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   3360
      Width           =   7155
      Begin VB.Label lblMsg 
         BackStyle       =   0  'ìßñæ
         BeginProperty Font 
            Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
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
         TabIndex        =   8
         Top             =   30
         Width           =   7095
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "ñﬂÇÈ"
      BeginProperty Font 
         Name            =   "ÇlÇr ÉSÉVÉbÉN"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   5520
      TabIndex        =   6
      Top             =   4080
      Width           =   1350
   End
   Begin VB.CommandButton cmdTorikesi 
      Caption         =   "éÊè¡"
      BeginProperty Font 
         Name            =   "ÇlÇr ÉSÉVÉbÉN"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   3060
      TabIndex        =   5
      Top             =   4080
      Width           =   1350
   End
   Begin VB.CommandButton cmdTouroku 
      Caption         =   "ìoò^"
      BeginProperty Font 
         Name            =   "ÇlÇr ÉSÉVÉbÉN"
         Size            =   11.25
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   660
      TabIndex        =   4
      Top             =   4080
      Width           =   1350
   End
   Begin VB.Label Label5 
      Alignment       =   1  'âEëµÇ¶
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  'ìßñæ
      Caption         =   "é–àıÉRÅ[Éh"
      BeginProperty Font 
         Name            =   "ÇlÇr ÉSÉVÉbÉN"
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
      Left            =   270
      TabIndex        =   16
      Top             =   540
      Width           =   975
   End
   Begin VB.Label lblShimei 
      BackStyle       =   0  'ìßñæ
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
         Size            =   9.75
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   225
      Left            =   2370
      TabIndex        =   10
      Top             =   540
      Width           =   1605
   End
   Begin VB.Label lblShainCD 
      BackStyle       =   0  'ìßñæ
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "ÇlÇr ÇoÉSÉVÉbÉN"
         Size            =   9.75
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   225
      Left            =   1380
      TabIndex        =   9
      Top             =   540
      Width           =   885
   End
End
Attribute VB_Name = "frmQPAV_CEnt011"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBack_Click()
    Unload Me
End Sub

Private Sub cmdTorikesi_Click()

    If cmdTouroku.Caption = "ìoò^" Then
        txt_Year.Text = ""
        txt_Month.Text = ""
        txt_Kyuuyo.Text = ""
        txt_Syouyo.Text = ""
    ElseIf cmdTouroku.Caption = "èCê≥" Then
        txt_Year.Text = Left(gVarSpdGetText(frmQPAV_CEnt010.sprList, 1, Act_Row), 4)
        txt_Month.Text = Right(gVarSpdGetText(frmQPAV_CEnt010.sprList, 1, Act_Row), 2)
        txt_Kyuuyo.Text = gVarSpdGetText(frmQPAV_CEnt010.sprList, 2, Act_Row)
        txt_Syouyo.Text = gVarSpdGetText(frmQPAV_CEnt010.sprList, 3, Act_Row)
    End If
    txt_Year.BackColor = vbWhite
    txt_Month.BackColor = vbWhite
    txt_Kyuuyo.BackColor = vbWhite
    txt_Syouyo.BackColor = vbWhite
    lblMsg.Caption = ""
    txt_Year.SetFocus

End Sub

Private Sub cmdTouroku_Click()
    Dim i As Long
        
    If cmdTouroku.Caption <> "çÌèú" Then
        If Not funcChk Then                 'ì¸óÕÉ`ÉFÉbÉN
            Exit Sub
        End If
    End If
    
    'ïœêîÇ…ëﬁî
    gstrHenkoYM_B = Format(gVarSpdGetText(frmQPAV_CEnt010.sprList, 1, Act_Row), "yyyymm")
    gstrHenkoYM = Format(txt_Year, "0000") & Format(txt_Month, "00")
    glngKyuyo = Format(txt_Kyuuyo, "#0")
    glngSyoyo = Format(txt_Syouyo, "#0")
    
    Select Case cmdTouroku.Caption
        Case "ìoò^"
            If gfuncHenkoChk = False Then
                'Msg = ÇÕä˘Ç…ìoò^Ç≥ÇÍÇƒÇ¢Ç‹Ç∑ÅB
                lblMsg.Caption = "WPOE02 Ç±ÇÃïœçXîNåé" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
                txt_Year.BackColor = vbRed
                txt_Month.BackColor = vbRed
                txt_Year.SetFocus
                Exit Sub
            End If
            If MsgBox("ìoò^ÇµÇƒÇÊÇÎÇµÇ¢Ç≈Ç∑Ç©ÅH", vbQuestion + vbOKCancel, "ï‘çœäzïœçX") = vbCancel Then
                Exit Sub
            End If
            If gfuncHenkoAdd = False Then Exit Sub
        Case "èCê≥"
            If gstrHenkoYM <> gstrHenkoYM_B Then
                If gfuncHenkoChk = False Then
                    'Msg = ÇÕä˘Ç…ìoò^Ç≥ÇÍÇƒÇ¢Ç‹Ç∑ÅB
                    lblMsg.Caption = "WPOE02 Ç±ÇÃïœçXîNåé" & gstrGetCodeMeisyo(odbDatabase, "E02", "WPO")
                    txt_Year.BackColor = vbRed
                    txt_Month.BackColor = vbRed
                    txt_Year.SetFocus
                    Exit Sub
                End If
            End If
            If MsgBox("èCê≥ÇµÇƒÇÊÇÎÇµÇ¢Ç≈Ç∑Ç©ÅH", vbQuestion + vbOKCancel, "ï‘çœäzïœçX") = vbCancel Then
                Exit Sub
            End If
            If gfuncHenkoUpd = False Then Exit Sub
        Case "çÌèú"
            If MsgBox("çÌèúÇµÇƒÇÊÇÎÇµÇ¢Ç≈Ç∑Ç©ÅH", vbQuestion + vbOKCancel, "ï‘çœäzïœçX") = vbCancel Then
                Exit Sub
            End If
            If gfuncHenkoDel = False Then Exit Sub
    End Select
    Unload Me

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyReturn Then
        KeyCode = 0
        SendKeys "{TAB}"
    End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If
    
    lblMsg.Caption = ""
    
    txt_Year.BackColor = vbWhite
    txt_Month.BackColor = vbWhite
    txt_Kyuuyo.BackColor = vbWhite
    txt_Syouyo.BackColor = vbWhite

End Sub

'--Start Of ADD 2006.04.28 by NBC.Nomura >> ã@ñßèÓïÒÇÃàÛç¸ÅEÉRÉsÅ[êßå¿é¿é{ <<
Private Sub Form_Load()

    Dim clsActX490 As QSAV_ActX490.ActX490C

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
'--Finish Of ADD 2006.04.28 by NBC.Nomura >> ã@ñßèÓïÒÇÃàÛç¸ÅEÉRÉsÅ[êßå¿é¿é{ <<

Private Sub txt_Kyuuyo_GotFocus()
    Call gsubSelectText(txt_Kyuuyo)
End Sub

Private Sub txt_Kyuuyo_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txt_Month_Change()
    Call gsubMaxCharSkipEX(txt_Month, 2)
End Sub

Private Sub txt_Month_GotFocus()
    Call gsubSelectText(txt_Month)
End Sub

Private Sub txt_Month_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txt_Syouyo_GotFocus()
    Call gsubSelectText(txt_Syouyo)
End Sub

Private Sub txt_Syouyo_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

Private Sub txt_Year_Change()
    Call gsubMaxCharSkipEX(txt_Year, 4)
End Sub

Private Sub txt_Year_GotFocus()
    Call gsubSelectText(txt_Year)
End Sub

Private Sub txt_Year_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'*************************************************************************************************
'*ì¸óÕÉ`ÉFÉbÉNèàóù
'*************************************************************************************************
Private Function funcChk() As Boolean

    Dim sy As String, hy As String
    
    funcChk = False
    
    If IsNull(txt_Year.Text) Or Trim(txt_Year.Text) = "" Then
        'Msg = Ç™ì¸óÕÇ≥ÇÍÇƒÇ¢Ç‹ÇπÇÒÅB
        lblMsg.Caption = "WPOE01 ïœçXîNåé" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txt_Year.BackColor = vbRed
        txt_Year.SetFocus
        Exit Function
    End If
    txt_Year.Text = Format(txt_Year.Text, "0000")
    
    If IsNull(txt_Month.Text) Or Trim(txt_Month.Text) = "" Then
        'Msg = Ç™ì¸óÕÇ≥ÇÍÇƒÇ¢Ç‹ÇπÇÒÅB
        lblMsg.Caption = "WPOE01 ïœçXîNåé" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txt_Month.BackColor = vbRed
        txt_Month.SetFocus
        Exit Function
    End If
    txt_Month.Text = Format(txt_Month.Text, "00")
    
    If Not IsDate(txt_Year.Text & "," & txt_Month.Text & "," & "01") Then
        'Msg = ÇÕì˙ïtÇ≈ì¸óÕÇµÇƒâ∫Ç≥Ç¢ÅB
        lblMsg.Caption = "WPOE03 ïœçXîNåé" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txt_Year.BackColor = vbRed
        txt_Month.BackColor = vbRed
        txt_Year.SetFocus
        Exit Function
    End If

''''''Å´2002/03/07 ì¸óÕÉ`ÉFÉbÉNí«â¡
    'ìñåéà»ëOÇÕïœçXïsâ¬î\Å@éwíËÇ≈Ç´ÇÈÇÃÇÕñ¢óàåéÇÃÇ›
    If CLng(Format(CDate(txt_Year.Text & "," & txt_Month.Text & "," & "01"), "yyyymm")) <= CLng(Format(gdatSysDate, "yyyymm")) Then
        lblMsg.Caption = "ìñåéà»ëOÇÃì˙ïtÇÕéwíËÇ≈Ç´Ç‹ÇπÇÒÅB"
        txt_Year.BackColor = vbRed
        txt_Month.BackColor = vbRed
        txt_Year.SetFocus
        Exit Function
    End If
''''''Å™2002/03/07 ì¸óÕÉ`ÉFÉbÉNí«â¡


    sy = Left(ShimeYMD, 4) & "/" & Mid(ShimeYMD, 5, 2) & "/" & Mid(ShimeYMD, 7, 2)
    hy = DateAdd("m", 1, txt_Year.Text & "/" & txt_Month.Text & "/01")
    hy = Format(DateAdd("y", -1, hy), "yyyy/mm/dd")
    If DateDiff("y", hy, sy) > 0 Then
        'Msg = í˜Çﬂì˙Åi@Åjà»ëOÇÃì˙ïtÇÕì¸óÕÇ≈Ç´Ç‹ÇπÇÒÅB
        lblMsg.Caption = "WPOE09 " & gstrGetCodeMeisyoIn(odbDatabase, "E09", "WPO", sy)
        txt_Year.BackColor = vbRed
        txt_Month.BackColor = vbRed
        txt_Year.SetFocus
        Exit Function
    End If
    
    
    If IsNull(txt_Kyuuyo.Text) Or Trim(txt_Kyuuyo.Text) = "" Then
        txt_Kyuuyo.Text = "0"
    End If
    txt_Kyuuyo.Text = Format(txt_Kyuuyo.Text, "#,##0")
    
    If IsNull(txt_Syouyo.Text) Or Trim(txt_Syouyo.Text) = "" Then
        txt_Syouyo.Text = "0"
    End If
    txt_Syouyo.Text = Format(txt_Syouyo.Text, "#,##0")
        
    funcChk = True

End Function

