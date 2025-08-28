CREATE OR REPLACE PACKAGE  QPAP_CEnt030PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt030PkG                                                                                */
/* 機能          ：小口融資計算書出力                                                                             */
/* 作成日        ：2001/07/07                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/* 修正履歴  案件番号  日付  修正者       備考                                                                    */
/* 00001    0811051 2009/08/28 NBC ISHIDA ①「小口融資計算書」の給与控除の利息/元金は、                           */
/*                                           前回の給与控除後の残高を元に算出しているので、                       */
/*                                           ２６日～末日の入金が発生する場合、正しい利息計算がされず、           */
/*                                           残高がずれてくるのでずれないようにする。                             */
/*                                                                                                                */
/*                                        ② 控除中止指示がされ、給与控除がされなかった場合でも、                 */
/*                                          「小口融資計算書」上では、全ての給与控除/賞与控除が                   */
/*                                           控除されたように表示されるので、                                     */
/*                                           控除中止された場合は、表示されないようにする。                       */
/*                                                                                                                */
/*                                        ③ 同日に同額の貸付を行った場合や、                                     */
/*                                           ２５日の給与控除日に貸付を行った場合等、                             */
/*                                           同じ日付に動きがあった場合、「小口融資計算書」の横計があわない場合が */
/*                                           あるので合うようにする。                                             */
/*                                                                                                                */
/* 00002    0811051 2009/11/06 NBC ISHIDA ①ＯＰ:毎月1日～5日での計算書は給与控除が表示されない為、               */
/*                                          シミュレーションで計算する。　                                        */
/*                                                                                                                */
/*                                        ②控除中止フラグが立っている時は、シミュレーションでの計算をしない。    */
/*                                                                                                                */
/*                                        ③精算時の利息計算を最終給与控除日から計算するようにする。              */
/*                                          ＯＰ月の給与控除が時は、ＯＰ前月の給与控除日から計算する。            */
/*                                                                                                                */
/******************************************************************************************************************/
/*                                         コメント記述方法変更                                                   */
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100129  TR0911-003       11月新規貸付の計算書を11月中に12月25日精算で出力すると、                            */
/*                            12月給与控除行と精算行の金額が誤って表示される。                                    */
/*                           （12月給与控除の利息が貸付日～11月25日の利息、元金0円と表示される                    */
/*                            正しくは利息は貸付日～12月25日の利息、元金は返済金額－利息）                        */
/*                                                                                                                */
/* 20100225  0908047          グループ社員証書貸付帳票見直し2次                                                   */
/*                            ①分解・分解戻し分を計算書に反映させて表示させる                                    */
/*                            ②入金利息を表示させる                                                              */
/*                                                                                                                */
/* 20100319  TR1003-002       小口融資計算書画面の入金返済額表示誤り                                              */
/*                            入金行の返済金額を元金＋利息に修正する                                              */
/*                                                                                                                */
/*	20100827	1004091		IMZ SHIBUTANI	振込先情報の取得方法変更への対応									*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typOtYMDAry IS TABLE OF QPAI_KGCKEISANW.QPAI_YMD%TYPE                --年月日
    INDEX BY BINARY_INTEGER;
  TYPE typOtKBNAry IS TABLE OF QPAI_KGCKEISANW.QPAI_KBN%TYPE                --区分
    INDEX BY BINARY_INTEGER;
  TYPE typOtYusiKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_YUSIKINGAKU%TYPE    --融資金額
    INDEX BY BINARY_INTEGER;
  TYPE typOtHenKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_HENSAIKINGAKU%TYPE   --返済金額
    INDEX BY BINARY_INTEGER;
  TYPE typOtGanKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_GANKIN%TYPE          --元金
    INDEX BY BINARY_INTEGER;
  TYPE typOtRisokuAry IS TABLE OF QPAI_KGCKEISANW.QPAI_RISOKU%TYPE          --利息
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAI_KGCKEISANW.QPAI_ZANDAKA%TYPE        --残高
    INDEX BY BINARY_INTEGER;

/* 残高更新日取得 */
PROCEDURE QPAP_CEnt030GetZanYMD (
   OtStrZanYMD          OUT   CHAR);

/* 社員属性の表示 */
PROCEDURE QPAP_Cent030SelSyainZoku (
  InStrPRMSyainCD1   IN       QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2   IN       QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  OtStrSimeiKana        OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,    --氏名カナ
  OtStrSimeiKanji       OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE,   --氏名漢字
  OtStrMiseCD           OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,       --所属店コード
  OtStrMiseName         OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,        --店名称
  OtStrTozaiKBN         OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,     --東西区分
  OtStrBumonCD          OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,      --所属部門コード
  OtStrBumonName        OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,      --部門名称
  OtStrSikakuCD         OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,     --資格コード
  OtStrTokyuCD          OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,      --等級コード
  OtStrBornYMD          OUT   VARCHAR2,                           --生年月日
  OtStrSonzaiFlg        OUT   VARCHAR2);                          --存在Flg (会員の存在 Check)

