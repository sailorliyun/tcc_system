CREATE OR REPLACE PACKAGE  QPAP_Cent160PkG IS
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                             */
/* 業務名        ：社員融資管理                                                         */
/* モジュール名  ：QPAP_Cent160PkG                                                      */
/* 機能          ：控除中止処理                                                         */
/* 作成日        ：2001/08/15                                                           */
/* 作成者        ：FIP                                                                  */
/*                                                                                                                */
/*修正履歴*/
/* ---------------------------------------------------------------------------------------------------------------*/
/*  更新日付  案件番号  修正担当      修正理由                                                                  　*/
/*  20090828　0811051   murayama@NBC  控除更新処理を行った場合                                              　　　*/
/*                                    控除中止テーブルにデータを追加                                              */
/*  20090828　0811051   NBC saitoh    ST-0003障害対応                                                       　　　*/
/*                                    控除中止テーブルで障害発生時のメッセージ出力                                */
/* ---------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*  １  宣言部                                                  */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --区切文字

/* 各行を格納するための配列定義 */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
    INDEX BY BINARY_INTEGER;

/* 社員属性の表示 */
PROCEDURE QPAP_Cent160SelSyainZoku (
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

/* 小口返済額情報取得 */
PROCEDURE QPAP_Cent160GetKogutiInf (
  InStrPRMSyainCD1    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD2%TYPE,  --社員コード２
  OtNumKyuyoHensai    OUT QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE,  --給与返済額
  OtNumSyoyoHensai    OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --賞与返済額
  OtNumZanHensai      OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --残高返済額
  OtStrKojoCyushiFlg    OUT QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE,--控除中止Flg
  OtStrSonzaiFlg      OUT VARCHAR2);        --存在Flg

/* 証書明細情報取得 */
PROCEDURE QPAP_Cent160GetSyouMeisaiInf (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  InNumMaxRec     IN  NUMBER,         --最大配列格納件数
  IoNumFetchCount   IN  OUT NUMBER,         --読み込み件数
  IoNumRecCount   IN  OUT NUMBER,         --総検索件数
  OtNumAryCount     OUT NUMBER,         --配列格納件数
  OtStrDataAry      OUT typDataAry,       --証書明細 配列
  OtStrEndFlg     OUT VARCHAR2);        --検索終了フラグ

/* 控除中止フラグ更新 */
PROCEDURE QPAP_CEnt160UpdKoujyo (
   InStrPRMSyainCD1   IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE --社員コード１
  ,InStrPRMSyainCD2   IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE --社員コード２
  ,InStrKojoCyusiFLG    IN  VARCHAR2        --控除中止フラグ
  ,OtUpdateFlg      OUT VARCHAR2        --更新フラグ
  ,InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE   --メニューID（オペログ用）
  ,InStrModuleID        IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE   --モジュールID（オペログ用）
  ,InStrUserID          IN  QUS2_OpeLogT.QUS2_USERID%TYPE   --ユーザＩＤ（オペログ用）
  ,InStrComputerNM      IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --コンピュータ名（オペログ用）
  ,InStrTozaiKBN        IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --利用区分（オペログ用）
  ,InStrBushoCD       IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    --部署コード（オペログ用）
  ,InStrTantoNM       IN  VARCHAR2);            --担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt160OpeLog(
   InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE     --メニューＩＤ
  ,InStrModuleID      IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE     --プログラムＩＤ
  ,InStrUserID        IN  QUS2_OpeLogT.QUS2_USERID%TYPE     --ユーザＩＤ
  ,InStrComputerNM  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE    --コンピュータ
  ,InStrTozaiKBN      IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE    --東西区分
  ,InStrBushoCD     IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE      --部署コード
  ,InStrMsg     IN  QUS2_OpeLogT.QUS2_MSG%TYPE);      --メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt160Lock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type       --識別コード
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type       --内部会員番号1
  ,InStrKeyInfo2    IN    QSA4_HaitaT.QSA4_PRMKeyInfo2%type       --内部会員番号2
  ,InstrProgramID     IN      QSA4_HaitaT.QSA4_ProgramID%type         --プログラムＩＤ
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type       --コンピュータ名
  ,InstrOperatorID    IN      QSA4_HaitaT.QSA4_OperatorID%type);        --オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt160UnLock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type   --識別コード
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type);   --コンピューター名

END QPAP_Cent160PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  ２  ボディー                              */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent160PkG IS

  /***  ログメッセージ定義  */
  TYPE  typMsg  IS  RECORD (
    fldTableID    CHAR(19),         /* テーブル名   */

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    fldTableID2    CHAR(19),         /* テーブル名   */
/*ADD 20090828 0811051 NBC MURAYAMA END*/
   
    fldKousinKbn    CHAR(1),                /* 更新区分     */

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    fldKousinKbn2    CHAR(1),                /* 更新区分     */
/*ADD 20090828 0811051 NBC MURAYAMA END*/

    fldAcsKey   CHAR(50),         /* アクセスキー */
    fldMsg      CHAR(100)         /* 処理コード   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /* 証書明細一覧カーソル */
  CURSOR CurSyouMei(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
    SELECT
      *
    FROM
      QPA8_SYNDAICYOT
    WHERE
      QPA8_PRMSYAINCD1  = SyainCD1_I  AND
      QPA8_PRMSYAINCD2  = SyainCD2_I
    ORDER BY QPA8_PRMSYAINCD1,QPA8_PRMSYAINCD2,QPA8_PRMYUSIYMD ASC;

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent160SelSyainZoku                                             */
/* 機能      　　：社員属性の表示                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160SelSyainZoku (
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
    WHERE QPAC_PRMSyainCD1    = InStrPRMSyainCD1
      AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
--      AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
      AND QPAC_MiseCD   = QPAE_PRMMiseCD
      AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
      AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;     --処理終了

END QPAP_Cent160SelSyainZoku;

/******************************************************************************************************************/
/* モジュール名　：QPAP_Cent160GetKogutiInf                                             */
/* 機能      　　：小口返済額情報取得                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160GetKogutiInf (
  InStrPRMSyainCD1    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD2%TYPE,  --社員コード２
  OtNumKyuyoHensai    OUT QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE,  --給与返済額
  OtNumSyoyoHensai    OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --賞与返済額
  OtNumZanHensai      OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --残高返済額
  OtStrKojoCyushiFlg    OUT QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE,--控除中止Flg
  OtStrSonzaiFlg      OUT VARCHAR2) IS        --存在Flg

  /* 処理固有の変数 */
  StrSysYM      VARCHAR2(6);
  StrSQL        VARCHAR2(1000);
  NumCount      NUMBER := 0;
  v_CursorID      NUMBER := 0;
  v_Dummy       INTEGER;

  v_KyuyoHensai     QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_SyoyoHensai     QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;
  v_KyuyoZandaka      QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_KojocyushuFLG     QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE;
  v_ZandakaYMD      CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin      QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     -- 11/01 ADD

BEGIN
  /* 出力パラメータのクリア */
  OtNumKyuyoHensai  := 10000;           --デフォルト給与返済額
  OtNumSyoyoHensai  := 40000;           --デフォルト賞与返済額
  OtNumZanHensai    := 0;             --修正要
  OtStrSonzaiFlg    := '0';

  /* サーバーＳＹＳＴＥＭ年月取得 */
  SELECT TO_CHAR(SYSDATE,'YYYYMM') INTO StrSysYM FROM DUAL;

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

  /* 小口融資台帳存在チェック */
  SELECT COUNT(*) INTO NumCount FROM QPA1_KGCDAICYOT
    WHERE QPA1_PRMSYAINCD1 = InStrPRMSyainCD1
    AND QPA1_PRMSYAINCD2 = InStrPRMSyainCD2;

  /* 存在なし→エラー */
  IF NumCount = 0 THEN
    RETURN;
  END IF;

  /* 小口融資台帳　情報取得 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA1_SYOYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOZANDAKA,0),';
  StrSQL := StrSQL || ' NVL(QPA1_KOJOCYUSHIFLG,'' '')';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';

  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyoyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KyuyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KojocyushuFLG,1);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyoyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KyuyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KojocyushuFLG);
    /* パラメータに渡す */
    OtNumKyuyoHensai := v_KyuyoHensai;
    OtNumSyoyoHensai := v_SyoyoHensai;
    OtNumZanHensai := v_KyuyoZandaka;
    OtStrKojoCyushiFlg := v_KojocyushuFLG;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

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
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', StrSysYM);
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
    /* パラメータに渡す */
    OtNumKyuyoHensai := v_KyuyoHensai;
    OtNumSyoyoHensai := v_SyoyoHensai;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 小口融資残高履歴検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' MAX(TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD''))';
  StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
  StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :Kbn';
  StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
  StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Kbn', '3');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',v_ZenKyuyoYMD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZandakaYMD,8);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 11/01 ADD 入金用対象日付変更 */
    v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

    /* 小口融資貸付検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';

--2001/11/30 取消フラグの条件を修正
--    StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

    StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrPRMSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kasituke);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kasituke);
      /* パラメータに渡す */
      OtNumZanHensai := OtNumZanHensai + v_Kasituke;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 小口融資入金検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD';
    StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);      -- 11/01 UPD
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD_N);      -- 11/01 UPD
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Nyukin);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Nyukin);
      /* パラメータに渡す */
      OtNumZanHensai := OtNumZanHensai - v_Nyukin;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/****************************************************************************/
/* 賞与控除は見ないこととする                                               */
/* 2001/12/06 賞与控除履歴は見る　よって　コメントはずし  */
/***********************************************************************/
----↓コメント外し
    /* 小口融資賞与控除検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
    StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
    StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD';
    StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kojo);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kojo);
      /* パラメータに渡す */
      OtNumZanHensai := OtNumZanHensai - v_Kojo;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
----↑コメント外し
  END IF;

  IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  END IF;

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;

END QPAP_Cent160GetKogutiInf;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_Cent160GetSyouMeisaiInf                                         */
/* 機能          ：証書明細情報の検索＆取得                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160GetSyouMeisaiInf (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --社員コード１
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --社員コード２
  InNumMaxRec     IN  NUMBER,         --最大配列格納件数
  IoNumFetchCount   IN  OUT NUMBER,         --読み込み件数
  IoNumRecCount   IN  OUT NUMBER,         --総検索件数
  OtNumAryCount     OUT NUMBER,         --配列格納件数
  OtStrDataAry      OUT typDataAry,       --証書明細 配列
  OtStrEndFlg     OUT VARCHAR2) IS        --検索終了フラグ

  /* 処理固有の変数 */
  NumIdx        NUMBER;
  NumSumCount     NUMBER;
  StrData       VARCHAR2(200);

  /* 総件数取得カーソル */
  CURSOR CurCount(SyainCD1_I  IN VARCHAR2,SyainCD2_I  IN VARCHAR2) IS
    SELECT
      COUNT(*) NumCount
    FROM
      QPA8_SYNDAICYOT
    WHERE
      QPA8_PRMSYAINCD1  = SyainCD1_I  AND
      QPA8_PRMSYAINCD2  = SyainCD2_I;

  /* 行変数 */
  RowCount      CurCount%ROWTYPE;       --証書明細一覧総件数カーソル
  RowSyouMei      CurSyouMei%ROWTYPE;       --証書明細一覧カーソル

BEGIN
  /* 出力パラメータの初期化 */
  OtNumAryCount := 0;
  OtStrEndFlg := '0';

  IF CurSyouMei%ISOPEN = FALSE THEN
    /* 証書明細一覧 総件数取得 */
    NumSumCount := 0;
    OPEN CurCount(InStrPRMSyainCD1,InStrPRMSyainCD2);     --総件数カーソルのオープン
    LOOP
      FETCH CurCount INTO RowCount;
      IF  CurCount%NOTFOUND THEN
        EXIT;
      END IF;
      NumSumCount := NumSumCount + RowCount.NumCount;
    END LOOP;
    IoNumRecCount :=  NumSumCount;          --パラメータにセット
    CLOSE CurCount;               --総件数カーソルのクローズ

    /* 証書明細一覧 カーソルのオープン */
    OPEN CurSyouMei(InStrPRMSyainCD1,InStrPRMSyainCD2);
  END IF;

  NumIdx    := 0;
  OtStrEndFlg := '0';

  LOOP

    FETCH CurSyouMei INTO RowSyouMei;         --順読み
    IoNumFetchCount := IoNumFetchCount + 1;
    IF  CurSyouMei%NOTFOUND THEN
      EXIT;               --ループ終了
    END IF;

    /* 証書明細一覧の出力パラメータの編集 */
    NumIdx := NumIdx + 1;

    StrData := Null;
    StrData := StrData || TO_CHAR(RowSyouMei.QPA8_PRMYUSIYMD,'YYYYMMDD')  || StrDLM;  --01)融資日
    StrData := StrData || RowSyouMei.QPA8_GENDOGAKU       || StrDLM;  --02)融資限度額
    StrData := StrData || RowSyouMei.QPA8_SYUBETU       || StrDLM;  --03)融資種別
    StrData := StrData || RowSyouMei.QPA8_RIRITU        || StrDLM;  --04)契約利率
    StrData := StrData || RowSyouMei.QPA8_HENSAITUKISU      || StrDLM;  --05)返済月数
    StrData := StrData || RowSyouMei.QPA8_KYUYOHENSAIALL      || StrDLM;  --06)給与返済総額
    StrData := StrData || RowSyouMei.QPA8_KYUYOHENSAI     || StrDLM;  --07)給与返済額
    StrData := StrData || RowSyouMei.QPA8_SYOYOHENSAIALL      || StrDLM;  --08)賞与返済総額
    StrData := StrData || RowSyouMei.QPA8_SYOYOHENSAI     || StrDLM;  --09)賞与返済額
    StrData := StrData || RowSyouMei.QPA8_KYUYOZANDAKA      || StrDLM;  --10)給与残高
    StrData := StrData || RowSyouMei.QPA8_SYOYOZANDAKA      || StrDLM;  --11)賞与残高
    StrData := StrData || RowSyouMei.QPA8_KOJOCYUSIFLG      || StrDLM;  --12)控除中止フラグ
    StrData := StrData || RowSyouMei.QPA8_KANSAIYMD       || StrDLM;  --13)完済日
    OtStrDataAry(NumIdx)  := StrData;             --証書明細一覧
    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <> 0   AND
       InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;               --プロシージャの終了（カーソルをクローズしない）
    END IF;

  END LOOP;

  OtStrEndFlg :=  '1';              --検索終了
  OtNumAryCount :=  NumIdx;
  /* 証書明細一覧カーソルのクローズ */
  CLOSE CurSyouMei;

EXCEPTION
  WHEN  OTHERS  THEN
    IF CurCount%ISOPEN THEN
      CLOSE CurCount;
    END IF;
    IF CurSyouMei%ISOPEN THEN
      CLOSE CurSyouMei;
    END IF;
    RAISE ;
END QPAP_Cent160GetSyouMeisaiInf;


