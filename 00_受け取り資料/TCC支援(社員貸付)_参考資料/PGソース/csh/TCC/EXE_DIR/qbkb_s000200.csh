#!/bin/csh
#　スクリプト名  ： qbkb_s000200.csh
#　 機  能       ： SFTP配信共通処理
#　 作成者       ： FIP
#
#   修正履歴
#   項番   管理番号    修正内容                修正者         修正日
#   

##################################
#           環境設定             #
##################################
set    SHELL_NAME = $0                              		  	#シェル名
setenv JOB_ID       $SHELL_NAME:t                  			 	#ジョブ名
setenv JOBNET_ID   'QBTK40UX'									#ジョブネット名
set    LOGFILE    = $USER_LOG_DIR/user.log        				#ログファイル名
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT       			 	#ログ出力モジュール
set    USERKEY    = 'qbkb_s000200.csh'                			#ユーザキー
set    KINOU      = 'SFTP配信共通処理'							#機能

set    MODULE     = 'SHELL'
set    WORK_FILE_NUM  = `ls -1 $2* | wc -l`						#WORKディレクトリ配下のファイル数

set    FAXUSER    = 'apmuser'									#FAXUSRERのユーザーID
set    PSWFILE    = /s040/tcc/fax_pass    	 					#パスワード格納ファイル

$LOGWRITE "$MODULE" I "開始:$KINOU" "$USERKEY"   				#開始メッセージの出力

#################################################
# STEP-1  引数チェック                          #
#################################################
if ( $#argv != 2 ) then
	$LOGWRITE "$MODULE" E "失敗:引数の数が異なります" "$USERKEY"
	exit 1		#異常終了
endif

#################################################
# STEP-2  WORKディレクトリファイルチェック      #
#################################################
if ( $WORK_FILE_NUM == 0 ) then
	$LOGWRITE "$MODULE" E "失敗:WORKディレクトリ内にファイルがありません" "$USERKEY"
	exit 1		# 異常終了
endif

#################################################
# STEP-3  FAX送信BOXへの伝送処理                #
#################################################
set    MODULE     = 'sftpg3'

$LOGWRITE "$MODULE" I "開始:FAX送信BOXへの伝送" "$USERKEY"		#開始メッセージ

sftpg3 --password=file://$PSWFILE $FAXUSER@$1 << EOF
put $2*
quit
EOF

#直前に実行したコマンドが成功したら0、失敗したら1をRCにセット
set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "$MODULE"  E  "失敗:FAX送信BOXへの伝送 RC=[$RC]" "$USERKEY"
	exit 1		# 異常終了
endif

$LOGWRITE "$MODULE" I "終了:FAX送信BOXへの伝送" "$USERKEY"    	#終了メッセージ

#################################################
# STEP-99  終了処理                             #
#################################################
set    MODULE     = 'SHELL'
$LOGWRITE "$MODULE" I "終了:$KINOU" "$USERKEY"   				#終了メッセージの出力
exit 0                                           				#正常終了
