CREATE OR REPLACE PACKAGE  QPAP_CEnt150PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt150PkG                                                                                */
/* 機能          ：貸付金残高表                                                                                   */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------*/
/*更新日付  案件/障害番号    修正理由                                                                             */
/*20100225  0908047          グループ社員証書貸付帳票見直し2次                                                    */
/*                           現状、出力年月が「２月（下期末）」または「８月（上期末）」の時のみ表示               */
/*                           している「未収利息給与分、賞与分、合計」を、「５月（四半期末）」および               */
/*                           「１１月」にも表示するよう変更する。                                                 */
/*20100715  1004091          抽出条件にある東西区分を削除                                                         */
/*                           ※東西のデータを一度に表示・印刷を行う                                               */
/*----------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/
/*  １  宣言部                            */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
  TYPE typOtCodeAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE                --コード
    INDEX BY BINARY_INTEGER;

  TYPE typOtMiseNMAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE            --店名
    INDEX BY BINARY_INTEGER;

  TYPE typOtSCountAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE       --証書件数
    INDEX BY BINARY_INTEGER;

  TYPE typOtKCountAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE      --小口件数
    INDEX BY BINARY_INTEGER;

  TYPE typOtSZandakaAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE   --証書残高
    INDEX BY BINARY_INTEGER;

  TYPE typOtKZandakaAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE  --小口残高
    INDEX BY BINARY_INTEGER;

  TYPE typOtSMisyuKAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE     --証書未収利息給与
    INDEX BY BINARY_INTEGER;

  TYPE typOtSMisyuSAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE     --証書未収利息賞与
    INDEX BY BINARY_INTEGER;

  TYPE typOtKMisyuAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE      --小口未収利息
    INDEX BY BINARY_INTEGER;

/* 貸付データ取得 賞与残高更新前データ (QPAY_SYNDAICYOWTより取得) */
PROCEDURE QPAP_CEnt150SelList_Before (
   InStrYMD           IN     CHAR                                --検索条件  出力年月日
  ,InStrTozaiKBN      IN     CHAR                                --          東西区分
  ,InStrTyuSeiMM      IN     CHAR                                --          中間決算月
  ,InStrSeiMM         IN     CHAR                                --          決算月
  ,InStrKyuyoYMD      IN     CHAR                                --          給与日付
  ,InNumKyuyoNisu     IN     NUMBER                              --          給与日数
  ,InNumKyuyoNisuFrom IN     CHAR                                --          給与日数のＦＲＯＭ
  ,InNumKyuyoNisuTo   IN     CHAR                                --          給与日数のＴＯ
  ,InNumMaxRec        IN     NUMBER                              --最大配列格納件数
  ,IoNumCursor        IN OUT NUMBER                              --呼び出し回数
  ,OtNumRecCount         OUT NUMBER                              --総検索件数
  ,OtNumAryCount         OUT NUMBER                              --配列格納件数
  ,OtStrEndFlg           OUT VARCHAR2                            --検索終了フラグ
  ,OtStrCode             OUT typOtCodeAry                        --コード
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --店名
  ,OtNumSCount           OUT typOtSCountAry                      --証書カウント
  ,OtNumKCount           OUT typOtKCountAry                      --小口カウント
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --証書残高
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --小口残高
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --証書未収利息給与
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --証書未収利息賞与
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --小口未収利息
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --コンピュータ名

/* 貸付データ取得 賞与残高更新後データ (QPA8_SYNDAICYOTより取得) */
PROCEDURE QPAP_CEnt150SelList_After (
   InStrYMD           IN     CHAR                                --検索条件  出力年月日
  ,InStrTozaiKBN      IN     CHAR                                --          東西区分
  ,InStrTyuSeiMM      IN     CHAR                                --          中間決算月
  ,InStrSeiMM         IN     CHAR                                --          決算月
  ,InStrKyuyoYMD      IN     CHAR                                --          給与日付
  ,InNumKyuyoNisu     IN     NUMBER                              --          給与日数
  ,InNumKyuyoNisuFrom IN     CHAR                                --          給与日数のＦＲＯＭ
  ,InNumKyuyoNisuTo   IN     CHAR                                --          給与日数のＴＯ
  ,InNumMaxRec        IN     NUMBER                              --最大配列格納件数
  ,IoNumCursor        IN OUT NUMBER                              --呼び出し回数
  ,OtNumRecCount         OUT NUMBER                              --総検索件数
  ,OtNumAryCount         OUT NUMBER                              --配列格納件数
  ,OtStrEndFlg           OUT VARCHAR2                            --検索終了フラグ
  ,OtStrCode             OUT typOtCodeAry                        --コード
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --店名
  ,OtNumSCount           OUT typOtSCountAry                      --証書カウント
  ,OtNumKCount           OUT typOtKCountAry                      --小口カウント
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --証書残高
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --小口残高
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --証書未収利息給与
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --証書未収利息賞与
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --小口未収利息
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --コンピュータ名

/* 小口融資利率取得 */
FUNCTION QPAP_CEnt150GetRiritu(
   InStrYMD          IN     CHAR)
RETURN NUMBER;

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt150DelWorkTbl(
   InStrUserID       IN     VARCHAR2,                            --ユーザーＩＤ
   InStrComputerNM   IN     VARCHAR2);                           --コンピュータ名

END QPAP_CEnt150PkG;
/
show error
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt150PkG                                                                                */
/* 機能          ：貸付金残高表                                                                                   */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*２  ボディー                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt150PkG IS

  /* 検索完了時のみ開放するカーソル */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
  CURSOR CurMiseV IS
    SELECT QPAV_MISECD,QPAV_MISENM,QPAV_TOZAIKBNE,
    QPAV_TOZAIKBNW,QPAV_CODE
    FROM     QPAV_MISEV
    ORDER BY   QPAV_MISECD;
*/
	CURSOR CurMiseV IS
			-- 東
			SELECT
				 QPAV_MISECD
				,QPAV_MISENM
				,QPAV_TOZAIKBNE
				,QPAV_TOZAIKBNW
				,QPAV_CODE
				,QPAV_TOZAIKBNE		AS QPAV_TOZAIKBN
			FROM
				QPAV_MISEV
			WHERE
				QPAV_TOZAIKBNE		= '1'
		UNION
			-- 西
			SELECT
				 QPAV_MISECD
				,QPAV_MISENM
				,QPAV_TOZAIKBNE
				,QPAV_TOZAIKBNW
				,QPAV_CODE
				,QPAV_TOZAIKBNW		AS QPAV_TOZAIKBN
			FROM
				QPAV_MISEV
			WHERE
				QPAV_TOZAIKBNW		= '2'
		ORDER BY
			 QPAV_TOZAIKBN
			,QPAV_MISECD
		;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt150SelList_Before                                                                     */
/* 機能          ：残高データ取得                                                                                 */
/*                 賞与残高更新前データ                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt150SelList_Before (
   InStrYMD           IN     CHAR                                --検索条件  出力年月日
  ,InStrTozaiKBN      IN     CHAR                                --          東西区分
  ,InStrTyuSeiMM      IN     CHAR                                --          中間決算月
  ,InStrSeiMM         IN     CHAR                                --          決算月
  ,InStrKyuyoYMD      IN     CHAR                                --          給与日付
  ,InNumKyuyoNisu     IN     NUMBER                              --          給与日数
  ,InNumKyuyoNisuFrom IN     CHAR                                --          給与日数のＦＲＯＭ
  ,InNumKyuyoNisuTo   IN     CHAR                                --          給与日数のＴＯ
  ,InNumMaxRec        IN     NUMBER                              --最大配列格納件数
  ,IoNumCursor        IN OUT NUMBER                              --呼び出し回数
  ,OtNumRecCount         OUT NUMBER                              --総検索件数
  ,OtNumAryCount         OUT NUMBER                              --配列格納件数
  ,OtStrEndFlg           OUT VARCHAR2                            --検索終了フラグ
  ,OtStrCode             OUT typOtCodeAry                        --コード
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --店名
  ,OtNumSCount           OUT typOtSCountAry                      --証書カウント
  ,OtNumKCount           OUT typOtKCountAry                      --小口カウント
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --証書残高
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --小口残高
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --証書未収利息給与
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --証書未収利息賞与
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --小口未収利息
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --コンピュータ名

  /* 処理固有の変数 */
  StrSQL                    VARCHAR2(1000);
  v_CursorID                NUMBER := 0;
  v_CursorID2               NUMBER := 0;
  v_NumCount                NUMBER;
  v_Dummy                   INTEGER;
  v_Dummy2                  INTEGER;
  NumIdx                    NUMBER;

  v_SysCng                  CHAR(8) := '20000301';

  v_Index                   CHAR(3);
  v_KaisyaNM                VARCHAR2(24);
  v_MiseCD                  QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM                  QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD                 QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM                 QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SyainCD1                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_SimeiKanji              QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YusiYMD                 CHAR(8);
  v_KyuyoZandaka            QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZandaka            QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_Riritu                  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_TozaiKBN                QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_TozaiKBNE               QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_TozaiKBNW               QPAE_MISEM.QPAE_TOZAIKBNW%TYPE;
  v_BonusYMD1               QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BonusYMD2               QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_ZenBonusYMD1            CHAR(8);
  v_ZenBonusYMD2            CHAR(8);
  v_ZenBonusYMD             CHAR(8);
  v_TDATE                   CHAR(8);
  v_KDATE                   CHAR(8);
  v_ZenYMD                  CHAR(8);
  v_RisokuNisu              NUMBER;
  v_Risoku                  NUMBER;
  v_CRRisoku                NUMBER;
  v_SyosyoRisokuKyuyo       NUMBER;
  v_SyosyoRisokuSyoyo       NUMBER;
  v_CRRisokuKyuyo           NUMBER;
  v_Zandaka                 NUMBER;
  v_ZenZandaka              NUMBER;
  v_ZenRiritu               NUMBER;
  v_NowRiritu               NUMBER;
  v_Count                   NUMBER;
  v_KBN                     QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD                     QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku                 QPAS_KGCW.QPAS_KINGAKU%TYPE;

  w_Sybt                    CHAR(1);
  w_SZan                    NUMBER := 0;
  w_KZan                    NUMBER := 0;
  w_SMK                     NUMBER := 0;
  w_SMS                     NUMBER := 0;
  w_KMK                     NUMBER := 0;
  w_Cnt                     NUMBER := 0;

  v_SZan                    NUMBER := 0;
  v_KZan                    NUMBER := 0;
  v_SMK                     NUMBER := 0;
  v_SMS                     NUMBER := 0;
  v_KMK                     NUMBER := 0;
  v_SCnt                    NUMBER := 0;
  v_KCnt                    NUMBER := 0;

  w_Code                    QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE;
  w_MiseCD                  QPAX_ZANDAKATOTALW.QPAX_MISECD%TYPE;
  w_MiseNM                  QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE;
  w_SCount                  QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE;
  w_KCount                  QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE;
  w_SyosyoZandaka           QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE;
  w_KoguchiZandaka          QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE;
  w_SyosyoMisyuK            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE;
  w_SyosyoMisyuS            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE;
  w_KoguchiMisyu            QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE;

  /* 証書件数不備対応　2001/09/28 */
  v_NumFirst                NUMBER;
  v_SyainCD1_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;

  /* 行変数 */
   RowQPAG                  CurMiseV%ROWTYPE;

  v_SysCng2                 CHAR(8) := '20011101';          -- 10/23 ADD
  v_Riritu2                 NUMBER;                         -- 10/23 ADD

  /*2003/01/24 利息計算*/
  W_LoopCNT			NUMBER;						--利息計算用ループカウンタ
  W_ENDLOOPCNT		NUMBER;						--利息計算用ループ終了値
  v_GetRiritu		NUMBER;						--利息計算用利息率(旧)
  v_GetRiritu2		NUMBER;						--利息計算用利息率(新)
  v_StartRiritu		NUMBER;						--利息計算用利息求める範囲開始日での適用利率
  v_NextRiritu		NUMBER;						--利息計算用利息求める範囲終了日での適用利率
  strworkwork		NUMBER;						
  /*2003/01/24 利息計算*/

--ADD 20100225 0908047 NBC SAWAME START
  w_Str14SeiMM               CHAR(2);           --第一四半期決済月
  w_Str34SeiMM               CHAR(2);           --第三四半期決済月
--ADD 20100225 0908047 NBC SAWAME END

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
	v_wkTozaiKBN			CHAR(1);		--ワーク：東西区分
	v_wkKaisyaCD			CHAR(3);		--ワーク：会社コード
	v_wkKaisyaNM			VARCHAR2(24);	--ワーク：会社名
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

BEGIN

/* ----- ＳＴＥＰ１ 表示データ総件数取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    OtstrEndFlg   := '0';
    OtNumRecCount :=  0;
    OtNumAryCount :=  0;
    v_NumCount    :=  0;
    v_NumFirst    :=  0;	--証書件数不備対応　2001/09/28

    /* ＷＫテーブル初期化 */
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID   = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID   = InStrUserID
      AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID   = InStrUserID
      AND QPAX_COMPUTERNM = InStrComputerNM;

    /******************/
    /* 証書           */
    /******************/
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(D.QPAY_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPAY_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPAY_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAY_SYNDAICYOWT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE TO_CHAR(D.QPAY_PRMYUSIYMD,''YYYYMMDD'') <= :YMD';
    StrSQL := StrSQL || ' AND D.QPAY_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 (+)';
--    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 (+)';
--    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPAY_PRMSYAINCD1,D.QPAY_PRMSYAINCD2,D.QPAY_PRMYUSIYMD';

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_YusiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_SyoyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_Riritu);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 14,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 15,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 16,v_BonusYMD2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock1>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_YusiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_SyoyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_Riritu);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 14,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 15,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 16,v_BonusYMD2);

      /* 東西区分がどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock1;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* 高島屋かどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '㈱髙島屋';
      END IF;

--2002/1/11 東西区分考慮もれ対応
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock1;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 東西区分考慮もれ対応


      /*賞与年月日１*/
      IF TO_NUMBER(v_BonusYMD1) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
      ELSE
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
        v_ZenBonusYMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD1,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /*賞与年月日２*/
      If TO_NUMBER(v_BonusYMD2) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
      ELSE
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
        v_ZenBonusYMD2 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD2,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /* 上記で求めた賞与年月日のうち大きい方を前回賞与年月日とする。*/
      IF TO_DATE(v_ZenBonusYMD1,'YYYYMMDD') < TO_DATE(v_ZenBonusYMD2,'YYYYMMDD') THEN
        v_ZenBonusYMD := v_ZenBonusYMD2;
      ELSE
        v_ZenBonusYMD := v_ZenBonusYMD1;
      END IF;
--DEL 20100225 0908047 NBC SAWAME START
--      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      --第一四半期決算月
      IF TO_NUMBER(InStrTyuSeiMM) + 3 > 12 THEN
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3 - 12);
      ELSE
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3);
      END IF;
      --第三四半期決算月
      IF TO_NUMBER(InStrSeiMM) + 3 > 12 THEN
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3 - 12);
      ELSE
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3);
      END IF;
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
          /****************************************************************************/
          /* 融資日が "2000/03/01" 以降は新計算式で、それより前は旧計算式で計算する。  /
          /****************************************************************************/
          IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng,'YYYYMMDD') THEN
              /************/
              /* 新計算式  /
              /************/
              /*************************/
              /* 給与の未収利息計算    */
              /*************************/
              /* 融資日により計算する日数を判断する。*/
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* 融資日が、指定月の前月以前の場合（指定月の２５日に天引きがある）*/
                  /* 指定月の２６日 ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := SUBSTR(InStrYMD,1,6) || '25';
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              ELSE
                  /* 融資日が、指定月の場合（指定月の２５日に天引きがない）*/
                  /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* 計算した日数から給与の未収利息を計算する。*/
---              v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* 融資日が新システム移行後 */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* 融資日が新システム移行前 */                                                    -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;
              /*************************/
              /* 賞与の未収利息計算    */
              /*************************/
              /* 融資日により計算する日数を判断する。*/
              v_TDATE := SUBSTR(InStrYMD,1,6) || '01';
              IF TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) < TO_NUMBER(SUBSTR(v_TDATE,1,6)) THEN
                  /* 融資日が、指定月の前月以前の場合*/
                  /*******************************/
                  /* 賞与の日数の判断            */
                  /*******************************/
                  /* 融資年月が前回賞与年月以降の場合は、融資日から日数を計算する。*/
                  IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                      /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                      v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  ELSE
                      /* 前回賞与年月日 ～ 指定月末日 の日数を計算する。*/
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  END IF;
              ELSE
                  /* 融資日が、指定月の場合（指定月が賞与月だとしても、天引きはない）*/
                  /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* 計算した日数から賞与の未収利息を計算する。*/
---              v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* 融資日が新システム移行後 */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* 融資日が新システム移行前 */                                                    -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;                                                                               -- 10/23 UPD
          ELSE
              /************/
              /* 旧計算式  /
              /************/
              /* 給与の未収利息計算 */
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* 指定月の月初日より前の融資日の場合（2000/03/01 のシステム変更後はこっちしか通らない）*/
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * InNumKyuyoNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* 指定月の月初日以降の融資日の場合（2000/03/01 のシステム変更後はこっちは通らない）*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YusiYMD,'YYYYMMDD') + 1;
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
              /* 賞与の未収利息計算 */
              IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                  /* 融資年月が前回賞与年月以降の場合、融資日（計算する時は－１日する） ～ 指定月末日 の日数で計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* 融資日が前回賞与日以前の場合、前回賞与日 ～ 指定月末日 の日数で計算する。*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
          END IF;
      ELSE
          v_SyosyoRisokuKyuyo := 0;
          v_SyosyoRisokuSyoyo := 0;
      END IF;
      v_Zandaka := NVL(v_KyuyoZandaka,0) + NVL(v_SyoyoZandaka,0);

      /* 証書件数不備対応　2001/09/28 DELETE
      IF v_Zandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;  */
      IF v_KaisyaNM = '㈱髙島屋' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;
      /* 証書件数不備対応　2001/09/28 */
      IF v_Zandaka = 0 THEN
         GOTO l_InnerBlock1;
      END IF;
      IF v_NumFirst = 0 THEN
         v_Count := 1;
         v_SyainCD1_Save := v_SyainCD1;
         v_SyainCD2_Save := v_SyainCD2;
         v_NumFirst := 1;
      ELSE
        IF   v_SyainCD1 = v_SyainCD1_Save  AND
             v_SyainCD2 = v_SyainCD2_Save  THEN
             v_Count := 0;
        ELSE
             v_Count := 1;
             v_SyainCD1_Save := v_SyainCD1;
             v_SyainCD2_Save := v_SyainCD2;
        END IF;
      END IF;

      /* 貸付残高Ｔに追加 */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'2'
        ,NVL(v_YusiYMD,' ')
        ,NVL(v_Zandaka,0)
        ,0
        ,NVL(v_SyosyoRisokuKyuyo,0)
        ,NVL(v_SyosyoRisokuSyoyo,0)
        ,0
        ,v_Count
        ,0
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'2'
			,NVL(v_YusiYMD,' ')
			,NVL(v_Zandaka,0)
			,0
			,NVL(v_SyosyoRisokuKyuyo,0)
			,NVL(v_SyosyoRisokuSyoyo,0)
			,0
			,v_Count
			,0
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

    /******************/
    /* 小口           */
    /******************/
    /* 指定月と前月の利率を求める */
    v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
    v_ZenRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_ZenRiritu := TRUNC(v_ZenRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

    v_TDATE := TO_CHAR(TO_DATE(InStrKyuyoYMD,'YYYYMMDD') + 1,'YYYYMMDD');
    v_NowRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_NowRiritu := TRUNC(v_NowRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

--    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) - 1,'YYYYMMDD');
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');

    /* 小口退避テーブルに退避 */
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
      WHERE ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= InStrYMD))
      AND    (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
/* 11/01 UPD 入金対象範囲変更のため入金分は見ないこととする */
    /* 入金 */
--    INSERT INTO QPAS_KGCW
--      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
--      SELECT  NVL(QPA5_SYAINCD1,' '),
--        NVL(QPA5_SYAINCD2,' '),
--        '2',
--        TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
--       NVL(QPA5_NYUKINGAKU,0),
--        InStrUserID,
--        InStrComputerNM
--      FROM QPA5_KGCNYUKINT
--      WHERE ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenYMD)
--      AND    (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= InStrYMD));
    /* 賞与 */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  NVL(QPA4_SYAINCD1,' '),
        NVL(QPA4_SYAINCD2,' '),
        '4',
        TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
        NVL(QPA4_KOJOGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA4_KGCKOJOT
      WHERE ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= InStrYMD));

    /* コミット */
    COMMIT;

    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE D.QPA1_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA1_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA1_PRMSYAINCD1,D.QPA1_PRMSYAINCD2';

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_BonusYMD2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock2>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_BonusYMD2);

      /* 東西区分がどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock2;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* 高島屋かどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '㈱髙島屋';
      END IF;

--2002/1/11 東西区分考慮もれ対応
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock2;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 東西区分考慮もれ対応

      /* 前前月給与残高参照 */
      v_ZenZandaka := 0;
      v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT NVL(QPA3_ZANDAKA,0)';
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

      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_TDATE);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_ZenZandaka);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_ZenZandaka);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      v_Zandaka := v_ZenZandaka;

--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		/* 決算時および中間決算時のみ未収利息計算を行う */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			v_StartRiritu := QPAP_CEnt150GetRiritu(InNumKyuyoNisuFrom + 1);											--利息計算開始日時点での利息率
			v_NextRiritu  := QPAP_CEnt150GetRiritu(InNumKyuyoNisuTo);											--利息計算終了日時点での利息率

			IF v_StartRiritu <> v_NextRiritu THEN
				--利率の変更があるとき
				W_LoopCNT        := InNumKyuyoNisuFrom + 1;						--利息計算ループ開始
				W_ENDLOOPCNT := InNumKyuyoNisuTo;							--利息計算ループ終了

				LOOP
					IF W_LoopCNT > W_ENDLOOPCNT THEN
						EXIT;																	--利息算出範囲の終わりを超えたらループ終了
					END IF;

					v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);								--日ごとに適用される利率(旧制度)を取得する
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					利率(新制度)を取得する

					IF v_KyuyoZandaka > 0 Then
						v_CRRisokuKyuyo := v_CRRisokuKyuyo + FLOOR(v_KyuyoZandaka * v_GetRiritu2);
						v_CRRisoku      := v_CRRisoku      + FlOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
					ELSE
						v_CRRisokuKyuyo := 0;
						v_CRRisoku := 0;
					END IF;
					W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
				END LOOP;
			ELSE
				--利率の変更がないとき
				IF v_KyuyoZandaka > 0 Then
