CREATE OR REPLACE PACKAGE  QPAP_CEnt520PkG IS
/****************************************************************************************************************/
/* システム名	 ：高島屋クレジットシステム																		*/
/* 業務名		 ：社員貸付システム 																			*/
/* モジュール名  ：QPAP_CEnt520PkG																				*/
/* 機能 		 ：分解(未請求分)																				*/
/* 作成日		 ：2010/02/25																					*/
/* 作成者		 ：FIP																							*/
/****************************************************************************************************************/

/****************************************************************************************************************/
/*１  宣言部																									*/
/****************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typOtNyukinYMDAry IS TABLE OF CHAR(8)		  --入金日
	INDEX BY BINARY_INTEGER;
  TYPE typOtNyukingakuAry IS TABLE OF QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE	--入金額
	INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF NUMBER			--残高
	INDEX BY BINARY_INTEGER;

/* 社員属性の表示 */
PROCEDURE QPAP_Cent520SelSyainZoku (
  InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--社員コード１
  InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--社員コード２
  OtStrSimeiKana	OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,		--氏名カナ
  OtStrSimeiKanji	OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--氏名漢字
  OtStrMiseCD		OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,			--所属店コード
  OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,			--店名称
  OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--東西区分
  OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,			--所属部門コード
  OtStrBumonName	OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,			--部門名称
  OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,			--資格コード
  OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,			--等級コード
  OtStrBornYMD		OUT	VARCHAR2,								--生年月日
  OtStrSonzaiFlg	OUT	VARCHAR2);								--存在Flg (会員の存在 Check)

/* 小口融資入金データ取得 */
PROCEDURE QPAP_CEnt520SelList (
   InStrSyainCD		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE		--抽出キー  社員コード
  ,InNumMaxRec		IN	NUMBER									--最大配列格納件数
  ,OtNumRecCount	OUT	NUMBER									--総検索件数
  ,OtNumAryCount	OUT	NUMBER									--配列格納件数
  ,OtStrEndFlg		OUT	VARCHAR2								--検索終了フラグ
  ,OtStrNyukinYMD	OUT	typOtNyukinYMDAry						--入金日
  ,OtNumNyukingaku	OUT	typOtNyukingakuAry						--入金額
  ,OtNumZandaka		OUT	typOtZandakaAry							--残高
  ,OtStrZandakaYM	OUT	CHAR);									--残高日

/*既存入金検索*/
PROCEDURE QPAP_CEnt520SearchKizonNyukin (
  InStrPRMSyainCD2	IN	QPB2_BUNKAI.QPB2_SyainCD2%TYPE			--社員コード２
  ,InstrNyukinYMD	IN	CHAR									--入金日
  ,OtNumGankin		OUT	QPB2_BUNKAI.QPB2_GANKIN%TYPE			--元金
  ,OtNumRisoku		OUT	QPB2_BUNKAI.QPB2_RISOKU%TYPE);			--利息

/*分解(既存データなし)*/
PROCEDURE QPAP_CEnt520BunkaiIns (
   InStrPRMSyainCD1	IN	QPB2_BUNKAI.QPB2_SyainCD1%TYPE			--社員コード１
  ,InStrPRMSyainCD2	IN	QPB2_BUNKAI.QPB2_SyainCD2%TYPE			--社員コード２
  ,InstrNyukinYMD	IN	CHAR									--入金日
  ,InNumGankin		IN	QPB2_BUNKAI.QPB2_GANKIN%TYPE			--元金
  ,InNumRisoku		IN	QPB2_BUNKAI.QPB2_RISOKU%TYPE			--利息
  ,InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
  ,InStrUserID		IN	VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD		IN	VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM 	IN	VARCHAR2);								--担当名（オペログ用）

/*分解(既存データあり)*/
PROCEDURE QPAP_CEnt520BunkaiUpd (
   InStrPRMSyainCD1	IN	QPB2_BUNKAI.QPB2_SyainCD1%TYPE			--社員コード１
  ,InStrPRMSyainCD2	IN	QPB2_BUNKAI.QPB2_SyainCD2%TYPE			--社員コード２
  ,InstrNyukinYMD	IN	CHAR									--入金日
  ,InNumGankin		IN	QPB2_BUNKAI.QPB2_GANKIN%TYPE			--元金
  ,InNumRisoku		IN	QPB2_BUNKAI.QPB2_RISOKU%TYPE			--利息
  ,InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
  ,InStrUserID		IN	VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD		IN	VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM		IN	VARCHAR2);								--担当名（オペログ用）

/*分解取消*/
PROCEDURE QPAP_CEnt520BunkaiDel (
   InStrPRMSyainCD1	IN	QPB2_BUNKAI.QPB2_SyainCD1%TYPE			--社員コード１
  ,InStrPRMSyainCD2	IN	QPB2_BUNKAI.QPB2_SyainCD2%TYPE			--社員コード２
  ,InstrNyukinYMD	IN	CHAR									--入金日
  ,InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
  ,InStrUserID		IN	VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD		IN	VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM		IN	VARCHAR2);								--担当名（オペログ用）

