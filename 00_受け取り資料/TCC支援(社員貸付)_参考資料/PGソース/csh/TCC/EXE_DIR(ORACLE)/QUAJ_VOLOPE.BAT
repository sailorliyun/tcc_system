#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE.BAT)
#
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
set  MODULE   = QUAJ_VOLOPE
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"

# set  VOL = (/dev/dsk/c7t0d1s7:/d010   \
#             /dev/dsk/c7t0d2s7:/d011   \
#             /dev/dsk/c7t0d3s7:/d020   \
#             /dev/dsk/c7t0d4s7:/d021   \
#             /dev/dsk/c7t0d5s7:/d030   \
#             /dev/dsk/c7t0d7s7:/d040   \
#             /dev/dsk/c7t0d9s7:/d050   \
#             /dev/dsk/c7t0d11s7:/d060  \
#             /dev/dsk/c7t0d12s7:/d061  \
#             /dev/dsk/c7t0d13s7:/d070  \
#             /dev/dsk/c7t0d14s7:/d071  \
#             /dev/dsk/c7t0d15s7:/d080  \
#             /dev/dsk/c7t0d16s7:/d081  \
#             /dev/dsk/c7t0d17s7:/d090  \
#             /dev/dsk/c7t0d18s7:/d091  \
#             /dev/dsk/c7t0d35s7:/d180  \
#             /dev/dsk/c7t0d36s7:/d190  \
#             /dev/dsk/c7t0d40s7:/d210  )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d0s0:/d010 \
#             /dev/dsk/c2t5006048452A85756d1s0:/d011 \
#             /dev/dsk/c2t5006048452A85756d2s0:/d020 \
#             /dev/dsk/c2t5006048452A85756d3s0:/d021 \
#             /dev/dsk/c2t5006048452A85756d4s0:/d030 \
#             /dev/dsk/c2t5006048452A85756d5s0:/d040 \
#             /dev/dsk/c2t5006048452A85756d6s0:/d050 \
#             /dev/dsk/c2t5006048452A85756d7s0:/d060 )
#
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d0s0:/d010 \
#            /dev/dsk/c2t5000097408171959d1s0:/d011 \
#            /dev/dsk/c2t5000097408171959d2s0:/d020 \
#            /dev/dsk/c2t5000097408171959d3s0:/d021 \
#            /dev/dsk/c2t5000097408171959d4s0:/d030 \
#            /dev/dsk/c2t5000097408171959d5s0:/d040 \
#            /dev/dsk/c2t5000097408171959d6s0:/d050 \
#            /dev/dsk/c2t5000097408171959d7s0:/d060 )
#
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d0s0:/d010 \
#             /dev/dsk/c1t5000097408171959d1s0:/d011 \
#             /dev/dsk/c1t5000097408171959d2s0:/d020 \
#             /dev/dsk/c1t5000097408171959d3s0:/d021 \
#             /dev/dsk/c1t5000097408171959d4s0:/d030 \
#             /dev/dsk/c1t5000097408171959d5s0:/d040 \
#             /dev/dsk/c1t5000097408171959d6s0:/d050 \
#             /dev/dsk/c1t5000097408171959d7s0:/d060 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d2s0:/d010 \
             /dev/dsk/c1t50001442C0075402d31s0:/d011 \
             /dev/dsk/c1t50001442C0075402d72s0:/d020 \
             /dev/dsk/c1t50001442C0075402d60s0:/d021 \
             /dev/dsk/c1t50001442C0075402d55s0:/d030 \
             /dev/dsk/c1t50001442C0075402d19s0:/d040 \
             /dev/dsk/c1t50001442C0075402d70s0:/d050 \
             /dev/dsk/c1t50001442C0075402d22s0:/d060 )
             
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

