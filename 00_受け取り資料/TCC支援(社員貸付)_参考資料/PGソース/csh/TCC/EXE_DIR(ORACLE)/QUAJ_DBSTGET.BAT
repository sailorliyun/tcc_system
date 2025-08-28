#
#
#  インスタンスのスレッド状態を照会する。
#
#     機  能：ＨＵＬＦＴ常駐プロセスを起動する。
#
#     引  数：SID
#
#     EXIT値：0 --- =OPEN
#             1 --- !OPEN
#
#############################
# 一時作業ファイル名の定義  #
#############################
set  TMP = /tmp/DBOPEN$$.tmp

#############################
# 自ホスト名の取得          #
#############################
set  HOST = `hostname`

#############################
# 対象ＳＩＤ決定            #
#############################
if ( $#argv > 0 ) then     
	set SID = $1
else
	set SID = $ORACLE_SID
endif

#################################################################
# ホスト名とＳＩＤに応じ、ORACLE USER と ORACLE PASSWORD を決定 #
#################################################################
if ( $HOST == "sunuy3" ) then             # TIME-24内UNIX機
	switch ( $SID )
		case tcc:
			set USER_ID     = tccuser     # 一般ﾕｰｻﾞｰID
			set USER_RPSWD  = tccuser     # 一般ﾕｰｻﾞｰPassWord
			set ADMIN_ID    = tccadmin    # 管理者ID
			set ADMIN_PSWD  = tccadmin    # 管理者PassWord
			breaksw
		case secu:
			set USER_ID     = secuuser    # 一般ﾕｰｻﾞｰID
			set USER_RPSWD  = secuuser    # 一般ﾕｰｻﾞｰPassWord
			set ADMIN_ID    = secuadmin   # 管理者ID
			set ADMIN_PSWD  = secuadmin   # 管理者PassWord
			breaksw
		default:
			echo "SID:${SID}は無効"
			exit 1
	endsw
else if ( $HOST == "sunuy1" ) then        # 高島屋の横浜のビルディングの２階においてあるUNIX機
	switch ( $SID )
		case tcc:
			set USER_ID     = tccuser     # 一般ﾕｰｻﾞｰID
			set USER_RPSWD  = tccuser     # 一般ﾕｰｻﾞｰPassWord
			set ADMIN_ID    = tccadmin    # 管理者ID
			set ADMIN_PSWD  = tccadmin    # 管理者PassWord
			breaksw
		case secu:
			set USER_ID     = secuuser    # 一般ﾕｰｻﾞｰID
			set USER_RPSWD  = secuuser    # 一般ﾕｰｻﾞｰPassWord
			set ADMIN_ID    = secuadmin   # 管理者ID
			set ADMIN_PSWD  = secuadmin   # 管理者PassWord
			breaksw
		default:
			echo "SID:${SID}は無効"
			exit 1
	endsw
else
	echo "ホスト:${HOST}は対象外"
endif

setenv  ORACLE_SID  $SID

sqlplus -S $ADMIN_ID/$ADMIN_PSWD << KOKOMADE  >$TMP
set sqlp ""
set sqln off
set pause off
set hea   off
column status format A10
select status from v\$thread ; 
quit;
KOKOMADE

set PRCNUM = `cat $TMP | grep -v 'grep' | grep -c "OPEN"`
if ( $PRCNUM == 0 ) then
	set RCD = 1
else
	set RCD = 0
endif

rm $TMP 

exit($RCD)
