CREATE OR REPLACE PACKAGE  QPAP_CEnt200PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt200PkG                                                                                */
/* 機能          ：部門マスタメンテナンス                                                                         */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部  													                                                  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtBumonCDAry IS TABLE OF QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseCDAry IS TABLE OF QPAE_MISEM.QPAE_PRMMISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

/* 部門データ取得 */
PROCEDURE QPAP_CEnt200SelList (
	 InStrMiseCD      	IN   		QPAF_BUMONM.QPAF_PRMMISECD%TYPE		        --店コード
	,InNumMaxRec	  	IN   		NUMBER										--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  	NUMBER										--呼び出し回数
	,OtStrBumonCD	  	OUT			typOtBumonCDAry								--部門コード
	,OtStrBumonNM	  	OUT			typOtBumonNMAry								--部門名称
	,OtNumAryCount		OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	  	OUT			VARCHAR2);									--検索終了フラグ

/* 店コード取得 */
PROCEDURE QPAP_CEnt200MiseCDList (
	 InNumMaxRec		IN			NUMBER										--最大配列格納件数
	,OtStrMiseCD	  	OUT			typOtMiseCDAry								--部門コード
	,OtStrMiseNM	  	OUT			typOtMiseNMAry								--部門名称
	,OtNumAryCount	  	OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	  	OUT			VARCHAR2);									--検索終了フラグ

/* データ登録処理 */
PROCEDURE QPAP_CEnt200DatAdd (
	 InStrMiseCD      	IN     		QPAF_BUMONM.QPAF_PRMMISECD%TYPE  			--店コード
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--部門コード
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE	 			--部門名称
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT	 		CHAR);										--データ重複フラグ

/* 部門データ更新処理 */
PROCEDURE QPAP_CEnt200DatUpd (
	 InStrMiseCD      	IN       	QPAF_BUMONM.QPAF_PRMMISECD%TYPE      		--店コード
	,InStrBumonCD_B	 	IN       	QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--部門コード修正前
	,InStrBumonCD_A	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--部門コード修正後
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE       		--部門名称
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT	 		CHAR);										--データ重複フラグ

/* 部門データ削除処理 */
PROCEDURE QPAP_CEnt200DatDel (
	 InStrMiseCD      	IN       	QPAF_BUMONM.QPAF_PRMMISECD%TYPE      		--店コード
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--部門コード
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2);    								--担当名（オペログ用）

/* 部門マスタに同じデータがあるかチェック処理 */
FUNCTION  QPAP_CEnt200DataChk(
	  InStrMiseCD		IN			QPAF_BUMONM.QPAF_PRMMISECD%TYPE	 			--店コード
	 ,InStrBumonCD		IN			QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE)			--部門コード
	 RETURN BOOLEAN;

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt200OpeLog(
	 InStrMenuID      	IN	 		QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleID    	IN	 		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserID  	  	IN	 		QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerNM 	IN	 		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTozaiKBN	  	IN	 		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCD	  	IN	 		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg	  		IN	 		QUS2_OpeLogT.QUS2_MSG%TYPE);	 			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt200Lock(
	 InStrSikibetu	  	IN       	QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrProgramID	  	IN       	QSA4_HaitaT.QSA4_ProgramID%type				--プログラムＩＤ
	,InStrComputerNM 	IN       	QSA4_HaitaT.QSA4_ComputerMei%type			--コンピュータ名
	,InStrOperatorID  	IN       	QSA4_HaitaT.QSA4_OperatorID%type);			--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt200UnLock(
	 InStrSikibetu	  	IN       	QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrComputerNM 	IN       	QSA4_HaitaT.QSA4_ComputerMei%type);			--コンピューター名

END QPAP_CEnt200PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー   												  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt200PkG IS

	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	   RECORD (
		fldTableID	   		CHAR(19),												/* テーブル名   */
		fldKousinKBN	    CHAR(1),		        								/* 更新区分     */
		fldAcsKey	   		CHAR(50),												/* アクセスキー */
		fldMsg		   		CHAR(100)												/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* 検索完了時のみ開放するカーソル */
	/* 店マスタから取得 */
	CURSOR CurCEnt200 IS
		SELECT	 QPAE_PRMMISECD,QPAE_MISENM
		FROM	 QPAE_MISEM
		ORDER BY QPAE_PRMMISECD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200SelList                                                                            */
/* 機能          ：部門データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200SelList (
	 InStrMiseCD      	IN   		QPAF_BUMONM.QPAF_PRMMISECD%TYPE				--店コード
	,InNumMaxRec	  	IN   		NUMBER										--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  	NUMBER										--呼び出し回数
	,OtStrBumonCD	  	OUT			typOtBumonCDAry								--部門コード
	,OtStrBumonNM	  	OUT			typOtBumonNMAry								--部門名称
	,OtNumAryCount		OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	  	OUT			VARCHAR2) IS								--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;													--配列用IDX
	v_CursorID			INTEGER;												--カーソルID
	v_SelectStmt		VARCHAR2(1000);											--SQL文字列
	v_BumonCD			QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE;						--バインド用部門コード
	v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--バインド用部門名称
	v_Dummy				INTEGER;												--Dummy

BEGIN

	/* 初期化 */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--処理時に使用するカーソルをオープンする
	IF IoNumSpCnt = 0 THEN
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		/* データを取得する */
		--問合せ文字列の作成
		v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT QPAF_PRMBUMONCD,QPAF_BUMONNM FROM QPAF_BUMONM
				 		 WHERE QPAF_PRMMISECD = :MiseCD ORDER BY QPAF_PRMBUMONCD';

		--問合せを解析する
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--入力変数をバインドする
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':MiseCD',InStrMiseCD);

		--実行する
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;
	IoNumSpCnt := v_CursorID;

	--出力変数を定義する
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_BumonNM,24);

	--FETCH LOOP文
	LOOP
		NumIdx := NumIdx + 1;

		--一連の行をバッファに取り出したあとLOOPの終了条件をチェックする
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		--一連の行をバッファからPLSQL変数にFETCHする
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_BumonNM);

		OtStrBumonCD(NumIdx) := NVL(v_BumonCD,' ');
		OtStrBumonNM(NumIdx) := NVL(v_BumonNM,' ');

		/* 配列の件数がＭＡＸを超えた場合 */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE ;
END	QPAP_CEnt200SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200MiseCDList                                                                         */
/* 機能          ：店コード取得		                                                                         	  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200MiseCDList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrMiseCD	  	OUT		typOtMiseCDAry									--部門コード
	,OtStrMiseNM	  	OUT		typOtMiseNMAry									--部門名称
	,OtNumAryCount	  	OUT		NUMBER											--配列格納件数
	,OtStrEndFlg	  	OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;

	/* 行変数 */
	RowQPAP				CurCEnt200%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--カーソルオープン
	IF CurCEnt200%ISOPEN = FALSE THEN
		OPEN CurCEnt200();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt200 INTO RowQPAP;											--順読み

		IF CurCEnt200%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		/* 取得データを配列に代入*/
		OtStrMiseCD(NumIdx)  := RowQPAP.QPAE_PRMMISECD;
		OtStrMiseNM(NumIdx)  := RowQPAP.QPAE_MISENM;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;

	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt200;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt200%ISOPEN THEN
			CLOSE CurCEnt200;
		END IF;
		RAISE ;
END	QPAP_CEnt200MiseCDList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200DatAdd                                                                             */
/* 機能          ：部門データ登録処理                                                                             */
/******************************************************************************************************************/
/* 部門データ登録処理 */
PROCEDURE QPAP_CEnt200DatAdd (
	 InStrMiseCD      	IN     		QPAF_BUMONM.QPAF_PRMMISECD%TYPE  			--店コード
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--部門コード
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE	 			--部門名称
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT	 		CHAR) IS									--データ重複フラグ

	 numStep		   	NUMBER   := 0;											/* 処理ステップ  */
	 numErr			   	NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		   	VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			   	typMsg;
	 strLogMsg		   	QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAF_BUMONM';		    							--テーブル名
	recMsg.fldKousinKBN	:= '1';													--更新区分
	recMsg.fldAcsKey	:= InStrMiseCD;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt200DataChkの呼び出し */
	R_Ans := QPAP_CEnt200DataChk(InStrMiseCD,InStrBumonCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  部門データ登録  */
	INSERT INTO QPAF_BUMONM VALUES (
		 InStrMiseCD															--店コード
		,InStrBumonCD															--精算店コード
		,InStrBumonNM);                                         				--精算店名称

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200DatUpd                                                                             */
/* 機能          ：部門マスタの更新                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200DatUpd (
	 InStrMiseCD      	IN      QPAF_BUMONM.QPAF_PRMMISECD%TYPE      			--店コード
	,InStrBumonCD_B	 	IN      QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--部門コード修正前
	,InStrBumonCD_A	  	IN	 	QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--部門コード修正後
	,InStrBumonNM	  	IN	 	QPAF_BUMONM.QPAF_BUMONNM%TYPE       			--部門名称
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF	  		OUT	 	CHAR) IS										--データ重複フラグ

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr			    NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN

	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAF_BUMONM';										--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrMiseCD;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt200DataChkの呼び出し */
	IF InStrBumonCD_A <> InStrBumonCD_B THEN
		R_Ans := QPAP_CEnt200DataChk(InStrMiseCD,InStrBumonCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* 部門マスタの更新 */
	UPDATE QPAF_BUMONM SET
		   QPAF_PRMBUMONCD = InStrBumonCD_A									--部門コード
		   ,QPAF_BUMONNM =	InStrBumonNM									--部門名称
	WHERE  QPAF_PRMMISECD = InStrMiseCD										--更新キー 店コード,部門コード
	AND    QPAF_PRMBUMONCD = InStrBumonCD_B;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200Del                                                                                */
/* 機能          ：部門マスタの削除                                                                               */
/******************************************************************************************************************/
/*部門データ削除処理 */
PROCEDURE QPAP_CEnt200DatDel (
	 InStrMiseCD      	IN      QPAF_BUMONM.QPAF_PRMMISECD%TYPE      			--店コード
	,InStrBumonCD	  	IN		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--部門コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2) IS    								--担当名（オペログ用）

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAF_BUMONM';										--テーブル名
	recMsg.fldKousinKBN	:= '3';													--更新区分
	recMsg.fldAcsKey	:= InStrMiseCD;											--更新キー

	/* 部門マスタの削除 */
	DELETE FROM QPAF_BUMONM
		WHERE QPAF_PRMMISECD = InStrMiseCD
		AND	  QPAF_PRMBUMONCD = InStrBumonCD;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）部門マスタの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt20ODataChk                                                       					  */
/* 機能          ：部門マスタに同じデータがあるかチェック処理     	                      	             		  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt200DataChk(
	  InStrMiseCD		IN		QPAF_BUMONM.QPAF_PRMMISECD%TYPE	 				--店コード
	 ,InStrBumonCD		IN		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE)				--部門コード
	 RETURN BOOLEAN IS

	OtNumRecCount		NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAF_BUMONM
	WHERE	QPAF_PRMMISECD = InStrMiseCD
	AND     QPAF_PRMBUMONCD = InStrBumonCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--登録されている
	ELSE
		RETURN  FALSE;															--登録されていない
	END IF;

END	QPAP_CEnt200DataChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200OpeLog                                        	                 				  */
/* 機能          ：オペログへの追加                                                        		            	  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt200OpeLog(
	 InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				/* メニューＩＤ   */
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				/* プログラムＩＤ */
	,InStrUserID  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				/* ユーザＩＤ     */
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			/* コンピュータ   */
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			/* 東西区分       */
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				/* 部署コード     */
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS				/* メッセージ     */
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
END  QPAP_CEnt200OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200Lock                                          					                  */
/* 機能          ：部門マスタのロック                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 部門マスタの確認 */
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
	WHEN W_HAITADUPLICATE THEN	--部門マスタ作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt200Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--部門マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt200Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt200Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt200UnLock                                                                             */
/* 機能          ：部門マスタのロック解除                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200UnLock(
	InStrSikibetu		IN QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM	IN QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt200UnLock ;

END QPAP_CEnt200PkG;
/***END of LINE****************************************************************/
/
show error
