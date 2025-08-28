CREATE OR REPLACE PACKAGE  QPAP_CEnt190PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt190PkG                                                                                */
/* �@�\          �F�X�}�X�^�����e�i���X                                                                           */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��  													                                                  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	/*	�X�}�X�^����f�[�^�擾���i�[  */
	TYPE typOtStrMiseCDAry IS TABLE OF QPAE_MISEM.QPAE_PRMMISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrBonusYMD1Ary IS TABLE OF QPAE_MISEM.QPAE_BONUSYMD1%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrBonusYMD2Ary IS TABLE OF QPAE_MISEM.QPAE_BONUSYMD2%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanCDAry IS TABLE OF QPAE_MISEM.QPAE_SEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanNMAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrTozaiKBNEAry IS TABLE OF QPAE_MISEM.QPAE_TOZAIKBNE%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrTozaiKBNWAry IS TABLE OF QPAE_MISEM.QPAE_TOZAIKBNW%TYPE
		INDEX BY BINARY_INTEGER;

	/*	���Z�X�}�X�^����f�[�^�擾���i�[	*/
	TYPE typOtStrSeisanCDAry2 IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtStrSeisanNMAry2 IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* �X�f�[�^�擾 */
PROCEDURE QPAP_CEnt190SelList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrMiseCD		OUT		typOtStrMiseCDAry								--�X���R�[�h
	,OtStrMiseNM		OUT		typOtStrMiseNMAry								--�X����
	,OtStrBonusYMD1		OUT		typOtStrBonusYMD1Ary							--�ܗ^�x����1
	,OtStrBonusYMD2		OUT		typOtStrBonusYMD2Ary							--�ܗ^�x����2
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry								--���Z�X�R�[�h
	,OtStrSeisanNM		OUT     typOtStrSeisanNMAry								--���Z�X����
	,OtStrTozaiKBNE		OUT		typOtStrTozaiKBNEAry							--�����敪��
	,OtStrTozaiKBNW		OUT		typOtStrTozaiKBNWAry		        			--�����敪��
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);										--�����I���t���O

/* ���Z�X�R�[�h�擾*/
PROCEDURE QPAP_CEnt190SeisanCDList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry2							--���Z�X�R�[�h
	,OtStrSeisanNM		OUT		typOtStrSeisanNMAry2							--���Z�X����
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);										--�����I���t���O

/* �X�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt190DatAdd (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--�X����
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--�ܗ^�x����1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--�ܗ^�x����2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--���Z�X�R�[�h
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--�����敪��
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--�����敪��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR); 											--�f�[�^�d���t���O

/* �X�f�[�^�X�V���� */
PROCEDURE QPAP_CEnt190DatUpd (
	 InStrMiseCD_B		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h�C���O
	,InStrMiseCD_A		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h�C����
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--�X����
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--�ܗ^�x����1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--�ܗ^�x����2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--���Z�X�R�[�h
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--�����敪��
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--�����敪��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR);											--�f�[�^�d���t���O

/* �X�f�[�^�폜���� */
PROCEDURE QPAP_CEnt190DatDel (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrMiseF			OUT		CHAR);											--�X�E�s�t���O

/* �X�}�X�^�ɓ����f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt190DataChk(
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 				--�X�R�[�h
	 RETURN BOOLEAN;

/* ����}�X�^�ɓX�f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt190MasterChk(
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 				--�X�R�[�h
	 RETURN BOOLEAN;

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt190OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--���b�Z�[�W

/*-- �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt190Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt190UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--�R���s���[�^�[��

END QPAP_CEnt190PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[  												  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt190PkG IS
	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* �e�[�u����   */
		fldKousinKBN	CHAR(1),		        								/* �X�V�敪     */
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
	/* ���Z�X�}�X�^����̎擾 */
	CURSOR CurCEnt190 IS
		SELECT	  QPAG_PRMSEISANCD,QPAG_SEISANNM
		FROM	  QPAG_SEISANM
		ORDER BY  QPAG_PRMSEISANCD;

	/* �X�}�X�^����̎擾 */
	CURSOR CurCEnt190Mise IS
		SELECT    E.QPAE_PRMMISECD,E.QPAE_MISENM,E.QPAE_BONUSYMD1,
		          E.QPAE_BONUSYMD2,E.QPAE_SEISANCD,G.QPAG_SEISANNM,
			  	  E.QPAE_TOZAIKBNE,E.QPAE_TOZAIKBNW
		FROM	  QPAE_MISEM E,QPAG_SEISANM G
		WHERE	  E.QPAE_SEISANCD = G.QPAG_PRMSEISANCD (+)
		ORDER BY  E.QPAE_PRMMISECD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190SelList                                                                            */
/* �@�\          �F�X�f�[�^�擾                                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190SelList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrMiseCD		OUT		typOtStrMiseCDAry								--�X���R�[�h
	,OtStrMiseNM		OUT		typOtStrMiseNMAry								--�X����
	,OtStrBonusYMD1		OUT		typOtStrBonusYMD1Ary							--�ܗ^�x����1
	,OtStrBonusYMD2		OUT		typOtStrBonusYMD2Ary							--�ܗ^�x����2
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry								--���Z�X�R�[�h
	,OtStrSeisanNM		OUT     typOtStrSeisanNMAry								--���Z�X����
	,OtStrTozaiKBNE		OUT		typOtStrTozaiKBNEAry							--�����敪��
	,OtStrTozaiKBNW		OUT		typOtStrTozaiKBNWAry		        			--�����敪��
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;													--�z��pIDX

	/* �s�ϐ� */
	RowQPAG				CurCEnt190Mise%ROWTYPE;

BEGIN
	/* ������ */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--�J�[�\���I�[�v��
	IF CurCEnt190Mise%ISOPEN = FALSE THEN
		OPEN CurCEnt190Mise();
	END IF;

	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt190Mise INTO RowQPAG;										--���ǂ�

		IF CurCEnt190Mise%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		OtStrMiseCD(NumIdx)    :=  NVL(RowQPAG.QPAE_PRMMISECD,' ');				--�X���R�[�h
		OtStrMiseNM(NumIdx)    :=  NVL(RowQPAG.QPAE_MISENM,' ');				--�X����
		OtStrBonusYMD1(NumIdx) :=  NVL(RowQPAG.QPAE_BONUSYMD1,' ');				--�ܗ^�x����1
		OtStrBonusYMD2(NumIdx) :=  NVL(RowQPAG.QPAE_BONUSYMD2,' ');				--�ܗ^�x����2
		OtStrSeisanCD(NumIdx)  :=  NVL(RowQPAG.QPAE_SEISANCD,' ');				--���Z�X�R�[�h
		OtStrSeisanNM(NumIdx)  :=  NVL(RowQPAG.QPAG_SEISANNM,' ');				--���Z�X����
		OtStrTozaiKBNE(NumIdx) :=  NVL(RowQPAG.QPAE_TOZAIKBNE,' ');				--�����敪��
		OtStrTozaiKBNW(NumIdx) :=  NVL(RowQPAG.QPAE_TOZAIKBNW,' '); 			--�����敪��

		/* �z��̌������l�`�w�𒴂����ꍇ */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt190Mise;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt190Mise%ISOPEN THEN
			CLOSE CurCEnt190Mise;
		END IF;
		RAISE ;

END	QPAP_CEnt190SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190SeisanCDList                                                                       */
/* �@�\          �F���Z�X�R�[�h�擾����                                                                           */
/******************************************************************************************************************/
/* ���Z�X�R�[�h�擾 */
PROCEDURE QPAP_CEnt190SeisanCDList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrSeisanCD		OUT		typOtStrSeisanCDAry2							--���Z�X�R�[�h
	,OtStrSeisanNM		OUT		typOtStrSeisanNMAry2							--���Z�X����
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;

	/* �s�ϐ� */
	RowQPAP				CurCEnt190%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--�J�[�\���I�[�v��
	IF CurCEnt190%ISOPEN = FALSE THEN
		OPEN CurCEnt190();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		FETCH CurCEnt190 INTO RowQPAP;											--���ǂ�

		IF CurCEnt190%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		/* �擾�f�[�^��z��ɑ��*/
		OtStrSeisanCD(NumIdx) := RowQPAP.QPAG_PRMSEISANCD;
		OtStrSeisanNM(NumIdx) := RowQPAP.QPAG_SEISANNM;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt190;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt190%ISOPEN THEN
			CLOSE CurCEnt190;
		END IF;
		RAISE;
END	QPAP_CEnt190SeisanCDList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190DatAdd                                                                             */
/* �@�\          �F�X�f�[�^�o�^����                                                                               */
/******************************************************************************************************************/
/* �X�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt190DatAdd (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--�X����
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--�ܗ^�x����1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--�ܗ^�x����2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--���Z�X�R�[�h
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--�����敪��
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE          		--�����敪��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR) IS										--�f�[�^�d���t���O

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr			    NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	 recMsg.fldTableID := 'QPAE_MISEM';		    								--�e�[�u����
	 recMsg.fldKousinKBN := '1';												--�X�V�敪
	 recMsg.fldAcsKey := InStrMiseCD;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt190DataChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt190DataChk(InStrMiseCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  �X�f�[�^�o�^  */
	INSERT INTO QPAE_MISEM VALUES (
		 InStrMiseCD                                            				--�X���R�[�h
        ,InStrMiseNM                                            				--�X����
        ,InStrBonusYMD1                             	                		--�ܗ^�x����1
        ,InStrBonusYMD2                            	             				--�ܗ^�x����2
        ,InStrSeisanCD                                          				--���Z�X�R�[�h
        ,InStrTozaiKBNE															--�����敪��
		,InStrTozaiKBNW);                                       				--�����敪��

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg 	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
		numErr	  := SQLCODE;
		strErrMsg := SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE ;
END	QPAP_CEnt190DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190DatUpd                                                                             */
/* �@�\          �F�X�}�X�^�̍X�V                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190DatUpd (
	 InStrMiseCD_B		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h�C���O
	,InStrMiseCD_A		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X���R�[�h�C����
	,InStrMiseNM		IN		QPAE_MISEM.QPAE_MISENM%TYPE						--�X����
	,InStrBonusYMD1		IN		QPAE_MISEM.QPAE_BONUSYMD1%TYPE					--�ܗ^�x����1
	,InStrBonusYMD2		IN		QPAE_MISEM.QPAE_BONUSYMD2%TYPE					--�ܗ^�x����2
	,InStrSeisanCD		IN		QPAE_MISEM.QPAE_SEISANCD%TYPE					--���Z�X�R�[�h
	,InStrTozaiKBNE		IN		QPAE_MISEM.QPAE_TOZAIKBNE%TYPE					--�����敪��
	,InStrTozaiKBNW		IN		QPAE_MISEM.QPAE_TOZAIKBNW%TYPE					--�����敪��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF			OUT		CHAR) IS										--�f�[�^�d���t���O

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr			    NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAE_MISEM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrMiseCD_A;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt190DataChk�̌Ăяo�� */
	IF InStrMiseCD_A <> InStrMiseCD_B THEN
		R_Ans := QPAP_CEnt190DataChk(InStrMiseCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* �X�}�X�^�̍X�V */
	UPDATE QPAE_MISEM SET
		QPAE_PRMMISECD = InStrMiseCD_A											--�X�R�[�h
		,QPAE_MISENM = InStrMiseNM												--�X����
		,QPAE_BONUSYMD1 = InStrBonusYMD1										--�ܗ^�x����1
		,QPAE_BONUSYMD2	= InStrBonusYMD2										--�ܗ^�x����2
		,QPAE_SEISANCD = InStrSeisanCD											--���Z�X�R�[�h
		,QPAE_TOZAIKBNE	= InStrTozaiKBNE										--�����敪��
		,QPAE_TOZAIKBNW	= InStrTozaiKBNW										--�����敪��
		WHERE QPAE_PRMMISECD = InStrMiseCD_B;									--�X�V�L�[ �X�R�[�h

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt190DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190Del                                                                                */
/* �@�\          �F�X�}�X�^�̍폜                                                                                 */
/******************************************************************************************************************/
/*�X�f�[�^�폜���� */
PROCEDURE QPAP_CEnt190DatDel (
	 InStrMiseCD		IN		QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�X�R�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrMiseF			OUT		CHAR) IS										--�X�E�s�t���O

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			   	BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAE_MISEM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '3';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrMiseCD;											--�X�V�L�[

	/* QPAP_CEnt180MasterChk�̌Ăяo�� */
	OtStrMiseF := '0';
	R_Ans := QPAP_CEnt190MasterChk(InStrMiseCD);
	IF R_Ans = TRUE THEN
		OtStrMiseF := '1';
		RETURN;
	END IF;

	/* �X�}�X�^�̍폜 */
	DELETE FROM   QPAE_MISEM
	       WHERE  QPAE_PRMMISECD = InStrMiseCD;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt190OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�X�}�X�^�̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt190OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF;

		RAISE ;
END	QPAP_CEnt190DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt19ODataChk                                                       					  */
/* �@�\          �F�X�}�X�^�ɓ����f�[�^�����邩�`�F�b�N����     	                                			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt190DataChk(
	 InStrMiseCD 	IN 		QPAE_MISEM.QPAE_PRMMISECD%TYPE) 					--�X�R�[�h
	 RETURN BOOLEAN  IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT COUNT(*) INTO OtNumRecCount FROM	QPAE_MISEM
	WHERE  QPAE_PRMMISECD = InStrMiseCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;							--�o�^����Ă���
	ELSE
		RETURN  FALSE;							--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt190DataChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt19OMasterChk                                        					              */
/* �@�\          �F����}�X�^�ɓX�f�[�^�����邩�`�F�b�N����                                                       */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt190MasterChk(
	 InStrMiseCD		IN	 QPAE_MISEM.QPAE_PRMMISECD%TYPE) 					--�X�R�[�h
	 RETURN BOOLEAN  IS

	 OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT COUNT(*) INTO OtNumRecCount 	FROM  QPAF_BUMONM
	WHERE  QPAF_PRMMISECD = InStrMiseCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--�o�^����Ă���
	ELSE
		RETURN  FALSE;															--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt190MasterChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190OpeLog                                        					                  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                        			              */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt190OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS	 				--���b�Z�[�W

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
END  QPAP_CEnt190OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190Lock                                          					                  */
/* �@�\          �F�X�}�X�^�̃��b�N                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,			/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,			/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,			/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �X�}�X�^�̊m�F */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
		where QSA4_PRMJobKbn = 'P'
		and QSA4_PRMSikibetu = InStrSikibetu;
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
	WHEN W_HAITADUPLICATE THEN	--�X�}�X�^��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt190Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--�X�}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt190Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt190Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt190UnLock                                        					                  */
/* �@�\          �F�X�}�X�^�̃��b�N����                                      					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt190UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS			--�R���s���[�^�[��
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

END QPAP_CEnt190UnLock ;

END QPAP_CEnt190PkG;

/***END of LINE/***************************************************************************************************/
/
show error
