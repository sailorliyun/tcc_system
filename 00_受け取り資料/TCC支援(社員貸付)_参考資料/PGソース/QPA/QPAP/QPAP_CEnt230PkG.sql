CREATE OR REPLACE PACKAGE  QPAP_CEnt230PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* モジュール名  ：QPAP_CEnt230PkG                                                                                */
/* 機能          ：退職予定者一覧                                                                                 */
/* 作成日        ：2001/07/10                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*１  宣言部                                                              */
/******************************************************************************************************************/

/* 各行を格納するための配列定義 */
  TYPE typOtTaisyokuYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyainCDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

  TYPE typOtSimeiAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtTozaiKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtBumonCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
    INDEX BY BINARY_INTEGER;

/* 退職予定者データ取得 */
PROCEDURE QPAP_CEnt230SelList (
   InStrTaisyokuYMDSt   IN      CHAR                  --検索用退職年月日St
  ,InStrTaisyokuYMDEd   IN      CHAR                  --検索用退職年月日Ed
  ,InStrUserID      IN      CHAR                  --ユーザーID
  ,InStrCompNM      IN      CHAR                  --コンピューター名称
  ,InNumMaxRec        IN      NUMBER                  --最大配列格納件数
  ,IoNumSpCnt         IN OUT    NUMBER                  --呼び出し回数
  ,OtStrTaisyokuYMD   OUT     typOtTaisyokuYMDAry           --退職年月日
  ,OtStrSyainCD     OUT     typOtSyainCDAry             --社員コード1+社員コード2
  ,OtStrSimei       OUT     typOtSimeiAry             --氏名
  ,OtStrMiseCD      OUT     typOtOtMiseCDAry            --所属店コード
  ,OtStrMiseNM      OUT     typOtMiseNMAry              --所属店名
  ,OtStrTozaiKBN      OUT     typOtTozaiKBNAry            --東西区分
  ,OtStrBumonCD     OUT     typOtBumonCDAry             --所属部門コード
  ,OtStrBumonNM     OUT     typOtBumonNMAry             --所属部門名称
  ,OtNumAryCount      OUT     NUMBER                  --配列格納件数
  ,OtStrEndFlg      OUT     VARCHAR2);                --検索終了フラグ

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt230DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --ユーザーＩＤ
   InStrComputerNM IN  VARCHAR2);       --コンピュータ名

/* 台帳の存在チェック */
FUNCTION  QPAP_CEnt230Count(
   InStrSyainCD1   IN  CHAR,            --社員コード１
   InStrSyainCD2   IN  CHAR)            --社員コード２
RETURN NUMBER;

END QPAP_CEnt230PkG;
/
show error
/******************************************************************************************************************/
/*２  ボディー                                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt230PkG IS
  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

  /* 検索完了時のみ開放するカーソル */
  CURSOR CurCEnt230(UserID IN VARCHAR2,CompNM IN VARCHAR2) IS
      SELECT   QPAR_SYAINCD,QPAR_SYAINNM,QPAR_MISECD,QPAR_MISENM,
           QPAR_TOZAIKBN,QPAR_BUMONCD,QPAR_BUMONNM,QPAR_TAISYOKUYMD
      FROM   QPAR_TAISYOKUW
      WHERE  QPAR_USERID = UserID
      AND    QPAR_COMPUTERNM = CompNM
      ORDER BY QPAR_YM,QPAR_TAISYOKUYMD,QPAR_SYAINCD;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt230SelList                                                                            */
/* 機能          ：退職予定者データ取得                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt230SelList (
   InStrTaisyokuYMDSt   IN      CHAR                  --検索用退職年月日St
  ,InStrTaisyokuYMDEd   IN      CHAR                  --検索用退職年月日Ed
  ,InStrUserID      IN      CHAR                  --ユーザーID
  ,InStrCompNM      IN      CHAR                  --コンピューター名称
  ,InNumMaxRec        IN      NUMBER                  --最大配列格納件数
  ,IoNumSpCnt         IN OUT    NUMBER                  --呼び出し回数
  ,OtStrTaisyokuYMD   OUT     typOtTaisyokuYMDAry           --退職年月日
  ,OtStrSyainCD     OUT     typOtSyainCDAry             --社員コード1+社員コード2
  ,OtStrSimei       OUT     typOtSimeiAry             --氏名
  ,OtStrMiseCD      OUT     typOtOtMiseCDAry            --所属店コード
  ,OtStrMiseNM      OUT     typOtMiseNMAry              --所属店名
  ,OtStrTozaiKBN      OUT     typOtTozaiKBNAry            --東西区分
  ,OtStrBumonCD     OUT     typOtBumonCDAry             --所属部門コード
  ,OtStrBumonNM     OUT     typOtBumonNMAry             --所属部門名称
  ,OtNumAryCount      OUT     NUMBER                  --配列格納件数
  ,OtStrEndFlg      OUT     VARCHAR2) IS              --検索終了フラグ

  /* 処理固有の変数 */
  NumIdx            NUMBER;                            --配列用IDX
  v_SelectStmt      VARCHAR2(1000);                    --SQL文字列
  v_SelectStmt2     VARCHAR2(1000);                    --SQL文字列
  v_CursorID        INTEGER;                           --カーソルID
  v_CursorID2       INTEGER;                           --カーソルID
  v_Dummy           INTEGER;                           --Dummy
  v_Dummy2          INTEGER;                           --Dummy

  v_TaisyokuYMD     CHAR(8);                           --バインド用退職年月日
  v_SyainCD1        QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE; --バインド用社員コード1
  v_SyainCD2        QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE; --バインド用社員コード2
  v_Simei           QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;  --バインド用氏名
  v_MiseCD          QPAC_SYAINM.QPAC_MISECD%TYPE;      --バインド用所属店コード
  v_MiseNM          QPAE_MISEM.QPAE_MISENM%TYPE;       --バインド用所属店名
  v_TozaiKBN        QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;    --バインド用東西区分
  v_BumonCD         QPAC_SYAINM.QPAC_BUMONCD%TYPE;     --バインド用所属部門コード
  v_BumonNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;     --バインド用所属部門名称
  v_Count           NUMBER := 0;                       --台帳カウント

  /* 行変数 */
   RowQPAG      CurCEnt230%ROWTYPE;

BEGIN
  IF IoNumSpCnt = 0 THEN
    OtNumAryCount := 0;
    OtstrEndFlg  := '0';
    NumIdx     := 0;

    /* WTの初期化 */
    DELETE FROM QPAR_TAISYOKUW 
    WHERE QPAR_USERID = InStrUserID
    AND QPAR_COMPUTERNM = InStrCompNM;

    --処理時に使用するカーソルをオープンする
    v_CursorID := DBMS_SQL.OPEN_CURSOR;

    --社員マスタより該当期日の退職者を抽出する
    v_SelectStmt := NULL;
    v_SelectStmt := v_SelectStmt || 'SELECT';
    v_SelectStmt := v_SelectStmt || ' TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'')';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_PRMSYAINCD1';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_PRMSYAINCD2';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_SIMEIKANJI';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_MISECD';
    v_SelectStmt := v_SelectStmt || ',E.QPAE_MISENM';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_TOZAIKBN';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_BUMONCD';
    v_SelectStmt := v_SelectStmt || ',F.QPAF_BUMONNM';
    v_SelectStmt := v_SelectStmt || ' FROM QPAC_SYAINM C,QPAE_MISEM E,QPAF_BUMONM F';
    v_SelectStmt := v_SelectStmt || ' WHERE TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') BETWEEN :TaisyokuST AND :TaisyokuED';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_MISECD = E.QPAE_PRMMISECD';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_MISECD = F.QPAF_PRMMISECD (+)';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)';
    v_SelectStmt := v_SelectStmt || ' ORDER BY C.QPAC_TAISYOKUYMD';

    --問合せを解析する
      DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

    --入力変数をバインドする
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaisyokuST',InStrTaisyokuYMDSt);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaisyokuED',InStrTaisyokuYMDEd);

    --実行する
    v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);

    --出力変数を定義する
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TaisyokuYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Simei,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);

    --FETCH LOOP文
    LOOP
      --一連の行をバッファに取り出したあとLOOPの終了条件をチェックする
      IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
        EXIT;                               --ループ終了
      END IF;

      --一連の行をバッファからPLSQL変数にFETCHする
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TaisyokuYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Simei);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);

      /****************************/
      /* 融資部対象の社員かどうか */
      /****************************/
      v_Count := 0;
      v_Count := QPAP_CEnt230Count(v_SyainCD1,v_SyainCD2);

      /* 小口・証書融資台帳に登録されてなければ、 */
      /* 表示をしない。                           */
      IF v_Count > 0 THEN
        /* WTにデータを追加する */
        INSERT INTO QPAR_TAISYOKUW VALUES(
          SUBSTR(v_TaisyokuYMD,1,4) || SUBSTR(v_TaisyokuYMD,5,2),
          NVL(v_SyainCD1,' ') || NVL(v_SyainCD2,' '),
          NVL(v_Simei,' '),
          NVL(v_MiseCD,' '),
          NVL(v_MiseNM,' '),
          NVL(v_TozaiKBN,' '),
          NVL(v_BumonCD,' '),
          NVL(v_BumonNM,' '),
          NVL(v_TaisyokuYMD,' '),
          InStrUserID,
          InStrCompNM
        );
      END IF;

    END LOOP;

    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    
    COMMIT;

  END IF;

   /* QPAR_TAISYOKUWからデータを取得する */
    --カーソルオープン
    IF CurCEnt230%ISOPEN = FALSE THEN
      OPEN CurCEnt230(InStrUserID,InStrCompNM);
    END IF;

  --ＦＥＴＣＨ
  LOOP
    NumIdx := NumIdx + 1;

    /* 100ごとのデータを取得 */
    FETCH CurCEnt230 INTO RowQPAG;                      --順読み

    IF CurCEnt230%NOTFOUND THEN
      OtNumAryCount := NumIdx - 1;
      OtStrEndFlg := '1';                               --検索終了
      EXIT;                                             --ループ終了
    END IF;

    OtStrTaisyokuYMD(NumIdx) := NVL(RowQPAG.QPAR_TAISYOKUYMD,' ');
    OtStrSyainCD(NumIdx)     := NVL(RowQPAG.QPAR_SYAINCD,' ');
    OtStrSimei(NumIdx)       := NVL(RowQPAG.QPAR_SYAINNM,' ');
    OtStrMiseCD(NumIdx)      := NVL(RowQPAG.QPAR_MISECD,' ');
    OtStrMiseNM(NumIdx)      := NVL(RowQPAG.QPAR_MISENM,' ');
    OtStrTozaiKBN(NumIdx)    := NVL(RowQPAG.QPAR_TOZAIKBN,' ');
    OtStrBumonCD(NumIdx)     := NVL(RowQPAG.QPAR_BUMONCD,' ');
    OtStrBumonNM(NumIdx)     := NVL(RowQPAG.QPAR_BUMONNM,' ');

    /* 配列の件数がＭＡＸを超えた場合 */
    IF InNumMaxRec = NumIdx THEN
      OtNumAryCount := NumIdx;
      RETURN;
    END IF;

  END LOOP;

  /* カーソルのクローズ */
  CLOSE CurCEnt230;

EXCEPTION
  WHEN  OTHERS  THEN
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    RAISE ;
END QPAP_CEnt230SelList;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt230DelWorkTbl                                    */
/* 機能          ：使用ワークテーブル全削除                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt230DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --ユーザーＩＤ
    InStrComputerNM IN  VARCHAR2) IS      --コンピュータ名
    
BEGIN
    DELETE FROM QPAR_TAISYOKUW 
    WHERE QPAR_USERID     = InStrUserID
      AND QPAR_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt230DelWorkTbl;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt230Count                                         */
/* 機能          ：台帳の存在チェック                                        */
/*****************************************************************************/
/* 台帳の存在チェック */
FUNCTION  QPAP_CEnt230Count(
   InStrSyainCD1   IN  CHAR,            --社員コード１
   InStrSyainCD2   IN  CHAR)            --社員コード２
RETURN NUMBER IS

  StrSQL           VARCHAR2(1000);
  v_CursorID       NUMBER;
  v_NumCount       NUMBER;
  v_Dummy          INTEGER;

  v_SumCount       NUMBER;

BEGIN

  v_NumCount := 0;
  v_SumCount := 0;

/* 小口融資台帳検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
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
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    v_SumCount := v_SumCount + v_NumCount;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  v_NumCount := 0;

/* 社員融資台帳検索 */
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
    v_SumCount := v_SumCount + v_NumCount;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 返却値に当てはめる */
  RETURN v_SumCount;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt230Count;

END QPAP_CEnt230PkG;
/
show error
