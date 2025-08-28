CREATE  OR REPLACE PACKAGE  QPAP_CEnt310PkG IS
/*****************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt310PkG                                                                                */
/* 機能          ：小口貸付データ登録                                                                             */
/* 作成日        ：2002/12/09                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20090329  0807073/0808052  0807073：クレジット支援システムの再構築
--                           0808052：TCC支援システムの再構築
--                             ・アプリケーション移行対応
--                               QPAP_CEnt310SelList 変数の大きさを修正
------------------------------------------------------------------------------------------------
/*****************************************************************************************************************/
/*１  宣言部								                                          							  */
/*****************************************************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
	TYPE typOtDataAry IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;

/* 初期処理（システム日付取得）*/
PROCEDURE QPAP_CEnt310Init (
	OtStrSysDate	OUT	VARCHAR2);										--サーバーＳＹＳＴＥＭ日付

/* 小口融資台帳テーブル存在チェック */
PROCEDURE QPAP_Cent310KgcDaicyoChk (
	InStrSyainCD		IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE,	--社員コード
	OtNumRecCount		OUT		NUMBER);								--総検索件数

/* 小口融資テーブル存在チェック */

PROCEDURE QPAP_Cent310KgcKasitukeTChk (
	InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE,	--社員コード
	InStrTorihikiYMD	IN		CHAR,									--貸付日付
	InStrTorihikiHMS	IN		VARCHAR2,								--貸付時刻
	InStrKingaku		IN		VARCHAR2,								--金額
	InStrTourokuYMD		IN		CHAR,									--登録日付
	InNumExecNo			IN		NUMBER,									--実行フラグ（０=登録時、１=帳票時）
	OtNumRecCount		OUT		NUMBER);								--総検索件数

/* 社員属性の表示 */
PROCEDURE QPAP_Cent310SelSyainZoku (
	InStrPRMSyainCD1	IN		QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--社員コード１
	InStrPRMSyainCD2	IN		QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--社員コード２
	OtStrSimeiKana		OUT		QPAC_SyainM.QPAC_SimeiKana%TYPE,		--氏名カナ
	OtStrSimeiKanji		OUT		QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--氏名漢字
	OtStrMiseCD			OUT		QPAC_SyainM.QPAC_MiseCD%TYPE,			--所属店コード
	OtStrMiseName		OUT		QPAE_MiseM.QPAE_MiseNm%TYPE,			--店名称
	OtStrTozaiKBN		OUT		QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--東西区分
	OtStrBumonCD		OUT		QPAC_SyainM.QPAC_BumonCD%TYPE,			--所属部門コード
	OtStrBumonName		OUT		QPAF_BumonM.QPAF_BumonNm%TYPE,			--部門名称
	OtStrSikakuCD		OUT		QPAC_SyainM.QPAC_SikakuCD%TYPE,			--資格コード
	OtStrTokyuCD		OUT		QPAC_SyainM.QPAC_TokyuCD%TYPE,			--等級コード
	OtStrBornYMD		OUT		VARCHAR2,								--生年月日
	OtStrTaisyokuYMD	OUT		VARCHAR2,								--退職月日
	OtStrKyusyoSTYMD	OUT		VARCHAR2,								--休職開始月日
	OtStrKyusyoEDYMD	OUT		VARCHAR2,								--休職終了月日
	OtStrSonzaiFlg		OUT		VARCHAR2);								--存在Flg (会員の存在 Check)

/* 貸付データ取得 */
PROCEDURE QPAP_CEnt310SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE		--抽出キー  社員コード
	,InNumMaxRec		IN		NUMBER									--最大配列格納件数
	,IoNumCursor		IN	OUT	NUMBER									--カーソルＩＤ
	,OtStrDataAry		OUT		typOtDataAry							--貸付データ
	,OtNumRecCount		OUT		NUMBER									--総検索件数
	,OtNumAryCount		OUT		NUMBER									--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2);								--検索終了フラグ

/* 貸付データ登録 */
PROCEDURE QPAP_CEnt310Ins (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--社員コード
	,InStrTorihikiYMD	IN		CHAR										--取引日付
	,InStrTorihikiHMS	IN		VARCHAR2									--取引時刻
	,InStrKingaku		IN		VARCHAR2									--金額
	,InStrTourokuID		IN		QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE			--登録ID
	,InStrMiseCd		IN		QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE		--管理店コード
	,INSTRMENUID		IN		VARCHAR2									--メニューID		オペログ用
	,InStrModuleID		IN		VARCHAR2									--モジュールID		オペログ用
	,InStrUserID		IN		VARCHAR2									--登録担当者ID		オペログ用
	,InStrTantoNM		IN		VARCHAR2									--登録担当者		オペログ用
	,InStrComputerNM	IN		VARCHAR2									--コンピューター名	オペログ用
	,InStrRiyouKBN		IN		VARCHAR2									--利用区分			オペログ用
	,InstrBushoCD		IN		VARCHAR2									--部署コード		オペログ用
);

/* 貸付データ削除 */
PROCEDURE QPAP_CEnt310Del (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--社員コード
	,InStrTorihikiYMD	IN		CHAR										--取引日付
	,InStrTorihikiHMS	IN		VARCHAR2									--取引時刻
	,InStrKingaku		IN		VARCHAR2									--金額
	,INSTRMENUID		IN		VARCHAR2									--メニューID		オペログ用
	,InStrModuleID		IN		VARCHAR2									--モジュールID		オペログ用
	,InStrUserID		IN		VARCHAR2									--登録担当者ID		オペログ用
	,InStrTantoNM		IN		VARCHAR2									--登録担当者		オペログ用
	,InStrComputerNM	IN		VARCHAR2									--コンピューター名	オペログ用
	,InStrRiyouKBN		IN		VARCHAR2									--利用区分			オペログ用
	,InstrBushoCD		IN		VARCHAR2									--部署コード		オペログ用
);

/* 業務排他処理 */
/* オペログ作成 */
PROCEDURE  QPAP_CEnt310OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE);				--メッセージ

/* ロック */
PROCEDURE QPAP_CEnt310Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--識別コード
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%TYPE			--社員コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%TYPE				--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%TYPE			--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%TYPE);			--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt310UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--識別コード
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%TYPE);			--コンピューター名

END QPAP_CEnt310PkG;
/
SHOW ERROR

/*****************************************************************************************************************/
/*	２  ボディー							    												                  */
/*****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt310PkG IS
	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),								/* テーブル名   */
		fldKousinKBN	CHAR(1),								/* 更新区分     */
		fldAcsKey		CHAR(50),								/* アクセスキー */
		fldMsg			CHAR(100)								/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);
	STATUS_ERROR		EXCEPTION;		--ユーザエラーの定義

/*****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt310Init																				*/
/* 機能			：初期処理（システム日付取得）																	*/
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Init (
	OtStrSysDate	OUT	VARCHAR2) IS							--サーバーＳＹＳＴＥＭ日付

BEGIN

	/* サーバーＳＹＳＴＥＭ日付 */
	SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO OtStrSysDate FROM DUAL;

END	QPAP_CEnt310Init;
/*****************************************************************************************************************/
/* モジュール名　：QPAP_Cent310KgcDaicyoChk                                  					  				*/
/* 機能      　　：小口融資台帳テーブル存在チェック                           					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310KgcDaicyoChk(
	InStrSyainCD		IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE,	--社員コード
	OtNumRecCount		OUT		NUMBER)IS								--総検索件数

BEGIN
	/* 出力パラメータのクリア */
	OtNumRecCount := 0;

	/* 小口融資台帳の検索 */
	SELECT COUNT(*) INTO OtNumRecCount FROM QPA1_KGCDAICYOT WHERE QPA1_PRMSYAINCD2 = InStrSyainCD;

EXCEPTION
	WHEN OTHERS THEN
	RAISE;

END QPAP_Cent310KgcDaicyoChk;

/*****************************************************************************************************************/
/* モジュール名　：QPAP_Cent310KgcKasitukeTChk                                  					  				*/
/* 機能      　　：貸付データの既存チェック                                            					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310KgcKasitukeTChk (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE,	--社員コード
	InStrTorihikiYMD	IN		CHAR,									--貸付日付
	InStrTorihikiHMS	IN		VARCHAR2,								--貸付時刻
	InStrKingaku		IN		VARCHAR2,								--金額
	InStrTourokuYMD		IN		CHAR,									--登録日付
	InNumExecNo			IN		NUMBER,									--実行フラグ（０=登録時、１=帳票時）
	OtNumRecCount		OUT		NUMBER) IS								--総検索件数

BEGIN
	/* 出力パラメータのクリア */
	OtNumRecCount := 0;

	/* 既存チェック */

	/* 小口貸付Ｔ既存チェック */
	IF InNumExecNo = 0 THEN		--登録時
		SELECT 	COUNT(*)
		INTO   	OtNumRecCount
		FROM 	QPA6_KGCKASITUKET 
		WHERE 	QPA6_TORIHIKIYMD = TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
		AND		QPA6_TORIHIKIHMS = TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')
		AND		QPA6_SYAINCD = InStrSyainCD
		AND		QPA6_KINGAKU = InStrKingaku;
	
	ELSIF InNumExecNo = 1 THEN	--帳票時
		SELECT 	COUNT(*)
		INTO   	OtNumRecCount
		FROM 	QPA6_KGCKASITUKET 
		WHERE 	TO_DATE(TO_CHAR(QPA6_DATEYMD,'YYYYMMDD'),'YYYYMMDD') = TO_DATE(InStrTourokuYMD,'YYYYMMDD');
--		AND		QPA6_SYAINCD = InStrSyainCD;
	END IF;

EXCEPTION
	WHEN OTHERS THEN
	RAISE;

END QPAP_Cent310KgcKasitukeTChk;

/*****************************************************************************************************************/
/* モジュール名　：QPAP_Cent310SelSyainZoku                                  					  				*/
/* 機能      　　：社員属性の表示                                            					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310SelSyainZoku (

	InStrPRMSyainCD1		IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,			--社員コード１
	InStrPRMSyainCD2		IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,			--社員コード２
	OtStrSimeiKana			OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,			--氏名カナ
	OtStrSimeiKanji			OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,			--氏名漢字
	OtStrMiseCD				OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,				--所属店コード
	OtStrMiseName			OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,				--店名称
	OtStrTozaiKBN			OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,				--東西区分
	OtStrBumonCD			OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,				--所属部門コード
	OtStrBumonName			OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,				--部門名称
	OtStrSikakuCD			OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,				--資格コード
	OtStrTokyuCD			OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,				--等級コード
	OtStrBornYMD			OUT	VARCHAR2,									--生年月日
	OtStrTaisyokuYMD		OUT	VARCHAR2,									--退職月日
	OtStrKyusyoSTYMD		OUT	VARCHAR2,									--休職開始月日
	OtStrKyusyoEDYMD		OUT	VARCHAR2,									--休職終了月日
	OtStrSonzaiFlg			OUT	VARCHAR2) IS								--存在Flg (会員の存在 Check)

BEGIN
	/* 出力パラメータのクリア */
	OtStrSimeiKana		:= ' ';
	OtStrSimeiKanji		:= ' ';
	OtStrMiseCD			:= ' ';
	OtStrMiseName		:= ' ';
	OtStrTozaiKBN		:= ' ';
	OtStrBumonCD		:= ' ';
	OtStrBumonName		:= ' ';
	OtStrSikakuCD		:= ' ';
	OtStrTokyuCD		:= ' ';
	OtStrBornYMD		:= ' ';
	OtStrTaisyokuYMD	:= ' ';			--退職月日
	OtStrKyusyoSTYMD	:= ' ';			--休職開始月日
	OtStrKyusyoEDYMD	:= ' ';			--休職終了月日
	OtStrSonzaiFlg		:= '0';

	/* 社員属性の検索 */
	SELECT
			NVL(QPAC_SimeiKana,' '),
			NVL(QPAC_SimeiKanji,' '),
			NVL(QPAC_MiseCD,' '),
			NVL(QPAE_MiseNm,' '),
			NVL(QPAC_TozaiKBN,' '),
			NVL(QPAC_BumonCD,' '),
			NVL(QPAF_BumonNm,' '),
			NVL(QPAC_SikakuCD,' '),
			NVL(QPAC_TokyuCD,' '),
			NVL(TO_CHAR(QPAC_BornYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')
		INTO
			OtStrSimeiKana,
			OtStrSimeiKanji,
			OtStrMiseCD,
			OtStrMiseName,
			OtStrTozaiKBN,
			OtStrBumonCD,
			OtStrBumonName,
			OtStrSikakuCD,
			OtStrTokyuCD,
			OtStrBornYMD,
			OtStrTAISYOKUYMD,
			OtStrKYUSYOSTYMD,
			OtStrKYUSYOEDYMD
		FROM	QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
		WHERE	QPAC_PRMSyainCD1	= InStrPRMSyainCD1
		AND	QPAC_PRMSyainCD2	= InStrPRMSyainCD2
		AND	QPAC_MiseCD		= QPAE_PRMMiseCD(+)
		AND	QPAC_MiseCD		= QPAF_PRMMiseCD(+)
		AND	QPAC_BumonCD		= QPAF_PRMBumonCD(+);

	OtStrSonzaiFlg	:= '1';

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RETURN;							--処理終了

END QPAP_Cent310SelSyainZoku;

/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310SelList                                                                            */
/* 機能          ：小口融資貸付データ取得                                                                         */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE		--抽出キー  社員コード
	,InNumMaxRec		IN		NUMBER									--最大配列格納件数
	,IoNumCursor		IN	OUT	NUMBER									--カーソルＩＤ
	,OtStrDataAry		OUT		typOtDataAry							--貸付データ
	,OtNumRecCount		OUT		NUMBER									--総検索件数
	,OtNumAryCount		OUT		NUMBER									--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2) IS							--検索終了フラグ

	/* 処理固有の変数 */
	StrSQL				VARCHAR2(1000);
	StrData				VARCHAR2(200);
	v_CursorID			NUMBER := 0;
	v_NumCount			NUMBER;
	v_Dummy				INTEGER;
	NumIdx				NUMBER;
	v_TorihikiYMD		CHAR(8);
	v_TorihikiHMS		CHAR(6);
	v_HostQ				QPA6_KGCKASITUKET.QPA6_HOSTSEQ%TYPE;
	v_Kingaku			QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
	v_WSName			CHAR(8);
	v_TourokuYMD		CHAR(14);
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--	v_TourokuNAME		VARCHAR2(20);
--DEL 20090329 0807073/0808052 NBC YOKOYAMA END
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
	v_TourokuNAME		VARCHAR2(30);
--ADD 20090329 0807073/0808052 NBC YOKOYAMA END

BEGIN

/* ----- ＳＴＥＰ１ 表示データ総件数取得 ----- */
	OtstrEndFlg	:= '0';
	OtNumRecCount	:= 0;
	OtNumAryCount	:= 0;
	v_NumCount	:= 0;

	/* 小口融資貸付テーブル存在チェックＳＱＬ */
	SELECT	COUNT(*)
	INTO	OtNumRecCount
	FROM	QPA6_KGCKASITUKET
	WHERE	QPA6_SYAINCD = InStrSyainCD;

/* ----- ＳＴＥＰ２ 表示データ取得 ----- */
	IF IoNumCursor = 0 THEN		--１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）

		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
		StrSQL := StrSQL || ' NVL(QPA6_HOSTSEQ,'' ''),';
		StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
		StrSQL := StrSQL || ' NVL(QPA6_WSNAME,'' ''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_DATEYMD,''YYYYMMDDHH24MISS'')';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' ORDER BY QPA6_TORIHIKIYMD DESC,QPA6_TORIHIKIHMS DESC';
		/* 動的カーソルのオープン */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQLの解析 */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* 入力変数をバインドする */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		/* SQLの実行 */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	ELSE
		/* ２回目以降はカーソルを再利用する */
		v_CursorID  := IoNumCursor;
	END IF;

	IoNumCursor :=  v_CursorID;		--パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_HostQ,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kingaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_WSName,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_TourokuYMD,14);
	/* FETCH */
	NumIdx := 0;
	LOOP
		IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_HostQ);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kingaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_WSName);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_TourokuYMD);

		/* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
		NumIdx	:= NumIdx + 1;

		/* パラメータに渡す */
		StrData := NULL;
		StrData := StrData || RTRIM(v_TorihikiYMD)	|| StrDLM;	--取引日付
		StrData := StrData || RTRIM(v_TorihikiHMS)	|| StrDLM;	--取引時間
		StrData := StrData || RTRIM(v_Kingaku)		|| StrDLM;	--金額
		StrData := StrData || RTRIM(v_TourokuYMD)	|| StrDLM;	--登録日時

		IF v_HostQ = 'SY' THEN

			BEGIN
				SELECT 	QUA1_USERMEI
				INTO v_TourokuName
				FROM QUA2_USERIDV 
				WHERE RTRIM(QUA1_USERID) = RTRIM(v_WSName);

			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					OtStrEndFlg	:= '9';				
					IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
						DBMS_SQL.CLOSE_CURSOR (v_CursorID);
					END IF;
					RAISE;

				WHEN OTHERS THEN
					OtStrEndFlg	:= '9';				
					IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
						DBMS_SQL.CLOSE_CURSOR (v_CursorID);
					END IF;
					RAISE;
			END;

			StrData := StrData || RTRIM(v_TourokuName)		|| StrDLM;	--登録者名
			StrData := StrData || '1'						|| StrDLM;	--手動ﾌﾗｸﾞ


		ELSE
			StrData := StrData || NVL(v_TourokuName,' ')		|| StrDLM;	--登録者名
			StrData := StrData || '0'							|| StrDLM;	--手動ﾌﾗｸﾞ
		END IF;

		OtStrDataAry(NumIdx) := StrData;
		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;
		END IF;
	END LOOP;

	OtNumAryCount	:= NumIdx;			--パラメータにセット
	OtStrEndFlg	:= '1';					--パラメータにセット（検索終了）

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
	WHEN STATUS_ERROR THEN
		OtStrEndFlg	:= '9';				
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;

	WHEN	OTHERS	THEN
		OtStrEndFlg	:= '9';				
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;
END QPAP_CEnt310SelList;

/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310Ins                                                                             */
/* 機能          ：小口貸付データ追加処理                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Ins (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--社員コード
	,InStrTorihikiYMD	IN		CHAR										--取引日付
	,InStrTorihikiHMS	IN		VARCHAR2									--取引時刻
	,InStrKingaku		IN		VARCHAR2									--金額
	,InStrTourokuID		IN		QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE			--登録ID
	,InStrMiseCd		IN		QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE		--管理店コード
	,INSTRMENUID		IN		VARCHAR2									--メニューID		オペログ用
	,InStrModuleID		IN		VARCHAR2									--モジュールID		オペログ用
	,InStrUserID		IN		VARCHAR2									--登録担当者ID		オペログ用
	,InStrTantoNM		IN		VARCHAR2									--登録担当者		オペログ用
	,InStrComputerNM	IN		VARCHAR2									--コンピューター名	オペログ用
	,InStrRiyouKBN		IN		VARCHAR2									--利用区分			オペログ用
	,InstrBushoCD		IN		VARCHAR2									--部署コード		オペログ用
) IS
	numStep				NUMBER   := 0;							/* 処理ステップ  */
	numErr				NUMBER   := 0;							/* SQLCODEの退避 */
	strErrMsg			VARCHAR2(100);							/* SQLERRMの退避 */
	recMsg				typMsg;
	SystemYMD 			DATE;
	strLogMsg			VARCHAR2(1700);

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA6_KGCKASITUKET';						--テーブル名
	recMsg.fldKousinKBN	:= '1';										--更新区分
	recMsg.fldAcsKey	:= InStrSyainCD;							--更新キー

/* 修正 */
	SELECT SYSDATE INTO SystemYMD FROM DUAL; 	

	/* 追加 */
	INSERT INTO QPA6_KGCKASITUKET(
			QPA6_TORIHIKIYMD
			,QPA6_TORIHIKIHMS
			,QPA6_SYAINCD
			,QPA6_HOSTSEQ
			,QPA6_KAZOKUCD
			,QPA6_MEISAIFLG
			,QPA6_SYUBETU
			,QPA6_KINGAKU
			,QPA6_MARUYUFLG
			,QPA6_WSNAME
			,QPA6_DATEYMD
			,QPA6_KANRITEN
			,QPA6_TORIKESHIFLG)
	VALUES(
		TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
		,TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')
		,InStrSyainCD
		,'SY'
		,'1'
		,'3'	
		,'30'	
		,InStrKingaku
		,'0'
		,InStrTourokuID
		,SystemYMD
		,InStrMiseCd
		,' ');

	/* コミット */
	COMMIT;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの登録に正常に行った';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの登録に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END QPAP_CEnt310Ins;
/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310Del 													*/
/* 機能          ：小口融資入金データ削除処理                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Del (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--社員コード
	,InStrTorihikiYMD	IN		CHAR										--取引日付
	,InStrTorihikiHMS	IN		VARCHAR2									--取引時刻
	,InStrKingaku		IN		VARCHAR2									--金額
	,INSTRMENUID		IN		VARCHAR2									--メニューID		オペログ用
	,InStrModuleID		IN		VARCHAR2									--モジュールID		オペログ用
	,InStrUserID		IN		VARCHAR2									--登録担当者ID		オペログ用
	,InStrTantoNM		IN		VARCHAR2									--登録担当者		オペログ用
	,InStrComputerNM	IN		VARCHAR2									--コンピューター名	オペログ用
	,InStrRiyouKBN		IN		VARCHAR2									--利用区分			オペログ用
	,InstrBushoCD		IN		VARCHAR2									--部署コード		オペログ用
)IS

	numStep			NUMBER   := 0;							/* 処理ステップ  */
	numErr			NUMBER   := 0;							/* SQLCODEの退避 */
	strErrMsg		VARCHAR2(100);							/* SQLERRMの退避 */
	recMsg			typMsg;
	strLogMsg		VARCHAR2(1700);
BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA6_KGCKASITUKET';						--テーブル名
	recMsg.fldKousinKBN	:= '3';										--更新区分
	recMsg.fldAcsKey	:= InStrSyainCD;							--更新キー

	/* 小口融資貸付Ｔの削除 */
	DELETE FROM QPA6_KGCKASITUKET
	WHERE	QPA6_TORIHIKIYMD = TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
	AND	QPA6_TORIHIKIHMS = TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')	
	AND	QPA6_KINGAKU = InStrKingaku			
	AND	QPA6_SYAINCD  = InStrSyainCD;								

	COMMIT;

	/* オペレーションログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの削除を正常に行った';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKBN
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt310OpeLog(	InStrMenuID,
				InStrModuleID,
				InStrUserID,
				InStrComputerNM,
				InStrRiyouKBN,
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
			recMsg.fldMsg	:= '（' || InStrTantoNM || '）小口融資貸付テーブルの削除に失敗した';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END QPAP_CEnt310Del;
/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310OpeLog                                       　　　　　　　　　　　　　　　　　　　*/
/* 機能          ：オペログへの追加                                                                               */
/*****************************************************************************************************************/
PROCEDURE  QPAP_CEnt310OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS 				--メッセージ

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserId,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* オペログのエラーを認める */
END  QPAP_CEnt310OpeLog;

/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310Lock                                                                               */
/* 機能          ：小口融資貸付Ｔのロック                                                                         */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type			--識別コード
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type			--社員コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type			--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type			--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		--オペレータＩＤ

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* プリンタＴの確認 */
	BEGIN
		SELECT QSA4_ComputerMei, QSA4_OperatorID
		  INTO fldComputerNM, fldOperatorID
		  FROM QSA4_HaitaT
		 WHERE QSA4_PRMJobKbn	 = 'P'
		   AND QSA4_PRMSikibetu	 = InStrSikibetu
		   AND QSA4_PRMKeyInfo1	 = InStrKeyInfo1;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	END;

	IF numErr = 0 THEN
		RAISE W_HAITADUPLICATE;
	ELSE
		INSERT INTO QSA4_HaitaT (
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
		) VALUES (
			'P', InStrSikibetu,
			InStrKeyInfo1,'P','P','P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	END IF;

	COMMIT;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt310Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--２重キー
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt310Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt310Lock ;
/*****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt310UnLock                                                                             */
/* 機能          ：小口融資貸付Ｔのロック解除                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS

BEGIN
	DELETE FROM QSA4_HaitaT
	 WHERE QSA4_PRMJobKbn = 'P'
	   AND QSA4_PRMSikibetu = InStrSikibetu
	   AND QSA4_ComputerMei = InStrComputerNM;
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt310UnLock;

END QPAP_CEnt310PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
