CREATE OR REPLACE PACKAGE  QPAP_CEnt410PKG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員貸付                                                  */
/* モジュール名  ：QPAP_CEnt410PKG                                           */
/* 機能          ：完済通知書                                                */
/* 作成日        ：2005/01/20                                                */
/* 作成者        ：FIP SEKINE                                                */
/*****************************************************************************/

/*****************************************************************************/
/*								１  宣言部								     */
/*****************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
-- コードテーブル
	TYPE typQSA3Ary		IS	TABLE OF VARCHAR2(100)
		INDEX BY BINARY_INTEGER;
-- 一覧検索結果
	TYPE typDataAry IS TABLE OF VARCHAR2(150)
		INDEX BY BINARY_INTEGER;

--WKテーブル 登録用
-- 社員コード１
	TYPE typSyainCd1Ary IS TABLE OF VARCHAR2(1)
		INDEX BY BINARY_INTEGER;
-- 社員コード２
	TYPE typSyainCd2Ary IS TABLE OF VARCHAR2(7)
		INDEX BY BINARY_INTEGER;
-- 融資日
	TYPE typYushibiAry IS TABLE OF VARCHAR2(10)
		INDEX BY BINARY_INTEGER;
-- 融資日（和暦）
	TYPE typYushibiWaAry IS TABLE OF VARCHAR2(20)
		INDEX BY BINARY_INTEGER;
-- 表示用氏名
	TYPE typDispNmAry IS TABLE OF VARCHAR2(30)
		INDEX BY BINARY_INTEGER;
-- 店コード
	TYPE typTenCdAry IS TABLE OF VARCHAR2(3)
		INDEX BY BINARY_INTEGER;
-- 所属店名称
	TYPE typTenNmAry IS TABLE OF VARCHAR2(24)
		INDEX BY BINARY_INTEGER;
-- 東西区分
	TYPE typTozaiAry IS TABLE OF VARCHAR2(2)
		INDEX BY BINARY_INTEGER;
-- 所属部門コード
	TYPE typBumonCdAry IS TABLE OF VARCHAR2(6)
		INDEX BY BINARY_INTEGER;
-- 所属部門名称
	TYPE typBumonNmAry IS TABLE OF VARCHAR2(24)
		INDEX BY BINARY_INTEGER;
-- 融資金額
	TYPE typYushiKngAry IS TABLE OF VARCHAR2(13)
		INDEX BY BINARY_INTEGER;
-- 完済日
	TYPE typKansaibiAry IS TABLE OF VARCHAR2(10)
		INDEX BY BINARY_INTEGER;
-- 完済日（和暦）
	TYPE typKansaibiWaAry IS TABLE OF VARCHAR2(20)
		INDEX BY BINARY_INTEGER;

/* コードビュー検索 */
PROCEDURE	QPAP_CEnt410SelCodeV (
	InStrCodeKbn		IN	VARCHAR2,										--コード区分
	OtNumCodeCount		OUT	NUMBER,											--コード件数
	OtStrCodeAry		OUT	typQSA3Ary);									--コード名称配列

/* 初期処理  */
PROCEDURE   QPAP_CEnt410Init (
	OtStrSysDate		OUT	CHAR,											--サーバーＳＹＳＴＥＭ日付
	OtNumDP4Count		OUT	NUMBER,											--DP4 発行日     配列格納件数
	OtStrDP4Ary			OUT	typQSA3Ary,										--               配列
	OtNumDP5Count		OUT	NUMBER,											--DP5 発行者情報 配列格納件数
	OtStrDP5Ary			OUT	typQSA3Ary,										--               配列
	OtNumDP6Count		OUT	NUMBER,											--DP6 ローン名称 配列格納件数
	OtStrDP6Ary			OUT	typQSA3Ary);									--               配列

/* 一覧検索 */
PROCEDURE	QPAP_CEnt410ListSel (
	InStrKansaibiFr		IN	VARCHAR2,										--検索条件：完済日From
	InStrKansaibiTo		IN	VARCHAR2,										--        ：完済日To
	InStrSyainCd1		IN	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE,				--        ：社員コード１
	InStrSyainCd2		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE,				--        ：社員コード２
	InNumMaxRec			IN	NUMBER,											--最大配列格納件数
	IoNumFetchCount	 IN OUT	NUMBER,											--読み込み件数
	IoNumCursor		 IN OUT	NUMBER,											--カーソルＩＤ
	IoNumRecCount	 IN OUT	NUMBER,											--総検索件数
	OtNumAryCount		OUT	NUMBER,											--配列格納件数
	OtStrEndFlg			OUT	VARCHAR2,										--検索終了フラグ
	OtStrDataAry		OUT	typDataAry);									--検索データ配列

/* 完済通知ＷＫテーブルの登録 */
PROCEDURE	QPAP_CEnt410InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--コンピュータ名
	InNumAryCount		IN	NUMBER,											--配列格納件数
	InStrSyainCd1Ary	IN	typSyainCd1Ary,									--社員コード１ 配列
	InStrSyainCd2Ary	IN	typSyainCd2Ary,									--社員コード２ 配列
	InStrYushibiAry		IN	typYushibiAry,									--融資日 配列
	InStrYushibiWaAry	IN	typYushibiWaAry,								--融資日（和暦） 配列
	InStrDispNmAry		IN	typDispNmAry,									--表示用社員氏名 配列
	InStrTenCdAry		IN	typTenCdAry,									--所属店コード 配列
	InStrTenNmAry		IN	typTenNmAry,									--所属店名称 配列
	InStrTozaiAry		IN	typTozaiAry,									--東西区分
	InStrBumonCdAry		IN	typBumonCdAry,									--所属部門コード 配列
	InStrBumonNmAry		IN	typBumonNmAry,									--所属部門名称 配列
	InStrYushiKngAry	IN	typYushiKngAry,									--融資金額 配列
	InStrKansaibiAry	IN	typKansaibiAry,									--完済日 配列
	InStrKansaibiWaAry	IN	typKansaibiWaAry,								--完済日（和暦） 配列
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--固定項目：発行日
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        ：発行者情報１
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        ：発行者情報２
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        ：発行者情報３
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        ：発行者情報４
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        ：ローン名称
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE,			--        ：対象者一覧タイトル
	InStrDeleteFlg		IN	CHAR);											--削除ＦＬＧ ※初回に行う
    
/* 完済通知ＷＫテーブルの削除 */
PROCEDURE	QPAP_CEnt410DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE);			--コンピュータ名



END QPAP_CEnt410PKG;
/
SHOW ERROR

/*****************************************************************************/
/*								２  ボディー							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt410PKG IS

/* 検索完了時のみ開放するテーブル */

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITAAnsyo		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITAAnsyo    , -20022);


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt410SelCodeV                                      */
/* 機能          ：コードビュー検索                                          */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410SelCodeV (
	InStrCodeKbn			IN	VARCHAR2,							--コード区分
	OtNumCodeCount			OUT	NUMBER,								--コード件数
	OtStrCodeAry			OUT	typQSA3Ary) IS						--コード名称配列

	/* 処理固有の変数 */
	NumIdx				NUMBER;
	StrData				VARCHAR2(2000);

	/* コードＶＩＥＷカーソル */
	CURSOR CurQSA3(PRMCODEKBN_I	IN VARCHAR2) IS
		SELECT
			QSA3_PRMCODENO,
			RTRIM(QSA3_MEI) QSA3_MEI
		FROM
			QSA3_CodeV
		WHERE
			QSA3_PRMCODEKBN	= PRMCODEKBN_I
		ORDER BY
			QSA3_PRMCODENO;

	/* 行変数 */
	RowQSA3				CurQSA3%ROWTYPE;			--コードＶＩＥＷカーソル

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCodeCount	:=	0;

	IF CurQSA3%ISOPEN = FALSE THEN
		/* コードＶＩＥＷカーソルのオープン */
		OPEN CurQSA3(InStrCodeKbn);
	END IF;

	NumIdx			:= 0;

	LOOP

		FETCH CurQSA3 INTO RowQSA3;			--順読み
		IF	CurQSA3%NOTFOUND THEN
			EXIT;							--ループ終了
		END IF;

		/* コードＶＩＥＷ情報の出力パラメータの編集 */
		NumIdx := NumIdx + 1;

		StrData := Null;
		StrData := StrData || RowQSA3.QSA3_PRMCODENO		|| StrDLM;	--コードＮＯ
		StrData := StrData || RowQSA3.QSA3_MEI				|| StrDLM;	--コード名称
		OtStrCodeAry(NumIdx)	:= StrData;		--コードＶＩＥＷ情報配列

	END LOOP;

	OtNumCodeCount	:=	NumIdx;
	/* コードＶＩＥＷカーソルのクローズ */
	CLOSE CurQSA3;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurQSA3%ISOPEN THEN
			CLOSE CurQSA3;
		END IF;
		RAISE ;
