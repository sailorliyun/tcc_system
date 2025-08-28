CREATE OR REPLACE PACKAGE  QPAP_CEnt220PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt220PkG                                                                                */
/* �@�\          �F���̑��}�X�^�����e�i���X                                                                       */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
--                           0808052�FTCC�x���V�X�e���̍č\�z
--                             �E�A�v���P�[�V�����ڍs�Ή�
--                               NUMBER��' '�ɕϊ����Ă����̂��C��
------------------------------------------------------------------------------------------------

/******************************************************************************************************************/
/*�P  �錾��                                                                                                      */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtKyotuCDAry IS TABLE OF QPAH_OTHERM.QPAH_PRMCODE%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyotuNMNAry IS TABLE OF QPAH_OTHERM.QPAH_NAMEN%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyotuNMXAry IS TABLE OF QPAH_OTHERM.QPAH_NAMEX%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtRirituAry IS TABLE OF QPAH_OTHERM.QPAH_RIRITU%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSGendoAry IS TABLE OF QPAH_OTHERM.QPAH_SGENDO%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtKGendoAry IS TABLE OF QPAH_OTHERM.QPAH_KGENDO%TYPE
		INDEX BY BINARY_INTEGER;

/* ���̑��f�[�^�擾 */
PROCEDURE QPAP_CEnt220SelList (
	 InNumMaxRec	  	IN   	NUMBER											--�ő�z��i�[����
	,OtStrCode      	OUT     typOtKyotuCDAry							        --���ʃR�[�h
	,OtStrNameN			OUT		typOtKyotuNMNAry								--���ʖ��̂m
	,OtStrNameX			OUT		typOtKyotuNMXAry	           					--���ʖ��̂w
	,OtStrRiritu    	OUT     typOtRirituAry			        				--����
	,OtStrSGendo		OUT		typOtSGendoAry									--�؏����x�z
	,OtStrKGendo		OUT		typOtKGendoAry		           					--�������x�z
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);										--�����I���t���O

/* ���̑��f�[�^�o�^���� */
PROCEDURE QPAP_CEnt220DatAdd (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--���ʃR�[�h
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--���ʖ��̂m
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE           			--���ʖ��̂w
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE            		--����
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--�؏����x�z
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE         			--�������x�z
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCd	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 	CHAR);											--�f�[�^�d���t���O

/* ���̑��f�[�^�X�V���� */
PROCEDURE QPAP_CEnt220DatUpd (
	 InStrCode_B      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--���ʃR�[�h�C���O
	,InStrCode_A      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE    		        --���ʃR�[�h�C����
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--���ʖ��̂m
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE          		 	--���ʖ��̂w
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE         			--����
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--�؏����x�z
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE        		 	--�������x�z
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT		CHAR);											--�f�[�^�d���t���O

/* ���̑��f�[�^�폜���� */
PROCEDURE QPAP_CEnt220DatDel (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE	        		--���ʃR�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2);    									--�S�����i�I�y���O�p�j

/* ���̑��}�X�^�ɓ����f�[�^�����邩�`�F�b�N���� */
FUNCTION  QPAP_CEnt220DataChk(
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE)	       			--���ʃR�[�h
	 RETURN BOOLEAN;

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt220OpeLog(
	 InStrMenuID      	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[�h�c
	,InStrModuleID    	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--�v���O�����h�c
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c
	,InStrComputerNM 	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^
	,InStrTozaiKBN	  	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--�����敪
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h
	,InStrMsg	 	 	IN		QUS2_OpeLogT.QUS2_MSG%TYPE);	 				--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt220Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt220UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--�R���s���[�^�[��

END QPAP_CEnt220PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[						                      				                                          */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt220PkG IS
	/*  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* �e�[�u����   */
		fldKousinKBN	CHAR(1),	        									/* �X�V�敪     */
		fldAcsKey		CHAR(50),												/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)												/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/*  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* �����������̂݊J������J�[�\�� */
	CURSOR CurCEnt220 IS
		SELECT	 QPAH_PRMCODE,QPAH_NAMEN,QPAH_NAMEX,QPAH_RIRITU,
			 	 QPAH_SGENDO,QPAH_KGENDO
		FROM	 QPAH_OTHERM
		ORDER BY QPAH_PRMCODE;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220SelList                                                                            */
/* �@�\          �F���̑��f�[�^�擾                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220SelList (
	 InNumMaxRec	  	IN   	NUMBER											--�ő�z��i�[����
	,OtStrCode      	OUT     typOtKyotuCDAry			        				--���ʃR�[�h
	,OtStrNameN			OUT		typOtKyotuNMNAry								--���ʖ��̂m
	,OtStrNameX			OUT		typOtKyotuNMXAry	           					--���ʖ��̂w
	,OtStrRiritu    	OUT     typOtRirituAry			        				--����
	,OtStrSGendo		OUT		typOtSGendoAry									--�؏����x�z
	,OtStrKGendo		OUT		typOtKGendoAry		           					--�������x�z
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;

	/* �s�ϐ� */
	RowQPAP				CurCEnt220%ROWTYPE;

BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--�J�[�\���I�[�v��
	IF CurCEnt220%ISOPEN = FALSE THEN
		OPEN CurCEnt220();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt220 INTO RowQPAP;											--���ǂ�

		IF CurCEnt220%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;																--���[�v�I��
		END IF;

		/* �擾�f�[�^��z��ɑ��*/
		OtStrCode(NumIdx)   := NVL(RowQPAP.QPAH_PRMCODE,' ');
		OtStrNameN(NumIdx)  := NVL(RowQPAP.QPAH_NAMEN,' ');
		OtStrNameX(NumIdx)  := NVL(RowQPAP.QPAH_NAMEX,' ');
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--		OtStrRiritu(NumIdx) := NVL(RowQPAP.QPAH_RIRITU,' ');
--		OtStrSGendo(NumIdx) := NVL(RowQPAP.QPAH_SGENDO,' ');
--		OtStrKGendo(NumIdx) := NVL(RowQPAP.QPAH_KGENDO,' ');
--DEL 20090329 0807073/0808052 NBC YOKOYAMA END
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
		OtStrRiritu(NumIdx) := NVL(RowQPAP.QPAH_RIRITU,0);
		OtStrSGendo(NumIdx) := NVL(RowQPAP.QPAH_SGENDO,0);
		OtStrKGendo(NumIdx) := NVL(RowQPAP.QPAH_KGENDO,0);
--ADD 20090329 0807073/0808052 NBC YOKOYAMA END

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--�v���V�[�W���̏I��
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt220;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt220%ISOPEN THEN
			CLOSE CurCEnt220;
		END IF;
		RAISE;

END	QPAP_CEnt220SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220DatAdd                                                                             */
/* �@�\          �F���̑��f�[�^�o�^����                                                                           */
/******************************************************************************************************************/
/* ���̑��f�[�^�o�^���� */
PROCEDURE QPAP_CEnt220DatAdd (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--���ʃR�[�h
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--���ʖ��̂m
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE           			--���ʖ��̂w
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE            		--����
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--�؏����x�z
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE         			--�������x�z
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT	 	CHAR) IS										--�f�[�^�d���t���O

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '1';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrCode;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt220DataChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt220DataChk(InStrCode);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  ���̑��f�[�^�o�^  */
	INSERT INTO QPAH_OTHERM VALUES (
		 InStrCode					        									--���ʃR�[�h
		,InStrNameN																--���ʖ��̂m
		,InStrNameX																--���ʖ��̂w
		,InStrRiritu															--����
		,InStrSGendo															--�؏����x�z
		,InStrKGendo);															--�������x�z


	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���̑��}�X�^�̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���̑��}�X�^�̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220DatUpd                                                                             */
/* �@�\          �F���̑��}�X�^�̍X�V                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220DatUpd (
	 InStrCode_B      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE           		--���ʃR�[�h�C���O
	,InStrCode_A      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE    		        --���ʃR�[�h�C����
	,InStrNameN			IN		QPAH_OTHERM.QPAH_NAMEN%TYPE						--���ʖ��̂m
	,InStrNameX			IN		QPAH_OTHERM.QPAH_NAMEX%TYPE          		 	--���ʖ��̂w
	,InStrRiritu    	IN      QPAH_OTHERM.QPAH_RIRITU%TYPE         			--����
	,InStrSGendo		IN		QPAH_OTHERM.QPAH_SGENDO%TYPE					--�؏����x�z
	,InStrKGendo		IN		QPAH_OTHERM.QPAH_KGENDO%TYPE        		 	--�������x�z
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2    									--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT		CHAR) IS										--�f�[�^�d���t���O

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	 R_Ans			  	BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrCode_A;											--�X�V�L�[

	OtStrDupF := '0';
	IF InStrCode_B <> InStrCode_A THEN
		/* QPAP_CEnt220DataChk�̌Ăяo�� */
		R_Ans := QPAP_CEnt220DataChk(InStrCode_A);
		IF R_Ans = TRUE THEN
			OtStrDupF := '1';
			RETURN;
		END IF;
	END IF;

	/* ���̑��}�X�^�̍X�V */
	UPDATE QPAH_OTHERM SET
		 	QPAH_PRMCODE 	=	InStrCode_A										--���ʃR�[�h�C����
			,QPAH_NAMEN		=	InStrNameN										--���ʖ��̂m
			,QPAH_NAMEX		=	InStrNameX										--���ʖ��̂w
			,QPAH_RIRITU	=	InStrRiritu										--����
			,QPAH_SGENDO	=	InStrSGendo										--�؏����x�z
			,QPAH_KGENDO	=	InStrKGendo										--�������x�z
	WHERE	QPAH_PRMCODE	= 	InStrCode_B;									--�X�V�L�[ ���ʃR�[�h�C���O

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���̑��}�X�^�̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '���̑��}�X�^�̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD,
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220Del                                                                                */
/* �@�\          �F���̑��}�X�^�̍폜                                                                             */
/******************************************************************************************************************/
/*���̑��f�[�^�폜���� */
PROCEDURE QPAP_CEnt220DatDel (
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE	        		--���ʃR�[�h
	,InStrMenuID	   	IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKBN	   	IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN		VARCHAR2) IS   									--�S�����i�I�y���O�p�j

	 numStep			NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr		        NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg				typMsg;
	 strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAH_OTHERM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '3';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrCode;											--�X�V�L�[

	/* ���̑��}�X�^�̍폜 */
	DELETE FROM    QPAH_OTHERM
	       WHERE   QPAH_PRMCODE = InStrCode;


	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���̑��}�X�^�̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt220OpeLog(	InStrMenuID,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j���̑��}�X�^�̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt220OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt220DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt22ODataChk     					                                   					  */
/* �@�\          �F���̑��}�X�^�ɓ����f�[�^�����邩�`�F�b�N����    			 	                      			  */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt220DataChk(
	 InStrCode      	IN      QPAH_OTHERM.QPAH_PRMCODE%TYPE)	      			--���ʃR�[�h
	 RETURN BOOLEAN IS

	OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAH_OTHERM
	WHERE	QPAH_PRMCODE = InStrCode;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;							--�o�^����Ă���
	ELSE
		RETURN  FALSE;							--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt220DataChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220OpeLog                                				        					  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                 			       			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt220OpeLog(
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
			RAISE;																/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt220OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220Lock                                                                               */
/* �@�\          �F���̑��}�X�^�̃��b�N                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* ���̑��}�X�^�̊m�F */
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
	WHEN W_HAITADUPLICATE THEN	--���̑��}�X�^��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt220Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--���̑��}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt220Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt220Lock;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt220UnLock                                                                             */
/* �@�\          �F���̑��}�X�^�̃��b�N����                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt220UnLock(
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

END QPAP_CEnt220UnLock;

END QPAP_CEnt220PkG;
/***END of LINE****************************************************************************************************/
/
show error
