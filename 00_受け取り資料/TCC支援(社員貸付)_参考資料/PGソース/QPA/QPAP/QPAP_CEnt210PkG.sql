CREATE OR REPLACE PACKAGE  QPAP_CEnt210PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt210PkG                                                                                */
/* �@�\          �F�Ј��}�X�^�����e�i���X                                                                         */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��  													                                                  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtSyainCD1Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyainCD2Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSimeiKanaAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANA%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSimeiKanjiAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtTozaiKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanCDAry IS TABLE OF QPAD_SYASEIM.QPAD_SEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSikakuCDAry IS TABLE OF QPAC_SYAINM.QPAC_SIKAKUCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtTokyuCDAry IS TABLE OF QPAC_SYAINM.QPAC_TOKYUCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBornYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtTaisyokuYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyusyoStAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	TYPE typOtKyusyoEdAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

	/* �R���{�X�R�[�h�E���̗p�z�� */
	TYPE typOtMiseCDListAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtMiseNMListAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
		INDEX BY BINARY_INTEGER;

	/* �R���{����R�[�h�E���̗p�z�� */
	TYPE typOtBumonCDListAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtBumonNMListAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
		INDEX BY BINARY_INTEGER;

	/* �R���{���Z�X�R�[�h�E���̗p�z�� */
	TYPE typOtSeisanCDListAry IS TABLE OF QPAG_SEISANM.QPAG_PRMSEISANCD%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSeisanNMListAry IS TABLE OF QPAG_SEISANM.QPAG_SEISANNM%TYPE
		INDEX BY BINARY_INTEGER;

/* �Ј��f�[�^�擾 */
PROCEDURE QPAP_CEnt210SelList (
	 InStrSyainCDF		IN      	CHAR										--�Ј��R�[�h2���̓t���O
    ,InStrMiseCDF       IN      	CHAR										--�����X�R�[�h���̓t���O
    ,InStrBumonCDF      IN     		CHAR										--��������R�[�h���̓t���O
    ,InStrSeisanCDF     IN      	CHAR										--���Z�X�R�[�h���̓t���O
    ,InStrTaiKyuKBNF    IN      	CHAR										--��/�x�敪���̓t���O
	,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�����p�Ј��R�[�h2
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--�����p�����X�R�[�h
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--�����p��������R�[�h
    ,InStrSeisanCD     	IN      	QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--�����p���Z�X�R�[�h
    ,InStrTaiKyuKBN    	IN      	CHAR										--�����p��/�x�敪
	,InNumMaxRec		IN			NUMBER										--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  	NUMBER										--�Ăяo����
	,OtStrSyainCD1     	OUT     	typOtSyainCD1Ary							--�Ј��R�[�h1
    ,OtStrSyainCD2     	OUT     	typOtSyainCD2Ary							--�Ј��R�[�h2
    ,OtStrSimeiKana    	OUT     	typOtSimeiKanaAry							--�����J�i
    ,OtStrSimeiKanji   	OUT     	typOtSimeiKanjiAry							--��������
    ,OtStrMiseCD       	OUT     	typOtMiseCDAry								--�����X�R�[�h
    ,OtStrMiseNM       	OUT     	typOtMiseNMAry								--��������
    ,OtStrTozaiKBN     	OUT     	typOtTozaiKBNAry							--�����敪
    ,OtStrBumonCD      	OUT     	typOtBumonCDAry								--��������R�[�h
    ,OtStrBumonNM      	OUT     	typOtBumonNMAry								--�������喼��
    ,OtStrSeisanCD     	OUT     	typOtSeisanCDAry     						--���Z�X�R�[�h
    ,OtStrSikakuCD     	OUT     	typOtSikakuCDAry							--���i�R�[�h
    ,OtStrTokyuCD      	OUT     	typOtTokyuCDAry								--�����R�[�h
    ,OtStrBornYMD      	OUT     	typOtBornYMDAry								--���N����
    ,OtStrTaisyokuYMD  	OUT     	typOtTaisyokuYMDAry							--�ސE�N����
    ,OtStrKyusyoStYMD  	OUT     	typOtKyusyoStAry							--�x�E�N���J�n��
    ,OtStrKyusyoEdYMD  	OUT     	typOtKyusyoEdAry							--�x�E�I���N����
	,OtNumAryCount	   	OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	   	OUT			VARCHAR2);									--�����I���t���O

/* �X�R�[�h�擾 */
 PROCEDURE QPAP_CEnt210MiseList (
	 InNumMaxRec		IN			NUMBER										--�ő�z��i�[����
    ,OtStrMiseCD       	OUT     	typOtMiseCDListAry							--�����X�R�[�h
    ,OtStrMiseNM       	OUT     	typOtMiseNMListAry							--��������
	,OtNumAryCount	   	OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	   	OUT			VARCHAR2);									--�����I���t���O

/* ����R�[�h�擾 */
 PROCEDURE QPAP_CEnt210BumonList (
     InStrMiseCD       	IN      	QPAE_MISEM.QPAE_PRMMISECD%TYPE				--�����p�����X�R�[�h
	,InNumMaxRec		IN			NUMBER										--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  	NUMBER										--�Ăяo����
    ,OtStrBumonCD       OUT     	typOtBumonCDListAry							--��������R�[�h
    ,OtStrBumonNM       OUT     	typOtBumonNMListAry							--�������喼��
	,OtNumAryCount	   	OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	   	OUT			VARCHAR2);									--�����I���t���O

/* ���Z�X�R�[�h�擾 */
 PROCEDURE QPAP_CEnt210SeisanList (
	 InNumMaxRec		IN			NUMBER										--�ő�z��i�[����
    ,OtStrSeisanCD     	OUT     	typOtSeisanCDListAry						--���Z�X�R�[�h
    ,OtStrSeisanNM     	OUT     	typOtSeisanNMListAry						--���Z�X����
	,OtNumAryCount	   	OUT			NUMBER										--�z��i�[����
	,OtStrEndFlg	   	OUT			VARCHAR2);									--�����I���t���O

/* �Ј��f�[�^�o�^���� */
PROCEDURE QPAP_CEnt210DatAdd (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�Ј��R�[�h1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�Ј��R�[�h2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--�����J�i
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--��������
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--�����X�R�[�h
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--�А��}�X�^�o�^�p���Z�R�[�h
	,InStrTozaiKBN     	IN	    	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--�����敪
    ,InStrBumonCD      	IN 		    QPAC_SYAINM.QPAC_BUMONCD%TYPE				--��������R�[�h
    ,InStrSikakuCD     	IN          QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--���i�R�[�h
    ,InStrTokyuCD      	IN          QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--�����R�[�h
    ,InStrBornYMD      	IN      	CHAR										--���N����
    ,InStrTaisyokuYMD  	IN      	CHAR										--�ސE�N����
    ,InStrKyusyoStYMD  	IN      	CHAR										--�x�E�N���J�n��
    ,InStrKyusyoEdYMD  	IN      	CHAR										--�x�E�I���N����
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT			CHAR);										--�f�[�^�d���t���O

/* �Ј��f�[�^�X�V���� */
PROCEDURE QPAP_CEnt210DatUpd (
	 InStrSyainCD1_B    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�C���O�Ј��R�[�h1
	,InStrSyainCD1_A    IN   	   	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�C����Ј��R�[�h1
    ,InStrSyainCD2_B    IN     	 	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�C���O�Ј��R�[�h2
    ,InStrSyainCD2_A    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�C����Ј��R�[�h2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--�����J�i
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--��������
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--�����X�R�[�h
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--�А��}�X�^�o�^�p���Z�R�[�h
    ,InStrTozaiKBN     	IN      	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--�����敪
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--��������R�[�h
    ,InStrSikakuCD     	IN      	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--���i�R�[�h
    ,InStrTokyuCD      	IN      	QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--�����R�[�h
    ,InStrBornYMD      	IN      	CHAR										--���N����
    ,InStrTaisyokuYMD  	IN      	CHAR										--�ސE�N����
    ,InStrKyusyoStYMD  	IN      	CHAR										--�x�E�N���J�n��
    ,InStrKyusyoEdYMD  	IN      	CHAR										--�x�E�I���N����
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT			CHAR);										--�f�[�^�d���t���O

/* �Ј��f�[�^�폜���� */
PROCEDURE QPAP_CEnt210DatDel (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�Ј��R�[�h1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�Ј��R�[�h2
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKbn	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
    ,InStrSeisanF     	IN     		CHAR);										--���Z�X�R�[�h

/* �Ј��}�X�^�ɓ����f�[�^���o�^����Ă��邩�`�F�b�N */
FUNCTION  QPAP_CEnt210DataChk(
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�Ј��R�[�h1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE)			--�Ј��R�[�h2
	 RETURN BOOLEAN;

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt210OpeLog(
	 InStrMenuID      	IN	 		QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleID    	IN	 		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserID  	  	IN	 		QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerNM 	IN	 		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTozaiKBN	  	IN	 		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCD	  	IN	 		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg	  		IN	 		QUS2_OpeLogT.QUS2_MSG%TYPE);	 			--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt210Lock(
	 InStrSikibetu		IN 			QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrProgramID		IN 			QSA4_HaitaT.QSA4_ProgramID%type				--�v���O�����h�c
	,InStrComputerNM	IN 			QSA4_HaitaT.QSA4_ComputerMei%type			--�R���s���[�^��
	,InStrOperatorID	IN 			QSA4_HaitaT.QSA4_OperatorID%type);			--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt210UnLock(
	 InStrSikibetu		IN 			QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrComputerNM	IN 			QSA4_HaitaT.QSA4_ComputerMei%type);			--�R���s���[�^�[��

END QPAP_CEnt210PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[  												                                                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt210PkG IS
	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	   RECORD (
		fldTableID	       	CHAR(19),											/* �e�[�u����   */
		fldKousinKBN	  	CHAR(1),		        							/* �X�V�敪     */
		fldAcsKey	   		CHAR(50),											/* �A�N�Z�X�L�[ */
		fldMsg		   		CHAR(100)											/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/* �����������̂݊J������J�[�\�� */
	CURSOR CurCEnt210_M IS
		SELECT	 QPAE_PRMMISECD,QPAE_MISENM
		FROM	 QPAE_MISEM
		ORDER BY QPAE_PRMMISECD;

	CURSOR CurCEnt210_S IS
		SELECT	 QPAG_PRMSEISANCD,QPAG_SEISANNM
		FROM	 QPAG_SEISANM
		ORDER BY QPAG_PRMSEISANCD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210SelList                                                                            */
/* �@�\          �F�Ј��f�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210SelList (
	 InStrSyainCDF		IN      CHAR											--�Ј��R�[�h2���̓t���O
    ,InStrMiseCDF       IN      CHAR											--�����X�R�[�h���̓t���O
    ,InStrBumonCDF      IN      CHAR											--��������R�[�h���̓t���O
    ,InStrSeisanCDF     IN      CHAR											--���Z�X�R�[�h���̓t���O
    ,InStrTaiKyuKBNF    IN      CHAR											--��/�x�敪���̓t���O
	,InStrSyainCD2     	IN      QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE				--�����p�Ј��R�[�h2
    ,InStrMiseCD       	IN      QPAC_SYAINM.QPAC_MISECD%TYPE					--�����p�����X�R�[�h
    ,InStrBumonCD      	IN      QPAC_SYAINM.QPAC_BUMONCD%TYPE					--�����p��������R�[�h
    ,InStrSeisanCD     	IN      QPAD_SYASEIM.QPAD_SEISANCD%TYPE					--�����p���Z�X�R�[�h
    ,InStrTaiKyuKBN    	IN      CHAR											--�����p��/�x�敪
	,InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  NUMBER											--�Ăяo����
	,OtStrSyainCD1     	OUT     typOtSyainCD1Ary								--�Ј��R�[�h1
    ,OtStrSyainCD2     	OUT     typOtSyainCD2Ary								--�Ј��R�[�h2
    ,OtStrSimeiKana    	OUT     typOtSimeiKanaAry								--�����J�i
    ,OtStrSimeiKanji   	OUT     typOtSimeiKanjiAry								--��������
    ,OtStrMiseCD       	OUT     typOtMiseCDAry									--�����X�R�[�h
    ,OtStrMiseNM       	OUT     typOtMiseNMAry									--��������
    ,OtStrTozaiKBN     	OUT     typOtTozaiKBNAry								--�����敪
    ,OtStrBumonCD      	OUT     typOtBumonCDAry									--��������R�[�h
    ,OtStrBumonNM      	OUT     typOtBumonNMAry									--�������喼��
    ,OtStrSeisanCD     	OUT     typOtSeisanCDAry     							--���Z�X�R�[�h
    ,OtStrSikakuCD     	OUT     typOtSikakuCDAry								--���i�R�[�h
    ,OtStrTokyuCD      	OUT     typOtTokyuCDAry									--�����R�[�h
    ,OtStrBornYMD      	OUT     typOtBornYMDAry									--���N����
    ,OtStrTaisyokuYMD  	OUT     typOtTaisyokuYMDAry								--�ސE�N����
    ,OtStrKyusyoStYMD  	OUT     typOtKyusyoStAry								--�x�E�N���J�n��
    ,OtStrKyusyoEdYMD  	OUT     typOtKyusyoEdAry								--�x�E�I���N����
	,OtNumAryCount	   	OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;													--�z��pIDX
	NumFetchCnt			NUMBER;													--FETCH�J�E���g
	v_CursorID			INTEGER;												--�J�[�\��ID
	v_SelectStmt		VARCHAR2(1000);											--SQL������
	v_WhereStmt			VARCHAR2(500);											--SQL������
	v_SyainCD1     		QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE;						--�o�C���h�p�Ј��R�[�h1
	v_SyainCD2     		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE;						--�o�C���h�p�Ј��R�[�h2
	v_SimeiKana    		QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;						--�o�C���h�p�����J�i
	v_SimeiKanji   		QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;						--�o�C���h�p��������
	v_MiseCD       		QPAC_SYAINM.QPAC_MISECD%TYPE;							--�o�C���h�p�����X�R�[�h
	v_MiseNM			QPAE_MISEM.QPAE_MISENM%TYPE;							--�o�C���h�p�����X����
	v_TozaiKBN     		QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;							--�o�C���h�p�����敪
	v_BumonCD      		QPAC_SYAINM.QPAC_BUMONCD%TYPE;							--�o�C���h�p��������R�[�h
    v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--�o�C���h�p�������喼��
	v_SeisanCD      	QPAD_SYASEIM.QPAD_SEISANCD%TYPE;      					--�o�C���h�p���Z�X�R�[�h
	v_SikakuCD     		QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;							--�o�C���h�p���i�R�[�h
	v_TokyuCD      		QPAC_SYAINM.QPAC_TOKYUCD%TYPE;							--�o�C���h�p�����R�[�h
	v_BornYMD      		CHAR(8);												--�o�C���h�p���N����
	v_TaisyokuYMD  		CHAR(8);												--�o�C���h�p�ސE�N����
	v_KyusyoStYMD  		CHAR(8);												--�o�C���h�p�x�E�N���J�n��
	v_KyusyoEdYMD  		CHAR(8);												--�o�C���h�p�x�E�I���N����
	v_Dummy				INTEGER;												--Dummy


BEGIN

	NumIdx		:= 0;
	OtstrEndFlg	:= '0';

	IF IoNumSpCnt = 0 THEN
		--�������Ɏg�p����J�[�\�����I�[�v������
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--�⍇��������̍쐬
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  C.QPAC_PRMSYAINCD1,C.QPAC_PRMSYAINCD2,C.QPAC_SIMEIKANA,
					              C.QPAC_SIMEIKANJI,C.QPAC_MISECD,E.QPAE_MISENM,C.QPAC_TOZAIKBN,
					              C.QPAC_BUMONCD,F.QPAF_BUMONNM,D.QPAD_SEISANCD,C.QPAC_SIKAKUCD,
					              C.QPAC_TOKYUCD,TO_CHAR(C.QPAC_BORNYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD''),
					              TO_CHAR(C.QPAC_KYUSYOEDYMD,''YYYYMMDD'')
				 		 FROM 	  QPAC_SYAINM C,QPAD_SYASEIM D,QPAE_MISEM E,QPAF_BUMONM F
				         WHERE    C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)
				         AND      C.QPAC_MISECD  = F.QPAF_PRMMISECD (+)
				         AND      C.QPAC_MISECD  = E.QPAE_PRMMISECD (+)
				         AND      C.QPAC_PRMSYAINCD1 = D.QPAD_PRMSYAINCD1 (+)
				         AND      C.QPAC_PRMSYAINCD2 = D.QPAD_PRMSYAINCD2 (+)';

		 --�����̘A��
	    v_WhereStmt := NULL;

		IF InStrSyainCDF = '1' THEN
			v_WhereStmt := ' AND C.QPAC_PRMSYAINCD2 = :SyainCD2';
		END IF;

		IF InStrMiseCDF = '1' THEN
			v_WhereStmt := v_WhereStmt || ' AND C.QPAC_MISECD = :MiseCD';
		END IF;

		IF InStrBumonCDF = '1' THEN
			v_WhereStmt :=  v_WhereStmt || ' AND C.QPAC_BUMONCD = :BumonCD';
		END IF;

		IF InStrSeisanCDF = '1' THEN
			v_WhereStmt := v_WhereStmt || ' AND D.QPAD_SEISANCD = :SeisanCD';
		END IF;

		IF InStrTaiKyuKBNF = '1' THEN
			IF InStrTaiKyuKBN = '0' THEN						--�ސE
				v_WhereStmt := v_WhereStmt || ' AND (C.QPAC_TAISYOKUYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') <> :TaikyuKBN)';
			ELSIF InStrTaiKyuKBN = '1' THEN						--�x�E
				v_WhereStmt := v_WhereStmt || ' AND (C.QPAC_KYUSYOSTYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD'') <> :TaikyuKBN)';
			ELSIF InStrTaiKyuKBN = '2' THEN						--�ދx�E
				v_WhereStmt := v_WhereStmt || ' AND ((C.QPAC_TAISYOKUYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') <> :TaikyuKBN)';
				v_WhereStmt := v_WhereStmt || ' OR (C.QPAC_KYUSYOSTYMD IS NOT NULL';
				v_WhereStmt := v_WhereStmt || ' OR TO_CHAR(C.QPAC_KYUSYOSTYMD,''YYYYMMDD'') <> :TaikyuKBN))';
			END IF;
		END IF;
		v_WhereStmt := v_WhereStmt || ' ORDER BY C.QPAC_PRMSYAINCD2';
		v_SelectStmt := v_SelectStmt || v_WhereStmt;

		/* �f�[�^�̎擾 */
		--�������Ɏg�p����J�[�\�����I�[�v������
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--�⍇������͂���
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--���͕ϐ����o�C���h����
		IF InStrSyainCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyainCD2',InStrSyainCD2);
		END IF;

		IF InStrMiseCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':MiseCD',InStrMiseCD);
		END IF;

		IF InStrBumonCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':BumonCD',InStrBumonCD);
		END IF;

		IF InStrSeisanCDF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':SeisanCD',InStrSeisanCD);
		END IF;

		IF InStrTaiKyuKBNF = '1' THEN
			DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaikyuKBN','');
		END IF;

		--���s����
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;
	IoNumSpCnt := v_CursorID;

	--�o�͕ϐ����`����
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SimeiKana,15);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_SimeiKanji,20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SeisanCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SikakuCD,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_TokyuCD,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_BornYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_TaisyokuYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_KyusyoStYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_KyusyoEdYMD,8);

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
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SimeiKana);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_SimeiKanji);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SeisanCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SikakuCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_TokyuCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_BornYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_TaisyokuYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_KyusyoStYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_KyusyoEdYMD);

		OtStrSyainCD1(NumIdx)    := NVL(v_SyainCD1,' ');
		OtStrSyainCD2(NumIdx)    := NVL(v_SyainCD2,' ');
		OtStrSimeiKana(NumIdx)   := NVL(v_SimeiKana,' ');
		OtStrSimeiKanji(NumIdx)  := NVL(v_SimeiKanji,' ');
		OtStrMiseCD(NumIdx)      := NVL(v_MiseCD,' ');
		OtStrMiseNM(NumIdx)      := NVL(v_MiseNM,' ');
		OtStrTozaiKBN(NumIdx)    := NVL(v_TozaiKBN,' ');
		OtStrBumonCD(NumIdx)     := NVL(v_BumonCD,' ');
		OtStrBumonNM(NumIdx)     := NVL(v_BumonNM,' ');
		OtStrSeisanCD(NumIdx)    := NVL(v_SeisanCD,' ');
		OtStrSikakuCD(NumIdx)    := NVL(v_SikakuCD,' ');
		OtStrTokyuCD(NumIdx)     := NVL(v_TokyuCD,' ');
		OtStrBornYMD(NumIdx)     := NVL(v_BornYMD,' ');
		OtStrTaisyokuYMD(NumIdx) := NVL(v_TaisyokuYMD,' ');
		OtStrKyusyoStYMD(NumIdx) := NVL(v_KyusyoStYMD,' ');
		OtStrKyusyoEdYMD(NumIdx) := NVL(v_KyusyoEdYMD,' ');

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
		RAISE;

END	QPAP_CEnt210SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210MiseList                                                                           */
/* �@�\          �F�X�R�[�h�擾����                                                                               */
/******************************************************************************************************************/
/* �X�R�[�h�擾 */
 PROCEDURE QPAP_CEnt210MiseList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
    ,OtStrMiseCD       	OUT     typOtMiseCDListAry								--�����X�R�[�h
    ,OtStrMiseNM       	OUT     typOtMiseNMListAry								--��������
	,OtNumAryCount	   	OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;

	/* �s�ϐ� */
	RowQPAP				CurCEnt210_M%ROWTYPE;
BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	--�J�[�\���I�[�v��
	IF CurCEnt210_M%ISOPEN = FALSE THEN
		OPEN CurCEnt210_M();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt210_M INTO RowQPAP;										--���ǂ�

		IF CurCEnt210_M%NOTFOUND THEN
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
			RETURN;																--�v���V�[�W���̏I��
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt210_M;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt210_M%ISOPEN THEN
			CLOSE CurCEnt210_M;
		END IF;
		RAISE;
END	QPAP_CEnt210MiseList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210BumonList                                                                          */
/* �@�\          �F����R�[�h�擾����                                                                             */
/******************************************************************************************************************/
 PROCEDURE QPAP_CEnt210BumonList (
     InStrMiseCD       	IN      QPAE_MISEM.QPAE_PRMMISECD%TYPE					--�����p�����X�R�[�h
	,InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,IoNumSpCnt	   		IN OUT  NUMBER											--�Ăяo����
    ,OtStrBumonCD       OUT     typOtBumonCDListAry								--��������R�[�h
    ,OtStrBumonNM       OUT     typOtBumonNMListAry								--�������喼��
	,OtNumAryCount	   	OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;													--�z��pIDX
	v_CursorID			INTEGER;												--�J�[�\��ID
	v_SelectStmt		VARCHAR2(1000);											--SQL������
	v_MiseCD       		QPAC_SYAINM.QPAC_MISECD%TYPE;							--�o�C���h�p�����X�R�[�h
	v_BumonCD      		QPAC_SYAINM.QPAC_BUMONCD%TYPE;							--�o�C���h�p��������R�[�h
    v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;							--�o�C���h�p�������喼��
	v_Dummy				INTEGER;												--Dummy

BEGIN

	NumIdx		 := 0;
	OtstrEndFlg	 := '0';

	IF IoNumSpCnt = 0 THEN
		--�������Ɏg�p����J�[�\�����I�[�v������
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--�⍇��������̍쐬
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  QPAF_PRMBUMONCD,QPAF_BUMONNM
				 FROM 	  QPAF_BUMONM
				 WHERE    QPAF_PRMMISECD = :MiseCD';

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

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--�v���V�[�W���̏I��
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE;

END	QPAP_CEnt210BumonList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210SeisanList                                                                         */
/* �@�\          �F���Z�X�R�[�h�擾����                                                                           */
/******************************************************************************************************************/
/* ���Z�X�R�[�h�擾 */
 PROCEDURE QPAP_CEnt210SeisanList (
	 InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
    ,OtStrSeisanCD      OUT     typOtSeisanCDListAry							--���Z�X�R�[�h
    ,OtStrSeisanNM      OUT     typOtSeisanNMListAry							--���Z�X����
	,OtNumAryCount	   	OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg	   	OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;

	/* �s�ϐ� */
	RowQPAP				CurCEnt210_S%ROWTYPE;
BEGIN

	OtstrEndFlg := '0';
	NumIdx := 0;

	--�J�[�\���I�[�v��
	IF CurCEnt210_S%ISOPEN = FALSE THEN
		OPEN CurCEnt210_S();
	END IF;

	--�e�d�s�b�g
	LOOP
		NumIdx := NumIdx + 1;

		/* 100���Ƃ̃f�[�^���擾 */
		FETCH CurCEnt210_S INTO RowQPAP;										--���ǂ�

		IF CurCEnt210_S%NOTFOUND THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';													--�����I��
			EXIT;
		END IF;

		/* �擾�f�[�^��z��ɑ��*/
		OtStrSeisanCD(NumIdx)  := RowQPAP.QPAG_PRMSEISANCD;
		OtStrSeisanNM(NumIdx)  := RowQPAP.QPAG_SEISANNM;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx THEN
			OtNumAryCount := NumIdx;
			RETURN;																--�v���V�[�W���̏I��
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt210_S;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt210_S%ISOPEN THEN
			CLOSE CurCEnt210_S;
		END IF;
		RAISE;
END	QPAP_CEnt210SeisanList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210DatAdd                                                                             */
/* �@�\          �F�Ј��f�[�^�o�^����                                                                             */
/******************************************************************************************************************/
/* �Ј��f�[�^�o�^���� */
PROCEDURE QPAP_CEnt210DatAdd (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�Ј��R�[�h1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�Ј��R�[�h2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--�����J�i
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--��������
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--�����X�R�[�h
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--�А��}�X�^�o�^�p���Z�R�[�h
	,InStrTozaiKBN     	IN	    	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--�����敪
    ,InStrBumonCD      	IN 		    QPAC_SYAINM.QPAC_BUMONCD%TYPE				--��������R�[�h
    ,InStrSikakuCD     	IN          QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--���i�R�[�h
    ,InStrTokyuCD      	IN          QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--�����R�[�h
    ,InStrBornYMD      	IN      	CHAR										--���N����
    ,InStrTaisyokuYMD  	IN      	CHAR										--�ސE�N����
    ,InStrKyusyoStYMD  	IN      	CHAR										--�x�E�N���J�n��
    ,InStrKyusyoEdYMD  	IN      	CHAR										--�x�E�I���N����
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT			CHAR) IS									--�f�[�^�d���t���O

	numStep				NUMBER   := 0;											/* �����X�e�b�v  */
	numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	strErrMsg			VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	recMsg				typMsg;
	strLogMsg			QUS2_OpeLogT.QUS2_MSG%TYPE;
	R_Ans			  	BOOLEAN;

BEGIN

	/* �I�y���[�V�������O�ݒ� */
	 recMsg.fldTableID := 'QPAC_SYAINM';		    							--�e�[�u����
	 recMsg.fldKousinKBN := '1';												--�X�V�敪
	 recMsg.fldAcsKey := InStrSyainCD2;											--�X�V�L�[

	OtStrDupF := '0';
	/* QPAP_CEnt210DataChk�̌Ăяo�� */
	R_Ans := QPAP_CEnt210DataChk(InStrSyainCD1,InStrSyainCD2);
	IF R_Ans = TRUE THEN
		OtStrDupF := '1';
		RETURN;
	END IF;

	/*  �Ј��f�[�^�o�^�i�Ј��}�X�^�j  */
	INSERT INTO QPAC_SYAINM VALUES (
		 InStrSyainCD1															--�Ј��R�[�h1
        ,InStrSyainCD2															--�Ј��R�[�h2
        ,InStrSimeiKana															--�����J�i
        ,InStrSimeiKanji														--��������
        ,InStrMiseCD															--�����X�R�[�h
        ,InStrTozaiKBN															--�����敪
        ,InStrBumonCD															--��������R�[�h
        ,InStrSikakuCD															--���i�R�[�h
        ,InStrTokyuCD															--�����R�[�h
        ,InStrBornYMD															--���N����
        ,InStrTaisyokuYMD														--�ސE�N����
        ,InStrKyusyoStYMD														--�x�E�N���J�n��
        ,InStrKyusyoEdYMD);														--�x�E�I���N����

	/*  ���Z�R�[�h�o�^�i�А��}�X�^�j  */
	INSERT INTO QPAD_SYASEIM VALUES (
		 InStrSyainCD1															--�Ј��R�[�h1
	    ,InStrSyainCD2															--�Ј��R�[�h2
	    ,InStrSeisanCD);														--���Z�R�[�h


/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̓o�^�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrOpeTozaiKBN,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrOpeTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210DatUpd                                                                             */
/* �@�\          �F�Ј��}�X�^�̍X�V                                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210DatUpd (
	 InStrSyainCD1_B    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�C���O�Ј��R�[�h1
	,InStrSyainCD1_A    IN   	   	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�C����Ј��R�[�h1
    ,InStrSyainCD2_B    IN     	 	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�C���O�Ј��R�[�h2
    ,InStrSyainCD2_A    IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�C����Ј��R�[�h2
    ,InStrSimeiKana    	IN      	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE				--�����J�i
    ,InStrSimeiKanji   	IN      	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE			--��������
    ,InStrMiseCD       	IN      	QPAC_SYAINM.QPAC_MISECD%TYPE				--�����X�R�[�h
    ,InStrSeisanCD		IN			QPAD_SYASEIM.QPAD_SEISANCD%TYPE				--�А��}�X�^�o�^�p���Z�R�[�h
    ,InStrTozaiKBN     	IN      	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE				--�����敪
    ,InStrBumonCD      	IN      	QPAC_SYAINM.QPAC_BUMONCD%TYPE				--��������R�[�h
    ,InStrSikakuCD     	IN      	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE				--���i�R�[�h
    ,InStrTokyuCD      	IN      	QPAC_SYAINM.QPAC_TOKYUCD%TYPE				--�����R�[�h
    ,InStrBornYMD      	IN      	CHAR										--���N����
    ,InStrTaisyokuYMD  	IN      	CHAR										--�ސE�N����
    ,InStrKyusyoStYMD  	IN      	CHAR										--�x�E�N���J�n��
    ,InStrKyusyoEdYMD  	IN      	CHAR										--�x�E�I���N����
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrOpeTozaiKBN	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
	,OtStrDupF	  		OUT			CHAR) IS									--�f�[�^�d���t���O

	numStep		        NUMBER   := 0;											/* �����X�e�b�v  */
	numErr			    NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	strErrMsg		    VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	recMsg			    typMsg;
	strLogMsg		    QUS2_OpeLogT.QUS2_MSG%TYPE;
    CNT					NUMBER := 0;
	R_Ans			  	BOOLEAN;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAC_SYAINM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSyainCD2_A;										--�X�V�L�[

	IF InStrSyainCD1_A <> InStrSyainCD1_B THEN
		IF InStrSyainCD2_A <> InStrSyainCD2_B THEN
			/* QPAP_CEnt210DataChk�̌Ăяo�� */
			R_Ans := QPAP_CEnt210DataChk(InStrSyainCD1_A,InStrSyainCD2_A);
			IF R_Ans = TRUE THEN
				OtStrDupF := '1';
				RETURN;
			END IF;
		END IF;
	END IF;

	/* �Ј��}�X�^�̍X�V�i�Ј��}�X�^�j */
	UPDATE QPAC_SYAINM SET
		 	QPAC_PRMSYAINCD1	=	InStrSyainCD1_A								--�Ј��R�[�h1
        	,QPAC_PRMSYAINCD2	=	InStrSyainCD2_A								--�Ј��R�[�h2
	        ,QPAC_SIMEIKANA		=	InStrSimeiKana								--�����J�i
	        ,QPAC_SIMEIKANJI	=	InStrSimeiKanji								--��������
	        ,QPAC_MISECD		=	InStrMiseCD									--�����X�R�[�h
	        ,QPAC_TOZAIKBN		=	InStrTozaiKBN								--�����敪
	        ,QPAC_BUMONCD		= 	InStrBumonCD								--��������R�[�h
	        ,QPAC_SIKAKUCD		=	InStrSikakuCD								--���i�R�[�h
	        ,QPAC_TOKYUCD		=	InStrTokyuCD      							--�����R�[�h
	        ,QPAC_BORNYMD		=	InStrBornYMD								--���N����
	        ,QPAC_TAISYOKUYMD	=	InStrTaisyokuYMD							--�ސE�N����
	        ,QPAC_KYUSYOSTYMD	=	InStrKyusyoStYMD							--�x�E�N���J�n��
	        ,QPAC_KYUSYOEDYMD	=	InStrKyusyoEdYMD							--�x�E�I���N����
	WHERE	 QPAC_PRMSYAINCD1	= 	InStrSyainCD1_B								--�X�V�L�[ �X�R�[�h,����R�[�h
	AND      QPAC_PRMSYAINCD2   =   InStrSyainCD2_B;

	SELECT
		COUNT(*)
	INTO
		CNT
	FROM	QPAD_SYASEIM
	WHERE	QPAD_PRMSYAINCD1	=	InStrSyainCD1_B
	AND	QPAD_PRMSYAINCD2	=	InStrSyainCD2_B;

	IF CNT = 0 THEN
		/*  ���Z�R�[�h�o�^�i�А��}�X�^�j�V�K  */
		INSERT INTO QPAD_SYASEIM VALUES (
		 	InStrSyainCD1_A														--�Ј��R�[�h1
	        ,InStrSyainCD2_A													--�Ј��R�[�h2
	        ,InStrSeisanCD);													--���Z�R�[�h
	ELSE
		/*  ���Z�R�[�h�o�^�i�А��}�X�^�j�ύX  */
		UPDATE QPAD_SYASEIM SET
			 	QPAD_PRMSYAINCD1	=	InStrSyainCD1_A							--�Ј��R�[�h1
				,QPAD_PRMSYAINCD2	=	InStrSyainCD2_A							--�Ј��R�[�h2
		        ,QPAD_SEISANCD		=	InStrSeisanCD							--���Z�R�[�h
		WHERE	QPAD_PRMSYAINCD1	= 	InStrSyainCD1_B							--�X�V�L�[ �X�R�[�h,����R�[�h
		AND     QPAD_PRMSYAINCD2    =   InStrSyainCD2_B;
	END IF;

	/*  �I�y���O */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrOpeTozaiKBN,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrOpeTozaiKBN,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210Del                                                                                */
/* �@�\          �F�Ј��}�X�^�̍폜                                                                               */
/******************************************************************************************************************/
/*�Ј��f�[�^�폜���� */
PROCEDURE QPAP_CEnt210DatDel (
	 InStrSyainCD1     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE			--�Ј��R�[�h1
    ,InStrSyainCD2     	IN      	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE			--�Ј��R�[�h2
	,InStrMenuID	   	IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[ID�i�I�y���O�p�j
	,InStrModuleID	   	IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--���W���[��ID�i�I�y���O�p�j
	,InStrUserID  	  	IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c�i�I�y���O�p�j
	,InStrComputerNM  	IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^���i�I�y���O�p�j
	,InStrTozaiKbn	   	IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--���p�敪�i�I�y���O�p�j
	,InStrBushoCD	  	IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM	   	IN			VARCHAR2    								--�S�����i�I�y���O�p�j
    ,InStrSeisanF     	IN     		CHAR) IS									--���Z�X�R�[�h

	 numStep		    NUMBER   := 0;											/* �����X�e�b�v  */
	 numErr				NUMBER   := 0;											/* SQLCODE�̑ޔ� */
	 strErrMsg		  	VARCHAR2(100);											/* SQLERRM�̑ޔ� */
	 recMsg			   	typMsg;
	 strLogMsg		  	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPAC_SYAINM';										--�e�[�u����
	recMsg.fldKousinKBN	:= '3';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSyainCD2;										--�X�V�L�[

	/* �Ј��}�X�^�̍폜 */
	DELETE FROM QPAC_SYAINM
		WHERE	QPAC_PRMSYAINCD1 = InStrSyainCD1
		  AND	QPAC_PRMSYAINCD2 = InStrSyainCD2;

	IF InStrSeisanF <> '0' THEN
		/* �А��}�X�^�̍폜 */
		DELETE FROM QPAD_SYASEIM
			WHERE	QPAD_PRMSYAINCD1 = InStrSyainCD1
			AND	QPAD_PRMSYAINCD2 = InStrSyainCD2;
	END IF;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKBN
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt210OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrTozaiKbn,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�Ј��}�X�^�̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKBN
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt210OpeLog(	InStrMenuID,
								InStrModuleID,
								InStrUserID,
								InStrComputerNM,
								InStrTozaiKbn,
								InStrBushoCD, 
								strLogMsg);
		END IF;
		RAISE;
END	QPAP_CEnt210DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt21ODataChk                                        					                  */
/* �@�\          �F�Ј��}�X�^�ɓ����f�[�^�����邩�`�F�b�N����     	                      			              */
/******************************************************************************************************************/
FUNCTION  QPAP_CEnt210DataChk(
	 InStrSyainCD1     	IN      QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE	         	--�Ј��R�[�h1
     ,InStrSyainCD2     IN      QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE)				--�Ј��R�[�h2
	 RETURN BOOLEAN IS

	OtNumRecCount			NUMBER;

BEGIN
	OtNumRecCount := 0;

	--SP�ďo �J�[�\���ݒ�
	SELECT
		COUNT(*)
	INTO
		OtNumRecCount
	FROM	QPAC_SYAINM
	WHERE	QPAC_PRMSYAINCD1 = InStrSyainCD1
	AND     QPAC_PRMSYAINCD2 = InStrSyainCD2;

	IF  OtNumRecCount  > 0 THEN
		RETURN  TRUE;															--�o�^����Ă���
	ELSE
		RETURN  FALSE;															--�o�^����Ă��Ȃ�
	END IF;

END	QPAP_CEnt210DataChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210OpeLog                                                       					  */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                  			  */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt210OpeLog(
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
			RAISE;		/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt210OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210Lock                                                                               */
/* �@�\          �F�Ј��}�X�^�̃��b�N                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �Ј��}�X�^�̊m�F */
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
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt210Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--����}�X�^�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt210Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt210Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt210UnLock                                                                             */
/* �@�\          �F����}�X�^�̃��b�N����                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt210UnLock(
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

END QPAP_CEnt210UnLock ;

END QPAP_CEnt210PkG;
/***END of LINE/**************************************************************************************************/
/
show error
