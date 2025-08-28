CREATE OR REPLACE PACKAGE  QPAP_CEnt1540PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_CEnt1540PkG                                          */
/* 機能          ：残高履歴テーブル登録処理（貸付・分解）                    */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：NBC saitoh                                                */
/*****************************************************************************/

/* 残高履歴テーブル登録処理（分解） */
PROCEDURE QPAP_ZNDK_BNKITURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR);	--ジョブＩＤ

END QPAP_CEnt1540PkG;
/
SHOW ERROR

/*****************************************************************************/
/* ２  ボディー                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1540PkG IS

--- カーソル定義（社員コード１、社員コード２、融資区分、融資日等を取得）
	CURSOR CurBNKI IS
		SELECT
			ROWID		BNKIROW,
			QPB2_SYAINCD1	SYAINCD1,
			QPB2_SYAINCD2	SYAINCD2,
			QPB2_SYUBETU	SYUBETU,
			QPB2_YUSIYMD	YUSIYMD,
			QPB2_YUSIKBN	YUSIKBN,
			QPB2_KOJOYMD	KOJOYMD,
			QPB2_BUNMODFLG	BUNMODFLG,
			QPB2_BUNKAIYMD	BUNKAIYMD,
			QPB2_GANKIN	GANKIN,
			QPB2_RISOKU	RISOKU,
			QPB2_KOUSINYMD	KOUSINYMD
		FROM	QPB2_BUNKAI
		WHERE	QPB2_RRKFLG = '0';


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1540PkG.QPAP_ZNDK_BNKITURK                       */
/* 機能          ：残高履歴テーブル登録処理（分解）                          */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_BNKITURK (
				InChaNetID	IN	CHAR,	--ネットＩＤ
				InChaJobID	IN	CHAR	--ジョブＩＤ
)

IS

	-- 処理変数定義
	module		VARCHAR2(40)	:= 'QPAP_CEnt1540PkG.QPAP_ZNDK_BNKITURK';
	RowBNKI		CurBNKI%ROWTYPE;		-- カーソル
	SyoriKbn	NUMBER		:= 0;		-- 処理実行箇所カウント
	TurkCNT		NUMBER		:= 0;		-- 残高履歴テーブル登録件数
	InsCount	NUMBER		:= 0;		-- 登録件数（事前取得用）
	Pg_Flg		NUMBER		:= 0;		-- 登録有無フラグ

	i_BNKIROW	ROWID;				-- ROWID
	i_SYAINCD1	CHAR(1);			-- 社員コード１
	i_SYAINCD2	CHAR(7);			-- 社員コード２
	i_SYUBETU	CHAR(1);			-- ローン種別
	i_YUSIYMD	DATE;				-- 融資日
	i_YUSIKBN	CHAR(1);			-- 融資区分（給与・賞与）
	i_KOJOYMD	DATE;				-- 控除日
	i_BUNMODFLG	CHAR(1);			-- 分解戻し・分解フラグ
	i_BUNKAIYMD	DATE;				-- 分解処理日
	i_GANKIN	NUMBER;				-- 元金
	i_RISOKU	NUMBER;				-- 利息
	i_KOUSINYMD	DATE;				-- 更新日時
	o_SYORIYMD	DATE;				-- 処理日
	o_SYORIKBN	CHAR(1);			-- 処理区分
	o_GANKIN	NUMBER;				-- 元金
	o_KJRISOKU	NUMBER;				-- 利息
	o_MKOJOYMD	DATE;				-- 控除日
	o_MGANKINK	NUMBER;				-- 給与控除元金
	o_KJRISOKUK	NUMBER;				-- 給与控除利息
	o_MGANKINS	NUMBER;				-- 賞与控除元金
	o_KJRISOKUS	NUMBER;				-- 賞与控除利息


BEGIN

	-- コンソールログ出力（処理開始）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- 分解・分解戻しテーブル（QPB2_BUNKAI）から登録可能件数取得
	SELECT COUNT(*)
		INTO  InsCount
		FROM  QPB2_BUNKAI
		WHERE QPB2_RRKFLG = '0';

	-- コンソールログ出力（取得件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB2_BUNKAI:IN = ' || TO_CHAR(InsCount)
		);

	-- 処理区分
	SyoriKbn :=	1;

	-- 動的カーソルのオープン
	OPEN CurBNKI();

	LOOP
		Pg_Flg		:=	0;				-- 登録有無フラグ初期化

		FETCH CurBNKI INTO RowBNKI;
		IF CurBNKI%NOTFOUND THEN
			EXIT;                                     --ループ終了
		END IF;

		-- 分解・分解戻しテーブルからデータ取得
		i_BNKIROW	:= RowBNKI.BNKIROW;
		i_SYAINCD1	:= RowBNKI.SYAINCD1;
		i_SYAINCD2	:= RowBNKI.SYAINCD2;
		i_SYUBETU	:= RowBNKI.SYUBETU;
		i_YUSIYMD	:= RowBNKI.YUSIYMD;
		i_YUSIKBN	:= RowBNKI.YUSIKBN;
		i_KOJOYMD	:= TO_DATE(TO_CHAR(RowBNKI.KOJOYMD, 'YYYYMMDD'), 'YYYYMMDD');
		i_BUNMODFLG	:= RowBNKI.BUNMODFLG;
		i_BUNKAIYMD	:= RowBNKI.BUNKAIYMD;
		i_GANKIN	:= NVL(RowBNKI.GANKIN, 0);
		i_RISOKU	:= NVL(RowBNKI.RISOKU, 0);
		i_KOUSINYMD	:= TO_DATE(TO_CHAR(RowBNKI.KOUSINYMD, 'YYYYMMDD'), 'YYYYMMDD');

		-- 処理区分
		SyoriKbn :=	2;

		-- 初期化
		o_GANKIN	:= 0;
		o_KJRISOKU	:= 0;
		o_MGANKINK	:= 0;
		o_KJRISOKUK	:= 0;
		o_MGANKINS	:= 0;
		o_KJRISOKUS	:= 0;

		-- 取得データから履歴テーブルの所定項目に代入

		o_MKOJOYMD		:=	i_KOJOYMD;			-- 控除日設定
		o_GANKIN		:=	i_GANKIN;			-- 元金設定
		o_KJRISOKU		:=	i_RISOKU;			-- 利息設定
		o_SYORIYMD		:=	i_KOJOYMD;			-- 処理日

		IF i_YUSIKBN = '3' THEN						-- 給与の場合

			o_MGANKINK	:=	i_GANKIN;			-- 給与元金に元金を設定
			o_KJRISOKUK	:=	i_RISOKU;			-- 給与利息に利息を設定

		ELSIF i_YUSIKBN = '4' THEN

			o_MGANKINS	:=	i_GANKIN;			-- 賞与元金に元金設定
			o_KJRISOKUS	:=	i_RISOKU;			-- 賞与利息に利息設定

		ELSE								-- 賞与の場合

			Pg_Flg		:=	1;				-- 対象外で登録しない

		END IF;

		IF i_BUNMODFLG = '0' THEN					-- 分解戻しの場合

			o_GANKIN	:=	o_GANKIN   * -1;		-- 分解戻しの為マイナス金額にする（元金）
			o_KJRISOKU	:=	o_KJRISOKU * -1;		-- 分解戻しの為マイナス金額にする（利息）
			IF i_KOUSINYMD > i_KOJOYMD THEN
				o_SYORIYMD	:=	i_KOUSINYMD;		-- 処理日
			END IF;
			o_SYORIKBN	:=	'5';				-- 処理区分（分解戻し）

		ELSIF i_BUNMODFLG = '1' THEN

			IF i_BUNKAIYMD > i_KOJOYMD THEN
				o_SYORIYMD	:=	i_BUNKAIYMD;		-- 処理日
			END IF;

			o_SYORIKBN	:=	'6';				-- 処理区分（振込）
			o_MGANKINK	:=	o_MGANKINK  * -1;		-- 分解の為マイナス金額にする（給与元金）
			o_KJRISOKUK	:=	o_KJRISOKUK * -1;		-- 分解の為マイナス金額にする（給与利息）
			o_MGANKINS	:=	o_MGANKINS  * -1;		-- 分解の為マイナス金額にする（賞与元金）
			o_KJRISOKUS	:=	o_KJRISOKUS * -1;		-- 分解の為マイナス金額にする（賞与利息）

		ELSE

			Pg_Flg		:=	1;				-- 対象外で登録しない

		END IF;

		IF Pg_Flg = 0 THEN

			-- 処理区分
			SyoriKbn :=	3;

			-- 残高履歴テーブル登録処理
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_YUSIYMD,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_MKOJOYMD,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
				QPB3_KUSNYMD
			) VALUES (
				i_SYAINCD1,
				i_SYAINCD2,
				i_SYUBETU,
				i_YUSIYMD,
				o_SYORIYMD,
				o_SYORIKBN,
				o_GANKIN,
				o_KJRISOKU,
				o_MKOJOYMD,
				o_MGANKINK,
				o_KJRISOKUK,
				o_MGANKINS,
				o_KJRISOKUS,
				'0',
				SYSDATE,
				SYSDATE
			);

			-- 処理区分
			SyoriKbn :=	4;

			-- 分解・分解戻しテーブル更新（残高履歴T登録、更新日時）
			UPDATE QPB2_BUNKAI
			SET	QPB2_RRKFLG	= '1',
				QPB2_KOUSINYMD	= SYSDATE
			WHERE ROWID = i_BNKIROW;

			-- 登録件数カウントアップ
			TurkCNT	:=	TurkCNT + 1;

		END IF;

	END LOOP;

	-- 動的カーソルのクローズ
	CLOSE CurBNKI;

	-- 処理区分
	SyoriKbn :=	5;

	-- コンソールログ出力（追加件数）
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(TurkCNT)
		);

	-- 処理区分
	SyoriKbn :=	6;

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
		
END QPAP_ZNDK_BNKITURK;

END QPAP_CEnt1540PkG;
/
SHOW ERROR
