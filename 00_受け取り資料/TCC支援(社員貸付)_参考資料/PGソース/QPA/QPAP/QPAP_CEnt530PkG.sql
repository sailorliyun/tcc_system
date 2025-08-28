CREATE OR REPLACE PACKAGE  QPAP_CEnt530PkG IS
/****************************************************************************************************************/
/* システム名	 ：高島屋クレジットシステム																		*/
/* 業務名		 ：社員貸付システム																				*/
/* モジュール名  ：QPAP_CEnt530PkG																				*/
/* 機能 		 ：新貸付金残高表																				*/
/* 作成日		 ：2010/02/25																					*/
/* 作成者		 ：FIP																							*/
/* 更新日		 ：2010/07/16	1004091グループ社員貸付の債権譲渡に伴うシステム対応								*/
/* 				 ：				・社員ローン残高合計表の追加													*/
/* 				 ：				・社員ローン残高リストの追加													*/
/****************************************************************************************************************/

/****************************************************************************************************************/
/*	１	宣言部																									*/
/****************************************************************************************************************/

/* データ件数取得 */
PROCEDURE QPAP_CEnt530Search(
	 InStrYMD 		IN	CHAR					--年月
	,OtNumRecCount	OUT	NUMBER);				--件数

/* 残高履歴テーブルからデータを取得し、ワークテーブルへ格納 */
PROCEDURE QPAP_CEnt530SetWorkTable(
	 InStrYMD 		IN	CHAR					--年月
	,InStrUserID		IN	VARCHAR2			--ユーザーＩＤ
	,InStrComputerNM	IN	VARCHAR2);			--コンピュータ名

/* 使用ワークテーブル全削除 */
PROCEDURE QPAP_CEnt530DelWorkTbl(
	 InStrUserID		IN	VARCHAR2			--ユーザーＩＤ
	,InStrComputerNM	IN	VARCHAR2);			--コンピュータ名

/* ADD 20100716 1004091 IMZ NISHIKADO START */
/* 使用ワークテーブル削除（社員ローン残高異動リスト用） */
PROCEDURE QPAP_CEnt530DelWorkTblIdou(
	 InStrUserID 	IN	VARCHAR2				--ユーザーＩＤ
	,InStrComputerNM IN	VARCHAR2);				--コンピュータ名

/* データ件数取得（社員ローン残高異動リスト用） */
PROCEDURE QPAP_CEnt530SearchIdou(
	 InStrYMD 		IN	CHAR					--当月
	,InStrYMDZen 	IN	CHAR					--前月
	,OtNumRecCount	OUT	NUMBER);				--件数

/* 残高履歴テーブルからデータを取得し、ワークテーブルへ格納（社員ローン残高異動リスト用） */
PROCEDURE QPAP_CEnt530SetWorkTableIdou(
	 InStrYMD 			IN	CHAR				--当月
	,InStrYMDZen 		IN	CHAR				--前月
	,InStrUserID		IN	VARCHAR2			--ユーザーＩＤ
	,InStrComputerNM	IN	VARCHAR2);			--コンピュータ名
/* ADD 20100716 1004091 IMZ NISHIKADO END   */

END QPAP_CEnt530PkG;
/

show error
/****************************************************************************************************************/
/*２  ボディー																									*/
/****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt530PkG IS

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt530Search																			*/
/* 機能 		 ：データ件数取得																				*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530Search (
	 InStrYMD		IN	CHAR					--検索条件  出力年月日
	,OtNumRecCount	OUT	NUMBER) IS 				--データ件数

BEGIN
  SELECT COUNT(*) INTO OtNumRecCount
  FROM	 QPB3_ZNDKRRK
  WHERE  QPB3_SYORIYMD = To_date(InStrYMD,'YYYYMMDD')
	AND  QPB3_SYORIKBN = '9';
  
EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530Search;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt530SetWorkTable 																	*/
/* 機能 		 ：残高履歴テーブルからデータを取得し、ワークテーブルへ格納 									*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SetWorkTable (
    InStrYMD 		 IN 	CHAR					--年月
   ,InStrUserID		 IN 	VARCHAR2				--ユーザーＩＤ
   ,InStrComputerNM	 IN 	VARCHAR2) IS			--コンピュータ名

BEGIN
	--ワークテーブルを削除
	DELETE FROM QPB4_NEWZANDAKAW
	WHERE QPB4_USERID     = InStrUserID
	  AND QPB4_COMPUTERNM = InStrComputerNM;

	--ワークテーブルにINSERT	
	INSERT INTO QPB4_NEWZANDAKAW
	(SELECT 
		QPAC_TOZAIKBN									--東西区分
	   ,CASE WHEN OTHER.NAMEX is NULL THEN QPAC_MISECD
			 ELSE '000' END								--会社コード
	   ,CASE WHEN OTHER.NAMEX is NULL THEN QPAE_MISENM
			 ELSE '㈱髙島屋' END						--会社名
	   ,QPAC_MISECD							--店コード
	   ,QPAE_MISENM							--店名
	   ,QPAC_BUMONCD						--部門コード
	   ,QPAF_BUMONNM						--部門名
	   ,QPB3_SYAINCD1						--社員コード1
	   ,QPB3_SYAINCD2						--社員コード2
	   ,QPAC_SIMEIKANJI						--氏名漢字
	   ,QPB3_SYUBETU						--ローン種別(1：小口、2：証書)
	   ,To_Char(QPB3_YUSIYMD,'YYYYMMDD')	--融資日
	   ,Decode(QPB3_SYUBETU,'1',QPB3_FZANDAKA,Null)		--小口 前月末残高
	   ,Decode(QPB3_SYUBETU,'2',QPB3_FZANDAKA,Null)		--証書 前月末残高
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KASHITSUKE,Null)	--小口 当月貸付金額
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KASHITSUKE,Null)	--証書 当月貸付金額
	   ,Decode(QPB3_SYUBETU,'1',QPB3_GANKIN,Null)		--小口 当月入金額(元本)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_GANKIN,Null)		--証書 当月入金額(元本)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_ZANDAKA,Null)		--小口 当月末残高(元本)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_ZANDAKA,Null)		--証書 当月末残高(元本)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKU,Null)		--小口 当月回収利息
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKU,Null)		--証書 当月回収利息
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUK,Null)	--小口 未収利息給与分
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUK,Null)	--証書 未収利息給与分
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUS,Null)	--小口 未収利息賞与分
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUS,Null)	--証書 未収利息賞与分
	   ,InStrUserID							--ユーザID
	   ,InStrComputerNM						--コンピュータ名
	FROM
		QPB3_ZNDKRRK
	   ,QPAC_SYAINM
	   ,QPAE_MISEM
	   ,QPAF_BUMONM
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER
	WHERE
		QPB3_SYORIYMD = To_date(InStrYMD,'YYYYMMDD')
	AND QPB3_SYORIKBN = '9'
	AND QPB3_SYAINCD1 = QPAC_PRMSYAINCD1
	AND QPB3_SYAINCD2 = QPAC_PRMSYAINCD2
	AND QPAC_MISECD   = QPAE_PRMMISECD
	AND QPAC_BUMONCD  = QPAF_PRMBUMONCD(+)
	AND QPAC_MISECD   = QPAF_PRMMISECD(+)
	AND QPAC_MISECD   = OTHER.NAMEX(+)
	);

	COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SetWorkTable;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt530DelWorkTbl									 */
/* 機能 		 ：使用ワークテーブル全削除 								 */
/*****************************************************************************/
PROCEDURE QPAP_CEnt530DelWorkTbl(
	InStrUserID 	IN	VARCHAR2,		  --ユーザーＩＤ
	InStrComputerNM IN	VARCHAR2) IS	  --コンピュータ名

BEGIN
	DELETE FROM QPB4_NEWZANDAKAW
	  WHERE QPB4_USERID 	= InStrUserID
		AND QPB4_COMPUTERNM = InStrComputerNM;

	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt530DelWorkTbl;

/* ADD 20100716 1004091 IMZ NISHIKADO START */

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt530DelWorkTblIdou								 */
/* 機能 		 ：社員ローン残高異動リスト使用ワークテーブル削除			 */
/*****************************************************************************/
PROCEDURE QPAP_CEnt530DelWorkTblIdou(
	InStrUserID 	IN	VARCHAR2,		  --ユーザーＩＤ
	InStrComputerNM IN	VARCHAR2) IS	  --コンピュータ名

BEGIN
	DELETE FROM QPB7_ZNDKIDOUW
	  WHERE QPB7_USERID 	= InStrUserID
		AND QPB7_COMPUTERNM = InStrComputerNM;

	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt530DelWorkTblIdou;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt530SearchIdou																		*/
