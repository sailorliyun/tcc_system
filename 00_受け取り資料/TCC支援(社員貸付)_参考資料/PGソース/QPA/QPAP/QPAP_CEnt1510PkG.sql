CREATE OR REPLACE PACKAGE  QPAP_CEnt1510PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_CEnt1510PkG                                          */
/* �@�\          �F�c�������e�[�u���o�^�����i�����f�[�^�j                    */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FNBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100330  TR1003-016       �c������T�ւ̏��������o�^�����s��                                                   */
/*                               �����擾SQL���C������                                                            */
/******************************************************************************************************************/

/* �c�������e�[�u���o�^�����i�����f�[�^�j */
PROCEDURE QPAP_ZNDK_NUKNTURK (
                                InChaNetID IN CHAR,	--�l�b�g�h�c
                                InChaJobID IN CHAR);	--�W���u�h�c

END QPAP_CEnt1510PkG;
/
SHOW ERROR

/*****************************************************************************/
/* �Q  �{�f�B�[                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1510PkG IS

--- �J�[�\����`�i�Ј��R�[�h�P�A�Ј��R�[�h�Q�A�Z���敪�A�Z���������擾�j
	CURSOR CurNUKN(i_fromDate IN DATE, i_toDate IN DATE) IS
		SELECT	Q5.QPA5_NYUKINYMD  i_NYUKINYMD,
			Q5.QPA5_SYAINCD1   i_SYAINCD1,
			Q5.QPA5_SYAINCD2   i_SYAINCD2,
			Q5.QPA5_NYUKINGAKU i_NYUKINGAKU,
			B5.QPB5_RISOKU     i_RISOKU
		FROM	QPA5_KGCNYUKINT Q5,
			QPA1_KGCDAICYOT Q1,
			QPAC_SYAINM QC,
			QPB5_BUNKAIRSK B5
		WHERE	Q5.QPA5_NYUKINYMD >= i_fromDate
		AND	Q5.QPA5_NYUKINYMD <  i_toDate
		AND	to_char(Q5.QPA5_NYUKINYMD, 'YYYYMMDD') =  to_char(B5.QPB5_NYUKINYMD, 'YYYYMMDD')
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(Q1.QPA1_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  Q1.QPA1_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(QC.QPAC_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  QC.QPAC_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(B5.QPB5_SYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  B5.QPB5_SYAINCD2
		AND	B5.QPB5_SYUBETU   = '1';


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1510PkG.QPAP_ZNDK_NUKNTURK                       */
/* �@�\	  �F�c�������e�[�u���o�^�����i�����f�[�^�j                           */
/*****************************************************************************/
PROCEDURE QPAP_ZNDK_NUKNTURK (
				InChaNetID IN CHAR,		--�l�b�g�h�c
				InChaJobID IN CHAR) IS		--�W���u�h�c

	-- �����ϐ���`
	module       VARCHAR2(40) := 'QPAP_CEnt1510PkG.QPAP_ZNDK_NUKNTURK';
	RowNUKN      CurNUKN%ROWTYPE;	-- �J�[�\��
	SyoriKbn     NUMBER	  := 0;	-- �������s�ӏ��J�E���g
	TurkCNT      NUMBER	  := 0;	-- �c�������e�[�u���o�^����
	InsCount     NUMBER	  := 0;	-- �o�^�����i���O�擾�p�j
	w_fromDate   DATE;		-- �����J�n���i�������t�j
	w_toDate     DATE;		-- �����I�����i�������t�j

	o_NYUKINYMD  DATE;		-- ������
	o_SYAINCD1   CHAR(1);		-- �Ј��R�[�h�P
	o_SYAINCD2   CHAR(7);		-- �Ј��R�[�h�Q
	o_NYUKINGAKU NUMBER;		-- �����z�i�����j
	o_RISOKU     NUMBER;		-- �����z�i�����j

BEGIN

	-- �R���\�[�����O�o�́i�����J�n�j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- �o�^���Ԏ擾�i�������O����18:00 �` ������18:00�j
--	w_fromDate := TO_DATE(TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '180000', 'YYYYMMDDHH24MISS');
--	w_toDate   := TO_DATE(TO_CHAR(SYSDATE    , 'YYYYMMDD') || '180000', 'YYYYMMDDHH24MISS');

	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01' || '000000', 'YYYYMMDDHH24MISS');
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- ���������e�[�u���iQPA5_KGCNYUKINT�j���猏���擾
	SELECT  COUNT(*)
		INTO	InsCount
		FROM	QPA5_KGCNYUKINT Q5,
			QPA1_KGCDAICYOT Q1,
			QPAC_SYAINM QC,
			QPB5_BUNKAIRSK B5
--MOD 20100319 0908047 NBC YOKOYAMA START
--		WHERE	Q5.QPA5_NYUKINYMD >  w_fromDate
--		AND	Q5.QPA5_NYUKINYMD <= w_toDate
		WHERE	Q5.QPA5_NYUKINYMD >=  w_fromDate
		AND	Q5.QPA5_NYUKINYMD < w_toDate
--MOD 20100319 0908047 NBC YOKOYAMA END
		AND	to_char(Q5.QPA5_NYUKINYMD, 'YYYYMMDD') =  to_char(B5.QPB5_NYUKINYMD, 'YYYYMMDD')
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(Q1.QPA1_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  Q1.QPA1_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(QC.QPAC_PRMSYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  QC.QPAC_PRMSYAINCD2
		AND	NVL(Q5.QPA5_SYAINCD1, ' ')  =  NVL(B5.QPB5_SYAINCD1, ' ')
		AND	Q5.QPA5_SYAINCD2  =  B5.QPB5_SYAINCD2
		AND	B5.QPB5_SYUBETU     = '1';

	-- �R���\�[�����O�o�́i�擾�����j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA5_KGCNYUKINT:IN = ' || TO_CHAR(InsCount)
		);

	-- �����敪
	SyoriKbn := 1;

	-- ���I�J�[�\���̃I�[�v��
	OPEN CurNUKN(w_fromDate, w_toDate);

	LOOP
		FETCH CurNUKN INTO RowNUKN;
		IF CurNUKN%NOTFOUND THEN
			EXIT;				     --���[�v�I��
		END IF;

		-- �����e�[�u������f�[�^�擾
		o_NYUKINYMD  := TO_DATE(TO_CHAR(RowNUKN.i_NYUKINYMD, 'YYYYMMDD'), 'YYYYMMDD');
								-- ������
		o_SYAINCD1   := NVL(RowNUKN.i_SYAINCD1, ' ');	-- �Ј��R�[�h�P
		o_SYAINCD2   := RowNUKN.i_SYAINCD2;		-- �Ј��R�[�h�Q
		o_NYUKINGAKU := NVL(RowNUKN.i_NYUKINGAKU, 0);	-- �����z�i�����j
		o_RISOKU     := NVL(RowNUKN.i_RISOKU, 0);	-- �����z�i�����j

		-- �����敪
		SyoriKbn     := 2;

		-- �c�������e�[�u���o�^����
		INSERT	INTO QPB3_ZNDKRRK (
			QPB3_SYAINCD1,
			QPB3_SYAINCD2,
			QPB3_SYUBETU,
			QPB3_SYORIYMD,
			QPB3_SYORIKBN,
			QPB3_GANKIN,
			QPB3_KJRISOKU,
			QPB3_KUSNFLG,
			QPB3_TURKYMD,
			QPB3_KUSNYMD
		) VALUES (
			o_SYAINCD1,
			o_SYAINCD2,
			'1',
			o_NYUKINYMD,
			'2',
			o_NYUKINGAKU,
			o_RISOKU,
			'0',
			SYSDATE,
			SYSDATE
		);

		-- �����敪
		SyoriKbn     := 3;

		-- �o�^�����J�E���g�A�b�v
		TurkCNT      := TurkCNT + 1;

	END LOOP;

	-- ���I�J�[�\���̃N���[�Y
	CLOSE CurNUKN;

	-- �����敪
	SyoriKbn :=	4;

	-- �R���\�[�����O�o�́i�ǉ������j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(TurkCNT)
		);

	-- �����敪
	SyoriKbn :=	5;

	-- �R�~�b�g
	commit;

	-- �R���\�[�����O�o�́i�����I���j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'End');


EXCEPTION
	WHEN OTHERS THEN
		-- ���[���o�b�N
		ROLLBACK;

		-- ���O�o�͂d�m�c
		QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'E',
			'SYORIKUBUN:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

		/* �G���[���� */
		RAISE;

END QPAP_ZNDK_NUKNTURK;

END QPAP_CEnt1510PkG;
/
SHOW ERROR
