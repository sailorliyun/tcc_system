CREATE OR REPLACE PACKAGE  QPAP_CEnt230PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt230PkG                                                                                */
/* �@�\          �F�ސE�\��҈ꗗ                                                                                 */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��                                                              */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtTaisyokuYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyainCDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

  TYPE typOtSimeiAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtTozaiKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtBumonCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtBumonNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE
    INDEX BY BINARY_INTEGER;

/* �ސE�\��҃f�[�^�擾 */
PROCEDURE QPAP_CEnt230SelList (
   InStrTaisyokuYMDSt   IN      CHAR                  --�����p�ސE�N����St
  ,InStrTaisyokuYMDEd   IN      CHAR                  --�����p�ސE�N����Ed
  ,InStrUserID      IN      CHAR                  --���[�U�[ID
  ,InStrCompNM      IN      CHAR                  --�R���s���[�^�[����
  ,InNumMaxRec        IN      NUMBER                  --�ő�z��i�[����
  ,IoNumSpCnt         IN OUT    NUMBER                  --�Ăяo����
  ,OtStrTaisyokuYMD   OUT     typOtTaisyokuYMDAry           --�ސE�N����
  ,OtStrSyainCD     OUT     typOtSyainCDAry             --�Ј��R�[�h1+�Ј��R�[�h2
  ,OtStrSimei       OUT     typOtSimeiAry             --����
  ,OtStrMiseCD      OUT     typOtOtMiseCDAry            --�����X�R�[�h
  ,OtStrMiseNM      OUT     typOtMiseNMAry              --�����X��
  ,OtStrTozaiKBN      OUT     typOtTozaiKBNAry            --�����敪
  ,OtStrBumonCD     OUT     typOtBumonCDAry             --��������R�[�h
  ,OtStrBumonNM     OUT     typOtBumonNMAry             --�������喼��
  ,OtNumAryCount      OUT     NUMBER                  --�z��i�[����
  ,OtStrEndFlg      OUT     VARCHAR2);                --�����I���t���O

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt230DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);       --�R���s���[�^��

/* �䒠�̑��݃`�F�b�N */
FUNCTION  QPAP_CEnt230Count(
   InStrSyainCD1   IN  CHAR,            --�Ј��R�[�h�P
   InStrSyainCD2   IN  CHAR)            --�Ј��R�[�h�Q
RETURN NUMBER;

END QPAP_CEnt230PkG;
/
show error
/******************************************************************************************************************/
/*�Q  �{�f�B�[                                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt230PkG IS
  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

  /* �����������̂݊J������J�[�\�� */
  CURSOR CurCEnt230(UserID IN VARCHAR2,CompNM IN VARCHAR2) IS
      SELECT   QPAR_SYAINCD,QPAR_SYAINNM,QPAR_MISECD,QPAR_MISENM,
           QPAR_TOZAIKBN,QPAR_BUMONCD,QPAR_BUMONNM,QPAR_TAISYOKUYMD
      FROM   QPAR_TAISYOKUW
      WHERE  QPAR_USERID = UserID
      AND    QPAR_COMPUTERNM = CompNM
      ORDER BY QPAR_YM,QPAR_TAISYOKUYMD,QPAR_SYAINCD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt230SelList                                                                            */
/* �@�\          �F�ސE�\��҃f�[�^�擾                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt230SelList (
   InStrTaisyokuYMDSt   IN      CHAR                  --�����p�ސE�N����St
  ,InStrTaisyokuYMDEd   IN      CHAR                  --�����p�ސE�N����Ed
  ,InStrUserID      IN      CHAR                  --���[�U�[ID
  ,InStrCompNM      IN      CHAR                  --�R���s���[�^�[����
  ,InNumMaxRec        IN      NUMBER                  --�ő�z��i�[����
  ,IoNumSpCnt         IN OUT    NUMBER                  --�Ăяo����
  ,OtStrTaisyokuYMD   OUT     typOtTaisyokuYMDAry           --�ސE�N����
  ,OtStrSyainCD     OUT     typOtSyainCDAry             --�Ј��R�[�h1+�Ј��R�[�h2
  ,OtStrSimei       OUT     typOtSimeiAry             --����
  ,OtStrMiseCD      OUT     typOtOtMiseCDAry            --�����X�R�[�h
  ,OtStrMiseNM      OUT     typOtMiseNMAry              --�����X��
  ,OtStrTozaiKBN      OUT     typOtTozaiKBNAry            --�����敪
  ,OtStrBumonCD     OUT     typOtBumonCDAry             --��������R�[�h
  ,OtStrBumonNM     OUT     typOtBumonNMAry             --�������喼��
  ,OtNumAryCount      OUT     NUMBER                  --�z��i�[����
  ,OtStrEndFlg      OUT     VARCHAR2) IS              --�����I���t���O

  /* �����ŗL�̕ϐ� */
  NumIdx            NUMBER;                            --�z��pIDX
  v_SelectStmt      VARCHAR2(1000);                    --SQL������
  v_SelectStmt2     VARCHAR2(1000);                    --SQL������
  v_CursorID        INTEGER;                           --�J�[�\��ID
  v_CursorID2       INTEGER;                           --�J�[�\��ID
  v_Dummy           INTEGER;                           --Dummy
  v_Dummy2          INTEGER;                           --Dummy

  v_TaisyokuYMD     CHAR(8);                           --�o�C���h�p�ސE�N����
  v_SyainCD1        QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE; --�o�C���h�p�Ј��R�[�h1
  v_SyainCD2        QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE; --�o�C���h�p�Ј��R�[�h2
  v_Simei           QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;  --�o�C���h�p����
  v_MiseCD          QPAC_SYAINM.QPAC_MISECD%TYPE;      --�o�C���h�p�����X�R�[�h
  v_MiseNM          QPAE_MISEM.QPAE_MISENM%TYPE;       --�o�C���h�p�����X��
  v_TozaiKBN        QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;    --�o�C���h�p�����敪
  v_BumonCD         QPAC_SYAINM.QPAC_BUMONCD%TYPE;     --�o�C���h�p��������R�[�h
  v_BumonNM         QPAF_BUMONM.QPAF_BUMONNM%TYPE;     --�o�C���h�p�������喼��
  v_Count           NUMBER := 0;                       --�䒠�J�E���g

  /* �s�ϐ� */
   RowQPAG      CurCEnt230%ROWTYPE;

BEGIN
  IF IoNumSpCnt = 0 THEN
    OtNumAryCount := 0;
    OtstrEndFlg  := '0';
    NumIdx     := 0;

    /* WT�̏����� */
    DELETE FROM QPAR_TAISYOKUW 
    WHERE QPAR_USERID = InStrUserID
    AND QPAR_COMPUTERNM = InStrCompNM;

    --�������Ɏg�p����J�[�\�����I�[�v������
    v_CursorID := DBMS_SQL.OPEN_CURSOR;

    --�Ј��}�X�^���Y�������̑ސE�҂𒊏o����
    v_SelectStmt := NULL;
    v_SelectStmt := v_SelectStmt || 'SELECT';
    v_SelectStmt := v_SelectStmt || ' TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'')';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_PRMSYAINCD1';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_PRMSYAINCD2';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_SIMEIKANJI';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_MISECD';
    v_SelectStmt := v_SelectStmt || ',E.QPAE_MISENM';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_TOZAIKBN';
    v_SelectStmt := v_SelectStmt || ',C.QPAC_BUMONCD';
    v_SelectStmt := v_SelectStmt || ',F.QPAF_BUMONNM';
    v_SelectStmt := v_SelectStmt || ' FROM QPAC_SYAINM C,QPAE_MISEM E,QPAF_BUMONM F';
    v_SelectStmt := v_SelectStmt || ' WHERE TO_CHAR(C.QPAC_TAISYOKUYMD,''YYYYMMDD'') BETWEEN :TaisyokuST AND :TaisyokuED';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_MISECD = E.QPAE_PRMMISECD';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_MISECD = F.QPAF_PRMMISECD (+)';
    v_SelectStmt := v_SelectStmt || ' AND C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)';
    v_SelectStmt := v_SelectStmt || ' ORDER BY C.QPAC_TAISYOKUYMD';

    --�⍇������͂���
      DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

    --���͕ϐ����o�C���h����
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaisyokuST',InStrTaisyokuYMDSt);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':TaisyokuED',InStrTaisyokuYMDEd);

    --���s����
    v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);

    --�o�͕ϐ����`����
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TaisyokuYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Simei,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);

    --FETCH LOOP��
    LOOP
      --��A�̍s���o�b�t�@�Ɏ��o��������LOOP�̏I���������`�F�b�N����
      IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
        EXIT;                               --���[�v�I��
      END IF;

      --��A�̍s���o�b�t�@����PLSQL�ϐ���FETCH����
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TaisyokuYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Simei);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);

      /****************************/
      /* �Z�����Ώۂ̎Ј����ǂ��� */
      /****************************/
      v_Count := 0;
      v_Count := QPAP_CEnt230Count(v_SyainCD1,v_SyainCD2);

      /* �����E�؏��Z���䒠�ɓo�^����ĂȂ���΁A */
      /* �\�������Ȃ��B                           */
      IF v_Count > 0 THEN
        /* WT�Ƀf�[�^��ǉ����� */
        INSERT INTO QPAR_TAISYOKUW VALUES(
          SUBSTR(v_TaisyokuYMD,1,4) || SUBSTR(v_TaisyokuYMD,5,2),
          NVL(v_SyainCD1,' ') || NVL(v_SyainCD2,' '),
          NVL(v_Simei,' '),
          NVL(v_MiseCD,' '),
          NVL(v_MiseNM,' '),
          NVL(v_TozaiKBN,' '),
          NVL(v_BumonCD,' '),
          NVL(v_BumonNM,' '),
          NVL(v_TaisyokuYMD,' '),
          InStrUserID,
          InStrCompNM
        );
      END IF;

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    
    COMMIT;

  END IF;

   /* QPAR_TAISYOKUW����f�[�^���擾���� */
    --�J�[�\���I�[�v��
    IF CurCEnt230%ISOPEN = FALSE THEN
      OPEN CurCEnt230(InStrUserID,InStrCompNM);
    END IF;

  --�e�d�s�b�g
  LOOP
    NumIdx := NumIdx + 1;

    /* 100���Ƃ̃f�[�^���擾 */
    FETCH CurCEnt230 INTO RowQPAG;                      --���ǂ�

    IF CurCEnt230%NOTFOUND THEN
      OtNumAryCount := NumIdx - 1;
      OtStrEndFlg := '1';                               --�����I��
      EXIT;                                             --���[�v�I��
    END IF;

    OtStrTaisyokuYMD(NumIdx) := NVL(RowQPAG.QPAR_TAISYOKUYMD,' ');
    OtStrSyainCD(NumIdx)     := NVL(RowQPAG.QPAR_SYAINCD,' ');
    OtStrSimei(NumIdx)       := NVL(RowQPAG.QPAR_SYAINNM,' ');
    OtStrMiseCD(NumIdx)      := NVL(RowQPAG.QPAR_MISECD,' ');
    OtStrMiseNM(NumIdx)      := NVL(RowQPAG.QPAR_MISENM,' ');
    OtStrTozaiKBN(NumIdx)    := NVL(RowQPAG.QPAR_TOZAIKBN,' ');
    OtStrBumonCD(NumIdx)     := NVL(RowQPAG.QPAR_BUMONCD,' ');
    OtStrBumonNM(NumIdx)     := NVL(RowQPAG.QPAR_BUMONNM,' ');

    /* �z��̌������l�`�w�𒴂����ꍇ */
    IF InNumMaxRec = NumIdx THEN
      OtNumAryCount := NumIdx;
      RETURN;
    END IF;

  END LOOP;

  /* �J�[�\���̃N���[�Y */
  CLOSE CurCEnt230;

EXCEPTION
  WHEN  OTHERS  THEN
    DBMS_SQL.CLOSE_CURSOR(v_CursorID);
    RAISE ;
END QPAP_CEnt230SelList;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt230DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt230DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��
    
BEGIN
    DELETE FROM QPAR_TAISYOKUW 
    WHERE QPAR_USERID     = InStrUserID
      AND QPAR_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt230DelWorkTbl;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt230Count                                         */
/* �@�\          �F�䒠�̑��݃`�F�b�N                                        */
/*****************************************************************************/
/* �䒠�̑��݃`�F�b�N */
FUNCTION  QPAP_CEnt230Count(
   InStrSyainCD1   IN  CHAR,            --�Ј��R�[�h�P
   InStrSyainCD2   IN  CHAR)            --�Ј��R�[�h�Q
RETURN NUMBER IS

  StrSQL           VARCHAR2(1000);
  v_CursorID       NUMBER;
  v_NumCount       NUMBER;
  v_Dummy          INTEGER;

  v_SumCount       NUMBER;

BEGIN

  v_NumCount := 0;
  v_SumCount := 0;

/* �����Z���䒠���� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
  /* �J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
  /* ���[�J���ϐ��ւ̊֘A�Â� */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    v_SumCount := v_SumCount + v_NumCount;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  v_NumCount := 0;

/* �Ј��Z���䒠���� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT COUNT(*)';
  StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
  StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';
  /* �J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
  /* ���[�J���ϐ��ւ̊֘A�Â� */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    v_SumCount := v_SumCount + v_NumCount;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �ԋp�l�ɓ��Ă͂߂� */
  RETURN v_SumCount;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt230Count;

END QPAP_CEnt230PkG;
/
show error