---					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 / 100);			-- 10/23 UPD
---					v_CRRisoku      := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 * 10);				-- 10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu);						-- 10/23 UPD
					v_CRRisoku      := FlOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu * 1000000);				-- 10/23 UPD
				ELSE
					v_CRRisokuKyuyo := 0;
					v_CRRisoku := 0;
				END IF;
			END IF;
		ELSE
			v_CRRisokuKyuyo := 0;
			v_CRRisoku := 0;
		END IF;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
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
      StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Usr', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Cmp', InStrComputerNM);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KBN,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_YMD,8);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_Kingaku);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_Kingaku);

        IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
          IF v_KBN = '1' THEN
            v_KyuyoZandaka := v_KyuyoZandaka + v_Kingaku;
          ELSE
            v_KyuyoZandaka := v_KyuyoZandaka - v_Kingaku;
          END IF;
        ELSE
          IF v_KBN = '1' THEN
            v_Zandaka := v_Zandaka + v_Kingaku;
          ELSE
            v_Zandaka := v_Zandaka - v_Kingaku;
          END IF;
        END IF;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		/* 決算時および中間決算時のみ未収利息計算を行う */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			/* 貸付・入金のみ */
			IF v_KBN = '1' OR v_KBN = '2' THEN
				/* 給与日以降の日付 */
				IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
					/* 貸付 */
					IF v_KBN = '1' THEN
						/* 残高あり */
						IF v_KyuyoZandaka > 0 THEN
							--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);						--利息計算開始日時点での利息率
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);					--利息計算終了日時点での利息率

							IF v_YMD = '20021225' AND InStrYMD = '20030125' THEN
								--2002/12/26 ～ 2003/01/25間の計算は2002/12/26時点での利率で計算する(修正時点で既に締めてしまった為)
								v_GetRiritu  := v_STARTRiritu;										--日ごとに適用される利率(旧制度)を取得する
								v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

								IF v_KyuyoZandaka >= v_Kingaku THEN
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_GetRiritu2 * 1000000);			--10/23 UPD
								/* 貸付金より残高が少ない */
								ELSE
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_GetRiritu2 * 1000000);	--10/23 UPD
								End IF;

							ELSE
								IF v_YMD = '20030225' THEN
									v_GetRiritu := '7.5';												--2003/02/25給与の残高算出に限り、締めた1月残高に反映できなかった
									v_GetRiritu  := v_GetRiritu / 100;									--利息の計算を行う
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									IF v_KyuyoZandaka >= v_Kingaku THEN
										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * 6 * v_GetRiritu2 * 1000000);			--10/23 UPD

										v_GetRiritu := '5.9';
										v_GetRiritu  := v_GetRiritu / 100;									--
										v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * 25 * v_GetRiritu2 * 1000000);			--10/23 UPD

									/* 貸付金より残高が少ない */
									ELSE
										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * 6 * v_GetRiritu2 * 1000000);	--10/23 UPD
										v_GetRiritu := '5.9';
										v_GetRiritu  := v_GetRiritu / 100;									--
										v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * 25 * v_GetRiritu2 * 1000000);	--10/23 UPD
									End IF;
								ELSE

									IF v_StartRiritu <> v_NextRiritu THEN	
										--算出期間に利率変更があった場合
										--１日ごとに利息率を取得して利息計算する
										W_LoopCNT        := v_YMD;
										W_ENDLOOPCNT := InStrYMD;

										LOOP
											IF W_LoopCNT > W_ENDLOOPCNT THEN
												EXIT;															--利息算出範囲の終わりを超えたらループ終了
											END IF;

											v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--日ごとに適用される利率(旧制度)を取得する
											v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

											/* 貸付金より残高が多い */
											IF v_KyuyoZandaka >= v_Kingaku THEN
												v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
											/* 貸付金より残高が少ない */
											ELSE
												v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
											End IF;
											W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--ｶｳﾝﾄｱｯﾌﾟ
										END LOOP;
									ELSE	--従来の処理
										/* 貸付金より残高が多い */
										IF v_KyuyoZandaka >= v_Kingaku THEN
											v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
			---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
											v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);			--10/23 UPD
										/* 貸付金より残高が少ない */
										ELSE
											v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
			---								v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu / 365 * 10);	--10/23 UPD
											v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);	--10/23 UPD
										End IF;
									END IF;
								END IF;
							END IF;
						END IF;
					/* 入金 */
					ELSE
						--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);											--利息計算開始日時点での利息率
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);											--利息計算終了日時点での利息率

						IF v_YMD = '20021225' AND InStrYMD = '20030125' THEN
							--2002/12/26 ～ 2003/01/25間の計算は2002/12/26時点での利率で計算する(修正時点で既に締めてしまった為)
							v_GetRiritu  := v_STARTRiritu;										--日ごとに適用される利率(旧制度)を取得する
							v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

							/* 残高あり */
							IF v_KyuyoZandaka > 0 Then
								v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_GetRiritu2 * 1000000);				--10/23 UPD
							END IF;

						ELSE
							IF v_YMD = '20030225' THEN
								/* 残高あり */
								IF v_KyuyoZandaka > 0 Then
									v_GetRiritu := '7.5';												--2003/02/25給与の残高算出に限り、締めた1月残高に反映できなかった
									v_GetRiritu  := v_GetRiritu / 100;									--利息の計算を行う
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * 6 * v_GetRiritu2 * 1000000);				--10/23 UPD

									v_GetRiritu := '5.9';												--2003/02/25給与の残高算出に限り、締めた1月残高に反映できなかった
									v_GetRiritu  := v_GetRiritu / 100;									--利息の計算を行う
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * 25 * v_GetRiritu2 * 1000000);				--10/23 UPD
								END IF;
							ELSE
								IF v_StartRiritu <> v_NextRiritu THEN
									--１日ごとに利息率を取得して利息計算する
									W_LoopCNT        := v_YMD + 1;
									W_ENDLOOPCNT := InStrYMD;

									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;																			--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);										--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;						--					利率(新制度)を取得する

										/* 残高あり */
										IF v_KyuyoZandaka > 0 Then
											v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
										END IF;
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--ｶｳﾝﾄｱｯﾌﾟ
									END LOOP;
								ELSE
									/* 残高あり */
									IF v_KyuyoZandaka > 0 Then
										v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
			---							v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);			--10/23 UPD
										v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);				--10/23 UPD
									END IF;
								END IF;
							END IF;
						END IF;
					End IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);     --10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);     --10/23 UPD
				/* 給与日以前の日付 */
				ELSE
					/* 貸付 */
					IF v_KBN = '1' Then
						/* 残高あり */
						IF v_Zandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);								--利息計算開始日時点での利息率
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);						--利息計算終了日時点での利息率

							/* 貸付金より残高が多い */
							IF v_Zandaka >= v_Kingaku Then
								IF v_StartRiritu <> v_NextRiritu THEN
									--１日ごとに利息率を取得して利息計算する
									W_LoopCNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;															--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--ｶｳﾝﾄｱｯﾌﾟ
									END LOOP;

								ELSE	--従来の処理
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);			--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);				--10/23 UPD
								END IF;

							/* 貸付金より残高が少ない */
							ELSE

								IF v_StartRiritu <> v_NextRiritu THEN
									--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									--１日ごとに利息率を取得して利息計算する
									W_LoopCNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;
								
									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;															--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する

										v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_GetRiritu2 * 1000000);      --10/23 UPD
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--ｶｳﾝﾄｱｯﾌﾟ

									END LOOP;

								ELSE	--従来の処理
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu / 365 * 10);  --10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);      --10/23 UPD
								END IF;
							END IF;
						END IF;
					/* 入金 */
					ELSE
						/* 残高あり */
						IF v_Zandaka > 0 Then
							--TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);									--利息計算開始日時点での利息率
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);								--利息計算終了日時点での利息率

							IF v_StartRiritu <> v_NextRiritu THEN
								LOOP
									--１日ごとに利息率を取得して利息計算する
									W_LoopCNT        := v_YMD + 1;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																			--利息算出範囲の終わりを超えたらループ終了
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);										--日ごとに適用される利率(旧制度)を取得する
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;						--					利率(新制度)を取得する

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);				--10/23 UPD
									W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--ｶｳﾝﾄｱｯﾌﾟ

								END LOOP;
							ELSE	--従来の処理
								v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
	---							v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);    --10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);        --10/23 UPD
							END IF;
						END IF;
					END IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);      --10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);      --10/23 UPD
				END IF;
			END IF;
		END IF;
	END LOOP;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      IF v_KyuyoZandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;
      IF v_KaisyaNM = '㈱髙島屋' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;

      /* 貸付残高Ｔに追加 */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'1'
        ,NULL
        ,0
        ,NVL(v_KyuyoZandaka,0)
        ,0
        ,0
        ,NVL(v_CRRisokuKyuyo,0)
        ,0
        ,v_Count
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'1'
			,NULL
			,0
			,NVL(v_KyuyoZandaka,0)
			,0
			,0
			,NVL(v_CRRisokuKyuyo,0)
			,0
			,v_Count
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

    /* 貸付残高合計表ワークテーブル作成 */
    --カーソルオープン
    IF CurMiseV%ISOPEN = FALSE THEN
      OPEN CurMiseV();
    END IF;

    --ＦＥＴＣＨ
    LOOP
      FETCH CurMiseV INTO RowQPAG;                      --順読み
      IF CurMiseV%NOTFOUND THEN
        EXIT;                               --ループ終了
      END IF;

      v_SZan := 0;
      v_KZan := 0;
      v_SMK := 0;
      v_SMS := 0;
      v_KMK := 0;
      v_SCnt := 0;
      v_KCnt := 0;

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
		v_wkKaisyaCD	:= '';
		v_wkKaisyaNM	:= '';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' NVL(QPAV_KAISYACD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAV_KAISYANM,'' ''),';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' NVL(QPAV_SYUBETU,'' ''),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUK),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUS),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIMISYU),';
      StrSQL := StrSQL || ' COUNT(QPAV_SYAINCD2)';
      StrSQL := StrSQL || ' FROM QPAV_ZANDAKASUMV';
      StrSQL := StrSQL || ' WHERE QPAV_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAV_COMPUTERNM = :CMP';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' AND QPAV_TOZAIKBN = :Tozai';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' AND QPAV_MISECD = :Mise';
      StrSQL := StrSQL || ' GROUP BY QPAV_USERID,QPAV_COMPUTERNM,';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' QPAV_KAISYACD,QPAV_KAISYANM,QPAV_TOZAIKBN,';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' QPAV_MISECD,QPAV_SYUBETU';

      /* 動的カーソルのオープン */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Mise', RowQPAG.QPAV_MISECD);
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Tozai', RowQPAG.QPAV_TOZAIKBN);
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      /* 出力変数のバインド */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Cnt);
*/
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_wkKaisyaCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_wkKaisyaNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* SQLの実行 */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
			--残高データが存在しない時は、店コードから会社情報を確定する
			v_NumCount := 0;
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT COUNT(*)';
			StrSQL := StrSQL || ' FROM QPAH_OTHERM';
			StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
			StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
			/* カーソルのオープン */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQLの解析 */
			DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
			/* 入力変数をバインドする */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', RowQPAG.QPAV_MISECD);
			/* ローカル変数への関連づけ */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
			/* SQLの実行 */
			v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
			END IF;
			/* カーソルのクローズ */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			IF v_NumCount = 0 THEN
				v_wkKaisyaCD	:= RowQPAG.QPAV_MISECD;
				v_wkKaisyaNM	:= RowQPAG.QPAV_MISENM;
			ELSE
				v_wkKaisyaCD	:= '000';
				v_wkKaisyaNM	:= '㈱髙島屋';
			END IF;
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

          EXIT;
        END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Cnt);
*/
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_wkKaisyaCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_wkKaisyaNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
        v_SZan := v_SZan + w_SZan;
        v_KZan := v_KZan + w_KZan;
        v_SMK  := v_SMK  + w_SMK;
        v_SMS  := v_SMS  + w_SMS;
        v_KMK  := v_KMK  + w_KMK;
        IF w_Sybt = '1' THEN
          v_KCnt := w_Cnt;
  ELSE
          v_SCnt := w_Cnt;
  END IF;
      END LOOP;
      /* 動的カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAX_ZANDAKATOTALW VALUES (
         NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
        ,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
        ,NVL(RowQPAG.QPAV_CODE,' ')
        ,NVL(RowQPAG.QPAV_MISECD,' ')
        ,NVL(RowQPAG.QPAV_MISENM,' ')
        ,NVL(v_SZan,0)
        ,NVL(v_KZan,0)
        ,NVL(v_SMK,0)
        ,NVL(v_SMS,0)
        ,NVL(v_KMK,0)
        ,NVL(v_SCnt,0)
        ,NVL(v_KCnt,0)
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
*/
		INSERT INTO QPAX_ZANDAKATOTALW VALUES (
			 NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
			,NVL(RowQPAG.QPAV_CODE,' ')
			,NVL(RowQPAG.QPAV_MISECD,' ')
			,NVL(RowQPAG.QPAV_MISENM,' ')
			,NVL(v_SZan,0)
			,NVL(v_KZan,0)
			,NVL(v_SMK,0)
			,NVL(v_SMS,0)
			,NVL(v_KMK,0)
			,NVL(v_SCnt,0)
			,NVL(v_KCnt,0)
			,NVL(InStrUserID,' ')
			,NVL(InStrComputerNM,' ')
			,NVL(v_wkKaisyaCD,' ')
			,NVL(v_wkKaisyaNM,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBN,' ')
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
    END LOOP;

    /* カーソルのクローズ */
    CLOSE CurMiseV;

    /* コミット */
    COMMIT;

    /* 総件数取得 */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- ＳＴＥＰ２ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* 貸付残高合計Ｔ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAX_CODE,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOCOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHICOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUK,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUS,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIMISYU,0)';
    StrSQL := StrSQL || ' FROM QPAX_ZANDAKATOTALW';
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' WHERE (QPAX_TOZAIKBNE = :KBN';
--    StrSQL := StrSQL || ' OR QPAX_TOZAIKBNW = :KBN)';
--    StrSQL := StrSQL || ' AND QPAX_USERID = :USR';
--    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' WHERE';
    StrSQL := StrSQL || '     QPAX_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' ORDER BY QPAX_MISECD';
    StrSQL := StrSQL || ' ORDER BY';
    StrSQL := StrSQL || '     QPAX_KAISYACD,';
    StrSQL := StrSQL || '     QPAX_TOZAIKBN,';
    StrSQL := StrSQL || '     QPAX_MISECD';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
/* DEL 20100715 1004091 IMZ SHIBUTANI START */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', InStrTozaiKBN);
/* DEL 20100715 1004091 IMZ SHIBUTANI END */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* ２回目以降はカーソルを再利用する */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Code,10);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_SCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_KCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SyosyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KoguchiZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SyosyoMisyuK);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_SyosyoMisyuS);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_KoguchiMisyu);

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Code);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_SCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_KCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SyosyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KoguchiZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SyosyoMisyuK);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_SyosyoMisyuS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_KoguchiMisyu);

    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrCode(NumIdx) := w_Code;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtNumSCount(NumIdx) := w_SCount;
    OtNumKCount(NumIdx) := w_KCount;
    OtNumSyosyoZandaka(NumIdx) := w_SyosyoZandaka;
    OtNumKoguchiZandaka(NumIdx) := w_KoguchiZandaka;
    OtNumSyosyoMisyuK(NumIdx) := w_SyosyoMisyuK;
    OtNumSyosyoMisyuS(NumIdx) := w_SyosyoMisyuS;
    OtNumKoguchiMisyu(NumIdx) := w_KoguchiMisyu;

    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;              --パラメータにセット
  OtStrEndFlg := '1';               --パラメータにセット（検索終了）
  IoNumCursor := TO_NUMBER(InStrKyuyoYMD);
  /* 動的カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    IF CurMiseV%ISOPEN THEN
      CLOSE CurMiseV;
    END IF;
    RAISE ;

END QPAP_CEnt150SelList_Before;



/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt150SelList_After                                                                      */
/* 機能          ：残高データ取得                                                                                 */
/*                 賞与残高更新後データ                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt150SelList_After (
   InStrYMD           IN     CHAR                                --検索条件  出力年月日
  ,InStrTozaiKBN      IN     CHAR                                --          東西区分
  ,InStrTyuSeiMM      IN     CHAR                                --          中間決算月
  ,InStrSeiMM         IN     CHAR                                --          決算月
  ,InStrKyuyoYMD      IN     CHAR                                --          給与日付
  ,InNumKyuyoNisu     IN     NUMBER                              --          給与日数
  ,InNumKyuyoNisuFrom IN     CHAR                                --          給与日数のＦＲＯＭ
  ,InNumKyuyoNisuTo   IN     CHAR                                --          給与日数のＴＯ
  ,InNumMaxRec        IN     NUMBER                              --最大配列格納件数
  ,IoNumCursor        IN OUT NUMBER                              --呼び出し回数
  ,OtNumRecCount         OUT NUMBER                              --総検索件数
  ,OtNumAryCount         OUT NUMBER                              --配列格納件数
  ,OtStrEndFlg           OUT VARCHAR2                            --検索終了フラグ
  ,OtStrCode             OUT typOtCodeAry                        --コード
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --店名
  ,OtNumSCount           OUT typOtSCountAry                      --証書カウント
  ,OtNumKCount           OUT typOtKCountAry                      --小口カウント
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --証書残高
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --小口残高
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --証書未収利息給与
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --証書未収利息賞与
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --小口未収利息
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --ユーザＩＤ
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --コンピュータ名

  /* 処理固有の変数 */
  StrSQL                    VARCHAR2(1000);
  v_CursorID                NUMBER := 0;
  v_CursorID2               NUMBER := 0;
  v_NumCount                NUMBER;
  v_Dummy                   INTEGER;
  v_Dummy2                  INTEGER;
  NumIdx                    NUMBER;

  v_SysCng                  CHAR(8) := '20000301';

  v_Index                   CHAR(3);
  v_KaisyaNM                VARCHAR2(24);
  v_MiseCD                  QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM                  QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD                 QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM                 QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SyainCD1                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_SimeiKanji              QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YusiYMD                 CHAR(8);
  v_KyuyoZandaka            QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZandaka            QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_Riritu                  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_TozaiKBN                QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_TozaiKBNE               QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_TozaiKBNW               QPAE_MISEM.QPAE_TOZAIKBNW%TYPE;
  v_BonusYMD1               QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BonusYMD2               QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_ZenBonusYMD1            CHAR(8);
  v_ZenBonusYMD2            CHAR(8);
  v_ZenBonusYMD             CHAR(8);
  v_TDATE                   CHAR(8);
  v_KDATE                   CHAR(8);
  v_ZenYMD                  CHAR(8);
  v_RisokuNisu              NUMBER;
  v_Risoku                  NUMBER;
  v_CRRisoku                NUMBER;
  v_SyosyoRisokuKyuyo       NUMBER;
  v_SyosyoRisokuSyoyo       NUMBER;
  v_CRRisokuKyuyo           NUMBER;
  v_Zandaka                 NUMBER;
  v_ZenZandaka              NUMBER;
  v_ZenRiritu               NUMBER;
  v_NowRiritu               NUMBER;
  v_Count                   NUMBER;
  v_KBN                     QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD                     QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku                 QPAS_KGCW.QPAS_KINGAKU%TYPE;

  w_Sybt                    CHAR(1);
  w_SZan                    NUMBER := 0;
  w_KZan                    NUMBER := 0;
  w_SMK                     NUMBER := 0;
  w_SMS                     NUMBER := 0;
  w_KMK                     NUMBER := 0;
  w_Cnt                     NUMBER := 0;

  v_SZan                    NUMBER := 0;
  v_KZan                    NUMBER := 0;
  v_SMK                     NUMBER := 0;
  v_SMS                     NUMBER := 0;
  v_KMK                     NUMBER := 0;
  v_SCnt                    NUMBER := 0;
  v_KCnt                    NUMBER := 0;

  w_Code                    QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE;
  w_MiseCD                  QPAX_ZANDAKATOTALW.QPAX_MISECD%TYPE;
  w_MiseNM                  QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE;
  w_SCount                  QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE;
  w_KCount                  QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE;
  w_SyosyoZandaka           QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE;
  w_KoguchiZandaka          QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE;
  w_SyosyoMisyuK            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE;
  w_SyosyoMisyuS            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE;
  w_KoguchiMisyu            QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE;

  /* 証書件数不備対応　2001/09/28 */
  v_NumFirst                NUMBER;
  v_SyainCD1_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;

  /* 行変数 */
   RowQPAG                  CurMiseV%ROWTYPE;

  v_SysCng2                 CHAR(8) := '20011101';          -- 10/23 ADD
  v_Riritu2                 NUMBER;                         -- 10/23 ADD

  /*2003/01/24 利息計算*/
  W_LoopCNT			NUMBER;						--利息計算用ループカウンタ
  W_ENDLOOPCNT		NUMBER;						--利息計算用ループ終了値
  v_GetRiritu		NUMBER;						--利息計算用利息率(旧)
  v_GetRiritu2		NUMBER;						--利息計算用利息率(新)
  v_StartRiritu		NUMBER;						--利息計算用利息求める範囲開始日での適用利率
  v_NextRiritu		NUMBER;						--利息計算用利息求める範囲終了日での適用利率
  strworkwork		NUMBER;						
  /*2003/01/24 利息計算*/

--ADD 20100225 0908047 NBC SAWAME START
 w_Str14SeiMM               CHAR(2);            --第一四半期決済月
 w_Str34SeiMM               CHAR(2);            --第三四半期決済月
--ADD 20100225 0908047 NBC SAWAME END

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
	v_wkTozaiKBN			CHAR(1);		--ワーク：東西区分
	v_wkKaisyaCD			CHAR(3);		--ワーク：会社コード
	v_wkKaisyaNM			VARCHAR2(24);	--ワーク：会社名
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

BEGIN

/* ----- ＳＴＥＰ１ 表示データ総件数取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    OtstrEndFlg   := '0';
    OtNumRecCount :=  0;
    OtNumAryCount :=  0;
    v_NumCount    :=  0;
    v_NumFirst    :=  0;	--証書件数不備対応　2001/09/28

    /* ＷＫテーブル初期化 */
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID   = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID   = InStrUserID
      AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID   = InStrUserID
      AND QPAX_COMPUTERNM = InStrComputerNM;

    /******************/
    /* 証書           */
    /******************/
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(D.QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE TO_CHAR(D.QPA8_PRMYUSIYMD,''YYYYMMDD'') <= :YMD';
    StrSQL := StrSQL || ' AND D.QPA8_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 (+)';
--    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 (+)';
--    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA8_PRMSYAINCD1,D.QPA8_PRMSYAINCD2,D.QPA8_PRMYUSIYMD';

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_YusiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_SyoyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_Riritu);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 14,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 15,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 16,v_BonusYMD2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock1>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_YusiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_SyoyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_Riritu);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 14,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 15,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 16,v_BonusYMD2);

      /* 東西区分がどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock1;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* 高島屋かどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '㈱髙島屋';
      END IF;

--2002/1/11 東西区分考慮もれ対応
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock1;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 東西区分考慮もれ対応


      /*賞与年月日１*/
      IF TO_NUMBER(v_BonusYMD1) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
      ELSE
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
        v_ZenBonusYMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD1,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /*賞与年月日２*/
      If TO_NUMBER(v_BonusYMD2) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
      ELSE
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
        v_ZenBonusYMD2 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD2,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /* 上記で求めた賞与年月日のうち大きい方を前回賞与年月日とする。*/
      IF TO_DATE(v_ZenBonusYMD1,'YYYYMMDD') < TO_DATE(v_ZenBonusYMD2,'YYYYMMDD') THEN
        v_ZenBonusYMD := v_ZenBonusYMD2;
      ELSE
        v_ZenBonusYMD := v_ZenBonusYMD1;
      END IF;
--DEL 20100225 0908047 NBC SAWAME START
--      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      --第一四半期決算月
      IF TO_NUMBER(InStrTyuSeiMM) + 3 > 12 THEN
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3 - 12);
      ELSE
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3);
      END IF;
      --第三四半期決算月
      IF TO_NUMBER(InStrSeiMM) + 3 > 12 THEN
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3 - 12);
      ELSE
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3);
      END IF;
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
          /****************************************************************************/
          /* 融資日が "2000/03/01" 以降は新計算式で、それより前は旧計算式で計算する。  /
          /****************************************************************************/
          IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng,'YYYYMMDD') THEN
              /************/
              /* 新計算式  /
              /************/
              /*************************/
              /* 給与の未収利息計算    */
              /*************************/
              /* 融資日により計算する日数を判断する。*/
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* 融資日が、指定月の前月以前の場合（指定月の２５日に天引きがある）*/
                  /* 指定月の２６日 ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := SUBSTR(InStrYMD,1,6) || '25';
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              ELSE
                  /* 融資日が、指定月の場合（指定月の２５日に天引きがない）*/
                  /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* 計算した日数から給与の未収利息を計算する。*/
---              v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* 融資日が新システム移行後 */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* 融資日が新システム移行前 */                                                    -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;
              /*************************/
              /* 賞与の未収利息計算    */
              /*************************/
              /* 融資日により計算する日数を判断する。*/
              v_TDATE := SUBSTR(InStrYMD,1,6) || '01';
              IF TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) < TO_NUMBER(SUBSTR(v_TDATE,1,6)) THEN
                  /* 融資日が、指定月の前月以前の場合*/
                  /*******************************/
                  /* 賞与の日数の判断            */
                  /*******************************/
                  /* 融資年月が前回賞与年月以降の場合は、融資日から日数を計算する。*/
                  IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                      /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                      v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  ELSE
                      /* 前回賞与年月日 ～ 指定月末日 の日数を計算する。*/
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  END IF;
              ELSE
                  /* 融資日が、指定月の場合（指定月が賞与月だとしても、天引きはない）*/
                  /* 融資日（計算する時は－１日する） ～ 指定月末日 の日数を計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* 計算した日数から賞与の未収利息を計算する。*/
---              v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* 融資日が新システム移行後 */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* 融資日が新システム移行前 */                                                    -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;                                                                               -- 10/23 UPD
          ELSE
              /************/
              /* 旧計算式  /
              /************/
              /* 給与の未収利息計算 */
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* 指定月の月初日より前の融資日の場合（2000/03/01 のシステム変更後はこっちしか通らない）*/
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * InNumKyuyoNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* 指定月の月初日以降の融資日の場合（2000/03/01 のシステム変更後はこっちは通らない）*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YusiYMD,'YYYYMMDD') + 1;
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
              /* 賞与の未収利息計算 */
              IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                  /* 融資年月が前回賞与年月以降の場合、融資日（計算する時は－１日する） ～ 指定月末日 の日数で計算する。*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* 融資日が前回賞与日以前の場合、前回賞与日 ～ 指定月末日 の日数で計算する。*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
          END IF;
      ELSE
          v_SyosyoRisokuKyuyo := 0;
          v_SyosyoRisokuSyoyo := 0;
      END IF;
      v_Zandaka := NVL(v_KyuyoZandaka,0) + NVL(v_SyoyoZandaka,0);

      /* 証書件数不備対応　2001/09/28 DELETE
      IF v_Zandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;  */
      IF v_KaisyaNM = '㈱髙島屋' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;
      /* 証書件数不備対応　2001/09/28 */
      IF v_Zandaka = 0 THEN
         GOTO l_InnerBlock1;
      END IF;
      IF v_NumFirst = 0 THEN
         v_Count := 1;
         v_SyainCD1_Save := v_SyainCD1;
         v_SyainCD2_Save := v_SyainCD2;
         v_NumFirst := 1;
      ELSE
        IF   v_SyainCD1 = v_SyainCD1_Save  AND
             v_SyainCD2 = v_SyainCD2_Save  THEN
             v_Count := 0;
        ELSE
             v_Count := 1;
             v_SyainCD1_Save := v_SyainCD1;
             v_SyainCD2_Save := v_SyainCD2;
        END IF;
      END IF;
      /* 貸付残高Ｔに追加 */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'2'
        ,NVL(v_YusiYMD,' ')
        ,NVL(v_Zandaka,0)
        ,0
        ,NVL(v_SyosyoRisokuKyuyo,0)
        ,NVL(v_SyosyoRisokuSyoyo,0)
        ,0
        ,v_Count
        ,0
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'2'
			,NVL(v_YusiYMD,' ')
			,NVL(v_Zandaka,0)
			,0
			,NVL(v_SyosyoRisokuKyuyo,0)
			,NVL(v_SyosyoRisokuSyoyo,0)
			,0
			,v_Count
			,0
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

    /******************/
    /* 小口           */
    /******************/
    /* 指定月と前月の利率を求める */
    v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
    v_ZenRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_ZenRiritu := TRUNC(v_ZenRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

    v_TDATE := TO_CHAR(TO_DATE(InStrKyuyoYMD,'YYYYMMDD') + 1,'YYYYMMDD');
    v_NowRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_NowRiritu := TRUNC(v_NowRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

--    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) - 1,'YYYYMMDD');
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');

    /* 小口退避テーブルに退避 */
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
      WHERE ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= InStrYMD))
      AND    (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
/* 11/01 UPD 入金対象範囲変更のため入金分は見ないこととする */
    /* 入金 */
--    INSERT INTO QPAS_KGCW
--      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
--      SELECT  NVL(QPA5_SYAINCD1,' '),
--        NVL(QPA5_SYAINCD2,' '),
--        '2',
--        TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
--       NVL(QPA5_NYUKINGAKU,0),
--        InStrUserID,
--        InStrComputerNM
--      FROM QPA5_KGCNYUKINT
--      WHERE ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenYMD)
--      AND    (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= InStrYMD));
    /* 賞与 */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  NVL(QPA4_SYAINCD1,' '),
        NVL(QPA4_SYAINCD2,' '),
        '4',
        TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
        NVL(QPA4_KOJOGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA4_KGCKOJOT
      WHERE ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= InStrYMD));

    /* コミット */
    COMMIT;

    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE D.QPA1_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA1_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA1_PRMSYAINCD1,D.QPA1_PRMSYAINCD2';

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_BonusYMD2,4);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock2>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_BonusYMD2);

      /* 東西区分がどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock2;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* 高島屋かどうか */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '㈱髙島屋';
      END IF;
--2002/1/11 東西区分考慮もれ対応
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock2;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 東西区分考慮もれ対応

      /* 前前月給与残高参照 */
      v_ZenZandaka := 0;
      v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT NVL(QPA3_ZANDAKA,0)';
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

      /* カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_TDATE);
      /* ローカル変数への関連づけ */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_ZenZandaka);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_ZenZandaka);
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      v_Zandaka := v_ZenZandaka;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		/* 決算時および中間決算時のみ未収利息計算を行う */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			IF v_KyuyoZandaka > 0 Then

				v_StartRiritu := QPAP_CEnt150GetRiritu(InNumKyuyoNisuFrom + 1);									--利息計算開始日時点での利息率 2003/01/24
				v_NextRiritu  := QPAP_CEnt150GetRiritu(InNumKyuyoNisuTo);										--利息計算終了日時点での利息率 2003/01/24

				IF v_StartRiritu <> v_NextRiritu THEN															-- 2003/01/24
					--１日ごとに利息率を取得して利息計算する
					W_CNT        := InNumKyuyoNisuFrom + 1;														--集計ループの開始 2003/01/24
					W_ENDLOOPCNT := InNumKyuyoNisuTo;															--集計ループの終了 2003/01/24

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;															--利息算出範囲の終わりを超えたらループ終了 2003/01/24
						END IF;

						v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);						--日ごとに適用される利率(旧制度)を取得する 2003/01/24
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					利率(新制度)を取得する 2003/01/24

						v_CRRisokuKyuyo := v_CRRisokuKyuyo + FLOOR(v_KyuyoZandaka * v_GetRiritu2);
						v_CRRisoku      := v_CRRisoku + FlOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
					END LOOP;
				ELSE	--従来の処理
---					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 / 100);			-- 10/23 UPD
---					v_CRRisoku      := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 * 10);				-- 10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu);						-- 10/23 UPD
					v_CRRisoku      := FlOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu * 1000000);				-- 10/23 UPD
				END IF;
			ELSE
				v_CRRisokuKyuyo := 0;
				v_CRRisoku := 0;
			END IF;
		ELSE
			v_CRRisokuKyuyo := 0;
			v_CRRisoku := 0;
		END IF;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
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
      StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Usr', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Cmp', InStrComputerNM);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KBN,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_YMD,8);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_Kingaku);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_Kingaku);

        IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
          IF v_KBN = '1' THEN
            v_KyuyoZandaka := v_KyuyoZandaka + v_Kingaku;
          ELSE
            v_KyuyoZandaka := v_KyuyoZandaka - v_Kingaku;
          END IF;
        ELSE
          IF v_KBN = '1' THEN
            v_Zandaka := v_Zandaka + v_Kingaku;
          ELSE
            v_Zandaka := v_Zandaka - v_Kingaku;
          END IF;
        END IF;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		/* 決算時および中間決算時のみ未収利息計算を行う */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* 第一四半期決済月、第三四半期決済月追加 */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			/* 貸付・入金のみ */
			IF v_KBN = '1' OR v_KBN = '2' THEN
				/* 給与日以降の日付 */
				IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
					/* 貸付 */
					IF v_KBN = '1' THEN
						/* 残高あり */
						--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);							--利息計算開始日時点での利息率
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);						--利息計算終了日時点での利息率

						IF v_KyuyoZandaka > 0 THEN
							/* 貸付金より残高が多い */
							IF v_KyuyoZandaka >= v_Kingaku THEN
								--１日ごとに利息率を取得して利息計算する
								IF v_StartRiritu <> v_NextRiritu THEN
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					利率(新制度)を取得する

										v_CRRisoku   := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);					--10/23 UPD
										w_Cnt        := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
									END LOOP;
								ELSE	--従来の処理
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);			--10/23 UPD
								END IF;
							/* 貸付金より残高が少ない */
							ELSE
								IF v_StartRiritu <> v_NextRiritu THEN
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := v_ZenYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																	--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);								--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					利率(新制度)を取得する

										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);		--10/23 UPD
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--ｶｳﾝﾄｱｯﾌﾟ
									END LOOP;
								ELSE
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);		--10/23 UPD
								END IF;

							End IF;
						END IF;
					/* 入金 */
					ELSE
						/* 残高あり */
						IF v_KyuyoZandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
							v_StartRiritu  := QPAP_CEnt150GetRiritu(v_YMD + 1);							--利息計算開始日時点での利息率
							v_NextRiritu   := QPAP_CEnt150GetRiritu(InStrYMD);						--利息計算終了日時点での利息率

							IF v_StartRiritu <> v_NextRiritu THEN
								W_CNT        := v_YMD;
								W_ENDLOOPCNT := v_ZenYMD;

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																	--利息算出範囲の終わりを超えたらループ終了
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);								--日ごとに適用される利率(旧制度)を取得する
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					利率(新制度)を取得する

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
								END LOOP;
							ELSE
								v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
---								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);			--10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);				--10/23 UPD
							END IF;
						END IF;
					End IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);						--10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);						--10/23 UPD
				/* 給与日以前の日付 */
				ELSE
					/* 貸付 */
					IF v_KBN = '1' Then
					/* 残高あり */
						IF v_Zandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);						--利息計算開始日時点での利息率
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);							--利息計算終了日時点での利息率

							/* 貸付金より残高が多い */
							IF v_Zandaka >= v_Kingaku Then
								IF v_StartRiritu <> v_NextRiritu THEN
									--１日ごとに利息率を取得して利息計算する
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					利率(新制度)を取得する

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);					--10/23 UPD
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
									END LOOP;
								ELSE	--従来の処理
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);			--10/23 UPD
								END IF;
								/* 貸付金より残高が少ない */
							ELSE

								IF v_StartRiritu <> v_NextRiritu THEN
									--１日ごとに利息率を取得して利息計算する
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--利息算出範囲の終わりを超えたらループ終了
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--日ごとに適用される利率(旧制度)を取得する
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					利率(新制度)を取得する

										v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
									END LOOP;
								ELSE	--利率の変更が無い時
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu / 365 * 10);			--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);				--10/23 UPD
								END IF;

							END IF;
						END IF;
					/* 入金 */
					ELSE
						--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);						--利息計算開始日時点での利息率
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);					--利息計算終了日時点での利息率

						/* 残高あり */
						IF v_Zandaka > 0 Then
							IF v_StartRiritu <> v_NextRiritu THEN
								--１日ごとに利息率を取得して利息計算する
								W_CNT        := v_YMD + 1;
								W_ENDLOOPCNT := InStrKyuyoYMD;

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																				--利息算出範囲の終わりを超えたらループ終了
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--日ごとに適用される利率(旧制度)を取得する
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					利率(新制度)を取得する
									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
								END LOOP;
							ELSE
								v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
