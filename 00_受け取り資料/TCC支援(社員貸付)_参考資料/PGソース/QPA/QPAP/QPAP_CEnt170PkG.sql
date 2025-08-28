CREATE OR REPLACE PACKAGE  QPAP_CEnt170PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  					                  */
/* 業務名        ：社員貸付システム                                          					                  */
/* モジュール名  ：QPAP_CEnt170PkG                                           					                  */
/* 機能          ：自社登録内容変更処理                                     					                  */
/* 作成日        ：2001/07/10                                   					                              */
/* 作成者        ：FIP                                                       					                  */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部 				                                                									  */
/******************************************************************************************************************/

/* 自社データ取得 */
PROCEDURE QPAP_CEnt170SelList (
	 OtStrKaisyaCD		OUT		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--会社コード
	,OtStrZaimuCD		OUT		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--財務局コード
	,OtStrSyozai		OUT		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--所在地
	,OtStrKaisyaNM		OUT		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--会社名称
	,OtStrFurikomi		OUT		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--振込銀行
	,OtStrKozaNo		OUT		QPAB_JISYAM.QPAB_KOZANO%TYPE					--口座番号
	,OtStrKozaNM		OUT		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--口座名義
	,OtStrKamiStM		OUT		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--上期開始月
	,OtStrKamiStD		OUT		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--上期開始日
	,OtStrSimoStM		OUT		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--下期開始月
	,OtStrSimoStD		OUT		QPAB_JISYAM.QPAB_SIMOSTD%TYPE); 	 			--下期開始日

/* 自社データ更新処理 */
PROCEDURE QPAP_CEnt170DatUpd (
	 InStrKaisyaCD	  	IN 		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--会社コード
	,InStrZaimuCD	  	IN 		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--財務局コード
	,InStrSyozai	  	IN 		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--所在地
	,InStrKaisyaNM	 	IN 		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--会社名称
	,InStrFurikomi	 	IN 		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE					--振込銀行
	,InStrKozaNo	 	IN 		QPAB_JISYAM.QPAB_KOZANO%TYPE					--口座番号
	,InStrKozaNM	 	IN 		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--口座名義
	,InStrKamiStM	 	IN 		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--上期開始月
	,InStrKamiStD	 	IN 		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--上期開始日
	,InStrSimoStM	 	IN 		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--下期開始月
	,InStrSimoStD	  	IN 		QPAB_JISYAM.QPAB_SIMOSTD%TYPE	  				--下期開始日
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2);    									--担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt170OpeLog(
	 InStrMenuID  	  	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューＩＤ
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--プログラムＩＤ
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--東西区分
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード
	,InStrMsg	  		IN		QUS2_OpeLogT.QUS2_MSG%TYPE);					--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt170Lock(
	 InStrSikibetu	  	IN    	QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrProgramID	  	IN   	QSA4_HaitaT.QSA4_ProgramID%type					--プログラムＩＤ
	,InStrComputerNM 	IN   	QSA4_HaitaT.QSA4_ComputerMei%type				--コンピュータ名
	,InStrOperatorID  	IN    	QSA4_HaitaT.QSA4_OperatorID%type);				--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt170UnLock(
	 InStrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type					--識別コード
	,InStrComputerNM	IN 	QSA4_HaitaT.QSA4_ComputerMei%type);					--コンピューター名

END QPAP_CEnt170PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー 													  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt170PkG IS

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

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt170SelList       					                                                  */
/* 機能          ：自社データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170SelList (
	 OtStrKaisyaCD		OUT		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--会社コード
	,OtStrZaimuCD		OUT		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--財務局コード
	,OtStrSyozai		OUT		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--所在地
	,OtStrKaisyaNM		OUT		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--会社名称
	,OtStrFurikomi		OUT		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--振込銀行
	,OtStrKozaNo		OUT		QPAB_JISYAM.QPAB_KOZANO%TYPE					--口座番号
	,OtStrKozaNM		OUT		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--口座名義
	,OtStrKamiStM		OUT		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--上期開始月
	,OtStrKamiStD		OUT		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--上期開始日
	,OtStrSimoStM		OUT		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--下期開始月
	,OtStrSimoStD		OUT		QPAB_JISYAM.QPAB_SIMOSTD%TYPE) IS				--下期開始日

BEGIN

	SELECT QPAB_PRMKAISYACD,QPAB_ZAIMUKYOKUCD,QPAB_SYOZAICHI,QPAB_KAISYANM,QPAB_FURIKOMIBK,
		   QPAB_KOZANO,QPAB_KOZANM,QPAB_KAMISTM,QPAB_KAMISTD,QPAB_SIMOSTM,QPAB_SIMOSTD
	INTO   OtStrKaisyaCD,OtStrZaimuCD,OtStrSyozai,OtStrKaisyaNM,OtStrFurikomi,OtStrKozaNo,
		   OtStrKozaNM,OtStrKamiStM,OtStrKamiStD,OtStrSimoStM,OtStrSimoStD
    FROM   QPAB_JISYAM;

EXCEPTION
	WHEN	NO_DATA_FOUND THEN
		RETURN;
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt170SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt170DatUpd                							                                  */
/* 機能          ：自社マスタの更新                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170DatUpd (
	 InStrKaisyaCD		IN 		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--会社コード
	,InStrZaimuCD	   	IN 		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--財務局コード
	,InStrSyozai	   	IN 		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--所在地
	,InStrKaisyaNM	   	IN 		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--会社名称
	,InStrFurikomi	   	IN 		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--振込銀行
	,InStrKozaNo	   	IN 		QPAB_JISYAM.QPAB_KOZANO%TYPE					--口座番号
	,InStrKozaNM	   	IN 		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--口座名義
	,InStrKamiStM	   	IN 		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--上期開始月
	,InStrKamiStD	   	IN 		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--上期開始日
	,InStrSimoStM	   	IN 		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--下期開始月
	,InStrSimoStD	   	IN 		QPAB_JISYAM.QPAB_SIMOSTD%TYPE	 				--下期開始日
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--メニューID（オペログ用）
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--モジュールID（オペログ用）
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--コンピュータ名（オペログ用）
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--利用区分（オペログ用）
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--部署コード（オペログ用）
	,InStrTantoNM	   	IN		VARCHAR2) IS									--担当名（オペログ用）

	 numStep			NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAB_JISYAM';										--テーブル名
	recMsg.fldKousinKBN	:= '1';													--更新区分
	recMsg.fldAcsKey	:= InStrKaisyaCD;										--更新キー

	/* 自社マスタの更新 */
	UPDATE QPAB_JISYAM SET
		 	QPAB_ZAIMUKYOKUCD	=	InStrZaimuCD								--財務局コード
			,QPAB_SYOZAICHI		=	InStrSyozai									--所在地
			,QPAB_KAISYANM		=	InStrKaisyaNM								--会社名称
			,QPAB_FURIKOMIBK	=	InStrFurikomi								--振込銀行
			,QPAB_KOZANO		=	InStrKozaNo									--口座番号
			,QPAB_KOZANM		=	InStrKozaNM									--口座名義
			,QPAB_KAMISTM		=	InStrKamiStM								--上期開始月
			,QPAB_KAMISTD		=	InStrKamiStD								--上期開始日
			,QPAB_SIMOSTM		=	InStrSimoStM								--下期開始月
			,QPAB_SIMOSTD		=	InStrSimoStD								--下期開始日
	WHERE	QPAB_PRMKAISYACD	= 	InStrKaisyaCD;								--更新キー 会社コード

	/* オペレーションログ出力 */
	numStep := 1;								/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）自社マスタの修正を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt170OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）自社マスタの修正に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
	QPAP_CEnt170OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt170DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt170OpeLog   				                        	                              */
/* 機能          ：オペログへの追加                                            					                  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt170OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					/* メニューＩＤ   */
	,InStrModuleID     	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					/* プログラムＩＤ */
	,InStrUserID  	   	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					/* ユーザＩＤ     */
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				/* コンピュータ   */
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				/* 東西区分       */
	,InStrBushoCD	   	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					/* 部署コード     */
	,InStrMsg	   		IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS					/* メッセージ     */
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
			RAISE ;																/* オペログのエラーを認める */
END  QPAP_CEnt170OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt170Lock                          					                                  */
/* 機能          ：自社マスタのロック                                        					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 自社マスタの確認 */
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
	WHEN W_HAITADUPLICATE THEN	--自社マスタ作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt170Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--自社マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt170Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt170Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt170UnLock                                                          					  */
/* 機能          ：自社マスタのロック解除                                                    					  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170UnLock(
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

END QPAP_CEnt170UnLock;

END QPAP_CEnt170PkG;
/
show error
