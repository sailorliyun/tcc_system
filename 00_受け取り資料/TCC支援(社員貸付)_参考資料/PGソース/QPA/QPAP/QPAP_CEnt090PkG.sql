CREATE OR REPLACE PACKAGE  QPAP_CEnt090PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt090PkG                                                                                */
/* 機能          ：証書貸付入金入力                                                                               */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/* 修正日        ：2005/01/25                                                                                     */
/* 修正者        ：FIP SEKINE                                                                                     */
/* 修正内容      ：完済通知書出力に伴い修正。初期処理を追加（コード内容を取得）                                   */
/*                 注意！QPAP_CEnt410PkGを先にコンパイルのこと                                                    */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20100225  0908047          グループ社員証書貸付帳票見直し2次
--                           １．完済日の入力チェックを追加(本日を含む同月未来日のみ可)
--                           ２．分解・分解戻しに対応
--                               ・グリッドと子画面の残高表示に分解戻し中の金額を加える
--                               ・分解戻しを含む契約が完済された場合、分解戻しデータを分解する
--                               ・上記完済が取り消された場合、再び分解戻しにする
--                           ３．賞与の残高取得方法を賞与控除が反映される前の残高を取得するように変更する
--                               (1次の個人貸付明細での対応と同様)
--                           ４．精算金額の計算ロジックを個人貸付明細と同様にする
--                               (最終月が数円安く計算される問題に対応)
------------------------------------------------------------------------------------------------

/******************************************************************************************************************/
/*  １  宣言部                            */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
	TYPE typOtYusiYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtRirituAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKaisuAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyuyoYusiAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyoyoYusiAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyuyoHenAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyoyoHenAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyuyoZanAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyoyoZanAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;

--ADD 20100225 0908047 NBC YOKOYAMA START
	TYPE typOtKyuyoModAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyoyoModAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;
--ADD 20100225 0908047 NBC YOKOYAMA END

	TYPE typOtKansaiYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

/* 社員属性の表示 */
PROCEDURE	QPAP_Cent090SelSyainZoku (
	InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--社員コード１
	InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--社員コード２
	OtStrSimeiKana		OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,		--氏名カナ
	OtStrSimeiKanji		OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--氏名漢字
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,			--所属店コード
	OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,			--店名称
	OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--東西区分
	OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,			--所属部門コード
	OtStrBumonName		OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,			--部門名称
	OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,			--資格コード
	OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,			--等級コード
	OtStrBornYMD		OUT	VARCHAR2,								--生年月日
	OtStrSonzaiFlg		OUT	VARCHAR2);								--存在Flg (会員の存在 Check)

/* 貸付データ取得 */
PROCEDURE	QPAP_CEnt090SelList (
	InStrSyainCD1		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE,	--検索条件  社員コード１
	InStrSyainCD2		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE,	--          社員コード２
	InNumMaxRec			IN	NUMBER,									--最大配列格納件数
	IoNumCursor		IN	OUT	NUMBER,									--呼び出し回数
	OtNumRecCount		OUT	NUMBER,									--総検索件数
	OtNumAryCount		OUT	NUMBER,									--配列格納件数
	OtStrEndFlg			OUT	VARCHAR2,								--検索終了フラグ
	OtStrBonus1			OUT	CHAR,									--賞与支給日１
	OtStrBonus2			OUT	CHAR,									--賞与支給日２
	OtStrZanYMD			OUT	CHAR,									--残高更新日
	OtStrYusiYMD		OUT	typOtYusiYMDAry,						--融資日
	OtNumRiritu			OUT	typOtRirituAry,							--利率
	OtNumKaisu			OUT	typOtKaisuAry,							--回数
	OtNumKyuyoYusi		OUT	typOtKyuyoYusiAry,						--給与融資額
	OtNumSyoyoYusi		OUT	typOtSyoyoYusiAry,						--賞与融資額
	OtNumKyuyoHen		OUT	typOtKyuyoHenAry,						--給与返済額
	OtNumSyoyoHen		OUT	typOtSyoyoHenAry,						--賞与返済額
	OtNumKyuyoZan		OUT	typOtKyuyoZanAry,						--給与残高
	OtNumSyoyoZan		OUT	typOtSyoyoZanAry,						--賞与残高
--ADD 20100225 0908047 NBC YOKOYAMA START
	OtNumKyuyoMod		OUT	typOtKyuyoModAry,						--給与残高(分解戻し分)
	OtNumSyoyoMod		OUT	typOtSyoyoModAry,						--賞与残高(分解戻し分)
--ADD 20100225 0908047 NBC YOKOYAMA END
	OtStrKansaiYMD		OUT	typOtKansaiYMDAry);						--完済日

/* 入金データ登録処理 */
PROCEDURE	QPAP_CEnt090DatAdd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrNyukinYMD		IN	CHAR,									--入金日
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--入金額
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku		IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,			--利息
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2);								--担当名（オペログ用）

/* 入金データ更新処理 */
PROCEDURE	QPAP_CEnt090DatUpd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrNyukinYMD		IN	CHAR,									--入金日
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--入金額
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku		IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,			--利息
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2);								--担当名（オペログ用）

/* 入金データ削除処理 */
PROCEDURE	QPAP_CEnt090DatDel (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2);								--担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE	QPAP_CEnt090OpeLog(
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューＩＤ
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--プログラムＩＤ
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--東西区分
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード
	InStrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE	QPAP_CEnt090Lock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--識別コード
	InStrKeyInfo1		IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type,
	InStrKeyInfo2		IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type,
	InstrProgramID		IN	QSA4_HaitaT.QSA4_ProgramID%type,		--プログラムＩＤ
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type,		--コンピュータ名
	InstrOperatorID		IN	QSA4_HaitaT.QSA4_OperatorID%type);		--オペレータＩＤ

/* 解 除 */
PROCEDURE	QPAP_CEnt090UnLock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--識別コード
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type);		--コンピューター名

--ADD 2005/01/25 FROM
/* 初期処理  */
PROCEDURE	QPAP_CEnt090Init (
	OtNumDP4Count		OUT	NUMBER,									--DP4 発行日     配列格納件数
	OtStrDP4Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               配列
	OtNumDP5Count		OUT	NUMBER,									--DP5 発行者情報 配列格納件数
	OtStrDP5Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               配列
	OtNumDP6Count		OUT	NUMBER,									--DP6 ローン名称 配列格納件数
	OtStrDP6Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary);			--               配列
--ADD 2005/01/25 TO

--ADD 2005/02/10 FROM
/* 完済通知ＷＫテーブルの登録 */
PROCEDURE	QPAP_CEnt090InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,		--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,		--コンピュータ名
	InStrSyainCd1		IN	QPAZ_KansaiWT.QPAZ_SYAINCD1%TYPE,		--社員コード１ 配列
	InStrSyainCd2		IN	QPAZ_KansaiWT.QPAZ_SYAINCD2%TYPE,		--社員コード２ 配列
	InStrYushibi		IN	QPAZ_KansaiWT.QPAZ_YUSHIBI%TYPE,		--融資日 配列
	InStrYushibiWa		IN	QPAZ_KansaiWT.QPAZ_YUSHIBIWA%TYPE,		--融資日（和暦） 配列
	InStrDispNm			IN	QPAZ_KansaiWT.QPAZ_SHIMEIDISP%TYPE,		--表示用社員氏名 配列
	InStrTenCd			IN	QPAZ_KansaiWT.QPAZ_TENCD%TYPE,			--所属店コード 配列
	InStrTenNm			IN	QPAZ_KansaiWT.QPAZ_TENNM%TYPE,			--所属店名称 配列
	InStrTozai			IN	QPAZ_KansaiWT.QPAZ_TOZAI%TYPE,			--東西区分
	InStrBumonCd		IN	QPAZ_KansaiWT.QPAZ_BUMONCD%TYPE,		--所属部門コード 配列
	InStrBumonNm		IN	QPAZ_KansaiWT.QPAZ_BUMONNM%TYPE,		--所属部門名称 配列
	InStrYushiKng		IN	QPAZ_KansaiWT.QPAZ_YUSHIKNG%TYPE,		--融資金額 配列
	InStrKansaibi		IN	QPAZ_KansaiWT.QPAZ_KANSAIBI%TYPE,		--完済日 配列
	InStrKansaibiWa		IN	QPAZ_KansaiWT.QPAZ_KANSAIBIWA%TYPE,		--完済日（和暦） 配列
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,		--固定項目：発行日
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,		--        ：発行者情報１
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,		--        ：発行者情報２
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,		--        ：発行者情報３
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,		--        ：発行者情報４
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,			--        ：ローン名称
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE);	--        ：対象者一覧タイトル

/* 完済通知ＷＫテーブルの削除 */
PROCEDURE	QPAP_CEnt090DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE);			--コンピュータ名
--ADD 2005/02/10 TO


END QPAP_CEnt090PkG;
/
show error

/******************************************************************************************************************/
/*２  ボディー                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt090PkG IS

  /***  ログメッセージ定義  */
  TYPE  typMsg  IS  RECORD (
    fldTableID  CHAR(19),           /* テーブル名   */
    fldKousinKbn  CHAR(1),            /* 更新区分     */
    fldAcsKey CHAR(50),           /* アクセスキー */
    fldMsg    CHAR(100)           /* 処理コード   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent090SelSyainZoku                                             */
/* 機能      　　：社員属性の表示                                                       */
/******************************************************************************************************************/
PROCEDURE	QPAP_Cent090SelSyainZoku (
	InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--社員コード１
	InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--社員コード２
	OtStrSimeiKana		OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,		--氏名カナ
	OtStrSimeiKanji		OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--氏名漢字
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,			--所属店コード
	OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,			--店名称
	OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--東西区分
	OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,			--所属部門コード
	OtStrBumonName		OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,			--部門名称
	OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,			--資格コード
	OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,			--等級コード
	OtStrBornYMD		OUT	VARCHAR2,								--生年月日
	OtStrSonzaiFlg		OUT	VARCHAR2) IS							--存在Flg (会員の存在 Check)

  /* 処理固有の変数 */

BEGIN
  /* 出力パラメータのクリア */
  OtStrSimeiKana      := ' ';
  OtStrSimeiKanji     := ' ';
  OtStrMiseCD     := ' ';
  OtStrMiseName     := ' ';
  OtStrTozaiKBN     := ' ';
  OtStrBumonCD      := ' ';
  OtStrBumonName      := ' ';
  OtStrSikakuCD     := ' ';
  OtStrTokyuCD      := ' ';
  OtStrBornYMD      := ' ';
  OtStrSonzaiFlg      := '0';

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
    WHERE QPAC_PRMSyainCD1  = InStrPRMSyainCD1
    AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
--    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAE_PRMMiseCD
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --処理終了

END QPAP_Cent090SelSyainZoku;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090SelList                                                                            */
/* 機能          ：貸付データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090SelList (
	InStrSyainCD1		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE,	--検索条件  社員コード１
	InStrSyainCD2		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE,	--          社員コード２
	InNumMaxRec			IN	NUMBER,									--最大配列格納件数
	IoNumCursor		IN	OUT	NUMBER,									--呼び出し回数
	OtNumRecCount		OUT	NUMBER,									--総検索件数
	OtNumAryCount		OUT	NUMBER,									--配列格納件数
	OtStrEndFlg			OUT	VARCHAR2,								--検索終了フラグ
	OtStrBonus1			OUT	CHAR,									--賞与支給日１
	OtStrBonus2			OUT	CHAR,									--賞与支給日２
	OtStrZanYMD			OUT	CHAR,									--残高更新日
	OtStrYusiYMD		OUT	typOtYusiYMDAry,						--融資日
	OtNumRiritu			OUT	typOtRirituAry,							--利率
	OtNumKaisu			OUT	typOtKaisuAry,							--回数
	OtNumKyuyoYusi		OUT	typOtKyuyoYusiAry,						--給与融資額
	OtNumSyoyoYusi		OUT	typOtSyoyoYusiAry,						--賞与融資額
	OtNumKyuyoHen		OUT	typOtKyuyoHenAry,						--給与返済額
	OtNumSyoyoHen		OUT	typOtSyoyoHenAry,						--賞与返済額
	OtNumKyuyoZan		OUT	typOtKyuyoZanAry,						--給与残高
	OtNumSyoyoZan		OUT	typOtSyoyoZanAry,						--賞与残高
--ADD 20100225 0908047 NBC YOKOYAMA START
	OtNumKyuyoMod		OUT	typOtKyuyoModAry,						--給与残高(分解戻し分)
	OtNumSyoyoMod		OUT	typOtSyoyoModAry,						--賞与残高(分解戻し分)
--ADD 20100225 0908047 NBC YOKOYAMA END
	OtStrKansaiYMD		OUT	typOtKansaiYMDAry) IS					--完済日

  /* 処理固有の変数 */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;

  v_Bonus1      CHAR(4);
  v_Bonus2      CHAR(4);
  v_ZanYMD      CHAR(8);

  v_YusiYMD     CHAR(8);
  v_Riritu      QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_Kaisu       QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KyuyoYusi     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_SyoyoYusi     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_KyuyoHen      QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SyoyoHen      QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KyuyoZan      QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZan      QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KansaiYMD     CHAR(8);
--ADD 20100225 0908047 NBC YOKOYAMA START
  v_SyoyoZandk    QPAY_SYNDAICYOWT.QPAY_SYOYOZANDAKA%TYPE;
--ADD 20100225 0908047 NBC YOKOYAMA END
BEGIN

/* ----- ＳＴＥＰ１ 表示データ総件数取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    OtstrEndFlg := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount := 0;

    /* 社員マスタ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Bonus1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Bonus2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Bonus1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Bonus2);
      /* パラメータに渡す */
      OtStrBonus1 := v_Bonus1;
      OtStrBonus2 := v_Bonus2;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 最新残高更新日取得 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(MAX(QPAT_YMD),''YYYYMMDD'')';
    StrSQL := StrSQL || ' FROM QPAT_ZANYMD';
    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_ZanYMD,8);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_ZanYMD);
      OtStrZanYMD := v_ZanYMD;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 社員融資台帳存在チェックＳＱＬ */
    v_NumCount  := 0;
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT COUNT(*)';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
    StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';
    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
      OtNumRecCount := v_NumCount;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  END IF;

/* ----- ＳＴＥＰ２ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* 社員融資台帳検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(QPA8_HENSAITUKISU,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(TO_CHAR(QPA8_KANSAIYMD,''YYYYMMDD''),'' '')';
--ADD 20100225 0908047 NBC YOKOYAMA START
    StrSQL := StrSQL || ' ,NVL(QPAY_SYOYOZANDAKA,0)';
--ADD 20100225 0908047 NBC YOKOYAMA END
--MOD 20100225 0908047 NBC YOKOYAMA START
--    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT , QPAY_SYNDAICYOWT ';
--MOD 20100225 0908047 NBC YOKOYAMA END
    StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';
--ADD 20100225 0908047 NBC YOKOYAMA START
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD1 = QPAY_PRMSYAINCD1 (+)';
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = QPAY_PRMSYAINCD2 (+)';
    StrSQL := StrSQL || ' AND QPA8_PRMYUSIYMD  = QPAY_PRMYUSIYMD (+)';
--ADD 20100225 0908047 NBC YOKOYAMA END
    StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* ２回目以降はカーソルを再利用する */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_YusiYMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Riritu);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisu);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KyuyoYusi);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_SyoyoYusi);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_KyuyoHen);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_SyoyoHen);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_KyuyoZan);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_SyoyoZan);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KansaiYMD,8);
--ADD 20100225 0908047 NBC YOKOYAMA START
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SyoyoZandk);
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_YusiYMD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Riritu);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisu);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KyuyoYusi);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_SyoyoYusi);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_KyuyoHen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_SyoyoHen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_KyuyoZan);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_SyoyoZan);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KansaiYMD);
--ADD 20100225 0908047 NBC YOKOYAMA START
    DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SyoyoZandk);
--ADD 20100225 0908047 NBC YOKOYAMA END

    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrYusiYMD(NumIdx) := v_YusiYMD;
    OtNumRiritu(NumIdx) := v_Riritu;
    OtNumKaisu(NumIdx) := v_Kaisu;
    OtNumKyuyoYusi(NumIdx) := v_KyuyoYusi;
    OtNumSyoyoYusi(NumIdx) := v_SyoyoYusi;
    OtNumKyuyoHen(NumIdx) := v_KyuyoHen;
    OtNumSyoyoHen(NumIdx) := v_SyoyoHen;
    OtNumKyuyoZan(NumIdx) := v_KyuyoZan;
--MOD 20100225 0908047 NBC YOKOYAMA START
--    OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
    IF v_SyoyoZandk = 0 THEN
        OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
    ELSE
        OtNumSyoyoZan(NumIdx) := v_SyoyoZandk;
    END IF;
--MOD 20100225 0908047 NBC YOKOYAMA END
    OtStrKansaiYMD(NumIdx) := v_KansaiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
    --分解戻し分を取得
    SELECT
      SUM(CASE QPB2_YUSIKBN WHEN '3' THEN NVL(QPB2_GANKIN + QPB2_RISOKU,0) END) 
     ,SUM(CASE QPB2_YUSIKBN WHEN '4' THEN NVL(QPB2_GANKIN + QPB2_RISOKU,0) END) 
    INTO 
      OtNumKyuyoMod(NumIdx) 
     ,OtNumSyoyoMod(NumIdx)
    FROM QPB2_BUNKAI
    WHERE QPB2_SYAINCD1 = InStrSyainCD1
      AND QPB2_SYAINCD2 = InStrSyainCD2
      AND QPB2_SYUBETU = '2'	--証書
      AND QPB2_YUSIYMD = v_YusiYMD
      AND QPB2_BUNMODFLG = '0';

    IF OtNumKyuyoMod(NumIdx) is NULL THEN
        OtNumKyuyoMod(NumIdx) := 0;
    END IF;
    IF OtNumSyoyoMod(NumIdx) is NULL THEN
        OtNumSyoyoMod(NumIdx) := 0;
    END IF;
--ADD 20100225 0908047 NBC YOKOYAMA END

    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;              --パラメータにセット
  OtStrEndFlg := '1';               --パラメータにセット（検索終了）

  /* 動的カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt090SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090DatAdd                                                                             */
/* 機能          ：入金データの登録                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatAdd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrNyukinYMD		IN	CHAR,									--入金日
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--入金額
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku			IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,		--利息
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2) IS							--担当名（オペログ用）

  numStep     NUMBER   := 0;            /* 処理ステップ  */
  numErr      NUMBER   := 0;            /* SQLCODEの退避 */
  strErrMsg   VARCHAR2(100);            /* SQLERRMの退避 */
  recMsg      typMsg;
  strLogMsg   QUS2_OpeLogT.QUS2_MSG%TYPE;

  v_SysDate   CHAR(8);

BEGIN

  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --テーブル名
  recMsg.fldKousinKbn := '1';             --更新区分
  recMsg.fldAcsKey  := InStrSyainCD2;         --更新キー

  /* サーバーＳＹＳＴＥＭ日付 */
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

  /*  社員融資入金テーブル登録  */
  INSERT INTO QPA9_SYNNYUKINT VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,TO_DATE(InStrYusiYMD,'YYYYMMDD')
    ,TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,NVL(InNumNyukin,0)
    ,TO_DATE(v_SysDate,'YYYYMMDD')
    );

  /* 社員融資台帳テーブルの更新 */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* 分解利息テーブル登録 */
  INSERT INTO QPB5_BUNKAIRSK VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,'2'				--ローン種別
    ,TO_DATE(InStrYusiYMD,'YYYYMMDD')
    ,TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,NVL(InNumRisoku,0)
    ,InStrUserID
    ,InStrComputerNM
    ,Sysdate
    );

  /* 分解テーブル更新 */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNMODFLG  = '1'					--分解・分解戻しフラグ
      ,QPB2_KNSIFLG    = '1'					--完済フラグ
      ,QPB2_BUNKAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')		--分解処理日
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--更新履歴フラグ(0と1を反転)
      ,QPB2_TANTOCD    = InstrUserID				--ユーザー名
      ,QPB2_COMPUTERNM = InstrComputerNM				--コンピュータ名
      ,QPB2_KOUSINYMD  = Sysdate					--更新日時
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1				--社員コード１
  AND QPB2_SYAINCD2  = InStrSyainCD2				--社員コード２
  AND QPB2_SYUBETU   = '2'						--ローン種別(1：小口、2：証書)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--融資日
  AND QPB2_BUNMODFLG = '0';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）社員融資入金テーブルの登録を正常に行った。';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);

    /* ロールバック */
    ROLLBACK;

    /* オペレーションログ出力 */
    IF numStep < 1 THEN
      recMsg.fldMsg := '（' || InStrTantoNM || '）社員融資入金テーブルの登録に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090DatUpd                                                                             */
/* 機能          ：入金データの更新                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatUpd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrNyukinYMD		IN	CHAR,									--入金日
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--入金額
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku			IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,		--利息
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2) IS							--担当名（オペログ用）

   numStep      NUMBER   := 0;          /* 処理ステップ  */
   numErr       NUMBER   := 0;          /* SQLCODEの退避 */
   strErrMsg      VARCHAR2(100);          /* SQLERRMの退避 */
   recMsg       typMsg;
   strLogMsg      QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --テーブル名
  recMsg.fldKousinKbn := '2';             --更新区分
  recMsg.fldAcsKey  := InStrSyainCD2;         --更新キー

  /* 社員融資入金テーブルの更新 */
  UPDATE QPA9_SYNNYUKINT SET
     QPA9_NYUKINYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,QPA9_NYUKINGAKU = InNumNyukin
  WHERE QPA9_PRMSYAINCD1 = InStrSyainCD1
  AND QPA9_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA9_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

  /* 社員融資台帳テーブルの更新 */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* 分解利息テーブル更新 */
  UPDATE QPB5_BUNKAIRSK SET
      QPB5_NYUKINYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
     ,QPB5_RISOKU     = InNumRisoku
     ,QPB5_TANTOCD    = InstrUserID				--ユーザー名
     ,QPB5_COMPUTERNM = InstrComputerNM			--コンピュータ名
     ,QPB5_TOUROKUYMD = Sysdate					--更新日時
  WHERE
      QPB5_SYAINCD1  = InStrSyainCD1			--社員コード１
  AND QPB5_SYAINCD2  = InStrSyainCD2			--社員コード２
  AND QPB5_SYUBETU   = '2'						--ローン種別(1：小口、2：証書)
  AND QPB5_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--融資日
  ;

  /* 分解テーブル更新 */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNKAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')		--分解処理日
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--更新履歴フラグ(0と1を反転)
      ,QPB2_TANTOCD    = InstrUserID							--ユーザー名
      ,QPB2_COMPUTERNM = InstrComputerNM						--コンピュータ名
      ,QPB2_KOUSINYMD  = Sysdate								--更新日時
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1							--社員コード１
  AND QPB2_SYAINCD2  = InStrSyainCD2							--社員コード２
  AND QPB2_SYUBETU   = '2'										--ローン種別(1：小口、2：証書)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--融資日
  AND QPB2_BUNMODFLG = '1'
  AND QPB2_KNSIFLG   = '1';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）社員融資入金テーブルの更新を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);

    /* ロールバック */
    ROLLBACK;

    /* オペレーションログ出力 */
    IF numStep < 1 THEN
      recMsg.fldMsg := '（' || InStrTantoNM || '社員融資入金テーブルの更新に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090Del                                                                                */
/* 機能          ：入金データの削除                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatDel (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--社員コード１
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--社員コード２
	InStrYusiYMD		IN	CHAR,									--融資日
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューID（オペログ用）
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--モジュールID（オペログ用）
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ（オペログ用）
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ名（オペログ用）
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--利用区分（オペログ用）
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード（オペログ用）
	InStrTantoNM		IN	VARCHAR2) IS							--担当名（オペログ用）

   numStep      NUMBER   := 0;          /* 処理ステップ  */
   numErr             NUMBER   := 0;          /* SQLCODEの退避 */
   strErrMsg      VARCHAR2(100);          /* SQLERRMの退避 */
   recMsg       typMsg;
   strLogMsg      QUS2_OpeLogT.QUS2_MSG%TYPE;
BEGIN

  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --テーブル名
  recMsg.fldKousinKbn := '3';             --更新区分
  recMsg.fldAcsKey  := InStrSyainCD2;         --更新キー

  /* 社員融資入金テーブルの削除 */
  DELETE FROM     QPA9_SYNNYUKINT
         WHERE  QPA9_PRMSYAINCD1 = InStrSyainCD1
         AND  QPA9_PRMSYAINCD2 = InStrSyainCD2
         AND  TO_CHAR(QPA9_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

  /* 社員融資台帳テーブルの更新 */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = NULL
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* 分解利息テーブルの削除 */
  DELETE FROM QPB5_BUNKAIRSK
  WHERE 
      QPB5_SYAINCD1  = InStrSyainCD1				--社員コード１
  AND QPB5_SYAINCD2  = InStrSyainCD2				--社員コード２
  AND QPB5_SYUBETU   = '2'					--ローン種別(1：小口、2：証書)
  AND QPB5_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--融資日
  ;

  /* 分解テーブル更新 */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNMODFLG  = '0'					--分解・分解戻しフラグ
      ,QPB2_KNSIFLG    = '0'					--完済フラグ
      ,QPB2_BUNKAIYMD  = Null					--分解処理日
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--更新履歴フラグ(0と1を反転)
      ,QPB2_TANTOCD    = InstrUserID				--ユーザー名
      ,QPB2_COMPUTERNM = InstrComputerNM			--コンピュータ名
      ,QPB2_KOUSINYMD  = Sysdate				--更新日時
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1				--社員コード１
  AND QPB2_SYAINCD2  = InStrSyainCD2				--社員コード２
  AND QPB2_SYUBETU   = '2'					--ローン種別(1：小口、2：証書)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--融資日
  AND QPB2_KNSIFLG   = '1';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）社員融資入金テーブルの削除を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);


EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);

    /* ロールバック */
    ROLLBACK;

    /* オペレーションログ出力 */
    IF numStep < 1 THEN
      recMsg.fldMsg := '（' || InStrTantoNM || '）社員融資入金テーブルの削除に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090OpeLog                                                   */
/* 機能          ：オペログへの追加                                                     */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090OpeLog(
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--メニューＩＤ
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--プログラムＩＤ
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--ユーザＩＤ
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--コンピュータ
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--東西区分
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--部署コード
	InStrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE) IS			--メッセージ

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
  WHEN  OTHERS  THEN
    RAISE ;                 /* オペログのエラーを認める */
END  QPAP_CEnt090OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090Lock                                                                               */
/* 機能          ：社員融資入金テーブルのロック                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090Lock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--識別コード
	InStrKeyInfo1		IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type,
	InStrKeyInfo2		IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type,
	InstrProgramID		IN	QSA4_HaitaT.QSA4_ProgramID%type,		--プログラムＩＤ
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type,		--コンピュータ名
	InstrOperatorID		IN	QSA4_HaitaT.QSA4_OperatorID%type) IS	--オペレータＩＤ

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN
  /* 社員融資入金テーブルの確認 */
  numErr  := 0;
  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerNM, fldOperatorID
      from QSA4_HaitaT
     where QSA4_PRMJobKbn  = 'P'
       and QSA4_PRMSikibetu  = InstrSikibetu
       and QSA4_PRMKeyInfo1  = InStrKeyInfo1
       and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
  exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    /* 社員融資台帳の確認 */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '080'
         and QSA4_PRMKeyInfo1  = InStrKeyInfo1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;

  end if;

  if numErr = 0 then
    RAISE W_HAITASeikyu;
  else
    /* 控除中止の確認 */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '160'
         and QSA4_PRMKeyInfo1  = InStrKeyInfo1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;

  end if;

  if numErr = 0 then
    RAISE W_HAITASeikyu;
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
  WHEN W_HAITADUPLICATE THEN              --社員融資入金テーブル作業中
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt090Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN              --社員融資入金テーブル２重キー
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt090Lock DUPLICATE KEY' );
  WHEN W_HAITASeikyu THEN   --控除中止作業中
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt090Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt090Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt090UnLock                                                                             */
/* 機能          ：社員融資入金テーブルのロック解除                                                           */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090UnLock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--識別コード
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type) IS	--コンピューター名

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

END QPAP_CEnt090UnLock ;

--ADD 2005/01/25 FROM
/*****************************************************************************/
/* モジュール名		：QPAP_CEnt090Init										 */
/* 機能				：初期処理												 */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt090Init (
	OtNumDP4Count		OUT	NUMBER,									--DP4 発行日     配列格納件数
	OtStrDP4Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               配列
	OtNumDP5Count		OUT	NUMBER,									--DP5 発行者情報 配列格納件数
	OtStrDP5Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               配列
	OtNumDP6Count		OUT	NUMBER,									--DP6 ローン名称 配列格納件数
	OtStrDP6Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary) IS			--               配列
	--処理個別の変数
	NumWk				NUMBER;

BEGIN

	/* 発行日 （件数・名称） */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP4',								--コード区分
		OtNumDP4Count,						--発行日 件数
		OtStrDP4Ary);						--発行日 配列

	/* 発行者情報（件数・名称） */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP5',								--コード区分
		OtNumDP5Count,						--発行者情報 件数
		OtStrDP5Ary);						--発行者情報 配列

	/* ローン名称（件数・名称） */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP6',								--コード区分
		OtNumDP6Count,						--ローン名称 件数
		OtStrDP6Ary);						--ローン名称 配列

END QPAP_CEnt090Init;
--ADD 2005/01/25 TO
--ADD 2005/02/10 FROM
/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt090InsWkTbl                                      */
/* 機能          ：完済通知ＷＫテーブルの登録                                */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt090InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--コンピュータ名
	InStrSyainCd1		IN	QPAZ_KansaiWT.QPAZ_SYAINCD1%TYPE,				--社員コード１ 配列
	InStrSyainCd2		IN	QPAZ_KansaiWT.QPAZ_SYAINCD2%TYPE,				--社員コード２ 配列
	InStrYushibi		IN	QPAZ_KansaiWT.QPAZ_YUSHIBI%TYPE,				--融資日 配列
	InStrYushibiWa		IN	QPAZ_KansaiWT.QPAZ_YUSHIBIWA%TYPE,				--融資日（和暦） 配列
	InStrDispNm			IN	QPAZ_KansaiWT.QPAZ_SHIMEIDISP%TYPE,				--表示用社員氏名 配列
	InStrTenCd			IN	QPAZ_KansaiWT.QPAZ_TENCD%TYPE,					--所属店コード 配列
	InStrTenNm			IN	QPAZ_KansaiWT.QPAZ_TENNM%TYPE,					--所属店名称 配列
	InStrTozai			IN	QPAZ_KansaiWT.QPAZ_TOZAI%TYPE,					--東西区分
	InStrBumonCd		IN	QPAZ_KansaiWT.QPAZ_BUMONCD%TYPE,				--所属部門コード 配列
	InStrBumonNm		IN	QPAZ_KansaiWT.QPAZ_BUMONNM%TYPE,				--所属部門名称 配列
	InStrYushiKng		IN	QPAZ_KansaiWT.QPAZ_YUSHIKNG%TYPE,				--融資金額 配列
	InStrKansaibi		IN	QPAZ_KansaiWT.QPAZ_KANSAIBI%TYPE,				--完済日 配列
	InStrKansaibiWa		IN	QPAZ_KansaiWT.QPAZ_KANSAIBIWA%TYPE,				--完済日（和暦） 配列
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--固定項目：発行日
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        ：発行者情報１
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        ：発行者情報２
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        ：発行者情報３
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        ：発行者情報４
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        ：ローン名称
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE) IS			--        ：対象者一覧タイトル

	/* 処理固有の変数 */

BEGIN

	/* 印刷データのクリアＳＰ */
	QPAP_CEnt090DelWkTbl(
		InStrOperatorID			--オペレータＩＤ
	,	InStrComputerMei		--コンピュータ名
	);

	/* ＩＮＳＥＲＴ */
	INSERT INTO QPAZ_KansaiWT VALUES
	   (SUBSTRB(InStrComputerMei,1,20)		--01 コンピューター名
	,   SUBSTRB(InStrOperatorID,1,8)		--02 オペレーターＩＤ
	,	InStrSyainCd1						--03 社員コード１
	,	InStrSyainCd2						--04 社員コード２
	,	InStrYushibi						--05 融資日
	,	InStrYushibiWa						--06 融資日（和暦）
	,	InStrDispNm							--07 表示用氏名
	,	InStrTenCd							--08 所属店コード
	,	InStrTenNm							--09 所属店名
	,	InStrTozai							--10 東西区分
	,	InStrBumonCd						--11 所属部門コード
	,	InStrBumonNm						--12 所属部門名
	,	InStrYushiKng						--13 融資金額
	,	InStrKansaibi						--14 完済日
	,	InStrKansaibiWa						--15 完済日（和暦）
	,	InStrHakkoubi						--16 発行日
	,	InStrHakkouInfo1					--17 発行者情報１
	,	InStrHakkouInfo2					--18 発行者情報２
	,	InStrHakkouInfo3					--19 発行者情報３
	,	InStrHakkouInfo4					--20 発行者情報４
	,	InStrLoanNm							--21 ローン名称
	,	InStrTitle							--22 対象者一覧タイトル
	);

	--COMMIT
	COMMIT;

 EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt090InsWkTbl;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt090DelWkTbl                                      */
/* 機能          ：完済通知ＷＫテーブルの削除                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt090DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--オペレータＩＤ
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE) IS			--コンピュータ名

BEGIN

	DELETE
		FROM QPAZ_KansaiWT
	WHERE
			QPAZ_TANMATSUID		= InStrComputerMei
		AND	QPAZ_TANTOID		= InStrOperatorID;

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt090DelWkTbl;
--ADD 2005/02/10 TO

END QPAP_CEnt090PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
