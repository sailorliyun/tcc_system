CREATE OR REPLACE PACKAGE  QPAP_CEnt070PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt070PkG                                                                                */
/* �@�\          �F�����Z�������ύX����                                                                           */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*	�P  �錾��  												  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtHenkoYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtRirituAry IS TABLE OF QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE
		INDEX BY BINARY_INTEGER;

/* ���������f�[�^�擾 */
PROCEDURE QPAP_CEnt070SelList (
	 InNumMaxRec		IN	NUMBER						--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER						--�Ăяo����
	,OtStrHenkoYMD		OUT	typOtHenkoYMDAry				--�ύX�N��
	,OtNumRiritu		OUT	typOtRirituAry		        		--����
	,OtNumRecCount		OUT	NUMBER						--����������
	,OtNumAryCount		OUT	NUMBER						--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2);					--�����I���t���O

/* ���������f�[�^�d���`�F�b�N */
PROCEDURE QPAP_CEnt070DatChk (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,OtStrFlg	  	OUT	CHAR);						--����t���O

/* ���������f�[�^�o�^���� */
PROCEDURE QPAP_CEnt070DatAdd (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--����
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2);    					--�S�����i�I�y���O�p�j

/* ���������f�[�^�X�V���� */
PROCEDURE QPAP_CEnt070DatUpd (
	 InStrHenkoYMD_B  	IN	CHAR						--�ύX�N���C���O
	,InStrHenkoYMD_A  	IN	CHAR						--�ύX�N���C����
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--����
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2);    					--�S�����i�I�y���O�p�j

/* ���������f�[�^�폜���� */
PROCEDURE QPAP_CEnt070DatDel (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2);    					--�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt070OpeLog(
	 InStrMenuID  	  	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[�h�c
	,InStrModuleID    	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--�v���O�����h�c
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c
	,InStrComputerNM 	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^
	,InStrTozaiKBN	  	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--�����敪
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h
	,InStrMsg	  	IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt070Lock(
	 InstrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type		--���ʃR�[�h
	,InstrProgramID	  	IN      QSA4_HaitaT.QSA4_ProgramID%type			--�v���O�����h�c
	,InstrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type		--�R���s���[�^��
	,InstrOperatorID  	IN      QSA4_HaitaT.QSA4_OperatorID%type);		--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt070UnLock(
	 InstrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type		--���ʃR�[�h
	,InstrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type);		--�R���s���[�^�[��

END QPAP_CEnt070PkG;
/
show error

/******************************************************************************************************************/
/*�Q  �{�f�B�[ 													  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt070PkG IS
	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),					/* �e�[�u����   */
		fldKousinKbn		CHAR(1),	        			/* �X�V�敪     */
		fldAcsKey		CHAR(50),					/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)					/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/* �����������̂݊J������J�[�\�� */
	CURSOR CurCEnt070 IS
		SELECT	   TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') AS HENKOYMD,QPA7_RIRITU
		FROM	   QPA7_KGCRIRITUT
		ORDER BY   QPA7_PRMHENKOYMD DESC;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070SelList                                                                            */
/* �@�\          �F���������f�[�^�擾                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070SelList (
	 InNumMaxRec		IN	NUMBER						--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER						--�Ăяo����
	,OtStrHenkoYMD		OUT	typOtHenkoYMDAry				--�ύX�N��
	,OtNumRiritu		OUT	typOtRirituAry		        		--����
	,OtNumRecCount		OUT	NUMBER						--����������
	,OtNumAryCount		OUT	NUMBER						--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2) IS					--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx			NUMBER;

	/* �s�ϐ� */
	RowQPAG			CurCEnt070%ROWTYPE;

BEGIN
	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP�ďo ���񎞂̂݃J�[�\���ݒ�
	IF IoNumSpCnt	= 0 THEN
		SELECT
			COUNT(*)
		INTO
			OtNumRecCount
		FROM	QPA7_KGCRIRITUT;
	END IF;

	--SP�ďo�� �J�E���g�A�b�v
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--�J�[�\���I�[�v��
	IF CurCEnt070%ISOPEN = FALSE THEN
		OPEN CurCEnt070();
	END IF;

	--�e�d�s�b�g
	LOOP
		FETCH CurCEnt070 INTO RowQPAG;						--���ǂ�
		IF	CurCEnt070%NOTFOUND THEN
			EXIT;								--���[�v�I��
		END IF;

		OtStrHenkoYMD(NumIdx) := RowQPAG.HENKOYMD;
		OtNumRiritu(NumIdx) := RowQPAG.QPA7_RIRITU;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;								--�v���V�[�W���̏I��
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';							--�����I��
	OtNumAryCount	:=	NumIdx - 1;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt070;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt070%ISOPEN THEN
			CLOSE CurCEnt070;
		END IF;
		RAISE ;
END	QPAP_CEnt070SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070DatAdd                                                                             */
/* �@�\          �F���������f�[�^�d���`�F�b�N                                                                     */
/******************************************************************************************************************/
/* ���������f�[�^�o�^���� */
PROCEDURE QPAP_CEnt070DatChk (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,OtStrFlg	  	OUT	CHAR) IS 					--����t���O

	v_NumCount			NUMBER;

BEGIN
	OtStrFlg := '1';

	SELECT COUNT(*) INTO v_NumCount FROM QPA7_KGCRIRITUT
	WHERE TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') = InStrHenkoYMD;

	IF v_NumCount = 0 THEN
		OtStrFlg := '0';
	END IF;

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt070DatChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070DatAdd                                                                             */
/* �@�\          �F���������f�[�^�o�^����                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatAdd (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--����
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2) IS					--�S�����i�I�y���O�p�j

	numStep			NUMBER   := 0;						/* �����X�e�b�v  */
	numErr			NUMBER   := 0;						/* SQLCODE�̑ޔ� */
	strErrMsg		VARCHAR2(100);						/* SQLERRM�̑ޔ� */
	recMsg			typMsg;
	strLogMsg		QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--�e�[�u����
	recMsg.fldKousinKbn	:= '1';							--�X�V�敪
	recMsg.fldAcsKey	:= InStrHenkoYMD;					--�X�V�L�[

	/*  ���Z�X�f�[�^�o�^  */
	INSERT INTO QPA7_KGCRIRITUT VALUES (
		 TO_DATE(InStrHenkoYMD,'YYYYMMDD')					--�ύX�N��
		,InNumRIritu);                                        			--����

	/* �R�~�b�g */
	COMMIT;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z�����������e�[�u���̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;
	
		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z�����������e�[�u���̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070DatUpd                                                                             */
/* �@�\          �F���������f�[�^�̍X�V                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatUpd (
	 InStrHenkoYMD_B  	IN	CHAR						--�ύX�N���C���O
	,InStrHenkoYMD_A  	IN	CHAR						--�ύX�N���C����
	,InNumRIritu	  	IN	QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE		--����
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2) IS					--�S�����i�I�y���O�p�j

	 numStep			NUMBER   := 0;					/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;					/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);					/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--�e�[�u����
	recMsg.fldKousinKbn	:= '2';							--�X�V�敪
	recMsg.fldAcsKey	:= InStrHenkoYMD_B;					--�X�V�L�[

	/* ���Z�X�}�X�^�̍X�V */
	UPDATE QPA7_KGCRIRITUT SET
		 QPA7_PRMHENKOYMD	=	TO_DATE(InStrHenkoYMD_A,'YYYYMMDD')	--�ύX�N��
		,QPA7_RIRITU		=	InNumRIritu				--����
	WHERE	 TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD')
					= 	InStrHenkoYMD_B;			--�X�V�L�[ �ύX�N��

	/* �R�~�b�g */
	COMMIT;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z�����������e�[�u���̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�����Z�����������e�[�u���̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070Del                                                                                */
/* �@�\          �F���������f�[�^�̍폜                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070DatDel (
	 InStrHenkoYMD	  	IN	CHAR						--�ύX�N��
	,InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN	VARCHAR2) IS					--�S�����i�I�y���O�p�j

	 numStep			NUMBER   := 0;					/* �����X�e�b�v  */
	 numErr		        	NUMBER   := 0;					/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);					/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
BEGIN

	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA7_KGCRIRITUT';					--�e�[�u����
	recMsg.fldKousinKbn	:= '3';							--�X�V�敪
	recMsg.fldAcsKey	:= InStrHenkoYMD;					--�X�V�L�[

	/* ���Z�X�}�X�^�̍폜 */
	DELETE FROM     QPA7_KGCRIRITUT
	       WHERE	TO_CHAR(QPA7_PRMHENKOYMD,'YYYYMMDD') = InStrHenkoYMD;

	/* �R�~�b�g */
	COMMIT;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z�����������e�[�u���̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKbn
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt070OpeLog(	InstrMenuId,
				InstrModuleId,
				InStrUserID,
				InStrComputerNM,
				InStrTozaiKBN,
				InStrBushoCD,
				strLogMsg);


EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z�����������e�[�u���̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt070OpeLog(	InstrMenuId,
						InstrModuleId,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt070DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070OpeLog                                        					  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                        			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt070OpeLog(
	 InStrMenuID	   	IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			/* ���j���[�h�c   */
	,InStrModuleID     	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			/* �v���O�����h�c */
	,InStrUserID  	   	IN	QUS2_OpeLogT.QUS2_USERID%TYPE			/* ���[�U�h�c     */
	,InStrComputerNM  	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		/* �R���s���[�^   */
	,InStrTozaiKBN	   	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		/* �����敪       */
	,InStrBushoCD	   	IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			/* �����R�[�h     */
	,InStrMsg	   	IN	QUS2_OpeLogT.QUS2_MSG%TYPE ) IS			/* ���b�Z�[�W     */
BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);
	EXCEPTION
		WHEN	OTHERS	THEN
			RAISE ;								/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt070OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070Lock                                                                               */
/* �@�\          �F�����Z�������ύX�����e�[�u���̃��b�N                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,	/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,	/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,	/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS	/* �I�y���[�^�h�c */

	fldComputerMei			QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID			QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �����Z�������ύX�����e�[�u���̊m�F */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerMei, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InstrSikibetu;
	exception
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	end;

	if numErr = 0 then
		RAISE W_HAITADUPLICATE;
	else
		insert into QSA4_HaitaT (
			QSA4_PRMJobKbn,
			QSA4_PRMSikibetu,
			QSA4_PRMKeyInfo1,
			QSA4_PRMKeyInfo2,
			QSA4_PRMKeyInfo3,
			QSA4_PRMKeyInfo4,
			QSA4_PRMKeyInfo5,
			QSA4_ProgramID,
			QSA4_ComputerMei,
			QSA4_OperatorID,
			QSA4_SyoriYmd
		) values (
			'P', InstrSikibetu,
			'P',
			'P',
			'P',
			'P','P',
			InstrProgramID,
			InStrComputerNM,
			InstrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN							--�����Z�������ύX�����e�[�u����ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt070Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN							--�����Z�������ύX�����e�[�u���Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt070Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt070Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt070UnLock                                                                             */
/* �@�\          �F�����Z�������ύX�����e�[�u���̃��b�N����                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt070UnLock(
	InstrSikibetu		IN 	QSA4_HaitaT.QSA4_PRMSikibetu%type,		/* ���ʃR�[�h	  */
	InStrComputerNM		IN 	QSA4_HaitaT.QSA4_ComputerMei%type) IS		/* �R���s���[�^�� */
BEGIN
	delete from QSA4_HaitaT
	 where QSA4_PRMJobKbn = 'P'
	   and QSA4_PRMSikibetu = InstrSikibetu
	   and QSA4_ComputerMei = InStrComputerNM;
	commit;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt070UnLock ;

END QPAP_CEnt070PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