/* 小口融資計算書データ取得 */
PROCEDURE QPAP_CEnt030SelList (
   InStrSyainCD      IN       QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE   --抽出キー  社員コード
  ,InStrSeiKBN       IN       CHAR                                --          精算区分
  ,InStrSeiYMD       IN       CHAR                                --          精算年月日
  ,InStrStrYMD1      IN       CHAR                                --          処理開始日１
  ,InStrStrYMD2      IN       CHAR                                --          処理開始日２
  ,InStrStrYMD3      IN       CHAR                                --          処理開始日３
  ,InStrEndYMD       IN       CHAR                                --          処理終了日
  ,InStrShoYYYY      IN       CHAR                                --          処理年度
  ,InNumMaxRec       IN       NUMBER                              --最大配列格納件数
  ,IoNumCursor       IN OUT   NUMBER                              --カーソルＩＤ
  ,OtNumRecCount        OUT   NUMBER                              --総検索件数
  ,OtNumAryCount        OUT   NUMBER                              --配列格納件数
  ,OtStrEndFlg          OUT   VARCHAR2                            --検索終了フラグ
  ,OtStrYMD             OUT   typOtYMDAry                         --年月日
  ,OtStrKBN             OUT   typOtKBNAry                         --区分
  ,OtNumYusiKin         OUT   typOtYusiKinAry                     --融資金額
  ,OtNumHenKin          OUT   typOtHenKinAry                      --返済金額
  ,OtNumGanKin          OUT   typOtGanKinAry                      --元金
  ,OtNumRisoku          OUT   typOtRisokuAry                      --利息
  ,OtStrZandaka         OUT   typOtZandakaAry                     --残高
/* ADD 20100225 0908047 NBC ISHIDA START */
  ,OtNumGanKinMod       OUT   NUMBER                              --分解戻し元金
  ,OtNumRisokuMod       OUT   NUMBER                              --分解戻し利息
/* ADD 20100225 0908047 NBC ISHIDA END */
  ,InStrUserID       IN       QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM   IN       QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --コンピュータ名

/* 小口融資返済額取得 */
FUNCTION QPAP_CEnt030GetHensaigaku(
   InStrSyainCD      IN       QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrKBN          IN       CHAR
  ,InStrYM           IN       CHAR) RETURN NUMBER;

/* 小口融資返済額変更日取得 */
FUNCTION QPAP_CEnt030GetHensaiYMD(
   InStrSyainCD      IN      QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrYM           IN      CHAR) RETURN CHAR;

/* 小口融資利率取得 */
FUNCTION QPAP_CEnt030GetRiritu(
   InStrYMD          IN      CHAR) RETURN NUMBER;

/* 小口融資利率変更日取得 */
FUNCTION QPAP_CEnt030GetRirituYMD(
   InStrYMD          IN      CHAR) RETURN CHAR;

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt030DelWorkTbl(
   InStrUserID       IN     VARCHAR2,                             --ユーザーＩＤ
   InStrComputerNM   IN     VARCHAR2);                            --コンピュータ名

END QPAP_CEnt030PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  ２  ボディー                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt030PkG IS

  TYPE typeRisokuAry IS TABLE OF NUMBER                          --利息
    INDEX BY BINARY_INTEGER;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030GetZanYMD                                                                          */
/* 機能          ：残高更新日取得                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt030GetZanYMD (
    OtStrZanYMD    OUT   CHAR) IS

BEGIN

    SELECT    MAX(TO_CHAR(QPAT_YMD,'YYYYMMDD'))
      INTO    OtStrZanYMD
      FROM    QPAT_ZANYMD;

EXCEPTION
    WHEN  OTHERS  THEN
        RAISE ;
END QPAP_CEnt030GetZanYMD;

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent030SelSyainZoku                                             */
/* 機能      　　：社員属性の表示                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent030SelSyainZoku (
  InStrPRMSyainCD1   IN       QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2   IN       QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  OtStrSimeiKana        OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,    --氏名カナ
  OtStrSimeiKanji       OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE,   --氏名漢字
  OtStrMiseCD           OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,       --所属店コード
  OtStrMiseName         OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,        --店名称
  OtStrTozaiKBN         OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,     --東西区分
  OtStrBumonCD          OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,      --所属部門コード
  OtStrBumonName        OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,      --部門名称
  OtStrSikakuCD         OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,     --資格コード
  OtStrTokyuCD          OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,      --等級コード
  OtStrBornYMD          OUT   VARCHAR2,                           --生年月日
  OtStrSonzaiFlg        OUT   VARCHAR2) IS                        --存在Flg (会員の存在 Check)

  /* 処理固有の変数 */

BEGIN
  /* 出力パラメータのクリア */
  OtStrSimeiKana      := ' ';
  OtStrSimeiKanji     := ' ';
  OtStrMiseCD         := ' ';
  OtStrMiseName       := ' ';
  OtStrTozaiKBN       := ' ';
  OtStrBumonCD        := ' ';
  OtStrBumonName      := ' ';
  OtStrSikakuCD       := ' ';
  OtStrTokyuCD        := ' ';
  OtStrBornYMD        := ' ';
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

END QPAP_Cent030SelSyainZoku;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030SelList                                                                            */
/* 機能          ：小口融資計算書データ取得                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt030SelList (
   InStrSyainCD      IN       QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE   --抽出キー  社員コード
  ,InStrSeiKBN       IN       CHAR                                --          精算区分
  ,InStrSeiYMD       IN       CHAR                                --          精算年月日
  ,InStrStrYMD1      IN       CHAR                                --          処理開始日１
  ,InStrStrYMD2      IN       CHAR                                --          処理開始日２
  ,InStrStrYMD3      IN       CHAR                                --          処理開始日３
  ,InStrEndYMD       IN       CHAR                                --          処理終了日
  ,InStrShoYYYY      IN       CHAR                                --          処理年度
  ,InNumMaxRec       IN       NUMBER                              --最大配列格納件数
  ,IoNumCursor       IN OUT   NUMBER                              --カーソルＩＤ
  ,OtNumRecCount        OUT   NUMBER                              --総検索件数
  ,OtNumAryCount        OUT   NUMBER                              --配列格納件数
  ,OtStrEndFlg          OUT   VARCHAR2                            --検索終了フラグ
  ,OtStrYMD             OUT   typOtYMDAry                         --年月日
  ,OtStrKBN             OUT   typOtKBNAry                         --区分
  ,OtNumYusiKin         OUT   typOtYusiKinAry                     --融資金額
  ,OtNumHenKin          OUT   typOtHenKinAry                      --返済金額
  ,OtNumGanKin          OUT   typOtGanKinAry                      --元金
  ,OtNumRisoku          OUT   typOtRisokuAry                      --利息
  ,OtStrZandaka         OUT   typOtZandakaAry                     --残高
/* ADD 20100225 0908047 NBC ISHIDA START */
  ,OtNumGanKinMod       OUT   NUMBER                              --分解戻し元金
  ,OtNumRisokuMod       OUT   NUMBER                              --分解戻し利息
/* ADD 20100225 0908047 NBC ISHIDA END */
  ,InStrUserID       IN       QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM   IN       QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --コンピュータ名

  /* 処理固有の変数 */
  StrSQL                      VARCHAR2(1000);
  v_CursorID                  NUMBER := 0;
  v_NumCount                  NUMBER;
  v_Dummy                     INTEGER;
  NumIdx                      NUMBER;
/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--  v_Zaimu                     QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE;
--  v_Syozai                    QPAB_JISYAM.QPAB_SYOZAICHI%TYPE;
--  v_Kaisya                    QPAB_JISYAM.QPAB_KAISYANM%TYPE;
--  v_Bank                      QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE;
--  v_KozaNo                    QPAB_JISYAM.QPAB_KOZANO%TYPE;
--  v_KozaNm                    QPAB_JISYAM.QPAB_KOZANM%TYPE;
	v_Zaimu						QPB9_FURIKOMISKM.QPB9_SYOZAICHI1%TYPE;
	v_Syozai					QPB9_FURIKOMISKM.QPB9_SYOZAICHI2%TYPE;
	v_Kaisya					QPB9_FURIKOMISKM.QPB9_KAISYANM%TYPE;
	v_Bank						QPB9_FURIKOMISKM.QPB9_FURIKOMIBK%TYPE;
	v_KozaNo					QPB9_FURIKOMISKM.QPB9_KOZANO%TYPE;
	v_KozaNm					QPB9_FURIKOMISKM.QPB9_KOZANM%TYPE;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */
  v_SimeiKanji                QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseNM                    QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BonusYMD1                 CHAR(8);
  v_BonusYMD2                 CHAR(8);
  w_BonusYMD1                 CHAR(4);
  w_BonusYMD2                 CHAR(4);
  v_KeiyakuRiritu             NUMBER;
  v_NextRirituYMD             CHAR(8);
  v_KyuyoHensai               NUMBER;
  v_SyoyoHensai               NUMBER;
  v_NextHensaiYMD             CHAR(8);
  w_YMD                       CHAR(8);
  w_YMD1                      CHAR(8);
  w_YMD2                      CHAR(8);
  w_IntSyoFLG                 CHAR(1);
  v_BonusFLG                  CHAR(1);
  v_SihaFLG                   BOOLEAN;
  w_IDX                       NUMBER := 0;
  w_IDX1                      NUMBER := 0;
  w_IDX2                      NUMBER := 0;
  w_IDX3                      NUMBER := 0;
  w_IDX4                      NUMBER := 0;
  w_IDX5                      NUMBER := 0;
  v_Zandaka                   NUMBER;
  v_ZenYMD                    CHAR(8);
  v_ZenZandaka                NUMBER;
  w_ZenYMD                    CHAR(8);
  w_KonYMD                    CHAR(8);
  w_Zan                       NUMBER;
  w_GenZan                    NUMBER;
  w_ZenZan                    NUMBER;
  s_Hensai                    NUMBER;
  v_DateCnt                   NUMBER;
  w_Risoku                    NUMBER;
  v_Hensai                    NUMBER;
  v_KBN                       CHAR(1);
  v_YMD                       CHAR(8);
  v_Kingaku                   NUMBER;
  k_Date                      CHAR(8);
  t_Date                      CHAR(8);
  RisokuAry                   typeRisokuAry;
  z_YMD                       QPAI_KGCKEISANW.QPAI_YMD%TYPE;
  z_KBN                       QPAI_KGCKEISANW.QPAI_KBN%TYPE;
  z_YusiKingaku               QPAI_KGCKEISANW.QPAI_YUSIKINGAKU%TYPE;
  z_HensaiKingaku             QPAI_KGCKEISANW.QPAI_HENSAIKINGAKU%TYPE;
  z_Gankin                    QPAI_KGCKEISANW.QPAI_GANKIN%TYPE;
  z_Risoku                    QPAI_KGCKEISANW.QPAI_RISOKU%TYPE;
  z_Zandaka                   QPAI_KGCKEISANW.QPAI_ZANDAKA%TYPE;

  v_SysCng2                   CHAR(8) := '20011101';          -- 10/24 ADD
  v_SysCng3                   CHAR(8) := '20011201';          -- 11/01 ADD
  /* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
  v_SysCng4                   CHAR(8) := '20080301';
  /* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
  v_KeiyakuRiritu2            NUMBER;                         -- 10/24 ADD

  v_NyuYMD_N                  CHAR(8);      --入金用          -- 11/01 ADD

--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応
  v_ZanZeroFlg                CHAR(1):= '0'; --0:OFF 1ON:     -- 12/05 ADD
--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応　ここまで

--2003/01/23 利息計算修正
	W_CNT					NUMBER;
	W_ENDLOOPCNT			NUMBER;
	v_GetRiritu				NUMBER;
	v_GetRiritu2			NUMBER;
	v_STARTRiritu			NUMBER;
	v_ENDRiritu				NUMBER;
	strworkwork				NUMBER;

	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
	v_Kangaku				QPAA_KOJOT.QPAA_KANGAKU%TYPE;
	v_RIsoku				QPAA_KOJOT.QPAA_RISOKU%TYPE;
	v_Kojogaku				QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
	v_QPAI_SEQ				NUMBER;							--計算書表示順番用シーケンス
	w_QPAI_SEQ				CHAR(3);
	v_SysDate				CHAR(8);
	v_KojoFlg 				BOOLEAN;						--控除データ判定用フラグ
	v_Max_Syouyo			QSA2_SCODET.QSA2_MEI%TYPE;		--最新賞与控除年月
	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA STERT */
	v_kojocyushiFlg         CHAR(1);                        --控除中止フラグ
	v_TogetuKojoFlg         BOOLEAN := False;               --当月給与控除判定フラグ
	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

	/*ADD 20100129 TR0911-003 NBC ISHIDA START */
	w_TRisoku				NUMBER := 0;                    --当月利息
	w_YRisoku				NUMBER := 0;                    --翌月利息
	w_KRisoku				NUMBER := 0;                    --繰越利息
	/*ADD 20100129 TR0911-003 NBC ISHIDA END */

/* ADD 20100225 0908047 NBC ISHIDA START */
	v_NyuRisoku             NUMBER := 0;                    --入金時の利息
	v_CursorID2             NUMBER := 0;
	v_ModFlg                CHAR(1);                        --0:分解戻し、1:分解
	v_GanKinMod             NUMBER := 0;                    --分解戻し元金
	v_RisokuMod             NUMBER := 0;                    --分解戻し利息
	v_KBN2                  CHAR(4);
	v_BeforeBunkaiYMD       CHAR(8):= ' ';                  --前回QPAIにINSERT処理した分解日
/* ADD 20100225 0908047 NBC ISHIDA END */


BEGIN

/* ----- ＳＴＥＰ１ ＷＴデータ作成 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    OtstrEndFlg   := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount    := 0;
    w_IDX         := 1;

    /* 利息配列の初期化 */
    LOOP
      IF w_IDX > 80 THEN
        EXIT;
      END IF;
      RisokuAry(w_IDX) := 0;
      w_IDX := w_IDX + 1;
    END LOOP;

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--	振込先情報の取得先変更
--	※自社マスタ→振込先マスタ
--    /* 自社マスタ検索 */
--    BEGIN
--        SELECT
--            NVL(QPAB_ZAIMUKYOKUCD,' '),
--            NVL(QPAB_SYOZAICHI,' '),
--            NVL(QPAB_KAISYANM,' '),
--            NVL(QPAB_FURIKOMIBK,' '),
--            NVL(QPAB_KOZANO,' '),
--            NVL(QPAB_KOZANM,' ')
--        INTO
--            v_Zaimu,
--            v_Syozai,
--            v_Kaisya,
--            v_Bank,
--            v_KozaNo,
--            v_KozaNm
--        FROM QPAB_JISYAM
--        WHERE QPAB_PRMKAISYACD = '01';
--    EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            v_Zaimu   := ' ';
--            v_Syozai  := ' ';
--            v_Kaisya  := ' ';
--            v_Bank    := ' ';
--            v_KozaNo  := ' ';
--            v_KozaNm  := ' ';
--        WHEN OTHERS THEN
--            RAISE;
--    END;

	BEGIN
		SELECT
			 NVL(QPB9_SYOZAICHI1, ' ')
			,NVL(QPB9_SYOZAICHI2, ' ')
			,NVL(QPB9_KAISYANM, ' ')
			,NVL(QPB9_FURIKOMIBK, ' ')
			,NVL(QPB9_KOZANO, ' ')
			,NVL(QPB9_KOZANM, ' ')
		INTO
			 v_Zaimu
			,v_Syozai
			,v_Kaisya
			,v_Bank
			,v_KozaNo
			,v_KozaNm
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
			AND	QPAC_PRMSYAINCD2	= InStrSyainCD
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
			v_Bank    := ' ';
			v_KozaNo  := ' ';
			v_KozaNm  := ' ';
		WHEN OTHERS THEN
			RAISE;
	END;

/* MOD 20100827 1004091 IMZ SHIBUTANI END */

--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT';
--    StrSQL := StrSQL || ' NVL(QPAB_ZAIMUKYOKUCD,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_SYOZAICHI,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KAISYANM,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_FURIKOMIBK,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KOZANO,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KOZANM,'' '')';
--    StrSQL := StrSQL || ' FROM QPAB_JISYAM';
--    StrSQL := StrSQL || ' WHERE QPAB_PRMKAISYACD = :Code';
    /* 動的カーソルのオープン */
--    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
--    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', '01');
    /* 出力変数のバインド */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zaimu,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Syozai,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisya,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Bank,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_KozaNo,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_KozaNm,40);
    /* SQLの実行 */
--    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
--    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zaimu);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Syozai);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisya);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Bank);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_KozaNo);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_KozaNm);
--    END IF;
    /* カーソルのクローズ */
--    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 社員マスタ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAC_SYAINM.QPAC_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_PRMSYAINCD2 = :Code2';
--    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_BonusYMD2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_BonusYMD2);
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 賞与支給日を当年年月日に変更 */
    v_BonusYMD1 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD1));
    v_BonusYMD2 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD2));
    IF TO_DATE(v_BonusYMD1,'YYYYMMDD') > TO_DATE(v_BonusYMD2,'YYYYMMDD') THEN
        v_BonusYMD1 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD2));
        v_BonusYMD2 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD1));
    END IF;

    /* 契約利率 */
    w_YMD := TO_CHAR(TO_DATE(InStrStrYMD2,'YYYYMMDD') + 1,'YYYYMMDD');
    v_KeiyakuRiritu  :=  QPAP_CEnt030GetRiritu(w_YMD);
    v_KeiyakuRiritu  :=  v_KeiyakuRiritu / 100;
    v_KeiyakuRiritu2 :=  TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;    -- 10/24 UPD

    /* 次回利率変更日 */
    v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(w_YMD);
    /* 給与返済金額 */
    v_KyuyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'1',SUBSTR(InStrStrYMD1,1,6));
    /* 賞与返済金額 */
    v_SyoyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'2',SUBSTR(InStrStrYMD1,1,6));
    /* 次回返済額変更日 */
    v_NextHensaiYMD := QPAP_CEnt030GetHensaiYMD(InStrSyainCD,SUBSTR(InStrStrYMD1,1,6));

    IF TO_NUMBER(SUBSTR(v_BonusYMD1,7,2)) > 25 OR TO_NUMBER(SUBSTR(v_BonusYMD2,7,2)) > 25 THEN
        w_IntSyoFLG := '0';
    ELSE
        w_IntSyoFLG := '1';
    END IF;

   /* 11/01 ADD 入金範囲指定用に追加*/
    v_NyuYMD_N := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD2,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01';

	/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
	/* 最新賞与月の取得 */
	/* 最新賞与控除年月の取得 */
    SELECT    NVL(QSA2_MEI,'000000')
      INTO    v_Max_Syouyo
      FROM    QSA2_SCODET
     WHERE    QSA2_PRMCODEKBN  = 'DP3'
       AND    QSA2_PRMCODENO   = '0000';

	/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
	/* 控除中止フラグの取得                                      */

	SELECT
		NVL(QPA1_KOJOCYUSHIFLG,'0')
	INTO
		v_kojocyushiFlg
	FROM  QPA1_KGCDAICYOT
	WHERE QPA1_PRMSYAINCD1 = ' '
	AND   QPA1_PRMSYAINCD2 = InStrSyainCD;

	/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

  /**************************/
  /* ＷＴテーブルの初期化   */
  /**************************/
    DELETE FROM QPAS_KGCW
        WHERE QPAS_USERID = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAI_KGCKEISANW
        WHERE QPAI_USERID = InStrUserID
        AND QPAI_COMPUTERNM = InStrComputerNM;

  /**************************/
  /* 小口退避テーブルに退避 */
  /**************************/
    /* 貸付 */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  ' ',
        NVL(QPA6_SYAINCD,' '),
        '1',
        TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
        NVL(QPA6_KINGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA6_KGCKASITUKET
      WHERE QPA6_SYAINCD = InStrSyainCD
      AND (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') BETWEEN InStrStrYMD2 AND InStrEndYMD)
      AND (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');

    /* 入金 */
    IF TO_DATE(InStrStrYMD1,'YYYYMMDD') - 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN               -- 11/01 UPD
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
          SELECT  NVL(QPA5_SYAINCD1,' '),
            NVL(QPA5_SYAINCD2,' '),
            '2',
            TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
            NVL(QPA5_NYUKINGAKU,0),
            InStrUserID,
            InStrComputerNM
          FROM QPA5_KGCNYUKINT
          WHERE QPA5_SYAINCD1 = ' '
          AND QPA5_SYAINCD2 = InStrSyainCD
          AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') BETWEEN v_NyuYMD_N AND InStrEndYMD;
    ELSE
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
          SELECT  NVL(QPA5_SYAINCD1,' '),
            NVL(QPA5_SYAINCD2,' '),
            '2',
            TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
            NVL(QPA5_NYUKINGAKU,0),
            InStrUserID,
            InStrComputerNM
          FROM QPA5_KGCNYUKINT
          WHERE QPA5_SYAINCD1 = ' '
          AND QPA5_SYAINCD2 = InStrSyainCD
          AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') BETWEEN InStrStrYMD2 AND InStrEndYMD;
    END IF;

    w_YMD1 := SUBSTR(InStrStrYMD1,1,6) || '25';
--    w_YMD2 := InStrSeiYMD;                       -- 11/02 UPD
    w_YMD2 := InStrEndYMD;                         -- 11/02 UPD
    LOOP
--     IF TO_DATE(w_YMD1) > TO_DATE(w_YMD2) THEN                               -- 11/02 UPD
      IF TO_NUMBER(SUBSTR(w_YMD1,1,6)) > TO_NUMBER(SUBSTR(w_YMD2,1,6)) THEN    -- 11/02 UPD
          EXIT;
      END IF;

      /* 返済額の参照 */
      IF v_NextHensaiYMD <> 'NOTHIN' then
          IF TO_NUMBER(v_NextHensaiYMD) <= TO_NUMBER(SUBSTR(w_YMD1,1,6)) THEN
              /* 給与返済金額 */
              v_KyuyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'1',SUBSTR(w_YMD1,1,6));
              /* 賞与返済金額 */
              v_SyoyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'2',SUBSTR(w_YMD1,1,6));
              /* 次回利率変更日 */
              v_NextHensaiYMD := QPAP_CEnt030GetHensaiYMD(InStrSyainCD,SUBSTR(w_YMD1,1,6));
          END IF;
      END IF;

      /* 給与返済額 */
      INSERT INTO QPAS_KGCW
        (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      VALUES
        (' ',InStrSyainCD,'3',w_YMD1,v_KyuyoHensai,InStrUserID,InStrComputerNM);

      /* 賞与返済額 */
      IF TO_NUMBER(SUBSTR(w_YMD1,5,2)) = TO_NUMBER(SUBSTR(v_BonusYMD1,5,2)) THEN
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
        VALUES
          (' ',InStrSyainCD,'4',SUBSTR(w_YMD1,1,4) || SUBSTR(v_BonusYMD1,5,4),v_SyoyoHensai,InStrUserID,InStrComputerNM);
      END IF;
      IF TO_NUMBER(SUBSTR(w_YMD1,5,2)) = TO_NUMBER(SUBSTR(v_BonusYMD2,5,2)) THEN
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
        VALUES
          (' ',InStrSyainCD,'4',SUBSTR(w_YMD1,1,4) || SUBSTR(v_BonusYMD2,5,4),v_SyoyoHensai,InStrUserID,InStrComputerNM);
      END IF;

      w_YMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(w_YMD1,'YYYYMMDD'),1),'YYYYMMDD');

    END LOOP;

/* ADD 20100225 0908047 NBC ISHIDA START */
    /* 分解 */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT NVL(QPB2_SYAINCD1,' '),
        NVL(QPB2_SYAINCD2,' '),
        '5',
        TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD'),
        '0',
        InStrUserID,
        InStrComputerNM
      FROM QPB2_BUNKAI
      WHERE QPB2_SYAINCD1  = ' '
      AND   QPB2_SYAINCD2  = InStrSyainCD
      AND   QPB2_SYUBETU   = '1'
      AND   QPB2_BUNMODFLG = '1'
      AND  (TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD') >= InStrStrYMD1 AND TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD') <= InStrEndYMD);
/* ADD 20100225 0908047 NBC ISHIDA END */


    /* コミット */
    COMMIT;

  /****************************/
  /* 繰越利息の取得           */
  /****************************/

    /* 給与繰越金額参照 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '3');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrStrYMD3);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zandaka);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    IF  DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zandaka);
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    IF v_Zandaka IS NULL THEN
        v_Zandaka := 0;
    END IF;

    /* 処理開始日３の前月を求める */
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),-1),'YYYYMMDD');

    /* 給与繰越前月金額参照 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '3');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZenYMD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZenZandaka);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    IF  DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZenZandaka);
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    IF v_ZenZandaka IS NULL THEN
        v_ZenZandaka := 0;
    END IF;

    w_ZenYMD := InStrStrYMD3;   --前回給与日
    w_Zan    := v_Zandaka;      --残高
    w_GenZan := v_Zandaka;      --現残高
    w_ZenZan :=  v_ZenZandaka;  --前月残高
    s_Hensai := 0;              --返済額

    w_IDX1 := 1;
    w_IDX2 := 0;

    /* 小口退避テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAS_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAS_USERID = :Usr';
    StrSQL := StrSQL || ' AND QPAS_COMPUTERNM = :Cmp';
--**2003/03/06 修正**
    StrSQL := StrSQL || ' AND QPAS_YMD < :YMD';
--    StrSQL := StrSQL || ' AND QPAS_YMD <= :YMD';
--**2003/03/06 修正**

    StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN,QPAS_KINGAKU desc';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrStrYMD1);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
            EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
        /* 利率の参照 */
        IF v_NextRirituYMD <> 'NOTHING1' THEN
            IF TO_DATE(v_NextRirituYMD,'YYYYMMDD') <= TO_DATE(v_YMD,'YYYYMMDD') THEN
                /* 契約利率 */
                v_KeiyakuRiritu  := QPAP_CEnt030GetRiritu(v_YMD);
                v_KeiyakuRiritu  := v_KeiyakuRiritu / 100;
                v_KeiyakuRiritu2 := TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;         -- 10/24 UPD
                /* 次回利率変更日 */
                v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(v_YMD);
            END IF;
        END IF;

		/* 貸付 */
		w_Risoku := 0;
		IF v_KBN = '1' THEN
			IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_YMD,'YYYYMMDD') THEN
				v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
				IF v_ZenZandaka + v_Kingaku > 0 THEN
					IF v_ZenZandaka >= 0 THEN
						--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;	--経過日数
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);										--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);								--集計終了日の利率を取得
						IF v_STARTRiritu <> v_ENDRiritu THEN												--利率違う
							W_CNT        := TO_NUMBER(v_YMD);												--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);										--集計終了日

							--★2003/01/23★
							--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);								--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;											--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;				--新利率を取得する

								IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + v_Kingaku * v_GetRiritu2 * 1000000;					--新
								ELSE
									w_Risoku := w_Risoku + (v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;			--旧
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
							END LOOP;

							w_Risoku := TRUNC(w_Risoku);
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--従来の計算方法
	---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
							ELSE																						-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
							END IF;																						-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					ELSE
						--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;				--経過日数
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);											--集計終了日の利率を取得

						IF v_STARTRiritu <> v_ENDRiritu THEN															--利率違う
							W_CNT        := TO_NUMBER(v_YMD);															--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);													--集計終了日

							--★2003/01/23★
							--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);													--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;																--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;									--新利率を取得する

								IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + v_ZenZandaka) * v_GetRiritu2 * 1000000);			--新
								ELSE
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + v_ZenZandaka) * v_GetRiritu / 365 * 1000) * 1000;	--旧
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--従来の処理
							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := TRUNC((v_Kingaku + v_ZenZandaka) * v_KeiyakuRiritu2 * v_DateCnt * 1000000);
							ELSE
								w_Risoku := TRUNC((v_Kingaku + v_ZenZandaka) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;
							END IF;
						END IF;
					END IF;
				END IF;
				v_ZenZandaka := v_ZenZandaka + v_Kingaku;
				w_IDX4 := 1;
			ELSE
				t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),1),'YYYYMMDD');
				v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
				IF w_GenZan + v_Kingaku > 0 THEN
					IF w_GenZan >= 0 THEN
