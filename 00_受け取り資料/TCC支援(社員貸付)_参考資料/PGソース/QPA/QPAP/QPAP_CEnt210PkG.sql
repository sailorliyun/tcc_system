CREATE OR REPLACE PACKAGE  QPAP_CEnt210PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt210PkG                                                                                */
/* 機能          ：社員マスタメンテナンス                                                                         */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部  													                                                  */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtSyainCD1Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyainCD2Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSimeiKanaAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANA%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSimeiKanjiAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtTozaiKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanCDAry IS TABLE OF QPAD_SYASEIM.QPAD_SEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSikakuCDAry IS TABLE OF QPAC_SYAINM.QPAC_SIKAKUCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtTokyuCDAry IS TABLE OF QPAC_SYAINM.QPAC_TOKYUCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBornYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtTaisyokuYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyusyoStAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyusyoEdAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	/* コンボ店コード・名称用配列 */
	TYPE typOtMiseCDListAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMListAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	/* コンボ部門コード・名称用配列 */
	TYPE typOtBumonCDListAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMListAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	/* コンボ精算店コード・名称用配列 */
	TYPE typOtSeisanCDListAry IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanNMListAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* 社員データ取得 */
PROCEDURE QPAP_CEnt210SelList (
	 InStrSyainCDF		IN      	CHAR										--社員コード2入力フラグ
    ,InStrMiseCDF       IN      	CHAR										--所属店コード入力フラグ
    ,InStrBumonCDF      IN     		CHAR										--所属部門コード入力フラグ
    ,InStrSeisanCDF     IN      	CHAR										--精算店コード入力フラグ
    ,InStrTaiKyuKBNF    IN      	CHAR										--退/休区分入力フラグ
	,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--検索用社員コード2
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--検索用所属店コード
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--検索用所属部門コード
    ,InStrSeisanCD     	IN      	QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--検索用精算店コード
    ,InStrTaiKyuKBN    	IN      	CHAR										--検索用退/休区分
	,InNumMaxRec		IN			NUMBER										--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  	NUMBER										--呼び出し回数
	,OtStrSyainCD1     	OUT     	typOtSyainCD1Ary							--社員コード1
    ,OtStrSyainCD2     	OUT     	typOtSyainCD2Ary							--社員コード2
    ,OtStrSimeiKana    	OUT     	typOtSimeiKanaAry							--氏名カナ
    ,OtStrSimeiKanji   	OUT     	typOtSimeiKanjiAry							--氏名漢字
    ,OtStrMiseCD       	OUT     	typOtMiseCDAry								--所属店コード
    ,OtStrMiseNM       	OUT     	typOtMiseNMAry								--所属名称
    ,OtStrTozaiKBN     	OUT     	typOtTozaiKBNAry							--東西区分
    ,OtStrBumonCD      	OUT     	typOtBumonCDAry								--所属部門コード
    ,OtStrBumonNM      	OUT     	typOtBumonNMAry								--所属部門名称
    ,OtStrSeisanCD     	OUT     	typOtSeisanCDAry     						--精算店コード
    ,OtStrSikakuCD     	OUT     	typOtSikakuCDAry							--資格コード
    ,OtStrTokyuCD      	OUT     	typOtTokyuCDAry								--等級コード
    ,OtStrBornYMD      	OUT     	typOtBornYMDAry								--生年月日
    ,OtStrTaisyokuYMD  	OUT     	typOtTaisyokuYMDAry							--退職年月日
    ,OtStrKyusyoStYMD  	OUT     	typOtKyusyoStAry							--休職年月開始日
    ,OtStrKyusyoEdYMD  	OUT     	typOtKyusyoEdAry							--休職終了年月日
	,OtNumAryCount	   	OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	   	OUT			VARCHAR2);									--検索終了フラグ

/* 店コード取得 */
 PROCEDURE QPAP_CEnt210MiseList (
	 InNumMaxRec		IN			NUMBER										--最大配列格納件数
    ,OtStrMiseCD       	OUT     	typOtMiseCDListAry							--所属店コード
    ,OtStrMiseNM       	OUT     	typOtMiseNMListAry							--所属名称
	,OtNumAryCount	   	OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	   	OUT			VARCHAR2);									--検索終了フラグ

/* 部門コード取得 */
 PROCEDURE QPAP_CEnt210BumonList (
     InStrMiseCD       	IN      	QPAE_MISEM.QPAE_PRMMISECD%TYPE				--条件用所属店コード
	,InNumMaxRec		IN			NUMBER										--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  	NUMBER										--呼び出し回数
    ,OtStrBumonCD       OUT     	typOtBumonCDListAry							--所属部門コード
    ,OtStrBumonNM       OUT     	typOtBumonNMListAry							--所属部門名称
	,OtNumAryCount	   	OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	   	OUT			VARCHAR2);									--検索終了フラグ

/* 精算店コード取得 */
 PROCEDURE QPAP_CEnt210SeisanList (
	 InNumMaxRec		IN			NUMBER										--最大配列格納件数
    ,OtStrSeisanCD     	OUT     	typOtSeisanCDListAry						--精算店コード
    ,OtStrSeisanNM     	OUT     	typOtSeisanNMListAry						--精算店名称
	,OtNumAryCount	   	OUT			NUMBER										--配列格納件数
	,OtStrEndFlg	   	OUT			VARCHAR2);									--検索終了フラグ

/* 社員データ登録処理 */
PROCEDURE QPAP_CEnt210DatAdd (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--社員コード1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--社員コード2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--氏名カナ
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--氏名漢字
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--所属店コード
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--社精マスタ登録用精算コード
	,InStrTozaiKBN     	IN	    	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--東西区分
    ,InStrBumonCD      	IN 		    QPAC_SYAINM.QPAC_BUMONCD%TYPE				--所属部門コード
    ,InStrSikakuCD     	IN          QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--資格コード
    ,InStrTokyuCD      	IN          QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--等級コード
    ,InStrBornYMD      	IN      	CHAR										--生年月日
    ,InStrTaisyokuYMD  	IN      	CHAR										--退職年月日
    ,InStrKyusyoStYMD  	IN      	CHAR										--休職年月開始日
    ,InStrKyusyoEdYMD  	IN      	CHAR										--休職終了年月日
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT			CHAR);										--データ重複フラグ

/* 社員データ更新処理 */
PROCEDURE QPAP_CEnt210DatUpd (
	 InStrSyainCD1_B    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--修正前社員コード1
	,InStrSyainCD1_A    IN   	   	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--修正後社員コード1
    ,InStrSyainCD2_B    IN     	 	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--修正前社員コード2
    ,InStrSyainCD2_A    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--修正後社員コード2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--氏名カナ
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--氏名漢字
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--所属店コード
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--社精マスタ登録用精算コード
    ,InStrTozaiKBN     	IN      	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--東西区分
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--所属部門コード
    ,InStrSikakuCD     	IN      	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--資格コード
    ,InStrTokyuCD      	IN      	QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--等級コード
    ,InStrBornYMD      	IN      	CHAR										--生年月日
    ,InStrTaisyokuYMD  	IN      	CHAR										--退職年月日
    ,InStrKyusyoStYMD  	IN      	CHAR										--休職年月開始日
    ,InStrKyusyoEdYMD  	IN      	CHAR										--休職終了年月日
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT			CHAR);										--データ重複フラグ

/* 社員データ削除処理 */
PROCEDURE QPAP_CEnt210DatDel (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--社員コード1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--社員コード2
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKbn	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
    ,InStrSeisanF     	IN     		CHAR);										--精算店コード

/* 社員マスタに同じデータが登録されているかチェック */
FUNCTION  QPAP_CEnt210DataChk(
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--社員コード1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE)			--社員コード2
	 RETURN BOOLEAN;

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt210OpeLog(
	 InStrMenuID      	IN	 		QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleID    	IN	 		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserID  	  	IN	 		QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerNM 	IN	 		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTozaiKBN	  	IN	 		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCD	  	IN	 		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg	  		IN	 		QUS2_OpeLogT.QUS2_MSG%TYPE);	 			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt210Lock(
	 InStrSikibetu		IN 			QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrProgramID		IN 			QSA4_HaitaT.QSA4_ProgramID%type				--プログラムＩＤ
	,InStrComputerNM	IN 			QSA4_HaitaT.QSA4_ComputerMei%type			--コンピュータ名
	,InStrOperatorID	IN 			QSA4_HaitaT.QSA4_OperatorID%type);			--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt210UnLock(
	 InStrSikibetu		IN 			QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrComputerNM	IN 			QSA4_HaitaT.QSA4_ComputerMei%type);			--コンピューター名

END QPAP_CEnt210PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー  												                                                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt210PkG IS
	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	   RECORD (
		fldTableID	       	CHAR(19),											/* テーブル名   */
		fldKousinKBN	  	CHAR(1),		        							/* 更新区分     */
		fldAcsKey	   		CHAR(50),											/* アクセスキー */
		fldMsg		   		CHAR(100)											/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* 検索完了時のみ開放するカーソル */
	CURSOR CurCEnt210_M IS
		SELECT	 QPAE_PRMMISECD,QPAE_MISENM
		FROM	 QPAE_MISEM
		ORDER BY QPAE_PRMMISECD;

	CURSOR CurCEnt210_S IS
		SELECT	 QPAG_PRMSEISANCD,QPAG_SEISANNM
		FROM	 QPAG_SEISANM
		ORDER BY QPAG_PRMSEISANCD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210SelList                                                                            */
/* 機能          ：社員データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210SelList (
	 InStrSyainCDF		IN      CHAR											--社員コード2入力フラグ
    ,InStrMiseCDF       IN      CHAR											--所属店コード入力フラグ
    ,InStrBumonCDF      IN      CHAR											--所属部門コード入力フラグ
    ,InStrSeisanCDF     IN      CHAR											--精算店コード入力フラグ
    ,InStrTaiKyuKBNF    IN      CHAR											--退/休区分入力フラグ
	,InStrSyainCD2     	IN      QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE				--検索用社員コード2
    ,InStrMiseCD       	IN      QPAC_SYAINM.QPAC_MISECD%TYPE					--検索用所属店コード
    ,InStrBumonCD      	IN      QPAC_SYAINM.QPAC_BUMONCD%TYPE					--検索用所属部門コード
    ,InStrSeisanCD     	IN      QPAD_SYASEIM.QPAD_SEISANCD%TYPE					--検索用精算店コード
    ,InStrTaiKyuKBN    	IN      CHAR											--検索用退/休区分
	,InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  NUMBER											--呼び出し回数
	,OtStrSyainCD1     	OUT     typOtSyainCD1Ary								--社員コード1
    ,OtStrSyainCD2     	OUT     typOtSyainCD2Ary								--社員コード2
    ,OtStrSimeiKana    	OUT     typOtSimeiKanaAry								--氏名カナ
    ,OtStrSimeiKanji   	OUT     typOtSimeiKanjiAry								--氏名漢字
    ,OtStrMiseCD       	OUT     typOtMiseCDAry									--所属店コード
    ,OtStrMiseNM       	OUT     typOtMiseNMAry									--所属名称
    ,OtStrTozaiKBN     	OUT     typOtTozaiKBNAry								--東西区分
    ,OtStrBumonCD      	OUT     typOtBumonCDAry									--所属部門コード
    ,OtStrBumonNM      	OUT     typOtBumonNMAry									--所属部門名称
    ,OtStrSeisanCD     	OUT     typOtSeisanCDAry     							--精算店コード
    ,OtStrSikakuCD     	OUT     typOtSikakuCDAry								--資格コード
    ,OtStrTokyuCD      	OUT     typOtTokyuCDAry									--等級コード
    ,OtStrBornYMD      	OUT     typOtBornYMDAry									--生年月日
    ,OtStrTaisyokuYMD  	OUT     typOtTaisyokuYMDAry								--退職年月日
    ,OtStrKyusyoStYMD  	OUT     typOtKyusyoStAry								--休職年月開始日
    ,OtStrKyusyoEdYMD  	OUT     typOtKyusyoEdAry								--休職終了年月日
	,OtNumAryCount	   	OUT		NUMBER											--配列格納件数
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;													--配列用IDX
	NumFetchCnt			NUMBER;													--FETCHカウント
	v_CursorID			INTEGER;												--カーソルID
	v_SelectStmt		VARCHAR2(1000);											--SQL文字列
	v_WhereStmt			VARCHAR2(500);											--SQL文字列
	v_SyainCD1     		QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE;						--バインド用社員コード1
	v_SyainCD2     		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE;						--バインド用社員コード2
	v_SimeiKana    		QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;						--バインド用氏名カナ
	v_SimeiKanji   		QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;						--バインド用氏名漢字
	v_MiseCD       		QPAC_SYAINM.QPAC_MISECD%TYPE;							--バインド用所属店コード
	v_MiseNM			QPAE_MISEM.QPAE_MISENM%TYPE;							--バインド用所属店名称
	v_TozaiKBN     		QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;							--バインド用東西区分
	v_BumonCD      		QPAC_SYAINM.QPAC_BUMONCD%TYPE;							--バインド用所属部門コード
    v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--バインド用所属部門名称
	v_SeisanCD      	QPAD_SYASEIM.QPAD_SEISANCD%TYPE;      					--バインド用精算店コード
	v_SikakuCD     		QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;							--バインド用資格コード
	v_TokyuCD      		QPAC_SYAINM.QPAC_TOKYUCD%TYPE;							--バインド用等級コード
	v_BornYMD      		CHAR(8);												--バインド用生年月日
	v_TaisyokuYMD  		CHAR(8);												--バインド用退職年月日
	v_KyusyoStYMD  		CHAR(8);												--バインド用休職年月開始日
	v_KyusyoEdYMD  		CHAR(8);												--バインド用休職終了年月日
	v_Dummy				INTEGER;												--Dummy


BEGIN

	NumIdx		:= 0;
	OtstrEndFlg	:= '0';

	IF IoNumSpCnt = 0 THEN
		--処理時に使用するカーソルをオープンする
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--問合せ文字列の作成
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  C.QPAC_PRMSYAINCD1,C.QPAC_PRMSYAINCD2,C.QPAC_SIMEIKANA,
					              C.QPAC_SIMEIKANJI,C.QPAC_MISECD,E.QPAE_MISENM,C.QPAC_TOZAIKBN,
					              C.QPAC_BUMONCD,F.QPAF_BUMONNM,D.QPAD_SEISANCD,C.QPAC_SIKAKUCD,
					              C.QPAC_TOKYUCD,TO_CHAR(C.QPAC_BORNYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_KYUSYOEDYMD,''YYYYMMDD'')
				 		 FROM 	  QPAC_SYAINM C,QPAD_SYASEIM D,QPAE_MISEM E,QPAF_BUMONM F
				         WHERE    C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)
				         AND      C.QPAC_MISECD  = F.QPAF_PRMMISECD (+)
				         AND      C.QPAC_MISECD  = E.QPAE_PRMMISECD (+)
				         AND      C.QPAC_PRMSYAINCD1 = D.QPAD_PRMSYAINCD1 (+)
				         AND      C.QPAC_PRMSYAINCD2 = D.QPAD_PRMSYAINCD2 (+)';

		 --条件の連結
	    v_WhereStmt := NULL;

		IF InStrSyainCDF = '1' THEN
			v_WhereStmt := ' AND C.QPAC_PRMSYAINCD2 = :SyainCD2';
		END IF;

		IF InStrMiseCDF = '1' THEN
			v_WhereStmt := v_WhereStmt || ' AND C.QPAC_MISECD = :MiseCD';
		END IF;

		IF InStrBumonCDF = '1' THEN
			v_WhereStmt :=  v_WhereStmt || ' AND C.QPAC_BUMONCD = :BumonCD';
		END IF;

		IF InStrSeisanCDF = '1' THEN
			v_WhereStmt := v_WhereStmt || ' AND D.QPAD_SEISANCD = :SeisanCD';
		END IF;

		IF InStrTaiKyuKBNF = '1' THEN
			IF InStrTaiKyuKBN = '0' THEN						--退職
				v_WhereStmt := v_WhereStmt || ' AND (C.QPAC_TAISYOKUYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') <> :TaikyuKBN)';
			ELSIF InStrTaiKyuKBN = '1' THEN						--休職
				v_WhereStmt := v_WhereStmt || ' AND (C.QPAC_KYUSYOSTYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD'') <> :TaikyuKBN)';
			ELSIF InStrTaiKyuKBN = '2' THEN						--退休職
				v_WhereStmt := v_WhereStmt || ' AND ((C.QPAC_TAISYOKUYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') <> :TaikyuKBN)';
				v_WhereStmt := v_WhereStmt || ' OR (C.QPAC_KYUSYOSTYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD'') <> :TaikyuKBN))';
			END IF;
		END IF;
		v_WhereStmt := v_WhereStmt || ' ORDER BY C.QPAC_PRMSYAINCD2';
		v_SelectStmt := v_SelectStmt || v_WhereStmt;

		/* データの取得 */
		--処理時に使用するカーソルをオープンする
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--問合せを解析する
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--入力変数をバインドする
		IF InStrSyainCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyainCD2',InStrSyainCD2);
		END IF;

		IF InStrMiseCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':MiseCD',InStrMiseCD);
		END IF;

		IF InStrBumonCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':BumonCD',InStrBumonCD);
		END IF;

		IF InStrSeisanCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':SeisanCD',InStrSeisanCD);
		END IF;

		IF InStrTaiKyuKBNF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaikyuKBN','');
		END IF;

		--実行する
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;
	IoNumSpCnt := v_CursorID;

	--出力変数を定義する
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SimeiKana,15);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_SimeiKanji,20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SeisanCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SikakuCD,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_TokyuCD,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_BornYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_TaisyokuYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_KyusyoStYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_KyusyoEdYMD,8);

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
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SimeiKana);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_SimeiKanji);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SeisanCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SikakuCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_TokyuCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_BornYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_TaisyokuYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_KyusyoStYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_KyusyoEdYMD);

		OtStrSyainCD1(NumIdx)    := NVL(v_SyainCD1,' ');
		OtStrSyainCD2(NumIdx)    := NVL(v_SyainCD2,' ');
		OtStrSimeiKana(NumIdx)   := NVL(v_SimeiKana,' ');
		OtStrSimeiKanji(NumIdx)  := NVL(v_SimeiKanji,' ');
		OtStrMiseCD(NumIdx)      := NVL(v_MiseCD,' ');
		OtStrMiseNM(NumIdx)      := NVL(v_MiseNM,' ');
		OtStrTozaiKBN(NumIdx)    := NVL(v_TozaiKBN,' ');
		OtStrBumonCD(NumIdx)     := NVL(v_BumonCD,' ');
		OtStrBumonNM(NumIdx)     := NVL(v_BumonNM,' ');
		OtStrSeisanCD(NumIdx)    := NVL(v_SeisanCD,' ');
		OtStrSikakuCD(NumIdx)    := NVL(v_SikakuCD,' ');
		OtStrTokyuCD(NumIdx)     := NVL(v_TokyuCD,' ');
		OtStrBornYMD(NumIdx)     := NVL(v_BornYMD,' ');
		OtStrTaisyokuYMD(NumIdx) := NVL(v_TaisyokuYMD,' ');
		OtStrKyusyoStYMD(NumIdx) := NVL(v_KyusyoStYMD,' ');
		OtStrKyusyoEdYMD(NumIdx) := NVL(v_KyusyoEdYMD,' ');

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
		RAISE;

END	QPAP_CEnt210SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210MiseList                                                                           */
/* 機能          ：店コード取得処理                                                                               */
/******************************************************************************************************************/
/* 店コード取得 */
 PROCEDURE QPAP_CEnt210MiseList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
    ,OtStrMiseCD       	OUT     typOtMiseCDListAry								--所属店コード
    ,OtStrMiseNM       	OUT     typOtMiseNMListAry								--所属名称
	,OtNumAryCount	   	OUT		NUMBER											--配列格納件数
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;

	/* 行変数 */
	RowQPAP				CurCEnt210_M%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--カーソルオープン
	IF CurCEnt210_M%ISOPEN = FALSE THEN
		OPEN CurCEnt210_M();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt210_M INTO RowQPAP;										--順読み

		IF CurCEnt210_M%NOTFOUND THEN
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
			RETURN;																--プロシージャの終了
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt210_M;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt210_M%ISOPEN THEN
			CLOSE CurCEnt210_M;
		END IF;
		RAISE;
END	QPAP_CEnt210MiseList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210BumonList                                                                          */
/* 機能          ：部門コード取得処理                                                                             */
/******************************************************************************************************************/
 PROCEDURE QPAP_CEnt210BumonList (
     InStrMiseCD       	IN      QPAE_MISEM.QPAE_PRMMISECD%TYPE					--条件用所属店コード
	,InNumMaxRec		IN		NUMBER											--最大配列格納件数
	,IoNumSpCnt	   		IN OUT  NUMBER											--呼び出し回数
    ,OtStrBumonCD       OUT     typOtBumonCDListAry								--所属部門コード
    ,OtStrBumonNM       OUT     typOtBumonNMListAry								--所属部門名称
	,OtNumAryCount	   	OUT		NUMBER											--配列格納件数
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;													--配列用IDX
	v_CursorID			INTEGER;												--カーソルID
	v_SelectStmt		VARCHAR2(1000);											--SQL文字列
	v_MiseCD       		QPAC_SYAINM.QPAC_MISECD%TYPE;							--バインド用所属店コード
	v_BumonCD      		QPAC_SYAINM.QPAC_BUMONCD%TYPE;							--バインド用所属部門コード
    v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--バインド用所属部門名称
	v_Dummy				INTEGER;												--Dummy

BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	IF IoNumSpCnt = 0 THEN
		--処理時に使用するカーソルをオープンする
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--問合せ文字列の作成
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  QPAF_PRMBUMONCD,QPAF_BUMONNM
				 FROM 	  QPAF_BUMONM
				 WHERE    QPAF_PRMMISECD = :MiseCD';

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

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--プロシージャの終了
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE;

END	QPAP_CEnt210BumonList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210SeisanList                                                                         */
/* 機能          ：精算店コード取得処理                                                                           */
/******************************************************************************************************************/
/* 精算店コード取得 */
 PROCEDURE QPAP_CEnt210SeisanList (
	 InNumMaxRec		IN		NUMBER											--最大配列格納件数
    ,OtStrSeisanCD      OUT     typOtSeisanCDListAry							--精算店コード
    ,OtStrSeisanNM      OUT     typOtSeisanNMListAry							--精算店名称
	,OtNumAryCount	   	OUT		NUMBER											--配列格納件数
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--検索終了フラグ

	/* 処理固有の変数 */
	NumIdx				NUMBER;

	/* 行変数 */
	RowQPAP				CurCEnt210_S%ROWTYPE;
BEGIN

	OtstrEndFlg := '0';
	NumIdx := 0;

	--カーソルオープン
	IF CurCEnt210_S%ISOPEN = FALSE THEN
		OPEN CurCEnt210_S();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		NumIdx := NumIdx + 1;

		/* 100ごとのデータを取得 */
		FETCH CurCEnt210_S INTO RowQPAP;										--順読み

		IF CurCEnt210_S%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--検索終了
			EXIT;
		END IF;

		/* 取得データを配列に代入*/
		OtStrSeisanCD(NumIdx)  := RowQPAP.QPAG_PRMSEISANCD;
		OtStrSeisanNM(NumIdx)  := RowQPAP.QPAG_SEISANNM;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--プロシージャの終了
		END IF;
	END LOOP;

	/* カーソルのクローズ */
	CLOSE CurCEnt210_S;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt210_S%ISOPEN THEN
			CLOSE CurCEnt210_S;
		END IF;
		RAISE;
END	QPAP_CEnt210SeisanList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210DatAdd                                                                             */
/* 機能          ：社員データ登録処理                                                                             */
/******************************************************************************************************************/
/* 社員データ登録処理 */
PROCEDURE QPAP_CEnt210DatAdd (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--社員コード1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--社員コード2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--氏名カナ
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--氏名漢字
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--所属店コード
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--社精マスタ登録用精算コード
	,InStrTozaiKBN     	IN	    	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--東西区分
    ,InStrBumonCD      	IN 		    QPAC_SYAINM.QPAC_BUMONCD%TYPE				--所属部門コード
    ,InStrSikakuCD     	IN          QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--資格コード
    ,InStrTokyuCD      	IN          QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--等級コード
    ,InStrBornYMD      	IN      	CHAR										--生年月日
    ,InStrTaisyokuYMD  	IN      	CHAR										--退職年月日
    ,InStrKyusyoStYMD  	IN      	CHAR										--休職年月開始日
    ,InStrKyusyoEdYMD  	IN      	CHAR										--休職終了年月日
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT			CHAR) IS									--データ重複フラグ

	numStep				NUMBER   := 0;											/* 処理ステップ  */
	numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	strErrMsg			VARCHAR2(100);											/* SQLERRMの退避 */
	recMsg				typMsg;
	strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	R_Ans			  	BOOLEAN;

BEGIN

	/* オペレーションログ設定 */
	 recMsg.fldTableID := 'QPAC_SYAINM';		    							--テーブル名
	 recMsg.fldKousinKBN := '1';												--更新区分
	 recMsg.fldAcsKey := InStrSyainCD2;											--更新キー

	OtStrDupF := '0';
	/* QPAP_CEnt210DataChkの呼び出し */
	R_Ans := QPAP_CEnt210DataChk(InStrSyainCD1,InStrSyainCD2);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  社員データ登録（社員マスタ）  */
	INSERT INTO QPAC_SYAINM VALUES (
		 InStrSyainCD1															--社員コード1
        ,InStrSyainCD2															--社員コード2
        ,InStrSimeiKana															--氏名カナ
        ,InStrSimeiKanji														--氏名漢字
        ,InStrMiseCD															--所属店コード
        ,InStrTozaiKBN															--東西区分
        ,InStrBumonCD															--所属部門コード
        ,InStrSikakuCD															--資格コード
        ,InStrTokyuCD															--等級コード
        ,InStrBornYMD															--生年月日
        ,InStrTaisyokuYMD														--退職年月日
        ,InStrKyusyoStYMD														--休職年月開始日
        ,InStrKyusyoEdYMD);														--休職終了年月日

	/*  精算コード登録（社精マスタ）  */
	INSERT INTO QPAD_SYASEIM VALUES (
		 InStrSyainCD1															--社員コード1
	    ,InStrSyainCD2															--社員コード2
	    ,InStrSeisanCD);														--精算コード


/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの登録を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrOpeTozaiKBN,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrOpeTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210DatUpd                                                                             */
/* 機能          ：社員マスタの更新                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210DatUpd (
	 InStrSyainCD1_B    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--修正前社員コード1
	,InStrSyainCD1_A    IN   	   	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--修正後社員コード1
    ,InStrSyainCD2_B    IN     	 	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--修正前社員コード2
    ,InStrSyainCD2_A    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--修正後社員コード2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--氏名カナ
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--氏名漢字
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--所属店コード
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--社精マスタ登録用精算コード
    ,InStrTozaiKBN     	IN      	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--東西区分
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--所属部門コード
    ,InStrSikakuCD     	IN      	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--資格コード
    ,InStrTokyuCD      	IN      	QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--等級コード
    ,InStrBornYMD      	IN      	CHAR										--生年月日
    ,InStrTaisyokuYMD  	IN      	CHAR										--退職年月日
    ,InStrKyusyoStYMD  	IN      	CHAR										--休職年月開始日
    ,InStrKyusyoEdYMD  	IN      	CHAR										--休職終了年月日
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
	,OtStrDupF	  		OUT			CHAR) IS									--データ重複フラグ

	numStep		        NUMBER   := 0;											/* 処理ステップ  */
	numErr			    NUMBER   := 0;											/* SQLCODEの退避 */
	strErrMsg		    VARCHAR2(100);											/* SQLERRMの退避 */
	recMsg			    typMsg;
	strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
    CNT					NUMBER := 0;
	R_Ans			  	BOOLEAN;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAC_SYAINM';										--テーブル名
	recMsg.fldKousinKBN	:= '2';													--更新区分
	recMsg.fldAcsKey	:= InStrSyainCD2_A;										--更新キー

	IF InStrSyainCD1_A <> InStrSyainCD1_B THEN
		IF InStrSyainCD2_A <> InStrSyainCD2_B THEN
			/* QPAP_CEnt210DataChkの呼び出し */
			R_Ans := QPAP_CEnt210DataChk(InStrSyainCD1_A,InStrSyainCD2_A);
			IF R_Ans = TRUE THEN
				OtStrDupF := '1';
				RETURN;
			END IF;
		END IF;
	END IF;

	/* 社員マスタの更新（社員マスタ） */
	UPDATE QPAC_SYAINM SET
		 	QPAC_PRMSYAINCD1	=	InStrSyainCD1_A								--社員コード1
        	,QPAC_PRMSYAINCD2	=	InStrSyainCD2_A								--社員コード2
	        ,QPAC_SIMEIKANA		=	InStrSimeiKana								--氏名カナ
	        ,QPAC_SIMEIKANJI	=	InStrSimeiKanji								--氏名漢字
	        ,QPAC_MISECD		=	InStrMiseCD									--所属店コード
	        ,QPAC_TOZAIKBN		=	InStrTozaiKBN								--東西区分
	        ,QPAC_BUMONCD		= 	InStrBumonCD								--所属部門コード
	        ,QPAC_SIKAKUCD		=	InStrSikakuCD								--資格コード
	        ,QPAC_TOKYUCD		=	InStrTokyuCD      							--等級コード
	        ,QPAC_BORNYMD		=	InStrBornYMD								--生年月日
	        ,QPAC_TAISYOKUYMD	=	InStrTaisyokuYMD							--退職年月日
	        ,QPAC_KYUSYOSTYMD	=	InStrKyusyoStYMD							--休職年月開始日
	        ,QPAC_KYUSYOEDYMD	=	InStrKyusyoEdYMD							--休職終了年月日
	WHERE	 QPAC_PRMSYAINCD1	= 	InStrSyainCD1_B								--更新キー 店コード,部門コード
	AND      QPAC_PRMSYAINCD2   =   InStrSyainCD2_B;

	SELECT
		COUNT(*)
	INTO
		CNT
	FROM	QPAD_SYASEIM
	WHERE	QPAD_PRMSYAINCD1	=	InStrSyainCD1_B
	AND	QPAD_PRMSYAINCD2	=	InStrSyainCD2_B;

	IF CNT = 0 THEN
		/*  精算コード登録（社精マスタ）新規  */
		INSERT INTO QPAD_SYASEIM VALUES (
		 	InStrSyainCD1_A														--社員コード1
	        ,InStrSyainCD2_A													--社員コード2
	        ,InStrSeisanCD);													--精算コード
	ELSE
		/*  精算コード登録（社精マスタ）変更  */
		UPDATE QPAD_SYASEIM SET
			 	QPAD_PRMSYAINCD1	=	InStrSyainCD1_A							--社員コード1
				,QPAD_PRMSYAINCD2	=	InStrSyainCD2_A							--社員コード2
		        ,QPAD_SEISANCD		=	InStrSeisanCD							--精算コード
		WHERE	QPAD_PRMSYAINCD1	= 	InStrSyainCD1_B							--更新キー 店コード,部門コード
		AND     QPAD_PRMSYAINCD2    =   InStrSyainCD2_B;
	END IF;

	/*  オペログ */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの更新を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrOpeTozaiKBN,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの更新に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrOpeTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210Del                                                                                */
/* 機能          ：社員マスタの削除                                                                               */
/******************************************************************************************************************/
/*社員データ削除処理 */
PROCEDURE QPAP_CEnt210DatDel (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--社員コード1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--社員コード2
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューID（オペログ用）
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--モジュールID（オペログ用）
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ（オペログ用）
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名（オペログ用）
	,InStrTozaiKbn	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--利用区分（オペログ用）
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード（オペログ用）
	,InStrTantoNM	   	IN			VARCHAR2    								--担当名（オペログ用）
    ,InStrSeisanF     	IN     		CHAR) IS									--精算店コード

	 numStep		    NUMBER   := 0;											/* 処理ステップ  */
	 numErr				NUMBER   := 0;											/* SQLCODEの退避 */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRMの退避 */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPAC_SYAINM';										--テーブル名
	recMsg.fldKousinKBN	:= '3';													--更新区分
	recMsg.fldAcsKey	:= InStrSyainCD2;										--更新キー

	/* 社員マスタの削除 */
	DELETE FROM QPAC_SYAINM
		WHERE	QPAC_PRMSYAINCD1 = InStrSyainCD1
		  AND	QPAC_PRMSYAINCD2 = InStrSyainCD2;

	IF InStrSeisanF <> '0' THEN
		/* 社清マスタの削除 */
		DELETE FROM QPAD_SYASEIM
			WHERE	QPAD_PRMSYAINCD1 = InStrSyainCD1
			AND	QPAD_PRMSYAINCD2 = InStrSyainCD2;
	END IF;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKbn,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）社員マスタの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKbn,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt21ODataChk                                        					                  */
/* 機能          ：社員マスタに同じデータがあるかチェック処理     	                      			              */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt210DataChk(
	 InStrSyainCD1     	IN      QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE	         	--社員コード1
     ,InStrSyainCD2     IN      QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE)				--社員コード2
	 RETURN BOOLEAN IS

	OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP呼出 カーソル設定
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAC_SYAINM
	WHERE	QPAC_PRMSYAINCD1 = InStrSyainCD1
	AND     QPAC_PRMSYAINCD2 = InStrSyainCD2;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--登録されている
	ELSE
		RETURN  FALSE;															--登録されていない
	END IF;

END	QPAP_CEnt210DataChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210OpeLog                                                       					  */
/* 機能          ：オペログへの追加                                                                  			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt210OpeLog(
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
			RAISE;		/* オペログのエラーを認める */
END  QPAP_CEnt210OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210Lock                                                                               */
/* 機能          ：社員マスタのロック                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 社員マスタの確認 */
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
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt210Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--部門マスタ２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt210Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt210Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt210UnLock                                                                             */
/* 機能          ：部門マスタのロック解除                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210UnLock(
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

END QPAP_CEnt210UnLock ;

END QPAP_CEnt210PkG;
/***END of LINE/**************************************************************************************************/
/
show error
