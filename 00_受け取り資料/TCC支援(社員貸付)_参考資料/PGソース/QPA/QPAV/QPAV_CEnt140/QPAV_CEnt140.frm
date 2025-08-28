VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQPAV_CEnt140 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "控除連絡表印刷"
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
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'Z ｵｰﾀﾞｰ
   ScaleHeight     =   8580
   ScaleWidth      =   14385
   StartUpPosition =   2  '画面の中央
   Begin VB.CommandButton cmdInst 
      Caption         =   "データ作成"
      BeginProperty Font 
         Name            =   "ＭＳ Ｐゴシック"
         Size            =   9
         Charset         =   128
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   10350
      TabIndex        =   4
      Top             =   6630
      Width           =   1185
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
      Height          =   405
      Index           =   1
      Left            =   12810
      TabIndex        =   6
      Top             =   6645
      Width           =   1185
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
      Height          =   405
      Index           =   0
      Left            =   11580
      TabIndex        =   5
      Top             =   6630
      Width           =   1185
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   60
      TabIndex        =   26
      Top             =   1020
      Width           =   14250
      Begin FPSpread.vaSpread sprList 
         Height          =   4755
         Left            =   2100
         TabIndex        =   3
         Top             =   420
         Width           =   8985
         _Version        =   196608
         _ExtentX        =   15849
         _ExtentY        =   8387
         _StockProps     =   64
         MaxCols         =   7
         MaxRows         =   20
         OperationMode   =   2
         ScrollBars      =   2
         SelectBlockOptions=   0
         SpreadDesigner  =   "QPAV_CEnt140.frx":0000
         UserResize      =   0
         VisibleCols     =   7
         VisibleRows     =   20
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'ﾌﾗｯﾄ
      ForeColor       =   &H80000008&
      Height          =   1035
      Left            =   60
      TabIndex        =   23
      Top             =   -15
      Width           =   14250
      Begin Crystal.CrystalReport CrystalReport 
         Left            =   180
         Top             =   270
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   348160
         PrintFileLinesPerPage=   60
      End
      Begin VB.OptionButton optKbn 
         Caption         =   " 賞　与"
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
         Left            =   7155
         TabIndex        =   2
         Top             =   555
         Value           =   -1  'True
         Width           =   1140
      End
      Begin VB.OptionButton optKbn 
         Caption         =   " 給　与"
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
         Left            =   7155
         TabIndex        =   1
         Top             =   210
         Width           =   990
      End
      Begin VB.ComboBox cobSyoriYM 
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
         Left            =   5070
         Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
         TabIndex        =   0
         Top             =   390
         Width           =   1260
      End
      Begin VB.Label lblKIKAN 
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
         Left            =   10800
         TabIndex        =   27
         Top             =   450
         Width           =   60
      End
      Begin VB.Label lblKyuuyo 
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
         Left            =   8370
         TabIndex        =   25
         Top             =   450
         Width           =   60
      End
      Begin VB.Label Label1 
         Alignment       =   1  '右揃え
         AutoSize        =   -1  'True
         BackColor       =   &H00C00000&
         BackStyle       =   0  '透明
         Caption         =   "処理年月"
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
         Left            =   4035
         TabIndex        =   24
         Top             =   465
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
      TabIndex        =   22
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
         Left            =   1249
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
         Left            =   2438
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
         Left            =   3627
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
         Left            =   4816
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
         Left            =   6005
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
         Left            =   7194
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
         Left            =   8383
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
         Left            =   9572
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
         Left            =   10761
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
         Left            =   11950
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
      Left            =   60
      ScaleHeight     =   345
      ScaleWidth      =   14220
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   7110
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
            TextSave        =   "2010/08/19"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            TextSave        =   "15:31"
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
Attribute VB_Name = "frmQPAV_CEnt140"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------------
'更新日付  案件/障害番号    修正理由
'20100809  1004091          ・抽出条件にある東西区分を削除
'                           　※東西のデータを一度に表示・印刷を行う
'                           ・新規帳票の出力追加
'----------------------------------------------------------------------------------------------
'*********************************************************************************************************************
'2005.05.06 Yasui@NBC 控除作成不備対応 賞与控除作成の作成処理に制限をかける
'*********************************************************************************************************************
Option Explicit
 Private blnInitFlg  As Boolean
 Private blnNoChangeEvFlg  As Boolean   'ﾁｪﾝｼﾞ ｲﾍﾞﾝﾄ 無効フラグ
 Dim lngFirstCnt As Long '''''''''''
 Dim lngRecCount As Long '''''''''''''''SP用
 
 Dim lngHigasiCount As Long '控除連絡表         東データ件数
 Dim lngNisiCount   As Long '控除連絡表         西データ件数
 Dim lngZanCount    As Long '未控除残高一覧表     データ件数