--						v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;						--経過日数

						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);													--集計終了日の利率を取得

						IF v_STARTRiritu <> v_ENDRiritu THEN															--利率違う
							W_CNT        := TO_NUMBER(v_YMD);															--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(t_Date);															--集計終了日
							--★2003/01/23★
							--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;														--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;							--新利率を取得する

								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--従来の処理
	---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN							-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
							ELSE																						-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
							END IF;																						-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					ELSE
						--★2003/01/23★
						--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
						--
						--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;						--経過日数
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);													--集計終了日の利率を取得

						IF v_STARTRiritu <> v_ENDRiritu THEN															--利率違う
							W_CNT        := TO_NUMBER(v_YMD);															--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(t_Date);															--集計終了日

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);												--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;															--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;								--新利率を取得する

								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + w_GenZan) * v_GetRiritu2 * 1000000);				--新
								ELSE
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + w_GenZan) * v_GetRiritu / 365 * 1000) * 1000;		--旧
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--ｶｳﾝﾄｱｯﾌﾟ

							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--従来の計算方法
	---						w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN									-- 10/24 UPD
								w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
							ELSE																								-- 10/24 UPD
								w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;	-- 10/24 UPD
							END IF;																								-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					END IF;
				END IF;
				w_GenZan := w_GenZan + v_Kingaku;
				w_IDX4 := 2;
			END IF;
		END IF;

		/* 入金 */
		IF v_KBN = '2' THEN
			IF TO_DATE(InStrStrYMD1,'YYYYMMDD') - 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN				-- 11/01 UPD
				v_DateCnt := TO_DATE(InStrStrYMD1,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') - 1;			-- 11/01 UPD
				--★2003/01/23★
				--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
				--
				--v_DateCnt := TO_DATE(InStrStrYMD1,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') - 1;			--経過日数
				v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);											--集計開始日の利率を取得
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD1 - 1);									--集計終了日の利率を取得

				IF v_STARTRiritu <> v_ENDRiritu THEN														--利率違う
					W_CNT        := TO_NUMBER(v_YMD) + 1;													--集計開始日
					W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD1) -1;													--集計終了日

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
						v_GetRiritu  := v_GetRiritu / 100;												--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--新利率を取得する

						w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
					END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(1) := RisokuAry(1) - w_Risoku;												-- 11/01 UPD
--					w_IDX4 := 1;
					w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				ELSE
					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 11/01 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(1) := RisokuAry(1) - w_Risoku;												-- 11/01 UPD
--					w_IDX4 := 1;
					w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				END IF;

			ELSE
				IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_YMD,'YYYYMMDD') THEN
					v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');					--経過日数
					v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);												--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);											--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(v_YMD) + 1;														--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);													--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;														--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);								--新
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;						--旧
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
						END LOOP;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--						RisokuAry(1) := RisokuAry(1) - w_Risoku;
--						w_IDX4 := 1;
						w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
					ELSE	--従来の処理
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
						IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
						ELSE																						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
						END IF;																						-- 10/24 UPD
	---					RisokuAry(1) := RisokuAry(1) + w_Risoku;													-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--						RisokuAry(1) := RisokuAry(1) - w_Risoku;													-- 10/24 UPD
--						w_IDX4 := 1;
						w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
					END IF;
				ELSE
					t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),1),'YYYYMMDD');
					v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');

					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);											--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);												--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(v_YMD) + 1;													--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(t_Date);														--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
							END IF;
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
						END LOOP;

					ELSE	--従来の計算方法
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;

---					RisokuAry(2) := RisokuAry(2) + w_Risoku;													-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(2) := RisokuAry(2) - w_Risoku;													-- 10/24 UPD
					w_GenZan := w_GenZan - v_Kingaku;
--					w_IDX4 := 2;
					w_YRisoku := w_YRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				END IF;
			END IF;
		END IF;
	END LOOP;

    /* 繰越金額のINSERT */
    INSERT INTO QPAI_KGCKEISANW VALUES (
         NVL(InStrSyainCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(InStrStrYMD1,' ')
		/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
		/* 1～3桁：シーケンス番号,4桁：区分 */
--        ,'1繰'
		,'0001'
		/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NVL(w_GenZan,0)
        ,NVL(InStrSeiKBN,' ')
        ,NVL(v_Zaimu,' ')
        ,NVL(v_Syozai,' ')
        ,NVL(v_Kaisya,' ')
        ,NVL(v_Bank,' ')
        ,NVL(v_KozaNo,' ')
        ,NVL(v_KozaNm,' ')
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));

    /****************************/
    /* 明細金額の取得           */
    /****************************/

    w_IDX1 := w_IDX1 + 1;
    w_IDX2 := w_IDX2 + 1;

	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
	v_QPAI_SEQ  := 1;
	SELECT TO_CHAR(sysdate,'YYYYMMDD') INTO v_SysDate FROM DUAL;
	/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

    /* 小口融資退避テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAS_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAS_USERID = :Usr';
    StrSQL := StrSQL || ' AND QPAS_COMPUTERNM = :Cmp';
--2003/03/06 修正
    StrSQL := StrSQL || ' AND (QPAS_YMD >= :YMD1';
--    StrSQL := StrSQL || ' AND (QPAS_YMD > :YMD1';
--2003/03/06 修正
    StrSQL := StrSQL || ' AND QPAS_YMD <= :YMD2)';

--2001/12/06 順序不正対応
    StrSQL := StrSQL || ' ORDER BY QPAS_YMD, QPAS_KBN, QPAS_KINGAKU desc';
--    StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';  --del
--2001/12/06 順序不正対応 ここまで

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrEndYMD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
            EXIT;
        END IF;

		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
		/* 計算書表示用シーケンス番号を文字列に変換 */
		w_QPAI_SEQ := TO_CHAR(v_QPAI_SEQ,'FM000');
		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
        /* 利率の参照 */
        IF v_NextRirituYMD <> 'NOTHING1' THEN
            IF TO_DATE(v_NextRirituYMD,'YYYYMMDD') <= TO_DATE(v_YMD,'YYYYMMDD') THEN
               /* 契約利率 */
               v_KeiyakuRiritu  := QPAP_CEnt030GetRiritu(v_YMD);
               v_KeiyakuRiritu  := v_KeiyakuRiritu / 100;
               v_KeiyakuRiritu2 := TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;   -- 10/24 UPD
               /* 次回利率変更日 */
               v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(v_YMD);
            END IF;
        END IF;

		/* 貸付 */
		IF v_KBN = '1' THEN
			IF w_Zan = 0 THEN
				IF w_IDX1 > 1 THEN
					w_IDX2 := w_IDX1 - 1;
				END IF;
			END IF;
			w_GenZan := w_GenZan + v_Kingaku;
			IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
				t_Date := SUBSTR(v_YMD,1,6) || '25';
				k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
			ELSE
				k_Date := SUBSTR(v_YMD,1,6) || '25';
			END IF;
			IF InStrSeiKBN = '0' THEN
				IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
					k_Date := InStrSeiYMD;
				END IF;
			END IF;
			t_Date := v_YMD;
			v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
			w_Risoku := 0;
			IF w_GenZan > 0 THEN
				IF w_GenZan >= v_Kingaku THEN
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date);												--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date);														--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);				--新
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;		--旧
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ

						END LOOP;
					ELSE	--従来の処理
---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;

				ELSE
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date);												--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date);														--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(w_GenZan * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(w_GenZan * v_GetRiritu / 365 * 1000) * 1000;
							END IF;
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
						END LOOP;

					ELSE	--従来の処理
	---					w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;
				END IF;
			END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
--                t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
--            END IF;
--            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 1;
--            RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) + w_Risoku;
            w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

            /* 明細のINSERT */
            INSERT INTO QPAI_KGCKEISANW VALUES (
                 NVL(InStrSyainCD,' ')
                ,NVL(v_MiseNM,' ')
                ,NVL(v_SimeiKanji,' ')
                ,NVL(v_YMD,' ')
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--                ,'4貸'
                ,w_QPAI_SEQ || '4'
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
                ,NVL(v_Kingaku,0)
                ,NULL
                ,NULL
                ,NULL
                ,NVL(w_GenZan,0)
                ,NVL(InStrSeiKBN,' ')
                ,NVL(v_Zaimu,' ')
                ,NVL(v_Syozai,' ')
                ,NVL(v_Kaisya,' ')
                ,NVL(v_Bank,' ')
                ,NVL(v_KozaNo,' ')
                ,NVL(v_KozaNm,' ')
                ,NVL(InStrUserID,' ')
                ,NVL(InStrComputerNM,' '));

		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
		v_QPAI_SEQ := v_QPAI_SEQ +1;
		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

        END IF;
        /* 入金 */
        IF v_KBN = '2' THEN

--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応
            IF TO_DATE(v_YMD,'YYYYMMDD')  >= TO_DATE('20011025','YYYYMMDD') AND                         -- 12/05 UPD
               TO_DATE(v_YMD,'YYYYMMDD')  <= TO_DATE('20011031','YYYYMMDD') THEN                        -- 12/05 UPD
                w_GenZan      := 0;                                                                     -- 12/05 UPD
                w_Risoku      := 0;                                                                     -- 12/05 UPD
                w_Zan         := 0;                                                                     -- 12/05 UPD
                v_ZanZeroFlg  := '1';                                                                   -- 12/05 UPD
            ELSE                                                                                        -- 12/05 UPD
                w_GenZan := w_GenZan -v_Kingaku;                                                        -- 12/05 UPD
				/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
				/* 26日～月末に入金があった時に残高を減らす対応              */
				IF SUBSTR(v_YMD,7,2) >= '26' THEN
					w_Zan := w_GenZan;
				END IF;
				/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
            END IF;                                                                                     -- 12/05 UPD
