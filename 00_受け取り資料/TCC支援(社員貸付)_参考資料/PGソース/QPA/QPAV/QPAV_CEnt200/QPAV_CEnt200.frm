VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt200 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "部門マスタメンテナンス"
   ClientHeight    =   8580
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
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
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
      Height          =   435
      Index           =   0
      Left            =   4500
      TabIndex        =   2
      Top             =   6300
      Width           =   1215
   End
   Begin VB.CommandButton cmdExec 
      Caption         =   "修正"
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
      Left            =   5940
      TabIndex        =   3
      Top             =   6270
      Width           =   1215
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
      Height          =   435
      Index           =   2
      Left            =   7440
      TabIndex        =   4
      Top             =   6270
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   6240
      Left            =   90
      TabIndex        =   23
      Top             =   840
      Width           =   14220
      Begin FPSpread.vaSpread vaSpread1 
         Height          =   4725
         Left            =   4470
         TabIndex        =   1
         Top             =   360
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   8334
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
         MaxCols         =   2
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt200.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   840
      Left            =   90
      TabIndex        =   21
      Top             =   -30
      Width           =   14235
      Begin VB.ComboBox cobMiseCD 
         BeginProperty Font 
            Name            =   "ＭＳ Ｐゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   5340
         Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
         TabIndex        =   0
         Top             =   300
         Width           =   930
      End
      Begin VB.Label lblMiseCD 
         AutoSize        =   -1  'True
         Caption         =   "あああああああああああああ"
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
         Left            =   6420
         TabIndex        =   24
         Top             =   375
         Width           =   2145
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "店コード"
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
         Left            =   4560
         TabIndex        =   22
         Top             =   375
         Width           =   630
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
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7620
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
         TabIndex        =   5
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
         TabIndex        =   6
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
         TabIndex        =   10
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
         TabIndex        =   11
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
         TabIndex        =   7
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
         TabIndex        =   12
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
         TabIndex        =   13
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
         TabIndex        =   14
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
         TabIndex        =   15
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
         TabIndex        =   8
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
         TabIndex        =   16
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
         TabIndex        =   9
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
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   7170
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
         TabIndex        =   19
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   17
      Top             =   8205
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
            TextSave        =   "16:39"
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
Attribute VB_Name = "frmQPAV_CEnt200"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExec_Click(Index As Integer)
'*******************************************************************************************
'   登録・修正・削除ボタン押下処理
'*******************************************************************************************
    Dim i         As Long
    
    Act_Row = vaSpread1.ActiveRow
    ModeF = cmdExec(Index).Caption
    lblMsg.Caption = ""
    UnlF = 0
    frmQPAV_CEnt201.lblMiseCD(0).Caption = cobMiseCD.Text
    frmQPAV_CEnt201.lblMiseCD(1).Caption = lblMiseCD.Caption
    frmQPAV_CEnt201.cmdTouroku.Caption = cmdExec(Index).Caption
    frmQPAV_CEnt201.Show 1
    
    'データ再表示
    If UnlF <> 1 Then
        If gsubSPInit = True Then
            'ステータスバーメッセージ
            stbSystem.Panels.Item(1).Text = "処理中．．．"
            MousePointer = vbHourglass
            For i = 0 To 2
                cmdExec(i).Enabled = True
            Next i
        Else
            cmdExec(0).Enabled = True
            For i = 1 To 2
                cmdExec(i).Enabled = False
            Next i
            vaSpread1.MaxRows = 0
        End If
        stbSystem.Panels.Item(1).Text = ""
        MousePointer = vbDefault
    End If

End Sub

Private Sub Form_Load()
'*******************************************************************************************
'   Formロード
'*******************************************************************************************
    
    Me.Caption = "部門マスタメンテナンス (" & gstrCommandLine(8) & ")"
    
    '画面初期化
    Call subForminitialize

End Sub

Private Sub Form_Unload(Cancel As Integer)
'*****************************************************************************************
'   Form Unload
'*****************************************************************************************
    '排他解除
    Call gblnHaita_Unlock
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt200 = Nothing

End Sub

