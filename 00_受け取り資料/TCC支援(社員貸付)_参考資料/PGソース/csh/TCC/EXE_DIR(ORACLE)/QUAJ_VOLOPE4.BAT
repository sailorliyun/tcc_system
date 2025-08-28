#
#  ヴォリュームマウント／アンマウント  (QUAJ_VOLOPE4.BAT)
#       tcc4.bcv用
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
set  MODULE   = QUAJ_VOLOPE4
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


# set  VOL = (/dev/dsk/c7t0d99s6:/d341   \
#             /dev/dsk/c7t0d100s6:/d350   )

# MOD 000001 EMCディスク（V-MAX）移行       20121107 FIP.Eriguchi Start
# set  VOL = (/dev/dsk/c2t5006048452A85756d26s0:/d140 \
#             /dev/dsk/c2t5006048452A85756d27s0:/d141 \
#             /dev/dsk/c2t5006048452A85756d28s0:/d150 \
#             /dev/dsk/c2t5006048452A85756d29s0:/d151 \
#             /dev/dsk/c2t5006048452A85756d30s0:/d160 \
#             /dev/dsk/c2t5006048452A85756d31s0:/d161 )
#
# MOD 000002 仮想環境移行作業（TCC支援      20141103 FIP.Eriguchi Start
#set  VOL = (/dev/dsk/c2t5000097408171959d26s0:/d140 \
#            /dev/dsk/c2t5000097408171959d27s0:/d141 \
#            /dev/dsk/c2t5000097408171959d28s0:/d150 \
#            /dev/dsk/c2t5000097408171959d29s0:/d151 \
#            /dev/dsk/c2t5000097408171959d30s0:/d160 \
#            /dev/dsk/c2t5000097408171959d31s0:/d161 )
#
# MOD 000003 EMCディスク切替対応            20150904 FIP.Tsuji Start
#set  VOL =  (/dev/dsk/c1t5000097408171959d26s0:/d140 \
#             /dev/dsk/c1t5000097408171959d27s0:/d141 \
#             /dev/dsk/c1t5000097408171959d28s0:/d150 \
#             /dev/dsk/c1t5000097408171959d29s0:/d151 \
#             /dev/dsk/c1t5000097408171959d30s0:/d160 \
#             /dev/dsk/c1t5000097408171959d31s0:/d161 )
set  VOL =  (/dev/dsk/c1t50001442C0075402d53s0:/d140 \
             /dev/dsk/c1t50001442C0075402d49s0:/d141 \
             /dev/dsk/c1t50001442C0075402d30s0:/d150 \
             /dev/dsk/c1t50001442C0075402d68s0:/d151 \
             /dev/dsk/c1t50001442C0075402d23s0:/d160 \
             /dev/dsk/c1t50001442C0075402d14s0:/d161 )

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

