#
#  リスナー起動  (QUAJ_LSNRSTART.BAT)
#
#     機  能：リスナーを起動する。
#     引  数：
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
# 変 更 履 歴
# 項番	日      付	修        正	担 当 者
# ----+-------------+-----------------+---------
# 001	2006/08/08	リスナー分割	NBC 齋藤
#
set  MODULE   = QUAJ_LSNRSTART
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"

$LOGWRITE  "リスナー 起動開始" >> $LOGFILE
# MOD-START 001 2006/08/08
# set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "tnslsnr"`
# if ( $PRCNUM > 0 ) then
#     $LOGWRITE  "起動中止(tnslsnr稼働中)" >> $LOGFILE
#     exit 1
# endif
lsnrctl status LISTENER
set RC = $status
if ( $RC == 0 ) then
    $LOGWRITE  "起動中止(tnslsnr稼働中)" >> $LOGFILE
    exit 1
endif
# MOD-END 001

# MOD-START 001 2006/08/08
# lsnrctl << EOF  >> $LOGFILE
# start
# EOF

lsnrctl << EOF  >> $LOGFILE
start LISTENER
EOF
# MOD-END 001

set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "リスナー起動失敗[RC=$RC]" >> $LOGFILE 
    exit 1
endif

sleep 30

# MOD-START 001 2006/08/08
# set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "tns"`
# if ( $PRCNUM == 0 ) then
#     $LOGWRITE  "リスナー起動失敗[tnslsnr無し]" >> $LOGFILE
#     exit 1
# endif
lsnrctl status LISTENER
set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "リスナー起動失敗[RC=$RC]" >> $LOGFILE
    exit 1
endif
# MOD-END 001

$LOGWRITE  "リスナー 起動正常終了" >> $LOGFILE

exit 0

