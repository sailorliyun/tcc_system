CREATE OR REPLACE PACKAGE  QPAP_CEnt180PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt180PkG                                                                                */
/* �@�\          �F���Z�X�}�X�^�����e�i���X                                                                       */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��  																									  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtSeisanCDAry IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanNMAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* ���Z�X�f�[�^�擾 */
PROCEDURE QPAP_CEnt180SelList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrSeisanCD		OUT		typOtSeisanCDAry								--���Z�X�R�[�h
	,OtStrSeisanNM		OUT		typOtSeisanNMAry		        				--���Z�X����
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);										--�����I���t���O

/* ���Z�X�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt180DatAdd (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--���Z�X����
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR);											--�f�[�^�d���t���O

/* ���Z�X�f�[�^�X�V���� */
PROCEDURE QPAP_CEnt180DatUpd (
	 InStrSeisanCD_B  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h�C���O
	,InStrSeisanCD_A  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h�C����
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--���Z�X����
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR);											--�f�[�^�d���t���O

/* ���Z�X�f�[�^�폜���� */
PROCEDURE QPAP_CEnt180DatDel (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrSeisanF		OUT		CHAR);											--���Z�X�E�s�t���O

/* ���Z�X�}�X�^�ɓ����f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt180DataChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--���Z�X�R�[�h
	 RETURN BOOLEAN;

/* �X�}�X�^�ɐ��Z�X�f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt180MasterChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--���Z�X�R�[�h
	 RETURN BOOLEAN;

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt180OpeLog(
	 InStrMenuID      	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[�h�c
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--�v���O�����h�c
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--�����敪
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h
	,InStrMsg	  		IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt180Lock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrProgramID	  	IN      QSA4_HaitaT.QSA4_ProgramID%type					--�v���O�����h�c
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type				--�R���s���[�^��
	,InStrOperatorID  	IN      QSA4_HaitaT.QSA4_OperatorID%type);				--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt180UnLock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type);				--�R���s���[�^�[��

END QPAP_CEnt180PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[ 													                                                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt180PkG IS
	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* �e�[�u����   */
		fldKousinKBN	CHAR(1),	        									/* �X�V�敪     */
		fldAcsKey		CHAR(50),												/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)												/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;


	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

	/* �����������̂݊J������J�[�\�� */
	CURSOR CurCEnt180 IS
		SELECT	   QPAG_PRMSEISANCD,QPAG_SEISANNM								--���Z�X�R�[�h,���Z�X����
		FROM	   QPAG_SEISANM
		ORDER BY   QPAG_PRMSEISANCD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180SelList                                                                            */
/* �@�\          �F���Z�X�f�[�^�擾                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180SelList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrSeisanCD		OUT		typOtSeisanCDAry								--���Z�X�R�[�h
	,OtStrSeisanNM		OUT		typOtSeisanNMAry		        				--���Z�X����
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	 NumIdx				NUMBER;

	/* �s�ϐ� */
	 RowQPAG			CurCEnt180%ROWTYPE;

BEGIN
	/* ������ */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--�J�[�\���I�[�v��
	IF CurCEnt180%ISOPEN = FALSE THEN
		OPEN CurCEnt180();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt180 INTO RowQPAG;											--���ǂ�

		IF CurCEnt180%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		OtStrSeisanCD(NumIdx) := NVL(RowQPAG.QPAG_PRMSEISANCD,' ');
		OtStrSeisanNM(NumIdx) := NVL(RowQPAG.QPAG_SEISANNM,' ');

		/* �z��̌������l�`�w�𒴂����ꍇ */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;

	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt180;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt180%ISOPEN THEN
			CLOSE CurCEnt180;
		END IF;
		RAISE ;
END	QPAP_CEnt180SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180DatAdd                                                                             */
/* �@�\          �F���Z�X�f�[�^�o�^����                                                                           */
/******************************************************************************************************************/
/* ���Z�X�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt180DatAdd (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--���Z�X����
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2  	 									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR) IS										--�f�[�^�d���t���O

	numStep				NUMBER   := 0;											/* �����X�e�b�v  */
	numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	recMsg				typMsg;
	strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	R_Ans				BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '1';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSeisanCD;										--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt180DataChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt180DataChk(InStrSeisanCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  ���Z�X�f�[�^�o�^  */
	INSERT INTO QPAG_SEISANM VALUES (
		 InStrSeisanCD															--���Z�X�R�[�h
		,InStrSeisanNM);                                        				--���Z�X����

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Z�X�}�X�^�̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Z�X�}�X�^�̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180DatUpd                                                                             */
/* �@�\          �F���Z�X�}�X�^�̍X�V                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180DatUpd (
	 InStrSeisanCD_B  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h�C���O
	,InStrSeisanCD_A  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h�C����
	,InStrSeisanNM	  	IN		QPAG_SEISANM.QPAG_SEISANNM%TYPE					--���Z�X����
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2  	 									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR) IS										--�f�[�^�d���t���O

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSeisanCD_A;										--�X�V�L�[

	OtStrDupF := '0';
	IF InStrSeisanCD_A <> InStrSeisanCD_B THEN
		/* QPAP_CEnt180DataChk�̌Ăяo�� */
		R_Ans := QPAP_CEnt180DataChk(InStrSeisanCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* ���Z�X�}�X�^�̍X�V */
	UPDATE QPAG_SEISANM SET
		 QPAG_PRMSEISANCD =	InStrSeisanCD_A										--���Z�X�R�[�h
		,QPAG_SEISANNM = InStrSeisanNM											--���Z�X����
		WHERE QPAG_PRMSEISANCD = InStrSeisanCD_B;								--�X�V�L�[ ���Z�X�R�[�h

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Z�X�}�X�^�̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '���Z�X�}�X�^�̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180Del                                                                                */
/* �@�\          �F���Z�X�}�X�^�̍폜                                                                             */
/******************************************************************************************************************/
/*���Z�X�f�[�^�폜���� */
PROCEDURE QPAP_CEnt180DatDel (
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE				--���Z�X�R�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2	   									--�S�����i�I�y���O�p�j
	,OtStrSeisanF		OUT		CHAR) IS										--���Z�X�E�s�t���O

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr		        NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAG_SEISANM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '3';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSeisanCD;										--�X�V�L�[

	OtStrSeisanF := '0';
	/* QPAP_CEnt180MasterChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt180MasterChk(InStrSeisanCD);
	IF R_Ans = TRUE THEN
		OtStrSeisanF := '1';
		RETURN;
	END IF;


	/* ���Z�X�}�X�^�̍폜 */
	DELETE FROM     QPAG_SEISANM
	       WHERE	QPAG_PRMSEISANCD = InStrSeisanCD;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Z�X�}�X�^�̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt180OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);

	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);

		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Z�X�}�X�^�̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt180OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt180DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180DataChk                                        	                 				  */
/* �@�\          �F���Z�X�}�X�^�ɓ����f�[�^�����邩�`�F�b�N����                                        			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt180DataChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--���Z�X�R�[�h
	 RETURN BOOLEAN IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAG_SEISANM
	WHERE	QPAG_PRMSEISANCD = InStrSeisanCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--�o�^����Ă���
	ELSE
		RETURN  FALSE;															--�o�^����Ă��Ȃ�
	END IF;

END QPAP_CEnt180DataChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180MasterChk                                                     					  */
/* �@�\          �F�X�}�X�^�ɐ��Z�X�f�[�^�����邩�`�F�b�N����                                          			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt180MasterChk(
	 InStrSeisanCD	  	IN		QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE)				--���Z�X�R�[�h
	 RETURN BOOLEAN  IS															--����������

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAE_MISEM
	WHERE	QPAE_SEISANCD = InStrSeisanCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--�o�^����Ă���
	ELSE
		RETURN  FALSE;															--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt180MasterChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180OpeLog                                                       					  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                  			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt180OpeLog(
	 InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					/* ���j���[�h�c   */
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					/* �v���O�����h�c */
	,InStrUserID  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					/* ���[�U�h�c     */
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				/* �R���s���[�^   */
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				/* �����敪       */
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					/* �����R�[�h     */
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS					/* ���b�Z�[�W     */

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
			RAISE ;		/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt180OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180Lock                                                                               */
/* �@�\          �F���Z�X�}�X�^�̃��b�N                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* ���Z�X�}�X�^�̊m�F */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerNM, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InStrSikibetu;
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
			'P', InStrSikibetu,
			'P',
			'P',
			'P',
			'P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--���Z�X�}�X�^��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt180Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--���Z�X�}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt180Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt180Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt180UnLock                                                                             */
/* �@�\          �F���Z�X�}�X�^�̃��b�N����                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt180UnLock(
	 InStrSikibetu	  	IN      QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM 	IN      QSA4_HaitaT.QSA4_ComputerMei%type) IS			--�R���s���[�^�[��

BEGIN
	delete from QSA4_HaitaT
	 where QSA4_PRMJobKbn = 'P'
	   and QSA4_PRMSikibetu = InStrSikibetu
	   and QSA4_ComputerMei = InStrComputerNM;
	commit;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt180UnLock ;

END QPAP_CEnt180PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
