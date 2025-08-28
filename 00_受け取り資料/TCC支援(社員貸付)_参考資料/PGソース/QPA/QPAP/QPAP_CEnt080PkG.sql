CREATE OR REPLACE PACKAGE  QPAP_CEnt080PkG IS
/****************************************************************************/
/* �V�X�e����	�F�������N���W�b�g�V�X�e��									*/
/* �Ɩ���		�F�Ј��ݕt�V�X�e��											*/
/* ���W���[����	�FQPAP_CEnt080PkG											*/
/* �@�\			�F�Ј��Z���䒠												*/
/* �쐬��		�F2000/10/10												*/
/* �쐬��		�FFIP														*/
/****************************************************************************/
------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
--                           0808052�FTCC�x���V�X�e���̍č\�z
--                             �E�A�v���P�[�V�����ڍs�Ή�
--                             �E�Ј��Z���䒠�s�o�^�̏d���t���O��NULL����󕶎��ŃN���A
------------------------------------------------------------------------------------------------

/****************************************************************************/
/*								�P �錾��									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typNayoseDatAry	IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;	--��t���O�p�z��
	TYPE typUkeLogAry		IS TABLE OF VARCHAR2(200)	INDEX BY BINARY_INTEGER;	--��t���O�p�z��
	TYPE typCSVFileAry		IS TABLE OF VARCHAR2(150)	INDEX BY BINARY_INTEGER;	--�b�r�u�t�@�C���o�͗p
	TYPE typRowIDAry		IS TABLE OF VARCHAR2(18)	INDEX BY BINARY_INTEGER;	--�q�n�v�h�c�z��i���[�p�j

	TYPE typPageKBNAry		IS TABLE OF NUMBER(2)		INDEX BY BINARY_INTEGER;	--�y�[�W�敪�z��
	TYPE typNenKBNAry		IS TABLE OF NUMBER(2)		INDEX BY BINARY_INTEGER;	--�N�敪�z��
	TYPE typKBNAry			IS TABLE OF VARCHAR2(10)	INDEX BY BINARY_INTEGER;	--�敪�z��
	TYPE typKijituAry		IS TABLE OF VARCHAR2(20)	INDEX BY BINARY_INTEGER;	--�ԍϊ����z��
	TYPE typHensaiAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--�ԍϋ��z�z��
	TYPE typZandakaAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--�c���z��
	TYPE typKyuGanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--���^���{�z��
	TYPE typKyuRskAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--���^�����z��
	TYPE typKyuZanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--���^�c���z��
	TYPE typSyoGanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--�ܗ^���{�z��
	TYPE typSyoRskAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--�ܗ^�����z��
	TYPE typSyoZanAry		IS TABLE OF NUMBER(7)		INDEX BY BINARY_INTEGER;	--�ܗ^�c���z��

/* �������� */
PROCEDURE	QPAP_CEnt080Init (
	OtStrSysDate				OUT		VARCHAR2);									--�T�[�o�[�r�x�r�s�d�l���t

/* �r������ */
PROCEDURE QPAP_CEnt080Lock (
	 InStrSikibetu			IN			QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--���ʃR�[�h
	,InStrProgramID			IN			QSA4_HaitaT.QSA4_ProgramID%TYPE				--�v���O�����h�c
	,InStrKeyInfo1			IN			VARCHAR2									--�L�[���P
	,InStrKeyInfo2			IN			VARCHAR2									--�L�[���Q
	,InStrComputerMei		IN			QSA4_HaitaT.QSA4_ComputerMei%TYPE			--�R���s���[�^��
	,InStrOperatorID		IN			QSA4_HaitaT.QSA4_OperatorID%TYPE);			--�I�y���[�^�h�c

/* �r������ */
PROCEDURE QPAP_CEnt080UnLock (
	 InStrSikibetu			IN			QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--���ʃR�[�h
	,InStrComputerMei		IN			QSA4_HaitaT.QSA4_ComputerMei%TYPE);			--�R���s���[�^��

/* �I�y���O�ւ̒ǉ� */
PROCEDURE  QPAP_CEnt080OpeLog(
	 InStrMenuId			IN			QUS2_OpeLogT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleId			IN			QUS2_OpeLogT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserId			IN			QUS2_OpeLogT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerMei		IN			QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTouzaiKbn			IN			QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCd			IN			QUS2_OpeLogT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg				IN			QUS2_OpeLogT.QUS2_MSG%TYPE );				--���b�Z�[�W

/* ����p�e�[�u���ɓo�^ */
PROCEDURE QPAP_CEnt080PrintAdd (
	 InStrSyainCD1			IN			CHAR										--�Ј��R�[�h�P
	,InStrSyainCD2			IN			CHAR										--�Ј��R�[�h�Q
	,InStrSimei				IN			VARCHAR2									--����
	,InStrMiseNm			IN			VARCHAR2									--�X��
	,InStrYusiYMD			IN			VARCHAR2									--�Z���N����
	,InStrRiritu			IN			VARCHAR2									--����
	,InNumYusiKng			IN			NUMBER										--�Z�����z
	,InNumKyuHensai			IN			NUMBER										--���^�ԍϊz
	,InNumSyoHensai			IN			NUMBER										--�ܗ^�ԍϊz
	,InNumAryCount			IN			NUMBER										--�z�񌏐�
	,InNumPageKBNAry		IN			typPageKBNAry								--�y�[�W�敪�z��
	,InNumNenKBNAry			IN			typNenKBNAry								--�N�敪�z��
	,InStrKBNAry			IN			typKBNAry									--�敪�z��
	,InStrKijituAry			IN			typKijituAry								--�ԍϊ����z��
	,InNumHensaiAry			IN			typHensaiAry								--�ԍϋ��z�z��
	,InNumZandakaAry		IN			typZandakaAry								--�c���z��
	,InNumKyuGanAry			IN			typKyuGanAry								--���^���{�z��
	,InNumKyuRskAry			IN			typKyuRskAry								--���^�����z��
	,InNumKyuZanAry			IN			typKyuZanAry								--���^�c���z��
	,InNumSyoGanAry			IN			typSyoGanAry								--�ܗ^���{�z��
	,InNumSyoRskAry			IN			typSyoRskAry								--�ܗ^�����z��
	,InNumSyoZanAry			IN			typSyoZanAry								--�ܗ^�c���z��
	,InStrCOMPUTERMEI		IN			VARCHAR2);									--�R���s���[�^��

/* ����p�e�[�u������폜 */
PROCEDURE QPAP_CEnt080PrintDel (
	InStrCOMPUTERMEI		IN			QPAL_HENYOW.QPAL_COMPUTERMEI%TYPE);			--�R���s���[�^�[��

/* �Ј������f�[�^�擾 */
PROCEDURE QPAP_CEnt080SyainDat (
	 InStrSyainCd1			IN			CHAR										--�Ј��R�[�h�P
	,InStrSyainCd2			IN			CHAR										--�Ј��R�[�h�Q
	,OtStrDatAry				OUT		VARCHAR2);									--�����f�[�^�z��

/* �l�ݕt�f�[�^�擾 */
PROCEDURE QPAP_CEnt080GetList (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InNumMaxRec			IN			NUMBER										--�ő�z��i�[����
	,IoNumSpCnt				IN	OUT		NUMBER										--�Ăяo����
	,OtNumRecCount				OUT		NUMBER										--����������
	,OtNumAryCount				OUT		NUMBER										--�z��i�[����
	,OtStrEndFlg				OUT		VARCHAR2									--�����I���t���O
	,OtStrDatAry				OUT		typUkeLogAry);								--���i�f�[�^�z��

/* �Ј��f�[�^���񂹌��� */
PROCEDURE QPAP_CEnt080SyainSearch (
	 InStrSyainMyouji		IN			VARCHAR2									--�Ј������J�i
	,InStrSyainName			IN			VARCHAR2									--�Ј������J�i
	,InNumMaxRec			IN			NUMBER										--�ő�z��i�[����
	,IoNumSpCnt				IN	OUT		NUMBER										--�ďo��
	,OtNumRecCount				OUT		NUMBER										--����������
	,OtNumAryCount				OUT		NUMBER										--�z��i�[����
	,OtStrEndFlg				OUT		VARCHAR2									--�I���t���O
	,OtStrDatAryN				OUT		typNayoseDatAry);									--�Ј��f�[�^�z��

/* �Ј��Z���䒠�s�o�^ */
PROCEDURE QPAP_CEnt080DatAdd (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN			VARCHAR2									--�Z����
	,InStrGendogaku			IN			QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--�Z�����x�z
	,InStrSyubetu			IN			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--���
	,InStrRiritu			IN			QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--����
	,InStrHensaiTsukisu		IN			QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--�ԍό���
	,InStrKyuyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--���^�ԍϑ��z
	,InStrKyuyoHensai		IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--���^�ԍϊz
	,InStrSyoyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--�ܗ^�ԍϑ��z
	,InStrSyoyoHensai		IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--�ܗ^�ԍϊz
	,InStrKyuyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--���^�c��
	,InStrSyoyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--�ܗ^�c��
	,InStrKojoChusiFlg		IN			QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--�T�����~�t���O
	,InStrKansaiYMD			IN			VARCHAR2									--���ϓ�
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--�����R�[�h	(�I�y���O�p)
	,OtChouhukuFlg				OUT		CHAR);										--�d���t���O

/* �Ј��Z���䒠�s�X�V */
PROCEDURE QPAP_CEnt080DatUpd (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN			VARCHAR2									--�Z����
	,InStrGendogaku			IN			QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--�Z�����x�z
	,InStrSyubetu			IN			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--���
	,InStrRiritu			IN			QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--����
	,InStrHensaiTsukisu		IN			QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--�ԍό���
	,InStrKyuyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--���^�ԍϑ��z
	,InStrKyuyoHensai		IN			QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--���^�ԍϊz
	,InStrSyoyoHensaiAll	IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--�ܗ^�ԍϑ��z
	,InStrSyoyoHensai		IN			QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--�ܗ^�ԍϊz
	,InStrKyuyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--���^�c��
	,InStrSyoyoZandaka		IN			QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--�ܗ^�c��
	,InStrKojoChusiFlg		IN			QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--�T�����~�t���O
	,InStrKansaiYMD			IN			VARCHAR2									--���ϓ�
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE);			--�����R�[�h	(�I�y���O�p)

/* �Ј��Z���䒠�s�폜 */
PROCEDURE QPAP_CEnt080DatDel (
	 InStrSyainCd1			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN			QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN			VARCHAR2									--�Z����
	,InStrMenuId			IN			QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN			QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN			QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN			QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN			QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN			QUS2_OPELOGT.QUS2_BUSHOCD%TYPE);			--�����R�[�h	(�I�y���O�p)

END QPAP_CEnt080PkG;
/
SHOW ERROR

/****************************************************************************/
/*								�Q �{�f�B�[									*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt080PkG IS

	/* ���[�U��`��O��` */
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);

	/* ���O���b�Z�[�W��` */
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		--�e�[�u����
		fldKousinKbn	CHAR(1),		--�X�V�敪
		fldAcsKey		CHAR(50),		--�A�N�Z�X�L�[
		fldMsg			CHAR(100)		--�����R�[�h
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	StrWHERE						VARCHAR(50);

	CURSOR CurCEnt080NAYOSE IS
		SELECT	 NVL(QPAC_PRMSYAINCD1,' ')							SYAINCD1		--�Ј��R�[�h�P
				,NVL(QPAC_PRMSYAINCD2,' ')							SYAINCD2		--�Ј��R�[�h�Q
				,NVL(QPAC_SIMEIKANA,' ')							SIMEIKANA		--�����J�i
				,NVL(QPAC_SIMEIKANJI,' ')							SIMEIKANJI		--��������
				,NVL(QPAC_MISECD,' ')								MISECD			--�����X�R�[�h
				,NVL(QPAC_TOZAIKBN,' ')								TOZAIKBN		--�����敪
				,NVL(QPAC_BUMONCD,' ')								BUMONCD			--��������R�[�h
				,NVL(QPAC_SIKAKUCD,' ')								SIKAKUCD		--���i�R�[�h
				,NVL(QPAC_TOKYUCD,' ')								TOKYUCD			--�����R�[�h
				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')			SEINENGAPPI		--�N����
				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')		TAISYOKUYMD		--�ސE�N����
				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDFR	--�x�E�J�n�N����
				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDED	--�x�E�I���N����
		FROM	QPAC_SYAINM
		WHERE	QPAC_SIMEIKANA LIKE StrWHERE
	ORDER BY	QPAC_PRMSYAINCD1 || QPAC_PRMSYAINCD2;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080Init											*/
/* �@�\			�F��t�Ɖ������											*/
/****************************************************************************/
PROCEDURE	QPAP_CEnt080Init (
	OtStrSysDate		OUT	VARCHAR2) IS				--�T�[�o�[SYSTEM���t

BEGIN

	/* �T�[�o�[�V�X�e�����t */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDD')
	INTO	OtStrSysDate FROM DUAL;

END	QPAP_CEnt080Init;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080Lock											*/
/* �@�\			�F�r������													*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080Lock (
	 InStrSikibetu			IN	QSA4_HAITAT.QSA4_PRMSIKIBETU%TYPE		--���ʃR�[�h
	,InStrProgramID			IN	QSA4_HAITAT.QSA4_PROGRAMID%TYPE			--�v���O�����h�c
	,InStrKeyInfo1			IN	VARCHAR2								--�L�[���P
	,InStrKeyInfo2			IN	VARCHAR2								--�L�[���Q
	,InStrComputerMei		IN	QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE		--�R���s���[�^��
	,InStrOperatorID		IN	QSA4_HAITAT.QSA4_OPERATORID%TYPE) IS	--�I�y���[�^�h�c

	fldComputerMei				QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE;
	fldOperatorID				QSA4_HAITAT.QSA4_OPERATORID%TYPE;
	fldKeyInfo1					QSA4_HAITAT.QSA4_COMPUTERMEI%TYPE;
	fldKeyInfo2					QSA4_HAITAT.QSA4_OPERATORID%TYPE;
	numErr						NUMBER;

BEGIN

	numErr	:= 0;

	BEGIN
		SELECT	 QSA4_COMPUTERMEI
				,QSA4_OPERATORID
				,QSA4_PRMKEYINFO1
				,QSA4_PRMKEYINFO2
		INTO	 fldCOMPUTERMEI
				,fldOPERATORID
				,fldKeyInfo1
				,fldKeyInfo2
		FROM	QSA4_HAITAT
		WHERE	QSA4_PRMJOBKBN		= 'A'
		AND		QSA4_PRMSIKIBETU	= InStrSikibetu
		AND		QSA4_PRMKEYINFO1	= InStrKeyInfo1
		AND		QSA4_PRMKEYINFO2	= InStrKeyInfo2;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			numErr := SQLCODE;
		WHEN OTHERS THEN
			RAISE;
	END;

	IF numErr = 0 then
		RAISE W_HAITADUPLICATE;
	ELSE
		INSERT INTO QSA4_HAITAT (
			 QSA4_PRMJobKbn
			,QSA4_PRMSikibetu
			,QSA4_PRMKeyInfo1
			,QSA4_PRMKeyInfo2
			,QSA4_PRMKeyInfo3
			,QSA4_PRMKeyInfo4
			,QSA4_PRMKeyInfo5
			,QSA4_ProgramID
			,QSA4_ComputerMei
			,QSA4_OperatorID
			,QSA4_SyoriYmd
		) VALUES (
			 'A'
			,InStrSikibetu
			,InStrKeyInfo1
			,InStrKeyInfo2
			,'A'
			,'A'
			,'A'
			,InStrProgramID
			,InStrComputerMei
			,InStrOperatorID
			,SYSDATE);
	END IF;

	COMMIT;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--  ��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt080Lock DUPLICATE KEY');
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END	QPAP_CEnt080Lock ;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080UnLock										*/
/* �@�\			�F�r������													*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080UnLock (
	 InStrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%TYPE			--���ʃR�[�h
	,InStrComputerMei	IN	QSA4_HaitaT.QSA4_ComputerMei%TYPE) IS		--�R���s���[�^��
BEGIN
	DELETE	FROM QSA4_HaitaT
	WHERE	QSA4_PRMJobKbn		= 'A'
	AND		QSA4_PRMSikibetu	= InStrSikibetu
	AND		QSA4_ComputerMei	= InStrComputerMei;
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END	QPAP_CEnt080UnLock;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080OpeLog										*/
/* �@�\			�F�I�y���O�ւ̒ǉ�											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080OpeLog(
	 InStrMenuId			IN		QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[�h�c
	,InStrModuleId			IN		QUS2_OPELOGT.QUS2_MODULEID%TYPE				--�v���O�����h�c
	,InStrUserId			IN		QUS2_OPELOGT.QUS2_USERID%TYPE				--���[�U�h�c
	,InStrComputerMei		IN		QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^
	,InStrTouzaiKbn			IN		QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--�����敪
	,InStrBushoCd			IN		QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--�����R�[�h
	,InStrMsg				IN		QUS2_OPELOGT.QUS2_MSG%TYPE) IS				--���b�Z�[�W

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
		SUBSTRB(InStrMenuId,1,5),
		SUBSTRB(InStrModuleId,1,40),
		SUBSTRB(InStrUserId,1,8),
		SUBSTRB(InStrComputerMei,1,20),
		SUBSTRB(InStrTouzaiKbn,1,1),
		SUBSTRB(InStrBushoCd,1,4),
		SUBSTRB(InStrMsg,1,1700));
EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* �I�y���O�̃G���[��F�߂� */
END QPAP_CEnt080OpeLog;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080PrintAdd										*/
/* �@�\			�F�I�����ꂽ�f�[�^��ǉ�									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080PrintAdd (
	 InStrSyainCD1		IN		CHAR				--�Ј��R�[�h�P
	,InStrSyainCD2		IN		CHAR				--�Ј��R�[�h�Q
	,InStrSimei			IN		VARCHAR2			--����
	,InStrMiseNm		IN		VARCHAR2			--�X��
	,InStrYusiYMD		IN		VARCHAR2			--�Z���N����
	,InStrRiritu		IN		VARCHAR2			--����
	,InNumYusiKng		IN		NUMBER				--�Z�����z
	,InNumKyuHensai		IN		NUMBER				--���^�ԍϊz
	,InNumSyoHensai		IN		NUMBER				--�ܗ^�ԍϊz
	,InNumAryCount		IN		NUMBER				--�z�񌏐�
	,InNumPageKBNAry	IN		typPageKBNAry		--�y�[�W�敪�z��
	,InNumNenKBNAry		IN		typNenKBNAry		--�N�敪�z��
	,InStrKBNAry		IN		typKBNAry			--�敪�z��
	,InStrKijituAry		IN		typKijituAry		--�ԍϊ����z��
	,InNumHensaiAry		IN		typHensaiAry		--�ԍϋ��z�z��
	,InNumZandakaAry	IN		typZandakaAry		--�c���z��
	,InNumKyuGanAry		IN		typKyuGanAry		--���^���{�z��
	,InNumKyuRskAry		IN		typKyuRskAry		--���^�����z��
	,InNumKyuZanAry		IN		typKyuZanAry		--���^�c���z��
	,InNumSyoGanAry		IN		typSyoGanAry		--�ܗ^���{�z��
	,InNumSyoRskAry		IN		typSyoRskAry		--�ܗ^�����z��
	,InNumSyoZanAry		IN		typSyoZanAry		--�ܗ^�c���z��
	,InStrCOMPUTERMEI	IN		VARCHAR2) IS		--�R���s���[�^��

BEGIN
	<<LoopPrintAdd>>
	FOR i IN 1..InNumAryCount LOOP

		INSERT INTO QPAL_HENYOW VALUES (
			 InStrSyainCD1			--�Ј��R�[�h�P
			,InStrSyainCD2			--�Ј��R�[�h�Q
			,InStrSimei				--����
			,InStrMiseNm			--�X��
			,InStrYusiYMD			--�Z���N����
			,InStrRiritu			--����
			,InNumYusiKng			--�Z�����z
			,InNumKyuHensai			--���^�ԍϊz
			,InNumSyoHensai			--�ܗ^�ԍϊz
			,InNumPageKBNAry(i)		--�y�[�W�敪�z��
			,InNumNenKBNAry(i)		--�N�敪�z��
			,InStrKBNAry(i)			--�敪�z��
			,InStrKijituAry(i)		--�ԍϊ����z��
			,InNumHensaiAry(i)		--�ԍϋ��z�z��
			,InNumZandakaAry(i)		--�c���z��
			,InNumKyuGanAry(i)		--���^���{�z��
			,InNumKyuRskAry(i)		--���^�����z��
			,InNumKyuZanAry(i)		--���^�c���z��
			,InNumSyoGanAry(i)		--�ܗ^���{�z��
			,InNumSyoRskAry(i)		--�ܗ^�����z��
			,InNumSyoZanAry(i)		--�ܗ^�c���z��
			,InStrCOMPUTERMEI);		--�R���s���[�^��

	END LOOP LoopPrintAdd;
	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END QPAP_CEnt080PrintAdd;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080PrintDel										*/
/* �@�\			�F����I����Ƀe�[�u������f�[�^���폜						*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080PrintDel (
	InStrCOMPUTERMEI	IN		QPAL_HENYOW.QPAL_COMPUTERMEI%TYPE) IS	--�R���s���[�^�[��

BEGIN
	DELETE	FROM QPAL_HENYOW
	WHERE	RTRIM(QPAL_COMPUTERMEI) = RTRIM(InStrCOMPUTERMEI);

	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;

END	QPAP_CEnt080PrintDel;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080SyainDat										*/
/* �@�\			�F�Ј������̎擾											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080SyainDat (
	 InStrSyainCd1		IN			CHAR						--�Ј��R�[�h�P
	,InStrSyainCd2		IN			CHAR						--�Ј��R�[�h�Q
	,OtStrDatAry			OUT		VARCHAR2) IS				--�����f�[�^�z��

	StrNAMEKANA				QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;	--01 �Ј������J�i
	StrNAMEKANJI			QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;	--02 �Ј���������
	StrMISECD				QPAC_SYAINM.QPAC_MISECD%TYPE;		--03 �����X�R�[�h
	StrTOUZAIKBN			QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;		--04 �����敪
	StrBUMONCD				QPAC_SYAINM.QPAC_BUMONCD%TYPE;		--05 ��������R�[�h
	StrSIKAKUCD				QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;		--06 ���i�R�[�h
	StrTOUKYUUCD			QPAC_SYAINM.QPAC_TOKYUCD%TYPE;		--07 �����R�[�h
	StrBIRTHDAY				CHAR(8);							--08 ���N����
	StrTAISYOKUDATE			CHAR(8);							--09 �ސE�N����
	StrKYUUSYOKUFRMDATE		CHAR(8);							--10 �x�E�J�n�N����
	StrKYUUSYOKUTODATE		CHAR(8);							--11 �x�E�I���N����
	StrMISENAME				VARCHAR2(24);						--12 �X����
	StrBUMONNAME			VARCHAR2(24);						--13 ���喼��
	StrBONUSMD1				CHAR(4);							--14 �ܗ^�x�����P
	StrBONUSMD2				CHAR(4);							--15 �ܗ^�x�����Q
	StrSYOSYOGENDOGAKU		CHAR(7);							--17 �؏����x�z

	StrData					VARCHAR2(2000);

BEGIN

	/* �Ј��}�X�^����擾 */
	BEGIN
		SELECT	 NVL(QPAC_SIMEIKANA,' ')
				,NVL(QPAC_SIMEIKANJI,' ')
				,NVL(QPAC_MISECD,' ')
				,NVL(QPAC_TOZAIKBN,' ')
				,NVL(QPAC_BUMONCD,' ')
				,NVL(QPAC_SIKAKUCD,' ')
				,NVL(QPAC_TOKYUCD,' ')
				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')
				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')
		INTO	 StrNAMEKANA
				,StrNAMEKANJI
				,StrMISECD
				,StrTOUZAIKBN
				,StrBUMONCD
				,StrSIKAKUCD
				,StrTOUKYUUCD
				,StrBIRTHDAY
				,StrTAISYOKUDATE
				,StrKYUUSYOKUFRMDATE
				,StrKYUUSYOKUTODATE
		FROM	QPAC_SYAINM
		WHERE	QPAC_PRMSyainCD1 = InStrSyainCd1
		AND		QPAC_PRMSyainCD2 = InStrSyainCd2;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN;
	END;

	/* �X�}�X�^����X���̎擾 */
	BEGIN
		SELECT	 NVL(QPAE_MISENM,' ')
				,NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 StrMISENAME
				,StrBONUSMD1
				,StrBONUSMD2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= StrMISECD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrMISENAME := ' ';
			StrBONUSMD1 := ' ';
			StrBONUSMD2 := ' ';
		WHEN OTHERS THEN
			RAISE ;
	END;

	/* ����}�X�^���畔�喼�̎擾 */
	BEGIN
		SELECT	NVL(QPAF_BUMONNM,' ')
		INTO	StrBUMONNAME
		FROM	QPAF_BUMONM
		WHERE	QPAF_PRMMISECD	= StrMISECD
		AND		QPAF_PRMBUMONCD	= StrBUMONCD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrBUMONNAME := ' ';
		WHEN OTHERS THEN
			RAISE ;
	END;

	/* ���ʃ}�X�^������x�z�擾 */
	BEGIN
		SELECT	QPAH_SGENDO
		INTO	StrSYOSYOGENDOGAKU
		FROM	QPAH_OTHERM
		WHERE	RTRIM(QPAH_PRMCODE)	= 'GE'|| RTRIM(StrSIKAKUCD) || RTRIM(StrTOUKYUUCD);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrSYOSYOGENDOGAKU := '0';
		WHEN OTHERS THEN
			RAISE ;
	END;


	/* �o�͔z��֊i�[ */
	StrData := Null;
	StrData := StrData || RTRIM(StrNAMEKANA)			|| StrDLM;		--01 �Ј������J�i
	StrData := StrData || RTRIM(StrNAMEKANJI)			|| StrDLM;		--02 �Ј���������
	StrData := StrData || RTRIM(StrMISECD)				|| StrDLM;		--03 �����X�R�[�h
	StrData := StrData || RTRIM(StrTOUZAIKBN)			|| StrDLM;		--04 �����敪
	StrData := StrData || RTRIM(StrBUMONCD)				|| StrDLM;		--05 ��������R�[�h
	StrData := StrData || RTRIM(StrSIKAKUCD)			|| StrDLM;		--06 ���i�R�[�h
	StrData := StrData || RTRIM(StrTOUKYUUCD)			|| StrDLM;		--07 �����R�[�h
	StrData := StrData || RTRIM(StrBIRTHDAY)			|| StrDLM;		--08 ���N����
	StrData := StrData || RTRIM(StrTAISYOKUDATE)		|| StrDLM;		--09 �ސE�N����
	StrData := StrData || RTRIM(StrKYUUSYOKUFRMDATE)	|| StrDLM;		--10 �x�E�J�n�N����
	StrData := StrData || RTRIM(StrKYUUSYOKUTODATE)		|| StrDLM;		--11 �x�E�I���N����
	StrData := StrData || RTRIM(StrMISENAME)			|| StrDLM;		--12 �X����
	StrData := StrData || RTRIM(StrBUMONNAME)			|| StrDLM;		--13 ���喼��
	StrData := StrData || RTRIM(StrBONUSMD1)			|| StrDLM;		--14 �ܗ^�x�����P
	StrData := StrData || RTRIM(StrBONUSMD2)			|| StrDLM;		--15 �ܗ^�x�����Q
	StrData := StrData || RTRIM(StrSYOSYOGENDOGAKU)		|| StrDLM;		--16 �؏����x�z
	OtStrDatAry	:= StrData;												--���z��

EXCEPTION
	WHEN	OTHERS	THEN

		RAISE ;

END	QPAP_CEnt080SyainDat;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080GetList										*/
/* �@�\			�F�Ј��Z���䒠���擾										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080GetList (
	 InStrSyainCd1		IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE				--�Ј��R�[�h�P
	,InStrSyainCd2		IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE				--�Ј��R�[�h�Q
	,InNumMaxRec		IN		NUMBER												--�ő�z��i�[����
	,IoNumSpCnt			IN	OUT	NUMBER												--�Ăяo����
	,OtNumRecCount			OUT	NUMBER												--����������
	,OtNumAryCount			OUT	NUMBER												--�z��i�[����
	,OtStrEndFlg			OUT	VARCHAR2											--�����I���t���O
	,OtStrDatAry			OUT	typUkeLogAry) IS									--���i�f�[�^�z��

	StrYusiKbnName			VARCHAR2(30);											--�Z���敪����


	CURSOR CurCEnt080 IS
		SELECT	 NVL(TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD'),' ')		YUSIYMD			--�Z����
				,TO_CHAR(QPA8_GENDOGAKU)							GENDOGAKU		--�Z�����x�z
				,NVL(QPA8_SYUBETU,' ')								SYUBETU			--�Z�����
				,TO_CHAR(QPA8_RIRITU)								RIRITU			--�_�񗘗�
				,TO_CHAR(QPA8_HENSAITUKISU)							HENSAITUKISU	--�ԍό���
				,TO_CHAR(QPA8_KYUYOHENSAIALL)						KYUYOHENSAIALL	--���^�ԍϑ��z
				,TO_CHAR(QPA8_KYUYOHENSAI)							KYUYOHENSAI		--���^�ԍϊz
				,TO_CHAR(QPA8_SYOYOHENSAIALL)						SYOYOHENSAIALL	--�ܗ^�ԍϑ��z
				,TO_CHAR(QPA8_SYOYOHENSAI)							SYOYOHENSAI		--�ܗ^�ԍϊz
				,TO_CHAR(QPA8_KYUYOZANDAKA)							KYUYOZANDAKA	--���^�c��
				,TO_CHAR(QPA8_SYOYOZANDAKA)							SYOYOZANDAKA	--�ܗ^�c��
				,NVL(QPA8_KOJOCYUSIFLG,' ')							KOUJOCHUSIFLG	--�T�����~�t���O
				,NVL(TO_CHAR(QPA8_KANSAIYMD,'YYYYMMDD'),' ')		KANSAIYMD		--���ϓ�
		FROM	QPA8_SYNDAICYOT
		WHERE	QPA8_PRMSYAINCD1		= InStrSyainCd1
		AND		RTRIM(QPA8_PRMSYAINCD2)	= InStrSyainCd2
	ORDER BY	QPA8_PRMYUSIYMD;

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;
	StrData				VARCHAR2(200);

	/* �s�ϐ� */
	RowQPA8				CurCEnt080%ROWTYPE;

BEGIN

	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP�ďo ���񎞂̂݃J�[�\���ݒ�
	IF IoNumSpCnt	= 0 THEN
		SELECT
			COUNT(*)
		INTO
			OtNumRecCount
		FROM	QPA8_SYNDAICYOT
		WHERE	QPA8_PRMSYAINCD1		= InStrSyainCd1
		AND		RTRIM(QPA8_PRMSYAINCD2)	= InStrSyainCd2;
	END IF;

	--SP�ďo�� �J�E���g�A�b�v
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--�J�[�\���I�[�v��
	IF CurCEnt080%ISOPEN = FALSE THEN
		OPEN CurCEnt080();
	END IF;

	--�e�d�s�b�g
	LOOP
		FETCH CurCEnt080 INTO RowQPA8;		--���ǂ�
		IF	CurCEnt080%NOTFOUND THEN
			EXIT;							--���[�v�I��
		END IF;

		/* �Z���敪���̎擾 */
		BEGIN
			SELECT	QPAH_NAMEN
			INTO	StrYusiKbnName
			FROM	QPAH_OTHERM
			WHERE	RTRIM(QPAH_NAMEX) = RTRIM(RowQPA8.SYUBETU)
			AND		(SUBSTRB(RTRIM(QPAH_PRMCODE), 1, 7) = 'RIIPPAN'
			OR		RTRIM(QPAH_PRMCODE) = 'RITOKUBETU');
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrYusiKbnName :=' ';
			WHEN OTHERS THEN
				IF CurCEnt080%ISOPEN THEN
					CLOSE CurCEnt080;
				END IF;
				RAISE ;
		END;

		/* �l�ݕt�f�[�^�ꗗ */
		StrData := Null;
		StrData := StrData	|| RTRIM(RowQPA8.YUSIYMD)			|| StrDLM;	--�Z����
		StrData := StrData	|| RTRIM(RowQPA8.GENDOGAKU)			|| StrDLM;	--�Z�����x�z
		StrData := StrData	|| RTRIM(RowQPA8.SYUBETU)			|| StrDLM;	--�Z�����
		StrData := StrData	|| RTRIM(RowQPA8.RIRITU)			|| StrDLM;	--�_�񗘗�
		StrData := StrData	|| RTRIM(RowQPA8.HENSAITUKISU)		|| StrDLM;	--�ԍό���
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOHENSAIALL)	|| StrDLM;	--���^�ԍϑ��z
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOHENSAI)		|| StrDLM;	--���^�ԍϊz
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOHENSAIALL)	|| StrDLM;	--�ܗ^�ԍϑ��z
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOHENSAI)		|| StrDLM;	--�ܗ^�ԍϊz
		StrData := StrData	|| RTRIM(RowQPA8.KYUYOZANDAKA)		|| StrDLM;	--���^�c��
		StrData := StrData	|| RTRIM(RowQPA8.SYOYOZANDAKA)		|| StrDLM;	--�ܗ^�c��
		StrData := StrData	|| RTRIM(RowQPA8.KOUJOCHUSIFLG)		|| StrDLM;	--�T�����~�t���O
		StrData := StrData	|| RTRIM(RowQPA8.KANSAIYMD)			|| StrDLM;	--���ϓ�
		StrData := StrData	|| RTRIM(StrYusiKbnName)			|| StrDLM;	--�Z���敪����

		OtStrDatAry(NumIdx)	:=	StrData;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;							--�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';					--�����I��
	OtNumAryCount	:=	NumIdx - 1;
	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt080;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt080%ISOPEN THEN
			CLOSE CurCEnt080;
		END IF;
		RAISE ;

END	QPAP_CEnt080GetList;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080SyainSearch									*/
/* �@�\			�F�Ј����񂹌���											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080SyainSearch (
	 InStrSyainMyouji	IN			VARCHAR2					--�Ј������J�i�c��
	,InStrSyainName		IN			VARCHAR2					--�Ј������J�i���O
	,InNumMaxRec		IN			NUMBER						--�ő�z��i�[����
	,IoNumSpCnt			IN	OUT		NUMBER						--�ďo��
	,OtNumRecCount			OUT		NUMBER						--����������
	,OtNumAryCount			OUT		NUMBER						--�z��i�[����
	,OtStrEndFlg			OUT		VARCHAR2					--�I���t���O
	,OtStrDatAryN			OUT		typNayoseDatAry) IS			--�Ј��f�[�^�z��

--	StrWHERE						VARCHAR(50);				--WHERE��

--	CURSOR CurCEnt080NAYOSE IS
--		SELECT	 NVL(QPAC_PRMSYAINCD1,' ')							SYAINCD1		--�Ј��R�[�h�P
--				,NVL(QPAC_PRMSYAINCD2,' ')							SYAINCD2		--�Ј��R�[�h�Q
--				,NVL(QPAC_SIMEIKANA,' ')							SIMEIKANA		--�����J�i
--				,NVL(QPAC_SIMEIKANJI,' ')							SIMEIKANJI		--��������
--				,NVL(QPAC_MISECD,' ')								MISECD			--�����X�R�[�h
--				,NVL(QPAC_TOZAIKBN,' ')								TOZAIKBN		--�����敪
--				,NVL(QPAC_BUMONCD,' ')								BUMONCD			--��������R�[�h
--				,NVL(QPAC_SIKAKUCD,' ')								SIKAKUCD		--���i�R�[�h
--				,NVL(QPAC_TOKYUCD,' ')								TOKYUCD			--�����R�[�h
--				,NVL(TO_CHAR(QPAC_BORNYMD,'YYYYMMDD'),' ')			SEINENGAPPI		--�N����
--				,NVL(TO_CHAR(QPAC_TAISYOKUYMD,'YYYYMMDD'),' ')		TAISYOKUYMD		--�ސE�N����
--				,NVL(TO_CHAR(QPAC_KYUSYOSTYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDFR	--�x�E�J�n�N����
--				,NVL(TO_CHAR(QPAC_KYUSYOEDYMD,'YYYYMMDD'),' ')		KYUSYOKUYMDED	--�x�E�I���N����
--		FROM	QPAC_SYAINM
--		WHERE	QPAC_SIMEIKANA LIKE StrWHERE
--	ORDER BY	QPAC_PRMSYAINCD1 || QPAC_PRMSYAINCD2;

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;
	StrData				VARCHAR2(200);

	/* �s�ϐ� */
	RowQPAC				CurCEnt080NAYOSE%ROWTYPE;

	StrMISENAME			VARCHAR2(24);
	StrBUMONNAME		VARCHAR2(24);

BEGIN

	IF InStrSyainMyouji = InStrSyainName THEN
		StrWHERE	 := InStrSyainMyouji || '%';
	ELSE
		StrWHERE	 := InStrSyainMyouji || '_' || InStrSyainName || '%';
	END IF;

	NumIdx		 := 1;
	OtstrEndFlg	 := '0';

	--SP�ďo ���񎞂̂݃J�[�\���ݒ�
	IF IoNumSpCnt	= 0 THEN
		SELECT	COUNT(*)
		INTO	OtNumRecCount
		FROM	QPAC_SYAINM
		WHERE	QPAC_SIMEIKANA LIKE StrWHERE;
	END IF;

	--SP�ďo�� �J�E���g�A�b�v
	IoNumSpCnt	:= IoNumSpCnt + 1;

	--�J�[�\���I�[�v��
	IF CurCEnt080NAYOSE%ISOPEN = FALSE THEN
		OPEN CurCEnt080NAYOSE();
	END IF;

	--�e�d�s�b�g
	LOOP
		FETCH CurCEnt080NAYOSE INTO RowQPAC;		--���ǂ�
		IF	CurCEnt080NAYOSE%NOTFOUND THEN
			EXIT;							--���[�v�I��
		END IF;

		/* �X�}�X�^����擾 */
		BEGIN
			SELECT	NVL(QPAE_MISENM,' ')
			INTO	StrMISENAME
			FROM	QPAE_MISEM
			WHERE	QPAE_PRMMISECD	= RTRIM(RowQPAC.MISECD);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrMISENAME := ' ';
			WHEN OTHERS THEN
				IF CurCEnt080NAYOSE%ISOPEN THEN
					CLOSE CurCEnt080NAYOSE;
				END IF;
				RAISE ;
		END;

		/* ����}�X�^����擾 */
		BEGIN
			SELECT	NVL(QPAF_BUMONNM,' ')
			INTO	StrBUMONNAME
			FROM	QPAF_BUMONM
			WHERE	QPAF_PRMMISECD	= RTRIM(RowQPAC.MISECD)
			AND		QPAF_PRMBUMONCD	= RTRIM(RowQPAC.BUMONCD);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				StrBUMONNAME := ' ';
			WHEN OTHERS THEN
				IF CurCEnt080NAYOSE%ISOPEN THEN
					CLOSE CurCEnt080NAYOSE;
				END IF;
				RAISE ;
		END;

		/* ���񂹌����f�[�^�ꗗ */
		StrData := Null;
		StrData := StrData	|| RTRIM(RowQPAC.SYAINCD1)						|| StrDLM;	--�Ј��R�[�h�P
		StrData := StrData	|| RTRIM(RowQPAC.SYAINCD2)						|| StrDLM;	--�Ј��R�[�h�Q
		StrData := StrData	|| RTRIM(RowQPAC.SIMEIKANJI)					|| StrDLM;	--��������
		StrData := StrData	|| RTRIM(RowQPAC.MISECD)						|| StrDLM;	--�����X�R�[�h
		StrData := StrData	|| RTRIM(RowQPAC.TOZAIKBN)						|| StrDLM;	--�����敪
		StrData := StrData	|| RTRIM(RowQPAC.BUMONCD)						|| StrDLM;	--��������R�[�h
		StrData := StrData	|| RTRIM(RowQPAC.SIKAKUCD)						|| StrDLM;	--���i�R�[�h
		StrData := StrData	|| RTRIM(RowQPAC.TOKYUCD)						|| StrDLM;	--�����R�[�h
		StrData := StrData	|| RTRIM(RowQPAC.SEINENGAPPI)					|| StrDLM;	--�N����
		StrData := StrData	|| RTRIM(RowQPAC.TAISYOKUYMD)					|| StrDLM;	--�ސE�N����
		StrData := StrData	|| RTRIM(RowQPAC.KYUSYOKUYMDFR)					|| StrDLM;	--�x�E�J�n�N����
		StrData := StrData	|| RTRIM(RowQPAC.KYUSYOKUYMDED)					|| StrDLM;	--�x�E�I���N����
		StrData := StrData	|| StrMISENAME									|| StrDLM;	--�����X����
		StrData := StrData	|| StrBUMONNAME									|| StrDLM;	--�������喼��
		StrData := StrData	|| RTRIM(RowQPAC.SIMEIKANA)						|| StrDLM;	--�����J�i

		OtStrDatAryN(NumIdx)	:=	StrData;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;							--�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
		END IF;

		NumIdx := NumIdx + 1;

	END LOOP;

	OtStrEndFlg	:=	'1';					--�����I��
	OtNumAryCount	:=	NumIdx - 1;
	/* �J�[�\���̃N���[�Y */
	CLOSE CurCEnt080NAYOSE;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurCEnt080NAYOSE%ISOPEN THEN
			CLOSE CurCEnt080NAYOSE;
		END IF;
		RAISE ;

END	QPAP_CEnt080SyainSearch;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080DatAdd										*/
/* �@�\			�F�Ј��Z���䒠�o�^����										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatAdd (
	 InStrSyainCd1			IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN		VARCHAR2									--�Z����
	,InStrGendogaku			IN		QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--�Z�����x�z
	,InStrSyubetu			IN		QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--���
	,InStrRiritu			IN		QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--����
	,InStrHensaiTsukisu		IN		QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--�ԍό���
	,InStrKyuyoHensaiAll	IN		QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--���^�ԍϑ��z
	,InStrKyuyoHensai		IN		QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--���^�ԍϊz
	,InStrSyoyoHensaiAll	IN		QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--�ܗ^�ԍϑ��z
	,InStrSyoyoHensai		IN		QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--�ܗ^�ԍϊz
	,InStrKyuyoZandaka		IN		QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--���^�c��
	,InStrSyoyoZandaka		IN		QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--�ܗ^�c��
	,InStrKojoChusiFlg		IN		QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--�T�����~�t���O
	,InStrKansaiYMD			IN		VARCHAR2									--���ϓ�
	,InStrMenuId			IN		QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN		QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN		QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN		QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN		QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN		QUS2_OPELOGT.QUS2_BUSHOCD%TYPE				--�����R�[�h	(�I�y���O�p)
	,OtChouhukuFlg				OUT	CHAR) IS									--�d���t���O

	numStep				NUMBER	:= 0;						--�����X�e�b�v
	numErr				NUMBER	:= 0;						--SQLCODE�̑ޔ�
	strErrMsg			VARCHAR2(100);						--SQLERRM�̑ޔ�
	recMsg				typMsg;
	strLogMsg			QUS2_OPELOGT.QUS2_MSG%TYPE;

	StrTOUROKUDATETIME	VARCHAR2(14);						--�o�^����

	numCNT				NUMBER;								--�d���`�F�b�N�p
BEGIN
		/* �I�y���O�ݒ� */
		recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';		--�e�[�u����
		recMsg.fldKousinKbn	:= '1';						--�X�V�敪
		recMsg.fldAcsKey	:= InStrYusiYMD;			--�X�V�L�[

		/* �o�̓p�����[�^�̏����� */
		StrTOUROKUDATETIME	:= NULL;

--ADD 20090329 0807073/0808052 NBC SUGAWARA START
                OtChouhukuFlg           := ' ';
--ADD 20090329 0807073/0808052 NBC SUGAWARA END

		/* �o�^�����̎擾 */
		SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
		INTO	StrTOUROKUDATETIME
		FROM	DUAL;

		/* �d���`�F�b�N */
		SELECT	COUNT(*)
		INTO	numCNT
		FROM	QPA8_SYNDAICYOT
		WHERE	NVL(QPA8_PRMSYAINCD1, ' ')			= InStrSyainCd1
		AND		RTRIM(NVL(QPA8_PRMSYAINCD2, ' '))	= RTRIM(InStrSyainCd2)
		AND		QPA8_PRMYUSIYMD						= TO_DATE(InStrYusiYMD);

		IF numCNT = 0 THEN

			/* �Ј��Z���䒠�s�֓o�^ */
			INSERT INTO QPA8_SYNDAICYOT VALUES (
				 InStrSyainCd1							--�Ј��R�[�h�P
				,InStrSyainCd2							--�Ј��R�[�h�Q
				,TO_DATE(InStrYusiYMD,'YYYYMMDD')		--�Z����
				,InStrGendogaku							--�Z�����x�z
				,InStrSyubetu							--�Z�����
				,InstrRiritu							--�_�񗘗�
				,InStrHensaiTsukisu						--�ԍό���
				,InstrKyuyoHensaiAll					--���^�ԍϑ��z
				,InstrKyuyoHensai						--���^�ԍϊz
				,InstrSyoyoHensaiAll					--�ܗ^�ԍϑ��z
				,InstrSyoyoHensai						--�ܗ^�ԍϊz
				,InStrKyuyoZandaka						--���^�c��
				,InStrSyoyoZandaka						--�ܗ^�c��
				,NULL									--�T�����~�t���O
				,NULL);									--���ϓ�

			COMMIT;

		ELSE
			OtChouhukuFlg := '1';
			RETURN;
		END IF;

		/* �I�y���O�o�� */
		numStep := 1;		/* �����X�e�b�v */
		recMsg.fldMsg	:= '�i' || InstrTantoMei || '�j�Ј��Z���䒠�ւ̓o�^�𐳏�ɍs�����B';
		strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKbn
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg;
		QPAP_CEnt080OpeLog(	 InStrMenuId
							,InStrModuleId
							,InStrTantoMei
							,InStrComputerMei
							,InStrRiyouKbn
							,InStrBushoCd
							,StrLogMsg);

--EXCEPTION
--	WHEN	OTHERS	THEN
--		numErr		:= SQLCODE;
--		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
--		ROLLBACK;
--
--		/* �I�y���O�o�� */
--		IF numStep < 1 THEN
--			recMsg.fldMsg	:= '�i' || InstrTantoMei || '�j�Ј��Z���䒠�ւ̓o�^�Ɏ��s�����B';
--			strLogMsg		:= recMsg.fldTableID
--							|| recMsg.fldKousinKbn
--							|| recMsg.fldAcsKey
--							|| recMsg.fldMsg
--							|| numErr || ' ' || strErrMsg;
--			QPAP_CEnt080OpeLog(	 InStrMenuId
--								,InStrModuleId
--								,InStrTantoMei
--								,InStrComputerMei
--								,InStrRiyouKbn
--								,InStrBushoCd
--								,StrLogMsg);
--		END IF ;
--
--		RAISE ;
END	QPAP_CEnt080DatAdd;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080DatUpd										*/
/* �@�\			�F�Ј��Z���䒠�̍X�V										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatUpd (
	 InStrSyainCd1			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN	VARCHAR2									--�Z����
	,InStrGendogaku			IN	QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE			--�Z�����x�z
	,InStrSyubetu			IN	QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE			--���
	,InStrRiritu			IN	QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE			--����
	,InStrHensaiTsukisu		IN	QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE		--�ԍό���
	,InStrKyuyoHensaiAll	IN	QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE	--���^�ԍϑ��z
	,InStrKyuyoHensai		IN	QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE		--���^�ԍϊz
	,InStrSyoyoHensaiAll	IN	QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE	--�ܗ^�ԍϑ��z
	,InStrSyoyoHensai		IN	QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE		--�ܗ^�ԍϊz
	,InStrKyuyoZandaka		IN	QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE		--���^�c��
	,InStrSyoyoZandaka		IN	QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE		--�ܗ^�c��
	,InStrKojoChusiFlg		IN	QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE		--�T�����~�t���O
	,InStrKansaiYMD			IN	VARCHAR2									--���ϓ�
	,InStrMenuId			IN	QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN	QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN	QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN	QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN	QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN	QUS2_OPELOGT.QUS2_BUSHOCD%TYPE) IS			--�����R�[�h	(�I�y���O�p)

	numStep		NUMBER	:= 0;								--�����X�e�b�v
	numErr		NUMBER	:= 0;								--SQLCODE�̑ޔ�
	strErrMsg	VARCHAR2(100);								--SQLERRM�̑ޔ�
	recMsg		typMsg;
	strLogMsg	QUS2_OPELOGT.QUS2_MSG%TYPE;

	StrKOUSINDATETIME	VARCHAR2(14);						--�X�V����

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';				--�e�[�u����
	recMsg.fldKousinKbn	:= '2';								--�X�V�敪
	recMsg.fldAcsKey	:= InStrYusiYMD;					--�X�V�L�[

	/* �o�̓p�����[�^�̏����� */
	StrKousinDateTime	:= NULL;

	/*  �X�V�����̎擾  */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
	INTO	StrKOUSINDATETIME
	FROM	DUAL;

	/* �Ј��Z���䒠�̍X�V */
	UPDATE QPA8_SYNDAICYOT SET
			 QPA8_GENDOGAKU			=	InStrGendogaku						--�Z�����x�z
			,QPA8_SYUBETU			=	InStrSyubetu						--�Z�����
			,QPA8_RIRITU			=	InstrRiritu							--�_�񗘗�
			,QPA8_HENSAITUKISU		=	InStrHensaiTsukisu					--�ԍό���
			,QPA8_KYUYOHENSAIALL	=	InstrKyuyoHensaiAll					--���^�ԍϑ��z
			,QPA8_KYUYOHENSAI		=	InstrKyuyoHensai					--���^�ԍϊz
			,QPA8_SYOYOHENSAIALL	=	InstrSyoyoHensaiAll					--�ܗ^�ԍϑ��z
			,QPA8_SYOYOHENSAI		=	InstrSyoyoHensai					--�ܗ^�ԍϊz
			,QPA8_KYUYOZANDAKA		=	InStrKyuyoZandaka					--���^�c��
			,QPA8_SYOYOZANDAKA		=	InStrSyoyoZandaka					--�ܗ^�c��
			,QPA8_KOJOCYUSIFLG		=	InStrKojoChusiFlg					--�T�����~�t���O
			,QPA8_KANSAIYMD			=	TO_DATE(InStrKansaiYMD,'YYYYMMDD')	--���ϓ�
	WHERE	QPA8_PRMSYAINCD1		=	InStrSyainCd1						--�X�V�L�[ �Ј��R�[�h�P
	AND		QPA8_PRMSYAINCD2		=	InStrSyainCd2						--�X�V�L�[ �Ј��R�[�h�Q
	AND		QPA8_PRMYUSIYMD			=	TO_DATE(InStrYusiYMD,'YYYYMMDD');	--�X�V�L�[ �Z����

	COMMIT;

	/* �I�y���O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InstrTantoMei || '�j�Ј��Z���䒠�ւ̍X�V�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKbn
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt080OpeLog(	 InStrMenuId
						,InStrModuleId
						,InStrTantoMei
						,InStrComputerMei
						,InStrRiyouKbn
						,InStrBushoCd
						,StrLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		ROLLBACK;

		/* �I�y���O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InstrTantoMei || '�Ј��Z���䒠�ւ̍X�V�Ɏ��s�����B';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKbn
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt080OpeLog(	 InStrMenuId
								,InStrModuleId
								,InStrTantoMei
								,InStrComputerMei
								,InStrRiyouKbn
								,InStrBushoCd
								,StrLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt080DatUpd;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt080DatDel										*/
/* �@�\			�F�Ј��Z���䒠����폜										*/
/****************************************************************************/
PROCEDURE QPAP_CEnt080DatDel (
	 InStrSyainCd1			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE		--�Ј��R�[�h�P
	,InStrSyainCd2			IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE		--�Ј��R�[�h�Q
	,InStrYusiYMD			IN	VARCHAR2									--�Z����
	,InStrMenuId			IN	QUS2_OPELOGT.QUS2_MENUID%TYPE				--���j���[ID	(�I�y���O�p)
	,InStrModuleId			IN	QUS2_OPELOGT.QUS2_MODULEID%TYPE				--���W���[��ID	(�I�y���O�p)
	,InStrTantoMei			IN	QUS2_OPELOGT.QUS2_USERID%TYPE				--�o�^�S����	(�I�y���O�p)
	,InStrComputerMei		IN	QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE			--�R���s���[�^��(�I�y���O�p)
	,InStrRiyouKbn			IN	QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE			--���p�敪		(�I�y���O�p)
	,InStrBushoCd			IN	QUS2_OPELOGT.QUS2_BUSHOCD%TYPE) IS			--�����R�[�h	(�I�y���O�p)

	numStep		NUMBER	:= 0;												--�����X�e�b�v
	numErr		NUMBER	:= 0;												--SQLCODE�̑ޔ�
	strErrMsg	VARCHAR2(100);												--SQLERRM�̑ޔ�
	recMsg		typMsg;
	strLogMsg	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���O�ݒ� */
	recMsg.fldTableID	:= 'QPA8_SYNDAICYOT';		--�e�[�u����
	recMsg.fldKousinKbn	:= '3';						--�X�V�敪
	recMsg.fldAcsKey	:= InStrYusiYMD;			--�X�V�L�[

	/* �Ј��Z���䒠�̍폜 */
	DELETE FROM QPA8_SYNDAICYOT
	WHERE	QPA8_PRMSYAINCD1	= InStrSyainCd1
	AND		QPA8_PRMSYAINCD2	= InStrSyainCd2
	AND		QPA8_PRMYUSIYMD		= TO_DATE(InStrYusiYMD,'YYYYMMDD');

	COMMIT;

	/* �I�y���O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InstrTantoMei || '�j�Ј��Z���䒠����̍폜�𐳏�ɍs�����B';
	strLogMsg		:= recMsg.fldTableID
					|| recMsg.fldKousinKbn
					|| recMsg.fldAcsKey
					|| recMsg.fldMsg;
	QPAP_CEnt080OpeLog(	 InStrMenuId
						,InStrModuleId
						,InStrTantoMei
						,InStrComputerMei
						,InStrRiyouKbn
						,InStrBushoCd
						,StrLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InstrTantoMei || '�j�Ј��Z���䒠����̍폜�Ɏ��s�����B';
			strLogMsg		:= recMsg.fldTableID
							|| recMsg.fldKousinKbn
							|| recMsg.fldAcsKey
							|| recMsg.fldMsg
							|| numErr || ' ' || strErrMsg;
			QPAP_CEnt080OpeLog(	 InStrMenuId
								,InStrModuleId
								,InStrTantoMei
								,InStrComputerMei
								,InStrRiyouKbn
								,InStrBushoCd
								,StrLogMsg);
		END IF ;

		RAISE ;
END	QPAP_CEnt080DatDel;

END QPAP_CEnt080PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR