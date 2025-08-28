CREATE OR REPLACE PACKAGE  QPAP_CEnt200PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt200PkG                                                                                */
/* �@�\          �F����}�X�^�����e�i���X                                                                         */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��  													                                                  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtBumonCDAry IS TABLE OF QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseCDAry IS TABLE OF QPAE_MISEM.QPAE_PRMMISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

/* ����f�[�^�擾 */
PROCEDURE QPAP_CEnt200SelList (
	 InStrMiseCD      	IN   		QPAF_BUMONM.QPAF_PRMMISECD%TYPE		        --�X�R�[�h
	,InNumMaxRec	  	IN   		NUMBER										--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  	NUMBER										--�Ăяo����
	,OtStrBumonCD	  	OUT			typOtBumonCDAry								--����R�[�h
	,OtStrBumonNM	  	OUT			typOtBumonNMAry								--���喼��
	,OtNumAryCount		OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	  	OUT			VARCHAR2);									--�����I���t���O

/* �X�R�[�h�擾 */
PROCEDURE QPAP_CEnt200MiseCDList (
	 InNumMaxRec		IN			NUMBER										--�ő�z��i�[����
	,OtStrMiseCD	  	OUT			typOtMiseCDAry								--����R�[�h
	,OtStrMiseNM	  	OUT			typOtMiseNMAry								--���喼��
	,OtNumAryCount	  	OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	  	OUT			VARCHAR2);									--�����I���t���O

/* �f�[�^�o�^���� */
PROCEDURE QPAP_CEnt200DatAdd (
	 InStrMiseCD      	IN     		QPAF_BUMONM.QPAF_PRMMISECD%TYPE  			--�X�R�[�h
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--����R�[�h
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE	 			--���喼��
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 		CHAR);										--�f�[�^�d���t���O

/* ����f�[�^�X�V���� */
PROCEDURE QPAP_CEnt200DatUpd (
	 InStrMiseCD      	IN       	QPAF_BUMONM.QPAF_PRMMISECD%TYPE      		--�X�R�[�h
	,InStrBumonCD_B	 	IN       	QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--����R�[�h�C���O
	,InStrBumonCD_A	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--����R�[�h�C����
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE       		--���喼��
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 		CHAR);										--�f�[�^�d���t���O

/* ����f�[�^�폜���� */
PROCEDURE QPAP_CEnt200DatDel (
	 InStrMiseCD      	IN       	QPAF_BUMONM.QPAF_PRMMISECD%TYPE      		--�X�R�[�h
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--����R�[�h
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2);    								--�S�����i�I�y���O�p�j

/* ����}�X�^�ɓ����f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt200DataChk(
	  InStrMiseCD		IN			QPAF_BUMONM.QPAF_PRMMISECD%TYPE	 			--�X�R�[�h
	 ,InStrBumonCD		IN			QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE)			--����R�[�h
	 RETURN BOOLEAN;

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt200OpeLog(
	 InStrMenuID      	IN	 		QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleID    	IN	 		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserID  	  	IN	 		QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerNM 	IN	 		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTozaiKBN	  	IN	 		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCD	  	IN	 		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg	  		IN	 		QUS2_OpeLogT.QUS2_MSG%TYPE);	 			--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt200Lock(
	 InStrSikibetu	  	IN       	QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrProgramID	  	IN       	QSA4_HaitaT.QSA4_ProgramID%type				--�v���O�����h�c
	,InStrComputerNM 	IN       	QSA4_HaitaT.QSA4_ComputerMei%type			--�R���s���[�^��
	,InStrOperatorID  	IN       	QSA4_HaitaT.QSA4_OperatorID%type);			--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt200UnLock(
	 InStrSikibetu	  	IN       	QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrComputerNM 	IN       	QSA4_HaitaT.QSA4_ComputerMei%type);			--�R���s���[�^�[��

END QPAP_CEnt200PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[   												  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt200PkG IS

	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	   RECORD (
		fldTableID	   		CHAR(19),												/* �e�[�u����   */
		fldKousinKBN	    CHAR(1),		        								/* �X�V�敪     */
		fldAcsKey	   		CHAR(50),												/* �A�N�Z�X�L�[ */
		fldMsg		   		CHAR(100)												/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* �����������̂݊J������J�[�\�� */
	/* �X�}�X�^����擾 */
	CURSOR CurCEnt200 IS
		SELECT	 QPAE_PRMMISECD,QPAE_MISENM
		FROM	 QPAE_MISEM
		ORDER BY QPAE_PRMMISECD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200SelList                                                                            */
/* �@�\          �F����f�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200SelList (
	 InStrMiseCD      	IN   		QPAF_BUMONM.QPAF_PRMMISECD%TYPE				--�X�R�[�h
	,InNumMaxRec	  	IN   		NUMBER										--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  	NUMBER										--�Ăяo����
	,OtStrBumonCD	  	OUT			typOtBumonCDAry								--����R�[�h
	,OtStrBumonNM	  	OUT			typOtBumonNMAry								--���喼��
	,OtNumAryCount		OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	  	OUT			VARCHAR2) IS								--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;													--�z��pIDX
	v_CursorID			INTEGER;												--�J�[�\��ID
	v_SelectStmt		VARCHAR2(1000);											--SQL������
	v_BumonCD			QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE;						--�o�C���h�p����R�[�h
	v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--�o�C���h�p���喼��
	v_Dummy				INTEGER;												--Dummy

BEGIN

	/* ������ */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--�������Ɏg�p����J�[�\�����I�[�v������
	IF IoNumSpCnt = 0 THEN
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		/* �f�[�^���擾���� */
		--�⍇��������̍쐬
		v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT QPAF_PRMBUMONCD,QPAF_BUMONNM FROM QPAF_BUMONM
				 		 WHERE QPAF_PRMMISECD = :MiseCD ORDER BY QPAF_PRMBUMONCD';

		--�⍇������͂���
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--���͕ϐ����o�C���h����
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':MiseCD',InStrMiseCD);

		--���s����
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;
	IoNumSpCnt := v_CursorID;

	--�o�͕ϐ����`����
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_BumonNM,24);

	--FETCH LOOP��
	LOOP
		NumIdx := NumIdx + 1;

		--��A�̍s���o�b�t�@�Ɏ��o��������LOOP�̏I���������`�F�b�N����
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		--��A�̍s���o�b�t�@����PLSQL�ϐ���FETCH����
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_BumonNM);

		OtStrBumonCD(NumIdx) := NVL(v_BumonCD,' ');
		OtStrBumonNM(NumIdx) := NVL(v_BumonNM,' ');

		/* �z��̌������l�`�w�𒴂����ꍇ */
		IF InNumMaxRec = NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE ;
END	QPAP_CEnt200SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200MiseCDList                                                                         */
/* �@�\          �F�X�R�[�h�擾		                                                                         	  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200MiseCDList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,OtStrMiseCD	  	OUT		typOtMiseCDAry									--����R�[�h
	,OtStrMiseNM	  	OUT		typOtMiseNMAry									--���喼��
	,OtNumAryCount	  	OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg	  	OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;

	/* �s�ϐ� */
	RowQPAP				CurCEnt200%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--�J�[�\���I�[�v��
	IF CurCEnt200%ISOPEN = FALSE THEN
		OPEN CurCEnt200();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt200 INTO RowQPAP;											--���ǂ�

		IF CurCEnt200%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		/* �擾�f�[�^��z��ɑ��*/
		OtStrMiseCD(NumIdx)  := RowQPAP.QPAE_PRMMISECD;
		OtStrMiseNM(NumIdx)  := RowQPAP.QPAE_MISENM;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;
		END IF;

	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt200;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt200%ISOPEN THEN
			CLOSE CurCEnt200;
		END IF;
		RAISE ;
END	QPAP_CEnt200MiseCDList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200DatAdd                                                                             */
/* �@�\          �F����f�[�^�o�^����                                                                             */
/******************************************************************************************************************/
/* ����f�[�^�o�^���� */
PROCEDURE QPAP_CEnt200DatAdd (
	 InStrMiseCD      	IN     		QPAF_BUMONM.QPAF_PRMMISECD%TYPE  			--�X�R�[�h
	,InStrBumonCD	  	IN	 		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE			--����R�[�h
	,InStrBumonNM	  	IN	 		QPAF_BUMONM.QPAF_BUMONNM%TYPE	 			--���喼��
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 		CHAR) IS									--�f�[�^�d���t���O

	 numStep		   	NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr			   	NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		   	VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			   	typMsg;
	 strLogMsg		   	QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAF_BUMONM';		    							--�e�[�u����
	recMsg.fldKousinKBN	:= '1';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrMiseCD;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt200DataChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt200DataChk(InStrMiseCD,InStrBumonCD);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  ����f�[�^�o�^  */
	INSERT INTO QPAF_BUMONM VALUES (
		 InStrMiseCD															--�X�R�[�h
		,InStrBumonCD															--���Z�X�R�[�h
		,InStrBumonNM);                                         				--���Z�X����

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200DatUpd                                                                             */
/* �@�\          �F����}�X�^�̍X�V                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200DatUpd (
	 InStrMiseCD      	IN      QPAF_BUMONM.QPAF_PRMMISECD%TYPE      			--�X�R�[�h
	,InStrBumonCD_B	 	IN      QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--����R�[�h�C���O
	,InStrBumonCD_A	  	IN	 	QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--����R�[�h�C����
	,InStrBumonNM	  	IN	 	QPAF_BUMONM.QPAF_BUMONNM%TYPE       			--���喼��
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 	CHAR) IS										--�f�[�^�d���t���O

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr			    NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		    VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			    typMsg;
	 strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans				BOOLEAN;

BEGIN

	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAF_BUMONM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrMiseCD;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt200DataChk�̌Ăяo�� */
	IF InStrBumonCD_A <> InStrBumonCD_B THEN
		R_Ans := QPAP_CEnt200DataChk(InStrMiseCD,InStrBumonCD_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* ����}�X�^�̍X�V */
	UPDATE QPAF_BUMONM SET
		   QPAF_PRMBUMONCD = InStrBumonCD_A									--����R�[�h
		   ,QPAF_BUMONNM =	InStrBumonNM									--���喼��
	WHERE  QPAF_PRMMISECD = InStrMiseCD										--�X�V�L�[ �X�R�[�h,����R�[�h
	AND    QPAF_PRMBUMONCD = InStrBumonCD_B;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200Del                                                                                */
/* �@�\          �F����}�X�^�̍폜                                                                               */
/******************************************************************************************************************/
/*����f�[�^�폜���� */
PROCEDURE QPAP_CEnt200DatDel (
	 InStrMiseCD      	IN      QPAF_BUMONM.QPAF_PRMMISECD%TYPE      			--�X�R�[�h
	,InStrBumonCD	  	IN		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE				--����R�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2) IS    								--�S�����i�I�y���O�p�j

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAF_BUMONM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '3';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrMiseCD;											--�X�V�L�[

	/* ����}�X�^�̍폜 */
	DELETE FROM QPAF_BUMONM
		WHERE QPAF_PRMMISECD = InStrMiseCD
		AND	  QPAF_PRMBUMONCD = InStrBumonCD;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt200OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j����}�X�^�̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt200OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt200DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt20ODataChk                                                       					  */
/* �@�\          �F����}�X�^�ɓ����f�[�^�����邩�`�F�b�N����     	                      	             		  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt200DataChk(
	  InStrMiseCD		IN		QPAF_BUMONM.QPAF_PRMMISECD%TYPE	 				--�X�R�[�h
	 ,InStrBumonCD		IN		QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE)				--����R�[�h
	 RETURN BOOLEAN IS

	OtNumRecCount		NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAF_BUMONM
	WHERE	QPAF_PRMMISECD = InStrMiseCD
	AND     QPAF_PRMBUMONCD = InStrBumonCD;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--�o�^����Ă���
	ELSE
		RETURN  FALSE;															--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt200DataChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200OpeLog                                        	                 				  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                        		            	  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt200OpeLog(
	 InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				/* ���j���[�h�c   */
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				/* �v���O�����h�c */
	,InStrUserID  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				/* ���[�U�h�c     */
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			/* �R���s���[�^   */
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			/* �����敪       */
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				/* �����R�[�h     */
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE ) IS				/* ���b�Z�[�W     */
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
END  QPAP_CEnt200OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200Lock                                          					                  */
/* �@�\          �F����}�X�^�̃��b�N                                          					                  */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* ����}�X�^�̊m�F */
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
	WHEN W_HAITADUPLICATE THEN	--����}�X�^��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt200Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--����}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt200Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt200Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt200UnLock                                                                             */
/* �@�\          �F����}�X�^�̃��b�N����                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt200UnLock(
	InStrSikibetu		IN QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM	IN QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt200UnLock ;

END QPAP_CEnt200PkG;
/***END of LINE****************************************************************/
/
show error
