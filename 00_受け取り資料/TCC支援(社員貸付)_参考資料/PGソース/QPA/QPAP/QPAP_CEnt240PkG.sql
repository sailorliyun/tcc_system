CREATE OR REPLACE PACKAGE  QPAP_CEnt240PkG IS
/*****************************************************************************/
/* システム名　　：高島屋クレジットシステム                                  */
/* 業務名　　　　：社員貸付システム　　                                      */
/* モジュール名　：QPAP_CEnt240PkG                                           */
/* 機能      　　：残高情報の更新                                            */
/* 作成日        ：2001/10/03                                                */
/* 作成者        ：FIP                                                       */
/*****************************************************************************/
/* 修正日        ：2005/01/28                                                */
/* 作成者        ：FIP SEKINE                                                */
/* 修正内容      ：完済通知出力対応に伴い、給与・賞与引落しによる自動完済    */
/*                 した場合、完済日を設定するように修正                      */
/*                                                                           */
/* 修正日        ：2009/08/28                                                */
/* 作成者        ：NBC ISHIDA                                                */
/* 修正内容      ：控除データを控除履歴テーブルへ登録を行う                  */
/*                                                                           */
/*****************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100319  TR1003-010       証書控除中止時の新残高表金額違算                                                    */
/*                            ・QPAY_SYNDAICYOWTをQPB6_SYNDAICYOW2Tにバックアップする                             */
/******************************************************************************************************************/

/*****************************************************************************/
/*１　宣言部															     */
/*****************************************************************************/

/* 残高情報の更新 */
PROCEDURE QPAP_CEnt240ZanUpd (
	InStrKBN	IN	CHAR);		--給与賞与区分（1:給与,2:賞与）

END QPAP_CEnt240PkG;
/
show error

/*****************************************************************************/
/*２　ボディー															     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt240PkG IS

	/* カーソル定義 */
	CURSOR CurKoguchi IS
		SELECT	 QPA1_PRMSYAINCD1,
				 QPA1_PRMSYAINCD2,
				 QPA1_KYUYOZANDAKA,
				 QPA1_KOJOCYUSHIFLG
		FROM	 QPA1_KGCDAICYOT
		ORDER BY QPA1_PRMSYAINCD1,
				 QPA1_PRMSYAINCD2
		FOR UPDATE;

	CURSOR CurShousho IS
		SELECT	 QPA8_PRMSYAINCD1,
				 QPA8_PRMSYAINCD2,
				 QPA8_PRMYUSIYMD,
				 QPA8_KYUYOZANDAKA,
				 QPA8_SYOYOZANDAKA,
				 QPA8_KANSAIYMD
		FROM	 QPA8_SYNDAICYOT
		WHERE	 QPA8_KYUYOZANDAKA > 0
		OR		 QPA8_SYOYOZANDAKA > 0
		ORDER BY QPA8_PRMSYAINCD1,
				 QPA8_PRMSYAINCD2,
				 QPA8_PRMYUSIYMD
		FOR UPDATE;

	CURSOR CurShousho2 IS
	SELECT 
	 QPA8_PRMSYAINCD1       
	,QPA8_PRMSYAINCD2       
	,QPA8_PRMYUSIYMD        
	,QPA8_GENDOGAKU         
	,QPA8_SYUBETU           
	,QPA8_RIRITU            
	,QPA8_HENSAITUKISU      
	,QPA8_KYUYOHENSAIALL    
	,QPA8_KYUYOHENSAI       
	,QPA8_SYOYOHENSAIALL    
	,QPA8_SYOYOHENSAI       
	,QPA8_KYUYOZANDAKA      
	,QPA8_SYOYOZANDAKA      
	,QPA8_KOJOCYUSIFLG      
	,QPA8_KANSAIYMD         
	FROM	 QPA8_SYNDAICYOT
		WHERE	 QPA8_KYUYOZANDAKA > 0
		OR		 QPA8_SYOYOZANDAKA > 0;



/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt240ZanUpd									     */
/* 機能          ：残高情報の更新										     */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt240ZanUpd (
	InStrKBN	IN	CHAR) IS	--給与賞与区分（1:給与,2:賞与）

	/* 固有変数 */
	v_SysTime		DATE;
	v_SysDate		CHAR(8);
	v_ZenYMD		CHAR(8);
	v_ZenZenYMD		CHAR(8);
	v_Count			NUMBER;
	v_SyainCD1		CHAR(1);
	v_SyainCD2		CHAR(7);
	v_YusiYMD		CHAR(8);
	v_KyuyoZan		NUMBER;
	v_SyoyoZan		NUMBER;
	v_StopFLG		CHAR(1);
	v_KansaiYMD		CHAR(8);
	v_Kingaku		NUMBER := 0;

	/* 行変数 */
	RowKgc			CurKoguchi%ROWTYPE;
	RowSho			CurShousho%ROWTYPE;
	RowSho2			CurShousho2%ROWTYPE;

	v_ZenYMD_N		CHAR(8);                 -- 11/01 ADD
	v_ZenZenYMD_N	CHAR(8);                 -- 11/01 ADD

	--2005/01/28 ADD
	datQPAA_KOJOYMD		DATE;		--控除日（完済日に使用）

	/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA START*/
	strYusiKBN		CHAR(1);
	/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA END*/


BEGIN

--ADD 20100319 0908047 NBC YOKOYAMA START
	/**************************************************************************/
	/* QPAY_SYNDAICYOWTをQPB6_SYNDAICYOW2Tにバックアップする                  */
	/*   新貸付金残高表で精算日＞控除日かつ控除データがない場合に             */
	/*   残高から利息を計算し精算金額に加えるために使用する                   */
	/*   ※QPAYは残高更新で残高０になるため、1日の残高履歴更新処理で使えない  */
	/**************************************************************************/
	IF InStrKBN = '1' THEN
		DELETE FROM QPB6_SYNDAICYOW2T;
		INSERT INTO QPB6_SYNDAICYOW2T (SELECT * FROM QPAY_SYNDAICYOWT);
	END IF;
--ADD 20100319 0908047 NBC YOKOYAMA END

	/* サーバーＳＹＳＴＥＭ日付取得 */
	SELECT	SYSDATE INTO v_SysTime
	FROM DUAL;

	v_SysDate := TO_CHAR(v_SysTime,'YYYYMMDD');
--	v_SysDate := '20011130';

	/* 小口の残高更新対象日付の設定         */
	/* （前々回給与控除日～前回給与控除日） */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
		v_ZenYMD := SUBSTR(v_SysDate,1,6) || '25';
	ELSE
		v_ZenYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
	END IF;
	v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenYMD,'YYYYMMDD'),-1),'YYYYMMDD');

	/* 11/01 ADD 入金指定対象範囲変更に伴い追加 */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
		v_ZenYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');
	ELSE
		v_ZenYMD_N := TO_CHAR(TO_DATE(SUBSTR(v_SysDate,1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');
	END IF;
	v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenYMD_N,'YYYYMMDD'),-1),'YYYYMMDD');

	/******************/
	/* 小口           */
	/******************/
	/* 小口更新は給与時のみ行う */
	IF InStrKBN = '1' THEN
		--カーソルオープン
		OPEN CurKoguchi;

		--ＦＥＴＣＨ
		LOOP
			FETCH CurKoguchi INTO RowKgc;
			IF CurKoguchi%NOTFOUND THEN
				EXIT;
			END IF;

			v_SyainCD1 := NVL(RowKgc.QPA1_PRMSYAINCD1,' ');
			v_SyainCD2 := NVL(RowKgc.QPA1_PRMSYAINCD2,' ');
			v_KyuyoZan := NVL(RowKgc.QPA1_KYUYOZANDAKA,0);
			v_StopFLG := NVL(RowKgc.QPA1_KOJOCYUSHIFLG,'');

			/* 貸付 */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA6_KINGAKU) INTO v_Kingaku FROM QPA6_KGCKASITUKET
				WHERE QPA6_SYAINCD = v_SyainCD2
				AND ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
				AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenZenYMD))
				AND (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ')
				GROUP BY QPA6_SYAINCD;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* 残高に貸付金を加算する */
			v_KyuyoZan := v_KyuyoZan + NVL(v_Kingaku,0);

			/* 入金 */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA5_NYUKINGAKU) INTO v_Kingaku FROM QPA5_KGCNYUKINT
				WHERE QPA5_SYAINCD1 = v_SyainCD1
				AND QPA5_SYAINCD2 = v_SyainCD2
--				AND ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)			-- 11/01 UPD
--				AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenZenYMD))		-- 11/01 UPD
				AND ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)			-- 11/01 UPD
				AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenZenYMD_N))		-- 11/01 UPD
				GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* 残高に入金を減算する */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* 賞与控除 */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA4_KOJOGAKU) INTO v_Kingaku FROM QPA4_KGCKOJOT
				WHERE QPA4_SYAINCD1 = v_SyainCD1
				AND QPA4_SYAINCD2 = v_SyainCD2
				AND ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= v_ZenYMD)
				AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenZenYMD))
				GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* 残高に賞与控除金を減算する */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* 給与控除 */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
				WHERE QPAA_SYAINCD1 = v_SyainCD1
				AND QPAA_SYAINCD2 = v_SyainCD2
				AND QPAA_SYUBETU = '1'
				AND QPAA_YUSIKBN = '3'
				GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_SYUBETU,QPAA_YUSIKBN;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* 残高に給与控除金を減算する */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* 控除中止した社員が残金一括入金した際、		*/
			/* 利息分マイナスになるので、マイナス時はZEROにする 	*/
			IF v_StopFLG = '1' THEN
				IF v_KyuyoZan <= 0 THEN
					v_KyuyoZan := 0;
				END IF;
			END IF;

			/* 給与残高の更新（台帳） */
			UPDATE QPA1_KGCDAICYOT SET
				QPA1_KYUYOZANDAKA = NVL(v_KyuyoZan,0)
			WHERE CURRENT OF CurKoguchi;

			/* 残高履歴に追加 */
			INSERT INTO QPA3_KGCZANDAKAT (
				 QPA3_PRMSYAINCD1
				,QPA3_PRMSYAINCD2
				,QPA3_PRMYUSIKBN
				,QPA3_PRMZANDAKAYMD
				,QPA3_ZANDAKA)
			VALUES ( NVL(v_SyainCD1,' ')
				,NVL(v_SyainCD2,' ')
				,'3'
				,TO_DATE(v_ZenYMD,'YYYYMMDD')
				,NVL(v_KyuyoZan,0));

		END LOOP;
		/* カーソルのクローズ */
		CLOSE CurKoguchi;
	END IF;

	/******************/
	/* 証書           */
	/******************/
	--カーソルオープン
	OPEN CurShousho;

	--ＦＥＴＣＨ
	LOOP
		FETCH CurShousho INTO RowSho;
		IF CurShousho%NOTFOUND THEN
			EXIT;
		END IF;

		v_SyainCD1 := NVL(RowSho.QPA8_PRMSYAINCD1,' ');
		v_SyainCD2 := NVL(RowSho.QPA8_PRMSYAINCD2,' ');
		v_YusiYMD := TO_CHAR(RowSho.QPA8_PRMYUSIYMD,'YYYYMMDD');
		v_KyuyoZan := NVL(RowSho.QPA8_KYUYOZANDAKA,0);
		v_SyoyoZan := NVL(RowSho.QPA8_SYOYOZANDAKA,0);
		v_KansaiYMD := TO_CHAR(RowSho.QPA8_KANSAIYMD,'YYYYMMDD');

		/* 未完済 */
		IF (v_KansaiYMD IS NULL) OR (v_KansaiYMD ='') THEN
			IF InStrKBN = '1' THEN
				/* 給与 */
				v_Kingaku := 0;
				BEGIN
					SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
					WHERE QPAA_SYAINCD1 = v_SyainCD1
					AND QPAA_SYAINCD2 = v_SyainCD2
					AND TO_CHAR(QPAA_YUSIYMD,'YYYYMMDD') = v_YusiYMD
					AND QPAA_SYUBETU = '2'
					AND QPAA_YUSIKBN = '3'
					GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_YUSIYMD,QPAA_SYUBETU,QPAA_YUSIKBN;
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						v_Kingaku := 0;
				END;

				/* 残高に給与控除金を減算する */
				v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

