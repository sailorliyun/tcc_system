CREATE OR REPLACE PACKAGE  QPAP_CEnt050PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt050PkG                                                                                */
/* 機能          ：貸付金日報                                                                                     */
/* 作成日        ：2001/07/07                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typOtTorihikiHMSAry IS TABLE OF CHAR(6)
    INDEX BY BINARY_INTEGER;
  TYPE typOtKasitukeAry IS TABLE OF QPAK_KASITUKEW.QPAK_KASITUKETEN%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtWSNameAry IS TABLE OF QPAK_KASITUKEW.QPAK_WSNAME%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtMiseCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_MISECD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtBumonCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_BUMONCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyainCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_SYAINCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSimeiKanjiAry IS TABLE OF QPAK_KASITUKEW.QPAK_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtKingakuAry IS TABLE OF QPAK_KASITUKEW.QPAK_KINGAKU%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAK_KASITUKEW.QPAK_ZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtGendoAry IS TABLE OF QPAK_KASITUKEW.QPAK_GENDO%TYPE
    INDEX BY BINARY_INTEGER;

/* 貸付金日報データ取得 */
PROCEDURE QPAP_CEnt050SelList (
   InStrTorihikiYMD   IN    CHAR                    --抽出キー  取引年月日
  ,InStrUserID      IN    VARCHAR2                  --ユーザーID
  ,InStrCompNM      IN    VARCHAR2                  --コンピューター名称
  ,InNumMaxRec      IN    NUMBER                    --最大配列格納件数
  ,IoNumCursor      IN    OUT NUMBER                  --カーソルＩＤ
  ,OtStrTorihikiHMS   OUT   typOtTorihikiHMSAry             --取引時刻
  ,OtStrKasituketen   OUT   typOtKasitukeAry              --貸付店
  ,OtStrWSName      OUT   typOtWSNameAry                --ＷＳ名
  ,OtStrMiseCD      OUT   typOtMiseCDAry                --店コード
  ,OtStrBumonCD     OUT   typOtBumonCDAry               --部門コード
  ,OtStrSyainCD     OUT   typOtSyainCDAry               --社員コード
  ,OtStrSimeiKanji    OUT   typOtSimeiKanjiAry              --氏名漢字
  ,OtNumKingaku     OUT   typOtKingakuAry               --金額
  ,OtNumZandaka     OUT   typOtZandakaAry               --残高
  ,OtNumGendo       OUT   typOtGendoAry               --限度額
  ,OtNumRecCount      OUT   NUMBER                    --総検索件数
  ,OtNumAryCount      OUT   NUMBER                    --配列格納件数
  ,OtStrEndFlg      OUT   VARCHAR2);                  --検索終了フラグ

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt050DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);       --コンピュータ名

END QPAP_CEnt050PkG;

/
SHOW ERROR

/******************************************************************************************************************/
/*  ２  ボディー                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt050PkG IS

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt050SelList                                                                            */
/* 機能          ：貸付金日報データ取得                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt050SelList (
   InStrTorihikiYMD   IN    CHAR                    --抽出キー  取引年月日
  ,InStrUserID      IN    VARCHAR2                  --ユーザーID
  ,InStrCompNM      IN    VARCHAR2                  --コンピューター名称
  ,InNumMaxRec      IN    NUMBER                    --最大配列格納件数
  ,IoNumCursor      IN    OUT NUMBER                  --カーソルＩＤ
  ,OtStrTorihikiHMS   OUT   typOtTorihikiHMSAry             --取引時刻
  ,OtStrKasituketen   OUT   typOtKasitukeAry              --貸付店
  ,OtStrWSName      OUT   typOtWSNameAry                --ＷＳ名
  ,OtStrMiseCD      OUT   typOtMiseCDAry                --店コード
  ,OtStrBumonCD     OUT   typOtBumonCDAry               --部門コード
  ,OtStrSyainCD     OUT   typOtSyainCDAry               --社員コード
  ,OtStrSimeiKanji    OUT   typOtSimeiKanjiAry              --氏名漢字
  ,OtNumKingaku     OUT   typOtKingakuAry               --金額
  ,OtNumZandaka     OUT   typOtZandakaAry               --残高
  ,OtNumGendo       OUT   typOtGendoAry               --限度額
  ,OtNumRecCount      OUT   NUMBER                    --総検索件数
  ,OtNumAryCount      OUT   NUMBER                    --配列格納件数
  ,OtStrEndFlg      OUT   VARCHAR2) IS                --検索終了フラグ

  /* 処理固有の変数 */
  StrSQL          VARCHAR2(1000);
  v_CursorID        NUMBER := 0;
  v_CursorID2       NUMBER := 0;
  v_CursorID3       NUMBER := 0;
  v_NumCount        NUMBER;
  v_Dummy         INTEGER;
  v_Dummy2        INTEGER;
  v_Dummy3        INTEGER;
  NumIdx          NUMBER;

  v_TorihikiYMD     CHAR(8);
  v_TorihikiHMS     CHAR(6);
  v_SyainCD       QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE;
  v_Kingaku       QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_WSName        QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE;
  v_Kanriten        QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE;
  v_SimeiKanji      QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD       QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku       QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka      QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_KanritenNM      QPAE_MISEM.QPAE_MISENM%TYPE;
  v_ZandakaYMD      CHAR(8);
  v_Kasituke        QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  w_TorhikiHMS      QPAK_KASITUKEW.QPAK_TORIHIKIHMS%TYPE;
  w_Kasituketen     QPAK_KASITUKEW.QPAK_KASITUKETEN%TYPE;
  w_WSName        QPAK_KASITUKEW.QPAK_WSNAME%TYPE;
  w_MiseCD        QPAK_KASITUKEW.QPAK_MISECD%TYPE;
  w_BumonCD       QPAK_KASITUKEW.QPAK_BUMONCD%TYPE;
  w_SyainCD       QPAK_KASITUKEW.QPAK_SYAINCD%TYPE;
  w_SimeiKanji      QPAK_KASITUKEW.QPAK_SIMEIKANJI%TYPE;
  w_Kingaku       QPAK_KASITUKEW.QPAK_KINGAKU%TYPE;
  w_Zandaka       QPAK_KASITUKEW.QPAK_ZANDAKA%TYPE;
  w_Gendogaku       QPAK_KASITUKEW.QPAK_GENDO%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     -- 11/01 ADD

BEGIN

/* ----- ＳＴＥＰ１ ＷＴデータ作成 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* サーバーＳＹＳＴＥＭ日付 */
    v_SysDate := '00000000';
    SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

    /* 前々回給与日を算出 */
/* 2001/10/02 不具合修正
    IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
    ELSE
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
    END IF;
*/
    /* 前回給与日を算出 */
    IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
      v_ZenKyuyoYMD := SUBSTR(v_SysDate,1,6) || '25';
    ELSE
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
    END IF;

    OtstrEndFlg := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount := 0;

    /* ワークテーブルの初期化 */
    DELETE FROM  QPAK_KASITUKEW
    WHERE QPAK_USERID = InStrUserID
    AND QPAK_COMPUTERNM = InStrCompNM;

    /* 小口融資貸付テーブル存在チェックＳＱＬ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' COUNT(*)';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') = :YMD';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrTorihikiYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
    /* ローカル変数への関連づけ */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* 変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 社員マスタ未存在 → エラー */
--    IF v_NumCount = 0 THEN
--      RETURN;
--    END IF;

    /* 小口融資貸付テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
    StrSQL := StrSQL || ' NVL(QPA6_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPA6_WSNAME,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA6_KANRITEN,'' '')';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') = :YMD';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';
    StrSQL := StrSQL || ' ORDER BY QPA6_SYAINCD,QPA6_TORIHIKIHMS';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrTorihikiYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SyainCD,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kingaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_WSName,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_Kanriten,3);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SyainCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_WSName);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_Kanriten);

      /* 社員情報を取得 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(A.QPAC_SIMEIKANJI,'' ''),';
      StrSQL := StrSQL || ' NVL(A.QPAC_MISECD,'' ''),';
      StrSQL := StrSQL || ' NVL(B.QPAE_MISENM,'' ''),';
      StrSQL := StrSQL || ' NVL(A.QPAC_BUMONCD,'' ''),';
      StrSQL := StrSQL || ' NVL(C.QPAF_BUMONNM,'' ''),';
      StrSQL := StrSQL || ' NVL(D.QPA1_GENDOGAKU,0),';
      StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0)';
      StrSQL := StrSQL || ' FROM QPAC_SYAINM A,QPAE_MISEM B,QPAF_BUMONM C,QPA1_KGCDAICYOT D';
      StrSQL := StrSQL || ' WHERE A.QPAC_PRMSYAINCD1 = :CODE1';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = :CODE2';
      StrSQL := StrSQL || ' AND A.QPAC_MISECD = B.QPAE_PRMMISECD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_MISECD = C.QPAF_PRMMISECD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_BUMONCD = C.QPAF_PRMBUMONCD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD1 = D.QPA1_PRMSYAINCD1 (+)';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = D.QPA1_PRMSYAINCD2 (+)';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SimeiKanji,20);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_MiseCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_MiseNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_BumonCD,6);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,5,v_BumonNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,6,v_Gendogaku);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,7,v_KyuyoZandaka);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      /* FETCH */
      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SimeiKanji);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_MiseCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_MiseNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_BumonCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,5,v_BumonNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,6,v_Gendogaku);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,7,v_KyuyoZandaka);
      END LOOP;

      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* 管理店名称の取得 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(QPAE_MISENM,'' '')';
      StrSQL := StrSQL || ' FROM QPAE_MISEM';
      StrSQL := StrSQL || ' WHERE QPAE_PRMMISECD = :MISE';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':MISE', v_Kanriten);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KanritenNM,24);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      /* FETCH */
      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KanritenNM);
      END LOOP;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* 小口融資残高履歴検索 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' TO_CHAR(MAX(QPA3_PRMZANDAKAYMD),''YYYYMMDD'')';
      StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
      StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :CODE1';
      StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :CODE2';
      StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :CODE3';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
      StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';

      /* 動的カーソルのオープン */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE3', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',v_ZenKyuyoYMD);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_ZandakaYMD,8);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      LOOP
--2001/11/30 残高履歴が存在しない場合も処理続行に変更
--        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
--          EXIT;
--        END IF;
--        /* カラム値を変数へ格納 */
--        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);


--2001/11/30 残高履歴が存在しない場合も処理続行に変更
        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          v_ZandakaYMD := '19880101';
        ELSE
          /* カラム値を変数へ格納 */
          DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);
        END IF;

        /* 11/01 ADD 入金用対象日付変更 */
        v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

        /* 小口融資貸付検索 */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
        StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
        StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';

--2001/11/30 取消フラグの条件を修正
--        StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
        StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

        StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':FLG', '1');
        /* 出力変数のバインド */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kasituke);
        /* SQLの実行 */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* カラム値を変数へ格納 */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kasituke);
          v_KyuyoZandaka := v_KyuyoZandaka + v_Kasituke;
        END LOOP;
        /* カーソルのクローズ */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

        /* 小口融資入金検索 */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
        StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
        StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :CODE2';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', ' ');
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
        /* 出力変数のバインド */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Nyukin);
        /* SQLの実行 */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* カラム値を変数へ格納 */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Nyukin);
          v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukin;
        END LOOP;
        /* カーソルのクローズ */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

/*****************************************************************************/
/* 賞与控除は見ないこととする                                                */
/*****************************************************************************/
        /* 小口融資賞与控除検索 */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
        StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
        StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :CODE2';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', ' ');
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
        /* 出力変数のバインド */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kojo);
        /* SQLの実行 */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* カラム値を変数へ格納 */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kojo);
          v_KyuyoZandaka := v_KyuyoZandaka - v_Kojo;
        END LOOP;
        /* カーソルのクローズ */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

--2001/11/30 残高履歴が存在しない場合も処理続行に変更
--        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          EXIT;
--        END IF;

      END LOOP;

      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* ワークテーブル追加 */
      INSERT INTO QPAK_KASITUKEW VALUES (
         NVL(v_TorihikiYMD,' ')
        ,NVL(v_TorihikiHMS,' ')
        ,NVL(v_WSName,' ')
        ,NVL(v_KanritenNM,' ')
        ,NVL(v_SyainCD,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(v_Kingaku,0)
        ,NVL(v_KyuyoZandaka,0)
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_Gendogaku,0)
        ,1
        ,InStrUserID
        ,InStrCompNM);
    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* コミット */
    COMMIT;

  END IF;

/* ----- ＳＴＥＰ２ 表示データ総件数取得 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* ワークテーブル存在チェックＳＱＬ */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAK_KASITUKEW
    WHERE QPAK_USERID = InStrUserID AND QPAK_COMPUTERNM = InStrCompNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- ＳＴＥＰ３ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* 小口融資貸付テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAK_TORIHIKIHMS,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_KASITUKETEN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_WSNAME,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_KINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPAK_ZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAK_GENDO,0)';
    StrSQL := StrSQL || ' FROM QPAK_KASITUKEW';
    StrSQL := StrSQL || ' WHERE QPAK_USERID = :UserID';
    StrSQL := StrSQL || ' AND QPAK_COMPUTERNM = :CompNM';
    StrSQL := StrSQL || ' ORDER BY QPAK_SYAINCD,QPAK_TORIHIKIHMS';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

    --入力変数をバインドする
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':UserID',InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CompNM',InStrCompNM);

    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

  ELSE
    /* ２回目以降はカーソルを再利用する */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;   --パラメータにセット

/* ----- ＳＴＥＰ３ 表示データ編集 ----- */
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_TorhikiHMS,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_Kasituketen,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_WSName,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_MiseCD,3);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_BumonCD,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SyainCD,7);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SimeiKanji,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_Kingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Zandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,w_Gendogaku);
  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_TorhikiHMS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_Kasituketen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_WSName);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_MiseCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_BumonCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SyainCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_Kingaku);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Zandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,10,w_Gendogaku);

    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrTorihikiHMS(NumIdx) := w_TorhikiHMS;
    OtStrKasituketen(NumIdx) := w_Kasituketen;
    OtStrWSName(NumIdx) := w_WSName;
    OtStrMiseCD(NumIdx) := w_MiseCD;
    OtStrBumonCD(NumIdx) := w_BumonCD;
    OtStrSyainCD(NumIdx) := w_SyainCD;
    OtStrSimeiKanji(NumIdx) := w_SimeiKanji;
    OtNumKingaku(NumIdx) := w_Kingaku;
    OtNumZandaka(NumIdx) := w_Zandaka;
    OtNumGendo(NumIdx) := w_Gendogaku;

    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;                          --パラメータにセット
  OtStrEndFlg := '1';                             --パラメータにセット（検索終了）

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
    IF DBMS_SQL.IS_OPEN (v_CursorID3) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID3);
    END IF;
    RAISE ;
END QPAP_CEnt050SelList;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt050DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt050DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名

BEGIN
    DELETE FROM  QPAK_KASITUKEW
     WHERE QPAK_USERID     = InStrUserID
       AND QPAK_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt050DelWorkTbl;


END QPAP_CEnt050PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