--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応　ここまで


			t_Date := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_YMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01';  -- 11/01 ADD
			k_Date := TO_CHAR(TO_DATE(t_Date,'YYYYMMDD') - 1,'YYYYMMDD');                               -- 11/01 ADD
			IF TO_DATE(k_Date,'YYYYMMDD') + 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN                     -- 11/01 ADD
				IF InStrSeiKBN = '0' THEN
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
						k_Date := InStrSeiYMD;
					END IF;
				END IF;
				t_Date := v_YMD;
				v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
				w_Risoku := 0;
				IF w_GenZan > 0 THEN
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--経過日数↓
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);												--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date) + 1;													--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ

						END LOOP;
					ELSE
						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);
					END IF;
				END IF;
				v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(TO_CHAR(TO_DATE(InStrStrYMD1,'YYYYMMDD')- 1,'YYYYMMDD'),1,6),'YYYYMM'))) + 1;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--				RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
				w_YRisoku := w_YRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			ELSE
				IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
					t_Date := SUBSTR(v_YMD,1,6) || '25';
					k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
				ELSE
					k_Date := SUBSTR(v_YMD,1,6) || '25';
				END IF;

				IF InStrSeiKBN = '0' THEN
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
						k_Date := InStrSeiYMD;
					END IF;
				END IF;

				t_Date := v_YMD;
				v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
				w_Risoku := 0;

				IF w_GenZan > 0 THEN
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);												--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date) + 1;													--集計開始日
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
						END LOOP;
					ELSE	--従来の処理
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;
				END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
				IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
--					v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 2;
				w_TRisoku := w_TRisoku - w_Risoku;
				ELSE
--					v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 1;
				w_YRisoku := w_YRisoku - w_Risoku;
				END IF;
--				RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			END IF;

/* ADD 20100225 0908047 NBC ISHIDA START */
			/********************************************************/
			/* 未請求分解の分解処理(入金)で入金された手数料を取得し */
			/* 計算書で表示する                                     */
			/********************************************************/
			BEGIN
				SELECT NVL(QPB5_RISOKU,0)
				INTO v_NyuRisoku
				FROM QPB5_BUNKAIRSK
				WHERE Nvl(QPB5_SYAINCD1,' ') = ' '
				AND   QPB5_SYAINCD2 = InStrSyainCD
				AND   QPB5_SYUBETU  = '1'
				AND   TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') = v_YMD;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_NyuRisoku := 0;
				WHEN OTHERS THEN
					RAISE;
			END;
/* ADD 20100225 0908047 NBC ISHIDA END */

            /* 明細のINSERT */
            INSERT INTO QPAI_KGCKEISANW VALUES (
                 NVL(InStrSyainCD,' ')
                ,NVL(v_MiseNM,' ')
                ,NVL(v_SimeiKanji,' ')
                ,NVL(v_YMD,' ')
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--                ,'5入'
                ,w_QPAI_SEQ || '5'
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
                ,NULL
/* MOD 20100319 TR1003-002 NBC YOKOYAMA START */
--                ,NVL(v_Kingaku,0)
                ,NVL(v_Kingaku,0) + NVL(v_NyuRisoku,0)	--返済金額
/* MOD 20100319 TR1003-002 NBC YOKOYAMA END */
                ,NVL(v_Kingaku,0)
/* ADD 20100225 0908047 NBC ISHIDA START */
--                ,NULL
                ,NVL(v_NyuRisoku,0)
/* ADD 20100225 0908047 NBC ISHIDA END */
                ,NVL(w_GenZan,0)
                ,NVL(InStrSeiKBN,' ')
                ,NVL(v_Zaimu,' ')
                ,NVL(v_Syozai,' ')
                ,NVL(v_Kaisya,' ')
                ,NVL(v_Bank,' ')
                ,NVL(v_KozaNo,' ')
                ,NVL(v_KozaNm,' ')
                ,NVL(InStrUserID,' ')
                ,NVL(InStrComputerNM,' '));

		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
		v_QPAI_SEQ := v_QPAI_SEQ +1;
		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
        END IF;

		/* 給与返済 */
		IF v_KBN = '3' THEN
			w_ZenYMD := v_YMD;
			t_Date := v_YMD;				--給与日
			k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(v_YMD,'YYYYMMDD'),-1),'YYYYMMDD');
			v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(k_Date,'YYYYMMDD');
			w_Risoku := 0;
			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
			v_Hensai := 0;
			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
			/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
			v_KojoFlg  := False;
			/* 控除日が2008年3月から、オペレーション月までの             */
			/* 給与控除の返済金額と利息を実データから取得する。          */
			IF v_YMD >= v_SysCng4 AND SUBSTR(v_YMD,1,6) <= SUBSTR(v_SysDate,1,6) THEN
				/* 給与控除額 */
				/* 当月給与控除の確認 */
				IF SUBSTR(v_YMD,1,6) = SUBSTR(v_SysDate,1,6) THEN
					BEGIN
						SELECT
							  QPAA_KANGAKU
							 ,QPAA_RISOKU
						INTO
							  v_Kangaku
							 ,v_Risoku
						FROM  QPAA_KOJOT
						WHERE QPAA_SYAINCD1 = ' '
						AND   QPAA_SYAINCD2 = InStrSyainCD
						AND   QPAA_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD')
						AND   QPAA_SYUBETU  = '1'
						AND   QPAA_YUSIKBN  = '3';
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kangaku  := '0';
								v_Risoku  := '0';
								/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--								v_KojoFlg := true;
								v_TogetuKojoFlg := true;
								/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
							  WHEN OTHERS THEN
								RAISE;
					END;

					/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
					IF v_TogetuKojoFlg = False THEN
						v_Hensai := v_Kangaku;
						w_Risoku := v_Risoku;
			            s_Hensai := 0;
			            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--			            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
					END IF;
					/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

				ELSE
					BEGIN
						SELECT
							  QPB0_KANGAKU
							 ,QPB0_RISOKU
						INTO
							  v_Kangaku
							 ,v_Risoku
						FROM  QPB0_KOJORRKT
						WHERE QPB0_SYAINCD1 = ' '
						AND   QPB0_SYAINCD2 = InStrSyainCD
						AND   QPB0_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD')
						AND   QPB0_SYUBETU  = '1'
						AND   QPB0_YUSIKBN  = '3';
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kangaku  := '0';
								v_Risoku  := '0';
								v_KojoFlg := True;
							  WHEN OTHERS THEN
								RAISE;
					END;
				/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--				END IF;
				/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
				v_Hensai := v_Kangaku;
				w_Risoku := v_Risoku;
	            s_Hensai := 0;
	            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--	            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
				END IF;
			END IF;
			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

			/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--			ELSE
			/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START            */
--			/************************************************************************/-
--			/* 給与控除日が2008年3月より前、または、翌月以降で控除中止ではない場合  */
--			/* または、当月控除データがなく、控除中止ではない場合、                 */
--			/* シミュレーションで計算                                               */
--			/************************************************************************/
--			IF v_YMD < v_SysCng4 OR (SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg <> '1')
--			   OR (v_TogetuKojoFlg = True AND v_kojocyushiFlg <> '1') THEN
--			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
			/************************************************************************/
			/*下記条件の時、シミュレーションで利息の計算を行う                      */
			/*1.給与控除日が2008年3月以前                                           */
			/*2.給与控除日がオペ月の翌月以降                                        */
			/*3.当月給与控除が発生していない時(1日から5日控除が表示されない障害対応)*/
			/************************************************************************/
			IF  v_YMD < v_SysCng4 OR SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6)
				OR v_TogetuKojoFlg = True THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

				IF w_Zan > 0 THEN
					--★2003/01/23★
					--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
					--
					--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(k_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(k_Date + 1);											--集計開始日の利率を取得
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);												--集計終了日の利率を取得

					IF k_Date = '20021225' AND t_Date = '20030125' THEN
						--2002/12/26 ～ 2003/01/25間の計算は2002/12/26時点での利率で計算する(修正時点で既に締めてしまった為)
						v_GetRiritu  := v_STARTRiritu;														--利率を取得する
						v_GetRiritu  := v_GetRiritu / 100;													--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

						IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * v_DateCnt * 1000000);
						ELSE
							w_Risoku := TRUNC(w_Zan * v_GetRiritu * v_DateCnt / 365 * 1000) * 1000;
						END IF;
					ELSE
						IF t_Date = '20030225' THEN
							v_GetRiritu := '7.5';												--2003/02/25給与の残高算出に限り、締めた1月残高に反映できなかった
							v_GetRiritu  := v_GetRiritu / 100;									--利息の計算を行う
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--
							w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * 6 * 1000000);
							v_GetRiritu := '5.9';
							v_GetRiritu  := v_GetRiritu / 100;									--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 25 * 1000000);	--
						ELSE
							IF v_STARTRiritu <> v_ENDRiritu THEN
								W_CNT        := TO_NUMBER(k_Date) + 1;													--集計開始日
								W_ENDLOOPCNT := TO_NUMBER(t_Date);														--集計終了日

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;
									END IF;

									v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
									v_GetRiritu  := v_GetRiritu / 100;													--
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

									IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
										w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
									ELSE
										w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
									END IF;

									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
								END LOOP;
							ELSE	--従来の処理
				---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
									w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
								ELSE																					-- 10/24 UPD
									w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
								END IF;																					-- 10/24 UPD
							END IF;
						END IF;
					END IF;
				END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--	            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
--	            w_Risoku := w_Risoku + RisokuAry(v_DateCnt);
	---         w_Risoku := TRUNC(w_Risoku / 1000);      -- 10/24 UPD
