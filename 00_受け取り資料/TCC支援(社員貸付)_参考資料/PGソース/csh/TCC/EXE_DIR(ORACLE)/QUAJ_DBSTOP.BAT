#
#  データベース停止  (QUAJ_DBSTOP.BAT)
#
#     機  能：入力パラメータで指定されたSIDのインスタンスを停止する。
#     引  数：$1 --- SID                         (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#             2 --- パラメータエラー
#
set  MODULE   = QUAJ_DBSTOP
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"

$LOGWRITE  "データベース[SID:$1] 停止開始" >> $LOGFILE

if ( $#argv < 1 ) then
	$LOGWRITE "パラメータ数不足" >> $LOGFILE
    exit 2
endif

setenv ORACLE_SID $1

set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`
if ( $PRCNUM < 1 ) then
    $LOGWRITE  "DBは稼動していない"  >> $LOGFILE
    exit 1
endif

sqlplus << EOF  >> $LOGFILE
$DBA_UID/$DBA_PWD as sysdba
shutdown immediate
EOF

set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "DB停止失敗[RC=$RC]" >> $LOGFILE 
    exit 1
endif

sleep 30

set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`
if ( $PRCNUM  > 0 ) then
    $LOGWRITE  "DB停止失敗(稼動常駐ﾌﾟﾛｾｽ有り)" >> $LOGFILE
    exit 1
endif

$LOGWRITE  "データベース[SID:$ORACLE_SID] 停止正常終了" >> $LOGFILE

exit 0
