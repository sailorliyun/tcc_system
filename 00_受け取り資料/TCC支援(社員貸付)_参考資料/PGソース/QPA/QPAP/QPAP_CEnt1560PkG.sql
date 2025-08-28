CREATE OR REPLACE PACKAGE  QPAP_CEnt1560PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_CEnt1560PkG                                          */
/* 機能          ：残高履歴テーブル更新処理（繰越処理）                      */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：NBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100319  TR1003-010       証書控除中止時の新残高表金額違算                                                    */
/*                            ① 精算日以降の給与・賞与控除利息を集計しない                                       */
/*                            ② 控除中止等の理由で精算したにも関わらず残高が0にならない                          */
/*                               場合に精算金額を調整する(12月賞与にも対応)                                       */
/*                            ③ 11月精算の場合12月賞与は11月に計上される。                                       */
/*                               12月の処理で残高が12月賞与分マイナスになるので調整する                           */
/* 20100720  1004091          グループ社員貸付の債権譲渡に伴うシステム対応                                        */
/*                               残高履歴テーブルへの東西区分、所属店コード、所属店名称の編集追加                 */
/******************************************************************************************************************/

/* 残高履歴テーブル更新処理（繰越処理）【Main処理】 */
PROCEDURE QPAP_ZNDKKUSNMAIN (
	InChaNetID	IN  CHAR,				-- ネットＩＤ
	InChaJobID	IN  CHAR);				-- ジョブＩＤ

/* 残高履歴テーブル更新処理（繰越処理：小口） */
PROCEDURE QPAP_ZNDKKUSNSUB1 (
	i_SYAINCD1	IN  CHAR,				-- 社員コード１
	i_SYAINCD2	IN  CHAR,				-- 社員コード２
	i_SYUBETU	IN  CHAR,				-- ローン種別
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN	IN  CHAR,
	i_SYOZOKUCD	IN  CHAR,
	i_SYOZOKUNM	IN  VARCHAR,
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		OUT NUMBER);				-- 処理結果戻り値

/* 残高履歴テーブル更新処理（繰越処理：証書） */
PROCEDURE QPAP_ZNDKKUSNSUB2 (
	i_SYAINCD1	IN  CHAR,				-- 社員コード１
	i_SYAINCD2	IN  CHAR,				-- 社員コード２
	i_SYUBETU	IN  CHAR,				-- ローン種別
	i_YUSIYMD	IN  DATE,				-- 融資日
--ADD 20100319 0908047 NBC YOKOYAMA START
	i_cnt		IN  CHAR,				-- １：一回目、２：二回目
--ADD 20100319 0908047 NBC YOKOYAMA END
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN	IN  CHAR,				-- 東西区分
	i_SYOZOKUCD	IN  CHAR,				-- 所属店コード
	i_SYOZOKUNM	IN  VARCHAR,			-- 所属店名称
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		OUT NUMBER);				-- 処理結果戻り値

END QPAP_CEnt1560PkG;
/
SHOW ERR

/*****************************************************************************/
/* ２  ボディー                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1560PkG IS

/* MOD 20100720 1004091 IMZ OKAZAKI START */
---- カーソル定義（社員コード１、社員コード２、ローン種別、融資日を取得）
-- カーソル定義（社員コード１、社員コード２、ローン種別、融資日、東西区分、店コード、店名を取得）
/* MOD 20100720 1004091 IMZ OKAZAKI END */
	CURSOR CurDico(fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			QPB3_SYAINCD1  SYAINCD1,
			QPB3_SYAINCD2  SYAINCD2,
			QPB3_SYUBETU   SYUBETU,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
	--		QPB3_YUSIYMD   YUSIYMD
	--	FROM  QPB3_ZNDKRRK
			QPB3_YUSIYMD   YUSIYMD,
			QPAC_TOZAIKBN  TOZAIKBN,
			QPAC_MISECD    MISECD,
			QPAE_MISENM    MISENM
		FROM  QPB3_ZNDKRRK,
			  QPAC_SYAINM,
			  QPAE_MISEM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		WHERE QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
/* ADD 20100720 1004091 IMZ OKAZAKI START */
		AND   NVL(QPB3_SYAINCD1, ' ') = NVL(QPAC_PRMSYAINCD1, ' ')
		AND   QPB3_SYAINCD2           = QPAC_PRMSYAINCD2
		AND   QPAC_MISECD             = QPAE_PRMMISECD(+)
/* ADD 20100720 1004091 IMZ OKAZAKI END */
		GROUP BY QPB3_SYAINCD1, QPB3_SYAINCD2, QPB3_SYUBETU, QPB3_YUSIYMD, QPAC_TOZAIKBN, QPAC_MISECD, QPAE_MISENM
		ORDER BY QPB3_SYAINCD1, QPB3_SYAINCD2, QPB3_SYUBETU, QPB3_YUSIYMD;


--- カーソル定義（前月の明細データ取得）
	CURSOR CurZndkrrk1(SYAINCD1_I IN CHAR, SYAINCD2_I IN CHAR, SYUBETU_I IN CHAR, fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			ROWID		CurID,
			QPB3_SYORIKBN	SYORIKBN,
			QPB3_KASHITSUKE	KASHITSUKE,
			QPB3_GANKIN	GANKIN,
			QPB3_KJRISOKU	KJRISOKU,
			QPB3_MGANKINK	MGANKINK,
			QPB3_KJRISOKUK	KJRISOKUK,
			QPB3_MGANKINS	MGANKINS,
			QPB3_KJRISOKUS	KJRISOKUS
		FROM  QPB3_ZNDKRRK
		WHERE NVL(QPB3_SYAINCD1, ' ') = NVL(SYAINCD1_I, ' ')
		AND   QPB3_SYAINCD2 = SYAINCD2_I
		AND   QPB3_SYUBETU  = SYUBETU_I
		AND   QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
		ORDER BY QPB3_SYORIYMD, QPB3_SYORIKBN FOR UPDATE;

--- カーソル定義（前月の明細データ取得）
	CURSOR CurZndkrrk2(SYAINCD1_I IN CHAR, SYAINCD2_I IN CHAR, SYUBETU_I IN CHAR, YUSIYMD_I IN DATE, fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			ROWID		CurID,
			QPB3_SYORIKBN	SYORIKBN,
			QPB3_KASHITSUKE	KASHITSUKE,
			QPB3_GANKIN	GANKIN,
			QPB3_KJRISOKU	KJRISOKU,
			QPB3_MGANKINK	MGANKINK,
			QPB3_KJRISOKUK	KJRISOKUK,
			QPB3_MGANKINS	MGANKINS,
			QPB3_KJRISOKUS	KJRISOKUS
--ADD 20100319 0908047 NBC YOKOYAMA START
			,QPB3_SYORIYMD	SYORIYMD
--ADD 20100319 0908047 NBC YOKOYAMA END
		FROM  QPB3_ZNDKRRK
		WHERE NVL(QPB3_SYAINCD1, ' ') = NVL(SYAINCD1_I, ' ')
		AND   QPB3_SYAINCD2 = SYAINCD2_I
		AND   QPB3_SYUBETU  = SYUBETU_I
		AND   QPB3_YUSIYMD  = YUSIYMD_I
		AND   QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
		ORDER BY QPB3_SYORIYMD, QPB3_SYORIKBN FOR UPDATE;


-- グローバル変数定義
	SyoriDate	DATE;
	w_toDate	DATE;			-- データ取得期間：開始
	w_fromDate	DATE;			-- データ取得期間：終了
	module		VARCHAR2(40);		-- ログ出力モジュール名格納
	job_id		CHAR(8);		-- ジョブＩＤ
	net_id		CHAR(8);		-- ネットＩＤ


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1560PkG.QPAP_ZNDKKUSNMAIN                        */
/* 機能          ：残高履歴テーブル：各明細行の残高を更新する                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNMAIN (
					InChaNetID	IN	CHAR,	--ネットＩＤ
					InChaJobID	IN	CHAR)	--ジョブＩＤ

IS

	-- 処理変数定義
	SyoriKbn	NUMBER		:=	0;	-- 処理実行箇所カウント
	RowDico		CurDico%ROWTYPE;		-- カーソル
	i_SYAINCD1	CHAR(1);
	i_SYAINCD2	CHAR(7);
	i_SYUBETU	CHAR(1);
	i_YUSIYMD	DATE;
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN  CHAR(1);
	i_SYOZOKUCD CHAR(3);
	i_SYOZOKUNM VARCHAR(24);
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		NUMBER;
	b_toDate	DATE;
	b_fromDate	DATE;
	DATA_UNMATCH_EXCEPTION EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNMAIN';

	job_id	:=	InChaJobID;
	net_id	:=	InChaNetID;

	-- コンソールログ出力（処理開始）
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'I', 'Start');


	-- 処理日付、期間取得（処理月-2ヶ月 ～ 処理月-1ヶ月）
	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD');
	w_fromDate	:=	ADD_MONTHS(w_toDate,   -2);

	b_toDate   := w_toDate;
	b_fromDate := w_fromDate;


	-- 動的カーソルのオープン
	OPEN CurDico(w_fromDate, w_toDate);

	-- 処理区分
	SyoriKbn := 1;

	LOOP
		FETCH CurDico INTO RowDico;
		IF CurDico%NOTFOUND THEN
			EXIT;                                     --ループ終了
		END IF;

		-- 社員リスト取得
		i_SYAINCD1	:= NVL(RowDico.SYAINCD1, ' ');
		i_SYAINCD2	:= RowDico.SYAINCD2;
		i_SYUBETU	:= RowDico.SYUBETU;
		i_YUSIYMD	:= RowDico.YUSIYMD;
/* ADD 20100720 1004091 IMZ OKAZAKI START */
		i_TOZAIKBN	:= RowDico.TOZAIKBN; -- 東西区分
		i_SYOZOKUCD	:= RowDico.MISECD;   -- 店コード
		i_SYOZOKUNM	:= RowDico.MISENM;   -- 店名
/* ADD 20100720 1004091 IMZ OKAZAKI END */

		-- 処理区分
		SyoriKbn := 2;

		w_toDate   := b_toDate;
		w_fromDate := b_fromDate;

		-- 繰越金計算および明細行に反映、繰越レコード追加
		IF i_SYUBETU = '1' THEN
/* MOD 20100720 1004091 IMZ OKAZAKI START */
	--		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, o_ret);
			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		ELSE
/* MOD 20100720 1004091 IMZ OKAZAKI START */
--MOD 20100319 0908047 NBC YOKOYAMA START
----		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, o_ret);
	----	QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '1', o_ret);
--MOD 20100319 0908047 NBC YOKOYAMA END
			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '1', i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		END IF;

		-- 処理区分
		SyoriKbn := 3;

		-- 障害発生
		IF o_ret = 99 THEN
			-- 処理区分
			SyoriKbn := 4;
			RAISE DATA_UNMATCH_EXCEPTION;
		END IF;

		-- 処理区分
		SyoriKbn := 5;

		-- 繰越金額がマイナスの処理
		IF o_ret = 1 THEN
			-- 処理区分
			SyoriKbn := 6;

			w_toDate   := b_toDate;
			w_fromDate := b_fromDate;

			-- 繰越金計算および明細行に反映、繰越レコード追加（再処理）
			IF i_SYUBETU = '2' THEN
--				QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, o_ret);
--			ELSE
/* MOD 20100720 1004091 IMZ OKAZAKI START */
--MOD 20100319 0908047 NBC YOKOYAMA START
----			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, o_ret);
	----		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '2', o_ret);
--MOD 20100319 0908047 NBC YOKOYAMA END
				QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '2', i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			END IF;

			-- 処理区分
			SyoriKbn := 7;

		END IF;

	END LOOP;

	-- 動的カーソルのクローズ
	CLOSE CurDico;

	-- 処理区分
	SyoriKbn := 8;

	-- コミット
	commit;

	-- コンソールログ出力（処理終了）
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'I', 'End');


EXCEPTION
	WHEN	DATA_UNMATCH_EXCEPTION THEN
		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
			'精算レコード無し' ||
			':SYAINCD1=' || i_SYAINCD1 ||
			':SYAINCD2=' || i_SYAINCD2 ||
			':SYUBETU='  || i_SYUBETU  ||
			':YUSIYMD='  || i_YUSIYMD
			);

	WHEN	OTHERS	THEN
	IF CurDico%ISOPEN = TRUE THEN
		CLOSE CurDico;
	END IF;

	-- ロールバック
	ROLLBACK;

	-- ログ出力ＥＮＤ
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN1:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* エラー発生 */
	RAISE;

END QPAP_ZNDKKUSNMAIN;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(小口)                  */
/* 機能          ：残高履歴テーブル：各明細行の残高を更新する                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNSUB1 (
					i_SYAINCD1 IN  CHAR,	-- 社員コード１
					i_SYAINCD2 IN  CHAR,	-- 社員コード２
					i_SYUBETU  IN  CHAR,	-- ローン種別
/* ADD 20100720 1004091 IMZ OKAZAKI START */
					i_TOZAIKBN IN  CHAR,	-- 東西区分
					i_SYOZOKUCD IN CHAR,	-- 所属店コード
					i_SYOZOKUNM IN VARCHAR,	-- 所属店名称
/* ADD 20100720 1004091 IMZ OKAZAKI END */
					o_ret	   OUT NUMBER)	-- 処理結果戻り値

IS

	RowZndkrrk1	CurZndkrrk1%ROWTYPE;		-- カーソル
	MeiKurFLG	NUMBER := 0;			-- 明細に繰越レコード存在確認用
	i_ZANDAKA	NUMBER := 0;
	i_MGANKINK	NUMBER := 0;
	i_KJRISOKUK	NUMBER := 0;
	i_MGANKINS	NUMBER := 0;
	i_KJRISOKUS	NUMBER := 0;
	FZANDAKA	NUMBER := 0;
	ZANDAKA		NUMBER := 0;
	i_KASHITSUKE	NUMBER := 0;
	i_GANKIN	NUMBER := 0;
	i_KJRISOKU	NUMBER := 0;
	Z_CurID		ROWID;
	Z_SYORIKBN	CHAR(1);
	Z_KASHITSUKE	NUMBER := 0;
	Z_GANKIN	NUMBER := 0;
	Z_KJRISOKU	NUMBER := 0;
	Z_MGANKINK	NUMBER := 0;
	Z_KJRISOKUK	NUMBER := 0;
	Z_MGANKINS	NUMBER := 0;
	Z_KJRISOKUS	NUMBER := 0;
	X_CurID		ROWID;
	X_GANKIN 	NUMBER := 0;
	SyoriKbn	NUMBER := 0;

	NO_DATA_EXCEPTION1 EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1';

	-- 戻り値設定
	o_ret	:= 0;

	-- 繰越レコード処理日
	SyoriDate	:=	LAST_DAY(ADD_MONTHS(w_toDate, -1));

	BEGIN
		-- 繰越データ取得（残高）
		SELECT		NVL(QPB3_ZANDAKA, 0),
				NVL(QPB3_MGANKINK, 0),
				NVL(QPB3_KJRISOKUK, 0),
				NVL(QPB3_MGANKINS, 0),
				NVL(QPB3_KJRISOKUS, 0)
			INTO	i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_SYORIKBN =  '9'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  ADD_MONTHS(w_toDate, -1);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			i_ZANDAKA	:= 0;
			i_MGANKINK	:= 0;
			i_KJRISOKUK	:= 0;
			i_MGANKINS	:= 0;
			i_KJRISOKUS	:= 0;
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
				'KURIKOSI DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
				':SYAINCD2=' || i_SYAINCD2 ||
				':SYUBETU=' || i_SYUBETU
				);
		WHEN	OTHERS	THEN
			IF CurZndkrrk1%ISOPEN = TRUE THEN
				-- 動的カーソルのクローズ
				CLOSE CurZndkrrk1;
			END IF;

			-- 戻り値設定
			o_ret	:= 99;

			-- ロールバック
			ROLLBACK;

			-- ログ出力ＥＮＤ
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
				'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

			/* エラー発生 */
			RAISE;

	END;

	-- 処理区分
	SyoriKbn := 1;

	-- 前々月の残高設定
	FZANDAKA	:= i_ZANDAKA;
	ZANDAKA		:= i_ZANDAKA;		-- 残高（明細用）

	-- 処理日付、期間取得（処理月-1ヶ月 ～ 処理月）
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- 明細レコードに繰越レコードが存在した場合の処理フラグ
	MeiKurFLG := 0;

	-- 処理区分
	SyoriKbn := 2;

	-- 動的カーソルのオープン
	OPEN CurZndkrrk1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, w_fromDate, w_toDate);
	LOOP
		FETCH CurZndkrrk1 INTO RowZndkrrk1;
		IF CurZndkrrk1%NOTFOUND THEN
			EXIT;                                     --ループ終了
		END IF;

		-- データ取得
		Z_CurID		:= RowZndkrrk1.CurID;
		Z_SYORIKBN	:= nvl(RowZndkrrk1.SYORIKBN, 0);
		Z_KASHITSUKE	:= nvl(RowZndkrrk1.KASHITSUKE, 0);
		Z_GANKIN	:= nvl(RowZndkrrk1.GANKIN, 0);
		Z_KJRISOKU	:= nvl(RowZndkrrk1.KJRISOKU, 0);
		Z_MGANKINK	:= nvl(RowZndkrrk1.MGANKINK, 0);
		Z_KJRISOKUK	:= nvl(RowZndkrrk1.KJRISOKUK, 0);
		Z_MGANKINS	:= nvl(RowZndkrrk1.MGANKINS, 0);
		Z_KJRISOKUS	:= nvl(RowZndkrrk1.KJRISOKUS, 0);

		-- 処理区分別処理（繰越レコードの為、更新し処理終了）
		IF Z_SYORIKBN = '9' THEN

			-- 処理区分
			SyoriKbn := 5;

			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_FZANDAKA	= FZANDAKA,
				QPB3_KASHITSUKE	= i_KASHITSUKE,
				QPB3_GANKIN	= i_GANKIN,
				QPB3_KJRISOKU	= i_KJRISOKU,
				QPB3_ZANDAKA	= i_ZANDAKA,
				QPB3_MGANKINK	= i_MGANKINK,
				QPB3_KJRISOKUK	= i_KJRISOKUK,
				QPB3_MGANKINS	= i_MGANKINS,
				QPB3_KJRISOKUS	= i_KJRISOKUS,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE

--			WHERE	ROWID = Z_CurID;
			WHERE CURRENT OF CurZndkrrk1;

			-- 明細レコードに繰越レコードが存在した場合の処理フラグ
			MeiKurFLG := 1;

			EXIT;                                     --ループ終了
		END IF;

		-- 残高計算
--		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN + Z_MGANKINK + Z_MGANKINS;
		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN;

		-- 集計（貸付、入金、控除、分解戻し、分解金額）
		i_KASHITSUKE	:= i_KASHITSUKE  + Z_KASHITSUKE;
--		i_GANKIN	:= i_GANKIN      + Z_GANKIN   - Z_MGANKINK  - Z_MGANKINS;
		i_GANKIN	:= i_GANKIN      + Z_GANKIN;
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU - Z_KJRISOKUK - Z_KJRISOKUS;
		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		i_MGANKINK	:= i_MGANKINK    + Z_MGANKINK;
		i_KJRISOKUK	:= i_KJRISOKUK   + Z_KJRISOKUK;
		i_MGANKINS	:= i_MGANKINS    + Z_MGANKINS;
		i_KJRISOKUS	:= i_KJRISOKUS   + Z_KJRISOKUS;

		-- 処理区分
		SyoriKbn := 3;

		-- レコード更新
		UPDATE QPB3_ZNDKRRK
		SET	QPB3_FZANDAKA	= ZANDAKA,
			QPB3_ZANDAKA	= i_ZANDAKA,
			QPB3_KUSNFLG	= '1',
			QPB3_KUSNYMD	= SYSDATE
--		WHERE ROWID = Z_CurID;
		WHERE CURRENT OF CurZndkrrk1;

		-- 処理区分
		SyoriKbn := 4;

		-- 残高更新（明細用）
		ZANDAKA := i_ZANDAKA;

	END LOOP;

	-- 動的カーソルのクローズ
	CLOSE CurZndkrrk1;

	-- 処理区分
	SyoriKbn := 6;

--	-- 残高がマイナスの場合の処理（証書のみ対応）
--	IF i_SYUBETU = '2' AND i_ZANDAKA < 0 THEN

--		-- 処理区分
--		SyoriKbn := 7;

--		-- 元金初期化
--		X_GANKIN := 0;

--		-- 精算レコード取得
--		SELECT	ROWID,
--			NVL(QPB3_GANKIN, 0)
--		INTO	X_CurID,
--			X_GANKIN
--		FROM	QPB3_ZNDKRRK
--		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
--		AND	QPB3_SYAINCD2 =  i_SYAINCD2
--		AND	QPB3_SYUBETU  =  i_SYUBETU
--		AND	QPB3_SYORIKBN =  '7'
--		AND	QPB3_SYORIYMD >= w_fromDate
--		AND	QPB3_SYORIYMD <  w_toDate;

--		-- 処理区分
--		SyoriKbn := 8;

--		-- 精算レコードが存在しない場合
--		IF SQL%ROWCOUNT = 0 THEN
--			RAISE NO_DATA_EXCEPTION1;
--		END IF;

--		-- 処理区分
--		SyoriKbn := 9;

--		-- 元金にマイナス残高を加える
--		X_GANKIN := X_GANKIN + i_ZANDAKA;

--		-- 精算レコード更新
--		UPDATE	QPB3_ZNDKRRK
--		SET	QPB3_GANKIN	= X_GANKIN,
--			QPB3_KUSNFLG	= '1',
--			QPB3_KUSNYMD	= SYSDATE
--		WHERE	ROWID = X_CurID;

--		-- 処理区分
--		SyoriKbn := 10;

--	END IF;

	-- 処理区分
	SyoriKbn := 11;

	-- 繰越レコード登録
	IF MeiKurFLG = 0 THEN

		-- 処理区分
		SyoriKbn := 12;

		IF ABS(FZANDAKA) + ABS(i_KASHITSUKE) + ABS(i_GANKIN) + ABS(i_KJRISOKU) + ABS(i_ZANDAKA) + ABS(i_MGANKINK) + ABS(i_KJRISOKUK) + ABS(i_MGANKINS) + ABS(i_KJRISOKUS) <> 0 THEN

			-- 明細レコードに繰越レコードが存在しない場合、追加処理
			-- 存在した場合は、ロープ内で更新処理を行っている
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_FZANDAKA,
				QPB3_KASHITSUKE,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_ZANDAKA,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
			--	QPB3_KUSNYMD
				QPB3_KUSNYMD,
				QPB3_TOZAIKBN,
				QPB3_SYOZOKUCD,
				QPB3_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			) VALUES (
				NVL(i_SYAINCD1, ' '),
				i_SYAINCD2,
				i_SYUBETU,
				SyoriDate,
				'9',
				FZANDAKA,
				i_KASHITSUKE,
				i_GANKIN,
				i_KJRISOKU,
				i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS,
				'1',
				SYSDATE,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		SYSDATE
				SYSDATE,
				i_TOZAIKBN,
				i_SYOZOKUCD,
				i_SYOZOKUNM
/* MOD 2010072- 1004091 IMZ OKAZAKI END */
			);

		END IF;

	END IF;

	-- 処理区分
	SyoriKbn := 13;

EXCEPTION
	WHEN	NO_DATA_EXCEPTION1 THEN
		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
			'精算レコード無し' ||
			':SYAINCD1=' || i_SYAINCD1 ||
			':SYAINCD2=' || i_SYAINCD2 ||
			':SYUBETU='  || i_SYUBETU
			);

	WHEN	OTHERS	THEN
	IF CurZndkrrk1%ISOPEN = TRUE THEN
		-- 動的カーソルのクローズ
		CLOSE CurZndkrrk1;
	END IF;

	-- 戻り値設定
	o_ret	:= 99;

	-- ロールバック
	ROLLBACK;

	-- ログ出力ＥＮＤ
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* エラー発生 */
	RAISE;

END QPAP_ZNDKKUSNSUB1;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(証書)                  */
/* 機能          ：残高履歴テーブル：各明細行の残高を更新する                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNSUB2 (
					i_SYAINCD1 IN  CHAR,	-- 社員コード１
					i_SYAINCD2 IN  CHAR,	-- 社員コード２
					i_SYUBETU  IN  CHAR,	-- ローン種別
					i_YUSIYMD  IN  DATE,	-- 融資日
--ADD 20100319 0908047 NBC YOKOYAMA START
					i_cnt	   IN  CHAR,	-- １：一回目、２：二回目
--ADD 20100319 0908047 NBC YOKOYAMA END
/* ADD 20100720 1004091 IMZ OKAZAKI START */
					i_TOZAIKBN IN  CHAR,	-- 東西区分
					i_SYOZOKUCD IN CHAR,	-- 所属店コード
					i_SYOZOKUNM IN VARCHAR,	-- 所属店名称
/* ADD 20100720 1004091 IMZ OKAZAKI END */
					o_ret	   OUT NUMBER)	-- 処理結果戻り値
IS

	RowZndkrrk2	CurZndkrrk2%ROWTYPE;		-- カーソル
	MeiKurFLG	NUMBER := 0;			-- 明細に繰越レコード存在確認用
	i_ZANDAKA	NUMBER := 0;
	i_MGANKINK	NUMBER := 0;
	i_KJRISOKUK	NUMBER := 0;
	i_MGANKINS	NUMBER := 0;
	i_KJRISOKUS	NUMBER := 0;
	FZANDAKA	NUMBER := 0;
	ZANDAKA		NUMBER := 0;
	i_KASHITSUKE	NUMBER := 0;
	i_GANKIN	NUMBER := 0;
	i_KJRISOKU	NUMBER := 0;
	Z_CurID		ROWID;
	Z_SYORIKBN	CHAR(1);
	Z_KASHITSUKE	NUMBER := 0;
	Z_GANKIN	NUMBER := 0;
	Z_KJRISOKU	NUMBER := 0;
	Z_MGANKINK	NUMBER := 0;
	Z_KJRISOKUK	NUMBER := 0;
	Z_MGANKINS	NUMBER := 0;
	Z_KJRISOKUS	NUMBER := 0;
	X_CurID		ROWID;
	X_GANKIN 	NUMBER := 0;
	SyoriKbn	NUMBER := 0;

--ADD 20100319 0908047 NBC YOKOYAMA START
	SeisanFLG	CHAR(1);		--証書完済：1、未完済：0
	SeisanDate	DATE;			--精算日を保存
	KyuyoFLG	CHAR(1);		--給与控除有り：1、なし：0
	SyoyoFLG	CHAR(1);		--賞与控除有り：1、なし：0
	X_CurID2	ROWID;			--証書入金T用
	X_GANKIN2 	NUMBER := 0;	--証書入金T用

	--精算日以降の控除抜け時の利息計算用
	v_Risoku		NUMBER := 0;	--利息
	v_Kikan			NUMBER := 0;	--日数
	KyuyoTo			DATE;			--給与計算日To
	KyuyoFrom		DATE;			--給与計算日From
	SyoyoTo			DATE;			--賞与計算日To
	SyoyoFrom		DATE;			--賞与計算日From
	v_KYUYOZANDAKA		QPB6_SYNDAICYOW2T.QPB6_KYUYOZANDAKA%TYPE := 0;
	v_SYOYOZANDAKA		QPB6_SYNDAICYOW2T.QPB6_SYOYOZANDAKA%TYPE := 0;
	v_SYOYOHENSAIALL	QPB6_SYNDAICYOW2T.QPB6_SYOYOHENSAIALL%TYPE := 0;
	v_RIRITU			QPB6_SYNDAICYOW2T.QPB6_RIRITU%TYPE := 0;
	v_RIRITU2			NUMBER := 0;
--ADD 20100319 0908047 NBC YOKOYAMA END
--	NO_DATA_EXCEPTION2 EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2';

	-- 戻り値設定
	o_ret	:= 0;

	-- 繰越レコード処理日
	SyoriDate	:=	LAST_DAY(ADD_MONTHS(w_toDate, -1));

	BEGIN
		-- 繰越データ取得（残高）
		SELECT		NVL(QPB3_ZANDAKA, 0),
				NVL(QPB3_MGANKINK, 0),
				NVL(QPB3_KJRISOKUK, 0),
				NVL(QPB3_MGANKINS, 0),
				NVL(QPB3_KJRISOKUS, 0)
			INTO	i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '9'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  ADD_MONTHS(w_toDate, -1);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			i_ZANDAKA	:= 0;
			i_MGANKINK	:= 0;
			i_KJRISOKUK	:= 0;
			i_MGANKINS	:= 0;
			i_KJRISOKUS	:= 0;
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
				'KURIKOSI DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
				':SYAINCD2=' || i_SYAINCD2 ||
				':SYUBETU=' || i_SYUBETU ||
				':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
				);
		WHEN	OTHERS	THEN
			IF CurZndkrrk2%ISOPEN = TRUE THEN
				-- 動的カーソルのクローズ
				CLOSE CurZndkrrk2;
			END IF;

			-- 戻り値設定
			o_ret	:= 99;

			-- ロールバック
			ROLLBACK;

			-- ログ出力ＥＮＤ
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
				'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

			/* エラー発生 */
			RAISE;

	END;

	-- 処理区分
	SyoriKbn := 1;

	-- 前々月の残高設定
	FZANDAKA	:= i_ZANDAKA;
	ZANDAKA		:= i_ZANDAKA;		-- 残高（明細用）

	-- 処理日付、期間取得（処理月-1ヶ月 ～ 処理月）
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- 明細レコードに繰越レコードが存在した場合の処理フラグ
	MeiKurFLG := 0;

--ADD 20100319 0908047 NBC YOKOYAMA START
	SeisanFLG := 0;		--初期化
	KyuyoFLG := 0;		--初期化
	SyoyoFLG := 0;		--初期化
--ADD 20100319 0908047 NBC YOKOYAMA END

	-- 処理区分
	SyoriKbn := 2;

	-- 動的カーソルのオープン
	OPEN CurZndkrrk2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, w_fromDate, w_toDate);
	LOOP
		FETCH CurZndkrrk2 INTO RowZndkrrk2;
		IF CurZndkrrk2%NOTFOUND THEN
			EXIT;                                     --ループ終了
		END IF;

		-- データ取得
		Z_CurID		:= RowZndkrrk2.CurID;
		Z_SYORIKBN	:= nvl(RowZndkrrk2.SYORIKBN, 0);
		Z_KASHITSUKE	:= nvl(RowZndkrrk2.KASHITSUKE, 0);
		Z_GANKIN	:= nvl(RowZndkrrk2.GANKIN, 0);
		Z_KJRISOKU	:= nvl(RowZndkrrk2.KJRISOKU, 0);
		Z_MGANKINK	:= nvl(RowZndkrrk2.MGANKINK, 0);
		Z_KJRISOKUK	:= nvl(RowZndkrrk2.KJRISOKUK, 0);
		Z_MGANKINS	:= nvl(RowZndkrrk2.MGANKINS, 0);
		Z_KJRISOKUS	:= nvl(RowZndkrrk2.KJRISOKUS, 0);

--ADD 20100319 0908047 NBC YOKOYAMA START
		IF Z_SYORIKBN = '7' THEN
			SeisanFLG := '1';						--精算あり。以降のループで出てくる控除は利息を集計しない
			SeisanDate := RowZndkrrk2.SYORIYMD;		--精算日を覚えておく
		ELSIF Z_SYORIKBN = '3' THEN
			KyuyoFLG := '1';		--給与控除あり。
		ELSIF Z_SYORIKBN = '4' THEN
			SyoyoFLG := '1';		--賞与控除あり。
		END IF;
--ADD 20100319 0908047 NBC YOKOYAMA END

		-- 処理区分別処理（繰越レコードの為、更新し処理終了）
		IF Z_SYORIKBN = '9' THEN

			-- 処理区分
			SyoriKbn := 5;

			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_FZANDAKA	= FZANDAKA,
				QPB3_KASHITSUKE	= i_KASHITSUKE,
				QPB3_GANKIN	= i_GANKIN,
				QPB3_KJRISOKU	= i_KJRISOKU,
				QPB3_ZANDAKA	= i_ZANDAKA,
				QPB3_MGANKINK	= i_MGANKINK,
				QPB3_KJRISOKUK	= i_KJRISOKUK,
				QPB3_MGANKINS	= i_MGANKINS,
				QPB3_KJRISOKUS	= i_KJRISOKUS,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
--			WHERE	ROWID = Z_CurID;
			WHERE CURRENT OF CurZndkrrk2;

			-- 明細レコードに繰越レコードが存在した場合の処理フラグ
			MeiKurFLG := 1;

			EXIT;                                     --ループ終了
		END IF;

		-- 残高計算
--		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN + Z_MGANKINK + Z_MGANKINS;
		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN;

		-- 集計（貸付、入金、控除、分解戻し、分解金額）
		i_KASHITSUKE	:= i_KASHITSUKE  + Z_KASHITSUKE;
--		i_GANKIN	:= i_GANKIN      + Z_GANKIN   - Z_MGANKINK  - Z_MGANKINS;
		i_GANKIN	:= i_GANKIN      + Z_GANKIN;
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU - Z_KJRISOKUK - Z_KJRISOKUS;
--MOD 20100319 0908047 NBC YOKOYAMA START
		--精算日以降の控除は精算金額と相殺している関係で、利息を計上しない
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		IF NOT(SeisanFLG = '1' AND (Z_SYORIKBN = '3' OR Z_SYORIKBN = '4')) THEN
			i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		END IF;
--MOD 20100319 0908047 NBC YOKOYAMA END
		i_MGANKINK	:= i_MGANKINK    + Z_MGANKINK;
		i_KJRISOKUK	:= i_KJRISOKUK   + Z_KJRISOKUK;
		i_MGANKINS	:= i_MGANKINS    + Z_MGANKINS;
		i_KJRISOKUS	:= i_KJRISOKUS   + Z_KJRISOKUS;

		-- 処理区分
		SyoriKbn := 3;

		-- レコード更新
		UPDATE QPB3_ZNDKRRK
		SET	QPB3_FZANDAKA	= ZANDAKA,
			QPB3_ZANDAKA	= i_ZANDAKA,
			QPB3_KUSNFLG	= '1',
			QPB3_KUSNYMD	= SYSDATE
--		WHERE ROWID = Z_CurID;
		WHERE CURRENT OF CurZndkrrk2;

		-- 処理区分
		SyoriKbn := 4;

		-- 残高更新（明細用）
		ZANDAKA := i_ZANDAKA;

	END LOOP;

	-- 動的カーソルのクローズ
	CLOSE CurZndkrrk2;

	-- 処理区分
	SyoriKbn := 6;

--MOD 20100319 0908047 NBC YOKOYAMA START
	-- 残高がマイナスの場合の処理（証書のみ対応）
--精算月のみ処理するように変更
--マイナスに加えてプラス(残高余り)の処理も追加
--	IF i_SYUBETU = '2' AND i_ZANDAKA < 0 THEN
	IF i_SYUBETU = '2' AND i_ZANDAKA <> 0 AND SeisanFLG = '1' THEN
--MOD 20100319 0908047 NBC YOKOYAMA END

		-- 処理区分
		SyoriKbn := 7;

		-- 元金初期化
		X_GANKIN := 0;

		BEGIN

			-- 精算レコード取得
			SELECT	ROWID,
				NVL(QPB3_GANKIN, 0)
			INTO	X_CurID,
				X_GANKIN
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '7'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  w_toDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- 動的カーソルのクローズ
					CLOSE CurZndkrrk2;
				END IF;

				-- 戻り値設定
				o_ret	:= 99;

				-- ロールバック
				ROLLBACK;

				-- ログ出力ＥＮＤ
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* エラー発生 */
				RAISE;

		END;

--ADD 20100319 0908047 NBC YOKOYAMA START
		-- 元金初期化
		X_GANKIN2 := 0;
		SyoriKbn := 77;
		BEGIN

			-- 証書入金Tからレコード取得
			SELECT	ROWID,
				NVL(QPA9_NYUKINGAKU, 0)
			INTO	X_CurID2,
				X_GANKIN2
			FROM	QPA9_SYNNYUKINT
			WHERE	NVL(QPA9_PRMSYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPA9_PRMSYAINCD2 =  i_SYAINCD2
			AND	QPA9_PRMYUSIYMD  =  i_YUSIYMD;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'QPA9 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- 動的カーソルのクローズ
					CLOSE CurZndkrrk2;
				END IF;

				-- 戻り値設定
				o_ret	:= 99;

				-- ロールバック
				ROLLBACK;

				-- ログ出力ＥＮＤ
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* エラー発生 */
				RAISE;

		END;
--ADD 20100319 0908047 NBC YOKOYAMA END

		-- 処理区分
		SyoriKbn := 8;

		-- 精算レコードが存在しない場合
--		IF SQL%ROWCOUNT = 0 THEN
		IF SQL%ROWCOUNT != 0 THEN

			-- 処理区分
			SyoriKbn := 9;

--MOD 20100319 0908047 NBC YOKOYAMA START
			-- 元金にマイナス残高を加える
			-- プラス(余り)の残高でも加える
--MOD 20100319 0908047 NBC YOKOYAMA END
			X_GANKIN := X_GANKIN + i_ZANDAKA;

			-- 精算レコード更新
			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_GANKIN	= X_GANKIN,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
			WHERE	ROWID = X_CurID;

--ADD 20100319 0908047 NBC YOKOYAMA START
			--元となったQPA9も更新
			X_GANKIN2 := X_GANKIN2 + i_ZANDAKA;

			UPDATE QPA9_SYNNYUKINT
			SET QPA9_NYUKINGAKU = X_GANKIN2
			WHERE	ROWID = X_CurID2;
--ADD 20100319 0908047 NBC YOKOYAMA END

			-- 処理区分
			SyoriKbn := 10;

			-- 戻り値設定
			o_ret	:= 1;

--			RAISE NO_DATA_EXCEPTION2;
		END IF;


	END IF;

	-- 処理区分
	SyoriKbn := 11;

	-- 繰越レコード登録
	IF MeiKurFLG = 0 THEN

		-- 処理区分
		SyoriKbn := 12;

		IF ABS(FZANDAKA) + ABS(i_KASHITSUKE) + ABS(i_GANKIN) + ABS(i_KJRISOKU) + ABS(i_ZANDAKA) + ABS(i_MGANKINK) + ABS(i_KJRISOKUK) + ABS(i_MGANKINS) + ABS(i_KJRISOKUS) <> 0 THEN

			-- 明細レコードに繰越レコードが存在しない場合、追加処理
			-- 存在した場合は、ロープ内で更新処理を行っている
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_YUSIYMD,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_FZANDAKA,
				QPB3_KASHITSUKE,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_ZANDAKA,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		QPB3_KUSNYMD
				QPB3_KUSNYMD,
				QPB3_TOZAIKBN,
				QPB3_SYOZOKUCD,
				QPB3_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			) VALUES (
				NVL(i_SYAINCD1, ' '),
				i_SYAINCD2,
				i_SYUBETU,
				i_YUSIYMD,
				SyoriDate,
				'9',
				FZANDAKA,
				i_KASHITSUKE,
				i_GANKIN,
				i_KJRISOKU,
				i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS,
				'1',
				SYSDATE,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		SYSDATE
				SYSDATE,
				i_TOZAIKBN,
				i_SYOZOKUCD,
				i_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			);
		END IF;

	END IF;

	-- 処理区分
	SyoriKbn := 13;

--ADD 20100319 0908047 NBC YOKOYAMA START
--控除日以降の精算で控除データがない場合、精算金額が控除利息分足りなくなる。(残高は上で調整済み)
--控除利息を計算して、QPB3とQPB5に加える

    /**************/
	/*    給与    */
    /**************/
	IF     SeisanFLG = '1' 
	   AND KyuyoFLG = '0' 
	   AND TO_CHAR(SeisanDate,'DD') >= '25' 
	   AND TO_CHAR(SeisanDate,'YYYYMM') <> TO_CHAR(i_YUSIYMD,'YYYYMM') 
	   AND i_cnt = '1' THEN	--2周目はやらない
		--台帳から給与残高と利率を取得
		SELECT QPB6_RIRITU,QPB6_KYUYOZANDAKA
		INTO   v_RIRITU   ,v_KYUYOZANDAKA
		FROM   QPB6_SYNDAICYOW2T
		WHERE  NVL(QPB6_PRMSYAINCD1, ' ') = NVL(i_SYAINCD1, ' ')
		AND    QPB6_PRMSYAINCD2           = i_SYAINCD2
		AND    QPB6_PRMYUSIYMD            = i_YUSIYMD;
		
		--利息計算From
		KyuyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(w_fromDate,'YYYYMM') || '26'),-1);	--処理月前月26日
		--初回控除だったら調整
		IF TO_CHAR(i_YUSIYMD,'YYYYMM') = TO_CHAR(KyuyoFrom,'YYYYMM') THEN
			KyuyoFrom := i_YUSIYMD;
		END IF;
		
		--利息計算To
		KyuyoTo   := TO_DATE(TO_CHAR(w_fromDate,'YYYYMM') || '25');					--処理月当月25日

		--利息計算
		v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;
		v_Kikan   := KyuyoTo - KyuyoFrom + 1;
		v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU2 * v_Kikan);

		--精算レコードと分解利息Tに利息を加える
		BEGIN

			-- 精算レコード取得
			SELECT	ROWID
			INTO	X_CurID
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '7'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  w_toDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- 動的カーソルのクローズ
					CLOSE CurZndkrrk2;
				END IF;

				-- 戻り値設定
				o_ret	:= 99;

				-- ロールバック
				ROLLBACK;

				-- ログ出力ＥＮＤ
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* エラー発生 */
				RAISE;

		END;

		-- 処理区分
		SyoriKbn := 14;

		IF SQL%ROWCOUNT != 0 THEN

			-- 精算レコード更新
			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_KJRISOKU	= QPB3_KJRISOKU + v_Risoku,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
			WHERE	ROWID = X_CurID;

			-- 処理区分
			SyoriKbn := 15;

			-- 戻り値設定
			o_ret	:= 1;
		
		END IF;

		BEGIN

			-- 分解利息Tからレコード取得
			SELECT	ROWID
			INTO	X_CurID2
			FROM	QPB5_BUNKAIRSK
			WHERE	NVL(QPB5_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB5_SYAINCD2  =  i_SYAINCD2
			AND QPB5_SYUBETU   = '2'
			AND	QPB5_YUSIYMD   =  i_YUSIYMD
			AND QPB5_NYUKINYMD = SeisanDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'QPB5 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- 動的カーソルのクローズ
					CLOSE CurZndkrrk2;
				END IF;

				-- 戻り値設定
				o_ret	:= 99;

				-- ロールバック
				ROLLBACK;

				-- ログ出力ＥＮＤ
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* エラー発生 */
				RAISE;

		END;

		-- 処理区分
		SyoriKbn := 16;

		IF SQL%ROWCOUNT != 0 THEN

			--元となったQPB5も更新
			UPDATE QPB5_BUNKAIRSK
			SET QPB5_RISOKU = QPB5_RISOKU + v_Risoku
			WHERE	ROWID = X_CurID2;

			-- 処理区分
			SyoriKbn := 17;

			-- 戻り値設定
			o_ret	:= 1;

		END IF;

	END IF;

    /**************/
	/*    賞与    */
    /**************/
    --精算日「06/15～06/30」かつ06月精算かつ賞与控除がないかつ融資月に完済ではない
    --精算日「12/01～12/31」かつ12月精算かつ賞与控除がないかつ融資月に完済ではない
	IF     SeisanFLG = '1' 
	   AND SyoyoFLG = '0' 
	   AND TO_CHAR(SeisanDate,'YYYYMM') <> TO_CHAR(i_YUSIYMD,'YYYYMM')
	   AND (TO_CHAR(SeisanDate,'MMDD') BETWEEN '0615' AND '0630' OR 
	        TO_CHAR(SeisanDate,'MMDD') BETWEEN '1201' AND '1231') 
	   AND i_cnt = '1' THEN	--2周目はやらない
		--台帳から賞与残高と利率を取得
		SELECT QPB6_RIRITU,QPB6_SYOYOHENSAIALL,QPB6_SYOYOZANDAKA
		INTO   v_RIRITU   ,v_SYOYOHENSAIALL,v_SYOYOZANDAKA
		FROM   QPB6_SYNDAICYOW2T
		WHERE  NVL(QPB6_PRMSYAINCD1, ' ') = NVL(i_SYAINCD1, ' ')
		AND    QPB6_PRMSYAINCD2           = i_SYAINCD2
		AND    QPB6_PRMYUSIYMD            = i_YUSIYMD;
		
		--賞与残高０だったら何もしない
		IF v_SYOYOHENSAIALL <> 0 THEN
			--利息計算From
			IF TO_CHAR(SeisanDate,'MM') = '06' THEN
				SyoyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '02'),-6);	--精算前年の12/02
			ELSE
				SyoyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '16'),-6);	--精算年の06/16
			END IF;
			--融資日以前だったら融資日
			IF SyoyoFrom < i_YUSIYMD THEN
				SyoyoFrom := i_YUSIYMD;
			END IF;
			--融資日と同年同月だったら融資日
			-- ※6/1融資だと6/15控除はできていないため
			IF TO_CHAR(SyoyoFrom,'YYYYMM') = TO_CHAR(i_YUSIYMD,'YYYYMM') THEN
				SyoyoFrom := i_YUSIYMD;
			END IF;
			
			--利息計算To
			IF TO_CHAR(SeisanDate,'MM') = '06' THEN
				SyoyoTo := TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '15');	--精算年の06/15
			ELSE
				SyoyoTo := TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '01');	--精算年の12/01
			END IF;
	
			--利息計算
			v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;
			v_Kikan   := SyoyoTo - SyoyoFrom + 1;
			v_Risoku  := TRUNC(v_SYOYOZANDAKA * v_RIRITU2 * v_Kikan);
	
			--精算レコードと分解利息Tに利息を加える
			BEGIN
	
				-- 精算レコード取得
				SELECT	ROWID
				INTO	X_CurID
				FROM	QPB3_ZNDKRRK
				WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
				AND	QPB3_SYAINCD2 =  i_SYAINCD2
				AND	QPB3_SYUBETU  =  i_SYUBETU
				AND	QPB3_YUSIYMD  =  i_YUSIYMD
				AND	QPB3_SYORIKBN =  '7'
				AND	QPB3_SYORIYMD >= w_fromDate
				AND	QPB3_SYORIYMD <  w_toDate;
	
			EXCEPTION
	
				WHEN NO_DATA_FOUND THEN
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
						'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
						':SYAINCD2=' || i_SYAINCD2 ||
						':SYUBETU=' || i_SYUBETU ||
						':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
						);
	
				WHEN	OTHERS	THEN
					IF CurZndkrrk2%ISOPEN = TRUE THEN
						-- 動的カーソルのクローズ
						CLOSE CurZndkrrk2;
					END IF;
	
					-- 戻り値設定
					o_ret	:= 99;
	
					-- ロールバック
					ROLLBACK;
	
					-- ログ出力ＥＮＤ
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
						'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
	
					/* エラー発生 */
					RAISE;
	
			END;
	
			-- 処理区分
			SyoriKbn := 18;
	
			IF SQL%ROWCOUNT != 0 THEN
	
				-- 精算レコード更新
				UPDATE	QPB3_ZNDKRRK
				SET	QPB3_KJRISOKU	= QPB3_KJRISOKU + v_Risoku,
					QPB3_KUSNFLG	= '1',
					QPB3_KUSNYMD	= SYSDATE
				WHERE	ROWID = X_CurID;
	
				-- 処理区分
				SyoriKbn := 19;
	
				-- 戻り値設定
				o_ret	:= 1;
			
			END IF;
	
			BEGIN
	
				-- 分解利息Tからレコード取得
				SELECT	ROWID
				INTO	X_CurID2
				FROM	QPB5_BUNKAIRSK
				WHERE	NVL(QPB5_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
				AND	QPB5_SYAINCD2  =  i_SYAINCD2
				AND QPB5_SYUBETU   = '2'
				AND	QPB5_YUSIYMD   =  i_YUSIYMD
				AND QPB5_NYUKINYMD = SeisanDate;
	
			EXCEPTION
	
				WHEN NO_DATA_FOUND THEN
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
						'QPB5 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
						':SYAINCD2=' || i_SYAINCD2 ||
						':SYUBETU=' || i_SYUBETU ||
						':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
						);
	
				WHEN	OTHERS	THEN
					IF CurZndkrrk2%ISOPEN = TRUE THEN
						-- 動的カーソルのクローズ
						CLOSE CurZndkrrk2;
					END IF;
	
					-- 戻り値設定
					o_ret	:= 99;
	
					-- ロールバック
					ROLLBACK;
	
					-- ログ出力ＥＮＤ
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
						'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
	
					/* エラー発生 */
					RAISE;
	
			END;
	
			-- 処理区分
			SyoriKbn := 20;
	
			IF SQL%ROWCOUNT != 0 THEN
	
				--元となったQPB5も更新
				UPDATE QPB5_BUNKAIRSK
				SET QPB5_RISOKU = QPB5_RISOKU + v_Risoku
				WHERE	ROWID = X_CurID2;
	
				-- 処理区分
				SyoriKbn := 21;
	
				-- 戻り値設定
				o_ret	:= 1;
	
			END IF;
		END IF;
	END IF;


--5月or11月に完済した場合、次月に賞与控除分のみが残ってマイナス残となる
--賞与は5(11)月に精算金額として計上済みのため、捨てる

	IF SeisanFLG = '0' AND i_ZANDAKA < 0 THEN
		--賞与控除レコード削除
		DELETE FROM QPB3_ZNDKRRK
		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
		AND	QPB3_SYAINCD2 =  i_SYAINCD2
		AND	QPB3_SYUBETU  =  i_SYUBETU
		AND	QPB3_YUSIYMD  =  i_YUSIYMD
		AND	QPB3_SYORIKBN =  '4'
		AND	QPB3_SYORIYMD >= w_fromDate
		AND	QPB3_SYORIYMD <  w_toDate;

		--繰越レコード削除
		DELETE FROM QPB3_ZNDKRRK
		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
		AND	QPB3_SYAINCD2 =  i_SYAINCD2
		AND	QPB3_SYUBETU  =  i_SYUBETU
		AND	QPB3_YUSIYMD  =  i_YUSIYMD
		AND	QPB3_SYORIKBN =  '9'
		AND	QPB3_SYORIYMD = SyoriDate;
		
	END IF;

	-- 処理区分
	SyoriKbn := 22;
--ADD 20100319 0908047 NBC YOKOYAMA END

EXCEPTION
--	WHEN	NO_DATA_EXCEPTION2 THEN
--		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
--			'精算レコード無し' ||
--			':SYAINCD1=' || i_SYAINCD1 ||
--			':SYAINCD2=' || i_SYAINCD2 ||
--			':SYUBETU='  || i_SYUBETU  ||
--			':YUSIYMD='  || i_YUSIYMD
--			);

	WHEN	OTHERS	THEN
	IF CurZndkrrk2%ISOPEN = TRUE THEN
		-- 動的カーソルのクローズ
		CLOSE CurZndkrrk2;
	END IF;

	-- 戻り値設定
	o_ret	:= 99;

	-- ロールバック
	ROLLBACK;

	-- ログ出力ＥＮＤ
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* エラー発生 */
	RAISE;

END QPAP_ZNDKKUSNSUB2;

END QPAP_CEnt1560PkG;
/
SHOW ERR
