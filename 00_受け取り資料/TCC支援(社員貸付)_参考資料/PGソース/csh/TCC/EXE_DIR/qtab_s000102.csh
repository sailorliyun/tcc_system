#!/bin/csh
#　 スクリプト名 ： qtab_s000102
#　 機  能       ： 会員マスタデータ追加
#　 作成者       ： 江口
#　 作成日       ： 2006/08/06
#     引  数：$1 --- 処理回数                         (必須)
#             $2 --- 作業ディレクトリ                 (必須)
#             $3 --- コントロールディレクトリ         (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生

##################################
#           環境設定             #
##################################
set    SHELL_NAME    = $0
setenv JOB_ID          $SHELL_NAME:t 
setenv JOBNET_ID       'qtab_s000100'
set    LOGWRITE      = $EXE_DIR/QUAJ_MSGLOG.BAT
set    SOTFILE1      = qtab_s000100.dat$1.1                   # 作業用ファイル１
set    SOTFILE2      = qtab_s000100.dat$1.2                   # 作業用ファイル２
set    QT_WORK_DIR   = $2                                     # 作業用ディレクトリ
set    WLDR_CTRL_DIR = $3                                     # ローダー用ディレクトリ

set    KINOU         = '会員マスタデータ追加処理'

#########################################
# STEP-1 データ登録１                   #
#########################################
$LOGWRITE "SQL-LOADER1" I "開始:$KINOU 1" "qtab_s000102"

#MOD 0808052 ＴＣＣ支援システムの再構築     20090329 murayama start
sqlldr   $DB_USERID/$DB_PASSWORD@$ORACLE_SID       \
         $WLDR_CTRL_DIR/qtad_kaiin_iko.sql         \
   data   = $QT_WORK_DIR/$SOTFILE1                 \
   log    = $WLDR_CTRL_DIR/$SOTFILE1.log           \
   bad    = $WLDR_CTRL_DIR/$SOTFILE1.bad           \
   errors = 1000                                   \
   direct = true
#MOD 0808052 ＴＣＣ支援システムの再構築     20090329 murayama end


if($status != 0) then
   $LOGWRITE "SQL-LOADER1" E "失敗:$KINOU 1" "qtab_s000102"
   exit(1)
endif

$LOGWRITE "SQL-LOADER1" I "終了:$KINOU 1" "qtab_s000102"

#########################################
# STEP-2 データ登録２                   #
#########################################
$LOGWRITE "SQL-LOADER2" I "開始:$KINOU 2" "qtab_s000102"

#MOD 0808052 ＴＣＣ支援システムの再構築     20090329 murayama start
sqlldr   $DB_USERID/$DB_PASSWORD@$ORACLE_SID       \
         $WLDR_CTRL_DIR/qtad_kaiin_iko.sql         \
   data   = $QT_WORK_DIR/$SOTFILE2                 \
   log    = $WLDR_CTRL_DIR/$SOTFILE2.log           \
   bad    = $WLDR_CTRL_DIR/$SOTFILE2.bad           \
   errors = 1000                                   \
   direct = true
#MOD 0808052 ＴＣＣ支援システムの再構築     20090329 murayama end

if($status != 0) then
   $LOGWRITE "SQL-LOADER2" E "失敗:$KINOU 2" "qtab_s000102"
   exit(1)
endif

$LOGWRITE "SQL-LOADER2" I "終了:$KINOU 2" "qtab_s000102"

exit 0
