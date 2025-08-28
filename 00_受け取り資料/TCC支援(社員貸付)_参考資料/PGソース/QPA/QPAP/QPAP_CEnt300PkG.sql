CREATE OR REPLACE PACKAGE  QPAP_CEnt300PkG IS
/*****************************************************************************/
/* �V�X�e�����@�@�F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ����@�@�@�@�F�Ј��ݕt�V�X�e��                                          */
/* ���W���[�����@�FQPAP_CEnt300PkG                                           */
/* �@�\      �@�@�F�Ј��ݕt�E�e�[�u�������Ǘ�                                */
/* �쐬��        �F2001/10/16                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/
/*****************************************************************************/
/*�X�V���t  �Č�/��Q�ԍ�    �C�����R                                        */
/*20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��               */
/*                           ���𗘑��e�[�u���̊����Ǘ����s��                */
/*****************************************************************************/

/*****************************************************************************/
/*								�P�@�錾��								     */
/*****************************************************************************/

/* �����Z���䒠�e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcDaicyoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �Ј��Z���䒠�e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300SyainDaicyoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �����Z�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcNyukinT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �Ј��Z�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300SymNyukinT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �����Z���c�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcZandakaT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �����Z���ݕt�e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcKasitukeT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �����Z���ܗ^�T�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcKojoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

/* �����Z���ԍϊz�����e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300KgcHensaiT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X

--del 20080714 nbc ishida ���������Ǘ��p�~ start
--/* �����Z�����������e�[�u�������Ǘ� */
--PROCEDURE	QPAP_Cent300KgcRirituT (
--	OtNumCount			OUT		NUMBER,								--��������
--	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X
--del 20080714 nbc ishida ���������Ǘ��p�~ end

--ADD 20100225 0908047 NBC SAWAME START
/* ���𗘑��e�[�u�������Ǘ� */
PROCEDURE	QPAP_Cent300BunkairskT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER);							--�X�e�[�^�X
--ADD 20100225 0908047 NBC SAWAME END

END QPAP_CEnt300PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								�Q�@�{�f�B�[							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt300PkG IS


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcDaicyoT                                    */
/* �@�\          �F�����Z���䒠�e�[�u���̊����Ǘ�                            */
/*                 �ސE��T�N�o�����Ј��̃f�[�^���폜����                    */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcDaicyoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

	/* �����ŗL�̕ϐ� */
	StrSyainCD			CHAR(7);

	/* �J�[�\����` */
	/* �ސE���Ă���T�N���o�߂����Ј��̎Ј��R�[�h�𒊏o */
	CURSOR CurQPAC IS
		SELECT
			 QPAC_PRMSYAINCD2
		FROM
			QPAC_SYAINM
		WHERE
			TO_CHAR(QPAC_TAISYOKUYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �J�[�\���̃I�[�v�� */
	IF CurQPAC%ISOPEN = FALSE THEN
		OPEN CurQPAC;
	END IF;

	LOOP

		FETCH CurQPAC						--���ǂ�
		INTO  StrSyainCD;

		IF	CurQPAC%NOTFOUND THEN
			EXIT;							--���[�v�I��
		END IF;

		/* �擾�����Ј��R�[�h�ŏ����Z���䒠�e�[�u�����������A*/
		/* �Y���f�[�^���폜����*/
		DELETE QPA1_KGCDAICYOT
		 WHERE QPA1_PRMSYAINCD2 = StrSyainCD;

	END LOOP;

	/* �폜�����̎擾 */
	OtNumCount := CurQPAC%ROWCOUNT;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurQPAC;

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		IF CurQPAC%ISOPEN THEN
			CLOSE CurQPAC;
		END IF;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcDaicyoT;




/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300SyainDaicyoT                                  */
/* �@�\          �F�Ј��Z���䒠�e�[�u���̊����Ǘ�                            */
/*                 ���ό�T�N�o�����Ј��̃f�[�^���폜����                    */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300SyainDaicyoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* ���ό�T�N�o�����f�[�^���� */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA8_SYNDAICYOT
	 WHERE TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

	/* ���ό�T�N�o�����f�[�^�̍폜 */
	DELETE QPA8_SYNDAICYOT
	 WHERE TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -60),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300SyainDaicyoT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcNyukinT                                    */
/* �@�\          �F�����Z�������e�[�u���̊����Ǘ�                            */
/*                 ���������P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcNyukinT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA5_KGCNYUKINT
	 WHERE TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPA5_KGCNYUKINT
	 WHERE TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcNyukinT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300SymNyukinT                                    */
/* �@�\          �F�Ј��Z�������e�[�u���̊����Ǘ�                            */
/*                 ���������P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300SymNyukinT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA9_SYNNYUKINT
	 WHERE TO_CHAR(QPA9_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPA9_SYNNYUKINT
	 WHERE TO_CHAR(QPA9_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300SymNyukinT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcZandakaT                                   */
/* �@�\          �F�����Z���c�������e�[�u���̊����Ǘ�                        */
/*                 �c�������P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcZandakaT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA3_KGCZANDAKAT
	 WHERE TO_CHAR(QPA3_PRMZANDAKAYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPA3_KGCZANDAKAT
	 WHERE TO_CHAR(QPA3_PRMZANDAKAYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcZandakaT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcKasitukeT                                  */
/* �@�\          �F�����Z���ݕt�e�[�u���̊����Ǘ�                            */
/*                 ��������N�������P�O�N�ȏ�o�߂����f�[�^���폜����        */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcKasitukeT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA6_KGCKASITUKET
	 WHERE TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPA6_KGCKASITUKET
	 WHERE TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcKasitukeT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcKojoT                                      */
/* �@�\          �F�����Z���ܗ^�T�������e�[�u���̊����Ǘ�                    */
/*                 �T�������P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcKojoT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA4_KGCKOJOT
	 WHERE TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPA4_KGCKOJOT
	 WHERE TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcKojoT;


/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300KgcHensaiT                                    */
/* �@�\          �F�����Z���ԍϊz�����e�[�u���̊����Ǘ�                      */
/*                 �ύX�����P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300KgcHensaiT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPA2_KGCHENSAIT
	 WHERE QPA2_PRMHENKOUYM < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMM');

	/* �f�[�^�̍폜 */
	DELETE QPA2_KGCHENSAIT
	 WHERE QPA2_PRMHENKOUYM < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMM');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300KgcHensaiT;


--del 20080714 nbc ishida ���������Ǘ��p�~ start
--/*****************************************************************************/
--/* ���W���[����  �FQPAP_Cent300KgcRirituT                                    */
--/* �@�\          �F�����Z�����������e�[�u���̊����Ǘ�                        */
--/*                 �ύX�����P�O�N�ȏ�o�߂����f�[�^���폜����                */
--/*****************************************************************************/
--PROCEDURE	QPAP_Cent300KgcRirituT (
--	OtNumCount			OUT		NUMBER,								--��������
--	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X
--
--BEGIN
--
--	/* �o�̓p�����[�^�̏����� */
--	OtNumCount	:=	0;
--	OtNumStatus	:=	0;
--
--	/* �f�[�^�����̎擾 */
--	SELECT COUNT(*)
--	  INTO OtNumCount
--	  FROM QPA7_KGCRIRITUT
--	 WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');
--
--	/* �f�[�^�̍폜 */
--	DELETE QPA7_KGCRIRITUT
--	 WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');
--
--	/* �R�~�b�g*/
--	COMMIT;
--
--EXCEPTION
--	WHEN	OTHERS	THEN
--		/* ���[���o�b�N */
--		ROLLBACK;
--		OtNumStatus := 99;
--		RAISE ;
--
--END	QPAP_Cent300KgcRirituT;
--del 20080714 nbc ishida ���������Ǘ��p�~ end

--ADD 20100225 0908047 NBC SAWAME START
/*****************************************************************************/
/* ���W���[����  �FQPAP_Cent300BunkairskT                                    */
/* �@�\          �F���𗘑��e�[�u���̊����Ǘ�                                */
/*                 ���������P�O�N�ȏ�o�߂����f�[�^���폜����                */
/*****************************************************************************/
PROCEDURE	QPAP_Cent300BunkairskT (
	OtNumCount			OUT		NUMBER,								--��������
	OtNumStatus			OUT		NUMBER) IS							--�X�e�[�^�X

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCount	:=	0;
	OtNumStatus	:=	0;

	/* �f�[�^�����̎擾 */
	SELECT COUNT(*)
	  INTO OtNumCount
	  FROM QPB5_BUNKAIRSK
	 WHERE TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �f�[�^�̍폜 */
	DELETE QPB5_BUNKAIRSK
	 WHERE TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') < TO_CHAR(ADD_MONTHS(SYSDATE, -120),'YYYYMMDD');

	/* �R�~�b�g*/
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		OtNumStatus := 99;
		RAISE ;

END	QPAP_Cent300BunkairskT;
--ADD 20100225 0908047 NBC SAWAME END

END QPAP_CEnt300PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR
