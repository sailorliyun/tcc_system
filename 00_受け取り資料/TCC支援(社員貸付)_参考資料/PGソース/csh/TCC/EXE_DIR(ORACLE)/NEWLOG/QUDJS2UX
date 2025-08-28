#!/bin/csh
#
#  オラクル開始[日次処理開始前]  (QUDJS2UX)
#
#     機  能：1.主データベースを起動する。
#             2.コンスログライタを起動する。  ADD '99.05.11 
#     引  数：
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
set  SHELL_NAME = $0                                    			# シェル名
set  MODULE   =  $SHELL_NAME:t                          			# モジュール名
set  LOGFILE  = $USER_LOG_DIR/db_ope.log                			# ログファイル名
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"  			# ログ出力用共通シェル

if ( $#argv == 1 ) then								# 引数が指定されていた場合
    setenv ORACLE_SID   $1							# 環境変数ORACLE_SIDを設定
endif

#echo $MODULE " : " $ORACLE_SID

$LOGWRITE  "オラクル開始\[日次処理\]" >> $LOGFILE

#########################
# 1. 主データベース開始 #
#########################
#$EXE_DIR/QUAJ_DBSTART.BAT  tcc
#$EXE_DIR/QUAJ_DBSTART.BAT  PT1
$EXE_DIR/QUAJ_DBSTART.BAT  $ORACLE_SID						# 環境変数を用いてＤＢ起動
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

$LOGWRITE  "オラクル開始\[日次処理\]正常終了" >> $LOGFILE

####################################################
# 2.   コンスログライタ起動(バックグランドシェル)  #
####################################################
$EXE_DIR/QUAJ_LWTRSTART.BAT  conslog  $ORACLE_SID &				# 非同期モードにてコンソールログライタの起動
set RC = $status
if ( $RC != 0 ) then
    exit 1
endif

echo "ConslogWriter Normaly Starting"
$LOGWRITE  "ConslogWriter Normaly Starting" >> $LOGFILE

exit 0
