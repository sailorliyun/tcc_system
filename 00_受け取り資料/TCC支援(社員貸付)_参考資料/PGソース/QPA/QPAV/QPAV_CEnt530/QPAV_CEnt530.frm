VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt530 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "貸付金残高表"
   ClientHeight    =   8580
   ClientLeft      =   495
   ClientTop       =   1515
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
   Begin VB.OptionButton optKbn 
      Caption         =   "社員ローン残高表"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   0
      Left            =   6120
      TabIndex        =   25
      Top             =   2520
      Width           =   2775
   End
   Begin VB.OptionButton optKbn 
      Caption         =   "社員ローン残高異動リスト"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   1
      Left            =   6120
      TabIndex        =   24
      Top             =   3105
      Width           =   2865
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
      Height          =   465
      Index           =   1
      Left            =   12960
      TabIndex        =   3
      Top             =   6630
      Width           =   1065
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "プレビュー"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   0
      Left            =   11790
      TabIndex        =   2
      Top             =   6630
      Width           =   1065
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   945
      Left            =   90
      TabIndex        =   20
      Top             =   30
      Width           =   14250
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   13650
         Top             =   270
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.TextBox txtSyuturyokuM 
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
         Left            =   7717
         MaxLength       =   2
         TabIndex        =   1
         Top             =   360
         Width           =   330
      End
      Begin VB.TextBox txtSyuturyokuY 
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
         Left            =   6907
         MaxLength       =   4
         TabIndex        =   0
         Top             =   360
         Width           =   525
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
         Left            =   7462
         TabIndex        =   23
         Top             =   435
         Width           =   180
      End
      Begin VB.Label Label3 
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
         Left            =   8092
         TabIndex        =   22
         Top             =   435
         Width           =   180
      End
      Begin VB.Label Label2 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "出力年月"
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
         Left            =   5265
         TabIndex        =   21
         Top             =   435
         Width           =   1560
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
         Left            =   6045
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
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   17
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
            TextSave        =   "2021/03/30"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:07"
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
Attribute VB_Name = "frmQPAV_CEnt530"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号      修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           新規作成
'20100716  1004091          グループ社員貸付の債権譲渡に伴うシステム対応
'                            ・社員ローン残高合計表出力追加
'                            ・社員ローン残高異動リスト出力追加
'----------------------------------------------------------------------------------------------

'*****************************************************************************************
'各ファンクションキー機能
'*****************************************************************************************
Private Sub cmdPFK_Click(Index As Integer)
    
    Select Case Index
        Case 1  'メニュー
            Unload Me
            Exit Sub
        Case 2  'ハードコピー
            Call gsubQSAV_ActX1001

        Case 5  '実行
            blnRptToWindow = False
            Call subJikkou
        Case 10 '前画面
            Unload Me
            Exit Sub
        Case 12 '取消
            Call subFormInitialize
    End Select
    
End Sub

'*****************************************************************************************
'  印刷／プレビューボタン
'*****************************************************************************************
Private Sub cmdPrint_Click(Index As Integer)
    
    If Index = 0 Then
        blnRptToWindow = True
    Else
        blnRptToWindow = False
    End If
    
    Call subJikkou

End Sub

'*****************************************************************************************
'  帳票出力
'*****************************************************************************************
Private Sub subJikkou()
    '入力チェック
    If funcChk = False Then
        Exit Sub
    End If
    'データ検索SP
    If funcSearch = False Then
        Exit Sub
    End If
    
    '確認
    If blnRptToWindow = True Then
        If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "新グループ社員貸付残高表") = vbCancel Then
            Exit Sub
        End If
    Else
        If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "新グループ社員貸付残高表") = vbCancel Then
            Exit Sub
        End If
    End If
    
    '出力SP
    If funcSetWorkTable = False Then
        Exit Sub
    End If
    
    'クリレポ
    If blnRptToWindow = True Then
    
        'MOD 20100716 1004091 IMZ NISHIKADO Start
        'Call subPrintReport1(crptToWindow)
        If optKbn(0).Value = True Then
            Call subPrintReport1(crptToWindow)          '社員ローン残高表
            Call subPrintReport2(crptToWindow)          '社員ローン残高合計表
        Else
            Call subPrintReport3(crptToWindow, "1")     '社員ローン残高異動リスト（転入）
            Call subPrintReport3(crptToWindow, "2")     '社員ローン残高異動リスト（転出）
        End If
        'MOD 20100716 1004091 IMZ NISHIKADO End
        
    Else
        
        'MOD 20100716 1004091 IMZ NISHIKADO Start
        'Call subPrintReport1(crptToPrinter)
        If optKbn(0).Value = True Then
            Call subPrintReport1(crptToPrinter)          '社員ローン残高表
            Call subPrintReport2(crptToPrinter)          '社員ローン残高合計表
        Else
            Call subPrintReport3(crptToPrinter, "1")     '社員ローン残高異動リスト（転入）
            Call subPrintReport3(crptToPrinter, "2")     '社員ローン残高異動リスト（転出）
        End If
        'MOD 20100716 1004091 IMZ NISHIKADO End
   
   End If
   
   'ADD 20100716 1004091 IMZ NISHIKADO Start
   'エラー内容クリア
   lblMsg.Caption = ""
   'ADD 20100716 1004091 IMZ NISHIKADO End

