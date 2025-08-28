#
#  データベース起動  (QUAJ_DBSTART.BAT)
#
#     機  能：入力パラメータで指定されたSIDのインスタンスを起動する。
#     引  数：$1 --- SID                         (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#             2 --- パラメータエラー
#
set  MODULE   = QUAJ_DBSTART
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"

$LOGWRITE  "データベース[SID:$1] 起動開始" >> $LOGFILE

if ( $#argv < 1 ) then
	$LOGWRITE "パラメータ数不足" >> $LOGFILE
    exit 2
endif

setenv ORACLE_SID $1

set SPFILE = ${ORACLE_HOME}/dbs/spfile${ORACLE_SID}.ora
if ( ! -f $SPFILE ) then
    $LOGWRITE  "SID=[${ORACLE_SID}]の初期化ﾊﾟﾗﾒｰﾀﾌｧｲﾙ無し" >> $LOGFILE
    exit 1
endif

set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`
if ( $PRCNUM > 2 ) then
    $LOGWRITE  "DB稼動中の疑い有り"  >> $LOGFILE
    exit 1
endif

sqlplus << EOF  >> $LOGFILE
$DBA_UID/$DBA_PWD as sysdba
startup
EOF

set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "DB起動失敗[RC=$RC]" >> $LOGFILE 
    exit 1
endif

sleep 30


set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`
if ( $PRCNUM < 6 ) then
    $LOGWRITE  "DB起動失敗(常駐ﾌﾟﾛｾｽ非稼動)" >> $LOGFILE
    exit 1
endif

#################################
#   スレッド状態確認		#
#   1999.8.4 追加		#
#################################
$EXE_DIR/QUAJ_DBSTGET.BAT $1
if ( $status != 0 ) then
	$LOGWRITE  "データベース[SID:$ORACLE_SID] スレッドノットオープン" >> $LOGFILE
	$LOGWRITE  "データベース[SID:$ORACLE_SID] 起動異常終了" >> $LOGFILE
	exit 1
endif

$LOGWRITE  "データベース[SID:$ORACLE_SID] 起動正常終了" >> $LOGFILE

exit 0
