VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt082 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "名寄せ入力"
   ClientHeight    =   8250
   ClientLeft      =   585
   ClientTop       =   1500
   ClientWidth     =   14325
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form5"
   LockControls    =   -1  'True
   ScaleHeight     =   8250
   ScaleWidth      =   14325
   StartUpPosition =   2  '画面の中央
   Begin MSComctlLib.ProgressBar prgBar 
      Height          =   240
      Left            =   4245
      TabIndex        =   23
      Top             =   7980
      Visible         =   0   'False
      Width           =   3780
      _ExtentX        =   6668
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   330
      Left            =   0
      TabIndex        =   22
      Top             =   7920
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
            TextSave        =   "2006/04/21"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "18:53"
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox Picture1 
      Height          =   7005
      Left            =   0
      ScaleHeight     =   6945
      ScaleWidth      =   14265
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   0
      Width           =   14325
      Begin VB.Frame Frame1 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   810
         Left            =   75
         TabIndex        =   20
         Top             =   0
         Width           =   14115
         Begin VB.TextBox txtKaiinsimeiKana 
            BackColor       =   &H00FFFFFF&
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
            IMEMode         =   6  '半角ｶﾀｶﾅ
            Left            =   5130
            MaxLength       =   30
            TabIndex        =   0
            Top             =   285
            Width           =   3330
         End
         Begin VB.Label lblLabel 
            Alignment       =   2  '中央揃え
            AutoSize        =   -1  'True
            Caption         =   "社員氏名(ｶﾅ)"
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
            Index           =   2
            Left            =   3495
            TabIndex        =   21
            Top             =   345
            Width           =   1395
         End
      End
      Begin VB.Frame Frame2 
         Appearance      =   0  'ﾌﾗｯﾄ
         ForeColor       =   &H80000008&
         Height          =   5520
         Left            =   75
         TabIndex        =   19
         Top             =   840
         Width           =   14115
         Begin FPSpread.vaSpread sprList 
            Height          =   4770
            Left            =   405
            TabIndex        =   1
            Top             =   420
            Width           =   13305
            _Version        =   196608
            _ExtentX        =   23469
            _ExtentY        =   8414
            _StockProps     =   64
            MaxCols         =   8
            MaxRows         =   20
            OperationMode   =   2
            ScrollBarExtMode=   -1  'True
            ScrollBars      =   2
            SelectBlockOptions=   0
            SpreadDesigner  =   "QPAV_CEnt082.frx":0000
            VisibleCols     =   500
            VisibleRows     =   500
         End
      End
      Begin VB.CommandButton cmdExec 
         Caption         =   "決 定"
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   11.25
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   75
         TabIndex        =   2
         Top             =   6420
         Width           =   1230
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
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   7440
      Width           =   14325
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F12:取消"
         Height          =   375
         Index           =   12
         Left            =   13080
         TabIndex        =   7
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
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F10:前画面"
         Height          =   375
         Index           =   10
         Left            =   10710
         TabIndex        =   6
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
         Index           =   8
         Left            =   8340
         TabIndex        =   15
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
         Index           =   6
         Left            =   5970
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F5:実行"
         Height          =   375
         Index           =   5
         Left            =   4785
         TabIndex        =   5
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
         TabIndex        =   12
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
         Index           =   3
         Left            =   2415
         TabIndex        =   11
         TabStop         =   0   'False
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Caption         =   "F2:ﾊｰﾄﾞｺﾋﾟｰ"
         Height          =   375
         Index           =   2
         Left            =   1230
         TabIndex        =   4
         Top             =   30
         Width           =   1155
      End
      Begin VB.CommandButton cmdPFK 
         Height          =   375
         Index           =   1
         Left            =   45
         TabIndex        =   3
         Top             =   30
         Width           =   1155
      End
   End
   Begin VB.PictureBox picMsg 
      BackColor       =   &H00FFFFFF&
      Height          =   405
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   14265
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   7020
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
         Left            =   30
         TabIndex        =   9
         Top             =   30
         Width           =   12405
      End
   End
End
Attribute VB_Name = "frmQPAV_CEnt082"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private blnInit_Flg       As Boolean     '初期フラグ
Private strSyainMyouji    As String      '会員氏名カナ名字　名寄せ検索用変数
Private strSyainNamae     As String      '会員氏名カナ名前　名寄せ検索用変数
'******************************************************************************
'*    FORM_LOAD イベント
'******************************************************************************
Private Sub Form_Load()
    
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX490 As QSAV_ActX490.ActX490C
    
    Me.Caption = "名寄せ検索 (" & gstrCommandLine(8) & ")"
    
    '■画面初期化
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
    
    '名寄せﾌﾗｸﾞ初期化
    gblnNayoseFlg = False
    