--	            w_Risoku := TRUNC(w_Risoku / 1000000);   -- 10/24 UPD
                w_Risoku      := w_Risoku + w_TRisoku;
                w_Risoku      := TRUNC(w_Risoku / 1000000);
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
	            IF (w_Zan - s_Hensai) > (v_Kingaku - w_Risoku) THEN
	                v_Hensai := v_Kingaku;
	            ELSE
	                IF w_Zan - s_Hensai + w_Risoku > 0 THEN
	                    v_Hensai := w_Zan - s_Hensai + w_Risoku;
	                ELSE
	                    v_Hensai := 0;
	                END IF;
	            END IF;

	            s_Hensai := 0;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
				IF (v_TogetuKojoFlg = True AND v_kojocyushiFlg <> '1')
				   OR (SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg <> '1') THEN
		            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);
				END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			END IF;
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
	            v_SihaFLG := False;
	            IF w_Risoku = 0 THEN
	                IF w_Zan <= 0 THEN
	                    v_SihaFLG := True;
	                    w_IDX1 := w_IDX1 - 1;
	                    w_IDX2 := w_IDX2 - 1;
	                END IF;
	            END IF;
	--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応
	            IF v_ZanZeroFlg = '1' THEN                      -- 12/05 UPD
	                    v_SihaFLG := True;                      -- 12/05 UPD
	                    w_IDX1 := w_IDX1 - 1;                   -- 12/05 UPD
	                    w_IDX2 := w_IDX2 - 1;                   -- 12/05 UPD
	            END IF;
	--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応　ここまで

			/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--            w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
--            w_Zan := w_GenZan;
--            w_IDX4 := v_DateCnt;
			/* DEL 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
			IF v_TogetuKojoFlg = True AND v_kojocyushiFlg = '1'
			   OR SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg = '1' THEN
				v_KojoFlg := true;
			END IF;
			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

/*ADD 20100129 TR0911-003 NBC ISHIDA START */
			IF v_KojoFlg = False THEN
				w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
			END IF;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */
			w_Zan := w_GenZan;

            IF v_SihaFLG = False THEN
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
				IF v_KojoFlg = False THEN
	                /* 明細のINSERT */
	                INSERT INTO QPAI_KGCKEISANW VALUES (
	                     NVL(InStrSyainCD,' ')
	                    ,NVL(v_MiseNM,' ')
	                    ,NVL(v_SimeiKanji,' ')
	                    ,NVL(v_YMD,' ')
						/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
	--                    ,'2給'
	                    ,w_QPAI_SEQ || '2'
						/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
	                    ,NULL
	                    ,NVL(v_Hensai,0)
	                    ,NVL(v_Hensai,0) - NVL(w_Risoku,0)
	                    ,NVL(w_Risoku,0)
	                    ,NVL(w_GenZan,0)
	                    ,NVL(InStrSeiKBN,' ')
	                    ,NVL(v_Zaimu,' ')
	                    ,NVL(v_Syozai,' ')
	                    ,NVL(v_Kaisya,' ')
	                    ,NVL(v_Bank,' ')
	                    ,NVL(v_KozaNo,' ')
	                    ,NVL(v_KozaNm,' ')
	                    ,NVL(InStrUserID,' ')
	                    ,NVL(InStrComputerNM,' '));

					/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

/*ADD 20100129 TR0911-003 NBC ISHIDA START */
					w_TRisoku     := w_YRisoku;
					w_YRisoku     := 0;
					w_KRisoku     := 0;
				ELSE
					w_KRisoku     := w_KRisoku + w_Risoku;
					w_TRisoku     := w_YRisoku;
					w_YRisoku     := 0;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--					/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--		            w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
--		            w_Zan := w_GenZan;
--		            w_IDX4 := v_DateCnt;
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
					/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
				END IF;
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
/*ADD 20100129 TR0911-003 NBC ISHIDA START */
			ELSE
				w_KRisoku     := w_KRisoku + w_Risoku;
				w_TRisoku     := w_YRisoku;
				w_YRisoku     := 0;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */
            END IF;

        END IF;

        /* 賞与返済 */
        IF v_KBN = '4' THEN
            v_BonusFLG := '1';
            IF v_SihaFLG = True THEN
                v_BonusFLG := '0';
                v_SihaFLG := False;
                w_IDX1 := w_IDX1 - 1;
                w_IDX2 := w_IDX2 - 1;
            END IF;
            IF w_ZenZan <= 0 THEN
                v_BonusFLG := '0';
                v_SihaFLG := False;
                w_IDX1 := w_IDX1 - 1;
                w_IDX2 := w_IDX2 - 1;
            END IF;
            IF v_BonusFLG = '1' THEN
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
				v_KojoFlg := False;
				/* 控除日が2008年3月から、オペレーション月までの             */
				/* 賞与控除の返済金額を実データから取得する。          */
				IF v_YMD >= v_SysCng4 AND SUBSTR(v_YMD,1,6) <= v_Max_Syouyo THEN
					BEGIN
						SELECT QPA4_KOJOGAKU
						INTO   v_Kojogaku
						FROM   QPA4_KGCKOJOT
						WHERE  QPA4_SYAINCD1 = ' '
						AND    QPA4_SYAINCD2 = InStrSyainCD
						AND    QPA4_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD');
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kojogaku  := '0';
								v_KojoFlg := True;
							  WHEN OTHERS THEN
								RAISE;
					END;
					v_Hensai := v_Kojogaku;

				/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--				ELSE
				/* 控除中止フラグが立っていないときは、シミュレーションで計算をする */
				ELSIF v_YMD < v_SysCng4 OR (v_YMD >= v_SysCng4 AND v_kojocyushiFlg <> '1') THEN
				/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

	                IF w_ZenZan > v_Kingaku THEN
	                    v_Hensai := v_Kingaku;
	                ELSE
	                    v_Hensai := w_ZenZan;
	                END IF;

				/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
				ELSE
					v_Hensai := 0;
					v_KojoFlg := True;
				/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */

				END IF;
                s_Hensai := v_Hensai;
                w_GenZan := w_GenZan - v_Hensai;

				IF v_KojoFlg = False THEN
	/**************************************/
	/* 10/24 UPD 賞与後給与日の指定に誤り */
	--                k_Date := v_YMD;
	--                k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),1),'YYYYMMDD');
	--                k_Date := SUBSTR(k_Date,1,6) || '25';
	--                t_Date := v_YMD;
	                k_Date := v_YMD;
	                t_Date := v_YMD;
	                IF w_IntSyoFLG = '0' THEN
	                    k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),1),'YYYYMMDD');
	                    k_Date := SUBSTR(k_Date,1,6) || '25';
	                ELSE
	                    k_Date := SUBSTR(k_Date,1,6) || '25';
	                END IF;
	/**************************************/
	                IF InStrSeiKBN = '0' THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
/* 元の条件に戻す */
--						/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
----	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
--	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD')
--						   OR v_kojocyushiFlg = '1' THEN
--						/* MOD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA  */
	                        k_Date := InStrSeiYMD;
	                    END IF;
	                END IF;

					IF w_IntSyoFLG = '0' THEN
						v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');

						--★2003/01/23★
						--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
						--
						--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
						v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);											--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

						IF v_STARTRiritu <> v_ENDRiritu THEN
							W_CNT        := TO_NUMBER(t_Date) + 1;													--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;													--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

								IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu / 365 * 1000) * 1000;
								END IF;
								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
							END LOOP;
							w_Risoku := TRUNC(w_Risoku);
						ELSE	--従来の計算方法
		---					w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);								-- 10/24 UPD
							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN									-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu2 * v_DateCnt * 1000000);							-- 10/24 UPD
							ELSE																								-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;					-- 10/24 UPD
							END IF;																								-- 10/24 UPD
						END IF;

						v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) +1;
					ELSE
	--					k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),-1),'YYYYMMDD');					-- 10/24 DEL
						v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
	---					w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
						--★2003/01/23★
						--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
						--
						--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
						v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);											--集計開始日の利率を取得
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--集計終了日の利率を取得

						IF v_STARTRiritu <> v_ENDRiritu THEN
							W_CNT        := TO_NUMBER(t_Date) + 1;													--集計開始日
							W_ENDLOOPCNT := TO_NUMBER(k_Date);														--集計終了日

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
								v_GetRiritu  := v_GetRiritu / 100;													--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

								IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu / 365 * 1000) * 1000;
								END IF;
							END LOOP;
							w_Risoku := TRUNC(w_Risoku);
						ELSE	--従来の処理
							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
							ELSE																					-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
							END IF;																					-- 10/24 UPD
						END IF;

						v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
					END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--	                RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
	                w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
	                /* 明細のINSERT */
	                INSERT INTO QPAI_KGCKEISANW VALUES (
	                     NVL(InStrSyainCD,' ')
	                    ,NVL(v_MiseNM,' ')
	                    ,NVL(v_SimeiKanji,' ')
	                    ,NVL(v_YMD,' ')
						/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
	--                    ,'3賞'
	                    ,w_QPAI_SEQ || '3'
						/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
	                    ,NULL
	                    ,NVL(v_Hensai,0)
	                    ,NVL(v_Hensai,0)
	                    ,NULL
	                    ,NVL(w_GenZan,0)
	                    ,NVL(InStrSeiKBN,' ')
	                    ,NVL(v_Zaimu,' ')
	                    ,NVL(v_Syozai,' ')
	                    ,NVL(v_Kaisya,' ')
	                    ,NVL(v_Bank,' ')
	                    ,NVL(v_KozaNo,' ')
	                    ,NVL(v_KozaNm,' ')
	                    ,NVL(InStrUserID,' ')
	                    ,NVL(InStrComputerNM,' '));

					/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
				END IF;
				/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
            END IF;
        END IF;


/* ADD 20100225 0908047 NBC ISHIDA START */
        /* 分解 */
		IF v_KBN = '5' THEN
			/* QPASに同じ分解日が2件あるとQPAIに4件INSERTされる。3件だと9件 */
			/* 防ぐために同じ分解日が続いた場合は処理をしない     */
			IF v_BeforeBunkaiYMD <> v_YMD THEN
				v_BeforeBunkaiYMD := v_YMD;

				/* 分解元金・利息の取得 */
				StrSQL := NULL;
				StrSQL := StrSQL || 'SELECT';
				StrSQL := StrSQL || ' NVL(QPB2_GANKIN,0),';
				StrSQL := StrSQL || ' NVL(QPB2_RISOKU,0)';
				StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
				StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
				StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
				StrSQL := StrSQL || ' AND QPB2_SYUBETU  = ''1''';
				StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') = :YMD';
				StrSQL := StrSQL || ' ORDER BY QPB2_KOJOYMD';
	
				v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	
				/* SQLの解析 */
				DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
	
				/* 入力変数をバインドする */
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YMD);
	
				/* 出力変数のバインド */
				DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kangaku);
				DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_Risoku);
	
				/* SQLの実行 */
				v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
				LOOP
	
					IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
						EXIT;
					END IF;
	
					DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kangaku);
					DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_Risoku);
	
					/* 分解明細のINSERT */
					INSERT INTO QPAI_KGCKEISANW VALUES (
						NVL(InStrSyainCD,' ')
						,NVL(v_MiseNM,' ')
						,NVL(v_SimeiKanji,' ')
						,NVL(v_YMD,' ')
						,w_QPAI_SEQ || '7'
						,NULL
						,NVL(v_Kangaku,0) + NVL(v_Risoku,0)
						,NVL(v_Kangaku,0)
						,NVL(v_Risoku,0)
						,NVL(w_GenZan,0)
						,NVL(InStrSeiKBN,' ')
						,NVL(v_Zaimu,' ')
						,NVL(v_Syozai,' ')
						,NVL(v_Kaisya,' ')
						,NVL(v_Bank,' ')
						,NVL(v_KozaNo,' ')
						,NVL(v_KozaNm,' ')
						,NVL(InStrUserID,' ')
						,NVL(InStrComputerNM,' '));
	
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					w_QPAI_SEQ := TO_CHAR(TO_NUMBER(w_QPAI_SEQ) +1,'FM000');	--@@@@@@@@@@@yoko
				END LOOP;
	
				/* カーソルのクローズ */
				DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
			END IF;
		END IF;
/* ADD 20100225 0908047 NBC ISHIDA END */

    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

  /****************************/
  /* 精算金額の取得           */
  /****************************/

    IF InStrSeiKBN = '0' THEN

		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
		/* 計算書表示用シーケンス番号を文字列に変換 */
		w_QPAI_SEQ := TO_CHAR(v_QPAI_SEQ,'FM000');
		/* ADD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応
        IF v_ZanZeroFlg  = '1' THEN                                                   -- 12/05 UPD
           w_GenZan  := 0;                                                            -- 12/05 UPD
           w_Risoku  := 0;                                                            -- 12/05 UPD
           w_Zan     := 0;                                                            -- 12/05 UPD
        END IF;                                                                       -- 12/05 UPD
--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応　ここまで

		w_Risoku := 0;
		w_KonYMD := TO_CHAR(ADD_MONTHS(TO_DATE(w_ZenYMD,'YYYYMMDD'),1),'YYYYMMDD'); --今回給与日
		IF TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD') > 0 THEN
			v_DateCnt := TO_DATE(w_KonYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
			IF w_Zan > 0 THEN
				--★2003/01/23★
				--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
				--
				--v_DateCnt := TO_DATE(w_KonYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_ZenYMD + 1);											--集計開始日の利率を取得
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(w_KonYMD);												--集計終了日の利率を取得

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_ZenYMD) + 1;													--集計開始日
					W_ENDLOOPCNT := TO_NUMBER(w_KonYMD);														--集計終了日

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--利率を取得する
						v_GetRiritu  := v_GetRiritu / 100;														--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;							--新利率を取得する

						IF TO_DATE(w_KonYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ

					END LOOP;
				ELSE
					--従来の処理
	---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
					IF TO_DATE(w_KonYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);						-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;				-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			ELSE
				w_Risoku := 0;
			END IF;

			v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD');
			IF w_Zan - s_Hensai > 0 THEN
				--★2003/01/23★
				--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
				--
				--v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_KonYMD + 1);											--集計開始日の利率を取得
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrSeiYMD);												--集計終了日の利率を取得

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_KonYMD) + 1;													--集計開始日
					W_ENDLOOPCNT := TO_NUMBER(InStrSeiYMD);														--集計終了日

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--利率を取得する
						v_GetRiritu  := v_GetRiritu / 100;													--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--新利率を取得する

						IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
					END LOOP;
				ELSE	--従来の処理
	---				w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
						w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);			-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;	-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			END IF;
		ELSE

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
/* 月ごとに利息を計算するように修正をした為、削除
--			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--			/***************************************************************/
--			/* 最終給与控除日の判定                                        */
--			/* 1.当月給与控除有り、控除中止の場合 = 当月給与控除日         */
--			/* 2.当月給与控除無し、控除中止の場合 = OP月の前月給与控除日   */
--			/* 3.上記以外の場合は、               = 従来通り               */
--			/***************************************************************/
--			IF v_TogetuKojoFlg = False and v_kojocyushiFlg = '1' THEN
--				w_ZenYMD := SUBSTR(v_SysDate,1,6) || '25';
--			ELSIF v_TogetuKojoFlg = True and v_kojocyushiFlg = '1' THEN
--				w_ZenYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
--			ELSE
--				w_ZenYMD := w_ZenYMD;
--			END IF;
--			/* ADD 00002 グループ社員証書貸付帳票見直し NBC ISHIDA END */
/*DEL 20100129 TR0911-003 NBC ISHIDA START */

			v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
			IF w_Zan > 0 THEN
				--★2003/01/23★
				--経過日数の期間に利率の変更があった場合、一日ごとに利率を取得し計算する
				--
				--v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_ZenYMD + 1);								--集計開始日の利率を取得
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrSeiYMD);								--集計終了日の利率を取得

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_ZenYMD) + 1;												--集計開始日
					W_ENDLOOPCNT := TO_NUMBER(InStrSeiYMD);													--集計終了日

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);									--利率を取得する
						v_GetRiritu  := v_GetRiritu / 100;												--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--新利率を取得する

						IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;

						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ
					END LOOP;
				ELSE	--従来の処理
					v_GetRiritu  := v_STARTRiritu / 100;												--
					v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--新利率を取得する
	---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * v_DateCnt * 1000000);						-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_GetRiritu * v_DateCnt / 365 * 1000) * 1000;				-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			ELSE
				w_Risoku := 0;
			END IF;
		END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--        w_IDX5 := w_IDX4 + 1;
--        LOOP
--            IF w_IDX5 > 8 THEN
--                EXIT;
--            END IF;
--            w_Risoku := w_Risoku + RisokuAry(w_IDX5);
--            w_IDX5 := w_IDX5 + 1;
--        END LOOP;
        w_TRisoku := w_TRisoku + w_Risoku;

        w_TRisoku     := TRUNC(w_TRisoku / 1000000);
        w_YRisoku     := TRUNC(w_YRisoku / 1000000);
        /* 精算時の利息を計算 */
        w_Risoku := w_TRisoku + w_YRisoku + w_KRisoku;

        IF w_Risoku <= 0 THEN
           w_Risoku := 0;
        END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応
        IF v_ZanZeroFlg  = '1' THEN                                                   -- 12/05 UPD
           w_GenZan  := 0;                                                            -- 12/05 UPD
           w_Risoku  := 0;                                                            -- 12/05 UPD
           w_Zan     := 0;                                                            -- 12/05 UPD
        END IF;                                                                       -- 12/05 UPD
--2001/12/05 社員ｺｰﾄﾞ　6111518（旧システムバグ）対応　ここまで

        /* 明細のINSERT */
        INSERT INTO QPAI_KGCKEISANW VALUES (
             NVL(InStrSyainCD,' ')
            ,NVL(v_MiseNM,' ')
            ,NVL(v_SimeiKanji,' ')
            ,NVL(InStrSeiYMD,' ')
			/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--            ,'6精'
            ,w_QPAI_SEQ || '6'
			/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */
            ,NULL
---            ,NVL(w_GenZan,0) + TRUNC(w_Risoku / 1000)   -- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            ,NVL(w_GenZan,0) + TRUNC(w_Risoku / 1000000)   -- 10/24 UPD
            ,NVL(w_GenZan,0) + w_Risoku
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
            ,NVL(w_GenZan,0)
---            ,TRUNC(w_Risoku / 1000)                     -- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            ,TRUNC(w_Risoku / 1000000)                     -- 10/24 UPD
            ,w_Risoku
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
            ,0
            ,NVL(InStrSeiKBN,' ')
            ,NVL(v_Zaimu,' ')
            ,NVL(v_Syozai,' ')
            ,NVL(v_Kaisya,' ')
            ,NVL(v_Bank,' ')
            ,NVL(v_KozaNo,' ')
            ,NVL(v_KozaNm,' ')
            ,NVL(InStrUserID,' ')
            ,NVL(InStrComputerNM,' '));
    END IF;

    /* コミット */
    COMMIT;

  END IF;


/* ADD 20100225 0908047 NBC ISHIDA START */
	/**************************/
	/*   分解を計算書に反映   */
	/**************************/

	/* 小口融資計算書WTから分解情報の取得 */

	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' QPAI_KBN,';
	StrSQL := StrSQL || ' QPAI_GANKIN';
	StrSQL := StrSQL || ' FROM QPAI_KGCKEISANW';
	StrSQL := StrSQL || ' WHERE QPAI_SYAINCD = :Code';
	StrSQL := StrSQL || ' AND SUBSTR(QPAI_KBN,4,1) = ''7''';
	StrSQL := StrSQL || ' AND QPAI_USERID = :Usr';
	StrSQL := StrSQL || ' AND QPAI_COMPUTERNM = :Cmp';

	v_CursorID  := DBMS_SQL.OPEN_CURSOR;

	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);

	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN2,4);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Kangaku);

	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	LOOP

		IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* 入力変数をバインドする */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Kangaku);

		/* 分解日以降の残高から分解元金を引く */

		BEGIN
			UPDATE QPAI_KGCKEISANW
			SET QPAI_ZANDAKA = QPAI_ZANDAKA - v_Kangaku
			WHERE QPAI_SYAINCD      = InStrSyainCD
			AND   QPAI_KBN         >= v_KBN2
			AND   QPAI_USERID       = InStrUserID
			AND   QPAI_COMPUTERNM   = InStrComputerNM;
		EXCEPTION
			WHEN  OTHERS  THEN
			RAISE;
		END;

	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	commit;

	/**************************/
	/* 分解戻しを計算書に反映 */
	/**************************/

	/* 分解・分解戻しTからデータの取得 */

	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' TO_CHAR(QPB2_KOJOYMD,''YYYYMMDD''),';
	StrSQL := StrSQL || ' QPB2_BUNMODFLG,';
	StrSQL := StrSQL || ' DECODE(QPB2_YUSIKBN,''3'',''2'',''4'',''3''),';
	StrSQL := StrSQL || ' NVL(QPB2_GANKIN,0),';
	StrSQL := StrSQL || ' NVL(QPB2_RISOKU,0)';
	StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
	StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
	StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
	StrSQL := StrSQL || ' AND QPB2_SYUBETU  = ''1''';
	StrSQL := StrSQL || ' AND ((QPB2_BUNMODFLG = ''0''';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_KOJOYMD,''YYYYMMDD'') <= :YMD1)';
	StrSQL := StrSQL || ' OR  (QPB2_BUNMODFLG = ''1''';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') >= :YMD2';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') <= :YMD1))';

	v_CursorID  := DBMS_SQL.OPEN_CURSOR;

	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrEndYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrStrYMD1);


	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_YMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_ModFlg,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kangaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_Risoku);

	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	LOOP

		IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* 入力変数をバインドする */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_YMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_ModFlg);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kangaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_Risoku);


		/* 計算書出力範囲内の控除金額を0円にする */
		IF v_YMD >= InStrStrYMD1 AND v_YMD <= InStrEndYMD THEN
			UPDATE QPAI_KGCKEISANW
			SET  QPAI_HENSAIKINGAKU = 0
				,QPAI_GANKIN        = 0
				,QPAI_RISOKU        = 0
			WHERE QPAI_SYAINCD      = InStrSyainCD
			AND   QPAI_YMD          = v_YMD
			AND   SUBSTR(QPAI_KBN,4,1) = v_KBN
			AND   QPAI_USERID       = InStrUserID
			AND   QPAI_COMPUTERNM   = InStrComputerNM;
		END IF;


		/* 控除日以降の残高に元金を加える */
		IF v_YMD <= InStrEndYMD THEN

			BEGIN
				SELECT QPAI_KBN
				INTO v_KBN2
				FROM QPAI_KGCKEISANW
				WHERE QPAI_SYAINCD      = InStrSyainCD
				AND   QPAI_YMD          = v_YMD
				AND   SUBSTR(QPAI_KBN,4,1) = v_KBN
				AND   QPAI_USERID       = InStrUserID
				AND   QPAI_COMPUTERNM   = InStrComputerNM;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_KBN2 := '0000';
				WHEN  OTHERS  THEN
					RAISE;
			END;

			BEGIN
				UPDATE QPAI_KGCKEISANW
				SET QPAI_ZANDAKA = QPAI_ZANDAKA + v_Kangaku
				WHERE QPAI_SYAINCD      = InStrSyainCD
				AND   QPAI_KBN         >= v_KBN2
				AND   QPAI_USERID       = InStrUserID
				AND   QPAI_COMPUTERNM   = InStrComputerNM;
			EXCEPTION
				WHEN  OTHERS  THEN
				RAISE;
			END;
		END IF;

		/* 分解戻しをしている元金と利息を集計 */
		IF v_ModFlg = '0' THEN
			v_GanKinMod := v_GanKinMod + v_Kangaku;
			v_RisokuMod := v_RisokuMod + v_Risoku;
		END IF;

	END LOOP;

	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	/* 「精算する」の場合、精算行に分解戻し分の利息を追加 */

    IF InStrSeiKBN = '0' THEN

		UPDATE QPAI_KGCKEISANW
		SET QPAI_HENSAIKINGAKU = QPAI_HENSAIKINGAKU + v_GanKinMod + v_RisokuMod
			,QPAI_GANKIN = QPAI_GANKIN + v_GanKinMod
			,QPAI_RISOKU = QPAI_RISOKU + v_RisokuMod
			,QPAI_ZANDAKA = 0
		WHERE QPAI_SYAINCD      = InStrSyainCD
		AND   SUBSTR(QPAI_KBN,4,1) = '6'
		AND   QPAI_USERID       = InStrUserID
		AND   QPAI_COMPUTERNM   = InStrComputerNM;

	END IF;

	commit;