/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt160UpdKoujyo                                                */
/* 機能          ：控除中止フラグ更新                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160UpdKoujyo (
   InStrPRMSyainCD1   IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE --社員コード１
  ,InStrPRMSyainCD2   IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE --社員コード２
  ,InStrKojoCyusiFLG    IN  VARCHAR2        --控除中止フラグ
  ,OtUpdateFlg      OUT VARCHAR2        --更新フラグ
  ,InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE   --メニューID（オペログ用）
  ,InStrModuleID        IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE   --モジュールID（オペログ用）
  ,InStrUserID          IN  QUS2_OpeLogT.QUS2_USERID%TYPE   --ユーザＩＤ（オペログ用）
  ,InStrComputerNM      IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --コンピュータ名（オペログ用）
  ,InStrTozaiKBN        IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --利用区分（オペログ用）
  ,InStrBushoCD       IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    --部署コード（オペログ用）
  ,InStrTantoNM       IN  VARCHAR2) IS        --担当名（オペログ用）

  numStep   NUMBER   := 0;              /* 処理ステップ  */

  /*ADD 20090828 0811051 NBC MURAYAMA START*/
  /*DEL 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStepKT   NUMBER   := 0;              /* 処理ステップ  */
  /*DEL 20090828 0811051(ST-0003) NBC saitoh END*/
  /*ADD 20090828 0811051 NBC MURAYAMA END*/

  numErr    NUMBER   := 0;              /* SQLCODEの退避 */
  strErrMsg VARCHAR2(100);              /* SQLERRMの退避 */
  recMsg    typMsg;
  strLogMsg QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN

  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';         --テーブル名

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  recMsg.fldTableID2 := 'QPB1_KOJOCANCELT';       --テーブル名 控除中止テーブル
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  recMsg.fldKousinKbn := '2';              --更新区分

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  recMsg.fldKousinKbn2 := '1';             --更新区分　1:登録 
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  recMsg.fldAcsKey  := InStrPRMSyainCD2;          --更新キー

  OtUpdateFlg := '9';               --更新失敗

  /* 小口融資台帳の更新 */
  UPDATE QPA1_KGCDAICYOT SET
    QPA1_KOJOCYUSHIFLG = NVL(InStrKojoCyusiFLG,' ')       --控除中止フラグ
    WHERE QPA1_PRMSYAINCD1 = InStrPRMSyainCD1       --更新キー 社員コード１
     AND  QPA1_PRMSYAINCD2 = InStrPRMSyainCD2;        --     社員コード２

  /* 社員融資台帳の更新 */
  UPDATE QPA8_SYNDAICYOT SET
    QPA8_KOJOCYUSIFLG = NVL(InStrKojoCyusiFLG,' ')        --控除中止フラグ
    WHERE QPA8_PRMSYAINCD1 = InStrPRMSyainCD1       --更新キー 社員コード１
     AND  QPA8_PRMSYAINCD2 = InStrPRMSyainCD2;        --     社員コード２

/*ADD 20090828 0811051(ST-0003) NBC saitoh START*/
	numStep := 1;   /* 処理ステップ */
/*ADD 20090828 0811051(ST-0003) NBC saitoh END*/

/*ADD 20090828 0811051 NBC MURAYAMA START*/
	/* 控除中止テーブルの登録 */
	/* 控除中止中*/
	IF InStrKojoCyusiFLG = 1 THEN
		INSERT INTO QPB1_KOJOCANCELT(
			QPB1_PRMSYAINCD1,				--社員コード１
			QPB1_PRMSYAINCD2,				--社員コード２
			QPB1_KOJOSTATUS,				--控除ステータス
			QPB1_CANCELDATE,				--控除中止登録日
			QPB1_TANTOCD,					--登録担当者コード
			QPB1_INSERTDATE					--登録日時
			)
			VALUES(
			InStrPRMSyainCD1,
			InStrPRMSyainCD2,
			'1',
			SYSDATE,
			InStrUserID,
			SYSDATE
			);
	ELSE
	/* 控除中止解除中*/
		INSERT INTO QPB1_KOJOCANCELT(
			QPB1_PRMSYAINCD1,				--社員コード１
			QPB1_PRMSYAINCD2,				--社員コード２
			QPB1_KOJOSTATUS, 				--控除ステータス
			QPB1_CANCELDATE, 				--控除中止登録日
			QPB1_TANTOCD,    				--登録担当者コード
	    	QPB1_INSERTDATE  				--登録日時
			)
			VALUES(
			InStrPRMSyainCD1,
			InStrPRMSyainCD2,
			'2',
			SYSDATE,
			InStrUserID,
			SYSDATE
			);
	END IF;

/*ADD 20090828 0811051 NBC MURAYAMA END*/

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */

/*DEL 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStep := 1;   /* 処理ステップ */
/*DEL 20090828 0811051(ST-0003) NBC saitoh END*/

  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資台帳の更新を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt160OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  /* オペレーションログ出力 */
/*MOD 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStepKT := 1;   /* 処理ステップ */
  numStep := 2;   /* 処理ステップ */
