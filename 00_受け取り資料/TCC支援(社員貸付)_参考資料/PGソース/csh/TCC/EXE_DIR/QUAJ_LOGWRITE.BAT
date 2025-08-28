#!/usr/bin/ksh
#  テキストファイルへのログ出力  (QUAJ_LOGWRITE.BAT)
#
#     機  能：入力パラメータで指定された諸情報をテキストファイルに書き出す。
#     引  数：$1 --- ジョブネットID                   (必須)   
#             $2 --- ジョブID                         (必須)   
#             $3 --- ユーザーKEY                      (必須)
#             $4 --- モジュールID                     (必須)   
#             $5 --- メッセージ区分                   (必須)
#             $6 --- メッセージ                       (必須)
#
#     EXIT値：0 --- 正常
#

#echo "`date '+%Y/%m/%d %H:%M:%S'` $1  $2  $3  $4  $5  $6" >> $USER_LOG_DIR/user.log
$EXE_DIR/qusc_logwrite.exe "`date '+%Y/%m/%d %H:%M:%S'` $1  $2  $3  $4  $5  $6"  $USER_LOG_DIR/user.log

exit 0
