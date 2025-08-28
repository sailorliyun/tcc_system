CREATE OR REPLACE PACKAGE  QPAP_CEnt300PkG IS
/*****************************************************************************/
/* システム名　　：高島屋クレジットシステム                                  */
/* 業務名　　　　：社員貸付システム                                          */
/* モジュール名　：QPAP_CEnt300PkG                                           */
/* 機能      　　：社員貸付・テーブル期日管理                                */
/* 作成日        ：2001/10/16                                                */
/* 作成者        ：FIP                                                       */
/*****************************************************************************/
/*****************************************************************************/
/*更新日付  案件/障害番号    修正理由                                        */
/*20100225  0908047          グループ社員証書貸付帳票見直し2次               */
/*                           分解利息テーブルの期日管理を行う                */
/*****************************************************************************/

/*****************************************************************************/
/*								１　宣言部								     */
/*****************************************************************************/

/* 小口融資台帳テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcDaicyoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 社員融資台帳テーブル期日管理 */
PROCEDURE	QPAP_Cent300SyainDaicyoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 小口融資入金テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcNyukinT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 社員融資入金テーブル期日管理 */
PROCEDURE	QPAP_Cent300SymNyukinT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 小口融資残高履歴テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcZandakaT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 小口融資貸付テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcKasitukeT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 小口融資賞与控除履歴テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcKojoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

/* 小口融資返済額履歴テーブル期日管理 */
PROCEDURE	QPAP_Cent300KgcHensaiT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス

--del 20080714 nbc ishida 利率期日管理廃止 start
--/* 小口融資利率履歴テーブル期日管理 */
--PROCEDURE	QPAP_Cent300KgcRirituT (
--	OtNumCount			OUT		NUMBER,								--処理件数
--	OtNumStatus			OUT		NUMBER);							--ステータス
--del 20080714 nbc ishida 利率期日管理廃止 end

--ADD 20100225 0908047 NBC SAWAME START
/* 分解利息テーブル期日管理 */
PROCEDURE	QPAP_Cent300BunkairskT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER);							--ステータス
--ADD 20100225 0908047 NBC SAWAME END

END QPAP_CEnt300PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								２　ボディー							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt300PkG IS


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcDaicyoT                                    */
/* 機能          ：小口融資台帳テーブルの期日管理                            */
/*                 退職後５年経った社員のデータを削除する                    */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcDaicyoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

	/* 処理固有の変数 */
	StrSyainCD			CHAR(7);

	/* カーソル定義 */
	/* 退職してから５年が経過した社員の社員コードを抽出 */
	CURSOR CurQPAC IS
		SELECT
			 QPAC_PRMSYAINCD2
		FROM
			QPAC_SYAINM
		WHERE
			TO_CHAR(QPAC_TAISYOKUYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* カーソルのオープン */
	IF CurQPAC%ISOPEN = FALSE THEN
		OPEN CurQPAC;
	END IF;

	LOOP

		FETCH CurQPAC						--順読み
		INTO  StrSyainCD;

		IF	CurQPAC%NOTFOUND THEN
			EXIT;							--ループ終了
		END IF;

		/* 取得した社員コードで小口融資台帳テーブルを検索し、*/
		/* 該当データを削除する*/
		DELETE QPA1_KGCDAICYOT
		 WHERE QPA1_PRMSYAINCD2 = StrSyainCD;

	END LOOP;

	/* 削除件数の取得 */
	OtNumCount := CurQPAC%ROWCOUNT;

	/* カーソルのクローズ */
	CLOSE CurQPAC;

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		IF CurQPAC%ISOPEN THEN
			CLOSE CurQPAC;
		END IF;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcDaicyoT;




/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300SyainDaicyoT                                  */
/* 機能          ：社員融資台帳テーブルの期日管理                            */
/*                 完済後５年経った社員のデータを削除する                    */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300SyainDaicyoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* 完済後５年経ったデータ件数 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA8_SYNDAICYOT
	 WHERE TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

	/* 完済後５年経ったデータの削除 */
	DELETE QPA8_SYNDAICYOT
	 WHERE TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300SyainDaicyoT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcNyukinT                                    */
/* 機能          ：小口融資入金テーブルの期日管理                            */
/*                 入金日が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcNyukinT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA5_KGCNYUKINT
	 WHERE TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPA5_KGCNYUKINT
	 WHERE TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcNyukinT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300SymNyukinT                                    */
/* 機能          ：社員融資入金テーブルの期日管理                            */
/*                 入金日が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300SymNyukinT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA9_SYNNYUKINT
	 WHERE TO_CHAR(QPA9_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPA9_SYNNYUKINT
	 WHERE TO_CHAR(QPA9_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300SymNyukinT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcZandakaT                                   */
/* 機能          ：小口融資残高履歴テーブルの期日管理                        */
/*                 残高日が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcZandakaT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA3_KGCZANDAKAT
	 WHERE TO_CHAR(QPA3_PRMZANDAKAYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPA3_KGCZANDAKAT
	 WHERE TO_CHAR(QPA3_PRMZANDAKAYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcZandakaT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcKasitukeT                                  */
/* 機能          ：小口融資貸付テーブルの期日管理                            */
/*                 取引発生年月日が１０年以上経過したデータを削除する        */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcKasitukeT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA6_KGCKASITUKET
	 WHERE TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPA6_KGCKASITUKET
	 WHERE TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcKasitukeT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcKojoT                                      */
/* 機能          ：小口融資賞与控除履歴テーブルの期日管理                    */
/*                 控除日が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcKojoT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA4_KGCKOJOT
	 WHERE TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPA4_KGCKOJOT
	 WHERE TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcKojoT;


/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300KgcHensaiT                                    */
/* 機能          ：小口融資返済額履歴テーブルの期日管理                      */
/*                 変更月が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcHensaiT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA2_KGCHENSAIT
	 WHERE QPA2_PRMHENKOUYM < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMM');

	/* データの削除 */
	DELETE QPA2_KGCHENSAIT
	 WHERE QPA2_PRMHENKOUYM < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMM');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcHensaiT;


--del 20080714 nbc ishida 利率期日管理廃止 start
--/*****************************************************************************/
--/* モジュール名  ：QPAP_Cent300KgcRirituT                                    */
--/* 機能          ：小口融資利率履歴テーブルの期日管理                        */
--/*                 変更日が１０年以上経過したデータを削除する                */
--/*****************************************************************************/
--PROCEDURE	QPAP_Cent300KgcRirituT (
--	OtNumCount			OUT		NUMBER,								--処理件数
--	OtNumStatus			OUT		NUMBER) IS							--ステータス
--
--BEGIN
--
--	/* 出力パラメータの初期化 */
--	OtNumCount	:=	0;
--	OtNumStatus	:=	0;
--
--	/* データ件数の取得 */
--	SELECT COUNT(*)
--	  INTO OtNumCount
--	  FROM QPA7_KGCRIRITUT
--	 WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');
--
--	/* データの削除 */
--	DELETE QPA7_KGCRIRITUT
--	 WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');
--
--	/* コミット*/
--	COMMIT;
--
--EXCEPTION
--	WHEN	OTHERS	THEN
--		/* ロールバック */
--		ROLLBACK;
--		OtNumStatus := 99;
--		RAISE ;
--
--END	QPAP_Cent300KgcRirituT;
--del 20080714 nbc ishida 利率期日管理廃止 end

--ADD 20100225 0908047 NBC SAWAME START
/*****************************************************************************/
/* モジュール名  ：QPAP_Cent300BunkairskT                                    */
/* 機能          ：分解利息テーブルの期日管理                                */
/*                 入金日が１０年以上経過したデータを削除する                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300BunkairskT (
	OtNumCount			OUT		NUMBER,								--処理件数
	OtNumStatus			OUT		NUMBER) IS							--ステータス

BEGIN

	/* 出力パラメータの初期化 */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* データ件数の取得 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPB5_BUNKAIRSK
	 WHERE TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* データの削除 */
	DELETE QPB5_BUNKAIRSK
	 WHERE TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* コミット*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300BunkairskT;
--ADD 20100225 0908047 NBC SAWAME END

END QPAP_CEnt300PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR
