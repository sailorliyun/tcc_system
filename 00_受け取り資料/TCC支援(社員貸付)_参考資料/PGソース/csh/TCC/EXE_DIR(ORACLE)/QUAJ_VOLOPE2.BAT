#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE2.BAT)
#	tcc1.bcv用
#     機  能：ヴォリュームのマウント／アンマウントを行う。
#     引  数：$1 --- 操作種別
#                     m:マウント   u:アンマウント
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
# 修正履歴
# 項番   管理番号    修正内容                  修正者         修正日
# 000001             EMCディスク（V-MAX）移行  FIP.Eriguchi   2012/11/07
# 000002 1409036     仮想環境移行作業（TCC支援 FIP.Eriguchi   2014/11/03
# 000003 2015080034  EMCディスク切替対応       FIP.Tsuji      2015/09/04
set  MODULE   = QUAJ_VOLOPE2
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


# set  VOL = ( /dev/dsk/c7t0d53s7:/d300   \
#              /dev/dsk/c7t0d54s7:/d301   )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d14s0:/d091 \
#             /dev/dsk/c2t5006048452A85756d15s0:/d180 \
#             /dev/dsk/c2t5006048452A85756d16s0:/d190 \
#             /dev/dsk/c2t5006048452A85756d17s0:/d210 \
#             /dev/dsk/c2t5006048452A85756d18s0:/d100 \
#             /dev/dsk/c2t5006048452A85756d19s0:/d101 )
#
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d14s0:/d091 \
#            /dev/dsk/c2t5000097408171959d15s0:/d180 \
#            /dev/dsk/c2t5000097408171959d16s0:/d190 \
#            /dev/dsk/c2t5000097408171959d17s0:/d210 \
#            /dev/dsk/c2t5000097408171959d18s0:/d100 \
#            /dev/dsk/c2t5000097408171959d19s0:/d101 )
#
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d14s0:/d091 \
#             /dev/dsk/c1t5000097408171959d15s0:/d180 \
#             /dev/dsk/c1t5000097408171959d16s0:/d190 \
#             /dev/dsk/c1t5000097408171959d17s0:/d210 \
#             /dev/dsk/c1t5000097408171959d18s0:/d100 \
#             /dev/dsk/c1t5000097408171959d19s0:/d101 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d64s0:/d091 \
             /dev/dsk/c1t50001442C0075402d24s0:/d180 \
             /dev/dsk/c1t50001442C0075402d41s0:/d190 \
             /dev/dsk/c1t50001442C0075402d54s0:/d210 \
             /dev/dsk/c1t50001442C0075402d11s0:/d100 \
             /dev/dsk/c1t50001442C0075402d17s0:/d101 )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi End
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi End
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji End

switch ( $1 )
case m:
	$LOGWRITE  "マウント開始" >> $LOGFILE
	foreach  wk ( $VOL )
		set device = `echo $wk | awk -F: '{print $1}'`
		set dir    = `echo $wk | awk -F: '{print $2}'`
 		mount $device $dir
		set RC = $status
		if ( $RC != 0 ) then
			$LOGWRITE  "device:$device マウント失敗" >> $LOGFILE
			exit 1
		endif
	end
	$LOGWRITE  "マウント終了" >> $LOGFILE
	breaksw

case u:
	$LOGWRITE  "アンマウント開始" >> $LOGFILE
	foreach  wk ( $VOL )
		set dir    = `echo $wk | awk -F: '{print $2}'`
 		umount $dir
		set RC = $status
		if ( $RC != 0 ) then
			$LOGWRITE  "dir:$dir アンマウント失敗" >> $LOGFILE
			exit 1
		endif
	end
	$LOGWRITE  "アンマウント終了" >> $LOGFILE
	breaksw

default:
	$LOGWRITE  "パラメータエラー" >> $LOGFILE
	exit 1
	breaksw

endsw

exit 0

