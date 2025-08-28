CREATE OR REPLACE PACKAGE QPAP_Cent1401PkG IS
/*****************************************************************************/
/* システム名    ：高島屋クレジットシステム                                  */
/* 業務名        ：社員融資管理                                              */
/* モジュール名  ：QPAP_Cent1401PkG                                          */
/* 機能          ：控除連絡表印刷                                            */
/*                 QPAP_Cent140PkG が大きくなりすぎたため、一部関数をこの中  */
/*                 で処理する                                                */
/* 作成日        ：2006/02/XX                                                */
/* 作成者        ：FIP                                                       */
/* 修正履歴  案件番号  日付  修正者       備考                               */
/* 00001    0811051 2009/08/28 NBC ISHIDA 完済日が入力されているデータは     */
/*                                        全て控除データがされない為、       */
/*                                        完済日により控除データを           */
/*                                        作成する条件を追加                 */
/* 00002    0811051 2009/08/28 NBC ISHIDA 控除データ作成時の控除中止フラグを */
/*                                        控除連絡表に反映させる             */
/*****************************************************************************/

/*****************************************************************************/
/*                １  宣言部                                                 */
/*****************************************************************************/
/* 賞与日取得関数                  */
FUNCTION QPAP_CEnt1401GetBONUSDayFnc(
	InStrYMD  IN CHAR,
	BONUSYMD  IN CHAR
) RETURN CHAR;

/* 控除連絡表_賞与利息計算 関数 (Return 利息) */
FUNCTION QPAP_CEnt1401SyoRisokuFnc (
	InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --融資日
	InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --賞与返済総額
	InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --賞与返済額
	InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --賞与残高
	InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --契約利率
	InBONUSYMD1       IN  VARCHAR2,                                 --賞与支給日１
	InBONUSYMD2       IN  VARCHAR2,                                 --賞与支給日２
	InStrYMD          IN  VARCHAR2                                  --賞与日付
) RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE;

/* 控除連絡表_賞与利息ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt1401SyouyoRisoku (
	InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
	InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
	InStrYMD        IN  VARCHAR2,                                   --賞与日付
	IngblSyousyoYMD IN  VARCHAR2
);

/* 控除連絡表_賞与印刷ＷＯＲＫ作成 */
PROCEDURE QPAP_CEnt1401KojoPrtSyouyo2 (
	InStrUserID     IN  VARCHAR2,                                   --ユーザーＩＤ
	InStrComputerNM IN  VARCHAR2,                                   --コンピュータ名
	InStrYMD        IN  VARCHAR2                                    --賞与日付
);

/* ADD 00001 社員証書貸付帳票見直し NBC ISHIDA START */
/* 控除中止判定処理 */
FUNCTION QPAP_CEnt1401KojocyushiChek (
	InSyainCD1          IN  VARCHAR2,                               --社員コード１
	InSyainCD2          IN  VARCHAR2,                               --社員コード２
	InStrYMDHMS         IN  VARCHAR2                                --控除日
) RETURN CHAR;
/* ADD 00001 社員証書貸付帳票見直し NBC ISHIDA END */

END QPAP_CEnt1401PkG;
/
SHOW ERRORS;

CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1401PkG IS
/*****************************************************************************/
/*                ２  ボディー                                               */
/*****************************************************************************/
	/* システム変更実施日 */
	/*（この日以降の融資日の貸付は新計算式で、この日より前の融資日の貸付は旧計算式で、利息を計算する）*/
	gbl_SysChangeYMD    CHAR(08) := '20000301';    --システム変更実施日
	gbl_SysChangeYMD2   CHAR(08) := '20011101';    --システム変更実施日

	gbl_ZenRiritu       NUMBER;      --前月利率
	gbl_ZenZenRiritu    NUMBER;      --前々月利率
	gbl_ZenRiritu2      NUMBER;      --前月利率
	gbl_ZenZenRiritu2   NUMBER;      --前々月利率
	InStrYMD_2          CHAR(08);
	v_FROMDATE          CHAR(08);
	v_TODATE            CHAR(08);
	v_TODATE_2          CHAR(08);
	v_BONUSMM1          CHAR(02);
	v_BONUSMM2          CHAR(02);
	v_SYOYOMM           CHAR(02);
	StrSQL              VARCHAR2(1000);

/****************************************************************************************/
/* モジュール名  ：QPAP_CEnt1401GetBONUSDayFnc                                           */
/* 機能          ：12月26日～31日の賞与日に対して、年度をもどすようにする。             */
/* InStrYMD      ：控除実行日(yyyymmdd)                                                 */
/* BONUSYMD      ：賞与日(mmdd)                                                         */
/****************************************************************************************/
FUNCTION QPAP_CEnt1401GetBONUSDayFnc(
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
END QPAP_CEnt1401GetBONUSDayFnc;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1401SyoRisokuFnc                                 */
/* 機能          ：控除連絡表_賞与利息計算 関数 (Return 利息)                */
/*                 ここの処理は、QPAP_CEnt140SyoRisokuFnc のほぼ原型のままに */
/*                 しておく                                                  */
/*****************************************************************************/
FUNCTION QPAP_CEnt1401SyoRisokuFnc (
	InYUSIYMD         IN QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --融資日
	InSYOYOHENSAIALL  IN QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --賞与返済総額
	InSYOYOHENSAI     IN QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --賞与返済額
	InSYOYOZANDAKA    IN QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --賞与残高
	InRIRITU          IN QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --契約利率
	InBONUSYMD1       IN VARCHAR2,                                 --賞与支給日１
	InBONUSYMD2       IN VARCHAR2,                                 --賞与支給日２
	InStrYMD          IN VARCHAR2)                                 --賞与日付
RETURN QPAA_KOJOT.QPAA_RISOKU%TYPE IS
	v_YUSIDD   CHAR(02);
	v_YMD_W1   CHAR(08);    --作業用 年月日
	v_YMD_W2   CHAR(08);    --作業用 年月日
	v_Kikan    NUMBER;      --賞与返済期間
	v_Risoku   NUMBER;      --利息
	v_Nisuu    NUMBER;      --日数
	v_RIRITU   NUMBER;      --利率
BEGIN
	--初期化処理
	v_Risoku   := 0;
	v_RIRITU   := TRUNC(InRIRITU / 36500 * 1000000) / 1000000;
	v_SYOYOMM  := SUBSTR(InStrYMD,    5, 2);
	v_BONUSMM1 := SUBSTR(InBONUSYMD1, 5, 2);
	v_BONUSMM2 := SUBSTR(InBONUSYMD2, 5, 2);
	v_Kikan    := MONTHS_BETWEEN(TO_DATE(SUBSTR(InBONUSYMD2, 1, 6), 'YYYYMM'), TO_DATE(SUBSTR(InBONUSYMD1, 1, 6), 'YYYYMM')); --賞与返済期間

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
					ELSE
						v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
						v_YUSIDD := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
						IF v_YUSIDD >= '11' THEN
							v_Nisuu := v_Nisuu + 6;
						ELSE
							v_Nisuu := v_Nisuu + 21;
						END IF;
						v_Nisuu := v_Nisuu + (TO_NUMBER(SUBSTR(InBONUSYMD2,7,2)) - 1 - 30);
					END If;
					v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
				END IF;
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
		IF TO_CHAR(InYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN
			v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * v_Nisuu  / 36500);
		ELSE
			v_Risoku := TRUNC(InSYOYOZANDAKA * v_RIRITU * v_Nisuu);
		END IF;
	End If;

	RETURN v_Risoku;
END QPAP_CEnt1401SyoRisokuFnc;


/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1401SyouyoRisoku                                 */
/* 機能          ：控除連絡表_賞与利息ＷＯＲＫ作成                           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt1401SyouyoRisoku (
	InStrUserID     IN  VARCHAR2,                     --ユーザーＩＤ
	InStrComputerNM IN  VARCHAR2,                     --コンピュータ名
	InStrYMD        IN  VARCHAR2,                     --賞与日付
	IngblSyousyoYMD IN  VARCHAR2
) IS

	/* 処理固有の変数 */
	v_CursorID        NUMBER := 0;
	v_CursorID2       NUMBER := 0;
	v_Risoku          NUMBER;     --利息
	cnt_KGCHENSAIT    NUMBER;
	v_Dummy           INTEGER;
	v_SelectFlg       INTEGER;
	v_ZenYMD          CHAR(8);    --前月
	v_BONUSYMD18      CHAR(8);
	v_BONUSYMD28      CHAR(8);
	v_BONUSYMD_W      CHAR(8);
	v_YMD             CHAR(8);    --小口賞与返済日取得用日付
	v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
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
	v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
	v_ZANDAKA         QPAA_KOJOT.QPAA_ZANDAKA%TYPE;     --控除テーブル 残高
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
	v_TOZAIKBNE       QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
	v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;

BEGIN

/****************************************/
/* 控除連絡表_利息ＷＯＲＫＴに追加      */
/****************************************/
	-- 控除利息WORKデータ削除
	-- ２重起動対応
	DELETE FROM QPAW_KojoRisoW
	 WHERE QPAW_USERID     = InStrUserID
	   AND QPAW_COMPUTERNM = InStrComputerNM;

	v_ZenYMD   := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMMDD');          -- 前月日付
	v_FROMDATE := SUBSTR(v_ZenYMD, 1, 6) || '26';                                              -- 処理年月の前月26日
	v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                              -- 処理年月の当月25日
	v_TODATE_2 := TO_CHAR(TO_DATE(SUBSTR(InStrYMD, 1, 6) || '01', 'YYYYMMDD') -1, 'YYYYMMDD'); -- 処理年月の前月末日

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
	StrSQL := StrSQL || ' QPAE_MISENM,';
	StrSQL := StrSQL || ' QPAE_TOZAIKBNE';
	StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT,';
	StrSQL := StrSQL || '      QPAC_SYAINM,';
	StrSQL := StrSQL || '      QPAE_MISEM';
	StrSQL := StrSQL || ' WHERE (QPA1_KOJOCYUSHIFLG IS NULL OR QPA1_KOJOCYUSHIFLG = '' '')';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA1_PRMSYAINCD1 ';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA1_PRMSYAINCD2 ';
	StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

	/* 動的カーソルのオープン */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  1, v_PRMSYAINCD1 ,    1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  2, v_PRMSYAINCD2 ,    7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  3, v_KEIYAKUYMD        );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  4, v_GENDOGAKU         );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  5, v_KYUYOHENSAI       );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  6, v_SYOYOHENSAI       );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  7, v_KYUYOZANDAKA      );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  8, v_SYOYOZANDAKA      );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,  9, v_SIMEIKANJI   ,  20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10, v_MISECD       ,   3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11, v_TOZAIKBN     ,   1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12, v_BUMONCD      ,   6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13, v_TAISYOKUYMD       );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 14, v_KYUSYOSTYMD       );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 15, v_KYUSYOEDYMD       );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 16, v_BONUSYMD1    ,   4);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 17, v_BONUSYMD2    ,   4);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 18, v_SEISANCD     ,   3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 19, v_MISENM       ,  24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 20, v_TOZAIKBNE    ,   1);

	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
		/* カラム値を変数へ格納 */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  1, v_PRMSYAINCD1  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  2, v_PRMSYAINCD2  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  3, v_KEIYAKUYMD   );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  4, v_GENDOGAKU    );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  5, v_KYUYOHENSAI  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  6, v_SYOYOHENSAI  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  7, v_KYUYOZANDAKA );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  8, v_SYOYOZANDAKA );
		DBMS_SQL.COLUMN_VALUE(v_CursorID,  9, v_SIMEIKANJI   );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 10, v_MISECD       );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 11, v_TOZAIKBN     );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 12, v_BUMONCD      );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 13, v_TAISYOKUYMD  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 14, v_KYUSYOSTYMD  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 15, v_KYUSYOEDYMD  );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 16, v_BONUSYMD1    );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 17, v_BONUSYMD2    );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 18, v_SEISANCD     );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 19, v_MISENM       );
		DBMS_SQL.COLUMN_VALUE(v_CursorID, 20, v_TOZAIKBNE    );

		/* 賞与支給年月日の再編集 */
		v_BONUSYMD18 := SUBSTR(InStrYMD, 1, 4) || v_BONUSYMD1;
		v_BONUSYMD28 := SUBSTR(InStrYMD, 1, 4) || v_BONUSYMD2;
		v_BONUSYMD18 := QPAP_CEnt1401GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
		v_BONUSYMD28 := QPAP_CEnt1401GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
		IF v_BONUSYMD18 > v_BONUSYMD28 THEN
			v_BONUSYMD_W := v_BONUSYMD18;
			v_BONUSYMD18 := v_BONUSYMD28;
			v_BONUSYMD28 := v_BONUSYMD_W;
		END IF;
		v_SYOYOMM  := SUBSTR(InStrYMD,     5, 2);
		v_BONUSMM1 := SUBSTR(v_BONUSYMD18, 5, 2);
		v_BONUSMM2 := SUBSTR(v_BONUSYMD28, 5, 2);

		/* ワーク　控除連絡表_利息Ｔに追加 */
		IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN

			/* 小口控除賞与返済日取得 */
			IF v_BONUSMM1 = v_SYOYOMM OR v_BONUSMM2 = v_SYOYOMM THEN
				v_YMD := InStrYMD;
			ELSIF TO_NUMBER(v_BONUSMM1) = TO_NUMBER(v_SYOYOMM) - 1 OR TO_NUMBER(v_BONUSMM2) = TO_NUMBER(v_SYOYOMM) - 1 THEN
				v_YMD := v_ZenYMD;
			END IF;

			/* 小口返済額情報取得 */
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT';
			StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
			StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
			StrSQL := StrSQL || '  FROM  QPA2_KGCHENSAIT';
			StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
			StrSQL := StrSQL || '   AND QPA2_PRMSYAINCD2  = :Code2';
			StrSQL := StrSQL || '   AND QPA2_PRMHENKOUYM  <= :YM';
			StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
			/* 動的カーソルのオープン */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQLの解析 */
			DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
			/* 入力変数をバインドする */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':Code1', v_PRMSYAINCD1       );
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':Code2', v_PRMSYAINCD2       );
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':YM',    SUBSTR(v_YMD, 1, 6) );
			/* 出力変数のバインド */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1, v_KYUYOHENSAI);
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 2, v_SYOYOHENSAI);
			/* SQLの実行 */
			v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
			/* FETCH */
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
			/* カラム値を変数へ格納 */
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1, v_KYUYOHENSAI);
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 2, v_SYOYOHENSAI);
			END IF;
			/* カーソルのクローズ */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			/* 東西区分対応 */
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
				SELECT NVL(QPAA_ZANDAKA,0)
				  INTO v_ZANDAKA
				  FROM QPAA_KOJOT
				 WHERE QPAA_SYAINCD1 = v_PRMSYAINCD1
				   AND QPAA_SYAINCD2 = v_PRMSYAINCD2
				   AND QPAA_SYUBETU  = '1'
				   AND QPAA_YUSIKBN  = '3';
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_SelectFlg := 0;
				WHEN OTHERS        THEN
				RAISE;
			END;

			--控除ワークテーブル追加
			INSERT INTO QPAW_KojoRisoW VALUES (
				 NVL(v_PRMSYAINCD1,' ')                                    --個人コード１
				,NVL(v_PRMSYAINCD2,' ')                                    --個人コード２
				,'1'                                                       --ローン種別
				,v_KEIYAKUYMD                                              --契約日
				,NULL                                                      --融資日
				,NVL(v_GENDOGAKU,0)                                        --融資額限度額
				,0                                                         --契約利率
				,0                                                         --返済月数
				,0                                                         --給与返済額総額
				,NVL(v_KYUYOHENSAI, 0)                                     --給与返済額給与時
				,0                                                         --賞与返済額総額
				,NVL(v_SYOYOHENSAI, 0)                                     --賞与返済額賞与時
				,NULL                                                      --完済日
				,DECODE(v_SelectFlg, 1, v_ZANDAKA, NVL(v_KYUYOZANDAKA,0))  --給与残高
				,NVL(v_SYOYOZANDAKA,0)                                     --賞与残高
				,0                                                         --利息
				,NVL(v_TOZAIKBN,' ')                                       --東西区分
				,NVL(v_SEISANCD,' ')                                       --精算店コード
				,NVL(v_MISECD,' ')                                         --所属店コード
				,NVL(v_BUMONCD,' ')                                        --所属部門コード
				,NVL(v_MISENM,' ')                                         --店名称
				,NVL(v_SIMEIKANJI,' ')                                     --個人名漢字
				,v_TAISYOKUYMD                                             --退職年月日
				,v_KYUSYOSTYMD                                             --休職年月日
				,TO_DATE(v_BONUSYMD18,'YYYYMMDD')                          --賞与支給月１
				,TO_DATE(v_BONUSYMD28,'YYYYMMDD')                          --賞与支給月２
				,InStrUserID
				,InStrComputerNM
			);
		END IF;

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
	StrSQL := StrSQL || ' QPAE_MISENM,';
	StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';
	StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT,';
	StrSQL := StrSQL || '      QPAC_SYAINM,';
	StrSQL := StrSQL || '      QPAE_MISEM';
	StrSQL := StrSQL || ' WHERE QPA8_SYOYOZANDAKA <> 0';
	/* MOD 00001 社員証書貸付帳票見直し NBC ISHIDA START */
--	StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
	StrSQL := StrSQL || '   AND (QPA8_KANSAIYMD IS NULL';
	StrSQL := StrSQL || '   OR  QPA8_KANSAIYMD >= TO_DATE(:SyousyoYM,''YYYYMM''))';
	/* MOD 00001 社員証書貸付帳票見直し NBC ISHIDA END */
	StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA8_PRMSYAINCD1 ';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA8_PRMSYAINCD2 ';
	StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

	/* 動的カーソルのオープン */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA START */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyousyoYM', SUBSTR(InStrYMD,1,6));
    /* ADD 0811051 社員証書貸付帳票見直し NBC ISHIDA END */

	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_PRMYUSIYMD     );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_RIRITU         );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_HENSAITUKISU   );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOHENSAIALL );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KYUYOHENSAI    );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SYOYOHENSAIALL );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA   );
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA   );
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
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_TOZAIKBNE,    1);
	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
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
		DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_TOZAIKBNE     );

		/* 賞与支給年月日の再編集 */
		v_BONUSYMD18 := SUBSTR(InStrYMD, 1, 4) || v_BONUSYMD1;
		v_BONUSYMD28 := SUBSTR(InStrYMD, 1, 4) || v_BONUSYMD2;
		v_BONUSYMD18 := QPAP_CEnt1401GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
		v_BONUSYMD28 := QPAP_CEnt1401GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
		IF v_BONUSYMD18 > v_BONUSYMD28 THEN
			v_BONUSYMD_W := v_BONUSYMD18;
			v_BONUSYMD18 := v_BONUSYMD28;
			v_BONUSYMD28 := v_BONUSYMD_W;
		END IF;
		v_SYOYOMM  := SUBSTR(InStrYMD,     5, 2);
		v_BONUSMM1 := SUBSTR(v_BONUSYMD18, 5, 2);
		v_BONUSMM2 := SUBSTR(v_BONUSYMD28, 5, 2);

		/* ワーク　控除連絡表_利息Ｔに追加 */
		IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN

			/*   融資日 <= 証書抽出日付  */
			IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') <= IngblSyousyoYMD THEN
		
				-- 利息算出処理の賞与日決定
				IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE_2))
				OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE_2)) THEN
					--賞与日が先月26日～先月末日なら前月
					InStrYMD_2 := v_ZenYMD;
				ELSE
					--賞与日が処理年月日なら処理年月
					InStrYMD_2 := InStrYMD;
				END IF;

				/* 東西区分対応 */
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
					SELECT NVL(QPAA_ZANDAKA,0)
					  INTO v_ZANDAKA
					  FROM QPAA_KOJOT
					 WHERE QPAA_SYAINCD1 = v_PRMSYAINCD1
					   AND QPAA_SYAINCD2 = v_PRMSYAINCD2
					   AND QPAA_YUSIYMD  = v_PRMYUSIYMD
					   AND QPAA_SYUBETU  = '2'
					   AND QPAA_YUSIKBN  = '3';
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						v_SelectFlg := 0;
					WHEN OTHERS        THEN
						RAISE;
				END;

				/* 利息計算 */
				v_Risoku := QPAP_CEnt1401SyoRisokuFnc(
							v_PRMYUSIYMD,        --融資日
							v_SYOYOHENSAIALL,    --賞与返済総額
							v_SYOYOHENSAI,       --賞与返済額
							v_SYOYOZANDAKA,      --賞与残高
							v_RIRITU,            --契約利率
							v_BONUSYMD18,        --賞与支給日１
							v_BONUSYMD28,        --賞与支給日２
							InStrYMD_2           --賞与日付
							);

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
					,DECODE(v_SelectFlg, 1, v_ZANDAKA - NVL(v_SYOYOZANDAKA, 0) , NVL(v_KYUYOZANDAKA,0) )    --給与残高
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
END QPAP_CEnt1401SyouyoRisoku;

/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1401KojoPrtSyouyo2                               */
/* 機能          ：控除連絡表_賞与印刷ＷＯＲＫ作成 [登録するテーブル変更版]  */
/* 作成          ：2003.03.25                                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt1401KojoPrtSyouyo2 (
	InStrUserID     IN  VARCHAR2,                         --ユーザーＩＤ
	InStrComputerNM IN  VARCHAR2,                         --コンピュータ名
	InStrYMD        IN  VARCHAR2) IS                      --給与日付

	/* 処理固有の変数 */
	v_CursorID        NUMBER := 0;
	v_KINGAKU         NUMBER(7,0);  --金額
	v_GANKIN          NUMBER(7,0);  --元金
	v_ZANDAKA         NUMBER(7,0);  --残高
	v_Dummy           INTEGER;
	v_OutPutFLG       INTEGER;      --出力フラグ
	
	/* バインド変数 */
	v_BUMONNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;
	v_SEISANNM        QPAG_SEISANM.QPAG_SEISANNM%TYPE;
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
	v_MEI             QSA2_SCODET.QSA2_MEI%TYPE;

	v_SYORIYMD        CHAR(8);
	v_SYORIMM         CHAR(2);

BEGIN

	/****************************************/
	/* 控除連絡表_印刷ＷＯＲＫＴに追加  　　*/
	/****************************************/
	DELETE FROM QPAM_SYNKEISANW
	 WHERE QPAM_USERID     = InStrUserID
	   AND QPAM_COMPUTERNM = InStrComputerNM;

	v_FROMDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMM') || '26';  -- 処理年月の前月26日
	v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                            -- 処理年月の当月25日

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
	StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
	StrSQL := StrSQL || '     ,QPAF_BUMONM';
	StrSQL := StrSQL || '     ,QPAG_SEISANM ';
	StrSQL := StrSQL || ' WHERE QPAW_MISECD   = QPAF_PRMMISECD(+)';
	StrSQL := StrSQL || '   AND QPAW_BUMONCD  = QPAF_PRMBUMONCD(+)';
	StrSQL := StrSQL || '   AND QPAW_SEISANCD = QPAG_PRMSEISANCD(+)';
	StrSQL := StrSQL || '   AND (QPAW_TAISYOKUYMD IS NULL';
	StrSQL := StrSQL || '        OR TO_CHAR(QPAW_TAISYOKUYMD,''YYYYMMDD'') > :StrYMD)';
	StrSQL := StrSQL || '   AND (QPAW_KYUSYOKUYMD IS NULL';
	StrSQL := StrSQL || '        OR TO_CHAR(QPAW_KYUSYOKUYMD,''YYYYMMDD'') > :StrYMD)';
	StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
	StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';

	/* 動的カーソルのオープン */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD',        InStrYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',     InStrUserID);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM' ,InStrComputerNM);
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
	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
		/* 出力判定ＦＬＧ 初期化*/
		v_OutPutFLG := 0;     --Off(出力しない)

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

		/* 金額算出 */
		--ローン種別＝１
		IF v_SYUBETU = '1' THEN
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
		IF    TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
		AND   TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE)   THEN
			v_SYORIYMD := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');

		ELSIF TO_NUMBER(TO_CHAR(v_BONUSYMD2, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
		AND   TO_NUMBER(TO_CHAR(v_BONUSYMD2, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE)   THEN
			v_SYORIYMD := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');

		END IF;

		/* 判定用 月 */
		v_SYORIMM   := SUBSTR(InStrYMD,5,2);
		v_BONUSMM1  := SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'), 5, 2);
		v_BONUSMM2  := SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'), 5, 2);

		/* 出力判定 */
		-- 金額・利息に残高あり
		IF  v_KINGAKU > 0 AND v_RISOKU > 0 THEN
			IF v_BONUSMM1 = v_SYORIMM OR v_BONUSMM2 = v_SYORIMM THEN
				v_OutPutFLG := 1;     --On(出力する)
			END IF;
		END IF;

		--実行日が、当月賞与期間内である（前月26日～当月25日）
		IF  TO_NUMBER(v_SYORIYMD) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_SYORIYMD) <= TO_NUMBER(v_TODATE) THEN
			IF    v_SYUBETU = '1'   THEN	--小口分
				--給与・金額に残高がある
				IF v_KINGAKU > 0 AND v_KYUYOZANDAKA > 0 THEN
					--実行日が賞与月であれば出力対象
					v_OutPutFLG := 1;     --On(出力する)
				END IF;

			ELSIF v_SYUBETU = '2'   THEN	--証書分
				--賞与残高・金額に残高がある
				IF v_KINGAKU > 0 AND v_SYOYOZANDAKA > 0 THEN
					v_OutPutFLG := 1;     --On(出力する)
				END IF;
			END IF;

		END IF;

		/* 控除連絡表_印刷ＷＯＲＫに追加 */
		IF  v_OutPutFLG = 1   THEN    --On(出力する)
			/* 2001/10/12 東西区分名称 追加 */
			IF  v_TOZAIKBN = '1' THEN
				v_SEISANNM := RTRIM(v_SEISANNM) || ' (東)';
			ELSE
				v_SEISANNM := RTRIM(v_SEISANNM) || ' (西)';
			END IF;

			/* 集計単位・出力順 */
			SELECT QSA2_MEI
			  INTO v_MEI
			  FROM QSA2_SCODET
			 WHERE QSA2_PRMCODEKBN       = 'DP' || v_TOZAIKBN     --東
			   AND RTRIM(QSA2_PRMCODENO) = v_MISECD;

			/*代替テーブル*/
			INSERT INTO QPAM_SYNKEISANW VALUES (
				 NVL(v_SYAINCD1,' ')            --社員コード１
				,NVL(v_SYAINCD2,' ')            --社員コード２
				,NVL(v_BUMONNM,' ')             --部門名
				,NVL(v_MISENM,' ')              --店名
				,SUBSTR(v_MEI,4,3)              --店コード
				,v_KINGAKU                      --金額
				,v_GANKIN                       --元金
				,NVL(v_RISOKU,0)                --利息
				,v_ZANDAKA                      --残高
				,NVL(v_BUMONCD,' ')             --部門コード
				,SUBSTR(v_MEI,1,3)              --精算店コード
				,v_SYORIYMD                     --処理日
				,NULL
				,TO_NUMBER(NVL(v_SEISANCD,'0')) --精算店コード
				,NULL
				,NVL(v_TOZAIKBN,' ')            --東西区分    
				,NULL
				,NULL
				,'0'                            --控除区分
				,NVL(v_SYUBETU,' ')             --ローン種別
				,NULL                           --行
				,NULL
				,NULL
				,NVL(v_SIMEIKANJI,' ')          --氏名
				,NVL(v_SEISANNM,' ')            --精算店名
				,TO_CHAR(v_YUSIYMD,'YYYYMMDD')  --融資日
				,InStrUserID                    --ユーザーＩＤ
				,InStrComputerNM                --ＰＣ名
			);

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
END QPAP_CEnt1401KojoPrtSyouyo2;


/* ADD 00002 社員証書貸付帳票見直し NBC ISHIDA START */
/*****************************************************************************/
/* モジュール名  ：QPAP_CEnt1401KojocyushiChek                               */
/* 機能          ：控除中止判定処理                                          */
/*                 控除中止テーブルを参照して、控除データ作成時に、          */
/*                 控除中止フラグの有無を判定する。                          */
/* 作成          ：2009.08.28                                                */
/* 戻り値        ：「1 : 控除中止中」「2 : 控除中止解除中」                  */
/*****************************************************************************/
FUNCTION QPAP_CEnt1401KojocyushiChek (
	InSyainCD1          IN  VARCHAR2,                               --社員コード１
	InSyainCD2          IN  VARCHAR2,                               --社員コード２
	InStrYMDHMS         IN  VARCHAR2                                --控除中止登録日時
) RETURN CHAR IS
	rKojocyushiFLG         CHAR(1);

  /* 処理固有の変数 */
	StrSQL              VARCHAR2(1000);
	v_CursorID          NUMBER := 0;
	v_Status            CHAR(1);
	v_Dummy             INTEGER;


BEGIN

	rKojocyushiFLG  := '2';

	/* 控除中止テーブルから最新日付の中止登録ステータス取得 */
	StrSQL := NULL;
	StrSQL := StrSQL || ' SELECT QPB1_KOJOSTATUS' ;
	StrSQL := StrSQL || ' FROM   QPB1_KOJOCANCELT';
	StrSQL := StrSQL || ' WHERE  QPB1_PRMSYAINCD1  =  :Code1';
	StrSQL := StrSQL || ' AND    QPB1_PRMSYAINCD2  =  :Code2';
	StrSQL := StrSQL || ' AND    QPB1_CANCELDATE   <=  TO_DATE(:YMDHMS,''YYYYMMDDHH24MISS'')';
	StrSQL := StrSQL || ' ORDER BY QPB1_CANCELDATE DESC';

	/* 動的カーソルのオープン */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQLの解析 */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
	/* 入力変数をバインドする */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1',InSyainCD1);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2',InSyainCD2);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMDHMS',InStrYMDHMS);
	/* 出力変数のバインド */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Status,1);
	/* SQLの実行 */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	/* FETCH */
	IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
	/* カラム値を変数へ格納 */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Status);
	END IF;
	/* カーソルのクローズ */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	IF v_Status = '1' THEN
		rKojocyushiFLG := '1';
	ELSIF v_Status IS NULL OR v_Status = '2'  THEN
		rKojocyushiFLG := '2';
	END IF;
	
	/* 返却値に当てはめる */
	RETURN rKojocyushiFLG;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt1401KojocyushiChek;
/* ADD 00002 社員証書貸付帳票見直し NBC ISHIDA END */

END QPAP_CEnt1401PkG;
/
SHOW ERRORS;