/* 機能 		 ：データ件数取得(社員ローン残高異動リスト出力対象件数)											*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SearchIdou (
	 InStrYMD		IN	CHAR					--検索条件  出力年月日
	,InStrYMDZen	IN	CHAR					--検索条件  出力年月日の前月末日
	,OtNumRecCount	OUT	NUMBER) IS 				--データ件数

BEGIN
  SELECT COUNT(*) INTO OtNumRecCount
	FROM 
			(SELECT	 QPB3_SYAINCD1
					,QPB3_SYAINCD2
					,QPB3_SYUBETU
					,QPB3_YUSIYMD
					,QPB3_TOZAIKBN
					,QPB3_SYOZOKUCD
					,QPB3_SYOZOKUNM
			FROM	QPB3_ZNDKRRK
			WHERE	QPB3_SYORIYMD=To_date(InStrYMD,'YYYYMMDD')
			AND		QPB3_SYORIKBN='9'
			) TOUGETU,
			(SELECT	 QPB3_SYAINCD1
					,QPB3_SYAINCD2
					,QPB3_SYUBETU
					,QPB3_YUSIYMD
					,QPB3_TOZAIKBN
					,QPB3_SYOZOKUCD
					,QPB3_SYOZOKUNM
			FROM	QPB3_ZNDKRRK
			WHERE	QPB3_SYORIYMD=To_date(InStrYMDZen,'YYYYMMDD')
			AND		(QPB3_ZANDAKA<>0 OR QPB3_KJRISOKUK<>0 OR QPB3_KJRISOKUS<>0)
			AND		QPB3_SYORIKBN='9'
			) ZENGETU
	WHERE	TOUGETU.QPB3_SYAINCD1 = ZENGETU.QPB3_SYAINCD1
	AND		TOUGETU.QPB3_SYAINCD2 = ZENGETU.QPB3_SYAINCD2
	AND		TOUGETU.QPB3_SYUBETU = ZENGETU.QPB3_SYUBETU
	AND		NVL(To_Char(TOUGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(ZENGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ')
	AND		(TOUGETU.QPB3_TOZAIKBN <> ZENGETU.QPB3_TOZAIKBN
	        OR	TOUGETU.QPB3_SYOZOKUCD <> ZENGETU.QPB3_SYOZOKUCD)
	;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SearchIdou;

/****************************************************************************************************************/
/* モジュール名  ：QPAP_CEnt530SetWorkTable 																	*/
/* 機能 		 ：残高履歴テーブルからデータを取得し、残高異動ワークテーブルへ格納 							*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SetWorkTableIdou (
    InStrYMD 		 IN 	CHAR					--当月
   ,InStrYMDZen		 IN 	CHAR					--前月
   ,InStrUserID		 IN 	VARCHAR2				--ユーザーＩＤ
   ,InStrComputerNM	 IN 	VARCHAR2) IS			--コンピュータ名

BEGIN
	--ワークテーブルを削除
	QPAP_CEnt530DelWorkTblIdou(InStrUserID,InStrComputerNM);

	INSERT INTO QPB7_ZNDKIDOUW
	(SELECT 
	    Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,'1','2')					--異動区分（当月=1(転入)、前月=2(転出)）
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD
	   		,CASE WHEN OTHER1.NAMEX is NULL THEN SYOZOKUCD1 ELSE '000' END
			,CASE WHEN OTHER2.NAMEX is NULL THEN SYOZOKUCD2 ELSE '000' END)			--会社コード
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD
	   		,CASE WHEN OTHER1.NAMEX is NULL THEN SYOZOKUNM1 ELSE '㈱髙島屋' END
			,CASE WHEN OTHER2.NAMEX is NULL THEN SYOZOKUNM2 ELSE '㈱髙島屋' END)	--会社名
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.TOZAIKBN1,IDOUSYAIN.TOZAIKBN2)		--東西区分
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUCD1,IDOUSYAIN.SYOZOKUCD2)	--所属店１（当月=異動先、前月=異動元）
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUNM1,IDOUSYAIN.SYOZOKUNM2)
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUCD2,IDOUSYAIN.SYOZOKUCD1)	--所属店２（当月=異動元、前月=異動先）
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUNM2,IDOUSYAIN.SYOZOKUNM1)
	   ,QPB3_SYAINCD1									--社員コード1
	   ,QPB3_SYAINCD2									--社員コード2
	   ,QPAC_SIMEIKANJI									--氏名漢字
	   ,QPB3_SYUBETU									--ローン種別(1：小口、2：証書)
	   ,To_Char(QPB3_YUSIYMD,'YYYYMMDD')				--融資日
	   ,Decode(QPB3_SYUBETU,'1',QPB3_FZANDAKA,Null)		--小口 前月末残高
	   ,Decode(QPB3_SYUBETU,'2',QPB3_FZANDAKA,Null)		--証書 前月末残高
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KASHITSUKE,Null)	--小口 当月貸付金額
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KASHITSUKE,Null)	--証書 当月貸付金額
	   ,Decode(QPB3_SYUBETU,'1',QPB3_GANKIN,Null)		--小口 当月入金額(元本)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_GANKIN,Null)		--証書 当月入金額(元本)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_ZANDAKA,Null)		--小口 当月末残高(元本)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_ZANDAKA,Null)		--証書 当月末残高(元本)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKU,Null)		--小口 当月回収利息
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKU,Null)		--証書 当月回収利息
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUK,Null)	--小口 未収利息給与分
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUK,Null)	--証書 未収利息給与分
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUS,Null)	--小口 未収利息賞与分
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUS,Null)	--証書 未収利息賞与分
	   ,InStrUserID										--ユーザID
	   ,InStrComputerNM									--コンピュータ名
	FROM
		QPB3_ZNDKRRK
	   ,QPAC_SYAINM
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER1
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER2
	   ,(
			SELECT	 TOUGETU.QPB3_SYAINCD1 IDOUSYAINCD1
					,TOUGETU.QPB3_SYAINCD2 IDOUSYAINCD2
					,TOUGETU.QPB3_SYUBETU IDOUSYUBETU
					,TOUGETU.QPB3_YUSIYMD IDOUYUSIYMD
					,TOUGETU.QPB3_TOZAIKBN TOZAIKBN1
					,TOUGETU.QPB3_SYOZOKUCD SYOZOKUCD1
					,TOUGETU.QPB3_SYOZOKUNM SYOZOKUNM1
					,ZENGETU.QPB3_TOZAIKBN TOZAIKBN2
					,ZENGETU.QPB3_SYOZOKUCD SYOZOKUCD2
					,ZENGETU.QPB3_SYOZOKUNM SYOZOKUNM2
			FROM 
					(SELECT	 QPB3_SYAINCD1
							,QPB3_SYAINCD2
							,QPB3_SYUBETU
							,QPB3_YUSIYMD
							,QPB3_TOZAIKBN
							,QPB3_SYOZOKUCD
							,QPB3_SYOZOKUNM
					FROM	QPB3_ZNDKRRK
					WHERE	QPB3_SYORIYMD=To_date(InStrYMD,'YYYYMMDD')
					AND		QPB3_SYORIKBN='9'
					) TOUGETU,
					(SELECT	 QPB3_SYAINCD1
							,QPB3_SYAINCD2
							,QPB3_SYUBETU
							,QPB3_YUSIYMD
							,QPB3_TOZAIKBN
							,QPB3_SYOZOKUCD
							,QPB3_SYOZOKUNM
					FROM	QPB3_ZNDKRRK
					WHERE	QPB3_SYORIYMD=To_date(InStrYMDZen,'YYYYMMDD')
					AND		(QPB3_ZANDAKA<>0 OR QPB3_KJRISOKUK<>0 OR QPB3_KJRISOKUS<>0)
					AND		QPB3_SYORIKBN='9'
					) ZENGETU
			WHERE	TOUGETU.QPB3_SYAINCD1 = ZENGETU.QPB3_SYAINCD1
			AND		TOUGETU.QPB3_SYAINCD2 = ZENGETU.QPB3_SYAINCD2
			AND		TOUGETU.QPB3_SYUBETU = ZENGETU.QPB3_SYUBETU
			AND		NVL(To_Char(TOUGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(ZENGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ')
			AND		(TOUGETU.QPB3_TOZAIKBN <> ZENGETU.QPB3_TOZAIKBN
			        OR	TOUGETU.QPB3_SYOZOKUCD <> ZENGETU.QPB3_SYOZOKUCD)
		) IDOUSYAIN
	WHERE
		QPB3_SYORIYMD >= To_date(InStrYMDZen,'YYYYMMDD') 
	AND QPB3_SYORIYMD <= To_date(InStrYMD,'YYYYMMDD')
	AND QPB3_SYORIKBN = '9'
	AND QPB3_SYAINCD1 = IDOUSYAINCD1
	AND QPB3_SYAINCD2 = IDOUSYAINCD2
	AND QPB3_SYUBETU = IDOUSYUBETU
	AND NVL(To_Char(QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(IDOUYUSIYMD,'YYYYMMDD'),' ')
	AND QPB3_SYAINCD1 = QPAC_PRMSYAINCD1
	AND QPB3_SYAINCD2 = QPAC_PRMSYAINCD2
	AND SYOZOKUCD1    = OTHER1.NAMEX(+)
	AND SYOZOKUCD2    = OTHER2.NAMEX(+)
	);

	COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SetWorkTableIdou;
/* ADD 20100716 1004091 IMZ NISHIKADO END */

END QPAP_CEnt530PkG;
/****************************************************************************************************************/
/* END of LINE																									*/
/****************************************************************************************************************/
/
show error
