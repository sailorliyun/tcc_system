CREATE OR REPLACE PACKAGE  QPAP_CEnt190PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt190PkG                                                                                */
/* 機能          ：店マスタメンテナンス                                                                           */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部  													                                                  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	/*	店マスタからデータ取得時格納  */
	TYPE typOtStrMiseCDAry IS TABLE OF QPAE_MISEM.QPAE_PRMMISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrBonusYMD1Ary IS TABLE OF QPAE_MISEM.QPAE_BONUSYMD1%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrBonusYMD2Ary IS TABLE OF QPAE_MISEM.QPAE_BONUSYMD2%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanCDAry IS TABLE OF QPAE_MISEM.QPAE_SEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanNMAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrTozaiKBNEAry IS TABLE OF QPAE_MISEM.QPAE_TOZAIKBNE%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrTozaiKBNWAry IS TABLE OF QPAE_MISEM.QPAE_TOZAIKBNW%TYPE
		INDEX BY BINARY_INTEGER;

	/*	精算店マスタからデータ取得時格納	*/
	TYPE typOtStrSeisanCDAry2 IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanNMAry2 IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* 店データ取得 */
PROCEDURE QPAP_CEnt190SelList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrMiseCD		OUT		typOtStrMiseCDAry								--店名コード
	,OtStrMiseNM		OUT		typOtStrMiseNMAry								--店名称
	,OtStrBonusYMD1		OUT		typOtStrBonusYMD1Ary							--賞与支給日1
	,OtStrBonusYMD2		OUT		typOtStrBonusYMD2Ary							--賞与支給日2
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry								--精算店コード
	,OtStrSeisanNM		OUT     typOtStrSeisanNMAry								--精算店名称
	,OtStrTozaiKBNE		OUT		typOtStrTozaiKBNEAry							--東西区分東
	,OtStrTozaiKBNW		OUT		typOtStrTozaiKBNWAry		        			--東西区分西
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);										--検索終了フラグ

/* 精算店コード取得*/
PROCEDURE QPAP_CEnt190SeisanCDList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry2							--精算店コード
	,OtStrSeisanNM		OUT		typOtStrSeisanNMAry2							--精算店名称
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);										--検索終了フラグ

/* 店データ登録処理 */
PROCEDURE QPAP_CEnt190DatAdd (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--店名称
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--賞与支給日1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--賞与支給日2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--精算店コード
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--東西区分東
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--東西区分西
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR); 											--データ重複フラグ

/* 店データ更新処理 */
PROCEDURE QPAP_CEnt190DatUpd (
	 InStrMiseCD_B		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード修正前
	,InStrMiseCD_A		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード修正後
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--店名称
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--賞与支給日1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--賞与支給日2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--精算店コード
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--東西区分東
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--東西区分西
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR);											--データ重複フラグ

/* 店データ削除処理 */
PROCEDURE QPAP_CEnt190DatDel (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrMiseF			OUT		CHAR);											--店可・不可フラグ

/* 店マスタに同じデータがあるかチェック処理 */
FUNCTION  QPAP_CEnt190DataChk(
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 				--店コード
	 RETURN BOOLEAN;

/* 部門マスタに店データがあるかチェック処理 */
FUNCTION  QPAP_CEnt190MasterChk(
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 				--店コード
	 RETURN BOOLEAN;

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt190OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--メッセージ

/*-- 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt190Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt190UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--コンピューター名

END QPAP_CEnt190PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー  												  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt190PkG IS
	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* テーブル名   */
		fldKousinKBN	CHAR(1),		        								/* 更新区分     */
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
	/* 精算店マスタからの取得 */
	CURSOR CurCEnt190 IS
		SELECT	  QPAG_PRMSEISANCD,QPAG_SEISANNM
		FROM	  QPAG_SEISANM
		ORDER BY  QPAG_PRMSEISANCD;

	/* 店マスタからの取得 */
	CURSOR CurCEnt190Mise IS
		SELECT    E.QPAE_PRMMISECD,E.QPAE_MISENM,E.QPAE_BONUSYMD1,
		          E.QPAE_BONUSYMD2,E.QPAE_SEISANCD,G.QPAG_SEISANNM,
			  	  E.QPAE_TOZAIKBNE,E.QPAE_TOZAIKBNW
		FROM	  QPAE_MISEM E,QPAG_SEISANM G
		WHERE	  E.QPAE_SEISANCD = G.QPAG_PRMSEISANCD (+)
		ORDER BY  E.QPAE_PRMMISECD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190SelList                                                                            */
/* 機能          ：店データ取得                                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190SelList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrMiseCD		OUT		typOtStrMiseCDAry								--店名コード
	,OtStrMiseNM		OUT		typOtStrMiseNMAry								--店名称
	,OtStrBonusYMD1		OUT		typOtStrBonusYMD1Ary							--賞与支給日1
	,OtStrBonusYMD2		OUT		typOtStrBonusYMD2Ary							--賞与支給日2
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry								--精算店コード
	,OtStrSeisanNM		OUT     typOtStrSeisanNMAry								--精算店名称
	,OtStrTozaiKBNE		OUT		typOtStrTozaiKBNEAry							--東西区分東
	,OtStrTozaiKBNW		OUT		typOtStrTozaiKBNWAry		        			--東西区分西
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;													--配列用IDX

	/* 行変数 */
	RowQPAG				CurCEnt190Mise%ROWTYPE;

BEGIN
	/* 初期化 */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--カーソルオープン
	IF CurCEnt190Mise%ISOPEN = FALSE THEN
		OPEN CurCEnt190Mise();
	END IF;

	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt190Mise INTO RowQPAG;										--順読み

		IF CurCEnt190Mise%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		OtStrMiseCD(NumIdx)    :=  NVL(RowQPAG.QPAE_PRMMISECD,' ');				--店名コード
		OtStrMiseNM(NumIdx)    :=  NVL(RowQPAG.QPAE_MISENM,' ');				--店名称
		OtStrBonusYMD1(NumIdx) :=  NVL(RowQPAG.QPAE_BONUSYMD1,' ');				--賞与支給日1
		OtStrBonusYMD2(NumIdx) :=  NVL(RowQPAG.QPAE_BONUSYMD2,' ');				--賞与支給日2
		OtStrSeisanCD(NumIdx)  :=  NVL(RowQPAG.QPAE_SEISANCD,' ');				--精算店コード
		OtStrSeisanNM(NumIdx)  :=  NVL(RowQPAG.QPAG_SEISANNM,' ');				--精算店名称
		OtStrTozaiKBNE(NumIdx) :=  NVL(RowQPAG.QPAE_TOZAIKBNE,' ');				--東西区分東
		OtStrTozaiKBNW(NumIdx) :=  NVL(RowQPAG.QPAE_TOZAIKBNW,' '); 			--東西区分西

		/* 配列の件数がＭＡＸを超えた場合 */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt190Mise;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt190Mise%ISOPEN THEN
			CLOSE CurCEnt190Mise;
		END IF;
		RAISE ;

END	QPAP_CEnt190SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190SeisanCDList                                                                       */
/* 機能          ：精算店コード取得処理                                                                           */
/******************************************************************************************************************/
/* 精算店コード取得 */
PROCEDURE QPAP_CEnt190SeisanCDList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry2							--精算店コード
	,OtStrSeisanNM		OUT		typOtStrSeisanNMAry2							--精算店名称
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;

	/* 行変数 */
	RowQPAP				CurCEnt190%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--カーソルオープン
	IF CurCEnt190%ISOPEN = FALSE THEN
		OPEN CurCEnt190();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		FETCH CurCEnt190 INTO RowQPAP;											--順読み

		IF CurCEnt190%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		/* 取得データを配列に代入*/
		OtStrSeisanCD(NumIdx) := RowQPAP.QPAG_PRMSEISANCD;
		OtStrSeisanNM(NumIdx) := RowQPAP.QPAG_SEISANNM;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt190;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt190%ISOPEN THEN
			CLOSE CurCEnt190;
		END IF;
		RAISE;
END	QPAP_CEnt190SeisanCDList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190DatAdd                                                                             */
/* 機能          ：店データ登録処理                                                                               */
/******************************************************************************************************************/
/* 店データ登録処理 */
PROCEDURE QPAP_CEnt190DatAdd (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--店名称
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--賞与支給日1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--賞与支給日2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--精算店コード
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--東西区分東
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--東西区分西
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR) IS										--データ重複フラグ

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr			    NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	 recMsg.fldTableID := 'QPAE_MISEM';		    								--テーブル名
	 recMsg.fldKousinKBN := '1';												--更新区分
	 recMsg.fldAcsKey := InStrMiseCD;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt190DataChkの呼び出し */
	R_Ans := QPAP_CEnt190DataChk(InStrMiseCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  店データ登録  */
	INSERT INTO QPAE_MISEM VALUES (
		 InStrMiseCD                                            				--店名コード
        ,InStrMiseNM                                            				--店名称
        ,InStrBonusYMD1                             	                		--賞与支給日1
        ,InStrBonusYMD2                            	             				--賞与支給日2
        ,InStrSeisanCD                                          				--精算店コード
        ,InStrTozaiKBNE															--東西区分東
		,InStrTozaiKBNW);                                       				--東西区分西

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg 	:= '（' || InStrTantoNM || '）店マスタの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
		numErr	  := SQLCODE;
		strErrMsg := SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）店マスタの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE ;
END	QPAP_CEnt190DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190DatUpd                                                                             */
/* 機能          ：店マスタの更新                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190DatUpd (
	 InStrMiseCD_B		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード修正前
	,InStrMiseCD_A		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店名コード修正後
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--店名称
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--賞与支給日1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--賞与支給日2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--精算店コード
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--東西区分東
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE					--東西区分西
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF			OUT		CHAR) IS										--データ重複フラグ

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr			    NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAE_MISEM';										--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrMiseCD_A;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt190DataChkの呼び出し */
	IF InStrMiseCD_A <> InStrMiseCD_B THEN
		R_Ans := QPAP_CEnt190DataChk(InStrMiseCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* 店マスタの更新 */
	UPDATE QPAE_MISEM SET
		QPAE_PRMMISECD = InStrMiseCD_A											--店コード
		,QPAE_MISENM = InStrMiseNM												--店名称
		,QPAE_BONUSYMD1 = InStrBonusYMD1										--賞与支給日1
		,QPAE_BONUSYMD2	= InStrBonusYMD2										--賞与支給日2
		,QPAE_SEISANCD = InStrSeisanCD											--精算店コード
		,QPAE_TOZAIKBNE	= InStrTozaiKBNE										--東西区分東
		,QPAE_TOZAIKBNW	= InStrTozaiKBNW										--東西区分西
		WHERE QPAE_PRMMISECD = InStrMiseCD_B;									--更新キー 店コード

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）店マスタの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）店マスタの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt190DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190Del                                                                                */
/* 機能          ：店マスタの削除                                                                                 */
/******************************************************************************************************************/
/*店データ削除処理 */
PROCEDURE QPAP_CEnt190DatDel (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--店コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrMiseF			OUT		CHAR) IS										--店可・不可フラグ

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			   	BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAE_MISEM';										--テーブル名
	recMsg.fldKousinKBN	:= '3';													--更新区分
	recMsg.fldAcsKey	:= InStrMiseCD;											--更新キー

	/* QPAP_CEnt180MasterChkの呼び出し */
	OtStrMiseF := '0';
	R_Ans := QPAP_CEnt190MasterChk(InStrMiseCD);
	IF R_Ans = TRUE THEN
		OtStrMiseF := '1';
		RETURN;
	END IF;

	/* 店マスタの削除 */
	DELETE FROM   QPAE_MISEM
	       WHERE  QPAE_PRMMISECD = InStrMiseCD;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）店マスタの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）店マスタの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF;

		RAISE ;
END	QPAP_CEnt190DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt19ODataChk                                                       					  */
/* 機能          ：店マスタに同じデータがあるかチェック処理     	                                			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt190DataChk(
	 InStrMiseCD 	IN 		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 					--店コード
	 RETURN BOOLEAN  IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT COUNT(*) INTO OtNumRecCount FROM	QPAE_MISEM
	WHERE  QPAE_PRMMISECD = InStrMiseCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;							--登録されている
	ELSE
		RETURN  FALSE;							--登録されていない
	END IF;

END	QPAP_CEnt190DataChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt19OMasterChk                                        					              */
/* 機能          ：部門マスタに店データがあるかチェック処理                                                       */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt190MasterChk(
	 InStrMiseCD		IN	 QPAE_MISEM.QPAE_PRMMISECD%TYPE) 					--店コード
	 RETURN BOOLEAN  IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT COUNT(*) INTO OtNumRecCount 	FROM  QPAF_BUMONM
	WHERE  QPAF_PRMMISECD = InStrMiseCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--登録されている
	ELSE
		RETURN  FALSE;															--登録されていない
	END IF;

END	QPAP_CEnt190MasterChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190OpeLog                                        					                  */
/* 機能          ：オペログへの追加                                                        			              */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt190OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS	 				--メッセージ

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
END  QPAP_CEnt190OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190Lock                                          					                  */
/* 機能          ：店マスタのロック                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,			/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,			/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,			/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 店マスタの確認 */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
		where QSA4_PRMJobKbn = 'P'
		and QSA4_PRMSikibetu = InStrSikibetu;
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
	WHEN W_HAITADUPLICATE THEN	--店マスタ作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt190Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--店マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt190Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt190Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt190UnLock                                        					                  */
/* 機能          ：店マスタのロック解除                                      					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS			--コンピューター名
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

END QPAP_CEnt190UnLock ;

END QPAP_CEnt190PkG;

/***END of LINE/***************************************************************************************************/
/
show error
