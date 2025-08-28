#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE3.BAT)
#       tcc1.bcv用
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
set  MODULE   = QUAJ_VOLOPE3
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


# set  VOL = (/dev/dsk/c7t0d93s2:/d330   \
#             /dev/dsk/c7t0d94s2:/d331   \
#             /dev/dsk/c7t0d95s2:/d340   )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d20s0:/d110 \
#             /dev/dsk/c2t5006048452A85756d21s0:/d111 \
#             /dev/dsk/c2t5006048452A85756d22s0:/d120 \
#             /dev/dsk/c2t5006048452A85756d23s0:/d121 \
#             /dev/dsk/c2t5006048452A85756d24s0:/d130 \
#             /dev/dsk/c2t5006048452A85756d25s0:/d131 )
#
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d20s0:/d110 \
#            /dev/dsk/c2t5000097408171959d21s0:/d111 \
#            /dev/dsk/c2t5000097408171959d22s0:/d120 \
#            /dev/dsk/c2t5000097408171959d23s0:/d121 \
#            /dev/dsk/c2t5000097408171959d24s0:/d130 \
#            /dev/dsk/c2t5000097408171959d25s0:/d131 )
# 
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d20s0:/d110 \
#             /dev/dsk/c1t5000097408171959d21s0:/d111 \
#             /dev/dsk/c1t5000097408171959d22s0:/d120 \
#             /dev/dsk/c1t5000097408171959d23s0:/d121 \
#             /dev/dsk/c1t5000097408171959d24s0:/d130 \
#             /dev/dsk/c1t5000097408171959d25s0:/d131 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d50s0:/d110 \
             /dev/dsk/c1t50001442C0075402d21s0:/d111 \
             /dev/dsk/c1t50001442C0075402d38s0:/d120 \
             /dev/dsk/c1t50001442C0075402d40s0:/d121 \
             /dev/dsk/c1t50001442C0075402d51s0:/d130 \
             /dev/dsk/c1t50001442C0075402d27s0:/d131 )

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

