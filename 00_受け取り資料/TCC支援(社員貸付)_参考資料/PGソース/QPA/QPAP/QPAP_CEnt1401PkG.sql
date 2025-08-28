CREATE OR REPLACE PACKAGE QPAP_Cent1401PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_Cent1401PkG                                          */
/* �@�\          �F�T���A���\���                                            */
/*                 QPAP_Cent140PkG ���傫���Ȃ肷�������߁A�ꕔ�֐������̒�  */
/*                 �ŏ�������                                                */
/* �쐬��        �F2006/02/XX                                                */
/* �쐬��        �FFIP                                                       */
/* �C������  �Č��ԍ�  ���t  �C����       ���l                               */
/* 00001    0811051 2009/08/28 NBC ISHIDA ���ϓ������͂���Ă���f�[�^��     */
/*                                        �S�čT���f�[�^������Ȃ��ׁA       */
/*                                        ���ϓ��ɂ��T���f�[�^��           */
/*                                        �쐬���������ǉ�                 */
/* 00002    0811051 2009/08/28 NBC ISHIDA �T���f�[�^�쐬���̍T�����~�t���O�� */
/*                                        �T���A���\�ɔ��f������             */
/*****************************************************************************/

/*****************************************************************************/
/*                �P  �錾��                                                 */
/*****************************************************************************/
/* �ܗ^���擾�֐�                  */
FUNCTION QPAP_CEnt1401GetBONUSDayFnc(
	InStrYMD  IN CHAR,
	BONUSYMD  IN CHAR
) RETURN CHAR;

/* �T���A���\_�ܗ^�����v�Z �֐� (Return ����) */
FUNCTION QPAP_CEnt1401SyoRisokuFnc (
	InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --�Z����
	InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --�ܗ^�ԍϑ��z
	InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --�ܗ^�ԍϊz
	InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --�ܗ^�c��
	InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --�_�񗘗�
	InBONUSYMD1       IN  VARCHAR2,                                 --�ܗ^�x�����P
	InBONUSYMD2       IN  VARCHAR2,                                 --�ܗ^�x�����Q
	InStrYMD          IN  VARCHAR2                                  --�ܗ^���t
) RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE;

