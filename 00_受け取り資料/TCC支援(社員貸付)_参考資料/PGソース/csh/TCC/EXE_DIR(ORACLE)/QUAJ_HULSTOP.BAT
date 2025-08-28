#
#
#  ‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‚ð’âŽ~‚·‚éB (QUAJ_HULSTOP.BAT)
#
#     ‹@  ”\F ‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX‚ð’âŽ~‚·‚éB
#
#     ˆø  ”F
#
#     EXIT’lF0 --- ³í
#             1 --- ƒGƒ‰[”­¶
#
set  MODULE   = QUAJ_HULSTOP.BAT                          # ƒ‚ƒWƒ…[ƒ‹–¼
set  LOGFILE  = $USER_LOG_DIR/db_ope.log                # ƒƒOƒtƒ@ƒCƒ‹–¼
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"  # ƒƒOo—Í—p‹¤’ÊƒVƒFƒ‹

$LOGWRITE  "‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX’âŽ~ŠJŽn" >> $LOGFILE

#############################
# 1. —v‹Žó•tƒf[ƒ‚ƒ“’âŽ~	#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulobsd"`
if ( $PRCNUM != 0 ) then
	utlkillobs
	if ( $status != 0 ) then
		exit 1
	endif
endif

#############################
# 2. ”zMƒf[ƒ‚ƒ“’âŽ~		#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulsndd"`
if ( $PRCNUM != 0 ) then
	utlkillsnd
	if ( $status != 0 ) then
		exit 1
	endif
endif

#############################
# 3. WMƒf[ƒ‚ƒ“’âŽ~		#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hulrcvd"`
if ( $PRCNUM != 0 ) then
	utlkillrcv
	if ( $status != 0 ) then
		exit 1
	endif
endif

#############################
# 4. ƒf[ƒ‚ƒ“‹N“®ƒ`ƒFƒbƒN	#
#############################
set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "hul*d"`
if ( $PRCNUM != 0 ) then
    $LOGWRITE  "‚g‚t‚k‚e‚sƒf[ƒ‚ƒ“’âŽ~Ž¸”s" >> $LOGFILE
    exit 1
endif

$LOGWRITE  "‚g‚t‚k‚e‚sí’“ƒvƒƒZƒX’âŽ~ ³íI—¹" >> $LOGFILE
exit 0
