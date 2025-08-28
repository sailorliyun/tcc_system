CREATE OR REPLACE PACKAGE  QPAP_CEnt060PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt060PkG                                                                                */
/* 機能          ：貸付金データ計上取消                                                                           */
/* 作成日        ：2001/07/07                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部								                                                                      */
/******************************************************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
	TYPE typOtTorihikiYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;
	TYPE typOtTorihikiHMSAry IS TABLE OF CHAR(6)
		INDEX BY BINARY_INTEGER;
	TYPE typOtKingakuAry IS TABLE OF QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE
		INDEX BY BINARY_INTEGER;
	TYPE typOtDelFlgAry IS TABLE OF CHAR(1)
		INDEX BY BINARY_INTEGER;

/* 社員属性の表示 */
PROCEDURE	QPAP_Cent060SelSyainZoku (
	InStrPRMSyainCD1	IN		QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--社員コード１
	InStrPRMSyainCD2	IN		QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--社員コード２
	OtStrSimeiKana		OUT		QPAC_SyainM.QPAC_SimeiKana%TYPE,	--氏名カナ
	OtStrSimeiKanji		OUT		QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--氏名漢字
	OtStrMiseCD		OUT		QPAC_SyainM.QPAC_MiseCD%TYPE,		--所属店コード
	OtStrMiseName		OUT		QPAE_MiseM.QPAE_MiseNm%TYPE,		--店名称
	OtStrTozaiKBN		OUT		QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--東西区分
	OtStrBumonCD		OUT		QPAC_SyainM.QPAC_BumonCD%TYPE,		--所属部門コード
	OtStrBumonName		OUT		QPAF_BumonM.QPAF_BumonNm%TYPE,		--部門名称
	OtStrSikakuCD		OUT		QPAC_SyainM.QPAC_SikakuCD%TYPE,		--資格コード
	OtStrTokyuCD		OUT		QPAC_SyainM.QPAC_TokyuCD%TYPE,		--等級コード
	OtStrBornYMD		OUT		VARCHAR2,				--生年月日
	OtStrSonzaiFlg		OUT		VARCHAR2);				--存在Flg (会員の存在 Check)

/* 貸付データ取得 */
PROCEDURE QPAP_CEnt060SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--抽出キー  社員コード
	,InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,IoNumCursor		IN		OUT	NUMBER										--カーソルＩＤ
	,OtStrTorihikiYMD	OUT		typOtTorihikiYMDAry								--取引日付
	,OtStrTorihikiHMS	OUT		typOtTorihikiHMSAry								--取引時刻
	,OtNumKingaku		OUT		typOtKingakuAry									--金額
	,OtStrDelFLG		OUT		typOtDelFlgAry									--取消フラグ
	,OtNumRecCount		OUT		NUMBER											--総検索件数
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);										--検索終了フラグ

/* 小口融資貸付データ更新処理 */
PROCEDURE QPAP_CEnt060DatUpd (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--社員コード
	,InStrTorihikiYMD	IN		CHAR											--取引日付
	,InStrTorihikiHMS	IN		CHAR											--取引時刻
	,InStrDelFLG		IN		CHAR											--取消フラグ
	,InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID		IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID		IN		VARCHAR2										--登録・担当者（オペログ用）
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrRiyouKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD		IN		VARCHAR2										--部署コード（オペログ用）
	,InStrTantoNM		IN		VARCHAR2);	 									--担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt060OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューＩＤ
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--プログラムＩＤ
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--東西区分
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE); 					--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt060Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type			--社員コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type				--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type			--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);			--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt060UnLock(
	 InStrSikibetu		IN QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM	IN QSA4_HaitaT.QSA4_ComputerMei%type);				--コンピューター名

END QPAP_CEnt060PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*	２  ボディー							    												                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt060PkG IS

	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* テーブル名   */
		fldKousinKBN	CHAR(1),												/* 更新区分     */
		fldAcsKey		CHAR(50),												/* アクセスキー */
		fldMsg			CHAR(100)												/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent060SelSyainZoku                                  					  */
/* 機能      　　：社員属性の表示                                            					  */
/******************************************************************************************************************/
PROCEDURE	QPAP_Cent060SelSyainZoku (
	InStrPRMSyainCD1		IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--社員コード１
	InStrPRMSyainCD2		IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--社員コード２
	OtStrSimeiKana			OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,	--氏名カナ
	OtStrSimeiKanji			OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--氏名漢字
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,		--所属店コード
	OtStrMiseName			OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,		--店名称
	OtStrTozaiKBN			OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--東西区分
	OtStrBumonCD			OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,		--所属部門コード
	OtStrBumonName			OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,		--部門名称
	OtStrSikakuCD			OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,		--資格コード
	OtStrTokyuCD			OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,		--等級コード
	OtStrBornYMD			OUT	VARCHAR2,				--生年月日
	OtStrSonzaiFlg			OUT	VARCHAR2) IS				--存在Flg (会員の存在 Check)

	/* 処理固有の変数 */

