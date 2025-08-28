CREATE OR REPLACE PACKAGE  QPAP_CEnt1550PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_CEnt1550PkG                                          */
/* 機能          ：残高履歴テーブル登録処理（融資・入金）                    */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：NBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100330  TR1003-014       新規融資の特別ローンが新残高表に載らない                                            */
/*                               社員融資台帳から種別２以外も取得するように修正する                               */
/******************************************************************************************************************/

/* 残高履歴テーブル登録処理（融資・入金） */
PROCEDURE QPAP_ZNDK_YSNKTURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR);	--ジョブＩＤ

END QPAP_CEnt1550PkG;
/
SHOW ERROR

/*****************************************************************************/
/* ２  ボディー                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1550PkG IS


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1550PkG.QPAP_ZNDK_YSNKTURK                       */
/* 機能          ：残高履歴テーブル登録処理（融資・入金）                    */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_YSNKTURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR	--ジョブＩＤ
)

IS

	-- 処理変数定義
	w_fromDate	DATE;				-- データ取得期間：開始
	w_toDate	DATE;				-- データ取得期間：終了
	InsCount	NUMBER		:= 0;		-- 登録件数（事前取得用）
	module		VARCHAR2(40)	:= 'QPAP_CEnt1550PkG.QPAP_ZNDK_YSNKTURK';
	SyoriKbn	NUMBER		:= 0;		-- 処理実行箇所カウント

BEGIN

	-- コンソールログ出力（処理開始）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');


	-- 処理日付、期間取得（処理月-1ヶ月 ～ 処理月）
--	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD');
--	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01' || '000000', 'YYYYMMDDHH24MISS');
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- 証書貸付（QPA8_SynDaicyoT）から件数取得
	SELECT COUNT(*)
		INTO  InsCount
		FROM  QPA8_SynDaicyoT
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--		WHERE QPA8_SYUBETU = '2'
--		AND   QPA8_PRMYUSIYMD >= w_fromDate
--		AND   QPA8_PRMYUSIYMD <  w_toDate
--		AND   QPA8_KANSAIYMD IS NULL;
		WHERE QPA8_PRMYUSIYMD >= w_fromDate
		AND   QPA8_PRMYUSIYMD <  w_toDate;
--MOD 20100330 TR1003-014 NBC YOKOYAMA END

	-- コンソールログ出力（取得件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA8_SynDaicyoT:IN = ' || TO_CHAR(InsCount)
		);

	SyoriKbn :=	1;

	-- 残高履歴テーブル（QPB3_ZNDKRRK）に追加
	INSERT INTO QPB3_ZNDKRRK (
		QPB3_SYAINCD1,
		QPB3_SYAINCD2,
		QPB3_SYUBETU,
		QPB3_YUSIYMD,
		QPB3_SYORIYMD,
		QPB3_SYORIKBN,
		QPB3_KASHITSUKE,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPA8_PRMSYAINCD1,
			QPA8_PRMSYAINCD2,
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--			QPA8_SYUBETU,
			'2',
--MOD 20100330 TR1003-014 NBC YOKOYAMA END
			QPA8_PRMYUSIYMD,
			QPA8_PRMYUSIYMD,
			'1',
			NVL(QPA8_KYUYOHENSAIALL, 0) + NVL(QPA8_SYOYOHENSAIALL, 0),
			'0',
			SYSDATE,
			SYSDATE
			FROM  QPA8_SynDaicyoT
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--			WHERE QPA8_SYUBETU = '2'
--			AND   QPA8_PRMYUSIYMD >= w_fromDate
--			AND   QPA8_PRMYUSIYMD <  w_toDate
--			AND   QPA8_KANSAIYMD IS NULL;
			WHERE QPA8_PRMYUSIYMD >= w_fromDate
			AND   QPA8_PRMYUSIYMD <  w_toDate;
--MOD 20100330 TR1003-014 NBC YOKOYAMA END

	-- コンソールログ出力（追加件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
		);

	SyoriKbn :=	2;

	-- 件数初期化
	InsCount :=	0;

	-- 証書入金（QPA9_SynNyukinT）から件数取得
	SELECT	COUNT(*)
		INTO  InsCount
		FROM  QPA9_SynNyukinT
		WHERE QPA9_NYUKINYMD >= w_fromDate
		AND   QPA9_NYUKINYMD <  w_toDate;

	-- コンソールログ出力（取得件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA9_SynNyukinT:IN = ' || TO_CHAR(InsCount)
	);

	SyoriKbn :=	3;

	-- 残高履歴テーブル（QPB3_ZNDKRRK）に追加
	INSERT INTO QPB3_ZNDKRRK (
		QPB3_SYAINCD1,
		QPB3_SYAINCD2,
		QPB3_SYUBETU,
		QPB3_YUSIYMD,
		QPB3_SYORIYMD,
		QPB3_SYORIKBN,
		QPB3_GANKIN,
		QPB3_KJRISOKU,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPA9_PRMSYAINCD1,
			QPA9_PRMSYAINCD2,
			'2',
			QPA9_PRMYUSIYMD,
			QPA9_NYUKINYMD,
			'7',
			NVL(QPA9_NYUKINGAKU, 0),
			NVL(QPB5_RISOKU, 0),
			'0',
			SYSDATE,
			SYSDATE
			FROM  QPA9_SynNyukinT,
			      QPB5_BUNKAIRSK
			WHERE QPA9_NYUKINYMD   >= w_fromDate
			AND   QPA9_NYUKINYMD   <  w_toDate
			AND   to_char(QPA9_NYUKINYMD, 'YYYYMMDD') = to_char(QPB5_NYUKINYMD, 'YYYYMMDD')
			AND   QPA9_PRMSYAINCD1 =  QPB5_SYAINCD1
			AND   QPA9_PRMSYAINCD2 =  QPB5_SYAINCD2
			AND   QPA9_PRMYUSIYMD  =  QPB5_YUSIYMD
			AND   QPB5_SYUBETU     = '2';

	-- コンソールログ出力（追加件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
	'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
	);

	SyoriKbn :=	4;

	-- コミット
	commit;

	-- コンソールログ出力（処理終了）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'End');


EXCEPTION
	WHEN	OTHERS	THEN
		-- ロールバック
		ROLLBACK;

		-- ログ出力ＥＮＤ
		QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'E',
			'SYORIKUBUN:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

		/* エラー発生 */
		RAISE;
		
END QPAP_ZNDK_YSNKTURK;

END QPAP_CEnt1550PkG;
/
SHOW ERROR
