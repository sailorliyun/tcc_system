#!/bin/csh
#　スクリプト名  ： qbkb_s000100.csh
#　 機  能       ： FAX送信用件数・金額データ振分処理 （共通)
#　 作成者       ： FIP
#
#   修正履歴
#   項番   管理番号    修正内容                修正者         修正日
#   000001 14120002    WORKディレクトリ名を引数で取得  FIP．辻  2015.12.22

##################################
#           環境設定             #
##################################
set    SHELL_NAME = $0                               			  	#シェル名
setenv JOB_ID       $SHELL_NAME:t                     			 	#ジョブ名
setenv JOBNET_ID   'QBTK00UX'										#ジョブネット名
set    LOGFILE    = $USER_LOG_DIR/user.log	        				#ログファイル名
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT          			 	#ログ出力モジュール
set    USERKEY    = 'qbkb_s000100.csh'                   			#ユーザキー
set    KINOU      = 'FAX送信用件数・金額データ振分処理 （共通)'		#機能

set    FILE_DATE  = `date +%Y%m%d%H%M%S`							#日時
set    KAKUCHOU   = .csv											#拡張子
# MOD 000001  WORKディレクトリ名を引数で取得  FIP．辻  2015.12.22
#set    WORK_DIR   = $QB_DATA_DIR/qb/FAXWORK							#WORKディレクトリ
set    WORK_DIR   =  $2												#WORKディレクトリ
set    MODULE     = 'SHELL'

$LOGWRITE "$MODULE" I "START:$KINOU" "$USERKEY"   					# 開始メッセージの出力

#################################################
# STEP-1  引数チェック                          #
#################################################
# MOD 000001  WORKディレクトリ名を引数で取得  FIP．辻  2015.12.22
#if ( $1 == "" ) then
#	$LOGWRITE "$MODULE" E "ERR:引数が指定されていません" "$USERKEY"	
#	exit 1													# 異常終了
#endif

if ( $#argv != 2 ) then
	$LOGWRITE "$MODULE" E "ERR:引数の数が異なります" "$USERKEY"
	exit 1		#異常終了
endif


#################################################
# STEP-2  ファイル振分処理                      #
#################################################
$LOGWRITE "$MODULE" I "START:File-Furiwake" "$USERKEY"	#開始メッセージ
setenv LANG ja_JP.UTF-8										#言語をUTF-8に変更

foreach  wk ( "`cat $1`" )
	set FORM_ID  = `echo $wk | awk -F, '{print $29}'`		#,区切りで29番目をFORM_IDにセット
	set OWNER_ID = `echo $wk | awk -F, '{print $26}'`		#,区切りで26番目をOWNER_IDにセット
	set FURI_KEY = `echo $wk | awk -F, '{print $28}'`		#,区切りで28番目をFURI_KEYにセット
	echo "$wk" >> ${WORK_DIR}/${FORM_ID}_${OWNER_ID}_${FURI_KEY}_${FILE_DATE}
	
	set RC = $status
	if ( $RC != 0 ) then
		setenv LANG ja
	    $LOGWRITE  "$MODULE"  E  "ERR:File-Furiwake RC=[$RC]" "$USERKEY"
		exit 1												# 異常終了
	endif
	
end

setenv LANG ja

$LOGWRITE "$MODULE" I "END:File-Furiwake" "$USERKEY"    #終了メッセージ

#################################################
# STEP-3  ファイル分割処理                      #
#################################################
$LOGWRITE "$MODULE" I "START:File-Bunkatsu" "$USERKEY"						#開始メッセージ

set CUR_DIR = `pwd`																#現在のディレクトリをCUR_DIRにセットする
cd ${WORK_DIR}																	#WORKディレクトリに移動する

setenv LANG ja_JP.UTF-8

foreach WORK_FILENAME ( "`ls -1`" )
	split -100 ${WORK_FILENAME} ${WORK_FILENAME}_								#100件ごとにファイルを分割する
	
	foreach SPLIT_FILENAME ( "`ls -1 ${WORK_FILENAME}_*`" )						#連番変更前のファイル名をSPLIT_FILENAMEにセット
		set RENBAN_FILENAME = `ls -1 ${SPLIT_FILENAME} | tr '[a-j]' '[0-9]'` 	#連番を数字に変更し、連番変更後のファイル名をRENBAN_FILENAMEにセット
		mv ${SPLIT_FILENAME} ${RENBAN_FILENAME}${KAKUCHOU}						#ファイル名を連番変更後の名前に変更し、末尾に拡張子.csvを付与
	end
		
	set RC = $status
	if ( $RC != 0 ) then
		setenv LANG ja
	    $LOGWRITE  "$MODULE"  E  "ERR:File-Bunkatsu RC=[$RC]" "$USERKEY"
		exit 1																	# 異常終了
	endif
	
end

setenv LANG ja

cd ${CUR_DIR}																	#分割ディレクトリに移動する

$LOGWRITE "$MODULE" I "END:File-Bunkatsu" "$USERKEY"    					#終了メッセージ

#################################################
# STEP-4  ファイル削除処理                      #
#################################################
rm -f ${WORK_DIR}/*${FILE_DATE}								#分割前のファイルを削除する

#################################################
# STEP-99  終了処理                             #
#################################################
$LOGWRITE "$MODULE" I "END:$KINOU" "$USERKEY"   			# 終了メッセージの出力
exit 0                                           			# 正常終了
