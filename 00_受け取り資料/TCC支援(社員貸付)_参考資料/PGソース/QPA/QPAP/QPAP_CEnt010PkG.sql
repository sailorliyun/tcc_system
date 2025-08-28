CREATE OR REPLACE PACKAGE  QPAP_CEnt010PkG IS
/********************************************************************************/
/*	システム名　：高島屋クレジットシステム										*/
/*	業務名　　　：社員貸付システム												*/
/*	モジュール名：QPAP_CEnt010PkG												*/
/*	機能　　　　：小口融資台帳													*/
/*	作成日　　　：2001/07/07													*/
/*	作成者　　　：FIP															*/
/*------------------------------------------------------------------------------*/
/*								修	正	履	歴									*/
/*	管理No					修	正	理	由					担当者	 修正日付	*/
/*	000001	障害対応　小口融資入金入力不備対応				上　原	2004.06.24	*/
/*			小口融資入金入力登録時に、残高Ｔ（ＱＰＡ３）に						*/
/*			残高情報が１件もない場合（台帳登録後１度も残高						*/
/*			更新を行っていない場合）、入金入力登録ができな						*/
/*			い為、残高情報がない場合は、融資台帳（ＱＰＡ１						*/
/*			）登録時に、前月分の残高テーブルを追加する。						*/
/*	999999	ＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮ	ＮＮＮ	9999.99.99	*/
/********************************************************************************/
/******************************************************************************************************************/
/*１  宣言部                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|';                           --区切文字

/* 各行を格納するための配列定義 */
  TYPE typOtHenkoYMAry IS TABLE OF CHAR(6)                  --返済額変更月
    INDEX BY BINARY_INTEGER;
  TYPE typOtKyuyoAry IS TABLE OF QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE    --給与返済額
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyoyoAry IS TABLE OF QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE    --賞与返済額
    INDEX BY BINARY_INTEGER;

/* 小口融資台帳データ取得 */
PROCEDURE QPAP_CEnt010SelList (
	 InStrSyainCD		IN		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE		--抽出キー  社員コード
	,OtStrEndFlg			OUT	VARCHAR2								--検索終了フラグ
	,OtStrSimeKn			OUT	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE			--氏名カナ
	,OtStrSimeKj			OUT	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE		--氏名漢字
	,OtStrMiseCD			OUT	QPAC_SYAINM.QPAC_MISECD%TYPE			--店コード
	,OtStrMiseNM			OUT	QPAE_MISEM.QPAE_MISENM%TYPE				--店名称
	,OtStrTozaiKBN			OUT	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE			--東西区分
	,OtStrBumonCD			OUT	QPAC_SYAINM.QPAC_BUMONCD%TYPE			--部門コード
	,OtStrBumonNM			OUT	QPAF_BUMONM.QPAF_BUMONNM%TYPE			--部門名称
	,OtStrSIKAKUCD			OUT	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE			--資格コード
	,OtStrTOKYUCD			OUT	QPAC_SYAINM.QPAC_TOKYUCD%TYPE			--等級コード
	,OtNumGendo				OUT	QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE		--限度額
	,OtNumZandaka			OUT	QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE	--残高
	,OtStrNewFLG			OUT	CHAR
	,OtStrZandakaYM			OUT	CHAR									--残高日
	,OtStrKogutiUmu			OUT	CHAR);									--小口データ有無フラグ　0=無し,1=有り   2002/07/23 追加

/* 小口融資台帳返済額データ取得 */
PROCEDURE QPAP_CEnt011SelList (
	 InStrSyainCD	IN			QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE	--抽出キー  社員コード
	,InNumMaxRec	IN			NUMBER									--最大配列格納件数
	,OtNumRecCount		OUT		NUMBER									--総検索件数
	,OtNumAryCount		OUT		NUMBER									--配列格納件数
	,OtStrEndFlg		OUT		VARCHAR2								--検索終了フラグ
	,OtStrHenkoYM		OUT		typOtHenkoYMAry							--返済額変更月配列
	,OtNumKyuyo			OUT		typOtKyuyoAry							--給与返済額配列
	,OtNumSyoyo			OUT		typOtSyoyoAry);							--賞与返済額配列

