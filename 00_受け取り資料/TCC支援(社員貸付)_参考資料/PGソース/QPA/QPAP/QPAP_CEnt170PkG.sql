CREATE OR REPLACE PACKAGE  QPAP_CEnt170PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  					                  */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                          					                  */
/* ���W���[����  �FQPAP_CEnt170PkG                                           					                  */
/* �@�\          �F���Гo�^���e�ύX����                                     					                  */
/* �쐬��        �F2001/07/10                                   					                              */
/* �쐬��        �FFIP                                                       					                  */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾�� 				                                                									  */
/******************************************************************************************************************/

/* ���Ѓf�[�^�擾 */
PROCEDURE QPAP_CEnt170SelList (
	 OtStrKaisyaCD		OUT		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--��ЃR�[�h
	,OtStrZaimuCD		OUT		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--�����ǃR�[�h
	,OtStrSyozai		OUT		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--���ݒn
	,OtStrKaisyaNM		OUT		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--��Ж���
	,OtStrFurikomi		OUT		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--�U����s
	,OtStrKozaNo		OUT		QPAB_JISYAM.QPAB_KOZANO%TYPE					--�����ԍ�
	,OtStrKozaNM		OUT		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--�������`
	,OtStrKamiStM		OUT		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--����J�n��
	,OtStrKamiStD		OUT		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--����J�n��
	,OtStrSimoStM		OUT		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--�����J�n��
	,OtStrSimoStD		OUT		QPAB_JISYAM.QPAB_SIMOSTD%TYPE); 	 			--�����J�n��

/* ���Ѓf�[�^�X�V���� */
PROCEDURE QPAP_CEnt170DatUpd (
	 InStrKaisyaCD	  	IN 		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--��ЃR�[�h
	,InStrZaimuCD	  	IN 		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--�����ǃR�[�h
	,InStrSyozai	  	IN 		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--���ݒn
	,InStrKaisyaNM	 	IN 		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--��Ж���
	,InStrFurikomi	 	IN 		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE					--�U����s
	,InStrKozaNo	 	IN 		QPAB_JISYAM.QPAB_KOZANO%TYPE					--�����ԍ�
	,InStrKozaNM	 	IN 		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--�������`
	,InStrKamiStM	 	IN 		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--����J�n��
	,InStrKamiStD	 	IN 		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--����J�n��
	,InStrSimoStM	 	IN 		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--�����J�n��
	,InStrSimoStD	  	IN 		QPAB_JISYAM.QPAB_SIMOSTD%TYPE	  				--�����J�n��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2);    									--�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt170OpeLog(
	 InStrMenuID  	  	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[�h�c
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--�v���O�����h�c
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--�����敪
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h
	,InStrMsg	  		IN		QUS2_OpeLogT.QUS2_MSG%TYPE);					--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt170Lock(
	 InStrSikibetu	  	IN    	QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrProgramID	  	IN   	QSA4_HaitaT.QSA4_ProgramID%type					--�v���O�����h�c
	,InStrComputerNM 	IN   	QSA4_HaitaT.QSA4_ComputerMei%type				--�R���s���[�^��
	,InStrOperatorID  	IN    	QSA4_HaitaT.QSA4_OperatorID%type);				--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt170UnLock(
	 InStrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type					--���ʃR�[�h
	,InStrComputerNM	IN 	QSA4_HaitaT.QSA4_ComputerMei%type);					--�R���s���[�^�[��

END QPAP_CEnt170PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[ 													  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt170PkG IS

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

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt170SelList       					                                                  */
/* �@�\          �F���Ѓf�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170SelList (
	 OtStrKaisyaCD		OUT		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--��ЃR�[�h
	,OtStrZaimuCD		OUT		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--�����ǃR�[�h
	,OtStrSyozai		OUT		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--���ݒn
	,OtStrKaisyaNM		OUT		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--��Ж���
	,OtStrFurikomi		OUT		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--�U����s
	,OtStrKozaNo		OUT		QPAB_JISYAM.QPAB_KOZANO%TYPE					--�����ԍ�
	,OtStrKozaNM		OUT		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--�������`
	,OtStrKamiStM		OUT		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--����J�n��
	,OtStrKamiStD		OUT		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--����J�n��
	,OtStrSimoStM		OUT		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--�����J�n��
	,OtStrSimoStD		OUT		QPAB_JISYAM.QPAB_SIMOSTD%TYPE) IS				--�����J�n��

BEGIN

	SELECT QPAB_PRMKAISYACD,QPAB_ZAIMUKYOKUCD,QPAB_SYOZAICHI,QPAB_KAISYANM,QPAB_FURIKOMIBK,
		   QPAB_KOZANO,QPAB_KOZANM,QPAB_KAMISTM,QPAB_KAMISTD,QPAB_SIMOSTM,QPAB_SIMOSTD
	INTO   OtStrKaisyaCD,OtStrZaimuCD,OtStrSyozai,OtStrKaisyaNM,OtStrFurikomi,OtStrKozaNo,
		   OtStrKozaNM,OtStrKamiStM,OtStrKamiStD,OtStrSimoStM,OtStrSimoStD
    FROM   QPAB_JISYAM;

EXCEPTION
	WHEN	NO_DATA_FOUND THEN
		RETURN;
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt170SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt170DatUpd                							                                  */
/* �@�\          �F���Ѓ}�X�^�̍X�V                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170DatUpd (
	 InStrKaisyaCD		IN 		QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE				--��ЃR�[�h
	,InStrZaimuCD	   	IN 		QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE				--�����ǃR�[�h
	,InStrSyozai	   	IN 		QPAB_JISYAM.QPAB_SYOZAICHI%TYPE					--���ݒn
	,InStrKaisyaNM	   	IN 		QPAB_JISYAM.QPAB_KAISYANM%TYPE					--��Ж���
	,InStrFurikomi	   	IN 		QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE				--�U����s
	,InStrKozaNo	   	IN 		QPAB_JISYAM.QPAB_KOZANO%TYPE					--�����ԍ�
	,InStrKozaNM	   	IN 		QPAB_JISYAM.QPAB_KOZANM%TYPE  					--�������`
	,InStrKamiStM	   	IN 		QPAB_JISYAM.QPAB_KAMISTM%TYPE  					--����J�n��
	,InStrKamiStD	   	IN 		QPAB_JISYAM.QPAB_KAMISTD%TYPE  					--����J�n��
	,InStrSimoStM	   	IN 		QPAB_JISYAM.QPAB_SIMOSTM%TYPE  					--�����J�n��
	,InStrSimoStD	   	IN 		QPAB_JISYAM.QPAB_SIMOSTD%TYPE	 				--�����J�n��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2) IS									--�S�����i�I�y���O�p�j

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAB_JISYAM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '1';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrKaisyaCD;										--�X�V�L�[

	/* ���Ѓ}�X�^�̍X�V */
	UPDATE QPAB_JISYAM SET
		 	QPAB_ZAIMUKYOKUCD	=	InStrZaimuCD								--�����ǃR�[�h
			,QPAB_SYOZAICHI		=	InStrSyozai									--���ݒn
			,QPAB_KAISYANM		=	InStrKaisyaNM								--��Ж���
			,QPAB_FURIKOMIBK	=	InStrFurikomi								--�U����s
			,QPAB_KOZANO		=	InStrKozaNo									--�����ԍ�
			,QPAB_KOZANM		=	InStrKozaNM									--�������`
			,QPAB_KAMISTM		=	InStrKamiStM								--����J�n��
			,QPAB_KAMISTD		=	InStrKamiStD								--����J�n��
			,QPAB_SIMOSTM		=	InStrSimoStM								--�����J�n��
			,QPAB_SIMOSTD		=	InStrSimoStD								--�����J�n��
	WHERE	QPAB_PRMKAISYACD	= 	InStrKaisyaCD;								--�X�V�L�[ ��ЃR�[�h

	/* �I�y���[�V�������O�o�� */
	numStep := 1;								/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Ѓ}�X�^�̏C���𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt170OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���Ѓ}�X�^�̏C���Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
	QPAP_CEnt170OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKBN,
						InStrBushoCD,
						strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt170DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt170OpeLog   				                        	                              */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                            					                  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt170OpeLog(
	 InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					/* ���j���[�h�c   */
	,InStrModuleID     	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					/* �v���O�����h�c */
	,InStrUserID  	   	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					/* ���[�U�h�c     */
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				/* �R���s���[�^   */
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				/* �����敪       */
	,InStrBushoCD	   	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					/* �����R�[�h     */
	,InStrMsg	   		IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS					/* ���b�Z�[�W     */
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
			RAISE ;																/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt170OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt170Lock                          					                                  */
/* �@�\          �F���Ѓ}�X�^�̃��b�N                                        					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* ���Ѓ}�X�^�̊m�F */
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
	WHEN W_HAITADUPLICATE THEN	--���Ѓ}�X�^��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt170Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--���Ѓ}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt170Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt170Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt170UnLock                                                          					  */
/* �@�\          �F���Ѓ}�X�^�̃��b�N����                                                    					  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt170UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt170UnLock;

END QPAP_CEnt170PkG;
/
show error
