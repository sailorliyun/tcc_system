CREATE OR REPLACE PACKAGE  QPAP_CEnt410PKG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��ݕt                                                  */
/* ���W���[����  �FQPAP_CEnt410PKG                                           */
/* �@�\          �F���ϒʒm��                                                */
/* �쐬��        �F2005/01/20                                                */
/* �쐬��        �FFIP SEKINE                                                */
/*****************************************************************************/

/*****************************************************************************/
/*								�P  �錾��								     */
/*****************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
-- �R�[�h�e�[�u��
	TYPE typQSA3Ary		IS	TABLE OF VARCHAR2(100)
		INDEX BY BINARY_INTEGER;
-- �ꗗ��������
	TYPE typDataAry IS TABLE OF VARCHAR2(150)
		INDEX BY BINARY_INTEGER;

--WK�e�[�u�� �o�^�p
-- �Ј��R�[�h�P
	TYPE typSyainCd1Ary IS TABLE OF VARCHAR2(1)
		INDEX BY BINARY_INTEGER;
-- �Ј��R�[�h�Q
	TYPE typSyainCd2Ary IS TABLE OF VARCHAR2(7)
		INDEX BY BINARY_INTEGER;
-- �Z����
	TYPE typYushibiAry IS TABLE OF VARCHAR2(10)
		INDEX BY BINARY_INTEGER;
-- �Z�����i�a��j
	TYPE typYushibiWaAry IS TABLE OF VARCHAR2(20)
		INDEX BY BINARY_INTEGER;
-- �\���p����
	TYPE typDispNmAry IS TABLE OF VARCHAR2(30)
		INDEX BY BINARY_INTEGER;
-- �X�R�[�h
	TYPE typTenCdAry IS TABLE OF VARCHAR2(3)
		INDEX BY BINARY_INTEGER;
-- �����X����
	TYPE typTenNmAry IS TABLE OF VARCHAR2(24)
		INDEX BY BINARY_INTEGER;
-- �����敪
	TYPE typTozaiAry IS TABLE OF VARCHAR2(2)
		INDEX BY BINARY_INTEGER;
-- ��������R�[�h
	TYPE typBumonCdAry IS TABLE OF VARCHAR2(6)
		INDEX BY BINARY_INTEGER;
-- �������喼��
	TYPE typBumonNmAry IS TABLE OF VARCHAR2(24)
		INDEX BY BINARY_INTEGER;
-- �Z�����z
	TYPE typYushiKngAry IS TABLE OF VARCHAR2(13)
		INDEX BY BINARY_INTEGER;
-- ���ϓ�
	TYPE typKansaibiAry IS TABLE OF VARCHAR2(10)
		INDEX BY BINARY_INTEGER;
-- ���ϓ��i�a��j
	TYPE typKansaibiWaAry IS TABLE OF VARCHAR2(20)
		INDEX BY BINARY_INTEGER;

/* �R�[�h�r���[���� */
PROCEDURE	QPAP_CEnt410SelCodeV (
	InStrCodeKbn		IN	VARCHAR2,										--�R�[�h�敪
	OtNumCodeCount		OUT	NUMBER,											--�R�[�h����
	OtStrCodeAry		OUT	typQSA3Ary);									--�R�[�h���̔z��

/* ��������  */
PROCEDURE   QPAP_CEnt410Init (
	OtStrSysDate		OUT	CHAR,											--�T�[�o�[�r�x�r�s�d�l���t
	OtNumDP4Count		OUT	NUMBER,											--DP4 ���s��     �z��i�[����
	OtStrDP4Ary			OUT	typQSA3Ary,										--               �z��
	OtNumDP5Count		OUT	NUMBER,											--DP5 ���s�ҏ�� �z��i�[����
	OtStrDP5Ary			OUT	typQSA3Ary,										--               �z��
	OtNumDP6Count		OUT	NUMBER,											--DP6 ���[������ �z��i�[����
	OtStrDP6Ary			OUT	typQSA3Ary);									--               �z��

/* �ꗗ���� */
PROCEDURE	QPAP_CEnt410ListSel (
	InStrKansaibiFr		IN	VARCHAR2,										--���������F���ϓ�From
	InStrKansaibiTo		IN	VARCHAR2,										--        �F���ϓ�To
	InStrSyainCd1		IN	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE,				--        �F�Ј��R�[�h�P
	InStrSyainCd2		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE,				--        �F�Ј��R�[�h�Q
	InNumMaxRec			IN	NUMBER,											--�ő�z��i�[����
	IoNumFetchCount	 IN OUT	NUMBER,											--�ǂݍ��݌���
	IoNumCursor		 IN OUT	NUMBER,											--�J�[�\���h�c
	IoNumRecCount	 IN OUT	NUMBER,											--����������
	OtNumAryCount		OUT	NUMBER,											--�z��i�[����
	OtStrEndFlg			OUT	VARCHAR2,										--�����I���t���O
	OtStrDataAry		OUT	typDataAry);									--�����f�[�^�z��

/* ���ϒʒm�v�j�e�[�u���̓o�^ */
PROCEDURE	QPAP_CEnt410InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--�R���s���[�^��
	InNumAryCount		IN	NUMBER,											--�z��i�[����
	InStrSyainCd1Ary	IN	typSyainCd1Ary,									--�Ј��R�[�h�P �z��
	InStrSyainCd2Ary	IN	typSyainCd2Ary,									--�Ј��R�[�h�Q �z��
	InStrYushibiAry		IN	typYushibiAry,									--�Z���� �z��
	InStrYushibiWaAry	IN	typYushibiWaAry,								--�Z�����i�a��j �z��
	InStrDispNmAry		IN	typDispNmAry,									--�\���p�Ј����� �z��
	InStrTenCdAry		IN	typTenCdAry,									--�����X�R�[�h �z��
	InStrTenNmAry		IN	typTenNmAry,									--�����X���� �z��
	InStrTozaiAry		IN	typTozaiAry,									--�����敪
	InStrBumonCdAry		IN	typBumonCdAry,									--��������R�[�h �z��
	InStrBumonNmAry		IN	typBumonNmAry,									--�������喼�� �z��
	InStrYushiKngAry	IN	typYushiKngAry,									--�Z�����z �z��
	InStrKansaibiAry	IN	typKansaibiAry,									--���ϓ� �z��
	InStrKansaibiWaAry	IN	typKansaibiWaAry,								--���ϓ��i�a��j �z��
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--�Œ荀�ځF���s��
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        �F���s�ҏ��P
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        �F���s�ҏ��Q
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        �F���s�ҏ��R
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        �F���s�ҏ��S
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        �F���[������
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE,			--        �F�Ώێ҈ꗗ�^�C�g��
	InStrDeleteFlg		IN	CHAR);											--�폜�e�k�f ������ɍs��
    
/* ���ϒʒm�v�j�e�[�u���̍폜 */
PROCEDURE	QPAP_CEnt410DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE);			--�R���s���[�^��



END QPAP_CEnt410PKG;
/
SHOW ERROR

/*****************************************************************************/
/*								�Q  �{�f�B�[							     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt410PKG IS

/* �����������̂݊J������e�[�u�� */

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITAAnsyo		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITAAnsyo    , -20022);


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt410SelCodeV                                      */
/* �@�\          �F�R�[�h�r���[����                                          */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410SelCodeV (
	InStrCodeKbn			IN	VARCHAR2,							--�R�[�h�敪
	OtNumCodeCount			OUT	NUMBER,								--�R�[�h����
	OtStrCodeAry			OUT	typQSA3Ary) IS						--�R�[�h���̔z��

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;
	StrData				VARCHAR2(2000);

	/* �R�[�h�u�h�d�v�J�[�\�� */
	CURSOR CurQSA3(PRMCODEKBN_I	IN VARCHAR2) IS
		SELECT
			QSA3_PRMCODENO,
			RTRIM(QSA3_MEI) QSA3_MEI
		FROM
			QSA3_CodeV
		WHERE
			QSA3_PRMCODEKBN	= PRMCODEKBN_I
		ORDER BY
			QSA3_PRMCODENO;

	/* �s�ϐ� */
	RowQSA3				CurQSA3%ROWTYPE;			--�R�[�h�u�h�d�v�J�[�\��

BEGIN

	/* �o�̓p�����[�^�̏����� */
	OtNumCodeCount	:=	0;

	IF CurQSA3%ISOPEN = FALSE THEN
		/* �R�[�h�u�h�d�v�J�[�\���̃I�[�v�� */
		OPEN CurQSA3(InStrCodeKbn);
	END IF;

	NumIdx			:= 0;

	LOOP

		FETCH CurQSA3 INTO RowQSA3;			--���ǂ�
		IF	CurQSA3%NOTFOUND THEN
			EXIT;							--���[�v�I��
		END IF;

		/* �R�[�h�u�h�d�v���̏o�̓p�����[�^�̕ҏW */
		NumIdx := NumIdx + 1;

		StrData := Null;
		StrData := StrData || RowQSA3.QSA3_PRMCODENO		|| StrDLM;	--�R�[�h�m�n
		StrData := StrData || RowQSA3.QSA3_MEI				|| StrDLM;	--�R�[�h����
		OtStrCodeAry(NumIdx)	:= StrData;		--�R�[�h�u�h�d�v���z��

	END LOOP;

	OtNumCodeCount	:=	NumIdx;
	/* �R�[�h�u�h�d�v�J�[�\���̃N���[�Y */
	CLOSE CurQSA3;

EXCEPTION
	WHEN	OTHERS	THEN
		IF CurQSA3%ISOPEN THEN
			CLOSE CurQSA3;
		END IF;
		RAISE ;
END	QPAP_CEnt410SelCodeV;

/*****************************************************************************/
/* ���W���[����		�FQPAP_CEnt410Init										 */
/* �@�\				�F��������												 */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt410Init (
	OtStrSysDate		OUT	CHAR,										--�T�[�o�[�r�x�r�s�d�l���t
	OtNumDP4Count		OUT	NUMBER,										--DP4 ���s��     �z��i�[����
	OtStrDP4Ary			OUT	typQSA3Ary,									--               �z��
	OtNumDP5Count		OUT	NUMBER,										--DP5 ���s�ҏ�� �z��i�[����
	OtStrDP5Ary			OUT	typQSA3Ary,									--               �z��
	OtNumDP6Count		OUT	NUMBER,										--DP6 ���[������ �z��i�[����
	OtStrDP6Ary			OUT	typQSA3Ary) IS								--               �z��
	--�����ʂ̕ϐ�
	NumWk				NUMBER;

BEGIN

	/* �T�[�o�[�r�x�r�s�d�l���t�擾 */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')	INTO	OtStrSysDate	FROM	DUAL;

	/* ���s�� �i�����E���́j */
	QPAP_CEnt410SelCodeV (
		'DP4',								--�R�[�h�敪
		OtNumDP4Count,						--���s�� ����
		OtStrDP4Ary);						--���s�� �z��

	/* ���s�ҏ��i�����E���́j */
	QPAP_CEnt410SelCodeV (
		'DP5',								--�R�[�h�敪
		OtNumDP5Count,						--���s�ҏ�� ����
		OtStrDP5Ary);						--���s�ҏ�� �z��

	/* ���[�����́i�����E���́j */
	QPAP_CEnt410SelCodeV (
		'DP6',								--�R�[�h�敪
		OtNumDP6Count,						--���[������ ����
		OtStrDP6Ary);						--���[������ �z��

END QPAP_CEnt410Init;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt410ListSel                                       */
/* �@�\          �F�ꗗ����                                                  */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410ListSel (
	InStrKansaibiFr		IN	VARCHAR2,										--���������F���ϓ�From
	InStrKansaibiTo		IN	VARCHAR2,										--        �F���ϓ�To
	InStrSyainCd1		IN	QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE,				--        �F�Ј��R�[�h�P
	InStrSyainCd2		IN	QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE,				--        �F�Ј��R�[�h�Q
	InNumMaxRec			IN	NUMBER,											--�ő�z��i�[����
	IoNumFetchCount	 IN OUT	NUMBER,											--�ǂݍ��݌���
	IoNumCursor		 IN OUT	NUMBER,											--�J�[�\���h�c
	IoNumRecCount	 IN OUT	NUMBER,											--����������
	OtNumAryCount		OUT	NUMBER,											--�z��i�[����
	OtStrEndFlg			OUT	VARCHAR2,										--�����I���t���O
	OtStrDataAry		OUT	typDataAry) IS									--�����f�[�^�z��

	/* �����ʂ̕ϐ� */
	NumSumCount			NUMBER;
	NumIdx				NUMBER;
	StrData				VARCHAR2(850);

	/* ���I�J�[�\���̕ϐ� */
	NumRows				NUMBER;
	CurCount			NUMBER	:= 0;									--�J�[�\���h�c�\������
	CurKansai			NUMBER	:= 0;									--�J�[�\���h�c�莆�ꗗ
	StrSQL				VARCHAR2(3000);									--Statement
	StrWHERE			VARCHAR2(2000);									--Statement

	/* �e�d�s�b�g�̖߂�l�ϐ� */
	NumCount			NUMBER;											--�\������

	--�ꗗ��������
	strPRMSyainCD1		QPA8_SynDaicyoT.QPA8_PRMSyainCD1%TYPE;		--01 �Ј��R�[�h�P
	strPRMSyainCD2		QPA8_SynDaicyoT.QPA8_PRMSyainCD2%TYPE;		--02 �Ј��R�[�h�Q
	strYushibi			VARCHAR2(10);								--03 �Z����
	strKansaibi			VARCHAR2(10);								--04 ���ϓ�
	strYushiKng			VARCHAR2(13);								--05 �Z���z
	strSimeiKana		QPAC_SyainM.QPAC_SimeiKana%TYPE;			--06 �����J�i
	strSimeiKanji		QPAC_SyainM.QPAC_SimeiKanji%TYPE;			--07 ��������
	strMiseCD			QPAC_SyainM.QPAC_MiseCD%TYPE;				--08 �����X�R�[�h
	strTozaiKBN			QPAC_SyainM.QPAC_TozaiKBN%TYPE;				--09 �����敪
	strBumonCD			QPAC_SyainM.QPAC_BumonCD%TYPE;				--10 ��������R�[�h
	strMiseNm			QPAE_MiseM.QPAE_MiseNm%TYPE;				--11 �����X��
	strBumonNm			QPAF_BumonM.QPAF_BumonNm%TYPE;				--12 ���喼

BEGIN

	/* �o�̓p�����[�^�̃N���A */
	OtNumAryCount		:= 0;
	OtStrEndFlg			:= '0';

	IF IoNumCursor = 0 THEN

		/* ���I�r�p�k�v�g�d�q�d���쐬 */
		StrWHERE	:= NULL;

		--������ �Ј��R�[�h�̏��� ������
--		IF InStrSyainCd1		IS NOT NULL	AND
--		   RTRIM(InStrSyainCd2)	IS NOT NULL	THEN
		IF RTRIM(InStrSyainCd2)	IS NOT NULL	THEN
			IF StrWHERE	IS NULL	THEN
				StrWHERE	:=	StrWHERE	||	' WHERE QPA8_PRMSYAINCD1 = '''	||	InStrSyainCd1	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = '''	||	InStrSyainCd2	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD IS NOT NULL ';
			ELSE
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD1  = '''	||	InStrSyainCd1	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2  = '''	||	InStrSyainCd2	||	'''';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD IS NOT NULL ';
			END IF;
		END IF;

		--������ ���ϓ�FromTo�̏���  ���P���w��ׁ̈A�K��FromTo������(VB���Ő���) ������
		IF RTRIM(InStrKansaibiFr)	IS NOT NULL	AND
		   RTRIM(InStrKansaibiTo)	IS NOT NULL	THEN
			IF StrWHERE	IS NULL	THEN
				StrWHERE	:=	StrWHERE	||	' WHERE QPA8_KANSAIYMD >= TO_DATE('''	||	InStrKansaibiFr	|| ''',''YYYY/MM/DD'')';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD <= TO_DATE('''	||	InStrKansaibiTo	|| ''',''YYYY/MM/DD'')';
			ELSE
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD >= TO_DATE('''	||	InStrKansaibiFr	|| ''',''YYYY/MM/DD'')';
				StrWHERE	:=	StrWHERE	||	'   AND QPA8_KANSAIYMD <= TO_DATE('''	||	InStrKansaibiTo	|| ''',''YYYY/MM/DD'')';
			END IF;
		END IF;

		--����
		IF StrWHERE	IS NULL THEN
			StrWHERE	:=	StrWHERE	||	' WHERE QPA8_PRMSYAINCD1 = QPAC_PRMSYAINCD1(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = QPAC_PRMSYAINCD2(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAE_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAF_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_BUMONCD = QPAF_PRMBUMONCD(+) ';
		ELSE
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD1 = QPAC_PRMSYAINCD1(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPA8_PRMSYAINCD2 = QPAC_PRMSYAINCD2(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAE_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_MISECD = QPAF_PRMMISECD(+) ';
			StrWHERE	:=	StrWHERE	||	'   AND QPAC_BUMONCD = QPAF_PRMBUMONCD(+) ';
		END IF;

		/* �\�������擾�r�d�k�d�b�s���쐬 */
		StrSQL	:=	NULL;
		StrSQL	:=	StrSQL	||	'SELECT';
		StrSQL	:=	StrSQL	||	' COUNT(*) ';					--����
		StrSQL	:=	StrSQL	||	'FROM ';
		StrSQL	:=	StrSQL	||	'    QPA8_SynDaicyoT ';			--�Ј��ݕt�䒠�e�[�u��
		StrSQL	:=	StrSQL	||	',   QPAC_SyainM ';				--�Ј��}�X�^
		StrSQL	:=	StrSQL	||	',   QPAE_MiseM ';				--�X�}�X�^
		StrSQL	:=	StrSQL	||	',   QPAF_BumonM ';				--����}�X�^
		StrSQL	:=	StrSQL	||	StrWHERE;						--�v�g�d�q�d��

		/* �\�������J�[�\���̃I�[�v�� */
		CurCount  := DBMS_SQL.OPEN_CURSOR;

		/* SQL�̉�� */
		DBMS_SQL.PARSE (CurCount,StrSQL, DBMS_SQL.v7);

		/* SQL�̎��s */
		NumRows := DBMS_SQL.EXECUTE ( CurCount );

		/* ���[�J���ϐ��ւ̊֘A�Â� */
		DBMS_SQL.DEFINE_COLUMN(CurCount, 1,NumCount);				--�\������

		NumSumCount := 0;
		WHILE DBMS_SQL.FETCH_ROWS (CurCount) <> 0 LOOP
			/* �J�����l��ϐ��֊i�[ */
			DBMS_SQL.COLUMN_VALUE(CurCount,  1,NumCount);			--�\������
			NumSumCount := NumSumCount + NumCount;
		END LOOP;

		/* �\�������J�[�\���̃N���[�Y */
		DBMS_SQL.CLOSE_CURSOR (CurCount);

		IoNumRecCount	:=	NumSumCount;			--�p�����[�^�ɃZ�b�g

	END IF;

	IF IoNumCursor = 0 THEN
		/* ���I�r�p�k�r�d�k�d�b�s���쐬 */
		StrSQL	:=	NULL;
		StrSQL	:= StrSQL	||	'SELECT';
		StrSQL	:= StrSQL	||	'    QPA8_PRMSYAINCD1 ';									--01 �Ј��R�[�h�P
		StrSQL	:= StrSQL	||	',   QPA8_PRMSYAINCD2 ';									--02 �Ј��R�[�h�Q
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_PRMYUSIYMD,''YYYY/MM/DD'') ';				--03 �Z����
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_KANSAIYMD,''YYYY/MM/DD'') ';				--04 ���ϓ�
		StrSQL	:= StrSQL	||	',   TO_CHAR(QPA8_KYUYOHENSAIALL + QPA8_SYOYOHENSAIALL) ';	--05 �Z���z
		StrSQL	:= StrSQL	||	',   QPAC_SIMEIKANA ';										--06 �����J�i
		StrSQL	:= StrSQL	||	',   QPAC_SIMEIKANJI ';										--07 ��������
		StrSQL	:= StrSQL	||	',   QPAC_MISECD ';											--08 �����X�R�[�h
		StrSQL	:= StrSQL	||	',   QPAC_TOZAIKBN ';										--09 �����敪
		StrSQL	:= StrSQL	||	',   QPAC_BUMONCD ';										--10 ��������R�[�h
		StrSQL	:= StrSQL	||	',   QPAE_MISENM ';											--11 �����X��
		StrSQL	:= StrSQL	||	',   QPAF_BUMONNM ';										--12 �������喼
		StrSQL	:= StrSQL	||	'FROM ';
		StrSQL	:= StrSQL	||	'    QPA8_SynDaicyoT ';				--�Ј��ݕt�䒠
		StrSQL	:= StrSQL	||	',   QPAC_SyainM ';					--�Ј��}�X�^
		StrSQL	:= StrSQL	||	',   QPAE_MiseM ';					--�X�}�X�^
		StrSQL	:= StrSQL	||	',   QPAF_BumonM ';					--����}�X�^
		StrSQL	:= StrSQL	||	StrWHERE;							--�v�g�d�q�d��
		StrSQL	:= StrSQL	||	' ORDER BY 8 ASC, 2 ASC, 3 ASC';

		/* ���I�J�[�\���̃I�[�v�� */
		CurKansai  := DBMS_SQL.OPEN_CURSOR;

		/* SQL�̉�� */
		DBMS_SQL.PARSE (CurKansai,StrSQL, DBMS_SQL.v7);

		/* SQL�̎��s */
		NumRows := DBMS_SQL.EXECUTE ( CurKansai );

	ELSE
		CurKansai  := IoNumCursor;			--�Q��ڈȍ~�̓J�[�\�����ė��p����
	END IF;
	IoNumCursor :=  CurKansai;		--�p�����[�^�ɃZ�b�g

	/* ���[�J���ϐ��ւ̊֘A�Â� */
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   1,strPRMSyainCD1,       1);		--01 �Ј��R�[�h�P
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   2,strPRMSyainCD2,       7);		--02 �Ј��R�[�h�Q
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   3,strYushibi,          10);		--03 �Z����
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   4,strKansaibi,         10);		--04 ���ϓ�
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   5,strYushiKng,         13);		--05 �Z���z
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   6,strSimeiKana,        15);		--05 �����J�i
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   7,strSimeiKanji,       20);		--06 ��������
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   8,strMiseCD,            3);		--07 �����X�R�[�h
	DBMS_SQL.DEFINE_COLUMN(CurKansai,   9,strTozaiKBN,          1);		--08 �����敪
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  10,strBumonCD,           6);		--09 ��������R�[�h
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  11,strMiseNm,           24);		--10 �����X��
	DBMS_SQL.DEFINE_COLUMN(CurKansai,  12,strBumonNm,          24);		--11 ���喼

	NumIdx := 0;

	<< LoopCurKansai >>
	WHILE DBMS_SQL.FETCH_ROWS (CurKansai) <> 0 LOOP

		IoNumFetchCount := IoNumFetchCount + 1;

		/* �J�����l��ϐ��֊i�[ */
		DBMS_SQL.COLUMN_VALUE(CurKansai,   1,strPRMSyainCD1);		--01 �Ј��R�[�h�P
		DBMS_SQL.COLUMN_VALUE(CurKansai,   2,strPRMSyainCD2);		--02 �Ј��R�[�h�Q
		DBMS_SQL.COLUMN_VALUE(CurKansai,   3,strYushibi);			--03 �Z����
		DBMS_SQL.COLUMN_VALUE(CurKansai,   4,strKansaibi);			--04 ���ϓ�
		DBMS_SQL.COLUMN_VALUE(CurKansai,   5,strYushiKng);			--05 �Z���z
		DBMS_SQL.COLUMN_VALUE(CurKansai,   6,strSimeiKana);			--06 �����J�i
		DBMS_SQL.COLUMN_VALUE(CurKansai,   7,strSimeiKanji);		--07 ��������
		DBMS_SQL.COLUMN_VALUE(CurKansai,   8,strMiseCD);			--08 �����X�R�[�h
		DBMS_SQL.COLUMN_VALUE(CurKansai,   9,strTozaiKBN);			--09 �����敪
		DBMS_SQL.COLUMN_VALUE(CurKansai,  10,strBumonCD);			--10 ��������R�[�h
		DBMS_SQL.COLUMN_VALUE(CurKansai,  11,strMiseNm);			--11 �����X��
		DBMS_SQL.COLUMN_VALUE(CurKansai,  12,strBumonNm);			--12 ���喼

		StrData := NULL;
		StrData := StrData || strPRMSyainCD1			|| StrDLM;	--01 �Ј��R�[�h�P
		StrData := StrData || strPRMSyainCD2			|| StrDLM;	--02 �Ј��R�[�h�Q
		StrData := StrData || strYushibi				|| StrDLM;	--03 �Z����
		StrData := StrData || strKansaibi				|| StrDLM;	--04 ���ϓ�
		StrData := StrData || strYushiKng				|| StrDLM;	--05 �Z���z
		StrData := StrData || strSimeiKana				|| StrDLM;	--06 �����J�i
		StrData := StrData || strSimeiKanji				|| StrDLM;	--07 ��������
		StrData := StrData || strMiseCD					|| StrDLM;	--08 �����X�R�[�h
		StrData := StrData || strTozaiKBN				|| StrDLM;	--09 �����敪
		StrData := StrData || strBumonCD				|| StrDLM;	--10 ��������R�[�h
		StrData := StrData || strMiseNm					|| StrDLM;	--11 �����X��
		StrData := StrData || strBumonNm				|| StrDLM;	--12 ���喼

		NumIdx					:= NumIdx + 1;
		OtStrDataAry(NumIdx)	:= StrData;			--�p�����[�^�ɃZ�b�g

		IF NumIdx >= InNumMaxRec THEN
			OtNumAryCount	:= NumIdx;				--�p�����[�^�ɃZ�b�g
			RETURN;								--�v���V�[�W���̏I���i���I�J�[�\�����N���[�Y���Ȃ��j
		END IF;

	END LOOP LoopCurKansai;

	OtNumAryCount	:= NumIdx;				--�p�����[�^�ɃZ�b�g
	OtStrEndFlg		:= '1';					--�p�����[�^�ɃZ�b�g�i�����I���j
	/* ���I�J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (CurKansai);

EXCEPTION
	WHEN	OTHERS	THEN
		IF DBMS_SQL.IS_OPEN (CurCount) THEN
			DBMS_SQL.CLOSE_CURSOR (CurCount);
		END IF;
		IF DBMS_SQL.IS_OPEN (CurKansai) THEN
			DBMS_SQL.CLOSE_CURSOR (CurKansai);
		END IF;
		RAISE ;
END	QPAP_CEnt410ListSel;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt410InsWkTbl                                      */
/* �@�\          �F���ϒʒm�v�j�e�[�u���̓o�^                                */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt410InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--�R���s���[�^��
	InNumAryCount		IN	NUMBER,											--�z��i�[����
	InStrSyainCd1Ary	IN	typSyainCd1Ary,									--�Ј��R�[�h�P �z��
	InStrSyainCd2Ary	IN	typSyainCd2Ary,									--�Ј��R�[�h�Q �z��
	InStrYushibiAry		IN	typYushibiAry,									--�Z���� �z��
	InStrYushibiWaAry	IN	typYushibiWaAry,								--�Z�����i�a��j �z��
	InStrDispNmAry		IN	typDispNmAry,									--�\���p�Ј����� �z��
	InStrTenCdAry		IN	typTenCdAry,									--�����X�R�[�h �z��
	InStrTenNmAry		IN	typTenNmAry,									--�����X���� �z��
	InStrTozaiAry		IN	typTozaiAry,									--�����敪
	InStrBumonCdAry		IN	typBumonCdAry,									--��������R�[�h �z��
	InStrBumonNmAry		IN	typBumonNmAry,									--�������喼�� �z��
	InStrYushiKngAry	IN	typYushiKngAry,									--�Z�����z �z��
	InStrKansaibiAry	IN	typKansaibiAry,									--���ϓ� �z��
	InStrKansaibiWaAry	IN	typKansaibiWaAry,								--���ϓ��i�a��j �z��
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--�Œ荀�ځF���s��
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        �F���s�ҏ��P
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        �F���s�ҏ��Q
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        �F���s�ҏ��R
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        �F���s�ҏ��S
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        �F���[������
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE,			--        �F�Ώێ҈ꗗ�^�C�g��
	InStrDeleteFlg		IN	CHAR) IS										--�폜�e�k�f ������ɍs��

	/* �����ŗL�̕ϐ� */

BEGIN

	/* ����f�[�^�̃N���A�r�o */
	IF InStrDeleteFlg	= '1' THEN
		QPAP_CEnt410DelWkTbl(
			InStrOperatorID			--�I�y���[�^�h�c
		,	InStrComputerMei		--�R���s���[�^��
		);
	END IF;

	<<LoopInsWk>>
	FOR i IN 1..InNumAryCount LOOP

		/* �h�m�r�d�q�s */
		INSERT INTO QPAZ_KansaiWT VALUES
		   (SUBSTRB(InStrComputerMei,1,20)		--01 �R���s���[�^�[��
		,   SUBSTRB(InStrOperatorID,1,8)		--02 �I�y���[�^�[�h�c
		,	InStrSyainCd1Ary(i)					--03 �Ј��R�[�h�P
		,	InStrSyainCd2Ary(i)					--04 �Ј��R�[�h�Q
		,	InStrYushibiAry(i)					--05 �Z����
		,	InStrYushibiWaAry(i)				--06 �Z�����i�a��j
		,	InStrDispNmAry(i)					--07 �\���p����
		,	InStrTenCdAry(i)					--08 �����X�R�[�h
		,	InStrTenNmAry(i)					--09 �����X��
		,	InStrTozaiAry(i)					--10 �����敪
		,	InStrBumonCdAry(i)					--11 ��������R�[�h
		,	InStrBumonNmAry(i)					--12 �������喼
		,	InStrYushiKngAry(i)					--13 �Z�����z
		,	InStrKansaibiAry(i)					--14 ���ϓ�
		,	InStrKansaibiWaAry(i)				--15 ���ϓ��i�a��j
		,	InStrHakkoubi						--16 ���s��
		,	InStrHakkouInfo1					--17 ���s�ҏ��P
		,	InStrHakkouInfo2					--18 ���s�ҏ��Q
		,	InStrHakkouInfo3					--19 ���s�ҏ��R
		,	InStrHakkouInfo4					--20 ���s�ҏ��S
		,	InStrLoanNm							--21 ���[������
		,	InStrTitle							--22 �Ώێ҈ꗗ�^�C�g��
		);

	END LOOP LoopInsWk;

	--COMMIT
	COMMIT;

 EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt410InsWkTbl;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt410DelWkTbl                                      */
/* �@�\          �F���ϒʒm�v�j�e�[�u���̍폜                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt410DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE) IS			--�R���s���[�^��

BEGIN

	DELETE
		FROM QPAZ_KansaiWT
	WHERE
			QPAZ_TANMATSUID		= InStrComputerMei
		AND	QPAZ_TANTOID		= InStrOperatorID;

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt410DelWkTbl;


END QPAP_CEnt410PKG;
/***END of LINE****************************************************************/
/
SHOW ERROR
