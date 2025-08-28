CREATE OR REPLACE PACKAGE  QPAP_CEnt1520PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_CEnt1520PkG                                          */
/* �@�\          �F�c�������e�[�u���o�^�����i���^�T���j                      */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FNBC saitoh                                                */
/*****************************************************************************/
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100330  TR1003-017       �c������T�ւ̍T���o�^�����s��                                                       */
/*                               �擾SQL���C������                                                                */
/******************************************************************************************************************/

/* �c�������e�[�u���o�^�����i���^�T���j */
PROCEDURE QPAP_ZNDK_KYKJTURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR);	--�W���u�h�c

END QPAP_CEnt1520PkG;
/
SHOW ERROR

/*****************************************************************************/
/* �Q  �{�f�B�[                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1520PkG IS


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1520PkG.QPAP_ZNDK_YSNKTURK                       */
/* �@�\          �F�c�������e�[�u���o�^�����i���^�T���j                      */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_KYKJTURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR	--�W���u�h�c
)

IS

	-- �����ϐ���`
	InsCount	NUMBER		:= 0;		-- �o�^�����i���O�擾�p�j
	module		VARCHAR2(40)	:= 'QPAP_CEnt1520PkG.QPAP_ZNDK_KYKJTURK';
	SyoriKbn	NUMBER		:= 0;		-- �������s�ӏ��J�E���g

BEGIN

	-- �R���\�[�����O�o�́i�����J�n�j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- ���^�T���iQPAA_KOJOT�j���猏���擾
--MOD 20100330 TR1001-017 NBC YOKOYAMA START
--	SELECT COUNT(*)
--		INTO  InsCount
--	FROM	QPAA_KOJOT,
--		QPAC_SYAINM
--	WHERE	QPAC_PRMSYAINCD1  =  QPAA_SYAINCD1
--	AND	QPAC_PRMSYAINCD2  =  QPAA_SYAINCD2
--	AND	QPAA_YUSIKBN      =  '3'
--	AND	(QPAC_PRMSYAINCD1 =  ' '
--	OR	QPAC_PRMSYAINCD1  =  '  '
--	OR	QPAC_PRMSYAINCD1  =  '   '
--	OR	RTRIM(QPAC_PRMSYAINCD1)  =  '')
--	AND	QPAC_MISECD  <>  '084'
--	AND	QPAC_MISECD  <>  '067';
	SELECT COUNT(*)
		INTO  InsCount
	FROM	QPAA_KOJOT
	WHERE	QPAA_YUSIKBN = '3';		--���^
--MOD 20100330 TR1001-017 NBC YOKOYAMA END

	-- �R���\�[�����O�o�́i�擾�����j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPAA_KOJOT:IN = ' || TO_CHAR(InsCount)
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
		QPB3_GANKIN,
		QPB3_KJRISOKU,
		QPB3_KUSNFLG,
		QPB3_TURKYMD,
		QPB3_KUSNYMD
		)
		SELECT
			QPAA_SYAINCD1,
			QPAA_SYAINCD2,
			QPAA_Syubetu,
			QPAA_YusiYMD,
			QPAA_KOJOYMD,
			QPAA_YusiKBN,
			NVL(QPAA_Gankin, 0),
			NVL(QPAA_Risoku, 0),
			'0',
			SYSDATE,
			SYSDATE
--MOD 20100330 TR1001-017 NBC YOKOYAMA START
--		FROM	QPAA_KOJOT,
--			QPAC_SYAINM
--		WHERE	QPAC_PRMSYAINCD1  =  QPAA_SYAINCD1
--		AND	QPAC_PRMSYAINCD2  =  QPAA_SYAINCD2
--		AND	QPAA_YUSIKBN      =  '3'
--		AND	(QPAC_PRMSYAINCD1 =  ' '
--		OR	QPAC_PRMSYAINCD1  =  '  '
--		OR	QPAC_PRMSYAINCD1  =  '   '
--		OR	RTRIM(QPAC_PRMSYAINCD1)  =  '')
--		AND	QPAC_MISECD  <>  '084'
--		AND	QPAC_MISECD  <>  '067';
		FROM	QPAA_KOJOT
		WHERE	QPAA_YUSIKBN = '3';		--���^
--MOD 20100330 TR1001-017 NBC YOKOYAMA END

	-- �R���\�[�����O�o�́i�ǉ������j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(SQL%ROWCOUNT)
		);

	SyoriKbn :=	2;

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
		
END QPAP_ZNDK_KYKJTURK;

END QPAP_CEnt1520PkG;
/
SHOW ERROR