End Sub
'******************************************************************************
'*    FORM UNLOAD イベント
'******************************************************************************
Private Sub Form_Unload(CANCEL As Integer)
End Sub
'******************************************************************************
'*    FORM_ACTIVATE イベント
'******************************************************************************
Private Sub Form_Activate()
End Sub
'******************************************************************************
'*    FORM_KEYDOWN ファンクションキー設定
'******************************************************************************
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
        Case vbKeyUp
            Call subErrKaijo
        Case vbKeyDown
            Call subErrKaijo
        Case vbKeyRight
            Call subErrKaijo
        Case vbKeyLeft
            Call subErrKaijo
    End Select

End Sub
'******************************************************************************
'*    FORM_KEYPRESS イベント
'******************************************************************************
Private Sub Form_KeyPress(KeyAscii As Integer)

    'ENTER Beep音消去
    Call subErrKaijo
        
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
    End If

End Sub
'******************************************************************************
'*    各ファンクションキー機能
'******************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
'ADD 2006.04.28 by NBC.Nomura >> 機密情報の印刷・コピー制限実施 <<
    Dim clsActX1001     As QSAV_ActX1001.ActX1001C
    
    Select Case Index
        Case 1  'メニュー
'            Unload Me
'            Exit Sub
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
            Call subcmdPFK5
        Case 10 '前画面
            Unload Me
            Exit Sub
        Case 12 '取消
            Call subFormInitialize
            txtKaiinsimeiKana.SetFocus
    End Select
    
End Sub
'******************************************************************************
'*    画面初期化
'******************************************************************************
Private Sub subFormInitialize()
 Dim intX As Integer
 
    '各表示項目クリア
    txtKaiinsimeiKana.Text = ""
    lblMsg.Caption = ""
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0

    cmdPFK(5).Enabled = True
    cmdExec.Enabled = False
    
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    '各コントロール制御
    txtKaiinsimeiKana.Enabled = True

End Sub
'******************************************************************************
'*    実行ボタン処理
'******************************************************************************
Private Sub subcmdPFK5()
 Dim intNameSpcPst As Integer 'スペース位置
 Dim intNameLen    As Integer '文字数
 Dim strSyainName  As String

    cmdPFK(5).SetFocus

    '■入力チェック
    If txtKaiinsimeiKana.Text = "" Then
        lblMsg.Caption = "社員氏名（カナ）を入力してください。"
        txtKaiinsimeiKana.BackColor = vbRed
        txtKaiinsimeiKana.Enabled = True
        txtKaiinsimeiKana.SetFocus
        Exit Sub
    Else
        strSyainName = Trim$(txtKaiinsimeiKana)
    End If
    
    If InStr(strSyainName, " ") = 0 Then
        strSyainMyouji = strSyainName
        strSyainNamae = strSyainName
    Else
        intNameSpcPst = InStr(strSyainName, " ")
        intNameLen = Len(strSyainName)
        strSyainMyouji = Mid(strSyainName, 1, intNameSpcPst - 1)
        strSyainNamae = Mid(strSyainName, intNameSpcPst + 1, intNameLen - intNameSpcPst)
    End If
        
    '一覧が表示されるまで実行ﾎﾞﾀﾝ,名寄せを使用不可・マウスポインター(砂時計)
    cmdPFK(5).Enabled = False
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
    
    '■名寄せ検索用SP呼出
    If fncblnSyainSearch = False Then
        prgBar.Visible = False
        cmdPFK(5).Enabled = True
        Screen.MousePointer = vbNormal
        stbSystem.Panels.Item(1).Text = ""
        cmdExec.Enabled = False
        txtKaiinsimeiKana.SetFocus
        txtKaiinsimeiKana.Enabled = True
        Exit Sub
    End If
    
    prgBar.Visible = False
    cmdPFK(5).Enabled = False
    Screen.MousePointer = vbNormal
    stbSystem.Panels.Item(1).Text = ""
    cmdExec.Enabled = True
    cmdExec.SetFocus
    txtKaiinsimeiKana.Enabled = False
    
        
End Sub
'******************************************************************************
'*    エラーメッセージボックスを表示する。
'******************************************************************************
Public Sub subShowErrorMsgBox(strErrCode As String, strErrMsg As String)

    Load QSAV_SysErr
    Call QSAV_SysErr.subSysErr("名寄せ入力", _
              gstrCommandLine(1), _
              gstrCommandLine(5), _
              Format(Now, "YYYY/MM/DD HH:MM:SS"), _
              frmQPAV_CEnt082.Name, _
              strErrCode, _
              strErrMsg)

End Sub
'******************************************************************************
'*    エラー解除処理
'******************************************************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtKaiinsimeiKana.BackColor = vbWhite
End Sub



