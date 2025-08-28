CREATE OR REPLACE PACKAGE  QPAP_CEnt1560PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_CEnt1560PkG                                          */
/* �@�\          �F�c�������e�[�u���X�V�����i�J�z�����j                      */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FNBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100319  TR1003-010       �؏��T�����~���̐V�c���\���z��Z                                                    */
/*                            �@ ���Z���ȍ~�̋��^�E�ܗ^�T���������W�v���Ȃ�                                       */
/*                            �A �T�����~���̗��R�Ő��Z�����ɂ��ւ�炸�c����0�ɂȂ�Ȃ�                          */
/*                               �ꍇ�ɐ��Z���z�𒲐�����(12���ܗ^�ɂ��Ή�)                                       */
/*                            �B 11�����Z�̏ꍇ12���ܗ^��11���Ɍv�コ���B                                       */
/*                               12���̏����Ŏc����12���ܗ^���}�C�i�X�ɂȂ�̂Œ�������                           */
/* 20100720  1004091          �O���[�v�Ј��ݕt�̍����n�ɔ����V�X�e���Ή�                                        */
/*                               �c�������e�[�u���ւ̓����敪�A�����X�R�[�h�A�����X���̂̕ҏW�ǉ�                 */
/******************************************************************************************************************/

/* �c�������e�[�u���X�V�����i�J�z�����j�yMain�����z */
PROCEDURE QPAP_ZNDKKUSNMAIN (
	InChaNetID	IN  CHAR,				-- �l�b�g�h�c
	InChaJobID	IN  CHAR);				-- �W���u�h�c

/* �c�������e�[�u���X�V�����i�J�z�����F�����j */
PROCEDURE QPAP_ZNDKKUSNSUB1 (
	i_SYAINCD1	IN  CHAR,				-- �Ј��R�[�h�P
	i_SYAINCD2	IN  CHAR,				-- �Ј��R�[�h�Q
	i_SYUBETU	IN  CHAR,				-- ���[�����
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN	IN  CHAR,
	i_SYOZOKUCD	IN  CHAR,
	i_SYOZOKUNM	IN  VARCHAR,
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		OUT NUMBER);				-- �������ʖ߂�l

/* �c�������e�[�u���X�V�����i�J�z�����F�؏��j */
PROCEDURE QPAP_ZNDKKUSNSUB2 (
	i_SYAINCD1	IN  CHAR,				-- �Ј��R�[�h�P
	i_SYAINCD2	IN  CHAR,				-- �Ј��R�[�h�Q
	i_SYUBETU	IN  CHAR,				-- ���[�����
	i_YUSIYMD	IN  DATE,				-- �Z����
--ADD 20100319 0908047 NBC YOKOYAMA START
	i_cnt		IN  CHAR,				-- �P�F���ځA�Q�F����
--ADD 20100319 0908047 NBC YOKOYAMA END
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN	IN  CHAR,				-- �����敪
	i_SYOZOKUCD	IN  CHAR,				-- �����X�R�[�h
	i_SYOZOKUNM	IN  VARCHAR,			-- �����X����
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		OUT NUMBER);				-- �������ʖ߂�l

END QPAP_CEnt1560PkG;
/
SHOW ERR

/*****************************************************************************/
/* �Q  �{�f�B�[                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1560PkG IS

/* MOD 20100720 1004091 IMZ OKAZAKI START */
---- �J�[�\����`�i�Ј��R�[�h�P�A�Ј��R�[�h�Q�A���[����ʁA�Z�������擾�j
-- �J�[�\����`�i�Ј��R�[�h�P�A�Ј��R�[�h�Q�A���[����ʁA�Z�����A�����敪�A�X�R�[�h�A�X�����擾�j
/* MOD 20100720 1004091 IMZ OKAZAKI END */
	CURSOR CurDico(fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			QPB3_SYAINCD1  SYAINCD1,
			QPB3_SYAINCD2  SYAINCD2,
			QPB3_SYUBETU   SYUBETU,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
	--		QPB3_YUSIYMD   YUSIYMD
	--	FROM  QPB3_ZNDKRRK
			QPB3_YUSIYMD   YUSIYMD,
			QPAC_TOZAIKBN  TOZAIKBN,
			QPAC_MISECD    MISECD,
			QPAE_MISENM    MISENM
		FROM  QPB3_ZNDKRRK,
			  QPAC_SYAINM,
			  QPAE_MISEM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		WHERE QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
/* ADD 20100720 1004091 IMZ OKAZAKI START */
		AND   NVL(QPB3_SYAINCD1, ' ') = NVL(QPAC_PRMSYAINCD1, ' ')
		AND   QPB3_SYAINCD2           = QPAC_PRMSYAINCD2
		AND   QPAC_MISECD             = QPAE_PRMMISECD(+)
/* ADD 20100720 1004091 IMZ OKAZAKI END */
		GROUP BY QPB3_SYAINCD1, QPB3_SYAINCD2, QPB3_SYUBETU, QPB3_YUSIYMD, QPAC_TOZAIKBN, QPAC_MISECD, QPAE_MISENM
		ORDER BY QPB3_SYAINCD1, QPB3_SYAINCD2, QPB3_SYUBETU, QPB3_YUSIYMD;


--- �J�[�\����`�i�O���̖��׃f�[�^�擾�j
	CURSOR CurZndkrrk1(SYAINCD1_I IN CHAR, SYAINCD2_I IN CHAR, SYUBETU_I IN CHAR, fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			ROWID		CurID,
			QPB3_SYORIKBN	SYORIKBN,
			QPB3_KASHITSUKE	KASHITSUKE,
			QPB3_GANKIN	GANKIN,
			QPB3_KJRISOKU	KJRISOKU,
			QPB3_MGANKINK	MGANKINK,
			QPB3_KJRISOKUK	KJRISOKUK,
			QPB3_MGANKINS	MGANKINS,
			QPB3_KJRISOKUS	KJRISOKUS
		FROM  QPB3_ZNDKRRK
		WHERE NVL(QPB3_SYAINCD1, ' ') = NVL(SYAINCD1_I, ' ')
		AND   QPB3_SYAINCD2 = SYAINCD2_I
		AND   QPB3_SYUBETU  = SYUBETU_I
		AND   QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
		ORDER BY QPB3_SYORIYMD, QPB3_SYORIKBN FOR UPDATE;

--- �J�[�\����`�i�O���̖��׃f�[�^�擾�j
	CURSOR CurZndkrrk2(SYAINCD1_I IN CHAR, SYAINCD2_I IN CHAR, SYUBETU_I IN CHAR, YUSIYMD_I IN DATE, fromDate_I IN DATE, toDate_I IN DATE) IS
		SELECT
			ROWID		CurID,
			QPB3_SYORIKBN	SYORIKBN,
			QPB3_KASHITSUKE	KASHITSUKE,
			QPB3_GANKIN	GANKIN,
			QPB3_KJRISOKU	KJRISOKU,
			QPB3_MGANKINK	MGANKINK,
			QPB3_KJRISOKUK	KJRISOKUK,
			QPB3_MGANKINS	MGANKINS,
			QPB3_KJRISOKUS	KJRISOKUS
--ADD 20100319 0908047 NBC YOKOYAMA START
			,QPB3_SYORIYMD	SYORIYMD
--ADD 20100319 0908047 NBC YOKOYAMA END
		FROM  QPB3_ZNDKRRK
		WHERE NVL(QPB3_SYAINCD1, ' ') = NVL(SYAINCD1_I, ' ')
		AND   QPB3_SYAINCD2 = SYAINCD2_I
		AND   QPB3_SYUBETU  = SYUBETU_I
		AND   QPB3_YUSIYMD  = YUSIYMD_I
		AND   QPB3_SYORIYMD >= fromDate_I
		AND   QPB3_SYORIYMD <  toDate_I
		ORDER BY QPB3_SYORIYMD, QPB3_SYORIKBN FOR UPDATE;


-- �O���[�o���ϐ���`
	SyoriDate	DATE;
	w_toDate	DATE;			-- �f�[�^�擾���ԁF�J�n
	w_fromDate	DATE;			-- �f�[�^�擾���ԁF�I��
	module		VARCHAR2(40);		-- ���O�o�̓��W���[�����i�[
	job_id		CHAR(8);		-- �W���u�h�c
	net_id		CHAR(8);		-- �l�b�g�h�c


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1560PkG.QPAP_ZNDKKUSNMAIN                        */
/* �@�\          �F�c�������e�[�u���F�e���׍s�̎c�����X�V����                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNMAIN (
					InChaNetID	IN	CHAR,	--�l�b�g�h�c
					InChaJobID	IN	CHAR)	--�W���u�h�c

IS

	-- �����ϐ���`
	SyoriKbn	NUMBER		:=	0;	-- �������s�ӏ��J�E���g
	RowDico		CurDico%ROWTYPE;		-- �J�[�\��
	i_SYAINCD1	CHAR(1);
	i_SYAINCD2	CHAR(7);
	i_SYUBETU	CHAR(1);
	i_YUSIYMD	DATE;
/* ADD 20100720 1004091 IMZ OKAZAKI START */
	i_TOZAIKBN  CHAR(1);
	i_SYOZOKUCD CHAR(3);
	i_SYOZOKUNM VARCHAR(24);
/* ADD 20100720 1004091 IMZ OKAZAKI END */
	o_ret		NUMBER;
	b_toDate	DATE;
	b_fromDate	DATE;
	DATA_UNMATCH_EXCEPTION EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNMAIN';

	job_id	:=	InChaJobID;
	net_id	:=	InChaNetID;

	-- �R���\�[�����O�o�́i�����J�n�j
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'I', 'Start');


	-- �������t�A���Ԏ擾�i������-2���� �` ������-1�����j
	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD');
	w_fromDate	:=	ADD_MONTHS(w_toDate,   -2);

	b_toDate   := w_toDate;
	b_fromDate := w_fromDate;


	-- ���I�J�[�\���̃I�[�v��
	OPEN CurDico(w_fromDate, w_toDate);

	-- �����敪
	SyoriKbn := 1;

	LOOP
		FETCH CurDico INTO RowDico;
		IF CurDico%NOTFOUND THEN
			EXIT;                                     --���[�v�I��
		END IF;

		-- �Ј����X�g�擾
		i_SYAINCD1	:= NVL(RowDico.SYAINCD1, ' ');
		i_SYAINCD2	:= RowDico.SYAINCD2;
		i_SYUBETU	:= RowDico.SYUBETU;
		i_YUSIYMD	:= RowDico.YUSIYMD;
/* ADD 20100720 1004091 IMZ OKAZAKI START */
		i_TOZAIKBN	:= RowDico.TOZAIKBN; -- �����敪
		i_SYOZOKUCD	:= RowDico.MISECD;   -- �X�R�[�h
		i_SYOZOKUNM	:= RowDico.MISENM;   -- �X��
/* ADD 20100720 1004091 IMZ OKAZAKI END */

		-- �����敪
		SyoriKbn := 2;

		w_toDate   := b_toDate;
		w_fromDate := b_fromDate;

		-- �J�z���v�Z����і��׍s�ɔ��f�A�J�z���R�[�h�ǉ�
		IF i_SYUBETU = '1' THEN
/* MOD 20100720 1004091 IMZ OKAZAKI START */
	--		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, o_ret);
			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		ELSE
/* MOD 20100720 1004091 IMZ OKAZAKI START */
--MOD 20100319 0908047 NBC YOKOYAMA START
----		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, o_ret);
	----	QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '1', o_ret);
--MOD 20100319 0908047 NBC YOKOYAMA END
			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '1', i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
		END IF;

		-- �����敪
		SyoriKbn := 3;

		-- ��Q����
		IF o_ret = 99 THEN
			-- �����敪
			SyoriKbn := 4;
			RAISE DATA_UNMATCH_EXCEPTION;
		END IF;

		-- �����敪
		SyoriKbn := 5;

		-- �J�z���z���}�C�i�X�̏���
		IF o_ret = 1 THEN
			-- �����敪
			SyoriKbn := 6;

			w_toDate   := b_toDate;
			w_fromDate := b_fromDate;

			-- �J�z���v�Z����і��׍s�ɔ��f�A�J�z���R�[�h�ǉ��i�ď����j
			IF i_SYUBETU = '2' THEN
--				QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, o_ret);
--			ELSE
/* MOD 20100720 1004091 IMZ OKAZAKI START */
--MOD 20100319 0908047 NBC YOKOYAMA START
----			QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, o_ret);
	----		QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '2', o_ret);
--MOD 20100319 0908047 NBC YOKOYAMA END
				QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, '2', i_TOZAIKBN, i_SYOZOKUCD, i_SYOZOKUNM, o_ret);
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			END IF;

			-- �����敪
			SyoriKbn := 7;

		END IF;

	END LOOP;

	-- ���I�J�[�\���̃N���[�Y
	CLOSE CurDico;

	-- �����敪
	SyoriKbn := 8;

	-- �R�~�b�g
	commit;

	-- �R���\�[�����O�o�́i�����I���j
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'I', 'End');


EXCEPTION
	WHEN	DATA_UNMATCH_EXCEPTION THEN
		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
			'���Z���R�[�h����' ||
			':SYAINCD1=' || i_SYAINCD1 ||
			':SYAINCD2=' || i_SYAINCD2 ||
			':SYUBETU='  || i_SYUBETU  ||
			':YUSIYMD='  || i_YUSIYMD
			);

	WHEN	OTHERS	THEN
	IF CurDico%ISOPEN = TRUE THEN
		CLOSE CurDico;
	END IF;

	-- ���[���o�b�N
	ROLLBACK;

	-- ���O�o�͂d�m�c
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN1:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* �G���[���� */
	RAISE;

END QPAP_ZNDKKUSNMAIN;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1(����)                  */
/* �@�\          �F�c�������e�[�u���F�e���׍s�̎c�����X�V����                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNSUB1 (
					i_SYAINCD1 IN  CHAR,	-- �Ј��R�[�h�P
					i_SYAINCD2 IN  CHAR,	-- �Ј��R�[�h�Q
					i_SYUBETU  IN  CHAR,	-- ���[�����
/* ADD 20100720 1004091 IMZ OKAZAKI START */
					i_TOZAIKBN IN  CHAR,	-- �����敪
					i_SYOZOKUCD IN CHAR,	-- �����X�R�[�h
					i_SYOZOKUNM IN VARCHAR,	-- �����X����
/* ADD 20100720 1004091 IMZ OKAZAKI END */
					o_ret	   OUT NUMBER)	-- �������ʖ߂�l

IS

	RowZndkrrk1	CurZndkrrk1%ROWTYPE;		-- �J�[�\��
	MeiKurFLG	NUMBER := 0;			-- ���ׂɌJ�z���R�[�h���݊m�F�p
	i_ZANDAKA	NUMBER := 0;
	i_MGANKINK	NUMBER := 0;
	i_KJRISOKUK	NUMBER := 0;
	i_MGANKINS	NUMBER := 0;
	i_KJRISOKUS	NUMBER := 0;
	FZANDAKA	NUMBER := 0;
	ZANDAKA		NUMBER := 0;
	i_KASHITSUKE	NUMBER := 0;
	i_GANKIN	NUMBER := 0;
	i_KJRISOKU	NUMBER := 0;
	Z_CurID		ROWID;
	Z_SYORIKBN	CHAR(1);
	Z_KASHITSUKE	NUMBER := 0;
	Z_GANKIN	NUMBER := 0;
	Z_KJRISOKU	NUMBER := 0;
	Z_MGANKINK	NUMBER := 0;
	Z_KJRISOKUK	NUMBER := 0;
	Z_MGANKINS	NUMBER := 0;
	Z_KJRISOKUS	NUMBER := 0;
	X_CurID		ROWID;
	X_GANKIN 	NUMBER := 0;
	SyoriKbn	NUMBER := 0;

	NO_DATA_EXCEPTION1 EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB1';

	-- �߂�l�ݒ�
	o_ret	:= 0;

	-- �J�z���R�[�h������
	SyoriDate	:=	LAST_DAY(ADD_MONTHS(w_toDate, -1));

	BEGIN
		-- �J�z�f�[�^�擾�i�c���j
		SELECT		NVL(QPB3_ZANDAKA, 0),
				NVL(QPB3_MGANKINK, 0),
				NVL(QPB3_KJRISOKUK, 0),
				NVL(QPB3_MGANKINS, 0),
				NVL(QPB3_KJRISOKUS, 0)
			INTO	i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_SYORIKBN =  '9'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  ADD_MONTHS(w_toDate, -1);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			i_ZANDAKA	:= 0;
			i_MGANKINK	:= 0;
			i_KJRISOKUK	:= 0;
			i_MGANKINS	:= 0;
			i_KJRISOKUS	:= 0;
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
				'KURIKOSI DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
				':SYAINCD2=' || i_SYAINCD2 ||
				':SYUBETU=' || i_SYUBETU
				);
		WHEN	OTHERS	THEN
			IF CurZndkrrk1%ISOPEN = TRUE THEN
				-- ���I�J�[�\���̃N���[�Y
				CLOSE CurZndkrrk1;
			END IF;

			-- �߂�l�ݒ�
			o_ret	:= 99;

			-- ���[���o�b�N
			ROLLBACK;

			-- ���O�o�͂d�m�c
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
				'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

			/* �G���[���� */
			RAISE;

	END;

	-- �����敪
	SyoriKbn := 1;

	-- �O�X���̎c���ݒ�
	FZANDAKA	:= i_ZANDAKA;
	ZANDAKA		:= i_ZANDAKA;		-- �c���i���חp�j

	-- �������t�A���Ԏ擾�i������-1���� �` �������j
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂����ꍇ�̏����t���O
	MeiKurFLG := 0;

	-- �����敪
	SyoriKbn := 2;

	-- ���I�J�[�\���̃I�[�v��
	OPEN CurZndkrrk1(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, w_fromDate, w_toDate);
	LOOP
		FETCH CurZndkrrk1 INTO RowZndkrrk1;
		IF CurZndkrrk1%NOTFOUND THEN
			EXIT;                                     --���[�v�I��
		END IF;

		-- �f�[�^�擾
		Z_CurID		:= RowZndkrrk1.CurID;
		Z_SYORIKBN	:= nvl(RowZndkrrk1.SYORIKBN, 0);
		Z_KASHITSUKE	:= nvl(RowZndkrrk1.KASHITSUKE, 0);
		Z_GANKIN	:= nvl(RowZndkrrk1.GANKIN, 0);
		Z_KJRISOKU	:= nvl(RowZndkrrk1.KJRISOKU, 0);
		Z_MGANKINK	:= nvl(RowZndkrrk1.MGANKINK, 0);
		Z_KJRISOKUK	:= nvl(RowZndkrrk1.KJRISOKUK, 0);
		Z_MGANKINS	:= nvl(RowZndkrrk1.MGANKINS, 0);
		Z_KJRISOKUS	:= nvl(RowZndkrrk1.KJRISOKUS, 0);

		-- �����敪�ʏ����i�J�z���R�[�h�ׁ̈A�X�V�������I���j
		IF Z_SYORIKBN = '9' THEN

			-- �����敪
			SyoriKbn := 5;

			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_FZANDAKA	= FZANDAKA,
				QPB3_KASHITSUKE	= i_KASHITSUKE,
				QPB3_GANKIN	= i_GANKIN,
				QPB3_KJRISOKU	= i_KJRISOKU,
				QPB3_ZANDAKA	= i_ZANDAKA,
				QPB3_MGANKINK	= i_MGANKINK,
				QPB3_KJRISOKUK	= i_KJRISOKUK,
				QPB3_MGANKINS	= i_MGANKINS,
				QPB3_KJRISOKUS	= i_KJRISOKUS,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE

--			WHERE	ROWID = Z_CurID;
			WHERE CURRENT OF CurZndkrrk1;

			-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂����ꍇ�̏����t���O
			MeiKurFLG := 1;

			EXIT;                                     --���[�v�I��
		END IF;

		-- �c���v�Z
--		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN + Z_MGANKINK + Z_MGANKINS;
		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN;

		-- �W�v�i�ݕt�A�����A�T���A����߂��A�������z�j
		i_KASHITSUKE	:= i_KASHITSUKE  + Z_KASHITSUKE;
--		i_GANKIN	:= i_GANKIN      + Z_GANKIN   - Z_MGANKINK  - Z_MGANKINS;
		i_GANKIN	:= i_GANKIN      + Z_GANKIN;
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU - Z_KJRISOKUK - Z_KJRISOKUS;
		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		i_MGANKINK	:= i_MGANKINK    + Z_MGANKINK;
		i_KJRISOKUK	:= i_KJRISOKUK   + Z_KJRISOKUK;
		i_MGANKINS	:= i_MGANKINS    + Z_MGANKINS;
		i_KJRISOKUS	:= i_KJRISOKUS   + Z_KJRISOKUS;

		-- �����敪
		SyoriKbn := 3;

		-- ���R�[�h�X�V
		UPDATE QPB3_ZNDKRRK
		SET	QPB3_FZANDAKA	= ZANDAKA,
			QPB3_ZANDAKA	= i_ZANDAKA,
			QPB3_KUSNFLG	= '1',
			QPB3_KUSNYMD	= SYSDATE
--		WHERE ROWID = Z_CurID;
		WHERE CURRENT OF CurZndkrrk1;

		-- �����敪
		SyoriKbn := 4;

		-- �c���X�V�i���חp�j
		ZANDAKA := i_ZANDAKA;

	END LOOP;

	-- ���I�J�[�\���̃N���[�Y
	CLOSE CurZndkrrk1;

	-- �����敪
	SyoriKbn := 6;

--	-- �c�����}�C�i�X�̏ꍇ�̏����i�؏��̂ݑΉ��j
--	IF i_SYUBETU = '2' AND i_ZANDAKA < 0 THEN

--		-- �����敪
--		SyoriKbn := 7;

--		-- ����������
--		X_GANKIN := 0;

--		-- ���Z���R�[�h�擾
--		SELECT	ROWID,
--			NVL(QPB3_GANKIN, 0)
--		INTO	X_CurID,
--			X_GANKIN
--		FROM	QPB3_ZNDKRRK
--		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
--		AND	QPB3_SYAINCD2 =  i_SYAINCD2
--		AND	QPB3_SYUBETU  =  i_SYUBETU
--		AND	QPB3_SYORIKBN =  '7'
--		AND	QPB3_SYORIYMD >= w_fromDate
--		AND	QPB3_SYORIYMD <  w_toDate;

--		-- �����敪
--		SyoriKbn := 8;

--		-- ���Z���R�[�h�����݂��Ȃ��ꍇ
--		IF SQL%ROWCOUNT = 0 THEN
--			RAISE NO_DATA_EXCEPTION1;
--		END IF;

--		-- �����敪
--		SyoriKbn := 9;

--		-- �����Ƀ}�C�i�X�c����������
--		X_GANKIN := X_GANKIN + i_ZANDAKA;

--		-- ���Z���R�[�h�X�V
--		UPDATE	QPB3_ZNDKRRK
--		SET	QPB3_GANKIN	= X_GANKIN,
--			QPB3_KUSNFLG	= '1',
--			QPB3_KUSNYMD	= SYSDATE
--		WHERE	ROWID = X_CurID;

--		-- �����敪
--		SyoriKbn := 10;

--	END IF;

	-- �����敪
	SyoriKbn := 11;

	-- �J�z���R�[�h�o�^
	IF MeiKurFLG = 0 THEN

		-- �����敪
		SyoriKbn := 12;

		IF ABS(FZANDAKA) + ABS(i_KASHITSUKE) + ABS(i_GANKIN) + ABS(i_KJRISOKU) + ABS(i_ZANDAKA) + ABS(i_MGANKINK) + ABS(i_KJRISOKUK) + ABS(i_MGANKINS) + ABS(i_KJRISOKUS) <> 0 THEN

			-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂��Ȃ��ꍇ�A�ǉ�����
			-- ���݂����ꍇ�́A���[�v���ōX�V�������s���Ă���
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_FZANDAKA,
				QPB3_KASHITSUKE,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_ZANDAKA,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
			--	QPB3_KUSNYMD
				QPB3_KUSNYMD,
				QPB3_TOZAIKBN,
				QPB3_SYOZOKUCD,
				QPB3_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			) VALUES (
				NVL(i_SYAINCD1, ' '),
				i_SYAINCD2,
				i_SYUBETU,
				SyoriDate,
				'9',
				FZANDAKA,
				i_KASHITSUKE,
				i_GANKIN,
				i_KJRISOKU,
				i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS,
				'1',
				SYSDATE,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		SYSDATE
				SYSDATE,
				i_TOZAIKBN,
				i_SYOZOKUCD,
				i_SYOZOKUNM
/* MOD 2010072- 1004091 IMZ OKAZAKI END */
			);

		END IF;

	END IF;

	-- �����敪
	SyoriKbn := 13;

EXCEPTION
	WHEN	NO_DATA_EXCEPTION1 THEN
		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
			'���Z���R�[�h����' ||
			':SYAINCD1=' || i_SYAINCD1 ||
			':SYAINCD2=' || i_SYAINCD2 ||
			':SYUBETU='  || i_SYUBETU
			);

	WHEN	OTHERS	THEN
	IF CurZndkrrk1%ISOPEN = TRUE THEN
		-- ���I�J�[�\���̃N���[�Y
		CLOSE CurZndkrrk1;
	END IF;

	-- �߂�l�ݒ�
	o_ret	:= 99;

	-- ���[���o�b�N
	ROLLBACK;

	-- ���O�o�͂d�m�c
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* �G���[���� */
	RAISE;

END QPAP_ZNDKKUSNSUB1;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2(�؏�)                  */
/* �@�\          �F�c�������e�[�u���F�e���׍s�̎c�����X�V����                */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDKKUSNSUB2 (
					i_SYAINCD1 IN  CHAR,	-- �Ј��R�[�h�P
					i_SYAINCD2 IN  CHAR,	-- �Ј��R�[�h�Q
					i_SYUBETU  IN  CHAR,	-- ���[�����
					i_YUSIYMD  IN  DATE,	-- �Z����
--ADD 20100319 0908047 NBC YOKOYAMA START
					i_cnt	   IN  CHAR,	-- �P�F���ځA�Q�F����
--ADD 20100319 0908047 NBC YOKOYAMA END
/* ADD 20100720 1004091 IMZ OKAZAKI START */
					i_TOZAIKBN IN  CHAR,	-- �����敪
					i_SYOZOKUCD IN CHAR,	-- �����X�R�[�h
					i_SYOZOKUNM IN VARCHAR,	-- �����X����
/* ADD 20100720 1004091 IMZ OKAZAKI END */
					o_ret	   OUT NUMBER)	-- �������ʖ߂�l
IS

	RowZndkrrk2	CurZndkrrk2%ROWTYPE;		-- �J�[�\��
	MeiKurFLG	NUMBER := 0;			-- ���ׂɌJ�z���R�[�h���݊m�F�p
	i_ZANDAKA	NUMBER := 0;
	i_MGANKINK	NUMBER := 0;
	i_KJRISOKUK	NUMBER := 0;
	i_MGANKINS	NUMBER := 0;
	i_KJRISOKUS	NUMBER := 0;
	FZANDAKA	NUMBER := 0;
	ZANDAKA		NUMBER := 0;
	i_KASHITSUKE	NUMBER := 0;
	i_GANKIN	NUMBER := 0;
	i_KJRISOKU	NUMBER := 0;
	Z_CurID		ROWID;
	Z_SYORIKBN	CHAR(1);
	Z_KASHITSUKE	NUMBER := 0;
	Z_GANKIN	NUMBER := 0;
	Z_KJRISOKU	NUMBER := 0;
	Z_MGANKINK	NUMBER := 0;
	Z_KJRISOKUK	NUMBER := 0;
	Z_MGANKINS	NUMBER := 0;
	Z_KJRISOKUS	NUMBER := 0;
	X_CurID		ROWID;
	X_GANKIN 	NUMBER := 0;
	SyoriKbn	NUMBER := 0;

--ADD 20100319 0908047 NBC YOKOYAMA START
	SeisanFLG	CHAR(1);		--�؏����ρF1�A�����ρF0
	SeisanDate	DATE;			--���Z����ۑ�
	KyuyoFLG	CHAR(1);		--���^�T���L��F1�A�Ȃ��F0
	SyoyoFLG	CHAR(1);		--�ܗ^�T���L��F1�A�Ȃ��F0
	X_CurID2	ROWID;			--�؏�����T�p
	X_GANKIN2 	NUMBER := 0;	--�؏�����T�p

	--���Z���ȍ~�̍T���������̗����v�Z�p
	v_Risoku		NUMBER := 0;	--����
	v_Kikan			NUMBER := 0;	--����
	KyuyoTo			DATE;			--���^�v�Z��To
	KyuyoFrom		DATE;			--���^�v�Z��From
	SyoyoTo			DATE;			--�ܗ^�v�Z��To
	SyoyoFrom		DATE;			--�ܗ^�v�Z��From
	v_KYUYOZANDAKA		QPB6_SYNDAICYOW2T.QPB6_KYUYOZANDAKA%TYPE := 0;
	v_SYOYOZANDAKA		QPB6_SYNDAICYOW2T.QPB6_SYOYOZANDAKA%TYPE := 0;
	v_SYOYOHENSAIALL	QPB6_SYNDAICYOW2T.QPB6_SYOYOHENSAIALL%TYPE := 0;
	v_RIRITU			QPB6_SYNDAICYOW2T.QPB6_RIRITU%TYPE := 0;
	v_RIRITU2			NUMBER := 0;
--ADD 20100319 0908047 NBC YOKOYAMA END
--	NO_DATA_EXCEPTION2 EXCEPTION;

BEGIN

	module	:=	'QPAP_CEnt1560PkG.QPAP_ZNDKKUSNSUB2';

	-- �߂�l�ݒ�
	o_ret	:= 0;

	-- �J�z���R�[�h������
	SyoriDate	:=	LAST_DAY(ADD_MONTHS(w_toDate, -1));

	BEGIN
		-- �J�z�f�[�^�擾�i�c���j
		SELECT		NVL(QPB3_ZANDAKA, 0),
				NVL(QPB3_MGANKINK, 0),
				NVL(QPB3_KJRISOKUK, 0),
				NVL(QPB3_MGANKINS, 0),
				NVL(QPB3_KJRISOKUS, 0)
			INTO	i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '9'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  ADD_MONTHS(w_toDate, -1);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			i_ZANDAKA	:= 0;
			i_MGANKINK	:= 0;
			i_KJRISOKUK	:= 0;
			i_MGANKINS	:= 0;
			i_KJRISOKUS	:= 0;
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
				'KURIKOSI DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
				':SYAINCD2=' || i_SYAINCD2 ||
				':SYUBETU=' || i_SYUBETU ||
				':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
				);
		WHEN	OTHERS	THEN
			IF CurZndkrrk2%ISOPEN = TRUE THEN
				-- ���I�J�[�\���̃N���[�Y
				CLOSE CurZndkrrk2;
			END IF;

			-- �߂�l�ݒ�
			o_ret	:= 99;

			-- ���[���o�b�N
			ROLLBACK;

			-- ���O�o�͂d�m�c
			QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
				'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

			/* �G���[���� */
			RAISE;

	END;

	-- �����敪
	SyoriKbn := 1;

	-- �O�X���̎c���ݒ�
	FZANDAKA	:= i_ZANDAKA;
	ZANDAKA		:= i_ZANDAKA;		-- �c���i���חp�j

	-- �������t�A���Ԏ擾�i������-1���� �` �������j
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂����ꍇ�̏����t���O
	MeiKurFLG := 0;

--ADD 20100319 0908047 NBC YOKOYAMA START
	SeisanFLG := 0;		--������
	KyuyoFLG := 0;		--������
	SyoyoFLG := 0;		--������
--ADD 20100319 0908047 NBC YOKOYAMA END

	-- �����敪
	SyoriKbn := 2;

	-- ���I�J�[�\���̃I�[�v��
	OPEN CurZndkrrk2(i_SYAINCD1, i_SYAINCD2, i_SYUBETU, i_YUSIYMD, w_fromDate, w_toDate);
	LOOP
		FETCH CurZndkrrk2 INTO RowZndkrrk2;
		IF CurZndkrrk2%NOTFOUND THEN
			EXIT;                                     --���[�v�I��
		END IF;

		-- �f�[�^�擾
		Z_CurID		:= RowZndkrrk2.CurID;
		Z_SYORIKBN	:= nvl(RowZndkrrk2.SYORIKBN, 0);
		Z_KASHITSUKE	:= nvl(RowZndkrrk2.KASHITSUKE, 0);
		Z_GANKIN	:= nvl(RowZndkrrk2.GANKIN, 0);
		Z_KJRISOKU	:= nvl(RowZndkrrk2.KJRISOKU, 0);
		Z_MGANKINK	:= nvl(RowZndkrrk2.MGANKINK, 0);
		Z_KJRISOKUK	:= nvl(RowZndkrrk2.KJRISOKUK, 0);
		Z_MGANKINS	:= nvl(RowZndkrrk2.MGANKINS, 0);
		Z_KJRISOKUS	:= nvl(RowZndkrrk2.KJRISOKUS, 0);

--ADD 20100319 0908047 NBC YOKOYAMA START
		IF Z_SYORIKBN = '7' THEN
			SeisanFLG := '1';						--���Z����B�ȍ~�̃��[�v�ŏo�Ă���T���͗������W�v���Ȃ�
			SeisanDate := RowZndkrrk2.SYORIYMD;		--���Z�����o���Ă���
		ELSIF Z_SYORIKBN = '3' THEN
			KyuyoFLG := '1';		--���^�T������B
		ELSIF Z_SYORIKBN = '4' THEN
			SyoyoFLG := '1';		--�ܗ^�T������B
		END IF;
--ADD 20100319 0908047 NBC YOKOYAMA END

		-- �����敪�ʏ����i�J�z���R�[�h�ׁ̈A�X�V�������I���j
		IF Z_SYORIKBN = '9' THEN

			-- �����敪
			SyoriKbn := 5;

			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_FZANDAKA	= FZANDAKA,
				QPB3_KASHITSUKE	= i_KASHITSUKE,
				QPB3_GANKIN	= i_GANKIN,
				QPB3_KJRISOKU	= i_KJRISOKU,
				QPB3_ZANDAKA	= i_ZANDAKA,
				QPB3_MGANKINK	= i_MGANKINK,
				QPB3_KJRISOKUK	= i_KJRISOKUK,
				QPB3_MGANKINS	= i_MGANKINS,
				QPB3_KJRISOKUS	= i_KJRISOKUS,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
--			WHERE	ROWID = Z_CurID;
			WHERE CURRENT OF CurZndkrrk2;

			-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂����ꍇ�̏����t���O
			MeiKurFLG := 1;

			EXIT;                                     --���[�v�I��
		END IF;

		-- �c���v�Z
--		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN + Z_MGANKINK + Z_MGANKINS;
		i_ZANDAKA := i_ZANDAKA + Z_KASHITSUKE - Z_GANKIN;

		-- �W�v�i�ݕt�A�����A�T���A����߂��A�������z�j
		i_KASHITSUKE	:= i_KASHITSUKE  + Z_KASHITSUKE;
--		i_GANKIN	:= i_GANKIN      + Z_GANKIN   - Z_MGANKINK  - Z_MGANKINS;
		i_GANKIN	:= i_GANKIN      + Z_GANKIN;
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU - Z_KJRISOKUK - Z_KJRISOKUS;
--MOD 20100319 0908047 NBC YOKOYAMA START
		--���Z���ȍ~�̍T���͐��Z���z�Ƒ��E���Ă���֌W�ŁA�������v�サ�Ȃ�
--		i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		IF NOT(SeisanFLG = '1' AND (Z_SYORIKBN = '3' OR Z_SYORIKBN = '4')) THEN
			i_KJRISOKU	:= i_KJRISOKU    + Z_KJRISOKU;
		END IF;
--MOD 20100319 0908047 NBC YOKOYAMA END
		i_MGANKINK	:= i_MGANKINK    + Z_MGANKINK;
		i_KJRISOKUK	:= i_KJRISOKUK   + Z_KJRISOKUK;
		i_MGANKINS	:= i_MGANKINS    + Z_MGANKINS;
		i_KJRISOKUS	:= i_KJRISOKUS   + Z_KJRISOKUS;

		-- �����敪
		SyoriKbn := 3;

		-- ���R�[�h�X�V
		UPDATE QPB3_ZNDKRRK
		SET	QPB3_FZANDAKA	= ZANDAKA,
			QPB3_ZANDAKA	= i_ZANDAKA,
			QPB3_KUSNFLG	= '1',
			QPB3_KUSNYMD	= SYSDATE
--		WHERE ROWID = Z_CurID;
		WHERE CURRENT OF CurZndkrrk2;

		-- �����敪
		SyoriKbn := 4;

		-- �c���X�V�i���חp�j
		ZANDAKA := i_ZANDAKA;

	END LOOP;

	-- ���I�J�[�\���̃N���[�Y
	CLOSE CurZndkrrk2;

	-- �����敪
	SyoriKbn := 6;

--MOD 20100319 0908047 NBC YOKOYAMA START
	-- �c�����}�C�i�X�̏ꍇ�̏����i�؏��̂ݑΉ��j
--���Z���̂ݏ�������悤�ɕύX
--�}�C�i�X�ɉ����ăv���X(�c���]��)�̏������ǉ�
--	IF i_SYUBETU = '2' AND i_ZANDAKA < 0 THEN
	IF i_SYUBETU = '2' AND i_ZANDAKA <> 0 AND SeisanFLG = '1' THEN
--MOD 20100319 0908047 NBC YOKOYAMA END

		-- �����敪
		SyoriKbn := 7;

		-- ����������
		X_GANKIN := 0;

		BEGIN

			-- ���Z���R�[�h�擾
			SELECT	ROWID,
				NVL(QPB3_GANKIN, 0)
			INTO	X_CurID,
				X_GANKIN
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '7'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  w_toDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- ���I�J�[�\���̃N���[�Y
					CLOSE CurZndkrrk2;
				END IF;

				-- �߂�l�ݒ�
				o_ret	:= 99;

				-- ���[���o�b�N
				ROLLBACK;

				-- ���O�o�͂d�m�c
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* �G���[���� */
				RAISE;

		END;

--ADD 20100319 0908047 NBC YOKOYAMA START
		-- ����������
		X_GANKIN2 := 0;
		SyoriKbn := 77;
		BEGIN

			-- �؏�����T���烌�R�[�h�擾
			SELECT	ROWID,
				NVL(QPA9_NYUKINGAKU, 0)
			INTO	X_CurID2,
				X_GANKIN2
			FROM	QPA9_SYNNYUKINT
			WHERE	NVL(QPA9_PRMSYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPA9_PRMSYAINCD2 =  i_SYAINCD2
			AND	QPA9_PRMYUSIYMD  =  i_YUSIYMD;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'QPA9 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- ���I�J�[�\���̃N���[�Y
					CLOSE CurZndkrrk2;
				END IF;

				-- �߂�l�ݒ�
				o_ret	:= 99;

				-- ���[���o�b�N
				ROLLBACK;

				-- ���O�o�͂d�m�c
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* �G���[���� */
				RAISE;

		END;
--ADD 20100319 0908047 NBC YOKOYAMA END

		-- �����敪
		SyoriKbn := 8;

		-- ���Z���R�[�h�����݂��Ȃ��ꍇ
--		IF SQL%ROWCOUNT = 0 THEN
		IF SQL%ROWCOUNT != 0 THEN

			-- �����敪
			SyoriKbn := 9;

--MOD 20100319 0908047 NBC YOKOYAMA START
			-- �����Ƀ}�C�i�X�c����������
			-- �v���X(�]��)�̎c���ł�������
--MOD 20100319 0908047 NBC YOKOYAMA END
			X_GANKIN := X_GANKIN + i_ZANDAKA;

			-- ���Z���R�[�h�X�V
			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_GANKIN	= X_GANKIN,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
			WHERE	ROWID = X_CurID;

--ADD 20100319 0908047 NBC YOKOYAMA START
			--���ƂȂ���QPA9���X�V
			X_GANKIN2 := X_GANKIN2 + i_ZANDAKA;

			UPDATE QPA9_SYNNYUKINT
			SET QPA9_NYUKINGAKU = X_GANKIN2
			WHERE	ROWID = X_CurID2;
--ADD 20100319 0908047 NBC YOKOYAMA END

			-- �����敪
			SyoriKbn := 10;

			-- �߂�l�ݒ�
			o_ret	:= 1;

--			RAISE NO_DATA_EXCEPTION2;
		END IF;


	END IF;

	-- �����敪
	SyoriKbn := 11;

	-- �J�z���R�[�h�o�^
	IF MeiKurFLG = 0 THEN

		-- �����敪
		SyoriKbn := 12;

		IF ABS(FZANDAKA) + ABS(i_KASHITSUKE) + ABS(i_GANKIN) + ABS(i_KJRISOKU) + ABS(i_ZANDAKA) + ABS(i_MGANKINK) + ABS(i_KJRISOKUK) + ABS(i_MGANKINS) + ABS(i_KJRISOKUS) <> 0 THEN

			-- ���׃��R�[�h�ɌJ�z���R�[�h�����݂��Ȃ��ꍇ�A�ǉ�����
			-- ���݂����ꍇ�́A���[�v���ōX�V�������s���Ă���
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_YUSIYMD,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_FZANDAKA,
				QPB3_KASHITSUKE,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_ZANDAKA,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		QPB3_KUSNYMD
				QPB3_KUSNYMD,
				QPB3_TOZAIKBN,
				QPB3_SYOZOKUCD,
				QPB3_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			) VALUES (
				NVL(i_SYAINCD1, ' '),
				i_SYAINCD2,
				i_SYUBETU,
				i_YUSIYMD,
				SyoriDate,
				'9',
				FZANDAKA,
				i_KASHITSUKE,
				i_GANKIN,
				i_KJRISOKU,
				i_ZANDAKA,
				i_MGANKINK,
				i_KJRISOKUK,
				i_MGANKINS,
				i_KJRISOKUS,
				'1',
				SYSDATE,
/* MOD 20100720 1004091 IMZ OKAZAKI START */
		--		SYSDATE
				SYSDATE,
				i_TOZAIKBN,
				i_SYOZOKUCD,
				i_SYOZOKUNM
/* MOD 20100720 1004091 IMZ OKAZAKI END */
			);
		END IF;

	END IF;

	-- �����敪
	SyoriKbn := 13;

--ADD 20100319 0908047 NBC YOKOYAMA START
--�T�����ȍ~�̐��Z�ōT���f�[�^���Ȃ��ꍇ�A���Z���z���T������������Ȃ��Ȃ�B(�c���͏�Œ����ς�)
--�T���������v�Z���āAQPB3��QPB5�ɉ�����

    /**************/
	/*    ���^    */
    /**************/
	IF     SeisanFLG = '1' 
	   AND KyuyoFLG = '0' 
	   AND TO_CHAR(SeisanDate,'DD') >= '25' 
	   AND TO_CHAR(SeisanDate,'YYYYMM') <> TO_CHAR(i_YUSIYMD,'YYYYMM') 
	   AND i_cnt = '1' THEN	--2���ڂ͂��Ȃ�
		--�䒠���狋�^�c���Ɨ������擾
		SELECT QPB6_RIRITU,QPB6_KYUYOZANDAKA
		INTO   v_RIRITU   ,v_KYUYOZANDAKA
		FROM   QPB6_SYNDAICYOW2T
		WHERE  NVL(QPB6_PRMSYAINCD1, ' ') = NVL(i_SYAINCD1, ' ')
		AND    QPB6_PRMSYAINCD2           = i_SYAINCD2
		AND    QPB6_PRMYUSIYMD            = i_YUSIYMD;
		
		--�����v�ZFrom
		KyuyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(w_fromDate,'YYYYMM') || '26'),-1);	--�������O��26��
		--����T���������璲��
		IF TO_CHAR(i_YUSIYMD,'YYYYMM') = TO_CHAR(KyuyoFrom,'YYYYMM') THEN
			KyuyoFrom := i_YUSIYMD;
		END IF;
		
		--�����v�ZTo
		KyuyoTo   := TO_DATE(TO_CHAR(w_fromDate,'YYYYMM') || '25');					--����������25��

		--�����v�Z
		v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;
		v_Kikan   := KyuyoTo - KyuyoFrom + 1;
		v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU2 * v_Kikan);

		--���Z���R�[�h�ƕ��𗘑�T�ɗ�����������
		BEGIN

			-- ���Z���R�[�h�擾
			SELECT	ROWID
			INTO	X_CurID
			FROM	QPB3_ZNDKRRK
			WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB3_SYAINCD2 =  i_SYAINCD2
			AND	QPB3_SYUBETU  =  i_SYUBETU
			AND	QPB3_YUSIYMD  =  i_YUSIYMD
			AND	QPB3_SYORIKBN =  '7'
			AND	QPB3_SYORIYMD >= w_fromDate
			AND	QPB3_SYORIYMD <  w_toDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- ���I�J�[�\���̃N���[�Y
					CLOSE CurZndkrrk2;
				END IF;

				-- �߂�l�ݒ�
				o_ret	:= 99;

				-- ���[���o�b�N
				ROLLBACK;

				-- ���O�o�͂d�m�c
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* �G���[���� */
				RAISE;

		END;

		-- �����敪
		SyoriKbn := 14;

		IF SQL%ROWCOUNT != 0 THEN

			-- ���Z���R�[�h�X�V
			UPDATE	QPB3_ZNDKRRK
			SET	QPB3_KJRISOKU	= QPB3_KJRISOKU + v_Risoku,
				QPB3_KUSNFLG	= '1',
				QPB3_KUSNYMD	= SYSDATE
			WHERE	ROWID = X_CurID;

			-- �����敪
			SyoriKbn := 15;

			-- �߂�l�ݒ�
			o_ret	:= 1;
		
		END IF;

		BEGIN

			-- ���𗘑�T���烌�R�[�h�擾
			SELECT	ROWID
			INTO	X_CurID2
			FROM	QPB5_BUNKAIRSK
			WHERE	NVL(QPB5_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
			AND	QPB5_SYAINCD2  =  i_SYAINCD2
			AND QPB5_SYUBETU   = '2'
			AND	QPB5_YUSIYMD   =  i_YUSIYMD
			AND QPB5_NYUKINYMD = SeisanDate;

		EXCEPTION

			WHEN NO_DATA_FOUND THEN
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
					'QPB5 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
					':SYAINCD2=' || i_SYAINCD2 ||
					':SYUBETU=' || i_SYUBETU ||
					':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
					);

			WHEN	OTHERS	THEN
				IF CurZndkrrk2%ISOPEN = TRUE THEN
					-- ���I�J�[�\���̃N���[�Y
					CLOSE CurZndkrrk2;
				END IF;

				-- �߂�l�ݒ�
				o_ret	:= 99;

				-- ���[���o�b�N
				ROLLBACK;

				-- ���O�o�͂d�m�c
				QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
					'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

				/* �G���[���� */
				RAISE;

		END;

		-- �����敪
		SyoriKbn := 16;

		IF SQL%ROWCOUNT != 0 THEN

			--���ƂȂ���QPB5���X�V
			UPDATE QPB5_BUNKAIRSK
			SET QPB5_RISOKU = QPB5_RISOKU + v_Risoku
			WHERE	ROWID = X_CurID2;

			-- �����敪
			SyoriKbn := 17;

			-- �߂�l�ݒ�
			o_ret	:= 1;

		END IF;

	END IF;

    /**************/
	/*    �ܗ^    */
    /**************/
    --���Z���u06/15�`06/30�v����06�����Z���ܗ^�T�����Ȃ����Z�����Ɋ��ςł͂Ȃ�
    --���Z���u12/01�`12/31�v����12�����Z���ܗ^�T�����Ȃ����Z�����Ɋ��ςł͂Ȃ�
	IF     SeisanFLG = '1' 
	   AND SyoyoFLG = '0' 
	   AND TO_CHAR(SeisanDate,'YYYYMM') <> TO_CHAR(i_YUSIYMD,'YYYYMM')
	   AND (TO_CHAR(SeisanDate,'MMDD') BETWEEN '0615' AND '0630' OR 
	        TO_CHAR(SeisanDate,'MMDD') BETWEEN '1201' AND '1231') 
	   AND i_cnt = '1' THEN	--2���ڂ͂��Ȃ�
		--�䒠����ܗ^�c���Ɨ������擾
		SELECT QPB6_RIRITU,QPB6_SYOYOHENSAIALL,QPB6_SYOYOZANDAKA
		INTO   v_RIRITU   ,v_SYOYOHENSAIALL,v_SYOYOZANDAKA
		FROM   QPB6_SYNDAICYOW2T
		WHERE  NVL(QPB6_PRMSYAINCD1, ' ') = NVL(i_SYAINCD1, ' ')
		AND    QPB6_PRMSYAINCD2           = i_SYAINCD2
		AND    QPB6_PRMYUSIYMD            = i_YUSIYMD;
		
		--�ܗ^�c���O�������牽�����Ȃ�
		IF v_SYOYOHENSAIALL <> 0 THEN
			--�����v�ZFrom
			IF TO_CHAR(SeisanDate,'MM') = '06' THEN
				SyoyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '02'),-6);	--���Z�O�N��12/02
			ELSE
				SyoyoFrom := ADD_MONTHS(TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '16'),-6);	--���Z�N��06/16
			END IF;
			--�Z�����ȑO��������Z����
			IF SyoyoFrom < i_YUSIYMD THEN
				SyoyoFrom := i_YUSIYMD;
			END IF;
			--�Z�����Ɠ��N������������Z����
			-- ��6/1�Z������6/15�T���͂ł��Ă��Ȃ�����
			IF TO_CHAR(SyoyoFrom,'YYYYMM') = TO_CHAR(i_YUSIYMD,'YYYYMM') THEN
				SyoyoFrom := i_YUSIYMD;
			END IF;
			
			--�����v�ZTo
			IF TO_CHAR(SeisanDate,'MM') = '06' THEN
				SyoyoTo := TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '15');	--���Z�N��06/15
			ELSE
				SyoyoTo := TO_DATE(TO_CHAR(SeisanDate,'YYYYMM') || '01');	--���Z�N��12/01
			END IF;
	
			--�����v�Z
			v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;
			v_Kikan   := SyoyoTo - SyoyoFrom + 1;
			v_Risoku  := TRUNC(v_SYOYOZANDAKA * v_RIRITU2 * v_Kikan);
	
			--���Z���R�[�h�ƕ��𗘑�T�ɗ�����������
			BEGIN
	
				-- ���Z���R�[�h�擾
				SELECT	ROWID
				INTO	X_CurID
				FROM	QPB3_ZNDKRRK
				WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
				AND	QPB3_SYAINCD2 =  i_SYAINCD2
				AND	QPB3_SYUBETU  =  i_SYUBETU
				AND	QPB3_YUSIYMD  =  i_YUSIYMD
				AND	QPB3_SYORIKBN =  '7'
				AND	QPB3_SYORIYMD >= w_fromDate
				AND	QPB3_SYORIYMD <  w_toDate;
	
			EXCEPTION
	
				WHEN NO_DATA_FOUND THEN
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
						'SEISAN DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
						':SYAINCD2=' || i_SYAINCD2 ||
						':SYUBETU=' || i_SYUBETU ||
						':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
						);
	
				WHEN	OTHERS	THEN
					IF CurZndkrrk2%ISOPEN = TRUE THEN
						-- ���I�J�[�\���̃N���[�Y
						CLOSE CurZndkrrk2;
					END IF;
	
					-- �߂�l�ݒ�
					o_ret	:= 99;
	
					-- ���[���o�b�N
					ROLLBACK;
	
					-- ���O�o�͂d�m�c
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
						'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
	
					/* �G���[���� */
					RAISE;
	
			END;
	
			-- �����敪
			SyoriKbn := 18;
	
			IF SQL%ROWCOUNT != 0 THEN
	
				-- ���Z���R�[�h�X�V
				UPDATE	QPB3_ZNDKRRK
				SET	QPB3_KJRISOKU	= QPB3_KJRISOKU + v_Risoku,
					QPB3_KUSNFLG	= '1',
					QPB3_KUSNYMD	= SYSDATE
				WHERE	ROWID = X_CurID;
	
				-- �����敪
				SyoriKbn := 19;
	
				-- �߂�l�ݒ�
				o_ret	:= 1;
			
			END IF;
	
			BEGIN
	
				-- ���𗘑�T���烌�R�[�h�擾
				SELECT	ROWID
				INTO	X_CurID2
				FROM	QPB5_BUNKAIRSK
				WHERE	NVL(QPB5_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
				AND	QPB5_SYAINCD2  =  i_SYAINCD2
				AND QPB5_SYUBETU   = '2'
				AND	QPB5_YUSIYMD   =  i_YUSIYMD
				AND QPB5_NYUKINYMD = SeisanDate;
	
			EXCEPTION
	
				WHEN NO_DATA_FOUND THEN
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'W',
						'QPB5 DATA NOT FOUND SYAINCD1=' || i_SYAINCD1 ||
						':SYAINCD2=' || i_SYAINCD2 ||
						':SYUBETU=' || i_SYUBETU ||
						':YUSIYMD=' || TO_CHAR(i_YUSIYMD, 'YYYY-MM-DD')
						);
	
				WHEN	OTHERS	THEN
					IF CurZndkrrk2%ISOPEN = TRUE THEN
						-- ���I�J�[�\���̃N���[�Y
						CLOSE CurZndkrrk2;
					END IF;
	
					-- �߂�l�ݒ�
					o_ret	:= 99;
	
					-- ���[���o�b�N
					ROLLBACK;
	
					-- ���O�o�͂d�m�c
					QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
						'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
	
					/* �G���[���� */
					RAISE;
	
			END;
	
			-- �����敪
			SyoriKbn := 20;
	
			IF SQL%ROWCOUNT != 0 THEN
	
				--���ƂȂ���QPB5���X�V
				UPDATE QPB5_BUNKAIRSK
				SET QPB5_RISOKU = QPB5_RISOKU + v_Risoku
				WHERE	ROWID = X_CurID2;
	
				-- �����敪
				SyoriKbn := 21;
	
				-- �߂�l�ݒ�
				o_ret	:= 1;
	
			END IF;
		END IF;
	END IF;


--5��or11���Ɋ��ς����ꍇ�A�����ɏܗ^�T�����݂̂��c���ă}�C�i�X�c�ƂȂ�
--�ܗ^��5(11)���ɐ��Z���z�Ƃ��Čv��ς݂̂��߁A�̂Ă�

	IF SeisanFLG = '0' AND i_ZANDAKA < 0 THEN
		--�ܗ^�T�����R�[�h�폜
		DELETE FROM QPB3_ZNDKRRK
		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
		AND	QPB3_SYAINCD2 =  i_SYAINCD2
		AND	QPB3_SYUBETU  =  i_SYUBETU
		AND	QPB3_YUSIYMD  =  i_YUSIYMD
		AND	QPB3_SYORIKBN =  '4'
		AND	QPB3_SYORIYMD >= w_fromDate
		AND	QPB3_SYORIYMD <  w_toDate;

		--�J�z���R�[�h�폜
		DELETE FROM QPB3_ZNDKRRK
		WHERE	NVL(QPB3_SYAINCD1, ' ') =  NVL(i_SYAINCD1, ' ')
		AND	QPB3_SYAINCD2 =  i_SYAINCD2
		AND	QPB3_SYUBETU  =  i_SYUBETU
		AND	QPB3_YUSIYMD  =  i_YUSIYMD
		AND	QPB3_SYORIKBN =  '9'
		AND	QPB3_SYORIYMD = SyoriDate;
		
	END IF;

	-- �����敪
	SyoriKbn := 22;
--ADD 20100319 0908047 NBC YOKOYAMA END

EXCEPTION
--	WHEN	NO_DATA_EXCEPTION2 THEN
--		QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
--			'���Z���R�[�h����' ||
--			':SYAINCD1=' || i_SYAINCD1 ||
--			':SYAINCD2=' || i_SYAINCD2 ||
--			':SYUBETU='  || i_SYUBETU  ||
--			':YUSIYMD='  || i_YUSIYMD
--			);

	WHEN	OTHERS	THEN
	IF CurZndkrrk2%ISOPEN = TRUE THEN
		-- ���I�J�[�\���̃N���[�Y
		CLOSE CurZndkrrk2;
	END IF;

	-- �߂�l�ݒ�
	o_ret	:= 99;

	-- ���[���o�b�N
	ROLLBACK;

	-- ���O�o�͂d�m�c
	QUSP_LogPkg.QUSP_DispUponCons(net_id, job_id, ' ', module, 'E',
		'SYORIKUBUN2:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

	/* �G���[���� */
	RAISE;

END QPAP_ZNDKKUSNSUB2;

END QPAP_CEnt1560PkG;
/
SHOW ERR