/* �T���A���\_�ܗ^�����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt1401SyouyoRisoku (
	InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
	InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
	InStrYMD        IN  VARCHAR2,                                   --�ܗ^���t
	IngblSyousyoYMD IN  VARCHAR2
);

/* �T���A���\_�ܗ^����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt1401KojoPrtSyouyo2 (
	InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
	InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
	InStrYMD        IN  VARCHAR2                                    --�ܗ^���t
);

/* ADD 00001 �Ј��؏��ݕt���[������ NBC ISHIDA START */
/* �T�����~���菈�� */
FUNCTION QPAP_CEnt1401KojocyushiChek (
	InSyainCD1          IN  VARCHAR2,                               --�Ј��R�[�h�P
	InSyainCD2          IN  VARCHAR2,                               --�Ј��R�[�h�Q
	InStrYMDHMS         IN  VARCHAR2                                --�T����
) RETURN CHAR;
/* ADD 00001 �Ј��؏��ݕt���[������ NBC ISHIDA END */

END QPAP_CEnt1401PkG;
/
SHOW ERRORS;

CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1401PkG IS
/*****************************************************************************/
/*                �Q  �{�f�B�[                                               */
/*****************************************************************************/
	/* �V�X�e���ύX���{�� */
	/*�i���̓��ȍ~�̗Z�����̑ݕt�͐V�v�Z���ŁA���̓����O�̗Z�����̑ݕt�͋��v�Z���ŁA�������v�Z����j*/
	gbl_SysChangeYMD    CHAR(08) := '20000301';    --�V�X�e���ύX���{��
	gbl_SysChangeYMD2   CHAR(08) := '20011101';    --�V�X�e���ύX���{��

	gbl_ZenRiritu       NUMBER;      --�O������
	gbl_ZenZenRiritu    NUMBER;      --�O�X������
	gbl_ZenRiritu2      NUMBER;      --�O������
	gbl_ZenZenRiritu2   NUMBER;      --�O�X������
	InStrYMD_2          CHAR(08);
	v_FROMDATE          CHAR(08);
	v_TODATE            CHAR(08);
	v_TODATE_2          CHAR(08);
	v_BONUSMM1          CHAR(02);
	v_BONUSMM2          CHAR(02);
	v_SYOYOMM           CHAR(02);
	StrSQL              VARCHAR2(1000);

/****************************************************************************************/
/* ���W���[����  �FQPAP_CEnt1401GetBONUSDayFnc                                           */
/* �@�\          �F12��26���`31���̏ܗ^���ɑ΂��āA�N�x�����ǂ��悤�ɂ���B             */
/* InStrYMD      �F�T�����s��(yyyymmdd)                                                 */
/* BONUSYMD      �F�ܗ^��(mmdd)                                                         */
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
/* ���W���[����  �FQPAP_CEnt1401SyoRisokuFnc                                 */
/* �@�\          �F�T���A���\_�ܗ^�����v�Z �֐� (Return ����)                */
/*                 �����̏����́AQPAP_CEnt140SyoRisokuFnc �̂قڌ��^�̂܂܂� */
/*                 ���Ă���                                                  */
/*****************************************************************************/
FUNCTION QPAP_CEnt1401SyoRisokuFnc (
	InYUSIYMD         IN QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --�Z����
	InSYOYOHENSAIALL  IN QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --�ܗ^�ԍϑ��z
	InSYOYOHENSAI     IN QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --�ܗ^�ԍϊz
	InSYOYOZANDAKA    IN QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --�ܗ^�c��
	InRIRITU          IN QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --�_�񗘗�
	InBONUSYMD1       IN VARCHAR2,                                 --�ܗ^�x�����P
	InBONUSYMD2       IN VARCHAR2,                                 --�ܗ^�x�����Q
	InStrYMD          IN VARCHAR2)                                 --�ܗ^���t
RETURN QPAA_KOJOT.QPAA_RISOKU%TYPE IS
	v_YUSIDD   CHAR(02);
	v_YMD_W1   CHAR(08);    --��Ɨp �N����
	v_YMD_W2   CHAR(08);    --��Ɨp �N����
	v_Kikan    NUMBER;      --�ܗ^�ԍϊ���
	v_Risoku   NUMBER;      --����
	v_Nisuu    NUMBER;      --����
	v_RIRITU   NUMBER;      --����
BEGIN
	--����������
	v_Risoku   := 0;
	v_RIRITU   := TRUNC(InRIRITU / 36500 * 1000000) / 1000000;
	v_SYOYOMM  := SUBSTR(InStrYMD,    5, 2);
	v_BONUSMM1 := SUBSTR(InBONUSYMD1, 5, 2);
	v_BONUSMM2 := SUBSTR(InBONUSYMD2, 5, 2);
	v_Kikan    := MONTHS_BETWEEN(TO_DATE(SUBSTR(InBONUSYMD2, 1, 6), 'YYYYMM'), TO_DATE(SUBSTR(InBONUSYMD1, 1, 6), 'YYYYMM')); --�ܗ^�ԍϊ���

	/**********************************************/
	/* �Z������ 2000/03/01 �����Ɍv�Z���𕪂���   */
	/**********************************************/
	If TO_CHAR(InYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD Then
		/***************/
		/* ���v�Z��    */
		/***************/
		If v_Kikan = 6 Then
			If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
			/*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then          '���񗘑��̔��� */
				If v_BONUSMM1 = v_SYOYOMM Then
					/*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */
					-- ���X�̌v�Z��
					If SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD') + 1,'YYYYMMDD'),5,2) <> SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD'),'YYYYMMDD'),5,2) Then
						/*--If Month(DateAdd("y", 1, CVDate(�ܗ^�x���N����1))) <> Month(CVDate(�ܗ^�x���N����1)) Then */
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
					/*--v_Risoku = Int(MySet!�ܗ^�ԍϊz���z * MySet!�_�񗘗� * ����_WORK / 2 / 18000) */
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
				/*--v_Risoku = Int(MySet!�ܗ^�c�� * MySet!�_�񗘗� / 200) */
			End If;
		Else
			If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
				/*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then          '���񗘑��̔��� */
				v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
				v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
				IF v_YUSIDD >= '11' THEN
					v_Nisuu := v_Nisuu + 6;
				ELSE
					v_Nisuu := v_Nisuu + 21;
				END IF;
				v_Nisuu := v_Nisuu + ((10) - 1 - 30);
				v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
				/*--v_Risoku = Int(MySet!�ܗ^�ԍϊz���z * MySet!�_�񗘗� * ����_WORK / 2 / 18000) */
			Else
				If v_BONUSMM1 = v_SYOYOMM Then
					/* --If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */
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
		/* �V�v�Z��        */
		/*******************/
		-- ����̔���
		If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
		/*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then */
			-- ����̏ꍇ�A�Z�����i�v�Z���鎞�́|�P���j����A����̏ܗ^���܂ł̓���
			If v_BONUSMM1 = v_SYOYOMM Then
			/*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */
				v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD1,7,2);
				v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
			Else
				v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD2,7,2);
				v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
			End If;
		Else
			-- �Q��ڈȍ~�̏ꍇ�A�O��̏ܗ^������A����̏ܗ^���܂ł̓���
			If v_BONUSMM1 = v_SYOYOMM Then
			/*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */
				-- �ܗ^�x�����P������̏ܗ^���̏ꍇ
				If TO_NUMBER(v_BONUSMM1) <  TO_NUMBER(v_BONUSMM2) Then
					/*--If Val(Month(CVDate(�ܗ^�x���N����1))) < Val(Month(CVDate(�ܗ^�x���N����2))) Then */
					-- �O��̏ܗ^��
					v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD2,5,4);
				Else
					-- �O��̏ܗ^��
					v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
				End If;
				-- ����̏ܗ^��
				v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
			Else
				-- �ܗ^�x�����Q������̏ܗ^���̏ꍇ
				If TO_NUMBER(v_BONUSMM2) <  TO_NUMBER(v_BONUSMM1) Then
					/*--If Val(Month(CVDate(�ܗ^�x���N����2))) < Val(Month(CVDate(�ܗ^�x���N����1))) Then */
					-- �O��̏ܗ^��
					v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD1,5,4);
				Else
					-- �O��̏ܗ^��
					v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
				End If;
				-- ����̏ܗ^��
				v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
			End If;
			-- �����v�Z
			v_Nisuu  :=  TO_DATE(v_YMD_W2,'YYYYMMDD') - TO_DATE(v_YMD_W1,'YYYYMMDD');
			/*--WORK_���� = DateDiff("y", CVDate(WORK_DATE1), CVDate(WORK_DATE2)) */
		End If;
		/*******************/
		/* �ܗ^�̗����v�Z  */
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
/* ���W���[����  �FQPAP_CEnt1401SyouyoRisoku                                 */
/* �@�\          �F�T���A���\_�ܗ^�����v�n�q�j�쐬                           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt1401SyouyoRisoku (
	InStrUserID     IN  VARCHAR2,                     --���[�U�[�h�c
	InStrComputerNM IN  VARCHAR2,                     --�R���s���[�^��
	InStrYMD        IN  VARCHAR2,                     --�ܗ^���t
	IngblSyousyoYMD IN  VARCHAR2
) IS

	/* �����ŗL�̕ϐ� */
	v_CursorID        NUMBER := 0;
	v_CursorID2       NUMBER := 0;
	v_Risoku          NUMBER;     --����
	cnt_KGCHENSAIT    NUMBER;
	v_Dummy           INTEGER;
	v_SelectFlg       INTEGER;
	v_ZenYMD          CHAR(8);    --�O��
	v_BONUSYMD18      CHAR(8);
	v_BONUSYMD28      CHAR(8);
	v_BONUSYMD_W      CHAR(8);
	v_YMD             CHAR(8);    --�����ܗ^�ԍϓ��擾�p���t
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
	v_ZANDAKA         QPAA_KOJOT.QPAA_ZANDAKA%TYPE;     --�T���e�[�u�� �c��
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
/* �T���A���\_�����v�n�q�j�s�ɒǉ�      */
/****************************************/
	-- �T������WORK�f�[�^�폜
	-- �Q�d�N���Ή�
	DELETE FROM QPAW_KojoRisoW
	 WHERE QPAW_USERID     = InStrUserID
	   AND QPAW_COMPUTERNM = InStrComputerNM;

	v_ZenYMD   := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMMDD');          -- �O�����t
	v_FROMDATE := SUBSTR(v_ZenYMD, 1, 6) || '26';                                              -- �����N���̑O��26��
	v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                              -- �����N���̓���25��
	v_TODATE_2 := TO_CHAR(TO_DATE(SUBSTR(InStrYMD, 1, 6) || '01', 'YYYYMMDD') -1, 'YYYYMMDD'); -- �����N���̑O������

	/*���������@�����Z���䒠�e�[�u������ */
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

	/* ���I�J�[�\���̃I�[�v�� */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
	/* �o�͕ϐ��̃o�C���h */
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

	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
		/* �J�����l��ϐ��֊i�[ */
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

		/* �ܗ^�x���N�����̍ĕҏW */
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

		/* ���[�N�@�T���A���\_�����s�ɒǉ� */
		IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN

			/* �����T���ܗ^�ԍϓ��擾 */
			IF v_BONUSMM1 = v_SYOYOMM OR v_BONUSMM2 = v_SYOYOMM THEN
				v_YMD := InStrYMD;
			ELSIF TO_NUMBER(v_BONUSMM1) = TO_NUMBER(v_SYOYOMM) - 1 OR TO_NUMBER(v_BONUSMM2) = TO_NUMBER(v_SYOYOMM) - 1 THEN
				v_YMD := v_ZenYMD;
			END IF;

			/* �����ԍϊz���擾 */
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT';
			StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
			StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
			StrSQL := StrSQL || '  FROM  QPA2_KGCHENSAIT';
			StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
			StrSQL := StrSQL || '   AND QPA2_PRMSYAINCD2  = :Code2';
			StrSQL := StrSQL || '   AND QPA2_PRMHENKOUYM  <= :YM';
			StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
			/* ���I�J�[�\���̃I�[�v�� */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQL�̉�� */
			DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
			/* ���͕ϐ����o�C���h���� */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':Code1', v_PRMSYAINCD1       );
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':Code2', v_PRMSYAINCD2       );
			DBMS_SQL.BIND_VARIABLE(v_CursorID2, ':YM',    SUBSTR(v_YMD, 1, 6) );
			/* �o�͕ϐ��̃o�C���h */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1, v_KYUYOHENSAI);
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 2, v_SYOYOHENSAI);
			/* SQL�̎��s */
			v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
			/* FETCH */
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
			/* �J�����l��ϐ��֊i�[ */
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1, v_KYUYOHENSAI);
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 2, v_SYOYOHENSAI);
			END IF;
			/* �J�[�\���̃N���[�Y */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			/* �����敪�Ή� */
			IF  v_TOZAIKBN = '0' THEN     --�����敪 �s��
				IF v_TOZAIKBNE = '1' THEN
					v_TOZAIKBN := '1';
				ELSE
					v_TOZAIKBN := '2';
				END IF;
			END IF;

			/* �T���e�[�u�����c���擾 */
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

			--�T�����[�N�e�[�u���ǉ�
			INSERT INTO QPAW_KojoRisoW VALUES (
				 NVL(v_PRMSYAINCD1,' ')                                    --�l�R�[�h�P
				,NVL(v_PRMSYAINCD2,' ')                                    --�l�R�[�h�Q
				,'1'                                                       --���[�����
				,v_KEIYAKUYMD                                              --�_���
				,NULL                                                      --�Z����
				,NVL(v_GENDOGAKU,0)                                        --�Z���z���x�z
				,0                                                         --�_�񗘗�
				,0                                                         --�ԍό���
				,0                                                         --���^�ԍϊz���z
				,NVL(v_KYUYOHENSAI, 0)                                     --���^�ԍϊz���^��
				,0                                                         --�ܗ^�ԍϊz���z
				,NVL(v_SYOYOHENSAI, 0)                                     --�ܗ^�ԍϊz�ܗ^��
				,NULL                                                      --���ϓ�
				,DECODE(v_SelectFlg, 1, v_ZANDAKA, NVL(v_KYUYOZANDAKA,0))  --���^�c��
				,NVL(v_SYOYOZANDAKA,0)                                     --�ܗ^�c��
				,0                                                         --����
				,NVL(v_TOZAIKBN,' ')                                       --�����敪
				,NVL(v_SEISANCD,' ')                                       --���Z�X�R�[�h
				,NVL(v_MISECD,' ')                                         --�����X�R�[�h
				,NVL(v_BUMONCD,' ')                                        --��������R�[�h
				,NVL(v_MISENM,' ')                                         --�X����
				,NVL(v_SIMEIKANJI,' ')                                     --�l������
				,v_TAISYOKUYMD                                             --�ސE�N����
				,v_KYUSYOSTYMD                                             --�x�E�N����
				,TO_DATE(v_BONUSYMD18,'YYYYMMDD')                          --�ܗ^�x�����P
				,TO_DATE(v_BONUSYMD28,'YYYYMMDD')                          --�ܗ^�x�����Q
				,InStrUserID
				,InStrComputerNM
			);
		END IF;

	END LOOP;
	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	/*���؏����@�Ј��Z���䒠�e�[�u������ */
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
	/* MOD 00001 �Ј��؏��ݕt���[������ NBC ISHIDA START */
--	StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
	StrSQL := StrSQL || '   AND (QPA8_KANSAIYMD IS NULL';
	StrSQL := StrSQL || '   OR  QPA8_KANSAIYMD >= TO_DATE(:SyousyoYM,''YYYYMM''))';
	/* MOD 00001 �Ј��؏��ݕt���[������ NBC ISHIDA END */
	StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA8_PRMSYAINCD1 ';
	StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA8_PRMSYAINCD2 ';
	StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

	/* ���I�J�[�\���̃I�[�v�� */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
	/* ���͕ϐ����o�C���h���� */
    /* ADD 0811051 �Ј��؏��ݕt���[������ NBC ISHIDA START */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyousyoYM', SUBSTR(InStrYMD,1,6));
    /* ADD 0811051 �Ј��؏��ݕt���[������ NBC ISHIDA END */

	/* �o�͕ϐ��̃o�C���h */
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
	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
		/* �J�����l��ϐ��֊i�[ */
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

		/* �ܗ^�x���N�����̍ĕҏW */
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

		/* ���[�N�@�T���A���\_�����s�ɒǉ� */
		IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
		OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN

			/*   �Z���� <= �؏����o���t  */
			IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') <= IngblSyousyoYMD THEN
		
				-- �����Z�o�����̏ܗ^������
				IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE_2))
				OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE_2)) THEN
					--�ܗ^�����挎26���`�挎�����Ȃ�O��
					InStrYMD_2 := v_ZenYMD;
				ELSE
					--�ܗ^���������N�����Ȃ珈���N��
					InStrYMD_2 := InStrYMD;
				END IF;

				/* �����敪�Ή� */
				IF  v_TOZAIKBN = '0' THEN     --�����敪 �s��
					IF v_TOZAIKBNE = '1' THEN
						v_TOZAIKBN := '1';
					ELSE
						v_TOZAIKBN := '2';
					END IF;
				END IF;
				/* �T���e�[�u�����c���擾 */
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

				/* �����v�Z */
				v_Risoku := QPAP_CEnt1401SyoRisokuFnc(
							v_PRMYUSIYMD,        --�Z����
							v_SYOYOHENSAIALL,    --�ܗ^�ԍϑ��z
							v_SYOYOHENSAI,       --�ܗ^�ԍϊz
							v_SYOYOZANDAKA,      --�ܗ^�c��
							v_RIRITU,            --�_�񗘗�
							v_BONUSYMD18,        --�ܗ^�x�����P
							v_BONUSYMD28,        --�ܗ^�x�����Q
							InStrYMD_2           --�ܗ^���t
							);

				INSERT INTO QPAW_KojoRisoW VALUES (
					 NVL(v_PRMSYAINCD1,' ')   --�l�R�[�h�P
					,NVL(v_PRMSYAINCD2,' ')   --�l�R�[�h�Q
					,'2'                      --���[�����
					,NULL                     --�_���
					,v_PRMYUSIYMD             --�Z����
					,NVL(v_GENDOGAKU,0)       --�Z���z���x�z
					,NVL(v_RIRITU,0)          --�_�񗘗�
					,NVL(v_HENSAITUKISU,0)    --�ԍό���
					,NVL(v_KYUYOHENSAIALL,0)  --���^�ԍϊz���z
					,NVL(v_KYUYOHENSAI,0)     --���^�ԍϊz���^��
					,NVL(v_SYOYOHENSAIALL,0)  --�ܗ^�ԍϊz���z
					,NVL(v_SYOYOHENSAI,0)     --�ܗ^�ԍϊz�ܗ^��
					,v_KANSAIYMD              --���ϓ�
					,DECODE(v_SelectFlg, 1, v_ZANDAKA - NVL(v_SYOYOZANDAKA, 0) , NVL(v_KYUYOZANDAKA,0) )    --���^�c��
					,NVL(v_SYOYOZANDAKA,0)    --�ܗ^�c��
					,v_Risoku                 --����
					,NVL(v_TOZAIKBN,' ')      --�����敪
					,NVL(v_SEISANCD,' ')      --���Z�X�R�[�h
					,NVL(v_MISECD,' ')        --�����X�R�[�h
					,NVL(v_BUMONCD,' ')       --��������R�[�h
					,NVL(v_MISENM,' ')        --�X����
					,NVL(v_SIMEIKANJI,' ')    --�l������
					,v_TAISYOKUYMD            --�ސE�N����
					,v_KYUSYOSTYMD            --�x�E�N����
					,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --�ܗ^�x�����P
					,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --�ܗ^�x�����Q
					,InStrUserID
					,InStrComputerNM
					);
			END IF;
		END IF;
	END LOOP;
	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);
	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN  OTHERS  THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		END IF;
		/* ���[���o�b�N */
		ROLLBACK;
	RAISE ;
END QPAP_CEnt1401SyouyoRisoku;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1401KojoPrtSyouyo2                               */
/* �@�\          �F�T���A���\_�ܗ^����v�n�q�j�쐬 [�o�^����e�[�u���ύX��]  */
/* �쐬          �F2003.03.25                                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt1401KojoPrtSyouyo2 (
	InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
	InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
	InStrYMD        IN  VARCHAR2) IS                      --���^���t

	/* �����ŗL�̕ϐ� */
	v_CursorID        NUMBER := 0;
	v_KINGAKU         NUMBER(7,0);  --���z
	v_GANKIN          NUMBER(7,0);  --����
	v_ZANDAKA         NUMBER(7,0);  --�c��
	v_Dummy           INTEGER;
	v_OutPutFLG       INTEGER;      --�o�̓t���O
	
	/* �o�C���h�ϐ� */
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
	/* �T���A���\_����v�n�q�j�s�ɒǉ�  �@�@*/
	/****************************************/
	DELETE FROM QPAM_SYNKEISANW
	 WHERE QPAM_USERID     = InStrUserID
	   AND QPAM_COMPUTERNM = InStrComputerNM;

	v_FROMDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMM') || '26';  -- �����N���̑O��26��
	v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                            -- �����N���̓���25��

	/*���[�N�@�T���A���\_�����s���� */
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

	/* ���I�J�[�\���̃I�[�v�� */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
	/* ���͕ϐ����o�C���h���� */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD',        InStrYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',     InStrUserID);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM' ,InStrComputerNM);
	/* �o�͕ϐ��̃o�C���h */
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
	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
		/* �o�͔���e�k�f ������*/
		v_OutPutFLG := 0;     --Off(�o�͂��Ȃ�)

		/* �J�����l��ϐ��֊i�[ */
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

		/* ���z�Z�o */
		--���[����ʁ��P
		IF v_SYUBETU = '1' THEN
			IF  v_SYOYOHENSAI <= v_KYUYOZANDAKA  THEN
				v_KINGAKU := v_SYOYOHENSAI;
			ELSE
				v_KINGAKU := v_KYUYOZANDAKA;
			END IF;
		--���[����ʁ��Q
		ELSE
			IF  v_SYOYOHENSAI <= v_SYOYOZANDAKA  THEN
				v_KINGAKU := v_SYOYOHENSAI;
			ELSE
				v_KINGAKU := v_SYOYOZANDAKA + v_RISOKU;
			END IF;
		END IF;

		/* �����Z�o */
		v_GANKIN  := v_KINGAKU - v_RISOKU;

		/* �c���Z�o */
		--���[����ʁ��P
		IF  v_SYUBETU = '1' THEN
			v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
		--���[����ʁ��Q
		ELSE
			v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
		END IF;

		/* ������ �Z�o */
		IF    TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
		AND   TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE)   THEN
			v_SYORIYMD := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');

		ELSIF TO_NUMBER(TO_CHAR(v_BONUSYMD2, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
		AND   TO_NUMBER(TO_CHAR(v_BONUSYMD2, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE)   THEN
			v_SYORIYMD := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');

		END IF;

		/* ����p �� */
		v_SYORIMM   := SUBSTR(InStrYMD,5,2);
		v_BONUSMM1  := SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'), 5, 2);
		v_BONUSMM2  := SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'), 5, 2);

		/* �o�͔��� */
		-- ���z�E�����Ɏc������
		IF  v_KINGAKU > 0 AND v_RISOKU > 0 THEN
			IF v_BONUSMM1 = v_SYORIMM OR v_BONUSMM2 = v_SYORIMM THEN
				v_OutPutFLG := 1;     --On(�o�͂���)
			END IF;
		END IF;

		--���s�����A�����ܗ^���ԓ��ł���i�O��26���`����25���j
		IF  TO_NUMBER(v_SYORIYMD) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_SYORIYMD) <= TO_NUMBER(v_TODATE) THEN
			IF    v_SYUBETU = '1'   THEN	--������
				--���^�E���z�Ɏc��������
				IF v_KINGAKU > 0 AND v_KYUYOZANDAKA > 0 THEN
					--���s�����ܗ^���ł���Ώo�͑Ώ�
					v_OutPutFLG := 1;     --On(�o�͂���)
				END IF;

			ELSIF v_SYUBETU = '2'   THEN	--�؏���
				--�ܗ^�c���E���z�Ɏc��������
				IF v_KINGAKU > 0 AND v_SYOYOZANDAKA > 0 THEN
					v_OutPutFLG := 1;     --On(�o�͂���)
				END IF;
			END IF;

		END IF;

		/* �T���A���\_����v�n�q�j�ɒǉ� */
		IF  v_OutPutFLG = 1   THEN    --On(�o�͂���)
			/* 2001/10/12 �����敪���� �ǉ� */
			IF  v_TOZAIKBN = '1' THEN
				v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
			ELSE
				v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
			END IF;

			/* �W�v�P�ʁE�o�͏� */
			SELECT QSA2_MEI
			  INTO v_MEI
			  FROM QSA2_SCODET
			 WHERE QSA2_PRMCODEKBN       = 'DP' || v_TOZAIKBN     --��
			   AND RTRIM(QSA2_PRMCODENO) = v_MISECD;

			/*��փe�[�u��*/
			INSERT INTO QPAM_SYNKEISANW VALUES (
				 NVL(v_SYAINCD1,' ')            --�Ј��R�[�h�P
				,NVL(v_SYAINCD2,' ')            --�Ј��R�[�h�Q
				,NVL(v_BUMONNM,' ')             --���喼
				,NVL(v_MISENM,' ')              --�X��
				,SUBSTR(v_MEI,4,3)              --�X�R�[�h
				,v_KINGAKU                      --���z
				,v_GANKIN                       --����
				,NVL(v_RISOKU,0)                --����
				,v_ZANDAKA                      --�c��
				,NVL(v_BUMONCD,' ')             --����R�[�h
				,SUBSTR(v_MEI,1,3)              --���Z�X�R�[�h
				,v_SYORIYMD                     --������
				,NULL
				,TO_NUMBER(NVL(v_SEISANCD,'0')) --���Z�X�R�[�h
				,NULL
				,NVL(v_TOZAIKBN,' ')            --�����敪    
				,NULL
				,NULL
				,'0'                            --�T���敪
				,NVL(v_SYUBETU,' ')             --���[�����
				,NULL                           --�s
				,NULL
				,NULL
				,NVL(v_SIMEIKANJI,' ')          --����
				,NVL(v_SEISANNM,' ')            --���Z�X��
				,TO_CHAR(v_YUSIYMD,'YYYYMMDD')  --�Z����
				,InStrUserID                    --���[�U�[�h�c
				,InStrComputerNM                --�o�b��
			);

		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN  OTHERS  THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		END IF;
	/* ���[���o�b�N */
	ROLLBACK;
	RAISE ;
END QPAP_CEnt1401KojoPrtSyouyo2;


/* ADD 00002 �Ј��؏��ݕt���[������ NBC ISHIDA START */
/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1401KojocyushiChek                               */
/* �@�\          �F�T�����~���菈��                                          */
/*                 �T�����~�e�[�u�����Q�Ƃ��āA�T���f�[�^�쐬���ɁA          */
/*                 �T�����~�t���O�̗L���𔻒肷��B                          */
/* �쐬          �F2009.08.28                                                */
/* �߂�l        �F�u1 : �T�����~���v�u2 : �T�����~�������v                  */
/*****************************************************************************/
FUNCTION QPAP_CEnt1401KojocyushiChek (
	InSyainCD1          IN  VARCHAR2,                               --�Ј��R�[�h�P
	InSyainCD2          IN  VARCHAR2,                               --�Ј��R�[�h�Q
	InStrYMDHMS         IN  VARCHAR2                                --�T�����~�o�^����
) RETURN CHAR IS
	rKojocyushiFLG         CHAR(1);

  /* �����ŗL�̕ϐ� */
	StrSQL              VARCHAR2(1000);
	v_CursorID          NUMBER := 0;
	v_Status            CHAR(1);
	v_Dummy             INTEGER;


BEGIN

	rKojocyushiFLG  := '2';

	/* �T�����~�e�[�u������ŐV���t�̒��~�o�^�X�e�[�^�X�擾 */
	StrSQL := NULL;
	StrSQL := StrSQL || ' SELECT QPB1_KOJOSTATUS' ;
	StrSQL := StrSQL || ' FROM   QPB1_KOJOCANCELT';
	StrSQL := StrSQL || ' WHERE  QPB1_PRMSYAINCD1  =  :Code1';
	StrSQL := StrSQL || ' AND    QPB1_PRMSYAINCD2  =  :Code2';
	StrSQL := StrSQL || ' AND    QPB1_CANCELDATE   <=  TO_DATE(:YMDHMS,''YYYYMMDDHH24MISS'')';
	StrSQL := StrSQL || ' ORDER BY QPB1_CANCELDATE DESC';

	/* ���I�J�[�\���̃I�[�v�� */
	v_CursorID  := DBMS_SQL.OPEN_CURSOR;
	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
	/* ���͕ϐ����o�C���h���� */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1',InSyainCD1);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2',InSyainCD2);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMDHMS',InStrYMDHMS);
	/* �o�͕ϐ��̃o�C���h */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Status,1);
	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	/* FETCH */
	IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
	/* �J�����l��ϐ��֊i�[ */
	DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Status);
	END IF;
	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	IF v_Status = '1' THEN
		rKojocyushiFLG := '1';
	ELSIF v_Status IS NULL OR v_Status = '2'  THEN
		rKojocyushiFLG := '2';
	END IF;
	
	/* �ԋp�l�ɓ��Ă͂߂� */
	RETURN rKojocyushiFLG;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt1401KojocyushiChek;
/* ADD 00002 �Ј��؏��ݕt���[������ NBC ISHIDA END */

END QPAP_CEnt1401PkG;
/
SHOW ERRORS;