BEGIN
	/* 出力パラメータのクリア */
	OtStrSimeiKana			:= ' ';
	OtStrSimeiKanji			:= ' ';
	OtStrMiseCD			:= ' ';
	OtStrMiseName			:= ' ';
	OtStrTozaiKBN			:= ' ';
	OtStrBumonCD			:= ' ';
	OtStrBumonName			:= ' ';
	OtStrSikakuCD			:= ' ';
	OtStrTokyuCD			:= ' ';
	OtStrBornYMD			:= ' ';
	OtStrSonzaiFlg			:= '0';

	/* 社員属性の検索 */
	SELECT
			NVL(QPAC_SimeiKana,' '),
			NVL(QPAC_SimeiKanji,' '),
			NVL(QPAC_MiseCD,' '),
			NVL(QPAE_MiseNm,' '),
			NVL(QPAC_TozaiKBN,' '),
			NVL(QPAC_BumonCD,' '),
			NVL(QPAF_BumonNm,' '),
			NVL(QPAC_SikakuCD,' '),
			NVL(QPAC_TokyuCD,' '),
			TO_CHAR(QPAC_BornYMD,'YYYYMMDD')
		INTO
			OtStrSimeiKana,
			OtStrSimeiKanji,
			OtStrMiseCD,
			OtStrMiseName,
			OtStrTozaiKBN,
			OtStrBumonCD,
			OtStrBumonName,
			OtStrSikakuCD,
			OtStrTokyuCD,
			OtStrBornYMD
		FROM	QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
		WHERE	QPAC_PRMSyainCD1	= InStrPRMSyainCD1
		AND	QPAC_PRMSyainCD2	= InStrPRMSyainCD2
		AND	QPAC_MiseCD		= QPAE_PRMMiseCD(+)
		AND	QPAC_MiseCD		= QPAF_PRMMiseCD(+)
		AND	QPAC_BumonCD		= QPAF_PRMBumonCD(+);

	OtStrSonzaiFlg	:= '1';

EXCEPTION
	WHEN	NO_DATA_FOUND	THEN
				RETURN;							--処理終了

END	QPAP_Cent060SelSyainZoku;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt060SelList                                                                            */
/* 機能          ：小口融資貸付データ取得                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--抽出キー  社員コード
	,InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,IoNumCursor		IN		OUT	NUMBER										--カーソルＩＤ
	,OtStrTorihikiYMD	OUT		typOtTorihikiYMDAry								--取引日付
	,OtStrTorihikiHMS	OUT		typOtTorihikiHMSAry								--取引時刻
	,OtNumKingaku		OUT		typOtKingakuAry									--金額
	,OtStrDelFLG		OUT		typOtDelFlgAry									--取消フラグ
	,OtNumRecCount		OUT		NUMBER											--総検索件数
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	StrSQL				VARCHAR2(1000);
	v_CursorID			NUMBER := 0;
	v_NumCount			NUMBER;
	v_Dummy				INTEGER;
	NumIdx				NUMBER;
	v_ZandakaYMD		CHAR(8);
	v_TorihikiYMD		CHAR(8);
	v_TorihikiHMS		CHAR(6);
	v_Kingaku			QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
	v_TorikeshiFLG		QPA6_KGCKASITUKET.QPA6_TORIKESHIFLG%TYPE;
	v_SysDate		Char(8);
	v_ZenKyuyoYMD		Char(8);

BEGIN

/* ----- ＳＴＥＰ１ 表示データ総件数取得 ----- */
	IF IoNumCursor = 0 THEN		--１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
		/* サーバーＳＹＳＴＥＭ日付 */
		v_SysDate := '00000000';
		SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

		/* 前々回給与日を算出 */
		IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
			v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
		ELSE
			v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
		END IF;

		OtstrEndFlg	:= '0';
		OtNumRecCount	:= 0;
		OtNumAryCount	:= 0;
		v_NumCount	:= 0;

		/* 小口融資残高履歴検索 */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(MAX(QPA3_PRMZANDAKAYMD),''YYYYMMDD'')';
		StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
		StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
		StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
		StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :Kbn';
		StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
		StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';
		/* 動的カーソルのオープン */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQLの解析 */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* 入力変数をバインドする */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Kbn', '3');
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',v_ZenKyuyoYMD);
		/* 出力変数のバインド */
		DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZandakaYMD,8);
		/* SQLの実行 */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
			/* カラム値を変数へ格納 */
			DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);
		END IF;
		/* カーソルのクローズ */
		DBMS_SQL.CLOSE_CURSOR (v_CursorID);

		v_NumCount := 0;
		/* 小口融資貸付テーブル存在チェックＳＱＬ */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' COUNT(*) ';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';
		/* カーソルのオープン */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQLの解析 */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* 入力変数をバインドする */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
		/* ローカル変数への関連づけ */
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
		/* SQLの実行 */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
		/* FETCH */
		IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
			/* カラム値を変数へ格納 */
			DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
			OtNumRecCount := v_NumCount;
		END IF;
		/* カーソルのクローズ */
		DBMS_SQL.CLOSE_CURSOR (v_CursorID);
	END IF;

/* ----- ＳＴＥＰ２ 表示データ取得 ----- */
	IF IoNumCursor = 0 THEN		--１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
		/* 小口融資貸付テーブル検索 */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
		StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
		StrSQL := StrSQL || ' NVL(QPA6_TORIKESHIFLG,'' '')';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';
		StrSQL := StrSQL || ' ORDER BY QPA6_TORIHIKIYMD DESC,QPA6_TORIHIKIHMS DESC';
		/* 動的カーソルのオープン */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQLの解析 */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* 入力変数をバインドする */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
		/* SQLの実行 */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	ELSE
		/* ２回目以降はカーソルを再利用する */
		v_CursorID  := IoNumCursor;
	END IF;

	IoNumCursor :=  v_CursorID;		--パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_TorikeshiFLG,1);
	/* FETCH */
	NumIdx := 0;
	LOOP
		IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;
		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_TorikeshiFLG);
		/* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
		NumIdx	:= NumIdx + 1;
		/* パラメータに渡す */
		OtStrTorihikiYMD(NumIdx) := v_TorihikiYMD;
		OtStrTorihikiHMS(NumIdx) := v_TorihikiHMS;
		OtNumKingaku(NumIdx) := v_Kingaku;
		OtStrDelFLG(NumIdx) := v_TorikeshiFLG;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;
		END IF;
	END LOOP;

	OtNumAryCount	:= NumIdx;			--パラメータにセット
	OtStrEndFlg	:= '1';				--パラメータにセット（検索終了）

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;
END	QPAP_CEnt060SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt060DatUpd                                                                             */
/* 機能          ：小口融資入金データ更新処理                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060DatUpd (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--社員コード
	,InStrTorihikiYMD	IN		CHAR											--取引日付
	,InStrTorihikiHMS	IN		CHAR											--取引時刻
	,InStrDelFLG		IN		CHAR											--取消フラグ
	,InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID		IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID		IN		VARCHAR2										--登録・担当者（オペログ用）
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrRiyouKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD		IN		VARCHAR2										--部署コード（オペログ用）
	,InStrTantoNM		IN		VARCHAR2) IS 									--担当名（オペログ用）

	numStep		NUMBER   := 0;													/* 処理ステップ  */
	numErr		NUMBER   := 0;													/* SQLCODEの退避 */
	strErrMsg	VARCHAR2(100);													/* SQLERRMの退避 */
	recMsg		typMsg;
	strLogMsg	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA2_KGCHENSAIT';									--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrSyainCD;										--更新キー

	/* 小口融資貸付Ｔの更新 */
	UPDATE QPA6_KGCKASITUKET SET
		 QPA6_TORIKESHIFLG = NVL(InStrDelFLG,' ')								--入金月
		WHERE	TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') = InStrTorihikiYMD			--更新キー 社員コード１
		AND	TO_CHAR(QPA6_TORIHIKIHMS,'HH24MISS')  = InStrTorihikiHMS			--変更月
		AND	QPA6_SYAINCD  = InStrSyainCD;										--社員コード２

	/* コミット */
	COMMIT;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKBN
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt060OpeLog(	InStrMenuID,
				InStrModuleID,
				InStrUserID,
				InStrComputerNM,
				InStrRiyouKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt060OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt060DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt060OpeLog                                       　　　　　　　　　　　　　　　　　　　*/
/* 機能          ：オペログへの追加                                                                               */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt060OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューＩＤ
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--プログラムＩＤ
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--東西区分
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS 					--メッセージ

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserId,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);
EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* オペログのエラーを認める */
END  QPAP_CEnt060OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt060Lock                                                                               */
/* 機能          ：小口融資貸付Ｔのロック                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type		--識別コード
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type		--社員コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type			--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type		--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		--オペレータＩＤ

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* プリンタＴの確認 */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerNM, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InStrSikibetu
		   and QSA4_PRMKeyInfo1	 = InStrKeyInfo1;
	exception
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	end;
	if numErr = 0 then
		RAISE W_HAITADUPLICATE;
	else
		insert into QSA4_HaitaT (
			QSA4_PRMJobKbn,
			QSA4_PRMSikibetu,
			QSA4_PRMKeyInfo1,
			QSA4_PRMKeyInfo2,
			QSA4_PRMKeyInfo3,
			QSA4_PRMKeyInfo4,
			QSA4_PRMKeyInfo5,
			QSA4_ProgramID,
			QSA4_ComputerMei,
			QSA4_OperatorID,
			QSA4_SyoriYmd
		) values (
			'P', InStrSikibetu,
			InStrKeyInfo1,'P','P','P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt060Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt060Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt060Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt060UnLock                                                                             */
/* 機能          ：小口融資貸付Ｔのロック解除                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS

BEGIN
	delete from QSA4_HaitaT
	 where QSA4_PRMJobKbn = 'P'
	   and QSA4_PRMSikibetu = InStrSikibetu
	   and QSA4_ComputerMei = InStrComputerNM;
	commit;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt060UnLock;

END QPAP_CEnt060PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
