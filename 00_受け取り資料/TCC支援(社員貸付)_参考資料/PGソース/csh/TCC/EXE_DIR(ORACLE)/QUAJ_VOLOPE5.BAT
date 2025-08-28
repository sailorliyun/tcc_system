#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE5.BAT)
#       tcc4.bcv用
#     機  能：ヴォリュームのマウント／アンマウントを行う。
#     引  数：$1 --- 操作種別
#                     m:マウント   u:アンマウント
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
#     修正履歴
# 項番   管理番号    修正内容                 修正者         修正日
# 000001             BCVディスク追加          NBC.Saitoh    2007/02/28
# 000002             EMCディスク（V-MAX）移行 FIP.Eriguchi  2012/11/07
# 000003 1409036     仮想環境移行作業（TCC支援 FIP.Eriguchi 2014/11/03
# 000004 2015080034  EMCディスク切替対応       FIP.Tsuji    2015/09/04

set  MODULE   = QUAJ_VOLOPE5
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"

# 000001 mod NBC.Saitoh 2007/02/28 start
# set  VOL = (/dev/dsk/c7t1d1s7:/d351)
# set  VOL = (/dev/dsk/c7t1d1s7:/d351   \
#             /dev/dsk/c7t1d5s6:/d411   \
#             /dev/dsk/c7t1d5s7:/d420    )
# 000001 mod NBC.Saitoh 2007/02/28 end

# MOD 000002 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d32s0:/d170 \
#             /dev/dsk/c2t5006048452A85756d33s0:/d171 \
#             /dev/dsk/c2t5006048452A85756d34s0:/d200 \
#             /dev/dsk/c2t5006048452A85756d35s0:/d201 \
#             /dev/dsk/c2t5006048452A85756d36s0:/d300 \
#             /dev/dsk/c2t5006048452A85756d37s0:/d301 )
#
# MOD 000003 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d32s0:/d170 \
#            /dev/dsk/c2t5000097408171959d33s0:/d171 \
#            /dev/dsk/c2t5000097408171959d34s0:/d200 \
#            /dev/dsk/c2t5000097408171959d35s0:/d201 \
#            /dev/dsk/c2t5000097408171959d36s0:/d300 \
#            /dev/dsk/c2t5000097408171959d37s0:/d301 )
#
# MOD 000004 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d32s0:/d170 \
#             /dev/dsk/c1t5000097408171959d33s0:/d171 \
#             /dev/dsk/c1t5000097408171959d34s0:/d200 \
#             /dev/dsk/c1t5000097408171959d35s0:/d201 \
#             /dev/dsk/c1t5000097408171959d36s0:/d300 \
#             /dev/dsk/c1t5000097408171959d37s0:/d301 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d39s0:/d170 \
             /dev/dsk/c1t50001442C0075402d46s0:/d171 \
             /dev/dsk/c1t50001442C0075402d74s0:/d200 \
             /dev/dsk/c1t50001442C0075402d16s0:/d201 \
             /dev/dsk/c1t50001442C0075402d7s0:/d300 \
             /dev/dsk/c1t50001442C0075402d4s0:/d301 )

# MOD 000002 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi End
# MOD 000003 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi End
# MOD 000004 EMCディスク切替対応            20150904 FIP.Tsuji End

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

