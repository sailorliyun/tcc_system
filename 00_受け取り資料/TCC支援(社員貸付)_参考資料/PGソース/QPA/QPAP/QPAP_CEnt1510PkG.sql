CREATE OR REPLACE PACKAGE  QPAP_CEnt1510PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_CEnt1510PkG                                          */
/* 機能          ：残高履歴テーブル登録処理（入金データ）                    */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：NBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100330  TR1003-016       残高履歴Tへの小口入金登録件数不備                                                   */
/*                               件数取得SQLを修正する                                                            */
/******************************************************************************************************************/

/* 残高履歴テーブル登録処理（入金データ） */
PROCEDURE QPAP_ZNDK_NUKNTURK (
                                InChaNetID IN CHAR,	--ネットＩＤ
                                InChaJobID IN CHAR);	--ジョブＩＤ

END QPAP_CEnt1510PkG;
/
SHOW ERROR

/*****************************************************************************/
/* ２  ボディー                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1510PkG IS

--- カーソル定義（社員コード１、社員コード２、融資区分、融資日等を取得）
	CURSOR CurNUKN(i_fromDate IN DATE, i_toDate IN DATE) IS
		SELECT	Q5.QPA5_NYUKINYMD  i_NYUKINYMD,
			Q5.QPA5_SYAINCD1   i_SYAINCD1,
			Q5.QPA5_SYAINCD2   i_SYAINCD2,
			Q5.QPA5_NYUKINGAKU i_NYUKINGAKU,
			B5.QPB5_RISOKU     i_RISOKU
		FROM	QPA5_KGCNYUKINT Q5,
			QPA1_KGCDAICYOT Q1,
			QPAC_SYAINM QC,
			QPB5_BUNKAIRSK B5
		WHERE	Q5.QPA5_NYUKINYMD >= i_fromDate
		AND	Q5.QPA5_NYUKINYMD <  i_toDate
		AND	to_char(Q5.QPA5_NYUKINYMD, 'YYYYMMDD') =  to_char(B5.QPB5_NYUKINYMD, 'YYYYMMDD')
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(Q1.QPA1_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  Q1.QPA1_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(QC.QPAC_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  QC.QPAC_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(B5.QPB5_SYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  B5.QPB5_SYAINCD2
		AND	B5.QPB5_SYUBETU   = '1';


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1510PkG.QPAP_ZNDK_NUKNTURK                       */
/* 機能	  ：残高履歴テーブル登録処理（入金データ）                           */
/*****************************************************************************/
PROCEDURE QPAP_ZNDK_NUKNTURK (
				InChaNetID IN CHAR,		--ネットＩＤ
				InChaJobID IN CHAR) IS		--ジョブＩＤ

	-- 処理変数定義
	module       VARCHAR2(40) := 'QPAP_CEnt1510PkG.QPAP_ZNDK_NUKNTURK';
	RowNUKN      CurNUKN%ROWTYPE;	-- カーソル
	SyoriKbn     NUMBER	  := 0;	-- 処理実行箇所カウント
	TurkCNT      NUMBER	  := 0;	-- 残高履歴テーブル登録件数
	InsCount     NUMBER	  := 0;	-- 登録件数（事前取得用）
	w_fromDate   DATE;		-- 検索開始日（処理日付）
	w_toDate     DATE;		-- 検索終了日（処理日付）

	o_NYUKINYMD  DATE;		-- 入金日
	o_SYAINCD1   CHAR(1);		-- 社員コード１
	o_SYAINCD2   CHAR(7);		-- 社員コード２
	o_NYUKINGAKU NUMBER;		-- 入金額（元金）
	o_RISOKU     NUMBER;		-- 入金額（利息）

BEGIN

	-- コンソールログ出力（処理開始）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- 登録期間取得（処理日前日の18:00 ～ 処理日18:00）
--	w_fromDate := TO_DATE(TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '180000', 'YYYYMMDDHH24MISS');
--	w_toDate   := TO_DATE(TO_CHAR(SYSDATE    , 'YYYYMMDD') || '180000', 'YYYYMMDDHH24MISS');

	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01' || '000000', 'YYYYMMDDHH24MISS');
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- 小口入金テーブル（QPA5_KGCNYUKINT）から件数取得
	SELECT  COUNT(*)
		INTO	InsCount
		FROM	QPA5_KGCNYUKINT Q5,
			QPA1_KGCDAICYOT Q1,
			QPAC_SYAINM QC,
			QPB5_BUNKAIRSK B5
--MOD 20100319 0908047 NBC YOKOYAMA START
--		WHERE	Q5.QPA5_NYUKINYMD >  w_fromDate
--		AND	Q5.QPA5_NYUKINYMD <= w_toDate
		WHERE	Q5.QPA5_NYUKINYMD >=  w_fromDate
		AND	Q5.QPA5_NYUKINYMD < w_toDate
--MOD 20100319 0908047 NBC YOKOYAMA END
		AND	to_char(Q5.QPA5_NYUKINYMD, 'YYYYMMDD') =  to_char(B5.QPB5_NYUKINYMD, 'YYYYMMDD')
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(Q1.QPA1_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  Q1.QPA1_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(QC.QPAC_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  QC.QPAC_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(B5.QPB5_SYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  B5.QPB5_SYAINCD2
		AND	B5.QPB5_SYUBETU     = '1';

	-- コンソールログ出力（取得件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA5_KGCNYUKINT:IN = ' || TO_CHAR(InsCount)
		);

	-- 処理区分
	SyoriKbn := 1;

	-- 動的カーソルのオープン
	OPEN CurNUKN(w_fromDate, w_toDate);

	LOOP
		FETCH CurNUKN INTO RowNUKN;
		IF CurNUKN%NOTFOUND THEN
			EXIT;				     --ループ終了
		END IF;

		-- 入金テーブルからデータ取得
		o_NYUKINYMD  := TO_DATE(TO_CHAR(RowNUKN.i_NYUKINYMD, 'YYYYMMDD'), 'YYYYMMDD');
								-- 入金日
		o_SYAINCD1   := NVL(RowNUKN.i_SYAINCD1, ' ');	-- 社員コード１
		o_SYAINCD2   := RowNUKN.i_SYAINCD2;		-- 社員コード２
		o_NYUKINGAKU := NVL(RowNUKN.i_NYUKINGAKU, 0);	-- 入金額（元金）
		o_RISOKU     := NVL(RowNUKN.i_RISOKU, 0);	-- 入金額（利息）

		-- 処理区分
		SyoriKbn     := 2;

		-- 残高履歴テーブル登録処理
		INSERT	INTO QPB3_ZNDKRRK (
			QPB3_SYAINCD1,
			QPB3_SYAINCD2,
			QPB3_SYUBETU,
			QPB3_SYORIYMD,
			QPB3_SYORIKBN,
			QPB3_GANKIN,
			QPB3_KJRISOKU,
			QPB3_KUSNFLG,
			QPB3_TURKYMD,
			QPB3_KUSNYMD
		) VALUES (
			o_SYAINCD1,
			o_SYAINCD2,
			'1',
			o_NYUKINYMD,
			'2',
			o_NYUKINGAKU,
			o_RISOKU,
			'0',
			SYSDATE,
			SYSDATE
		);

		-- 処理区分
		SyoriKbn     := 3;

		-- 登録件数カウントアップ
		TurkCNT      := TurkCNT + 1;

	END LOOP;

	-- 動的カーソルのクローズ
	CLOSE CurNUKN;

	-- 処理区分
	SyoriKbn :=	4;

	-- コンソールログ出力（追加件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(TurkCNT)
		);

	-- 処理区分
	SyoriKbn :=	5;

	-- コミット
	commit;

	-- コンソールログ出力（処理終了）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'End');


EXCEPTION
	WHEN OTHERS THEN
		-- ロールバック
		ROLLBACK;

		-- ログ出力ＥＮＤ
		QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'E',
			'SYORIKUBUN:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

		/* エラー発生 */
		RAISE;

END QPAP_ZNDK_NUKNTURK;

END QPAP_CEnt1510PkG;
/
SHOW ERROR