/* 入金日報データ作成 */
PROCEDURE QPAP_CEnt520List (
   InStrYMD			IN	CHAR									--抽出キー  開始年月日
  ,OtNumRecCount	OUT	NUMBER									--総検索件数
  ,OtStrEndFlg		OUT	VARCHAR2								--検索終了フラグ
  ,InStrUserID		IN	QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM	IN	QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE);

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt520OpeLog(
   InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューＩＤ
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--プログラムＩＤ
  ,InStrUserID		IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ
  ,InStrTozaiKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--東西区分
  ,InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード
  ,InstrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt520Lock(
   InstrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type		--識別コード
  ,InStrKeyInfo1	IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type		--社員コード
  ,InstrProgramID	IN	QSA4_HaitaT.QSA4_ProgramID%type			--プログラムＩＤ
  ,InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type		--コンピュータ名
  ,InstrOperatorID	IN	QSA4_HaitaT.QSA4_OperatorID%type);		--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt520UnLock(
   InstrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type		--識別コード
  ,InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type);		--コンピューター名

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt520DelWorkTbl(
   InStrUserID	   IN  VARCHAR2,		--ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);		--コンピュータ名



END QPAP_CEnt520PkG;
/
SHOW ERROR

/****************************************************************************************************************/
/*	２	ボディー																								*/
/****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt520PkG IS

  /***	ログメッセージ定義	*/
  TYPE	typMsg	IS	RECORD (
	fldTableID	  CHAR(19), 					/* テーブル名   */
	fldKousinKBN  CHAR(1),						/* 更新区分		*/
	fldAcsKey	CHAR(50),						/* アクセスキー */
	fldMsg		CHAR(100)						/* 処理コード	*/
  );
  TYPE	typMsgIdx IS  TABLE OF	typMsg	INDEX BY  BINARY_INTEGER;

  /***	ユーザ定義例外定義	*/
  W_HAITADUPLICATE	EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu	, -20022);

/****************************************************************************************************************/
/* モジュール名  ：QPAP_Cent520SelSyainZoku 																	*/
/* 機能 	     ：社員属性の表示																				*/
/****************************************************************************************************************/
PROCEDURE QPAP_Cent520SelSyainZoku (
  InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--社員コード１
  InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--社員コード２
  OtStrSimeiKana	OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,	--氏名カナ
  OtStrSimeiKanji	OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--氏名漢字
  OtStrMiseCD		OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,		--所属店コード
  OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,		--店名称
  OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--東西区分
  OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,		--所属部門コード
  OtStrBumonName	OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,		--部門名称
  OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,		--資格コード
  OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,		--等級コード
  OtStrBornYMD		OUT	VARCHAR2,							--生年月日
  OtStrSonzaiFlg	OUT	VARCHAR2) IS						--存在Flg (会員の存在 Check)

  /* 処理固有の変数 */

BEGIN
  /* 出力パラメータのクリア */
  OtStrSimeiKana	:= ' ';
  OtStrSimeiKanji	:= ' ';
  OtStrMiseCD		:= ' ';
  OtStrMiseName 	:= ' ';
  OtStrTozaiKBN 	:= ' ';
  OtStrBumonCD		:= ' ';
  OtStrBumonName	:= ' ';
  OtStrSikakuCD 	:= ' ';
  OtStrTokyuCD		:= ' ';
  OtStrBornYMD		:= ' ';
  OtStrSonzaiFlg	:= '0';

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
	FROM  QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
	WHERE QPAC_PRMSyainCD1	= InStrPRMSyainCD1
	AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
	AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
	AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
	AND QPAC_BumonCD	= QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN	NO_DATA_FOUND THEN
		RETURN; 			--処理終了

END QPAP_Cent520SelSyainZoku;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt520SelList																			*/
/* 機能 		 ：小口融資入金データ取得																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520SelList (
   InStrSyainCD		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE	--抽出キー  社員コード
  ,InNumMaxRec		IN	NUMBER								--最大配列格納件数
  ,OtNumRecCount	OUT	NUMBER								--総検索件数
  ,OtNumAryCount	OUT	NUMBER								--配列格納件数
  ,OtStrEndFlg		OUT	VARCHAR2							--検索終了フラグ
  ,OtStrNyukinYMD	OUT	typOtNyukinYMDAry					--入金日
  ,OtNumNyukingaku	OUT	typOtNyukingakuAry					--入金額
  ,OtNumZandaka		OUT	typOtZandakaAry						--残高
  ,OtStrZandakaYM	OUT	CHAR) IS							--残高日

  /* 処理固有の変数 */
  StrSQL		  VARCHAR2(1000);
  v_CursorID		NUMBER := 0;
  v_CursorID2		NUMBER := 0;
  v_NumCount		NUMBER;
  v_Dummy		  INTEGER;
  v_Dummy2		  INTEGER;
  NumIdx		  NUMBER;
  v_Zandaka 	  QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD		  CHAR(8);
  v_Kasituke		QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin		  QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo		  QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_KyuyoZandaka		QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_Nyukinbi		CHAR(8);
  v_Nyukingaku		  QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N	CHAR(8);	 -- 11/01 ADD

BEGIN

  /* サーバーＳＹＳＴＥＭ日付 */
  v_SysDate := '00000000';
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

	/* 前々回給与日を算出 */
/* 2001/10/02 不具合修正
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
	ELSE
	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
	END IF;
*/
	/* 前回給与日を算出 */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
	  v_ZenKyuyoYMD := SUBSTR(v_SysDate,1,6) || '25';
	ELSE
	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
	END IF;

  OtstrEndFlg := '0';
  v_NumCount  := 0;

  /* 小口融資台帳存在チェックＳＱＬ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
  /* カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ローカル変数への関連づけ */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 台帳データ無し → エラー */
  IF v_NumCount = 0 THEN
	RETURN;
  END IF;

  /* 小口融資台帳検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOZANDAKA,0)';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoZandaka);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoZandaka);
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 小口融資残高履歴検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' MAX(TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD''))';
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
  OtStrZandakaYM := '00000000';
  IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);

	/* 11/01 ADD 入金用対象日付変更 */
	v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

	/* パラメータに渡す */
--	  OtStrZandakaYM := v_ZandakaYMD;	  -- 11/01 UPD
	OtStrZandakaYM := v_ZandakaYMD_N;	  -- 11/01 UPD
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  v_NumCount := 0;
  /* 小口融資入金テーブル存在チェックＳＱＬ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT ';
  StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
  /* カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
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

  /* 小口融資入金テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD''),';
  StrSQL := StrSQL || ' NVL(QPA5_NYUKINGAKU,0)';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT ';
  StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
  StrSQL := StrSQL || ' ORDER BY QPA5_NYUKINYMD DESC';


  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Nyukinbi,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Nyukingaku);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  NumIdx := 0;
  LOOP
	IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
	  EXIT;
	END IF;
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Nyukinbi);
	DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Nyukingaku);
	/* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
	NumIdx	:= NumIdx + 1;
	/* パラメータに渡す */
	OtStrNyukinYMD(NumIdx) := v_Nyukinbi;
	OtNumNyukingaku(NumIdx) := v_Nyukingaku;
	OtNumZandaka(NumIdx) := v_KyuyoZandaka;

	/* 小口融資貸付検索 */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
	StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
	StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
	StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';

--2001/11/30 取消フラグの条件を修正
--	  StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
	StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
	StrSQL := StrSQL || '	OR QPA6_TORIKESHIFLG <> :FLG)';

	StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
	/* 動的カーソルのオープン */
	v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', InStrSyainCD);


--2002/01/29 残高日取得方法修正
--	  DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', TO_CHAR(TO_NUMBER(v_ZandakaYMD) + 1 ));


	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':FLG', '1');
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kasituke);
	/* SQLの実行 */
	v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
	v_Kasituke := 0;
	IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
	  /* カラム値を変数へ格納 */
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kasituke);
	  /* パラメータに渡す */
	  OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) + v_Kasituke;
	END IF;
	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID2);


	/* 小口融資入金検索 */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
	StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
	StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
	StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
	StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
	StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';
	/* 動的カーソルのオープン */
	v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
--	  DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);	  -- 11/01 UPD
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD_N);	  -- 11/01 UPD
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Nyukin);
	/* SQLの実行 */
	v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
	v_Nyukin := 0;
	IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
	  /* カラム値を変数へ格納 */
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Nyukin);
	  /* パラメータに渡す */
	  OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) - v_Nyukin;
	END IF;
	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/************************************************************************************/
/* 賞与控除履歴は見ないこととする													*/
/* 2001/12/06 賞与控除履歴は見る　よって　コメントはずし  */
/************************************************************************************/
----↓コメント外し
	/* 小口融資賞与控除検索 */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
	StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
	StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :Code1';
	StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :Code2';
	StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
	StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
	/* 動的カーソルのオープン */
	v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kojo);
	/* SQLの実行 */
	v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
	v_Kojo := 0;
	IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
	  /* カラム値を変数へ格納 */
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kojo);
	  /* パラメータに渡す */
	  OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) - v_Kojo;
	END IF;
	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
----↑コメント外し

	/* 配列の件数がＭＡＸになった場合 */
	IF InNumMaxRec <= NumIdx  THEN
	  OtNumAryCount :=	NumIdx;
	  /* 動的カーソルのクローズ */
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
	  RETURN;
	END IF;
  END LOOP;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  OtNumAryCount := NumIdx;				--パラメータにセット
  OtStrEndFlg := '1';				--パラメータにセット（検索終了）

EXCEPTION
  WHEN	OTHERS	THEN
	IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
	END IF;
	IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
	END IF;
	RAISE ;
END QPAP_CEnt520SelList;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt520SearchKizonNyukin																	*/
/* 機能			：既存入金検索																					*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520SearchKizonNyukin (
   InStrPRMSyainCD2	IN	QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrNyukinYMD	IN	CHAR								--入金日
  ,OtNumGankin		OUT	QPB2_BUNKAI.QPB2_GANKIN%TYPE		--元金
  ,OtNumRisoku		OUT	QPB2_BUNKAI.QPB2_RISOKU%TYPE) IS	--利息

BEGIN
  SELECT QPA5_NYUKINGAKU INTO OtNumGankin
  FROM	 QPA5_KGCNYUKINT
  WHERE
	   QPA5_SYAINCD1 = ' '									--社員CD1
   AND QPA5_SYAINCD2 = InstrPRMSyainCD2						--社員CD2
   AND QPA5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;

  SELECT QPB5_RISOKU INTO OtNumRisoku
  FROM	 QPB5_BUNKAIRSK
  WHERE
	   Nvl(QPB5_SYAINCD1,' ') = ' '
   AND QPB5_SYAINCD2 = InStrPRMSyainCD2						--社員コード２
   AND QPB5_SYUBETU = '1'									--ローン種別(1：小口、2：証書)
   AND QPB5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;
  

EXCEPTION
  WHEN	NO_DATA_FOUND THEN
	RETURN; 			--処理終了
  WHEN	OTHERS	THEN
	RAISE ;
END QPAP_CEnt520SearchKizonNyukin;

/****************************************************************************************************************/
/* モジュール名 ：QPAP_CEnt520BunkaiIns																			*/
/* 機能 		：分解(既存データなし)																			*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520BunkaiIns (
   InStrPRMSyainCD1	IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrNyukinYMD	IN  CHAR								--入金日
  ,InNumGankin		IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE		--元金
  ,InNumRisoku		IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE		--利息
  ,InStrMenuID		IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID	IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		IN  VARCHAR2							--担当者ID（オペログ用）
  ,InStrComputerNM	IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD		IN  VARCHAR2							--部署コード（オペログ用）
  ,InStrTantoNM		IN  VARCHAR2) IS 						--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';	--テーブル名
  recMsg.fldKousinKBN := '1';		--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  --小口融資入金テーブルにINSERT
  INSERT INTO QPA5_KGCNYUKINT VALUES(
	' '										--社員CD1
	,InstrPRMSyainCD2						--社員CD2
	,TO_DATE(InstrNyukinYMD,'YYYYMMDD')		--入金日
	,InNumGankin							--金額
	,Sysdate								--登録日
	);

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの登録を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  recMsg.fldTableID := 'QPB2_BUNKAI';	--テーブル名

  --分解利息テーブルにINSERT
  INSERT INTO QPB5_BUNKAIRSK VALUES(
	 ' '								--社員コード１
	,InStrPRMSyainCD2					--社員コード２
	,'1'								--ローン種別(1：小口、2：証書)
	,Null								--融資日
	,TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
	,InNumRisoku						--利息
	,InStrUserID						--ユーザー名
	,InstrComputerNM					--コンピュータ名
	,Sysdate							--登録日時
	);

  /* オペレーションログ出力 */
  numStep := 2;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの登録を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの登録に失敗した';
	ELSE
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの登録に失敗した';
	END IF;

	strLogMsg	:= recMsg.fldTableID
		  || recMsg.fldKousinKBN
		  || recMsg.fldAcsKey
		  || recMsg.fldMsg
		  || numErr || ' ' || strErrMsg;
	QPAP_CEnt520OpeLog( InStrMenuID,
		  InStrModuleID,
		  InStrUserID,
		  InStrComputerNM,
		  InStrRiyouKBN,
		  InStrBushoCD, strLogMsg);
	RAISE;
END QPAP_CEnt520BunkaiIns ;

/****************************************************************************************************************/
/* モジュール名 ：QPAP_CEnt520BunkaiUpd																			*/
/* 機能			：分解(既存データあり)																			*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520BunkaiUpd (
   InStrPRMSyainCD1	IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrNyukinYMD	IN  CHAR								--入金日
  ,InNumGankin		IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE		--元金
  ,InNumRisoku		IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE		--利息
  ,InStrMenuID		IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID	IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		IN  VARCHAR2							--担当者ID（オペログ用）
  ,InStrComputerNM	IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD		IN  VARCHAR2							--部署コード（オペログ用）
  ,InStrTantoNM		IN  VARCHAR2) IS 						--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';	--テーブル名
  recMsg.fldKousinKBN := '2';				--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  --小口融資入金テーブルをUPDATE
  UPDATE QPA5_KGCNYUKINT SET
	 QPA5_NYUKINGAKU = InNumGankin		--金額
	,QPA5_TOROKUYMD = Sysdate			--登録日
  WHERE
	   QPA5_SYAINCD1 = ' '					--社員CD1
   AND QPA5_SYAINCD2 = InstrPRMSyainCD2		--社員CD2
   AND QPA5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの更新を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  recMsg.fldTableID := 'QPB2_BUNKAI';	--テーブル名

  --分解利息テーブルをUPDATE
  UPDATE QPB5_BUNKAIRSK SET
	 QPB5_RISOKU 	 = InNumRisoku				--利息
	,QPB5_TANTOCD	 = InStrUserID				--ユーザー名
	,QPB5_COMPUTERNM = InstrComputerNM			--コンピュータ名
	,QPB5_TOUROKUYMD = Sysdate					--登録日時
  WHERE
	   Nvl(QPB5_SYAINCD1,' ') = ' '
   AND QPB5_SYAINCD2 = InStrPRMSyainCD2				--社員コード２
   AND QPB5_SYUBETU = '1'							--ローン種別(1：小口、2：証書)
   AND QPB5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;

  /* オペレーションログ出力 */
  numStep := 2;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの更新を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの更新に失敗した';
	ELSE
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの更新に失敗した';
	END IF;

	strLogMsg	:= recMsg.fldTableID
		  || recMsg.fldKousinKBN
		  || recMsg.fldAcsKey
		  || recMsg.fldMsg
		  || numErr || ' ' || strErrMsg;
	QPAP_CEnt520OpeLog( InStrMenuID,
		  InStrModuleID,
		  InStrUserID,
		  InStrComputerNM,
		  InStrRiyouKBN,
		  InStrBushoCD, strLogMsg);
	RAISE;
END QPAP_CEnt520BunkaiUpd ;

/****************************************************************************************************************/
/* モジュール名 ：QPAP_CEnt520BunkaiDel																			*/
/* 機能			：分解取消																						*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520BunkaiDel (
   InStrPRMSyainCD1	IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrNyukinYMD	IN  CHAR								--入金日
  ,InStrMenuID		IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID	IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		IN  VARCHAR2 							--担当者ID（オペログ用）
  ,InStrComputerNM	IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD		IN  VARCHAR2							--部署コード（オペログ用）
  ,InStrTantoNM		IN  VARCHAR2) IS 						--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';	--テーブル名
  recMsg.fldKousinKBN := '3';		--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  --小口融資入金テーブルをDELETE
  DELETE FROM QPA5_KGCNYUKINT
  WHERE
	   QPA5_SYAINCD1 = ' '					--社員CD1
   AND QPA5_SYAINCD2 = InstrPRMSyainCD2		--社員CD2
   AND QPA5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの削除を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  recMsg.fldTableID := 'QPB2_BUNKAI';	--テーブル名

  --分解利息テーブルをDELETE
  DELETE FROM QPB5_BUNKAIRSK
  WHERE
	   Nvl(QPB5_SYAINCD1,' ') = ' '
   AND QPB5_SYAINCD2 = InStrPRMSyainCD2				--社員コード２
   AND QPB5_SYUBETU = '1'							--ローン種別(1：小口、2：証書)
   AND QPB5_NYUKINYMD = TO_DATE(InstrNyukinYMD,'YYYYMMDD')	--入金日
  ;

  /* オペレーションログ出力 */
  numStep := 2;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの削除を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt520OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

  COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資入金テーブルの削除に失敗した';
	ELSE
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解利息テーブルの削除に失敗した';
	END IF;

	strLogMsg	:= recMsg.fldTableID
		  || recMsg.fldKousinKBN
		  || recMsg.fldAcsKey
		  || recMsg.fldMsg
		  || numErr || ' ' || strErrMsg;
	QPAP_CEnt520OpeLog( InStrMenuID,
		  InStrModuleID,
		  InStrUserID,
		  InStrComputerNM,
		  InStrRiyouKBN,
		  InStrBushoCD, strLogMsg);
	RAISE;
END QPAP_CEnt520BunkaiDel ;

/****************************************************************************************************************/
/* モジュール名 ：QPAP_CEnt520List 																				*/
/* 機能			：入金日報データ作成																			*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520List (
   InStrYMD   IN	CHAR		  --抽出キー  開始年月日
  ,OtNumRecCount	OUT   NUMBER		  --総検索件数
  ,OtStrEndFlg	  OUT	VARCHAR2		--検索終了フラグ
  ,InStrUserID		  IN	QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM	  IN	QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE) IS

  /* 処理固有の変数 */
  StrSQL		  VARCHAR2(1000);
  v_CursorID		NUMBER := 0;
  v_CursorID2		NUMBER := 0;
  v_CursorID3		NUMBER := 0;
  v_NumCount		NUMBER;
  v_Dummy		  INTEGER;
  v_Dummy2		  INTEGER;
  v_Dummy3		  INTEGER;
  NumIdx		  NUMBER;

  v_SyainCD1		QPA5_KGCNYUKINT.QPA5_SYAINCD1%TYPE;
  v_SyainCD2		QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE;
  v_NyukinYMD		CHAR(8);
  v_Nyukingaku		  QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_TorokuYMD		CHAR(8);
  v_SimeiKanji		  QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD		  QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM		  QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD 	  QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM 	  QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku		QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka		QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD		  CHAR(8);
  v_Kasituke		QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin		  QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo		  QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N	CHAR(8);	 --2002/10/17

BEGIN

  /* サーバーＳＹＳＴＥＭ日付 */
  v_SysDate := '00000000';
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

--2002/01/29
--	/* 前々回給与日を算出 */
--	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
--	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
--	ELSE
--	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
--	END IF;

	/* 前回給与日を算出 */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
	  v_ZenKyuyoYMD := SUBSTR(v_SysDate,1,6) || '25';
	ELSE
	  v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
	END IF;
--2002/01/29


  OtstrEndFlg := '0';
  OtNumRecCount := 0;
  v_NumCount := 0;

  /* ワークテーブルの初期化 */
  DELETE FROM  QPAJ_NYUKINW
	  WHERE QPAJ_USERID = InStrUserID
	  AND QPAJ_COMPUTERNM = InStrComputerNM;

  /* 小口融資入金テーブル存在チェックＳＱＬ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT COUNT(*)';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') = :YMD';

  /* カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_SysDate);
  /* ローカル変数への関連づけ */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

  /* FETCH */
  LOOP
	IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
	  EXIT;
	END IF;
	/* 変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END LOOP;

  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 入金テーブル未存在 → エラー */
  IF v_NumCount = 0 THEN
	RETURN;
  END IF;

  /* 小口融資入金テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA5_SYAINCD1,'' ''),';
  StrSQL := StrSQL || ' NVL(QPA5_SYAINCD2,'' ''),';
  StrSQL := StrSQL || ' TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD''),';
  StrSQL := StrSQL || ' NVL(QPA5_NYUKINGAKU,0),';
  StrSQL := StrSQL || ' TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'')';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') = :YMD';
  StrSQL := StrSQL || ' ORDER BY QPA5_TOROKUYMD,QPA5_NYUKINYMD,QPA5_SYAINCD1,QPA5_SYAINCD2';

  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_SysDate);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_NyukinYMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Nyukingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_TorokuYMD,8);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

  /* FETCH */
  LOOP
	IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
	  EXIT;
	END IF;
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
	DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
	DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_NyukinYMD);
	DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Nyukingaku);
	DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_TorokuYMD);

	/* 社員情報を取得 */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' NVL(A.QPAC_SIMEIKANJI,'' ''),';
	StrSQL := StrSQL || ' NVL(A.QPAC_MISECD,'' ''),';
	StrSQL := StrSQL || ' NVL(B.QPAE_MISENM,'' ''),';
	StrSQL := StrSQL || ' NVL(A.QPAC_BUMONCD,'' ''),';
	StrSQL := StrSQL || ' NVL(C.QPAF_BUMONNM,'' ''),';
	StrSQL := StrSQL || ' NVL(D.QPA1_GENDOGAKU,0),';
	StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0)';
	StrSQL := StrSQL || ' FROM QPAC_SYAINM A,QPAE_MISEM B,QPAF_BUMONM C,QPA1_KGCDAICYOT D';
	StrSQL := StrSQL || ' WHERE A.QPAC_PRMSYAINCD1 = :CODE1';
	StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = :CODE2';
	StrSQL := StrSQL || ' AND A.QPAC_MISECD = B.QPAE_PRMMISECD (+)';
	StrSQL := StrSQL || ' AND A.QPAC_MISECD = C.QPAF_PRMMISECD (+)';
	StrSQL := StrSQL || ' AND A.QPAC_BUMONCD = C.QPAF_PRMBUMONCD (+)';
	StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD1 = D.QPA1_PRMSYAINCD1';
	StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = D.QPA1_PRMSYAINCD2';

	/* 動的カーソルのオープン */
	v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SimeiKanji,20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_MiseCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_MiseNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,5,v_BumonNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,6,v_Gendogaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,7,v_KyuyoZandaka);
	/* SQLの実行 */
	v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

	/* FETCH */
	LOOP
	  IF DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
		EXIT;
	  END IF;
	  /* カラム値を変数へ格納 */
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SimeiKanji);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_MiseCD);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_MiseNM);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_BumonCD);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,5,v_BumonNM);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,6,v_Gendogaku);
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,7,v_KyuyoZandaka);
	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

	/* 小口融資残高履歴検索 */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' MAX(TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD''))';
	StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
	StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :CODE1';
	StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :CODE2';
	StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :CODE3';
	StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
	StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';

	/* 動的カーソルのオープン */
	v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE3', '3');
	DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',v_ZenKyuyoYMD);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_ZandakaYMD,8);
	/* SQLの実行 */
	v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

	LOOP
	  IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
		EXIT;
	  END IF;
	  /* カラム値を変数へ格納 */
	  DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);

		/* --2002/10/17 ADD 入金用対象日付変更 */
		v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

	  /* 小口融資貸付検索 */
	  StrSQL := NULL;
	  StrSQL := StrSQL || 'SELECT';
	  StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
	  StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
	  StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
	  StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD1';
	  StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';
	  StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

	  /* 動的カーソルのオープン */
	  v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
	  /* SQLの解析 */
	  DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
	  /* 入力変数をバインドする */
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD2);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
	  /* 出力変数のバインド */
	  DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kasituke);
	  /* SQLの実行 */
	  v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
	  LOOP
		IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
		  EXIT;
		END IF;
		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kasituke);
		v_KyuyoZandaka := v_KyuyoZandaka + v_Kasituke;
	  END LOOP;
	  /* カーソルのクローズ */
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

	  /* 小口融資入金検索 */
	  StrSQL := NULL;
	  StrSQL := StrSQL || 'SELECT';
	  StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
	  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
	  StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :CODE1';
	  StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :CODE2';
--		StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';	--2002/10/17　下記に変更
--MOD 20100225 TR1001-001 NBC SAWAME START
--	  StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') >= :YMD1';		--2002/10/17
      StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';
--MOD 20100225 TR1001-001 NBC SAWAME END
	  StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
	  StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

	  /* 動的カーソルのオープン */
	  v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
	  /* SQLの解析 */
	  DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
	  /* 入力変数をバインドする */
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
--		DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);		--2002/10/17 下記に変更
		DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);	  -- --2002/10/17

	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
	  /* 出力変数のバインド */
	  DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Nyukin);
	  /* SQLの実行 */
	  v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
	  LOOP
		IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
		  EXIT;
		END IF;
		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Nyukin);
		v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukin;
	  END LOOP;
	  /* カーソルのクローズ */
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

/******************************************************************************/
/* 賞与控除は見ないこととする												  */
/* 2001/12/06 賞与控除履歴は見る　よって　コメントはずし  */
/******************************************************************************/
----↓コメント外し
	  /* 小口融資賞与控除検索 */
	  StrSQL := NULL;
	  StrSQL := StrSQL || 'SELECT';
	  StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
	  StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
	  StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :CODE1';
	  StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :CODE2';
	  StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD1';
	  StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
	  StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';

	  /* 動的カーソルのオープン */
	  v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
	  /* SQLの解析 */
	  DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
	  /* 入力変数をバインドする */
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
	  DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
	  /* 出力変数のバインド */
	  DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kojo);
	  /* SQLの実行 */
	  v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
	  LOOP
		IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
		  EXIT;
		END IF;
		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kojo);
		v_KyuyoZandaka := v_KyuyoZandaka - v_Kojo;
	  END LOOP;
	  /* カーソルのクローズ */
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID3);
----↑コメント外し
	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

	  /* STOP PRESS!! ***************************/
	  /* 求めた残高から、今回の入金額を差し引く */
	  /* この処理は本当に必要なのか？			*/
	  /* ２重引きをしているのでは？ 			*/
	  /* STOP PRESS!! ***************************/
--		v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukingaku;

	/* ワークテーブル追加 */
	INSERT INTO QPAJ_NYUKINW VALUES (
	   NVL(v_MiseCD,' ')
	  ,NVL(v_BumonCD,' ')
	  ,NVL(v_SyainCD2,' ')
	  ,NVL(v_MiseNM,' ')
	  ,NVL(v_BumonNM,' ')
	  ,NVL(v_SimeiKanji,' ')
	  ,NVL(v_Nyukingaku,0)
	  ,NVL(v_KyuyoZandaka,0)
	  ,NVL(v_Gendogaku,0)
	  ,NVL(v_NyukinYMD,' ')
	  ,NVL(v_TorokuYMD,' ')
	  ,1
	  ,NVL(InStrUserID,' ')
	  ,NVL(InStrComputerNM,' '));
  END LOOP;

  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* コミット */
  COMMIT;

  /* ワークテーブル存在チェックＳＱＬ */
  v_NumCount := 0;
  SELECT COUNT(*) INTO v_NumCount FROM QPAJ_NYUKINW
	  WHERE QPAJ_USERID = InStrUserID
	  AND QPAJ_COMPUTERNM = InStrComputerNM;

  OtNumRecCount := v_NumCount;
  OtStrEndFlg := '1';		--パラメータにセット（検索終了）

EXCEPTION
  WHEN	OTHERS	THEN
	IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
	END IF;
	IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
	END IF;
	IF DBMS_SQL.IS_OPEN (v_CursorID3) THEN
	  DBMS_SQL.CLOSE_CURSOR (v_CursorID3);
	END IF;
	RAISE ;
END QPAP_CEnt520List;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt520OpeLog																			*/
/* 機能 		 ：オペログへの追加 																			*/
/****************************************************************************************************************/
PROCEDURE  QPAP_CEnt520OpeLog(
   InStrMenuID	  IN	QUS2_OpeLogT.QUS2_MENUID%TYPE	/* メニューＩＤ   */
  ,InStrModuleID	IN	  QUS2_OpeLogT.QUS2_MODULEID%TYPE	/* プログラムＩＤ */
  ,InStrUserID		IN	  QUS2_OpeLogT.QUS2_USERID%TYPE   /* ユーザＩＤ 	*/
  ,InStrComputerNM	IN	  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  /* コンピュータ	*/
  ,InStrTozaiKBN	IN	  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	/* 東西区分 	  */
  ,InStrBushoCD   IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE	  /* 部署コード 	*/
  ,InstrMsg   IN	QUS2_OpeLogT.QUS2_MSG%TYPE ) IS   /* メッセージ 	*/

BEGIN
  QUSP_LogPkg.QUSP_WriteOpeLog(
	  InStrMenuID,
	  InStrModuleID,
	  InStrUserID,
	  InStrComputerNM,
	  InStrTozaiKBN,
	  InStrBushoCD,
	  InstrMsg);
EXCEPTION
  WHEN	OTHERS	THEN
	RAISE;	  /* オペログのエラーを認める */
END  QPAP_CEnt520OpeLog;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt520Lock 																			*/
/* 機能 		 ：小口融資入金Ｔのロック																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520Lock(
  InstrSikibetu   IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,	/* 識別コード	*/
  InStrKeyInfo1   IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type,	/* 社員コード	  */
  InstrProgramID	IN	  QSA4_HaitaT.QSA4_ProgramID%type,	/* プログラムＩＤ */
  InStrComputerNM	IN	  QSA4_HaitaT.QSA4_ComputerMei%type,  /* コンピュータ名 */
  InstrOperatorID	IN	  QSA4_HaitaT.QSA4_OperatorID%type) IS	/* オペレータＩＤ */

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr		number := 0;

BEGIN
  /* 小口融資入金Ｔの確認 */
  begin
	select QSA4_ComputerMei, QSA4_OperatorID
	  into fldComputerNM, fldOperatorID
	  from QSA4_HaitaT
	where QSA4_PRMJobKbn   = 'P'
	   and QSA4_PRMSikibetu  = InstrSikibetu
	   and QSA4_PRMKeyInfo1  = InStrKeyInfo1;
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
	  'P', InstrSikibetu,
	  InStrKeyInfo1,'P','P','P','P',
	  InstrProgramID, InStrComputerNM, InstrOperatorID,
	  sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN  --作業中
	RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt520Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN  --２重キー
	RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt520Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
	ROLLBACK;
	RAISE;
END QPAP_CEnt520Lock;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt520UnLock																			*/
/* 機能 		 ：プリンタＴのロック解除																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt520UnLock(
  InstrSikibetu   IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM	IN	  QSA4_HaitaT.QSA4_ComputerMei%type) IS

BEGIN
  delete from QSA4_HaitaT
   where QSA4_PRMJobKbn = 'P'
	 and QSA4_PRMSikibetu = InstrSikibetu
	 and QSA4_ComputerMei = InStrComputerNM;
  commit;

EXCEPTION
  WHEN OTHERS THEN
	ROLLBACK;
	RAISE;

END QPAP_CEnt520UnLock;


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt520DelWorkTbl									 */
/* 機能 		 ：使用ワークテーブル全削除 								 */
/*****************************************************************************/
PROCEDURE QPAP_CEnt520DelWorkTbl(
	InStrUserID 	IN	VARCHAR2,		  --ユーザーＩＤ
	InStrComputerNM IN	VARCHAR2) IS	  --コンピュータ名

BEGIN
	DELETE	FROM  QPAJ_NYUKINW
	  WHERE QPAJ_USERID 	= InStrUserID
	  AND	QPAJ_COMPUTERNM = InStrComputerNM;

	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt520DelWorkTbl;

END QPAP_CEnt520PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
