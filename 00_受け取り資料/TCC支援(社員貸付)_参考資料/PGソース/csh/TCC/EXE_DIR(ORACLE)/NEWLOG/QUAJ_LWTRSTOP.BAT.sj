#
#  ログライタ停止  (QUAJ_LWTRSTOP.BAT)
#
#     機  能：ログ出力ライタ停止用ファイルを作成し、
#           ：ログ出力ライタ停止ストアードプロシジャを起動する。
#     引  数：$1 --- opelog or conslog      (必須)
#           ：$2 --- oracle sid             (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#             2 --- パラメータエラー
#

set  SQLUID   =  tccuser
set  SQLPSW   =  tccuser
set  MODULE   = QUAJ_LWTRSTOP
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


if ( $#argv < 2 ) then								# 入力パラメタが2個未満の場合
     echo  "Lack of Input Parameter" 						# エコー出力
     LOGWRITE "Lack of Input Parameters" >> $LOGFILE				# ログ出力
     exit 2									# 終了
else
  if ( $1 == "opelog" ) then							# 第1パラメタが"opelog"の時
        set LWTRNAME = "QUSP_SubWriteLog"					# ライタ名指定
        set PCLOSE   = "QUSP_SubPipe2Close"					# クローズプロシージャ名指定
  else
    if ( $1 == "conslog"  ) then						# 第1パラメタが"conslog"の時
        set LWTRNAME = "QUSP_SubDispCons"					# ライタ名指定
        set PCLOSE   = "QUSP_SubPipe1Close"					# クローズプロシージャ名指定
    else			 						# "opelog","conslog"以外の時
        echo  "$1 Invalid  Parameter"						# エコー出力
        $LOGWRITE "$1 Invalid  Parameter" >> $LOGFILE 				# ログ出力
        exit 1									# 終了
    endif
  endif
endif

setenv ORACLE_SID	$2							# 環境変数にORACLE_SIDを指定


set  ENDFILE  = /tmp/$1.dat							# ログライタ終了用ファイル名決定
touch $ENDFILE									# ログライタ終了用ファイル作成

#echo "EXECUTE QUSP_LOGPKG.$PCLOSE;" > $EXE_DIR/$PCLOSE.SQL
#echo "exit" >> $EXE_DIR/$PCLOSE.SQL
echo "EXECUTE QUSP_LOGPKG.$PCLOSE;" > $EXE_DIR/$PCLOSE.$ORACLE_SID		# sqlplusに指定する文をファイルに書く
echo "exit" >> $EXE_DIR/$PCLOSE.$ORACLE_SID					#

#sqlplus    $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.SQL
#sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.SQL
sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.$ORACLE_SID >> $LOGFILE		# sqlplusを用い、ログライタ停止

echo "$1 Writer Nomaly Stopping"
$LOGWRITE  "$1 Writer Nomaly Stopping" >> $LOGFILE

sleep 15

exit 0