END	QPAP_CEnt410SelCodeV;

/*****************************************************************************/
/* モジュール名		：QPAP_CEnt410Init										 */
/* 機能				：初期処理												 */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt410Init (
	OtStrSysDate		OUT	CHAR,										--サーバーＳＹＳＴＥＭ日付
	OtNumDP4Count		OUT	NUMBER,										--DP4 発行日     配列格納件数
	OtStrDP4Ary			OUT	typQSA3Ary,									--               配列
	OtNumDP5Count		OUT	NUMBER,										--DP5 発行者情報 配列格納件数
	OtStrDP5Ary			OUT	typQSA3Ary,									--               配列
	OtNumDP6Count		OUT	NUMBER,										--DP6 ローン名称 配列格納件数
	OtStrDP6Ary			OUT	typQSA3Ary) IS								--               配列
	--処理個別の変数
	NumWk				NUMBER;

BEGIN

	/* サーバーＳＹＳＴＥＭ日付取得 */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')	INTO	OtStrSysDate	FROM	DUAL;

	/* 発行日 （件数・名称） */
	QPAP_CEnt410SelCodeV (
		'DP4',								--コード区分
		OtNumDP4Count,						--発行日 件数
		OtStrDP4Ary);						--発行日 配列

	/* 発行者情報（件数・名称） */
	QPAP_CEnt410SelCodeV (
		'DP5',								--コード区分
		OtNumDP5Count,						--発行者情報 件数
		OtStrDP5Ary);						--発行者情報 配列

	/* ローン名称（件数・名称） */
	QPAP_CEnt410SelCodeV (
		'DP6',								--コード区分
		OtNumDP6Count,						--ローン名称 件数
		OtStrDP6Ary);						--ローン名称 配列

END QPAP_CEnt410Init;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt410ListSel                                       */
/* 機能          ：一覧検索                                                  */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410ListSel (
	InStrKansaibiFr		IN	VARCHAR2,										--検索条件：完済日From
	InStrKansaibiTo		IN	VARCHAR2,										--        ：完済日To
	InStrSyainCd1		IN	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE,				--        ：社員コード１
	InStrSyainCd2		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE,				--        ：社員コード２
	InNumMaxRec			IN	NUMBER,											--最大配列格納件数
	IoNumFetchCount	 IN OUT	NUMBER,											--読み込み件数
	IoNumCursor		 IN OUT	NUMBER,											--カーソルＩＤ
	IoNumRecCount	 IN OUT	NUMBER,											--総検索件数
	OtNumAryCount		OUT	NUMBER,											--配列格納件数
	OtStrEndFlg			OUT	VARCHAR2,										--検索終了フラグ
	OtStrDataAry		OUT	typDataAry) IS									--検索データ配列

	/* 処理個別の変数 */
	NumSumCount			NUMBER;
	NumIdx				NUMBER;
	StrData				VARCHAR2(850);

	/* 動的カーソルの変数 */
	NumRows				NUMBER;
	CurCount			NUMBER	:= 0;									--カーソルＩＤ表示件数
	CurKansai			NUMBER	:= 0;									--カーソルＩＤ手紙一覧
	StrSQL				VARCHAR2(3000);									--Statement
	StrWHERE			VARCHAR2(2000);									--Statement

	/* ＦＥＴＣＨの戻り値変数 */
	NumCount			NUMBER;											--表示件数

	--一覧検索結果
	strPRMSyainCD1		QPA8_SynDaicyoT.QPA8_PRMSyainCD1%TYPE;		--01 社員コード１
	strPRMSyainCD2		QPA8_SynDaicyoT.QPA8_PRMSyainCD2%TYPE;		--02 社員コード２
	strYushibi			VARCHAR2(10);								--03 融資日
	strKansaibi			VARCHAR2(10);								--04 完済日
	strYushiKng			VARCHAR2(13);								--05 融資額
	strSimeiKana		QPAC_SyainM.QPAC_SimeiKana%TYPE;			--06 氏名カナ
	strSimeiKanji		QPAC_SyainM.QPAC_SimeiKanji%TYPE;			--07 氏名漢字
	strMiseCD			QPAC_SyainM.QPAC_MiseCD%TYPE;				--08 所属店コード
	strTozaiKBN			QPAC_SyainM.QPAC_TozaiKBN%TYPE;				--09 東西区分
	strBumonCD			QPAC_SyainM.QPAC_BumonCD%TYPE;				--10 所属部門コード
	strMiseNm			QPAE_MiseM.QPAE_MiseNm%TYPE;				--11 所属店名
	strBumonNm			QPAF_BumonM.QPAF_BumonNm%TYPE;				--12 部門名

BEGIN

	/* 出力パラメータのクリア */
	OtNumAryCount		:= 0;
	OtStrEndFlg			:= '0';

	IF IoNumCursor = 0 THEN

		/* 動的ＳＱＬＷＨＥＲＥ文作成 */
		StrWHERE	:= NULL;

		--■■■ 社員コードの条件 ■■■
--		IF InStrSyainCd1		IS NOT NULL	AND
--		   RTRIM(InStrSyainCd2)	IS NOT NULL	THEN
		IF RTRIM(InStrSyainCd2)	IS NOT NULL	THEN
			IF StrWHERE	IS NULL	THEN
				StrWHERE	:=	StrWHERE	||	' WHERE QPA8_PRMSYAINCD1 = '''	||	InStrSyainCd1	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = '''	||	InStrSyainCd2	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD IS NOT NULL ';
			ELSE
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD1  = '''	||	InStrSyainCd1	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2  = '''	||	InStrSyainCd2	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD IS NOT NULL ';
			END IF;
		END IF;

		--■■■ 完済日FromToの条件  ※単月指定の為、必ずFromToが入る(VB側で制御) ■■■
		IF RTRIM(InStrKansaibiFr)	IS NOT NULL	AND
		   RTRIM(InStrKansaibiTo)	IS NOT NULL	THEN
			IF StrWHERE	IS NULL	THEN
				StrWHERE	:=	StrWHERE	||	' WHERE QPA8_KANSAIYMD >= TO_DATE('''	||	InStrKansaibiFr	|| ''',''YYYY/MM/DD'')';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD <= TO_DATE('''	||	InStrKansaibiTo	|| ''',''YYYY/MM/DD'')';
			ELSE
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD >= TO_DATE('''	||	InStrKansaibiFr	|| ''',''YYYY/MM/DD'')';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD <= TO_DATE('''	||	InStrKansaibiTo	|| ''',''YYYY/MM/DD'')';
			END IF;
		END IF;

		--共通
		IF StrWHERE	IS NULL THEN
			StrWHERE	:=	StrWHERE	||	' WHERE QPA8_PRMSYAINCD1 = QPAC_PRMSYAINCD1(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = QPAC_PRMSYAINCD2(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAE_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAF_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_BUMONCD = QPAF_PRMBUMONCD(+) ';
		ELSE
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD1 = QPAC_PRMSYAINCD1(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = QPAC_PRMSYAINCD2(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAE_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAF_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_BUMONCD = QPAF_PRMBUMONCD(+) ';
		END IF;

		/* 表示件数取得ＳＥＬＥＣＴ文作成 */
		StrSQL	:=	NULL;
		StrSQL	:=	StrSQL	||	'SELECT';
		StrSQL	:=	StrSQL	||	' COUNT(*) ';					--件数
		StrSQL	:=	StrSQL	||	'FROM ';
		StrSQL	:=	StrSQL	||	'    QPA8_SynDaicyoT ';			--社員貸付台帳テーブル
		StrSQL	:=	StrSQL	||	',   QPAC_SyainM ';				--社員マスタ
		StrSQL	:=	StrSQL	||	',   QPAE_MiseM ';				--店マスタ
		StrSQL	:=	StrSQL	||	',   QPAF_BumonM ';				--部門マスタ
		StrSQL	:=	StrSQL	||	StrWHERE;						--ＷＨＥＲＥ文

		/* 表示件数カーソルのオープン */
		CurCount  := DBMS_SQL.OPEN_CURSOR;

		/* SQLの解析 */
		DBMS_SQL.PARSE (CurCount,StrSQL, DBMS_SQL.v7);

		/* SQLの実行 */
		NumRows := DBMS_SQL.EXECUTE ( CurCount );

		/* ローカル変数への関連づけ */
		DBMS_SQL.DEFINE_COLUMN(CurCount, 1,NumCount);				--表示件数

		NumSumCount := 0;
		WHILE DBMS_SQL.FETCH_ROWS (CurCount) <> 0 LOOP
			/* カラム値を変数へ格納 */
			DBMS_SQL.COLUMN_VALUE(CurCount,  1,NumCount);			--表示件数
			NumSumCount := NumSumCount + NumCount;
		END LOOP;

		/* 表示件数カーソルのクローズ */
		DBMS_SQL.CLOSE_CURSOR (CurCount);

		IoNumRecCount	:=	NumSumCount;			--パラメータにセット

	END IF;

	IF IoNumCursor = 0 THEN
		/* 動的ＳＱＬＳＥＬＥＣＴ文作成 */
		StrSQL	:=	NULL;
		StrSQL	:= StrSQL	||	'SELECT';
		StrSQL	:= StrSQL	||	'    QPA8_PRMSYAINCD1 ';									--01 社員コード１
		StrSQL	:= StrSQL	||	',   QPA8_PRMSYAINCD2 ';									--02 社員コード２
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_PRMYUSIYMD,''YYYY/MM/DD'') ';				--03 融資日
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_KANSAIYMD,''YYYY/MM/DD'') ';				--04 完済日
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_KYUYOHENSAIALL + QPA8_SYOYOHENSAIALL) ';	--05 融資額
		StrSQL	:= StrSQL	||	',   QPAC_SIMEIKANA ';										--06 氏名カナ
		StrSQL	:= StrSQL	||	',   QPAC_SIMEIKANJI ';										--07 氏名漢字
		StrSQL	:= StrSQL	||	',   QPAC_MISECD ';											--08 所属店コード
		StrSQL	:= StrSQL	||	',   QPAC_TOZAIKBN ';										--09 東西区分
		StrSQL	:= StrSQL	||	',   QPAC_BUMONCD ';										--10 所属部門コード
		StrSQL	:= StrSQL	||	',   QPAE_MISENM ';											--11 所属店名
		StrSQL	:= StrSQL	||	',   QPAF_BUMONNM ';										--12 所属部門名
		StrSQL	:= StrSQL	||	'FROM ';
		StrSQL	:= StrSQL	||	'    QPA8_SynDaicyoT ';				--社員貸付台帳
		StrSQL	:= StrSQL	||	',   QPAC_SyainM ';					--社員マスタ
		StrSQL	:= StrSQL	||	',   QPAE_MiseM ';					--店マスタ
		StrSQL	:= StrSQL	||	',   QPAF_BumonM ';					--部門マスタ
		StrSQL	:= StrSQL	||	StrWHERE;							--ＷＨＥＲＥ文
		StrSQL	:= StrSQL	||	' ORDER BY 8 ASC, 2 ASC, 3 ASC';

		/* 動的カーソルのオープン */
		CurKansai  := DBMS_SQL.OPEN_CURSOR;

		/* SQLの解析 */
		DBMS_SQL.PARSE (CurKansai,StrSQL, DBMS_SQL.v7);

		/* SQLの実行 */
		NumRows := DBMS_SQL.EXECUTE ( CurKansai );

	ELSE
		CurKansai  := IoNumCursor;			--２回目以降はカーソルを再利用する
	END IF;
	IoNumCursor :=  CurKansai;		--パラメータにセット

	/* ローカル変数への関連づけ */
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   1,strPRMSyainCD1,       1);		--01 社員コード１
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   2,strPRMSyainCD2,       7);		--02 社員コード２
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   3,strYushibi,          10);		--03 融資日
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   4,strKansaibi,         10);		--04 完済日
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   5,strYushiKng,         13);		--05 融資額
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   6,strSimeiKana,        15);		--05 氏名カナ
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   7,strSimeiKanji,       20);		--06 氏名漢字
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   8,strMiseCD,            3);		--07 所属店コード
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   9,strTozaiKBN,          1);		--08 東西区分
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  10,strBumonCD,           6);		--09 所属部門コード
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  11,strMiseNm,           24);		--10 所属店名
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  12,strBumonNm,          24);		--11 部門名

	NumIdx := 0;

	<< LoopCurKansai >>
	WHILE DBMS_SQL.FETCH_ROWS (CurKansai) <> 0 LOOP

		IoNumFetchCount := IoNumFetchCount + 1;

		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(CurKansai,   1,strPRMSyainCD1);		--01 社員コード１
		DBMS_SQL.COLUMN_VALUE(CurKansai,   2,strPRMSyainCD2);		--02 社員コード２
		DBMS_SQL.COLUMN_VALUE(CurKansai,   3,strYushibi);			--03 融資日
		DBMS_SQL.COLUMN_VALUE(CurKansai,   4,strKansaibi);			--04 完済日
		DBMS_SQL.COLUMN_VALUE(CurKansai,   5,strYushiKng);			--05 融資額
		DBMS_SQL.COLUMN_VALUE(CurKansai,   6,strSimeiKana);			--06 氏名カナ
		DBMS_SQL.COLUMN_VALUE(CurKansai,   7,strSimeiKanji);		--07 氏名漢字
		DBMS_SQL.COLUMN_VALUE(CurKansai,   8,strMiseCD);			--08 所属店コード
		DBMS_SQL.COLUMN_VALUE(CurKansai,   9,strTozaiKBN);			--09 東西区分
		DBMS_SQL.COLUMN_VALUE(CurKansai,  10,strBumonCD);			--10 所属部門コード
		DBMS_SQL.COLUMN_VALUE(CurKansai,  11,strMiseNm);			--11 所属店名
		DBMS_SQL.COLUMN_VALUE(CurKansai,  12,strBumonNm);			--12 部門名

		StrData := NULL;
		StrData := StrData || strPRMSyainCD1			|| StrDLM;	--01 社員コード１
		StrData := StrData || strPRMSyainCD2			|| StrDLM;	--02 社員コード２
		StrData := StrData || strYushibi				|| StrDLM;	--03 融資日
		StrData := StrData || strKansaibi				|| StrDLM;	--04 完済日
		StrData := StrData || strYushiKng				|| StrDLM;	--05 融資額
		StrData := StrData || strSimeiKana				|| StrDLM;	--06 氏名カナ
		StrData := StrData || strSimeiKanji				|| StrDLM;	--07 氏名漢字
		StrData := StrData || strMiseCD					|| StrDLM;	--08 所属店コード
		StrData := StrData || strTozaiKBN				|| StrDLM;	--09 東西区分
		StrData := StrData || strBumonCD				|| StrDLM;	--10 所属部門コード
		StrData := StrData || strMiseNm					|| StrDLM;	--11 所属店名
		StrData := StrData || strBumonNm				|| StrDLM;	--12 部門名

		NumIdx					:= NumIdx + 1;
		OtStrDataAry(NumIdx)	:= StrData;			--パラメータにセット

		IF NumIdx >= InNumMaxRec THEN
			OtNumAryCount	:= NumIdx;				--パラメータにセット
			RETURN;								--プロシージャの終了（動的カーソルをクローズしない）
		END IF;

	END LOOP LoopCurKansai;

	OtNumAryCount	:= NumIdx;				--パラメータにセット
	OtStrEndFlg		:= '1';					--パラメータにセット（検索終了）
	/* 動的カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (CurKansai);

EXCEPTION
	WHEN	OTHERS	THEN
		IF DBMS_SQL.IS_OPEN (CurCount) THEN
			DBMS_SQL.CLOSE_CURSOR (CurCount);
		END IF;
		IF DBMS_SQL.IS_OPEN (CurKansai) THEN
			DBMS_SQL.CLOSE_CURSOR (CurKansai);
		END IF;
		RAISE ;
END	QPAP_CEnt410ListSel;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt410InsWkTbl                                      */
/* 機能          ：完済通知ＷＫテーブルの登録                                */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--コンピュータ名
	InNumAryCount		IN	NUMBER,											--配列格納件数
	InStrSyainCd1Ary	IN	typSyainCd1Ary,									--社員コード１ 配列
	InStrSyainCd2Ary	IN	typSyainCd2Ary,									--社員コード２ 配列
	InStrYushibiAry		IN	typYushibiAry,									--融資日 配列
	InStrYushibiWaAry	IN	typYushibiWaAry,								--融資日（和暦） 配列
	InStrDispNmAry		IN	typDispNmAry,									--表示用社員氏名 配列
	InStrTenCdAry		IN	typTenCdAry,									--所属店コード 配列
	InStrTenNmAry		IN	typTenNmAry,									--所属店名称 配列
	InStrTozaiAry		IN	typTozaiAry,									--東西区分
	InStrBumonCdAry		IN	typBumonCdAry,									--所属部門コード 配列
	InStrBumonNmAry		IN	typBumonNmAry,									--所属部門名称 配列
	InStrYushiKngAry	IN	typYushiKngAry,									--融資金額 配列
	InStrKansaibiAry	IN	typKansaibiAry,									--完済日 配列
	InStrKansaibiWaAry	IN	typKansaibiWaAry,								--完済日（和暦） 配列
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--固定項目：発行日
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        ：発行者情報１
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        ：発行者情報２
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        ：発行者情報３
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        ：発行者情報４
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        ：ローン名称
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE,			--        ：対象者一覧タイトル
	InStrDeleteFlg		IN	CHAR) IS										--削除ＦＬＧ ※初回に行う

	/* 処理固有の変数 */

BEGIN

	/* 印刷データのクリアＳＰ */
	IF InStrDeleteFlg	= '1' THEN
		QPAP_CEnt410DelWkTbl(
			InStrOperatorID			--オペレータＩＤ
		,	InStrComputerMei		--コンピュータ名
		);
	END IF;

	<<LoopInsWk>>
	FOR i IN 1..InNumAryCount LOOP

		/* ＩＮＳＥＲＴ */
		INSERT INTO QPAZ_KansaiWT VALUES
		   (SUBSTRB(InStrComputerMei,1,20)		--01 コンピューター名
		,   SUBSTRB(InStrOperatorID,1,8)		--02 オペレーターＩＤ
		,	InStrSyainCd1Ary(i)					--03 社員コード１
		,	InStrSyainCd2Ary(i)					--04 社員コード２
		,	InStrYushibiAry(i)					--05 融資日
		,	InStrYushibiWaAry(i)				--06 融資日（和暦）
		,	InStrDispNmAry(i)					--07 表示用氏名
		,	InStrTenCdAry(i)					--08 所属店コード
		,	InStrTenNmAry(i)					--09 所属店名
		,	InStrTozaiAry(i)					--10 東西区分
		,	InStrBumonCdAry(i)					--11 所属部門コード
		,	InStrBumonNmAry(i)					--12 所属部門名
		,	InStrYushiKngAry(i)					--13 融資金額
		,	InStrKansaibiAry(i)					--14 完済日
		,	InStrKansaibiWaAry(i)				--15 完済日（和暦）
		,	InStrHakkoubi						--16 発行日
		,	InStrHakkouInfo1					--17 発行者情報１
		,	InStrHakkouInfo2					--18 発行者情報２
		,	InStrHakkouInfo3					--19 発行者情報３
		,	InStrHakkouInfo4					--20 発行者情報４
		,	InStrLoanNm							--21 ローン名称
		,	InStrTitle							--22 対象者一覧タイトル
		);

	END LOOP LoopInsWk;

	--COMMIT
	COMMIT;

 EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt410InsWkTbl;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt410DelWkTbl                                      */
/* 機能          ：完済通知ＷＫテーブルの削除                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt410DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE) IS			--コンピュータ名

BEGIN

	DELETE
		FROM QPAZ_KansaiWT
	WHERE
			QPAZ_TANMATSUID		= InStrComputerMei
		AND	QPAZ_TANTOID		= InStrOperatorID;

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt410DelWkTbl;


END QPAP_CEnt410PKG;
/***END of LINE****************************************************************/
/
SHOW ERROR
