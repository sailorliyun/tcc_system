CREATE OR REPLACE PACKAGE  QPAP_CEnt260PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員貸付                                                  */
/* モジュール名  ：QPAP_CEnt260PkG                                           */
/* 機能          ：社員マスタテーブルの社員コードがスペースのレコードを      */
/*                 削除する                                                  */
/* 作成日        ：2001/10/19                                                */
/* 作成者        ：FIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*								１  宣言部								     */
/*****************************************************************************/

/* 主処理 */
PROCEDURE QPAP_CEnt260PkG_Main (
	OtStrSTATUS			OUT		CHAR);	--出力：ステータス　　０：正常　　９９：異常

END QPAP_CEnt260PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								２  ボディー							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt260PkG IS



/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt260PkGMain                                       */
/* 機能          ：社員マスタ削除処理                                        */
/*****************************************************************************/
PROCEDURE QPAP_CEnt260PkG_Main(
	OtStrSTATUS		OUT		CHAR) IS	--出力：ステータス　　00：正常　　99：異常

	/* 処理固有の変数 */
	NumCount		NUMBER;
	STRROWID		VARCHAR2(18);

	/* カーソル宣言 */
	CURSOR CurQPAC IS
		SELECT  ROWID
		  FROM  QPAC_SYAINM
		 WHERE  QPAC_PRMSYAINCD1 = ' ';

BEGIN

	/* 出力パラメータの初期化 */
	NumCount    := 0;
	OtStrSTATUS := '00';

	/* カーソルオープン */
	OPEN  CurQPAC;

	/* ループ処理 */
	LOOP
		FETCH  CurQPAC INTO STRROWID;

		IF CurQPAC%NOTFOUND THEN
			EXIT;
		END IF;

		/* 削除処理を行う */
		DELETE QPAC_SYAINM
		 WHERE ROWID = STRROWID;

		/* 件数１万件ごとにコミットする */
		NumCount := NumCount + 1;
		IF  NumCount = 10000 THEN
			COMMIT;
			NumCount := 0;
		END IF;

	END LOOP;

	/* コミット */
	COMMIT;

	/* カーソルクローズ */
	CLOSE CurQPAC;


EXCEPTION
	WHEN OTHERS THEN
		IF CurQPAC%ISOPEN THEN
			CLOSE CurQPAC;
		END IF;
		OtStrSTATUS := '99';
		ROLLBACK;
		RAISE ;

END QPAP_CEnt260PkG_Main;

END QPAP_CEnt260PkG;
/***END of LINE****************************************************************/
/
SHOW ERROR
