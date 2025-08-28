#
#  メッセージログ出力  (QUAJ_MSGLOG.BAT)
#
#     機  能：入力パラメータで指定された諸情報をｺﾝｿｰﾙﾛｸﾞﾃｰﾌﾞﾙに書き出す。
#     引  数：$1 --- モジュールID                     (必須)   
#             $2 --- メッセージ区分                   (必須)
#             $3 --- メッセージ                       (必須)
#             $4 --- ユーザーKEY                      (任意)
#               或いは
#             $1 --- モジュールID                     (必須)   
#             $2 --- メッセージ区分                   (必須)
#             $3 --- -f                               (必須)
#             $4 --- メッセージが格納されたファイル   (必須)
#             $5 --- ユーザーKEY                      (任意)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#             2 --- パラメータエラー
#

if ( $#argv < 3 ) then
	echo "パラメータの数が足りません。"
	exit 2
endif

set noglob                           # WildCard 展開抑止
set MODULE = $1                      # モジュール名
set MSGKBN = $2                      # メッセージ区分


if ( "$3" == "-f" ) then
	if ( $#argv < 4 ) then
		echo "パラメータの数が足りません。"   > $USER_LOG_DIR/QUAJ_MSGLOG$$.log
		exit 2
	endif
	set ERRFILE = $4
	if ( -f $ERRFILE ) then
		set MESG = `sed 's|$|   /   |' $ERRFILE`   # エラーメッセージを１行に連結
	else
		set MESG = "エラーファイルが見つからない [$ERRFILE]"
	endif

	set USERKEY = $5:q               # ユーザーKEY

else
	set MESG    = $3:q               # メッセージ
	set USERKEY = $4:q               # ユーザーKEY
endif

$EXE_DIR/QUAJ_LOGWRITE.BAT  $JOBNET_ID  $JOB_ID  $USERKEY:q  $MODULE:q  $MSGKBN:q  $MESG:q

######sqlplus -S $DB_USERID/$DB_PASSWORD  <<  EOF   > /dev/null
#sqlplus -S $DB_USERID/$DB_PASSWORD  <<  EOF  > $USER_LOG_DIR/QUAJ_MSGLOG$$.log 
#    execute QUSP_LogPkG.QUSP_DispUponCons( '$JOBNET_ID','$JOB_ID','$USERKEY','$MODULE','$MSGKBN', '$MESG' )
#quit SQL.SQLCODE;
#
#EOF
#
#set RC = $status
#if ( $RC == 0 ) then
#	/bin/rm  $USER_LOG_DIR/QUAJ_MSGLOG$$.log
#else
#	echo "QUSP_DispUponConsエラー [RC=$RC]"  >> $USER_LOG_DIR/QUAJ_MSGLOG$$.log
#	set RC = 1
#endif
#
#exit $RC
exit 0