/* 小口融資台帳データ登録処理 */
PROCEDURE QPAP_CEnt010DatAdd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --社員コード
  ,InStrKeiyakuYMD  IN    CHAR                      --契約日
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --限度額
  ,InNumKyuyoHensai IN    QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyoHensai IN    QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2);                    --担当名（オペログ用）

/* 返済額履歴データ重複チェック */
PROCEDURE QPAP_CEnt011DatChk (
   InStrSyainCD     IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --変更年月日
  ,InStrHenkoYM     IN    QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE     --変更年月日
  ,OtStrFlg       OUT   CHAR);                      --判定フラグ

/* 小口融資返済額データ登録処理 */
PROCEDURE QPAP_CEnt011DatAdd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM   IN    CHAR                      --変更月
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2);                    --担当名（オペログ用）

/* 小口融資台帳データ更新処理 */
PROCEDURE QPAP_CEnt010DatUpd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --社員コード
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --限度額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2);                    --担当名（オペログ用）

/* 小口融資返済額データ更新処理 */
PROCEDURE QPAP_CEnt011DatUpd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM_O   IN    CHAR                      --変更月（修正前）
  ,InStrHenkoYM_N   IN    CHAR                      --変更月（修正後）
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2);                    --担当名（オペログ用）

/* 小口融資返済額データ削除処理 */
PROCEDURE QPAP_CEnt011DatDel (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM   IN    CHAR                      --変更月
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2);                    --担当名（オペログ用）

/* コンソールログへの出力  */
PROCEDURE  QPAP_CEnt010OpeLog(
   InStrMenuID      IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューＩＤ
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --プログラムＩＤ
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE         --ユーザＩＤ
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ
  ,InStrTouzaiKBN   IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --東西区分
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE          --部署コード
  ,InStrMsg     IN    QUS2_OpeLogT.QUS2_MSG%TYPE);          --メッセージ

/* 業務排他処理 */
/* ロック */
PROCEDURE QPAP_CEnt010Lock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type       --識別コード
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type
  ,InStrProgramID   IN    QSA4_HaitaT.QSA4_ProgramID%type         --プログラムＩＤ
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type       --コンピュータ名
  ,InStrOperatorID  IN    QSA4_HaitaT.QSA4_OperatorID%type);        --オペレータＩＤ

/* 解 除 */
PROCEDURE QPAP_CEnt010UnLock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type       --識別コード
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type);       --コンピューター名

END QPAP_CEnt010PkG;
/
SHOW ERRORS;
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                     */
/* 業務名        ：社員貸付システム                                                             */
/* モジュール名  ：QPAP_CEnt010PkG                                                              */
/* 機能          ：小口融資台帳                                                                 */
/* 作成日        ：2001/07/07                                                                   */
/* 作成者        ：FIP                                                                          */
/******************************************************************************************************************/
/******************************************************************************************************************/
/*  ２  ボディー                                                          */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt010PkG IS

  /***  ログメッセージ定義  */
  TYPE  typMsg  IS  RECORD (
    fldTableID    CHAR(19),                       /* テーブル名   */
    fldKousinKBN  CHAR(1),                        /* 更新区分     */
    fldAcsKey   CHAR(50),                       /* アクセスキー */
    fldMsg      CHAR(100)                       /* 処理コード   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /***  ユーザ定義例外定義  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010SelList                                                          */
/* 機能          ：小口融資台帳データ取得                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010SelList (
	 InStrSyainCD		IN		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE		--抽出キー  社員コード
	,OtStrEndFlg			OUT	VARCHAR2								--検索終了フラグ
	,OtStrSimeKn			OUT	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE			--氏名カナ
	,OtStrSimeKj			OUT	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE		--氏名漢字
	,OtStrMiseCD			OUT	QPAC_SYAINM.QPAC_MISECD%TYPE			--店コード
	,OtStrMiseNM			OUT	QPAE_MISEM.QPAE_MISENM%TYPE				--店名称
	,OtStrTozaiKBN			OUT	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE			--東西区分
	,OtStrBumonCD			OUT	QPAC_SYAINM.QPAC_BUMONCD%TYPE			--部門コード
	,OtStrBumonNM			OUT	QPAF_BUMONM.QPAF_BUMONNM%TYPE			--部門名称
	,OtStrSIKAKUCD			OUT	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE			--資格コード
	,OtStrTOKYUCD			OUT	QPAC_SYAINM.QPAC_TOKYUCD%TYPE			--等級コード
	,OtNumGendo				OUT	QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE		--限度額
	,OtNumZandaka			OUT	QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE	--残高
	,OtStrNewFLG			OUT	CHAR
	,OtStrZandakaYM			OUT	CHAR									--残高日
	,OtStrKogutiUmu			OUT	CHAR) IS								--小口データ有無フラグ　0=無し,1=有り   2002/07/23 追加

  /* 処理固有の変数 */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy         INTEGER;
  v_SimeiKana     QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;
  v_SimeiKanji    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_TozaiKBN      QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_BumonCD       QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SIkakuCD      QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;
  v_TokyuCD       QPAC_SYAINM.QPAC_TOKYUCD%TYPE;
  v_Gendogaku     QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_Zandaka       QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD    CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_Code          QPAH_OTHERM.QPAH_PRMCODE%TYPE;
  v_KyuyoZandaka  QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_SysDate       Char(8);
  v_ZenKyuyoYMD   Char(8);
  v_ZandakaYMD_N  CHAR(8);     -- 11/01 ADD

  NumKogutiDataCNT NUMBER;     --2002/07/23  追加

BEGIN

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

/* 社員マスタ存在チェックＳＱＬ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPAC_SYAINM ';
  StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
  /* カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ローカル変数への関連づけ */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* 変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* 社員マスタ未存在 → エラー */
  IF v_NumCount = 0 THEN
    RETURN;
  END IF;

/* 社員マスタ検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANA,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANJI,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_MISECD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_MISENM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_TOZAIKBN,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_BUMONCD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAF_BUMONM.QPAF_BUMONNM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIKAKUCD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_TOKYUCD,'' '')';
  StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM,QPAF_BUMONM';
  StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAF_BUMONM.QPAF_PRMMISECD (+)';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_BUMONCD = QPAF_BUMONM.QPAF_PRMBUMONCD (+)';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SimeiKana,15);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SimeiKanji,20);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_MiseCD,3);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_TozaiKBN,1);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_BumonCD,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_BumonNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_SikakuCD,2);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_TokyuCD,2);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SimeiKana);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_MiseCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_TozaiKBN);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_BumonCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_BumonNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_SikakuCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_TokyuCD);
    /* パラメータに渡す */
    OtStrSimeKn := v_SimeiKana;
    OtStrSimeKj := v_SimeiKanji;
    OtStrMiseCD := v_MiseCD;
    OtStrMiseNM := v_MiseNM;
    OtStrTozaiKBN := v_TozaiKBN;
    OtStrBumonCD := v_BumonCD;
    OtStrBumonNM := v_BumonNM;
    OtStrSIKAKUCD := v_SikakuCD;
    OtStrTOKYUCD := v_TokyuCD;
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* 小口融資台帳存在チェックＳＱＬ */
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
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ローカル変数への関連づけ */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;
  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* 限度額・残高取得 */
  OtNumGendo := 0;
  OtNumZandaka := 0;
  OtStrZandakaYM := '00000000';

  IF v_NumCount = 0 THEN
    /* 新規フラグを０に */
    OtStrNewFLG := '0';
    /* 共通コード指定 */
    v_Code := 'GE' || v_SikakuCD || v_TokyuCD;
    /* その他マスタより標準限度額取得 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAH_KGENDO,0)';
    StrSQL := StrSQL || ' FROM QPAH_OTHERM ';
    StrSQL := StrSQL || ' WHERE QPAH_PRMCODE = :Code';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', v_Code);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Gendogaku);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Gendogaku);
      /* パラメータに渡す */
      OtNumGendo := v_Gendogaku;
    END IF;
    /* カーソルのクローズ */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  ELSE
    /* 新規フラグを１に */
    OtStrNewFLG := '1';
    /* 小口融資台検索 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA1_GENDOGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPA1_KYUYOZANDAKA,0)';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
    StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
    /* 動的カーソルのオープン */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQLの解析 */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* 入力変数をバインドする */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Gendogaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_KyuyoZandaka);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Gendogaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_KyuyoZandaka);
      /* パラメータに渡す */
      OtNumGendo := v_Gendogaku;
      OtNumZandaka := v_KyuyoZandaka;
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
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Kbn', '3');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',v_ZenKyuyoYMD);
    /* 出力変数のバインド */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZandakaYMD,8);
    /* SQLの実行 */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* カラム値を変数へ格納 */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);
      /* パラメータに渡す */
      OtStrZandakaYM := v_ZandakaYMD;
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
      StrSQL := StrSQL || ' AND (         QPA6_TORIKESHIFLG <> :FLG';
      StrSQL := StrSQL || '      OR RTRIM(QPA6_TORIKESHIFLG) = ''''';
      StrSQL := StrSQL || '      OR       QPA6_TORIKESHIFLG IS NULL)';
      StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
      /* 動的カーソルのオープン */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
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
        OtNumZandaka := OtNumZandaka + v_Kasituke;
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
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);      -- 11/01 UPD
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
        OtNumZandaka := OtNumZandaka - v_Nyukin;
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/***********************************************************************/
/* 賞与控除履歴は見ないことにする                                      */
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
      StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD1';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
      StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
      /* 動的カーソルのオープン */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQLの解析 */
      DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
      /* 入力変数をバインドする */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1' , v_ZandakaYMD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2' , v_SysDate);
      /* 出力変数のバインド */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kojo);
      /* SQLの実行 */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
      v_Kasituke := 0;
      IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
        /* カラム値を変数へ格納 */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kojo);
        /* パラメータに渡す */
        OtNumZandaka := OtNumZandaka - v_Kojo;
      END IF;
      /* カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
----↑コメント外し
    END IF;

    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;

  END IF;


--↓ 2002/07/23 追加
--小口台帳Ｔに存在するかチェック
	OtStrKogutiUmu   := '0';
	NumKogutiDataCNT := 0;

	SELECT	COUNT (*)
	INTO	NumKogutiDataCNT
	FROM	QPA1_KGCDAICYOT
	WHERE	QPA1_PRMSYAINCD1 = ' '
	AND		QPA1_PRMSYAINCD2 = InStrSyainCD;

	IF NumKogutiDataCNT = 0 THEN
		OtStrKogutiUmu   := '0';
	ELSE
		OtStrKogutiUmu   := '1';
	END IF;
--↑ 2002/07/23 追加

  OtStrEndFlg := '1';       --パラメータにセット（検索終了）

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt010SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt011SelList                                                                            */
/* 機能          ：小口融資台帳返済額データ取得処理                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011SelList (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --抽出キー  社員コード
  ,InNumMaxRec    IN    NUMBER                      --最大配列格納件数
  ,OtNumRecCount    OUT   NUMBER                      --総検索件数
  ,OtNumAryCount    OUT   NUMBER                      --配列格納件数
  ,OtStrEndFlg    OUT   VARCHAR2                    --検索終了フラグ
  ,OtStrHenkoYM   OUT   typOtHenkoYMAry                 --返済額変更月配列
  ,OtNumKyuyo     OUT   typOtKyuyoAry                   --給与返済額配列
  ,OtNumSyoyo     OUT   typOtSyoyoAry) IS                 --賞与返済額配列

  /* 処理固有の変数 */
  NumIdx        NUMBER;
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  V_NumCount      NUMBER;
  V_Dummy       INTEGER;

  v_HenkoYM     CHAR(6);
  v_Kyuyo       QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_Syoyo       QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;

BEGIN

  OtstrEndFlg := '0';

/* 小口返済額存在チェック */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT ';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  /* カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ローカル変数への関連づけ */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* 変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;

  OtNumRecCount := v_NumCount;

  /* カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* 小口返済額検索 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA2_PRMHENKOUYM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT ';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQl || ' ORDER BY QPA2_PRMHENKOUYM DESC';
  /* 動的カーソルのオープン */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQLの解析 */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* 入力変数をバインドする */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* 出力変数のバインド */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYM,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Kyuyo);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Syoyo);
  /* SQLの実行 */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  NumIdx := 0;
  WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
    /* カラム値を変数へ格納 */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Kyuyo);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Syoyo);
    /* ｲﾝﾃﾞｯｸｽ ｶｳﾝﾄ ｱｯﾌﾟ */
    NumIdx  := NumIdx + 1;
    OtStrHenkoYM(NumIdx) := v_HenkoYM;
    OtNumKyuyo(NumIdx) := v_Kyuyo;
    OtNumSyoyo(NumIdx) := v_Syoyo;
    /* 配列の件数がＭＡＸになった場合 */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      /* 動的カーソルのクローズ */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
      RETURN;
    END IF;
  END LOOP;
  /* 動的カーソルのクローズ */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  OtNumAryCount := NumIdx;      --パラメータにセット
  OtStrEndFlg := '1';       --パラメータにセット（検索終了）

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt011SelList;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt011DatChk                                                                             */
/* 機能          ：返済額履歴データ重複チェック                                                                   */
/******************************************************************************************************************/
/* 返済額履歴データ重複チェック */
PROCEDURE QPAP_CEnt011DatChk (
   InStrSyainCD     IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --変更年月日
  ,InStrHenkoYM     IN    QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE     --変更年月日
  ,OtStrFlg       OUT   CHAR) IS                    --判定フラグ

  v_NumCount      NUMBER;

BEGIN
  OtStrFlg := '1';

  SELECT COUNT(*) INTO v_NumCount FROM QPA2_KGCHENSAIT
  WHERE QPA2_PRMSYAINCD1 = ' '
  AND QPA2_PRMSYAINCD2 = InStrSyainCD
  AND QPA2_PRMHENKOUYM = InStrHenkoYM;

  IF v_NumCount = 0 THEN
    OtStrFlg := '0';
  END IF;

EXCEPTION
  WHEN  OTHERS  THEN
    RAISE ;
END QPAP_CEnt011DatChk;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010DatAdd                                                                             */
/* 機能          ：小口融資台帳データ登録処理                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010DatAdd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --社員コード
  ,InStrKeiyakuYMD  IN    CHAR                      --契約日
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --限度額
  ,InNumKyuyoHensai IN    QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyoHensai IN    QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2) IS                  --担当名（オペログ用）

  numStep       NUMBER   := 0;                      /* 処理ステップ  */
  numErr        NUMBER   := 0;                      /* SQLCODEの退避 */
  strErrMsg     VARCHAR2(100);                      /* SQLERRMの退避 */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

--20040624小口融資入金入力不備対応 by FIP.UEHARA
  numCNT		NUMBER	:= 0;						--残高テーブル件数
  chrSysDate	CHAR(8);							--システム日付格納用
  chrZenDate	CHAR(8);							--前月給与日格納用
--20040624

BEGIN

  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';                 --テーブル名
  recMsg.fldKousinKBN := '1';                         --更新区分
  recMsg.fldAcsKey  := InStrSyainCD;                    --更新キー

  /*  小口融資台帳Tの登録  */
  INSERT INTO QPA1_KGCDAICYOT VALUES (
     ' '                                  --社員コード１
    ,NVL(InStrSyainCD,' ')                          --社員コード２
    ,TO_DATE(InStrKeiyakuYMD,'YYYYMMDD')                  --契約日
    ,NVL(InNumGendogaku,0)                          --融資限度額
    ,NVL(InNumKyuyoHensai,0)                        --給与返済額
    ,NVL(InNumSyoyoHensai,0)                        --賞与返済額
    ,0                                    --給与残高
    ,0                                    --賞与残高
    ,NULL);                                 --控除中止フラグ

--20040624小口融資入金入力不備対応 by FIP.UEHARA
	SELECT COUNT(*) INTO numCNT
	FROM QPA3_KGCZANDAKAT
	WHERE QPA3_PRMSYAINCD1 = ' '
	AND QPA3_PRMSYAINCD2 = InStrSyainCD
	AND QPA3_PRMYUSIKBN = '3';

	--残高テーブルなしの場合
	IF numCNT = 0 THEN
		--システム日付取得
		SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO chrSysDate FROM DUAL;
		--前月給与日取得
		chrZenDate := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(chrSysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';

		--残高履歴テーブル追加
		INSERT INTO QPA3_KGCZANDAKAT (
			 QPA3_PRMSYAINCD1
			,QPA3_PRMSYAINCD2
			,QPA3_PRMYUSIKBN
			,QPA3_PRMZANDAKAYMD
			,QPA3_ZANDAKA)
		VALUES ( ' '
			,NVL(InStrSyainCD,' ')
			,'3'
			,TO_DATE(chrZenDate,'YYYYMMDD')
			,0);
	END IF;
--20040624

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資台帳の更新を正常に行った。';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
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
      recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資台帳の更新に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt010DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt011DatAdd                                                                             */
/* 機能          ：小口融資返済額データ登録処理                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatAdd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM   IN    CHAR                      --変更月
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2) IS                  --担当名（オペログ用）

  numStep       NUMBER   := 0;                      /* 処理ステップ  */
  numErr        NUMBER   := 0;                      /* SQLCODEの退避 */
  strErrMsg     VARCHAR2(100);                      /* SQLERRMの退避 */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN

  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --テーブル名
  recMsg.fldKousinKBN := '1';                         --更新区分
  recMsg.fldAcsKey  := InStrSyainCD;                    --更新キー

  /*  小口融資返済額履歴Tの登録  */
  INSERT INTO QPA2_KGCHENSAIT VALUES (
     ' '                                  --社員コード１
    ,NVL(InStrSyainCD,' ')                          --社員コード２
    ,NVL(InStrHenkoYM,' ')                          --変更月
    ,NVL(InNumKyuyo,0)                            --給与返済額
    ,NVL(InNumSyoyo,0)                            --賞与返済額
  );

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資返済額履歴データの登録を正常に行った。';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
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
      recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資返済額履歴データの登録に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt011DatAdd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010DatUpd                                                           */
/* 機能          ：小口融資台帳データ更新処理                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010DatUpd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --社員コード
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --限度額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2) IS                  --担当名（オペログ用）

  numStep       NUMBER   := 0;                      /* 処理ステップ  */
  numErr        NUMBER   := 0;                      /* SQLCODEの退避 */
  strErrMsg     VARCHAR2(100);                      /* SQLERRMの退避 */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';                 --テーブル名
  recMsg.fldKousinKBN := '2';                         --更新区分
  recMsg.fldAcsKey  := InStrSyainCD;                    --更新キー

  /* 小口融資台帳の更新 */
  UPDATE QPA1_KGCDAICYOT SET
    QPA1_GENDOGAKU = NVL(InNumGendogaku,0)                  --限度額
    WHERE QPA1_PRMSYAINCD1 = ' '                      --更新キー 社員コード１
    AND QPA1_PRMSYAINCD2  = InStrSyainCD;                 --社員コード２

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資台帳の更新を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
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
      recMsg.fldMsg := '（' || InStrTantoNM || '小口融資台帳の更新に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt010DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt011DatUpd                                                           */
/* 機能          ：小口融資返済額データ更新処理                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatUpd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM_O   IN    CHAR                      --変更月（修正前）
  ,InStrHenkoYM_N   IN    CHAR                      --変更月（修正後）
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --給与返済額
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --賞与返済額
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2) IS                  --担当名（オペログ用）

  numStep   NUMBER   := 0;                          /* 処理ステップ  */
  numErr    NUMBER   := 0;                          /* SQLCODEの退避 */
  strErrMsg VARCHAR2(100);                          /* SQLERRMの退避 */
  recMsg    typMsg;
  strLogMsg QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --テーブル名
  recMsg.fldKousinKBN := '2';                         --更新区分
  recMsg.fldAcsKey  := InStrSyainCD;                    --更新キー

  /* 小口融資返済額履歴Ｔの更新 */
  UPDATE QPA2_KGCHENSAIT SET
     QPA2_PRMHENKOUYM = NVL(InStrHenkoYM_N,' ')               --変更月
    ,QPA2_KYUYOHENSAI = NVL(InNumKyuyo,0)                 --給与返済額
    ,QPA2_SYOYOHENSAI = NVL(InNumSyoyo,0)                 --賞与返済額
    WHERE QPA2_PRMSYAINCD1 = ' '                      --更新キー 社員コード１
    AND QPA2_PRMSYAINCD2  = InStrSyainCD                  --社員コード２
    AND QPA2_PRMHENKOUYM  = InStrHenkoYM_O;                 --変更月

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資返済額履歴データの更新を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
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
      recMsg.fldMsg := '（' || InStrTantoNM || '小口融資返済額履歴データの更新に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt011DatUpd;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt011DelPrintT                                                        */
/* 機能          ：小口融資返済額データ削除処理                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatDel (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --社員コード
  ,InStrHenkoYM   IN    CHAR                      --変更月
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューID（オペログ用）
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --モジュールID（オペログ用）
  ,InStrUserID    IN    VARCHAR2                    --ユーザーID（オペログ用）
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ名（オペログ用）
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --利用区分（オペログ用）
  ,InStrBushoCD   IN    VARCHAR2                    --部署コード（オペログ用）
  ,InStrTantoNM   IN    VARCHAR2) IS                  --担当名（オペログ用）

  numStep       NUMBER   := 0;                      /* 処理ステップ  */
  numErr        NUMBER   := 0;                      /* SQLCODEの退避 */
  strErrMsg     VARCHAR2(100);                      /* SQLERRMの退避 */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* オペレーションログ設定 */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --テーブル名
  recMsg.fldKousinKBN := '3';                         --更新区分
  recMsg.fldAcsKey  := InStrSyainCD;                    --更新キー

  /* 小口融資返済額履歴Tの削除 */
  DELETE FROM QPA2_KGCHENSAIT
    WHERE QPA2_PRMSYAINCD1 = ' '
    AND QPA2_PRMSYAINCD2  = InStrSyainCD
    AND QPA2_PRMHENKOUYM  = InStrHenkoYM;

  /* コミット */
  COMMIT;

  /* オペレーションログ出力 */
  numStep := 1;   /* 処理ステップ */
  recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資返済額履歴データの削除を正常に行った';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
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
      recMsg.fldMsg := '（' || InStrTantoNM || '）小口融資返済額履歴データの削除に失敗した';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt011DatDel;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010OpeLog                                                                             */
/* 機能          ：オペログへの追加                                                                               */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt010OpeLog(
   InStrMenuID      IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --メニューＩＤ
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --プログラムＩＤ
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE         --ユーザＩＤ
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --コンピュータ
  ,InStrTouzaiKBN   IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --東西区分
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE          --部署コード
  ,InStrMsg     IN    QUS2_OpeLogT.QUS2_MSG%TYPE) IS          --メッセージ

BEGIN
  QUSP_LogPkg.QUSP_WriteOpeLog(
      InStrMenuID,
      InStrModuleID,
      InStrUserID,
      InStrComputerNM,
      InStrTouzaiKBN,
      InStrBushoCD,
      InStrMsg);
EXCEPTION
  WHEN  OTHERS  THEN
    RAISE;    /* オペログのエラーを認める */
END  QPAP_CEnt010OpeLog;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010Lock                                                                               */
/* 機能          ：小口融資台帳Ｔのロック                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010Lock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --識別コード
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type --社員コード
  ,InStrProgramID   IN    QSA4_HaitaT.QSA4_ProgramID%type   --プログラムＩＤ
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type --コンピュータ名
  ,InStrOperatorID  IN    QSA4_HaitaT.QSA4_OperatorID%type) IS  --オペレータＩＤ

  fldComputerMei    QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN
  /* 小口融資台帳Ｔの確認 */
  numErr  := 0;
  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerMei, fldOperatorID
      from QSA4_HaitaT
     where QSA4_PRMJobKbn  = 'P'
       and QSA4_PRMSikibetu  = InStrSikibetu
       and QSA4_PRMKeyInfo1  = InStrKeyInfo1;       -- 社員番号
  exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    /* 控除中止の確認 */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerMei, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '160'
         and QSA4_PRMKeyInfo1  = ' '            -- 社員番号1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo1;       -- 社員番号2
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
      'P',InStrSikibetu,
      InStrKeyInfo1,'P','P','P','P',
      InStrProgramID, InStrComputerNM, InStrOperatorID,
      sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN  --作業中
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt010Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN  --２重キー
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt010Lock DUPLICATE KEY' );
  WHEN W_HAITASeikyu THEN   --控除中止作業中
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt010Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt010Lock ;

/******************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt010UnLock                                                 */
/* 機能          ：小口融資台帳Ｔのロック解除                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010UnLock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --識別コード
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type)IS  --コンピューター名

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

END QPAP_CEnt010UnLock;

END QPAP_CEnt010PkG;
/***END of LINE***************************************************************************************************/
/
SHOW ERRORS;
