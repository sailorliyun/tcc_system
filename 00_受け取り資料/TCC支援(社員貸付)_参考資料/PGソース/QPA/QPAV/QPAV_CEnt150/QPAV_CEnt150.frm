VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt150 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "残高マイナスリスト"
   ClientHeight    =   8580
   ClientLeft      =   885
   ClientTop       =   2700
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
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
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
      TabIndex        =   7
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
      TabIndex        =   6
      Top             =   6630
      Width           =   1065
   End
   Begin VB.Frame Frame4 
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
      Height          =   5535
      Index           =   1
      Left            =   120
      TabIndex        =   30
      Top             =   1020
      Width           =   14250
      Begin FPSpread.vaSpread sprList 
         Height          =   4965
         Left            =   510
         TabIndex        =   5
         Top             =   300
         Width           =   13290
         _Version        =   196608
         _ExtentX        =   23442
         _ExtentY        =   8758
         _StockProps     =   64
         MaxCols         =   8
         MaxRows         =   30
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt150.frx":0000
         UserResize      =   0
         VisibleCols     =   500
         VisibleRows     =   500
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   945
      Left            =   90
      TabIndex        =   24
      Top             =   30
      Width           =   14250
      Begin VB.ComboBox cobKousin 
         Height          =   315
         ItemData        =   "QPAV_CEnt150.frx":042C
         Left            =   1725
         List            =   "QPAV_CEnt150.frx":0436
         Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
         TabIndex        =   0
         Top             =   360
         Width           =   1650
      End
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
         Left            =   7980
         MaxLength       =   2
         TabIndex        =   4
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
         Left            =   7170
         MaxLength       =   4
         TabIndex        =   3
         Top             =   360
         Width           =   525
      End
      Begin VB.Frame fraTozai 
         BorderStyle     =   0  'なし
         Height          =   510
         Left            =   3510
         TabIndex        =   25
         Top             =   240
         Width           =   2715
         Begin VB.OptionButton optTouzai 
            Caption         =   "西"
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
            Left            =   1890
            Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
            TabIndex        =   2
            Top             =   90
            Visible         =   0   'False
            Width           =   780
         End
         Begin VB.OptionButton optTouzai 
            Caption         =   "東"
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
            Left            =   990
            Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
            TabIndex        =   1
            Top             =   90
            Value           =   -1  'True
            Visible         =   0   'False
            Width           =   780
         End
         Begin VB.Label Label1 
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
            Left            =   180
            TabIndex        =   26
            Top             =   180
            Visible         =   0   'False
            Width           =   720
         End
      End
      Begin VB.Label Label5 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "抽出区分"
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
         Left            =   915
         TabIndex        =   31
         Top             =   435
         Width           =   720
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
         Left            =   7725
         TabIndex        =   29
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
         Left            =   8355
         TabIndex        =   28
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
         Left            =   6375
         TabIndex        =   27
         Top             =   435
         Width           =   720
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
      TabIndex        =   23
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
         TabIndex        =   8
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
         Index           =   3
         Left            =   2430
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
         Index           =   4
         Left            =   3615
         TabIndex        =   14
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
         Index           =   6
         Left            =   6045
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
         Index           =   7
         Left            =   7200
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
         Index           =   8
         Left            =   8385
         TabIndex        =   17
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
         TabIndex        =   18
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
         TabIndex        =   11
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
         TabIndex        =   19
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
         TabIndex        =   12
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
      TabIndex        =   21
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
         TabIndex        =   22
         Top             =   60
         Width           =   12405
      End
   End
   Begin MSComctlLib.StatusBar stbSystem 
      Align           =   2  '下揃え
      Height          =   375
      Left            =   0
      TabIndex        =   20
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
            TextSave        =   "2010/11/20"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "11:32"
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
Attribute VB_Name = "frmQPAV_CEnt150"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100225  0908047          グループ社員証書貸付帳票見直し2次
'                           現状、出力年月が「２月（下期末）」または「８月（上期末）」の時のみ
'                           表示している「未収利息給与分、賞与分、合計」を、「５月（四半期末）」
'                           および「１１月」にも表示するよう変更する。
'20100713  1004091          抽出条件にある東西区分を削除
'                           ※東西のデータを一度に表示・印刷を行う
'20101119  XXXXXXX          クレジットシステム再構築・帳票削減
'                           画面タイトルを「残高マイナスリスト」に変更
'                           「旧残高表」・「旧残高合計表」の出力処理削除
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
            Call subCmdJikkou
            
        Case 10 '前画面
            Unload Me
            Exit Sub
        Case 12 '取消
            Call subFormInitialize

'MOD 20100713 1004091 IMZ SHIBUTANI START
'            optTouzai(0).SetFocus
            txtSyuturyokuY.SetFocus
'MOD 20100713 1004091 IMZ SHIBUTANI END
    
    End Select
    
End Sub

Private Sub cmdPrint_Click(Index As Integer)
    
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String
'add 20101119 XXXXXXX imz.Yoshida start
    Dim strMSG    As String                 '確認用メッセージ
    Dim dcINDEX   As DestinationConstants   'クリスタルレポート実行コントロール
'add 20101119 XXXXXXX imz.Yoshida end

'mod 20101119 XXXXXXX imz.Yoshida start
'    Select Case Index
'        Case 0
'            If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "グループ社員貸付残高表") = vbCancel Then
'                Exit Sub
'            End If
'            Call subPrintReport1(crptToWindow)
'            Call subPrintReport2(crptToWindow)
'            Call subPrintReport3(crptToWindow)
'        Case 1
'            If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "グループ社員貸付残高表") = vbCancel Then
'                Exit Sub
'            End If
'            Call subPrintReport1(crptToPrinter)
'            Call subPrintReport2(crptToPrinter)
'            Call subPrintReport3(crptToPrinter)
'    End Select
    '確認メッセージ設定
    If Index = 0 Then
        strMSG = "プレビューを開始します。よろしいですか？"                            'プレビューボタン押下時
    Else
        strMSG = "印刷を開始します。よろしいですか？"                                  '一覧印刷ボタン押下時
    End If

    '確認メッセージ
    If MsgBox(strMSG, vbQuestion + vbOKCancel, Me.Caption) = vbCancel Then Exit Sub
    Me.MousePointer = vbHourglass                                                   'マウスポインター
    stbSystem.Panels.Item(1).Text = "処理中．．．"                                   'ステータスバー
    'クリスタルレポート実行設定
    dcINDEX = Index                                                                  '型変換
    '残高マイナスリスト起動処理
    Call subPrintReport3(dcINDEX)
'mod 20101119 XXXXXXX imz.Yoshida end

End Sub


'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

    If blnLoadFlg Then

        DoEvents
        
        MousePointer = vbHourglass
        Me.Enabled = False
        
'        gstrFormObjectName = "貸付金残高表"
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
'mod 20101119 XXXXXXX imz.Yoshida start
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat _
'                                    , "貸付金残高表 (" & gstrCommandLine(8) & ") " _
'                                    , CStr(Err.Number), Err.Description)
'            '終了
'            Unload Me
            GoTo ERROR_SECTION
'mod 20101119 XXXXXXX imz.Yoshida end
        End If
        
        'オラクルデータベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
'mod 20101119 XXXXXXX imz.Yoshida start
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat _
'                                    , "貸付金残高表 (" & gstrCommandLine(8) & ") " _
'                                    , CStr(Err.Number), Err.Description)
'            '終了
'            Unload Me
            GoTo ERROR_SECTION
'mod 20101119 XXXXXXX imz.Yoshida end
        End If
        
        'サーバー日付取得
        Call gsubGetSysDate
        
        Call gsubKamiSimoSet
        
        '画面初期化
        Call subFormInitialize

    End If
    
    Me.Enabled = True
    MousePointer = vbDefault
    blnLoadFlg = False

'add 20101119 XXXXXXX imz.Yoshida start
    Exit Sub

ERROR_SECTION:
    'システムエラー発生時のエラーメッセージ共通処理
    Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                            , gstrCommandLine(5), gstrGetErrDateFormat _
                            , "残高マイナスリスト (" & gstrCommandLine(8) & ") " _
                            , CStr(Err.Number), Err.Description)
    Me.Enabled = True                                                               '画面使用可否設定
    MousePointer = vbDefault                                                        'マウスポインター
    Unload Me                                                                       '画面終了
'add 20101119 XXXXXXX imz.Yoshida end
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
    
'mod 20101119 XXXXXXX imz.Yoshida start
'    Me.Caption = "貸付金残高表 (" & gstrCommandLine(8) & ")"
    Me.Caption = "残高マイナスリスト (" & gstrCommandLine(8) & ")"
'mod 20101119 XXXXXXX imz.Yoshida end
    'ステータスバー設定
    Call gsubInitStatusBar(stbSystem)
    
    '画面初期化
    blnLoadFlg = True

    sprList.MaxRows = 0

End Sub

'**************************************************************************************************
'*Form Unload
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

    '使用ワークテーブル全削除
    Call subDelWorkTbl
    
    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB
    
    Set frmQPAV_CEnt150 = Nothing
    
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

'*************************************************************************************************
'*入力チェック
'*************************************************************************************************
Private Function funcChk() As Boolean

    funcChk = False
    
    If Day(gdatSysDate) > 25 Then
        'Msg = ２５日以降は出力できません。
        lblMsg.Caption = "WPOE21 " & gstrGetCodeMeisyo(odbDatabase, "E21", "WPO")
        txtSyuturyokuY.Enabled = True
        txtSyuturyokuY.SetFocus
        Exit Function
    End If

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
    
    If Val(Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/01", "yyyymm")) <> Val(Format$(IIf(Day(gdatSysDate) > 25, gdatSysDate, DateAdd("m", -1, gdatSysDate)), "yyyymm")) Then
        'Msg = 出力年月が正しく入力されていません。
        lblMsg.Caption = "WPOE22 " & gstrGetCodeMeisyo(odbDatabase, "E22", "WPO")
        txtSyuturyokuY.BackColor = vbRed
        txtSyuturyokuM.BackColor = vbRed
        txtSyuturyokuY.SetFocus
        Exit Function
    End If
    
    funcChk = True

End Function

'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
 
    Dim strStrYMD_Work  As String
    Dim strKyuyoYMD_Work  As String

    Call subErrKaijo
    
    '入力チェック
    If funcChk = False Then Exit Sub
    
    Screen.MousePointer = vbHourglass
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    DoEvents
    cmdPFK(5).SetFocus
                
    'SP用変数に退避
    strStrYMD_Work = Format(DateAdd("d", -1, DateAdd("m", 1, txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/01")), "yyyy/mm/dd")
    gstrStrYMD = Format(strStrYMD_Work, "yyyymmdd")
    
'MOD 20100713 1004091 IMZ SHIBUTANI START
'    If optTouzai(0).Value = True Then
'        gstrKBN = "1"
'    ElseIf optTouzai(1).Value = True Then
'        gstrKBN = "2"
'    Else
'        gstrKBN = "0"
'    End If
    gstrKBN = "0"
'MOD 20100713 1004091 IMZ SHIBUTANI END
    
    strKyuyoYMD_Work = txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text & "/25"
    gstrKyuyoYMD = Format(strKyuyoYMD_Work, "yyyymmdd")
    gintKyuyoNisu = DateDiff("y", strKyuyoYMD_Work, strStrYMD_Work)
    '2003/01/24 利息計算用
    
    gintKyuyoNisuFrom = gstrKyuyoYMD
    gintKyuyoNisuTo = gstrStrYMD
    
    'Ver2
    If cobKousin.ListIndex = 0 Then
        '賞与残高更新前データ取得
        Call gsubSPSet_BeforeUpdate
    Else
        '賞与残高更新後データ取得
        Call gsubSPSet_AfterUpdate
    End If
    
    
    stbSystem.Panels.Item(1).Text = ""
    Screen.MousePointer = vbDefault

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

    optTouzai(0).Value = True
    txtSyuturyokuY.Text = ""
    txtSyuturyokuM.Text = ""

    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    
    'エラーメッセージ欄クリア
    lblMsg.Caption = ""
    
    '各コントロール制御
    cobKousin.ListIndex = 0
    
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
    
    
    fraTozai.Enabled = True
    txtSyuturyokuY.Enabled = True
    txtSyuturyokuM.Enabled = True
    txtSyuturyokuY.BackColor = vbWhite
    txtSyuturyokuM.BackColor = vbWhite
    txtSyuturyokuY.Text = Format(gdatSysDate, "yyyy")
    txtSyuturyokuM.Text = Format(gdatSysDate, "MM")
    
End Sub

'del 20101119 XXXXXXX imz.Yoshida start
''クリスタルレポート
'Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)
'
'Dim strSelectionFormula As String
'Dim strConectPoint      As String
'Dim intRet              As Integer
'
'Dim strMm              As String
'
'
'
'    'アクセスするデータベースなどを記述
'    strConectPoint = "DSN = " & gstrCommandLine(0) & _
'                    ";UID = " & gstrCommandLine(3) & _
'                    ";PWD = " & gstrCommandLine(4)
'
'    With CrystalReport
'        'クリスタルレポートのファイルがある場所を記述する
'        .ReportFileName = App.Path & "\QPAV_CEnt150.rpt"
'        .DiscardSavedData = True
'
'        '記述されたアクセスポイントに接続
'        .Connect = strConectPoint
'
'        'ロケーションの設定
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
'
'        'パラメータを記述する
''DEL 20100225 0908047 NBC SAWAME START
''        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
''            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
''DEL 20100225 0908047 NBC SAWAME END
''ADD 20100225 0908047 NBC SAWAME START
'        '第一四決算月、第三四決算月追加
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstr34KesM) Then
''ADD 20100225 0908047 NBC SAWAME END
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If
'
''2002_05_28 機能追加：賞与日表示対応
'
'''''''        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
'
'        If cobKousin.ListIndex = 0 Then
'            '賞与残高更新前データ締め年月（給与のみ残高）
'            .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'        Else
'            '賞与残高更新後データ締め年月（給与・賞与反映残高）
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '２月以上８月以下は上期賞与の直近日付を取得
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与反映 天引後") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '１月は下期賞与の直近日付を取得（ただし１２月３１日を引数に設定）
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            Else
'                '８月以上は下期賞与の直近日付を取得
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                               '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            End If
'
'            Call gsubSPSet_AfterUpdate
'        End If
'
'
''2002_05_28 機能追加：賞与日表示対応 ここまで
'
'        '抽出条件を記述する
'        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
'                       & " AND ({QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} <> 0" _
'                       & " OR   {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} <> 0))"
'
'        '抽出条件を記述する
'        .SelectionFormula = strSelectionFormula
'
'        '出力先設定
'        .Destination = intDestinationConstants
'
'        'プレビューウィンドウの設定
'        If intDestinationConstants = crptToWindow Then
'
'            .WindowTitle = "個人別貸付金残高表 (" & gstrCommandLine(8) & ")"
'
'            If Me.Top < 0 Then
'                .WindowTop = 0
'            Else
'                .WindowTop = Me.Top / Screen.TwipsPerPixelY
'            End If
'
'            If Me.Left < 0 Then
'                .WindowLeft = 0
'            Else
'                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
'            End If
'
'            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
'            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
'        End If
'
'        'クリスタルレポートを実行する
'        intRet = .PrintReport
'
'        Me.Enabled = True
'        Me.MousePointer = vbDefault
'        stbSystem.Panels.Item(1).Text = ""
'
'        If intRet = 20545 Then
'            Exit Sub
'        ElseIf intRet <> 0 Then
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
'                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
'        End If
'        .Reset
'    End With
'
'End Sub
'
''クリスタルレポート
'Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)
'
'Dim strSelectionFormula As String
'Dim strConectPoint      As String
'Dim intRet              As Integer
'
'Dim strMm               As String
'
'
'    'アクセスするデータベースなどを記述
'    strConectPoint = "DSN = " & gstrCommandLine(0) & _
'                    ";UID = " & gstrCommandLine(3) & _
'                    ";PWD = " & gstrCommandLine(4)
'
'    With CrystalReport
'        'クリスタルレポートのファイルがある場所を記述する
'        .ReportFileName = App.Path & "\QPAV_CEnt151.rpt"
'        .DiscardSavedData = True
'
'        '記述されたアクセスポイントに接続
'        .Connect = strConectPoint
'
'        'ロケーションの設定
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAX_ZANDAKATOTALW"
'
'        'パラメータを記述する
''DEL 20100225 0908047 NBC SAWAME START
''        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
''            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
''DEL 20100225 0908047 NBC SAWAME END
''ADD 20100225 0908047 NBC SAWAME START
'        '第一四決算月、第三四決算月追加
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstr14KesM) Or _
'                Val(txtSyuturyokuM.Text) = Val(gstr34KesM) Then
''ADD 20100225 0908047 NBC SAWAME END
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If
'
''2002_05_28 機能追加：賞与日表示対応
'
'''''''        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
'
'
'        If cobKousin.ListIndex = 0 Then
'            '賞与残高更新前データ締め年月（給与のみ残高）
'            .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'        Else
'            '賞与残高更新後データ締め年月（給与・賞与反映残高）
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '２月以上８月以下は上期賞与の直近日付を取得
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '１月は下期賞与の直近日付を取得（ただし１２月３１日を引数に設定）
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            Else
'                '８月以上は下期賞与の直近日付を取得
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                               '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'
'            End If
'
'
'            Call gsubSPSet_AfterUpdate
'        End If
'
'
''2002_05_28 機能追加：賞与日表示対応 ここまで
'
'
'
'        '抽出条件を記述する
''MOD 20100713 1004091 IMZ SHIBUTANI START
''        strSelectionFormula = "({QPAX_ZANDAKATOTALW.QPAX_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAX_ZANDAKATOTALW.QPAX_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
'                       & " AND ({QPAX_ZANDAKATOTALW.QPAX_TOZAIKBNE} ='" & gstrKBN & "'" _
'                       & " OR   {QPAX_ZANDAKATOTALW.QPAX_TOZAIKBNW} = '" & gstrKBN & "'))"
'
'        strSelectionFormula = "({QPAX_ZANDAKATOTALW.QPAX_USERID} = '" & gstrCommandLine(1) & "'" _
'                       & " AND {QPAX_ZANDAKATOTALW.QPAX_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
''MOD 20100713 1004091 IMZ SHIBUTANI END
'
'        '抽出条件を記述する
'        .SelectionFormula = strSelectionFormula
'
'        '出力先設定
'        .Destination = intDestinationConstants
'
'        'プレビューウィンドウの設定
'        If intDestinationConstants = crptToWindow Then
'
'            .WindowTitle = "店別貸付金残高表 (" & gstrCommandLine(8) & ")"
'
'            If Me.Top < 0 Then
'                .WindowTop = 0
'            Else
'                .WindowTop = Me.Top / Screen.TwipsPerPixelY
'            End If
'
'            If Me.Left < 0 Then
'                .WindowLeft = 0
'            Else
'                .WindowLeft = Me.Left / Screen.TwipsPerPixelX
'            End If
'
'            .WindowHeight = Me.Height / Screen.TwipsPerPixelY
'            .WindowWidth = Me.Width / Screen.TwipsPerPixelX
'        End If
'
'        'クリスタルレポートを実行する
'        intRet = .PrintReport
'
'        Me.Enabled = True
'        Me.MousePointer = vbDefault
'        stbSystem.Panels.Item(1).Text = ""
'
'        If intRet = 20545 Then
'            Exit Sub
'        ElseIf intRet <> 0 Then
'            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
'                                    , gstrCommandLine(5), gstrGetErrDateFormat() _
'                                    , Me.Caption, CStr(.LastErrorNumber), .LastErrorString)
'        End If
'
'        .Reset
'    End With
'
'End Sub
'del 20101119 XXXXXXX imz.Yoshida end

'クリスタルレポート 2003/01/24
Private Sub subPrintReport3(intDestinationConstants As DestinationConstants)

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
        .ReportFileName = App.Path & "\QPAV_CEnt152.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
        
        'パラメータを記述する
'        If Val(txtSyuturyokuM.Text) = Val(gstrKesM) Or _
'            Val(txtSyuturyokuM.Text) = Val(gstrChuKesM) Then
'            .Formulas(0) = "PARA='1'"
'        Else
'            .Formulas(0) = "PARA='0'"
'        End If

'2002_05_28 機能追加：賞与日表示対応
        
''''''        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度") & "'"
        
'        If cobKousin.ListIndex = 0 Then
'            '賞与残高更新前データ締め年月（給与のみ残高）
' '           .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'        Else
'            '賞与残高更新後データ締め年月（給与・賞与反映残高）
'
'            If CStr(Format(gdatSysDate, "mm")) <= "08" And _
'               CStr(Format(gdatSysDate, "mm")) >= "02" Then
'
'               '２月以上８月以下は上期賞与の直近日付を取得
'
'                If CStr(Format(gdatSysDate, "mm")) = "07" Then
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "01"))
'                Else
'                    strMm = strGetShoyoDate(odbDatabase, "1", CStr(Format(gdatSysDate, "mm") & "25"))
'                End If
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与反映 天引後") & "'"
'                    End If
'                End If
'
'            ElseIf CStr(Format(gdatSysDate, "mm")) = "01" Then
'               '１月は下期賞与の直近日付を取得（ただし１２月３１日を引数に設定）
'                strMm = strGetShoyoDate(odbDatabase, "2", "1231")
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then   '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                              '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            Else
'                '８月以上は下期賞与の直近日付を取得
'                strMm = strGetShoyoDate(odbDatabase, "2", CStr(Format(gdatSysDate, "mm") & "25"))
'                strMm = Left(strMm, 2)
'
'               '取得した月が２ヶ月以上開いた場合は賞与が無かった月とみなす
'                If RTrim(strMm) = "" Then        '賞与無しの月
'                    .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                Else
'                    If Abs(CLng(strMm) - CLng(Format(gdatSysDate, "mm"))) >= 2 Then    '賞与無しの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & txtSyuturyokuM.Text, "gggee年mm月度給与 天引後") & "'"
'                    Else                                                               '賞与ありの月
'                        .Formulas(1) = "年月='" & Format$(txtSyuturyokuY.Text & "/" & strMm, "gggee年mm月度賞与 天引後") & "'"
'                    End If
'                End If
'
'            End If
            
            Call gsubSPSet_AfterUpdate