---								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);		--10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);			--10/23 UPD
							END IF;
						END IF;
					END IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);			--10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);			--10/23 UPD
				END IF;
			END IF;
		END IF;

      END LOOP;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      IF v_KyuyoZandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;
      IF v_KaisyaNM = '㈱髙島屋' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;

      /* 貸付残高Ｔに追加 */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'1'
        ,NULL
        ,0
        ,NVL(v_KyuyoZandaka,0)
        ,0
        ,0
        ,NVL(v_CRRisokuKyuyo,0)
        ,0
        ,v_Count
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'1'
			,NULL
			,0
			,NVL(v_KyuyoZandaka,0)
			,0
			,0
			,NVL(v_CRRisokuKyuyo,0)
			,0
			,v_Count
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

    /* 貸付残高合計表ワークテーブル作成 */
    --カーソルオープン
    IF CurMiseV%ISOPEN = FALSE THEN
      OPEN CurMiseV();
    END IF;

    --ＦＥＴＣＨ
    LOOP
      FETCH CurMiseV INTO RowQPAG;                      --順読み
      IF CurMiseV%NOTFOUND THEN
        EXIT;                               --ループ終了
      END IF;

      v_SZan := 0;
      v_KZan := 0;
      v_SMK := 0;
      v_SMS := 0;
      v_KMK := 0;
      v_SCnt := 0;
      v_KCnt := 0;

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
		v_wkKaisyaCD	:= '';
		v_wkKaisyaNM	:= '';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' NVL(QPAV_KAISYACD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAV_KAISYANM,'' ''),';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' NVL(QPAV_SYUBETU,'' ''),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUK),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUS),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIMISYU),';
      StrSQL := StrSQL || ' COUNT(QPAV_SYAINCD2)';
      StrSQL := StrSQL || ' FROM QPAV_ZANDAKASUMV';
      StrSQL := StrSQL || ' WHERE QPAV_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAV_COMPUTERNM = :CMP';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' AND QPAV_TOZAIKBN = :Tozai';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' AND QPAV_MISECD = :Mise';
      StrSQL := StrSQL || ' GROUP BY QPAV_USERID,QPAV_COMPUTERNM,';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' QPAV_KAISYACD,QPAV_KAISYANM,QPAV_TOZAIKBN,';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' QPAV_MISECD,QPAV_SYUBETU';

      /* 動的カーソルのオープン */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Mise', RowQPAG.QPAV_MISECD);
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Tozai', RowQPAG.QPAV_TOZAIKBN);
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      /* 出力変数のバインド */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Cnt);
*/
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_wkKaisyaCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_wkKaisyaNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* SQLの実行 */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
			--残高データが存在しない時は、店コードから会社情報を確定する
			v_NumCount := 0;
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT COUNT(*)';
			StrSQL := StrSQL || ' FROM QPAH_OTHERM';
			StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
			StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
			/* カーソルのオープン */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQLの解析 */
			DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
			/* 入力変数をバインドする */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', RowQPAG.QPAV_MISECD);
			/* ローカル変数への関連づけ */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
			/* SQLの実行 */
			v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
			END IF;
			/* カーソルのクローズ */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			IF v_NumCount = 0 THEN
				v_wkKaisyaCD	:= RowQPAG.QPAV_MISECD;
				v_wkKaisyaNM	:= RowQPAG.QPAV_MISENM;
			ELSE
				v_wkKaisyaCD	:= '000';
				v_wkKaisyaNM	:= '㈱髙島屋';
			END IF;
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

          EXIT;
        END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Cnt);
*/
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_wkKaisyaCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_wkKaisyaNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
        v_SZan := v_SZan + w_SZan;
        v_KZan := v_KZan + w_KZan;
        v_SMK  := v_SMK  + w_SMK;
        v_SMS  := v_SMS  + w_SMS;
        v_KMK  := v_KMK  + w_KMK;
        IF w_Sybt = '1' THEN
          v_KCnt := w_Cnt;
  ELSE
          v_SCnt := w_Cnt;
  END IF;
      END LOOP;
      /* 動的カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAX_ZANDAKATOTALW VALUES (
         NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
        ,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
        ,NVL(RowQPAG.QPAV_CODE,' ')
        ,NVL(RowQPAG.QPAV_MISECD,' ')
        ,NVL(RowQPAG.QPAV_MISENM,' ')
        ,NVL(v_SZan,0)
        ,NVL(v_KZan,0)
        ,NVL(v_SMK,0)
        ,NVL(v_SMS,0)
        ,NVL(v_KMK,0)
        ,NVL(v_SCnt,0)
        ,NVL(v_KCnt,0)
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
*/
		INSERT INTO QPAX_ZANDAKATOTALW VALUES (
			 NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
			,NVL(RowQPAG.QPAV_CODE,' ')
			,NVL(RowQPAG.QPAV_MISECD,' ')
			,NVL(RowQPAG.QPAV_MISENM,' ')
			,NVL(v_SZan,0)
			,NVL(v_KZan,0)
			,NVL(v_SMK,0)
			,NVL(v_SMS,0)
			,NVL(v_KMK,0)
			,NVL(v_SCnt,0)
			,NVL(v_KCnt,0)
			,NVL(InStrUserID,' ')
			,NVL(InStrComputerNM,' ')
			,NVL(v_wkKaisyaCD,' ')
			,NVL(v_wkKaisyaNM,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBN,' ')
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
    END LOOP;

    /* カーソルのクローズ */
    CLOSE CurMiseV;

    /* コミット */
    COMMIT;

    /* 総件数取得 */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- ＳＴＥＰ２ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN       --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* 貸付残高合計Ｔ検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAX_CODE,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOCOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHICOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUK,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUS,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIMISYU,0)';
    StrSQL := StrSQL || ' FROM QPAX_ZANDAKATOTALW';
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' WHERE (QPAX_TOZAIKBNE = :KBN';
--    StrSQL := StrSQL || ' OR QPAX_TOZAIKBNW = :KBN)';
--    StrSQL := StrSQL || ' AND QPAX_USERID = :USR';
--    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' WHERE';
    StrSQL := StrSQL || '     QPAX_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' ORDER BY QPAX_MISECD';
    StrSQL := StrSQL || ' ORDER BY';
    StrSQL := StrSQL || '     QPAX_KAISYACD,';
    StrSQL := StrSQL || '     QPAX_TOZAIKBN,';
    StrSQL := StrSQL || '     QPAX_MISECD';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
/* DEL 20100715 1004091 IMZ SHIBUTANI START */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', InStrTozaiKBN);
/* DEL 20100715 1004091 IMZ SHIBUTANI END */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* ２回目以降はカーソルを再利用する */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Code,10);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_SCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_KCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SyosyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KoguchiZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SyosyoMisyuK);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_SyosyoMisyuS);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_KoguchiMisyu);

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Code);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_SCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_KCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SyosyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KoguchiZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SyosyoMisyuK);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_SyosyoMisyuS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_KoguchiMisyu);

    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrCode(NumIdx) := w_Code;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtNumSCount(NumIdx) := w_SCount;
    OtNumKCount(NumIdx) := w_KCount;
    OtNumSyosyoZandaka(NumIdx) := w_SyosyoZandaka;
    OtNumKoguchiZandaka(NumIdx) := w_KoguchiZandaka;
    OtNumSyosyoMisyuK(NumIdx) := w_SyosyoMisyuK;
    OtNumSyosyoMisyuS(NumIdx) := w_SyosyoMisyuS;
    OtNumKoguchiMisyu(NumIdx) := w_KoguchiMisyu;

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
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    IF CurMiseV%ISOPEN THEN
      CLOSE CurMiseV;
    END IF;
    RAISE ;

END QPAP_CEnt150SelList_After;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt150GetRiritu                                                */
/* 機能          ：小口融資利率取得                                                     */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt150GetRiritu(
   InStrYMD   IN  CHAR) RETURN NUMBER IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_Dummy       INTEGER;
  v_Riritu      NUMBER := 0;
  v_HenkoRiritu     QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

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
END QPAP_CEnt150GetRiritu;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt150DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt150DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名

BEGIN
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID     = InStrUserID
        AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID     = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID     = InStrUserID
        AND QPAX_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt150DelWorkTbl;

END QPAP_CEnt150PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
