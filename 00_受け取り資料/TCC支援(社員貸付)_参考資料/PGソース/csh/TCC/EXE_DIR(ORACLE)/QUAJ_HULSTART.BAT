#
#
#  ‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‚ð‹N“®‚·‚éB(QUAJ_HULSTART.BAT)
#
#     ‹@  ”\F‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‚ð‹N“®‚·‚éB
#
#     ˆø  ”F
#
#     EXIT’lF0 --- ³í
#             1 --- ƒGƒ‰[”­¶
#
set  MODULE   = QUAJ_HULSTART.BAT                          # ƒ‚ƒWƒ…[ƒ‹–¼
set  LOGFILE  = $USER_LOG_DIR/db_ope.log                # ƒƒOƒtƒ@ƒCƒ‹–¼
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"  # ƒƒOo—Í—p‹¤’ÊƒVƒFƒ‹

$LOGWRITE  "‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‹N“®ŠJŽn" >> $LOGFILE

#############################
# 1. —v‹Žó•tƒf[ƒ‚ƒ“‹N“®	#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulobsd"`
if ( $PRCNUM == 0 ) then
	hulobsd
	set RC = $status
	if ( $RC != 0 ) then
		$LOGWRITE  "‚g‚t‚k‚e‚sí’“F—v‹Žó•tƒf[ƒ‚ƒ“‹N“®ˆÙí(hulobsd) : [RC:$RC]" >> $LOGFILE
		exit 1
	endif
endif

#############################
# 2. ”zMƒf[ƒ‚ƒ“‹N“®		#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulsndd"`
if ( $PRCNUM == 0 ) then
	hulsndd
	set RC = $status
	if ( $RC != 0 ) then
		$LOGWRITE  "‚g‚t‚k‚e‚sí’“F”zMƒf[ƒ‚ƒ“‹N“®ˆÙí(hulsndd) : [RC:$RC]" >> $LOGFILE
		exit 1
	endif
endif

#############################
# 3. WMƒf[ƒ‚ƒ“‹N“®		#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulrcvd"`
if ( $PRCNUM == 0 ) then
	hulrcvd
	set RC = $status
	if ( $RC != 0 ) then
		$LOGWRITE  "‚g‚t‚k‚e‚sí’“FWMƒf[ƒ‚ƒ“‹N“®ˆÙí(hulrcvd) : [RC:$RC]" >> $LOGFILE
		exit 1
	endif
endif

sleep 10

#############################
# 4. ƒf[ƒ‚ƒ“‹N“®ƒ`ƒFƒbƒN	#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulobsd"`
if ( $PRCNUM != 1 ) then
	$LOGWRITE  "‚g‚t‚k‚e‚sí’“F—v‹Žó•tƒf[ƒ‚ƒ“‹N“®ˆÙí[hulobsd] " >> $LOGFILE
    exit 1
endif
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulsndd"`
if ( $PRCNUM != 1 ) then
	$LOGWRITE  "‚g‚t‚k‚e‚sí’“F”zMƒf[ƒ‚ƒ“‹N“®ˆÙí[hulsndd] " >> $LOGFILE
    exit 1
endif
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulrcvd"`
if ( $PRCNUM != 1 ) then
	$LOGWRITE  "‚g‚t‚k‚e‚sí’“FWMƒf[ƒ‚ƒ“‹N“®ˆÙí[hulrcvd] " >> $LOGFILE
    exit 1
endif

$LOGWRITE  "‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‹N“®³íI—¹" >> $LOGFILE

exit 0
