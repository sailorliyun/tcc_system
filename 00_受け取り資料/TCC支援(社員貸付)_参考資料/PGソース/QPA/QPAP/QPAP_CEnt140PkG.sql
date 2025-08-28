CREATE OR REPLACE PACKAGE  QPAP_Cent140PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_Cent140PkG                                           */
/* 機能          ：控除連絡表印刷                                            */
/* 作成日        ：2001/08/25                                                */
/* 作成者        ：FIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*                １  宣言部                                                 */
/*****************************************************************************/

/*					修正履歴							*/
/*	2003.01.31		利率変更に伴う利息算出ロジック修正	*/
/*	2003.03.25-1	夏季賞与日が２６日～末日の集計修正	*/
/*	2003.03.25-2	精算店の名称オーバーフロー対応修正	*/
/*	2003.05.07		賞与後残高の表示上での障害対応		*/
/*	2003.06.11		賞与控除データ作成での障害対応		*/
/*	2005.05.06  Yasui@NBC 賞与控除作成処理不備対応      */
/*	受付番号   担当者        修正内容                                    日付     */
/*	TR0506-023 imz.Yoshida   小口賞与控除作成処理不備対応                20060314 */
/*                      01   小口賞与取得方法を証書と同じ方法で取得する           */
/*	                    02   修正によりモジュールが大きくなりすぎたため           */
/*	                         コンパイル出来なくなったので、別ＰＫＧを作成         */
/*                                                                                */
/*	0811051    NBC ISHIDA    グループ社員証書貸付帳票見直し              20090828 */
/*                      01   控除データ作成時の控除中止フラグを                   */
/*                           控除連絡表に反映させる                               */
/*	受付番号	日付		担当者			修正内容                                         */
/*	1004091		20100816	IMZ SHIBUTANI	未控除残高一覧表の参照TBL項目追加への対応	*/
/*				20100817	IMZ SHIBUTANI	QPAO_KOJOWテーブル：項目の設定値変更への対応	*/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
    INDEX BY BINARY_INTEGER;

/* 控除連絡表データ作成＆取得 【Main処理】*/
PROCEDURE QPAP_CEnt140GetKoujyo (
  InStrSyoriKbn       IN  VARCHAR2,                               --処理区分
  InStrSyoriYM        IN  VARCHAR2,                               --処理年月
  InNumMaxRec         IN  NUMBER,                                 --最大配列格納件数
  IoNumFetchCount     IN  OUT NUMBER,                             --読み込み件数
  IoNumRecCount       IN  OUT NUMBER,                             --総検索件数
  OtNumAryCount       OUT NUMBER,                                 --配列格納件数
  OtStrDataAry        OUT typDataAry,                             --証書明細 配列
  OtNumHigasiCount    OUT NUMBER,                                 --控除連絡表 東データ件数
  OtNumNisiCount      OUT NUMBER,                                 --控除連絡表 西データ件数
  OtNumZanCount       OUT NUMBER,                                 --未控除残高一覧表 データ件数
  InStrUserID         IN  VARCHAR2,                               --ユーザーＩＤ
  InStrComputerNM     IN  VARCHAR2,                               --コンピュータ名
  OtStrEndFlg         OUT VARCHAR2);                              --検索終了フラグ

/* 控除連絡表_経過残高ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140KeikaZandaka (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD            IN  VARCHAR2);                              --給与日付
/* 控除連絡表_小口利息ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140KogutiRisoku (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --給与日付
/* 控除連絡表_利息ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140KyuyoRisoku (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --給与日付
/* 給与残高集計 */
PROCEDURE QPAP_CEnt140KyuZanSyukei (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --給与日付
/* 控除連絡表_給与印刷ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140KojoPrtKyuyo (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --給与日付
--del TR0506-023 imz.Yoshida ==>
/* 控除連絡表_賞与利息ＷＯＲＫ作成 */
--PROCEDURE QPAP_CEnt140SyouyoRisoku (
--  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
--  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
--  InStrYMD        IN  VARCHAR2);                                  --賞与日付
--del TR0506-023 imz.Yoshida <==
/* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140KojoPrtSyouyo (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --賞与日付

/* 未控除残高一覧表ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt140MiKojoPrt (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);

/* 控除連絡表_賞与利息計算 関数 (Return 利息) */
FUNCTION QPAP_CEnt140SyoRisokuFnc (
  InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --融資日
  InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --賞与返済総額
  InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --賞与返済額
  InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --賞与残高
  InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --契約利率
  InBONUSYMD1       IN  VARCHAR2,                                 --賞与支給日１
  InBONUSYMD2       IN  VARCHAR2,                                 --賞与支給日２
  InStrYMD          IN  VARCHAR2)                                 --賞与日付
RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE;

/* 小口融資利率取得 */
FUNCTION QPAP_CEnt140GetRiritu(
   InStrYMD   IN  CHAR)
RETURN NUMBER;

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt140DelWorkTbl(
   InStrUserID     IN  VARCHAR2,                                      --ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);                                     --コンピュータ名

/* ↓2001/10/23 ADD  START ******************************************************/
/* 控除テーブル更新処理 */
PROCEDURE QPAP_CEnt140KojoTKousin (
  InStrSyoriYM        IN  VARCHAR2,                                   --処理年月
  InStrUserID         IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM     IN  VARCHAR2);                                  --コンピュータ名

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt140Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--プログラムＩＤ
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--コンピュータ名
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt140UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--識別コード
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--コンピューター名
/* ↑2001/10/23 ADD  END ********************************************************/

/* ↓2001/11/02 ADD  START ******************************************************/
/* 最新賞与控除年月取得 */
PROCEDURE QPAP_CEnt140GetYM (
    OtMei    OUT    VARCHAR2);
/* ↑2001/11/02 ADD  END ********************************************************/

/* ↓2003.03.25 ADD  START ******************************************************/
/* 控除連絡表_賞与利息ＷＯＲＫ作成 [夏季賞与日が２６日～末日の集計対応]         */
PROCEDURE QPAP_CEnt140SyouyoRisoku2 (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2);                                  --賞与日付

--del TR0506-023 imz.Yoshida <==
/* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
--PROCEDURE QPAP_CEnt140KojoPrtSyouyo2 (
--  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
--  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
--  InStrYMD        IN  VARCHAR2);                                  --賞与日付
--del TR0506-023 imz.Yoshida <==

/* 控除連絡表_次給与残高算出関数 */
FUNCTION QPAP_CEnt140NEXTKYUYOZAN (
	 InStrYMD			IN		VARCHAR2								--最新控除データの日付
	,InFlg				IN		VARCHAR2								--小口 = '1',証書 = '2'
	,InYushiYMD			IN		VARCHAR2								--小口 = '' ,証書 = 融資日
	,InSyainCD1			IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1%TYPE	--社員コード１
	,InSyainCD2			IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE	--社員コード２
	,InStrUserID		IN		VARCHAR2								--ユーザーID
	,InStrComputerNM	IN		VARCHAR2								--使用端末名
)RETURN NUMBER;
/* ↑2003.03.25 ADD  END ********************************************************/

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
/* 賞与日取得関数                          */
FUNCTION QPAP_CEnt140GetBONUSDayFnc(
   InStrYMD  IN CHAR,
   BONUSYMD  IN CHAR
) RETURN CHAR;
/* Yasui@NBC 2005.05.06 控除作成不備 <== */
END QPAP_Cent140PkG;
/
--SHOW ERROR
SHOW ERRORS;

/*****************************************************************************/
/*                ２  ボディー                   */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent140PkG IS

  /* システム変更実施日 */
  /*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
  gbl_SysChangeYMD    CHAR(8) := '20000301';    --システム変更実施日
  gbl_ZenRiritu       NUMBER;     --前月利率
  gbl_ZenZenRiritu    NUMBER;     --前々月利率
  gbl_SyousyoYMD      CHAR(8);    --証書抽出日付

/* 2001/10/24 ADD  START ******************************************************/
  gbl_SysChangeYMD2   CHAR(8) := '20011101';    --システム変更実施日
  gbl_ZenRiritu2      NUMBER;     --前月利率
  gbl_ZenZenRiritu2   NUMBER;     --前々月利率
/* 2001/10/24 ADD  END   ******************************************************/

/* 2001/10/23 ADD  START ******************************************************/
	/*  ユーザ定義例外定義	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
/* 2001/10/23 ADD  END ********************************************************/

  /* 控除連絡表集計明細カーソル */
  CURSOR CurKoujyoSum(KojoKbn_I IN VARCHAR2,StrUserID_I IN VARCHAR2,StrComputerNM_I IN VARCHAR2) IS
    SELECT
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
--      --QPAO_SEISANCD,    10/12
--      TO_CHAR(MIN(QPAO_PAGEKBN),'FM000')  SEISANCD,
--      MAX(QPAO_SEISANNM) SEISANNM,
      MIN(QPAO_SEISANCD)	SEISANCD,
      MAX(QPAO_SEISANNM)	SEISANNM,
/* MOD 20100817 1004091 IMZ SHIBUTANI END */
      COUNT(*)          SUM_COUNT,
      SUM(QPAO_KINGAKU) SUM_KINGAKU,
      SUM(QPAO_GANKIN)  SUM_GANKIN,
      SUM(QPAO_RISOKU)  SUM_RISOKU,
      SUM(QPAO_ZANDAKA) SUM_ZANDAKA
    FROM
          QPAO_KOJOW
    WHERE QPAO_KOJOKBN    = KojoKbn_I
      AND QPAO_USERID     = StrUserID_I
      AND QPAO_COMPUTERNM = StrComputerNM_I
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
----  GROUP BY QPAO_SEISANCD                      --10/12 UPD
--    GROUP BY QPAO_TOZAIKBN,QPAO_SEISANCD        --10/12 UPD
----    ORDER BY QPAO_SEISANCD ASC;				--10/15 UPD
--    ORDER BY QPAO_TOZAIKBN,QPAO_SEISANCD ASC;	--10/15 UPD
    GROUP BY QPAO_SEISANCD,QPAO_TOZAIKBN
    ORDER BY QPAO_SEISANCD,QPAO_TOZAIKBN;
/* MOD 20100817 1004091 IMZ SHIBUTANI END */

/* 2003.03.25 ADD  START ******************************************************/
  /* 2001/10/23 ADD  START ******************************************************/
  /* 控除ワーク検索カーソル */
  CURSOR CurKojow(StrUserID_I IN VARCHAR2,StrComputerNM_I IN VARCHAR2) IS
      SELECT
            QPAM_SEISANYMD       SYORIYMD,     --処理日
            QPAM_SYAINCD1        SYAINCD1,     --社員コード１
            QPAM_SYAINCD2        SYAINCD2,     --社員コード２
            QPAM_SYOYOKOSINKBN   SYUBETU ,     --ローン種別
            QPAM_TENBIKIKBN      TOZAIKBN,     --東西区分
            QPAM_KAISYANM        YUSIYMD ,     --融資区分
            QPAM_KYUYOYUSIGAKU   KINGAKU ,     --金額
            QPAM_SYOYOYUSIGAKU   GANKIN  ,     --元金
            QPAM_KYUYOZANGANPON  RISOKU  ,     --利息金額
            QPAM_SYOYOZANGANPON  ZANDAKA       --残高
      FROM  QPAM_SYNKEISANW
      WHERE QPAM_USERID   = StrUserID_I
      AND   QPAM_COMPUTERNM  = StrComputerNM_I;
--  CURSOR CurKojow(StrUserID_I IN VARCHAR2,StrComputerNM_I IN VARCHAR2) IS
--      SELECT
--            QPAO_SYORIYMD  SYORIYMD,
--            QPAO_SYAINCD1  SYAINCD1,
--            QPAO_SYAINCD2  SYAINCD2,
--            QPAO_SYUBETU   SYUBETU ,
--            QPAO_TOZAIKBN  TOZAIKBN,
--            QPAO_YUSIYMD   YUSIYMD ,
--            QPAO_KINGAKU   KINGAKU ,
--            QPAO_GANKIN    GANKIN  ,
--            QPAO_RISOKU    RISOKU  ,
--            QPAO_ZANDAKA   ZANDAKA
--      FROM  QPAO_KOJOW
--      WHERE QPAO_USERID   = StrUserID_I
--      AND   QPAO_COMPUTERNM  = StrComputerNM_I;
  /* 2001/10/23 ADD  END ********************************************************/
/* 2003.03.25 ADD  END ******************************************************/
/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140GetKoujyo       　　　　                      */
/* 機能          ：控除連絡表データ作成＆取得 【Main処理】                   */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140GetKoujyo (
  InStrSyoriKbn       IN  VARCHAR2,                               --処理区分
  InStrSyoriYM        IN  VARCHAR2,                               --処理年月
  InNumMaxRec         IN  NUMBER,                                 --最大配列格納件数
  IoNumFetchCount     IN  OUT NUMBER,                             --読み込み件数
  IoNumRecCount       IN  OUT NUMBER,                             --総検索件数
  OtNumAryCount       OUT NUMBER,                                 --配列格納件数
  OtStrDataAry        OUT typDataAry,                             --証書明細 配列
  OtNumHigasiCount    OUT NUMBER,                                 --控除連絡表 東データ件数
  OtNumNisiCount      OUT NUMBER,                                 --控除連絡表 西データ件数
  OtNumZanCount       OUT NUMBER,                                 --未控除残高一覧表 データ件数
  InStrUserID         IN  VARCHAR2,                               --ユーザーＩＤ
  InStrComputerNM     IN  VARCHAR2,                               --コンピュータ名
  OtStrEndFlg         OUT VARCHAR2) IS                            --検索終了フラグ

  /* 処理固有の変数 */
  NumIdx          NUMBER;
  NumSumCount     NUMBER;
  StrData         VARCHAR2(200);
  StrKyuyoYMD     VARCHAR2(8);            --給与日付
  StrSyoyoYMD     VARCHAR2(8);            --賞与日付
  StrWorkYMD      VARCHAR2(8);            --前月

  /* 控除連絡表集計明細 総件数取得カーソル */    --10/12 UPD
  CURSOR CurCount(KojoKbn_I IN VARCHAR2,StrUserID_I IN VARCHAR2,StrComputerNM_I IN VARCHAR2) IS
    SELECT
      COUNT(*) NumCount
    FROM
      ( SELECT
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
--              QPAO_TOZAIKBN,QPAO_SEISANCD
              QPAO_SEISANCD,QPAO_TOZAIKBN
/* MOD 20100817 1004091 IMZ SHIBUTANI END */
        FROM
              QPAO_KOJOW
        WHERE QPAO_KOJOKBN    = KojoKbn_I
          AND QPAO_USERID     = StrUserID_I
          AND QPAO_COMPUTERNM = StrComputerNM_I
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
--        GROUP BY QPAO_TOZAIKBN,QPAO_SEISANCD );
        GROUP BY QPAO_SEISANCD,QPAO_TOZAIKBN );
/* MOD 20100817 1004091 IMZ SHIBUTANI END */

  /* 行変数 */
  RowCount      CurCount%ROWTYPE;           --控除連絡表集計明細　総件数カーソル
  RowKoujyoSum  CurKoujyoSum%ROWTYPE;       --控除連絡表集計明細　カーソル

BEGIN
  /* 出力パラメータの初期化 */
  OtNumAryCount := 0;
  OtStrEndFlg   := '0';

  /*■ ステップ０ ■*/
  /* 前準備 */
  StrKyuyoYMD :=    InStrSyoriYM || '25';                                                            --給与日付
  StrSyoyoYMD :=    TO_CHAR(ADD_MONTHS(TO_DATE(InStrSyoriYM || '01','YYYYMMDD'),1) - 1,'YYYYMMDD');  --賞与日付
  gbl_SyousyoYMD := TO_CHAR(TO_DATE(SUBSTR(StrKyuyoYMD,1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');     --証書抽出日付

  StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
  gbl_ZenRiritu  := QPAP_CEnt140GetRiritu(StrWorkYMD);     --前月利率
  gbl_ZenRiritu2 := TRUNC(gbl_ZenRiritu / 36500 * 1000000) / 1000000;           -- 10/24 ADD

  StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-2) + 1,'YYYYMMDD');
  gbl_ZenZenRiritu := QPAP_CEnt140GetRiritu(StrWorkYMD);  --前々月利率
  gbl_ZenZenRiritu2 := TRUNC(gbl_ZenZenRiritu / 36500 * 1000000) / 1000000;     -- 10/24 ADD

  /* 控除連絡表_経過残高ＷＯＲＫの作成 */
  QPAP_CEnt140KeikaZandaka(InStrUserID,
                           InStrComputerNM,
                           StrKyuyoYMD);

  /*■ 控除連絡表　給与処理 ■*/
  IF InStrSyoriKbn = '1'  THEN
      /*給与■ ステップ　　１ ■*/
      /* 控除連絡表_小口利息ＷＯＲＫの作成 */
      QPAP_CEnt140KogutiRisoku(InStrUserID,
                               InStrComputerNM,
                               StrKyuyoYMD);

      /* 控除連絡表_利息ＷＯＲＫ作成 */
      QPAP_CEnt140KyuyoRisoku(InStrUserID,
                              InStrComputerNM,
                              StrKyuyoYMD);

      /*給与■ ステップ　　２ ■*/
      /* 給与残高集計 */
      QPAP_CEnt140KyuZanSyukei(InStrUserID,
                               InStrComputerNM,
                               StrKyuyoYMD);

      /*給与■ ステップ　　３ ■*/
      /* 控除連絡表_給与印刷ＷＯＲＫ作成 */
      QPAP_CEnt140KojoPrtKyuyo(InStrUserID,
                               InStrComputerNM,
                               StrKyuyoYMD);

  /*■ 控除連絡表　賞与処理 ■*/
  ELSE
/*debug******************************************/
/*  StrSyoyoYMD := '20011201';  --賞与日付    */
/*debug******************************************/

      /*賞与■ ステップ　　１ ■*/
      /* 控除連絡表_賞与利息ＷＯＲＫ作成 [画面表示用集計方法]*/
      QPAP_CEnt140SyouyoRisoku2(InStrUserID,
                               InStrComputerNM,
                               StrSyoyoYMD);

      /*賞与■ ステップ　　２ ■*/
      /* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
      QPAP_CEnt140KojoPrtSyouyo(InStrUserID,
                                InStrComputerNM,
                                StrSyoyoYMD);

/* 2001/11/02 UPD  START ******************************************************/
/* 賞与控除データ作成ボタン追加のため外す */
/* 2001/10/23 ADD  START ******************************************************/
      /*賞与■ ステップ　　３ ■*/
      /* 控除テーブル更新処理  ■*/
--      QPAP_CEnt140KojoTKousin(InStrSyoriYM,
--                              InStrUserID,
--                              InStrComputerNM);
/* 2001/10/23 ADD  END ********************************************************/
/* 2001/11/02 UPD  END ********************************************************/

  END IF;

  /*■ 未控除残高一覧表処理 ■*/
  /* 未控除残高一覧表ＷＯＲＫテーブル作成 */
  QPAP_CEnt140MiKojoPrt(InStrUserID,
                        InStrComputerNM,
                        StrKyuyoYMD);

  /*■ ステップ　最終 ■*/
  IF CurKoujyoSum%ISOPEN = FALSE THEN
    /* 控除連絡表集計明細 総件数取得 */
    NumSumCount := 0;
    OPEN CurCount('0',InStrUserID,InStrComputerNM);     --総件数カーソルのオープン
    LOOP
      FETCH CurCount INTO RowCount;
      IF  CurCount%NOTFOUND THEN
        EXIT;
      END IF;
      NumSumCount := NumSumCount + RowCount.NumCount;
    END LOOP;
    IoNumRecCount :=  NumSumCount;      --パラメータにセット
    CLOSE CurCount;                     --総件数カーソルのクローズ

    /* 控除連絡表集計明細 カーソルのオープン */
    OPEN CurKoujyoSum('0',InStrUserID,InStrComputerNM);
  END IF;

  NumIdx      := 0;
  OtStrEndFlg   := '0';

  LOOP
    FETCH CurKoujyoSum INTO RowKoujyoSum;   --順読み
    IoNumFetchCount := IoNumFetchCount + 1;
    IF  CurKoujyoSum%NOTFOUND THEN
      EXIT;             --ループ終了
    END IF;

    /* 控除連絡表集計明細　出力パラメータの編集 */
    NumIdx := NumIdx + 1;
    StrData := Null;
    StrData := StrData || RowKoujyoSum.SEISANCD         || StrDLM;  --清算店コード
    StrData := StrData || RowKoujyoSum.SEISANNM         || StrDLM;  --清算店名
    StrData := StrData || RowKoujyoSum.SUM_COUNT        || StrDLM;  --件数
    StrData := StrData || RowKoujyoSum.SUM_KINGAKU      || StrDLM;  --金額合計
    StrData := StrData || RowKoujyoSum.SUM_GANKIN       || StrDLM;  --元本合計
    StrData := StrData || RowKoujyoSum.SUM_RISOKU       || StrDLM;  --利息合計
    StrData := StrData || RowKoujyoSum.SUM_ZANDAKA      || StrDLM;  --残高合計
    OtStrDataAry(NumIdx)  := StrData;   --控除連絡表集計明細

    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <> 0     AND
       InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;             --プロシージャの終了（カーソルをクローズしない）
    END IF;

  END LOOP;

  OtStrEndFlg :=  '1';          --検索終了
  OtNumAryCount :=  NumIdx;
  /* 控除連絡表集計カーソルのクローズ */
  CLOSE CurKoujyoSum;

  /* データ件数の算出 */
  --控除連絡表 東データ件数
  SELECT  COUNT(*)
    INTO  OtNumHigasiCount
  FROM
          QPAO_KOJOW
  WHERE   QPAO_TOZAIKBN   = '1'    --東
      AND QPAO_USERID     = InStrUserID
      AND QPAO_COMPUTERNM = InStrComputerNM;
  --控除連絡表 西データ件数
  SELECT  COUNT(*)
    INTO  OtNumNisiCount
  FROM
          QPAO_KOJOW
  WHERE   QPAO_TOZAIKBN  = '2'    --西
      AND QPAO_USERID     = InStrUserID
      AND QPAO_COMPUTERNM = InStrComputerNM;
  --未控除残高一覧表 データ件数
  SELECT  COUNT(*)
    INTO  OtNumZanCount
  FROM    QPAP_MIKOJOW
  WHERE   QPAP_USERID     = InStrUserID
      AND QPAP_COMPUTERNM = InStrComputerNM;

EXCEPTION
  WHEN  OTHERS  THEN
    IF CurCount%ISOPEN THEN
      CLOSE CurCount;
    END IF;
    IF CurKoujyoSum%ISOPEN THEN
      CLOSE CurKoujyoSum;
    END IF;
    RAISE ;
END QPAP_CEnt140GetKoujyo;


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KeikaZandaka        　　                      */
/* 機能          ：控除連絡表_経過残高ＷＯＲＫ作成                           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KeikaZandaka (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */

  StrSQL        VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_CursorID2   NUMBER := 0;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;

  v_ZenYMD      CHAR(8);    --前月
  v_ZenZenYMD   CHAR(8);    --前々月
  v_Zandaka     NUMBER;
  v_WZandaka    NUMBER;
  v_CalZandaka  NUMBER;

  v_SYAINCD1        QPAS_KGCW.QPAS_SYAINCD1%TYPE;
  v_SYAINCD2        QPAS_KGCW.QPAS_SYAINCD2%TYPE;
  v_KBN             QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD             QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku         QPAS_KGCW.QPAS_KINGAKU%TYPE;

  v_SYAINCD1_BRK    QPAS_KGCW.QPAS_SYAINCD1%TYPE := ' ';
  v_SYAINCD2_BRK    QPAS_KGCW.QPAS_SYAINCD2%TYPE := ' ';


  v_ZenYMD_N    CHAR(8);    --前月入金用         11/01 ADD
  v_ZenZenYMD_N CHAR(8);    --前々月入金用       11/01 ADD

BEGIN

  /**************************/
  /* 小口退避テーブルに退避 */
  /**************************/
  DELETE FROM QPAS_KGCW
         WHERE QPAS_USERID     = InStrUserID
           AND QPAS_COMPUTERNM = InStrComputerNM;

  v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');
  v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-2) ,'YYYYMMDD');

/* 11/01 ADD 入金用指定範囲変更 */
  v_ZenYMD_N    := TO_CHAR(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,'YYYYMMDD');
  v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,-1) ,'YYYYMMDD');

  /* 貸付 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      ' ',
      NVL(QPA6_SYAINCD,' '),
      '1',
      TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
      NVL(QPA6_KINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA6_KGCKASITUKET
    WHERE (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
     AND  (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
  /* 入金 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA5_SYAINCD1,' '),
      NVL(QPA5_SYAINCD2,' '),
      '2',
      TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
      NVL(QPA5_NYUKINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA5_KGCNYUKINT
--    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)                  -- 11/01 UPD
--     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD);              -- 11/01 UPD
    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)                  -- 11/01 UPD
     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);              -- 11/01 UPD
  /* 賞与 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA4_SYAINCD1,' '),
      NVL(QPA4_SYAINCD2,' '),
      '4',
      TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
      NVL(QPA4_KOJOGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA4_KGCKOJOT
    WHERE (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenZenYMD);

    /* コミット */
    COMMIT;

    /********************************/
    /* 控除連絡表_経過残高Ｔに追加  */
    /********************************/
    DELETE FROM QPAU_KojoZanW
           WHERE QPAU_USERID     = InStrUserID
             AND QPAU_COMPUTERNM = InStrComputerNM;

    /* 小口退避テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_SYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_SYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAS_COMPUTERNM = :StrComputerNM';
    StrSQL := StrSQL || ' ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN';
    /* 動的カーソルのオープン */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SYAINCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYAINCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,5,v_Kingaku);
    /* SQLの実行 */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SYAINCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYAINCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_YMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,5,v_Kingaku);

      IF v_SYAINCD1 <> v_SYAINCD1_BRK OR v_SYAINCD2 <> v_SYAINCD2_BRK THEN
          /* 前前月残高参照 */
          v_Zandaka := 0;
          StrSQL := NULL;
          StrSQL := StrSQL || 'SELECT';
          StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
          StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
          StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
          StrSQL := StrSQL || '   AND QPA3_PRMSYAINCD2 = :Code2';
          StrSQL := StrSQL || '   AND QPA3_PRMYUSIKBN  = :KBN';
          StrSQL := StrSQL || '   AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
          StrSQL := StrSQL ||                              '  FROM QPA3_KGCZANDAKAT';
          StrSQL := StrSQL ||                              ' WHERE QPA3_PRMSYAINCD1 = :Code1';
          StrSQL := StrSQL ||                               '  AND QPA3_PRMSYAINCD2 = :Code2';
          StrSQL := StrSQL ||                               '  AND QPA3_PRMYUSIKBN  = :KBN';
          StrSQL := StrSQL ||                               '  AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
          /* 動的カーソルのオープン */
          v_CursorID  := DBMS_SQL.OPEN_CURSOR;
          /* SQLの解析 */
          DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
          /* 入力変数をバインドする */
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', v_SYAINCD1);
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', v_SYAINCD2);
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN',   '3');
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',   v_ZenZenYMD);
          /* 出力変数のバインド */
          DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zandaka);
          /* SQLの実行 */
          v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
          IF  DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
              DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zandaka);
          END IF;
          /* カーソルのクローズ */
          DBMS_SQL.CLOSE_CURSOR (v_CursorID);

          /* 社員ブレーク コード 設定 */
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
      END IF;

      /* 融資区分別　残高再計算 */
-- 2001/10/05 不具合修正
--      IF v_KBN = '1' OR v_KBN = '2' THEN
      IF v_KBN = '1' THEN
          v_Zandaka := v_Zandaka + v_Kingaku;
      ELSE
          v_Zandaka := v_Zandaka - v_Kingaku;
      END IF;

      IF v_KBN = '1' THEN
        v_WZandaka := v_Kingaku + v_Zandaka;
        IF v_WZandaka <= 0 then
          v_CalZandaka := 0;
        ELSE
          IF v_Zandaka >= v_Kingaku then
            v_CalZandaka := v_Kingaku;
          ELSE
            v_CalZandaka := v_Zandaka;
          END IF;
        END IF;
      ELSE
        IF v_Zandaka <= 0 THEN
          v_CalZandaka := 0;
        ELSE
-- 2001/10/05 不具合修正
      IF v_KBN = '2' THEN
--          v_CalZandaka := v_Kingaku;
            v_CalZandaka := (0 - v_Kingaku);
      ELSE
            v_CalZandaka := v_Kingaku;
      END IF;
        END IF;
      END IF;

      /* ワーク　控除連絡表_経過残高Ｔに追加 */
      INSERT INTO QPAU_KojoZanW VALUES (
         NVL(v_SYAINCD1,' ')          --個人コード１
        ,NVL(v_SYAINCD2,' ')          --個人コード２
        ,' '                          --ローン種別
        ,NVL(v_KBN,' ')               --融資区分
        ,TO_DATE(v_YMD,'YYYYMMDD')    --入金日貸付日
        ,NVL(v_Kingaku,0)             --入金金額貸付金額
        ,NVL(v_Zandaka,0)             --残高
        ,NVL(v_CalZandaka,0)          --計算用金額
        ,InStrUserID
        ,InStrComputerNM
        );

    END LOOP;
-- 2001/10/05
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    /* ロールバック */
    ROLLBACK;
-- 2001/10/05
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    RAISE ;
END QPAP_CEnt140KeikaZandaka;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KogutiRisoku        　　                      */
/* 機能          ：控除連絡表_小口利息ＷＯＲＫの作成                         */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KogutiRisoku (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */
  StrSQL        VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_CursorID2   NUMBER := 0;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;

  v_ZenYMD      CHAR(8);    --前月
  v_ZenZenYMD   CHAR(8);    --前々月
  v_Zandaka     NUMBER;
  v_WZandaka    NUMBER;
  v_CalZandaka  NUMBER;

  v_KasiRisoku    NUMBER;

  v_SYAINCD1        QPAS_KGCW.QPAS_SYAINCD1%TYPE;
  v_SYAINCD2        QPAS_KGCW.QPAS_SYAINCD2%TYPE;
  v_KBN             QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD             QPAS_KGCW.QPAS_YMD%TYPE;
--  v_Kingaku         QPAS_KGCW.QPAS_KINGAKU%TYPE;         -- 10/19 UPD
  v_Kingaku	        NUMBER;                                -- 10/19 UPD

  v_IDX             NUMBER;                                -- 10/19 ADD
  v_SYAINCD1_BRK    QPAS_KGCW.QPAS_SYAINCD1%TYPE;          -- 10/19 ADD
  v_SYAINCD2_BRK    QPAS_KGCW.QPAS_SYAINCD2%TYPE;          -- 10/19 ADD
  v_KEISANKIN       NUMBER;                                -- 10/19 ADD
  v_KEISANFLG       CHAR(1);                               -- 10/19 ADD

  v_ZenYMD_N        CHAR(8);             --前月入金用         11/01 ADD
  v_ZenZenYMD_N     CHAR(8);             --前々月入金用       11/01 ADD

--2003/01/16 利息計算を日ごとに利率取得に変更
  W_CNT				NUMBER;						--利息計算用ループカウンタ
  W_ENDLOOPCNT		NUMBER;						--利息計算用ループ終了値
  v_GetRiritu		NUMBER;						--利息計算用利息率(旧)
  v_GetRiritu2		NUMBER;						--利息計算用利息率(新)
  v_StartRiritu		NUMBER;						--利息計算用利息求める範囲開始日での適用利率
  v_NextRiritu		NUMBER;						--利息計算用利息求める範囲終了日での適用利率
  strworkwork		NUMBER;
--2003/01/16 利息計算を日ごとに利率取得に変更

BEGIN

  /**************************/
  /* 小口退避テーブルに退避 */
  /**************************/
  DELETE  FROM QPAS_KGCW
         WHERE QPAS_USERID     = InStrUserID
           AND QPAS_COMPUTERNM = InStrComputerNM;

  v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');  --前月
  v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-2) ,'YYYYMMDD');  --前々月

/* 11/01 ADD 入金用指定範囲変更 */
  v_ZenYMD_N    := TO_CHAR(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,'YYYYMMDD');
  v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,-1) ,'YYYYMMDD');

  /* 貸付 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      ' ',
      NVL(QPA6_SYAINCD,' '),
      '1',
      TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
      NVL(QPA6_KINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA6_KGCKASITUKET
    WHERE (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
     AND  (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
  /* 入金 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA5_SYAINCD1,' '),
      NVL(QPA5_SYAINCD2,' '),
      '2',
      TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
      NVL(QPA5_NYUKINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA5_KGCNYUKINT
--    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)            -- 11/01 UPD
--     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD);        -- 11/01 UPD
    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)            -- 11/01 UPD
     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);        -- 11/01 UPD
  /* 賞与 */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA4_SYAINCD1,' '),
      NVL(QPA4_SYAINCD2,' '),
      '4',
      TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
      NVL(QPA4_KOJOGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA4_KGCKOJOT
    WHERE (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <  InStrYMD)
     AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenYMD);

    /* コミット */
    COMMIT;

    /********************************/
    /* 控除連絡表_小口利息Ｔに追加  */
    /********************************/
    DELETE FROM QPAV_KojoKoguW
          WHERE QPAV_USERID     = InStrUserID
            AND QPAV_COMPUTERNM = InStrComputerNM;

/***********************************************************************/
/*  2001/10/19 UPDATE                                                  */
/*  以下の処理は賞与控除の対応に不備があり。                           */
/*  テーブル間の外部結合に問題があると思い、                           */
/*  ２つのＳＱＬ文に分離した。                                         */
/***********************************************************************/

    /*小口退避テーブル検索 */
    /* 貸付(1)と入金(2)と賞与(4) */
--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT DISTINCT';
--    StrSQL := StrSQL || ' QPAS_SYAINCD1,';
--    StrSQL := StrSQL || ' QPAS_SYAINCD2,';
--    StrSQL := StrSQL || ' SUM(TRUNC(';
--    StrSQL := StrSQL || '   DECODE(QPAS_KBN,''4'',';
--    StrSQL := StrSQL || '     (0 - QPAS_KINGAKU),';
---- 2001/10/05 不具合修正
----    StrSQL := StrSQL || '     DECODE(QPAU_KEISANKIN,NULL,QPAS_KINGAKU,QPAU_KEISANKIN)';
--    StrSQL := StrSQL || '     DECODE(QPAU_KEISANKIN,NULL,';
--    StrSQL := StrSQL || '            DECODE(QPAS_KBN,''2'',(0 - QPAS_KINGAKU),QPAS_KINGAKU),QPAU_KEISANKIN)';
--    StrSQL := StrSQL || '   )';
--    StrSQL := StrSQL || ' * DECODE(QPAS_KBN,''4'',';
--    StrSQL := StrSQL || '     (TO_DATE(:YMD,''YYYYMMDD'') - TO_DATE(QPAS_YMD,''YYYYMMDD'')),';
--    StrSQL := StrSQL || '     (TO_DATE(:ZenYMD,''YYYYMMDD'') - TO_DATE(QPAS_YMD,''YYYYMMDD'') + DECODE(QPAS_KBN,''1'',1,0))';
--    StrSQL := StrSQL || '   )';
--    StrSQL := StrSQL || ' * :ZenZenRiritu / 36500 * 1000';
--    StrSQL := StrSQL || ' ))';
--    StrSQL := StrSQL || ' FROM QPAS_KGCW,QPAU_KOJOZANW,QPA1_KGCDAICYOT';
--    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1   = QPA1_PRMSYAINCD1';
--    StrSQL := StrSQL || '   AND QPAS_SYAINCD2   = QPA1_PRMSYAINCD2';
--    StrSQL := StrSQL || '   AND (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = '' '')';
--    StrSQL := StrSQL || '   AND QPAS_SYAINCD1   = QPAU_SYAINCD1(+)';
--    StrSQL := StrSQL || '   AND QPAS_SYAINCD2   = QPAU_SYAINCD2(+)';
--    StrSQL := StrSQL || '   AND QPAS_KBN        = QPAU_YUSIKBN(+)';
--    StrSQL := StrSQL || '   AND QPAS_YMD        = TO_CHAR(QPAU_NYUKASIYMD(+),''YYYYMMDD'')';
--    StrSQL := StrSQL || '   AND QPAS_USERID     = :StrUserID';
--    StrSQL := StrSQL || '   AND QPAS_COMPUTERNM = :StrComputerNM';
--    StrSQL := StrSQL || '   AND QPAU_USERID     = :StrUserID';
--    StrSQL := StrSQL || '   AND QPAU_COMPUTERNM = :StrComputerNM';
--    StrSQL := StrSQL || ' GROUP BY QPAS_SYAINCD1,QPAS_SYAINCD2';

    /* 動的カーソルのオープン */
--    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
--    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':ZenZenRiritu', gbl_ZenZenRiritu);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',          InStrYMD);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':ZenYMD',       v_ZenYMD);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);

    /* 出力変数のバインド */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SYAINCD1,1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYAINCD2,7);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KasiRisoku);
    /* SQLの実行 */
--    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

--    LOOP
--      IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
--        EXIT;
--      END IF;
      /* カラム値を変数へ格納 */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SYAINCD1);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYAINCD2);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KasiRisoku);

      /* ワーク　控除連絡表_小口利息Ｔに追加 */
--      INSERT INTO QPAV_KojoKoguW VALUES (
--         NVL(v_SYAINCD1,' ')          --個人コード１
--        ,NVL(v_SYAINCD2,' ')          --個人コード２
--        ,'1'                          --ローン種別
--        ,NVL(v_KasiRisoku,0)          --貸付利息
--        ,InStrUserID
--        ,InStrComputerNM
--        );
--
--    END LOOP;

    /* カーソルのクローズ */
--    DBMS_SQL.CLOSE_CURSOR(v_CursorID2);

    /* コミット */
--    COMMIT;

    /*小口退避テーブル検索 */
    /* 貸付(1)と入金(2)と賞与(4) */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' QPAS_SYAINCD1,';
    StrSQL := StrSQL || ' QPAS_SYAINCD2,';
    StrSQL := StrSQL || ' QPAS_KBN,';
    StrSQL := StrSQL || ' SUM(QPAS_KINGAKU),';
    StrSQL := StrSQL || ' QPAS_YMD';
    StrSQL := StrSQL || ' FROM QPAS_KGCW,QPA1_KGCDAICYOT';
    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1   = QPA1_PRMSYAINCD1';
    StrSQL := StrSQL || '   AND QPAS_SYAINCD2   = QPA1_PRMSYAINCD2';
	/* DEL 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
--    StrSQL := StrSQL || '   AND (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = '' '')';
	/* DEL 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    StrSQL := StrSQL || '   AND QPAS_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAS_COMPUTERNM = :StrComputerNM';
    StrSQL := StrSQl || ' GROUP BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD';
    StrSQL := StrSQl || ' ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SYAINCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SYAINCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KBN     ,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KINGAKU   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_YMD     ,8);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    v_IDX := 0;
	v_KasiRisoku := 0;

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SYAINCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SYAINCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KBN     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KINGAKU );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_YMD     );

      IF v_IDX = 0 THEN
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
      END IF;

      IF v_SYAINCD1 <> v_SYAINCD1_BRK OR v_SYAINCD2 <> v_SYAINCD2_BRK THEN
          /* ワーク　控除連絡表_小口利息Ｔに追加 */
          INSERT INTO QPAV_KojoKoguW VALUES (
             NVL(v_SYAINCD1_BRK,' ')          --個人コード１
            ,NVL(v_SYAINCD2_BRK,' ')          --個人コード２
            ,'1'                              --ローン種別
            ,NVL(v_KasiRisoku,0)              --貸付利息
            ,InStrUserID                      --ユーザーID
            ,InStrComputerNM                  --コンピューター名
            );
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
          v_KasiRisoku := 0;
      END IF;

      v_KEISANKIN := 0;
      v_KEISANFLG := '0';

   	  /* 控除連絡表_経過残高Ｔ検索 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' SUM(QPAU_KEISANKIN)';
      StrSQL := StrSQL || ' FROM QPAU_KOJOZANW';
      StrSQL := StrSQL || ' WHERE QPAU_SYAINCD1   = :SYAINCD1';
      StrSQL := StrSQL || '   AND QPAU_SYAINCD2   = :SYAINCD2';
      StrSQL := StrSQL || '   AND QPAU_YUSIKBN    = :KBN';
      StrSQL := StrSQL || '   AND TO_CHAR(QPAU_NYUKASIYMD,''YYYYMMDD'') = :YMD';
      StrSQL := StrSQL || '   AND QPAU_USERID     = :StrUserID';
      StrSQL := StrSQL || '   AND QPAU_COMPUTERNM = :StrComputerNM';
      StrSQL := StrSQl || ' GROUP BY QPAU_SYAINCD1,QPAU_SYAINCD2,QPAU_YUSIKBN,QPAU_NYUKASIYMD';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD1',     v_SYAINCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD2',     v_SYAINCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN',          v_KBN);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',          v_YMD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KEISANKIN);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
          /* カラム値を変数へ格納 */
          DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KEISANKIN);
          v_KEISANFLG := '1';
      END IF;

/*	2003.01.31	利息計算修正	↓ここから↓*/
		--TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1
		v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD);								--利息計算開始日時点での利息率
		v_NextRiritu  := QPAP_CEnt140GetRiritu(v_ZenYMD);							--利息計算終了日時点での利息率

		IF v_KBN = '1' THEN
			--★
			IF v_StartRiritu <> v_NextRiritu THEN
				--１日ごとに利息率を取得して利息計算する
				W_CNT        := v_YMD;
				W_ENDLOOPCNT := v_ZenYMD;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--利息算出範囲の終わりを超えたらループ終了
					END IF;

					v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--日ごとに適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

					IF v_KEISANFLG = '1' THEN

						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
						END IF;
					ELSE
						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
				END LOOP;
			ELSE
				--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
				v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

				IF v_KEISANFLG = '1' THEN
					IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
					END IF;
				ELSE
					IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
					END IF;
				END IF;
			END IF;
		END IF;

		IF v_KBN = '2' THEN
			--TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')
			v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD + 1);							--利息計算開始日時点での利息率
			v_NextRiritu  := QPAP_CEnt140GetRiritu(v_ZenYMD_N);							--利息計算終了日時点での利息率

			IF v_StartRiritu <> v_NextRiritu THEN
				--１日ごとに利息率を取得して利息計算する
				W_CNT        := v_YMD + 1;
				W_ENDLOOPCNT := v_ZenYMD_N;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--利息算出範囲の終わりを超えたらループ終了
					END IF;

					v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

					IF v_KEISANFLG = '1' THEN

						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--新旧判定
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
						END IF;
					ELSE

						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--新旧判定
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ

				END LOOP;
			ELSE
				--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
				v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

				IF v_KEISANFLG = '1' THEN
					IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
					END IF;
				ELSE
					IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
					END IF;
				END IF;
			END IF;

		END IF;
		IF v_KBN = '4' THEN
			--(TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD'))
			v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD + 1);							--利息計算開始日時点での利息率
			v_NextRiritu  := QPAP_CEnt140GetRiritu(InStrYMD);							--利息計算終了日時点での利息率

			IF v_StartRiritu <> v_NextRiritu THEN
				--１日ごとに利息率を取得して利息計算する
				W_CNT        := v_YMD + 1;
				W_ENDLOOPCNT := InStrYMD;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--利息算出範囲の終わりを超えたらループ終了
					END IF;

					v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

					IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
					END IF;

					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ

				END LOOP;

			ELSE
				--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
				v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

				IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
					v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu / 36500 * 1000) * 1000;
				ELSE
					v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu2 * 1000000);
				END IF;
			END IF;
		END IF;
/*	2003.01.31	利息計算修正	↑ここまで↑*/

		/* カーソルのクローズ */
		DBMS_SQL.CLOSE_CURSOR(v_CursorID2);

		v_IDX := v_IDX + 1;

	END LOOP;

	IF v_IDX <> 0 THEN
		/* ワーク　控除連絡表_小口利息Ｔに追加 */
		INSERT INTO QPAV_KojoKoguW VALUES (
			 NVL(v_SYAINCD1_BRK,' ')								--個人コード１
			,NVL(v_SYAINCD2_BRK,' ')								--個人コード２
			,'1'													--ローン種別
			,NVL(v_KasiRisoku,0)									--貸付利息
			,InStrUserID											--ユーザーID
			,InStrComputerNM										--コンピューター名
			);
	END IF;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	/* コミット */
	COMMIT;

EXCEPTION
	WHEN  OTHERS  THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN      -- 10/19 ADD
			DBMS_SQL.CLOSE_CURSOR(v_CursorID);     -- 10/19 ADD
		END IF;                                    -- 10/19 ADD
		IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
		END IF;
		/* ロールバック */
		ROLLBACK;
		RAISE ;
END QPAP_CEnt140KogutiRisoku;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KyuyoRisoku   　 　                           */
/* 機能          ：控除連絡表_利息ＷＯＲＫ作成                           　　*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KyuyoRisoku (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_Dummy         INTEGER;

  v_Risoku        NUMBER;     --利息
  v_ZenYMD        CHAR(8);    --前月

  v_WorkYMD       CHAR(8);
  v_Kikan         NUMBER;

  v_PRMSYAINCD1     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_PRMSYAINCD2     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_PRMYUSIYMD      QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
  v_GENDOGAKU       QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
  v_SYUBETU         QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
  v_RIRITU          QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_HENSAITUKISU    QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KYUYOZANDAKA    QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KOJOCYUSIFLG    QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
  v_KANSAIYMD       QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

  v_RIRITU2         NUMBER;

--2003/01/16 利息計算を日ごとに利率取得に変更
  W_CNT				NUMBER;
  W_ENDLOOPCNT		NUMBER;
  v_GetRiritu		NUMBER;
  v_GetRiritu2		NUMBER;
  v_StartRiritu		CHAR(8);
  v_NextRiritu		CHAR(8);
  v_Risoku2         NUMBER;     --利息
  v_Risoku3         NUMBER;     --利息

--2003/01/16 利息計算を日ごとに利率取得に変更

  /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
  v_StrYMDHMS         VARCHAR2(14);
  v_KojocyushiFLG   CHAR(1);
  /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

BEGIN

    /****************************************/
    /* 控除連絡表_利息ＷＯＲＫＴに追加  　　*/
    /****************************************/
    DELETE FROM QPAW_KojoRisoW
          WHERE QPAW_USERID     = InStrUserID
            AND QPAW_COMPUTERNM = InStrComputerNM;

    /* 前月日付 */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

	/* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止テーブル抽出条件の日時を取得 */
	/* 控除月の5日の18時 */
	v_StrYMDHMS := SUBSTR(InStrYMD,1,6) || '05180000';
	/* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

    /*■小口■　小口融資台帳テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA1_KEIYAKUYMD,';
    StrSQL := StrSQL || ' QPA1_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA1_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA1_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAV_KASIRISOKU ';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT,QPAV_KOJOKOGUW';
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
--    StrSQL := StrSQL || ' WHERE (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = '' '')';
--    StrSQL := StrSQL || '   AND QPA1_PRMSYAINCD1 = QPAV_SYAINCD1(+)';
    StrSQL := StrSQL || '   WHERE QPA1_PRMSYAINCD1 = QPAV_SYAINCD1(+)';
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    StrSQL := StrSQL || '   AND QPA1_PRMSYAINCD2 = QPAV_SYAINCD2(+)';
    StrSQL := StrSQL || '   AND QPAV_USERID(+)     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAV_COMPUTERNM(+) = :StrComputerNM';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_KEIYAKUYMD     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KASIRISOKU     );

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_KEIYAKUYMD    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KASIRISOKU    );

--2002/03/07 小口返済額テーブルより返済額を取得（小口返済台帳の返済額は使用しない）

	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止判定処理 */
	v_KojocyushiFLG  :=  QPAP_Cent1401PkG.QPAP_CEnt1401KojocyushiChek(
									v_PRMSYAINCD1,
									v_PRMSYAINCD2,
									v_StrYMDHMS
									);

		IF v_KojocyushiFLG = '2' THEN

		     /* 小口返済額情報取得 */
		      StrSQL := NULL;
		      StrSQL := StrSQL || 'SELECT';
		      StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
		      StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
		      StrSQL := StrSQL || ' FROM  QPA2_KGCHENSAIT';
		      StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
		      StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2  = :Code2';
		      StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM  <= :YM';
		      StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
		      /* 動的カーソルのオープン */
		      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
		      /* SQLの解析 */
		      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
		      /* 入力変数をバインドする */
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_PRMSYAINCD1);
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_PRMSYAINCD2);
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(InStrYMD,1,6));
		      /* 出力変数のバインド */
		      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KYUYOHENSAI);
		      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYOYOHENSAI);
		      /* SQLの実行 */
		      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
		      /* FETCH */
		      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
		         /* カラム値を変数へ格納 */
		         DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KYUYOHENSAI);
		         DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYOYOHENSAI);
		      END IF;
		      /* カーソルのクローズ */
		      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

		--2002/03/07 ここまで

		      /* 利息計算 */
		      v_Risoku  := 0;     --利息

		      IF  v_KYUYOZANDAKA > 0 THEN
		          v_KYUYOZANDAKA_W := v_KYUYOZANDAKA;
		      ELSE
		          v_KYUYOZANDAKA_W := 0;
		      END IF;

		      IF  v_KASIRISOKU IS NULL THEN
		          v_KASIRISOKU := 0;
		      END IF;

		--2003.01.31 修正　ここから↓
			--v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');
			v_StartRiritu := QPAP_CEnt140GetRiritu(v_ZenYMD + 1);						--利息計算開始日時点での利息率
			v_NextRiritu  := QPAP_CEnt140GetRiritu(InStrYMD);							--利息計算終了日時点での利息率
			v_Risoku2 := 0;

			IF v_ZenYMD = '20021225' AND InStrYMD = '20030125' THEN
				--2002/12/26 ～ 2003/01/25間の計算は2002/12/26時点での利率で計算する(修正時点で既に締めてしまった為)

				--期間日数とひとつの利息率で計算を行なう
				v_GetRiritu  := v_StartRiritu;															--利率を取得する
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する

				v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--利息集計期間

				--利息の計算
				IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
					v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
				ELSE
					v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000) + v_KASIRISOKU) / 1000000);
				END IF;

			ELSE
				IF InStrYMD = '20030225' THEN
					IF TO_CHAR(SYSDATE,'YYYYMM') = '200302'THEN
						v_GetRiritu := '7.5';												--2003/02/25給与の残高算出に限り、締めた1月残高に反映できなかった
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する
						v_Risoku  := (v_KYUYOZANDAKA_W * v_GetRiritu2 * 6 * 1000000) / 1000000;

						v_GetRiritu := '5.9';
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する
						v_Risoku  := v_Risoku + (v_KYUYOZANDAKA_W * v_GetRiritu2 * 25 * 1000000) / 1000000;

						v_Risoku  := TRUNC(v_Risoku + (v_KASIRISOKU / 1000000));
					ELSE
						--期間日数とひとつの利息率で計算を行なう
						v_GetRiritu  := 7.5;															--利率を取得する
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する

						v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--利息集計期間

						--利息の計算
						IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000)) / 1000000);
						ELSE
							v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000)) / 1000000);
						END IF;
						v_Risoku  := TRUNC(v_Risoku + (v_KASIRISOKU / 1000000));
					END IF;
				ELSE
					IF v_StartRiritu <> v_NextRiritu THEN
						--１日ずつ利息率を取得して計算を行なう
						w_Cnt := v_ZenYMD + 1;													--利息計算開始日(前回給与日の次の日)
						w_EndLoopCnt := InStrYMD;												--利息計算終了日(今回給与日)

						LOOP
							IF w_Cnt > w_EndLoopCnt THEN
								EXIT;															--利息算出範囲の終わりを超えたらループ終了
							END IF;

							v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率を取得する
							v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率を取得する

							--利息の計算
							IF TO_DATE(w_Cnt,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
								v_Risoku  := v_Risoku + TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
							ELSE
								v_Risoku3 := v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000;
				--				v_Risoku  := v_Risoku + TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000) + v_KASIRISOKU) / 1000000);
							END IF;

							v_Risoku2 := v_Risoku2 + v_Risoku3;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
						END LOOP;
						v_Risoku := (v_Risoku2 + v_KASIRISOKU) / 1000000;
						v_Risoku := TRUNC(v_Risoku);
					ELSE
						--期間日数とひとつの利息率で計算を行なう
						v_GetRiritu  := v_StartRiritu;															--利率を取得する
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する

						v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--利息集計期間

						--利息の計算
						IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
						ELSE
							v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000) + v_KASIRISOKU) / 1000000);
						END IF;
					END IF;
				END IF;
			END IF;
		--2003.01.31 修正　ここまで↑

		      /* ワーク　控除連絡表_利息Ｔに追加 */
		      INSERT INTO QPAW_KojoRisoW VALUES (
		         NVL(v_PRMSYAINCD1,' ')   --個人コード１
		        ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
		        ,'1'                      --ローン種別
		        ,v_KEIYAKUYMD             --契約日
		        ,NULL                     --融資日
		        ,NVL(v_GENDOGAKU,0)       --融資額限度額
		        ,0                        --契約利率
		        ,0                        --返済月数
		        ,0                        --給与返済額総額
		        ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
		        ,0                        --賞与返済額総額
		        ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
		        ,NULL                     --完済日
		        ,NVL(v_KYUYOZANDAKA,0)    --給与残高
		        ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
		        ,v_Risoku                 --利息
		        ,NULL                     --東西区分
		        ,NULL                     --精算店コード
		        ,NULL                     --所属店コード
		        ,NULL                     --所属部門コード
		        ,NULL                     --店名称
		        ,NULL                     --個人名漢字
		        ,NULL                     --退職年月日
		        ,NULL                     --休職年月日
		        ,NULL                     --賞与支給月１
		        ,NULL                     --賞与支給月２
		        ,InStrUserID
		        ,InStrComputerNM
		        );

		END IF;
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

    /*■証書■　社員融資台帳テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
    StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA8_RIRITU,';
    StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
    StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA ';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
    StrSQL := StrSQL || ' WHERE QPA8_KYUYOZANDAKA <> 0';
    StrSQL := StrSQL || '   AND TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD'') <= :SyousyoYMD';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
--    StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
    StrSQL := StrSQL || '   AND (QPA8_KANSAIYMD IS NULL';
    StrSQL := StrSQL || '   OR  QPA8_KANSAIYMD >= TO_DATE(:SyoriYM,''YYYYMM''))';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyousyoYMD', gbl_SyousyoYMD);
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyoriYM', SUBSTR(InStrYMD,1,6));
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  1,v_PRMSYAINCD1, 1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  2,v_PRMSYAINCD2, 7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  3,v_PRMYUSIYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  4,v_GENDOGAKU     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  5,v_RIRITU        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  6,v_HENSAITUKISU  );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  7,v_KYUYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  8,v_KYUYOHENSAI   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  9,v_SYOYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA );
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_PRMYUSIYMD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_RIRITU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_HENSAITUKISU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SYOYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_KANSAIYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_SYOYOZANDAKA    );

	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止判定処理 */
	v_KojocyushiFLG  :=  QPAP_Cent1401PkG.QPAP_CEnt1401KojocyushiChek(
									v_PRMSYAINCD1,
									v_PRMSYAINCD2,
									v_StrYMDHMS
									);

		IF v_KojocyushiFLG = '2' THEN


		      /* 10/24 ADD 利率計算修正 */
		      v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;

		      /* 利息計算 */
		      v_Risoku  := 0;     --利息

		      /* [給与返済額総額]=[給与残高]の場合 */
		      IF  v_KYUYOHENSAIALL = v_KYUYOZANDAKA THEN
		        /*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
		        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
		            IF  SUBSTR(TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),7,2) >= '11' THEN
		                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 30 / 12 / 3000);
		            ELSE
		                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 45 / 12 / 3000);
		            END IF;
		        ELSE
		---            v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);           -- 10/24 UPD
		            IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                                                               -- 10/24 UPD
		                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);          -- 10/24 UPD
		            ELSE                                                                                                                        -- 10/24 UPD
		                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU2 * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)));                 -- 10/24 UPD
		            END IF;                                                                                                                     -- 10/24 UPD
		        END IF;

		      /* [給与返済額総額]<>[給与残高]の場合 */
		      ELSE
		        /*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
		        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
		            v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU / 1200);
		        ELSE
		            v_WorkYMD := TO_CHAR(TO_DATE((SUBSTR(InStrYMD,1,6) || '01'),'YYYYMMDD') - 1,'YYYYMMDD');
		            v_WorkYMD := SUBSTR(v_WorkYMD,1,6) || '25';
		            v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_WorkYMD,'YYYYMMDD');
		---            v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                     -- 10/24 UPD
		            IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                           -- 10/24 UPD
		                v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                    -- 10/24 UPD
		            ELSE                                                                                    -- 10/24 UPD
		                v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU2 * v_Kikan);                           -- 10/24 UPD
		            END IF;                                                                                 -- 10/24 UPD
		        END IF;
		      END IF;

		      /* ワーク　控除連絡表_利息Ｔに追加 */
		      INSERT INTO QPAW_KojoRisoW VALUES (
		         NVL(v_PRMSYAINCD1,' ')   --個人コード１
		        ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
		        ,'2'                      --ローン種別
		        ,NULL                     --契約日
		        ,v_PRMYUSIYMD             --融資日
		        ,NVL(v_GENDOGAKU,0)       --融資額限度額
		        ,NVL(v_RIRITU,0)          --契約利率
		        ,NVL(v_HENSAITUKISU,0)    --返済月数
		        ,NVL(v_KYUYOHENSAIALL,0)  --給与返済額総額
		        ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
		        ,NVL(v_SYOYOHENSAIALL,0)  --賞与返済額総額
		        ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
		        ,v_KANSAIYMD              --完済日
		        ,NVL(v_KYUYOZANDAKA,0)    --給与残高
		        ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
		        ,v_Risoku                 --利息
		        ,NULL                     --東西区分
		        ,NULL                     --精算店コード
		        ,NULL                     --所属店コード
		        ,NULL                     --所属部門コード
		        ,NULL                     --店名称
		        ,NULL                     --個人名漢字
		        ,NULL                     --退職年月日
		        ,NULL                     --休職年月日
		        ,NULL                     --賞与支給月１
		        ,NULL                     --賞与支給月２
		        ,InStrUserID
		        ,InStrComputerNM
		        );
		END IF;
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt140KyuyoRisoku;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KyuZanSyukei        　 　                     */
/* 機能          ：給与残高集計                                          　　*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KyuZanSyukei (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;
  v_CursorID2     NUMBER := 0;
  v_Dummy2        INTEGER;

  v_DD1           CHAR(2);
  v_DD2           CHAR(2);
  v_YYYY          CHAR(4);
  v_MM            CHAR(2);
  v_YYYYMM        CHAR(6);
  v_ZenYMD        CHAR(8);    --前月

  /* バインド変数 */
  v_RowId           CHAR(18);                                   --ＲＯＷＩＤ
  v_SYAINCD1        QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2        QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU         QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_KYUYOZANDAKA    QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_BONUSYMD1       QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_KOJOGAKU        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;


  v_DD            CHAR(2);

