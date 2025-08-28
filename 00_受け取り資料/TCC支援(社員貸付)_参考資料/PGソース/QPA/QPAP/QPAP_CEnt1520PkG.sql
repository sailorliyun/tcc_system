CREATE OR REPLACE PACKAGE  QPAP_CEnt1520PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_CEnt1520PkG                                          */
/* 機能          ：残高履歴テーブル登録処理（給与控除）                      */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：NBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100330  TR1003-017       残高履歴Tへの控除登録条件不備                                                       */
/*                               取得SQLを修正する                                                                */
/******************************************************************************************************************/

/* 残高履歴テーブル登録処理（給与控除） */
PROCEDURE QPAP_ZNDK_KYKJTURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR);	--ジョブＩＤ

END QPAP_CEnt1520PkG;
/
SHOW ERROR

/*****************************************************************************/
/* ２  ボディー                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1520PkG IS


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1520PkG.QPAP_ZNDK_YSNKTURK                       */
/* 機能          ：残高履歴テーブル登録処理（給与控除）                      */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_KYKJTURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR	--ジョブＩＤ
)

IS

	-- 処理変数定義
	InsCount	NUMBER		:= 0;		-- 登録件数（事前取得用）
	module		VARCHAR2(40)	:= 'QPAP_CEnt1520PkG.QPAP_ZNDK_KYKJTURK';
	SyoriKbn	NUMBER		:= 0;		-- 処理実行箇所カウント

BEGIN

	-- コンソールログ出力（処理開始）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- 給与控除（QPAA_KOJOT）から件数取得
--MOD 20100330 TR1001-017 NBC YOKOYAMA START
--	SELECT COUNT(*)
--		INTO  InsCount
--	FROM	QPAA_KOJOT,
--		QPAC_SYAINM
--	WHERE	QPAC_PRMSYAINCD1  =  QPAA_SYAINCD1
--	AND	QPAC_PRMSYAINCD2  =  QPAA_SYAINCD2
--	AND	QPAA_YUSIKBN      =  '3'
--	AND	(QPAC_PRMSYAINCD1 =  ' '
--	OR	QPAC_PRMSYAINCD1  =  '  '
--	OR	QPAC_PRMSYAINCD1  =  '   '
--	OR	RTRIM(QPAC_PRMSYAINCD1)  =  '')
--	AND	QPAC_MISECD  <>  '084'
--	AND	QPAC_MISECD  <>  '067';
	SELECT COUNT(*)
		INTO  InsCount
	FROM	QPAA_KOJOT
	WHERE	QPAA_YUSIKBN = '3';		--給与
--MOD 20100330 TR1001-017 NBC YOKOYAMA END

	-- コンソールログ出力（取得件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPAA_KOJOT:IN = ' || TO_CHAR(InsCount)
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
		QPB3_GANKIN,
		QPB3_KJRISOKU,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPAA_SYAINCD1,
			QPAA_SYAINCD2,
			QPAA_Syubetu,
			QPAA_YusiYMD,
			QPAA_KOJOYMD,
			QPAA_YusiKBN,
			NVL(QPAA_Gankin, 0),
			NVL(QPAA_Risoku, 0),
			'0',
			SYSDATE,
			SYSDATE
--MOD 20100330 TR1001-017 NBC YOKOYAMA START
--		FROM	QPAA_KOJOT,
--			QPAC_SYAINM
--		WHERE	QPAC_PRMSYAINCD1  =  QPAA_SYAINCD1
--		AND	QPAC_PRMSYAINCD2  =  QPAA_SYAINCD2
--		AND	QPAA_YUSIKBN      =  '3'
--		AND	(QPAC_PRMSYAINCD1 =  ' '
--		OR	QPAC_PRMSYAINCD1  =  '  '
--		OR	QPAC_PRMSYAINCD1  =  '   '
--		OR	RTRIM(QPAC_PRMSYAINCD1)  =  '')
--		AND	QPAC_MISECD  <>  '084'
--		AND	QPAC_MISECD  <>  '067';
		FROM	QPAA_KOJOT
		WHERE	QPAA_YUSIKBN = '3';		--給与
--MOD 20100330 TR1001-017 NBC YOKOYAMA END

	-- コンソールログ出力（追加件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
		);

	SyoriKbn :=	2;

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
		
END QPAP_ZNDK_KYKJTURK;

END QPAP_CEnt1520PkG;
/
SHOW ERROR
