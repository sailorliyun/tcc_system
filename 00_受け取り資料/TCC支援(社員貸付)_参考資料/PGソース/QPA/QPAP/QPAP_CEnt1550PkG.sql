CREATE OR REPLACE PACKAGE  QPAP_CEnt1550PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_CEnt1550PkG                                          */
/* �@�\          �F�c�������e�[�u���o�^�����i�Z���E�����j                    */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FNBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100330  TR1003-014       �V�K�Z���̓��ʃ��[�����V�c���\�ɍڂ�Ȃ�                                            */
/*                               �Ј��Z���䒠�����ʂQ�ȊO���擾����悤�ɏC������                               */
/******************************************************************************************************************/

/* �c�������e�[�u���o�^�����i�Z���E�����j */
PROCEDURE QPAP_ZNDK_YSNKTURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR);	--�W���u�h�c

END QPAP_CEnt1550PkG;
/
SHOW ERROR

/*****************************************************************************/
/* �Q  �{�f�B�[                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1550PkG IS


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1550PkG.QPAP_ZNDK_YSNKTURK                       */
/* �@�\          �F�c�������e�[�u���o�^�����i�Z���E�����j                    */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_YSNKTURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR	--�W���u�h�c
)

IS

	-- �����ϐ���`
	w_fromDate	DATE;				-- �f�[�^�擾���ԁF�J�n
	w_toDate	DATE;				-- �f�[�^�擾���ԁF�I��
	InsCount	NUMBER		:= 0;		-- �o�^�����i���O�擾�p�j
	module		VARCHAR2(40)	:= 'QPAP_CEnt1550PkG.QPAP_ZNDK_YSNKTURK';
	SyoriKbn	NUMBER		:= 0;		-- �������s�ӏ��J�E���g

BEGIN

	-- �R���\�[�����O�o�́i�����J�n�j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');


	-- �������t�A���Ԏ擾�i������-1���� �` �������j
--	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD');
--	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	w_toDate	:=	TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01' || '000000', 'YYYYMMDDHH24MISS');
	w_fromDate	:=	ADD_MONTHS(w_toDate, -1);

	-- �؏��ݕt�iQPA8_SynDaicyoT�j���猏���擾
	SELECT COUNT(*)
		INTO  InsCount
		FROM  QPA8_SynDaicyoT
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--		WHERE QPA8_SYUBETU = '2'
--		AND   QPA8_PRMYUSIYMD >= w_fromDate
--		AND   QPA8_PRMYUSIYMD <  w_toDate
--		AND   QPA8_KANSAIYMD IS NULL;
		WHERE QPA8_PRMYUSIYMD >= w_fromDate
		AND   QPA8_PRMYUSIYMD <  w_toDate;
--MOD 20100330 TR1003-014 NBC YOKOYAMA END

	-- �R���\�[�����O�o�́i�擾�����j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA8_SynDaicyoT:IN = ' || TO_CHAR(InsCount)
		);

	SyoriKbn :=	1;

	-- �c�������e�[�u���iQPB3_ZNDKRRK�j�ɒǉ�
	INSERT INTO QPB3_ZNDKRRK (
		QPB3_SYAINCD1,
		QPB3_SYAINCD2,
		QPB3_SYUBETU,
		QPB3_YUSIYMD,
		QPB3_SYORIYMD,
		QPB3_SYORIKBN,
		QPB3_KASHITSUKE,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPA8_PRMSYAINCD1,
			QPA8_PRMSYAINCD2,
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--			QPA8_SYUBETU,
			'2',
--MOD 20100330 TR1003-014 NBC YOKOYAMA END
			QPA8_PRMYUSIYMD,
			QPA8_PRMYUSIYMD,
			'1',
			NVL(QPA8_KYUYOHENSAIALL, 0) + NVL(QPA8_SYOYOHENSAIALL, 0),
			'0',
			SYSDATE,
			SYSDATE
			FROM  QPA8_SynDaicyoT
--MOD 20100330 TR1003-014 NBC YOKOYAMA START
--			WHERE QPA8_SYUBETU = '2'
--			AND   QPA8_PRMYUSIYMD >= w_fromDate
--			AND   QPA8_PRMYUSIYMD <  w_toDate
--			AND   QPA8_KANSAIYMD IS NULL;
			WHERE QPA8_PRMYUSIYMD >= w_fromDate
			AND   QPA8_PRMYUSIYMD <  w_toDate;
--MOD 20100330 TR1003-014 NBC YOKOYAMA END

	-- �R���\�[�����O�o�́i�ǉ������j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
		);

	SyoriKbn :=	2;

	-- ����������
	InsCount :=	0;

	-- �؏������iQPA9_SynNyukinT�j���猏���擾
	SELECT	COUNT(*)
		INTO  InsCount
		FROM  QPA9_SynNyukinT
		WHERE QPA9_NYUKINYMD >= w_fromDate
		AND   QPA9_NYUKINYMD <  w_toDate;

	-- �R���\�[�����O�o�́i�擾�����j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPA9_SynNyukinT:IN = ' || TO_CHAR(InsCount)
	);

	SyoriKbn :=	3;

	-- �c�������e�[�u���iQPB3_ZNDKRRK�j�ɒǉ�
	INSERT INTO QPB3_ZNDKRRK (
		QPB3_SYAINCD1,
		QPB3_SYAINCD2,
		QPB3_SYUBETU,
		QPB3_YUSIYMD,
		QPB3_SYORIYMD,
		QPB3_SYORIKBN,
		QPB3_GANKIN,
		QPB3_KJRISOKU,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPA9_PRMSYAINCD1,
			QPA9_PRMSYAINCD2,
			'2',
			QPA9_PRMYUSIYMD,
			QPA9_NYUKINYMD,
			'7',
			NVL(QPA9_NYUKINGAKU, 0),
			NVL(QPB5_RISOKU, 0),
			'0',
			SYSDATE,
			SYSDATE
			FROM  QPA9_SynNyukinT,
			      QPB5_BUNKAIRSK
			WHERE QPA9_NYUKINYMD   >= w_fromDate
			AND   QPA9_NYUKINYMD   <  w_toDate
			AND   to_char(QPA9_NYUKINYMD, 'YYYYMMDD') = to_char(QPB5_NYUKINYMD, 'YYYYMMDD')
			AND   QPA9_PRMSYAINCD1 =  QPB5_SYAINCD1
			AND   QPA9_PRMSYAINCD2 =  QPB5_SYAINCD2
			AND   QPA9_PRMYUSIYMD  =  QPB5_YUSIYMD
			AND   QPB5_SYUBETU     = '2';

	-- �R���\�[�����O�o�́i�ǉ������j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
	'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
	);

	SyoriKbn :=	4;

	-- �R�~�b�g
	commit;

	-- �R���\�[�����O�o�́i�����I���j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'End');


EXCEPTION
	WHEN	OTHERS	THEN
		-- ���[���o�b�N
		ROLLBACK;

		-- ���O�o�͂d�m�c
		QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'E',
			'SYORIKUBUN:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

		/* �G���[���� */
		RAISE;
		
END QPAP_ZNDK_YSNKTURK;

END QPAP_CEnt1550PkG;
/
SHOW ERROR