/*MOD 20090828 0811051(ST-0003) NBC saitoh END*/
  recMsg.fldMsg := '（' || InStrTantoNM || '）控除中止テーブルの更新を正常に行った';
  strLogMsg   := recMsg.fldTableID2
        || recMsg.fldKousinKbn2
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt160OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  OtUpdateFlg := '0';               --更新成功

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);
    /* ロールバック */
    ROLLBACK;

    /* オペレーションログ出力 */
    IF numStep < 1 THEN
      recMsg.fldMsg := '（' || InStrTantoNM || '小口融資台帳の更新に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt160OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    /* オペレーションログ出力 */
/*MOD 20090828 0811051(ST-0003) NBC saitoh START*/
--    IF numStepKT < 1 THEN
    IF numStep = 1 THEN
/*MOD 20090828 0811051(ST-0003) NBC saitoh END*/
      recMsg.fldMsg := '（' || InStrTantoNM || '控除中止テーブルの更新に失敗した';
      strLogMsg   := recMsg.fldTableID2
            || recMsg.fldKousinKbn2
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt160OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;
/*ADD 20090828 0811051 NBC MURAYAMA END*/

    RAISE ;
END QPAP_CEnt160UpdKoujyo;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt160OpeLog                                                   */
/* 機能          ：オペログへの追加                                                     */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt160OpeLog(
   InStrMenuID      IN  QUS2_OpeLogT.QUS2_MENUID%TYPE     /* メニューＩＤ   */
  ,InStrModuleID      IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE     /* プログラムＩＤ */
  ,InStrUserID        IN  QUS2_OpeLogT.QUS2_USERID%TYPE     /* ユーザＩＤ     */
  ,InStrComputerNM    IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE    /* コンピュータ   */
  ,InStrTozaiKBN      IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE    /* 東西区分       */
  ,InStrBushoCD     IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE      /* 部署コード     */
  ,InStrMsg     IN  QUS2_OpeLogT.QUS2_MSG%TYPE ) IS     /* メッセージ     */
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
END  QPAP_CEnt160OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt160Lock                                                                               */
/* 機能          ：控除中止処理のロック                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160Lock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type       --識別コード
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type       --内部会員番号1
  ,InStrKeyInfo2    IN    QSA4_HaitaT.QSA4_PRMKeyInfo2%type       --内部会員番号2
  ,InstrProgramID     IN      QSA4_HaitaT.QSA4_ProgramID%type         --プログラムＩＤ
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type       --コンピュータ名
  ,InstrOperatorID    IN      QSA4_HaitaT.QSA4_OperatorID%type) IS      --オペレータＩＤ

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN

  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerNM, fldOperatorID
      from QSA4_HaitaT
    where QSA4_PRMJobKbn   = 'P'
      and QSA4_PRMSikibetu   = InstrSikibetu
      and QSA4_PRMKeyInfo1   = InStrKeyInfo1    --内部会員番号1
      and QSA4_PRMKeyInfo1   = InStrKeyInfo2;   --内部会員番号2

exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
        and QSA4_PRMSikibetu  = '010'
          and QSA4_PRMKeyInfo1   = InStrKeyInfo1    --内部会員番号1
          and QSA4_PRMKeyInfo1   = InStrKeyInfo2;   --内部会員番号2
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
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu = '080'
           and QSA4_PRMKeyInfo1  = InStrKeyInfo1    --内部会員番号1
           and QSA4_PRMKeyInfo1  = InStrKeyInfo2;   --内部会員番号2
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
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu = '090'
           and QSA4_PRMKeyInfo1  = InStrKeyInfo1    --内部会員番号1
           and QSA4_PRMKeyInfo1  = InStrKeyInfo2;   --内部会員番号2
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
  WHEN W_HAITADUPLICATE THEN              --社員融資入金テーブル作業中
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt160Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN              --社員融資入金テーブル２重キー
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt160Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt160Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt160UnLock                                                                             */
/* 機能          ：控除中止処理のロック解除                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160UnLock(
  InstrSikibetu   IN  QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM   IN  QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt160UnLock ;

END QPAP_Cent160PkG;

/***END of LINE****************************************************************************************************/
/
SHOW ERROR
