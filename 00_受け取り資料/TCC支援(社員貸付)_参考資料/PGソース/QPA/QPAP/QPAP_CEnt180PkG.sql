CREATE OR REPLACE PACKAGE  QPAP_CEnt180PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt180PkG                                                                                */
/* 機能          ：精算店マスタメンテナンス                                                                       */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部  																									  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtSeisanCDAry IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanNMAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* 精算店データ取得 */
PROCEDURE QPAP_CEnt180SelList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrSeisanCD		OUT		typOtSeisanCDAry								--精算店コード
	,OtStrSeisanNM		OUT		typOtSeisanNMAry		        				--精算店名称
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);										--検索終了フラグ

/* 精算店データ登録処理 */
PROCEDURE QPAP_CEnt180DatAdd (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--精算店名称
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR);											--データ重複フラグ

/* 精算店データ更新処理 */
PROCEDURE QPAP_CEnt180DatUpd (
	 InStrSeisanCD_B  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード修正前
	,InStrSeisanCD_A  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード修正後
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--精算店名称
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR);											--データ重複フラグ

/* 精算店データ削除処理 */
PROCEDURE QPAP_CEnt180DatDel (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrSeisanF		OUT		CHAR);											--精算店可・不可フラグ

/* 精算店マスタに同じデータがあるかチェック処理 */
FUNCTION  QPAP_CEnt180DataChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--精算店コード
	 RETURN BOOLEAN;

/* 店マスタに精算店データがあるかチェック処理 */
FUNCTION  QPAP_CEnt180MasterChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--精算店コード
	 RETURN BOOLEAN;

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt180OpeLog(
	 InStrMenuID      	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューＩＤ
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--プログラムＩＤ
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--東西区分
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード
	,InStrMsg	  		IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt180Lock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrProgramID	  	IN      QSA4_HaitaT.QSA4_ProgramID%type					--プログラムＩＤ
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type				--コンピュータ名
	,InStrOperatorID  	IN      QSA4_HaitaT.QSA4_OperatorID%type);				--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt180UnLock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type);				--コンピューター名

END QPAP_CEnt180PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー 													                                                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt180PkG IS
	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* テーブル名   */
		fldKousinKBN	CHAR(1),	        									/* 更新区分     */
		fldAcsKey		CHAR(50),												/* アクセスキー */
		fldMsg			CHAR(100)												/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;


	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

	/* 検索完了時のみ開放するカーソル */
	CURSOR CurCEnt180 IS
		SELECT	   QPAG_PRMSEISANCD,QPAG_SEISANNM								--精算店コード,精算店名称
		FROM	   QPAG_SEISANM
		ORDER BY   QPAG_PRMSEISANCD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180SelList                                                                            */
/* 機能          ：精算店データ取得                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180SelList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrSeisanCD		OUT		typOtSeisanCDAry								--精算店コード
	,OtStrSeisanNM		OUT		typOtSeisanNMAry		        				--精算店名称
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	 NumIdx				NUMBER;

	/* 行変数 */
	 RowQPAG			CurCEnt180%ROWTYPE;

BEGIN
	/* 初期化 */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--カーソルオープン
	IF CurCEnt180%ISOPEN = FALSE THEN
		OPEN CurCEnt180();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt180 INTO RowQPAG;											--順読み

		IF CurCEnt180%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		OtStrSeisanCD(NumIdx) := NVL(RowQPAG.QPAG_PRMSEISANCD,' ');
		OtStrSeisanNM(NumIdx) := NVL(RowQPAG.QPAG_SEISANNM,' ');

		/* 配列の件数がＭＡＸを超えた場合 */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;

	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt180;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt180%ISOPEN THEN
			CLOSE CurCEnt180;
		END IF;
		RAISE ;
END	QPAP_CEnt180SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180DatAdd                                                                             */
/* 機能          ：精算店データ登録処理                                                                           */
/******************************************************************************************************************/
/* 精算店データ登録処理 */
PROCEDURE QPAP_CEnt180DatAdd (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--精算店名称
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2  	 									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR) IS										--データ重複フラグ

	numStep				NUMBER   := 0;											/* 処理ステップ  */
	numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	recMsg				typMsg;
	strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	R_Ans				BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--テーブル名
	recMsg.fldKousinKBN	:= '1';													--更新区分
	recMsg.fldAcsKey	:= InStrSeisanCD;										--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt180DataChkの呼び出し */
	R_Ans := QPAP_CEnt180DataChk(InStrSeisanCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  精算店データ登録  */
	INSERT INTO QPAG_SEISANM VALUES (
		 InStrSeisanCD															--精算店コード
		,InStrSeisanNM);                                        				--精算店名称

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）精算店マスタの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* コミット */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）精算店マスタの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180DatUpd                                                                             */
/* 機能          ：精算店マスタの更新                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180DatUpd (
	 InStrSeisanCD_B  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード修正前
	,InStrSeisanCD_A  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード修正後
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--精算店名称
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2  	 									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR) IS										--データ重複フラグ

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrSeisanCD_A;										--更新キー

	OtStrDupF := '0';
	IF InStrSeisanCD_A <> InStrSeisanCD_B THEN
		/* QPAP_CEnt180DataChkの呼び出し */
		R_Ans := QPAP_CEnt180DataChk(InStrSeisanCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* 精算店マスタの更新 */
	UPDATE QPAG_SEISANM SET
		 QPAG_PRMSEISANCD =	InStrSeisanCD_A										--精算店コード
		,QPAG_SEISANNM = InStrSeisanNM											--精算店名称
		WHERE QPAG_PRMSEISANCD = InStrSeisanCD_B;								--更新キー 精算店コード

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）精算店マスタの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* コミット */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '精算店マスタの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180Del                                                                                */
/* 機能          ：精算店マスタの削除                                                                             */
/******************************************************************************************************************/
/*精算店データ削除処理 */
PROCEDURE QPAP_CEnt180DatDel (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--精算店コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2	   									--担当名（オペログ用）
	,OtStrSeisanF		OUT		CHAR) IS										--精算店可・不可フラグ

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr		        NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--テーブル名
	recMsg.fldKousinKBN	:= '3';													--更新区分
	recMsg.fldAcsKey	:= InStrSeisanCD;										--更新キー

	OtStrSeisanF := '0';
	/* QPAP_CEnt180MasterChkの呼び出し */
	R_Ans := QPAP_CEnt180MasterChk(InStrSeisanCD);
	IF R_Ans = TRUE THEN
		OtStrSeisanF := '1';
		RETURN;
	END IF;


	/* 精算店マスタの削除 */
	DELETE FROM     QPAG_SEISANM
	       WHERE	QPAG_PRMSEISANCD = InStrSeisanCD;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）精算店マスタの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* コミット */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）精算店マスタの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180DataChk                                        	                 				  */
/* 機能          ：精算店マスタに同じデータがあるかチェック処理                                        			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt180DataChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--精算店コード
	 RETURN BOOLEAN IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAG_SEISANM
	WHERE	QPAG_PRMSEISANCD = InStrSeisanCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--登録されている
	ELSE
		RETURN  FALSE;															--登録されていない
	END IF;

END QPAP_CEnt180DataChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180MasterChk                                                     					  */
/* 機能          ：店マスタに精算店データがあるかチェック処理                                          			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt180MasterChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--精算店コード
	 RETURN BOOLEAN  IS															--総検索件数

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAE_MISEM
	WHERE	QPAE_SEISANCD = InStrSeisanCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--登録されている
	ELSE
		RETURN  FALSE;															--登録されていない
	END IF;

END	QPAP_CEnt180MasterChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180OpeLog                                                       					  */
/* 機能          ：オペログへの追加                                                                  			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt180OpeLog(
	 InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					/* メニューＩＤ   */
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					/* プログラムＩＤ */
	,InStrUserID  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					/* ユーザＩＤ     */
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				/* コンピュータ   */
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				/* 東西区分       */
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					/* 部署コード     */
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS					/* メッセージ     */

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
			RAISE ;		/* オペログのエラーを認める */
END  QPAP_CEnt180OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180Lock                                                                               */
/* 機能          ：精算店マスタのロック                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 精算店マスタの確認 */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerNM, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InStrSikibetu;
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
			'P', InStrSikibetu,
			'P',
			'P',
			'P',
			'P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--精算店マスタ作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt180Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--精算店マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt180Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt180Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt180UnLock                                                                             */
/* 機能          ：精算店マスタのロック解除                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180UnLock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type) IS			--コンピューター名

BEGIN
	delete from QSA4_HaitaT
	 where QSA4_PRMJobKbn = 'P'
	   and QSA4_PRMSikibetu = InStrSikibetu
	   and QSA4_ComputerMei = InStrComputerNM;
	commit;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt180UnLock ;

END QPAP_CEnt180PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