Private Sub sprList_DblClick(ByVal Col As Long, ByVal Row As Long)
    Call cmdExec_Click
End Sub

'******************************************************************************
'*    テキスト選択
'******************************************************************************
Private Sub txtKaiinsimeiKana_GotFocus()
    Call gsubSelectText(txtKaiinsimeiKana)
End Sub
'******************************************************************************
'*    名寄せ検索用SP
'******************************************************************************
Private Function fncblnSyainSearch() As Boolean
 Dim strSQL            As String
 Dim lngSprStartCnt    As Long
 Dim lngSprEndCnt      As Long
 Dim i                 As Long
 Dim lngSpCnt          As Long

 Const cnslngAryCnt As Long = 100    '配列の件数  及び、１回で取得するＭＡＸの件数

On Error GoTo errfncblnSyainSearch

    fncblnSyainSearch = False

    lngSpCnt = 0

    '社員氏名カナ名字
    odbDatabase.Parameters.Add "InStrSyainMyouji", strSyainMyouji, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainMyouji").ServerType = ORATYPE_VARCHAR2
    '社員氏名カナ名前
    odbDatabase.Parameters.Add "InStrSyainName", strSyainNamae, ORAPARM_INPUT
    odbDatabase.Parameters("InStrSyainName").ServerType = ORATYPE_VARCHAR2
    '最大配列格納件数
    odbDatabase.Parameters.Add "InNumMaxRec", cnslngAryCnt, ORAPARM_INPUT
    odbDatabase.Parameters("InNumMaxRec").ServerType = ORATYPE_NUMBER
    '呼出回数
    odbDatabase.Parameters.Add "IoNumSpCnt", lngSpCnt, ORAPARM_BOTH
    odbDatabase.Parameters("IoNumSpCnt").ServerType = ORATYPE_NUMBER
    '総検索件数
    odbDatabase.Parameters.Add "OtNumRecCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumRecCount").ServerType = ORATYPE_NUMBER
    '配列格納件数
    odbDatabase.Parameters.Add "OtNumAryCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumAryCount").ServerType = ORATYPE_NUMBER
    'EndFlg
    odbDatabase.Parameters.Add "OtStrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtStrEndFlg").ServerType = ORATYPE_VARCHAR2
    '社員データ配列
    odbDatabase.Parameters.AddTable "OtStrDatAryN", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnslngAryCnt, 200    '100行・200桁

             strSQL = "BEGIN QPAP_CEnt080PkG.QPAP_CEnt080SyainSearch("
    strSQL = strSQL & " :InStrSyainMyouji"
    strSQL = strSQL & ",:InStrSyainName"
    strSQL = strSQL & ",:InNumMaxRec"
    strSQL = strSQL & ",:IoNumSpCnt"
    strSQL = strSQL & ",:OtNumRecCount"
    strSQL = strSQL & ",:OtNumAryCount"
    strSQL = strSQL & ",:OtStrEndFlg"
    strSQL = strSQL & ",:OtStrDatAryN); END;"

    i = 1               '変数のクリア
    lngSprStartCnt = 0
    lngSprEndCnt = 0

    sprList.ReDraw = False
    Do
        'マスタ情報一覧の取得
        odbDatabase.DbexecuteSQL (strSQL)

        If i = 1 Then
            '■該当ﾃﾞｰﾀ有無確認
            If odbDatabase.Parameters("OtNumRecCount") = 0 Then
                lblMsg.Caption = "該当するデータが見つかりません。"
                txtKaiinsimeiKana.SetFocus
                Call gsubParaRemove(odbDatabase)
                sprList.ReDraw = True
                Exit Function
            End If
            
            glngSPCount = odbDatabase.Parameters("OtNumRecCount")
            prgBar.Visible = False
            prgBar.Max = glngSPCount
            
            '■一覧の行数設定(ｽﾌﾟﾚｯﾄﾞ)
            '検索総数が20件よりも多い場合はｽﾌﾟﾚｯﾄﾞ行数を検索総数と同じにする
'            If odbDatabase.Parameters("OtNumRecCount") > 20 Then
                sprList.MaxRows = odbDatabase.Parameters("OtNumRecCount")
'            Else
'                '検索総数20件以下の場合20件までｽﾌﾟﾚｯﾄﾞを表示する
'                sprList.MaxRows = 20
'            End If
        End If

        '一覧のデータ内容を設定する開始位置
        lngSprStartCnt = (i - 1) * cnslngAryCnt + 1

        '一覧の終了位置
        If glngSPCount - (i - 1) * cnslngAryCnt > odbDatabase.Parameters("OtNumAryCount") Then
'            lngSprEndCnt = lngSprEndCnt + odbDatabase.Parameters("OtNumAryCount")      '【Win2000対応】Del by Yokoyama@NBC 2004/04/16
            lngSprEndCnt = lngSprEndCnt + CLng(odbDatabase.Parameters("OtNumAryCount")) '【Win2000対応】Add by Yokoyama@NBC 2004/04/16
        Else
            lngSprEndCnt = glngSPCount
        End If
        
        '一覧表 項目セット
        Call subItiranDsp(lngSprStartCnt, lngSprEndCnt)

        i = i + 1
        
    Loop Until odbDatabase.Parameters("OtStrEndFlg") = "1"

    sprList.ReDraw = True

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    fncblnSyainSearch = True

    Exit Function

errfncblnSyainSearch:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), cpubMyPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function
'******************************************************************************
'*    機能：　名寄せ検索によって取得した社員データをスプレッドに表示
'*    引数：　一覧の開始位置、終了位置
'******************************************************************************
Private Sub subItiranDsp(lngStCnt As Long, lngEdCnt As Long)
 Dim i           As Long
 Dim j           As Long
 Dim strDetail   As String
 Dim strWk       As String
 Dim StrWk1      As String
 Dim StrWk2      As String

    j = 0
    For i = lngStCnt To lngEdCnt

        strDetail = odbDatabase.Parameters("OtStrDatAryN").Get_Value(j)
        j = j + 1
        
        '社員コード1 & 社員コード2
        StrWk1 = gfncstrDlm2(strDetail, 1)
        StrWk1 = Trim$(StrWk1)
        StrWk2 = gfncstrDlm2(strDetail, 2)
        StrWk2 = Trim$(StrWk2)
        sprList.SetText 1, i, Trim(StrWk1 & StrWk2)
                
        '氏名漢字
        strWk = gfncstrDlm2(strDetail, 3)
        strWk = Trim$(strWk)
        sprList.SetText 3, i, strWk
        
        '所属店コード
        strWk = gfncstrDlm2(strDetail, 4)
        strWk = Trim$(strWk)
        sprList.SetText 4, i, strWk
        
        '東西区分
        strWk = gfncstrDlm2(strDetail, 5)
        strWk = Trim$(strWk)
        If strWk = 1 Then
            sprList.SetText 6, i, "東"
        ElseIf strWk = 2 Then
            sprList.SetText 6, i, "西"
        Else
            sprList.SetText 6, i, ""
        End If
        
        '所属部門コード
        strWk = gfncstrDlm2(strDetail, 6)
        strWk = Trim$(strWk)
        sprList.SetText 7, i, strWk
                
        '所属店名称
        strWk = gfncstrDlm2(strDetail, 13)
        strWk = Trim$(strWk)
        sprList.SetText 5, i, strWk
        
        '所属部門名称
        strWk = gfncstrDlm2(strDetail, 14)
        strWk = Trim$(strWk)
        sprList.SetText 8, i, strWk
        
        '氏名カナ
        strWk = gfncstrDlm2(strDetail, 15)
        strWk = Trim$(strWk)
        sprList.SetText 2, i, strWk
        
        prgBar.Value = i
    Next i
    
    Me.lblMsg.Caption = ""

End Sub
'******************************************************************************
'*    決定ボタン押下時処理
'******************************************************************************
Private Sub cmdExec_Click()
 Dim lngSprRow  As Long    'ｽﾌﾟﾚｯﾄﾞ選択行
 Dim strSyainCd As String  '社員コード
 Dim S          As Variant
 
    '選択されているｽﾌﾟﾚｯﾄﾞ行をｾｯﾄ
    lngSprRow = sprList.ActiveRow
    
    '選択した行のﾃﾞｰﾀの有無ﾁｪｯｸ
    If sprList.GetText(1, lngSprRow, S) = False Then
        Exit Sub
    End If
    
    'ﾒｲﾝﾌｫｰﾑに社員ｺｰﾄﾞを設定
    strSyainCd = gVarSpdGetText(sprList, 1, lngSprRow)
    
    If Len(strSyainCd) = 7 Then
        frmQPAV_CEnt080.txtSyainCd(0).Text = " "
        frmQPAV_CEnt080.txtSyainCd(1).Text = strSyainCd
    ElseIf Len(strSyainCd) = 8 Then
        frmQPAV_CEnt080.txtSyainCd(0).Text = Mid(strSyainCd, 1, 1)
        frmQPAV_CEnt080.txtSyainCd(1).Text = Mid(strSyainCd, 2, 7)
    Else
        frmQPAV_CEnt080.txtSyainCd(0).Text = ""
        frmQPAV_CEnt080.txtSyainCd(1).Text = ""
    End If
    
    '名寄せﾌﾗｸﾞ設定
    gblnNayoseFlg = True
    
    '名寄せ検索画面終了
    Unload Me
    
End Sub
