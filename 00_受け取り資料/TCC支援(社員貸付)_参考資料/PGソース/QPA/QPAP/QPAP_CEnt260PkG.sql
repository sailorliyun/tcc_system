CREATE OR REPLACE PACKAGE  QPAP_CEnt260PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��ݕt                                                  */
/* ���W���[����  �FQPAP_CEnt260PkG                                           */
/* �@�\          �F�Ј��}�X�^�e�[�u���̎Ј��R�[�h���X�y�[�X�̃��R�[�h��      */
/*                 �폜����                                                  */
/* �쐬��        �F2001/10/19                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*								�P  �錾��								     */
/*****************************************************************************/

/* �又�� */
PROCEDURE QPAP_CEnt260PkG_Main (
	OtStrSTATUS			OUT		CHAR);	--�o�́F�X�e�[�^�X�@�@�O�F����@�@�X�X�F�ُ�

END QPAP_CEnt260PkG;
/
SHOW ERROR

/*****************************************************************************/
/*								�Q  �{�f�B�[							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt260PkG IS



/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt260PkGMain                                       */
/* �@�\          �F�Ј��}�X�^�폜����                                        */
/*****************************************************************************/
PROCEDURE QPAP_CEnt260PkG_Main(
	OtStrSTATUS		OUT		CHAR) IS	--�o�́F�X�e�[�^�X�@�@00�F����@�@99�F�ُ�

	/* �����ŗL�̕ϐ� */
	NumCount		NUMBER;
	STRROWID		VARCHAR2(18);

	/* �J�[�\���錾 */
	CURSOR CurQPAC IS
		SELECT  ROWID
		  FROM  QPAC_SYAINM
		 WHERE  QPAC_PRMSYAINCD1 = ' ';

BEGIN

	/* �o�̓p�����[�^�̏����� */
	NumCount    := 0;
	OtStrSTATUS := '00';

	/* �J�[�\���I�[�v�� */
	OPEN  CurQPAC;

	/* ���[�v���� */
	LOOP
		FETCH  CurQPAC INTO STRROWID;

		IF CurQPAC%NOTFOUND THEN
			EXIT;
		END IF;

		/* �폜�������s�� */
		DELETE QPAC_SYAINM
		 WHERE ROWID = STRROWID;

		/* �����P�������ƂɃR�~�b�g���� */
		NumCount := NumCount + 1;
		IF  NumCount = 10000 THEN
			COMMIT;
			NumCount := 0;
		END IF;

	END LOOP;

	/* �R�~�b�g */
	COMMIT;

	/* �J�[�\���N���[�Y */
	CLOSE CurQPAC;


EXCEPTION
	WHEN OTHERS THEN
		IF CurQPAC%ISOPEN THEN
			CLOSE CurQPAC;
		END IF;
		OtStrSTATUS := '99';
		ROLLBACK;
		RAISE ;

END QPAP_CEnt260PkG_Main;

END QPAP_CEnt260PkG;
/***END of LINE****************************************************************/
/
SHOW ERROR