Private Sub Form_Activate()
'*******************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'*******************************************************************************************
    Dim ret  As Boolean
    
    If bInit_Flg = True Then
        MousePointer = vbHourglass
        Me.Enabled = False
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "部門マスタメンテナンス (" & gstrCommandLine(8) & ") " _
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
                                    , "部門マスタメンテナンス (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
                
        '排他解除
        Call gblnHaita_Unlock
        
        '排他制御
        If gblnHaita_Lock = False Then
            cobMiseCD.Enabled = False
            Me.Enabled = True
            MousePointer = vbDefault
            Exit Sub
        End If
        
        If gsubMiseCD_get = False Then
            'Msg = 店マスタに店コードが登録されていません。
            lblMsg.Caption = "WPOE27 " & gstrGetCodeMeisyo(odbDatabase, "E27", "WPO")
            cmdPFK(5).Enabled = False
        End If
        
       Me.Enabled = True
       MousePointer = vbDefault
       bInit_Flg = False          '初期 FLG オフ
    
    End If
            
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'*******************************************************************************************
'   FORM_KEYDOWN ファンクションキー設定
'*******************************************************************************************
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
            If cmdPFK(12).Enabled = True Then
                Call cmdPFK_Click(12)
            End If
        Case vbKeyDelete    'DELキーを押した時
            Call Form_KeyPress(46)
    End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'*******************************************************************************************
'   FORM_KEYPRESS
'*******************************************************************************************
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    'ENTER Beep音消去
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub

Private Sub cmdPFK_Click(Index As Integer)
'*******************************************************************************************
'   各ファンクションキー機能
'*******************************************************************************************
    
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
            '店コード設定
            Call subForminitialize
            If gsubMiseCD_get = False Then
                'Msg = 店マスタに店コードが登録されていません。
                lblMsg.Caption = "WPOE27 " & gstrGetCodeMeisyo(odbDatabase, "E27", "WPO")
                cmdPFK(5).Enabled = False
            End If
            cobMiseCD.SetFocus
    End Select
    
End Sub

Private Sub subForminitialize()
'*******************************************************************************************
'   画面初期化
'*******************************************************************************************
    Dim i As Integer
    
    lblMiseCD.Caption = ""
    cmdPFK(5).Enabled = False
    cmdPFK(12).Enabled = False
    cobMiseCD.BackColor = vbWhite
    cobMiseCD.Enabled = True
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""

    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    vaSpread1.MaxRows = 0
    
    For i = 0 To 2
        cmdExec(i).Enabled = False
    Next i
    
End Sub

Private Sub cobmisecd_Click()
'*******************************************************************************************
'    店コード 変更
'*******************************************************************************************
    Dim i As Long
    
    cobMiseCD.BackColor = vbWhite
    lblMsg.Caption = ""
    
    i = cobMiseCD.ListIndex
    lblMiseCD.Caption = gtblMise(i + 1).NM
    cmdPFK(5).Enabled = True
    
End Sub

Private Sub subCmdJikkou()
'*******************************************************************************************
'   実行ボタン処理
'*******************************************************************************************
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String
    Dim i         As Long
    
    If cobMiseCD.Text = "" Then
        'Msg = 店コードを選択してください。
        lblMsg.Caption = "WPOE24 " & gstrGetCodeMeisyo(odbDatabase, "E24", "WPO")
        cobMiseCD.BackColor = vbRed
        Exit Sub
    End If
    
    cobMiseCD.Enabled = False
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    MousePointer = vbHourglass
    
    'データ取得
    If gsubSPInit = True Then
        For i = 0 To 2
            cmdExec(i).Enabled = True
        Next i
    Else
        cmdExec(0).Enabled = True
        For i = 1 To 2
            cmdExec(i).Enabled = False
        Next i
    End If
    stbSystem.Panels.Item(1).Text = ""
    MousePointer = vbDefault
    cmdPFK(5).Enabled = False
    cmdPFK(12).Enabled = True

End Sub

Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)
'*******************************************************************************************
'   エラーメッセージボックスを表示する。
'*******************************************************************************************
    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("部門マスタメンテナンス", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "yyyy-mm-dd hh:nn:ss"), _
              frmQPAV_CEnt200.Name, _
              strErrCode, _
              strErrMsg)

End Sub
