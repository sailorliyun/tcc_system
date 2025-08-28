CREATE OR REPLACE PACKAGE  QPAP_CEnt080PkG IS
/****************************************************************************/
/* システム名	：高島屋クレジットシステム									*/
/* 業務名		：社員貸付システム											*/
/* モジュール名	：QPAP_CEnt080PkG											*/
/* 機能			：社員融資台帳												*/
/* 作成日		：2000/10/10												*/
/* 作成者		：FIP														*/
/****************************************************************************/
------------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20090329  0807073/0808052  0807073：クレジット支援システムの再構築
--                           0808052：TCC支援システムの再構築
--                             ・アプリケーション移行対応
--                             ・社員融資台帳Ｔ登録の重複フラグをNULLから空文字でクリア
------------------------------------------------------------------------------------------------

/****************************************************************************/
/*								１ 宣言部									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
	TYPE typNayoseDatAry	IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;	--受付ログ用配列
	TYPE typUkeLogAry		IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;	--受付ログ用配列
	TYPE typCSVFileAry		IS TABLE OF VARCHAR2(150)	INDEX BY BINARY_INTEGER;	--ＣＳＶファイル出力用
	TYPE typRowIDAry		IS TABLE OF VARCHAR2(18)	INDEX BY BINARY_INTEGER;	--ＲＯＷＩＤ配列（帳票用）

	TYPE typPageKBNAry		IS TABLE OF NUMBER(2)		INDEX BY BINARY_INTEGER;	--ページ区分配列
	TYPE typNenKBNAry		IS TABLE OF NUMBER(2)		INDEX BY BINARY_INTEGER;	--年区分配列
	TYPE typKBNAry			IS TABLE OF VARCHAR2(10)	INDEX BY BINARY_INTEGER;	--区分配列
	TYPE typKijituAry		IS TABLE OF VARCHAR2(20)	INDEX BY BINARY_INTEGER;	--返済期日配列
	TYPE typHensaiAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--返済金額配列
	TYPE typZandakaAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--残高配列
	TYPE typKyuGanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--給与元本配列
	TYPE typKyuRskAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--給与利息配列
	TYPE typKyuZanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--給与残高配列
	TYPE typSyoGanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--賞与元本配列
	TYPE typSyoRskAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--賞与利息配列
	TYPE typSyoZanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--賞与残高配列

/* 初期処理 */
PROCEDURE	QPAP_CEnt080Init (
	OtStrSysDate				OUT		VARCHAR2);									--サーバーＳＹＳＴＥＭ日付

/* 排他制御 */
PROCEDURE QPAP_CEnt080Lock (
	 InStrSikibetu			IN			QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--識別コード
	,InStrProgramID			IN			QSA4_HaitaT.QSA4_ProgramID%TYPE				--プログラムＩＤ
	,InStrKeyInfo1			IN			VARCHAR2									--キー情報１
	,InStrKeyInfo2			IN			VARCHAR2									--キー情報２
	,InStrComputerMei		IN			QSA4_HaitaT.QSA4_ComputerMei%TYPE			--コンピュータ名
	,InStrOperatorID		IN			QSA4_HaitaT.QSA4_OperatorID%TYPE);			--オペレータＩＤ

/* 排他解除 */
PROCEDURE QPAP_CEnt080UnLock (
	 InStrSikibetu			IN			QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--識別コード
	,InStrComputerMei		IN			QSA4_HaitaT.QSA4_ComputerMei%TYPE);			--コンピュータ名

/* オペログへの追加 */
PROCEDURE  QPAP_CEnt080OpeLog(
	 InStrMenuId			IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleId			IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserId			IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerMei		IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTouzaiKbn			IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCd			IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg				IN			QUS2_OpeLogT.QUS2_MSG%TYPE );				--メッセージ

/* 印刷用テーブルに登録 */
PROCEDURE QPAP_CEnt080PrintAdd (
	 InStrSyainCD1			IN			CHAR										--社員コード１
	,InStrSyainCD2			IN			CHAR										--社員コード２
	,InStrSimei				IN			VARCHAR2									--氏名
	,InStrMiseNm			IN			VARCHAR2									--店名
	,InStrYusiYMD			IN			VARCHAR2									--融資年月日
	,InStrRiritu			IN			VARCHAR2									--利率
	,InNumYusiKng			IN			NUMBER										--融資金額
	,InNumKyuHensai			IN			NUMBER										--給与返済額
	,InNumSyoHensai			IN			NUMBER										--賞与返済額
	,InNumAryCount			IN			NUMBER										--配列件数
	,InNumPageKBNAry		IN			typPageKBNAry								--ページ区分配列
	,InNumNenKBNAry			IN			typNenKBNAry								--年区分配列
	,InStrKBNAry			IN			typKBNAry									--区分配列
	,InStrKijituAry			IN			typKijituAry								--返済期日配列
	,InNumHensaiAry			IN			typHensaiAry								--返済金額配列
	,InNumZandakaAry		IN			typZandakaAry								--残高配列
	,InNumKyuGanAry			IN			typKyuGanAry								--給与元本配列
	,InNumKyuRskAry			IN			typKyuRskAry								--給与利息配列
	,InNumKyuZanAry			IN			typKyuZanAry								--給与残高配列
	,InNumSyoGanAry			IN			typSyoGanAry								--賞与元本配列
	,InNumSyoRskAry			IN			typSyoRskAry								--賞与利息配列
	,InNumSyoZanAry			IN			typSyoZanAry								--賞与残高配列
	,InStrCOMPUTERMEI		IN			VARCHAR2);									--コンピュータ名

/* 印刷用テーブルから削除 */
PROCEDURE QPAP_CEnt080PrintDel (
	InStrCOMPUTERMEI		IN			QPAL_HENYOW.QPAL_COMPUTERMEI%TYPE);			--コンピューター名

/* 社員属性データ取得 */
PROCEDURE QPAP_CEnt080SyainDat (
	 InStrSyainCd1			IN			CHAR										--社員コード１
	,InStrSyainCd2			IN			CHAR										--社員コード２
	,OtStrDatAry				OUT		VARCHAR2);									--検索データ配列

/* 個人貸付データ取得 */
PROCEDURE QPAP_CEnt080GetList (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InNumMaxRec			IN			NUMBER										--最大配列格納件数
	,IoNumSpCnt				IN	OUT		NUMBER										--呼び出し回数
	,OtNumRecCount				OUT		NUMBER										--総検索件数
	,OtNumAryCount				OUT		NUMBER										--配列格納件数
	,OtStrEndFlg				OUT		VARCHAR2									--検索終了フラグ
	,OtStrDatAry				OUT		typUkeLogAry);								--商品データ配列

/* 社員データ名寄せ検索 */
PROCEDURE QPAP_CEnt080SyainSearch (
	 InStrSyainMyouji		IN			VARCHAR2									--社員氏名カナ
	,InStrSyainName			IN			VARCHAR2									--社員氏名カナ
	,InNumMaxRec			IN			NUMBER										--最大配列格納件数
	,IoNumSpCnt				IN	OUT		NUMBER										--呼出回数
	,OtNumRecCount				OUT		NUMBER										--総検索件数
	,OtNumAryCount				OUT		NUMBER										--配列格納件数
	,OtStrEndFlg				OUT		VARCHAR2									--終了フラグ
	,OtStrDatAryN				OUT		typNayoseDatAry);									--社員データ配列

/* 社員融資台帳Ｔ登録 */
PROCEDURE QPAP_CEnt080DatAdd (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN			VARCHAR2									--融資日
	,InStrGendogaku			IN			QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--融資限度額
	,InStrSyubetu			IN			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--種別
	,InStrRiritu			IN			QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--利率
	,InStrHensaiTsukisu		IN			QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--返済月数
	,InStrKyuyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--給与返済総額
	,InStrKyuyoHensai		IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--給与返済額
	,InStrSyoyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--賞与返済総額
	,InStrSyoyoHensai		IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--賞与返済額
	,InStrKyuyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--給与残高
	,InStrSyoyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--賞与残高
	,InStrKojoChusiFlg		IN			QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--控除中止フラグ
	,InStrKansaiYMD			IN			VARCHAR2									--完済日
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--部署コード	(オペログ用)
	,OtChouhukuFlg				OUT		CHAR);										--重複フラグ

/* 社員融資台帳Ｔ更新 */
PROCEDURE QPAP_CEnt080DatUpd (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN			VARCHAR2									--融資日
	,InStrGendogaku			IN			QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--融資限度額
	,InStrSyubetu			IN			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--種別
	,InStrRiritu			IN			QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--利率
	,InStrHensaiTsukisu		IN			QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--返済月数
	,InStrKyuyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--給与返済総額
	,InStrKyuyoHensai		IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--給与返済額
	,InStrSyoyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--賞与返済総額
	,InStrSyoyoHensai		IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--賞与返済額
	,InStrKyuyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--給与残高
	,InStrSyoyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--賞与残高
	,InStrKojoChusiFlg		IN			QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--控除中止フラグ
	,InStrKansaiYMD			IN			VARCHAR2									--完済日
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE);			--部署コード	(オペログ用)

/* 社員融資台帳Ｔ削除 */
PROCEDURE QPAP_CEnt080DatDel (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN			VARCHAR2									--融資日
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE);			--部署コード	(オペログ用)

END QPAP_CEnt080PkG;
/
SHOW ERROR

/****************************************************************************/
/*								２ ボディー									*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt080PkG IS

	/* ユーザ定義例外定義 */
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);

	/* ログメッセージ定義 */
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		--テーブル名
		fldKousinKbn	CHAR(1),		--更新区分
		fldAcsKey		CHAR(50),		--アクセスキー
		fldMsg			CHAR(100)		--処理コード
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	StrWHERE						VARCHAR(50);

	CURSOR CurCEnt080NAYOSE IS
		SELECT	 NVL(QPAC_PRMSYAINCD1,' ')							SYAINCD1		--社員コード１
				,NVL(QPAC_PRMSYAINCD2,' ')							SYAINCD2		--社員コード２
				,NVL(QPAC_SIMEIKANA,' ')							SIMEIKANA		--氏名カナ
				,NVL(QPAC_SIMEIKANJI,' ')							SIMEIKANJI		--氏名漢字
				,NVL(QPAC_MISECD,' ')								MISECD			--所属店コード
				,NVL(QPAC_TOZAIKBN,' ')								TOZAIKBN		--東西区分
				,NVL(QPAC_BUMONCD,' ')								BUMONCD			--所属部門コード
				,NVL(QPAC_SIKAKUCD,' ')								SIKAKUCD		--資格コード
				,NVL(QPAC_TOKYUCD,' ')								TOKYUCD			--等級コード
				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')			SEINENGAPPI		--青年月日
				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')		TAISYOKUYMD		--退職年月日
				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDFR	--休職開始年月日
				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDED	--休職終了年月日
		FROM	QPAC_SYAINM
		WHERE	QPAC_SIMEIKANA LIKE StrWHERE
	ORDER BY	QPAC_PRMSYAINCD1 || QPAC_PRMSYAINCD2;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080Init											*/
/* 機能			：受付照会初期処理											*/
/****************************************************************************/
PROCEDURE	QPAP_CEnt080Init (
	OtStrSysDate		OUT	VARCHAR2) IS				--サーバーSYSTEM日付

BEGIN

	/* サーバーシステム日付 */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDD')
	INTO	OtStrSysDate FROM DUAL;

END	QPAP_CEnt080Init;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080Lock											*/
/* 機能			：排他制御													*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080Lock (
	 InStrSikibetu			IN	QSA4_HAITAT.QSA4_PRMSIKIBETU%TYPE		--識別コード
	,InStrProgramID			IN	QSA4_HAITAT.QSA4_PROGRAMID%TYPE			--プログラムＩＤ
	,InStrKeyInfo1			IN	VARCHAR2								--キー情報１
	,InStrKeyInfo2			IN	VARCHAR2								--キー情報２
	,InStrComputerMei		IN	QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE		--コンピュータ名
	,InStrOperatorID		IN	QSA4_HAITAT.QSA4_OPERATORID%TYPE) IS	--オペレータＩＤ

	fldComputerMei				QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE;
	fldOperatorID				QSA4_HAITAT.QSA4_OPERATORID%TYPE;
	fldKeyInfo1					QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE;
	fldKeyInfo2					QSA4_HAITAT.QSA4_OPERATORID%TYPE;
	numErr						NUMBER;

BEGIN

	numErr	:= 0;

	BEGIN
		SELECT	 QSA4_COMPUTERMEI
				,QSA4_OPERATORID
				,QSA4_PRMKEYINFO1
				,QSA4_PRMKEYINFO2
		INTO	 fldCOMPUTERMEI
				,fldOPERATORID
				,fldKeyInfo1
				,fldKeyInfo2
		FROM	QSA4_HAITAT
		WHERE	QSA4_PRMJOBKBN		= 'A'
		AND		QSA4_PRMSIKIBETU	= InStrSikibetu
		AND		QSA4_PRMKEYINFO1	= InStrKeyInfo1
		AND		QSA4_PRMKEYINFO2	= InStrKeyInfo2;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	END;

	IF numErr = 0 then
		RAISE W_HAITADUPLICATE;
	ELSE
		INSERT INTO QSA4_HAITAT (
			 QSA4_PRMJobKbn
			,QSA4_PRMSikibetu
			,QSA4_PRMKeyInfo1
			,QSA4_PRMKeyInfo2
			,QSA4_PRMKeyInfo3
			,QSA4_PRMKeyInfo4
			,QSA4_PRMKeyInfo5
			,QSA4_ProgramID
			,QSA4_ComputerMei
			,QSA4_OperatorID
			,QSA4_SyoriYmd
		) VALUES (
			 'A'
			,InStrSikibetu
			,InStrKeyInfo1
			,InStrKeyInfo2
			,'A'
			,'A'
			,'A'
			,InStrProgramID
			,InStrComputerMei
			,InStrOperatorID
			,SYSDATE);
	END IF;

	COMMIT;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--  作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt080Lock DUPLICATE KEY');
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END	QPAP_CEnt080Lock ;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080UnLock										*/
/* 機能			：排他解除													*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080UnLock (
	 InStrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--識別コード
	,InStrComputerMei	IN	QSA4_HaitaT.QSA4_ComputerMei%TYPE) IS		--コンピュータ名
BEGIN
	DELETE	FROM QSA4_HaitaT
	WHERE	QSA4_PRMJobKbn		= 'A'
	AND		QSA4_PRMSikibetu	= InStrSikibetu
	AND		QSA4_ComputerMei	= InStrComputerMei;
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END	QPAP_CEnt080UnLock;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080OpeLog										*/
/* 機能			：オペログへの追加											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080OpeLog(
	 InStrMenuId			IN		QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューＩＤ
	,InStrModuleId			IN		QUS2_OPELOGT.QUS2_MODULEID%TYPE				--プログラムＩＤ
	,InStrUserId			IN		QUS2_OPELOGT.QUS2_USERID%TYPE				--ユーザＩＤ
	,InStrComputerMei		IN		QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ
	,InStrTouzaiKbn			IN		QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--東西区分
	,InStrBushoCd			IN		QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--部署コード
	,InStrMsg				IN		QUS2_OPELOGT.QUS2_MSG%TYPE) IS				--メッセージ

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
		SUBSTRB(InStrMenuId,1,5),
		SUBSTRB(InStrModuleId,1,40),
		SUBSTRB(InStrUserId,1,8),
		SUBSTRB(InStrComputerMei,1,20),
		SUBSTRB(InStrTouzaiKbn,1,1),
		SUBSTRB(InStrBushoCd,1,4),
		SUBSTRB(InStrMsg,1,1700));
EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* オペログのエラーを認める */
END QPAP_CEnt080OpeLog;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080PrintAdd										*/
/* 機能			：選択されたデータを追加									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080PrintAdd (
	 InStrSyainCD1		IN		CHAR				--社員コード１
	,InStrSyainCD2		IN		CHAR				--社員コード２
	,InStrSimei			IN		VARCHAR2			--氏名
	,InStrMiseNm		IN		VARCHAR2			--店名
	,InStrYusiYMD		IN		VARCHAR2			--融資年月日
	,InStrRiritu		IN		VARCHAR2			--利率
	,InNumYusiKng		IN		NUMBER				--融資金額
	,InNumKyuHensai		IN		NUMBER				--給与返済額
	,InNumSyoHensai		IN		NUMBER				--賞与返済額
	,InNumAryCount		IN		NUMBER				--配列件数
	,InNumPageKBNAry	IN		typPageKBNAry		--ページ区分配列
	,InNumNenKBNAry		IN		typNenKBNAry		--年区分配列
	,InStrKBNAry		IN		typKBNAry			--区分配列
	,InStrKijituAry		IN		typKijituAry		--返済期日配列
	,InNumHensaiAry		IN		typHensaiAry		--返済金額配列
	,InNumZandakaAry	IN		typZandakaAry		--残高配列
	,InNumKyuGanAry		IN		typKyuGanAry		--給与元本配列
	,InNumKyuRskAry		IN		typKyuRskAry		--給与利息配列
	,InNumKyuZanAry		IN		typKyuZanAry		--給与残高配列
	,InNumSyoGanAry		IN		typSyoGanAry		--賞与元本配列
	,InNumSyoRskAry		IN		typSyoRskAry		--賞与利息配列
	,InNumSyoZanAry		IN		typSyoZanAry		--賞与残高配列
	,InStrCOMPUTERMEI	IN		VARCHAR2) IS		--コンピュータ名

BEGIN
	<<LoopPrintAdd>>
	FOR i IN 1..InNumAryCount LOOP

		INSERT INTO QPAL_HENYOW VALUES (
			 InStrSyainCD1			--社員コード１
			,InStrSyainCD2			--社員コード２
			,InStrSimei				--氏名
			,InStrMiseNm			--店名
			,InStrYusiYMD			--融資年月日
			,InStrRiritu			--利率
			,InNumYusiKng			--融資金額
			,InNumKyuHensai			--給与返済額
			,InNumSyoHensai			--賞与返済額
			,InNumPageKBNAry(i)		--ページ区分配列
			,InNumNenKBNAry(i)		--年区分配列
			,InStrKBNAry(i)			--区分配列
			,InStrKijituAry(i)		--返済期日配列
			,InNumHensaiAry(i)		--返済金額配列
			,InNumZandakaAry(i)		--残高配列
			,InNumKyuGanAry(i)		--給与元本配列
			,InNumKyuRskAry(i)		--給与利息配列
			,InNumKyuZanAry(i)		--給与残高配列
			,InNumSyoGanAry(i)		--賞与元本配列
			,InNumSyoRskAry(i)		--賞与利息配列
			,InNumSyoZanAry(i)		--賞与残高配列
			,InStrCOMPUTERMEI);		--コンピュータ名

	END LOOP LoopPrintAdd;
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END QPAP_CEnt080PrintAdd;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080PrintDel										*/
/* 機能			：印刷終了後にテーブルからデータを削除						*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080PrintDel (
	InStrCOMPUTERMEI	IN		QPAL_HENYOW.QPAL_COMPUTERMEI%TYPE) IS	--コンピューター名

BEGIN
	DELETE	FROM QPAL_HENYOW
	WHERE	RTRIM(QPAL_COMPUTERMEI) = RTRIM(InStrCOMPUTERMEI);

	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END	QPAP_CEnt080PrintDel;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080SyainDat										*/
/* 機能			：社員属性の取得											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080SyainDat (
	 InStrSyainCd1		IN			CHAR						--社員コード１
	,InStrSyainCd2		IN			CHAR						--社員コード２
	,OtStrDatAry			OUT		VARCHAR2) IS				--検索データ配列

	StrNAMEKANA				QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;	--01 社員氏名カナ
	StrNAMEKANJI			QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;	--02 社員氏名漢字
	StrMISECD				QPAC_SYAINM.QPAC_MISECD%TYPE;		--03 所属店コード
	StrTOUZAIKBN			QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;		--04 東西区分
	StrBUMONCD				QPAC_SYAINM.QPAC_BUMONCD%TYPE;		--05 所属部門コード
	StrSIKAKUCD				QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;		--06 資格コード
	StrTOUKYUUCD			QPAC_SYAINM.QPAC_TOKYUCD%TYPE;		--07 等級コード
	StrBIRTHDAY				CHAR(8);							--08 生年月日
	StrTAISYOKUDATE			CHAR(8);							--09 退職年月日
	StrKYUUSYOKUFRMDATE		CHAR(8);							--10 休職開始年月日
	StrKYUUSYOKUTODATE		CHAR(8);							--11 休職終了年月日
	StrMISENAME				VARCHAR2(24);						--12 店名称
	StrBUMONNAME			VARCHAR2(24);						--13 部門名称
	StrBONUSMD1				CHAR(4);							--14 賞与支払日１
	StrBONUSMD2				CHAR(4);							--15 賞与支払日２
	StrSYOSYOGENDOGAKU		CHAR(7);							--17 証書限度額

	StrData					VARCHAR2(2000);

BEGIN

	/* 社員マスタから取得 */
	BEGIN
		SELECT	 NVL(QPAC_SIMEIKANA,' ')
				,NVL(QPAC_SIMEIKANJI,' ')
				,NVL(QPAC_MISECD,' ')
				,NVL(QPAC_TOZAIKBN,' ')
				,NVL(QPAC_BUMONCD,' ')
				,NVL(QPAC_SIKAKUCD,' ')
				,NVL(QPAC_TOKYUCD,' ')
				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')
		INTO	 StrNAMEKANA
				,StrNAMEKANJI
				,StrMISECD
				,StrTOUZAIKBN
				,StrBUMONCD
				,StrSIKAKUCD
				,StrTOUKYUUCD
				,StrBIRTHDAY
				,StrTAISYOKUDATE
				,StrKYUUSYOKUFRMDATE
				,StrKYUUSYOKUTODATE
		FROM	QPAC_SYAINM
		WHERE	QPAC_PRMSyainCD1 = InStrSyainCd1
		AND		QPAC_PRMSyainCD2 = InStrSyainCd2;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN;
	END;

	/* 店マスタから店名称取得 */
	BEGIN
		SELECT	 NVL(QPAE_MISENM,' ')
				,NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 StrMISENAME
				,StrBONUSMD1
				,StrBONUSMD2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= StrMISECD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrMISENAME := ' ';
			StrBONUSMD1 := ' ';
			StrBONUSMD2 := ' ';
		WHEN OTHERS THEN
			RAISE ;
	END;

	/* 部門マスタから部門名称取得 */
	BEGIN
		SELECT	NVL(QPAF_BUMONNM,' ')
		INTO	StrBUMONNAME
		FROM	QPAF_BUMONM
		WHERE	QPAF_PRMMISECD	= StrMISECD
		AND		QPAF_PRMBUMONCD	= StrBUMONCD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrBUMONNAME := ' ';
		WHEN OTHERS THEN
			RAISE ;
	END;

	/* 共通マスタから限度額取得 */
	BEGIN
		SELECT	QPAH_SGENDO
		INTO	StrSYOSYOGENDOGAKU
		FROM	QPAH_OTHERM
		WHERE	RTRIM(QPAH_PRMCODE)	= 'GE'|| RTRIM(StrSIKAKUCD) || RTRIM(StrTOUKYUUCD);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrSYOSYOGENDOGAKU := '0';
		WHEN OTHERS THEN
			RAISE ;
	END;


	/* 出力配列へ格納 */
	StrData := Null;
	StrData := StrData || RTRIM(StrNAMEKANA)			|| StrDLM;		--01 社員氏名カナ
	StrData := StrData || RTRIM(StrNAMEKANJI)			|| StrDLM;		--02 社員氏名漢字
	StrData := StrData || RTRIM(StrMISECD)				|| StrDLM;		--03 所属店コード
	StrData := StrData || RTRIM(StrTOUZAIKBN)			|| StrDLM;		--04 東西区分
	StrData := StrData || RTRIM(StrBUMONCD)				|| StrDLM;		--05 所属部門コード
	StrData := StrData || RTRIM(StrSIKAKUCD)			|| StrDLM;		--06 資格コード
	StrData := StrData || RTRIM(StrTOUKYUUCD)			|| StrDLM;		--07 等級コード
	StrData := StrData || RTRIM(StrBIRTHDAY)			|| StrDLM;		--08 生年月日
	StrData := StrData || RTRIM(StrTAISYOKUDATE)		|| StrDLM;		--09 退職年月日
	StrData := StrData || RTRIM(StrKYUUSYOKUFRMDATE)	|| StrDLM;		--10 休職開始年月日
	StrData := StrData || RTRIM(StrKYUUSYOKUTODATE)		|| StrDLM;		--11 休職終了年月日
	StrData := StrData || RTRIM(StrMISENAME)			|| StrDLM;		--12 店名称
	StrData := StrData || RTRIM(StrBUMONNAME)			|| StrDLM;		--13 部門名称
	StrData := StrData || RTRIM(StrBONUSMD1)			|| StrDLM;		--14 賞与支払日１
	StrData := StrData || RTRIM(StrBONUSMD2)			|| StrDLM;		--15 賞与支払日２
	StrData := StrData || RTRIM(StrSYOSYOGENDOGAKU)		|| StrDLM;		--16 証書限度額
	OtStrDatAry	:= StrData;												--情報配列

EXCEPTION
	WHEN	OTHERS	THEN

		RAISE ;

END	QPAP_CEnt080SyainDat;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080GetList										*/
/* 機能			：社員融資台帳情報取得										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080GetList (
	 InStrSyainCd1		IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE				--社員コード１
	,InStrSyainCd2		IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE				--社員コード２
	,InNumMaxRec		IN		NUMBER												--最大配列格納件数
	,IoNumSpCnt			IN	OUT	NUMBER												--呼び出し回数
	,OtNumRecCount			OUT	NUMBER												--総検索件数
	,OtNumAryCount			OUT	NUMBER												--配列格納件数
	,OtStrEndFlg			OUT	VARCHAR2											--検索終了フラグ
	,OtStrDatAry			OUT	typUkeLogAry) IS									--商品データ配列

	StrYusiKbnName			VARCHAR2(30);											--融資区分名称


	CURSOR CurCEnt080 IS
		SELECT	 NVL(TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD'),' ')		YUSIYMD			--融資日
				,TO_CHAR(QPA8_GENDOGAKU)							GENDOGAKU		--融資限度額
				,NVL(QPA8_SYUBETU,' ')								SYUBETU			--融資種別
				,TO_CHAR(QPA8_RIRITU)								RIRITU			--契約利率
				,TO_CHAR(QPA8_HENSAITUKISU)							HENSAITUKISU	--返済月数
				,TO_CHAR(QPA8_KYUYOHENSAIALL)						KYUYOHENSAIALL	--給与返済総額
				,TO_CHAR(QPA8_KYUYOHENSAI)							KYUYOHENSAI		--給与返済額
				,TO_CHAR(QPA8_SYOYOHENSAIALL)						SYOYOHENSAIALL	--賞与返済総額
				,TO_CHAR(QPA8_SYOYOHENSAI)							SYOYOHENSAI		--賞与返済額
				,TO_CHAR(QPA8_KYUYOZANDAKA)							KYUYOZANDAKA	--給与残高
				,TO_CHAR(QPA8_SYOYOZANDAKA)							SYOYOZANDAKA	--賞与残高
				,NVL(QPA8_KOJOCYUSIFLG,' ')							KOUJOCHUSIFLG	--控除中止フラグ
				,NVL(TO_CHAR(QPA8_KANSAIYMD,'YYYYMMDD'),' ')		KANSAIYMD		--完済日
		FROM	QPA8_SYNDAICYOT
		WHERE	QPA8_PRMSYAINCD1		= InStrSyainCd1
		AND		RTRIM(QPA8_PRMSYAINCD2)	= InStrSyainCd2
	ORDER BY	QPA8_PRMYUSIYMD;

	/* 処理固有の変数 */
	NumIdx				NUMBER;
	StrData				VARCHAR2(200);

	/* 行変数 */
	RowQPA8				CurCEnt080%ROWTYPE;

BEGIN

	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP呼出 初回時のみカーソル設定
	IF IoNumSpCnt	= 0 THEN
		SELECT
			COUNT(*)
		INTO
			OtNumRecCount
		FROM	QPA8_SYNDAICYOT
		WHERE	QPA8_PRMSYAINCD1		= InStrSyainCd1
		AND		RTRIM(QPA8_PRMSYAINCD2)	= InStrSyainCd2;
	END IF;

	--SP呼出回数 カウントアップ
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--カーソルオープン
	IF CurCEnt080%ISOPEN = FALSE THEN
		OPEN CurCEnt080();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		FETCH CurCEnt080 INTO RowQPA8;		--順読み
		IF	CurCEnt080%NOTFOUND THEN
			EXIT;							--ループ終了
		END IF;

		/* 融資区分名称取得 */
		BEGIN
			SELECT	QPAH_NAMEN
			INTO	StrYusiKbnName
			FROM	QPAH_OTHERM
			WHERE	RTRIM(QPAH_NAMEX) = RTRIM(RowQPA8.SYUBETU)
			AND		(SUBSTRB(RTRIM(QPAH_PRMCODE), 1, 7) = 'RIIPPAN'
			OR		RTRIM(QPAH_PRMCODE) = 'RITOKUBETU');
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrYusiKbnName :=' ';
			WHEN OTHERS THEN
				IF CurCEnt080%ISOPEN THEN
					CLOSE CurCEnt080;
				END IF;
				RAISE ;
		END;

		/* 個人貸付データ一覧 */
		StrData := Null;
		StrData := StrData	|| RTRIM(RowQPA8.YUSIYMD)			|| StrDLM;	--融資日
		StrData := StrData	|| RTRIM(RowQPA8.GENDOGAKU)			|| StrDLM;	--融資限度額
		StrData := StrData	|| RTRIM(RowQPA8.SYUBETU)			|| StrDLM;	--融資種別
		StrData := StrData	|| RTRIM(RowQPA8.RIRITU)			|| StrDLM;	--契約利率
		StrData := StrData	|| RTRIM(RowQPA8.HENSAITUKISU)		|| StrDLM;	--返済月数
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOHENSAIALL)	|| StrDLM;	--給与返済総額
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOHENSAI)		|| StrDLM;	--給与返済額
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOHENSAIALL)	|| StrDLM;	--賞与返済総額
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOHENSAI)		|| StrDLM;	--賞与返済額
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOZANDAKA)		|| StrDLM;	--給与残高
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOZANDAKA)		|| StrDLM;	--賞与残高
		StrData := StrData	|| RTRIM(RowQPA8.KOUJOCHUSIFLG)		|| StrDLM;	--控除中止フラグ
		StrData := StrData	|| RTRIM(RowQPA8.KANSAIYMD)			|| StrDLM;	--完済日
		StrData := StrData	|| RTRIM(StrYusiKbnName)			|| StrDLM;	--融資区分名称

		OtStrDatAry(NumIdx)	:=	StrData;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;							--プロシージャの終了（カーソルをクローズしない）
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';					--検索終了
	OtNumAryCount	:=	NumIdx - 1;
	/* カーソルのクローズ */
	CLOSE CurCEnt080;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt080%ISOPEN THEN
			CLOSE CurCEnt080;
		END IF;
		RAISE ;

END	QPAP_CEnt080GetList;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080SyainSearch									*/
/* 機能			：社員名寄せ検索											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080SyainSearch (
	 InStrSyainMyouji	IN			VARCHAR2					--社員氏名カナ苗字
	,InStrSyainName		IN			VARCHAR2					--社員氏名カナ名前
	,InNumMaxRec		IN			NUMBER						--最大配列格納件数
	,IoNumSpCnt			IN	OUT		NUMBER						--呼出回数
	,OtNumRecCount			OUT		NUMBER						--総検索件数
	,OtNumAryCount			OUT		NUMBER						--配列格納件数
	,OtStrEndFlg			OUT		VARCHAR2					--終了フラグ
	,OtStrDatAryN			OUT		typNayoseDatAry) IS			--社員データ配列

--	StrWHERE						VARCHAR(50);				--WHERE文

--	CURSOR CurCEnt080NAYOSE IS
--		SELECT	 NVL(QPAC_PRMSYAINCD1,' ')							SYAINCD1		--社員コード１
--				,NVL(QPAC_PRMSYAINCD2,' ')							SYAINCD2		--社員コード２
--				,NVL(QPAC_SIMEIKANA,' ')							SIMEIKANA		--氏名カナ
--				,NVL(QPAC_SIMEIKANJI,' ')							SIMEIKANJI		--氏名漢字
--				,NVL(QPAC_MISECD,' ')								MISECD			--所属店コード
--				,NVL(QPAC_TOZAIKBN,' ')								TOZAIKBN		--東西区分
--				,NVL(QPAC_BUMONCD,' ')								BUMONCD			--所属部門コード
--				,NVL(QPAC_SIKAKUCD,' ')								SIKAKUCD		--資格コード
--				,NVL(QPAC_TOKYUCD,' ')								TOKYUCD			--等級コード
--				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')			SEINENGAPPI		--青年月日
--				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')		TAISYOKUYMD		--退職年月日
--				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDFR	--休職開始年月日
--				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDED	--休職終了年月日
--		FROM	QPAC_SYAINM
--		WHERE	QPAC_SIMEIKANA LIKE StrWHERE
--	ORDER BY	QPAC_PRMSYAINCD1 || QPAC_PRMSYAINCD2;

	/* 処理固有の変数 */
	NumIdx				NUMBER;
	StrData				VARCHAR2(200);

	/* 行変数 */
	RowQPAC				CurCEnt080NAYOSE%ROWTYPE;

	StrMISENAME			VARCHAR2(24);
	StrBUMONNAME		VARCHAR2(24);

BEGIN

	IF InStrSyainMyouji = InStrSyainName THEN
		StrWHERE	 := InStrSyainMyouji || '%';
	ELSE
		StrWHERE	 := InStrSyainMyouji || '_' || InStrSyainName || '%';
	END IF;

	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP呼出 初回時のみカーソル設定
	IF IoNumSpCnt	= 0 THEN
		SELECT	COUNT(*)
		INTO	OtNumRecCount
		FROM	QPAC_SYAINM
		WHERE	QPAC_SIMEIKANA LIKE StrWHERE;
	END IF;

	--SP呼出回数 カウントアップ
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--カーソルオープン
	IF CurCEnt080NAYOSE%ISOPEN = FALSE THEN
		OPEN CurCEnt080NAYOSE();
	END IF;

	--ＦＥＴＣＨ
	LOOP
		FETCH CurCEnt080NAYOSE INTO RowQPAC;		--順読み
		IF	CurCEnt080NAYOSE%NOTFOUND THEN
			EXIT;							--ループ終了
		END IF;

		/* 店マスタから取得 */
		BEGIN
			SELECT	NVL(QPAE_MISENM,' ')
			INTO	StrMISENAME
			FROM	QPAE_MISEM
			WHERE	QPAE_PRMMISECD	= RTRIM(RowQPAC.MISECD);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrMISENAME := ' ';
			WHEN OTHERS THEN
				IF CurCEnt080NAYOSE%ISOPEN THEN
					CLOSE CurCEnt080NAYOSE;
				END IF;
				RAISE ;
		END;

		/* 部門マスタから取得 */
		BEGIN
			SELECT	NVL(QPAF_BUMONNM,' ')
			INTO	StrBUMONNAME
			FROM	QPAF_BUMONM
			WHERE	QPAF_PRMMISECD	= RTRIM(RowQPAC.MISECD)
			AND		QPAF_PRMBUMONCD	= RTRIM(RowQPAC.BUMONCD);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrBUMONNAME := ' ';
			WHEN OTHERS THEN
				IF CurCEnt080NAYOSE%ISOPEN THEN
					CLOSE CurCEnt080NAYOSE;
				END IF;
				RAISE ;
		END;

		/* 名寄せ検索データ一覧 */
		StrData := Null;
		StrData := StrData	|| RTRIM(RowQPAC.SYAINCD1)						|| StrDLM;	--社員コード１
		StrData := StrData	|| RTRIM(RowQPAC.SYAINCD2)						|| StrDLM;	--社員コード２
		StrData := StrData	|| RTRIM(RowQPAC.SIMEIKANJI)					|| StrDLM;	--氏名漢字
		StrData := StrData	|| RTRIM(RowQPAC.MISECD)						|| StrDLM;	--所属店コード
		StrData := StrData	|| RTRIM(RowQPAC.TOZAIKBN)						|| StrDLM;	--東西区分
		StrData := StrData	|| RTRIM(RowQPAC.BUMONCD)						|| StrDLM;	--所属部門コード
		StrData := StrData	|| RTRIM(RowQPAC.SIKAKUCD)						|| StrDLM;	--資格コード
		StrData := StrData	|| RTRIM(RowQPAC.TOKYUCD)						|| StrDLM;	--等級コード
		StrData := StrData	|| RTRIM(RowQPAC.SEINENGAPPI)					|| StrDLM;	--青年月日
		StrData := StrData	|| RTRIM(RowQPAC.TAISYOKUYMD)					|| StrDLM;	--退職年月日
		StrData := StrData	|| RTRIM(RowQPAC.KYUSYOKUYMDFR)					|| StrDLM;	--休職開始年月日
		StrData := StrData	|| RTRIM(RowQPAC.KYUSYOKUYMDED)					|| StrDLM;	--休職終了年月日
		StrData := StrData	|| StrMISENAME									|| StrDLM;	--所属店名称
		StrData := StrData	|| StrBUMONNAME									|| StrDLM;	--所属部門名称
		StrData := StrData	|| RTRIM(RowQPAC.SIMEIKANA)						|| StrDLM;	--氏名カナ

		OtStrDatAryN(NumIdx)	:=	StrData;

		/* 配列の件数がＭＡＸになった場合 */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;							--プロシージャの終了（カーソルをクローズしない）
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';					--検索終了
	OtNumAryCount	:=	NumIdx - 1;
	/* カーソルのクローズ */
	CLOSE CurCEnt080NAYOSE;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt080NAYOSE%ISOPEN THEN
			CLOSE CurCEnt080NAYOSE;
		END IF;
		RAISE ;

END	QPAP_CEnt080SyainSearch;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080DatAdd										*/
/* 機能			：社員融資台帳登録処理										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatAdd (
	 InStrSyainCd1			IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN		VARCHAR2									--融資日
	,InStrGendogaku			IN		QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--融資限度額
	,InStrSyubetu			IN		QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--種別
	,InStrRiritu			IN		QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--利率
	,InStrHensaiTsukisu		IN		QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--返済月数
	,InStrKyuyoHensaiAll	IN		QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--給与返済総額
	,InStrKyuyoHensai		IN		QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--給与返済額
	,InStrSyoyoHensaiAll	IN		QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--賞与返済総額
	,InStrSyoyoHensai		IN		QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--賞与返済額
	,InStrKyuyoZandaka		IN		QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--給与残高
	,InStrSyoyoZandaka		IN		QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--賞与残高
	,InStrKojoChusiFlg		IN		QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--控除中止フラグ
	,InStrKansaiYMD			IN		VARCHAR2									--完済日
	,InStrMenuId			IN		QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN		QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN		QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN		QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN		QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN		QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--部署コード	(オペログ用)
	,OtChouhukuFlg				OUT	CHAR) IS									--重複フラグ

	numStep				NUMBER	:= 0;						--処理ステップ
	numErr				NUMBER	:= 0;						--SQLCODEの退避
	strErrMsg			VARCHAR2(100);						--SQLERRMの退避
	recMsg				typMsg;
	strLogMsg			QUS2_OPELOGT.QUS2_MSG%TYPE;

	StrTOUROKUDATETIME	VARCHAR2(14);						--登録日時

	numCNT				NUMBER;								--重複チェック用
BEGIN
		/* オペログ設定 */
		recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';		--テーブル名
		recMsg.fldKousinKbn	:= '1';						--更新区分
		recMsg.fldAcsKey	:= InStrYusiYMD;			--更新キー

		/* 出力パラメータの初期化 */
		StrTOUROKUDATETIME	:= NULL;

--ADD 20090329 0807073/0808052 NBC SUGAWARA START
                OtChouhukuFlg           := ' ';
--ADD 20090329 0807073/0808052 NBC SUGAWARA END

		/* 登録日時の取得 */
		SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
		INTO	StrTOUROKUDATETIME
		FROM	DUAL;

		/* 重複チェック */
		SELECT	COUNT(*)
		INTO	numCNT
		FROM	QPA8_SYNDAICYOT
		WHERE	NVL(QPA8_PRMSYAINCD1, ' ')			= InStrSyainCd1
		AND		RTRIM(NVL(QPA8_PRMSYAINCD2, ' '))	= RTRIM(InStrSyainCd2)
		AND		QPA8_PRMYUSIYMD						= TO_DATE(InStrYusiYMD);

		IF numCNT = 0 THEN

			/* 社員融資台帳Ｔへ登録 */
			INSERT INTO QPA8_SYNDAICYOT VALUES (
				 InStrSyainCd1							--社員コード１
				,InStrSyainCd2							--社員コード２
				,TO_DATE(InStrYusiYMD,'YYYYMMDD')		--融資日
				,InStrGendogaku							--融資限度額
				,InStrSyubetu							--融資種別
				,InstrRiritu							--契約利率
				,InStrHensaiTsukisu						--返済月数
				,InstrKyuyoHensaiAll					--給与返済総額
				,InstrKyuyoHensai						--給与返済額
				,InstrSyoyoHensaiAll					--賞与返済総額
				,InstrSyoyoHensai						--賞与返済額
				,InStrKyuyoZandaka						--給与残高
				,InStrSyoyoZandaka						--賞与残高
				,NULL									--控除中止フラグ
				,NULL);									--完済日

			COMMIT;

		ELSE
			OtChouhukuFlg := '1';
			RETURN;
		END IF;

		/* オペログ出力 */
		numStep := 1;		/* 処理ステップ */
		recMsg.fldMsg	:= '（' || InstrTantoMei || '）社員融資台帳への登録を正常に行った。';
		strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg;
		QPAP_CEnt080OpeLog(	 InStrMenuId
							,InStrModuleId
							,InStrTantoMei
							,InStrComputerMei
							,InStrRiyouKbn
							,InStrBushoCd
							,StrLogMsg);

--EXCEPTION
--	WHEN	OTHERS	THEN
--		numErr		:= SQLCODE;
--		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
--		ROLLBACK;
--
--		/* オペログ出力 */
--		IF numStep < 1 THEN
--			recMsg.fldMsg	:= '（' || InstrTantoMei || '）社員融資台帳への登録に失敗した。';
--			strLogMsg		:= recMsg.fldTableID
--							|| recMsg.fldKousinKbn
--							|| recMsg.fldAcsKey
--							|| recMsg.fldMsg
--							|| numErr || ' ' || strErrMsg;
--			QPAP_CEnt080OpeLog(	 InStrMenuId
--								,InStrModuleId
--								,InStrTantoMei
--								,InStrComputerMei
--								,InStrRiyouKbn
--								,InStrBushoCd
--								,StrLogMsg);
--		END IF ;
--
--		RAISE ;
END	QPAP_CEnt080DatAdd;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080DatUpd										*/
/* 機能			：社員融資台帳の更新										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatUpd (
	 InStrSyainCd1			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN	VARCHAR2									--融資日
	,InStrGendogaku			IN	QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--融資限度額
	,InStrSyubetu			IN	QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--種別
	,InStrRiritu			IN	QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--利率
	,InStrHensaiTsukisu		IN	QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--返済月数
	,InStrKyuyoHensaiAll	IN	QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--給与返済総額
	,InStrKyuyoHensai		IN	QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--給与返済額
	,InStrSyoyoHensaiAll	IN	QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--賞与返済総額
	,InStrSyoyoHensai		IN	QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--賞与返済額
	,InStrKyuyoZandaka		IN	QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--給与残高
	,InStrSyoyoZandaka		IN	QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--賞与残高
	,InStrKojoChusiFlg		IN	QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--控除中止フラグ
	,InStrKansaiYMD			IN	VARCHAR2									--完済日
	,InStrMenuId			IN	QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN	QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN	QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN	QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN	QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN	QUS2_OPELOGT.QUS2_BUSHOCD%TYPE) IS			--部署コード	(オペログ用)

	numStep		NUMBER	:= 0;								--処理ステップ
	numErr		NUMBER	:= 0;								--SQLCODEの退避
	strErrMsg	VARCHAR2(100);								--SQLERRMの退避
	recMsg		typMsg;
	strLogMsg	QUS2_OPELOGT.QUS2_MSG%TYPE;

	StrKOUSINDATETIME	VARCHAR2(14);						--更新日時

BEGIN
	/* オペレーションログ設定 */
	recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';				--テーブル名
	recMsg.fldKousinKbn	:= '2';								--更新区分
	recMsg.fldAcsKey	:= InStrYusiYMD;					--更新キー

	/* 出力パラメータの初期化 */
	StrKousinDateTime	:= NULL;

	/*  更新日時の取得  */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
	INTO	StrKOUSINDATETIME
	FROM	DUAL;

	/* 社員融資台帳の更新 */
	UPDATE QPA8_SYNDAICYOT SET
			 QPA8_GENDOGAKU			=	InStrGendogaku						--融資限度額
			,QPA8_SYUBETU			=	InStrSyubetu						--融資種別
			,QPA8_RIRITU			=	InstrRiritu							--契約利率
			,QPA8_HENSAITUKISU		=	InStrHensaiTsukisu					--返済月数
			,QPA8_KYUYOHENSAIALL	=	InstrKyuyoHensaiAll					--給与返済総額
			,QPA8_KYUYOHENSAI		=	InstrKyuyoHensai					--給与返済額
			,QPA8_SYOYOHENSAIALL	=	InstrSyoyoHensaiAll					--賞与返済総額
			,QPA8_SYOYOHENSAI		=	InstrSyoyoHensai					--賞与返済額
			,QPA8_KYUYOZANDAKA		=	InStrKyuyoZandaka					--給与残高
			,QPA8_SYOYOZANDAKA		=	InStrSyoyoZandaka					--賞与残高
			,QPA8_KOJOCYUSIFLG		=	InStrKojoChusiFlg					--控除中止フラグ
			,QPA8_KANSAIYMD			=	TO_DATE(InStrKansaiYMD,'YYYYMMDD')	--完済日
	WHERE	QPA8_PRMSYAINCD1		=	InStrSyainCd1						--更新キー 社員コード１
	AND		QPA8_PRMSYAINCD2		=	InStrSyainCd2						--更新キー 社員コード２
	AND		QPA8_PRMYUSIYMD			=	TO_DATE(InStrYusiYMD,'YYYYMMDD');	--更新キー 融資日

	COMMIT;

	/* オペログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InstrTantoMei || '）社員融資台帳への更新を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKbn
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt080OpeLog(	 InStrMenuId
						,InStrModuleId
						,InStrTantoMei
						,InStrComputerMei
						,InStrRiyouKbn
						,InStrBushoCd
						,StrLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		ROLLBACK;

		/* オペログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InstrTantoMei || '社員融資台帳への更新に失敗した。';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKbn
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt080OpeLog(	 InStrMenuId
								,InStrModuleId
								,InStrTantoMei
								,InStrComputerMei
								,InStrRiyouKbn
								,InStrBushoCd
								,StrLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt080DatUpd;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt080DatDel										*/
/* 機能			：社員融資台帳から削除										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatDel (
	 InStrSyainCd1			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--社員コード１
	,InStrSyainCd2			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--社員コード２
	,InStrYusiYMD			IN	VARCHAR2									--融資日
	,InStrMenuId			IN	QUS2_OPELOGT.QUS2_MENUID%TYPE				--メニューID	(オペログ用)
	,InStrModuleId			IN	QUS2_OPELOGT.QUS2_MODULEID%TYPE				--モジュールID	(オペログ用)
	,InStrTantoMei			IN	QUS2_OPELOGT.QUS2_USERID%TYPE				--登録担当名	(オペログ用)
	,InStrComputerMei		IN	QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--コンピュータ名(オペログ用)
	,InStrRiyouKbn			IN	QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--利用区分		(オペログ用)
	,InStrBushoCd			IN	QUS2_OPELOGT.QUS2_BUSHOCD%TYPE) IS			--部署コード	(オペログ用)

	numStep		NUMBER	:= 0;												--処理ステップ
	numErr		NUMBER	:= 0;												--SQLCODEの退避
	strErrMsg	VARCHAR2(100);												--SQLERRMの退避
	recMsg		typMsg;
	strLogMsg	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* オペログ設定 */
	recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';		--テーブル名
	recMsg.fldKousinKbn	:= '3';						--更新区分
	recMsg.fldAcsKey	:= InStrYusiYMD;			--更新キー

	/* 社員融資台帳の削除 */
	DELETE FROM QPA8_SYNDAICYOT
	WHERE	QPA8_PRMSYAINCD1	= InStrSyainCd1
	AND		QPA8_PRMSYAINCD2	= InStrSyainCd2
	AND		QPA8_PRMYUSIYMD		= TO_DATE(InStrYusiYMD,'YYYYMMDD');

	COMMIT;

	/* オペログ出力 */
	numStep := 1;		/* 処理ステップ */
	recMsg.fldMsg	:= '（' || InstrTantoMei || '）社員融資台帳からの削除を正常に行った。';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKbn
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt080OpeLog(	 InStrMenuId
						,InStrModuleId
						,InStrTantoMei
						,InStrComputerMei
						,InStrRiyouKbn
						,InStrBushoCd
						,StrLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ロールバック */
		ROLLBACK;

		/* オペレーションログ出力 */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '（' || InstrTantoMei || '）社員融資台帳からの削除に失敗した。';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKbn
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt080OpeLog(	 InStrMenuId
								,InStrModuleId
								,InStrTantoMei
								,InStrComputerMei
								,InStrRiyouKbn
								,InStrBushoCd
								,StrLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt080DatDel;

END QPAP_CEnt080PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR