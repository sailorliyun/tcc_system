CREATE OR REPLACE PACKAGE  QPAP_CEnt120PkG IS
/****************************************************************************/
/* システム名	：高島屋クレジットシステム									*/
/* 業務名		：社員貸付システム											*/
/* モジュール名	：QPAP_CEnt120PkG											*/
/* 機能			：返済額一覧表												*/
/* 作成日		：2001/08/23												*/
/* 作成者		：FIP														*/
/****************************************************************************/

/****************************************************************************/
/*								１	宣言部									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
	TYPE typKSKBNAry		IS TABLE OF CHAR(1)		INDEX BY BINARY_INTEGER;	--給与／賞与判定フラグ配列
	TYPE typPAGEKBNAry		IS TABLE OF NUMBER(1)	INDEX BY BINARY_INTEGER;	--ページ区分配列
	TYPE typGYOUKBNAry		IS TABLE OF NUMBER(2)	INDEX BY BINARY_INTEGER;	--行区分配列
	TYPE typYUSIGAKU		IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--融資額配列
	TYPE typSIHARAI06Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払06配列
	TYPE typSIHARAI12Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払12配列
	TYPE typSIHARAI18Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払18配列
	TYPE typSIHARAI24Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払24配列
	TYPE typSIHARAI30Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払30配列
	TYPE typSIHARAI36Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払36配列
	TYPE typSIHARAI42Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払42配列
	TYPE typSIHARAI48Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払48配列
	TYPE typSIHARAI54Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払54配列
	TYPE typSIHARAI60Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--支払60配列
	TYPE typNEXTSYOYOMAry	IS TABLE OF CHAR(2)		INDEX BY BINARY_INTEGER;	--次回賞与月配列
	TYPE typSEQNOAry		IS TABLE OF NUMBER(3)	INDEX BY BINARY_INTEGER;	--シーケンス番号

/* 初期処理（システム日付取得） */
PROCEDURE QPAP_CEnt120Init (
	 OtStrSysDate		OUT	VARCHAR2			--サーバーＳＹＳＴＥＭ日付
	,OtStrBonusDate1	OUT	VARCHAR2			-- ボーナス支払日１
	,OtStrBonusDate2	OUT	VARCHAR2);			-- ボーナス支払日２

/* 印刷用テーブルに登録 */
PROCEDURE QPAP_CEnt120PrintAdd (
	 InNumAryCount			IN		NUMBER				--配列件数
	,InStrCOMPUTERMEI		IN		VARCHAR2			--コンピュータ名
	,InStrYuushiDate		IN		VARCHAR2			--融資日
	,InStrRiritu			IN		VARCHAR2			--利率
	,InStrKSKbnAry			IN		typKSKBNAry			--給与／賞与判定フラグ配列
	,InNumPageKBNAry		IN		typPAGEKBNAry		--ページ区分配列
	,InNumGyouKBNAry		IN		typGYOUKBNAry		--行区分配列
	,InNumYuusigakuAry		IN		typYUSIGAKU			--融資額配列
	,InNumShiharai06Ary		IN		typSIHARAI06Ary		--支払06配列
	,InNumShiharai12Ary		IN		typSIHARAI12Ary		--支払12配列
	,InNumShiharai18Ary		IN		typSIHARAI18Ary		--支払18配列
	,InNumShiharai24Ary		IN		typSIHARAI24Ary		--支払24配列
	,InNumShiharai30Ary		IN		typSIHARAI30Ary		--支払30配列
	,InNumShiharai36Ary		IN		typSIHARAI36Ary		--支払36配列
	,InNumShiharai42Ary		IN		typSIHARAI42Ary		--支払42配列
	,InNumShiharai48Ary		IN		typSIHARAI48Ary		--支払48配列
	,InNumShiharai54Ary		IN		typSIHARAI54Ary		--支払54配列
	,InNumShiharai60Ary		IN		typSIHARAI60Ary		--支払60配列
	,InStrJikaiSyouyoAry	IN		typNEXTSYOYOMAry	--次回賞与月配列
	,InNumSeqNoAry			IN		typSEQNOAry);		--シーケンス番号

/* 印刷用テーブルから削除 */
PROCEDURE QPAP_CEnt120PrintDel (
	InStrCOMPUTERMEI	IN		VARCHAR2 );								--コンピューター名

END QPAP_CEnt120PkG;
/
SHOW ERROR

/****************************************************************************/
/*								２	ボディー								*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt120PkG IS

	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		/* テーブル名   */
		fldKousinKbn	CHAR(1),		/* 更新区分     */
		fldAcsKey		CHAR(50),		/* アクセスキー */
		fldMsg			CHAR(100)		/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);


/****************************************************************************/
/* モジュール名	：QPAP_CEnt120Init											*/
/* 機能			：システム日付取得											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt120Init (
	 OtStrSysDate		OUT	VARCHAR2			--サーバーＳＹＳＴＥＭ日付
	,OtStrBonusDate1	OUT	VARCHAR2			-- ボーナス支払日１
	,OtStrBonusDate2	OUT	VARCHAR2) IS		-- ボーナス支払日２

BEGIN

	/* サーバーＳＹＳＴＥＭ日付取得 */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
	INTO	OtStrSysDate
	FROM	DUAL;

	/* 店マスタから店名称、賞与支払日１、賞与支払日２取得 */
	BEGIN
		SELECT	 NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 OtStrBonusDate1
				,OtStrBonusDate2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= '001'
		ORDER BY QPAE_PRMMISECD;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RAISE;
	END;

END	QPAP_CEnt120Init;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt120PrintAdd										*/
/* 機能			：印刷用テーブルにデータを登録								*/
/****************************************************************************/
/* 印刷用テーブルに登録 */
PROCEDURE QPAP_CEnt120PrintAdd (
	 InNumAryCount			IN		NUMBER					--配列件数
	,InStrCOMPUTERMEI		IN		VARCHAR2				--コンピュータ名
	,InStrYuushiDate		IN		VARCHAR2				--融資日
	,InStrRiritu			IN		VARCHAR2				--利率
	,InStrKSKbnAry			IN		typKSKBNAry				--給与／賞与判定フラグ配列
	,InNumPageKBNAry		IN		typPAGEKBNAry			--ページ区分配列
	,InNumGyouKBNAry		IN		typGYOUKBNAry			--行区分配列
	,InNumYuusigakuAry		IN		typYUSIGAKU				--融資額配列
	,InNumShiharai06Ary		IN		typSIHARAI06Ary			--支払06配列
	,InNumShiharai12Ary		IN		typSIHARAI12Ary			--支払12配列
	,InNumShiharai18Ary		IN		typSIHARAI18Ary			--支払18配列
	,InNumShiharai24Ary		IN		typSIHARAI24Ary			--支払24配列
	,InNumShiharai30Ary		IN		typSIHARAI30Ary			--支払30配列
	,InNumShiharai36Ary		IN		typSIHARAI36Ary			--支払36配列
	,InNumShiharai42Ary		IN		typSIHARAI42Ary			--支払42配列
	,InNumShiharai48Ary		IN		typSIHARAI48Ary			--支払48配列
	,InNumShiharai54Ary		IN		typSIHARAI54Ary			--支払54配列
	,InNumShiharai60Ary		IN		typSIHARAI60Ary			--支払60配列
	,InStrJikaiSyouyoAry	IN		typNEXTSYOYOMAry		--次回賞与月配列
	,InNumSeqNoAry			IN		typSEQNOAry) IS		--シーケンス番号

BEGIN

	<<LoopPrintAdd>>
	FOR i IN 1..InNumAryCount LOOP


		/* 印刷用テーブルへの登録 */
		INSERT INTO QPAN_HenIchiW VALUES (
			 InNumSeqNoAry(i)					--シーケンス番号
			,InStrKSKbnAry(i)					--給与／賞与判定フラグ配列
			,InNumPageKBNAry(i)					--ページ区分配列
			,InNumGyouKBNAry(i)					--行区分配列
			,TO_DATE(InStrYuushiDate)			--通史日
			,TO_NUMBER(InNumYuusigakuAry(i)) 	--融資額配列
			,TO_NUMBER(InStrRiritu)				--利率
			,InNumShiharai06Ary(i)				--支払06配列
			,InNumShiharai12Ary(i)				--支払12配列
			,InNumShiharai18Ary(i)				--支払18配列
			,InNumShiharai24Ary(i)				--支払24配列
			,InNumShiharai30Ary(i)				--支払30配列
			,InNumShiharai36Ary(i)				--支払36配列
			,InNumShiharai42Ary(i)				--支払42配列
			,InNumShiharai48Ary(i)				--支払48配列
			,InNumShiharai54Ary(i)				--支払54配列
			,InNumShiharai60Ary(i)				--支払60配列
			,InStrJikaiSyouyoAry(i)				--次回賞与月配列
			,InStrCOMPUTERMEI);					--コンピュータ名

	END LOOP LoopPrintAdd;
		COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;

		RAISE ;
END QPAP_CEnt120PrintAdd;
/****************************************************************************/
/* モジュール名	：QPAP_CEnt120PrintDel										*/
/* 機能			：印刷用テーブルからデータを削除							*/
/****************************************************************************/
PROCEDURE QPAP_CEnt120PrintDel (
	InStrCOMPUTERMEI	IN		VARCHAR2 )IS						--コンピューター名
BEGIN

	/* 印刷用テーブルからデータを削除 */
	DELETE	FROM QPAN_HENICHIW
	WHERE	QPAN_COMPUTERMEI = InStrCOMPUTERMEI;

	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt120PrintDel;

END QPAP_CEnt120PkG;
/***END of LINE***************************************************************/
/
SHOW ERROR