--2005/01/28 UPD  完済日対応  ↓↓↓↓From↓↓↓↓
--				/* 給与残高の更新（台帳） */
--				UPDATE QPA8_SYNDAICYOT SET
--					QPA8_KYUYOZANDAKA = NVL(v_KyuyoZan,0)
--				WHERE CURRENT OF CurShousho;

				IF	v_KyuyoZan	=	0	AND
					v_SyoyoZan	=	0	THEN
					--給与残高 ＆ 賞与残高がゼロ（完済）
					/* 控除日を取得 */
					datQPAA_KOJOYMD		:=	NULL;
					BEGIN
						SELECT
							MAX(QPAA_KOJOYMD)
						INTO
							datQPAA_KOJOYMD
						FROM
							QPAA_KOJOT
						WHERE
								QPAA_SYAINCD1	=	v_SyainCD1
							AND	QPAA_SYAINCD2	=	v_SyainCD2
							AND	QPAA_YUSIYMD	=	TO_DATE(v_YusiYMD,'YYYYMMDD')
							AND	QPAA_SYUBETU	=	'2'
							AND	QPAA_YUSIKBN	=	'3'
						GROUP BY
							QPAA_SYAINCD1
						,	QPAA_SYAINCD2
						,	QPAA_YUSIYMD
						,	QPAA_SYUBETU
						,	QPAA_YUSIKBN
						;
					EXCEPTION
						WHEN NO_DATA_FOUND THEN
							datQPAA_KOJOYMD		:=	NULL;
					END;

					/* 給与残高の更新（台帳） */
					IF	datQPAA_KOJOYMD	IS NULL	THEN
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
						WHERE CURRENT OF CurShousho;
					ELSE
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
						,	QPA8_KANSAIYMD		=	datQPAA_KOJOYMD
						WHERE CURRENT OF CurShousho;
					END IF;
				ELSE
					--給与残高 OR 賞与残高がある
					/* 給与残高の更新（台帳） */
					UPDATE QPA8_SYNDAICYOT SET
						QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
					WHERE CURRENT OF CurShousho;
				END IF;
--2005/01/28 UPD  完済日対応  ↑↑↑↑ To ↑↑↑↑

			ELSE
				/* 賞与 */
				v_Kingaku := 0;
				BEGIN
					SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
					WHERE QPAA_SYAINCD1 = v_SyainCD1
					AND QPAA_SYAINCD2 = v_SyainCD2
					AND TO_CHAR(QPAA_YUSIYMD,'YYYYMMDD') = v_YusiYMD
					AND QPAA_SYUBETU = '2'
					AND QPAA_YUSIKBN = '4'
					GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_YUSIYMD,QPAA_SYUBETU,QPAA_YUSIKBN;
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						v_Kingaku := 0;
				END;

				/* 残高に給与控除金を減算する */
				v_SyoyoZan := v_SyoyoZan - NVL(v_Kingaku,0);

--2005/01/28 UPD  完済日対応  ↓↓↓↓From↓↓↓↓
--				/* 賞与残高の更新（台帳） */
--				UPDATE QPA8_SYNDAICYOT SET
--					QPA8_SYOYOZANDAKA = NVL(v_SyoyoZan,0)
--				WHERE CURRENT OF CurShousho;

				IF	v_KyuyoZan	=	0	AND
					v_SyoyoZan	=	0	THEN
					--給与残高 ＆ 賞与残高がゼロ（完済）
					/* 控除日を取得 */
					datQPAA_KOJOYMD		:=	NULL;
					BEGIN
						SELECT
							MAX(QPAA_KOJOYMD)
						INTO
							datQPAA_KOJOYMD
						FROM
							QPAA_KOJOT
						WHERE
								QPAA_SYAINCD1	=	v_SyainCD1
							AND	QPAA_SYAINCD2	=	v_SyainCD2
							AND	QPAA_YUSIYMD	=	TO_DATE(v_YusiYMD,'YYYYMMDD')
							AND	QPAA_SYUBETU	=	'2'
							AND	QPAA_YUSIKBN	=	'3'
						GROUP BY
							QPAA_SYAINCD1
						,	QPAA_SYAINCD2
						,	QPAA_YUSIYMD
						,	QPAA_SYUBETU
						,	QPAA_YUSIKBN
						;
					EXCEPTION
						WHEN NO_DATA_FOUND THEN
							datQPAA_KOJOYMD		:=	NULL;
					END;

					/* 給与残高の更新（台帳） */
					IF	datQPAA_KOJOYMD	IS NULL	THEN
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
						WHERE CURRENT OF CurShousho;
					ELSE
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
						,	QPA8_KANSAIYMD		=	datQPAA_KOJOYMD
						WHERE CURRENT OF CurShousho;
					END IF;
				ELSE
					--給与残高 OR 賞与残高がある
					/* 賞与残高の更新（台帳） */
					UPDATE QPA8_SYNDAICYOT SET
						QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
					WHERE CURRENT OF CurShousho;
				END IF;
--2005/01/28 UPD  完済日対応  ↑↑↑↑ To ↑↑↑↑

			END IF;
		ELSE
			/* 完済済は、残高をZEROにする */
			IF (v_KyuyoZan > 0) OR (v_SyoyoZan > 0) THEN
				/* 給与残高、賞与残高の更新（台帳） */
				UPDATE QPA8_SYNDAICYOT SET
					QPA8_KYUYOZANDAKA = 0,
					QPA8_SYOYOZANDAKA = 0
				WHERE CURRENT OF CurShousho;
			END IF;
		END IF;
	END LOOP;
	/* カーソルのクローズ */
	CLOSE CurShousho;


	/******************************************************/
	/* 証書(給与の場合社員台帳を残高更新後バックアップする*/
	/* 賞与時の残高を反映すると運用で不具合が発生するため */
	/* 2002/01/27　　　　　　　　　　　　　　　　　　　　 */
	/******************************************************/
	IF InStrKBN = '1' THEN
		--カーソルオープン
		DELETE FROM    QPAY_SYNDAICYOWT;
 		OPEN CurShousho2;

		--ＦＥＴＣＨ
		LOOP
			FETCH CurShousho2 INTO RowSho2;
			IF CurShousho2%NOTFOUND THEN
				EXIT;
			END IF;

		        INSERT INTO QPAY_SYNDAICYOWT VALUES (
		           NVL(RowSho2.QPA8_PRMSYAINCD1   ,' ')
		          ,NVL(RowSho2.QPA8_PRMSYAINCD2   ,' ')
		          ,RowSho2.QPA8_PRMYUSIYMD
		          ,NVL(RowSho2.QPA8_GENDOGAKU     ,0)
		          ,NVL(RowSho2.QPA8_SYUBETU       ,' ')
		          ,NVL(RowSho2.QPA8_RIRITU        ,0)
		          ,NVL(RowSho2.QPA8_HENSAITUKISU  ,0)
		          ,NVL(RowSho2.QPA8_KYUYOHENSAIALL,0)
		          ,NVL(RowSho2.QPA8_KYUYOHENSAI   ,0)
		          ,NVL(RowSho2.QPA8_SYOYOHENSAIALL,0)
		          ,NVL(RowSho2.QPA8_SYOYOHENSAI   ,0)
		          ,NVL(RowSho2.QPA8_KYUYOZANDAKA  ,0)
		          ,NVL(RowSho2.QPA8_SYOYOZANDAKA  ,0)
		          ,NVL(RowSho2.QPA8_KOJOCYUSIFLG  ,' ')
		          ,RowSho2.QPA8_KANSAIYMD);
		END LOOP;
		CLOSE CurShousho2;
	END IF;
	/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA START*/
	/************************************************/
	/* 控除データを控除履歴テーブルへ登録           */
	/************************************************/

	/* 控除テーブルの抽出条件の値を取得*/
	IF InStrKBN = '1' THEN
		strYusiKBN := '3';
	ELSE
		strYusiKBN := '4';
	END IF;

	/*控除履歴テーブル登録*/
	INSERT INTO QPB0_KOJORRKT (
		 QPB0_KOJOYM
		,QPB0_KSKBN
		,QPB0_KOJOYMD
		,QPB0_SYAINCD1
		,QPB0_SYAINCD2
		,QPB0_SYUBETU
		,QPB0_TOZAIKBN
		,QPB0_YUSIYMD
		,QPB0_YUSIKBN
		,QPB0_KANGAKU
		,QPB0_GANKIN
		,QPB0_RISOKU
		,QPB0_ZANDAKA
		,QPB0_INSERTDATE
		,QPB0_UPDATEDATE
		)
	SELECT 
		 TO_CHAR(QPAA_KOJOYMD,'YYYYMM')
		,InStrKBN
		,QPAA_KOJOYMD
		,QPAA_SYAINCD1
		,QPAA_SYAINCD2
		,QPAA_SYUBETU
		,QPAA_TOZAIKBN
		,QPAA_YUSIYMD
		,QPAA_YUSIKBN
		,QPAA_KANGAKU
		,QPAA_GANKIN
		,QPAA_RISOKU
		,QPAA_ZANDAKA
		,v_SysTime
		,v_SysTime
	FROM QPAA_KOJOT
	WHERE QPAA_YUSIKBN = strYusiKBN;

	/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA END*/

	/******************************/
	/* 控除ファイル削除           */
	/******************************/
	IF InStrKBN = '1' THEN
		DELETE FROM QPAA_KOJOT WHERE QPAA_YUSIKBN = '3';
	ELSE
		DELETE FROM QPAA_KOJOT WHERE QPAA_YUSIKBN = '4';
	END IF;

	/************************************/
	/* 残高更新日ファイル更新           */
	/************************************/
	v_Count := 0;
	IF InStrKBN = '1' THEN
		SELECT COUNT(*) INTO v_Count FROM QPAT_ZANYMD
		WHERE QPAT_PRMKBN = '1';

		IF v_Count > 0 THEN
			UPDATE QPAT_ZANYMD SET
				 QPAT_YMD = TO_DATE(v_SysDate,'YYYYMMDD')
				,QPAT_HMS = v_SysTime
			WHERE QPAT_PRMKBN = '1';
		ELSE
			INSERT INTO QPAT_ZANYMD (
				QPAT_PRMKBN,
				QPAT_YMD,
				QPAT_HMS)
			VALUES ('1',
				TO_DATE(v_SysDate,'YYYYMMDD'),
				v_SysTime);
		END IF;
	ELSE
		SELECT COUNT(*) INTO v_Count FROM QPAT_ZANYMD
		WHERE QPAT_PRMKBN = '2';

		IF v_Count > 0 THEN
			UPDATE QPAT_ZANYMD SET
				 QPAT_YMD = TO_DATE(v_SysDate,'YYYYMMDD')
				,QPAT_HMS = v_SysTime
			WHERE QPAT_PRMKBN = '2';
		ELSE
			INSERT INTO QPAT_ZANYMD (
				QPAT_PRMKBN,
				QPAT_YMD,
				QPAT_HMS)
			VALUES ('2',
				TO_DATE(v_SysDate,'YYYYMMDD'),
				v_SysTime);
		END IF;
	END IF;

	/* コミット */
	COMMIT;
	--ROLLBACK;
EXCEPTION
	WHEN  OTHERS  THEN
		ROLLBACK;
		IF CurKoguchi%ISOPEN THEN
			CLOSE CurKoguchi;
		END IF;
		IF CurShousho%ISOPEN THEN
			CLOSE CurShousho;
		END IF;
		/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA START*/
		/* エラー発生時にカーソルをclosaしていないため追加 */
		IF CurShousho2%ISOPEN THEN
			CLOSE CurShousho2;
		END IF;
		/*ADD 0811051_グループ社員証書貸付帳票見直し NBC ISHIDA END*/
		RAISE ;
END QPAP_CEnt240ZanUpd;

END QPAP_CEnt240PkG;

/
SHOW ERROR
