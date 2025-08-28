#!/bin/csh
#
#  オンライン開始  (QUOJS1UX)
#
#     機  能：1.リスナーを起動する。
#             2.主データベースを起動する。
#             3.セキュリティデータベースを起動する。
#             4.オペログライタを起動する。          '99.4.27 ADD
#             5.コンスログライタを起動する。        '99.4.27 ADD 
#
#     引  数：
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#
set  SHELL_NAME = $0                                    			# シェル名
set  MODULE   =  $SHELL_NAME:t                          			# モジュール名
set  LOGFILE  = $USER_LOG_DIR/db_ope.log                			# ログファイル名
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"  			# ログ出力用共通シェル

echo "Online System Starting"

if ( $#argv == 1 ) then								# 引数が指定されていた場合
    setenv ORACLE_SID   $1							# 環境変数ORACLE_SIDを設定
endif

setenv SAVE_ORACLE_SID	$ORACLE_SID						# 設定済みのORACLE_SIDを保存

#echo $MODULE " : " $ORACLE_SID

$LOGWRITE  "オンライン開始" >> $LOGFILE

########################
# 1. リスナー開始      #
########################
if ( $ORACLE_SID != "PT1" ) then						# ORACLE_SIDがPT1以外の時
	$EXE_DIR/QUAJ_LSNRSTART.BAT 						# リスナの起動
	set RC = $status
	if ( $RC != 0 ) then
		exit 1
	endif
endif

#########################
# 2. 主データベース開始 #
#########################
#$EXE_DIR/QUAJ_DBSTART.BAT  tcc
#$EXE_DIR/QUAJ_DBSTART.BAT  PT1
$EXE_DIR/QUAJ_DBSTART.BAT  $ORACLE_SID						# 環境変数を用いてＤＢ起動
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

###################################
# 3. セキュリティデータベース開始 #
###################################
if ( $ORACLE_SID != "PT1" ) then						# ORACLE_SIDがPT1以外の時
	$EXE_DIR/QUAJ_DBSTART.BAT  SECU						# セキュリティーＤＢの起動
	set RC = $status
	if ( $RC != 0 ) then
		exit 1
	endif
endif

echo "Online System Normaly Started"

$LOGWRITE  "オンライン開始正常終了" >> $LOGFILE

setenv ORACLE_SID	$SAVE_ORACLE_SID					# 保存しておいたORACLE_SIDを環境変数ORACLE_SIDに設定
###################################################
# 4.   オペログライタ起動(バックグランドシェル)   #
###################################################
$EXE_DIR/QUAJ_LWTRSTART.BAT  opelog  $ORACLE_SID &				# 非同期モードにてオペログライタの起動
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

echo "OpelogWriter Normaly Started"

$LOGWRITE  "OpelogWriter Normaly Started" >> $LOGFILE

####################################################
# 5.   コンスログライタ起動(バックグランドシェル)  #
####################################################
$EXE_DIR/QUAJ_LWTRSTART.BAT  conslog  $ORACLE_SID &				# 非同期モードにてコンソールログライタの起動
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

echo "ConslogWriter Normaly Started"

$LOGWRITE  "ConslogWriter Normaly Started" >> $LOGFILE

exit 0
