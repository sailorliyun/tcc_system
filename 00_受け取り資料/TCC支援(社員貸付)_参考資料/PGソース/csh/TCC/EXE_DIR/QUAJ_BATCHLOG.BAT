#!/usr/bin/csh
#  バッチログ出力  (QUAJ_BATCHLOG.BAT)
#
#     機  能：バッチログメッセージを標準出力に書き出す
#     引  数：$1 --- モジュール名               (必須)
#             $2 --- メッセージ                 (必須)
#
#     EXIT値：0 
#
#echo   "`date '+%Y/%m/%d %H:%M:%S'` $1 $2"
$COM_EXE_DIR/qusc_logwrite.exe  "`date '+%Y/%m/%d %H:%M:%S'` $1 $2"  $USER_LOG_DIR/db_ope.log