/* ADD 20100225 0908047 NBC ISHIDA END */

/* ----- ＳＴＥＰ２ 表示データ総件数取得 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
      /* ワークテーブル存在チェックＳＱＬ */
      v_NumCount := 0;
      SELECT COUNT(*) INTO v_NumCount FROM QPAI_KGCKEISANW
          WHERE QPAI_USERID = InStrUserID
          AND QPAI_COMPUTERNM = InStrComputerNM;

      OtNumRecCount := v_NumCount;
  END IF;

/* ----- ＳＴＥＰ３ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
      /* 小口融資計算書テーブル検索 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(QPAI_YMD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAI_KBN,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAI_YUSIKINGAKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_HENSAIKINGAKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_GANKIN,0),';
      StrSQL := StrSQL || ' NVL(QPAI_RISOKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_ZANDAKA,0)';
      StrSQL := StrSQL || ' FROM QPAI_KGCKEISANW';
      StrSQL := StrSQL || ' WHERE QPAI_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAI_COMPUTERNM = :CMP';

--2001/12/06 順序不正対応
--      StrSQL := StrSQL || ' ORDER BY QPAI_YMD,QPAI_KBN,QPAI_YUSIKINGAKU desc';
--      StrSQL := StrSQL || ' ORDER BY QPAI_YMD';  del
--2001/12/06 順序不正対応　　ここまで

--2002/01/29 順序不正対応

	/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA START */
--	StrSQL := StrSQL || ' ORDER BY QPAI_YMD,QPAI_KBN ASC,QPAI_YUSIKINGAKU desc';
	StrSQL := StrSQL || ' ORDER BY QPAI_KBN ASC';
	/* MOD 00001 グループ社員証書貸付帳票見直し NBC ISHIDA END */

      /* 動的カーソルのオープン */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
      /* 入力変数のバインド */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
      /* SQLの実行 */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
      /* ２回目以降はカーソルを再利用する */
      v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;   --パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,z_YMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,z_KBN,4);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,z_YusiKingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,z_HensaiKingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,z_Gankin);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,z_Risoku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,z_Zandaka);
  /* FETCH */
  NumIdx := 0;
  LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
          EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,z_YMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,z_KBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,z_YusiKingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,z_HensaiKingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,z_Gankin);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,z_Risoku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,7,z_Zandaka);

      /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
      NumIdx               := NumIdx + 1;
      OtStrYMD(NumIdx)     := z_YMD;
      OtStrKBN(NumIdx)     := z_KBN;
      OtNumYusiKin(NumIdx) := z_YusiKingaku;
      OtNumHenKin(NumIdx)  := z_HensaiKingaku;
      OtNumGanKin(NumIdx)  := z_Gankin;
      OtNumRisoku(NumIdx)  := z_Risoku;
      OtStrZandaka(NumIdx) := z_Zandaka;

      /* 配列の件数がＭＡＸになった場合 */
      IF InNumMaxRec <= NumIdx  THEN
          OtNumAryCount :=  NumIdx;
          RETURN;
      END IF;
  END LOOP;

  OtNumAryCount := NumIdx;      --パラメータにセット
  OtStrEndFlg := '1';           --パラメータにセット（検索終了）

/* ADD 20100225 0908047 NBC ISHIDA START */
      OtNumGanKinMod       := v_GanKinMod;
      OtNumRisokuMod       := v_RisokuMod;
/* ADD 20100225 0908047 NBC ISHIDA END */


EXCEPTION
  WHEN  OTHERS  THEN
      IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
          DBMS_SQL.CLOSE_CURSOR (v_CursorID);
      END IF;
/* ADD 20100225 0908047 NBC ISHIDA START */
      IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
          DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      END IF;
/* ADD 20100225 0908047 NBC ISHIDA END */
      RAISE ;

END QPAP_CEnt030SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030GetHensaigaku                                                                      */
/* 機能          ：小口融資返済額取得                                                                             */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetHensaigaku(
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrKBN     IN    CHAR
  ,InStrYM      IN    CHAR) RETURN NUMBER IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_Hensaigaku    NUMBER := 0;
  v_KyuyoHensai   QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_SyoyoHensai   QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;

BEGIN
  /* 区分によって初期値変更 */
  IF InStrKBN = 1 THEN
    v_Hensaigaku := 10000;
  END IF;
  IF InStrKBN = 2 THEN
    v_Hensaigaku := 40000;
  END IF;

  /* 小口融資返済額履歴テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM = (SELECT MAX(QPA2_PRMHENKOUYM)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM <= :YM';
  StrSQL := StrSQL || ' GROUP BY QPA2_PRMSYAINCD1,QPA2_PRMSYAINCD2)';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', InStrYM);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyoyoHensai);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyoyoHensai);
    IF InStrKBN = 1 THEN
      v_Hensaigaku := v_KyuyoHensai;
    END IF;
    IF InStrKBN = 2 THEN
      v_Hensaigaku := v_SyoyoHensai;
    END IF;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 返却値に当てはめる */
  RETURN v_Hensaigaku;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetHensaigaku;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030GetHensaiYMD                                                                       */
/* 機能          ：小口融資返済額変更日取得                                                                       */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetHensaiYMD(
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrYM      IN    CHAR) RETURN CHAR IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_HensaiYM      CHAR(6);
  v_HenkoYM     QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE;

BEGIN
  v_HensaiYM := 'NOTHIN';

  /* 小口融資返済額履歴テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' MIN(QPA2_PRMHENKOUYM)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM > :YM';
  StrSQL := StrSQL || ' GROUP BY QPA2_PRMSYAINCD1,QPA2_PRMSYAINCD2';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', InStrYM);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYM,6);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYM);
    v_HensaiYM := v_HenkoYM;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  IF v_HensaiYM IS NULL OR v_HensaiYM = ' ' THEN
    v_HensaiYM := 'NOTHIN';
  END IF;

  /* 返却値に当てはめる */
  RETURN v_HensaiYM;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetHensaiYMD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030GetRiritu                                                                          */
/* 機能          ：小口融資利率取得                                                                               */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetRiritu(
   InStrYMD   IN    CHAR) RETURN NUMBER IS

  StrSQL      VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_NumCount    NUMBER;
  v_Dummy     INTEGER;
  v_Riritu    NUMBER := 0;
  v_HenkoRiritu QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

BEGIN
  /* 小口融資利率テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA7_RIRITU,0)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE QPA7_PRMHENKOYMD = (SELECT MAX(QPA7_PRMHENKOYMD)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') <= :YMD)';
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
END QPAP_CEnt030GetRiritu;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt030GetRirituYMD                                                                       */
/* 機能          ：小口融資利率変更日取得                                                                         */
/******************************************************************************************************************/
/* 小口融資利率変更日取得 */
FUNCTION QPAP_CEnt030GetRirituYMD(
   InStrYMD   IN    CHAR) RETURN CHAR IS

  StrSQL      VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_NumCount    NUMBER;
  v_Dummy     INTEGER;
  v_RirituYMD   CHAR(8);
  v_HenkoYMD    CHAR(8);

BEGIN
  v_RirituYMD := 'NOTHING1';

  /* 小口融資返済額履歴テーブル検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' TO_CHAR(MIN(QPA7_PRMHENKOYMD),''YYYYMMDD'')';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') > :YMD';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYMD,8);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYMD);
    v_RirituYMD := v_HenkoYMD;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  IF v_RirituYMD IS NULL OR v_RirituYMD = ' ' THEN
    v_RirituYMD := 'NOTHING1';
  END IF;

  /* 返却値に当てはめる */
  RETURN v_RirituYMD;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetRirituYMD;


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt030DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt030DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名

BEGIN

    DELETE  FROM QPAS_KGCW
      WHERE QPAS_USERID     = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE  FROM QPAI_KGCKEISANW
      WHERE QPAI_USERID     = InStrUserID
        AND QPAI_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt030DelWorkTbl;



END QPAP_CEnt030PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
