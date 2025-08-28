CREATE OR REPLACE PACKAGE  QPAP_ActX010PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  					  */
/* 業務名        ：社員貸付システム                                          					  */
/* モジュール名  ：QPAP_ActX010PkG                                           					  */
/* 機能          ：名寄せ検索処理	                                     					　*/
/* 作成日        ：2001/07/07                                                					　*/
/* 作成者        ：FIP                                                       					　*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*								                                      １  宣言部  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtSyaCD1Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE	--社員コード１
						INDEX BY BINARY_INTEGER;
	TYPE typOtSyaCD2Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE	--社員コード２
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKnAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANA%TYPE		--氏名カナ
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKjAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE	--氏名漢字
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE		--店コード
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE		--店名称
						INDEX BY BINARY_INTEGER;
	TYPE typOtTziKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE		--東西区分
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE		--部門コード
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE		--部門名称
						INDEX BY BINARY_INTEGER;

/******************************************************************************************************************/
/*	１  宣言部							     					　*/
/******************************************************************************************************************/

/* 社員データ取得 */
PROCEDURE QPAP_ActX010SelList (
	 InStrName		IN	VARCHAR2				--抽出キー　氏名漢字
	,InNumMaxRec		IN	NUMBER					--最大配列格納件数
	,IoNumSpCnt		IN OUT	NUMBER					--呼び出し回数
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--社員コード１配列
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--社員コード２配列
	,OtSimeiKana		OUT	typOtSimeKnAry				--氏名カナ配列
	,OtSimeiKanji		OUT	typOtSimeKjAry				--氏名漢字配列
	,OtMiseCD		OUT	typOtMiseCDAry				--店コード配列
	,OtMiseNM		OUT	typOtMiseNMAry				--店名称配列
	,OtTozaiKBN		OUT	typOtTziKBNAry				--東西区分配列
	,OtBumonCD		OUT	typOtBumnCDAry				--部門コード配列
	,OtBumonNM		OUT	typOtBumnNMAry				--部門名称配列
	,OtNumAryCount		OUT	NUMBER					--配列格納件数
	,OtStrEndFlg		OUT	VARCHAR2);				--検索終了フラグ

END QPAP_ActX010PkG;
/
show error

/******************************************************************************************************************/
/*２  ボディー  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_ActX010PkG IS
	/***  ログメッセージ定義	*/
--	TYPE	typMsg	IS	   RECORD (
--		fldTableID	   CHAR(19),				/* テーブル名   */
--		fldKousinKbn	   CHAR(1),		        	/* 更新区分     */
--		fldAcsKey	   CHAR(50),				/* アクセスキー */
--		fldMsg		   CHAR(100)				/* 処理コード   */
--	);
--	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名  ：QPAP_ActX010SelList                                                                            */
/* 機能          ：社員データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_ActX010SelList (
	 InStrName		IN	VARCHAR2				--抽出キー　氏名漢字
	,InNumMaxRec		IN	NUMBER					--最大配列格納件数
	,IoNumSpCnt		IN OUT	NUMBER					--呼び出し回数
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--社員コード１配列
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--社員コード２配列
	,OtSimeiKana		OUT	typOtSimeKnAry				--氏名カナ配列
	,OtSimeiKanji		OUT	typOtSimeKjAry				--氏名漢字配列
	,OtMiseCD		OUT	typOtMiseCDAry				--店コード配列
	,OtMiseNM		OUT	typOtMiseNMAry				--店名称配列
	,OtTozaiKBN		OUT	typOtTziKBNAry				--東西区分配列
	,OtBumonCD		OUT	typOtBumnCDAry				--部門コード配列
	,OtBumonNM		OUT	typOtBumnNMAry				--部門名称配列
	,OtNumAryCount		OUT	NUMBER					--配列格納件数
	,OtStrEndFlg		OUT	VARCHAR2) IS				--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;					--配列用IDX
	v_CursorID			INTEGER;				--カーソルID
	v_SelectStmt			VARCHAR2(1000);				--SQL文字列
	v_WhereStmt			VARCHAR2(500);				--SQL文字列
	v_SyainCD1     			QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE;	--バインド用社員コード1
	v_SyainCD2     			QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE;	--バインド用社員コード2
	v_SimeiKana    			QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;	--バインド用氏名カナ
	v_SimeiKanji   			QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;	--バインド用氏名漢字
	v_MiseCD       			QPAC_SYAINM.QPAC_MISECD%TYPE;		--バインド用所属店コード
	v_MiseNM			QPAE_MISEM.QPAE_MISENM%TYPE;		--バインド用所属店名称
	v_TozaiKBN     			QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;		--バインド用東西区分
	v_BumonCD      			QPAC_SYAINM.QPAC_BUMONCD%TYPE;		--バインド用所属部門コード
        v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;		--バインド用所属部門名称
	v_Dummy				INTEGER;				--Dummy


BEGIN

	/* 初期化 */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--処理時に使用するカーソルをオープンする
	IF IoNumSpCnt = 0 THEN
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--問合せ文字列の作成
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  C.QPAC_PRMSYAINCD1,C.QPAC_PRMSYAINCD2,C.QPAC_SIMEIKANA,
					  C.QPAC_SIMEIKANJI,C.QPAC_MISECD,E.QPAE_MISENM,C.QPAC_TOZAIKBN,
					  C.QPAC_BUMONCD,F.QPAF_BUMONNM
				 FROM 	  QPAC_SYAINM C,QPAD_SYASEIM D,QPAE_MISEM E,QPAF_BUMONM F
				 WHERE    C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)
				 AND      C.QPAC_MISECD  = F.QPAF_PRMMISECD (+)
				 AND      C.QPAC_MISECD  = E.QPAE_PRMMISECD (+)
				 AND      C.QPAC_PRMSYAINCD1 = D.QPAD_PRMSYAINCD1 (+)
				 AND      C.QPAC_PRMSYAINCD2 = D.QPAD_PRMSYAINCD2 (+)
				 AND 	  C.QPAC_SIMEIKANA  LIKE :LikeName
				 ORDER BY C.QPAC_PRMSYAINCD2';

		--問合せを解析する
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--入力変数をバインドする
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':LikeName',InStrName || '%');

		--実行する
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;


	--出力変数を定義する
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SimeiKana,15);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_SimeiKanji,20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);

	--FETCH LOOP文
	LOOP
		NumIdx := NumIdx + 1;

		--一連の行をバッファに取り出したあとLOOPの終了条件をチェックする
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';					--検索終了
			EXIT;							--ループ終了
		END IF;

		--一連の行をバッファからPLSQL変数にFETCHする
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SimeiKana);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_SimeiKanji);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);

		OtSyainCD1(NumIdx)    := NVL(v_SyainCD1,' ');
		OtSyainCD2(NumIdx)    := NVL(v_SyainCD2,' ');
		OtSimeiKana(NumIdx)   := NVL(v_SimeiKana,' ');
		OtSimeiKanji(NumIdx)  := NVL(v_SimeiKanji,' ');
		OtMiseCD(NumIdx)      := NVL(v_MiseCD,' ');
		OtMiseNM(NumIdx)      := NVL(v_MiseNM,' ');
		OtTozaiKBN(NumIdx)    := NVL(v_TozaiKBN,' ');
		OtBumonCD(NumIdx)     := NVL(v_BumonCD,' ');
		OtBumonNM(NumIdx)     := NVL(v_BumonNM,' ');

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount := NumIdx;
			IoNumSpCnt := v_CursorID;
			RETURN;							--プロシージャの終了（カーソルをクローズしない）
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	OtStrEndFlg	:=	'1';					--検索終了

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE ;

END	QPAP_ActX010SelList;
END QPAP_ActX010PkG;
/
show error
