CREATE OR REPLACE PACKAGE  QPAP_Cent510PkG IS
/****************************************************************************************************************/
/* システム名	：高島屋クレジットシステム																		*/
/* 業務名		：分解・分解戻し入力																			*/
/* モジュール名	：QPAP_Cent510PkG																				*/
/* 機能			：分解・分解戻し入力																			*/
/* 作成日		：2010/02/25																					*/
/* 作成者		：FIP																							*/
/****************************************************************************************************************/

/****************************************************************************************************************/
/*	１	宣言部																									*/
/****************************************************************************************************************/

  StrDLM  CHAR(1) := '|';				--区切文字

/* 各行を格納するための配列定義 */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
	INDEX BY BINARY_INTEGER;

/* 社員属性の表示 */
PROCEDURE QPAP_Cent510SelSyainZoku (
   InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE	--社員コード１
  ,InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE	--社員コード２
  ,OtStrSimeiKana	OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE		--氏名カナ
  ,OtStrSimeiKanji	OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE	--氏名漢字
  ,OtStrMiseCD		OUT	QPAC_SyainM.QPAC_MiseCD%TYPE		--所属店コード
  ,OtStrMiseName	OUT	QPAE_MiseM.QPAE_MiseNm%TYPE			--店名称
  ,OtStrTozaiKBN	OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE		--東西区分
  ,OtStrBumonCD 	OUT	QPAC_SyainM.QPAC_BumonCD%TYPE		--所属部門コード
  ,OtStrBumonName	OUT	QPAF_BumonM.QPAF_BumonNm%TYPE		--部門名称
  ,OtStrSikakuCD	OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE		--資格コード
  ,OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE		--等級コード
  ,OtStrBornYMD		OUT	VARCHAR2							--生年月日
  ,OtStrSonzaiFlg	OUT	VARCHAR2);							--存在Flg (会員の存在 Check)

/*グリッド表示情報取得 */
PROCEDURE QPAP_CEnt510GetGridData (
   InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE	--社員コード１
  ,InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE	--社員コード２
  ,InNumMaxRec		IN	NUMBER								--最大配列格納件数
  ,IoNumFetchCount	IN	OUT NUMBER							--読み込み件数
  ,IoNumRecCount	IN	OUT NUMBER							--総検索件数
  ,OtNumAryCount	OUT	NUMBER								--配列格納件数
  ,OtStrDataAry		OUT	typDataAry							--証書明細 配列
  ,OtStrEndFlg		OUT	VARCHAR2);							--検索終了フラグ

/*分解戻し(INSERT)*/
PROCEDURE QPAP_CEnt510ModoshiINS (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD			IN  CHAR								--融資日
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD			IN  CHAR								--控除日
  ,InNumGankin			IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE		--元金
  ,InNumRisoku			IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE		--利息
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID			IN  VARCHAR2							--担当者ID（オペログ用）
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD			IN  VARCHAR2							--部署コード（オペログ用）
  ,InStrTantoNM			IN  VARCHAR2);							--担当名（オペログ用）

/*分解戻し(UPDATE)*/
PROCEDURE QPAP_CEnt510ModoshiUPD (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD			IN  CHAR								--融資日
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD			IN  CHAR								--控除日
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID			IN  VARCHAR2							--担当者ID（オペログ用）
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD			IN  VARCHAR2							--部署コード（オペログ用）
  ,InStrTantoNM			IN  VARCHAR2);							--担当名（オペログ用）

/*分解*/
PROCEDURE QPAP_CEnt510Bunkai (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD			IN  CHAR								--融資日
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD			IN  CHAR								--控除日
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--メニューID（オペログ用）
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID			IN  VARCHAR2							--担当者ID（オペログ用）
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--利用区分（オペログ用）
  ,InStrBushoCD			IN  VARCHAR2 							--部署コード（オペログ用）
  ,InStrTantoNM			IN  VARCHAR2);							--担当名（オペログ用）

/* オペログへの出力  */
PROCEDURE QPAP_CEnt510OpeLog (
   InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューＩＤ
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--プログラムＩＤ
  ,InStrUserID		IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--ユーザＩＤ
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--コンピュータ
  ,InStrTozaiKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--東西区分
  ,InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--部署コード
  ,InstrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt510Lock(
   InStrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type	/* 識別コード		*/
  ,InStrKeyInfo1	IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type	/* 内部会員番号1	*/
  ,InStrKeyInfo2	IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type	/* 内部会員番号2	*/
  ,InStrProgramID	IN	QSA4_HaitaT.QSA4_ProgramID%type		/* プログラムＩＤ	*/
  ,InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type	/* コンピュータ名	*/
  ,InStrOperatorID	IN	QSA4_HaitaT.QSA4_OperatorID%type);	/* オペレータＩＤ	*/

/* 解 除 */
PROCEDURE QPAP_CEnt510UnLock(
   InstrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type	--識別コード
  ,InstrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type);	--コンピューター名

END QPAP_Cent510PkG;
/
SHOW ERROR

/****************************************************************************************************************/
/*	２	ボディー																								*/
/****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent510PkG IS

  /* 証書明細一覧カーソル */
  CURSOR CurSyouMei(SyainCD1_I	IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	SELECT
	  *
	FROM
	  QPA8_SYNDAICYOT
	WHERE
	  QPA8_PRMSYAINCD1	= SyainCD1_I  AND
	  QPA8_PRMSYAINCD2	= SyainCD2_I
	ORDER BY QPA8_PRMSYAINCD1,QPA8_PRMSYAINCD2,QPA8_PRMYUSIYMD ASC;

  /* 総件数取得カーソル */
  CURSOR CurCount(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	-->>>>>>>>>>>>１控除T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select Sum(CNT) NumCount From (
	Select
		count(*) CNT
	From 
		QPAA_KOJOT
		,QPA8_SYNDAICYOT
	Where 
		QPAA_SYAINCD1 = SyainCD1_I
	And QPAA_SYAINCD2 = SyainCD2_I
	--前月控除
	And (TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--オペ日>=6日のみ当月控除も
	Or TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--オペ日5/21～6/30のみ6月賞与控除も
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPAA_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ12月賞与控除も
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPAA_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--証書台帳Tと結合
	And QPAA_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPAA_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPAA_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<１控除T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union All
	-->>>>>>>>>>>>２控除履歴T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		count(*) CNT   	
	From 
		QPB0_KOJORRKT
		,QPA8_SYNDAICYOT
	Where 
		QPB0_SYAINCD1 = SyainCD1_I
	And QPB0_SYAINCD2 = SyainCD2_I
	--前月控除
	And (TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--オペ日>=6日のみ当月控除も
	Or TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--オペ日5/21～6/30のみ6月賞与控除も
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPB0_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ12月賞与控除も
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPB0_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--証書台帳Tと結合
	And QPB0_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB0_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB0_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<２控除履歴T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union All
	-->>>>>>>>>>>>３分解T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select 
		count(*) CNT
	From
		 QPB2_BUNKAI
		,QPA8_SYNDAICYOT
	Where
		QPB2_SYAINCD1 = SyainCD1_I
	And QPB2_SYAINCD2 = SyainCD2_I
	And (QPB2_BUNMODFLG = '0'
	--分解前月控除
	Or (QPB2_BUNMODFLG = '1' And TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25')
	--オペ日>=6日のみ分解当月控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
		 And  QPB2_BUNMODFLG			 = Case When to_char(sysdate,'dd') >= '06' Then
											  '1' End)
	--オペ日5/21～6/30のみ分解6月賞与控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											 To_char(Sysdate,'YYYY') || '06' End
		 And  QPB2_BUNMODFLG		   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '1' End
		 And  QPB2_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ分解12月賞与控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 To_char(Sysdate,'YYYY') || '12' End
		 And  QPB2_BUNMODFLG		   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '1' End
		 And  QPB2_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '4' End))
	--証書台帳Tと結合
	And QPB2_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB2_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB2_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<３分解T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	);

  /* グリッド表示用カーソル */
  CURSOR CurGrid(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	-->>>>>>>>>>>>１控除T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		 Nvl(QPAA_YUSIYMD,'')		YUSIYMD		--融資日(証書のみ)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--利率(証書のみ)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--返済回数(証書のみ)
		,QPAA_KOJOYMD				KOJOYMD		--控除日
		,QPAA_GANKIN				GANKIN		--元金
		,QPAA_RISOKU				RISOKU		--利息
		,null						BUNKAIYMD	--分解日
		,'0'						BUNKAIMEMO	--分解メモ
		,Decode(QPAA_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--賞与メモ
		,''							KANSAIFLG	--完済フラグ
	From 
		QPAA_KOJOT
		,QPA8_SYNDAICYOT
	Where 
		QPAA_SYAINCD1 = SyainCD1_I
	And QPAA_SYAINCD2 = SyainCD2_I
	--前月控除
	And (TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--オペ日>=6日のみ当月控除も
	Or TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--オペ日5/21～6/30のみ6月賞与控除も
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPAA_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ12月賞与控除も
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPAA_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--証書台帳Tと結合
	And QPAA_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPAA_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPAA_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<１控除T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union
	-->>>>>>>>>>>>２控除履歴T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		 Nvl(QPB0_YUSIYMD,'')		YUSIYMD		--融資日(証書のみ)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--利率(証書のみ)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--返済回数(証書のみ)
		,QPB0_KOJOYMD				KOJOYMD		--控除日
		,QPB0_GANKIN				GANKIN		--元金
		,QPB0_RISOKU				RISOKU		--利息
		,null						BUNKAIYMD	--分解日
		,'0'						BUNKAIMEMO	--分解メモ
		,Decode(QPB0_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--賞与メモ
		,''							KANSAIFLG	--完済フラグ
	From 
		QPB0_KOJORRKT
		,QPA8_SYNDAICYOT
	Where 
		QPB0_SYAINCD1 = SyainCD1_I
	And QPB0_SYAINCD2 = SyainCD2_I
	--前月控除
	And (TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--オペ日>=6日のみ当月控除も
	Or TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--オペ日5/21～6/30のみ6月賞与控除も
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPB0_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ12月賞与控除も
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPB0_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--証書台帳Tと結合
	And QPB0_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB0_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB0_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<２控除履歴T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union
	-->>>>>>>>>>>>３分解T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select 
		 Nvl(QPB2_YUSIYMD,'')		YUSIYMD		--融資日(証書のみ)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--利率(証書のみ)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--返済回数(証書のみ)
		,QPB2_KOJOYMD				KOJOYMD		--控除日
		,QPB2_GANKIN				GANKIN		--元金
		,QPB2_RISOKU				RISOKU		--利息
		,QPB2_BUNKAIYMD				BUNKAIYMD	--分解日
		,Decode(QPB2_BUNMODFLG,'0','1','1','2','')	BUNKAIMEMO--分解メモ
		,Decode(QPB2_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--賞与メモ
		,QPB2_KNSIFLG				KANSAIFLG	--完済フラグ
	From
		 QPB2_BUNKAI
		,QPA8_SYNDAICYOT
	Where
		QPB2_SYAINCD1 = SyainCD1_I
	And QPB2_SYAINCD2 = SyainCD2_I
	And (QPB2_BUNMODFLG = '0'
	--分解前月控除
	Or (QPB2_BUNMODFLG = '1' And TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25')
	--オペ日>=6日のみ分解当月控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
		 And  QPB2_BUNMODFLG			 = Case When to_char(sysdate,'dd') >= '06' Then
											  '1' End)
	--オペ日5/21～6/30のみ分解6月賞与控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											 To_char(Sysdate,'YYYY') || '06' End
		 And  QPB2_BUNMODFLG		   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '1' End
		 And  QPB2_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--オペ日11/11～12/31のみ分解12月賞与控除も
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 To_char(Sysdate,'YYYY') || '12' End
		 And  QPB2_BUNMODFLG		   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '1' End
		 And  QPB2_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '4' End))
	--証書台帳Tと結合
	And QPB2_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB2_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB2_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<３分解T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Order By
		KOJOYMD Desc,YUSIYMD Asc,BUNKAIMEMO Desc;

  /***	ログメッセージ定義	*/
  TYPE	typMsg	IS	RECORD (
	fldTableID	  CHAR(19), 					/* テーブル名	*/
	fldKousinKBN  CHAR(1),						/* 更新区分		*/
	fldAcsKey	CHAR(50),						/* アクセスキー	*/
	fldMsg		CHAR(100)						/* 処理コード	*/
  );
  TYPE	typMsgIdx IS  TABLE OF	typMsg	INDEX BY  BINARY_INTEGER;

  /***	ユーザ定義例外定義	*/
  W_HAITADUPLICATE	EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu	, -20022);

/****************************************************************************************************************/
/* モジュール名  ：QPAP_Cent510SelSyainZoku 																	*/
/* 機能 		 ：社員属性の表示																				*/
/****************************************************************************************************************/
PROCEDURE QPAP_Cent510SelSyainZoku (
  InStrPRMSyainCD1	IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--社員コード１
  InStrPRMSyainCD2	IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--社員コード２
  OtStrSimeiKana	OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,	--氏名カナ
  OtStrSimeiKanji	OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--氏名漢字
  OtStrMiseCD		OUT QPAC_SyainM.QPAC_MiseCD%TYPE,		--所属店コード
  OtStrMiseName 	OUT QPAE_MiseM.QPAE_MiseNm%TYPE,		--店名称
  OtStrTozaiKBN 	OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--東西区分
  OtStrBumonCD		OUT QPAC_SyainM.QPAC_BumonCD%TYPE,		--所属部門コード
  OtStrBumonName	OUT QPAF_BumonM.QPAF_BumonNm%TYPE,		--部門名称
  OtStrSikakuCD 	OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,		--資格コード
  OtStrTokyuCD		OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,		--等級コード
  OtStrBornYMD		OUT VARCHAR2,							--生年月日
  OtStrSonzaiFlg	OUT VARCHAR2) IS						--存在Flg (会員の存在 Check)

  /* 処理固有の変数 */

BEGIN
  /* 出力パラメータのクリア */
  OtStrSimeiKana	:= ' ';
  OtStrSimeiKanji	:= ' ';
  OtStrMiseCD		:= ' ';
  OtStrMiseName		:= ' ';
  OtStrTozaiKBN		:= ' ';
  OtStrBumonCD		:= ' ';
  OtStrBumonName	:= ' ';
  OtStrSikakuCD		:= ' ';
  OtStrTokyuCD		:= ' ';
  OtStrBornYMD		:= ' ';
  OtStrSonzaiFlg	:= '0';

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
	  TO_CHAR(QPAC_BornYMD,'YYYYMMDD')
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
	  OtStrBornYMD
	FROM  QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
	WHERE QPAC_PRMSyainCD1	= InStrPRMSyainCD1
	AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
--	  AND QPAC_MiseCD	= QPAE_PRMMiseCD(+)
	AND QPAC_MiseCD   = QPAE_PRMMiseCD
	AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
	AND QPAC_BumonCD	= QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN	NO_DATA_FOUND THEN
		RETURN; 			--処理終了

END QPAP_Cent510SelSyainZoku;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt510GetGridData																		*/
/* 機能 		 ：グリッド表示情報の検索＆取得 																*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510GetGridData (
  InStrPRMSyainCD1	IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--社員コード１
  InStrPRMSyainCD2	IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--社員コード２
  InNumMaxRec		IN  NUMBER,								--最大配列格納件数
  IoNumFetchCount	IN  OUT NUMBER,							--読み込み件数
  IoNumRecCount		IN  OUT NUMBER,							--総検索件数
  OtNumAryCount		OUT NUMBER,								--配列格納件数
  OtStrDataAry		OUT typDataAry,							--証書明細 配列
  OtStrEndFlg		OUT VARCHAR2) IS						--検索終了フラグ

  /* 処理固有の変数 */
  NumIdx		NUMBER;
  NumSumCount	NUMBER;
  StrData		VARCHAR2(200);

  /* 行変数 */
  RowCount		CurCount%ROWTYPE;		--総件数カーソル
  RowGrid		CurGrid%ROWTYPE;		--グリッド表示データカーソル

BEGIN
  /* 出力パラメータの初期化 */
  OtNumAryCount	:= 0;
  OtStrEndFlg	:= '0';

  IF CurGrid%ISOPEN = FALSE THEN
	/* グリッド表示情報 総件数取得 */
	NumSumCount := 0;
	OPEN CurCount(InStrPRMSyainCD1,InStrPRMSyainCD2);	  --総件数カーソルのオープン
	LOOP
	  FETCH CurCount INTO RowCount;
	  IF  CurCount%NOTFOUND THEN
		EXIT;
	  END IF;
	  NumSumCount := NumSumCount + RowCount.NumCount;
	END LOOP;
	IoNumRecCount :=  NumSumCount;			--パラメータにセット
	CLOSE CurCount; 			  --総件数カーソルのクローズ

	/* グリッド表示情報 カーソルのオープン */
	OPEN CurGrid(InStrPRMSyainCD1,InStrPRMSyainCD2);
  END IF;

  NumIdx	  := 0;
  OtStrEndFlg	:= '0';

  LOOP

	FETCH CurGrid INTO RowGrid; 		--順読み
	IoNumFetchCount := IoNumFetchCount + 1;
	IF	CurGrid%NOTFOUND THEN
	  EXIT; 			  --ループ終了
	END IF;

	/* グリッド表示情報の出力パラメータの編集 */
	NumIdx := NumIdx + 1;

	StrData := Null;
	StrData := StrData || TO_CHAR(RowGrid.YUSIYMD,'YYYYMMDD')	|| StrDLM;	--融資日
	StrData := StrData || RowGrid.RIRITU						|| StrDLM;	--契約利率
	StrData := StrData || RowGrid.HENSAIKAISU					|| StrDLM;	--返済回数
	StrData := StrData || TO_CHAR(RowGrid.KOJOYMD,'YYYYMMDD')	|| StrDLM;	--控除日
	StrData := StrData || RowGrid.GANKIN						|| StrDLM;	--元金
	StrData := StrData || RowGrid.RISOKU						|| StrDLM;	--利息
	StrData := StrData || TO_CHAR(RowGrid.BUNKAIYMD,'YYYYMMDD')	|| StrDLM;	--分解日
	StrData := StrData || RowGrid.BUNKAIMEMO					|| StrDLM;	--分解メモ
	StrData := StrData || RowGrid.SYOYOMEMO						|| StrDLM;	--賞与メモ
	StrData := StrData || RowGrid.KANSAIFLG						|| StrDLM;	--完済フラグ
	OtStrDataAry(NumIdx)  := StrData;

	/* 配列の件数がＭＡＸになった場合 */
	IF InNumMaxRec <> 0 	AND
	   InNumMaxRec <= NumIdx  THEN
	  OtNumAryCount :=	NumIdx;
	  RETURN;				--プロシージャの終了（カーソルをクローズしない）
	END IF;

  END LOOP;

  OtStrEndFlg :=  '1';				--検索終了
  OtNumAryCount :=	NumIdx;
  /* グリッド表示情報カーソルのクローズ */
  CLOSE CurGrid;

EXCEPTION
  WHEN	OTHERS	THEN
	IF CurCount%ISOPEN THEN
	  CLOSE CurCount;
	END IF;
	IF CurGrid%ISOPEN THEN
	  CLOSE CurGrid;
	END IF;
	RAISE ;
END QPAP_CEnt510GetGridData;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt510ModoshiINS																		*/
/* 機能			：分解戻しを行う(分解TにINSERT)																	*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510ModoshiINS (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD		  IN  CHAR									--融資日
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD		  IN  CHAR									--控除日
  ,InNumGankin		  IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE			--元金
  ,InNumRisoku		  IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE			--利息
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		  IN  VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD 	  IN  VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM 	  IN  VARCHAR2) IS							--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPB2_BUNKAI';		--テーブル名
  recMsg.fldKousinKBN := '1';				--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  INSERT INTO QPB2_BUNKAI VALUES(
	 InStrPRMSyainCD1						--社員コード１
	,InStrPRMSyainCD2						--社員コード２
	,InstrLoanSyubetsu						--ローン種別(1：小口、2：証書)
	,TO_DATE(InstrYusiYMD,'YYYY/MM/DD')		--融資日
	,InstrKyuyoSyoyoKBN						--給与賞与区分(3：給与、4：賞与)
	,TO_DATE(InstrKojoYMD,'YYYY/MM/DD')		--控除日
	,'0'									--分解・分解戻しフラグ
	,Null									--分解処理日
	,'0'									--完済フラグ
	,InNumGankin							--元金
	,InNumRisoku							--利息
	,'0'									--更新履歴フラグ
	,InStrUserID							--ユーザー名
	,InstrComputerNM						--コンピュータ名
	,Sysdate								--登録日時
	,Sysdate								--更新日時
	);

  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの登録を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの登録に失敗した';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510ModoshiINS ;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt510ModoshiUPD																		*/
/* 機能			：分解戻しを行う(分解TをUPDATE)																	*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510ModoshiUPD (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD		  IN  CHAR									--融資日
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD		  IN  CHAR									--控除日
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		  IN  VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD		  IN  VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM		  IN  VARCHAR2) IS							--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPB2_BUNKAI';	--テーブル名
  recMsg.fldKousinKBN := '2';		--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  UPDATE QPB2_BUNKAI SET
	 QPB2_BUNMODFLG  = '0'									--分解・分解戻しフラグ
	,QPB2_BUNKAIYMD  = Null									--分解処理日
	,QPB2_RRKFLG	 = Decode(QPB2_RRKFLG,'0','1','1','0')	--更新履歴フラグ(0と1を反転)
	,QPB2_TANTOCD	 = InstrUserID							--ユーザー名
	,QPB2_COMPUTERNM = InstrComputerNM						--コンピュータ名
	,QPB2_KOUSINYMD  = Sysdate								--更新日時
  WHERE
	   QPB2_SYAINCD1  = InStrPRMSyainCD1					--社員コード１
   AND QPB2_SYAINCD2  = InStrPRMSyainCD2					--社員コード２
   AND QPB2_SYUBETU   = InstrLoanSyubetsu					--ローン種別(1：小口、2：証書)
   AND (QPB2_YUSIYMD  = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')	--融資日
		OR QPB2_YUSIYMD IS NULL)
   AND QPB2_YUSIKBN   = InstrKyuyoSyoyoKBN					--給与賞与区分(3：給与、4：賞与)
   AND QPB2_KOJOYMD   = TO_DATE(InstrKojoYMD,'YYYY/MM/DD')	--控除日
   AND QPB2_BUNMODFLG = '1';

  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの更新を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの更新に失敗した';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510ModoshiUPD ;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt510Bunkai																			*/
/* 機能			：分解を行う(分解TをUPDATE)																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510Bunkai (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--社員コード１
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--社員コード２
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--ローン種別(1：小口、2：証書)
  ,InstrYusiYMD		  IN  CHAR									--融資日
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--給与賞与区分(3：給与、4：賞与)
  ,InstrKojoYMD		  IN  CHAR									--控除日
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--メニューID（オペログ用）
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--モジュールID（オペログ用）
  ,InStrUserID		  IN  VARCHAR2								--担当者ID（オペログ用）
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--コンピュータ名（オペログ用）
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--利用区分（オペログ用）
  ,InStrBushoCD		  IN  VARCHAR2								--部署コード（オペログ用）
  ,InStrTantoNM		  IN  VARCHAR2) IS							--担当名（オペログ用）

  numStep		NUMBER	 := 0;			/* 処理ステップ  */
  numErr		NUMBER	 := 0;			/* SQLCODEの退避 */
  strErrMsg 	VARCHAR2(100);			/* SQLERRMの退避 */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPB2_BUNKAI';		--テーブル名
  recMsg.fldKousinKBN := '2';				--更新区分
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--更新キー

  UPDATE QPB2_BUNKAI SET
	 QPB2_BUNMODFLG  = '1'									--分解・分解戻しフラグ
	,QPB2_BUNKAIYMD  = Sysdate								--分解処理日
	,QPB2_RRKFLG	 = Decode(QPB2_RRKFLG,'0','1','1','0')	--更新履歴フラグ(0と1を反転)
	,QPB2_TANTOCD	 = InstrUserID							--ユーザー名
	,QPB2_COMPUTERNM = InstrComputerNM						--コンピュータ名
	,QPB2_KOUSINYMD  = Sysdate								--更新日時
  WHERE
	   QPB2_SYAINCD1  = InStrPRMSyainCD1					--社員コード１
   AND QPB2_SYAINCD2  = InStrPRMSyainCD2					--社員コード２
   AND QPB2_SYUBETU   = InstrLoanSyubetsu					--ローン種別(1：小口、2：証書)
   AND (QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')	--融資日
		OR QPB2_YUSIYMD IS NULL)
   AND QPB2_YUSIKBN   = InstrKyuyoSyoyoKBN					--給与賞与区分(3：給与、4：賞与)
   AND QPB2_KOJOYMD   = TO_DATE(InstrKojoYMD,'YYYY/MM/DD')	--控除日
   AND QPB2_BUNMODFLG = '0';

  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの更新を正常に行った。';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ロールバック */
	ROLLBACK;

	/* オペレーションログ出力 */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '（' || InStrTantoNM || '）分解テーブルの更新に失敗した';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510Bunkai ;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt510OpeLog																			*/
/* 機能			：オペログへの追加																				*/
/****************************************************************************************************************/
PROCEDURE  QPAP_CEnt510OpeLog(
   InStrMenuID	   IN	 QUS2_OpeLogT.QUS2_MENUID%TYPE		/* メニューＩＤ   */
  ,InStrModuleID   IN	 QUS2_OpeLogT.QUS2_MODULEID%TYPE	/* プログラムＩＤ */
  ,InStrUserID	   IN	 QUS2_OpeLogT.QUS2_USERID%TYPE		/* ユーザＩＤ	  */
  ,InStrComputerNM IN	 QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE /* コンピュータ   */
  ,InStrTozaiKBN   IN	 QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	/* 東西区分 	  */
  ,InStrBushoCD    IN	 QUS2_OpeLogT.QUS2_BUSHOCD%TYPE 	/* 部署コード	  */
  ,InstrMsg		   IN	 QUS2_OpeLogT.QUS2_MSG%TYPE ) IS	/* メッセージ	  */

BEGIN
  QUSP_LogPkg.QUSP_WriteOpeLog(
	  InStrMenuID,
	  InStrModuleID,
	  InStrUserID,
	  InStrComputerNM,
	  InStrTozaiKBN,
	  InStrBushoCD,
	  InstrMsg);
EXCEPTION
  WHEN	OTHERS	THEN
	RAISE;	  /* オペログのエラーを認める */
END  QPAP_CEnt510OpeLog;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt510Lock 																			*/
/* 機能 		 ：貸付問合せのロック																			*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510Lock(
  InStrSikibetu   IN	QSA4_HaitaT.QSA4_PRMSikibetu%type		/* 識別コード	*/
  ,InStrKeyInfo1	IN	  QSA4_HaitaT.QSA4_PRMKeyInfo1%type 	  /* 内部会員番号1	*/
  ,InStrKeyInfo2	IN	  QSA4_HaitaT.QSA4_PRMKeyInfo2%type 	  /* 内部会員番号2	*/
  ,InStrProgramID	IN	  QSA4_HaitaT.QSA4_ProgramID%type		  /* プログラムＩＤ */
  ,InStrComputerNM	IN	  QSA4_HaitaT.QSA4_ComputerMei%type 	  /* コンピュータ名 */
  ,InStrOperatorID	IN	  QSA4_HaitaT.QSA4_OperatorID%type) IS		/* オペレータＩＤ */

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr		number := 0;

BEGIN

  begin
	select QSA4_ComputerMei, QSA4_OperatorID
	  into fldComputerNM, fldOperatorID
	  from QSA4_HaitaT
	 where QSA4_PRMJobKbn  = 'P'
	   and QSA4_PRMSikibetu  = InstrSikibetu
	   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--内部会員番号1
	   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--内部会員番号2
  exception
	WHEN NO_DATA_FOUND THEN
	  numErr := SQLCODE;
	WHEN OTHERS THEN
	  RAISE;
  end;

  if numErr = 0 then
	RAISE W_HAITADUPLICATE;
  else
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		and QSA4_PRMSikibetu  = '010'
		  and QSA4_PRMKeyInfo1	 = InStrKeyInfo1	--内部会員番号1
		  and QSA4_PRMKeyInfo1	 = InStrKeyInfo2;	--内部会員番号2
	exception
	  WHEN NO_DATA_FOUND THEN
		numErr := SQLCODE;
	  WHEN OTHERS THEN
		RAISE;
	end;
  end if;

  if numErr = 0 then
	RAISE W_HAITADUPLICATE;
  else
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		 and QSA4_PRMSikibetu = '080'
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--内部会員番号1
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--内部会員番号2
	exception
	  WHEN NO_DATA_FOUND THEN
		numErr := SQLCODE;
	  WHEN OTHERS THEN
		RAISE;
	end;
  end if;

  if numErr = 0 then
	RAISE W_HAITADUPLICATE;
  else
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		 and QSA4_PRMSikibetu = '090'
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--内部会員番号1
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--内部会員番号2
	exception
	  WHEN NO_DATA_FOUND THEN
		numErr := SQLCODE;
	  WHEN OTHERS THEN
		RAISE;
	end;
  end if;

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
	  'P',
	  InstrSikibetu,
	  InStrKeyInfo1,
	  InStrKeyInfo2,
	  'P',
	  'P',
	  'P',
	  InstrProgramID,
	  InStrComputerNM,
	  InstrOperatorID,
	  sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN			  --貸付残高テーブル作業中
	RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt510Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN			  --貸付残高テーブル２重キー
	RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt510Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
	ROLLBACK;
	RAISE;
END QPAP_CEnt510Lock ;

/****************************************************************************************************************/
/* モジュール名	：QPAP_CEnt510UnLock																			*/
/* 機能			：貸付問合せのロック解除																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510UnLock(
  InstrSikibetu   IN  QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt510UnLock ;

END QPAP_Cent510PkG;

/***END of LINE****************************************************************************************************/
/
SHOW ERROR