BEGIN

    /* 前月日付 */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

    /*控除連絡表_WORK利息テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
--    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';                -- 10/19 UPD
--    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';                -- 10/19 UPD
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD1,''0000''),';    -- 10/19 UPD
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD2,''0000''),';    -- 10/19 UPD
    StrSQL := StrSQL || ' ROWIDTOCHAR(QPAW_KojoRisoW.ROWID) ';
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW,QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAW_SYAINCD1 = '' ''';
    StrSQL := StrSQL || '   AND QPAW_SYUBETU = ''1''';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPAW_SYAINCD1';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPAW_SYAINCD2';
    StrSQL := StrSQL || '   AND QPAE_PRMMISECD   = QPAC_MISECD';
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYUBETU,   1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_KYUYOZANDAKA);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_BONUSYMD1, 4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_BONUSYMD2, 4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_RowId    ,18);  --ＲＯＷＩＤ

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SYAINCD1    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SYAINCD2    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYUBETU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_KYUYOZANDAKA);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_BONUSYMD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_BONUSYMD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_RowId       );

      /* ボーナス日の判定 */
      v_DD1 := SUBSTR(v_BONUSYMD1,3,2);
      v_DD2 := SUBSTR(v_BONUSYMD2,3,2);
--      IF v_DD1 > '25' OR v_DD2 > '25' THEN                 -- 10/19 UPD
      IF TO_NUMBER(v_DD1) > 25 OR TO_NUMBER(v_DD2) > 25 THEN -- 10/19 UPD
          v_YYYY  := SUBSTR(v_ZenYMD,1,4);
          v_MM    := SUBSTR(v_ZenYMD,5,2);
          v_DD    := SUBSTR(v_ZenYMD,7,2);
      ELSE
          v_YYYY  := SUBSTR(InStrYMD,1,4);
          v_MM    := SUBSTR(InStrYMD,5,2);
          v_DD    := SUBSTR(InStrYMD,7,2);
      END IF;
      v_YYYYMM  := v_YYYY || v_MM;

/***********************************************************************/
/*  2001/10/19 UPDATE                                                  */
/*  以下の処理は賞与控除の対応に不備があり。                           */
/***********************************************************************/

--      /*小口融資賞与控除履歴テーブル検索 */
--      StrSQL := NULL;
--      StrSQL := StrSQL || 'SELECT DISTINCT';
--      StrSQL := StrSQL || ' QPA4_KOJOGAKU ';
--      StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
--      StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :SYAINCD1';
--     StrSQL := StrSQL || '   AND QPA4_SYAINCD2 = :SYAINCD2';
--      StrSQL := StrSQL || '   AND SUBSTR(TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD''),1,6) = :YYYYMM'; -- 10/19 UPD
--      StrSQL := StrSQL || '   AND TO_CHAR(QPA4_KOJOYMD,''YYYYMM'') = :YYYYMM';                 -- 10/19 UPD
--      /* 動的カーソルのオープン */
--      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
--      /* SQLの解析 */
--      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
--      /* 入力変数をバインドする */
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD1',   v_SYAINCD1);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD2',   v_SYAINCD2);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YYYYMM',     v_YYYYMM);
--      /* 出力変数のバインド */
--      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_KOJOGAKU    );
--      /* SQLの実行 */
--      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

--      LOOP
--        IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
--          EXIT;
--        END IF;

--        /* 給与残高の更新 */
--        UPDATE  QPAW_KojoRisoW
--           SET  QPAW_KYUYOZANDAKA  = QPAW_KYUYOZANDAKA - NVL(v_KOJOGAKU, 0)
--           WHERE
--                ROWIDTOCHAR(ROWID) =  v_RowId;
--      END LOOP;

      /* カーソルのクローズ */
--      DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
        IF v_DD <= '25' THEN
          BEGIN
              /* 小口賞与控除履歴検索 */
              SELECT DISTINCT
                     QPA4_KOJOGAKU
              INTO   v_KOJOGAKU
              FROM   QPA4_KGCKOJOT
              WHERE  QPA4_SYAINCD1                  = v_SYAINCD1
              AND    QPA4_SYAINCD2                  = v_SYAINCD2
              AND    TO_CHAR(QPA4_KOJOYMD,'YYYYMM') = v_YYYYMM;

              /* 給与残高の更新 */
              UPDATE QPAW_KojoRisoW
              SET    QPAW_KYUYOZANDAKA  =  QPAW_KYUYOZANDAKA - NVL(v_KOJOGAKU, 0)
              WHERE  ROWIDTOCHAR(ROWID) =  v_RowId;

          EXCEPTION
              WHEN NO_DATA_FOUND THEN
                  NULL;
              WHEN  OTHERS  THEN
                  IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
                      DBMS_SQL.CLOSE_CURSOR(v_CursorID);
                  END IF;
                  /* ロールバック */
                  ROLLBACK;
                  RAISE ;
          END;
        END IF;
    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

    /* コミット */
    COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
      IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
         DBMS_SQL.CLOSE_CURSOR(v_CursorID);
      END IF;
      IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
         DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
      END IF;
      /* ロールバック */
      ROLLBACK;
      RAISE ;
END QPAP_CEnt140KyuZanSyukei;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KojoPrtKyuyo     　                           */
/* 機能          ：控除連絡表_印刷ＷＯＲＫ作成                           　　*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KojoPrtKyuyo (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
--  StrSQL          VARCHAR2(1000);
  StrSQL          VARCHAR2(2000);
/* MOD 20100817 1004091 IMZ SHIBUTANI END */

  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;

  v_OutPutFLG     INTEGER;      --出力フラグ
  v_KINGAKU       NUMBER(7,0);  --金額
  v_GANKIN        NUMBER(7,0);  --元金
  v_ZANDAKA       NUMBER(7,0);  --残高

  /* バインド変数 */
  v_SEISANCD      QPAE_MISEM.QPAE_SEISANCD%TYPE;
  v_SEISANNM      QPAG_SEISANM.QPAG_SEISANNM%TYPE;
  v_SYAINCD1      QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2      QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU       QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_TOZAIKBN      QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_MISECD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MISENM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BUMONNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SIMEIKANJI    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YUSIYMD       QPAW_KojoRisoW.QPAW_YUSIYMD%TYPE;
  v_KYUYOHENSAI   QPAW_KojoRisoW.QPAW_KYUYOHENSAI%TYPE;
  v_KYUYOZANDAKA  QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA  QPAW_KojoRisoW.QPAW_SYOYOZANDAKA%TYPE;
  v_RISOKU        QPAW_KojoRisoW.QPAW_RISOKU%TYPE;
  v_BUMONCD       QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE;

/* ADD 20100817 1004091 IMZ SHIBUTANI START */
	v_KAISYACD			CHAR(3);
	v_KAISYANM			VARCHAR2(24);
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

  /* 2001/10/12 集計単位・出力順 不備対応 */
  v_TOZAIKBNE     QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;

BEGIN

    /****************************************/
    /* 控除連絡表_印刷ＷＯＲＫＴに追加  　　*/
    /****************************************/
    DELETE FROM QPAO_KOJOW
          WHERE QPAO_USERID     = InStrUserID
            AND QPAO_COMPUTERNM = InStrComputerNM;

    /*ワーク　控除連絡表_利息Ｔ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAE_SEISANCD,';
    StrSQL := StrSQL || ' QPAG_SEISANNM,';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAC_MISECD,';
    StrSQL := StrSQL || ' QPAE_MISENM,';
    StrSQL := StrSQL || ' QPAF_BUMONNM,';
    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAW_YUSIYMD,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_RISOKU,';
    StrSQL := StrSQL || ' QPAC_BUMONCD,';     --10/12 UPD
    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';   --10/12 ADD
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAC_MISECD';
    StrSQL := StrSQL || ' 	ELSE		''000''';
    StrSQL := StrSQL || ' END)	AS KAISYACD';
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAE_MISENM';
    StrSQL := StrSQL || ' 	ELSE		''㈱髙島屋''';
    StrSQL := StrSQL || ' END)	AS KAISYANM';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
    StrSQL := StrSQL ||      ',QPAC_SYAINM';
    StrSQL := StrSQL ||      ',QPAE_MISEM';
    StrSQL := StrSQL ||      ',QPAF_BUMONM';
    StrSQL := StrSQL ||      ',QPAG_SEISANM';
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '     ,(';
    StrSQL := StrSQL || '     SELECT';
    StrSQL := StrSQL || '     	 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD';
    StrSQL := StrSQL || '     	,COUNT(*)								AS CNT';
    StrSQL := StrSQL || '     FROM';
    StrSQL := StrSQL || '     	QPAH_OTHERM';
    StrSQL := StrSQL || '     WHERE';
    StrSQL := StrSQL || '     	QPAH_OTHERM.QPAH_PRMCODE LIKE ''TMISE%''';
    StrSQL := StrSQL || '     GROUP BY';
    StrSQL := StrSQL || '     	LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))';
    StrSQL := StrSQL || '     )	Q_CHECK_KAISYA';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = QPAW_SYAINCD1';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPAW_SYAINCD2';
    StrSQL := StrSQL || '   AND QPAC_MISECD   = QPAE_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAC_MISECD   = QPAF_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAC_BUMONCD  = QPAF_PRMBUMONCD(+)';
    StrSQL := StrSQL || '   AND QPAE_SEISANCD = QPAG_PRMSEISANCD(+)';
    StrSQL := StrSQL || '   AND (QPAC_TAISYOKUYMD IS NULL';
    StrSQL := StrSQL || '        OR TO_CHAR(QPAC_TAISYOKUYMD,''YYYYMMDD'') > :StrYMD)';
    StrSQL := StrSQL || '   AND (QPAC_KYUSYOSTYMD IS NULL';
    StrSQL := StrSQL || '        OR TO_CHAR(QPAC_KYUSYOSTYMD,''YYYYMMDD'') > :StrYMD)';
    StrSQL := StrSQL || '   AND (QPAC_KYUSYOEDYMD IS NULL';
    StrSQL := StrSQL || '        OR TO_CHAR(QPAC_KYUSYOEDYMD,''YYYYMMDD'') < :StrYMD)';
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '   AND	QPAC_MISECD			= Q_CHECK_KAISYA.MISECD(+)';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD',       InStrYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SEISANCD     ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SEISANNM     , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYAINCD1     ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_SYAINCD2     ,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SYUBETU      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_TOZAIKBN     ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_MISECD       ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_MISENM       , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_BUMONNM      , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SIMEIKANJI   , 20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_YUSIYMD          );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOHENSAI      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_KYUYOZANDAKA     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_SYOYOZANDAKA     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_RISOKU           );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_BUMONCD      ,  6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_TOZAIKBNE    ,  1);  --10/12 ADD
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_KAISYACD     ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_KAISYANM     , 24);
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SEISANCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SEISANNM      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYAINCD1      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_SYAINCD2      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SYUBETU       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_TOZAIKBN      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_MISECD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_MISENM        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_BUMONNM       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SIMEIKANJI    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_YUSIYMD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_RISOKU        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_BUMONCD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_TOZAIKBNE     );  --10/12 ADD
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_KAISYACD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_KAISYANM      );
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

      /* 出力判定ＦＬＧ 初期化*/
      v_OutPutFLG := 0;     --Off(出力しない)

      /* 金額算出 */
      --ローン種別＝１
      IF  v_SYUBETU = '1' THEN
          v_KINGAKU := v_KYUYOZANDAKA + v_RISOKU;
          IF  v_KYUYOHENSAI <= v_KINGAKU  THEN
              v_KINGAKU := v_KYUYOHENSAI;
          ELSE
              IF  v_KINGAKU <=  0   THEN
                  v_KINGAKU := 0;
              END IF;
          END IF;

      --ローン種別＝２
      ELSE
          IF  v_KYUYOHENSAI <= v_KYUYOZANDAKA THEN
              v_KINGAKU := v_KYUYOHENSAI;
          ELSE
              v_KINGAKU := v_KYUYOZANDAKA + v_RISOKU;
          END IF;
      END IF;

      /* 元金算出 */
      v_GANKIN  := v_KINGAKU - v_RISOKU;				--20037 - 735
      /* 残高算出 */
      --ローン種別＝１
      IF  v_SYUBETU = '1' THEN
          v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
      --ローン種別＝２
      ELSE
          v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
      END IF;

      /* 出力判定 */
      IF  v_KINGAKU       >= 0  AND
          v_RISOKU        <> 0        THEN
          v_OutPutFLG := 1;     --On(出力する)
      END IF;
      IF  v_KINGAKU       >  0    AND
          v_KYUYOZANDAKA  >  0        THEN
          v_OutPutFLG := 1;     --On(出力する)
      END IF;

      /* 2001/10/12 東西区分０ 不備対応 */
      IF  v_TOZAIKBN = '0' THEN     --東西区分 不定
          IF v_TOZAIKBNE = '1' THEN
             v_TOZAIKBN := '1';
          ELSE
             v_TOZAIKBN := '2';
          END IF;
      END IF;

/* 2003.03.25 精算店名が19Byte以上の時、オーバーフローの対応*/
	IF LENGTHB(RTRIM(v_SEISANNM)) <= 19 THEN
		IF  v_TOZAIKBN = '1' THEN
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
		ELSE
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
		END IF;
	END IF;

--      /* 2001/10/12 東西区分名称 追加 */
--      IF  v_TOZAIKBN = '1' THEN
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
--      ELSE
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
--      END IF;
/* 2003.03.25 */

      /* 控除連絡表_印刷ＷＯＲＫに追加 */
      IF  v_OutPutFLG = 1   THEN    --On(出力する)

/* DEL 20100817 1004091 IMZ SHIBUTANI START */
--	変換処理は不要の為、削除
--          /* 2001/10/12 集計単位・出力順 不備対応 */
--          SELECT  QSA2_MEI
--            INTO  v_MEI
--          FROM    QSA2_SCODET
--          WHERE   QSA2_PRMCODEKBN         = 'DP' || v_TOZAIKBN     --東
--              AND RTRIM(QSA2_PRMCODENO)   = v_MISECD;
/* DEL 20100817 1004091 IMZ SHIBUTANI END */

/* MOD 20100817 1004091 IMZ SHIBUTANI START */
/*
          INSERT INTO QPAO_KOJOW VALUES (
             TO_NUMBER(NVL(v_SEISANCD,'0'))   --ページ ※変更前 精算店コード    -- 10/12 UPD
            ,NULL                         --行
            ,SUBSTR(v_MEI,1,3)            --精算店コード    -- 10/12 UPD
            ,NVL(v_SEISANNM,' ')          --精算店名
            ,NVL(v_SYAINCD1,' ')          --社員コード１
            ,NVL(v_SYAINCD2,' ')          --社員コード２
            ,'0'                          --控除区分
            ,NVL(v_SYUBETU,' ')           --ローン種別
            ,NVL(v_TOZAIKBN,' ')          --東西区分
            ,SUBSTR(v_MEI,4,3)            --店コード    -- 10/12 UPD
            ,NVL(v_MISENM,' ')            --店名
            ,NVL(v_BUMONNM,' ')           --部門名
            ,NVL(v_SIMEIKANJI,' ')        --氏名
            ,v_YUSIYMD                    --融資日
            ,v_KINGAKU                    --金額
            ,v_GANKIN                     --元金
            ,NVL(v_RISOKU,0)              --利息
            ,v_ZANDAKA                    --残高
            ,TO_DATE(InStrYMD,'YYYYMMDD') --処理日
            ,NVL(v_BUMONCD,' ')           --部門コード
            ,InStrUserID
            ,InStrComputerNM
            );
*/
		INSERT INTO QPAO_KOJOW
		(
			 QPAO_PAGEKBN
			,QPAO_GYOUKBN
			,QPAO_SEISANCD
			,QPAO_SEISANNM
			,QPAO_SYAINCD1
			,QPAO_SYAINCD2
			,QPAO_KOJOKBN
			,QPAO_SYUBETU
			,QPAO_TOZAIKBN
			,QPAO_MISECD
			,QPAO_MISENM
			,QPAO_BUMONNM
			,QPAO_SINEIKANJI
			,QPAO_YUSIYMD
			,QPAO_KINGAKU
			,QPAO_GANKIN
			,QPAO_RISOKU
			,QPAO_ZANDAKA
			,QPAO_SYORIYMD
			,QPAO_BUMONCD
			,QPAO_USERID
			,QPAO_COMPUTERNM
		) VALUES (
			 TO_NUMBER(NVL(v_SEISANCD,'0'))
			,NULL
			,NVL(v_KAISYACD,' ')
			,NVL(v_KAISYANM,' ')
			,NVL(v_SYAINCD1,' ')
			,NVL(v_SYAINCD2,' ')
			,'0'
			,NVL(v_SYUBETU,' ')
			,NVL(v_TOZAIKBN,' ')
			,NVL(v_MISECD,' ')
			,NVL(v_MISENM,' ')
			,NVL(v_BUMONNM,' ')
			,NVL(v_SIMEIKANJI,' ')
			,v_YUSIYMD
			,v_KINGAKU
			,v_GANKIN
			,NVL(v_RISOKU,0)
			,v_ZANDAKA
			,TO_DATE(InStrYMD,'YYYYMMDD')
			,NVL(v_BUMONCD,' ')
			,InStrUserID
			,InStrComputerNM
		);
/* MOD 20100817 1004091 IMZ SHIBUTANI END */
      END IF;

    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt140KojoPrtKyuyo;

--del TR0506-023 imz.Yoshida ==>
--/*****************************************************************************/
--/* モジュール名  ：QPAP_CEnt140SyouyoRisoku   　 　                          */
--/* 機能          ：控除連絡表_賞与利息ＷＯＲＫ作成                         　*/
--/*****************************************************************************/
--PROCEDURE QPAP_CEnt140SyouyoRisoku (
--  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
--  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
--  InStrYMD        IN  VARCHAR2) IS                      --賞与日付
--
--  /* 処理固有の変数 */
--  StrSQL          VARCHAR2(1000);
--  v_CursorID      NUMBER := 0;
--  v_CursorID2     NUMBER := 0;
--  v_Dummy         INTEGER;
--
--  v_SelectFlg     INTEGER;
--
--  v_Risoku        NUMBER;     --利息
--  v_ZenYMD        CHAR(8);    --前月
--
--  v_BONUSYMD18    CHAR(8);
--  v_BONUSYMD28    CHAR(8);
--  v_BONUSYMD_W    CHAR(8);
--  v_BONUSMM1      CHAR(2);
--  v_BONUSMM2      CHAR(2);
--  v_SYOYOMM       CHAR(2);
--
--  v_SIMEIKANJI      QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
--  v_MISECD          QPAC_SYAINM.QPAC_MISECD%TYPE;
--  v_TOZAIKBN        QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
--  v_BUMONCD         QPAC_SYAINM.QPAC_BUMONCD%TYPE;
--  v_TAISYOKUYMD     QPAC_SYAINM.QPAC_TAISYOKUYMD%TYPE;
--  v_KYUSYOSTYMD     QPAC_SYAINM.QPAC_KYUSYOSTYMD%TYPE;
--  v_KYUSYOEDYMD     QPAC_SYAINM.QPAC_KYUSYOEDYMD%TYPE;
--
--  v_BONUSYMD1       QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
--  v_BONUSYMD2       QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
--  v_SEISANCD        QPAE_MISEM.QPAE_SEISANCD%TYPE;
--  v_MISENM          QPAE_MISEM.QPAE_MISENM%TYPE;
--
--  V_ZANDAKA         QPAA_KOJOT.QPAA_ZANDAKA%TYPE;     --控除テーブル 残高
--
--  v_PRMSYAINCD1     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
--  v_PRMSYAINCD2     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
--  v_PRMYUSIYMD      QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
--  v_GENDOGAKU       QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
--  v_SYUBETU         QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
--  v_RIRITU          QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
--  v_HENSAITUKISU    QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
--  v_KYUYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
--  v_KYUYOHENSAI     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
--  v_SYOYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
--  v_SYOYOHENSAI     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
--  v_KYUYOZANDAKA    QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
--  v_SYOYOZANDAKA    QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
--  v_KOJOCYUSIFLG    QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
--  v_KANSAIYMD       QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;
--
--  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
--  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
--  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
--
--  /* 2001/10/12 東西区分０ 不備対応 */
--  v_TOZAIKBNE     QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
--
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--  v_FROMDATE       CHAR(8);
--  v_TODATE         CHAR(8);
--  v_TODATE_2       CHAR(8);
--  InStrYMD_2       CHAR(8);
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--BEGIN
--
--    /****************************************/
--    /* 控除連絡表_利息ＷＯＲＫＴに追加  　　*/
--    /****************************************/
--    DELETE FROM QPAW_KojoRisoW
--          WHERE QPAW_USERID     = InStrUserID
--            AND QPAW_COMPUTERNM = InStrComputerNM;
--
--    /* 前月日付 */
--    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');
--
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--    v_FROMDATE := SUBSTR(v_ZenYMD, 1, 6) || '26';	-- 処理年月の前月26日
--    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';  -- 処理年月の当月25日
--    v_TODATE_2 := TO_CHAR(TO_DATE(SUBSTR(InStrYMD, 1, 6) || '01', 'YYYYMMDD') -1, 'YYYYMMDD'); 	-- 処理年月の前月末日
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--    /*■小口■　小口融資台帳テーブル検索 */
--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT DISTINCT';
--    StrSQL := StrSQL || ' QPA1_PRMSYAINCD1,';
--    StrSQL := StrSQL || ' QPA1_PRMSYAINCD2,';
--    StrSQL := StrSQL || ' QPA1_KEIYAKUYMD,';
--    StrSQL := StrSQL || ' QPA1_GENDOGAKU,';
--    StrSQL := StrSQL || ' QPA1_KYUYOHENSAI,';
--    StrSQL := StrSQL || ' QPA1_SYOYOHENSAI,';
--    StrSQL := StrSQL || ' QPA1_KYUYOZANDAKA,';
--    StrSQL := StrSQL || ' QPA1_SYOYOZANDAKA,';
--    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
--    StrSQL := StrSQL || ' QPAC_MISECD,';
--    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
--    StrSQL := StrSQL || ' QPAC_BUMONCD,';
--    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD,';
--    StrSQL := StrSQL || ' QPAC_KYUSYOSTYMD,';
--    StrSQL := StrSQL || ' QPAC_KYUSYOEDYMD,';
--    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';
--    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';
--    StrSQL := StrSQL || ' QPAE_SEISANCD,';
--    StrSQL := StrSQL || ' QPAE_MISENM,';        --10/12 UPD
--    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';     --10/12 ADD
--    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT,';
--    StrSQL := StrSQL || '      QPAC_SYAINM,';
--    StrSQL := StrSQL || '      QPAE_MISEM';
--    StrSQL := StrSQL || ' WHERE (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = '' '')';
--    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA1_PRMSYAINCD1 ';
--    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA1_PRMSYAINCD2 ';
--    StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';
--
--    /* 動的カーソルのオープン */
--    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--    /* SQLの解析 */
--    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--    /* 入力変数をバインドする */
--
--    /* 出力変数のバインド */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_KEIYAKUYMD     );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAI    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SYOYOHENSAI    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOZANDAKA   );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOZANDAKA   );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SIMEIKANJI,  20);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_MISECD,       3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_TOZAIKBN,     1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_BUMONCD,      6);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_TAISYOKUYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUSYOSTYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_KYUSYOEDYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_BONUSYMD1,    4);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BONUSYMD2,    4);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD,     3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISENM,      24);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_TOZAIKBNE,    1);  --10/12 ADD
--
--    /* SQLの実行 */
--    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--
--    LOOP
--      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
--        EXIT;
--      END IF;
--      /* カラム値を変数へ格納 */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_KEIYAKUYMD   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAI  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SYOYOHENSAI  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOZANDAKA );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOZANDAKA );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SIMEIKANJI   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_MISECD       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_TOZAIKBN     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_BUMONCD      );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_TAISYOKUYMD  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUSYOSTYMD  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_KYUSYOEDYMD  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_BONUSYMD1    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BONUSYMD2    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISENM       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_TOZAIKBNE    );  --10/12 ADD
--
--
----2002/03/07 小口返済額テーブルより返済額を取得（小口返済台帳の返済額は使用しない）
--
--     /* 小口返済額情報取得 */
--      StrSQL := NULL;
--      StrSQL := StrSQL || 'SELECT';
--      StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
--      StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
--      StrSQL := StrSQL || ' FROM  QPA2_KGCHENSAIT';
--      StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
--      StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2  = :Code2';
--      StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM  <= :YM';
--      StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
--      /* 動的カーソルのオープン */
--      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
--      /* SQLの解析 */
--      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
--      /* 入力変数をバインドする */
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_PRMSYAINCD1);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_PRMSYAINCD2);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(InStrYMD,1,6));
--      /* 出力変数のバインド */
--      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KYUYOHENSAI);
--      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYOYOHENSAI);
--      /* SQLの実行 */
--      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
--      /* FETCH */
--       IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
--         /* カラム値を変数へ格納 */
--        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KYUYOHENSAI);
--       DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYOYOHENSAI);
--      END IF;
--      /* カーソルのクローズ */
--      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
--
----2002/03/07 ここまで
--
--      /* 2001/10/12 東西区分０ 不備対応 */
--      IF  v_TOZAIKBN = '0' THEN     --東西区分 不定
--          IF v_TOZAIKBNE = '1' THEN
--             v_TOZAIKBN := '1';
--          ELSE
--             v_TOZAIKBN := '2';
--          END IF;
--      END IF;
--
--      /* 控除テーブルより残高取得 */
--      v_SelectFlg := 1;
--      BEGIN
--        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
--                                   FROM   QPAA_KOJOT
--                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
--                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
--                                     AND  QPAA_SYUBETU  = '1'
--                                     AND  QPAA_YUSIKBN  = '3';
--      EXCEPTION
--           WHEN   NO_DATA_FOUND THEN
--                  v_SelectFlg := 0;
--           WHEN   OTHERS THEN
--                  RAISE;
--      END;
--
--      /* 賞与支給年月日の再編集 */
--      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
--      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
--
--      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
--         v_BONUSYMD_W   := v_BONUSYMD18;
--         v_BONUSYMD18   := v_BONUSYMD28;
--         v_BONUSYMD28   := v_BONUSYMD_W;
--      END IF;
--
--      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
--      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
--      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);
--
--      /* ワーク　控除連絡表_利息Ｔに追加 */
--      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
--          INSERT INTO QPAW_KojoRisoW VALUES (
--             NVL(v_PRMSYAINCD1,' ')   --個人コード１
--            ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
--            ,'1'                      --ローン種別
--            ,v_KEIYAKUYMD             --契約日
--            ,NULL                     --融資日
--            ,NVL(v_GENDOGAKU,0)       --融資額限度額
--            ,0                        --契約利率
--            ,0                        --返済月数
--            ,0                        --給与返済額総額
--            ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
--            ,0                        --賞与返済額総額
--            ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
--            ,NULL                     --完済日
--            ,DECODE(v_SelectFlg,1,V_ZANDAKA,NVL(v_KYUYOZANDAKA,0))    --給与残高
--            ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
--            ,0                        --利息
--            ,NVL(v_TOZAIKBN,' ')      --東西区分
--            ,NVL(v_SEISANCD,' ')      --精算店コード
--            ,NVL(v_MISECD,' ')        --所属店コード
--            ,NVL(v_BUMONCD,' ')       --所属部門コード
--            ,NVL(v_MISENM,' ')        --店名称
--            ,NVL(v_SIMEIKANJI,' ')    --個人名漢字
--            ,v_TAISYOKUYMD            --退職年月日
--            ,v_KYUSYOSTYMD            --休職年月日
--            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --賞与支給月１
--            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --賞与支給月２
--            ,InStrUserID
--            ,InStrComputerNM
--            );
--      END IF;
--
--    END LOOP;
--
--    /* カーソルのクローズ */
--    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
--
--
--    /*■証書■　社員融資台帳テーブル検索 */
--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT DISTINCT';
--    StrSQL := StrSQL || ' QPA8_PRMSYAINCD1,';
--    StrSQL := StrSQL || ' QPA8_PRMSYAINCD2,';
--    StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
--    StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
--    StrSQL := StrSQL || ' QPA8_RIRITU,';
--    StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
--    StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
--    StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
--    StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
--    StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
--    StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
--    StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
--    StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA,';
--    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
--    StrSQL := StrSQL || ' QPAC_MISECD,';
--    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
--    StrSQL := StrSQL || ' QPAC_BUMONCD,';
--    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD,';
--    StrSQL := StrSQL || ' QPAC_KYUSYOSTYMD,';
--    StrSQL := StrSQL || ' QPAC_KYUSYOEDYMD,';
--    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';
--    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';
--    StrSQL := StrSQL || ' QPAE_SEISANCD,';
--    StrSQL := StrSQL || ' QPAE_MISENM,';        --10/12 UPD
--    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';     --10/12 ADD
--    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT,';
--    StrSQL := StrSQL || '      QPAC_SYAINM,';
--    StrSQL := StrSQL || '      QPAE_MISEM';
--    StrSQL := StrSQL || ' WHERE QPA8_SYOYOZANDAKA <> 0';
--    StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
--    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA8_PRMSYAINCD1 ';
--    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA8_PRMSYAINCD2 ';
--    StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';
--
--    /* 動的カーソルのオープン */
--    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--    /* SQLの解析 */
--    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--    /* 入力変数をバインドする */
--
--    /* 出力変数のバインド */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1, 1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2, 7);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_PRMYUSIYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU     );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_RIRITU        );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_HENSAITUKISU  );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOHENSAIALL);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KYUYOHENSAI   );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SYOYOHENSAIALL);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_SIMEIKANJI,  20);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_MISECD,       3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_TOZAIKBN,     1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BUMONCD,      6);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_TAISYOKUYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_KYUSYOSTYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_KYUSYOEDYMD    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_BONUSYMD1,    4);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_BONUSYMD2,    4);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_SEISANCD,     3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_MISENM,      24);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_TOZAIKBNE,    1);  --10/12 ADD
--
--    /* SQLの実行 */
--    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--
--    LOOP
--      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
--        EXIT;
--      END IF;
--      /* カラム値を変数へ格納 */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_PRMYUSIYMD    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_RIRITU        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_HENSAITUKISU  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOHENSAIALL);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KYUYOHENSAI   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SYOYOHENSAIALL);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SYOYOHENSAI   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_KANSAIYMD     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOZANDAKA  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_SYOYOZANDAKA  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_SIMEIKANJI    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_MISECD        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_TOZAIKBN      );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BUMONCD       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_TAISYOKUYMD   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_KYUSYOSTYMD   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_KYUSYOEDYMD   );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_BONUSYMD1     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_BONUSYMD2     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_SEISANCD      );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_MISENM        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_TOZAIKBNE     );  --10/12 ADD
--
--      /* 2001/10/12 東西区分０ 不備対応 */
--      IF  v_TOZAIKBN = '0' THEN     --東西区分 不定
--          IF v_TOZAIKBNE = '1' THEN
--             v_TOZAIKBN := '1';
--          ELSE
--             v_TOZAIKBN := '2';
--          END IF;
--      END IF;
--
--      /* 控除テーブルより残高取得 */
--      v_SelectFlg := 1;
--      BEGIN
--        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
--                                   FROM   QPAA_KOJOT
--                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
--                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
--                                     AND  QPAA_YUSIYMD  = v_PRMYUSIYMD
--                                     AND  QPAA_SYUBETU  = '2'
--                                     AND  QPAA_YUSIKBN  = '3';
--      EXCEPTION
--           WHEN   NO_DATA_FOUND THEN
--                  v_SelectFlg := 0;
--           WHEN   OTHERS THEN
--                  RAISE;
--      END;
--
--      /* 賞与支給年月日の再編集 */
--      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
--      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
--
--/* Yasui@NBC 2005.05.06 控除作成不備 賞与日取得の修正 ==> */
--      v_BONUSYMD18 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
--      v_BONUSYMD28 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
--         v_BONUSYMD_W   := v_BONUSYMD18;
--         v_BONUSYMD18   := v_BONUSYMD28;
--         v_BONUSYMD28   := v_BONUSYMD_W;
--      END IF;
--
--      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
--      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
--      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);
--
--      /* ワーク　控除連絡表_利息Ｔに追加 */
--/* Yasui@NBC 2005.05.06 控除作成不備 処理年月の前月26日～処理年月の25日内であればワーク作成 ==> */
----      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
--      IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
--      OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
--
--         -- 利息算出処理の賞与日決定
--		   IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE_2))
--         OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE_2)) THEN
--             --賞与日が先月26日～先月末日なら前月
--		       InStrYMD_2 := v_ZenYMD;
--		   ELSE
--             --賞与日が処理年月日なら処理年月
--		       InStrYMD_2 := InStrYMD;
--		   END IF;
--/* Yasui@NBC 2005.05.06 控除作成不備 処理年月の前月26日～処理年月の25日内であればワーク作成 <== */
--
--        /*   融資日 <= 証書抽出日付  */
--        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') <= gbl_SyousyoYMD  THEN
--
--          /* 利息計算 */
--/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 ==> */
----          v_Risoku := QPAP_CEnt140SyoRisokuFnc(v_PRMYUSIYMD,        --融資日
----                                               v_SYOYOHENSAIALL,    --賞与返済総額
----                                               v_SYOYOHENSAI,       --賞与返済額
----                                               v_SYOYOZANDAKA,      --賞与残高
--                                               v_RIRITU,            --契約利率
--                                               v_BONUSYMD18,        --賞与支給日１
--                                               v_BONUSYMD28,        --賞与支給日２
--                                               InStrYMD);           --賞与日付
--          v_Risoku := QPAP_CEnt140SyoRisokuFnc(v_PRMYUSIYMD,        --融資日
--                                               v_SYOYOHENSAIALL,    --賞与返済総額
--                                               v_SYOYOHENSAI,       --賞与返済額
--                                               v_SYOYOZANDAKA,      --賞与残高
--                                               v_RIRITU,            --契約利率
--                                               v_BONUSYMD18,        --賞与支給日１
--                                               v_BONUSYMD28,        --賞与支給日２
--                                               InStrYMD_2);         --賞与日付
--/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 <== */
--          INSERT INTO QPAW_KojoRisoW VALUES (
--             NVL(v_PRMSYAINCD1,' ')   --個人コード１
--            ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
--            ,'2'                      --ローン種別
--            ,NULL                     --契約日
--            ,v_PRMYUSIYMD             --融資日
--            ,NVL(v_GENDOGAKU,0)       --融資額限度額
--            ,NVL(v_RIRITU,0)          --契約利率
--            ,NVL(v_HENSAITUKISU,0)    --返済月数
--            ,NVL(v_KYUYOHENSAIALL,0)  --給与返済額総額
--            ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
--            ,NVL(v_SYOYOHENSAIALL,0)  --賞与返済額総額
--            ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
--            ,v_KANSAIYMD              --完済日
--            ,DECODE(v_SelectFlg,1,V_ZANDAKA - NVL(v_SYOYOZANDAKA,0),NVL(v_KYUYOZANDAKA,0))    --給与残高
--            ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
--            ,v_Risoku                 --利息
--            ,NVL(v_TOZAIKBN,' ')      --東西区分
--            ,NVL(v_SEISANCD,' ')      --精算店コード
--            ,NVL(v_MISECD,' ')        --所属店コード
--            ,NVL(v_BUMONCD,' ')       --所属部門コード
--            ,NVL(v_MISENM,' ')        --店名称
--            ,NVL(v_SIMEIKANJI,' ')    --個人名漢字
--            ,v_TAISYOKUYMD            --退職年月日
--            ,v_KYUSYOSTYMD            --休職年月日
--            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --賞与支給月１
--            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --賞与支給月２
--            ,InStrUserID
--            ,InStrComputerNM
--            );
--        END IF;
--      END IF;
--
--    END LOOP;
--
--    /* カーソルのクローズ */
--    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
--
--  /* コミット */
--  COMMIT;
--
--EXCEPTION
--  WHEN  OTHERS  THEN
--    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
--        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
--    END IF;
--    /* ロールバック */
--    ROLLBACK;
--    RAISE ;
--END QPAP_CEnt140SyouyoRisoku;
--del TR0506-023 imz.Yoshida <==

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KojoPrtSyouyo                                 */
/* 機能          ：控除連絡表_賞与印刷ＷＯＲＫ作成[画面表示、帳票印刷用]     */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KojoPrtSyouyo (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --給与日付

  /* 処理固有の変数 */
/* MOD 20100817 1004091 IMZ SHIBUTANI START */
--  StrSQL          VARCHAR2(1000);
  StrSQL          VARCHAR2(2000);
/* MOD 20100817 1004091 IMZ SHIBUTANI END */

  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;

  v_OutPutFLG     INTEGER;      --出力フラグ
  v_KINGAKU       NUMBER(7,0);  --金額
  v_GANKIN        NUMBER(7,0);  --元金
  v_ZANDAKA       NUMBER(7,0);  --残高

  /* バインド変数 */
  v_SYAINCD1        QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2        QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU         QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_KEIYAKUYMD      QPAW_KojoRisoW.QPAW_KEIYAKUYMD%TYPE;
  v_YUSIYMD         QPAW_KojoRisoW.QPAW_YUSIYMD%TYPE;
  v_GENDOGAKU       QPAW_KojoRisoW.QPAW_GENDOGAKU%TYPE;
  v_RIRITU          QPAW_KojoRisoW.QPAW_RIRITU%TYPE;
  v_HENSAITUKISU    QPAW_KojoRisoW.QPAW_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPAW_KojoRisoW.QPAW_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPAW_KojoRisoW.QPAW_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPAW_KojoRisoW.QPAW_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPAW_KojoRisoW.QPAW_SYOYOHENSAI%TYPE;
  v_KANSAIYMD       QPAW_KojoRisoW.QPAW_KANSAIYMD%TYPE;
  v_KYUYOZANDAKA    QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPAW_KojoRisoW.QPAW_SYOYOZANDAKA%TYPE;
  v_RISOKU          QPAW_KojoRisoW.QPAW_RISOKU%TYPE;
  v_TOZAIKBN        QPAW_KojoRisoW.QPAW_TOZAIKBN%TYPE;
  v_SEISANCD        QPAW_KojoRisoW.QPAW_SEISANCD%TYPE;
  v_MISECD          QPAW_KojoRisoW.QPAW_MISECD%TYPE;
  v_BUMONCD         QPAW_KojoRisoW.QPAW_BUMONCD%TYPE;
  v_MISENM          QPAW_KojoRisoW.QPAW_MISENM%TYPE;
  v_SIMEIKANJI      QPAW_KojoRisoW.QPAW_SIMEIKANJI%TYPE;
  v_TAISYOKUYMD     QPAW_KojoRisoW.QPAW_TAISYOKUYMD%TYPE;
  v_KYUSYOKUYMD     QPAW_KojoRisoW.QPAW_KYUSYOKUYMD%TYPE;
  v_BONUSYMD1       QPAW_KojoRisoW.QPAW_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAW_KojoRisoW.QPAW_BONUSYMD2%TYPE;

  v_BUMONNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SEISANNM        QPAG_SEISANM.QPAG_SEISANNM%TYPE;

  v_SYORIYMD        CHAR(8);
  v_SYORIMM         CHAR(2);
  v_BONUSMM1        CHAR(2);
  v_BONUSMM2        CHAR(2);

/* ADD 20100817 1004091 IMZ SHIBUTANI START */
	v_KAISYACD			CHAR(3);
	v_KAISYANM			VARCHAR2(24);
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

  /* 2001/10/12 集計単位・出力順 不備対応 */
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
  v_FROMDATE       CHAR(8);
  v_TODATE         CHAR(8);
  v_BONUSYMD18     CHAR(8);
  v_BONUSYMD28     CHAR(8);
/* Yasui@NBC 2005.05.06 控除作成不備 <== */

BEGIN

    /****************************************/
    /* 控除連絡表_印刷ＷＯＲＫＴに追加  　　*/
    /****************************************/
    DELETE FROM QPAO_KOJOW
          WHERE QPAO_USERID     = InStrUserID
            AND QPAO_COMPUTERNM = InStrComputerNM;

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
    v_FROMDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMM') || '26';	-- 処理年月の前月26日
    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                            -- 処理年月の当月25日
/* Yasui@NBC 2005.05.06 控除作成不備 <== */

    /*ワーク　控除連絡表_利息Ｔ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAW_KEIYAKUYMD,';
    StrSQL := StrSQL || ' QPAW_YUSIYMD,';
    StrSQL := StrSQL || ' QPAW_GENDOGAKU,';
    StrSQL := StrSQL || ' QPAW_RIRITU,';
    StrSQL := StrSQL || ' QPAW_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPAW_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_KANSAIYMD,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_RISOKU,';
    StrSQL := StrSQL || ' QPAW_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAW_SEISANCD,';
    StrSQL := StrSQL || ' QPAW_MISECD,';
    StrSQL := StrSQL || ' QPAW_BUMONCD,';
    StrSQL := StrSQL || ' QPAW_MISENM,';
    StrSQL := StrSQL || ' QPAW_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAW_TAISYOKUYMD,';
    StrSQL := StrSQL || ' QPAW_KYUSYOKUYMD,';
    StrSQL := StrSQL || ' QPAW_BONUSYMD1,';
    StrSQL := StrSQL || ' QPAW_BONUSYMD2,';
    StrSQL := StrSQL || ' QPAF_BUMONNM,';
    StrSQL := StrSQL || ' QPAG_SEISANNM ';
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAW_MISECD';
    StrSQL := StrSQL || ' 	ELSE		''000''';
    StrSQL := StrSQL || ' END)	AS KAISYACD';
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAW_MISENM';
    StrSQL := StrSQL || ' 	ELSE		''㈱髙島屋''';
    StrSQL := StrSQL || ' END)	AS KAISYANM';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
    StrSQL := StrSQL || '     ,QPAF_BUMONM';
    StrSQL := StrSQL || '     ,QPAG_SEISANM ';
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '     ,(';
    StrSQL := StrSQL || '     SELECT';
    StrSQL := StrSQL || '     	 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD';
    StrSQL := StrSQL || '     	,COUNT(*)								AS CNT';
    StrSQL := StrSQL || '     FROM';
    StrSQL := StrSQL || '     	QPAH_OTHERM';
    StrSQL := StrSQL || '     WHERE';
    StrSQL := StrSQL || '     	QPAH_OTHERM.QPAH_PRMCODE LIKE ''TMISE%''';
    StrSQL := StrSQL || '     GROUP BY';
    StrSQL := StrSQL || '     	LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))';
    StrSQL := StrSQL || '     )	Q_CHECK_KAISYA';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' WHERE QPAW_MISECD   = QPAF_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAW_BUMONCD  = QPAF_PRMBUMONCD(+)';
    StrSQL := StrSQL || '   AND QPAW_SEISANCD = QPAG_PRMSEISANCD(+)';
    StrSQL := StrSQL || '   AND (QPAW_TAISYOKUYMD IS NULL';
    StrSQL := StrSQL || '        OR TO_CHAR(QPAW_TAISYOKUYMD,''YYYYMMDD'') > :StrYMD)';
    StrSQL := StrSQL || '   AND (QPAW_KYUSYOKUYMD IS NULL';
    StrSQL := StrSQL || '        OR TO_CHAR(QPAW_KYUSYOKUYMD,''YYYYMMDD'') > :StrYMD)';
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '   AND	QPAW_MISECD			= Q_CHECK_KAISYA.MISECD(+)';
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD',  InStrYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SYAINCD1      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SYAINCD2      ,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYUBETU       ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_KEIYAKUYMD        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_YUSIYMD           );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_GENDOGAKU         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_RIRITU            );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_HENSAITUKISU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KYUYOHENSAIALL    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KYUYOHENSAI       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SYOYOHENSAIALL    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_SYOYOHENSAI       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_KANSAIYMD         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUYOZANDAKA      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_SYOYOZANDAKA      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_RISOKU            );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_TOZAIKBN      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD      ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISECD        ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_BUMONCD       ,  6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_MISENM        , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_SIMEIKANJI    , 40);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_TAISYOKUYMD       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_KYUSYOKUYMD       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_BONUSYMD1         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,26,v_BONUSYMD2         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,27,v_BUMONNM       , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,28,v_SEISANNM      , 24);
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,29,v_KAISYACD      ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,30,v_KAISYANM      , 24);
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SYAINCD1        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SYAINCD2        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYUBETU         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_KEIYAKUYMD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_YUSIYMD         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_GENDOGAKU       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_RIRITU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_HENSAITUKISU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KYUYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KYUYOHENSAI     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SYOYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_SYOYOHENSAI     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_KANSAIYMD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_SYOYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_RISOKU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_TOZAIKBN        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISECD          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_BUMONCD         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_MISENM          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_SIMEIKANJI      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_TAISYOKUYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_KYUSYOKUYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_BONUSYMD1       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,26,v_BONUSYMD2       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,27,v_BUMONNM         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,28,v_SEISANNM        );
/* ADD 20100817 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,29,v_KAISYACD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,30,v_KAISYANM        );
/* ADD 20100817 1004091 IMZ SHIBUTANI END */

      /* 金額算出 */
      --ローン種別＝１
      IF  v_SYUBETU = '1' THEN
          IF  v_SYOYOHENSAI <= v_KYUYOZANDAKA  THEN
              v_KINGAKU := v_SYOYOHENSAI;
          ELSE
              v_KINGAKU := v_KYUYOZANDAKA;
          END IF;

      --ローン種別＝２
      ELSE
          IF  v_SYOYOHENSAI <= v_SYOYOZANDAKA  THEN
              v_KINGAKU := v_SYOYOHENSAI;
          ELSE
              v_KINGAKU := v_SYOYOZANDAKA + v_RISOKU;
          END IF;
      END IF;

      /* 元金算出 */
      v_GANKIN  := v_KINGAKU - v_RISOKU;

      /* 残高算出 */
      --ローン種別＝１
      IF  v_SYUBETU = '1' THEN
          v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
      --ローン種別＝２
      ELSE
          v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
      END IF;

      /* 処理日 算出 */
/* Yasui@NBC 2005.05.06 控除作成不備 賞与日取得の修正 ==> */
--      IF  SUBSTR(InStrYMD,5,2) = SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2) THEN
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),7,2);
--      ELSE
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),7,2);
--      END IF;
      IF TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
      AND TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
          v_SYORIYMD := TO_CHAR(v_BONUSYMD1,'YYYYMMDD');
      ELSE
          IF TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
          AND TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
             v_SYORIYMD := TO_CHAR(v_BONUSYMD2,'YYYYMMDD');
          ELSE
             v_SYORIYMD := NULL;
          END IF;
      END IF;
/* Yasui@NBC 2005.05.06 控除作成不備 <== */

      /* 判定用 月 */
      v_SYORIMM   := SUBSTR(InStrYMD,5,2);
      v_BONUSMM1  := SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2);
      v_BONUSMM2  := SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),5,2);

      /* 出力判定ＦＬＧ 初期化*/
      v_OutPutFLG := 0;     --Off(出力しない)
      /* 出力判定 */
      IF  v_KINGAKU       >  0  AND
          v_RISOKU        >  0  AND
         (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
          DBMS_OUTPUT.PUT_LINE('1');
      END IF;
      IF  v_SYUBETU = '1'   THEN
--mod TR0506-023 imz.Yoshida ==>
--          IF  v_KYUYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
--             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
          v_BONUSYMD18 := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');
          v_BONUSYMD28 := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');
          IF  v_KYUYOZANDAKA  >  0  AND
              v_KINGAKU       >  0  AND
             (  (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE) )
             OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE) )) THEN
              v_OutPutFLG := 1;     --On(出力する)
          END IF;
      END IF;
--mod TR0506-023 imz.Yoshida <==
      IF  v_SYUBETU = '2'   THEN
/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--          IF  v_SYOYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
--             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
--              v_OutPutFLG := 1;     --On(出力する)
--          END IF;
          v_BONUSYMD18 := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');
          v_BONUSYMD28 := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');
          IF  v_SYOYOZANDAKA  >  0 AND
              v_KINGAKU       >  0 AND
             (  (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE) )
             OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE) )) THEN
                v_OutPutFLG := 1;     --On(出力する)
          END IF;
/* Yasui@NBC 2005.05.06 控除作成不備 <== */
      END IF;

/* 2003.03.25 精算店名が19Byte以上の時、オーバーフローの対応*/
	IF LENGTHB(RTRIM(v_SEISANNM)) <= 19 THEN
		IF  v_TOZAIKBN = '1' THEN
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
		ELSE
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
		END IF;
	END IF;

--      /* 2001/10/12 東西区分名称 追加 */
--      IF  v_TOZAIKBN = '1' THEN
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
--      ELSE
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
--      END IF;
/* 2003.03.25 */

      /* 控除連絡表_印刷ＷＯＲＫに追加 */
      IF  v_OutPutFLG = 1   THEN    --On(出力する)

/* DEL 20100817 1004091 IMZ SHIBUTANI START */
--          /* 2001/10/12 集計単位・出力順 不備対応 */
--          SELECT  QSA2_MEI
--            INTO  v_MEI
--          FROM    QSA2_SCODET
--          WHERE   QSA2_PRMCODEKBN         = 'DP' || v_TOZAIKBN     --東
--              AND RTRIM(QSA2_PRMCODENO)   = v_MISECD;
/* DEL 20100817 1004091 IMZ SHIBUTANI END */

/* MOD 20100817 1004091 IMZ SHIBUTANI START */
/*
          INSERT INTO QPAO_KOJOW VALUES (
             TO_NUMBER(NVL(v_SEISANCD,'0'))   --ページ ※変更前 精算店コード    -- 10/12 UPD
            ,NULL                         --行
            ,SUBSTR(v_MEI,1,3)            --精算店コード    -- 10/12 UPD
            ,NVL(v_SEISANNM,' ')          --精算店名
            ,NVL(v_SYAINCD1,' ')          --社員コード１
            ,NVL(v_SYAINCD2,' ')          --社員コード２
            ,'0'                          --控除区分
            ,NVL(v_SYUBETU,' ')           --ローン種別
            ,NVL(v_TOZAIKBN,' ')          --東西区分
            ,SUBSTR(v_MEI,4,3)            --店コード        -- 10/12 UPD
            ,NVL(v_MISENM,' ')            --店名
            ,NVL(v_BUMONNM,' ')           --部門名
            ,NVL(v_SIMEIKANJI,' ')        --氏名
            ,v_YUSIYMD                    --融資日
            ,v_KINGAKU                    --金額
            ,v_GANKIN                     --元金
            ,NVL(v_RISOKU,0)              --利息
            ,v_ZANDAKA                    --残高
            ,TO_DATE(v_SYORIYMD,'YYYYMMDD') --処理日
            ,NVL(v_BUMONCD,' ')           --部門コード
            ,InStrUserID
            ,InStrComputerNM
            );
*/
		INSERT INTO QPAO_KOJOW
		(
			 QPAO_PAGEKBN
			,QPAO_GYOUKBN
			,QPAO_SEISANCD
			,QPAO_SEISANNM
			,QPAO_SYAINCD1
			,QPAO_SYAINCD2
			,QPAO_KOJOKBN
			,QPAO_SYUBETU
			,QPAO_TOZAIKBN
			,QPAO_MISECD
			,QPAO_MISENM
			,QPAO_BUMONNM
			,QPAO_SINEIKANJI
			,QPAO_YUSIYMD
			,QPAO_KINGAKU
			,QPAO_GANKIN
			,QPAO_RISOKU
			,QPAO_ZANDAKA
			,QPAO_SYORIYMD
			,QPAO_BUMONCD
			,QPAO_USERID
			,QPAO_COMPUTERNM
		) VALUES (
			 TO_NUMBER(NVL(v_SEISANCD,'0'))
			,NULL
			,NVL(v_KAISYACD,' ')
			,NVL(v_KAISYANM,' ')
			,NVL(v_SYAINCD1,' ')
			,NVL(v_SYAINCD2,' ')
			,'0'
			,NVL(v_SYUBETU,' ')
			,NVL(v_TOZAIKBN,' ')
			,NVL(v_MISECD,' ')
			,NVL(v_MISENM,' ')
			,NVL(v_BUMONNM,' ')
			,NVL(v_SIMEIKANJI,' ')
			,v_YUSIYMD
			,v_KINGAKU
			,v_GANKIN
			,NVL(v_RISOKU,0)
			,v_ZANDAKA
			,TO_DATE(v_SYORIYMD,'YYYYMMDD')
			,NVL(v_BUMONCD,' ')
			,InStrUserID
			,InStrComputerNM
		);
/* MOD 20100817 1004091 IMZ SHIBUTANI END */
      END IF;

    END LOOP;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt140KojoPrtSyouyo;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140SyoRisokuFnc   　 　                          */
/* 機能          ：控除連絡表_賞与利息計算 関数 (Return 利息)              　*/
/*****************************************************************************/
FUNCTION QPAP_CEnt140SyoRisokuFnc (
  InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --融資日
  InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --賞与返済総額
  InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --賞与返済額
  InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --賞与残高
  InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --契約利率
  InBONUSYMD1       IN  VARCHAR2,                                 --賞与支給日１
  InBONUSYMD2       IN  VARCHAR2,                                 --賞与支給日２
  InStrYMD          IN  VARCHAR2)                                 --賞与日付
RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE IS

  /* 処理固有の変数 */
  v_YUSIDD        CHAR(2);
  v_SYOYOMM       CHAR(2);
  v_BONUSMM1      CHAR(2);
  v_BONUSMM2      CHAR(2);
  v_Kikan         NUMBER;     --賞与返済期間
  v_Risoku        NUMBER;     --利息
  v_Nisuu         NUMBER;     --日数
  v_YMD_W1        CHAR(8);    --作業用 年月日
  v_YMD_W2        CHAR(8);    --作業用 年月日

  v_RIRITU       NUMBER;      -- 10/24 ADD

BEGIN

  v_RIRITU := TRUNC(InRIRITU / 36500 * 1000000) / 1000000;        -- 10/24 ADD

  v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
  v_BONUSMM1      := SUBSTR(InBONUSYMD1,5,2);
  v_BONUSMM2      := SUBSTR(InBONUSYMD2,5,2);
  --賞与返済期間
  v_Kikan := MONTHS_BETWEEN(TO_DATE(SUBSTR(InBONUSYMD2,1,6),'YYYYMM'),TO_DATE(SUBSTR(InBONUSYMD1,1,6),'YYYYMM'));

  v_Risoku := 0;
  /**********************************************/
  /* 融資日が 2000/03/01 を境に計算式を分ける   */
  /**********************************************/
  If TO_CHAR(InYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD Then
      /***************/
      /* 旧計算式    */
      /***************/
      If v_Kikan = 6 Then
          If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
          /*--If MySet!賞与残高 = MySet!賞与返済額総額 Then          '初回利息の判定 */

              If v_BONUSMM1 = v_SYOYOMM Then
              /*--If Month(CVDate(賞与支給年月日1)) = Month(処理対象日付) Then */

                  -- 元々の計算式
                  If SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD') + 1,'YYYYMMDD'),5,2) <> SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD'),'YYYYMMDD'),5,2) Then
                  /*--If Month(DateAdd("y", 1, CVDate(賞与支給年月日1))) <> Month(CVDate(賞与支給年月日1)) Then */
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;

                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                  Else
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;

                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                     v_Nisuu := v_Nisuu + (TO_NUMBER(SUBSTR(InBONUSYMD1,7,2)) - 1 - 30);
                  End If;
                  v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
                  /*--v_Risoku = Int(MySet!賞与返済額総額 * MySet!契約利率 * 日数_WORK / 2 / 18000) */
              Else
                  If SUBSTR(TO_CHAR(TO_Date(InBONUSYMD2,'YYYYMMDD') + 1,'YYYYMMDD'),5,2) <> SUBSTR(TO_CHAR(TO_Date(InBONUSYMD2,'YYYYMMDD'),'YYYYMMDD'),5,2) Then
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                  Else
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
                     v_YUSIDD := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                     v_Nisuu := v_Nisuu + (TO_NUMBER(SUBSTR(InBONUSYMD2,7,2)) - 1 - 30);
                  End If;
                  v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
              End If;
          Else
              v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU / 200);
              /*--v_Risoku = Int(MySet!賞与残高 * MySet!契約利率 / 200) */
          End If;


      Else
          If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
          /*--If MySet!賞与残高 = MySet!賞与返済額総額 Then          '初回利息の判定 */
              v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
              v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
              IF v_YUSIDD >= '11' THEN
                 v_Nisuu := v_Nisuu + 6;
              ELSE
                  v_Nisuu := v_Nisuu + 21;
              END IF;
              v_Nisuu := v_Nisuu + ((10) - 1 - 30);
              v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
              /*--v_Risoku = Int(MySet!賞与返済額総額 * MySet!契約利率 * 日数_WORK / 2 / 18000) */
          Else

              If v_BONUSMM1 = v_SYOYOMM Then
              /* --If Month(CVDate(賞与支給年月日1)) = Month(処理対象日付) Then */
                  v_YMD_W1 := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-12),'YYYYMMDD'),1,4) || SUBSTR(InBONUSYMD2,5,4);
                  v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
                  v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * MONTHS_BETWEEN(TO_DATE(SUBSTR(v_YMD_W2,1,6),'YYYYMM'), TO_DATE(SUBSTR(v_YMD_W1,1,6),'YYYYMM')) / 12 / 100);

              Else
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
                  v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
                  v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * MONTHS_BETWEEN(TO_DATE(SUBSTR(v_YMD_W1,1,6),'YYYYMM'), TO_DATE(SUBSTR(v_YMD_W2,1,6),'YYYYMM')) / 12 / 100);
              End If;
          End If;
      End If;
  Else
      /*******************/
      /* 新計算式        */
      /*******************/
      -- 初回の判定
      If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
      /*--If MySet!賞与残高 = MySet!賞与返済額総額 Then */

          -- 初回の場合、融資日（計算する時は－１日）から、今回の賞与日までの日数
          If v_BONUSMM1 = v_SYOYOMM Then
          /*--If Month(CVDate(賞与支給年月日1)) = Month(処理対象日付) Then */

              v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD1,7,2);
              v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
          Else
              v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD2,7,2);
              v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
          End If;

      Else
          -- ２回目以降の場合、前回の賞与日から、今回の賞与日までの日数
          If v_BONUSMM1 = v_SYOYOMM Then
          /*--If Month(CVDate(賞与支給年月日1)) = Month(処理対象日付) Then */

              -- 賞与支給月１が今回の賞与月の場合
              If TO_NUMBER(v_BONUSMM1) <  TO_NUMBER(v_BONUSMM2) Then
              /*--If Val(Month(CVDate(賞与支給年月日1))) < Val(Month(CVDate(賞与支給年月日2))) Then */

                  -- 前回の賞与日
                  v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD2,5,4);
              Else
                  -- 前回の賞与日
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
              End If;
              -- 今回の賞与日
              v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
          Else
              -- 賞与支給月２が今回の賞与月の場合
              If TO_NUMBER(v_BONUSMM2) <  TO_NUMBER(v_BONUSMM1) Then
              /*--If Val(Month(CVDate(賞与支給年月日2))) < Val(Month(CVDate(賞与支給年月日1))) Then */

                  -- 前回の賞与日
                  v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD1,5,4);
              Else
                  -- 前回の賞与日
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
              End If;
              -- 今回の賞与日
              v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
          End If;
          -- 日数計算
          v_Nisuu  :=  TO_DATE(v_YMD_W2,'YYYYMMDD') - TO_DATE(v_YMD_W1,'YYYYMMDD');
          /*--WORK_日数 = DateDiff("y", CVDate(WORK_DATE1), CVDate(WORK_DATE2)) */
      End If;
      /*******************/
      /* 賞与の利息計算  */
      /*******************/
      /*--v_Risoku = Int(MySet!賞与残高 * MySet!契約利率 * WORK_日数 / 36500) */
---      v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * v_Nisuu  / 36500);                     -- 10/24 UPD
      IF TO_CHAR(InYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                              -- 10/24 UPD
          v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * v_Nisuu  / 36500);                    -- 10/24 UPD
      ELSE                                                                                    -- 10/24 UPD
          v_Risoku := TRUNC(InSYOYOZANDAKA * v_RIRITU * v_Nisuu);                             -- 10/24 UPD
      END IF;                                                                                 -- 10/24 UPD
  End If;

  RETURN v_Risoku;

END QPAP_CEnt140SyoRisokuFnc;


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140MiKojoPrt                                 */
/* 機能          ：控除連絡表_賞与印刷ＷＯＲＫ作成                       　　*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt140MiKojoPrt (
  InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS

  /* 処理固有の変数 */

  /* バインド変数 */

BEGIN

    /****************************************/
    /* 未控除残高一覧表_印刷ＷＯＲＫＴに追加*/
    /****************************************/
    DELETE FROM QPAP_MIKOJOW
          WHERE QPAP_USERID     = InStrUserID
            AND QPAP_COMPUTERNM = InStrComputerNM;

  /* 証書分 */
/* MOD 20100816 1004091 IMZ SHIBUTANI START */
/*
  INSERT INTO QPAP_MIKOJOW (
     QPAP_MISECD
    ,QPAP_MISENM
    ,QPAP_BUMONCD
    ,QPAP_BUMONNM
    ,QPAP_SYAINCD1
    ,QPAP_SYAINCD2
    ,QPAP_SIMEIKANJI
    ,QPAP_SYUBETU
    ,QPAP_KYUYOZANDAKA
    ,QPAP_SYOYOZANDAKA
    ,QPAP_USERID
    ,QPAP_COMPUTERNM
    )
  SELECT
     QPAC_SYAINM.QPAC_MISECD
    ,QPAE_MISEM.QPAE_MISENM
    ,QPAC_SYAINM.QPAC_BUMONCD
    ,QPAF_BUMONM.QPAF_BUMONNM
    ,QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1
    ,QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2
    ,QPAC_SYAINM.QPAC_SIMEIKANJI
    ,'2'
    ,QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA
    ,QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA
    ,InStrUserID
    ,InStrComputerNM
  FROM
     QPA8_SYNDAICYOT
    ,QPAC_SYAINM
    ,QPAE_MISEM
    ,QPAF_BUMONM
  WHERE  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1 = QPAC_SYAINM.QPAC_PRMSYAINCD1
  AND  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2 = QPAC_SYAINM.QPAC_PRMSYAINCD2
  AND  QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD
  AND  QPAC_SYAINM.QPAC_MISECD = QPAF_BUMONM.QPAF_PRMMISECD
  AND  QPAC_SYAINM.QPAC_BUMONCD = QPAF_BUMONM.QPAF_PRMBUMONCD
  AND  QPA8_SYNDAICYOT.QPA8_KANSAIYMD IS NULL
  AND  QPAC_SYAINM.QPAC_TAISYOKUYMD IS NOT NULL
  AND  TO_CHAR(QPAC_SYAINM.QPAC_TAISYOKUYMD,'YYYYMM') <= SUBSTR(InStrYMD,1,6)  --追加
  AND (QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA <> 0
  OR   QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA <> 0);
*/
	INSERT INTO QPAP_MIKOJOW (
		 QPAP_MISECD
		,QPAP_MISENM
		,QPAP_BUMONCD
		,QPAP_BUMONNM
		,QPAP_SYAINCD1
		,QPAP_SYAINCD2
		,QPAP_SIMEIKANJI
		,QPAP_SYUBETU
		,QPAP_KYUYOZANDAKA
		,QPAP_SYOYOZANDAKA
		,QPAP_USERID
		,QPAP_COMPUTERNM
		,QPAP_KAISYACD
		,QPAP_KAISYANM
		,QPAP_TOZAIKBN
	)
	SELECT
		 QPAC_SYAINM.QPAC_MISECD
		,QPAE_MISEM.QPAE_MISENM
		,QPAC_SYAINM.QPAC_BUMONCD
		,QPAF_BUMONM.QPAF_BUMONNM
		,QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1
		,QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2
		,QPAC_SYAINM.QPAC_SIMEIKANJI
		,'2'
		,QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA
		,QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA
		,InStrUserID
		,InStrComputerNM
		,(
		CASE NVL(QRY_CHECK_TAKASHIMAYA.CNT, 0)
			WHEN 0 THEN	QPAC_MISECD
			ELSE		'000'
		END)	AS KAISYACD
		,(
		CASE NVL(QRY_CHECK_TAKASHIMAYA.CNT, 0)
			WHEN 0 THEN	QPAE_MISENM
			ELSE		'㈱髙島屋'
		END)	AS KAISYANM
		,(
		CASE QPAC_SYAINM.QPAC_TOZAIKBN
			WHEN '0' THEN
				CASE QPAE_MISEM.QPAE_TOZAIKBNE
					WHEN '1' THEN	'1'
					ELSE			'2'
				END
			ELSE		QPAC_SYAINM.QPAC_TOZAIKBN
		END)	AS TOZAIKBN
	FROM
		 QPA8_SYNDAICYOT
		,QPAC_SYAINM
		,QPAE_MISEM
		,QPAF_BUMONM
		,(
		SELECT
			 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD
			,COUNT(*)								AS CNT
		FROM
			QPAH_OTHERM
		WHERE
			QPAH_OTHERM.QPAH_PRMCODE LIKE 'TMISE%'
		GROUP BY
			LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))
		)	QRY_CHECK_TAKASHIMAYA
	WHERE
		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1	= QPAC_SYAINM.QPAC_PRMSYAINCD1
	AND	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2	= QPAC_SYAINM.QPAC_PRMSYAINCD2
	AND	QPAC_SYAINM.QPAC_MISECD				= QPAE_MISEM.QPAE_PRMMISECD
	AND	QPAC_SYAINM.QPAC_MISECD				= QPAF_BUMONM.QPAF_PRMMISECD
	AND	QPAC_SYAINM.QPAC_BUMONCD			= QPAF_BUMONM.QPAF_PRMBUMONCD
	AND	QPA8_SYNDAICYOT.QPA8_KANSAIYMD		IS NULL
	AND	QPAC_SYAINM.QPAC_TAISYOKUYMD		IS NOT NULL
	AND	TO_CHAR(QPAC_SYAINM.QPAC_TAISYOKUYMD,'YYYYMM')	<= SUBSTR(InStrYMD, 1, 6)
	AND	(
			QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA	<> 0
		OR	QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA	<> 0
		)
	AND	QPAC_SYAINM.QPAC_MISECD				= QRY_CHECK_TAKASHIMAYA.MISECD(+)
	;
/* MOD 20100816 1004091 IMZ SHIBUTANI END */

  /* 小口分 */
/* MOD 20100816 1004091 IMZ SHIBUTANI START */
/*
  INSERT INTO QPAP_MIKOJOW (
     QPAP_MISECD
    ,QPAP_MISENM
    ,QPAP_BUMONCD
    ,QPAP_BUMONNM
    ,QPAP_SYAINCD1
    ,QPAP_SYAINCD2
    ,QPAP_SIMEIKANJI
    ,QPAP_SYUBETU
    ,QPAP_KYUYOZANDAKA
    ,QPAP_SYOYOZANDAKA
    ,QPAP_USERID
    ,QPAP_COMPUTERNM
    )
  SELECT
     QPAC_SYAINM.QPAC_MISECD
    ,QPAE_MISEM.QPAE_MISENM
    ,QPAC_SYAINM.QPAC_BUMONCD
    ,QPAF_BUMONM.QPAF_BUMONNM
    ,QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1
    ,QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2
    ,QPAC_SYAINM.QPAC_SIMEIKANJI
    ,'1'
    ,QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA
    ,QPA1_KGCDAICYOT.QPA1_SYOYOZANDAKA
    ,InStrUserID
    ,InStrComputerNM
  FROM
     QPA1_KGCDAICYOT
    ,QPAC_SYAINM
    ,QPAE_MISEM
    ,QPAF_BUMONM
  WHERE  QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1 = QPAC_SYAINM.QPAC_PRMSYAINCD1
  AND  QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2 = QPAC_SYAINM.QPAC_PRMSYAINCD2
  AND  QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD
  AND  QPAC_SYAINM.QPAC_MISECD = QPAF_BUMONM.QPAF_PRMMISECD
  AND  QPAC_SYAINM.QPAC_BUMONCD = QPAF_BUMONM.QPAF_PRMBUMONCD
  AND  QPAC_SYAINM.QPAC_TAISYOKUYMD IS NOT NULL
  AND  TO_CHAR(QPAC_SYAINM.QPAC_TAISYOKUYMD,'YYYYMM') <= SUBSTR(InStrYMD,1,6)  --追加
  AND (QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA <> 0
  OR   QPA1_KGCDAICYOT.QPA1_SYOYOZANDAKA <> 0);
*/
	INSERT INTO QPAP_MIKOJOW (
		 QPAP_MISECD
		,QPAP_MISENM
		,QPAP_BUMONCD
		,QPAP_BUMONNM
		,QPAP_SYAINCD1
		,QPAP_SYAINCD2
		,QPAP_SIMEIKANJI
		,QPAP_SYUBETU
		,QPAP_KYUYOZANDAKA
		,QPAP_SYOYOZANDAKA
		,QPAP_USERID
		,QPAP_COMPUTERNM
		,QPAP_KAISYACD
		,QPAP_KAISYANM
		,QPAP_TOZAIKBN
	)
	SELECT
		 QPAC_SYAINM.QPAC_MISECD
		,QPAE_MISEM.QPAE_MISENM
		,QPAC_SYAINM.QPAC_BUMONCD
		,QPAF_BUMONM.QPAF_BUMONNM
		,QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1
		,QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2
		,QPAC_SYAINM.QPAC_SIMEIKANJI
		,'1'
		,QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA
		,QPA1_KGCDAICYOT.QPA1_SYOYOZANDAKA
		,InStrUserID
		,InStrComputerNM
		,(
		CASE NVL(QRY_CHECK_TAKASHIMAYA.CNT, 0)
			WHEN 0 THEN	QPAC_MISECD
			ELSE		'000'
		END)	AS KAISYACD
		,(
		CASE NVL(QRY_CHECK_TAKASHIMAYA.CNT, 0)
			WHEN 0 THEN	QPAE_MISENM
			ELSE		'㈱髙島屋'
		END)	AS KAISYANM
		,(
		CASE QPAC_SYAINM.QPAC_TOZAIKBN
			WHEN '0' THEN
				CASE QPAE_MISEM.QPAE_TOZAIKBNE
					WHEN '1' THEN	'1'
					ELSE			'2'
				END
			ELSE		QPAC_SYAINM.QPAC_TOZAIKBN
		END)	AS TOZAIKBN
	FROM
		 QPA1_KGCDAICYOT
		,QPAC_SYAINM
		,QPAE_MISEM
		,QPAF_BUMONM
		,(
		SELECT
			 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD
			,COUNT(*)								AS CNT
		FROM
			QPAH_OTHERM
		WHERE
			QPAH_OTHERM.QPAH_PRMCODE LIKE 'TMISE%'
		GROUP BY
			LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))
		)	QRY_CHECK_TAKASHIMAYA
	WHERE
		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1	= QPAC_SYAINM.QPAC_PRMSYAINCD1
	AND	QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2	= QPAC_SYAINM.QPAC_PRMSYAINCD2
	AND	QPAC_SYAINM.QPAC_MISECD				= QPAE_MISEM.QPAE_PRMMISECD
	AND	QPAC_SYAINM.QPAC_MISECD				= QPAF_BUMONM.QPAF_PRMMISECD
	AND	QPAC_SYAINM.QPAC_BUMONCD			= QPAF_BUMONM.QPAF_PRMBUMONCD
	AND	QPAC_SYAINM.QPAC_TAISYOKUYMD		IS NOT NULL
	AND	TO_CHAR(QPAC_SYAINM.QPAC_TAISYOKUYMD,'YYYYMM')	<= SUBSTR(InStrYMD, 1, 6)
	AND	(
			QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA	<> 0
		OR	QPA1_KGCDAICYOT.QPA1_SYOYOZANDAKA	<> 0
		)
	AND	QPAC_SYAINM.QPAC_MISECD				= QRY_CHECK_TAKASHIMAYA.MISECD(+)
	;
/* MOD 20100816 1004091 IMZ SHIBUTANI END */

    /* コミット */
    COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt140MiKojoPrt;

/****************************************************************************************/
/* モジュール名  ：QPAP_CEnt140GetRiritu                                                */
/* 機能          ：小口融資利率取得                                                     */
/****************************************************************************************/
FUNCTION QPAP_CEnt140GetRiritu(
   InStrYMD   IN  CHAR) RETURN NUMBER IS

  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy         INTEGER;
  v_Riritu        NUMBER := 0;
  v_HenkoRiritu   QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

BEGIN
  /* 小口融資利率テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA7_RIRITU,0)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE QPA7_PRMHENKOYMD = (SELECT MAX(QPA7_PRMHENKOYMD)';
  StrSQL := StrSQL ||                             ' FROM  QPA7_KGCRIRITUT';
  StrSQL := StrSQL ||                            ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') <= :YMD)';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoRiritu);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoRiritu);
    v_Riritu := v_HenkoRiritu;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 返却値に当てはめる */
  RETURN v_Riritu;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt140GetRiritu;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名

BEGIN
    DELETE FROM QPAS_KGCW
          WHERE QPAS_USERID     = InStrUserID
            AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAU_KojoZanW
          WHERE QPAU_USERID     = InStrUserID
            AND QPAU_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAV_KojoKoguW
          WHERE QPAV_USERID     = InStrUserID
            AND QPAV_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAW_KojoRisoW
          WHERE QPAW_USERID     = InStrUserID
            AND QPAW_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAO_KOJOW
          WHERE QPAO_USERID     = InStrUserID
            AND QPAO_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAP_MIKOJOW
          WHERE QPAP_USERID     = InStrUserID
            AND QPAP_COMPUTERNM = InStrComputerNM;
    /*2003.03.25 追加*/
    DELETE FROM QPAM_SYNKEISANW
          WHERE QPAM_USERID     = InStrUserID
            AND QPAM_COMPUTERNM = InStrComputerNM;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt140DelWorkTbl;

/* 2001/10/23 ADD  START ******************************************************/

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140KojoTKousin                                   */
/* 更新 2003.03.25-1 データ作成は従来のままの集計で行う為、既存ロジックを    */
/*                   独立で使用する。                                        */
/*                                                                           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt140KojoTKousin (
  InStrSyoriYM        IN  VARCHAR2,                     --処理年月
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2) IS                      --コンピュータ名

  /* 処理固有の変数 */
  StrSyoriKbn     CHAR := '4';                          -- 賞与処理区分
  StrSIGN         CHAR(1);                              --サイン
  RowKojow        CurKojow%ROWTYPE;                     --控除ワーク　カーソル
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;

  StrKyuyoYMD     VARCHAR2(8);            --給与日付
  StrSyoyoYMD     VARCHAR2(8);            --賞与日付
  StrWorkYMD      VARCHAR2(8);            --前月

BEGIN

  /*■ ステップ０ ■*/
  /* 前準備 */
  StrKyuyoYMD :=    InStrSyoriYM || '25';                                                            --給与日付
  StrSyoyoYMD :=    TO_CHAR(ADD_MONTHS(TO_DATE(InStrSyoriYM || '01','YYYYMMDD'),1) - 1,'YYYYMMDD');  --賞与日付
  gbl_SyousyoYMD := TO_CHAR(TO_DATE(SUBSTR(StrKyuyoYMD,1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');     --証書抽出日付

  StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
  gbl_ZenRiritu  := QPAP_CEnt140GetRiritu(StrWorkYMD);     --前月利率
  gbl_ZenRiritu2 := TRUNC(gbl_ZenRiritu / 36500 * 1000000) / 1000000;           -- 10/24 ADD

  StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-2) + 1,'YYYYMMDD');
  gbl_ZenZenRiritu := QPAP_CEnt140GetRiritu(StrWorkYMD);  --前々月利率
  gbl_ZenZenRiritu2 := TRUNC(gbl_ZenZenRiritu / 36500 * 1000000) / 1000000;     -- 10/24 ADD

  /*■ 控除連絡表　賞与処理 ■*/
  /*賞与■ ステップ　　１ ■*/
--mod TR0506-023 imz.Yoshida ==>
--  /* 控除連絡表_賞与利息ＷＯＲＫ作成 */
--  QPAP_CEnt140SyouyoRisoku(InStrUserID,
--                           InStrComputerNM,
--                           StrSyoyoYMD);
--
--  /*賞与■ ステップ　　２ ■*/
--  /* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
--  QPAP_CEnt140KojoPrtSyouyo2(InStrUserID,
--                            InStrComputerNM,
--                            StrSyoyoYMD);
	/* 控除連絡表_賞与利息ＷＯＲＫ作成 */
	QPAP_Cent1401PkG.QPAP_CEnt1401SyouyoRisoku(
		InStrUserID,
		InStrComputerNM,
		StrSyoyoYMD,
		gbl_SyousyoYMD
		);
	/*賞与■ ステップ  ２ ■*/
	/* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
	QPAP_Cent1401PkG.QPAP_CEnt1401KojoPrtSyouyo2(
		InStrUserID,
		InStrComputerNM,
		StrSyoyoYMD
		);
--mod TR0506-023 imz.Yoshida <==
  /* 最新賞与控除年月の取得 */
  BEGIN
      SELECT  NVL(QSA2_MEI,'000000')
        INTO  v_MEI
        FROM  QSA2_SCODET
       WHERE  QSA2_PRMCODEKBN  = 'DP3'
       AND  QSA2_PRMCODENO   = '0000';
  EXCEPTION
      WHEN NO_DATA_FOUND THEN
          v_MEI := '000000';
      WHEN OTHERS THEN
          RAISE;
  END;

  /* 最新賞与控除年月以降のときのみ、控除テーブルに書き込む */
  IF  TO_NUMBER(InStrSyoriYM)  >  TO_NUMBER(v_MEI) THEN

      /* 控除ワークカーソルオープン */
      OPEN CurKojow(InStrUserID,InStrComputerNM);
      LOOP
          FETCH CurKojow INTO RowKojow;
          IF  CurKojow%NOTFOUND THEN
              EXIT;                                     --ループ終了
          END IF;

          /* 控除テーブルに書込み */
          INSERT INTO QPAA_KOJOT VALUES (
              RowKojow.SYORIYMD                         --控除日
             ,NVL(RowKojow.SYAINCD1,' ')                --社員コード１
             ,NVL(RowKojow.SYAINCD2,' ')                --社員コード２
             ,NVL(RowKojow.SYUBETU,' ')                 --ローン種別
             ,NVL(RowKojow.TOZAIKBN,' ')                --東西区分
             ,TO_DATE(RowKojow.YUSIYMD,'YYYYMMDD')      --融資日
             ,StrSyoriKbn                               --融資区分
             ,NVL(RowKojow.KINGAKU ,   '0')             --金額
             ,NVL(RowKojow.GANKIN  ,   '0')             --元金
             ,NVL(RowKojow.RISOKU  ,   '0')             --利息
             ,NVL(RowKojow.ZANDAKA ,   '0')             --残高
          );

          /* ローン種別が「小口」の場合 */
          IF RowKojow.SYUBETU = '1' THEN

              /* 小口融資賞与控除履歴テーブルに書込む */
              INSERT INTO QPA4_KGCKOJOT VALUES (
                  NVL(RowKojow.SYAINCD1,' ')            --社員コード１
                 ,NVL(RowKojow.SYAINCD2,' ')            --社員コード２
                 ,RowKojow.SYORIYMD                     --控除日
                 ,NVL(RowKojow.GANKIN  ,'0')            --控除金額
                 ,SYSDATE
              );

              IF RowKojow.GANKIN IS NOT NULL THEN
                  IF RowKojow.GANKIN < 0 THEN
                      StrSIGN := '*';
                  ELSE
                      StrSIGN := ' ';
                  END IF;
              ELSE
                  StrSIGN := ' ';
              END IF;

              /* 残高テーブルに書込む */
              INSERT INTO QPA0_ZandakaT VALUES (
                  '10'                     		        --C/C
                 ,NVL(RowKojow.SYAINCD2,' ')            --社員コード
                 ,NVL(RowKojow.GANKIN  ,'0')            --元金
                 ,NVL(StrSIGN  ,   ' ')                 --サイン
                 ,'               '                     --エラーｺﾒﾝﾄ
                 ,'                  '                  --余白
              );
            END IF;

      END LOOP;

      CLOSE CurKojow;

      /* 最新賞与控除年月に更新する */
      UPDATE  QSA2_SCODET  SET
              QSA2_MEI  =  InStrSyoriYM
      WHERE   QSA2_PRMCODEKBN  = 'DP3'
      AND     QSA2_PRMCODENO   = '0000';

      /* コミット */
      COMMIT;
  END IF;

EXCEPTION
  WHEN  OTHERS  THEN
    IF CurKojow%ISOPEN = TRUE THEN
      CLOSE CurKojow;
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE;
END QPAP_CEnt140KojoTKousin;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt140Lock                                                                               */
/* 機能          ：控除連絡表のロック                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt140Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* 識別コード	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* プログラムＩＤ */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* コンピュータ名 */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* オペレータＩＤ */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* 確認 */
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
	WHEN W_HAITADUPLICATE THEN	--控除連絡表作業中
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt140Lock DUPLICATE KEY');
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt140Lock;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt140UnLock                                                                             */
/* 機能          ：控除連絡表のロック解除                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt140UnLock(
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

END QPAP_CEnt140UnLock;

/* 2001/10/23 ADD  END ********************************************************/

/* 2001/11/02 ADD  START ******************************************************/
/******************************************************************************/
/* モジュール名  ：QPAP_CEnt140GetYM                                          */
/* 機能          ：最新賞与控除年月の取得                                     */
/******************************************************************************/
PROCEDURE QPAP_CEnt140GetYM (
    OtMei    OUT    VARCHAR2)    IS                      --名称

BEGIN

    /* 出力パラメータのクリア */
    OtMei := ' ';

    /* 最新賞与控除年月の取得 */
    SELECT    NVL(QSA2_MEI,' ')
      INTO    OtMei
      FROM    QSA2_SCODET
     WHERE    QSA2_PRMCODEKBN  = 'DP3'
       AND    QSA2_PRMCODENO   = '0000';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN;                           --処理終了
END QPAP_CEnt140GetYM;
/* 2001/11/02 ADD  END ********************************************************/

/***************************************************************************************/
/* モジュール名  ：QPAP_CEnt140SyouyoRisoku2                                           */
/* 機能          ：控除連絡表_賞与利息ＷＯＲＫ作成 [夏季賞与日が２６日～末日の集計対応]*/
/***************************************************************************************/
PROCEDURE QPAP_CEnt140SyouyoRisoku2 (
  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
  InStrYMD        IN  VARCHAR2) IS                      --賞与日付

  /* 処理固有の変数 */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_Dummy         INTEGER;

  v_SelectFlg     INTEGER;

  v_Risoku        NUMBER;     --利息
  v_ZenYMD        CHAR(8);    --前月

  v_BONUSYMD18    CHAR(8);
  v_BONUSYMD28    CHAR(8);
  v_BONUSYMD_W    CHAR(8);
  v_BONUSMM1      CHAR(2);
  v_BONUSMM2      CHAR(2);
  v_SYOYOMM       CHAR(2);

  v_SIMEIKANJI      QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MISECD          QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_TOZAIKBN        QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_BUMONCD         QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_TAISYOKUYMD     QPAC_SYAINM.QPAC_TAISYOKUYMD%TYPE;
  v_KYUSYOSTYMD     QPAC_SYAINM.QPAC_KYUSYOSTYMD%TYPE;
  v_KYUSYOEDYMD     QPAC_SYAINM.QPAC_KYUSYOEDYMD%TYPE;

  v_BONUSYMD1       QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_SEISANCD        QPAE_MISEM.QPAE_SEISANCD%TYPE;
  v_MISENM          QPAE_MISEM.QPAE_MISENM%TYPE;

  V_ZANDAKA         QPAA_KOJOT.QPAA_ZANDAKA%TYPE;     --控除テーブル 残高

  v_PRMSYAINCD1     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_PRMSYAINCD2     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_PRMYUSIYMD      QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
  v_GENDOGAKU       QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
  v_SYUBETU         QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
  v_RIRITU          QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_HENSAITUKISU    QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KYUYOZANDAKA    QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KOJOCYUSIFLG    QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
  v_KANSAIYMD       QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

  /* 2001/10/12 東西区分０ 不備対応 */
  v_TOZAIKBNE       QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;

  /* 2003.03.25 夏季賞与日が２６日～末日の集計修正*/
  V_DATAFROM        CHAR(8);							--
  V_DATATO          CHAR(8);							--
  V_KOJOYMD         CHAR(4);							--
  V_ZANDAKA_NEW     NUMBER;								--

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
  v_FROMDATE       CHAR(8);
  v_TODATE         CHAR(8);
  InStrYMD_2       CHAR(8);
/* Yasui@NBC 2005.05.06 控除作成不備 <== */
  v_YMD            CHAR(8);                            -- add TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正

  /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
  v_StrYMDHMS       VARCHAR2(14);
  v_MEI             QSA2_SCODET.QSA2_MEI%TYPE;
  v_KojocyushiFLG   CHAR(1);
  /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

BEGIN

    /****************************************/
    /* 控除連絡表_利息ＷＯＲＫＴに追加      */
    /****************************************/
    DELETE FROM QPAW_KojoRisoW
          WHERE QPAW_USERID     = InStrUserID
            AND QPAW_COMPUTERNM = InStrComputerNM;

    /* 前月日付 */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

	/* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 最新控除年月の取得 */
    SELECT    NVL(QSA2_MEI,'000000')
      INTO    v_MEI
      FROM    QSA2_SCODET
     WHERE    QSA2_PRMCODEKBN  = 'DP3'
       AND    QSA2_PRMCODENO   = '0000';

	/* 控除中止テーブル抽出条件の日時を取得 */
	IF SUBSTR(InStrYMD,1,6) = RTRIM(v_MEI) THEN
		/* 処理年月と最新賞与控除年月が同じ場合、小口融資控除履歴テーブルから */
		/* 抽出条件の日時を取得                                               */
		SELECT TO_CHAR(MIN(QPA4_TOROKUYMD),'YYYYMMDDHH24MISS')
		INTO   v_StrYMDHMS
		FROM   QPA4_KGCKOJOT
		WHERE  TO_CHAR(QPA4_TOROKUYMD,'YYYYMMDD') = (
			   SELECT TO_CHAR(MAX(QPA4_TOROKUYMD),'YYYYMMDD')
			   FROM QPA4_KGCKOJOT);
	ELSE
		/* 処理年月と最新賞与控除年月が違う場合、オペレーション日時から       */
		/* 抽出条件の日時を取得                                               */
		SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') INTO v_StrYMDHMS FROM DUAL;
	END IF;
	/* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
    v_FROMDATE := SUBSTR(v_ZenYMD, 1, 6) || '26';	-- 処理年月の前月26日
    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';  -- 処理年月の当月25日
/* Yasui@NBC 2005.05.06 控除作成不備 <== */

    /*■小口■　小口融資台帳テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' A.QPA1_PRMSYAINCD1,';
    StrSQL := StrSQL || ' A.QPA1_PRMSYAINCD2,';
    StrSQL := StrSQL || ' A.QPA1_KEIYAKUYMD,';
    StrSQL := StrSQL || ' A.QPA1_GENDOGAKU,';
    StrSQL := StrSQL || ' A.QPA1_KYUYOHENSAI,';
    StrSQL := StrSQL || ' A.QPA1_SYOYOHENSAI,';
    StrSQL := StrSQL || ' A.QPA1_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' A.QPA1_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' B.QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' B.QPAC_MISECD,';
    StrSQL := StrSQL || ' B.QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' B.QPAC_BUMONCD,';
    StrSQL := StrSQL || ' B.QPAC_TAISYOKUYMD,';
    StrSQL := StrSQL || ' B.QPAC_KYUSYOSTYMD,';
    StrSQL := StrSQL || ' B.QPAC_KYUSYOEDYMD,';
    StrSQL := StrSQL || ' C.QPAE_BONUSYMD1,';
    StrSQL := StrSQL || ' C.QPAE_BONUSYMD2,';
    StrSQL := StrSQL || ' C.QPAE_SEISANCD,';
    StrSQL := StrSQL || ' C.QPAE_MISENM,';        --10/12 UPD
    StrSQL := StrSQL || ' C.QPAE_TOZAIKBNE ';     --10/12 ADD
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT A,';
    StrSQL := StrSQL || '      QPAC_SYAINM B,';
    StrSQL := StrSQL || '      QPAE_MISEM C';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
--    StrSQL := StrSQL || ' WHERE (A.QPA1_KOJOCYUSHIFLG IS NULL OR A.QPA1_KOJOCYUSHIFLG = '' '')';
--    StrSQL := StrSQL || '   AND B.QPAC_PRMSYAINCD1 = A.QPA1_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' WHERE B.QPAC_PRMSYAINCD1 = A.QPA1_PRMSYAINCD1 ';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    StrSQL := StrSQL || '   AND B.QPAC_PRMSYAINCD2 = A.QPA1_PRMSYAINCD2 ';
    StrSQL := StrSQL || '   AND B.QPAC_MISECD      = C.QPAE_PRMMISECD(+)';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_KEIYAKUYMD     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SIMEIKANJI,  20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_MISECD,       3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_TOZAIKBN,     1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_BUMONCD,      6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_TAISYOKUYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUSYOSTYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_KYUSYOEDYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_BONUSYMD1,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BONUSYMD2,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD,     3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISENM,      24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_TOZAIKBNE,    1);  --10/12 ADD

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_KEIYAKUYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAI  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SYOYOHENSAI  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOZANDAKA );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOZANDAKA );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SIMEIKANJI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_MISECD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_TOZAIKBN     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_BUMONCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_TAISYOKUYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUSYOSTYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_KYUSYOEDYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_BONUSYMD1    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BONUSYMD2    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISENM       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_TOZAIKBNE    );  --10/12 ADD

--2002/03/07 小口返済額テーブルより返済額を取得（小口返済台帳の返済額は使用しない）

	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止判定処理 */
	v_KojocyushiFLG  :=  QPAP_Cent1401PkG.QPAP_CEnt1401KojocyushiChek(
									v_PRMSYAINCD1,
									v_PRMSYAINCD2,
									v_StrYMDHMS
									);

		IF v_KojocyushiFLG = '2' THEN

		/* add TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		      /* 賞与支給年月日の再編集 */
		      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
		      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
		      v_BONUSYMD18 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
		      v_BONUSYMD28 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
		      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
		         v_BONUSYMD_W   := v_BONUSYMD18;
		         v_BONUSYMD18   := v_BONUSYMD28;
		         v_BONUSYMD28   := v_BONUSYMD_W;
		      END IF;
		      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
		      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
		      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);
		      /* 小口控除賞与返済日取得 */
		      IF v_BONUSMM1 = v_SYOYOMM OR v_BONUSMM2 = v_SYOYOMM THEN
		         v_YMD := InStrYMD;
		      ELSIF TO_NUMBER(v_BONUSMM1) = TO_NUMBER(v_SYOYOMM) - 1 OR TO_NUMBER(v_BONUSMM2) = TO_NUMBER(v_SYOYOMM) - 1 THEN
		         v_YMD := v_ZenYMD;
		      END IF;
		/* add TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */

		     /* 小口返済額情報取得 */
		      StrSQL := NULL;
		      StrSQL := StrSQL || 'SELECT';
		      StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
		      StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
		      StrSQL := StrSQL || ' FROM  QPA2_KGCHENSAIT';
		      StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
		      StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2  = :Code2';
		      StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM  <= :YM';
		      StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
		      /* 動的カーソルのオープン */
		      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
		      /* SQLの解析 */
		      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
		      /* 入力変数をバインドする */
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_PRMSYAINCD1);
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_PRMSYAINCD2);
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(InStrYMD,1,6));
		      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(v_YMD,1,6));
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */
		      /* 出力変数のバインド */
		      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KYUYOHENSAI);
		      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYOYOHENSAI);
		      /* SQLの実行 */
		      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
		      /* FETCH */
		       IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
		         /* カラム値を変数へ格納 */
		         DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KYUYOHENSAI);
		         DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYOYOHENSAI);
		      END IF;
		      /* カーソルのクローズ */
		      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

		--2002/03/07 ここまで

		      /* 2001/10/12 東西区分０ 不備対応 */
		      IF  v_TOZAIKBN = '0' THEN     --東西区分 不定
		          IF v_TOZAIKBNE = '1' THEN
		             v_TOZAIKBN := '1';
		          ELSE
		             v_TOZAIKBN := '2';
		          END IF;
		      END IF;

		      /* 控除テーブルより残高取得 */
		      v_SelectFlg := 1;
		      BEGIN
		        /*2003/03/25 修正ここから*/
		        SELECT SUBSTR(TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD'),5,4),NVL(QPAA_ZANDAKA,0) INTO   v_KOJOYMD,V_ZANDAKA
		                                   FROM   QPAA_KOJOT
		                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
		                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
		                                     AND  QPAA_SYUBETU  = '1'
		                                     AND  QPAA_YUSIKBN  = '3';
		--        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
		--                                   FROM   QPAA_KOJOT
		--                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
		--                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
		--                                     AND  QPAA_SYUBETU  = '1'
		--                                     AND  QPAA_YUSIKBN  = '3';
		        /*2003/03/25 修正ここまで*/

		      EXCEPTION
		           WHEN   NO_DATA_FOUND THEN
		                  v_SelectFlg := 0;
		           WHEN   OTHERS THEN
		                  RAISE;
		      END;

		/* del TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 処理移動 ==> */
		--      /* 賞与支給年月日の再編集 */
		--      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
		--      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
		--      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
		--         v_BONUSYMD_W   := v_BONUSYMD18;
		--         v_BONUSYMD18   := v_BONUSYMD28;
		--         v_BONUSYMD28   := v_BONUSYMD_W;
		--      END IF;

		--      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
		--      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
		--      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);
		/* del TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 処理移動 <== */

		     /********************************************************************************/
		     /* 夏季賞与が26日～末日で有る場合、賞与残高に給与控除が含ないとおかしいので     */
		     /* 夏季賞与月の給与控除データがなければ給与控除を算出し給与控除分を残高から引く */
		     /* 2003.03.25                                                                   */
		     /* 2003.05.07                                                                   */
		     /* 2004/10/05                                                                   */
		     /********************************************************************************/
		     /*賞与日の判定*/
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		--     v_DATAFROM	:=	SUBSTR(InStrYMD,1,6) || '26';												--給与日の次の日'YYYYMMDD'	20030426
		--     v_DATATO	:=	TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6)||'01'),1) -1,'YYYYMMDD');	--今月の最終日	'YYYYMMDD'	20030430
		    v_DATAFROM := SUBSTR(v_ZenYMD,1,6) || '26' ;                                               --給与日の次の日'YYYYMMDD'
		    v_DATATO   := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(v_ZenYMD, 1, 6) || '01', 'YYYYMMDD'), 1) -1, 'YYYYMMDD');	              --今月の最終日  'YYYYMMDD'
		    --利息用賞与日取得
		    IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_DATAFROM) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_DATATO))
		    OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_DATAFROM) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_DATATO)) THEN
		       --賞与日が「26日～末日」までは前月
		       InStrYMD_2 := v_ZenYMD;
		    ELSE
		       --賞与日が「1日～25日」までは処理月
		       InStrYMD_2 := InStrYMD;
		    END IF;
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */
		     IF TO_NUMBER(v_BONUSYMD1) >= TO_NUMBER(SUBSTR(v_DATAFROM,5,4)) AND TO_NUMBER(v_BONUSYMD1) <= TO_NUMBER(SUBSTR(v_DATATO,5,4)) THEN
		         /*
		             今回の修正対象
		             例：RT（東）RT（西）の夏季賞与日が６月３０日である為、適切な給与残高を算出して賞与控除データを計算する。
		             QPAA_KOJOTの最新ﾚｺｰﾄﾞが５月２５日残高 → ６月２５日残高を算出して賞与控除データ作成。
		                                    ６月２５日残高 → その残高で賞与控除データ作成。
		             <追記>2003/05/06
		             エーティーエーも同様。　04/30
		         */
		          IF v_SelectFlg = 1 THEN
		               /*QPAA_KOJOTにﾚｺｰﾄﾞが有る。*/
		               IF v_KOJOYMD = SUBSTR(v_BONUSYMD18,5,4) THEN
		                   /*控除連絡テーブルに賞与月の給与控除データが存在する       ←計算対象外*/
		                   NULL;
		               ELSE
		                   IF V_ZANDAKA > 0 THEN
		                       /*控除連絡テーブルに賞与月の給与控除データが存在しない ←計算対象*/
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		--                       V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD,1,6) || '25'),'1','',v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		                       V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD_2,1,6) || '25'),'1','',v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */
		                       V_ZANDAKA     := V_ZANDAKA_NEW;
		                   END IF;
		               END IF;
		          ELSIF v_SelectFlg = 0 THEN
		               /*賞与日が26日～末日の時はその月の残高に給与控除分を引く*/
		               IF v_KYUYOZANDAKA > 0 THEN
		                       /*控除連絡テーブルに給与控除データが存在しない         ←計算対象*/
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		--                       V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD,1,6) || '25'),'1','',v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		                       V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD_2,1,6) || '25'),'1','',v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */
		                       V_ZANDAKA     := V_ZANDAKA_NEW;
		                       v_SelectFlg := 1;
		               END IF;
		          ELSE
		               NULL;
		          END IF;
		     ELSE
		          NULL;
		     END IF;
		     /*	2003.03.25ここまで************************************************************/
		     /* ワーク　控除連絡表_利息Ｔに追加 */

		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 ==> */
		--      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
		      IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		      OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
		/* mod TR0506-023 imz.Yoshida 2006/02/22 控除作成不備 賞与日取得の修正 <== */

		          INSERT INTO QPAW_KojoRisoW VALUES (
		             NVL(v_PRMSYAINCD1,' ')   --個人コード１
		            ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
		            ,'1'                      --ローン種別
		            ,v_KEIYAKUYMD             --契約日
		            ,NULL                     --融資日
		            ,NVL(v_GENDOGAKU,0)       --融資額限度額
		            ,0                        --契約利率
		            ,0                        --返済月数
		            ,0                        --給与返済額総額
		            ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
		            ,0                        --賞与返済額総額
		            ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
		            ,NULL                     --完済日
		            ,DECODE(v_SelectFlg,1,V_ZANDAKA,NVL(v_KYUYOZANDAKA,0))    --給与残高
		            ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
		            ,0                        --利息
		            ,NVL(v_TOZAIKBN,' ')      --東西区分
		            ,NVL(v_SEISANCD,' ')      --精算店コード
		            ,NVL(v_MISECD,' ')        --所属店コード
		            ,NVL(v_BUMONCD,' ')       --所属部門コード
		            ,NVL(v_MISENM,' ')        --店名称
		            ,NVL(v_SIMEIKANJI,' ')    --個人名漢字
		            ,v_TAISYOKUYMD            --退職年月日
		            ,v_KYUSYOSTYMD            --休職年月日
		            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --賞与支給月１
		            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --賞与支給月２
		            ,InStrUserID
		            ,InStrComputerNM

			            );
		      END IF;
		END IF;
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

    /*■証書■　社員融資台帳テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
    StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA8_RIRITU,';
    StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
    StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAC_MISECD,';
    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAC_BUMONCD,';
    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOSTYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOEDYMD,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';
    StrSQL := StrSQL || ' QPAE_SEISANCD,';
    StrSQL := StrSQL || ' QPAE_MISENM,';        --10/12 UPD
    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';     --10/12 ADD
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT,';
    StrSQL := StrSQL || '      QPAC_SYAINM,';
    StrSQL := StrSQL || '      QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPA8_SYOYOZANDAKA <> 0';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
--    StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
	StrSQL := StrSQL || '   AND (QPA8_KANSAIYMD IS NULL';
	StrSQL := StrSQL || '   OR  QPA8_KANSAIYMD >= TO_DATE(:SyoriYM,''YYYYMM''))';
    /* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA8_PRMSYAINCD1 ';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA8_PRMSYAINCD2 ';
    StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyoriYM', SUBSTR(InStrYMD,1,6));
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1, 1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2, 7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_PRMYUSIYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_RIRITU        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_HENSAITUKISU  );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KYUYOHENSAI   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SYOYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_SIMEIKANJI,  20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_MISECD,       3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_TOZAIKBN,     1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BUMONCD,      6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_TAISYOKUYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_KYUSYOSTYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_KYUSYOEDYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_BONUSYMD1,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_BONUSYMD2,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_SEISANCD,     3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_MISENM,      24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_TOZAIKBNE,    1);  --10/12 ADD

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_PRMYUSIYMD    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_RIRITU        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_HENSAITUKISU  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOHENSAIALL);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SYOYOHENSAIALL);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_KANSAIYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_SIMEIKANJI    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_MISECD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_TOZAIKBN      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BUMONCD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_TAISYOKUYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_KYUSYOSTYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_KYUSYOEDYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_BONUSYMD1     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_BONUSYMD2     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_SEISANCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_MISENM        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_TOZAIKBNE     );  --10/12 ADD

	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止判定処理 */
	v_KojocyushiFLG  :=  QPAP_Cent1401PkG.QPAP_CEnt1401KojocyushiChek(
									v_PRMSYAINCD1,
									v_PRMSYAINCD2,
									v_StrYMDHMS
									);

		IF v_KojocyushiFLG = '2' THEN

		      /* 2001/10/12 東西区分０ 不備対応 */
		      IF  v_TOZAIKBN = '0' THEN     --東西区分 不定
		          IF v_TOZAIKBNE = '1' THEN
		             v_TOZAIKBN := '1';
		          ELSE
		             v_TOZAIKBN := '2';
		          END IF;
		      END IF;

		      /* 控除テーブルより残高取得 */
		      v_SelectFlg := 1;
		      BEGIN
		        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
		                                   FROM   QPAA_KOJOT
		                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
		                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
		                                     AND  QPAA_YUSIYMD  = v_PRMYUSIYMD
		                                     AND  QPAA_SYUBETU  = '2'
		                                     AND  QPAA_YUSIKBN  = '3';
		      EXCEPTION
		           WHEN   NO_DATA_FOUND THEN
		                  v_SelectFlg := 0;
		           WHEN   OTHERS THEN
		                  RAISE;
		      END;

		      /* 賞与支給年月日の再編集 */
		      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
		      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
		/* Yasui@NBC 2005.05.06 控除作成不備 賞与日取得の修正 ==> */
		      v_BONUSYMD18 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
		      v_BONUSYMD28 := QPAP_CEnt140GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
		/* Yasui@NBC 2005.05.06 控除作成不備 <== */
		      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
		         v_BONUSYMD_W   := v_BONUSYMD18;
		         v_BONUSYMD18   := v_BONUSYMD28;
		         v_BONUSYMD28   := v_BONUSYMD_W;
		      END IF;

		      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
		      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
		      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);

		     /********************************************************************************/
		     /* 夏季賞与が26日～末日で有る場合、賞与残高に給与控除が含ないとおかしいので     */
		     /* 夏季賞与月の給与控除データがなければ給与控除を算出し給与控除分を残高から引く */
		     /* 2003.05.07                                                                   */
		     /* 2004/10/05                                                                   */
		     /********************************************************************************/
		     /*賞与日の判定*/
		/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 ==> */
		--     v_DATAFROM	:=	SUBSTR(InStrYMD,1,6) || '26';												--給与日の次の日'YYYYMMDD'	20030426
		--     v_DATATO	:=	TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6)||'01'),1) -1,'YYYYMMDD');	--今月の最終日	'YYYYMMDD'	20030430
		    v_DATAFROM := SUBSTR(v_ZenYMD,1,6) || '26' ;                                               --給与日の次の日'YYYYMMDD'
		    v_DATATO	:= TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(v_ZenYMD, 1, 6) || '01', 'YYYYMMDD'), 1) -1, 'YYYYMMDD');	              --今月の最終日  'YYYYMMDD'
		    --利息用賞与日取得
		    IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_DATAFROM) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_DATATO))
		    OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_DATAFROM) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_DATATO)) THEN
		       --賞与日が「26日～末日」までは前月
		       InStrYMD_2 := v_ZenYMD;
		    ELSE
		       --賞与日が「1日～25日」までは処理月
		       InStrYMD_2 := InStrYMD;
		    END IF;
		/* Yasui@NBC 2005.05.06 控除作成不備 <== */

		    IF TO_NUMBER(v_BONUSYMD1) >= TO_NUMBER(SUBSTR(v_DATAFROM,5,4)) AND TO_NUMBER(v_BONUSYMD1) <= TO_NUMBER(SUBSTR(v_DATATO,5,4)) THEN
		--				0615						0626								0615							0630
		        /*
		            今回の修正対象
		            例：RT（東）RT（西）の夏季賞与日が６月３０日である為、適切な給与残高を算出して賞与控除データを計算する。
		            QPAA_KOJOTの最新ﾚｺｰﾄﾞが５月２５日残高 → ６月２５日残高を算出して賞与控除データ作成。
		                                   ６月２５日残高 → その残高で賞与控除データ作成。
		            <追記>2003/05/06
		            エーティーエーも同様。　04/30
		        */
		         IF v_SelectFlg = 1 THEN
		              /*QPAA_KOJOTにﾚｺｰﾄﾞが有る。*/
		              IF v_KOJOYMD = SUBSTR(v_BONUSYMD18,5,4) THEN
		                  /*控除連絡テーブルに賞与月の給与控除データが存在する       ←計算対象外*/
		                  NULL;
		              ELSE
		                  IF V_ZANDAKA > 0 THEN
		                      /*控除連絡テーブルに賞与月の給与控除データが存在しない ←計算対象*/

		/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 ==> */
		--                      V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD,1,6) || '25'),'2',TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		                      V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD_2,1,6) || '25'),'2',TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		/* Yasui@NBC 2005.05.06 控除作成不備 <== */
		                      V_ZANDAKA     := V_ZANDAKA_NEW;
		                  END IF;
		              END IF;
		         ELSIF v_SelectFlg = 0 THEN
		              /*賞与日が26日～末日の時はその月の残高に給与控除分を引く*/
		              IF v_KYUYOZANDAKA > 0 THEN
		                      /*控除連絡テーブルに給与控除データが存在しない         ←計算対象*/
		/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 ==> */
		--                      V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD,1,6) || '25'),'2',TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		                      V_ZANDAKA_NEW := QPAP_CEnt140NEXTKYUYOZAN((SUBSTR(InStrYMD_2,1,6) || '25'),'2',TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),v_PRMSYAINCD1,v_PRMSYAINCD2,InStrUserID,InStrComputerNM);	--次月の給与残高を算出する。
		/* Yasui@NBC 2005.05.06 控除作成不備 <== */
		                      V_ZANDAKA     := V_ZANDAKA_NEW;
		                      v_SelectFlg := 1;
		              END IF;
		         ELSE
		              NULL;
		         END IF;
		   ELSE
		   	DBMS_OUTPUT.PUT_LINE(V_ZANDAKA);			--327738
			   DBMS_OUTPUT.PUT_LINE(v_SelectFlg);			--     1
			   DBMS_OUTPUT.PUT_LINE(v_SYOYOZANDAKA);		--229370
		      NULL;
		   END IF;
		     /*	2003.05.07ここまで************************************************************/

		      /* ワーク　控除連絡表_利息Ｔに追加 */
		/* Yasui@NBC 2005.05.06 控除作成不備 処理年月の前月26日～処理年月の25日内であればワーク作成 ==> */
		--      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
		   IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		   OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
		/* Yasui@NBC 2005.05.06 控除作成不備 <== */
		        /*   融資日 <= 証書抽出日付  */
		        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') <= gbl_SyousyoYMD  THEN
		          /* 利息計算 */
		/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 ==> */
		--          v_Risoku := QPAP_CEnt140SyoRisokuFnc(v_PRMYUSIYMD,        --融資日
		--                                               v_SYOYOHENSAIALL,    --賞与返済総額
		--                                               v_SYOYOHENSAI,       --賞与返済額
		--                                               v_SYOYOZANDAKA,      --賞与残高
		--                                               v_RIRITU,            --契約利率
		--                                               v_BONUSYMD18,        --賞与支給日１
		--                                               v_BONUSYMD28,        --賞与支給日２
		--                                               InStrYMD);           --賞与日付
		          v_Risoku := QPAP_CEnt140SyoRisokuFnc(v_PRMYUSIYMD,        --融資日
		                                               v_SYOYOHENSAIALL,    --賞与返済総額
		                                               v_SYOYOHENSAI,       --賞与返済額
		                                               v_SYOYOZANDAKA,      --賞与残高
		                                               v_RIRITU,            --契約利率
		                                               v_BONUSYMD18,        --賞与支給日１
		                                               v_BONUSYMD28,        --賞与支給日２
		                                               InStrYMD_2);         --賞与日付
		/* Yasui@NBC 2005.05.06 控除作成不備対応により処理月が翌月になってしまうのでされに対する修正 <== */
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--      v_SelectFlg := 0;
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug
		--debugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebugdebug

		          INSERT INTO QPAW_KojoRisoW VALUES (
		             NVL(v_PRMSYAINCD1,' ')   --個人コード１
		            ,NVL(v_PRMSYAINCD2,' ')   --個人コード２
		            ,'2'                      --ローン種別
		            ,NULL                     --契約日
		            ,v_PRMYUSIYMD             --融資日
		            ,NVL(v_GENDOGAKU,0)       --融資額限度額
		            ,NVL(v_RIRITU,0)          --契約利率
		            ,NVL(v_HENSAITUKISU,0)    --返済月数
		            ,NVL(v_KYUYOHENSAIALL,0)  --給与返済額総額
		            ,NVL(v_KYUYOHENSAI,0)     --給与返済額給与時
		            ,NVL(v_SYOYOHENSAIALL,0)  --賞与返済額総額
		            ,NVL(v_SYOYOHENSAI,0)     --賞与返済額賞与時
		            ,v_KANSAIYMD              --完済日
		            ,DECODE(v_SelectFlg,1,V_ZANDAKA - NVL(v_SYOYOZANDAKA,0),NVL(v_KYUYOZANDAKA,0))    --給与残高
		            ,NVL(v_SYOYOZANDAKA,0)    --賞与残高
		            ,v_Risoku                 --利息
		            ,NVL(v_TOZAIKBN,' ')      --東西区分
		            ,NVL(v_SEISANCD,' ')      --精算店コード
		            ,NVL(v_MISECD,' ')        --所属店コード
		            ,NVL(v_BUMONCD,' ')       --所属部門コード
		            ,NVL(v_MISENM,' ')        --店名称
		            ,NVL(v_SIMEIKANJI,' ')    --個人名漢字
		            ,v_TAISYOKUYMD            --退職年月日
		            ,v_KYUSYOSTYMD            --休職年月日
		            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --賞与支給月１
		            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --賞与支給月２
		            ,InStrUserID
		            ,InStrComputerNM
		            );
		        END IF;
		      END IF;
		END IF;
	/* MOD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* コミット */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ロールバック */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt140SyouyoRisoku2;

--del TR0506-023 imz.Yoshida ==>
--/*****************************************************************************/
--/* モジュール名  ：QPAP_CEnt140KojoPrtSyouyo                                 */
--/* 機能          ：控除連絡表_賞与印刷ＷＯＲＫ作成 [登録するテーブル変更版]  */
--/* 作成          ：2003.03.25                                                */
--/*****************************************************************************/
--PROCEDURE QPAP_CEnt140KojoPrtSyouyo2 (
--  InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
--  InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
--  InStrYMD        IN  VARCHAR2) IS                      --給与日付
--
--  /* 処理固有の変数 */
--  StrSQL          VARCHAR2(1000);
--  v_CursorID      NUMBER := 0;
--  v_Dummy         INTEGER;
--
--  v_OutPutFLG     INTEGER;      --出力フラグ
--  v_KINGAKU       NUMBER(7,0);  --金額
--  v_GANKIN        NUMBER(7,0);  --元金
--  v_ZANDAKA       NUMBER(7,0);  --残高
--
--  /* バインド変数 */
--  v_SYAINCD1        QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
--  v_SYAINCD2        QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
--  v_SYUBETU         QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
--  v_KEIYAKUYMD      QPAW_KojoRisoW.QPAW_KEIYAKUYMD%TYPE;
--  v_YUSIYMD         QPAW_KojoRisoW.QPAW_YUSIYMD%TYPE;
--  v_GENDOGAKU       QPAW_KojoRisoW.QPAW_GENDOGAKU%TYPE;
--  v_RIRITU          QPAW_KojoRisoW.QPAW_RIRITU%TYPE;
--  v_HENSAITUKISU    QPAW_KojoRisoW.QPAW_HENSAITUKISU%TYPE;
--  v_KYUYOHENSAIALL  QPAW_KojoRisoW.QPAW_KYUYOHENSAIALL%TYPE;
--  v_KYUYOHENSAI     QPAW_KojoRisoW.QPAW_KYUYOHENSAI%TYPE;
--  v_SYOYOHENSAIALL  QPAW_KojoRisoW.QPAW_SYOYOHENSAIALL%TYPE;
--  v_SYOYOHENSAI     QPAW_KojoRisoW.QPAW_SYOYOHENSAI%TYPE;
--  v_KANSAIYMD       QPAW_KojoRisoW.QPAW_KANSAIYMD%TYPE;
--  v_KYUYOZANDAKA    QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
--  v_SYOYOZANDAKA    QPAW_KojoRisoW.QPAW_SYOYOZANDAKA%TYPE;
--  v_RISOKU          QPAW_KojoRisoW.QPAW_RISOKU%TYPE;
--  v_TOZAIKBN        QPAW_KojoRisoW.QPAW_TOZAIKBN%TYPE;
--  v_SEISANCD        QPAW_KojoRisoW.QPAW_SEISANCD%TYPE;
--  v_MISECD          QPAW_KojoRisoW.QPAW_MISECD%TYPE;
--  v_BUMONCD         QPAW_KojoRisoW.QPAW_BUMONCD%TYPE;
--  v_MISENM          QPAW_KojoRisoW.QPAW_MISENM%TYPE;
--  v_SIMEIKANJI      QPAW_KojoRisoW.QPAW_SIMEIKANJI%TYPE;
--  v_TAISYOKUYMD     QPAW_KojoRisoW.QPAW_TAISYOKUYMD%TYPE;
--  v_KYUSYOKUYMD     QPAW_KojoRisoW.QPAW_KYUSYOKUYMD%TYPE;
--  v_BONUSYMD1       QPAW_KojoRisoW.QPAW_BONUSYMD1%TYPE;
--  v_BONUSYMD2       QPAW_KojoRisoW.QPAW_BONUSYMD2%TYPE;
--
--  v_BUMONNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;
--  v_SEISANNM        QPAG_SEISANM.QPAG_SEISANNM%TYPE;
--
--  v_SYORIYMD        CHAR(8);
--  v_SYORIMM         CHAR(2);
--  v_BONUSMM1        CHAR(2);
--  v_BONUSMM2        CHAR(2);
--
--  /* 2001/10/12 集計単位・出力順 不備対応 */
--  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;
--
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--  v_FROMDATE        CHAR(8);
--  v_TODATE          CHAR(8);
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--BEGIN
--
--    /****************************************/
--    /* 控除連絡表_印刷ＷＯＲＫＴに追加  　　*/
--    /****************************************/
--    /*2003.03.25*/
--    DELETE FROM QPAM_SYNKEISANW
--          WHERE QPAM_USERID     = InStrUserID
--            AND QPAM_COMPUTERNM = InStrComputerNM;
----    DELETE FROM QPAO_KOJOW
----          WHERE QPAO_USERID     = InStrUserID
--            AND QPAO_COMPUTERNM = InStrComputerNM;
--
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--    v_FROMDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMM') || '26';	-- 処理年月の前月26日
--    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                            -- 処理年月の当月25日
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--    /*ワーク　控除連絡表_利息Ｔ検索 */
--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT DISTINCT';
--    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
--    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
--    StrSQL := StrSQL || ' QPAW_SYUBETU,';
--    StrSQL := StrSQL || ' QPAW_KEIYAKUYMD,';
--    StrSQL := StrSQL || ' QPAW_YUSIYMD,';
--    StrSQL := StrSQL || ' QPAW_GENDOGAKU,';
--    StrSQL := StrSQL || ' QPAW_RIRITU,';
--    StrSQL := StrSQL || ' QPAW_HENSAITUKISU,';
--    StrSQL := StrSQL || ' QPAW_KYUYOHENSAIALL,';
--    StrSQL := StrSQL || ' QPAW_KYUYOHENSAI,';
--    StrSQL := StrSQL || ' QPAW_SYOYOHENSAIALL,';
--    StrSQL := StrSQL || ' QPAW_SYOYOHENSAI,';
--    StrSQL := StrSQL || ' QPAW_KANSAIYMD,';
--    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
--    StrSQL := StrSQL || ' QPAW_SYOYOZANDAKA,';
--    StrSQL := StrSQL || ' QPAW_RISOKU,';
--    StrSQL := StrSQL || ' QPAW_TOZAIKBN,';
--    StrSQL := StrSQL || ' QPAW_SEISANCD,';
--    StrSQL := StrSQL || ' QPAW_MISECD,';
--    StrSQL := StrSQL || ' QPAW_BUMONCD,';
--    StrSQL := StrSQL || ' QPAW_MISENM,';
--    StrSQL := StrSQL || ' QPAW_SIMEIKANJI,';
--    StrSQL := StrSQL || ' QPAW_TAISYOKUYMD,';
--    StrSQL := StrSQL || ' QPAW_KYUSYOKUYMD,';
--    StrSQL := StrSQL || ' QPAW_BONUSYMD1,';
--    StrSQL := StrSQL || ' QPAW_BONUSYMD2,';
--    StrSQL := StrSQL || ' QPAF_BUMONNM,';
--    StrSQL := StrSQL || ' QPAG_SEISANNM ';
--    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
--    StrSQL := StrSQL || '     ,QPAF_BUMONM';
--    StrSQL := StrSQL || '     ,QPAG_SEISANM ';
--    StrSQL := StrSQL || ' WHERE QPAW_MISECD   = QPAF_PRMMISECD(+)';
--    StrSQL := StrSQL || '   AND QPAW_BUMONCD  = QPAF_PRMBUMONCD(+)';
--    StrSQL := StrSQL || '   AND QPAW_SEISANCD = QPAG_PRMSEISANCD(+)';
--    StrSQL := StrSQL || '   AND (QPAW_TAISYOKUYMD IS NULL';
--    StrSQL := StrSQL || '        OR TO_CHAR(QPAW_TAISYOKUYMD,''YYYYMMDD'') > :StrYMD)';
--    StrSQL := StrSQL || '   AND (QPAW_KYUSYOKUYMD IS NULL';
--    StrSQL := StrSQL || '        OR TO_CHAR(QPAW_KYUSYOKUYMD,''YYYYMMDD'') > :StrYMD)';
--    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
--    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';
--
--    /* 動的カーソルのオープン */
--    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--    /* SQLの解析 */
--    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--    /* 入力変数をバインドする */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD',  InStrYMD);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);
--
--    /* 出力変数のバインド */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SYAINCD1      ,  1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SYAINCD2      ,  7);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYUBETU       ,  1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_KEIYAKUYMD        );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_YUSIYMD           );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_GENDOGAKU         );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_RIRITU            );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_HENSAITUKISU      );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KYUYOHENSAIALL    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KYUYOHENSAI       );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SYOYOHENSAIALL    );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_SYOYOHENSAI       );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_KANSAIYMD         );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUYOZANDAKA      );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_SYOYOZANDAKA      );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_RISOKU            );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_TOZAIKBN      ,  1);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD      ,  3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISECD        ,  3);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_BUMONCD       ,  6);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_MISENM        , 24);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_SIMEIKANJI    , 40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_TAISYOKUYMD       );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_KYUSYOKUYMD       );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_BONUSYMD1         );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,26,v_BONUSYMD2         );
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,27,v_BUMONNM       , 24);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,28,v_SEISANNM      , 24);
--
--    /* SQLの実行 */
--    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--
--    LOOP
--      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
--        EXIT;
--      END IF;
--      /* カラム値を変数へ格納 */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SYAINCD1        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SYAINCD2        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYUBETU         );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_KEIYAKUYMD      );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_YUSIYMD         );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_GENDOGAKU       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_RIRITU          );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_HENSAITUKISU    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KYUYOHENSAIALL  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KYUYOHENSAI     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SYOYOHENSAIALL  );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_SYOYOHENSAI     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_KANSAIYMD       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUYOZANDAKA    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_SYOYOZANDAKA    );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_RISOKU          );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_TOZAIKBN        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD        );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISECD          );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_BUMONCD         );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_MISENM          );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_SIMEIKANJI      );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_TAISYOKUYMD     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_KYUSYOKUYMD     );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_BONUSYMD1       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,26,v_BONUSYMD2       );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,27,v_BUMONNM         );
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,28,v_SEISANNM        );
--
--      /* 金額算出 */
--      --ローン種別＝１
--      IF  v_SYUBETU = '1' THEN
--          IF  v_SYOYOHENSAI <= v_KYUYOZANDAKA  THEN
--              v_KINGAKU := v_SYOYOHENSAI;
--          ELSE
--              v_KINGAKU := v_KYUYOZANDAKA;
--          END IF;
--
--      --ローン種別＝２
--      ELSE
--          IF  v_SYOYOHENSAI <= v_SYOYOZANDAKA  THEN
--              v_KINGAKU := v_SYOYOHENSAI;
--          ELSE
--              v_KINGAKU := v_SYOYOZANDAKA + v_RISOKU;
--          END IF;
--      END IF;
--
--      /* 元金算出 */
--      v_GANKIN  := v_KINGAKU - v_RISOKU;
--
--      /* 残高算出 */
--      --ローン種別＝１
--      IF  v_SYUBETU = '1' THEN
--          v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
--      --ローン種別＝２
--      ELSE
--          v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
--      END IF;
--
--      /* 処理日 算出 */
--      IF  SUBSTR(InStrYMD,5,2) = SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2) THEN
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),7,2);
--      ELSE
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),7,2);
--      END IF;
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
--      /* 証書賞与の場合、期間算出が異なる為、以下の処理で抽出する */
----      IF v_SYUBETU = '2' THEN
--         IF TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
--         AND TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
--            v_SYORIYMD := TO_CHAR(v_BONUSYMD1,'YYYYMMDD');
--         ELSIF TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
--         AND TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
--            v_SYORIYMD := TO_CHAR(v_BONUSYMD2,'YYYYMMDD');
--         END IF;
----      END IF;
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--      /* 判定用 月 */
--      v_SYORIMM   := SUBSTR(InStrYMD,5,2);
--      v_BONUSMM1  := SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2);
--      v_BONUSMM2  := SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),5,2);
--
--      /* 出力判定ＦＬＧ 初期化*/
--      v_OutPutFLG := 0;     --Off(出力しない)
--      /* 出力判定 */
--      IF  v_KINGAKU       >  0  AND
--          v_RISOKU        >  0  AND
--         (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
--          v_OutPutFLG := 1;     --On(出力する)
--      END IF;
--      IF  v_SYUBETU = '1'   THEN
--          IF  v_KYUYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
----             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
--              (TO_NUMBER(v_SYORIYMD) >= TO_NUMBER(v_FROMDATE) AND
--               TO_NUMBER(v_SYORIYMD) <= TO_NUMBER(v_TODATE)) THEN
--              v_OutPutFLG := 1;     --On(出力する)
--          END IF;
--      END IF;
--      IF  v_SYUBETU = '2'   THEN
--/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
----          IF  v_SYOYOZANDAKA  >  0  AND
----              v_KINGAKU       >  0  AND
----             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
----              v_OutPutFLG := 1;     --On(出力する)
----          END IF;
----          IF  v_SYOYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
--              (TO_NUMBER(v_SYORIYMD) >= TO_NUMBER(v_FROMDATE) AND
--               TO_NUMBER(v_SYORIYMD) <= TO_NUMBER(v_TODATE)) THEN
----                v_OutPutFLG := 1;     --On(出力する)
--          END IF;
--/* Yasui@NBC 2005.05.06 控除作成不備 <== */
--
--      END IF;
--
--      /* 2001/10/12 東西区分名称 追加 */
--      IF  v_TOZAIKBN = '1' THEN
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
--      ELSE
--          v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
--      END IF;
--
--      /* 控除連絡表_印刷ＷＯＲＫに追加 */
--      IF  v_OutPutFLG = 1   THEN    --On(出力する)
--
--          /* 2001/10/12 集計単位・出力順 不備対応 */
--          SELECT  QSA2_MEI
--            INTO  v_MEI
--          FROM    QSA2_SCODET
--          WHERE   QSA2_PRMCODEKBN         = 'DP' || v_TOZAIKBN     --東
--              AND RTRIM(QSA2_PRMCODENO)   = v_MISECD;
--          /*2003.03.25 ここから↓*/
--          /*代替テーブル*/
--          INSERT INTO QPAM_SYNKEISANW VALUES (
--           NVL(v_SYAINCD1,' ')            --社員コード１    QPAM_SYAINCD1           CHAR(1)         QPAO_SYAINCD1	CHAR(1)
--          ,NVL(v_SYAINCD2,' ')            --社員コード２    QPAM_SYAINCD2           CHAR(7)         QPAO_SYAINCD2	CHAR(7)
--          ,NVL(v_BUMONNM,' ')             --部門名          QPAM_SIMEIKANJI         VARCHAR2(24)    QPAO_BUMONNM	VARCHAR2(24)
--          ,NVL(v_MISENM,' ')              --店名            QPAM_MISENM             VARCHAR2(24)    QPAO_MISENM		VARCHAR2(24)
--          ,SUBSTR(v_MEI,4,3)              --店コード        QPAM_YUSIYMD            CHAR(8)         QPAO_MISECD		CHAR(3)
--          ,v_KINGAKU                      --金額            QPAM_KYUYOYUSIGAKU      NUMBER(7)       QPAO_KINGAKU	NUMBER(7)
--          ,v_GANKIN                       --元金            QPAM_SYOYOYUSIGAKU      NUMBER(7)       QPAO_GANKIN		NUMBER(7)
--          ,NVL(v_RISOKU,0)                --利息            QPAM_KYUYOZANGANPON     NUMBER(7)       QPAO_RISOKU		NUMBER(7)
--          ,v_ZANDAKA                      --残高            QPAM_SYOYOZANGANPON     NUMBER(7)       QPAO_ZANDAKA	NUMBER(7)
--          ,NVL(v_BUMONCD,' ')             --部門コード      QPAM_KYUYOKEISANS       CHAR(8)         QPAO_BUMONCD	CHAR(6)
--          ,SUBSTR(v_MEI,1,3)              --精算店コード    QPAM_SYOYOKEISANS       CHAR(8)         QPAO_SEISANCD	CHAR(3)
--          ,v_SYORIYMD                     --処理日          QPAM_SEISANYMD          CHAR(8)         QPAO_SYORIYMD	DATE
----          ,TO_DATE(v_SYORIYMD,'YYYYMMDD')	--処理日        QPAM_SEISANYMD          CHAR(8)         QPAO_SYORIYMD	DATE
--          ,NULL                           --                QPAM_RIRITU             NUMBER(4,2)
--          ,TO_NUMBER(NVL(v_SEISANCD,'0')) --精算店コード    QPAM_KYUYORISOKU        NUMBER(7)       QPAO_PAGEKBN	NUMBER(4)
--          ,NULL                           --                QPAM_SYOYORISOKU        NUMBER(7)
--          ,NVL(v_TOZAIKBN,' ')            --東西区分        QPAM_TENBIKIKBN         CHAR(1)         QPAO_TOZAIKBN	CHAR(1)
--          ,NULL                           --                QPAM_KYUYOTENBIKIGAKU   NUMBER(7)
--          ,NULL                           --                QPAM_SYOYOTENBIKIGAKU   NUMBER(7)
--          ,'0'                            --控除区分        QPAM_KYUYOKOSINKBN      CHAR(1)         QPAO_KOJOKBN	CHAR(1)
--          ,NVL(v_SYUBETU,' ')             --ローン種別      QPAM_SYOYOKOSINKBN      CHAR(1)         QPAO_SYUBETU	CHAR(1)
--          ,NULL                           --行              QPAM_SEISANM            CHAR(2)         QPAO_GYOUKBN	NUMBER(2)
--          ,NULL                           --                QPAM_KYUYONISU          NUMBER(3)
--          ,NULL                           --                QPAM_SYOYONISU          NUMBER(3)
--          ,NVL(v_SIMEIKANJI,' ')          --氏名            QPAM_ZAIMUKYOKUCD       VARCHAR2(40)    QPAO_SINEIKANJI	VARCHAR2(40)
--          ,NVL(v_SEISANNM,' ')            --精算店名        QPAM_SYOZAICHI          VARCHAR2(40)    QPAO_SEISANNM	VARCHAR2(24)
----2003.06.11
--          ,TO_CHAR(v_YUSIYMD,'YYYYMMDD')  --融資日          QPAM_KAISYANM           VARCHAR2(40)    QPAO_YUSIYMD	DATE
----2003.06.11
--          ,InStrUserID                    --ユーザーＩＤ    QPAM_USERID             VARCHAR2(8)
--          ,InStrComputerNM                --ＰＣ名          QPAM_COMPUTERNM         VARCHAR2(20)
--          );
--
----          INSERT INTO QPAO_KOJOW VALUES (
----             TO_NUMBER(NVL(v_SEISANCD,'0'))   --ページ ※変更前 精算店コード    -- 10/12 UPD
----            ,NULL                         --行
----            ,SUBSTR(v_MEI,1,3)            --精算店コード    -- 10/12 UPD
----            ,NVL(v_SEISANNM,' ')          --精算店名
----            ,NVL(v_SYAINCD1,' ')          --社員コード１
----            ,NVL(v_SYAINCD2,' ')          --社員コード２
----            ,'0'                          --控除区分
----            ,NVL(v_SYUBETU,' ')           --ローン種別
----            ,NVL(v_TOZAIKBN,' ')          --東西区分
----            ,SUBSTR(v_MEI,4,3)            --店コード        -- 10/12 UPD
----            ,NVL(v_MISENM,' ')            --店名
----            ,NVL(v_BUMONNM,' ')           --部門名
----            ,NVL(v_SIMEIKANJI,' ')        --氏名
----            ,v_YUSIYMD                    --融資日
----            ,v_KINGAKU                    --金額
----            ,v_GANKIN                     --元金
----            ,NVL(v_RISOKU,0)              --利息
----            ,v_ZANDAKA                    --残高
----            ,TO_DATE(v_SYORIYMD,'YYYYMMDD') --処理日
----            ,NVL(v_BUMONCD,' ')           --部門コード
----            ,InStrUserID
----            ,InStrComputerNM
----            );
--          /*2003.03.25 ここまで↑*/
--
--      END IF;
--
--    END LOOP;
--
--    /* カーソルのクローズ */
--    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
--
--  /* コミット */
--  COMMIT;
--
--EXCEPTION
--  WHEN  OTHERS  THEN
--    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
--        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
--    END IF;
--    /* ロールバック */
--    ROLLBACK;
--    RAISE ;
--END QPAP_CEnt140KojoPrtSyouyo2;
--del TR0506-023 imz.Yoshida <==

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt140NEXTKYUYOZAN                                  */
/* 機能          ：控除連絡表_次月給与残高計算                               */
/* 作成          ：2003.03.25                                                */
/*****************************************************************************/
FUNCTION QPAP_CEnt140NEXTKYUYOZAN (
	 InStrYMD			IN		VARCHAR2								--最新控除データの日付
	,InFlg				IN		VARCHAR2								--小口 = '1',証書 = '2'
	,InYushiYMD			IN		VARCHAR2								--小口 = '' ,証書 = 融資日
	,InSyainCD1			IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD1%TYPE	--社員コード１
	,InSyainCD2			IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE	--社員コード２
	,InStrUserID		IN		VARCHAR2								--ユーザーID
	,InStrComputerNM	IN		VARCHAR2								--使用端末名
)
RETURN NUMBER IS

  /* 処理固有の変数 */
	StrSQL				VARCHAR2(1000);
	v_CursorID			NUMBER := 0;
	v_CursorID2			NUMBER := 0;
	v_Dummy				INTEGER;
	v_Dummy2			INTEGER;
	v_ZenYMD			CHAR(8);    --前月
	v_ZenZenYMD			CHAR(8);    --前々月
	v_Zandaka			NUMBER;
	v_WZandaka			NUMBER;
	v_CalZandaka		NUMBER;
	v_KasiRisoku		NUMBER;
	v_KBN				QPAS_KGCW.QPAS_KBN%TYPE;
	v_YMD				QPAS_KGCW.QPAS_YMD%TYPE;
	v_Kingaku			NUMBER;
	v_KEISANKIN			NUMBER;
	v_KEISANFLG			CHAR(1);
	v_ZenYMD_N			CHAR(8);
	v_ZenZenYMD_N		CHAR(8);

--2003/01/16 利息計算を日ごとに利率取得に変更
	W_CNT				NUMBER;						--利息計算用ループカウンタ
	W_ENDLOOPCNT		NUMBER;						--利息計算用ループ終了値
	v_GetRiritu			NUMBER;						--利息計算用利息率(旧)
	v_GetRiritu2		NUMBER;						--利息計算用利息率(新)
	v_StartRiritu		NUMBER;						--利息計算用利息求める範囲開始日での適用利率
	v_NextRiritu		NUMBER;						--利息計算用利息求める範囲終了日での適用利率
	v_Risoku2			NUMBER;						--利息
	v_Risoku3			NUMBER;						--利息
--2003/01/16 利息計算を日ごとに利率取得に変更

	v_Risoku			NUMBER;
	v_WorkYMD			CHAR(8);
	v_Kikan				NUMBER;
	v_PRMSYAINCD1		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
	v_PRMSYAINCD2		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
	v_PRMYUSIYMD		QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
	v_GENDOGAKU			QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
	v_RIRITU			QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
	v_HENSAITUKISU		QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
	v_KYUYOHENSAIALL	QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
	v_KYUYOHENSAI		QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
	v_SYOYOHENSAIALL	QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
	v_SYOYOHENSAI		QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
	v_KYUYOZANDAKA		QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
	v_SYOYOZANDAKA		QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
	v_KOJOCYUSIFLG		QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
	v_KANSAIYMD			QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;
	v_KEIYAKUYMD		QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
	v_KYUYOZANDAKA_W	QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

	v_RIRITU2         NUMBER;
	W_KINGAKU_A			NUMBER;
	V_GANKIN			NUMBER;
	V_RES				NUMBER;

	/* 小口退避テーブル検索 */
	CURSOR CurA(StrUserID IN CHAR,StrComputerNM IN CHAR) IS
		SELECT
			NVL(QPAS_KBN,' ')			KBN,			--貸付、入金、賞与
			NVL(QPAS_YMD,' ')			YMD,			--日付
			NVL(QPAS_KINGAKU,0)			KINGAKU			--金額
		FROM  QPAS_KGCW
		WHERE QPAS_USERID     = StrUserID				--ユーザーID
		AND   QPAS_COMPUTERNM = StrComputerNM			--端末名
		ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN;

	RowCurA		CurA%ROWTYPE;

	CURSOR CurB(StrSYAINCD1 IN CHAR, StrSYAINCD2 IN CHAR ,StrUserID IN CHAR,StrComputerNM IN CHAR) IS
		SELECT
			QPAS_KBN						KBN,
			SUM(QPAS_KINGAKU)				KINGAKU,
			QPAS_YMD						YMD
		FROM QPAS_KGCW,QPA1_KGCDAICYOT
		WHERE QPA1_PRMSYAINCD1   = StrSYAINCD1
		AND   QPA1_PRMSYAINCD2   = StrSYAINCD2
		AND   QPAS_SYAINCD1      = QPA1_PRMSYAINCD1
		AND   QPAS_SYAINCD2      = QPA1_PRMSYAINCD2
		/* DEL 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
--		AND   (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = ' ')
		/* DEL 0811051 社員証書貸付帳票見直し NBC ISHIDA END */
		AND   QPAS_USERID        = StrUserID
		AND   QPAS_COMPUTERNM    = StrComputerNM
		GROUP BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD
		ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN;

	RowCurB		CurB%ROWTYPE;

BEGIN

	IF InFlg = '1' THEN
		--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		--
		--	経過残高算出
		--
		--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		DELETE	FROM  QPAS_KGCW
				WHERE QPAS_USERID     = InStrUserID
				AND   QPAS_COMPUTERNM = InStrComputerNM;

		v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');
		v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-2) ,'YYYYMMDD');

		/* 11/01 ADD 入金用指定範囲変更 */
		v_ZenYMD_N    := TO_CHAR(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,'YYYYMMDD');
		v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,-1) ,'YYYYMMDD');



		/* 貸付 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				' ',
				NVL(QPA6_SYAINCD,' '),
				'1',
				TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
				NVL(QPA6_KINGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA6_KGCKASITUKET
			WHERE
				QPA6_SYAINCD = InSyainCD2
			AND	(TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
			AND	(TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
			AND	(QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
		/* 入金 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				NVL(QPA5_SYAINCD1,' '),
				NVL(QPA5_SYAINCD2,' '),
				'2',
				TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
				NVL(QPA5_NYUKINGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA5_KGCNYUKINT
			WHERE
				QPA5_SYAINCD1 = InSyainCD1
			AND	QPA5_SYAINCD2 = InSyainCD2
			AND	(TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)				-- 11/01 UPD
			AND	(TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);			-- 11/01 UPD
		/* 賞与 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				NVL(QPA4_SYAINCD1,' '),
				NVL(QPA4_SYAINCD2,' '),
				'4',
				TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
				NVL(QPA4_KOJOGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA4_KGCKOJOT
			WHERE
				QPA4_SYAINCD1 = InSyainCD1
			AND	QPA4_SYAINCD2 = InSyainCD2
			AND	(TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= v_ZenYMD)
			AND	(TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenZenYMD);

		/* コミット */
		COMMIT;

		/********************************/
		/* 控除連絡表_経過残高Ｔに追加  */
		/********************************/
		DELETE	FROM  QPAU_KojoZanW
				WHERE QPAU_USERID     = InStrUserID
				AND   QPAU_COMPUTERNM = InStrComputerNM;

		/* 前前月残高参照 */
		BEGIN
			SELECT
				NVL(QPA3_ZANDAKA,0)
			INTO
				v_Zandaka
			FROM
				QPA3_KGCZANDAKAT
			WHERE
				QPA3_PRMSYAINCD1 = InSyainCD1
			AND	QPA3_PRMSYAINCD2 = InSyainCD2
			AND	QPA3_PRMYUSIKBN  = '3'
			AND	QPA3_PRMZANDAKAYMD = (SELECT
											MAX(QPA3_PRMZANDAKAYMD)
										FROM
											QPA3_KGCZANDAKAT
										WHERE
											QPA3_PRMSYAINCD1 = InSyainCD1
										AND	QPA3_PRMSYAINCD2 = InSyainCD2
										AND	QPA3_PRMYUSIKBN  = '3'
										AND	TO_CHAR(QPA3_PRMZANDAKAYMD,'YYYYMMDD') <= v_ZenZenYMD);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				v_Zandaka := 0;
			WHEN	OTHERS  THEN
				RAISE ;
		END;

		FOR RowCurA IN CurA(InStrUserID,InStrComputerNM) LOOP
			--RowCurA.KBN
			--RowCurA.YMD
			--RowCurA.KINGAKU

			IF RowCurA.KBN = '1' THEN
				v_Zandaka := v_Zandaka + RowCurA.KINGAKU;
			ELSE
				v_Zandaka := v_Zandaka - RowCurA.KINGAKU;
			END IF;

			IF RowCurA.KBN = '1' THEN
				v_WZandaka := RowCurA.KINGAKU + v_Zandaka;
				IF v_WZandaka <= 0 then
					v_CalZandaka := 0;
				ELSE
					IF	v_Zandaka >= RowCurA.KINGAKU then
						v_CalZandaka := RowCurA.KINGAKU;
					ELSE
						v_CalZandaka := v_Zandaka;
					END IF;
				END IF;
			ELSE
				IF	v_Zandaka <= 0 THEN
					v_CalZandaka := 0;
				ELSE
					IF RowCurA.KBN = '2' THEN
						v_CalZandaka := (0 - RowCurA.KINGAKU);
					ELSE
						v_CalZandaka := RowCurA.KINGAKU;
					END IF;
				END IF;
			END IF;

			/* ワーク 控除連絡表_経過残高Ｔに追加 */
			INSERT INTO QPAU_KojoZanW VALUES (
				 NVL(InSyainCD1,' ')				--個人コード１
				,NVL(InSyainCD2,' ')				--個人コード２
				,' '								--ローン種別
				,NVL(RowCurA.KBN,' ')				--融資区分
				,TO_DATE(RowCurA.YMD,'YYYYMMDD')	--入金日貸付日
				,NVL(RowCurA.KINGAKU,0)				--入金金額貸付金額
				,NVL(v_Zandaka,0)					--残高
				,NVL(v_CalZandaka,0)				--計算用金額
				,InStrUserID						--ユーザーＩＤ
				,InStrComputerNM					--端末名
				);
		END LOOP;

		/* コミット */
		COMMIT;

		--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		--
		--	貸付、入金、賞与の利息算出
		--
		--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		/**************************/
		/* 小口退避テーブルに退避 */
		/**************************/
		DELETE	FROM  QPAS_KGCW
				WHERE QPAS_USERID     = InStrUserID
				AND   QPAS_COMPUTERNM = InStrComputerNM;

		/* 貸付 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				' ',
				NVL(QPA6_SYAINCD,' '),
				'1',
				TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
				NVL(QPA6_KINGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA6_KGCKASITUKET
			WHERE
				QPA6_SYAINCD = InSyainCD2
			AND	(TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
			AND	(TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
			AND	(QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
		/* 入金 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				NVL(QPA5_SYAINCD1,' '),
				NVL(QPA5_SYAINCD2,' '),
				'2',
				TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
				NVL(QPA5_NYUKINGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA5_KGCNYUKINT
			WHERE
				QPA5_SYAINCD1 = InSyainCD1
			AND	QPA5_SYAINCD2 = InSyainCD2
			AND	(TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)				-- 11/01 UPD
			AND	(TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);			-- 11/01 UPD
		/* 賞与 */
		INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
			SELECT
				NVL(QPA4_SYAINCD1,' '),
				NVL(QPA4_SYAINCD2,' '),
				'4',
				TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
				NVL(QPA4_KOJOGAKU,0),
				InStrUserID,
				InStrComputerNM
			FROM QPA4_KGCKOJOT
			WHERE
				QPA4_SYAINCD1 = InSyainCD1
			AND	QPA4_SYAINCD2 = InSyainCD2
			AND	(TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <  InStrYMD)
			AND	(TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenYMD);
		/* コミット */
		COMMIT;

		/*小口退避テーブル検索 */
		/* 貸付(1)と入金(2)と賞与(4) */
		v_KasiRisoku := 0;
		FOR RowCurB IN CurB(InSyainCD1,InSyainCD2,InStrUserID,InStrComputerNM) LOOP
			--RowCurB.KBN
			--RowCurB.YMD
			--RowCurB.KINGAKU

			v_KEISANKIN := 0;
			v_KEISANFLG := '0';

			/* 控除連絡表_経過残高Ｔ検索 */
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT';
			StrSQL := StrSQL || ' SUM(QPAU_KEISANKIN)';
			StrSQL := StrSQL || ' FROM QPAU_KOJOZANW';
			StrSQL := StrSQL || ' WHERE QPAU_SYAINCD1   = :SYAINCD1';
			StrSQL := StrSQL || '   AND QPAU_SYAINCD2   = :SYAINCD2';
			StrSQL := StrSQL || '   AND QPAU_YUSIKBN    = :KBN';
			StrSQL := StrSQL || '   AND TO_CHAR(QPAU_NYUKASIYMD,''YYYYMMDD'') = :YMD';
			StrSQL := StrSQL || '   AND QPAU_USERID     = :StrUserID';
			StrSQL := StrSQL || '   AND QPAU_COMPUTERNM = :StrComputerNM';
			StrSQL := StrSQl || ' GROUP BY QPAU_SYAINCD1,QPAU_SYAINCD2,QPAU_YUSIKBN,QPAU_NYUKASIYMD';

			/* 動的カーソルのオープン */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQLの解析 */
			DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
			/* 入力変数をバインドする */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD1',     InSyainCD1);
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD2',     InSyainCD2);
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN',          RowCurB.KBN);
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',          RowCurB.YMD);
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);
			/* 出力変数のバインド */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KEISANKIN);
			/* SQLの実行 */
			v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

			IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
				/* カラム値を変数へ格納 */
				DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KEISANKIN);
				v_KEISANFLG := '1';
			END IF;

	/*	2003/01/21	利息計算修正	↓ここから↓*/
			--TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1
			v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD);						--利息計算開始日時点での利息率
			v_NextRiritu  := QPAP_CEnt140GetRiritu(v_ZenYMD);							--利息計算終了日時点での利息率

			IF v_KBN = '1' THEN
				--★
				IF v_StartRiritu <> v_NextRiritu THEN
					--１日ごとに利息率を取得して利息計算する
					W_CNT        := v_YMD;
					W_ENDLOOPCNT := v_ZenYMD;

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;															--利息算出範囲の終わりを超えたらループ終了
						END IF;

						v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--日ごとに適用される利率(旧制度)を取得する
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

						IF v_KEISANFLG = '1' THEN
							IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
							ELSE
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
							END IF;
						ELSE
							IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu / 36500 * 1000) * 1000;
							ELSE
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu2 * 1000000);
							END IF;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
					END LOOP;
				ELSE
					--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
					v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

					IF v_KEISANFLG = '1' THEN
						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
						END IF;
					ELSE
						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
				END IF;
			END IF;

			IF v_KBN = '2' THEN
				--TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')
				v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD + 1);							--利息計算開始日時点での利息率
				v_NextRiritu  := QPAP_CEnt140GetRiritu(v_ZenYMD_N);							--利息計算終了日時点での利息率

				IF v_StartRiritu <> v_NextRiritu THEN
					--１日ごとに利息率を取得して利息計算する
					W_CNT        := v_YMD + 1;
					W_ENDLOOPCNT := v_ZenYMD_N;

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;															--利息算出範囲の終わりを超えたらループ終了
						END IF;

						v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率(旧制度)を取得する
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

						IF v_KEISANFLG = '1' THEN
							IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--新旧判定
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
							ELSE
								v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
							END IF;
						ELSE
							IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--新旧判定
								v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
							ELSE
								v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
							END IF;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ

					END LOOP;
				ELSE
					--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
					v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

					IF v_KEISANFLG = '1' THEN
						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
						END IF;
					ELSE
						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
				END IF;

			END IF;
			IF v_KBN = '4' THEN
				--(TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD'))
				v_StartRiritu := QPAP_CEnt140GetRiritu(v_YMD + 1);							--利息計算開始日時点での利息率
				v_NextRiritu  := QPAP_CEnt140GetRiritu(InStrYMD);							--利息計算終了日時点での利息率

				IF v_StartRiritu <> v_NextRiritu THEN
					--１日ごとに利息率を取得して利息計算する
					W_CNT        := v_YMD + 1;
					W_ENDLOOPCNT := InStrYMD;

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;															--利息算出範囲の終わりを超えたらループ終了
						END IF;

						v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率(旧制度)を取得する
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

						IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
						END IF;

						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ

					END LOOP;

				ELSE
					--従来の処理（利息計算の経過日数の開始日と終了日が同じ時は経過日数をかける）
					v_GetRiritu  := v_StartRiritu;											--開始日に適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					利率(新制度)を取得する

					IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu2 * 1000000);
					END IF;
				END IF;
			END IF;
	/*	2003/01/21	利息計算修正	↑ここまで↑*/

			/* カーソルのクローズ */
			DBMS_SQL.CLOSE_CURSOR(v_CursorID2);

		END LOOP;

		/*QPAP_CEnt140KyuyoRisoku開始*/

		/* 前月日付 */
		v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

		/*■小口■　小口融資台帳テーブル検索 */
		BEGIN
			SELECT DISTINCT
				 QPA1_KEIYAKUYMD			--小口台帳　契約日
				,QPA1_GENDOGAKU				--小口台帳　限度額
				,QPA1_KYUYOHENSAI			--小口台帳　給与返済
				,QPA1_SYOYOHENSAI			--小口台帳　賞与返済
				,QPA1_KYUYOZANDAKA			--小口台帳　給与残高
				,QPA1_SYOYOZANDAKA			--小口台帳　給与残高
				,QPAV_KASIRISOKU			--ワーク　　今月控除反映分の利息
			INTO
				 v_KEIYAKUYMD
				,v_GENDOGAKU
				,v_KYUYOHENSAI
				,v_SYOYOHENSAI
				,v_KYUYOZANDAKA
				,v_SYOYOZANDAKA
				,v_KASIRISOKU
			FROM	QPA1_KGCDAICYOT,QPAV_KOJOKOGUW
			WHERE	(QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = ' ')
			AND		QPA1_PRMSYAINCD1 = QPAV_SYAINCD1(+)
			AND		QPA1_PRMSYAINCD2 = QPAV_SYAINCD2(+)
			AND		QPA1_PRMSYAINCD1 = InSyainCD1
			AND		QPA1_PRMSYAINCD2 = InSyainCD2
			AND		QPAV_USERID(+)     = InStrUserID
			AND		QPAV_COMPUTERNM(+) = InStrComputerNM;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				NULL;
			WHEN	OTHERS  THEN
				RAISE ;
		END;

		--2002/03/07 小口返済額テーブルより返済額を取得（小口返済台帳の返済額は使用しない）
		/* 小口返済額情報取得 */
		BEGIN
			SELECT
				 NVL(QPA2_KYUYOHENSAI,0)
				,NVL(QPA2_SYOYOHENSAI,0)
			INTO
				 v_KYUYOHENSAI
				,v_SYOYOHENSAI
			FROM	QPA2_KGCHENSAIT
			WHERE	QPA2_PRMSYAINCD1 =  InSyainCD1
			AND		QPA2_PRMSYAINCD2 =  InSyainCD2
			AND		QPA2_PRMHENKOUYM = (SELECT MAX(QPA2_PRMHENKOUYM)
										FROM  QPA2_KGCHENSAIT
										WHERE QPA2_PRMSYAINCD1 = InSyainCD1
										AND   QPA2_PRMSYAINCD2 = InSyainCD2);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				NULL;
			WHEN	OTHERS  THEN
				RAISE ;
		END;
		/* 利息計算 */
		v_Risoku  := 0;     --利息

		IF	v_KYUYOZANDAKA > 0 THEN
			v_KYUYOZANDAKA_W := v_KYUYOZANDAKA;
		ELSE
			v_KYUYOZANDAKA_W := 0;
		END	IF;

		IF	v_KASIRISOKU IS NULL THEN
			v_KASIRISOKU := 0;
		END	IF;

		v_StartRiritu := QPAP_CEnt140GetRiritu(v_ZenYMD + 1);						--利息計算開始日時点での利息率
		v_NextRiritu  := QPAP_CEnt140GetRiritu(InStrYMD);							--利息計算終了日時点での利息率
		v_Risoku2     := 0;

		IF v_StartRiritu <> v_NextRiritu THEN
			--１日ずつ利息率を取得して計算を行なう
			w_Cnt := v_ZenYMD + 1;													--利息計算開始日(前回給与日の次の日)
			w_EndLoopCnt := InStrYMD;												--利息計算終了日(今回給与日)

			LOOP
				IF w_Cnt > w_EndLoopCnt THEN
					EXIT;															--利息算出範囲の終わりを超えたらループ終了
				END IF;

				v_GetRiritu  := QPAP_CEnt140GetRiritu(w_Cnt);						--その日に適用される利率を取得する
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率を取得する

				--利息の計算
				IF TO_DATE(w_Cnt,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
					v_Risoku  := v_Risoku + TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
				ELSE
					v_Risoku3 := v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000;
	--				v_Risoku  := v_Risoku + TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000) + v_KASIRISOKU) / 1000000);
				END IF;

				v_Risoku2 := v_Risoku2 + v_Risoku3;

				w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
			END LOOP;
			v_Risoku := (v_Risoku2 + v_KASIRISOKU) / 1000000;
			v_Risoku := TRUNC(v_Risoku);
		ELSE
			--期間日数とひとつの利息率で計算を行なう
			v_GetRiritu  := v_StartRiritu;															--利率を取得する
			v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--利率を取得する

			v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--利息集計期間

			--利息の計算
			IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
				v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
			ELSE
				v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000) + v_KASIRISOKU) / 1000000);
			END IF;
		END IF;

		/* 金額算出 */
		--ローン種別＝１
		W_KINGAKU_A := v_KYUYOZANDAKA + v_RISOKU;
		IF	v_KYUYOHENSAI <= W_KINGAKU_A  THEN
			W_KINGAKU_A := v_KYUYOHENSAI;
		ELSE
			IF	W_KINGAKU_A <=  0   THEN
				W_KINGAKU_A := 0;
			END IF;
		END IF;

		/*今回の給与控除後残高*/
		V_RES := v_KYUYOZANDAKA - (W_KINGAKU_A - v_RISOKU);

	ELSE
		/*■証書■　社員融資台帳テーブル検索 */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT DISTINCT';
		StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
		StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
		StrSQL := StrSQL || ' QPA8_RIRITU,';
		StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
		StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
		StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
		StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
		StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
		StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
		StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
		StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA ';
		StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
		StrSQL := StrSQL || ' WHERE QPA8_KYUYOZANDAKA <> 0';
		StrSQL := StrSQL || '   AND QPA8_PRMSYAINCD1 = :PRMSYAINCD1';
		StrSQL := StrSQL || '   AND QPA8_PRMSYAINCD2 = :PRMSYAINCD2';
		StrSQL := StrSQL || '   AND TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD'') = :SyousyoYMD';
		StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
		StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
		/* 動的カーソルのオープン */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQLの解析 */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* 入力変数をバインドする */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':PRMSYAINCD1', InSyainCD1);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':PRMSYAINCD2', InSyainCD2);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyousyoYMD', InYushiYMD);
		/* 出力変数のバインド */
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMYUSIYMD    );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_GENDOGAKU     );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_RIRITU        );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_HENSAITUKISU  );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAIALL);
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_KYUYOHENSAI   );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SYOYOHENSAIALL);
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOHENSAI    );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KANSAIYMD      );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KYUYOZANDAKA );
		DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SYOYOZANDAKA );
		/* SQLの実行 */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

		LOOP
			IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			  EXIT;
			END IF;
			/* カラム値を変数へ格納 */
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMYUSIYMD    );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_GENDOGAKU     );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_RIRITU        );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_HENSAITUKISU  );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAIALL);
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_KYUYOHENSAI   );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SYOYOHENSAIALL);
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOHENSAI   );
			DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KANSAIYMD     );
			DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KYUYOZANDAKA  );
			DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SYOYOZANDAKA  );

			/* 10/24 ADD 利率計算修正 */
			v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;

			/* 利息計算 */
			v_Risoku  := 0;     --利息

			/* [給与返済額総額]=[給与残高]の場合 */
			IF  v_KYUYOHENSAIALL = v_KYUYOZANDAKA THEN
				/*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
				IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
					IF	SUBSTR(TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),7,2) >= '11' THEN
						v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 30 / 12 / 3000);
					ELSE
						v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 45 / 12 / 3000);
					END IF;
				ELSE
	---				v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);           -- 10/24 UPD
					IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                                                               -- 10/24 UPD
						v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);          -- 10/24 UPD
					ELSE                                                                                                                        -- 10/24 UPD
						v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU2 * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)));                 -- 10/24 UPD
					END IF;                                                                                                                     -- 10/24 UPD
				END IF;

			/* [給与返済額総額]<>[給与残高]の場合 */
			ELSE
				/*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
				IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
					v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU / 1200);
				ELSE
					v_WorkYMD := TO_CHAR(TO_DATE((SUBSTR(InStrYMD,1,6) || '01'),'YYYYMMDD') - 1,'YYYYMMDD');
					v_WorkYMD := SUBSTR(v_WorkYMD,1,6) || '25';
					v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_WorkYMD,'YYYYMMDD');
	---				v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                        -- 10/24 UPD
					IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                           -- 10/24 UPD
						v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                    -- 10/24 UPD
					ELSE                                                                                    -- 10/24 UPD
						v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU2 * v_Kikan);                           -- 10/24 UPD
					END IF;                                                                                 -- 10/24 UPD
				END IF;
			END IF;
		END LOOP;

		--ローン種別＝２
		IF	v_KYUYOHENSAI <= v_KYUYOZANDAKA THEN
			W_KINGAKU_A := v_KYUYOHENSAI;
		ELSE
			W_KINGAKU_A := v_KYUYOZANDAKA + v_Risoku;
		END IF;

		v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - (W_KINGAKU_A - v_Risoku);

		V_RES := v_ZANDAKA;
		/* カーソルのクローズ */
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
	END IF;

	/*使用したワークテーブルの削除*/
	DELETE	FROM	QPAS_KGCW
			WHERE	QPAS_USERID		= InStrUserID
			AND		QPAS_COMPUTERNM	= InStrComputerNM;

	DELETE	FROM	QPAU_KojoZanW
			WHERE	QPAU_USERID		= InStrUserID
			AND		QPAU_COMPUTERNM	= InStrComputerNM;

	RETURN V_RES;

EXCEPTION
	WHEN  OTHERS  THEN
		IF	DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		END IF;

		IF	DBMS_SQL.IS_OPEN (v_CursorID2) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
		END IF;

		/* ロールバック */
		ROLLBACK;
		RAISE ;

END QPAP_CEnt140NEXTKYUYOZAN;

/* Yasui@NBC 2005.05.06 控除作成不備 ==> */
/****************************************************************************************/
/* モジュール名  ：QPAP_CEnt140GetBONUSDayFnc                                           */
/* 機能          ：12月26日～31日の賞与日に対して、年度をもどすようにする。             */
/* InStrYMD      ：控除実行日(yyyymmdd)                                                 */
/* BONUSYMD      ：賞与日(mmdd)                                                         */
/****************************************************************************************/
FUNCTION QPAP_CEnt140GetBONUSDayFnc(
   InStrYMD  IN CHAR,
   BONUSYMD  IN CHAR) RETURN CHAR IS

   rBONUSYMD CHAR(8);
BEGIN
   IF  SUBSTR(InStrYMD,5,2) = '01'
   AND TO_NUMBER(BONUSYMD) >= 1226 AND TO_NUMBER(BONUSYMD) <= 1231 THEN
      rBONUSYMD := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) -1) || BONUSYMD;
   ELSE
      rBONUSYMD := SUBSTR(InStrYMD,1,4) || BONUSYMD;
   END IF;
   RETURN rBONUSYMD;
END QPAP_CEnt140GetBONUSDayFnc;
/* Yasui@NBC 2005.05.06 控除作成不備 <== */

END QPAP_Cent140PkG;
/***END of LINE****************************************************************/
/
--SHOW ERROR
SHOW ERRORS;
