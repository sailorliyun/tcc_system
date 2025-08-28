CREATE OR REPLACE PACKAGE  QPAP_Cent320PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_Cent320PkG                                           */
/* �@�\          �F�T���A���\���                                            */
/* �쐬��        �F2001/08/25                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/

/*****************************************************************************/
/*					�C������                                                 */
/*	Yasui@NBC 2005.05.06 �ܗ^�T���쐬�����s���Ή�                            */
/*	��t�ԍ�	���t		�S����			�C�����e                                         */
/*	TR0506-023	20060314	imz.Yoshida   �����ܗ^�T���쐬�����s���Ή�                 */
/*	1004091		20100810	IMZ SHIBUTANI	���T���A���\�ŎQ�Ƃ��Ă��郏�[�N�e�[�u���ύX	*/
/*****************************************************************************/

/*****************************************************************************/
/*                �P  �錾��                                                 */
/*****************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
    INDEX BY BINARY_INTEGER;

/* �T���A���\�f�[�^�쐬���擾 �yMain�����z*/
PROCEDURE QPAP_CEnt320GetKoujyo (
  InStrSyoriYM        IN  VARCHAR2,                               --�����N��
  InStrUserID         IN  VARCHAR2,                               --���[�U�[�h�c
  InStrComputerNM     IN  VARCHAR2,                               --�R���s���[�^��
  OtStrEndFlg         OUT VARCHAR2);                              --�����I���t���O

/* �T���A���\_�o�ߎc���v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320KeikaZandaka (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD            IN  VARCHAR2);                              --���^���t
/* �T���A���\_���������v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320KogutiRisoku (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --���^���t
/* �T���A���\_�����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320KyuyoRisoku (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --���^���t
/* ���^�c���W�v */
PROCEDURE QPAP_CEnt320KyuZanSyukei (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --���^���t
/* �T���A���\_���^����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320KojoPrtKyuyo (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --���^���t

/* �T���A���\_�ܗ^�����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320SyouyoRisoku (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --�ܗ^���t

/* �T���A���\_�ܗ^����v�n�q�j�쐬 */
PROCEDURE QPAP_CEnt320KojoPrtSyouyo (
  InStrUserID     IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                                   --�R���s���[�^��
  InStrYMD        IN  VARCHAR2);                                  --�ܗ^���t

/* �T���A���\_�ܗ^�����v�Z �֐� (Return ����) */
FUNCTION QPAP_CEnt320SyoRisokuFnc (
  InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --�Z����
  InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --�ܗ^�ԍϑ��z
  InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --�ܗ^�ԍϊz
  InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --�ܗ^�c��
  InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --�_�񗘗�
  InBONUSYMD1       IN  VARCHAR2,                                 --�ܗ^�x�����P
  InBONUSYMD2       IN  VARCHAR2,                                 --�ܗ^�x�����Q
  InStrYMD          IN  VARCHAR2)                                 --�ܗ^���t
RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE;

/* �����Z�������擾 */
FUNCTION QPAP_CEnt320GetRiritu(
   InStrYMD   IN  CHAR)
RETURN NUMBER;

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt320DelWorkTbl(
   InStrUserID     IN  VARCHAR2,                                      --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);                                     --�R���s���[�^��

/* 2001/10/23 ADD  START ******************************************************/
/* �T���e�[�u���X�V���� */
PROCEDURE QPAP_CEnt320KojoTKousin (
  InStrSyoriYM        IN  VARCHAR2,                                   --�����N��
  InStrUserID         IN  VARCHAR2,                                   --���[�U�[�h�c
  InStrComputerNM     IN  VARCHAR2);                                  --�R���s���[�^��

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt320Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type					--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type				--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);				--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt320UnLock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type);				--�R���s���[�^�[��
/* 2001/10/23 ADD  END ********************************************************/

/* 2001/11/02 ADD  START ******************************************************/
/* �ŐV�ܗ^�T���N���擾 */
PROCEDURE QPAP_CEnt320GetYM (
    OtMei    OUT    VARCHAR2);
/* 2001/11/02 ADD  END ********************************************************/
/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
/* �ܗ^���擾�֐�                          */
FUNCTION QPAP_CEnt320GetBONUSDayFnc(
   InStrYMD  IN CHAR,
   BONUSYMD  IN CHAR
) RETURN CHAR;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
END QPAP_Cent320PkG;
/
--SHOW ERROR
SHOW ERRORS;

/*****************************************************************************/
/*                �Q  �{�f�B�[                   */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent320PkG IS

  /* �V�X�e���ύX���{�� */
  /*�i���̓��ȍ~�̗Z�����̑ݕt�͐V�v�Z���ŁA���̓����O�̗Z�����̑ݕt�͋��v�Z���ŁA�������v�Z����j*/
  gbl_SysChangeYMD    CHAR(8) := '20000301';    --�V�X�e���ύX���{��
  gbl_ZenRiritu       NUMBER;     --�O������
  gbl_ZenZenRiritu    NUMBER;     --�O�X������
  gbl_SyousyoYMD      CHAR(8);    --�؏����o���t

/* 2001/10/24 ADD  START ******************************************************/
  gbl_SysChangeYMD2   CHAR(8) := '20011101';    --�V�X�e���ύX���{��
  gbl_ZenRiritu2      NUMBER;     --�O������
  gbl_ZenZenRiritu2   NUMBER;     --�O�X������
/* 2001/10/24 ADD  END   ******************************************************/

/* 2001/10/23 ADD  START ******************************************************/
	/*  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
/* 2001/10/23 ADD  END ********************************************************/

/* 2001/10/23 ADD  START ******************************************************/
  /* �T�����[�N�����J�[�\�� */
  CURSOR CurKojow(StrUserID_I IN VARCHAR2,StrComputerNM_I IN VARCHAR2) IS
      SELECT
            QPAO_SYORIYMD  SYORIYMD,
            QPAO_SYAINCD1  SYAINCD1,
            QPAO_SYAINCD2  SYAINCD2,
            QPAO_SYUBETU   SYUBETU ,
            QPAO_TOZAIKBN  TOZAIKBN,
            QPAO_YUSIYMD   YUSIYMD ,
            QPAO_KINGAKU   KINGAKU ,
            QPAO_GANKIN    GANKIN  ,
            QPAO_RISOKU    RISOKU  ,
            QPAO_ZANDAKA   ZANDAKA
      FROM  QPAO_KOJOW
      WHERE QPAO_USERID   = StrUserID_I
      AND   QPAO_COMPUTERNM  = StrComputerNM_I;
/* 2001/10/23 ADD  END ********************************************************/

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320GetKoujyo       �@�@�@�@                      */
/* �@�\          �F�T���A���\�f�[�^�쐬���擾 �yMain�����z                   */
/*****************************************************************************/
PROCEDURE QPAP_CEnt320GetKoujyo (
	InStrSyoriYM        IN  VARCHAR2,                               --�����N��
	InStrUserID         IN  VARCHAR2,                               --���[�U�[�h�c
	InStrComputerNM     IN  VARCHAR2,                               --�R���s���[�^��
	OtStrEndFlg         OUT VARCHAR2) IS                            --�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx          NUMBER;
	NumSumCount     NUMBER;
	StrData         VARCHAR2(200);
	StrKyuyoYMD     VARCHAR2(8);            --���^���t
	StrSyoyoYMD     VARCHAR2(8);            --�ܗ^���t
	StrWorkYMD      VARCHAR2(8);            --�O��

BEGIN
	/* �o�̓p�����[�^�̏����� */
	OtStrEndFlg   := '0';

	/*�� �X�e�b�v�O ��*/
	/* �O���� */
	StrKyuyoYMD :=    InStrSyoriYM || '25';                                                            --���^���t
	StrSyoyoYMD :=    TO_CHAR(ADD_MONTHS(TO_DATE(InStrSyoriYM || '01','YYYYMMDD'),1) - 1,'YYYYMMDD');  --�ܗ^���t
	gbl_SyousyoYMD := TO_CHAR(TO_DATE(SUBSTR(StrKyuyoYMD,1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');     --�؏����o���t

	StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
	gbl_ZenRiritu  := QPAP_CEnt320GetRiritu(StrWorkYMD);     --�O������
	gbl_ZenRiritu2 := TRUNC(gbl_ZenRiritu / 36500 * 1000000) / 1000000;           -- 10/24 ADD

	StrWorkYMD := TO_CHAR(ADD_MONTHS(TO_DATE(StrKyuyoYMD,'YYYYMMDD'),-2) + 1,'YYYYMMDD');
	gbl_ZenZenRiritu := QPAP_CEnt320GetRiritu(StrWorkYMD);  --�O�X������
	gbl_ZenZenRiritu2 := TRUNC(gbl_ZenZenRiritu / 36500 * 1000000) / 1000000;     -- 10/24 ADD

	/* �T���A���\_�o�ߎc���v�n�q�j�̍쐬 */
	QPAP_CEnt320KeikaZandaka(InStrUserID,
							InStrComputerNM,
							StrKyuyoYMD);

	/*�� �T���A���\�@���^���� ��*/
	/*���^�� �X�e�b�v�@�@�P ��*/
	/* �T���A���\_���������v�n�q�j�̍쐬 */
	QPAP_CEnt320KogutiRisoku(InStrUserID,
							InStrComputerNM,
							StrKyuyoYMD);

	/* �T���A���\_�����v�n�q�j�쐬 */
	QPAP_CEnt320KyuyoRisoku(InStrUserID,
							InStrComputerNM,
							StrKyuyoYMD);

	/*���^�� �X�e�b�v�@�@�Q ��*/
	/* ���^�c���W�v */
	QPAP_CEnt320KyuZanSyukei(InStrUserID,
							InStrComputerNM,
							StrKyuyoYMD);

	/*���^�� �X�e�b�v�@�@�R ��*/
	/* �T���A���\_���^����v�n�q�j�쐬 */
	QPAP_CEnt320KojoPrtKyuyo(InStrUserID,
							InStrComputerNM,
							StrKyuyoYMD);

	/*�� �T���A���\�@�ܗ^���� ��*/

	/*�ܗ^�� �X�e�b�v�@�@�P ��*/
	/* �T���A���\_�ܗ^�����v�n�q�j�쐬 */
	QPAP_CEnt320SyouyoRisoku(InStrUserID,
							InStrComputerNM,
							StrSyoyoYMD);

	/*�ܗ^�� �X�e�b�v�@�@�Q ��*/
	/* �T���A���\_�ܗ^����v�n�q�j�쐬 */
	QPAP_CEnt320KojoPrtSyouyo(InStrUserID,
							InStrComputerNM,
							StrSyoyoYMD);

	OtStrEndFlg :=  '1';						--�����I��

EXCEPTION
	WHEN  OTHERS  THEN
		OtStrEndFlg := '9';
		RAISE ;
END QPAP_CEnt320GetKoujyo;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KeikaZandaka        �@�@                      */
/* �@�\          �F�T���A���\_�o�ߎc���v�n�q�j�쐬                           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KeikaZandaka (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */

  StrSQL        VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_CursorID2   NUMBER := 0;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;

  v_ZenYMD      CHAR(8);    --�O��
  v_ZenZenYMD   CHAR(8);    --�O�X��
  v_Zandaka     NUMBER;
  v_WZandaka    NUMBER;
  v_CalZandaka  NUMBER;

  v_SYAINCD1        QPAS_KGCW.QPAS_SYAINCD1%TYPE;
  v_SYAINCD2        QPAS_KGCW.QPAS_SYAINCD2%TYPE;
  v_KBN             QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD             QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku         QPAS_KGCW.QPAS_KINGAKU%TYPE;

  v_SYAINCD1_BRK    QPAS_KGCW.QPAS_SYAINCD1%TYPE := ' ';
  v_SYAINCD2_BRK    QPAS_KGCW.QPAS_SYAINCD2%TYPE := ' ';


  v_ZenYMD_N    CHAR(8);    --�O�������p         11/01 ADD
  v_ZenZenYMD_N CHAR(8);    --�O�X�������p       11/01 ADD

BEGIN

  /**************************/
  /* �����ޔ��e�[�u���ɑޔ� */
  /**************************/
  DELETE FROM QPAS_KGCW
         WHERE QPAS_USERID     = InStrUserID
           AND QPAS_COMPUTERNM = InStrComputerNM;

  v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');
  v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-2) ,'YYYYMMDD');

/* 11/01 ADD �����p�w��͈͕ύX */
  v_ZenYMD_N    := TO_CHAR(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,'YYYYMMDD');
  v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,-1) ,'YYYYMMDD');

  /* �ݕt */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      ' ',
      NVL(QPA6_SYAINCD,' '),
      '1',
      TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
      NVL(QPA6_KINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA6_KGCKASITUKET
    WHERE (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
     AND  (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
  /* ���� */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA5_SYAINCD1,' '),
      NVL(QPA5_SYAINCD2,' '),
      '2',
      TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
      NVL(QPA5_NYUKINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA5_KGCNYUKINT
--    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)                  -- 11/01 UPD
--     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD);              -- 11/01 UPD
    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)                  -- 11/01 UPD
     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);              -- 11/01 UPD
  /* �ܗ^ */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA4_SYAINCD1,' '),
      NVL(QPA4_SYAINCD2,' '),
      '4',
      TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
      NVL(QPA4_KOJOGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA4_KGCKOJOT
    WHERE (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenZenYMD);

    /* �R�~�b�g */
    COMMIT;

    /********************************/
    /* �T���A���\_�o�ߎc���s�ɒǉ�  */
    /********************************/
    DELETE FROM QPAU_KojoZanW
           WHERE QPAU_USERID     = InStrUserID
             AND QPAU_COMPUTERNM = InStrComputerNM;

    /* �����ޔ��e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_SYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_SYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAS_COMPUTERNM = :StrComputerNM';
    StrSQL := StrSQL || ' ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SYAINCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYAINCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,5,v_Kingaku);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SYAINCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYAINCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_YMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,5,v_Kingaku);

      IF v_SYAINCD1 <> v_SYAINCD1_BRK OR v_SYAINCD2 <> v_SYAINCD2_BRK THEN
          /* �O�O���c���Q�� */
          v_Zandaka := 0;
          StrSQL := NULL;
          StrSQL := StrSQL || 'SELECT';
          StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
          StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
          StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
          StrSQL := StrSQL || '   AND QPA3_PRMSYAINCD2 = :Code2';
          StrSQL := StrSQL || '   AND QPA3_PRMYUSIKBN  = :KBN';
          StrSQL := StrSQL || '   AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
          StrSQL := StrSQL ||                              '  FROM QPA3_KGCZANDAKAT';
          StrSQL := StrSQL ||                              ' WHERE QPA3_PRMSYAINCD1 = :Code1';
          StrSQL := StrSQL ||                               '  AND QPA3_PRMSYAINCD2 = :Code2';
          StrSQL := StrSQL ||                               '  AND QPA3_PRMYUSIKBN  = :KBN';
          StrSQL := StrSQL ||                               '  AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
          /* ���I�J�[�\���̃I�[�v�� */
          v_CursorID  := DBMS_SQL.OPEN_CURSOR;
          /* SQL�̉�� */
          DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
          /* ���͕ϐ����o�C���h���� */
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', v_SYAINCD1);
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', v_SYAINCD2);
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN',   '3');
          DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',   v_ZenZenYMD);
          /* �o�͕ϐ��̃o�C���h */
          DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zandaka);
          /* SQL�̎��s */
          v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
          IF  DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
              DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zandaka);
          END IF;
          /* �J�[�\���̃N���[�Y */
          DBMS_SQL.CLOSE_CURSOR (v_CursorID);

          /* �Ј��u���[�N �R�[�h �ݒ� */
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
      END IF;

      /* �Z���敪�ʁ@�c���Čv�Z */
-- 2001/10/05 �s��C��
--      IF v_KBN = '1' OR v_KBN = '2' THEN
      IF v_KBN = '1' THEN
          v_Zandaka := v_Zandaka + v_Kingaku;
      ELSE
          v_Zandaka := v_Zandaka - v_Kingaku;
      END IF;

      IF v_KBN = '1' THEN
        v_WZandaka := v_Kingaku + v_Zandaka;
        IF v_WZandaka <= 0 then
          v_CalZandaka := 0;
        ELSE
          IF v_Zandaka >= v_Kingaku then
            v_CalZandaka := v_Kingaku;
          ELSE
            v_CalZandaka := v_Zandaka;
          END IF;
        END IF;
      ELSE
        IF v_Zandaka <= 0 THEN
          v_CalZandaka := 0;
        ELSE
-- 2001/10/05 �s��C��
      IF v_KBN = '2' THEN
--          v_CalZandaka := v_Kingaku;
            v_CalZandaka := (0 - v_Kingaku);
      ELSE
            v_CalZandaka := v_Kingaku;
      END IF;
        END IF;
      END IF;

      /* ���[�N�@�T���A���\_�o�ߎc���s�ɒǉ� */
      INSERT INTO QPAU_KojoZanW VALUES (
         NVL(v_SYAINCD1,' ')          --�l�R�[�h�P
        ,NVL(v_SYAINCD2,' ')          --�l�R�[�h�Q
        ,' '                          --���[�����
        ,NVL(v_KBN,' ')               --�Z���敪
        ,TO_DATE(v_YMD,'YYYYMMDD')    --�������ݕt��
        ,NVL(v_Kingaku,0)             --�������z�ݕt���z
        ,NVL(v_Zandaka,0)             --�c��
        ,NVL(v_CalZandaka,0)          --�v�Z�p���z
        ,InStrUserID
        ,InStrComputerNM
        );

    END LOOP;
-- 2001/10/05
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    /* ���[���o�b�N */
    ROLLBACK;
-- 2001/10/05
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    RAISE ;
END QPAP_CEnt320KeikaZandaka;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KogutiRisoku        �@�@                      */
/* �@�\          �F�T���A���\_���������v�n�q�j�̍쐬                         */
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KogutiRisoku (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */
  StrSQL        VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_CursorID2   NUMBER := 0;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;

  v_ZenYMD      CHAR(8);    --�O��
  v_ZenZenYMD   CHAR(8);    --�O�X��
  v_Zandaka     NUMBER;
  v_WZandaka    NUMBER;
  v_CalZandaka  NUMBER;

  v_KasiRisoku    NUMBER;

  v_SYAINCD1        QPAS_KGCW.QPAS_SYAINCD1%TYPE;
  v_SYAINCD2        QPAS_KGCW.QPAS_SYAINCD2%TYPE;
  v_KBN             QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD             QPAS_KGCW.QPAS_YMD%TYPE;
--  v_Kingaku         QPAS_KGCW.QPAS_KINGAKU%TYPE;         -- 10/19 UPD
  v_Kingaku	        NUMBER;                                -- 10/19 UPD

  v_IDX             NUMBER;                                -- 10/19 ADD
  v_SYAINCD1_BRK    QPAS_KGCW.QPAS_SYAINCD1%TYPE;          -- 10/19 ADD
  v_SYAINCD2_BRK    QPAS_KGCW.QPAS_SYAINCD2%TYPE;          -- 10/19 ADD
  v_KEISANKIN       NUMBER;                                -- 10/19 ADD
  v_KEISANFLG       CHAR(1);                               -- 10/19 ADD

  v_ZenYMD_N        CHAR(8);             --�O�������p         11/01 ADD
  v_ZenZenYMD_N     CHAR(8);             --�O�X�������p       11/01 ADD

--2003/01/16 �����v�Z������Ƃɗ����擾�ɕύX
  W_CNT				NUMBER;						--�����v�Z�p���[�v�J�E���^
  W_ENDLOOPCNT		NUMBER;						--�����v�Z�p���[�v�I���l
  v_GetRiritu		NUMBER;						--�����v�Z�p������(��)
  v_GetRiritu2		NUMBER;						--�����v�Z�p������(�V)
  v_StartRiritu		NUMBER;						--�����v�Z�p�������߂�͈͊J�n���ł̓K�p����
  v_NextRiritu		NUMBER;						--�����v�Z�p�������߂�͈͏I�����ł̓K�p����
  strworkwork		NUMBER;
--2003/01/16 �����v�Z������Ƃɗ����擾�ɕύX

BEGIN

  /**************************/
  /* �����ޔ��e�[�u���ɑޔ� */
  /**************************/
  DELETE  FROM QPAS_KGCW
         WHERE QPAS_USERID     = InStrUserID
           AND QPAS_COMPUTERNM = InStrComputerNM;

  v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');  --�O��
  v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-2) ,'YYYYMMDD');  --�O�X��

/* 11/01 ADD �����p�w��͈͕ύX */
  v_ZenYMD_N    := TO_CHAR(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,'YYYYMMDD');
  v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(InStrYMD,1,6) || '01','YYYYMMDD') - 1 ,-1) ,'YYYYMMDD');

  /* �ݕt */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      ' ',
      NVL(QPA6_SYAINCD,' '),
      '1',
      TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
      NVL(QPA6_KINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA6_KGCKASITUKET
    WHERE (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
     AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') >  v_ZenZenYMD)
     AND  (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
  /* ���� */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA5_SYAINCD1,' '),
      NVL(QPA5_SYAINCD2,' '),
      '2',
      TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
      NVL(QPA5_NYUKINGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA5_KGCNYUKINT
--    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)            -- 11/01 UPD
--     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD);        -- 11/01 UPD
    WHERE (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)            -- 11/01 UPD
     AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') >  v_ZenZenYMD_N);        -- 11/01 UPD
  /* �ܗ^ */
  INSERT INTO QPAS_KGCW (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
    SELECT
      NVL(QPA4_SYAINCD1,' '),
      NVL(QPA4_SYAINCD2,' '),
      '4',
      TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
      NVL(QPA4_KOJOGAKU,0),
      InStrUserID,
      InStrComputerNM
    FROM QPA4_KGCKOJOT
    WHERE (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <  InStrYMD)
     AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') >  v_ZenYMD);

    /* �R�~�b�g */
    COMMIT;

    /********************************/
    /* �T���A���\_���������s�ɒǉ�  */
    /********************************/
    DELETE FROM QPAV_KojoKoguW
          WHERE QPAV_USERID     = InStrUserID
            AND QPAV_COMPUTERNM = InStrComputerNM;

	/*�����ޔ��e�[�u������ */
	/* �ݕt(1)�Ɠ���(2)�Əܗ^(4) */
	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' QPAS_SYAINCD1,';
	StrSQL := StrSQL || ' QPAS_SYAINCD2,';
	StrSQL := StrSQL || ' QPAS_KBN,';
	StrSQL := StrSQL || ' SUM(QPAS_KINGAKU),';
	StrSQL := StrSQL || ' QPAS_YMD';
	StrSQL := StrSQL || ' FROM QPAS_KGCW,QPA1_KGCDAICYOT';
	StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1   = QPA1_PRMSYAINCD1';
	StrSQL := StrSQL || '   AND QPAS_SYAINCD2   = QPA1_PRMSYAINCD2';
	StrSQL := StrSQL || '   AND (QPA1_KOJOCYUSHIFLG = ''1'')';		--��2002/12/17 ���T���A�����X�g�p�C��
	StrSQL := StrSQL || '   AND QPAS_USERID     = :StrUserID';
	StrSQL := StrSQL || '   AND QPAS_COMPUTERNM = :StrComputerNM';
	StrSQL := StrSQl || ' GROUP BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD';
	StrSQL := StrSQl || ' ORDER BY QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_YMD,QPAS_KBN';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SYAINCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SYAINCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KBN     ,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KINGAKU   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_YMD     ,8);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    v_IDX := 0;
	v_KasiRisoku := 0;

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SYAINCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SYAINCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KBN     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KINGAKU );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_YMD     );

      IF v_IDX = 0 THEN
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
      END IF;

      IF v_SYAINCD1 <> v_SYAINCD1_BRK OR v_SYAINCD2 <> v_SYAINCD2_BRK THEN
          /* ���[�N�@�T���A���\_���������s�ɒǉ� */
          INSERT INTO QPAV_KojoKoguW VALUES (
             NVL(v_SYAINCD1_BRK,' ')          --�l�R�[�h�P
            ,NVL(v_SYAINCD2_BRK,' ')          --�l�R�[�h�Q
            ,'1'                              --���[�����
            ,NVL(v_KasiRisoku,0)              --�ݕt����
            ,InStrUserID                      --���[�U�[ID
            ,InStrComputerNM                  --�R���s���[�^�[��
            );
          v_SYAINCD1_BRK := v_SYAINCD1;
          v_SYAINCD2_BRK := v_SYAINCD2;
          v_KasiRisoku := 0;
      END IF;

      v_KEISANKIN := 0;
      v_KEISANFLG := '0';

   	  /* �T���A���\_�o�ߎc���s���� */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' SUM(QPAU_KEISANKIN)';
      StrSQL := StrSQL || ' FROM QPAU_KOJOZANW';
      StrSQL := StrSQL || ' WHERE QPAU_SYAINCD1   = :SYAINCD1';
      StrSQL := StrSQL || '   AND QPAU_SYAINCD2   = :SYAINCD2';
      StrSQL := StrSQL || '   AND QPAU_YUSIKBN    = :KBN';
      StrSQL := StrSQL || '   AND TO_CHAR(QPAU_NYUKASIYMD,''YYYYMMDD'') = :YMD';
      StrSQL := StrSQL || '   AND QPAU_USERID     = :StrUserID';
      StrSQL := StrSQL || '   AND QPAU_COMPUTERNM = :StrComputerNM';
      StrSQL := StrSQl || ' GROUP BY QPAU_SYAINCD1,QPAU_SYAINCD2,QPAU_YUSIKBN,QPAU_NYUKASIYMD';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD1',     v_SYAINCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':SYAINCD2',     v_SYAINCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN',          v_KBN);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',          v_YMD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrUserID',    InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':StrComputerNM',InStrComputerNM);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KEISANKIN);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
          /* �J�����l��ϐ��֊i�[ */
          DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KEISANKIN);
          v_KEISANFLG := '1';
      END IF;

/*	2003/01/21	�����v�Z�C��	���������火*/
		--TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1
		v_StartRiritu := QPAP_CEnt320GetRiritu(v_YMD);						--�����v�Z�J�n�����_�ł̗�����
		v_NextRiritu  := QPAP_CEnt320GetRiritu(v_ZenYMD);							--�����v�Z�I�������_�ł̗�����

		IF v_KBN = '1' THEN
			--��
			IF v_StartRiritu <> v_NextRiritu THEN
				--�P�����Ƃɗ��������擾���ė����v�Z����
				W_CNT        := v_YMD;
				W_ENDLOOPCNT := v_ZenYMD;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
					END IF;

					v_GetRiritu  := QPAP_CEnt320GetRiritu(w_Cnt);						--�����ƂɓK�p����闘��(�����x)���擾����
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

					IF v_KEISANFLG = '1' THEN

						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
						END IF;
					ELSE
						IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���
				END LOOP;
			ELSE
				--�]���̏����i�����v�Z�̌o�ߓ����̊J�n���ƏI�������������͌o�ߓ�����������j
				v_GetRiritu  := v_StartRiritu;											--�J�n���ɓK�p����闘��(�����x)���擾����
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					����(�V���x)���擾����

				IF v_KEISANFLG = '1' THEN
					IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
					END IF;
				ELSE
					IF TO_DATE(v_ZenYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KINGAKU * (TO_DATE(v_ZenYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1) * v_GetRiritu2 * 1000000);
					END IF;
				END IF;
			END IF;
		END IF;

		IF v_KBN = '2' THEN
			--TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')
			v_StartRiritu := QPAP_CEnt320GetRiritu(v_YMD + 1);							--�����v�Z�J�n�����_�ł̗�����
			v_NextRiritu  := QPAP_CEnt320GetRiritu(v_ZenYMD_N);							--�����v�Z�I�������_�ł̗�����

			IF v_StartRiritu <> v_NextRiritu THEN
				--�P�����Ƃɗ��������擾���ė����v�Z����
				W_CNT        := v_YMD + 1;
				W_ENDLOOPCNT := v_ZenYMD_N;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
					END IF;

					v_GetRiritu  := QPAP_CEnt320GetRiritu(w_Cnt);						--���̓��ɓK�p����闘��(�����x)���擾����
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

					IF v_KEISANFLG = '1' THEN

						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--�V������
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * v_GetRiritu2 * 1000000);
						END IF;
					ELSE

						IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN		--�V������
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
						ELSE
							v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
						END IF;
					END IF;
					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���

				END LOOP;
			ELSE
				--�]���̏����i�����v�Z�̌o�ߓ����̊J�n���ƏI�������������͌o�ߓ�����������j
				v_GetRiritu  := v_StartRiritu;											--�J�n���ɓK�p����闘��(�����x)���擾����
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					����(�V���x)���擾����

				IF v_KEISANFLG = '1' THEN
					IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC(v_KEISANKIN * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
					END IF;
				ELSE
					IF TO_DATE(v_ZenYMD_N,'YYYYMMDD') + 1 < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(v_ZenYMD_N,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * v_GetRiritu2 * 1000000);
					END IF;
				END IF;
			END IF;

		END IF;
		IF v_KBN = '4' THEN
			--(TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD'))
			v_StartRiritu := QPAP_CEnt320GetRiritu(v_YMD + 1);							--�����v�Z�J�n�����_�ł̗�����
			v_NextRiritu  := QPAP_CEnt320GetRiritu(InStrYMD);							--�����v�Z�I�������_�ł̗�����

			IF v_StartRiritu <> v_NextRiritu THEN
				--�P�����Ƃɗ��������擾���ė����v�Z����
				W_CNT        := v_YMD + 1;
				W_ENDLOOPCNT := InStrYMD;

				LOOP
					IF W_CNT > W_ENDLOOPCNT THEN
						EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
					END IF;

					v_GetRiritu  := QPAP_CEnt320GetRiritu(w_Cnt);						--���̓��ɓK�p����闘��(�����x)���擾����
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

					IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu / 36500 * 1000) * 1000;
					ELSE
						v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * v_GetRiritu2 * 1000000);
					END IF;

					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���

				END LOOP;

			ELSE
				--�]���̏����i�����v�Z�̌o�ߓ����̊J�n���ƏI�������������͌o�ߓ�����������j
				v_GetRiritu  := v_StartRiritu;											--�J�n���ɓK�p����闘��(�����x)���擾����
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;			--					����(�V���x)���擾����

				IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
					v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu / 36500 * 1000) * 1000;
				ELSE
					v_KasiRisoku := v_KasiRisoku + TRUNC((0 - v_KINGAKU) * (TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD')) * gbl_ZenZenRiritu2 * 1000000);
				END IF;
			END IF;
		END IF;
/*	2003/01/21	�����v�Z�C��	�������܂Ł�*/

		/* �J�[�\���̃N���[�Y */
		DBMS_SQL.CLOSE_CURSOR(v_CursorID2);

		v_IDX := v_IDX + 1;

	END LOOP;

	IF v_IDX <> 0 THEN
		/* ���[�N�@�T���A���\_���������s�ɒǉ� */
		INSERT INTO QPAV_KojoKoguW VALUES (
			 NVL(v_SYAINCD1_BRK,' ')								--�l�R�[�h�P
			,NVL(v_SYAINCD2_BRK,' ')								--�l�R�[�h�Q
			,'1'													--���[�����
			,NVL(v_KasiRisoku,0)									--�ݕt����
			,InStrUserID											--���[�U�[ID
			,InStrComputerNM										--�R���s���[�^�[��
			);
	END IF;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	/* �R�~�b�g */
	COMMIT;

EXCEPTION
	WHEN  OTHERS  THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN      -- 10/19 ADD
			DBMS_SQL.CLOSE_CURSOR(v_CursorID);     -- 10/19 ADD
		END IF;                                    -- 10/19 ADD
		IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
			DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
		END IF;
		/* ���[���o�b�N */
		ROLLBACK;
		RAISE ;
END QPAP_CEnt320KogutiRisoku;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KyuyoRisoku   �@ �@                           */
/* �@�\          �F�T���A���\_�����v�n�q�j�쐬                           �@�@*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KyuyoRisoku (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_Dummy         INTEGER;

  v_Risoku        NUMBER;     --����
  v_ZenYMD        CHAR(8);    --�O��

  v_WorkYMD       CHAR(8);
  v_Kikan         NUMBER;

  v_PRMSYAINCD1     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_PRMSYAINCD2     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_PRMYUSIYMD      QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
  v_GENDOGAKU       QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
  v_SYUBETU         QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
  v_RIRITU          QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_HENSAITUKISU    QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KYUYOZANDAKA    QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KOJOCYUSIFLG    QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
  v_KANSAIYMD       QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

  v_RIRITU2         NUMBER;

--2003/01/16 �����v�Z������Ƃɗ����擾�ɕύX
  W_CNT				NUMBER;
  W_ENDLOOPCNT		NUMBER;
  v_GetRiritu		NUMBER;
  v_GetRiritu2		NUMBER;
  v_StartRiritu		CHAR(8);
  v_NextRiritu		CHAR(8);
  v_Risoku2         NUMBER;     --����
  v_Risoku3         NUMBER;     --����

--2003/01/16 �����v�Z������Ƃɗ����擾�ɕύX

BEGIN

    /****************************************/
    /* �T���A���\_�����v�n�q�j�s�ɒǉ�  �@�@*/
    /****************************************/
    DELETE FROM QPAW_KojoRisoW
          WHERE QPAW_USERID     = InStrUserID
            AND QPAW_COMPUTERNM = InStrComputerNM;

    /* �O�����t */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

    /*���������@�����Z���䒠�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA1_KEIYAKUYMD,';
    StrSQL := StrSQL || ' QPA1_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA1_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA1_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAV_KASIRISOKU ';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT,QPAV_KOJOKOGUW';
    StrSQL := StrSQL || ' WHERE (QPA1_KOJOCYUSHIFLG = ''1'')';
    StrSQL := StrSQL || '   AND QPA1_PRMSYAINCD1 = QPAV_SYAINCD1(+)';
    StrSQL := StrSQL || '   AND QPA1_PRMSYAINCD2 = QPAV_SYAINCD2(+)';
    StrSQL := StrSQL || '   AND QPAV_USERID(+)     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAV_COMPUTERNM(+) = :StrComputerNM';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_KEIYAKUYMD     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KASIRISOKU     );

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_KEIYAKUYMD    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KASIRISOKU    );

--2002/03/07 �����ԍϊz�e�[�u�����ԍϊz���擾�i�����ԍϑ䒠�̕ԍϊz�͎g�p���Ȃ��j

     /* �����ԍϊz���擾 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
      StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
      StrSQL := StrSQL || ' FROM  QPA2_KGCHENSAIT';
      StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
      StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2  = :Code2';
      StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM  <= :YM';
      StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_PRMSYAINCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_PRMSYAINCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(InStrYMD,1,6));
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KYUYOHENSAI);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYOYOHENSAI);
      /* SQL�̎��s */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
      /* FETCH */
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
         /* �J�����l��ϐ��֊i�[ */
         DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KYUYOHENSAI);
         DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYOYOHENSAI);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

--2002/03/07 �����܂�

      /* �����v�Z */
      v_Risoku  := 0;     --����

      IF  v_KYUYOZANDAKA > 0 THEN
          v_KYUYOZANDAKA_W := v_KYUYOZANDAKA;
      ELSE
          v_KYUYOZANDAKA_W := 0;
      END IF;

      IF  v_KASIRISOKU IS NULL THEN
          v_KASIRISOKU := 0;
      END IF;

	--v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');
	v_StartRiritu := QPAP_CEnt320GetRiritu(v_ZenYMD + 1);						--�����v�Z�J�n�����_�ł̗�����
	v_NextRiritu  := QPAP_CEnt320GetRiritu(InStrYMD);							--�����v�Z�I�������_�ł̗�����
	v_Risoku2 := 0;

	IF v_ZenYMD = '20021225' AND InStrYMD = '20030125' THEN
		--2002/12/26 �` 2003/01/25�Ԃ̌v�Z��2002/12/26���_�ł̗����Ōv�Z����(�C�����_�Ŋ��ɒ��߂Ă��܂�����)

		--���ԓ����ƂЂƂ̗������Ōv�Z���s�Ȃ�
		v_GetRiritu  := v_StartRiritu;															--�������擾����
		v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--�������擾����

		v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--�����W�v����

		--�����̌v�Z
		IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
			v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
		ELSE
			v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000) + v_KASIRISOKU) / 1000000);
		END IF;

	ELSE
		IF InStrYMD = '20030225' THEN
			v_GetRiritu := '7.5';												--2003/02/25���^�̎c���Z�o�Ɍ���A���߂�1���c���ɔ��f�ł��Ȃ�����
			v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--�������擾����
			v_Risoku  := (v_KYUYOZANDAKA_W * v_GetRiritu2 * 6 * 1000000) / 1000000;

			v_GetRiritu := '5.9';
			v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--�������擾����
			v_Risoku  := v_Risoku + (v_KYUYOZANDAKA_W * v_GetRiritu2 * 25 * 1000000) / 1000000;

			v_Risoku  := TRUNC(v_Risoku + (v_KASIRISOKU / 1000000));

		ELSE
			IF v_StartRiritu <> v_NextRiritu THEN
				--�P�������������擾���Čv�Z���s�Ȃ�
				w_Cnt := v_ZenYMD + 1;													--�����v�Z�J�n��(�O�񋋗^���̎��̓�)
				w_EndLoopCnt := InStrYMD;												--�����v�Z�I����(���񋋗^��)

				LOOP
					IF w_Cnt > w_EndLoopCnt THEN
						EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
					END IF;

					v_GetRiritu  := QPAP_CEnt320GetRiritu(w_Cnt);						--���̓��ɓK�p����闘�����擾����
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					�������擾����

					--�����̌v�Z
					IF TO_DATE(w_Cnt,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
						v_Risoku  := v_Risoku + TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
					ELSE
						v_Risoku3 := v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000;
		--				v_Risoku  := v_Risoku + TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * 1000000) + v_KASIRISOKU) / 1000000);
					END IF;

					v_Risoku2 := v_Risoku2 + v_Risoku3;

					w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���
				END LOOP;
				v_Risoku := (v_Risoku2 + v_KASIRISOKU) / 1000000;
				v_Risoku := TRUNC(v_Risoku);
			ELSE
				--���ԓ����ƂЂƂ̗������Ōv�Z���s�Ȃ�
				v_GetRiritu  := v_StartRiritu;															--�������擾����
				v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--�������擾����

				v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenYMD,'YYYYMMDD');				--�����W�v����

				--�����̌v�Z
				IF TO_DATE(InStrYMD,'YYYYMMDD')  < TO_DATE(gbl_SysChangeYMD2,'YYYYMMDD') THEN
					v_Risoku  := TRUNC(((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu * v_Kikan / 365 * 10) * 1000) + v_KASIRISOKU) / 1000000);
				ELSE
					v_Risoku  := TRUNC((TRUNC(v_KYUYOZANDAKA_W * v_GetRiritu2 * v_Kikan * 1000000) + v_KASIRISOKU) / 1000000);
				END IF;
			END IF;
		END IF;
	END IF;

      /* ���[�N�@�T���A���\_�����s�ɒǉ� */
      INSERT INTO QPAW_KojoRisoW VALUES (
         NVL(v_PRMSYAINCD1,' ')   --�l�R�[�h�P
        ,NVL(v_PRMSYAINCD2,' ')   --�l�R�[�h�Q
        ,'1'                      --���[�����
        ,v_KEIYAKUYMD             --�_���
        ,NULL                     --�Z����
        ,NVL(v_GENDOGAKU,0)       --�Z���z���x�z
        ,0                        --�_�񗘗�
        ,0                        --�ԍό���
        ,0                        --���^�ԍϊz���z
        ,NVL(v_KYUYOHENSAI,0)     --���^�ԍϊz���^��
        ,0                        --�ܗ^�ԍϊz���z
        ,NVL(v_SYOYOHENSAI,0)     --�ܗ^�ԍϊz�ܗ^��
        ,NULL                     --���ϓ�
        ,NVL(v_KYUYOZANDAKA,0)    --���^�c��
        ,NVL(v_SYOYOZANDAKA,0)    --�ܗ^�c��
        ,v_Risoku                 --����
        ,NULL                     --�����敪
        ,NULL                     --���Z�X�R�[�h
        ,NULL                     --�����X�R�[�h
        ,NULL                     --��������R�[�h
        ,NULL                     --�X����
        ,NULL                     --�l������
        ,NULL                     --�ސE�N����
        ,NULL                     --�x�E�N����
        ,NULL                     --�ܗ^�x�����P
        ,NULL                     --�ܗ^�x�����Q
        ,InStrUserID
        ,InStrComputerNM
        );

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

    /*���؏����@�Ј��Z���䒠�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
    StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA8_RIRITU,';
    StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
    StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA ';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
    StrSQL := StrSQL || ' WHERE QPA8_KYUYOZANDAKA <> 0';
    StrSQL := StrSQL || '   AND TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD'') <= :SyousyoYMD';
    StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
    StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG = ''1'')';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':SyousyoYMD', gbl_SyousyoYMD);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  1,v_PRMSYAINCD1, 1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  2,v_PRMSYAINCD2, 7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  3,v_PRMYUSIYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  4,v_GENDOGAKU     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  5,v_RIRITU        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  6,v_HENSAITUKISU  );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  7,v_KYUYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  8,v_KYUYOHENSAI   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,  9,v_SYOYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA );
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_PRMYUSIYMD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_RIRITU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_HENSAITUKISU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SYOYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_KANSAIYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_SYOYOZANDAKA    );

      /* 10/24 ADD �����v�Z�C�� */
      v_RIRITU2 := TRUNC(v_RIRITU / 36500 * 1000000) / 1000000;

      /* �����v�Z */
      v_Risoku  := 0;     --����

      /* [���^�ԍϊz���z]=[���^�c��]�̏ꍇ */
      IF  v_KYUYOHENSAIALL = v_KYUYOZANDAKA THEN
        /*�i���̓��ȍ~�̗Z�����̑ݕt�͐V�v�Z���ŁA���̓����O�̗Z�����̑ݕt�͋��v�Z���ŁA�������v�Z����j*/
        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
            IF  SUBSTR(TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD'),7,2) >= '11' THEN
                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 30 / 12 / 3000);
            ELSE
                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * 45 / 12 / 3000);
            END IF;
        ELSE
---            v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);           -- 10/24 UPD
            IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                                                               -- 10/24 UPD
                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)) / 36500);          -- 10/24 UPD
            ELSE                                                                                                                        -- 10/24 UPD
                v_Risoku  := TRUNC(v_KYUYOHENSAIALL * v_RIRITU2 * (TO_DATE(InStrYMD,'YYYYMMDD') - (v_PRMYUSIYMD - 1)));                 -- 10/24 UPD
            END IF;                                                                                                                     -- 10/24 UPD
        END IF;

      /* [���^�ԍϊz���z]<>[���^�c��]�̏ꍇ */
      ELSE
        /*�i���̓��ȍ~�̗Z�����̑ݕt�͐V�v�Z���ŁA���̓����O�̗Z�����̑ݕt�͋��v�Z���ŁA�������v�Z����j*/
        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD THEN
            v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU / 1200);
        ELSE
            v_WorkYMD := TO_CHAR(TO_DATE((SUBSTR(InStrYMD,1,6) || '01'),'YYYYMMDD') - 1,'YYYYMMDD');
            v_WorkYMD := SUBSTR(v_WorkYMD,1,6) || '25';
            v_Kikan   := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_WorkYMD,'YYYYMMDD');
---            v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                     -- 10/24 UPD
            IF TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                           -- 10/24 UPD
                v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU * v_Kikan / 36500);                    -- 10/24 UPD
            ELSE                                                                                    -- 10/24 UPD
                v_Risoku  := TRUNC(v_KYUYOZANDAKA * v_RIRITU2 * v_Kikan);                           -- 10/24 UPD
            END IF;                                                                                 -- 10/24 UPD
        END IF;
      END IF;

      /* ���[�N�@�T���A���\_�����s�ɒǉ� */
      INSERT INTO QPAW_KojoRisoW VALUES (
         NVL(v_PRMSYAINCD1,' ')   --�l�R�[�h�P
        ,NVL(v_PRMSYAINCD2,' ')   --�l�R�[�h�Q
        ,'2'                      --���[�����
        ,NULL                     --�_���
        ,v_PRMYUSIYMD             --�Z����
        ,NVL(v_GENDOGAKU,0)       --�Z���z���x�z
        ,NVL(v_RIRITU,0)          --�_�񗘗�
        ,NVL(v_HENSAITUKISU,0)    --�ԍό���
        ,NVL(v_KYUYOHENSAIALL,0)  --���^�ԍϊz���z
        ,NVL(v_KYUYOHENSAI,0)     --���^�ԍϊz���^��
        ,NVL(v_SYOYOHENSAIALL,0)  --�ܗ^�ԍϊz���z
        ,NVL(v_SYOYOHENSAI,0)     --�ܗ^�ԍϊz�ܗ^��
        ,v_KANSAIYMD              --���ϓ�
        ,NVL(v_KYUYOZANDAKA,0)    --���^�c��
        ,NVL(v_SYOYOZANDAKA,0)    --�ܗ^�c��
        ,v_Risoku                 --����
        ,NULL                     --�����敪
        ,NULL                     --���Z�X�R�[�h
        ,NULL                     --�����X�R�[�h
        ,NULL                     --��������R�[�h
        ,NULL                     --�X����
        ,NULL                     --�l������
        ,NULL                     --�ސE�N����
        ,NULL                     --�x�E�N����
        ,NULL                     --�ܗ^�x�����P
        ,NULL                     --�ܗ^�x�����Q
        ,InStrUserID
        ,InStrComputerNM
        );

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt320KyuyoRisoku;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KyuZanSyukei        �@ �@                     */
/* �@�\          �F���^�c���W�v                                          �@�@*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KyuZanSyukei (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;
  v_CursorID2     NUMBER := 0;
  v_Dummy2        INTEGER;

  v_DD1           CHAR(2);
  v_DD2           CHAR(2);
  v_YYYY          CHAR(4);
  v_MM            CHAR(2);
  v_YYYYMM        CHAR(6);
  v_ZenYMD        CHAR(8);    --�O��

  /* �o�C���h�ϐ� */
  v_RowId           CHAR(18);                                   --�q�n�v�h�c
  v_SYAINCD1        QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2        QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU         QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_KYUYOZANDAKA    QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_BONUSYMD1       QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_KOJOGAKU        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

BEGIN

    /* �O�����t */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

    /*�T���A���\_WORK�����e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD1,''0000''),';    -- 10/19 UPD
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD2,''0000''),';    -- 10/19 UPD
    StrSQL := StrSQL || ' ROWIDTOCHAR(QPAW_KojoRisoW.ROWID) ';
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW,QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAW_SYAINCD1 = '' ''';
    StrSQL := StrSQL || '   AND QPAW_SYUBETU = ''1''';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPAW_SYAINCD1';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPAW_SYAINCD2';
    StrSQL := StrSQL || '   AND QPAE_PRMMISECD   = QPAC_MISECD';
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYUBETU,   1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_KYUYOZANDAKA);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_BONUSYMD1, 4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_BONUSYMD2, 4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_RowId    ,18);  --�q�n�v�h�c

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SYAINCD1    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SYAINCD2    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYUBETU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_KYUYOZANDAKA);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_BONUSYMD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_BONUSYMD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_RowId       );

      /* �{�[�i�X���̔��� */
      v_DD1 := SUBSTR(v_BONUSYMD1,3,2);
      v_DD2 := SUBSTR(v_BONUSYMD2,3,2);
--      IF v_DD1 > '25' OR v_DD2 > '25' THEN                 -- 10/19 UPD
      IF TO_NUMBER(v_DD1) > 25 OR TO_NUMBER(v_DD2) > 25 THEN -- 10/19 UPD
          v_YYYY  := SUBSTR(v_ZenYMD,1,4);
          v_MM    := SUBSTR(v_ZenYMD,5,2);
      ELSE
          v_YYYY  := SUBSTR(InStrYMD,1,4);
          v_MM    := SUBSTR(InStrYMD,5,2);
      END IF;
      v_YYYYMM  := v_YYYY || v_MM;

      BEGIN
          /* �����ܗ^�T���������� */
          SELECT DISTINCT
                 QPA4_KOJOGAKU
          INTO   v_KOJOGAKU
          FROM   QPA4_KGCKOJOT
          WHERE  QPA4_SYAINCD1                  = v_SYAINCD1
          AND    QPA4_SYAINCD2                  = v_SYAINCD2
          AND    TO_CHAR(QPA4_KOJOYMD,'YYYYMM') = v_YYYYMM;

          /* ���^�c���̍X�V */
          UPDATE QPAW_KojoRisoW
          SET    QPAW_KYUYOZANDAKA  =  QPAW_KYUYOZANDAKA - NVL(v_KOJOGAKU, 0)
          WHERE  ROWIDTOCHAR(ROWID) =  v_RowId;

      EXCEPTION
          WHEN NO_DATA_FOUND THEN
              NULL;
          WHEN  OTHERS  THEN
              IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
                  DBMS_SQL.CLOSE_CURSOR(v_CursorID);
              END IF;
              /* ���[���o�b�N */
              ROLLBACK;
              RAISE ;
      END;

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

    /* �R�~�b�g */
    COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
      IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
         DBMS_SQL.CLOSE_CURSOR(v_CursorID);
      END IF;
      IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
         DBMS_SQL.CLOSE_CURSOR(v_CursorID2);
     END IF;
      /* ���[���o�b�N */
     ROLLBACK;
      RAISE ;
END QPAP_CEnt320KyuZanSyukei;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KojoPrtKyuyo     �@                           */
/* �@�\          �F�T���A���\_����v�n�q�j�쐬                           �@�@*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KojoPrtKyuyo (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */
/* MOD 20100810 1004091 IMZ SHIBUTANI START */
--  StrSQL          VARCHAR2(1000);
  StrSQL          VARCHAR2(2000);
/* MOD 20100810 1004091 IMZ SHIBUTANI END */

  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;

  v_OutPutFLG     INTEGER;      --�o�̓t���O
  v_KINGAKU       NUMBER(7,0);  --���z
  v_GANKIN        NUMBER(7,0);  --����
  v_ZANDAKA       NUMBER(7,0);  --�c��

  /* �o�C���h�ϐ� */
  v_SEISANCD      QPAE_MISEM.QPAE_SEISANCD%TYPE;
  v_SEISANNM      QPAG_SEISANM.QPAG_SEISANNM%TYPE;
  v_SYAINCD1      QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2      QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU       QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_TOZAIKBN      QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_MISECD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MISENM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BUMONNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SIMEIKANJI    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YUSIYMD       QPAW_KojoRisoW.QPAW_YUSIYMD%TYPE;
  v_KYUYOHENSAI   QPAW_KojoRisoW.QPAW_KYUYOHENSAI%TYPE;
  v_KYUYOZANDAKA  QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA  QPAW_KojoRisoW.QPAW_SYOYOZANDAKA%TYPE;
  v_RISOKU        QPAW_KojoRisoW.QPAW_RISOKU%TYPE;
  v_BUMONCD       QPAF_BUMONM.QPAF_PRMBUMONCD%TYPE;

/* ADD 20100810 1004091 IMZ SHIBUTANI START */
	v_KAISYACD			CHAR(3);
	v_KAISYANM			VARCHAR2(24);
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

  /* 2001/10/12 �W�v�P�ʁE�o�͏� �s���Ή� */
  v_TOZAIKBNE     QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;
--��2002/12/17 ���T���A���\�p
	v_TAISHOKUYMD		QPAC_SYAINM.QPAC_TAISYOKUYMD%TYPE;
	v_MIKOJO			CHAR(10);

BEGIN

    /****************************************/
    /* �T���A���\_����v�n�q�j�s�ɒǉ�  �@�@*/
    /****************************************/
/* MOD 20100810 1004091 IMZ SHIBUTANI START */
/*
    DELETE FROM QPAQ_ZANDAKAW
          WHERE QPAQ_USERID     = InStrUserID
            AND QPAQ_COMPUTERNM = InStrComputerNM;
*/
	DELETE FROM	QPB8_MIKOJORENW
	      WHERE	QPB8_USERID		= InStrUserID
			AND	QPB8_COMPUTERNM	= InStrComputerNM;
/* MOD 20100810 1004091 IMZ SHIBUTANI END */

    /*���[�N�@�T���A���\_�����s���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAE_SEISANCD,';
    StrSQL := StrSQL || ' QPAG_SEISANNM,';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAC_MISECD,';
    StrSQL := StrSQL || ' QPAE_MISENM,';
    StrSQL := StrSQL || ' QPAF_BUMONNM,';
    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAW_YUSIYMD,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_RISOKU,';
    StrSQL := StrSQL || ' QPAC_BUMONCD,';     --10/12 UPD
    StrSQL := StrSQL || ' QPAE_TOZAIKBNE,';   --10/12 ADD
    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD ';			--��2002/12/17 ���T���A���\�p�ɏC��
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAC_MISECD';
    StrSQL := StrSQL || ' 	ELSE		''000''';
    StrSQL := StrSQL || ' END)	AS KAISYACD';
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAE_MISENM';
    StrSQL := StrSQL || ' 	ELSE		''��������''';
    StrSQL := StrSQL || ' END)	AS KAISYANM';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
    StrSQL := StrSQL ||      ',QPAC_SYAINM';
    StrSQL := StrSQL ||      ',QPAE_MISEM';
    StrSQL := StrSQL ||      ',QPAF_BUMONM';
    StrSQL := StrSQL ||      ',QPAG_SEISANM';
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '     ,(';
    StrSQL := StrSQL || '     SELECT';
    StrSQL := StrSQL || '     	 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD';
    StrSQL := StrSQL || '     	,COUNT(*)								AS CNT';
    StrSQL := StrSQL || '     FROM';
    StrSQL := StrSQL || '     	QPAH_OTHERM';
    StrSQL := StrSQL || '     WHERE';
    StrSQL := StrSQL || '     	QPAH_OTHERM.QPAH_PRMCODE LIKE ''TMISE%''';
    StrSQL := StrSQL || '     GROUP BY';
    StrSQL := StrSQL || '     	LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))';
    StrSQL := StrSQL || '     )	Q_CHECK_KAISYA';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = QPAW_SYAINCD1';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPAW_SYAINCD2';
    StrSQL := StrSQL || '   AND QPAC_MISECD   = QPAE_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAC_MISECD   = QPAF_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAC_BUMONCD  = QPAF_PRMBUMONCD(+)';
    StrSQL := StrSQL || '   AND QPAE_SEISANCD = QPAG_PRMSEISANCD(+)';
    StrSQL := StrSQL || '   AND TO_CHAR(QPAC_TAISYOKUYMD,''YYYYMMDD'') >  :StrYMD1';							--��2002/12/17 ���T���A���\�p�ɏC��
    StrSQL := StrSQL || '   AND TO_CHAR(QPAC_TAISYOKUYMD,''YYYYMMDD'') <= :StrYMD2';							--��2002/12/17 ���T���A���\�p�ɏC��
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '   AND	QPAC_MISECD			= Q_CHECK_KAISYA.MISECD(+)';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD1',      ADD_MONTHS(TO_DATE(InStrYMD) + 1,- 1));				--�O���^�� + 1
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD2',      InStrYMD);											--�����^��
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SEISANCD     ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SEISANNM     , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYAINCD1     ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_SYAINCD2     ,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SYUBETU      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_TOZAIKBN     ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_MISECD       ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_MISENM       , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_BUMONNM      , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SIMEIKANJI   , 20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_YUSIYMD          );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOHENSAI      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_KYUYOZANDAKA     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_SYOYOZANDAKA     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_RISOKU           );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_BUMONCD      ,  6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_TOZAIKBNE    ,  1);  --10/12 ADD
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_TAISHOKUYMD      );	--��2002/12/17 ���T���A���\�p�ɏC��
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_KAISYACD     ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_KAISYANM     , 24);
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SEISANCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SEISANNM      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYAINCD1      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_SYAINCD2      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SYUBETU       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_TOZAIKBN      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_MISECD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_MISENM        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_BUMONNM       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SIMEIKANJI    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_YUSIYMD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_RISOKU        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_BUMONCD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_TOZAIKBNE     );  --10/12 ADD
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_TAISHOKUYMD   );	--��2002/12/17 ���T���A���\�p�ɏC��
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_KAISYACD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_KAISYANM      );
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

      /* �o�͔���e�k�f ������*/
      v_OutPutFLG := 0;     --Off(�o�͂��Ȃ�)

      /* ���z�Z�o */
      --���[����ʁ��P
      IF  v_SYUBETU = '1' THEN
          v_KINGAKU := v_KYUYOZANDAKA + v_RISOKU;
          IF  v_KYUYOHENSAI <= v_KINGAKU  THEN
              v_KINGAKU := v_KYUYOHENSAI;
          ELSE
              IF  v_KINGAKU <=  0   THEN
                  v_KINGAKU := 0;
              END IF;
          END IF;

      --���[����ʁ��Q
      ELSE
          IF  v_KYUYOHENSAI <= v_KYUYOZANDAKA THEN
              v_KINGAKU := v_KYUYOHENSAI;
          ELSE
              v_KINGAKU := v_KYUYOZANDAKA + v_RISOKU;
          END IF;
      END IF;

      /* �����Z�o */
      v_GANKIN  := v_KINGAKU - v_RISOKU;

      /* �c���Z�o */
      --���[����ʁ��P
      IF  v_SYUBETU = '1' THEN
          v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
      --���[����ʁ��Q
      ELSE
          v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
      END IF;

      /* �o�͔��� */
      IF  v_KINGAKU       >= 0  AND
          v_RISOKU        <> 0        THEN
          v_OutPutFLG := 1;     --On(�o�͂���)
      END IF;
      IF  v_KINGAKU       >  0    AND
          v_KYUYOZANDAKA  >  0        THEN
          v_OutPutFLG := 1;     --On(�o�͂���)
      END IF;

      /* 2001/10/12 �����敪�O �s���Ή� */
      IF  v_TOZAIKBN = '0' THEN     --�����敪 �s��
          IF v_TOZAIKBNE = '1' THEN
             v_TOZAIKBN := '1';
          ELSE
             v_TOZAIKBN := '2';
          END IF;
      END IF;

      /* 2001/10/12 �����敪���� �ǉ� */
      IF  v_TOZAIKBN = '1' THEN
          v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
      ELSE
          v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
      END IF;

      /* �T���A���\_����v�n�q�j�ɒǉ� */
      IF  v_OutPutFLG = 1   THEN    --On(�o�͂���)

/* DEL 20100810 1004091 IMZ SHIBUTANI START */
--	�ϊ������͕s�v�ׁ̈A�폜
--	          /* 2001/10/12 �W�v�P�ʁE�o�͏� �s���Ή� */
--	          SELECT  QSA2_MEI
--	            INTO  v_MEI
--	          FROM    QSA2_SCODET
--	          WHERE   QSA2_PRMCODEKBN         = 'DP' || v_TOZAIKBN     --��
--	              AND RTRIM(QSA2_PRMCODENO)   = v_MISECD;
/* DEL 20100810 1004091 IMZ SHIBUTANI END */

/* MOD 20100810 1004091 IMZ SHIBUTANI START */
--	���[�̎Q�ƃe�[�u���ύX
/*
			INSERT INTO QPAQ_ZANDAKAW VALUES (
			NULL
			,TO_CHAR(v_TAISHOKUYMD,'YYYYMMDD')
			,SUBSTR(v_MEI,4,3)
			,NVL(v_MISENM,' ')
			,NVL(v_BUMONCD,' ')
			,NVL(v_BUMONNM,' ')
			,NVL(v_SYAINCD1,' ')
			,NVL(v_SYAINCD2,' ')
			,NVL(v_SIMEIKANJI,' ')
			,NVL(v_SYUBETU,' ')
			,TO_CHAR(v_YUSIYMD,'YYYYMMDD')
			,v_ZANDAKA
			,NULL
			,NULL
			,NULL
			,NULL
			,NULL
			,NULL
			,InStrUserID
			,InStrComputerNM
			);
*/
		INSERT INTO QPB8_MIKOJORENW
		(
			 QPB8_KAISYACD
			,QPB8_KAISYANM
			,QPB8_TOZAIKBN
			,QPB8_MISECD
			,QPB8_MISENM
			,QPB8_BUMONCD
			,QPB8_BUMONNM
			,QPB8_SYAINCD1
			,QPB8_SYAINCD2
			,QPB8_SIMEIKANJI
			,QPB8_SYUBETU
			,QPB8_YUSIYMD
			,QPB8_ZANDAKA
			,QPB8_TAISYOKUYMD
			,QPB8_USERID
			,QPB8_COMPUTERNM
		) VALUES (
			 NVL(v_KAISYACD,' ')
			,NVL(v_KAISYANM,' ')
			,NVL(v_TOZAIKBN,' ')
			,NVL(v_MISECD,' ')
			,NVL(v_MISENM,' ')
			,NVL(v_BUMONCD,' ')
			,NVL(v_BUMONNM,' ')
			,NVL(v_SYAINCD1,' ')
			,NVL(v_SYAINCD2,' ')
			,NVL(v_SIMEIKANJI,' ')
			,NVL(v_SYUBETU,' ')
			,TO_CHAR(v_YUSIYMD,'YYYYMMDD')
			,v_ZANDAKA
			,TO_CHAR(v_TAISHOKUYMD,'YYYYMMDD')
			,InStrUserID
			,InStrComputerNM
		);
/* MOD 20100810 1004091 IMZ SHIBUTANI END */
      END IF;

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt320KojoPrtKyuyo;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320SyouyoRisoku   �@ �@                          */
/* �@�\          �F�T���A���\_�ܗ^�����v�n�q�j�쐬                         �@*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt320SyouyoRisoku (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --�ܗ^���t

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_Dummy         INTEGER;

  v_SelectFlg     INTEGER;

  v_Risoku        NUMBER;     --����
  v_ZenYMD        CHAR(8);    --�O��

  v_BONUSYMD18    CHAR(8);
  v_BONUSYMD28    CHAR(8);
  v_BONUSYMD_W    CHAR(8);
  v_BONUSMM1      CHAR(2);
  v_BONUSMM2      CHAR(2);
  v_SYOYOMM       CHAR(2);

  v_SIMEIKANJI      QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MISECD          QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_TOZAIKBN        QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_BUMONCD         QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_TAISYOKUYMD     QPAC_SYAINM.QPAC_TAISYOKUYMD%TYPE;
  v_KYUSYOSTYMD     QPAC_SYAINM.QPAC_KYUSYOSTYMD%TYPE;
  v_KYUSYOEDYMD     QPAC_SYAINM.QPAC_KYUSYOEDYMD%TYPE;

  v_BONUSYMD1       QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_SEISANCD        QPAE_MISEM.QPAE_SEISANCD%TYPE;
  v_MISENM          QPAE_MISEM.QPAE_MISENM%TYPE;

  V_ZANDAKA         QPAA_KOJOT.QPAA_ZANDAKA%TYPE;     --�T���e�[�u�� �c��

  v_PRMSYAINCD1     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_PRMSYAINCD2     QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_PRMYUSIYMD      QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE;
  v_GENDOGAKU       QPA8_SYNDAICYOT.QPA8_GENDOGAKU%TYPE;
  v_SYUBETU         QPA8_SYNDAICYOT.QPA8_SYUBETU%TYPE;
  v_RIRITU          QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_HENSAITUKISU    QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KYUYOZANDAKA    QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KOJOCYUSIFLG    QPA8_SYNDAICYOT.QPA8_KOJOCYUSIFLG%TYPE;
  v_KANSAIYMD       QPA8_SYNDAICYOT.QPA8_KANSAIYMD%TYPE;

  v_KEIYAKUYMD      QPA1_KGCDAICYOT.QPA1_KEIYAKUYMD%TYPE;
  v_KASIRISOKU      QPAV_KojoKoguW.QPAV_KASIRISOKU%TYPE;
  v_KYUYOZANDAKA_W  QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;

  /* 2001/10/12 �����敪�O �s���Ή� */
  v_TOZAIKBNE     QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;

/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
  v_FROMDATE       CHAR(8);
  v_TODATE         CHAR(8);
  InStrYMD_2       CHAR(8);
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */

BEGIN

--    /****************************************/
--    /* �T���A���\_�����v�n�q�j�s�ɒǉ�  �@�@*/
--    /****************************************/
--    DELETE FROM QPAW_KojoRisoW
--          WHERE QPAW_USERID     = InStrUserID
--            AND QPAW_COMPUTERNM = InStrComputerNM;

    /* �O�����t */
    v_ZenYMD    := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) ,'YYYYMMDD');

/* Yasui@NBC 2005.05.06 �T���쐬�s��  ==> */
    v_FROMDATE := SUBSTR(v_ZenYMD, 1, 6) || '26';	-- �����N���̑O��26��
    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';  -- �����N���̓���25��
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */

    /*���������@�����Z���䒠�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA1_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA1_KEIYAKUYMD,';
    StrSQL := StrSQL || ' QPA1_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA1_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA1_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA1_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAC_MISECD,';
    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAC_BUMONCD,';
    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOSTYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOEDYMD,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';
    StrSQL := StrSQL || ' QPAE_SEISANCD,';
    StrSQL := StrSQL || ' QPAE_MISENM,';        --10/12 UPD
    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';     --10/12 ADD
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT,';
    StrSQL := StrSQL || '      QPAC_SYAINM,';
    StrSQL := StrSQL || '      QPAE_MISEM';
	StrSQL := StrSQL || ' WHERE (QPA1_KOJOCYUSHIFLG = ''1'')';			--��2002/12/17 ���T���A�����X�g�p�C��
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA1_PRMSYAINCD1 ';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA1_PRMSYAINCD2 ';
    StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_KEIYAKUYMD     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_KYUYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_SYOYOZANDAKA   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SIMEIKANJI,  20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_MISECD,       3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_TOZAIKBN,     1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_BUMONCD,      6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_TAISYOKUYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUSYOSTYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_KYUSYOEDYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_BONUSYMD1,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BONUSYMD2,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD,     3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISENM,      24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_TOZAIKBNE,    1);  --10/12 ADD

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_KEIYAKUYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_KYUYOHENSAI  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SYOYOHENSAI  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOZANDAKA );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_SYOYOZANDAKA );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SIMEIKANJI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_MISECD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_TOZAIKBN     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_BUMONCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_TAISYOKUYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUSYOSTYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_KYUSYOEDYMD  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_BONUSYMD1    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BONUSYMD2    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISENM       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_TOZAIKBNE    );  --10/12 ADD


--2002/03/07 �����ԍϊz�e�[�u�����ԍϊz���擾�i�����ԍϑ䒠�̕ԍϊz�͎g�p���Ȃ��j

--     /* �����ԍϊz���擾 */
--      StrSQL := NULL;
--      StrSQL := StrSQL || 'SELECT';
--      StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
--      StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
--      StrSQL := StrSQL || ' FROM  QPA2_KGCHENSAIT';
--      StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1  = :Code1';
--      StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2  = :Code2';
--      StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM  <= :YM';
--      StrSQL := StrSQL || ' ORDER BY QPA2_PRMHENKOUYM DESC';
--      /* ���I�J�[�\���̃I�[�v�� */
--      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
--      /* SQL�̉�� */
--      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
--      /* ���͕ϐ����o�C���h���� */
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_PRMSYAINCD1);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_PRMSYAINCD2);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YM', SUBSTR(InStrYMD,1,6));
--      /* �o�͕ϐ��̃o�C���h */
--      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KYUYOHENSAI);
--      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SYOYOHENSAI);
--      /* SQL�̎��s */
--      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
--      /* FETCH */
--       IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
--         /* �J�����l��ϐ��֊i�[ */
--        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KYUYOHENSAI);
--       DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SYOYOHENSAI);
--      END IF;
--      /* �J�[�\���̃N���[�Y */
--      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
----2002/03/07 �����܂�

      /* 2001/10/12 �����敪�O �s���Ή� */
      IF  v_TOZAIKBN = '0' THEN     --�����敪 �s��
          IF v_TOZAIKBNE = '1' THEN
             v_TOZAIKBN := '1';
          ELSE
             v_TOZAIKBN := '2';
          END IF;
      END IF;

      /* �T���e�[�u�����c���擾 */
      v_SelectFlg := 1;
      BEGIN
        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
                                   FROM   QPAA_KOJOT
                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
                                     AND  QPAA_SYUBETU  = '1'
                                     AND  QPAA_YUSIKBN  = '3';
      EXCEPTION
           WHEN   NO_DATA_FOUND THEN
                  v_SelectFlg := 0;
           WHEN   OTHERS THEN
                  RAISE;
      END;

      /* �ܗ^�x���N�����̍ĕҏW */
      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
/* add TR0506-023 imz.Yoshida ==> */
      v_BONUSYMD18 := QPAP_CEnt320GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
      v_BONUSYMD28 := QPAP_CEnt320GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
/* add TR0506-023 imz.Yoshida <== */
      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
         v_BONUSYMD_W   := v_BONUSYMD18;
         v_BONUSYMD18   := v_BONUSYMD28;
         v_BONUSYMD28   := v_BONUSYMD_W;
      END IF;

      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);

      /* ���[�N�@�T���A���\_�����s�ɒǉ� */
/* mod TR0506-023 imz.Yoshida ==> */
--      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
      IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
      OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
/* mod TR0506-023 imz.Yoshida <== */

          INSERT INTO QPAW_KojoRisoW VALUES (
             NVL(v_PRMSYAINCD1,' ')   --�l�R�[�h�P
            ,NVL(v_PRMSYAINCD2,' ')   --�l�R�[�h�Q
            ,'1'                      --���[�����
            ,v_KEIYAKUYMD             --�_���
            ,NULL                     --�Z����
            ,NVL(v_GENDOGAKU,0)       --�Z���z���x�z
            ,0                        --�_�񗘗�
            ,0                        --�ԍό���
            ,0                        --���^�ԍϊz���z
            ,NVL(v_KYUYOHENSAI,0)     --���^�ԍϊz���^��
            ,0                        --�ܗ^�ԍϊz���z
            ,NVL(v_SYOYOHENSAI,0)     --�ܗ^�ԍϊz�ܗ^��
            ,NULL                     --���ϓ�
            ,DECODE(v_SelectFlg,1,V_ZANDAKA,NVL(v_KYUYOZANDAKA,0))    --���^�c��
            ,NVL(v_SYOYOZANDAKA,0)    --�ܗ^�c��
            ,0                        --����
            ,NVL(v_TOZAIKBN,' ')      --�����敪
            ,NVL(v_SEISANCD,' ')      --���Z�X�R�[�h
            ,NVL(v_MISECD,' ')        --�����X�R�[�h
            ,NVL(v_BUMONCD,' ')       --��������R�[�h
            ,NVL(v_MISENM,' ')        --�X����
            ,NVL(v_SIMEIKANJI,' ')    --�l������
            ,v_TAISYOKUYMD            --�ސE�N����
            ,v_KYUSYOSTYMD            --�x�E�N����
            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --�ܗ^�x�����P
            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --�ܗ^�x�����Q
            ,InStrUserID
            ,InStrComputerNM
            );
      END IF;

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);


    /*���؏����@�Ј��Z���䒠�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD1,';
    StrSQL := StrSQL || ' QPA8_PRMSYAINCD2,';
    StrSQL := StrSQL || ' QPA8_PRMYUSIYMD,';
    StrSQL := StrSQL || ' QPA8_GENDOGAKU,';
    StrSQL := StrSQL || ' QPA8_RIRITU,';
    StrSQL := StrSQL || ' QPA8_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPA8_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPA8_KANSAIYMD,';
    StrSQL := StrSQL || ' QPA8_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPA8_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAC_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAC_MISECD,';
    StrSQL := StrSQL || ' QPAC_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAC_BUMONCD,';
    StrSQL := StrSQL || ' QPAC_TAISYOKUYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOSTYMD,';
    StrSQL := StrSQL || ' QPAC_KYUSYOEDYMD,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD1,';
    StrSQL := StrSQL || ' QPAE_BONUSYMD2,';
    StrSQL := StrSQL || ' QPAE_SEISANCD,';
    StrSQL := StrSQL || ' QPAE_MISENM,';        --10/12 UPD
    StrSQL := StrSQL || ' QPAE_TOZAIKBNE ';     --10/12 ADD
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT,';
    StrSQL := StrSQL || '      QPAC_SYAINM,';
    StrSQL := StrSQL || '      QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPA8_SYOYOZANDAKA <> 0';
    StrSQL := StrSQL || '   AND QPA8_KANSAIYMD IS NULL';
    StrSQL := StrSQL || '   AND (QPA8_KOJOCYUSIFLG IS NULL OR QPA8_KOJOCYUSIFLG = '' '')';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD1 = QPA8_PRMSYAINCD1 ';
    StrSQL := StrSQL || '   AND QPAC_PRMSYAINCD2 = QPA8_PRMSYAINCD2 ';
    StrSQL := StrSQL || '   AND QPAC_MISECD      = QPAE_PRMMISECD(+)';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_PRMSYAINCD1, 1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_PRMSYAINCD2, 7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_PRMYUSIYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_GENDOGAKU     );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_RIRITU        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_HENSAITUKISU  );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_KYUYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KYUYOHENSAI   );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_SYOYOHENSAIALL);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_SYOYOHENSAI    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_KANSAIYMD      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_KYUYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_SYOYOZANDAKA );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_SIMEIKANJI,  20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_MISECD,       3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_TOZAIKBN,     1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_BUMONCD,      6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_TAISYOKUYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_KYUSYOSTYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_KYUSYOEDYMD    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_BONUSYMD1,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_BONUSYMD2,    4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_SEISANCD,     3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_MISENM,      24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_TOZAIKBNE,    1);  --10/12 ADD

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_PRMSYAINCD1   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_PRMSYAINCD2   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_PRMYUSIYMD    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_GENDOGAKU     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_RIRITU        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_HENSAITUKISU  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_KYUYOHENSAIALL);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KYUYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_SYOYOHENSAIALL);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_SYOYOHENSAI   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_KANSAIYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_KYUYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_SYOYOZANDAKA  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_SIMEIKANJI    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_MISECD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_TOZAIKBN      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_BUMONCD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_TAISYOKUYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_KYUSYOSTYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_KYUSYOEDYMD   );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_BONUSYMD1     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_BONUSYMD2     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_SEISANCD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_MISENM        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_TOZAIKBNE     );  --10/12 ADD

      /* 2001/10/12 �����敪�O �s���Ή� */
      IF  v_TOZAIKBN = '0' THEN     --�����敪 �s��
          IF v_TOZAIKBNE = '1' THEN
             v_TOZAIKBN := '1';
          ELSE
             v_TOZAIKBN := '2';
          END IF;
      END IF;

      /* �T���e�[�u�����c���擾 */
      v_SelectFlg := 1;
      BEGIN
        SELECT NVL(QPAA_ZANDAKA,0) INTO   V_ZANDAKA
                                   FROM   QPAA_KOJOT
                                   WHERE  QPAA_SYAINCD1 = v_PRMSYAINCD1
                                     AND  QPAA_SYAINCD2 = v_PRMSYAINCD2
                                     AND  QPAA_YUSIYMD  = v_PRMYUSIYMD
                                     AND  QPAA_SYUBETU  = '2'
                                     AND  QPAA_YUSIKBN  = '3';
      EXCEPTION
           WHEN   NO_DATA_FOUND THEN
                  v_SelectFlg := 0;
           WHEN   OTHERS THEN
                  RAISE;
      END;

      /* �ܗ^�x���N�����̍ĕҏW */
      v_BONUSYMD18    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD1;
      v_BONUSYMD28    := SUBSTR(InStrYMD,1,4) || v_BONUSYMD2;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� �ܗ^���擾�̏C�� ==> */
      v_BONUSYMD18 := QPAP_CEnt320GetBONUSDayFnc(InStrYMD, v_BONUSYMD1);
      v_BONUSYMD28 := QPAP_CEnt320GetBONUSDayFnc(InStrYMD, v_BONUSYMD2);
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
      IF v_BONUSYMD18 > v_BONUSYMD28 THEN
         v_BONUSYMD_W   := v_BONUSYMD18;
         v_BONUSYMD18   := v_BONUSYMD28;
         v_BONUSYMD28   := v_BONUSYMD_W;
      END IF;

      v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
      v_BONUSMM1      := SUBSTR(v_BONUSYMD18,5,2);
      v_BONUSMM2      := SUBSTR(v_BONUSYMD28,5,2);

/* Yasui@NBC 2005.05.06 �T���쐬�s���Ή��ɂ�菈�����������ɂȂ��Ă��܂��̂ł���ɑ΂���C�� ==> */
    --�����p�ܗ^���擾
    IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
    OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
       --�ܗ^�����u26���`�����v�܂ł͑O��
       InStrYMD_2 := v_ZenYMD;
    ELSE
       --�ܗ^�����u1���`25���v�܂ł͏�����
       InStrYMD_2 := InStrYMD;
    END IF;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */

      /* ���[�N�@�T���A���\_�����s�ɒǉ� */
/* Yasui@NBC 2005.05.06 �T���쐬�s�� �����N���̑O��26���`�����N����25�����ł���΃��[�N�쐬 ==> */
--      IF  v_BONUSMM1 = v_SYOYOMM    OR    v_BONUSMM2 = v_SYOYOMM  THEN
      IF (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE))
      OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE)) THEN
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
        /*   �Z���� <= �؏����o���t  */
        IF  TO_CHAR(v_PRMYUSIYMD,'YYYYMMDD') <= gbl_SyousyoYMD  THEN
          /* �����v�Z */
/* Yasui@NBC 2005.05.06 �T���쐬�s���Ή��ɂ�菈�����������ɂȂ��Ă��܂��̂ł���ɑ΂���C�� ==> */
--          v_Risoku := QPAP_CEnt320SyoRisokuFnc(v_PRMYUSIYMD,        --�Z����
--                                               v_SYOYOHENSAIALL,    --�ܗ^�ԍϑ��z
--                                               v_SYOYOHENSAI,       --�ܗ^�ԍϊz
--                                               v_SYOYOZANDAKA,      --�ܗ^�c��
--                                               v_RIRITU,            --�_�񗘗�
--                                               v_BONUSYMD18,        --�ܗ^�x�����P
--                                               v_BONUSYMD28,        --�ܗ^�x�����Q
--                                               InStrYMD);           --�ܗ^���t
          v_Risoku := QPAP_CEnt320SyoRisokuFnc(v_PRMYUSIYMD,        --�Z����
                                               v_SYOYOHENSAIALL,    --�ܗ^�ԍϑ��z
                                               v_SYOYOHENSAI,       --�ܗ^�ԍϊz
                                               v_SYOYOZANDAKA,      --�ܗ^�c��
                                               v_RIRITU,            --�_�񗘗�
                                               v_BONUSYMD18,        --�ܗ^�x�����P
                                               v_BONUSYMD28,        --�ܗ^�x�����Q
                                               InStrYMD_2);         --�ܗ^���t
/* Yasui@NBC 2005.05.06 �T���쐬�s���Ή��ɂ�菈�����������ɂȂ��Ă��܂��̂ł���ɑ΂���C�� <== */

          INSERT INTO QPAW_KojoRisoW VALUES (
             NVL(v_PRMSYAINCD1,' ')   --�l�R�[�h�P
            ,NVL(v_PRMSYAINCD2,' ')   --�l�R�[�h�Q
            ,'2'                      --���[�����
            ,NULL                     --�_���
            ,v_PRMYUSIYMD             --�Z����
            ,NVL(v_GENDOGAKU,0)       --�Z���z���x�z
            ,NVL(v_RIRITU,0)          --�_�񗘗�
            ,NVL(v_HENSAITUKISU,0)    --�ԍό���
            ,NVL(v_KYUYOHENSAIALL,0)  --���^�ԍϊz���z
            ,NVL(v_KYUYOHENSAI,0)     --���^�ԍϊz���^��
            ,NVL(v_SYOYOHENSAIALL,0)  --�ܗ^�ԍϊz���z
            ,NVL(v_SYOYOHENSAI,0)     --�ܗ^�ԍϊz�ܗ^��
            ,v_KANSAIYMD              --���ϓ�
            ,DECODE(v_SelectFlg,1,V_ZANDAKA - NVL(v_SYOYOZANDAKA,0),NVL(v_KYUYOZANDAKA,0))    --���^�c��
            ,NVL(v_SYOYOZANDAKA,0)    --�ܗ^�c��
            ,v_Risoku                 --����
            ,NVL(v_TOZAIKBN,' ')      --�����敪
            ,NVL(v_SEISANCD,' ')      --���Z�X�R�[�h
            ,NVL(v_MISECD,' ')        --�����X�R�[�h
            ,NVL(v_BUMONCD,' ')       --��������R�[�h
            ,NVL(v_MISENM,' ')        --�X����
            ,NVL(v_SIMEIKANJI,' ')    --�l������
            ,v_TAISYOKUYMD            --�ސE�N����
            ,v_KYUSYOSTYMD            --�x�E�N����
            ,TO_DATE(v_BONUSYMD18,'YYYYMMDD')     --�ܗ^�x�����P
            ,TO_DATE(v_BONUSYMD28,'YYYYMMDD')     --�ܗ^�x�����Q
            ,InStrUserID
            ,InStrComputerNM
            );
        END IF;
      END IF;

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt320SyouyoRisoku;


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KojoPrtSyouyo                                 */
/* �@�\          �F�T���A���\_�ܗ^����v�n�q�j�쐬                       �@�@*/
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KojoPrtSyouyo (
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2,                         --�R���s���[�^��
  InStrYMD        IN  VARCHAR2) IS                      --���^���t

  /* �����ŗL�̕ϐ� */
/* MOD 20100810 1004091 IMZ SHIBUTANI START */
--  StrSQL          VARCHAR2(1000);
  StrSQL          VARCHAR2(2000);
/* MOD 20100810 1004091 IMZ SHIBUTANI END */

  v_CursorID      NUMBER := 0;
  v_Dummy         INTEGER;

  v_OutPutFLG     INTEGER;      --�o�̓t���O
  v_KINGAKU       NUMBER(7,0);  --���z
  v_GANKIN        NUMBER(7,0);  --����
  v_ZANDAKA       NUMBER(7,0);  --�c��

  /* �o�C���h�ϐ� */
  v_SYAINCD1        QPAW_KojoRisoW.QPAW_SYAINCD1%TYPE;
  v_SYAINCD2        QPAW_KojoRisoW.QPAW_SYAINCD2%TYPE;
  v_SYUBETU         QPAW_KojoRisoW.QPAW_SYUBETU%TYPE;
  v_KEIYAKUYMD      QPAW_KojoRisoW.QPAW_KEIYAKUYMD%TYPE;
  v_YUSIYMD         QPAW_KojoRisoW.QPAW_YUSIYMD%TYPE;
  v_GENDOGAKU       QPAW_KojoRisoW.QPAW_GENDOGAKU%TYPE;
  v_RIRITU          QPAW_KojoRisoW.QPAW_RIRITU%TYPE;
  v_HENSAITUKISU    QPAW_KojoRisoW.QPAW_HENSAITUKISU%TYPE;
  v_KYUYOHENSAIALL  QPAW_KojoRisoW.QPAW_KYUYOHENSAIALL%TYPE;
  v_KYUYOHENSAI     QPAW_KojoRisoW.QPAW_KYUYOHENSAI%TYPE;
  v_SYOYOHENSAIALL  QPAW_KojoRisoW.QPAW_SYOYOHENSAIALL%TYPE;
  v_SYOYOHENSAI     QPAW_KojoRisoW.QPAW_SYOYOHENSAI%TYPE;
  v_KANSAIYMD       QPAW_KojoRisoW.QPAW_KANSAIYMD%TYPE;
  v_KYUYOZANDAKA    QPAW_KojoRisoW.QPAW_KYUYOZANDAKA%TYPE;
  v_SYOYOZANDAKA    QPAW_KojoRisoW.QPAW_SYOYOZANDAKA%TYPE;
  v_RISOKU          QPAW_KojoRisoW.QPAW_RISOKU%TYPE;
  v_TOZAIKBN        QPAW_KojoRisoW.QPAW_TOZAIKBN%TYPE;
  v_SEISANCD        QPAW_KojoRisoW.QPAW_SEISANCD%TYPE;
  v_MISECD          QPAW_KojoRisoW.QPAW_MISECD%TYPE;
  v_BUMONCD         QPAW_KojoRisoW.QPAW_BUMONCD%TYPE;
  v_MISENM          QPAW_KojoRisoW.QPAW_MISENM%TYPE;
  v_SIMEIKANJI      QPAW_KojoRisoW.QPAW_SIMEIKANJI%TYPE;
  v_TAISYOKUYMD     QPAW_KojoRisoW.QPAW_TAISYOKUYMD%TYPE;
  v_KYUSYOKUYMD     QPAW_KojoRisoW.QPAW_KYUSYOKUYMD%TYPE;
  v_BONUSYMD1       QPAW_KojoRisoW.QPAW_BONUSYMD1%TYPE;
  v_BONUSYMD2       QPAW_KojoRisoW.QPAW_BONUSYMD2%TYPE;

  v_BUMONNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SEISANNM        QPAG_SEISANM.QPAG_SEISANNM%TYPE;

  v_SYORIYMD        CHAR(8);
  v_SYORIMM         CHAR(2);
  v_BONUSMM1        CHAR(2);
  v_BONUSMM2        CHAR(2);

/* ADD 20100810 1004091 IMZ SHIBUTANI START */
	v_KAISYACD			CHAR(3);
	v_KAISYANM			VARCHAR2(24);
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

  /* 2001/10/12 �W�v�P�ʁE�o�͏� �s���Ή� */
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;
--��2002/12/17 ���T���A���\�p
	v_TAISHOKUYMD	QPAC_SYAINM.QPAC_TAISYOKUYMD%TYPE;
	v_MIKOJO		CHAR(10);
/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
  v_FROMDATE       CHAR(8);
  v_TODATE         CHAR(8);
  v_BONUSYMD18     CHAR(8);
  v_BONUSYMD28     CHAR(8);
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */

BEGIN

    /****************************************/
    /* �T���A���\_����v�n�q�j�s�ɒǉ�  �@�@*/
    /****************************************/
--    DELETE FROM QPAQ_ZANDAKAW
--          WHERE QPAQ_USERID     = InStrUserID
--            AND QPAQ_COMPUTERNM = InStrComputerNM;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
    v_FROMDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD, 'YYYYMMDD'), -1), 'YYYYMM') || '26';	-- �����N���̑O��26��
    v_TODATE   := SUBSTR(InStrYMD, 1, 6) || '25';                                            -- �����N���̓���25��
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
    /*���[�N�@�T���A���\_�����s���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT DISTINCT';
    StrSQL := StrSQL || ' QPAW_SYAINCD1,';
    StrSQL := StrSQL || ' QPAW_SYAINCD2,';
    StrSQL := StrSQL || ' QPAW_SYUBETU,';
    StrSQL := StrSQL || ' QPAW_KEIYAKUYMD,';
    StrSQL := StrSQL || ' QPAW_YUSIYMD,';
    StrSQL := StrSQL || ' QPAW_GENDOGAKU,';
    StrSQL := StrSQL || ' QPAW_RIRITU,';
    StrSQL := StrSQL || ' QPAW_HENSAITUKISU,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAIALL,';
    StrSQL := StrSQL || ' QPAW_KYUYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_SYOYOHENSAIALL,';
    StrSQL := StrSQL || ' QPAW_SYOYOHENSAI,';
    StrSQL := StrSQL || ' QPAW_KANSAIYMD,';
    StrSQL := StrSQL || ' QPAW_KYUYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_SYOYOZANDAKA,';
    StrSQL := StrSQL || ' QPAW_RISOKU,';
    StrSQL := StrSQL || ' QPAW_TOZAIKBN,';
    StrSQL := StrSQL || ' QPAW_SEISANCD,';
    StrSQL := StrSQL || ' QPAW_MISECD,';
    StrSQL := StrSQL || ' QPAW_BUMONCD,';
    StrSQL := StrSQL || ' QPAW_MISENM,';
    StrSQL := StrSQL || ' QPAW_SIMEIKANJI,';
    StrSQL := StrSQL || ' QPAW_TAISYOKUYMD,';
    StrSQL := StrSQL || ' QPAW_KYUSYOKUYMD,';
    StrSQL := StrSQL || ' QPAW_BONUSYMD1,';
    StrSQL := StrSQL || ' QPAW_BONUSYMD2,';
    StrSQL := StrSQL || ' QPAF_BUMONNM,';
    StrSQL := StrSQL || ' QPAG_SEISANNM,';
	StrSQL := StrSQL || ' QPAW_TAISYOKUYMD';
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAW_MISECD';
    StrSQL := StrSQL || ' 	ELSE		''000''';
    StrSQL := StrSQL || ' END)	AS KAISYACD';
    StrSQL := StrSQL || ' ,(';
    StrSQL := StrSQL || ' CASE NVL(Q_CHECK_KAISYA.CNT, 0)';
    StrSQL := StrSQL || ' 	WHEN 0 THEN	QPAW_MISENM';
    StrSQL := StrSQL || ' 	ELSE		''��������''';
    StrSQL := StrSQL || ' END)	AS KAISYANM';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' FROM QPAW_KojoRisoW';
    StrSQL := StrSQL || '     ,QPAF_BUMONM';
    StrSQL := StrSQL || '     ,QPAG_SEISANM ';
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '     ,(';
    StrSQL := StrSQL || '     SELECT';
    StrSQL := StrSQL || '     	 LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))	AS MISECD';
    StrSQL := StrSQL || '     	,COUNT(*)								AS CNT';
    StrSQL := StrSQL || '     FROM';
    StrSQL := StrSQL || '     	QPAH_OTHERM';
    StrSQL := StrSQL || '     WHERE';
    StrSQL := StrSQL || '     	QPAH_OTHERM.QPAH_PRMCODE LIKE ''TMISE%''';
    StrSQL := StrSQL || '     GROUP BY';
    StrSQL := StrSQL || '     	LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))';
    StrSQL := StrSQL || '     )	Q_CHECK_KAISYA';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */
    StrSQL := StrSQL || ' WHERE QPAW_MISECD   = QPAF_PRMMISECD(+)';
    StrSQL := StrSQL || '   AND QPAW_BUMONCD  = QPAF_PRMBUMONCD(+)';
    StrSQL := StrSQL || '   AND QPAW_SEISANCD = QPAG_PRMSEISANCD(+)';
	StrSQL := StrSQL || '   AND TO_CHAR(QPAW_TAISYOKUYMD,''YYYYMMDD'') >  :StrYMD1';								--��2002/12/17 ���T���A���\�p�ɏC��
	StrSQL := StrSQL || '   AND TO_CHAR(QPAW_TAISYOKUYMD,''YYYYMMDD'') <= :StrYMD2';								--��2002/12/17 ���T���A���\�p�ɏC��
    StrSQL := StrSQL || '   AND QPAW_USERID     = :StrUserID';
    StrSQL := StrSQL || '   AND QPAW_COMPUTERNM = :StrComputerNM';
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    StrSQL := StrSQL || '   AND	QPAW_MISECD			= Q_CHECK_KAISYA.MISECD(+)';
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD1',      ADD_MONTHS(TO_DATE(InStrYMD) + 1,- 1));			--�O���^�� + 1
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrYMD2',      InStrYMD);										--�����^��
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrUserID',    InStrUserID);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':StrComputerNM',InStrComputerNM);

    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_SYAINCD1      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_SYAINCD2      ,  7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_SYUBETU       ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_KEIYAKUYMD        );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_YUSIYMD           );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_GENDOGAKU         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_RIRITU            );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_HENSAITUKISU      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KYUYOHENSAIALL    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KYUYOHENSAI       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SYOYOHENSAIALL    );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,12,v_SYOYOHENSAI       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,13,v_KANSAIYMD         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,14,v_KYUYOZANDAKA      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,15,v_SYOYOZANDAKA      );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,16,v_RISOKU            );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,17,v_TOZAIKBN      ,  1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,18,v_SEISANCD      ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,19,v_MISECD        ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,20,v_BUMONCD       ,  6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,21,v_MISENM        , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,22,v_SIMEIKANJI    , 40);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,23,v_TAISYOKUYMD       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,24,v_KYUSYOKUYMD       );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,25,v_BONUSYMD1         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,26,v_BONUSYMD2         );
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,27,v_BUMONNM       , 24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,28,v_SEISANNM      , 24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,29,v_TAISHOKUYMD       );
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,30,v_KAISYACD      ,  3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,31,v_KAISYANM      , 24);
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    LOOP
      IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_SYAINCD1        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_SYAINCD2        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_SYUBETU         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_KEIYAKUYMD      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_YUSIYMD         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_GENDOGAKU       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_RIRITU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_HENSAITUKISU    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KYUYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KYUYOHENSAI     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SYOYOHENSAIALL  );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,12,v_SYOYOHENSAI     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,13,v_KANSAIYMD       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,14,v_KYUYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,15,v_SYOYOZANDAKA    );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,16,v_RISOKU          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,17,v_TOZAIKBN        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,18,v_SEISANCD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,19,v_MISECD          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,20,v_BUMONCD         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,21,v_MISENM          );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,22,v_SIMEIKANJI      );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,23,v_TAISYOKUYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,24,v_KYUSYOKUYMD     );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,25,v_BONUSYMD1       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,26,v_BONUSYMD2       );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,27,v_BUMONNM         );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,28,v_SEISANNM        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,29,v_TAISHOKUYMD     );
/* ADD 20100810 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,30,v_KAISYACD        );
      DBMS_SQL.COLUMN_VALUE(v_CursorID,31,v_KAISYANM        );
/* ADD 20100810 1004091 IMZ SHIBUTANI END */

      /* ���z�Z�o */
      --���[����ʁ��P
      IF  v_SYUBETU = '1' THEN
          IF  v_SYOYOHENSAI <= v_KYUYOZANDAKA  THEN
              v_KINGAKU := v_SYOYOHENSAI;
          ELSE
              v_KINGAKU := v_KYUYOZANDAKA;
          END IF;

      --���[����ʁ��Q
      ELSE
          IF  v_SYOYOHENSAI <= v_SYOYOZANDAKA  THEN
              v_KINGAKU := v_SYOYOHENSAI;
          ELSE
              v_KINGAKU := v_SYOYOZANDAKA + v_RISOKU;
          END IF;
      END IF;

      /* �����Z�o */
      v_GANKIN  := v_KINGAKU - v_RISOKU;

      /* �c���Z�o */
      --���[����ʁ��P
      IF  v_SYUBETU = '1' THEN
          v_ZANDAKA := v_KYUYOZANDAKA - v_GANKIN;
      --���[����ʁ��Q
      ELSE
          v_ZANDAKA := v_SYOYOZANDAKA + v_KYUYOZANDAKA - v_GANKIN;
      END IF;

      /* ������ �Z�o */
/* Yasui@NBC 2005.05.06 �T���쐬�s�� �ܗ^���擾�̏C�� ==> */
--      IF  SUBSTR(InStrYMD,5,2) = SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2) THEN
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),7,2);
--      ELSE
--          v_SYORIYMD := SUBSTR(InStrYMD,1,6) || SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),7,2);
--      END IF;
      IF TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
      AND TO_NUMBER(TO_CHAR(v_BONUSYMD1, 'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
          v_SYORIYMD := TO_CHAR(v_BONUSYMD1,'YYYYMMDD');
      ELSE
          IF TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) >= TO_NUMBER(v_FROMDATE)
          AND TO_NUMBER(TO_CHAR(v_BONUSYMD2,'YYYYMMDD') ) <= TO_NUMBER(v_TODATE) THEN
             v_SYORIYMD := TO_CHAR(v_BONUSYMD2,'YYYYMMDD');
          ELSE
             v_SYORIYMD := '00000000';
          END IF;
      END IF;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */

      /* ����p �� */
      v_SYORIMM   := SUBSTR(InStrYMD,5,2);
      v_BONUSMM1  := SUBSTR(TO_CHAR(v_BONUSYMD1,'YYYYMMDD'),5,2);
      v_BONUSMM2  := SUBSTR(TO_CHAR(v_BONUSYMD2,'YYYYMMDD'),5,2);

      /* �o�͔���e�k�f ������*/
      v_OutPutFLG := 0;     --Off(�o�͂��Ȃ�)
      /* �o�͔��� */
      IF  v_KINGAKU       >  0  AND
          v_RISOKU        >  0  AND
         (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
          v_OutPutFLG := 1;     --On(�o�͂���)
      END IF;
      IF  v_SYUBETU = '1'   THEN
--mod TR0506-023 imz.Yoshida ==>
--          IF  v_KYUYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
--             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
          v_BONUSYMD18 := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');
          v_BONUSYMD28 := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');
          IF  v_KYUYOZANDAKA  >  0 AND
              v_KINGAKU       >  0 AND
             (  (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE) )
             OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE) )) THEN
--mod TR0506-023 imz.Yoshida <==
              v_OutPutFLG := 1;     --On(�o�͂���)
          END IF;
      END IF;
      IF  v_SYUBETU = '2'   THEN
/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
--          IF  v_SYOYOZANDAKA  >  0  AND
--              v_KINGAKU       >  0  AND
--             (v_BONUSMM1      =  v_SYORIMM  OR v_BONUSMM2 = v_SYORIMM)  THEN
          v_BONUSYMD18 := TO_CHAR(v_BONUSYMD1, 'YYYYMMDD');
          v_BONUSYMD28 := TO_CHAR(v_BONUSYMD2, 'YYYYMMDD');
          IF  v_SYOYOZANDAKA  >  0 AND
              v_KINGAKU       >  0 AND
             (  (TO_NUMBER(v_BONUSYMD18) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD18) <= TO_NUMBER(v_TODATE) )
             OR (TO_NUMBER(v_BONUSYMD28) >= TO_NUMBER(v_FROMDATE) AND TO_NUMBER(v_BONUSYMD28) <= TO_NUMBER(v_TODATE) )) THEN
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
              v_OutPutFLG := 1;     --On(�o�͂���)
          END IF;
      END IF;

		/* 2001/10/12 �����敪���� �ǉ� */
		IF  v_TOZAIKBN = '1' THEN
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
		ELSE
			v_SEISANNM := RTRIM(v_SEISANNM) || ' (��)';
		END IF;

		/* �T���A���\_����v�n�q�j�ɒǉ� */
		IF  v_OutPutFLG = 1   THEN    --On(�o�͂���)

/* DEL 20100810 1004091 IMZ SHIBUTANI START */
--	�ϊ������͕s�v�ׁ̈A�폜
--			/* 2001/10/12 �W�v�P�ʁE�o�͏� �s���Ή� */
--			SELECT  QSA2_MEI
--			INTO  v_MEI
--			FROM    QSA2_SCODET
--			WHERE   QSA2_PRMCODEKBN         = 'DP' || v_TOZAIKBN     --��
--			AND RTRIM(QSA2_PRMCODENO)   = v_MISECD;
/* DEL 20100810 1004091 IMZ SHIBUTANI END */

/* MOD 20100810 1004091 IMZ SHIBUTANI START */
--	���[�̎Q�ƃe�[�u���ύX
/*
			INSERT INTO QPAQ_ZANDAKAW VALUES (
				NULL
				,TO_CHAR(v_TAISHOKUYMD,'YYYY/MM/DD')
				,SUBSTR(v_MEI,4,3)
				,NVL(v_MISENM,' ')
				,NVL(v_BUMONCD,' ')
				,NVL(v_BUMONNM,' ')
				,NVL(v_SYAINCD1,' ')
				,NVL(v_SYAINCD2,' ')
				,NVL(v_SIMEIKANJI,' ')
				,NVL(v_SYUBETU,' ')
				,TO_CHAR(v_YUSIYMD,'YYYYMMDD')
				,v_ZANDAKA
				,NULL
				,NULL
				,NULL
				,NULL
				,NULL
				,NULL
				,InStrUserID
				,InStrComputerNM
				);
*/
			INSERT INTO QPB8_MIKOJORENW
			(
				 QPB8_KAISYACD
				,QPB8_KAISYANM
				,QPB8_TOZAIKBN
				,QPB8_MISECD
				,QPB8_MISENM
				,QPB8_BUMONCD
				,QPB8_BUMONNM
				,QPB8_SYAINCD1
				,QPB8_SYAINCD2
				,QPB8_SIMEIKANJI
				,QPB8_SYUBETU
				,QPB8_YUSIYMD
				,QPB8_ZANDAKA
				,QPB8_TAISYOKUYMD
				,QPB8_USERID
				,QPB8_COMPUTERNM
			) VALUES (
				 NVL(v_KAISYACD,' ')
				,NVL(v_KAISYANM,' ')
				,NVL(v_TOZAIKBN,' ')
				,NVL(v_MISECD,' ')
				,NVL(v_MISENM,' ')
				,NVL(v_BUMONCD,' ')
				,NVL(v_BUMONNM,' ')
				,NVL(v_SYAINCD1,' ')
				,NVL(v_SYAINCD2,' ')
				,NVL(v_SIMEIKANJI,' ')
				,NVL(v_SYUBETU,' ')
				,TO_CHAR(v_YUSIYMD,'YYYYMMDD')
				,v_ZANDAKA
				,TO_CHAR(v_TAISHOKUYMD,'YYYYMMDD')
				,InStrUserID
				,InStrComputerNM
			);
/* MOD 20100810 1004091 IMZ SHIBUTANI END */
		END IF;
	END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
        DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt320KojoPrtSyouyo;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320SyoRisokuFnc   �@ �@                          */
/* �@�\          �F�T���A���\_�ܗ^�����v�Z �֐� (Return ����)              �@*/
/*****************************************************************************/
FUNCTION QPAP_CEnt320SyoRisokuFnc (
  InYUSIYMD         IN  QPA8_SYNDAICYOT.QPA8_PRMYUSIYMD%TYPE,     --�Z����
  InSYOYOHENSAIALL  IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE, --�ܗ^�ԍϑ��z
  InSYOYOHENSAI     IN  QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE,    --�ܗ^�ԍϊz
  InSYOYOZANDAKA    IN  QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE,   --�ܗ^�c��
  InRIRITU          IN  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE,         --�_�񗘗�
  InBONUSYMD1       IN  VARCHAR2,                                 --�ܗ^�x�����P
  InBONUSYMD2       IN  VARCHAR2,                                 --�ܗ^�x�����Q
  InStrYMD          IN  VARCHAR2)                                 --�ܗ^���t
RETURN  QPAA_KOJOT.QPAA_RISOKU%TYPE IS

  /* �����ŗL�̕ϐ� */
  v_YUSIDD        CHAR(2);
  v_SYOYOMM       CHAR(2);
  v_BONUSMM1      CHAR(2);
  v_BONUSMM2      CHAR(2);
  v_Kikan         NUMBER;     --�ܗ^�ԍϊ���
  v_Risoku        NUMBER;     --����
  v_Nisuu         NUMBER;     --����
  v_YMD_W1        CHAR(8);    --��Ɨp �N����
  v_YMD_W2        CHAR(8);    --��Ɨp �N����

  v_RIRITU       NUMBER;      -- 10/24 ADD

BEGIN

  v_RIRITU := TRUNC(InRIRITU / 36500 * 1000000) / 1000000;        -- 10/24 ADD

  v_SYOYOMM       := SUBSTR(InStrYMD,5,2);
  v_BONUSMM1      := SUBSTR(InBONUSYMD1,5,2);
  v_BONUSMM2      := SUBSTR(InBONUSYMD2,5,2);
  --�ܗ^�ԍϊ���
  v_Kikan := MONTHS_BETWEEN(TO_DATE(SUBSTR(InBONUSYMD2,1,6),'YYYYMM'),TO_DATE(SUBSTR(InBONUSYMD1,1,6),'YYYYMM'));

  v_Risoku := 0;
  /**********************************************/
  /* �Z������ 2000/03/01 �����Ɍv�Z���𕪂���   */
  /**********************************************/
  If TO_CHAR(InYUSIYMD,'YYYYMMDD') < gbl_SysChangeYMD Then
      /***************/
      /* ���v�Z��    */
      /***************/
      If v_Kikan = 6 Then
          If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
          /*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then          '���񗘑��̔��� */

              If v_BONUSMM1 = v_SYOYOMM Then
              /*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */

                  -- ���X�̌v�Z��
                  If SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD') + 1,'YYYYMMDD'),5,2) <> SUBSTR(TO_CHAR(TO_Date(InBONUSYMD1,'YYYYMMDD'),'YYYYMMDD'),5,2) Then
                  /*--If Month(DateAdd("y", 1, CVDate(�ܗ^�x���N����1))) <> Month(CVDate(�ܗ^�x���N����1)) Then */
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;

                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                  Else
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;

                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                     v_Nisuu := v_Nisuu + (TO_NUMBER(SUBSTR(InBONUSYMD1,7,2)) - 1 - 30);
                  End If;
                  v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
                  /*--v_Risoku = Int(MySet!�ܗ^�ԍϊz���z * MySet!�_�񗘗� * ����_WORK / 2 / 18000) */
              Else
                  If SUBSTR(TO_CHAR(TO_Date(InBONUSYMD2,'YYYYMMDD') + 1,'YYYYMMDD'),5,2) <> SUBSTR(TO_CHAR(TO_Date(InBONUSYMD2,'YYYYMMDD'),'YYYYMMDD'),5,2) Then
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
                     v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                  Else
                     v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
                     v_YUSIDD := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
                     IF v_YUSIDD >= '11' THEN
                        v_Nisuu := v_Nisuu + 6;
                     ELSE
                        v_Nisuu := v_Nisuu + 21;
                     END IF;
                     v_Nisuu := v_Nisuu + (TO_NUMBER(SUBSTR(InBONUSYMD2,7,2)) - 1 - 30);
                  End If;
                  v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
              End If;
          Else
              v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU / 200);
              /*--v_Risoku = Int(MySet!�ܗ^�c�� * MySet!�_�񗘗� / 200) */
          End If;


      Else
          If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
          /*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then          '���񗘑��̔��� */
              v_Nisuu  := MONTHS_BETWEEN(TO_DATE(SUBSTR(InStrYMD,1,6),'YYYYMM'),TO_DATE(TO_CHAR(InYUSIYMD,'YYYYMM'),'YYYYMM')) * 30;
              v_YUSIDD   := SUBSTR(TO_CHAR(InYUSIYMD,'YYYYMMDD'),7,2);
              IF v_YUSIDD >= '11' THEN
                 v_Nisuu := v_Nisuu + 6;
              ELSE
                  v_Nisuu := v_Nisuu + 21;
              END IF;
              v_Nisuu := v_Nisuu + ((10) - 1 - 30);
              v_Risoku := TRUNC(InSYOYOHENSAIALL * InRIRITU * v_Nisuu / 2 / 18000);
              /*--v_Risoku = Int(MySet!�ܗ^�ԍϊz���z * MySet!�_�񗘗� * ����_WORK / 2 / 18000) */
          Else

              If v_BONUSMM1 = v_SYOYOMM Then
              /* --If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */
                  v_YMD_W1 := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-12),'YYYYMMDD'),1,4) || SUBSTR(InBONUSYMD2,5,4);
                  v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
                  v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * MONTHS_BETWEEN(TO_DATE(SUBSTR(v_YMD_W2,1,6),'YYYYMM'), TO_DATE(SUBSTR(v_YMD_W1,1,6),'YYYYMM')) / 12 / 100);

              Else
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
                  v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
                  v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * MONTHS_BETWEEN(TO_DATE(SUBSTR(v_YMD_W1,1,6),'YYYYMM'), TO_DATE(SUBSTR(v_YMD_W2,1,6),'YYYYMM')) / 12 / 100);
              End If;
          End If;
      End If;
  Else
      /*******************/
      /* �V�v�Z��        */
      /*******************/
      -- ����̔���
      If InSYOYOZANDAKA = InSYOYOHENSAIALL Then
      /*--If MySet!�ܗ^�c�� = MySet!�ܗ^�ԍϊz���z Then */

          -- ����̏ꍇ�A�Z�����i�v�Z���鎞�́|�P���j����A����̏ܗ^���܂ł̓���
          If v_BONUSMM1 = v_SYOYOMM Then
          /*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */

              v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD1,7,2);
              v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
          Else
              v_YMD_W1 := SUBSTR(InStrYMD,1,6) || SUBSTR(InBONUSYMD2,7,2);
              v_Nisuu  := TO_DATE(v_YMD_W1,'YYYYMMDD') - (InYUSIYMD - 1);
          End If;

      Else
          -- �Q��ڈȍ~�̏ꍇ�A�O��̏ܗ^������A����̏ܗ^���܂ł̓���
          If v_BONUSMM1 = v_SYOYOMM Then
          /*--If Month(CVDate(�ܗ^�x���N����1)) = Month(�����Ώۓ��t) Then */

              -- �ܗ^�x�����P������̏ܗ^���̏ꍇ
              If TO_NUMBER(v_BONUSMM1) <  TO_NUMBER(v_BONUSMM2) Then
              /*--If Val(Month(CVDate(�ܗ^�x���N����1))) < Val(Month(CVDate(�ܗ^�x���N����2))) Then */

                  -- �O��̏ܗ^��
                  v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD2,5,4);
              Else
                  -- �O��̏ܗ^��
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
              End If;
              -- ����̏ܗ^��
              v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
          Else
              -- �ܗ^�x�����Q������̏ܗ^���̏ꍇ
              If TO_NUMBER(v_BONUSMM2) <  TO_NUMBER(v_BONUSMM1) Then
              /*--If Val(Month(CVDate(�ܗ^�x���N����2))) < Val(Month(CVDate(�ܗ^�x���N����1))) Then */

                  -- �O��̏ܗ^��
                  v_YMD_W1 := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) - 1) || SUBSTR(InBONUSYMD1,5,4);
              Else
                  -- �O��̏ܗ^��
                  v_YMD_W1 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD1,5,4);
              End If;
              -- ����̏ܗ^��
              v_YMD_W2 := SUBSTR(InStrYMD,1,4) || SUBSTR(InBONUSYMD2,5,4);
          End If;
          -- �����v�Z
          v_Nisuu  :=  TO_DATE(v_YMD_W2,'YYYYMMDD') - TO_DATE(v_YMD_W1,'YYYYMMDD');
          /*--WORK_���� = DateDiff("y", CVDate(WORK_DATE1), CVDate(WORK_DATE2)) */
      End If;
      /*******************/
      /* �ܗ^�̗����v�Z  */
      /*******************/
      /*--v_Risoku = Int(MySet!�ܗ^�c�� * MySet!�_�񗘗� * WORK_���� / 36500) */
---      v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * v_Nisuu  / 36500);                     -- 10/24 UPD
      IF TO_CHAR(InYUSIYMD,'YYYYMMDD')  < gbl_SysChangeYMD2 THEN                              -- 10/24 UPD
          v_Risoku := TRUNC(InSYOYOZANDAKA * InRIRITU * v_Nisuu  / 36500);                    -- 10/24 UPD
      ELSE                                                                                    -- 10/24 UPD
          v_Risoku := TRUNC(InSYOYOZANDAKA * v_RIRITU * v_Nisuu);                             -- 10/24 UPD
      END IF;                                                                                 -- 10/24 UPD
  End If;

  RETURN v_Risoku;

END QPAP_CEnt320SyoRisokuFnc;

/****************************************************************************************/
/* ���W���[����  �FQPAP_CEnt320GetRiritu                                                */
/* �@�\          �F�����Z�������擾                                                     */
/****************************************************************************************/
FUNCTION QPAP_CEnt320GetRiritu(
   InStrYMD   IN  CHAR) RETURN NUMBER IS

  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy         INTEGER;
  v_Riritu        NUMBER := 0;
  v_HenkoRiritu   QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

BEGIN
  /* �����Z�������e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA7_RIRITU,0)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE QPA7_PRMHENKOYMD = (SELECT MAX(QPA7_PRMHENKOYMD)';
  StrSQL := StrSQL ||                             ' FROM  QPA7_KGCRIRITUT';
  StrSQL := StrSQL ||                            ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') <= :YMD)';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoRiritu);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoRiritu);
    v_Riritu := v_HenkoRiritu;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �ԋp�l�ɓ��Ă͂߂� */
  RETURN v_Riritu;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt320GetRiritu;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt320DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN
    DELETE FROM QPAS_KGCW
          WHERE QPAS_USERID     = InStrUserID
            AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAU_KojoZanW
          WHERE QPAU_USERID     = InStrUserID
            AND QPAU_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAV_KojoKoguW
          WHERE QPAV_USERID     = InStrUserID
            AND QPAV_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAW_KojoRisoW
          WHERE QPAW_USERID     = InStrUserID
            AND QPAW_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAO_KOJOW
          WHERE QPAO_USERID     = InStrUserID
            AND QPAO_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAP_MIKOJOW
          WHERE QPAP_USERID     = InStrUserID
            AND QPAP_COMPUTERNM = InStrComputerNM;

/* MOD 20100810 1004091 IMZ SHIBUTANI START */
/*
    DELETE FROM QPAQ_ZANDAKAW
          WHERE QPAQ_USERID     = InStrUserID
            AND QPAQ_COMPUTERNM = InStrComputerNM;
*/
	DELETE FROM	QPB8_MIKOJORENW
	      WHERE	QPB8_USERID		= InStrUserID
			AND	QPB8_COMPUTERNM	= InStrComputerNM;
/* MOD 20100810 1004091 IMZ SHIBUTANI END */

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt320DelWorkTbl;

/* 2001/10/23 ADD  START ******************************************************/

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt320KojoTKousin                                   */
/* �@�\          �FQPAO_KOJOW����f�[�^���擾���A�T���e�[�u���iQPAA_KOJOW�j  */
/*                 �A�c���e�[�u���iQPA0_ZANDAKAT�j�̍X�V�������s��           */
/*****************************************************************************/
PROCEDURE QPAP_CEnt320KojoTKousin (
  InStrSyoriYM        IN  VARCHAR2,                     --�����N��
  InStrUserID     IN  VARCHAR2,                         --���[�U�[�h�c
  InStrComputerNM IN  VARCHAR2) IS                      --�R���s���[�^��

  /* �����ŗL�̕ϐ� */
  StrSyoriKbn     CHAR := '4';                          -- �ܗ^�����敪
  StrSIGN         CHAR(1);                              --�T�C��
  RowKojow        CurKojow%ROWTYPE;                     --�T�����[�N�@�J�[�\��
  v_MEI           QSA2_SCODET.QSA2_MEI%TYPE;

BEGIN

      /* �ŐV�ܗ^�T���N���̎擾 */
      BEGIN
          SELECT  NVL(QSA2_MEI,'000000')
            INTO  v_MEI
            FROM  QSA2_SCODET
           WHERE  QSA2_PRMCODEKBN  = 'DP3'
           AND  QSA2_PRMCODENO   = '0000';
      EXCEPTION
          WHEN NO_DATA_FOUND THEN
              v_MEI := '000000';
          WHEN OTHERS THEN
              RAISE;
      END;

      /* �ŐV�ܗ^�T���N���ȍ~�̂Ƃ��̂݁A�T���e�[�u���ɏ������� */
      IF  TO_NUMBER(InStrSyoriYM)  >  TO_NUMBER(v_MEI) THEN

          /* �T�����[�N�J�[�\���I�[�v�� */
          OPEN CurKojow(InStrUserID,InStrComputerNM);
          LOOP
              FETCH CurKojow INTO RowKojow;
              IF  CurKojow%NOTFOUND THEN
                  EXIT;                                     --���[�v�I��
              END IF;

              /* �T���e�[�u���ɏ����� */
              INSERT INTO QPAA_KOJOT VALUES (
                  RowKojow.SYORIYMD                         --�T����
                 ,NVL(RowKojow.SYAINCD1,' ')                --�Ј��R�[�h�P
                 ,NVL(RowKojow.SYAINCD2,' ')                --�Ј��R�[�h�Q
                 ,NVL(RowKojow.SYUBETU,' ')                 --���[�����
                 ,NVL(RowKojow.TOZAIKBN,' ')                --�����敪
                 ,RowKojow.YUSIYMD                          --�Z����
                 ,StrSyoriKbn                               --�Z���敪
                 ,NVL(RowKojow.KINGAKU ,   '0')             --���z
                 ,NVL(RowKojow.GANKIN  ,   '0')             --����
                 ,NVL(RowKojow.RISOKU  ,   '0')             --����
                 ,NVL(RowKojow.ZANDAKA ,   '0')             --�c��
              );

              /* ���[����ʂ��u�����v�̏ꍇ */
              IF RowKojow.SYUBETU = '1' THEN

                  /* �����Z���ܗ^�T�������e�[�u���ɏ����� */
		          INSERT INTO QPA4_KGCKOJOT VALUES (
			          NVL(RowKojow.SYAINCD1,' ')            --�Ј��R�[�h�P
			         ,NVL(RowKojow.SYAINCD2,' ')            --�Ј��R�[�h�Q
			         ,RowKojow.SYORIYMD                     --�T����
			         ,NVL(RowKojow.GANKIN  ,'0')            --�T�����z
			         ,SYSDATE
			      );

                  IF RowKojow.GANKIN IS NOT NULL THEN
                      IF RowKojow.GANKIN < 0 THEN
                          StrSIGN := '*';
                      ELSE
                          StrSIGN := ' ';
                      END IF;
                  ELSE
                      StrSIGN := ' ';
                  END IF;

                  /* �c���e�[�u���ɏ����� */
                  INSERT INTO QPA0_ZandakaT VALUES (
                      '10'                     		        --C/C
                     ,NVL(RowKojow.SYAINCD2,' ')            --�Ј��R�[�h
                     ,NVL(RowKojow.GANKIN  ,'0')            --����
                     ,NVL(StrSIGN  ,   ' ')                 --�T�C��
                     ,'               '                     --�G���[����
                     ,'                  '                  --�]��
                  );
	          END IF;

          END LOOP;

          CLOSE CurKojow;

          /* �ŐV�ܗ^�T���N���ɍX�V���� */
          UPDATE  QSA2_SCODET  SET
                  QSA2_MEI  =  InStrSyoriYM
          WHERE   QSA2_PRMCODEKBN  = 'DP3'
          AND     QSA2_PRMCODENO   = '0000';

          /* �R�~�b�g */
          COMMIT;
      END IF;

EXCEPTION
  WHEN  OTHERS  THEN
    IF CurKojow%ISOPEN = TRUE THEN
      CLOSE CurKojow;
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE;

END QPAP_CEnt320KojoTKousin;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt320Lock                                                                               */
/* �@�\          �F�T���A���\�̃��b�N                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt320Lock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,				/* ���ʃR�[�h	  */
	InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type,				/* �v���O�����h�c */
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type,				/* �R���s���[�^�� */
	InStrOperatorID		IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS			/* �I�y���[�^�h�c */

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �m�F */
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
	WHEN W_HAITADUPLICATE THEN	--�T���A���\��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt320Lock DUPLICATE KEY');
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt320Lock;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt320UnLock                                                                             */
/* �@�\          �F�T���A���\�̃��b�N����                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt320UnLock(
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

END QPAP_CEnt320UnLock;

/* 2001/10/23 ADD  END ********************************************************/

/* 2001/11/02 ADD  START ******************************************************/
/******************************************************************************/
/* ���W���[����  �FQPAP_CEnt320GetYM                                          */
/* �@�\          �F�ŐV�ܗ^�T���N���̎擾                                     */
/******************************************************************************/
PROCEDURE QPAP_CEnt320GetYM (
    OtMei    OUT    VARCHAR2)    IS                      --����

BEGIN

    /* �o�̓p�����[�^�̃N���A */
    OtMei := ' ';

    /* �ŐV�ܗ^�T���N���̎擾 */
    SELECT    NVL(QSA2_MEI,' ')
      INTO    OtMei
      FROM    QSA2_SCODET
     WHERE    QSA2_PRMCODEKBN  = 'DP3'
       AND    QSA2_PRMCODENO   = '0000';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN;                           --�����I��
END QPAP_CEnt320GetYM;
/* 2001/11/02 ADD  END ********************************************************/
/* Yasui@NBC 2005.05.06 �T���쐬�s�� ==> */
/****************************************************************************************/
/* ���W���[����  �FQPAP_CEnt320GetBONUSDayFnc                                           */
/* �@�\          �F12��26���`31���̏ܗ^���ɑ΂��āA�N�x�����ǂ��悤�ɂ���B             */
/* InStrYMD      �F�T�����s��(yyyymmdd)                                                 */
/* BONUSYMD      �F�ܗ^��(mmdd)                                                         */
/****************************************************************************************/
FUNCTION QPAP_CEnt320GetBONUSDayFnc(
   InStrYMD  IN CHAR,
   BONUSYMD  IN CHAR) RETURN CHAR IS

   rBONUSYMD CHAR(8);
BEGIN
   IF  SUBSTR(InStrYMD,5,2) = '01'
   AND TO_NUMBER(BONUSYMD) >= 1226 AND TO_NUMBER(BONUSYMD) <= 1231 THEN
      rBONUSYMD := TO_CHAR(TO_NUMBER(SUBSTR(InStrYMD,1,4)) -1) || BONUSYMD;
   ELSE
      rBONUSYMD := SUBSTR(InStrYMD,1,4) || BONUSYMD;
   END IF;
   RETURN rBONUSYMD;
END QPAP_CEnt320GetBONUSDayFnc;
/* Yasui@NBC 2005.05.06 �T���쐬�s�� <== */
END QPAP_Cent320PkG;

/***END of LINE****************************************************************/
/
--SHOW ERROR
SHOW ERRORS;