'2005.05.06 Yasui@NBC 控除作成不備対応  ==>
Private Const strDATE1 As String = "05"
Private Const strDATE2 As String = "26"
'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
'控除連絡表に見出しを表示用の変数
'控除確定日や賞与控除月が変更になった場合は、下記の修正が必要
Private Const strDATE3 As String = "15"         '給与控除連絡表の切り替わり日(毎月15日)
Private Const strDATE4 As String = "06"         '賞与控除月(6月)
Private Const strDATE5 As String = "0520"         '賞与控除月(12月)
Private Const strDATE6 As String = "0630"       '6月賞与控除確定日(5月20日)
Private Const strDATE7 As String = "12"       '6月賞与控除連絡表が出力できる最終日(6月30日)
Private Const strDATE8 As String = "1110"       '12月賞与控除確定日(11月10日)
Private Const strDATE9 As String = "1231"       '12月賞与控除連絡表が出力できる最終日(12月31日)
Private Const strDATE10 As String = "0518"      '給与控除作成時間
Dim strSyoriMMDDHHMI       As String
'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA END
Dim strKikan(2) As String
Dim intIDX      As Integer
'2005.05.06 Yasui@NBC 控除作成不備対応  <==

'****************************************************************************************
'* 賞与データ作成ボタン押下
'****************************************************************************************
Private Sub cmdInst_Click()

    '賞与控除最新日付取得
    Call gsubSPGetYM
    
    '処理年月
    gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
    
    '最新賞与控除作成年月チェック
    If Val(gstrBonusYM) >= Val(gstrSyoriYM) Then
        lblMsg.Caption = "この処理年月の賞与控除データは、既に作成されています。"
        Exit Sub
    End If

'2005.05.06 Yasui@NBC 控除作成不備対応 賞与控除作成の作成処理に制限をかける  ==>
    If strDATE1 >= Right(gstrSysDate, 2) Then
        lblMsg.Caption = "WPOE36 " & gstrGetCodeMeisyo(odbDatabase, "E36", "WPO") 'Msg = ５日まで、賞与控除データの作成を行えません。
        Exit Sub
    End If
    If strDATE2 <= Right(gstrSysDate, 2) Then
        lblMsg.Caption = "WPOE37 " & gstrGetCodeMeisyo(odbDatabase, "E37", "WPO") 'Msg = ２６日以降は、賞与控除データの作成を行えません。
        Exit Sub
    End If
'2005.05.06 Yasui@NBC 控除作成不備対応  <==
    
    If MsgBox("控除データ作成を開始します。よろしいですか？", vbQuestion + vbOKCancel, "控除連絡表印刷") = vbCancel Then
        Exit Sub
    End If
    
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    lblMsg.Caption = ""
    DoEvents
    
    '◆画面制御
    Call subGamenSeigyo(False)  '画面ロック
    
    '賞与控除データ作成
    If blnInstKoujyo = True Then
        lblMsg.Caption = "控除データ作成が終了しました。"
    Else
        lblMsg.Caption = "控除データ作成を中止しました。"
    End If
    
    '◆画面制御解除
    Call subGamenSeigyo(True)   '使用可
    stbSystem.Panels.Item(1).Text = ""

End Sub

Private Sub cmdPrint_Click(Index As Integer)
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String

    Select Case Index
        Case 0
            If MsgBox("プレビューを開始します。よろしいですか？", vbQuestion + vbOKCancel, "控除連絡表印刷") = vbCancel Then
                Exit Sub
            End If
            
'MOD 20100809 1004091 IMZ SHIBUTANI START
'            If lngHigasiCount > 0 Then
'                Call subPrintReport1(crptToWindow, "1") '東
'            End If
'            If lngNisiCount > 0 Then
'                Call subPrintReport1(crptToWindow, "2") '西
'            End If
            
            '東西合算して判定を行う
            If lngHigasiCount + lngNisiCount > 0 Then
                Call subPrintReport1(crptToWindow)
            End If
'MOD 20100809 1004091 IMZ SHIBUTANI END
            
            If lngZanCount > 0 Then
                Call subPrintReport2(crptToWindow)
            End If
            
            Call subPrintReport3(crptToWindow)

        Case 1
            If MsgBox("印刷を開始します。よろしいですか？", vbQuestion + vbOKCancel, "控除連絡表印刷") = vbCancel Then
                Exit Sub
            End If
            
'MOD 20100809 1004091 IMZ SHIBUTANI START
'            If lngHigasiCount > 0 Then
'                Call subPrintReport1(crptToPrinter, "1") '東
'            End If
'            If lngNisiCount > 0 Then
'                Call subPrintReport1(crptToPrinter, "2") '西
'            End If
            
            '東西合算して判定を行う
            If lngHigasiCount + lngNisiCount > 0 Then
                Call subPrintReport1(crptToPrinter)
            End If
'MOD 20100809 1004091 IMZ SHIBUTANI END
            
            If lngZanCount > 0 Then
                Call subPrintReport2(crptToPrinter)
            End If
            
            Call subPrintReport3(crptToPrinter)
    
    End Select

End Sub

Private Sub cobSyoriYM_Change()
    If optKbn(0).Value = True Then
        lblKyuuyo.Caption = cobSyoriYM.Text & "度給与分"
        lblKIKAN.Caption = ""       '2005.05.06 Yasui@NBC 控除作成不備対応
    Else
        lblKyuuyo.Caption = cobSyoriYM.Text & "度賞与分"
        '2005.05.06 Yasui@NBC 控除作成不備対応 ==>
        intIDX = IIf(cobSyoriYM.ListIndex <= 0, 0, cobSyoriYM.ListIndex)
        lblKIKAN.Caption = "抽出期間：" & strKikan(intIDX) & "/26～" & _
                                strKikan(intIDX + 1) & "/25"
        '2005.05.06 Yasui@NBC 控除作成不備対応 <==
    End If
End Sub

Private Sub cobSyoriYM_Click()
    Call cobSyoriYM_Change
End Sub

'**************************************************************************************************
'*Formロード
'**************************************************************************************************
Private Sub Form_Load()
    'ステータスバー初期化
    Call gsubInitStatusBar(stbSystem)
    
    'フォーム名設定
    Me.Caption = "控除連絡表印刷" & " (" & gstrCommandLine(8) & ")"
            
    'フラグ初期化
    blnInitFlg = True        '初期フラグ設定（初期）
    blnNoChangeEvFlg = True  'テキストボックスチェンジイベント（チェンジイベント無し）
    
    '一覧表クリア
    Call gsubSpdClear(sprList)

    'Spread Seet 保護
    sprList.Lock = True
    
    '画面初期化
    blnInitFlg = True
'    Call subInitScreen

End Sub

'**************************************************************************************************
'   Form_Activateイベント:セッションの確立
'                        :データベース確立
'**************************************************************************************************
Private Sub Form_Activate()

    If blnInitFlg Then
        stbSystem.Panels.Item(1).Text = "処理中．．．"    'ステータスバーメッセージ
        Call subGamenSeigyo(False)                         '画面ロック
        DoEvents
        
        'オラクルセッションの確立
        If Not gblnCreateOracleSession() Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "控除連絡表印刷 (" & gstrCommandLine(8) & ")" _
                                    , CStr(Err.Number), Err.Description)
            '終了
            Unload Me
            Exit Sub
        End If

        'データベースの確立
        If Not gblnConnectOracleDatabase(gstrCommandLine(3), gstrCommandLine(4) _
                                    , gstrCommandLine(0)) Then
            'システムエラー
            Call QSAV_SysErr.subSysErr(gcstrPrjName, gstrCommandLine(1) _
                                    , gstrCommandLine(5), gstrGetErrDateFormat _
                                    , "控除連絡表印刷 (" & gstrCommandLine(8) & ")" _
                                    , objSession.LastServerErr, objSession.LastServerErrText)
            '終了
            Unload Me
            Exit Sub
        End If
        
        Call gsubSPInit                     '初期処理用ＳＰ(システム日付)
        Call subGamenSeigyo(True)           '画面ロック解除
        Call subInitScreen                  '画面初期化
        Call subGamenSeigyo(True)           '画面ロック解除
        stbSystem.Panels.Item(1).Text = ""  'ステータスバーメッセージ消去
               
        blnInitFlg = False
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
'*** 11/05 賞与データ作成追加 ***
            If cmdInst.Enabled = True Then
                '賞与控除最新日付取得
                Call gsubSPGetYM
                '処理年月
                gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
                '最新賞与控除作成年月チェック
                If Val(gstrBonusYM) < Val(gstrSyoriYM) Then
'2005.05.06 Yasui@NBC 控除作成不備対応 賞与控除作成の作成処理に制限をかける  ==>
'                    If MsgBox("控除データが作成されていませんが、作成しますか？", vbQuestion + vbYesNo, "控除連絡表印刷") = vbYes Then
'                        '賞与控除データ作成
'                        If InstKoujo = False Then
'                            lblMsg.Caption = "控除データ作成を中止しました。"
'                            Exit Sub
'                        End If
'                    End If
                    If strDATE1 < Right(gstrSysDate, 2) And _
                       strDATE2 > Right(gstrSysDate, 2) Then
                        If MsgBox("控除データが作成されていませんが、作成しますか？", vbQuestion + vbYesNo, "控除連絡表印刷") = vbYes Then
                            '賞与控除データ作成
                            If InstKoujo = False Then
                                lblMsg.Caption = "控除データ作成を中止しました。"
                                Exit Sub
                            End If
                        End If
                    End If
'2005.05.06 Yasui@NBC 控除作成不備対応 <==
                End If
            End If
            Call subInitScreen
            cobSyoriYM.SetFocus
    End Select
    
End Sub

'****************************************
'*エラー解除処理
'****************************************
Private Sub subErrKaijo()
    lblMsg.Caption = ""
End Sub

'*************************************************************************************************
'*実行ボタン処理
'*************************************************************************************************
Private Sub subCmdJikkou()
    Dim strErrMsg As String 'エラーメッセージ
    Dim strWrk    As String
    Dim i         As Long
'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
    Dim objTable  As Object
    Dim strSQL    As String

    'ｾｯﾄﾌｫｰｶｽして強制的に各ｺﾝﾄﾛｰﾙをLost_Focusさせる
    cmdPFK(5).SetFocus
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    lblMsg.Caption = ""
    DoEvents
    
    '◆画面制御
    Call subGamenSeigyo(False)          '画面ロック
    
    '処理年月
    gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
    
    '処理区分
    If optKbn(0).Value = True Then
        gstrSyoriKbn = "1"      '給与
    Else
        gstrSyoriKbn = "2"      '賞与
    End If
'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
    '実行時間の取得
    'SQL文の作成
    strSQL = "SELECT" _
        & " TO_CHAR(SYSDATE,'MMDDHH24MI')" _
        & " FROM" _
        & " DUAL"

        '抽出実行
    If Not gblnOpenOracleTable(objTable, strSQL) Then
        strSyoriMMDDHHMI = "00000000"
    Else
        strSyoriMMDDHHMI = objTable.Fields("TO_CHAR(SYSDATE,'MMDDHH24MI')").Value
    End If
'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA END
    
    '控除連絡表データ作成
    If blnGetKoujyo Then
    
'2003/01/20 追加
        '未控除連絡表のデータ作成
        Call blnMakeMekoujyo
'2003/01/20 追加

        '画面制御
        Call subGamenSeigyo(True) '使用可
        sprList.Enabled = True
        sprList.SetFocus
        '控除連絡表データスプレット表示
        Call subDispList
        cobSyoriYM.Enabled = False
        optKbn(0).Enabled = False
        optKbn(1).Enabled = False
        cmdPrint(0).Enabled = True
        cmdPrint(1).Enabled = True
        cmdPFK(5).Enabled = False
'**** 11/02 賞与データ作成追加 ****
        If optKbn(0).Value = True Then  '給与
            cmdInst.Enabled = False
        Else                            '賞与
            cmdInst.Enabled = True
        End If
    Else
        '画面制御
        Call subGamenSeigyo(True) '使用可
        lblMsg.Caption = "WPOE10 " & gstrGetCodeMeisyo(odbDatabase, "E10", "WPO") 'Msg = 該当データが存在しません
    End If

    stbSystem.Panels.Item(1).Text = ""
    
End Sub

'**************************************************************************************************
'   Form_Unloadイベント
'**************************************************************************************************
Private Sub Form_Unload(Cancel As Integer)

'*** 11/05 賞与データ作成追加 ***
    If cmdInst.Enabled = True Then
        '賞与控除最新日付取得
        Call gsubSPGetYM
        '処理年月
        gstrSyoriYM = Left$(cobSyoriYM, 4) & Right$(cobSyoriYM, 2)
        '最新賞与控除作成年月チェック
        If Val(gstrBonusYM) < Val(gstrSyoriYM) Then
'2005.05.06 Yasui@NBC 控除作成不備対応 賞与控除作成の作成処理に制限をかける ==>
'            If MsgBox("控除データが作成されていませんが、作成しますか？", vbQuestion + vbYesNo, "控除連絡表印刷") = vbYes Then
'                '賞与控除データ作成
'                If InstKoujo = False Then
'                    lblMsg.Caption = "控除データ作成を中止しました。"
'                    Exit Sub
'                End If
'            End If
            If strDATE1 < Right(gstrSysDate, 2) And _
               strDATE2 > Right(gstrSysDate, 2) Then
                If MsgBox("控除データが作成されていませんが、作成しますか？", vbQuestion + vbYesNo, "控除連絡表印刷") = vbYes Then
                    '賞与控除データ作成
                    If InstKoujo = False Then
                        lblMsg.Caption = "控除データ作成を中止しました。"
                        Exit Sub
                    End If
                End If
            End If
'2005.05.06 Yasui@NBC 控除作成不備対応 <==
        End If
    End If

    '使用ワークテーブル全削除
    Call subDelWorkTbl

    'ｵﾗｸﾙｾｯｼｮﾝの切断
    Call gsubTermOracleDB

    Set frmQPAV_CEnt140 = Nothing
End Sub

Private Sub optKbn_Click(Index As Integer)

    '給与の場合
    If Index = 0 Then
       If Right(gstrSysDate, 2) > 15 Then
            cobSyoriYM.ListIndex = 1
       Else
            cobSyoriYM.ListIndex = 0
       End If
       'cobSyoriYM.Enabled = False
       cobSyoriYM.Locked = True
            
        lblKyuuyo.Caption = cobSyoriYM.Text & "度給与分"
    
        lblKIKAN.Caption = ""       '2005.05.06 Yasui@NBC 控除作成不備対応
    
    '賞与の場合
    Else
        'cobSyoriYM.Enabled = True
        cobSyoriYM.Locked = False
        lblKyuuyo.Caption = cobSyoriYM.Text & "度賞与分"
    
        '2005.05.06 Yasui@NBC 控除作成不備対応 ==>
        intIDX = IIf(cobSyoriYM.ListIndex <= 0, 0, cobSyoriYM.ListIndex)
        lblKIKAN.Caption = "抽出期間：" & strKikan(intIDX) & "/26～" & _
                                strKikan(intIDX + 1) & "/25"
        '2005.05.06 Yasui@NBC 控除作成不備対応 <==
    
    End If
    
End Sub

'*********************************************************************************************
'*　　手続き名：　控除連絡表データ　作成＆取得
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*********************************************************************************************
Private Function blnGetKoujyo()

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long
Dim lngFirstCnt          As Long  '
Dim lngRecCount          As Long  '
Dim lngMax               As Long  '
   
Const cnsMaxRec As Long = 30


On Error GoTo errGetKoujyo
    
    blnGetKoujyo = False
    lngHigasiCount = 0      '控除連絡表         東データ件数
    lngNisiCount = 0        '控除連絡表         西データ件数
    lngZanCount = 0         '未控除残高一覧表     データ件数

    '控除連絡表作成＆取得 ＳＰ
    odbDatabase.Parameters.Add "InStrSyoriKbn", gstrSyoriKbn, ORAPARM_INPUT     '社員コード１
    odbDatabase.Parameters.Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT     '社員コード２
    
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
    '控除連絡表データ 配列
    odbDatabase.Parameters.AddTable "OtStrDataAry", ORAPARM_OUTPUT, ORATYPE_VARCHAR2, cnsMaxRec, 200
    
    '控除連絡表     東データ件数
    odbDatabase.Parameters.Add "OtNumHigasiCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumHigasiCount").ServerType = ORATYPE_NUMBER
    '控除連絡表     西データ件数
    odbDatabase.Parameters.Add "OtNumNisiCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumNisiCount").ServerType = ORATYPE_NUMBER
    '未控除残高一覧表 データ件数
    odbDatabase.Parameters.Add "OtNumZanCount", 0, ORAPARM_OUTPUT
    odbDatabase.Parameters("OtNumZanCount").ServerType = ORATYPE_NUMBER
    
    '担当者コード
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
    odbDatabase.Parameters("InStrUserID").ServerType = ORATYPE_VARCHAR2
    'コンピュータ名
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
    odbDatabase.Parameters("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    
    '検索終了フラグ
    odbDatabase.Parameters.Add "OtstrEndFlg", "0", ORAPARM_OUTPUT
    odbDatabase.Parameters("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2

    'ＳＱＬ文作成
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140GetKoujyo(" & _
    ":InStrSyoriKbn," & _
    ":InStrSyoriYM," & _
    ":InNumMaxRec," & _
    ":IoNumFetchCount," & _
    ":IoNumRecCount," & _
    ":OtNumAryCount," & _
    ":OtStrDataAry," & _
    ":OtNumHigasiCount," & _
    ":OtNumNisiCount," & _
    ":OtNumZanCount," & _
    ":InStrUserID," & _
    ":InStrComputerNM," & _
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

            '抽出件数が0件の場合
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
'        lngRecCount = lngRecCount + odbDatabase.Parameters("OtNumAryCount")    '【Win2000対応】Del by Yokoyama@NBC 2004/04/19
        lngRecCount = lngRecCount + CLng(odbDatabase.Parameters("OtNumAryCount"))     '【Win2000対応】Add by Yokoyama@NBC 2004/04/19
        
        For j = lngFirstCnt To lngRecCount
            '控除連絡表集約データ
            gDataAry(j) = odbDatabase.Parameters("OtStrDataAry").Get_Value(j - 1)
        Next j
        
        i = i + 1

    Loop Until odbDatabase.Parameters("OtstrEndFlg") = "1"  '終了フラグ＝１まで

    lngHigasiCount = odbDatabase.Parameters("OtNumHigasiCount") '控除連絡表         東データ件数
    lngNisiCount = odbDatabase.Parameters("OtNumNisiCount")     '控除連絡表         西データ件数
    lngZanCount = odbDatabase.Parameters("OtNumZanCount")       '未控除残高一覧表     データ件数
    
    If lngHigasiCount > 0 Or lngNisiCount > 0 Or lngZanCount > 0 Then
        blnGetKoujyo = True
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    Exit Function

errGetKoujyo:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'***********************************************************************************
'    一覧表表示
'***********************************************************************************
Private Sub subDispList()
 Dim i             As Long   '
 Dim lngKensuu     As Long
 Dim strValue      As String '項目値文字列
 Dim StrDate       As String '項目値文字列

    '総件数
    lngKensuu = UBound(gDataAry())

    With sprList
        .ReDraw = False
                
        'ｽﾌﾟﾚｯﾄﾞｼｰﾄのMaxRowを設定(max20をこえたら設定する
'        If lngKensuu > 20 Then
            .MaxRows = lngKensuu
 '       Else
'            .MaxRows = 20
'        End If
        
        '1回の件数
        For i = 1 To lngKensuu
                   
            '証書明細１レコード
            StrDate = gDataAry(i)
        
            '以下一覧表示用
            
            '清算店コード
            strValue = Trim$(gfncstrDlm2(StrDate, 1))
            .SetText 1, i, strValue
            '清算店名
            strValue = Trim$(gfncstrDlm2(StrDate, 2))
            .SetText 2, i, strValue
            '件数
            strValue = Trim$(gfncstrDlm2(StrDate, 3))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 3, i, strValue
            
            '金額合計
            strValue = Trim$(gfncstrDlm2(StrDate, 4))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 4, i, strValue
            
            '元金合計
            strValue = Trim$(gfncstrDlm2(StrDate, 5))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 5, i, strValue
            '利息合計
            strValue = Trim$(gfncstrDlm2(StrDate, 6))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 6, i, strValue
            '残高合計
            strValue = Trim$(gfncstrDlm2(StrDate, 7))
            strValue = Format$(CDbl(strValue), "#,##0")
            .SetText 7, i, strValue

            .RowHeight(i) = 9.55
            
        Next i
        
        .ReDraw = True
    
    End With

End Sub

'クリスタルレポート
'MOD 20100809 1004091 IMZ SHIBUTANI START
'引数：strTozaiKBN As String　を削除
'Private Sub subPrintReport1(intDestinationConstants As DestinationConstants, strTozaiKBN As String)
Private Sub subPrintReport1(intDestinationConstants As DestinationConstants)
'MOD 20100809 1004091 IMZ SHIBUTANI END

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String

    strWareki = Format$(cobSyoriYM & "/01", "gggeemmdd")
    strNen = Mid$(strWareki, 3, 2)
    strNen = StrConv(strNen, vbWide)
    strWareki = Left$(strWareki, 2)
    strTuki = StrConv(Format$(Val(Right$(cobSyoriYM, 2)), "##"), vbWide)
    
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt140.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAO_KOJOW"
        
        'パラメータを記述する
        .Formulas(0) = "PARA01='" & strWareki & strNen & "'"
        .Formulas(1) = "PARA02='" & strTuki & "'"
        If gstrSyoriKbn = "1" Then
            .Formulas(2) = "PARA03='給与'"
        Else
            .Formulas(2) = "PARA03='賞与'"
        End If
            
        'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA START
        If gstrSyoriKbn = "1" Then
            
            If Mid(strSyoriMMDDHHMI, 3, 4) >= strDATE10 And Mid(strSyoriMMDDHHMI, 3, 2) <= strDATE3 Then
                '給与控除確定日から給与控除連絡表の切り替わり日まで(毎月5日～15日)
                .Formulas(3) = "PARA04='【確定後】'"
            Else
                .Formulas(3) = "PARA04='【確定前】'"
            End If
        
        Else
            '賞与控除月が6月
            If Right$(cobSyoriYM, 2) = strDATE4 Then
                
                '帳票出力日が賞与控除確定日から賞与控除連絡表が出力できる最終日(5月20日～6月30日)
                If Right(gstrSysDate, 4) >= strDATE5 And Right(gstrSysDate, 4) <= strDATE6 Then
                    .Formulas(3) = "PARA04='【確定後】'"
                Else
                    .Formulas(3) = "PARA04='【確定前】'"
                End If
            
            '処理年月が12月
            ElseIf Right$(cobSyoriYM, 2) = strDATE7 Then
                
                '帳票出力日が賞与控除確定日から賞与控除連絡表が出力できる最終日(11月10日～12月31日)
                If Right(gstrSysDate, 4) >= strDATE8 And Right(gstrSysDate, 4) <= strDATE9 Then
                    .Formulas(3) = "PARA04='【確定後】'"
                Else
                    .Formulas(3) = "PARA04='【確定前】'"
                End If
            
            '処理年月が6月・12月以外
            Else
                .Formulas(3) = "PARA04='【確定前】'"
            End If
        
        End If
        'ADD 0811051 グループ社員証書貸付帳票見直し NBC ISHIDA END

'****** 2001/10/11 東西区分が０の人に対応 ******
        
        '抽出条件を記述する
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        If strTozaiKBN = "1" Then
'            strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '0' OR {QPAO_KOJOW.QPAO_TOZAIKBN} = '1')" & _
                             " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'        Else
'            strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '" & strTozaiKBN & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                             " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'        End If
'        '抽出条件を記述する
'        strSelectionFormula = "({QPAO_KOJOW.QPAO_TOZAIKBN} = '" & strTozaiKBN & "')" & _
'                         " AND ({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
'                         " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
        
        strSelectionFormula = "({QPAO_KOJOW.QPAO_USERID} = '" & gstrCommandLine(1) & "')" & _
                         " AND ({QPAO_KOJOW.QPAO_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula

        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "控除連絡表 (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   控除連絡合計表の出力
        '----------------------------------------------------------------------
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt143.rpt"
        .DiscardSavedData = True

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "控除連絡合計表 (" & gstrCommandLine(8) & ")"

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
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

Private Sub subPrintReport2(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String
    
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt141.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAP_MIKOJOW"
        
        '抽出条件を記述する
        strSelectionFormula = "    ({QPAP_MIKOJOW.QPAP_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPAP_MIKOJOW.QPAP_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula
        
        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "未控除残高一覧表 (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   未控除残高一覧合計表の出力
        '----------------------------------------------------------------------
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt144.rpt"
        .DiscardSavedData = True

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "未控除残高一覧合計表 (" & gstrCommandLine(8) & ")"

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
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

Private Sub subPrintReport3(intDestinationConstants As DestinationConstants)

Dim strSelectionFormula As String
Dim strConectPoint      As String
Dim intRet              As Integer
Dim strWareki           As String
Dim strNen              As String
Dim strTuki             As String
    
    'アクセスするデータベースなどを記述
    strConectPoint = "DSN = " & gstrCommandLine(0) & _
                    ";UID = " & gstrCommandLine(3) & _
                    ";PWD = " & gstrCommandLine(4)

    With CrystalReport
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt142.rpt"
        .DiscardSavedData = True

        '記述されたアクセスポイントに接続
        .Connect = strConectPoint

        'ロケーションの設定
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPAQ_ZANDAKAW"
        .DataFiles(0) = Format$(gstrCommandLine(3), ">") & ".QPB8_MIKOJORENW"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '抽出条件を記述する
'MOD 20100809 1004091 IMZ SHIBUTANI START
'        strSelectionFormula = "    ({QPAQ_ZANDAKAW.QPAQ_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPAQ_ZANDAKAW.QPAQ_COMPUTERNM} = '" & gstrCommandLine(5) & "')"

        strSelectionFormula = "    ({QPB8_MIKOJORENW.QPB8_USERID} = '" & gstrCommandLine(1) & "')" & _
                              "AND ({QPB8_MIKOJORENW.QPB8_COMPUTERNM} = '" & gstrCommandLine(5) & "')"
'MOD 20100809 1004091 IMZ SHIBUTANI END
        
        '抽出条件を記述する
        .SelectionFormula = strSelectionFormula

        '出力先設定
        .Destination = intDestinationConstants

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "未控除連絡一覧表 (" & gstrCommandLine(8) & ")"

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
'DEL 20100809 1004091 IMZ SHIBUTANI START
'        .Reset
'DEL 20100809 1004091 IMZ SHIBUTANI END

'ADD 20100809 1004091 IMZ SHIBUTANI START
        '----------------------------------------------------------------------
        '   未控除連絡一覧合計表の出力
        '----------------------------------------------------------------------
        'クリスタルレポートのファイルがある場所を記述する
        .ReportFileName = App.Path & "\QPAV_CEnt145.rpt"
        .DiscardSavedData = True

        'プレビューウィンドウの設定
        If intDestinationConstants = crptToWindow Then

            .WindowTitle = "未控除連絡一覧合計表 (" & gstrCommandLine(8) & ")"

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
'ADD 20100809 1004091 IMZ SHIBUTANI END
    End With
    
End Sub

'*********************************************************************************
'*   画面制御
'*　　引数：blnEnabledFlg=True 画面使用不可      blnEnabledFlg=False 画面使用可
'*********************************************************************************
Private Sub subGamenSeigyo(blnEnabledFlg As Boolean)
    If blnEnabledFlg = True Then
        Me.MousePointer = vbDefault   'マウスポインター（ノーマル）
        Me.Enabled = True             '画面操作可
    Else
        Me.MousePointer = vbHourglass 'マウスポインター（砂時計）
        DoEvents
        Me.Enabled = False            '画面操作不可
    End If
End Sub

'***********************************************************************************
'    画面初期化
'***********************************************************************************
Private Sub subInitScreen()
 Dim i As Long
 Dim strTmp As String
 Dim ymd    As Date

    blnNoChangeEvFlg = True
    
    'ComboBox設定
    '処理年月
    ymd = CVDate(Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2) & "/" & Mid$(gstrSysDate, 7, 2))
    With cobSyoriYM
        .Clear
        .AddItem (Mid$(gstrSysDate, 1, 4) & "/" & Mid$(gstrSysDate, 5, 2))
        .AddItem (Format(DateAdd("m", 1, ymd), "yyyy/mm"))
        If Day(ymd) > 15 Then
            .ListIndex = 1
        Else
            .ListIndex = 0
        End If
    End With

    '2005.05.06 Yasui@NBC 控除作成不備対応 ==>
    strKikan(0) = Format(DateAdd("m", -1, ymd), "yyyy/mm")
    strKikan(1) = Format(ymd, "yyyy/mm")
    strKikan(2) = Format(DateAdd("m", 1, ymd), "yyyy/mm")
    '2005.05.06 Yasui@NBC 控除作成不備対応 <==
    
    'エラーメッセージクリア
    lblMsg.Caption = ""

    '給与、賞与ボタン
    optKbn(0).Value = True
    lblKyuuyo.Caption = cobSyoriYM.Text & "度給与分"
    
    cobSyoriYM.Enabled = True
    optKbn(0).Enabled = True
    optKbn(1).Enabled = True
    cmdPFK(5).Enabled = True
    cmdPrint(0).Enabled = False
    cmdPrint(1).Enabled = False
'**** 11/02 賞与データ作成追加 ****
    cmdInst.Enabled = False

     'Spred Sheetの初期化
    Call gsubSpdClear(sprList)
    sprList.MaxRows = 0
    

    blnNoChangeEvFlg = False
    
End Sub

'****************************************************************************************
'* 使用ワークテーブル全削除
'****************************************************************************************
Private Sub subDelWorkTbl()
 Dim strSQL As String
 
 On Error GoTo errDelWorkTbl
 
    'ユーザーＩＤ
    With odbDatabase.Parameters
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        'コンピュータ名
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
    End With
    
    strSQL = "BEGIN QPAP_CEnt320PkG.QPAP_CEnt320DelWorkTbl(" & _
             ":InStrUserID," & ":InStrComputerNM); END;"

    'ストアドプロシージャ起動
    odbDatabase.DbexecuteSQL (strSQL)

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
    
'****************************************************************************************
'* 賞与データ作成指示
'****************************************************************************************
Private Function InstKoujo() As Boolean

    InstKoujo = False
    
    'ステータスバーメッセージ
    stbSystem.Panels.Item(1).Text = "処理中．．．"
    lblMsg.Caption = ""
    DoEvents
    
    '◆画面制御
    Call subGamenSeigyo(False)  '画面ロック
    
    '賞与控除データ作成
    If blnInstKoujyo = False Then
        GoTo Exit_InstKoujo
    End If
    
    InstKoujo = True
    
Exit_InstKoujo:
    '◆画面制御解除
    Call subGamenSeigyo(True)   '使用可
    stbSystem.Panels.Item(1).Text = ""

End Function

'****************************************************************************************
'* 賞与データ作成処理
'****************************************************************************************
Private Function blnInstKoujyo() As Boolean

    Dim strSQL               As String

On Error GoTo errInstKoujyo

    blnInstKoujyo = False
    
    'ＳＰ
    odbDatabase.Parameters.Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT               '処理年月
    odbDatabase.Parameters.Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT         '担当者コード
    odbDatabase.Parameters.Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT     'コンピュータ名

    'ＳＱＬ分の作成
    strSQL = "BEGIN QPAP_CEnt140PkG.QPAP_CEnt140KojoTKousin (" & _
            ":InStrSyoriYM,:InStrUserID,:InStrComputerNM); END;"

    'ＳＰの実行
    odbDatabase.DbexecuteSQL (strSQL)
    
    If odbDatabase.LastServerErr <> 0 Then
        GoTo errInstKoujyo
    End If
    
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    blnInstKoujyo = True
    
    Exit Function
  
errInstKoujyo:
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

End Function

'*********************************************************************************************
'*　　手続き名：　未控除連絡表データ　作成
'*　　引　数　：　なし
'*　　結　果　：　True…該当データ有  False…該当データ無し
'*********************************************************************************************
Private Function blnMakeMekoujyo() As Boolean

Dim strSQL               As String
Dim i                    As Long
Dim j                    As Long

On Error GoTo errblnMakeMekoujyo
    
    blnMakeMekoujyo = False

    '控除連絡表作成＆取得 ＳＰ

    With odbDatabase.Parameters
        .Add "InStrSyoriYM", gstrSyoriYM, ORAPARM_INPUT                 '処理年月(コンボボックスの中身)
        
        .Add "InStrUserID", gstrCommandLine(1), ORAPARM_INPUT           'ユーザーID
        .Item("InStrUserID").ServerType = ORATYPE_VARCHAR2
        
        .Add "InStrComputerNM", gstrCommandLine(5), ORAPARM_INPUT       'コンピューター名
        .Item("InStrComputerNM").ServerType = ORATYPE_VARCHAR2
        
        .Add "OtstrEndFlg", "0", ORAPARM_OUTPUT                         '終了フラグ
        .Item("OtstrEndFlg").ServerType = ORATYPE_VARCHAR2
    End With

    'ＳＱＬ文作成
    strSQL = "BEGIN QPAP_CEnt320PkG.QPAP_CEnt320GetKoujyo(" & _
    ":InStrSyoriYM," & _
    ":InStrUserID," & _
    ":InStrComputerNM," & _
    ":OtstrEndFlg); END;"

    'ＳＰの実行
    Call odbDatabase.DbexecuteSQL(strSQL)

    If odbDatabase.Parameters("OtstrEndFlg") <> 1 Then
        'オブジェクトの開放
        Call gsubParaRemove(odbDatabase)
        Exit Function
    End If
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)

    Exit Function

errblnMakeMekoujyo:
'エラー処理
    'エラーメッセージ表示
    Call gsubDBErrorMessage(gstrCommandLine(8), gcstrPrjName, _
                           gstrCommandLine(3), gstrCommandLine(5), gstrGetErrDateFormat)
    'オブジェクトの開放
    Call gsubParaRemove(odbDatabase)
    Err.Clear
End Function
