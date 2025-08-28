#
#  ログライタ起動  (QUAJ_LWTRSTART.BAT)
#
#     機  能：入力パラメータで指定されたログライタストアードプロシジャを起動する。
#     引  数：$1 --- opelog or conslog      (必須)
#           ：$2 --- oracle sid             (必須)
#
#     EXIT値：0 --- 正常
#             1 --- エラー発生
#             2 --- パラメータエラー
#


set  SQLUID   = tccuser
set  SQLPSW   = tccuser
set  MODULE   = QUAJ_LWTRSTART
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


echo "$1 Writer Starting"
$LOGWRITE  "$1 LogWriter Starting" >> $LOGFILE

if ( $#argv < 2 ) then								# 入力パラメタが2個未満の場合
     echo  "Lack of Input Parameter" 						# エコー出力
     LOGWRITE "Lack of Input Parameters" >> $LOGFILE				# ログ出力
     exit 2									# 終了
else
  if ( $1 == "opelog" ) then							# 第1パラメタが"opelog"の時
        set LWTRNAME = "QUSP_SubWriteLog"					# ライタ名指定
  else
    if ( $1 == "conslog"  ) then						# 第1パラメタが"conslog"の時
        set LWTRNAME = "QUSP_SubDispCons"					# ライタ名指定
    else									# "opelog","conslog"以外の時
        echo  "$1 Invalid  Parameter" 						# エコー出力
        $LOGWRITE "$1 Invalid  Parameter" >> $LOGFILE 				# ログ出力
        exit 1									# 終了
    endif
  endif
endif

setenv ORACLE_SID	$2							# 環境変数にORACLE_SIDを指定


set  ENDFILE  = /tmp/$1.dat							# ログライタ終了用ファイル名決定
rm -f $ENDFILE									# ログライタ終了用ファイル削除

#echo "EXECUTE QUSP_LOGPKG.$LWTRNAME;" > $EXE_DIR/$LWTRNAME.SQL
#echo "exit" >> $EXE_DIR/$LWTRNAME.SQL
echo "EXECUTE QUSP_LOGPKG.$LWTRNAME;" > $EXE_DIR/$LWTRNAME.$ORACLE_SID		# sqlplusに指定する文をファイルに書く
echo "exit" >> $EXE_DIR/$LWTRNAME.$ORACLE_SID					# 

while (1)									# ログライタを終了しない様にループ
#   sqlplus    $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.SQL
#   sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.SQL
    sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.$ORACLE_SID >> $LOGFILE	# sqlplusを用い、ログライタ起動

    if ( -f $ENDFILE ) then							# ログライタ終了時、ログライタ終了用ファイル
        rm -f $ENDFILE								# が作成済みかチェックする
        break									# 作成済みの場合、正常終了なのでファイル削除
    else									# ログライタ終了用ファイルが未作成の場合（異常終了）
        set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`	# オラクルのプロセスが起動されているかチェック
        if ( $PRCNUM < 6 ) then							# オラクルプロセスが6未満しか起動されていない時
            echo "DB未起動(常駐プロセス非稼動)のため停止"			# オラクルの終了ということでログライタ停止
            $LOGWRITE  "DB未起動(常駐プロセス非稼動)のため停止" >> $LOGFILE
            break
        else									# オラクルは起動済みの時
            echo "$1 Writer Abnomaly Stopped... Restart"
            $LOGWRITE  "$1 Writer Abnomaly Stopped... Restart" >> $LOGFILE
            sleep 5								# ５秒間停止した後、ループの最初に戻り、ログライタ再起動
        endif
    endif
end

echo "$1 Writer Nomaly Stopped"
$LOGWRITE  "$1 Writer Nomaly Stopped" >> $LOGFILE

exit 0
