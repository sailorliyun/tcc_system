CREATE OR REPLACE PACKAGE  QPAP_CEnt1500PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                          */
/* ���W���[����  �FQPAP_CEnt1500PkG                                          */
/* �@�\          �F�Ј��ݕt�E�e�[�u�������Ǘ�                                */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*								�P �錾��								     */
/*****************************************************************************/

/* �����E����߂��e�[�u�������Ǘ� */
PROCEDURE	QPAP_DeleteQPB2 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER);							--�����Ǘ�����

/* �c�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_DeleteQPB3 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER);							--�����Ǘ�����

/* �T�������e�[�u�������Ǘ� */
PROCEDURE	QPAP_DeleteQPB0 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER);							--�����Ǘ�����

END QPAP_CEnt1500PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								�Q�@�{�f�B�[							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1500PkG IS


/*****************************************************************************/
/* ���W���[����  �FQPAP_DeleteQPB2                                           */
/* �@�\          �F�����E����߂��e�[�u���̊����Ǘ�                          */
/*                 �������s�����10�N�o�����Ј��̃f�[�^���폜����            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB2 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER) IS							--�����Ǘ�����
	
	/* �����ŗL�̕ϐ� */
	dat10YOldDate		DATE;										--10�N��̓��t
	NumCount			NUMBER	:=	0;								--�����Ǘ�����

BEGIN
	
	/* ���O�o�͂r�s�`�q�s */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2','I','Start');
	
	/* 10�N�O�̓��t���i�[ */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');

	/* �폜�Ώۃf�[�^���� */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB2_BUNKAI
	 WHERE QPB2_TOUROKUYMD < dat10YOldDate AND QPB2_BUNMODFLG = '1' AND QPB2_RRKFLG = '1';

	/* �f�[�^�̍폜 */
	DELETE QPB2_BUNKAI
	 WHERE QPB2_TOUROKUYMD < dat10YOldDate AND QPB2_BUNMODFLG = '1' AND QPB2_RRKFLG = '1';

	/* �R�~�b�g */
	COMMIT;
		
	/* �������b�Z�[�W�o�� */
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2',
		'I','�����E����߂��e�[�u�������Ǘ� �폜������' || TO_CHAR(NumCount) || '��');
	
	/* ���O�o�͂d�m�c */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		/* ���O�o�͂d�m�c */
		QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB2',
		'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* �G���[���� */
		RAISE;
		
END	QPAP_DeleteQPB2;


/*****************************************************************************/
/* ���W���[����  �FQPAP_DeleteQPB3                                           */
/* �@�\          �F�c�������e�[�u���̊����Ǘ�                                */
/*                 �������s�����10�N�o�����Ј��̃f�[�^���폜����            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB3 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER) IS							--�����Ǘ�����

	/* �����ŗL�̕ϐ� */
	dat10YOldDate		DATE;										--10�N��̓��t
	NumCount			NUMBER	:=	0;								--�����Ǘ�����

BEGIN

	/* ���O�o�͂r�s�`�q�s */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3','I','Start');
	
	/* 10�N�O�̓��t���i�[ */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');

	/* �폜�Ώۃf�[�^���� */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB3_ZNDKRRK
	 WHERE QPB3_TURKYMD < dat10YOldDate;

	/* �f�[�^�̍폜 */
	DELETE QPB3_ZNDKRRK
	 WHERE QPB3_TURKYMD < dat10YOldDate;

	/* �R�~�b�g */
	COMMIT;
	
	/*�������b�Z�[�W�o��*/
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3',
		'I','�c�������e�[�u�������Ǘ� �폜������' || TO_CHAR(NumCount) || '��');
	
	/* ���O�o�͂d�m�c */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		/* ���O�o�͂d�m�c */
		QUSP_LogPkg.QUSP_DispUponCons(
			InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB3',
			'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* �G���[���� */
		RAISE;

END	QPAP_DeleteQPB3;


/*****************************************************************************/
/* ���W���[����  �FQPAP_DeleteQPB0                                           */
/* �@�\          �F�T�������e�[�u���̊����Ǘ�                                */
/*                 �������s�����10�N�o�����Ј��̃f�[�^���폜����            */
/*****************************************************************************/
PROCEDURE	QPAP_DeleteQPB0 (
	InChaNetID			IN		CHAR,								--�l�b�g�h�c
	InChaJobID			IN		CHAR,								--�W���u�h�c
	InNumMonth			IN		NUMBER) IS							--�����Ǘ�����

	/* �����ŗL�̕ϐ� */
	dat10YOldDate		DATE;										--�������t
	NumCount			NUMBER	:=	0;								--�����Ǘ�����

BEGIN

	/* ���O�o�͂r�s�`�q�s */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0','I','Start');
	
	/* 10�N�O�̓��t���i�[ */
	dat10YOldDate	:=	TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,InNumMonth * -1),'YYYYMMDD'),'YYYYMMDD');
    
    
	/* �폜�Ώۃf�[�^���� */
	SELECT COUNT(*)
	  INTO NumCount
	  FROM QPB0_KOJORRKT
	 WHERE QPB0_INSERTDATE < dat10YOldDate;

	/* �f�[�^�̍폜 */
	DELETE QPB0_KOJORRKT
	 WHERE QPB0_INSERTDATE < dat10YOldDate;

	/* �R�~�b�g */
	COMMIT;
	
	/* �������b�Z�[�W�o�� */
	QUSP_LogPkg.QUSP_DispUponCons(
		InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0',
		'I','�T�������e�[�u�������Ǘ� �폜������' || TO_CHAR(NumCount) || '��');
	
	/* ���O�o�͂d�m�c */
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0','I','End');

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;
		/* ���O�o�͂d�m�c */
		QUSP_LogPkg.QUSP_DispUponCons(
			InChaNetID,InChaJobID,' ','QPAP_CEnt1500.QPAP_DeleteQPB0',
			'E','EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );
		/* �G���[���� */
		RAISE;

END	QPAP_DeleteQPB0;


END QPAP_CEnt1500PkG;

/***END of LINE***************************************************************/
/
SHOW ERROR
