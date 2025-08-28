#!/bin/csh
#　 スクリプト名 ： qtab_s000101.csh
#　 機  能       ： 会員マスタデータファイル作成
#　 作成者       ： 江口
#　 作成日       ： 2006/08/06
#     引  数：$1 --- 処理回数                         (必須)
#             $2 --- 受信ディレクトリ                 (必須)
#             $3 --- 作業ディレクトリ                 (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生

##################################
#           環境設定             #
##################################
set    SHELL_NAME   = $0
setenv JOB_ID         $SHELL_NAME:t 
setenv JOBNET_ID      'qtab_s000101'
set    LOGWRITE     = $EXE_DIR/QUAJ_MSGLOG.BAT
set    SINFILE      = qtaf_kaiin9_$1.hft        # 受信ファイル
set    SOTFILE1     = qtab_s000100.dat$1.1      # 作業用ファイル１
set    SOTFILE2     = qtab_s000100.dat$1.2      # 作業用ファイル２
set    QT_DATA_DIR  = $2                        # ＨＵＬＦＴ受信用ディレクトリ
set    QT_WORK_DIR  = $3                        # 作業用ディレクトリ
set    KINOU        = '会員マスタデータファイル作成処理'

#########################################
# ファイル作成                          #
#########################################
$LOGWRITE "COBOL" I "開始:$KINOU $1" "qtab_s000100"
setenv INFILE  $QT_DATA_DIR/$SINFILE
setenv OTFILE  $QT_WORK_DIR/$SOTFILE1
setenv OTFILE2 $QT_WORK_DIR/$SOTFILE2

$EXE_DIR/qtab_s000100_iko.exe >& $USER_LOG_DIR/$SINFILE.log
if($status != 0) then
   $LOGWRITE "COBOL" E "失敗:$KINOU $1" "qtab_s000100"
   exit(1)
endif

$LOGWRITE "COBOL" I "終了:$KINOU $1" "qtab_s000100"

exit 0