'        End If
        
        
'2002_05_28 機能追加：賞与日表示対応 ここまで

        '抽出条件を記述する
''------->【Win2000対応】Del by Yokoyama@NBC 2004/07/12 ------->------->------->------->------->------->
''        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
''                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "'" _
''                       & " AND ({QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} <> 0" _
''                       & " OR   {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} <> 0))"
''<-------【Win2000対応】Del by Yokoyama@NBC 2004/07/12 <-------<-------<-------<-------<-------<-------
''------->【Win2000対応】Add by Yokoyama@NBC 2004/07/12 ------->------->------->------->------->------->
''★QPAV_CEnt152.rptのSQLクエリにあったWHERE文をここに移動
        strSelectionFormula = "({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "')" _
                       & " AND (({QPAQ_ZANDAKAW.QPAQ_SYUBETU} = '1'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_KOGUCHIZANDAKA} < 0)" _
                       & " OR  ({QPAQ_ZANDAKAW.QPAQ_SYUBETU} = '2'" _
                       & " AND {QPAQ_ZANDAKAW.QPAQ_SYOSYOZANDAKA} < 0))"
''<-------【Win2000対応】Add by Yokoyama@NBC 2004/07/12 <-------<-------<-------<-------<-------<-------
        
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula

        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "残高マイナスリスト (" & gstrCommandLine(8) & ")"

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

    strSQL = "BEGIN QPAP_CEnt150PkG.QPAP_CEnt150DelWorkTbl(" & _
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

