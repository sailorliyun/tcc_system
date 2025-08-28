CREATE OR REPLACE PACKAGE  QPAP_CEnt110PkG IS
/****************************************************************************/
/* �V�X�e����	�F�������N���W�b�g�V�X�e��									*/
/* �Ɩ���		�F�l�ݕt����												*/
/* ���W���[����	�FQPAP_CEnt110PkG											*/
/* �@�\			�F��t�Ɖ�													*/
/* �쐬��		�F															*/
/* �쐬��		�FFIP														*/
/****************************************************************************/
/****************************************************************************/
/*								�P  �錾��									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typPageKBNAry	IS TABLE OF NUMBER(2)     INDEX BY BINARY_INTEGER;	--�y�[�W�敪�z��
	TYPE typNenKBNAry	IS TABLE OF NUMBER(2)     INDEX BY BINARY_INTEGER;	--�N�敪�z��
	TYPE typKBNAry		IS TABLE OF VARCHAR2(10)  INDEX BY BINARY_INTEGER;	--�敪�z��
	TYPE typKijituAry	IS TABLE OF VARCHAR2(20)  INDEX BY BINARY_INTEGER;	--�ԍϊ����z��
	TYPE typHensaiAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--�ԍϋ��z�z��
	TYPE typZandakaAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--�c���z��
	TYPE typKyuGanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--���^���{�z��
	TYPE typKyuRskAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--���^�����z��
	TYPE typKyuZanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--���^�c���z��
	TYPE typSyoGanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--�ܗ^���{�z��
	TYPE typSyoRskAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--�ܗ^�����z��
	TYPE typSyoZanAry	IS TABLE OF NUMBER(7)     INDEX BY BINARY_INTEGER;	--�ܗ^�c���z��

/* �������� */
PROCEDURE	QPAP_CEnt110Init (
	 OtStrSysDate		OUT	VARCHAR2);				--�T�[�o�[�r�x�r�s�d�l���t

/* �Ј��f�[�^�擾 */
PROCEDURE QPAP_CEnt110SyainDat (
	 InStrSyainCd1		IN		CHAR			--�Ј��R�[�h�P
	,InStrSyainCd2		IN		CHAR			--�Ј��R�[�h�Q
	,OtStrDatAry			OUT	VARCHAR2);		--�Ј������f�[�^�i��؂蕶���j

/* �Z���f�[�^�擾 */
PROCEDURE QPAP_CEnt110SelList (
	 InStrSyainCD1		IN		CHAR			--���o�L�[�@�Ј��R�[�h�P
	,InStrSyainCD2		IN		CHAR			--���o�L�[�@�Ј��R�[�h�Q
	,InStrYuusibi		IN		CHAR			--���o�L�[�@�Z����
	,OtStrDatAry			OUT	VARCHAR2);		--�擾�f�[�^�i��؂蕶���j

/* ���[�p���[�N�e�[�u���o�^ */
PROCEDURE QPAP_CEnt110PrintAdd (
	 InStrSyainCD1		IN	CHAR			--�Ј��R�[�h�P
	,InStrSyainCD2		IN	CHAR        	--�Ј��R�[�h�Q
	,InStrSimei			IN	VARCHAR2    	--����
	,InStrMiseNm		IN	VARCHAR2    	--�X��
	,InStrYusiYMD		IN	VARCHAR2    	--�Z���N����
	,InStrRiritu		IN	VARCHAR2    	--����
	,InNumYusiKng		IN	NUMBER      	--�Z�����z
	,InNumKyuHensai		IN	NUMBER      	--���^�ԍϊz
	,InNumSyoHensai		IN	NUMBER      	--�ܗ^�ԍϊz
	,InNumAryCount		IN	NUMBER      	--�z�񌏐�
	,InNumPageKBNAry	IN	typPageKBNAry	--�y�[�W�敪�z��
	,InNumNenKBNAry		IN	typNenKBNAry	--�N�敪�z��
	,InStrKBNAry		IN	typKBNAry		--�敪�z��
	,InStrKijituAry		IN	typKijituAry	--�ԍϊ����z��
	,InNumHensaiAry		IN	typHensaiAry	--�ԍϋ��z�z��
	,InNumZandakaAry	IN	typZandakaAry	--�c���z��
	,InNumKyuGanAry		IN	typKyuGanAry	--���^���{�z��
	,InNumKyuRskAry		IN	typKyuRskAry	--���^�����z��
	,InNumKyuZanAry		IN	typKyuZanAry	--���^�c���z��
	,InNumSyoGanAry		IN	typSyoGanAry	--�ܗ^���{�z��
	,InNumSyoRskAry		IN	typSyoRskAry	--�ܗ^�����z��
	,InNumSyoZanAry		IN	typSyoZanAry	--�ܗ^�c���z��
	,InStrCOMPUTERMEI	IN	VARCHAR2);		--�R���s���[�^��

/* ���[�p���[�N�e�[�u���폜 */
PROCEDURE QPAP_CEnt110PrintDel (
	 InStrCOMPUTERMEI	IN	VARCHAR2);		--�R���s���[�^�[��

END QPAP_CEnt110PkG;
/
SHOW ERROR

/****************************************************************************/
/*								�Q  �{�f�B�[								*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt110PkG IS

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);

	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		/* �e�[�u����   */
		fldKousinKbn	CHAR(1),		/* �X�V�敪     */
		fldAcsKey		CHAR(50),		/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)		/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;


/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt110Init											*/
/* �@�\			�F�l�ݕt���׏�������										*/
/****************************************************************************/
PROCEDURE	QPAP_CEnt110Init (
	 OtStrSysDate		OUT	VARCHAR2) IS	--�T�[�o�[�r�x�r�s�d�l���t

BEGIN

	/* �T�[�o�[�V�X�e�����t */
	SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO OtStrSysDate FROM DUAL;

END	QPAP_CEnt110Init;


/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt100SyainDat										*/
/* �@�\			�F�Ј��f�[�^�̎擾											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110SyainDat (
	 InStrSyainCd1	IN		CHAR								--�Ј��R�[�h�P
	,InStrSyainCd2	IN		CHAR								--�Ј��R�[�h�Q
	,OtStrDatAry		OUT	VARCHAR2) IS						--�����f�[�^�z��

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
	StrMISENAME				CHAR(24);							--12 �X����
	StrBonusMD1				CHAR(4);							--13 �{�[�i�X�x�����P
	StrBonusMD2				CHAR(4);							--14 �{�[�i�X�x�����Q
	StrBUMONNAME			VARCHAR2(24);						--15 ���喼��

	StrData					VARCHAR2(3000);

BEGIN

	IF NVL(InStrSyainCd1, ' ') = ' ' THEN
		BEGIN
			/* �Ј��}�X�^����擾 */
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
			WHERE	QPAC_PRMSyainCD2 = InStrSyainCd2;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	ELSE
		BEGIN
			/* �Ј��}�X�^����擾 */
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
	END IF;

	/* �X�}�X�^����X���́A�ܗ^�x�����P�A�ܗ^�x�����Q�擾 */
	BEGIN
		SELECT	 NVL(QPAE_MISENM,' ')
				,NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 StrMISENAME
				,StrBonusMD1
				,StrBonusMD2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= StrMISECD;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			StrMISENAME := '';
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
			StrBUMONNAME := '';
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
	StrData := StrData || RTRIM(StrBonusMD1)			|| StrDLM;		--13 �X����
	StrData := StrData || RTRIM(StrBonusMD2)			|| StrDLM;		--14 �X����
	StrData := StrData || RTRIM(StrBUMONNAME)			|| StrDLM;		--15 ���喼��
	OtStrDatAry	:= StrData;										--���z��

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;

END	QPAP_CEnt110SyainDat;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt110SelList										*/
/* �@�\			�F�Z���f�[�^�擾											*/
/****************************************************************************/
/* �Z���f�[�^�擾 */
PROCEDURE QPAP_CEnt110SelList (
	 InStrSyainCD1		IN		CHAR				--���o�L�[�@�Ј��R�[�h�P
	,InStrSyainCD2		IN		CHAR				--���o�L�[�@�Ј��R�[�h�Q
	,InStrYuusibi		IN		CHAR				--���o�L�[�@�Z����
	,OtStrDatAry			OUT	VARCHAR2) IS		--�擾�f�[�^�i��؂蕶���j

	STRPRMSYAINCD1		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
	STRPRMSYAINCD2		QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
	STRPRMYUSIYMD		CHAR(8);
	STRGENDOGAKU		VARCHAR2(7);
	STRSYUBETU			QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
	STRRIRITU			VARCHAR2(10);
	STRHENSAITUKISU		VARCHAR2(2);
	STRKYUYOHENSAIALL	VARCHAR2(7);
	STRKYUYOHENSAI		VARCHAR2(7);
	STRSYOYOHENSAIALL	VARCHAR2(7);
	STRSYOYOHENSAI		VARCHAR2(7);
	STRKYUYOZANDAKA		VARCHAR2(7);
	STRSYOYOZANDAKA		VARCHAR2(7);
	STRKOJOCYUSIFLG		VARCHAR2(7);
	STRKANSAIYMD		CHAR(8);

	StrData					VARCHAR2(3000);

BEGIN

	IF NVL(InStrSyainCd1, ' ') = ' ' THEN
		BEGIN
			SELECT
				 NVL(QPA8_PRMSYAINCD1, ' ')
				,NVL(QPA8_PRMSYAINCD2, ' ')
				,TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')
				,TO_CHAR(QPA8_GENDOGAKU)
				,NVL(QPA8_SYUBETU, ' ')
				,TO_CHAR(QPA8_RIRITU)
				,TO_CHAR(QPA8_HENSAITUKISU)
				,TO_CHAR(QPA8_KYUYOHENSAIALL)
				,TO_CHAR(QPA8_KYUYOHENSAI)
				,TO_CHAR(QPA8_SYOYOHENSAIALL)
				,TO_CHAR(QPA8_SYOYOHENSAI)
				,TO_CHAR(QPA8_KYUYOZANDAKA)
				,TO_CHAR(QPA8_SYOYOZANDAKA)
				,NVL(QPA8_KOJOCYUSIFLG, ' ')
				,TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD')
			INTO
				 STRPRMSYAINCD1
				,STRPRMSYAINCD2
				,STRPRMYUSIYMD
				,STRGENDOGAKU
				,STRSYUBETU
				,STRRIRITU
				,STRHENSAITUKISU
				,STRKYUYOHENSAIALL
				,STRKYUYOHENSAI
				,STRSYOYOHENSAIALL
				,STRSYOYOHENSAI
				,STRKYUYOZANDAKA
				,STRSYOYOZANDAKA
				,STRKOJOCYUSIFLG
				,STRKANSAIYMD
			FROM
				QPA8_SYNDAICYOT
			WHERE	QPA8_PRMSYAINCD2 = InStrSyainCD2
			AND		TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')  = InStrYuusibi;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	ELSE
		BEGIN
			SELECT
				 NVL(QPA8_PRMSYAINCD1, ' ')
				,NVL(QPA8_PRMSYAINCD2, ' ')
				,TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')
				,TO_CHAR(QPA8_GENDOGAKU)
				,NVL(QPA8_SYUBETU, ' ')
				,TO_CHAR(QPA8_RIRITU)
				,TO_CHAR(QPA8_HENSAITUKISU)
				,TO_CHAR(QPA8_KYUYOHENSAIALL)
				,TO_CHAR(QPA8_KYUYOHENSAI)
				,TO_CHAR(QPA8_SYOYOHENSAIALL)
				,TO_CHAR(QPA8_SYOYOHENSAI)
				,TO_CHAR(QPA8_KYUYOZANDAKA)
				,TO_CHAR(QPA8_SYOYOZANDAKA)
				,NVL(QPA8_KOJOCYUSIFLG, ' ')
				,TO_CHAR(QPA8_KANSAIYMD, 'YYYYMMDD')
			INTO
				 STRPRMSYAINCD1
				,STRPRMSYAINCD2
				,STRPRMYUSIYMD
				,STRGENDOGAKU
				,STRSYUBETU
				,STRRIRITU
				,STRHENSAITUKISU
				,STRKYUYOHENSAIALL
				,STRKYUYOHENSAI
				,STRSYOYOHENSAIALL
				,STRSYOYOHENSAI
				,STRKYUYOZANDAKA
				,STRSYOYOZANDAKA
				,STRKOJOCYUSIFLG
				,STRKANSAIYMD
			FROM
				QPA8_SYNDAICYOT
			WHERE	QPA8_PRMSYAINCD1 = InStrSyainCD1
			AND		QPA8_PRMSYAINCD2 = InStrSyainCD2
			AND		TO_CHAR(QPA8_PRMYUSIYMD, 'YYYYMMDD')  = InStrYuusibi;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RETURN;
		END;
	END IF;

	/* �o�͔z��֊i�[ */
	StrData := Null;
	StrData := StrData || RTRIM(STRPRMSYAINCD1)		|| StrDLM;		--01 �Ј��R�[�h�P
	StrData := StrData || RTRIM(STRPRMSYAINCD2)		|| StrDLM;		--02 �Ј��R�[�h�Q
	StrData := StrData || RTRIM(STRPRMYUSIYMD)		|| StrDLM;		--03 �Z����
	StrData := StrData || RTRIM(STRGENDOGAKU)		|| StrDLM;		--04 �Z�����x�z
	StrData := StrData || RTRIM(STRSYUBETU)			|| StrDLM;		--05 �Z�����
	StrData := StrData || RTRIM(STRRIRITU)			|| StrDLM;		--06 �_�񗘗�
	StrData := StrData || RTRIM(STRHENSAITUKISU)	|| StrDLM;		--07 �ԍό���
	StrData := StrData || RTRIM(STRKYUYOHENSAIALL)	|| StrDLM;		--08 ���^�ԍϑ��z
	StrData := StrData || RTRIM(STRKYUYOHENSAI)		|| StrDLM;		--09 ���^�ԍϊz
	StrData := StrData || RTRIM(STRSYOYOHENSAIALL)	|| StrDLM;		--10 �ܗ^�ԍϑ��z
	StrData := StrData || RTRIM(STRSYOYOHENSAI)		|| StrDLM;		--11 �ܗ^�ԍϊz
	StrData := StrData || RTRIM(STRKYUYOZANDAKA)	|| StrDLM;		--12 ���^�c��
	StrData := StrData || RTRIM(STRSYOYOZANDAKA)	|| StrDLM;		--13 �ܗ^�c��
	StrData := StrData || RTRIM(STRKOJOCYUSIFLG)	|| StrDLM;		--14 �T�����~�t���O
	StrData := StrData || RTRIM(STRKANSAIYMD)		|| StrDLM;		--15 ���ϓ�
	OtStrDatAry	:= StrData;											--���z��

EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;
END	QPAP_CEnt110SelList;
/****************************************************************************/
/* ���W���[����	�FQAAP_CEnt020PrintAdd										*/
/* �@�\			�F���[�p���[�N�e�[�u���o�^									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110PrintAdd (
	 InStrSyainCD1		IN	CHAR			--�Ј��R�[�h�P
	,InStrSyainCD2		IN	CHAR        	--�Ј��R�[�h�Q
	,InStrSimei			IN	VARCHAR2    	--����
	,InStrMiseNm		IN	VARCHAR2    	--�X��
	,InStrYusiYMD		IN	VARCHAR2    	--�Z���N����
	,InStrRiritu		IN	VARCHAR2    	--����
	,InNumYusiKng		IN	NUMBER      	--�Z�����z
	,InNumKyuHensai		IN	NUMBER      	--���^�ԍϊz
	,InNumSyoHensai		IN	NUMBER      	--�ܗ^�ԍϊz
	,InNumAryCount		IN	NUMBER      	--�z�񌏐�
	,InNumPageKBNAry	IN	typPageKBNAry	--�y�[�W�敪�z��
	,InNumNenKBNAry		IN	typNenKBNAry	--�N�敪�z��
	,InStrKBNAry		IN	typKBNAry		--�敪�z��
	,InStrKijituAry		IN	typKijituAry	--�ԍϊ����z��
	,InNumHensaiAry		IN	typHensaiAry	--�ԍϋ��z�z��
	,InNumZandakaAry	IN	typZandakaAry	--�c���z��
	,InNumKyuGanAry		IN	typKyuGanAry	--���^���{�z��
	,InNumKyuRskAry		IN	typKyuRskAry	--���^�����z��
	,InNumKyuZanAry		IN	typKyuZanAry	--���^�c���z��
	,InNumSyoGanAry		IN	typSyoGanAry	--�ܗ^���{�z��
	,InNumSyoRskAry		IN	typSyoRskAry	--�ܗ^�����z��
	,InNumSyoZanAry		IN	typSyoZanAry	--�ܗ^�c���z��
	,InStrCOMPUTERMEI	IN	VARCHAR2) IS	--�R���s���[�^��

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
END	QPAP_CEnt110PrintAdd;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt110PrintDel										*/
/* �@�\			�F���[�p���[�N�e�[�u���폜									*/
/****************************************************************************/
PROCEDURE QPAP_CEnt110PrintDel (
	 InStrCOMPUTERMEI	IN	VARCHAR2) IS	--�R���s���[�^�[��

BEGIN

	DELETE	FROM QPAL_HENYOW
	WHERE	RTRIM(QPAL_COMPUTERMEI) = RTRIM(InStrCOMPUTERMEI);

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;
END	QPAP_CEnt110PrintDel;


END QPAP_CEnt110PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR