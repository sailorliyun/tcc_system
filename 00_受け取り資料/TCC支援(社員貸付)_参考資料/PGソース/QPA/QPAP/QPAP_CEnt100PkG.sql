CREATE OR REPLACE PACKAGE  QPAP_CEnt100PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt100PkG                                                                                */
/* 機能          ：個人貸付明細                                                                                   */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/*                                                                                                                */
/*修正履歴*/
/* ---------------------------------------------------------------------------------------------------------------*/
/*  更新日付  案件番号  修正担当      修正理由                                                                  　*/
/*  20090828　0811051   murayama@NBC  グループ社員証書貸付帳票見直し                                              */
/*                                    賞与控除二重減算の抑止を追加                                                */
/* ---------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------*/
/*更新日付  案件/障害番号    修正理由                                                                             */
/*20100225  0908047          グループ社員証書貸付帳票見直し2次                                                    */
/*                           分解戻し対応、返送金額の算出方法修正                                                 */
/*	20100827	1004091		IMZ SHIBUTANI	振込先情報の取得方法変更への対応									*/
/*----------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/

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

--ADD 20100225 0908047 NBC SAWAME START
  TYPE typOtKyuyoModAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModRisokuAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModRisokuAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModAllAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModAllAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModRisokuAllAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModRisokuAllAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;
--ADD 20100225 0908047 NBC SAWAME END

/* 社員属性の表示 */
PROCEDURE QPAP_Cent100SelSyainZoku (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  OtStrSimeiKana      OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,  --氏名カナ
  OtStrSimeiKanji     OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE, --氏名漢字
  OtStrMiseCD     OUT QPAC_SyainM.QPAC_MiseCD%TYPE,   --所属店コード
  OtStrMiseName     OUT QPAE_MiseM.QPAE_MiseNm%TYPE,    --店名称
  OtStrTozaiKBN     OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --東西区分
  OtStrBumonCD      OUT QPAC_SyainM.QPAC_BumonCD%TYPE,    --所属部門コード
  OtStrBumonName      OUT QPAF_BumonM.QPAF_BumonNm%TYPE,    --部門名称
  OtStrSikakuCD     OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,   --資格コード
  OtStrTokyuCD      OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,    --等級コード
  OtStrBornYMD      OUT VARCHAR2,       --生年月日
  OtStrSonzaiFlg      OUT VARCHAR2);        --存在Flg (会員の存在 Check)

/* 貸付データ取得 */
PROCEDURE QPAP_CEnt100SelList (
   InStrSyainCD1    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE   --検索条件  社員コード１
  ,InStrSyainCD2    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE   --          社員コード２
  ,InNumMaxRec    IN  NUMBER            --最大配列格納件数
  ,IoNumCursor    IN OUT  NUMBER            --呼び出し回数
  ,OtNumRecCount    OUT NUMBER            --総検索件数
  ,OtNumAryCount    OUT NUMBER            --配列格納件数
  ,OtStrEndFlg    OUT VARCHAR2          --検索終了フラグ
  ,OtStrBonus1    OUT CHAR            --賞与支給日１
  ,OtStrBonus2    OUT CHAR            --賞与支給日２
  ,OtStrZanYMD    OUT CHAR            --残高更新日
  ,OtStrYusiYMD   OUT typOtYusiYMDAry         --融資日
  ,OtNumRiritu    OUT typOtRirituAry                --利率
  ,OtNumKaisu   OUT typOtKaisuAry               --回数
  ,OtNumKyuyoYusi   OUT typOtKyuyoYusiAry             --給与融資額
  ,OtNumSyoyoYusi   OUT typOtSyoyoYusiAry             --賞与融資額
  ,OtNumKyuyoHen    OUT typOtKyuyoHenAry              --給与返済額
  ,OtNumSyoyoHen    OUT typOtSyoyoHenAry              --賞与返済額
  ,OtNumKyuyoZan    OUT typOtKyuyoZanAry              --給与残高
--MOD 20100225 0908047 NBC SAWAME START
--  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry);              --賞与残高
  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry               --賞与残高
  ,OtNumKyuyoMod    OUT typOtKyuyoModAry               --給与残高(分解戻し分元本(sysdate以前))
  ,OtNumSyoyoMod    OUT typOtSyoyoModAry               --賞与残高(分解戻し分元本(sysdate以前))
  ,OtNumKyuyoModRisoku    OUT typOtKyuyoModRisokuAry   --給与残高(分解戻し分利息(sysdate以前))
  ,OtNumSyoyoModRisoku    OUT typOtSyoyoModRisokuAry   --賞与残高(分解戻し分利息(sysdate以前))
  ,OtNumKyuyoModAll    OUT typOtKyuyoModAllAry               --給与残高(分解戻し分元本(全て))
  ,OtNumSyoyoModAll    OUT typOtSyoyoModAllAry               --賞与残高(分解戻し分元本(全て))
  ,OtNumKyuyoModRisokuAll    OUT typOtKyuyoModRisokuAllAry   --給与残高(分解戻し分利息(全て))
  ,OtNumSyoyoModRisokuAll    OUT typOtSyoyoModRisokuAllAry); --賞与残高(分解戻し分利息(全て))
--MOD 20100225 0908047 NBC SAWAME END

/* 計算書データ登録処理 */
PROCEDURE QPAP_CEnt100DatAdd (
   InStrSyainCD1      IN  QPAM_SYNKEISANW.QPAM_SYAINCD1%TYPE    --社員コード１
  ,InStrSyainCD2      IN  QPAM_SYNKEISANW.QPAM_SYAINCD2%TYPE    --社員コード２
  ,InStrSimeiKanji    IN  QPAM_SYNKEISANW.QPAM_SIMEIKANJI%TYPE    --氏名漢字
  ,InStrMiseNM      IN  QPAM_SYNKEISANW.QPAM_MISENM%TYPE    --店名称
  ,InStrYusiYMD     IN  QPAM_SYNKEISANW.QPAM_YUSIYMD%TYPE   --融資日
  ,InNumKyuyoHen      IN  QPAM_SYNKEISANW.QPAM_KYUYOYUSIGAKU%TYPE   --給与返済額
  ,InNUMSyoyoHen      IN  QPAM_SYNKEISANW.QPAM_SYOYOYUSIGAKU%TYPE   --賞与返済額
  ,InNumKyuyoZan      IN  QPAM_SYNKEISANW.QPAM_KYUYOZANGANPON%TYPE  --給与残元本
  ,InNUMSyoyoZan      IN  QPAM_SYNKEISANW.QPAM_SYOYOZANGANPON%TYPE  --賞与算元本
  ,InStrKyuyoStr    IN  QPAM_SYNKEISANW.QPAM_KYUYOKEISANS%TYPE    --給与計算開始日
  ,InStrSyoyoStr    IN  QPAM_SYNKEISANW.QPAM_SYOYOKEISANS%TYPE    --賞与計算開始日
  ,InStrSeisanYMD   IN  QPAM_SYNKEISANW.QPAM_SEISANYMD%TYPE   --精算年月日
  ,InNumRiritu    IN  QPAM_SYNKEISANW.QPAM_RIRITU%TYPE    --利率
  ,InNumKyuyoRisoku IN  QPAM_SYNKEISANW.QPAM_KYUYORISOKU%TYPE   --給与利息
  ,InNumSyoyoRisoku IN  QPAM_SYNKEISANW.QPAM_SYOYORISOKU%TYPE   --賞与利息
  ,InStrTenbikiKBN  IN  QPAM_SYNKEISANW.QPAM_TENBIKIKBN%TYPE    --天引区分
  ,InNumKyuyoTen    IN  QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE  --給与天引額
  ,InNumSyoyoTen    IN  QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE  --賞与天引額
  ,InStrKyuyoKBN    IN  QPAM_SYNKEISANW.QPAM_KYUYOKOSINKBN%TYPE   --給与更新区分
  ,InStrSyoyoKBN    IN  QPAM_SYNKEISANW.QPAM_SYOYOKOSINKBN%TYPE   --賞与更新区分
  ,InNumKyuyoNisu   IN  QPAM_SYNKEISANW.QPAM_KYUYONISU%TYPE   --給与日数
  ,InNumSyoyoNisu   IN  QPAM_SYNKEISANW.QPAM_SYOYONISU%TYPE   --賞与日数
  ,InStrUserID        IN  QPAM_SYNKEISANW.QPAM_USERID%TYPE    --ユーザＩＤ
  ,InStrComputerNM    IN  QPAM_SYNKEISANW.QPAM_COMPUTERNM%TYPE    --コンピュータ名
);

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt100DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);       --コンピュータ名

--ADD 20100225 0908047 NBC YOKOYAMA START
/* 控除予定が分解戻しされていないかどうかを判断 */
PROCEDURE QPAP_CEnt100CheckModoshi (
   InStrSyainCD1    IN  QPB2_BUNKAI.QPB2_SYAINCD1%TYPE   --検索条件  社員コード１
  ,InStrSyainCD2    IN  QPB2_BUNKAI.QPB2_SYAINCD2%TYPE   --          社員コード２
  ,InStrYusiYMD     IN  CHAR                             --          融資日
  ,InStrKojoYMD     IN  CHAR                             --          控除日
  ,InStrYusiKBN     IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE    --          給与賞与区分(３：給与、４：賞与)
  ,OtStrFLG         OUT CHAR);                           --存在フラグ
--ADD 20100225 0908047 NBC YOKOYAMA END
END QPAP_CEnt100PkG;
/
show error
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt100PkG                                                                                */
/* 機能          ：個人貸付明細                                                                                   */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/*２  ボディー                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt100PkG IS

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent100SelSyainZoku                                             */
/* 機能      　　：社員属性の表示                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent100SelSyainZoku (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  OtStrSimeiKana      OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,  --氏名カナ
  OtStrSimeiKanji     OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE, --氏名漢字
  OtStrMiseCD     OUT QPAC_SyainM.QPAC_MiseCD%TYPE,   --所属店コード
  OtStrMiseName     OUT QPAE_MiseM.QPAE_MiseNm%TYPE,    --店名称
  OtStrTozaiKBN     OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --東西区分
  OtStrBumonCD      OUT QPAC_SyainM.QPAC_BumonCD%TYPE,    --所属部門コード
  OtStrBumonName      OUT QPAF_BumonM.QPAF_BumonNm%TYPE,    --部門名称
  OtStrSikakuCD     OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,   --資格コード
  OtStrTokyuCD      OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,    --等級コード
  OtStrBornYMD      OUT VARCHAR2,       --生年月日
  OtStrSonzaiFlg      OUT VARCHAR2) IS        --存在Flg (会員の存在 Check)

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
    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --処理終了

END QPAP_Cent100SelSyainZoku;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt100SelList                                                                            */
/* 機能          ：貸付データ取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt100SelList (
   InStrSyainCD1    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE   --検索条件  社員コード１
  ,InStrSyainCD2    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE   --          社員コード２
  ,InNumMaxRec    IN  NUMBER            --最大配列格納件数
  ,IoNumCursor    IN OUT  NUMBER            --呼び出し回数
  ,OtNumRecCount    OUT NUMBER            --総検索件数
  ,OtNumAryCount    OUT NUMBER            --配列格納件数
  ,OtStrEndFlg    OUT VARCHAR2          --検索終了フラグ
  ,OtStrBonus1    OUT CHAR            --賞与支給日１
  ,OtStrBonus2    OUT CHAR            --賞与支給日２
  ,OtStrZanYMD    OUT CHAR            --残高更新日
  ,OtStrYusiYMD   OUT typOtYusiYMDAry         --融資日
  ,OtNumRiritu    OUT typOtRirituAry                --利率
  ,OtNumKaisu   OUT typOtKaisuAry               --回数
  ,OtNumKyuyoYusi   OUT typOtKyuyoYusiAry             --給与融資額
  ,OtNumSyoyoYusi   OUT typOtSyoyoYusiAry             --賞与融資額
  ,OtNumKyuyoHen    OUT typOtKyuyoHenAry              --給与返済額
  ,OtNumSyoyoHen    OUT typOtSyoyoHenAry              --賞与返済額
  ,OtNumKyuyoZan    OUT typOtKyuyoZanAry              --給与残高
--MOD 20100225 0908047 NBC SAWAME START
--  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry) IS              --賞与残高
  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry                    --賞与残高
  ,OtNumKyuyoMod    OUT typOtKyuyoModAry                    --給与残高(分解戻し分元本(sysdate以前))
  ,OtNumSyoyoMod    OUT typOtSyoyoModAry                    --賞与残高(分解戻し分元本(sysdate以前))
  ,OtNumKyuyoModRisoku    OUT typOtKyuyoModRisokuAry        --給与残高(分解戻し分利息(sysdate以前))
  ,OtNumSyoyoModRisoku    OUT typOtSyoyoModRisokuAry        --賞与残高(分解戻し分利息(sysdate以前))
  ,OtNumKyuyoModAll    OUT typOtKyuyoModAllAry                    --給与残高(分解戻し分元本(全て))
  ,OtNumSyoyoModAll    OUT typOtSyoyoModAllAry                    --賞与残高(分解戻し分元本(全て))
  ,OtNumKyuyoModRisokuAll    OUT typOtKyuyoModRisokuAllAry        --給与残高(分解戻し分利息(全て))
  ,OtNumSyoyoModRisokuAll    OUT typOtSyoyoModRisokuAllAry) IS    --賞与残高(分解戻し分利息(全て))
--MOD 20100225 0908047 NBC SAWAME END

  /* 処理固有の変数 */	
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;
--ADD 20100225 0908047 NBC SAWAME START
  v_CursorID2   NUMBER := 0;
  v_Dummy2      INTEGER;
--ADD 20100225 0908047 NBC SAWAME END

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

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  v_SyoyoZandk    QPAY_SYNDAICYOWT.QPAY_SYOYOZANDAKA%TYPE;
/*ADD 20090828 0811051 NBC MURAYAMA END*/

--ADD 20100225 0908047 NBC SAWAME START
  v_KyuyoMod      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_SyoyoMod      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_KyuyoModRisoku   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_SyoyoModRisoku   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_KyuyoModAll      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_SyoyoModAll      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_KyuyoModRisokuAll   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_SyoyoModRisokuAll   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
--ADD 20100225 0908047 NBC SAWAME END

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

/*DEL 20090828 0811051 NBC MURAYAMA START*/
    /* 社員融資台帳検索 */
--  StrSQL := NULL;  
--  StrSQL := StrSQL || 'SELECT';  
--  StrSQL := StrSQL || ' TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD''),';  
--  StrSQL := StrSQL || ' NVL(QPA8_RIRITU,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_HENSAITUKISU,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAIALL,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAIALL,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAI,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAI,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOZANDAKA,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOZANDAKA,0),';  
--  StrSQL := StrSQL || ' TO_CHAR(QPA8_KANSAIYMD,''YYYYMMDD'')';  
--  StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';  */
--  StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';  
--  StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';  
--  StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';  
/*DEL 20090828 0811051 NBC MURAYAMA END*/

/*MOD 20090828 0811051 NBC MURAYAMA START*/
	/* 賞与控除の二重減算を抑止 */
    /* 社員融資台帳検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(P8.QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_HENSAITUKISU,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' TO_CHAR(P8.QPA8_KANSAIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' PY.QPAY_SYOYOZANDAKA';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT P8, QPAY_SYNDAICYOWT PY';
    StrSQL := StrSQL || ' WHERE P8.QPA8_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD1 = PY.QPAY_PRMSYAINCD1 (+)';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD2 = PY.QPAY_PRMSYAINCD2 (+)';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMYUSIYMD = PY.QPAY_PRMYUSIYMD (+)';
    StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';
/*MOD 20090828 0811051 NBC MURAYAMA END

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

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SyoyoZandk);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

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

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SyoyoZandk);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

--ADD 20100225 0908047 NBC SAWAME START
    /* 分解戻し分（SYSDATE以前）取得 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_GANKIN,0) END) AS KYUYOGANALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_GANKIN,0) END) AS SYOYOGANALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_RISOKU,0) END) AS KYUYORISOKUALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_RISOKU,0) END) AS SYOYORISOKUALL';
    StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
    StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPB2_SYUBETU = ''2''';
    StrSQL := StrSQL || ' AND QPB2_YUSIYMD = :YMD';
    StrSQL := StrSQL || ' AND QPB2_BUNMODFLG = ''0''';
    StrSQL := StrSQL || ' AND QPB2_KOJOYMD <= TO_DATE(TO_CHAR(SYSDATE,''YYYYMMDD''),''YYYYMMDD'')';
    
    /* 動的カーソルのオープン */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YusiYMD,8);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KyuyoMod);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SyoyoMod);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KyuyoModRisoku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_SyoyoModRisoku);
    /* SQLの実行 */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    /* カラム値を変数へ格納 */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_KyuyoMod);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SyoyoMod);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KyuyoModRisoku);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_SyoyoModRisoku);
    END IF;
    /* 動的カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    
    /* 分解戻し分（全て）取得 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_GANKIN,0) END) AS KYUYOGAN';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_GANKIN,0) END) AS SYOYOGAN';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_RISOKU,0) END) AS KYUYORISOKU';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_RISOKU,0) END) AS SYOYORISOKU';
    StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
    StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPB2_SYUBETU = ''2''';
    StrSQL := StrSQL || ' AND QPB2_YUSIYMD = :YMD';
    StrSQL := StrSQL || ' AND QPB2_BUNMODFLG = ''0''';
    
    /* 動的カーソルのオープン */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YusiYMD,8);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KyuyoModAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SyoyoModAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KyuyoModRisokuAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_SyoyoModRisokuAll);
    /* SQLの実行 */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    /* カラム値を変数へ格納 */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_KyuyoModAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SyoyoModAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KyuyoModRisokuAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_SyoyoModRisokuAll);
    END IF;
    /* 動的カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
--ADD 20100225 0908047 NBC SAWAME END
    
    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrYusiYMD(NumIdx) := v_YusiYMD;
    OtNumRiritu(NumIdx) := v_Riritu;
    OtNumKaisu(NumIdx) := v_Kaisu;
    OtNumKyuyoYusi(NumIdx) := v_KyuyoYusi;
    OtNumSyoyoYusi(NumIdx) := v_SyoyoYusi;
    OtNumKyuyoHen(NumIdx) := v_KyuyoHen;
    OtNumSyoyoHen(NumIdx) := v_SyoyoHen;
    IF (v_KansaiYMD IS NULL)
        OR (RTRIM(LTRIM(v_KansaiYMD)) = '') THEN
      OtNumKyuyoZan(NumIdx) := v_KyuyoZan;

/*DEL 20090828 0811051 NBC MURAYAMA START*/
--      OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
/*DEL 20090828 0811051 NBC MURAYAMA END*/

/*MOD 20090828 0811051 NBC MURAYAMA START*/
	  IF (v_SyoyoZandk = 0) or (v_SyoyoZandk is null) THEN
        OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
	  ELSE
		OtNumSyoyoZan(NumIdx) := v_SyoyoZandk;
	  END IF;
/*MOD 20090828 0811051 NBC MURAYAMA END*/

    ELSE
      OtNumKyuyoZan(NumIdx) := 0;
      OtNumSyoyoZan(NumIdx) := 0;
    END IF;
    
--ADD 20100225 0908047 NBC SAWAME START
   OtNumKyuyoMod(NumIdx) := NVL(v_KyuyoMod,0);
   OtNumSyoyoMod(NumIdx) := NVL(v_SyoyoMod,0);
   OtNumKyuyoModRisoku(NumIdx) := NVL(v_KyuyoModRisoku,0);
   OtNumSyoyoModRisoku(NumIdx) := NVL(v_SyoyoModRisoku,0);
   OtNumKyuyoModAll(NumIdx) := NVL(v_KyuyoModAll,0);
   OtNumSyoyoModAll(NumIdx) := NVL(v_SyoyoModAll,0);
   OtNumKyuyoModRisokuAll(NumIdx) := NVL(v_KyuyoModRisokuAll,0);
   OtNumSyoyoModRisokuAll(NumIdx) := NVL(v_SyoyoModRisokuAll,0);
--ADD 20100225 0908047 NBC SAWAME END

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
--ADD 20100225 0908047 NBC SAWAME START
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
--ADD 20100225 0908047 NBC SAWAME END
    RAISE ;

END QPAP_CEnt100SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt100DatAdd                                                                             */
/* 機能          ：計算書データ登録処理                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt100DatAdd (
   InStrSyainCD1      IN  QPAM_SYNKEISANW.QPAM_SYAINCD1%TYPE    --社員コード１
  ,InStrSyainCD2      IN  QPAM_SYNKEISANW.QPAM_SYAINCD2%TYPE    --社員コード２
  ,InStrSimeiKanji    IN  QPAM_SYNKEISANW.QPAM_SIMEIKANJI%TYPE    --氏名漢字
  ,InStrMiseNM      IN  QPAM_SYNKEISANW.QPAM_MISENM%TYPE    --店名称
  ,InStrYusiYMD     IN  QPAM_SYNKEISANW.QPAM_YUSIYMD%TYPE   --融資日
  ,InNumKyuyoHen      IN  QPAM_SYNKEISANW.QPAM_KYUYOYUSIGAKU%TYPE   --給与返済額
  ,InNUMSyoyoHen      IN  QPAM_SYNKEISANW.QPAM_SYOYOYUSIGAKU%TYPE   --賞与返済額
  ,InNumKyuyoZan      IN  QPAM_SYNKEISANW.QPAM_KYUYOZANGANPON%TYPE  --給与残元本
  ,InNUMSyoyoZan      IN  QPAM_SYNKEISANW.QPAM_SYOYOZANGANPON%TYPE  --賞与算元本
  ,InStrKyuyoStr    IN  QPAM_SYNKEISANW.QPAM_KYUYOKEISANS%TYPE    --給与計算開始日
  ,InStrSyoyoStr    IN  QPAM_SYNKEISANW.QPAM_SYOYOKEISANS%TYPE    --賞与計算開始日
  ,InStrSeisanYMD   IN  QPAM_SYNKEISANW.QPAM_SEISANYMD%TYPE   --精算年月日
  ,InNumRiritu    IN  QPAM_SYNKEISANW.QPAM_RIRITU%TYPE    --利率
  ,InNumKyuyoRisoku IN  QPAM_SYNKEISANW.QPAM_KYUYORISOKU%TYPE   --給与利息
  ,InNumSyoyoRisoku IN  QPAM_SYNKEISANW.QPAM_SYOYORISOKU%TYPE   --賞与利息
  ,InStrTenbikiKBN  IN  QPAM_SYNKEISANW.QPAM_TENBIKIKBN%TYPE    --天引区分
  ,InNumKyuyoTen    IN  QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE  --給与天引額
  ,InNumSyoyoTen    IN  QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE  --賞与天引額
  ,InStrKyuyoKBN    IN  QPAM_SYNKEISANW.QPAM_KYUYOKOSINKBN%TYPE   --給与更新区分
  ,InStrSyoyoKBN    IN  QPAM_SYNKEISANW.QPAM_SYOYOKOSINKBN%TYPE   --賞与更新区分
  ,InNumKyuyoNisu   IN  QPAM_SYNKEISANW.QPAM_KYUYONISU%TYPE   --給与日数
  ,InNumSyoyoNisu   IN  QPAM_SYNKEISANW.QPAM_SYOYONISU%TYPE   --賞与日数
  ,InStrUserID        IN  QPAM_SYNKEISANW.QPAM_USERID%TYPE    --ユーザＩＤ
  ,InStrComputerNM    IN  QPAM_SYNKEISANW.QPAM_COMPUTERNM%TYPE    --コンピュータ名
) IS

  /* 処理固有の変数 */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--  v_Zaimu       QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE;
--  v_Syozai      QPAB_JISYAM.QPAB_SYOZAICHI%TYPE;
--  v_Kaisya      QPAB_JISYAM.QPAB_KAISYANM%TYPE;
	v_Zaimu						QPB9_FURIKOMISKM.QPB9_SYOZAICHI1%TYPE;
	v_Syozai					QPB9_FURIKOMISKM.QPB9_SYOZAICHI2%TYPE;
	v_Kaisya					QPB9_FURIKOMISKM.QPB9_KAISYANM%TYPE;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */
  w_SeisanM     NUMBER;
  v_SeisanM     QPAM_SYNKEISANW.QPAM_SEISANM%TYPE;

  v_Kingaku     QPAA_KOJOT.QPAA_KANGAKU%TYPE;
  v_YusiKBN     QPAA_KOJOT.QPAA_YUSIKBN%TYPE;
  v_KyuyoTen      QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE;
  v_SyoyoTen      QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE;

BEGIN

  w_SeisanM := TO_NUMBER(SUBSTR(InStrSeisanYMD,5,2));
  v_SeisanM := TO_CHAR(w_SeisanM);

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--	振込先情報の取得先変更
--	※自社マスタ→振込先マスタ
--  /* 自社マスタ検索 */
--  StrSQL := NULL;
--  StrSQL := StrSQL || 'SELECT';
--  StrSQL := StrSQL || ' NVL(QPAB_ZAIMUKYOKUCD,'' ''),';
--  StrSQL := StrSQL || ' NVL(QPAB_SYOZAICHI,'' ''),';
--  StrSQL := StrSQL || ' NVL(QPAB_KAISYANM,'' '')';
--  StrSQL := StrSQL || ' FROM QPAB_JISYAM';
--  StrSQL := StrSQL || ' WHERE QPAB_PRMKAISYACD = :Code';
--  /* 動的カーソルのオープン */
--  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--  /* SQLの解析 */
--  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--  /* 入力変数をバインドする */
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', '01');
--  /* 出力変数のバインド */
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zaimu,40);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Syozai,40);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisya,40);
--  /* SQLの実行 */
--  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--  /* FETCH */
--  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
--    /* カラム値を変数へ格納 */
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zaimu);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Syozai);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisya);
--  END IF;
--  /* カーソルのクローズ */
--  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	BEGIN
		SELECT
			 NVL(QPB9_SYOZAICHI1, ' ')
			,NVL(QPB9_SYOZAICHI2, ' ')
			,NVL(QPB9_KAISYANM, ' ')
		INTO
			 v_Zaimu
			,v_Syozai
			,v_Kaisya
		FROM
			(
			SELECT
				 QPAC_PRMSYAINCD1		AS SYAINCD1
				,QPAC_PRMSYAINCD2		AS SYAINCD2
				,QPAC_MISECD			AS MISECD
				,(
				CASE NVL(Q_CHECK_KAISYA.CNT, 0)
					WHEN 0 THEN	QPAC_MISECD
					ELSE		'000'
				END)					AS KAISYACD
			FROM
				QPAC_SYAINM
				,(
				SELECT
					 LTRIM(RTRIM(QPAH_NAMEX))	AS MISECD
					,COUNT(*)					AS CNT
				FROM
					QPAH_OTHERM
				WHERE
					QPAH_PRMCODE LIKE 'TMISE%'
				GROUP BY
					LTRIM(RTRIM(QPAH_NAMEX))
				)	Q_CHECK_KAISYA
			WHERE
				QPAC_PRMSYAINCD1	= ' '
			AND	QPAC_PRMSYAINCD2	= InStrSyainCD2
			AND	QPAC_MISECD			= Q_CHECK_KAISYA.MISECD(+)
			)	Q_MAIN
			,QPB9_FURIKOMISKM
		WHERE
			Q_MAIN.KAISYACD		= QPB9_PRMKAISYACD(+)
		;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			v_Zaimu   := ' ';
			v_Syozai  := ' ';
			v_Kaisya  := ' ';
		WHEN OTHERS THEN
			RAISE;
	END;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */

  v_KyuyoTen := InNumKyuyoTen;
  v_SyoyoTen := InNumSyoyoTen;

--DEL 20100225 0908047 NBC YOKOYAMA START
--  /* 控除ファイル検索 */
--  StrSQL := NULL;
--  StrSQL := StrSQL || 'SELECT';
--  StrSQL := StrSQL || ' NVL(QPAA_KANGAKU,0),';
--  StrSQL := StrSQL || ' NVL(QPAA_YUSIKBN,'' '')';
--  StrSQL := StrSQL || ' FROM QPAA_KOJOT';
--  StrSQL := StrSQL || ' WHERE QPAA_SYAINCD1 = :Code1';
--  StrSQL := StrSQL || ' AND QPAA_SYAINCD2 = :Code2';
--  StrSQL := StrSQL || ' AND QPAA_SYUBETU = :KBN';
--  StrSQL := StrSQL || ' AND TO_CHAR(QPAA_YUSIYMD,''YYYYMMDD'') = :YMD';
--  /* 動的カーソルのオープン */
--  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--  /* SQLの解析 */
--  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--  /* 入力変数をバインドする */
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '2');
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYusiYMD);
--  /* 出力変数のバインド */
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kingaku);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YusiKBN,1);
--  /* SQLの実行 */
--  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--  /* FETCH */
--  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
--    /* カラム値を変数へ格納 */
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kingaku);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YusiKBN);
--    IF v_YusiKBN = '3' THEN
--      v_KyuyoTen := v_Kingaku;
--    ELSE
--      v_SyoyoTen := v_Kingaku;
--    END IF;
--  END IF;
--  /* カーソルのクローズ */
--  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
--DEL 20100225 0908047 NBC YOKOYAMA END

  /*  計算書データ初期化  */
  DELETE FROM QPAM_SYNKEISANW
      WHERE QPAM_USERID = InStrUserID
      AND QPAM_COMPUTERNM = InStrComputerNM;

  /*  計算書データ登録  */
  INSERT INTO QPAM_SYNKEISANW VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,NVL(InStrSimeiKanji,' ')
    ,NVL(InStrMiseNM,' ')
    ,NVL(InStrYusiYMD,' ')
    ,NVL(InNumKyuyoHen,0)
    ,NVL(InNUMSyoyoHen,0)
    ,NVL(InNumKyuyoZan,0)
    ,NVL(InNUMSyoyoZan,0)
    ,NVL(InStrKyuyoStr,' ')
    ,NVL(InStrSyoyoStr,' ')
    ,NVL(InStrSeisanYMD,' ')
    ,NVL(InNumRiritu,0)
    ,NVL(InNumKyuyoRisoku,0)
    ,NVL(InNumSyoyoRisoku,0)
    ,NVL(InStrTenbikiKBN,' ')
    ,NVL(v_KyuyoTen,0)
    ,NVL(v_SyoyoTen,0)
    ,NVL(InStrKyuyoKBN,' ')
    ,NVL(InStrSyoyoKBN,' ')
    ,NVL(v_SeisanM,' ')
    ,NVL(InNumKyuyoNisu,0)
    ,NVL(InNumSyoyoNisu,0)
    ,NVL(v_Zaimu,' ')
    ,NVL(v_Syozai,' ')
    ,NVL(v_Kaisya,' ')
    ,NVL(InStrUserID,' ')
    ,NVL(InStrComputerNM,' ')
    );

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt100DatAdd;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt100DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt100DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名
    
BEGIN
  DELETE FROM QPAM_SYNKEISANW
      WHERE QPAM_USERID     = InStrUserID
        AND QPAM_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt100DelWorkTbl;

--ADD 20100225 0908047 NBC YOKOYAMA START
/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt100CheckModoshi                                  */
/* 機能          ：控除予定が分解戻しされていないかどうかを判断              */
/*****************************************************************************/
PROCEDURE QPAP_CEnt100CheckModoshi (
   InStrSyainCD1    IN  QPB2_BUNKAI.QPB2_SYAINCD1%TYPE   --検索条件  社員コード１
  ,InStrSyainCD2    IN  QPB2_BUNKAI.QPB2_SYAINCD2%TYPE   --          社員コード２
  ,InStrYusiYMD     IN  CHAR                             --          融資日
  ,InStrKojoYMD     IN  CHAR                             --          控除日
  ,InStrYusiKBN     IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE    --          給与賞与区分(３：給与、４：賞与)
  ,OtStrFLG         OUT CHAR) IS                         --存在フラグ

	/* 処理固有の変数 */
	v_CNT      NUMBER := 0;
BEGIN
	SELECT COUNT(*) 
	INTO  v_CNT
	FROM QPB2_BUNKAI
	WHERE QPB2_SYAINCD1  = NVL(InStrSyainCD1,' ')
	  AND QPB2_SYAINCD2  = InStrSyainCD2
	  AND QPB2_SYUBETU   = '2'				--証書
	  AND QPB2_YUSIYMD   = TO_DATE(InStrYusiYMD,'YYYY/MM/DD')
	  AND QPB2_KOJOYMD   = TO_DATE(InStrKojoYMD,'YYYY/MM/DD')
	  AND QPB2_YUSIKBN   = InStrYusiKBN
	  AND QPB2_BUNMODFLG = '0';				--分解戻し

	IF v_CNT = 0 THEN
		OtStrFLG := '0';
	ELSE
		OtStrFLG := '1';
	END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END QPAP_CEnt100CheckModoshi;
--ADD 20100225 0908047 NBC YOKOYAMA END
END QPAP_CEnt100PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
