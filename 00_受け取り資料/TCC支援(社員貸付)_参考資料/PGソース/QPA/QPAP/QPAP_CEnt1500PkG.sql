CREATE OR REPLACE PACKAGE  QPAP_CEnt1500PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員貸付システム                                          */
/* モジュール名  ：QPAP_CEnt1500PkG                                          */
/* 機能          ：社員貸付・テーブル期日管理                                */
/* 作成日        ：2010/02/25                                                */
/* 作成者        ：FIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*								１ 宣言部								     */
/*****************************************************************************/

/* 分解・分解戻しテーブル期日管理 */
PROCEDURE	QPAP_DeleteQPB2 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER);							--期日管理月数

/* 残高履歴テーブル期日管理 */
PROCEDURE	QPAP_DeleteQPB3 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER);							--期日管理月数

/* 控除履歴テーブル期日管理 */
PROCEDURE	QPAP_DeleteQPB0 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER);							--期日管理月数

END QPAP_CEnt1500PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								２　ボディー							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1500PkG IS


/*****************************************************************************/
/* モジュール名  ：QPAP_DeleteQPB2                                           */
/* 機能          ：分解・分解戻しテーブルの期日管理                          */
/*                 処理実行日より10年経った社員のデータを削除する            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB2 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER) IS							--期日管理月数
	
	/* 処理固有の変数 */
	dat10YOldDate		DATE;										--10年後の日付
	NumCount			NUMBER	:=	0;								--期日管理件数

BEGIN
	
	/* ログ出力ＳＴＡＲＴ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2','I','Start');
	
	/* 10年前の日付を格納 */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');

	/* 削除対象データ件数 */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB2_BUNKAI
	 WHERE QPB2_TOUROKUYMD < dat10YOldDate AND QPB2_BUNMODFLG = '1' AND QPB2_RRKFLG = '1';

	/* データの削除 */
	DELETE QPB2_BUNKAI
	 WHERE QPB2_TOUROKUYMD < dat10YOldDate AND QPB2_BUNMODFLG = '1' AND QPB2_RRKFLG = '1';

	/* コミット */
	COMMIT;
		
	/* 件数メッセージ出力 */
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2',
		'I','分解・分解戻しテーブル期日管理 削除件数＝' || TO_CHAR(NumCount) || '件');
	
	/* ログ出力ＥＮＤ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		/* ログ出力ＥＮＤ */
		QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2',
		'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* エラー発生 */
		RAISE;
		
END	QPAP_DeleteQPB2;


/*****************************************************************************/
/* モジュール名  ：QPAP_DeleteQPB3                                           */
/* 機能          ：残高履歴テーブルの期日管理                                */
/*                 処理実行日より10年経った社員のデータを削除する            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB3 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER) IS							--期日管理月数

	/* 処理固有の変数 */
	dat10YOldDate		DATE;										--10年後の日付
	NumCount			NUMBER	:=	0;								--期日管理件数

BEGIN

	/* ログ出力ＳＴＡＲＴ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3','I','Start');
	
	/* 10年前の日付を格納 */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');

	/* 削除対象データ件数 */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB3_ZNDKRRK
	 WHERE QPB3_TURKYMD < dat10YOldDate;

	/* データの削除 */
	DELETE QPB3_ZNDKRRK
	 WHERE QPB3_TURKYMD < dat10YOldDate;

	/* コミット */
	COMMIT;
	
	/*件数メッセージ出力*/
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3',
		'I','残高履歴テーブル期日管理 削除件数＝' || TO_CHAR(NumCount) || '件');
	
	/* ログ出力ＥＮＤ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		/* ログ出力ＥＮＤ */
		QUSP_LogPkg.QUSP_DispUponCons(
			InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3',
			'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* エラー発生 */
		RAISE;

END	QPAP_DeleteQPB3;


/*****************************************************************************/
/* モジュール名  ：QPAP_DeleteQPB0                                           */
/* 機能          ：控除履歴テーブルの期日管理                                */
/*                 処理実行日より10年経った社員のデータを削除する            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB0 (
	InChaNetID			IN		CHAR,								--ネットＩＤ
	InChaJobID			IN		CHAR,								--ジョブＩＤ
	InNumMonth			IN		NUMBER) IS							--期日管理月数

	/* 処理固有の変数 */
	dat10YOldDate		DATE;										--処理日付
	NumCount			NUMBER	:=	0;								--期日管理件数

BEGIN

	/* ログ出力ＳＴＡＲＴ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0','I','Start');
	
	/* 10年前の日付を格納 */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');
    
    
	/* 削除対象データ件数 */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB0_KOJORRKT
	 WHERE QPB0_INSERTDATE < dat10YOldDate;

	/* データの削除 */
	DELETE QPB0_KOJORRKT
	 WHERE QPB0_INSERTDATE < dat10YOldDate;

	/* コミット */
	COMMIT;
	
	/* 件数メッセージ出力 */
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0',
		'I','控除履歴テーブル期日管理 削除件数＝' || TO_CHAR(NumCount) || '件');
	
	/* ログ出力ＥＮＤ */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ロールバック */
		ROLLBACK;
		/* ログ出力ＥＮＤ */
		QUSP_LogPkg.QUSP_DispUponCons(
			InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0',
			'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* エラー発生 */
		RAISE;

END	QPAP_DeleteQPB0;


END QPAP_CEnt1500PkG;

/***END of LINE***************************************************************/
/
SHOW ERROR
