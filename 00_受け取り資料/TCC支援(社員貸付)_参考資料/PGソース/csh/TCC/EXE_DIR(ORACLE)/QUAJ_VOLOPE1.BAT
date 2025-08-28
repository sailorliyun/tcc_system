#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE1.BAT)
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
set  MODULE   = QUAJ_VOLOPE1
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


# set  VOL = (/dev/dsk/c7t0d19s7:/d100   \
#             /dev/dsk/c7t0d20s7:/d101   \
#             /dev/dsk/c7t0d21s7:/d110   \
#             /dev/dsk/c7t0d22s7:/d111   \
#             /dev/dsk/c7t0d23s7:/d120   \
#             /dev/dsk/c7t0d24s7:/d121   \
#             /dev/dsk/c7t0d25s7:/d130   \
#             /dev/dsk/c7t0d26s7:/d131   \
#             /dev/dsk/c7t0d27s7:/d140   \
#             /dev/dsk/c7t0d28s7:/d141   \
#             /dev/dsk/c7t0d29s7:/d150   \
#             /dev/dsk/c7t0d30s7:/d151   \
#             /dev/dsk/c7t0d31s7:/d160   \
#             /dev/dsk/c7t0d32s7:/d161   \
#             /dev/dsk/c7t0d33s7:/d170   \
#             /dev/dsk/c7t0d34s7:/d171   \
#             /dev/dsk/c7t0d38s7:/d200   \
#             /dev/dsk/c7t0d39s7:/d201   )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d8s0:/d061  \
#             /dev/dsk/c2t5006048452A85756d9s0:/d070  \
#             /dev/dsk/c2t5006048452A85756d10s0:/d071 \
#             /dev/dsk/c2t5006048452A85756d11s0:/d080 \
#             /dev/dsk/c2t5006048452A85756d12s0:/d081 \
#             /dev/dsk/c2t5006048452A85756d13s0:/d090 )
#
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d8s0:/d061  \
#            /dev/dsk/c2t5000097408171959d9s0:/d070  \
#            /dev/dsk/c2t5000097408171959d10s0:/d071 \
#            /dev/dsk/c2t5000097408171959d11s0:/d080 \
#            /dev/dsk/c2t5000097408171959d12s0:/d081 \
#            /dev/dsk/c2t5000097408171959d13s0:/d090 )
#
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d8s0:/d061  \
#             /dev/dsk/c1t5000097408171959d9s0:/d070  \
#             /dev/dsk/c1t5000097408171959d10s0:/d071 \
#             /dev/dsk/c1t5000097408171959d11s0:/d080 \
#             /dev/dsk/c1t5000097408171959d12s0:/d081 \
#             /dev/dsk/c1t5000097408171959d13s0:/d090 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d20s0:/d061 \
             /dev/dsk/c1t50001442C0075402d12s0:/d070 \
             /dev/dsk/c1t50001442C0075402d56s0:/d071 \
             /dev/dsk/c1t50001442C0075402d63s0:/d080 \
             /dev/dsk/c1t50001442C0075402d26s0:/d081 \
             /dev/dsk/c1t50001442C0075402d71s0:/d090 )
             
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

