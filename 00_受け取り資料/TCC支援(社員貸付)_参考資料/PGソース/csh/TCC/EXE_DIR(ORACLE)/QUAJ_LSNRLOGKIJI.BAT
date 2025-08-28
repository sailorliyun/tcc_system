#
#  リスナーログ期日管理  (QUAJ_LSNRLOGKIJI.BAT)
#
#     機  能：リスナーログを削除する
#     引  数：
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
set  MODULE      = QUAJ_LSNRLOGKIJI.BAT
set  LOGFILE     = $USER_LOG_DIR/db_ope.log
set  LOGWRITE    = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"
set  LSN_LOG_DIR = /d361/ora/LISTENER/trace
set  LSN_LOG_FIL = listener.trc

$LOGWRITE  "リスナーログ期日管理開始" >> $LOGFILE

set LSN_LOG = ${LSN_LOG_DIR}/${LSN_LOG_FIL}
if ( -f $LSN_LOG) then
	/usr/bin/rm -f $LSN_LOG
	set RC = $status
	if ( $RC != 0 ) then
		$LOGWRITE  "リスナーログ削除失敗[RC=$RC]" >> $LOGFILE
		exit 1
	endif
else
	$LOGWRITE  "リスナーログが存在しません" >> $LOGFILE
endif

$LOGWRITE  "リスナーログ期日管理終了" >> $LOGFILE

exit 0
