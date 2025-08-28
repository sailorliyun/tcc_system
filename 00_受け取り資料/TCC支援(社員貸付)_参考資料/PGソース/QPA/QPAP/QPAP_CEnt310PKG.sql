CREATE  OR REPLACE PACKAGE  QPAP_CEnt310PkG IS
/*****************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt310PkG                                                                                */
/* �@�\          �F�����ݕt�f�[�^�o�^                                                                             */
/* �쐬��        �F2002/12/09                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
--                           0808052�FTCC�x���V�X�e���̍č\�z
--                             �E�A�v���P�[�V�����ڍs�Ή�
--                               QPAP_CEnt310SelList �ϐ��̑傫�����C��
------------------------------------------------------------------------------------------------
/*****************************************************************************************************************/
/*�P  �錾��								                                          							  */
/*****************************************************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtDataAry IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;

/* ���������i�V�X�e�����t�擾�j*/
PROCEDURE QPAP_CEnt310Init (
	OtStrSysDate	OUT	VARCHAR2);										--�T�[�o�[�r�x�r�s�d�l���t

/* �����Z���䒠�e�[�u�����݃`�F�b�N */
PROCEDURE QPAP_Cent310KgcDaicyoChk (
	InStrSyainCD		IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE,	--�Ј��R�[�h
	OtNumRecCount		OUT		NUMBER);								--����������

/* �����Z���e�[�u�����݃`�F�b�N */

PROCEDURE QPAP_Cent310KgcKasitukeTChk (
	InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE,	--�Ј��R�[�h
	InStrTorihikiYMD	IN		CHAR,									--�ݕt���t
	InStrTorihikiHMS	IN		VARCHAR2,								--�ݕt����
	InStrKingaku		IN		VARCHAR2,								--���z
	InStrTourokuYMD		IN		CHAR,									--�o�^���t
	InNumExecNo			IN		NUMBER,									--���s�t���O�i�O=�o�^���A�P=���[���j
	OtNumRecCount		OUT		NUMBER);								--����������

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent310SelSyainZoku (
	InStrPRMSyainCD1	IN		QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--�Ј��R�[�h�P
	InStrPRMSyainCD2	IN		QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--�Ј��R�[�h�Q
	OtStrSimeiKana		OUT		QPAC_SyainM.QPAC_SimeiKana%TYPE,		--�����J�i
	OtStrSimeiKanji		OUT		QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--��������
	OtStrMiseCD			OUT		QPAC_SyainM.QPAC_MiseCD%TYPE,			--�����X�R�[�h
	OtStrMiseName		OUT		QPAE_MiseM.QPAE_MiseNm%TYPE,			--�X����
	OtStrTozaiKBN		OUT		QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--�����敪
	OtStrBumonCD		OUT		QPAC_SyainM.QPAC_BumonCD%TYPE,			--��������R�[�h
	OtStrBumonName		OUT		QPAF_BumonM.QPAF_BumonNm%TYPE,			--���喼��
	OtStrSikakuCD		OUT		QPAC_SyainM.QPAC_SikakuCD%TYPE,			--���i�R�[�h
	OtStrTokyuCD		OUT		QPAC_SyainM.QPAC_TokyuCD%TYPE,			--�����R�[�h
	OtStrBornYMD		OUT		VARCHAR2,								--���N����
	OtStrTaisyokuYMD	OUT		VARCHAR2,								--�ސE����
	OtStrKyusyoSTYMD	OUT		VARCHAR2,								--�x�E�J�n����
	OtStrKyusyoEDYMD	OUT		VARCHAR2,								--�x�E�I������
	OtStrSonzaiFlg		OUT		VARCHAR2);								--����Flg (����̑��� Check)

/* �ݕt�f�[�^�擾 */
PROCEDURE QPAP_CEnt310SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE		--���o�L�[  �Ј��R�[�h
	,InNumMaxRec		IN		NUMBER									--�ő�z��i�[����
	,IoNumCursor		IN	OUT	NUMBER									--�J�[�\���h�c
	,OtStrDataAry		OUT		typOtDataAry							--�ݕt�f�[�^
	,OtNumRecCount		OUT		NUMBER									--����������
	,OtNumAryCount		OUT		NUMBER									--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);								--�����I���t���O

/* �ݕt�f�[�^�o�^ */
PROCEDURE QPAP_CEnt310Ins (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR										--������t
	,InStrTorihikiHMS	IN		VARCHAR2									--�������
	,InStrKingaku		IN		VARCHAR2									--���z
	,InStrTourokuID		IN		QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE			--�o�^ID
	,InStrMiseCd		IN		QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE		--�Ǘ��X�R�[�h
	,INSTRMENUID		IN		VARCHAR2									--���j���[ID		�I�y���O�p
	,InStrModuleID		IN		VARCHAR2									--���W���[��ID		�I�y���O�p
	,InStrUserID		IN		VARCHAR2									--�o�^�S����ID		�I�y���O�p
	,InStrTantoNM		IN		VARCHAR2									--�o�^�S����		�I�y���O�p
	,InStrComputerNM	IN		VARCHAR2									--�R���s���[�^�[��	�I�y���O�p
	,InStrRiyouKBN		IN		VARCHAR2									--���p�敪			�I�y���O�p
	,InstrBushoCD		IN		VARCHAR2									--�����R�[�h		�I�y���O�p
);

/* �ݕt�f�[�^�폜 */
PROCEDURE QPAP_CEnt310Del (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR										--������t
	,InStrTorihikiHMS	IN		VARCHAR2									--�������
	,InStrKingaku		IN		VARCHAR2									--���z
	,INSTRMENUID		IN		VARCHAR2									--���j���[ID		�I�y���O�p
	,InStrModuleID		IN		VARCHAR2									--���W���[��ID		�I�y���O�p
	,InStrUserID		IN		VARCHAR2									--�o�^�S����ID		�I�y���O�p
	,InStrTantoNM		IN		VARCHAR2									--�o�^�S����		�I�y���O�p
	,InStrComputerNM	IN		VARCHAR2									--�R���s���[�^�[��	�I�y���O�p
	,InStrRiyouKBN		IN		VARCHAR2									--���p�敪			�I�y���O�p
	,InstrBushoCD		IN		VARCHAR2									--�����R�[�h		�I�y���O�p
);

/* �Ɩ��r������ */
/* �I�y���O�쐬 */
PROCEDURE  QPAP_CEnt310OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE);				--���b�Z�[�W

/* ���b�N */
PROCEDURE QPAP_CEnt310Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--���ʃR�[�h
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%TYPE			--�Ј��R�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%TYPE				--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%TYPE			--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%TYPE);			--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt310UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--���ʃR�[�h
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%TYPE);			--�R���s���[�^�[��

END QPAP_CEnt310PkG;
/
SHOW ERROR

/*****************************************************************************************************************/
/*	�Q  �{�f�B�[							    												                  */
/*****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt310PkG IS
	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),								/* �e�[�u����   */
		fldKousinKBN	CHAR(1),								/* �X�V�敪     */
		fldAcsKey		CHAR(50),								/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)								/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);
	STATUS_ERROR		EXCEPTION;		--���[�U�G���[�̒�`

/*****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt310Init																				*/
/* �@�\			�F���������i�V�X�e�����t�擾�j																	*/
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Init (
	OtStrSysDate	OUT	VARCHAR2) IS							--�T�[�o�[�r�x�r�s�d�l���t

BEGIN

	/* �T�[�o�[�r�x�r�s�d�l���t */
	SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO OtStrSysDate FROM DUAL;

END	QPAP_CEnt310Init;
/*****************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent310KgcDaicyoChk                                  					  				*/
/* �@�\      �@�@�F�����Z���䒠�e�[�u�����݃`�F�b�N                           					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310KgcDaicyoChk(
	InStrSyainCD		IN		QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE,	--�Ј��R�[�h
	OtNumRecCount		OUT		NUMBER)IS								--����������

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtNumRecCount := 0;

	/* �����Z���䒠�̌��� */
	SELECT COUNT(*) INTO OtNumRecCount FROM QPA1_KGCDAICYOT WHERE QPA1_PRMSYAINCD2 = InStrSyainCD;

EXCEPTION
	WHEN OTHERS THEN
	RAISE;

END QPAP_Cent310KgcDaicyoChk;

/*****************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent310KgcKasitukeTChk                                  					  				*/
/* �@�\      �@�@�F�ݕt�f�[�^�̊����`�F�b�N                                            					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310KgcKasitukeTChk (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE,	--�Ј��R�[�h
	InStrTorihikiYMD	IN		CHAR,									--�ݕt���t
	InStrTorihikiHMS	IN		VARCHAR2,								--�ݕt����
	InStrKingaku		IN		VARCHAR2,								--���z
	InStrTourokuYMD		IN		CHAR,									--�o�^���t
	InNumExecNo			IN		NUMBER,									--���s�t���O�i�O=�o�^���A�P=���[���j
	OtNumRecCount		OUT		NUMBER) IS								--����������

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtNumRecCount := 0;

	/* �����`�F�b�N */

	/* �����ݕt�s�����`�F�b�N */
	IF InNumExecNo = 0 THEN		--�o�^��
		SELECT 	COUNT(*)
		INTO   	OtNumRecCount
		FROM 	QPA6_KGCKASITUKET 
		WHERE 	QPA6_TORIHIKIYMD = TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
		AND		QPA6_TORIHIKIHMS = TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')
		AND		QPA6_SYAINCD = InStrSyainCD
		AND		QPA6_KINGAKU = InStrKingaku;
	
	ELSIF InNumExecNo = 1 THEN	--���[��
		SELECT 	COUNT(*)
		INTO   	OtNumRecCount
		FROM 	QPA6_KGCKASITUKET 
		WHERE 	TO_DATE(TO_CHAR(QPA6_DATEYMD,'YYYYMMDD'),'YYYYMMDD') = TO_DATE(InStrTourokuYMD,'YYYYMMDD');
--		AND		QPA6_SYAINCD = InStrSyainCD;
	END IF;

EXCEPTION
	WHEN OTHERS THEN
	RAISE;

END QPAP_Cent310KgcKasitukeTChk;

/*****************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent310SelSyainZoku                                  					  				*/
/* �@�\      �@�@�F�Ј������̕\��                                            					  				*/
/*****************************************************************************************************************/
PROCEDURE QPAP_Cent310SelSyainZoku (

	InStrPRMSyainCD1		IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,			--�Ј��R�[�h�P
	InStrPRMSyainCD2		IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,			--�Ј��R�[�h�Q
	OtStrSimeiKana			OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,			--�����J�i
	OtStrSimeiKanji			OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,			--��������
	OtStrMiseCD				OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,				--�����X�R�[�h
	OtStrMiseName			OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,				--�X����
	OtStrTozaiKBN			OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,				--�����敪
	OtStrBumonCD			OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,				--��������R�[�h
	OtStrBumonName			OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,				--���喼��
	OtStrSikakuCD			OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,				--���i�R�[�h
	OtStrTokyuCD			OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,				--�����R�[�h
	OtStrBornYMD			OUT	VARCHAR2,									--���N����
	OtStrTaisyokuYMD		OUT	VARCHAR2,									--�ސE����
	OtStrKyusyoSTYMD		OUT	VARCHAR2,									--�x�E�J�n����
	OtStrKyusyoEDYMD		OUT	VARCHAR2,									--�x�E�I������
	OtStrSonzaiFlg			OUT	VARCHAR2) IS								--����Flg (����̑��� Check)

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtStrSimeiKana		:= ' ';
	OtStrSimeiKanji		:= ' ';
	OtStrMiseCD			:= ' ';
	OtStrMiseName		:= ' ';
	OtStrTozaiKBN		:= ' ';
	OtStrBumonCD		:= ' ';
	OtStrBumonName		:= ' ';
	OtStrSikakuCD		:= ' ';
	OtStrTokyuCD		:= ' ';
	OtStrBornYMD		:= ' ';
	OtStrTaisyokuYMD	:= ' ';			--�ސE����
	OtStrKyusyoSTYMD	:= ' ';			--�x�E�J�n����
	OtStrKyusyoEDYMD	:= ' ';			--�x�E�I������
	OtStrSonzaiFlg		:= '0';

	/* �Ј������̌��� */
	SELECT
			NVL(QPAC_SimeiKana,' '),
			NVL(QPAC_SimeiKanji,' '),
			NVL(QPAC_MiseCD,' '),
			NVL(QPAE_MiseNm,' '),
			NVL(QPAC_TozaiKBN,' '),
			NVL(QPAC_BumonCD,' '),
			NVL(QPAF_BumonNm,' '),
			NVL(QPAC_SikakuCD,' '),
			NVL(QPAC_TokyuCD,' '),
			NVL(TO_CHAR(QPAC_BornYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' '),
			NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')
		INTO
			OtStrSimeiKana,
			OtStrSimeiKanji,
			OtStrMiseCD,
			OtStrMiseName,
			OtStrTozaiKBN,
			OtStrBumonCD,
			OtStrBumonName,
			OtStrSikakuCD,
			OtStrTokyuCD,
			OtStrBornYMD,
			OtStrTAISYOKUYMD,
			OtStrKYUSYOSTYMD,
			OtStrKYUSYOEDYMD
		FROM	QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
		WHERE	QPAC_PRMSyainCD1	= InStrPRMSyainCD1
		AND	QPAC_PRMSyainCD2	= InStrPRMSyainCD2
		AND	QPAC_MiseCD		= QPAE_PRMMiseCD(+)
		AND	QPAC_MiseCD		= QPAF_PRMMiseCD(+)
		AND	QPAC_BumonCD		= QPAF_PRMBumonCD(+);

	OtStrSonzaiFlg	:= '1';

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RETURN;							--�����I��

END QPAP_Cent310SelSyainZoku;

/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310SelList                                                                            */
/* �@�\          �F�����Z���ݕt�f�[�^�擾                                                                         */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE		--���o�L�[  �Ј��R�[�h
	,InNumMaxRec		IN		NUMBER									--�ő�z��i�[����
	,IoNumCursor		IN	OUT	NUMBER									--�J�[�\���h�c
	,OtStrDataAry		OUT		typOtDataAry							--�ݕt�f�[�^
	,OtNumRecCount		OUT		NUMBER									--����������
	,OtNumAryCount		OUT		NUMBER									--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS							--�����I���t���O

	/* �����ŗL�̕ϐ� */
	StrSQL				VARCHAR2(1000);
	StrData				VARCHAR2(200);
	v_CursorID			NUMBER := 0;
	v_NumCount			NUMBER;
	v_Dummy				INTEGER;
	NumIdx				NUMBER;
	v_TorihikiYMD		CHAR(8);
	v_TorihikiHMS		CHAR(6);
	v_HostQ				QPA6_KGCKASITUKET.QPA6_HOSTSEQ%TYPE;
	v_Kingaku			QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
	v_WSName			CHAR(8);
	v_TourokuYMD		CHAR(14);
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--	v_TourokuNAME		VARCHAR2(20);
--DEL 20090329 0807073/0808052 NBC YOKOYAMA END
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
	v_TourokuNAME		VARCHAR2(30);
--ADD 20090329 0807073/0808052 NBC YOKOYAMA END

BEGIN

/* ----- �r�s�d�o�P �\���f�[�^�������擾 ----- */
	OtstrEndFlg	:= '0';
	OtNumRecCount	:= 0;
	OtNumAryCount	:= 0;
	v_NumCount	:= 0;

	/* �����Z���ݕt�e�[�u�����݃`�F�b�N�r�p�k */
	SELECT	COUNT(*)
	INTO	OtNumRecCount
	FROM	QPA6_KGCKASITUKET
	WHERE	QPA6_SYAINCD = InStrSyainCD;

/* ----- �r�s�d�o�Q �\���f�[�^�擾 ----- */
	IF IoNumCursor = 0 THEN		--�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j

		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
		StrSQL := StrSQL || ' NVL(QPA6_HOSTSEQ,'' ''),';
		StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
		StrSQL := StrSQL || ' NVL(QPA6_WSNAME,'' ''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_DATEYMD,''YYYYMMDDHH24MISS'')';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' ORDER BY QPA6_TORIHIKIYMD DESC,QPA6_TORIHIKIHMS DESC';
		/* ���I�J�[�\���̃I�[�v�� */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQL�̉�� */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* ���͕ϐ����o�C���h���� */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		/* SQL�̎��s */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	ELSE
		/* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
		v_CursorID  := IoNumCursor;
	END IF;

	IoNumCursor :=  v_CursorID;		--�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
	/* �o�͕ϐ��̃o�C���h */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_HostQ,2);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kingaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_WSName,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_TourokuYMD,14);
	/* FETCH */
	NumIdx := 0;
	LOOP
		IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* �J�����l��ϐ��֊i�[ */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_HostQ);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kingaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_WSName);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_TourokuYMD);

		/* ���ޯ�� ���� ���� */
		NumIdx	:= NumIdx + 1;

		/* �p�����[�^�ɓn�� */
		StrData := NULL;
		StrData := StrData || RTRIM(v_TorihikiYMD)	|| StrDLM;	--������t
		StrData := StrData || RTRIM(v_TorihikiHMS)	|| StrDLM;	--�������
		StrData := StrData || RTRIM(v_Kingaku)		|| StrDLM;	--���z
		StrData := StrData || RTRIM(v_TourokuYMD)	|| StrDLM;	--�o�^����

		IF v_HostQ = 'SY' THEN

			BEGIN
				SELECT 	QUA1_USERMEI
				INTO v_TourokuName
				FROM QUA2_USERIDV 
				WHERE RTRIM(QUA1_USERID) = RTRIM(v_WSName);

			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					OtStrEndFlg	:= '9';				
					IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
						DBMS_SQL.CLOSE_CURSOR (v_CursorID);
					END IF;
					RAISE;

				WHEN OTHERS THEN
					OtStrEndFlg	:= '9';				
					IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
						DBMS_SQL.CLOSE_CURSOR (v_CursorID);
					END IF;
					RAISE;
			END;

			StrData := StrData || RTRIM(v_TourokuName)		|| StrDLM;	--�o�^�Җ�
			StrData := StrData || '1'						|| StrDLM;	--�蓮�׸�


		ELSE
			StrData := StrData || NVL(v_TourokuName,' ')		|| StrDLM;	--�o�^�Җ�
			StrData := StrData || '0'							|| StrDLM;	--�蓮�׸�
		END IF;

		OtStrDataAry(NumIdx) := StrData;
		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;
		END IF;
	END LOOP;

	OtNumAryCount	:= NumIdx;			--�p�����[�^�ɃZ�b�g
	OtStrEndFlg	:= '1';					--�p�����[�^�ɃZ�b�g�i�����I���j

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
	WHEN STATUS_ERROR THEN
		OtStrEndFlg	:= '9';				
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;

	WHEN	OTHERS	THEN
		OtStrEndFlg	:= '9';				
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;
END QPAP_CEnt310SelList;

/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310Ins                                                                             */
/* �@�\          �F�����ݕt�f�[�^�ǉ�����                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Ins (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR										--������t
	,InStrTorihikiHMS	IN		VARCHAR2									--�������
	,InStrKingaku		IN		VARCHAR2									--���z
	,InStrTourokuID		IN		QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE			--�o�^ID
	,InStrMiseCd		IN		QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE		--�Ǘ��X�R�[�h
	,INSTRMENUID		IN		VARCHAR2									--���j���[ID		�I�y���O�p
	,InStrModuleID		IN		VARCHAR2									--���W���[��ID		�I�y���O�p
	,InStrUserID		IN		VARCHAR2									--�o�^�S����ID		�I�y���O�p
	,InStrTantoNM		IN		VARCHAR2									--�o�^�S����		�I�y���O�p
	,InStrComputerNM	IN		VARCHAR2									--�R���s���[�^�[��	�I�y���O�p
	,InStrRiyouKBN		IN		VARCHAR2									--���p�敪			�I�y���O�p
	,InstrBushoCD		IN		VARCHAR2									--�����R�[�h		�I�y���O�p
) IS
	numStep				NUMBER   := 0;							/* �����X�e�b�v  */
	numErr				NUMBER   := 0;							/* SQLCODE�̑ޔ� */
	strErrMsg			VARCHAR2(100);							/* SQLERRM�̑ޔ� */
	recMsg				typMsg;
	SystemYMD 			DATE;
	strLogMsg			VARCHAR2(1700);

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA6_KGCKASITUKET';						--�e�[�u����
	recMsg.fldKousinKBN	:= '1';										--�X�V�敪
	recMsg.fldAcsKey	:= InStrSyainCD;							--�X�V�L�[

/* �C�� */
	SELECT SYSDATE INTO SystemYMD FROM DUAL; 	

	/* �ǉ� */
	INSERT INTO QPA6_KGCKASITUKET(
			QPA6_TORIHIKIYMD
			,QPA6_TORIHIKIHMS
			,QPA6_SYAINCD
			,QPA6_HOSTSEQ
			,QPA6_KAZOKUCD
			,QPA6_MEISAIFLG
			,QPA6_SYUBETU
			,QPA6_KINGAKU
			,QPA6_MARUYUFLG
			,QPA6_WSNAME
			,QPA6_DATEYMD
			,QPA6_KANRITEN
			,QPA6_TORIKESHIFLG)
	VALUES(
		TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
		,TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')
		,InStrSyainCD
		,'SY'
		,'1'
		,'3'	
		,'30'	
		,InStrKingaku
		,'0'
		,InStrTourokuID
		,SystemYMD
		,InStrMiseCd
		,' ');

	/* �R�~�b�g */
	COMMIT;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̓o�^�ɐ���ɍs����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̓o�^�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END QPAP_CEnt310Ins;
/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310Del 													*/
/* �@�\          �F�����Z�������f�[�^�폜����                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Del (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE			--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR										--������t
	,InStrTorihikiHMS	IN		VARCHAR2									--�������
	,InStrKingaku		IN		VARCHAR2									--���z
	,INSTRMENUID		IN		VARCHAR2									--���j���[ID		�I�y���O�p
	,InStrModuleID		IN		VARCHAR2									--���W���[��ID		�I�y���O�p
	,InStrUserID		IN		VARCHAR2									--�o�^�S����ID		�I�y���O�p
	,InStrTantoNM		IN		VARCHAR2									--�o�^�S����		�I�y���O�p
	,InStrComputerNM	IN		VARCHAR2									--�R���s���[�^�[��	�I�y���O�p
	,InStrRiyouKBN		IN		VARCHAR2									--���p�敪			�I�y���O�p
	,InstrBushoCD		IN		VARCHAR2									--�����R�[�h		�I�y���O�p
)IS

	numStep			NUMBER   := 0;							/* �����X�e�b�v  */
	numErr			NUMBER   := 0;							/* SQLCODE�̑ޔ� */
	strErrMsg		VARCHAR2(100);							/* SQLERRM�̑ޔ� */
	recMsg			typMsg;
	strLogMsg		VARCHAR2(1700);
BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA6_KGCKASITUKET';						--�e�[�u����
	recMsg.fldKousinKBN	:= '3';										--�X�V�敪
	recMsg.fldAcsKey	:= InStrSyainCD;							--�X�V�L�[

	/* �����Z���ݕt�s�̍폜 */
	DELETE FROM QPA6_KGCKASITUKET
	WHERE	QPA6_TORIHIKIYMD = TO_DATE(InStrTorihikiYMD,'YYYYMMDD')
	AND	QPA6_TORIHIKIHMS = TO_DATE(InStrTorihikiYMD || InStrTorihikiHMS,'YYYYMMDDHH24MISS')	
	AND	QPA6_KINGAKU = InStrKingaku			
	AND	QPA6_SYAINCD  = InStrSyainCD;								

	COMMIT;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̍폜�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKBN
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt310OpeLog(	InStrMenuID,
				InStrModuleID,
				InStrUserID,
				InStrComputerNM,
				InStrRiyouKBN,
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
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̍폜�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt310OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END QPAP_CEnt310Del;
/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310OpeLog                                       �@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*/
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                               */
/*****************************************************************************************************************/
PROCEDURE  QPAP_CEnt310OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS 				--���b�Z�[�W

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserId,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt310OpeLog;

/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310Lock                                                                               */
/* �@�\          �F�����Z���ݕt�s�̃��b�N                                                                         */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type			--�Ј��R�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type			--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type			--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		--�I�y���[�^�h�c

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �v�����^�s�̊m�F */
	BEGIN
		SELECT QSA4_ComputerMei, QSA4_OperatorID
		  INTO fldComputerNM, fldOperatorID
		  FROM QSA4_HaitaT
		 WHERE QSA4_PRMJobKbn	 = 'P'
		   AND QSA4_PRMSikibetu	 = InStrSikibetu
		   AND QSA4_PRMKeyInfo1	 = InStrKeyInfo1;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	END;

	IF numErr = 0 THEN
		RAISE W_HAITADUPLICATE;
	ELSE
		INSERT INTO QSA4_HaitaT (
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
		) VALUES (
			'P', InStrSikibetu,
			InStrKeyInfo1,'P','P','P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	END IF;

	COMMIT;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt310Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt310Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt310Lock ;
/*****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt310UnLock                                                                             */
/* �@�\          �F�����Z���ݕt�s�̃��b�N����                                                                     */
/*****************************************************************************************************************/
PROCEDURE QPAP_CEnt310UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS

BEGIN
	DELETE FROM QSA4_HaitaT
	 WHERE QSA4_PRMJobKbn = 'P'
	   AND QSA4_PRMSikibetu = InStrSikibetu
	   AND QSA4_ComputerMei = InStrComputerNM;
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END QPAP_CEnt310UnLock;

END QPAP_CEnt310PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