End Sub

'*************************************************************************************************
'*  入力チェック
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    '出力年入力チェック
    If Trim$(txtSyuturyokuY.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 出力年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuY.Enabled = True
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    txtSyuturyokuY.Text = Format(txtSyuturyokuY.Text, "0000")
    
    '出力月入力チェック
    If Trim$(txtSyuturyokuM.Text) = "" Then
        'Msg = が入力されていません。
        lblMsg.Caption = "WPOE01 出力年月" & gstrGetCodeMeisyo(odbDatabase, "E01", "WPO")
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuM.Enabled = True
        txtSyuturyokuM.SetFocus
        Exit Function
    End If
    txtSyuturyokuM.Text = Format(txtSyuturyokuM.Text, "00")
            
    If Not IsDate(txtSyuturyokuY.Text & "," & txtSyuturyokuM.Text & ",01") Then
        'Msg = は日付で入力して下さい。
        lblMsg.Caption = "WPOE03 出力年月" & gstrGetCodeMeisyo(odbDatabase, "E03", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    
    '当月以降はNG
    If Format(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "YYYY/MM") >= Format(gdatSysDate, "YYYY/MM") Then
        'Msg = 当月以降の日付は入力できません。
        lblMsg.Caption = "WPOE48 " & gstrGetCodeMeisyo(odbDatabase, "E48", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
        
    funcChk = True

End Function

'*************************************************************************************************
'*  データ検索SP呼び出し
'*************************************************************************************************
'*  戻り値  True：成功
'*          False：失敗/0件
'*************************************************************************************************
Private Function funcSearch() As Boolean
    Dim strSQL               As String
    Dim strYMD               As String
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Dim strYMDZen            As String
    'ADD 20100716 1004091 IMZ NISHIKADO End

On Error GoTo errSPSet
    
    strYMD = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text + 1, 1)), "YYYYMMDD")

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    'ＳＰ
    With odbDatabase.Parameters
        '処理日付
        .Add "InStrYMD", strYMD, ORAPARM_INPUT
        .Item("InStrYMD").ServerType = ORATYPE_CHAR
        
        'ADD 20100716 1004091 IMZ NISHIKADO Start
        '処理日付の前月末日
        odbDatabase.Parameters.Add "InStrYMDZen", strYMDZen, ORAPARM_INPUT
        odbDatabase.Parameters("InStrYMDZen").ServerType = ORATYPE_CHAR
        'ADD 20100716 1004091 IMZ NISHIKADO End
        
        '総検索件数
        .Add "OtNumRecCount", 0, ORAPARM_OUTPUT
        .Item("OtNumRecCount").ServerType = ORATYPE_NUMBER
    End With

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    If optKbn(0).Value = True Then
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
        'ＳＱＬ分の作成
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530Search ("
        strSQL = strSQL & ":InStrYMD,"
        strSQL = strSQL & ":OtNumRecCount"
        strSQL = strSQL & "); END;"

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Else    '残高異動リスト
        '前月末日
        'ＳＱＬ分の作成
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SearchIdou ("
        strSQL = strSQL & ":InStrYMD,"
        strSQL = strSQL & ":InStrYMDZen,"
        strSQL = strSQL & ":OtNumRecCount"
        strSQL = strSQL & "); END;"
    End If
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    'ＳＰの実行
    Call odbDatabase.DbexecuteSQL(strSQL)

    '総データ件数がZEROのときはエラー
    If odbDatabase.Parameters("OtNumRecCount") = 0 Then
        'Msg = 該当データが存在しません。
        frmQPAV_CEnt530.lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO")
        frmQPAV_CEnt530.txtSyuturyokuY.SetFocus
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    funcSearch = True
       
    Exit Function

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
End Function

'*************************************************************************************************
'*  ワークテーブルにデータ登録SP呼び出し
'*************************************************************************************************
'*  戻り値  True：成功
'*          False：失敗
'*************************************************************************************************
Private Function funcSetWorkTable() As Boolean
    Dim strSQL               As String
    Dim strYMD               As String
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Dim strYMDZen            As String
    'ADD 20100716 1004091 IMZ NISHIKADO End

    funcSetWorkTable = False
On Error GoTo errSPSet

    strYMD = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text + 1, 1)), "YYYYMMDD")
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
    'ADD 20100716 1004091 IMZ NISHIKADO End

    'ＳＰ
    '処理日付
    odbDatabase.Parameters.Add "InStrYMD", strYMD, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMD").ServerType = ORATYPE_CHAR
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    '処理日付の前月末日
    odbDatabase.Parameters.Add "InStrYMDZen", strYMDZen, ORAPARM_INPUT
    odbDatabase.Parameters("InStrYMDZen").ServerType = ORATYPE_CHAR
    'ADD 20100716 1004091 IMZ NISHIKADO End
    
    'ユーザーＩＤ
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    'ADD 20100716 1004091 IMZ NISHIKADO Start
    If optKbn(0).Value = True Then
    'ADD 20100716 1004091 IMZ NISHIKADO End
        
        'ＳＱＬ分の作成
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SetWorkTable ("
        strSQL = strSQL & ":InStrYMD,:InStrUserID,:InStrComputerNM"
        strSQL = strSQL & "); END;"
        
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    Else    '残高異動リスト
        '前月末日
        strYMDZen = Format(DateAdd("D", -1, DateSerial(txtSyuturyokuY.Text, txtSyuturyokuM.Text, 1)), "YYYYMMDD")
        'ＳＱＬ分の作成
        strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530SetWorkTableIdou ("
        strSQL = strSQL & ":InStrYMD,:InStrYMDZen,:InStrUserID,:InStrComputerNM"
        strSQL = strSQL & "); END;"
    End If
    'ADD 20100716 1004091 IMZ NISHIKADO End

    'ＳＰの実行
    Call odbDatabase.DbexecuteSQL(strSQL)

    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    funcSetWorkTable = True
       
    Exit Function

errSPSet:
'エラー処理

    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
End Function

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "新貸付金残高表 (" & gstrCommandLine(8) & ") " _
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
                                    , "新貸付金残高表 (" & gstrCommandLine(8) & ") " _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
        End If
        
        'サーバー日付取得
        Call gsubGetSysDate
        
        '画面初期化
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False

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
    
    Me.Caption = "新貸付金残高表 (" & gstrCommandLine(8) & ")"
    
    'ステータスバー設定
    Call gsubInitStatusBar(stbSystem)
    
    '画面初期化
    blnLoadFlg = True

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

    '使用ワークテーブル全削除
    Call subDelWorkTbl
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    '社員ローン残高異動リスト使用ワークテーブル削除
    Call subDelWorkTblIdou
    'ADD 20100716 1004091 IMZ NISHIKADO End
  
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt530 = Nothing
    
End Sub

'******************************************
'* フォーカス取得時全テキスト選択
'******************************************
Private Sub txtSyuturyokum_GotFocus()
    Call gsubSelectText(txtSyuturyokuM)
End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtSyuturyokum_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'* フォーカス取得時全テキスト選択
'******************************************
Private Sub txtSyuturyokuY_GotFocus()
    Call gsubSelectText(txtSyuturyokuY)
End Sub

'******************************************
'*入力文字制御（数字のみ）
'******************************************
Private Sub txtSyuturyokuY_KeyPress(KeyAscii As Integer)
    KeyAscii = gIntFilterKey(KeyAscii, "1234567890")
End Sub

'******************************************
'*フル桁脱出
'******************************************
Private Sub txtSyuturyokuY_Change()
    Call gsubMaxCharSkipEX(txtSyuturyokuY, 4)
End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()

    lblMsg.Caption = ""
    stbSystem.Panels.Item(1).Text = ""
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite

End Sub

'*************************************************************************************************
'* 画面初期化
'*************************************************************************************************
Private Sub subFormInitialize()

    txtSyuturyokuY.Text = ""
    txtSyuturyokuM.Text = ""

    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    txtSyuturyokuY.Enabled = True
    txtSyuturyokuM.Enabled = True
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite
    'システム月の前月に設定
    txtSyuturyokuY.Text = Format(DateAdd("m", -1, gdatSysDate), "yyyy")
    txtSyuturyokuM.Text = Format(DateAdd("m", -1, gdatSysDate), "MM")
    
    'ADD 20100716 1004091 IMZ NISHIKADO Start
    optKbn(0).Value = True
    'ADD 20100716 1004091 IMZ NISHIKADO End

    
End Sub

'クリスタルレポート
Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer

Dim strMm              As String


    
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt530.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB4_NEWZANDAKAW"
        
        'パラメータを記述する
'2021030013_社員ローン残高表 MOD START 20210330
'        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy年mm月度") & "'"
'2021030013_社員ローン残高表 MOD END 20210330
        
        '抽出条件を記述する
        strSelectionFormula = "{QPB4_NEWZANDAKAW.QPB4_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB4_NEWZANDAKAW.QPB4_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula
        
        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "新貸付金残高表 (" & gstrCommandLine(8) & ")"

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

        'クリスタルレポートを実行する
        intRet = .PrintReport

        Me.Enabled = True
        Me.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
        .Reset
    End With
    
End Sub

'****************************************************************************************
'* 使用ワークテーブル全削除
'****************************************************************************************
Private Sub subDelWorkTbl()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    'ユーザーＩＤ
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDelWorkTbl
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errDelWorkTbl:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Sub

'ADD 20100716 1004091 IMZ NISHIKADO Start
'クリスタルレポート（社員ローン残高合計表出力処理）
Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String       '抽出条件
Dim strConectPoint      As String       'アクセスポイント
Dim intRet              As Integer      'リターン値

Dim strMm              As String        '年月
  
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt531.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB4_NEWZANDAKAW"
        
        'パラメータを記述する
'2021030013_社員ローン残高表 MOD START 20210330
'        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy年mm月度") & "'"
'2021030013_社員ローン残高表 MOD END 20210330
        
        '抽出条件を記述する
        strSelectionFormula = "{QPB4_NEWZANDAKAW.QPB4_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB4_NEWZANDAKAW.QPB4_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula
        
        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "新貸付金残高表 (" & gstrCommandLine(8) & ")"

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

        'クリスタルレポートを実行する
        intRet = .PrintReport

        Me.Enabled = True
        Me.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
        .Reset
    End With
    
End Sub

'クリスタルレポート（社員ローン残高異動リスト出力処理）
Private Sub subPrintReport3(intDestinationConstants As DestinationConstants, strIdouKBN As String)

Dim strSelectionFormula As String       '抽出条件
Dim strConectPoint      As String       'アクセスポイント
Dim intRet              As Integer      'リターン値

Dim strMm              As String        '年月
   
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt532.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB7_ZNDKIDOUW"
        
        'パラメータを記述する
'2021030013_社員ローン残高表 MOD START 20210330
'        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
        .Formulas(0) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "yyyy年mm月度") & "'"
'2021030013_社員ローン残高表 MOD END 20210330
        .Formulas(1) = "異動区分='" & strIdouKBN & "'"
        
        '抽出条件を記述する
        strSelectionFormula = "{QPB7_ZNDKIDOUW.QPB7_IDOUKBN} = '" & strIdouKBN & "'" _
                       & " AND {QPB7_ZNDKIDOUW.QPB7_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPB7_ZNDKIDOUW.QPB7_COMPUTERNM} = '" & gstrCommandLine(5) & "'"
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula
        
        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "新貸付金残高表 (" & gstrCommandLine(8) & ")"

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

        'クリスタルレポートを実行する
        intRet = .PrintReport

        Me.Enabled = True
        Me.MousePointer = vbDefault
        stbSystem.Panels.Item(1).Text = ""

        If intRet = 20545 Then
            Exit Sub
        ElseIf intRet <> 0 Then
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
        End If
        .Reset
    End With
    
End Sub

'****************************************************************************************
'* 社員ローン残高異動リスト使用ワークテーブル削除
'****************************************************************************************
Private Sub subDelWorkTblIdou()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    'ユーザーＩＤ
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2

    strSQL = "BEGIN QPAP_CEnt530PkG.QPAP_CEnt530DelWorkTblIdou(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

    If odbDatabase.LastServerErr <> 0 Then
        GoTo errDelWorkTbl
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    
    Exit Sub
    
errDelWorkTbl:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
End Sub

'ADD 20100716 1004091 IMZ NISHIKADO End


