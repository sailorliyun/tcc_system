CREATE OR REPLACE PACKAGE  QPAP_CEnt220PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt220PkG                                                                                */
/* 機能          ：その他マスタメンテナンス                                                                       */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20090329  0807073/0808052  0807073：クレジット支援システムの再構築
--                           0808052：TCC支援システムの再構築
--                             ・アプリケーション移行対応
--                               NUMBERを' 'に変換していたのを修正
------------------------------------------------------------------------------------------------

/******************************************************************************************************************/
/*１  宣言部                                                                                                      */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtKyotuCDAry IS TABLE OF QPAH_OTHERM.QPAH_PRMCODE%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyotuNMNAry IS TABLE OF QPAH_OTHERM.QPAH_NAMEN%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyotuNMXAry IS TABLE OF QPAH_OTHERM.QPAH_NAMEX%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtRirituAry IS TABLE OF QPAH_OTHERM.QPAH_RIRITU%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSGendoAry IS TABLE OF QPAH_OTHERM.QPAH_SGENDO%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKGendoAry IS TABLE OF QPAH_OTHERM.QPAH_KGENDO%TYPE
		INDEX BY BINARY_INTEGER;

/* その他データ取得 */
PROCEDURE QPAP_CEnt220SelList (
	 InNumMaxRec	  	IN   	NUMBER											--最大配列格納件数
	,OtStrCode      	OUT     typOtKyotuCDAry							        --共通コード
	,OtStrNameN			OUT		typOtKyotuNMNAry								--共通名称Ｎ
	,OtStrNameX			OUT		typOtKyotuNMXAry	           					--共通名称Ｘ
	,OtStrRiritu    	OUT     typOtRirituAry			        				--利率
	,OtStrSGendo		OUT		typOtSGendoAry									--証書限度額
	,OtStrKGendo		OUT		typOtKGendoAry		           					--小口限度額
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);										--検索終了フラグ

/* その他データ登録処理 */
PROCEDURE QPAP_CEnt220DatAdd (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--共通コード
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--共通名称Ｎ
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE           			--共通名称Ｘ
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE            		--利率
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--証書限度額
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE         			--小口限度額
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCd	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF	  		OUT	 	CHAR);											--データ重複フラグ

/* その他データ更新処理 */
PROCEDURE QPAP_CEnt220DatUpd (
	 InStrCode_B      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--共通コード修正前
	,InStrCode_A      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE    		        --共通コード修正後
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--共通名称Ｎ
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE          		 	--共通名称Ｘ
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE         			--利率
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--証書限度額
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE        		 	--小口限度額
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF	  		OUT		CHAR);											--データ重複フラグ

/* その他データ削除処理 */
PROCEDURE QPAP_CEnt220DatDel (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE	        		--共通コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2);    									--担当名（オペログ用）

