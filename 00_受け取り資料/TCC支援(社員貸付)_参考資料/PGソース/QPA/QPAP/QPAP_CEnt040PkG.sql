CREATE OR REPLACE PACKAGE  QPAP_CEnt040PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                             */
/* モジュール名  ：QPAP_CEnt040PkG                                                                                */
/* 機能          ：入金日報                                                                                       */
/* 作成日        ：2001/07/07                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
----------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20100225  TR1001-001         社員貸付入金日報残高誤り
--                             入金Tの検索条件を修正
--                             v_ZandakaYMD_N <= 入金日 <= 該当行の入金日
--                               → v_ZandakaYMD_N < 入金日 <= 該当行の入金日
----------------------------------------------------------------------------------------------
/******************************************************************************************************************/
/*１  宣言部                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typOtTorokuYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;
  TYPE typOtMiseNMAry IS TABLE OF QPAJ_NYUKINW.QPAJ_MISENM%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtBumonNmAry IS TABLE OF QPAJ_NYUKINW.QPAJ_BUMONNM%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyainCDAry IS TABLE OF QPAJ_NYUKINW.QPAJ_SYAINCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSimeiKanjiAry IS TABLE OF QPAJ_NYUKINW.QPAJ_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtNyukingakuAry IS TABLE OF QPAJ_NYUKINW.QPAJ_NYUKINGAKU%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAJ_NYUKINW.QPAJ_ZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtGendoAry IS TABLE OF QPAJ_NYUKINW.QPAJ_GENDO%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtNyukinYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

/* 入金日報データ取得 */
PROCEDURE QPAP_CEnt040SelList (
   InStrYMD1      IN    CHAR                      --抽出キー  開始年月日
  ,InStrYMD2      IN    CHAR                      --終了年月日
  ,InStrKBN     IN    CHAR                      --区分
  ,InNumMaxRec    IN    NUMBER                      --最大配列格納件数
  ,IoNumCursor    IN    OUT NUMBER                    --カーソルＩＤ
  ,OtStrTorokuYMD   OUT   typOtTorokuYMDAry               --処理日付
  ,OtStrMiseNM    OUT   typOtMiseNMAry                  --店名
  ,OtStrBumonNM   OUT   typOtBumonNmAry                 --部門名
  ,OtStrSyainCD   OUT   typOtSyainCDAry                 --社員コード
  ,OtStrSimeikanji  OUT   typOtSimeiKanjiAry                --氏名漢字
  ,OtStrNyukingaku  OUT   typOtNyukingakuAry                --入金額
  ,OtStrZandaka   OUT   typOtZandakaAry                 --残高
  ,OtNumGendo     OUT   typOtGendoAry                 --限度額
  ,OtNumNyukinYMD   OUT   typOtNyukinYMDAry               --入金日付
  ,OtNumRecCount    OUT   NUMBER                      --総検索件数
  ,OtNumAryCount    OUT   NUMBER                      --配列格納件数
  ,OtStrEndFlg    OUT   VARCHAR2                    --検索終了フラグ
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE);

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt040DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);       --コンピュータ名


END QPAP_CEnt040PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  ２  ボディー                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt040PkG IS

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt040SelList                                                                            */
/* 機能          ：入金日報データ取得                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt040SelList (
   InStrYMD1    IN    CHAR                      --抽出キー  開始年月日
  ,InStrYMD2    IN    CHAR                      --終了年月日
  ,InStrKBN   IN    CHAR                      --区分
  ,InNumMaxRec    IN    NUMBER                      --最大配列格納件数
  ,IoNumCursor    IN    OUT NUMBER                    --カーソルＩＤ
  ,OtStrTorokuYMD   OUT   typOtTorokuYMDAry               --処理日付
  ,OtStrMiseNM    OUT   typOtMiseNMAry                  --店名
  ,OtStrBumonNM   OUT   typOtBumonNmAry                 --部門名
  ,OtStrSyainCD   OUT   typOtSyainCDAry                 --社員コード
  ,OtStrSimeikanji  OUT   typOtSimeiKanjiAry                --氏名漢字
  ,OtStrNyukingaku  OUT   typOtNyukingakuAry                --入金額
  ,OtStrZandaka   OUT   typOtZandakaAry                 --残高
  ,OtNumGendo   OUT   typOtGendoAry                 --限度額
  ,OtNumNyukinYMD   OUT   typOtNyukinYMDAry               --入金日付
  ,OtNumRecCount    OUT   NUMBER                      --総検索件数
  ,OtNumAryCount    OUT   NUMBER                      --配列格納件数
  ,OtStrEndFlg    OUT   VARCHAR2                  --検索終了フラグ
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE) IS

  /* 処理固有の変数 */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_CursorID3     NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;
  v_Dummy3      INTEGER;
  NumIdx        NUMBER;

  v_SyainCD1      QPA5_KGCNYUKINT.QPA5_SYAINCD1%TYPE;
  v_SyainCD2      QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE;
  v_NyukinYMD     CHAR(8);
  v_Nyukingaku    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_TorokuYMD     CHAR(8);
  v_SimeiKanji    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD      QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM      QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD     QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM     QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku     QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka    QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD    CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin      QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  w_TorokuYMD     QPAJ_NYUKINW.QPAJ_TOROKUYMD%TYPE;
  w_MiseNM      QPAJ_NYUKINW.QPAJ_MISENM%TYPE;
  w_BumonNM     QPAJ_NYUKINW.QPAJ_BUMONNM%TYPE;
  w_SyainCD     QPAJ_NYUKINW.QPAJ_SYAINCD%TYPE;
  w_SimeiKanji    QPAJ_NYUKINW.QPAJ_SIMEIKANJI%TYPE;
  w_Nyukingaku    QPAJ_NYUKINW.QPAJ_NYUKINGAKU%TYPE;
  w_Zandaka     QPAJ_NYUKINW.QPAJ_ZANDAKA%TYPE;
  w_Gendo       QPAJ_NYUKINW.QPAJ_GENDO%TYPE;
  w_NyukinYMD     QPAJ_NYUKINW.QPAJ_NYUKINYMD%TYPE;
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
    DELETE FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID = InStrUserID
      AND QPAJ_COMPUTERNM = InStrComputerNM;

    /* 小口融資入金テーブル存在チェックＳＱＬ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT COUNT(*)';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    IF InStrKBN = '0' THEN
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    ELSE
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    END IF;

    /* カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrYMD2);
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

    /* 入金テーブル未存在 → エラー */
    IF v_NumCount = 0 THEN
      RETURN;
    END IF;

    /* 小口融資入金テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA5_SYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA5_SYAINCD2,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(QPA5_NYUKINGAKU,0),';
    StrSQL := StrSQL || ' TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'')';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    IF InStrKBN = '0' THEN
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    ELSE
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    END IF;
    StrSQL := StrSQL || ' ORDER BY QPA5_TOROKUYMD,QPA5_NYUKINYMD,QPA5_SYAINCD1,QPA5_SYAINCD2';

    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrYMD2);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_NyukinYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Nyukingaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_TorokuYMD,8);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_NyukinYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Nyukingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_TorokuYMD);

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
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
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
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE3', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',v_ZenKyuyoYMD);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_ZandakaYMD,8);
      /* SQLの実行 */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      LOOP
        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);

        /* 11/01 ADD 入金用対象日付変更 */
        v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

        /* 小口融資貸付検索 */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
        StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
        StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') >= :YMD1';
--2001/12/18 Del        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';

-- Modified by imz.yoshida 取消フラグの条件を修正 2003/09/17 ==>
-- --2001/11/30 取消フラグの条件を修正
-- --        StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
-- --        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';
--        StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
--        StrSQL := StrSQL || '   OR RTRIM(QPA6_TORIKESHIFLG) = '''' ';
        StrSQL := StrSQL || ' AND (RTRIM(QPA6_TORIKESHIFLG) IS NULL';
-- Modified by imz.yoshida <==

        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

        StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD2);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
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
--MOD 20100225 TR1001-001 NBC SAWAME START
--        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') >= :YMD1';
        --最終控除の月の月末を含まない
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';
--MOD 20100225 TR1001-001 NBC SAWAME END
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
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

/****************************************************************************/
/* 賞与控除は見ないこととする                                               */
/* 2001/12/06 賞与控除履歴は見る  よって  コメントはずし  */
/***********************************************************************/
----↓コメント外し
        /* 小口融資賞与控除検索 */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
        StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
        StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :CODE2';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') >= :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';

        /* 動的カーソルのオープン */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQLの解析 */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* 入力変数をバインドする */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
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
----↑コメント外し
      END LOOP;

      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* STOP PRESS!! ***************************/
      /* 求めた残高から、今回の入金額を差し引く */
      /* この処理は本当に必要なのか？           */
      /* ２重引きをしているのでは？             */
      /* STOP PRESS!! ***************************/
--      v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukingaku;

      /* ワークテーブル追加 */
      INSERT INTO QPAJ_NYUKINW VALUES (
         NVL(v_MiseCD,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(v_Nyukingaku,0)
        ,NVL(v_KyuyoZandaka,0)
        ,NVL(v_Gendogaku,0)
        ,NVL(v_NyukinYMD,' ')
        ,NVL(v_TorokuYMD,' ')
        ,1
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
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
    SELECT COUNT(*) INTO v_NumCount FROM QPAJ_NYUKINW
    WHERE QPAJ_USERID = InStrUserID AND QPAJ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- ＳＴＥＰ３ 表示データ取得 ----- */
  IF IoNumCursor = 0 THEN   --１回目のＳＰの起動の場合（カーソルＩＤが採番されていない場合）
    /* 小口融資貸付テーブル検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAJ_TOROKUYMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_NYUKINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_ZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_GENDO,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_NYUKINYMD,'' '')';
    StrSQL := StrSQL || ' FROM QPAJ_NYUKINW';
    StrSQL := StrSQL || ' WHERE QPAJ_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAJ_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' ORDER BY QPAJ_TOROKUYMD,QPAJ_SYOZOKUTENCD,';
    StrSQL := StrSQL || ' QPAJ_SYOZOKUBUMONCD,QPAJ_SYAINCD,QPAJ_NYUKINYMD';

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
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_TorokuYMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_BumonNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SyainCD,7);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SimeiKanji,20);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_Nyukingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Zandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_Gendo);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_NyukinYMD,8);
  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_TorokuYMD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_BumonNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SyainCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_Nyukingaku);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Zandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_Gendo);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_NyukinYMD);

    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrTorokuYMD(NumIdx) := w_TorokuYMD;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtStrBumonNM(NumIdx) := w_BumonNM;
    OtStrSyainCD(NumIdx) := w_SyainCD;
    OtStrSimeikanji(NumIdx) := w_SimeiKanji;
    OtStrNyukingaku(NumIdx) := w_Nyukingaku;
    OtStrZandaka(NumIdx) := w_Zandaka;
    OtNumGendo(NumIdx) := w_Gendo;
    OtNumNyukinYMD(NumIdx) := w_NyukinYMD;

    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;      --パラメータにセット
  OtStrEndFlg := '1';       --パラメータにセット（検索終了）

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
END QPAP_CEnt040SelList;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt040DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt040DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名

BEGIN
    DELETE  FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID     = InStrUserID
        AND QPAJ_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt040DelWorkTbl;



END QPAP_CEnt040PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
