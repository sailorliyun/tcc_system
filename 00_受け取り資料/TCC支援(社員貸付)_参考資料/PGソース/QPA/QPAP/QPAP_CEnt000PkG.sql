CREATE OR REPLACE PACKAGE  QPAP_CEnt000PkG IS
/*****************************************************************************/
/* �V�X�e�����@�@�F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ����@�@�@�@�F�Ј��ݕt�V�X�e���@�@                                      */
/* ���W���[�����@�FQPAP_CEnt000PkG                                           */
/* �@�\      �@�@�F�Ј��ݕt�V�X�e�����ʏ���                                  */
/* �쐬��        �F2001/07/07                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtSyaCD1Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE	--�Ј��R�[�h�P
						INDEX BY BINARY_INTEGER;
	TYPE typOtSyaCD2Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE	--�Ј��R�[�h�Q
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKnAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANA%TYPE		--�����J�i
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKjAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE	--��������
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE		--�X�R�[�h
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE		--�X����
						INDEX BY BINARY_INTEGER;
	TYPE typOtTziKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE		--�����敪
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE		--����R�[�h
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE		--���喼��
						INDEX BY BINARY_INTEGER;

/*****************************************************************************/
/*�P�@�錾��								     */
/*****************************************************************************/

/* �T�[�o���t */
PROCEDURE   QPAP_CEnt000SysDate (
    OtStrSysDate            OUT CHAR);                                       --�T�[�o�[�r�x�r�s�d�l���t

/* ���񂹏��� */
PROCEDURE QPAP_CEnt000Nayose (
	 InStrName		IN	VARCHAR2				--���o�L�[�@��������
	,InNumMaxRec		IN	NUMBER					--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER					--�Ăяo����
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--�Ј��R�[�h�P�z��
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--�Ј��R�[�h�Q�z��
	,OtSimeiKana		OUT	typOtSimeKnAry				--�����J�i�z��
	,OtSimeiKanji		OUT	typOtSimeKjAry				--���������z��
	,OtMiseCD		OUT	typOtMiseCDAry				--�X�R�[�h�z��
	,OtMiseNM		OUT	typOtMiseNMAry				--�X���̔z��
	,OtTozaiKBN		OUT	typOtTziKBNAry				--�����敪�z��
	,OtBumonCD		OUT	typOtBumnCDAry				--����R�[�h�z��
	,OtBumonNM		OUT	typOtBumnNMAry				--���喼�̔z��
	,OtNumAryCount		OUT	NUMBER					--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2);				--�����I���t���O

/* ���Ѓ}�X�^�̌��� */
PROCEDURE	QPAP_CEnt000SelJisyaM (
	InStrCode		IN	QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE,
	OtStrZaimu		OUT	QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE,
	OtStrSyozai		OUT	QPAB_JISYAM.QPAB_SYOZAICHI%TYPE,
	OtStrKaisya		OUT	QPAB_JISYAM.QPAB_KAISYANM%TYPE,
	OtStrFurikomi		OUT	QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE,
	OtStrKozaNo		OUT	QPAB_JISYAM.QPAB_KOZANO%TYPE,
	OtStrKozaNm		OUT	QPAB_JISYAM.QPAB_KOZANM%TYPE,
	OtStrKamiStM		OUT	QPAB_JISYAM.QPAB_KAMISTM%TYPE,
	OtStrKamiStD		OUT	QPAB_JISYAM.QPAB_KAMISTD%TYPE,
	OtStrSimoStM		OUT	QPAB_JISYAM.QPAB_SIMOSTM%TYPE,
	OtStrSimoStD		OUT	QPAB_JISYAM.QPAB_SIMOSTD%TYPE,
	OtStrFlg		OUT	CHAR);

/* ���̑��}�X�^�̌��� */
PROCEDURE	QPAP_CEnt000SelOtherM (
	InStrCode		IN	QPAH_OTHERM.QPAH_PRMCODE%TYPE,
	OtStrNameN		OUT	QPAH_OTHERM.QPAH_NAMEN%TYPE,
	OtStrNameX		OUT	QPAH_OTHERM.QPAH_NAMEX%TYPE,
	OtNumRiritu		OUT	QPAH_OTHERM.QPAH_RIRITU%TYPE,
	OtNumSGendo		OUT	QPAH_OTHERM.QPAH_SGENDO%TYPE,
	OtNumKGendo		OUT	QPAH_OTHERM.QPAH_KGENDO%TYPE,
	OtStrFlg		OUT	CHAR);

END QPAP_CEnt000PkG;
/
show error

/*****************************************************************************/
/*�Q�@�{�f�B�[							     	     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt000PkG IS

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt000SysDate                                       */
/* �@�\          �F�T�[�o���t�擾                                            */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt000SysDate (
    OtStrSysDate            OUT CHAR) IS                                   --�T�[�o�[�r�x�r�s�d�l���t
    --�����ʂ̕ϐ�
BEGIN

    /* �T�[�o�[�r�x�r�s�d�l���t�擾 */
    SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO OtStrSysDate FROM DUAL;

END QPAP_CEnt000SysDate;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt000Nayose                                                                             */
/* �@�\          �F���񂹏���                                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt000Nayose (
	 InStrName		IN	VARCHAR2				--���o�L�[�@��������
	,InNumMaxRec		IN	NUMBER					--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER					--�Ăяo����
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--�Ј��R�[�h�P�z��
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--�Ј��R�[�h�Q�z��
	,OtSimeiKana		OUT	typOtSimeKnAry				--�����J�i�z��
	,OtSimeiKanji		OUT	typOtSimeKjAry				--���������z��
	,OtMiseCD		OUT	typOtMiseCDAry				--�X�R�[�h�z��
	,OtMiseNM		OUT	typOtMiseNMAry				--�X���̔z��
	,OtTozaiKBN		OUT	typOtTziKBNAry				--�����敪�z��
	,OtBumonCD		OUT	typOtBumnCDAry				--����R�[�h�z��
	,OtBumonNM		OUT	typOtBumnNMAry				--���喼�̔z��
	,OtNumAryCount		OUT	NUMBER					--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2) IS				--�����I���t���O
	
	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;					--�z��pIDX
	v_CursorID			INTEGER;				--�J�[�\��ID
	v_SelectStmt			VARCHAR2(1000);				--SQL������
	v_WhereStmt			VARCHAR2(500);				--SQL������
	v_SyainCD1     			QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE;	--�o�C���h�p�Ј��R�[�h1
	v_SyainCD2     			QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE;	--�o�C���h�p�Ј��R�[�h2
	v_SimeiKana    			QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;	--�o�C���h�p�����J�i
	v_SimeiKanji   			QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;	--�o�C���h�p��������
	v_MiseCD       			QPAC_SYAINM.QPAC_MISECD%TYPE;		--�o�C���h�p�����X�R�[�h
	v_MiseNM			QPAE_MISEM.QPAE_MISENM%TYPE;		--�o�C���h�p�����X����
	v_TozaiKBN     			QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;		--�o�C���h�p�����敪
	v_BumonCD      			QPAC_SYAINM.QPAC_BUMONCD%TYPE;		--�o�C���h�p��������R�[�h
        v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;		--�o�C���h�p�������喼��
	v_Dummy				INTEGER;				--Dummy

BEGIN

	--�������Ɏg�p����J�[�\�����I�[�v������
	IF IoNumSpCnt = 0 THEN
		/* ������ */
		OtstrEndFlg	:= '0';
		NumIdx		:= 0;

		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--�⍇��������̍쐬
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  C.QPAC_PRMSYAINCD1,C.QPAC_PRMSYAINCD2,C.QPAC_SIMEIKANA,
					  C.QPAC_SIMEIKANJI,C.QPAC_MISECD,E.QPAE_MISENM,C.QPAC_TOZAIKBN,
					  C.QPAC_BUMONCD,F.QPAF_BUMONNM
				 FROM 	  QPAC_SYAINM C,QPAD_SYASEIM D,QPAE_MISEM E,QPAF_BUMONM F
				 WHERE    C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)
				 AND      C.QPAC_MISECD  = F.QPAF_PRMMISECD (+)
				 AND      C.QPAC_MISECD  = E.QPAE_PRMMISECD (+)
				 AND      C.QPAC_PRMSYAINCD1 = D.QPAD_PRMSYAINCD1 (+)
				 AND      C.QPAC_PRMSYAINCD2 = D.QPAD_PRMSYAINCD2 (+)
				 AND 	  C.QPAC_SIMEIKANA  LIKE :LikeName
				 ORDER BY C.QPAC_PRMSYAINCD2';

		--�⍇������͂���
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--���͕ϐ����o�C���h����
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':LikeName',InStrName || '%');

		--���s����
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;

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

	--FETCH LOOP��
	LOOP
		NumIdx := NumIdx + 1;

		--��A�̍s���o�b�t�@�Ɏ��o��������LOOP�̏I���������`�F�b�N����
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';					--�����I��
			EXIT;							--���[�v�I��
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

		OtSyainCD1(NumIdx)    := NVL(v_SyainCD1,' ');
		OtSyainCD2(NumIdx)    := NVL(v_SyainCD2,' ');
		OtSimeiKana(NumIdx)   := NVL(v_SimeiKana,' ');
		OtSimeiKanji(NumIdx)  := NVL(v_SimeiKanji,' ');
		OtMiseCD(NumIdx)      := NVL(v_MiseCD,' ');
		OtMiseNM(NumIdx)      := NVL(v_MiseNM,' ');
		OtTozaiKBN(NumIdx)    := NVL(v_TozaiKBN,' ');
		OtBumonCD(NumIdx)     := NVL(v_BumonCD,' ');
		OtBumonNM(NumIdx)     := NVL(v_BumonNM,' ');

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount := NumIdx;
			RETURN;							--�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE ;

END	QPAP_CEnt000Nayose;

/*****************************************************************************/
/* ���W���[�����@�FQPAP_CEnt000SelJisyaM	                             */
/* �@�\      �@�@�F���Ѓ}�X�^�̌���                                          */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt000SelJisyaM (
	InStrCode		IN	QPAB_JISYAM.QPAB_PRMKAISYACD%TYPE,
	OtStrZaimu		OUT	QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE,
	OtStrSyozai		OUT	QPAB_JISYAM.QPAB_SYOZAICHI%TYPE,
	OtStrKaisya		OUT	QPAB_JISYAM.QPAB_KAISYANM%TYPE,
	OtStrFurikomi		OUT	QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE,
	OtStrKozaNo		OUT	QPAB_JISYAM.QPAB_KOZANO%TYPE,
	OtStrKozaNm		OUT	QPAB_JISYAM.QPAB_KOZANM%TYPE,
	OtStrKamiStM		OUT	QPAB_JISYAM.QPAB_KAMISTM%TYPE,
	OtStrKamiStD		OUT	QPAB_JISYAM.QPAB_KAMISTD%TYPE,
	OtStrSimoStM		OUT	QPAB_JISYAM.QPAB_SIMOSTM%TYPE,
	OtStrSimoStD		OUT	QPAB_JISYAM.QPAB_SIMOSTD%TYPE,
	OtStrFlg		OUT	CHAR) IS

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtStrZaimu := ' ';
	OtStrSyozai := ' ';
	OtStrKaisya := ' ';
	OtStrFurikomi := ' ';
	OtStrKozaNo := ' ';
	OtStrKozaNm := ' ';
	OtStrKamiStM := ' ';
	OtStrKamiStD := ' ';
	OtStrSimoStM := ' ';
	OtStrSimoStD := ' ';
	OtStrFlg := '0';

	BEGIN
		SELECT	NVL(QPAB_ZAIMUKYOKUCD,' '),
			NVL(QPAB_SYOZAICHI,' '),
			NVL(QPAB_KAISYANM,' '),
			NVL(QPAB_FURIKOMIBK,' '),
			NVL(QPAB_KOZANO,' '),
			NVL(QPAB_KOZANM,' '),
			NVL(QPAB_KAMISTM,' '),
			NVL(QPAB_KAMISTD,' '),
			NVL(QPAB_SIMOSTM,' '),
			NVL(QPAB_SIMOSTD,' ')
		INTO	OtStrZaimu,
			OtStrSyozai,
			OtStrKaisya,
			OtStrFurikomi,
			OtStrKozaNo,
			OtStrKozaNm,
			OtStrKamiStM,
			OtStrKamiStD,
			OtStrSimoStM,
			OtStrSimoStD
		FROM	QPAB_JISYAM
		WHERE	QPAB_PRMKAISYACD = InStrCode;
	EXCEPTION
		WHEN	NO_DATA_FOUND	THEN
			RETURN;
	END;

	OtStrFlg := '1';

END	QPAP_CEnt000SelJisyaM;

/*****************************************************************************/
/* ���W���[�����@�FQPAP_CEnt000SelOtherM	                             */
/* �@�\      �@�@�F���̑��}�X�^�̌���                                        */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt000SelOtherM (
	InStrCode		IN	QPAH_OTHERM.QPAH_PRMCODE%TYPE,
	OtStrNameN		OUT	QPAH_OTHERM.QPAH_NAMEN%TYPE,
	OtStrNameX		OUT	QPAH_OTHERM.QPAH_NAMEX%TYPE,
	OtNumRiritu		OUT	QPAH_OTHERM.QPAH_RIRITU%TYPE,
	OtNumSGendo		OUT	QPAH_OTHERM.QPAH_SGENDO%TYPE,
	OtNumKGendo		OUT	QPAH_OTHERM.QPAH_KGENDO%TYPE,
	OtStrFlg		OUT	CHAR) IS

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtStrNameN := ' ';
	OtStrNameX := ' ';
	OtNumRiritu := 0;
	OtNumSGendo := 0;
	OtNumKGendo := 0;
	OtStrFlg := '0';

	BEGIN
		SELECT	NVL(QPAH_NAMEN,' '),
			NVL(QPAH_NAMEX,' '),
			NVL(QPAH_RIRITU,0),
			NVL(QPAH_SGENDO,0),
			NVL(QPAH_KGENDO,0)
		INTO	OtStrNameN,
			OtStrNameX,
			OtNumRiritu,
			OtNumSGendo,
			OtNumKGendo
		FROM	QPAH_OTHERM
		WHERE	QPAH_PRMCODE	= InStrCode;
	EXCEPTION
		WHEN	NO_DATA_FOUND	THEN
			RETURN;
	END;

	OtStrFlg := '1';

END	QPAP_CEnt000SelOtherM;

END QPAP_CEnt000PkG;

/***END of LINE****************************************************************/
/
SHOW ERROR
