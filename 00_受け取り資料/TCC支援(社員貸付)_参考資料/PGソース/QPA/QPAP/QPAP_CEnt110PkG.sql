CREATE OR REPLACE PACKAGE  QPAP_CEnt110PkG IS
/****************************************************************************/
/* システム名	：高島屋クレジットシステム									*/
/* 業務名		：個人貸付明細												*/
/* モジュール名	：QPAP_CEnt110PkG											*/
/* 機能			：受付照会													*/
/* 作成日		：															*/
/* 作成者		：FIP														*/
/****************************************************************************/
/****************************************************************************/
/*								１  宣言部									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--区切文字

/* 各行を格納するための配列定義 */
	TYPE typPageKBNAry	IS TABLE OF NUMBER(2)     INDEX BY BINARY_INTEGER;	--ページ区分配列
	TYPE typNenKBNAry	IS TABLE OF NUMBER(2)     INDEX BY BINARY_INTEGER;	--年区分配列
	TYPE typKBNAry		IS TABLE OF VARCHAR2(10)  INDEX BY BINARY_INTEGER;	--区分配列
	TYPE typKijituAry	IS TABLE OF VARCHAR2(20)  INDEX BY BINARY_INTEGER;	--返済期日配列
	TYPE typHensaiAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--返済金額配列
	TYPE typZandakaAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--残高配列
	TYPE typKyuGanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--給与元本配列
	TYPE typKyuRskAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--給与利息配列
	TYPE typKyuZanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--給与残高配列
	TYPE typSyoGanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--賞与元本配列
	TYPE typSyoRskAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--賞与利息配列
	TYPE typSyoZanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--賞与残高配列

/* 初期処理 */
PROCEDURE	QPAP_CEnt110Init (
	 OtStrSysDate		OUT	VARCHAR2);				--サーバーＳＹＳＴＥＭ日付

/* 社員データ取得 */
PROCEDURE QPAP_CEnt110SyainDat (
	 InStrSyainCd1		IN		CHAR			--社員コード１
	,InStrSyainCd2		IN		CHAR			--社員コード２
	,OtStrDatAry			OUT	VARCHAR2);		--社員属性データ（区切り文字）

/* 融資データ取得 */
PROCEDURE QPAP_CEnt110SelList (
	 InStrSyainCD1		IN		CHAR			--抽出キー　社員コード１
	,InStrSyainCD2		IN		CHAR			--抽出キー　社員コード２
	,InStrYuusibi		IN		CHAR			--抽出キー　融資日
	,OtStrDatAry			OUT	VARCHAR2);		--取得データ（区切り文字）

/* 帳票用ワークテーブル登録 */
PROCEDURE QPAP_CEnt110PrintAdd (
	 InStrSyainCD1		IN	CHAR			--社員コード１
	,InStrSyainCD2		IN	CHAR        	--社員コード２
	,InStrSimei			IN	VARCHAR2    	--氏名
	,InStrMiseNm		IN	VARCHAR2    	--店名
	,InStrYusiYMD		IN	VARCHAR2    	--融資年月日
	,InStrRiritu		IN	VARCHAR2    	--利率
	,InNumYusiKng		IN	NUMBER      	--融資金額
	,InNumKyuHensai		IN	NUMBER      	--給与返済額
	,InNumSyoHensai		IN	NUMBER      	--賞与返済額
	,InNumAryCount		IN	NUMBER      	--配列件数
	,InNumPageKBNAry	IN	typPageKBNAry	--ページ区分配列
	,InNumNenKBNAry		IN	typNenKBNAry	--年区分配列
	,InStrKBNAry		IN	typKBNAry		--区分配列
	,InStrKijituAry		IN	typKijituAry	--返済期日配列
	,InNumHensaiAry		IN	typHensaiAry	--返済金額配列
	,InNumZandakaAry	IN	typZandakaAry	--残高配列
	,InNumKyuGanAry		IN	typKyuGanAry	--給与元本配列
	,InNumKyuRskAry		IN	typKyuRskAry	--給与利息配列
	,InNumKyuZanAry		IN	typKyuZanAry	--給与残高配列
	,InNumSyoGanAry		IN	typSyoGanAry	--賞与元本配列
	,InNumSyoRskAry		IN	typSyoRskAry	--賞与利息配列
	,InNumSyoZanAry		IN	typSyoZanAry	--賞与残高配列
	,InStrCOMPUTERMEI	IN	VARCHAR2);		--コンピュータ名

/* 帳票用ワークテーブル削除 */
PROCEDURE QPAP_CEnt110PrintDel (
	 InStrCOMPUTERMEI	IN	VARCHAR2);		--コンピューター名

END QPAP_CEnt110PkG;
/
SHOW ERROR

/****************************************************************************/
/*								２  ボディー								*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt110PkG IS

	/***  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);

	/***  ログメッセージ定義	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		/* テーブル名   */
		fldKousinKbn	CHAR(1),		/* 更新区分     */
		fldAcsKey		CHAR(50),		/* アクセスキー */
		fldMsg			CHAR(100)		/* 処理コード   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;


/****************************************************************************/
/* モジュール名	：QPAP_CEnt110Init											*/
/* 機能			：個人貸付明細初期処理										*/
/****************************************************************************/
PROCEDURE	QPAP_CEnt110Init (
	 OtStrSysDate		OUT	VARCHAR2) IS	--サーバーＳＹＳＴＥＭ日付

BEGIN

	/* サーバーシステム日付 */
	SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO OtStrSysDate FROM DUAL;

END	QPAP_CEnt110Init;


/****************************************************************************/
/* モジュール名	：QPAP_CEnt100SyainDat										*/
/* 機能			：社員データの取得											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110SyainDat (
	 InStrSyainCd1	IN		CHAR								--社員コード１
	,InStrSyainCd2	IN		CHAR								--社員コード２
	,OtStrDatAry		OUT	VARCHAR2) IS						--検索データ配列

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
	StrMISENAME				CHAR(24);							--12 店名称
	StrBonusMD1				CHAR(4);							--13 ボーナス支払日１
	StrBonusMD2				CHAR(4);							--14 ボーナス支払日２
	StrBUMONNAME			VARCHAR2(24);						--15 部門名称

	StrData					VARCHAR2(3000);

BEGIN

	IF NVL(InStrSyainCd1, ' ') = ' ' THEN
		BEGIN
			/* 社員マスタから取得 */
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
			WHERE	QPAC_PRMSyainCD2 = InStrSyainCd2;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	ELSE
		BEGIN
			/* 社員マスタから取得 */
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
	END IF;

	/* 店マスタから店名称、賞与支払日１、賞与支払日２取得 */
	BEGIN
		SELECT	 NVL(QPAE_MISENM,' ')
				,NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 StrMISENAME
				,StrBonusMD1
				,StrBonusMD2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= StrMISECD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrMISENAME := '';
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
			StrBUMONNAME := '';
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
	StrData := StrData || RTRIM(StrBonusMD1)			|| StrDLM;		--13 店名称
	StrData := StrData || RTRIM(StrBonusMD2)			|| StrDLM;		--14 店名称
	StrData := StrData || RTRIM(StrBUMONNAME)			|| StrDLM;		--15 部門名称
	OtStrDatAry	:= StrData;										--情報配列

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;

END	QPAP_CEnt110SyainDat;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt110SelList										*/
/* 機能			：融資データ取得											*/
/****************************************************************************/
/* 融資データ取得 */
PROCEDURE QPAP_CEnt110SelList (
	 InStrSyainCD1		IN		CHAR				--抽出キー　社員コード１
	,InStrSyainCD2		IN		CHAR				--抽出キー　社員コード２
	,InStrYuusibi		IN		CHAR				--抽出キー　融資日
	,OtStrDatAry			OUT	VARCHAR2) IS		--取得データ（区切り文字）

	STRPRMSYAINCD1		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
	STRPRMSYAINCD2		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
	STRPRMYUSIYMD		CHAR(8);
	STRGENDOGAKU		VARCHAR2(7);
	STRSYUBETU			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
	STRRIRITU			VARCHAR2(10);
	STRHENSAITUKISU		VARCHAR2(2);
	STRKYUYOHENSAIALL	VARCHAR2(7);
	STRKYUYOHENSAI		VARCHAR2(7);
	STRSYOYOHENSAIALL	VARCHAR2(7);
	STRSYOYOHENSAI		VARCHAR2(7);
	STRKYUYOZANDAKA		VARCHAR2(7);
	STRSYOYOZANDAKA		VARCHAR2(7);
	STRKOJOCYUSIFLG		VARCHAR2(7);
	STRKANSAIYMD		CHAR(8);

	StrData					VARCHAR2(3000);

BEGIN

	IF NVL(InStrSyainCd1, ' ') = ' ' THEN
		BEGIN
			SELECT
				 NVL(QPA8_PRMSYAINCD1, ' ')
				,NVL(QPA8_PRMSYAINCD2, ' ')
				,TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')
				,TO_CHAR(QPA8_GENDOGAKU)
				,NVL(QPA8_SYUBETU, ' ')
				,TO_CHAR(QPA8_RIRITU)
				,TO_CHAR(QPA8_HENSAITUKISU)
				,TO_CHAR(QPA8_KYUYOHENSAIALL)
				,TO_CHAR(QPA8_KYUYOHENSAI)
				,TO_CHAR(QPA8_SYOYOHENSAIALL)
				,TO_CHAR(QPA8_SYOYOHENSAI)
				,TO_CHAR(QPA8_KYUYOZANDAKA)
				,TO_CHAR(QPA8_SYOYOZANDAKA)
				,NVL(QPA8_KOJOCYUSIFLG, ' ')
				,TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD')
			INTO
				 STRPRMSYAINCD1
				,STRPRMSYAINCD2
				,STRPRMYUSIYMD
				,STRGENDOGAKU
				,STRSYUBETU
				,STRRIRITU
				,STRHENSAITUKISU
				,STRKYUYOHENSAIALL
				,STRKYUYOHENSAI
				,STRSYOYOHENSAIALL
				,STRSYOYOHENSAI
				,STRKYUYOZANDAKA
				,STRSYOYOZANDAKA
				,STRKOJOCYUSIFLG
				,STRKANSAIYMD
			FROM
				QPA8_SYNDAICYOT
			WHERE	QPA8_PRMSYAINCD2 = InStrSyainCD2
			AND		TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')  = InStrYuusibi;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	ELSE
		BEGIN
			SELECT
				 NVL(QPA8_PRMSYAINCD1, ' ')
				,NVL(QPA8_PRMSYAINCD2, ' ')
				,TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')
				,TO_CHAR(QPA8_GENDOGAKU)
				,NVL(QPA8_SYUBETU, ' ')
				,TO_CHAR(QPA8_RIRITU)
				,TO_CHAR(QPA8_HENSAITUKISU)
				,TO_CHAR(QPA8_KYUYOHENSAIALL)
				,TO_CHAR(QPA8_KYUYOHENSAI)
				,TO_CHAR(QPA8_SYOYOHENSAIALL)
				,TO_CHAR(QPA8_SYOYOHENSAI)
				,TO_CHAR(QPA8_KYUYOZANDAKA)
				,TO_CHAR(QPA8_SYOYOZANDAKA)
				,NVL(QPA8_KOJOCYUSIFLG, ' ')
				,TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD')
			INTO
				 STRPRMSYAINCD1
				,STRPRMSYAINCD2
				,STRPRMYUSIYMD
				,STRGENDOGAKU
				,STRSYUBETU
				,STRRIRITU
				,STRHENSAITUKISU
				,STRKYUYOHENSAIALL
				,STRKYUYOHENSAI
				,STRSYOYOHENSAIALL
				,STRSYOYOHENSAI
				,STRKYUYOZANDAKA
				,STRSYOYOZANDAKA
				,STRKOJOCYUSIFLG
				,STRKANSAIYMD
			FROM
				QPA8_SYNDAICYOT
			WHERE	QPA8_PRMSYAINCD1 = InStrSyainCD1
			AND		QPA8_PRMSYAINCD2 = InStrSyainCD2
			AND		TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')  = InStrYuusibi;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	END IF;

	/* 出力配列へ格納 */
	StrData := Null;
	StrData := StrData || RTRIM(STRPRMSYAINCD1)		|| StrDLM;		--01 社員コード１
	StrData := StrData || RTRIM(STRPRMSYAINCD2)		|| StrDLM;		--02 社員コード２
	StrData := StrData || RTRIM(STRPRMYUSIYMD)		|| StrDLM;		--03 融資日
	StrData := StrData || RTRIM(STRGENDOGAKU)		|| StrDLM;		--04 融資限度額
	StrData := StrData || RTRIM(STRSYUBETU)			|| StrDLM;		--05 融資種別
	StrData := StrData || RTRIM(STRRIRITU)			|| StrDLM;		--06 契約利率
	StrData := StrData || RTRIM(STRHENSAITUKISU)	|| StrDLM;		--07 返済月数
	StrData := StrData || RTRIM(STRKYUYOHENSAIALL)	|| StrDLM;		--08 給与返済総額
	StrData := StrData || RTRIM(STRKYUYOHENSAI)		|| StrDLM;		--09 給与返済額
	StrData := StrData || RTRIM(STRSYOYOHENSAIALL)	|| StrDLM;		--10 賞与返済総額
	StrData := StrData || RTRIM(STRSYOYOHENSAI)		|| StrDLM;		--11 賞与返済額
	StrData := StrData || RTRIM(STRKYUYOZANDAKA)	|| StrDLM;		--12 給与残高
	StrData := StrData || RTRIM(STRSYOYOZANDAKA)	|| StrDLM;		--13 賞与残高
	StrData := StrData || RTRIM(STRKOJOCYUSIFLG)	|| StrDLM;		--14 控除中止フラグ
	StrData := StrData || RTRIM(STRKANSAIYMD)		|| StrDLM;		--15 完済日
	OtStrDatAry	:= StrData;											--情報配列

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt110SelList;
/****************************************************************************/
/* モジュール名	：QAAP_CEnt020PrintAdd										*/
/* 機能			：帳票用ワークテーブル登録									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110PrintAdd (
	 InStrSyainCD1		IN	CHAR			--社員コード１
	,InStrSyainCD2		IN	CHAR        	--社員コード２
	,InStrSimei			IN	VARCHAR2    	--氏名
	,InStrMiseNm		IN	VARCHAR2    	--店名
	,InStrYusiYMD		IN	VARCHAR2    	--融資年月日
	,InStrRiritu		IN	VARCHAR2    	--利率
	,InNumYusiKng		IN	NUMBER      	--融資金額
	,InNumKyuHensai		IN	NUMBER      	--給与返済額
	,InNumSyoHensai		IN	NUMBER      	--賞与返済額
	,InNumAryCount		IN	NUMBER      	--配列件数
	,InNumPageKBNAry	IN	typPageKBNAry	--ページ区分配列
	,InNumNenKBNAry		IN	typNenKBNAry	--年区分配列
	,InStrKBNAry		IN	typKBNAry		--区分配列
	,InStrKijituAry		IN	typKijituAry	--返済期日配列
	,InNumHensaiAry		IN	typHensaiAry	--返済金額配列
	,InNumZandakaAry	IN	typZandakaAry	--残高配列
	,InNumKyuGanAry		IN	typKyuGanAry	--給与元本配列
	,InNumKyuRskAry		IN	typKyuRskAry	--給与利息配列
	,InNumKyuZanAry		IN	typKyuZanAry	--給与残高配列
	,InNumSyoGanAry		IN	typSyoGanAry	--賞与元本配列
	,InNumSyoRskAry		IN	typSyoRskAry	--賞与利息配列
	,InNumSyoZanAry		IN	typSyoZanAry	--賞与残高配列
	,InStrCOMPUTERMEI	IN	VARCHAR2) IS	--コンピュータ名

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
END	QPAP_CEnt110PrintAdd;

/****************************************************************************/
/* モジュール名	：QPAP_CEnt110PrintDel										*/
/* 機能			：帳票用ワークテーブル削除									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110PrintDel (
	 InStrCOMPUTERMEI	IN	VARCHAR2) IS	--コンピューター名

BEGIN

	DELETE	FROM QPAL_HENYOW
	WHERE	RTRIM(QPAL_COMPUTERMEI) = RTRIM(InStrCOMPUTERMEI);

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;
END	QPAP_CEnt110PrintDel;


END QPAP_CEnt110PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR