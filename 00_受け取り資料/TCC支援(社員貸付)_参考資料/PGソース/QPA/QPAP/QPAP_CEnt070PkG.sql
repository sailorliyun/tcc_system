CREATE OR REPLACE PACKAGE  QPAP_CEnt070PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt070PkG                                                                                */
/* 機能          ：小口融資利率変更入力                                                                           */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*	１  宣言部  												  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtHenkoYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtRirituAry IS TABLE OF QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE
		INDEX BY BINARY_INTEGER;

/* 利率履歴データ取得 */
PROCEDURE QPAP_CEnt070SelList (
	 InNumMaxRec		IN	NUMBER						--最大配列格納件数
	,IoNumSpCnt		IN OUT	NUMBER						--呼び出し回数
	,OtStrHenkoYMD		OUT	typOtHenkoYMDAry				--変更年月
	,OtNumRiritu		OUT	typOtRirituAry		        		--利率
	,OtNumRecCount		OUT	NUMBER						--総検索件数
	,OtNumAryCount		OUT	NUMBER						--配列格納件数
	,OtStrEndFlg		OUT	VARCHAR2);					--検索終了フラグ

/* 利率履歴データ重複チェック */
PROCEDURE QPAP_CEnt070DatChk (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,OtStrFlg	  	OUT	CHAR);						--判定フラグ

/* 利率履歴データ登録処理 */
PROCEDURE QPAP_CEnt070DatAdd (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--利率
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2);    					--担当名（オペログ用）

/* 利率履歴データ更新処理 */
PROCEDURE QPAP_CEnt070DatUpd (
	 InStrHenkoYMD_B  	IN	CHAR						--変更年月修正前
	,InStrHenkoYMD_A  	IN	CHAR						--変更年月修正後
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--利率
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2);    					--担当名（オペログ用）

/* 利率履歴データ削除処理 */
PROCEDURE QPAP_CEnt070DatDel (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2);    					--担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt070OpeLog(
	 InStrMenuID  	  	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューＩＤ
	,InStrModuleID    	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--プログラムＩＤ
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ
	,InStrComputerNM 	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ
	,InStrTozaiKBN	  	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--東西区分
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード
	,InStrMsg	  	IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt070Lock(
	 InstrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type		--識別コード
	,InstrProgramID	  	IN      QSA4_HaitaT.QSA4_ProgramID%type			--プログラムＩＤ
	,InstrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type		--コンピュータ名
	,InstrOperatorID  	IN      QSA4_HaitaT.QSA4_OperatorID%type);		--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt070UnLock(
	 InstrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type		--識別コード
	,InstrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type);		--コンピューター名

END QPAP_CEnt070PkG;
/
show error

/******************************************************************************************************************/
/*２  ボディー 													  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt070PkG IS
	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),					/* テーブル名   */
		fldKousinKbn		CHAR(1),	        			/* 更新区分     */
		fldAcsKey		CHAR(50),					/* アクセスキー */
		fldMsg			CHAR(100)					/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/* 検索完了時のみ開放するカーソル */
	CURSOR CurCEnt070 IS
		SELECT	   TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') AS HENKOYMD,QPA7_RIRITU
		FROM	   QPA7_KGCRIRITUT
		ORDER BY   QPA7_PRMHENKOYMD DESC;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070SelList                                                                            */
/* 機能          ：利率履歴データ取得                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070SelList (
	 InNumMaxRec		IN	NUMBER						--最大配列格納件数
	,IoNumSpCnt		IN OUT	NUMBER						--呼び出し回数
	,OtStrHenkoYMD		OUT	typOtHenkoYMDAry				--変更年月
	,OtNumRiritu		OUT	typOtRirituAry		        		--利率
	,OtNumRecCount		OUT	NUMBER						--総検索件数
	,OtNumAryCount		OUT	NUMBER						--配列格納件数
	,OtStrEndFlg		OUT	VARCHAR2) IS					--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx			NUMBER;

	/* 行変数 */
	RowQPAG			CurCEnt070%ROWTYPE;

BEGIN
	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP呼出 初回時のみカーソル設定
	IF IoNumSpCnt	= 0 THEN
		SELECT
			COUNT(*)
		INTO
			OtNumRecCount
		FROM	QPA7_KGCRIRITUT;
	END IF;

	--SP呼出回数 カウントアップ
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--カーソルオープン
	IF CurCEnt070%ISOPEN = FALSE THEN
		OPEN CurCEnt070();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		FETCH CurCEnt070 INTO RowQPAG;						--順読み
		IF	CurCEnt070%NOTFOUND THEN
			EXIT;								--ループ終了
		END IF;

		OtStrHenkoYMD(NumIdx) := RowQPAG.HENKOYMD;
		OtNumRiritu(NumIdx) := RowQPAG.QPA7_RIRITU;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;								--プロシージャの終了
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';							--検索終了
	OtNumAryCount	:=	NumIdx - 1;

	/* カーソルのクローズ */
	CLOSE CurCEnt070;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt070%ISOPEN THEN
			CLOSE CurCEnt070;
		END IF;
		RAISE ;
END	QPAP_CEnt070SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070DatAdd                                                                             */
/* 機能          ：利率履歴データ重複チェック                                                                     */
/******************************************************************************************************************/
/* 利率履歴データ登録処理 */
PROCEDURE QPAP_CEnt070DatChk (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,OtStrFlg	  	OUT	CHAR) IS 					--判定フラグ

	v_NumCount			NUMBER;

BEGIN
	OtStrFlg := '1';

	SELECT COUNT(*) INTO v_NumCount FROM QPA7_KGCRIRITUT
	WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') = InStrHenkoYMD;

	IF v_NumCount = 0 THEN
		OtStrFlg := '0';
	END IF;

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt070DatChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070DatAdd                                                                             */
/* 機能          ：利率履歴データ登録処理                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatAdd (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--利率
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2) IS					--担当名（オペログ用）

	numStep			NUMBER   := 0;						/* 処理ステップ  */
	numErr			NUMBER   := 0;						/* SQLCODEの退避 */
	strErrMsg		VARCHAR2(100);						/* SQLERRMの退避 */
	recMsg			typMsg;
	strLogMsg		QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--テーブル名
	recMsg.fldKousinKbn	:= '1';							--更新区分
	recMsg.fldAcsKey	:= InStrHenkoYMD;					--更新キー

	/*  精算店データ登録  */
	INSERT INTO QPA7_KGCRIRITUT VALUES (
		 TO_DATE(InStrHenkoYMD,'YYYYMMDD')					--変更年月
		,InNumRIritu);                                        			--利率

	/* コミット */
	COMMIT;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資利率履歴テーブルの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;
	
		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資利率履歴テーブルの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070DatUpd                                                                             */
/* 機能          ：利率履歴データの更新                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatUpd (
	 InStrHenkoYMD_B  	IN	CHAR						--変更年月修正前
	,InStrHenkoYMD_A  	IN	CHAR						--変更年月修正後
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--利率
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2) IS					--担当名（オペログ用）

	 numStep			NUMBER   := 0;					/* 処理ステップ  */
	 numErr				NUMBER   := 0;					/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);					/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--テーブル名
	recMsg.fldKousinKbn	:= '2';							--更新区分
	recMsg.fldAcsKey	:= InStrHenkoYMD_B;					--更新キー

	/* 精算店マスタの更新 */
	UPDATE QPA7_KGCRIRITUT SET
		 QPA7_PRMHENKOYMD	=	TO_DATE(InStrHenkoYMD_A,'YYYYMMDD')	--変更年月
		,QPA7_RIRITU		=	InNumRIritu				--利率
	WHERE	 TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD')
					= 	InStrHenkoYMD_B;			--更新キー 変更年月

	/* コミット */
	COMMIT;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資利率履歴テーブルの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '小口融資利率履歴テーブルの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070Del                                                                                */