/* その他マスタに同じデータがあるかチェック処理 */
FUNCTION  QPAP_CEnt220DataChk(
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE)	       			--共通コード
	 RETURN BOOLEAN;

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt220OpeLog(
	 InStrMenuID      	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューＩＤ
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--プログラムＩＤ
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--東西区分
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード
	,InStrMsg	 	 	IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt220Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt220UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--コンピューター名

END QPAP_CEnt220PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー						                      				                                          */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt220PkG IS
	/*  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* テーブル名   */
		fldKousinKBN	CHAR(1),	        									/* 更新区分     */
		fldAcsKey		CHAR(50),												/* アクセスキー */
		fldMsg			CHAR(100)												/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/*  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* 検索完了時のみ開放するカーソル */
	CURSOR CurCEnt220 IS
		SELECT	 QPAH_PRMCODE,QPAH_NAMEN,QPAH_NAMEX,QPAH_RIRITU,
			 	 QPAH_SGENDO,QPAH_KGENDO
		FROM	 QPAH_OTHERM
		ORDER BY QPAH_PRMCODE;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220SelList                                                                            */
/* 機能          ：その他データ取得                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220SelList (
	 InNumMaxRec	  	IN   	NUMBER											--最大配列格納件数
	,OtStrCode      	OUT     typOtKyotuCDAry			        				--共通コード
	,OtStrNameN			OUT		typOtKyotuNMNAry								--共通名称Ｎ
	,OtStrNameX			OUT		typOtKyotuNMXAry	           					--共通名称Ｘ
	,OtStrRiritu    	OUT     typOtRirituAry			        				--利率
	,OtStrSGendo		OUT		typOtSGendoAry									--証書限度額
	,OtStrKGendo		OUT		typOtKGendoAry		           					--小口限度額
	,OtNumAryCount		OUT		NUMBER											--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;

	/* 行変数 */
	RowQPAP				CurCEnt220%ROWTYPE;

BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--カーソルオープン
	IF CurCEnt220%ISOPEN = FALSE THEN
		OPEN CurCEnt220();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt220 INTO RowQPAP;											--順読み

		IF CurCEnt220%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;																--ループ終了
		END IF;

		/* 取得データを配列に代入*/
		OtStrCode(NumIdx)   := NVL(RowQPAP.QPAH_PRMCODE,' ');
		OtStrNameN(NumIdx)  := NVL(RowQPAP.QPAH_NAMEN,' ');
		OtStrNameX(NumIdx)  := NVL(RowQPAP.QPAH_NAMEX,' ');
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--		OtStrRiritu(NumIdx) := NVL(RowQPAP.QPAH_RIRITU,' ');
--		OtStrSGendo(NumIdx) := NVL(RowQPAP.QPAH_SGENDO,' ');
--		OtStrKGendo(NumIdx) := NVL(RowQPAP.QPAH_KGENDO,' ');
--DEL 20090329 0807073/0808052 NBC YOKOYAMA END
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
		OtStrRiritu(NumIdx) := NVL(RowQPAP.QPAH_RIRITU,0);
		OtStrSGendo(NumIdx) := NVL(RowQPAP.QPAH_SGENDO,0);
		OtStrKGendo(NumIdx) := NVL(RowQPAP.QPAH_KGENDO,0);
--ADD 20090329 0807073/0808052 NBC YOKOYAMA END

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--プロシージャの終了
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt220;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt220%ISOPEN THEN
			CLOSE CurCEnt220;
		END IF;
		RAISE;

END	QPAP_CEnt220SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220DatAdd                                                                             */
/* 機能          ：その他データ登録処理                                                                           */
/******************************************************************************************************************/
/* その他データ登録処理 */
PROCEDURE QPAP_CEnt220DatAdd (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--共通コード
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--共通名称Ｎ
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE           			--共通名称Ｘ
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE            		--利率
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--証書限度額
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE         			--小口限度額
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF	  		OUT	 	CHAR) IS										--データ重複フラグ

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--テーブル名
	recMsg.fldKousinKBN	:= '1';													--更新区分
	recMsg.fldAcsKey	:= InStrCode;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt220DataChkの呼び出し */
	R_Ans := QPAP_CEnt220DataChk(InStrCode);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  その他データ登録  */
	INSERT INTO QPAH_OTHERM VALUES (
		 InStrCode					        									--共通コード
		,InStrNameN																--共通名称Ｎ
		,InStrNameX																--共通名称Ｘ
		,InStrRiritu															--利率
		,InStrSGendo															--証書限度額
		,InStrKGendo);															--小口限度額


	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）その他マスタの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）その他マスタの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220DatUpd                                                                             */
/* 機能          ：その他マスタの更新                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220DatUpd (
	 InStrCode_B      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--共通コード修正前
	,InStrCode_A      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE    		        --共通コード修正後
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--共通名称Ｎ
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE          		 	--共通名称Ｘ
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE         			--利率
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--証書限度額
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE        		 	--小口限度額
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2    									--担当名（オペログ用）
	,OtStrDupF	  		OUT		CHAR) IS										--データ重複フラグ

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrCode_A;											--更新キー

	OtStrDupF := '0';
	IF InStrCode_B <> InStrCode_A THEN
		/* QPAP_CEnt220DataChkの呼び出し */
		R_Ans := QPAP_CEnt220DataChk(InStrCode_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* その他マスタの更新 */
	UPDATE QPAH_OTHERM SET
		 	QPAH_PRMCODE 	=	InStrCode_A										--共通コード修正後
			,QPAH_NAMEN		=	InStrNameN										--共通名称Ｎ
			,QPAH_NAMEX		=	InStrNameX										--共通名称Ｘ
			,QPAH_RIRITU	=	InStrRiritu										--利率
			,QPAH_SGENDO	=	InStrSGendo										--証書限度額
			,QPAH_KGENDO	=	InStrKGendo										--小口限度額
	WHERE	QPAH_PRMCODE	= 	InStrCode_B;									--更新キー 共通コード修正前

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）その他マスタの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || 'その他マスタの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220Del                                                                                */
/* 機能          ：その他マスタの削除                                                                             */
/******************************************************************************************************************/
/*その他データ削除処理 */
PROCEDURE QPAP_CEnt220DatDel (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE	        		--共通コード
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2) IS   									--担当名（オペログ用）

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr		        NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--テーブル名
	recMsg.fldKousinKBN	:= '3';													--更新区分
	recMsg.fldAcsKey	:= InStrCode;											--更新キー

	/* その他マスタの削除 */
	DELETE FROM    QPAH_OTHERM
	       WHERE   QPAH_PRMCODE = InStrCode;


	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）その他マスタの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）その他マスタの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt22ODataChk     					                                   					  */
/* 機能          ：その他マスタに同じデータがあるかチェック処理    			 	                      			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt220DataChk(
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE)	      			--共通コード
	 RETURN BOOLEAN IS

	OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAH_OTHERM
	WHERE	QPAH_PRMCODE = InStrCode;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;							--登録されている
	ELSE
		RETURN  FALSE;							--登録されていない
	END IF;

END	QPAP_CEnt220DataChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220OpeLog                                				        					  */
/* 機能          ：オペログへの追加                                                 			       			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt220OpeLog(
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
			RAISE;																/* オペログのエラーを認める */
END  QPAP_CEnt220OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220Lock                                                                               */
/* 機能          ：その他マスタのロック                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* その他マスタの確認 */
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
	WHEN W_HAITADUPLICATE THEN	--その他マスタ作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt220Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--その他マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt220Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt220Lock;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt220UnLock                                                                             */
/* 機能          ：その他マスタのロック解除                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS

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

END QPAP_CEnt220UnLock;

END QPAP_CEnt220PkG;
/***END of LINE****************************************************************************************************/
/
show error
