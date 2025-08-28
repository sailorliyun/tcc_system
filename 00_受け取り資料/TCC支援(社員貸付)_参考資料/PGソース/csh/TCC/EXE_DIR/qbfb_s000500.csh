#!/bin/csh
#   スクリプト名： qbfb_s000500.csh
#   機  能	： 応諾データ移動
#   作成者	： NBC 斎藤

##################################
#           環境設定             #
##################################
set    SHELL_NAME = $0                                 # シェル名
setenv JOB_ID       'QBDJU5UX'                         # ジョブ名
setenv JOBNET_ID   'QBD503UX'                          # ジョブネット名
set    LOGFILE    = $USER_LOG_DIR/${JOB_ID}.log        # ログファイル名
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT           # ログ出力モジュール
setenv USERKEY     'IMGHULFT'                          # ユーザキー
set    KINOU      = '応諾データ移動'                   # 機能名
set    QB_DATA_DIR  = /d360/UFS/imgkanri/image_buffer  # 応諾データ保存先
set    QB_BACK_DIR  = /d360/UFS/imgkanri/bkhost        # 応諾データバックアップディレクトリ

set MODULE = 'SHELL'
# 開始メッセージの出力
$LOGWRITE "$MODULE" I "開始:$KINOU" "$USERKEY"


##############################################
# STEP-0 バックアップディレクトリ確認        #
##############################################

### 01
if !( -d $QB_BACK_DIR/01 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ01が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/01
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ01の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 02
if !( -d $QB_BACK_DIR/02 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ02が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/02
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ02の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 03
if !( -d $QB_BACK_DIR/03 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ03が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/03
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ03の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 04
if !( -d $QB_BACK_DIR/04 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ04が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/04
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ04の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 05
if !( -d $QB_BACK_DIR/05 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ05が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/05
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ05の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 06
if !( -d $QB_BACK_DIR/06 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ06が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/06
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ06の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 07
if !( -d $QB_BACK_DIR/07 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ07が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/07
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ07の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 08
if !( -d $QB_BACK_DIR/08 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ08が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/08
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ08の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 09
if !( -d $QB_BACK_DIR/09 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ09が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/09
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ09の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 10
if !( -d $QB_BACK_DIR/10 ) then

	$LOGWRITE "$MODULE" W "警告:$KINOU バックアップディレクトリ10が存在しない為作成" "$USERKEY"
	mkdir $QB_BACK_DIR/10
	set rc = $status

	if ( $rc != 0 ) then

		# 異常終了メッセージの出力
		$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ10の作成不可 RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif


##############################################
# STEP-1 バックアップディレクトリ10世代移動  #
##############################################

### バックアップディレクトリ10の削除
/usr/bin/rm -fr $QB_BACK_DIR/10
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ10の削除不可 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 09から10へ移動
mv $QB_BACK_DIR/09 $QB_BACK_DIR/10
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 09-10 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 08から09へ移動
mv $QB_BACK_DIR/08 $QB_BACK_DIR/09
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 08-09 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 07から08へ移動
mv $QB_BACK_DIR/07 $QB_BACK_DIR/08
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 07-08 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 06から07へ移動
mv $QB_BACK_DIR/06 $QB_BACK_DIR/07
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 06-07 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 05から06へ移動
mv $QB_BACK_DIR/05 $QB_BACK_DIR/06
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 05-06 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 04から05へ移動
mv $QB_BACK_DIR/04 $QB_BACK_DIR/05
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 04-05 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 03から04へ移動
mv $QB_BACK_DIR/03 $QB_BACK_DIR/04
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 03-04 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 02から03へ移動
mv $QB_BACK_DIR/02 $QB_BACK_DIR/03
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 02-03 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 01から02へ移動
mv $QB_BACK_DIR/01 $QB_BACK_DIR/02
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 世代バックアップエラー 01-02 RC=[$rc]" "$USERKEY"
	exit 1

endif

### バックアップディレクトリ01作成
mkdir $QB_BACK_DIR/01
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU バックアップディレクトリ01作成不可 RC=[$rc]" "$USERKEY"
	exit 1

endif


### イメージ管理処理用からバックアップディレクトリ01に応諾データをコピー
cp -p $QB_DATA_DIR/O.F.QA0?.txt $QB_BACK_DIR/01
set rc = $status

if ( $rc != 0 ) then

	# 異常終了メッセージの出力
	$LOGWRITE "$MODULE" E "異常終了:$KINOU 応諾データコピーエラー IMG-01 RC=[$rc]" "$USERKEY"
	exit 1

endif


# 終了メッセージの出力
$LOGWRITE "$MODULE" I "終了:$KINOU" "$USERKEY"
exit 0