/* 機能          ：利率履歴データの削除                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatDel (
	 InStrHenkoYMD	  	IN	CHAR						--変更年月
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--モジュールID（オペログ用）
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード（オペログ用）
	,InStrTantoNM	   	IN	VARCHAR2) IS					--担当名（オペログ用）

	 numStep			NUMBER   := 0;					/* 処理ステップ  */
	 numErr		        	NUMBER   := 0;					/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);					/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
BEGIN

	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--テーブル名
	recMsg.fldKousinKbn	:= '3';							--更新区分
	recMsg.fldAcsKey	:= InStrHenkoYMD;					--更新キー

	/* 精算店マスタの削除 */
	DELETE FROM     QPA7_KGCRIRITUT
	       WHERE	TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') = InStrHenkoYMD;

	/* コミット */
	COMMIT;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資利率履歴テーブルの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);


EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資利率履歴テーブルの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070OpeLog                                        					  */
/* 機能          ：オペログへの追加                                                        			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt070OpeLog(
	 InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			/* メニューＩＤ   */
	,InStrModuleID     	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			/* プログラムＩＤ */
	,InStrUserID  	   	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			/* ユーザＩＤ     */
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		/* コンピュータ   */
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		/* 東西区分       */
	,InStrBushoCD	   	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			/* 部署コード     */
	,InStrMsg	   	IN	QUS2_OpeLogT.QUS2_MSG%TYPE ) IS			/* メッセージ     */
BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);
	EXCEPTION
		WHEN	OTHERS	THEN
			RAISE ;								/* オペログのエラーを認める */
END  QPAP_CEnt070OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070Lock                                                                               */
/* 機能          ：小口融資利率変更履歴テーブルのロック                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,	/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,	/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,	/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS	/* オペレータＩＤ */

	fldComputerMei			QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID			QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 小口融資利率変更履歴テーブルの確認 */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerMei, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InstrSikibetu;
	exception
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	end;

	if numErr = 0 then
		RAISE W_HAITADUPLICATE;
	else
		insert into QSA4_HaitaT (
			QSA4_PRMJobKbn,
			QSA4_PRMSikibetu,
			QSA4_PRMKeyInfo1,
			QSA4_PRMKeyInfo2,
			QSA4_PRMKeyInfo3,
			QSA4_PRMKeyInfo4,
			QSA4_PRMKeyInfo5,
			QSA4_ProgramID,
			QSA4_ComputerMei,
			QSA4_OperatorID,
			QSA4_SyoriYmd
		) values (
			'P', InstrSikibetu,
			'P',
			'P',
			'P',
			'P','P',
			InstrProgramID,
			InStrComputerNM,
			InstrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN							--小口融資利率変更履歴テーブル作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt070Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN							--小口融資利率変更履歴テーブル２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt070Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt070Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt070UnLock                                                                             */
/* 機能          ：小口融資利率変更履歴テーブルのロック解除                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070UnLock(
	InstrSikibetu		IN 	QSA4_HaitaT.QSA4_PRMSikibetu%type,		/* 識別コード	  */
	InStrComputerNM		IN 	QSA4_HaitaT.QSA4_ComputerMei%type) IS		/* コンピュータ名 */
BEGIN
	delete from QSA4_HaitaT
	 where QSA4_PRMJobKbn = 'P'
	   and QSA4_PRMSikibetu = InstrSikibetu
	   and QSA4_ComputerMei = InStrComputerNM;
	commit;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt070UnLock ;

END QPAP_CEnt070PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
