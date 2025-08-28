CREATE OR REPLACE PACKAGE  QPAP_CEnt040PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                             */
/* ���W���[����  �FQPAP_CEnt040PkG                                                                                */
/* �@�\          �F��������                                                                                       */
/* �쐬��        �F2001/07/07                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
----------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20100225  TR1001-001         �Ј��ݕt��������c�����
--                             ����T�̌����������C��
--                             v_ZandakaYMD_N <= ������ <= �Y���s�̓�����
--                               �� v_ZandakaYMD_N < ������ <= �Y���s�̓�����
----------------------------------------------------------------------------------------------
/******************************************************************************************************************/
/*�P  �錾��                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtTorokuYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;
  TYPE typOtMiseNMAry IS TABLE OF QPAJ_NYUKINW.QPAJ_MISENM%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtBumonNmAry IS TABLE OF QPAJ_NYUKINW.QPAJ_BUMONNM%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyainCDAry IS TABLE OF QPAJ_NYUKINW.QPAJ_SYAINCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSimeiKanjiAry IS TABLE OF QPAJ_NYUKINW.QPAJ_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtNyukingakuAry IS TABLE OF QPAJ_NYUKINW.QPAJ_NYUKINGAKU%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAJ_NYUKINW.QPAJ_ZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtGendoAry IS TABLE OF QPAJ_NYUKINW.QPAJ_GENDO%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtNyukinYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

/* ��������f�[�^�擾 */
PROCEDURE QPAP_CEnt040SelList (
   InStrYMD1      IN    CHAR                      --���o�L�[  �J�n�N����
  ,InStrYMD2      IN    CHAR                      --�I���N����
  ,InStrKBN     IN    CHAR                      --�敪
  ,InNumMaxRec    IN    NUMBER                      --�ő�z��i�[����
  ,IoNumCursor    IN    OUT NUMBER                    --�J�[�\���h�c
  ,OtStrTorokuYMD   OUT   typOtTorokuYMDAry               --�������t
  ,OtStrMiseNM    OUT   typOtMiseNMAry                  --�X��
  ,OtStrBumonNM   OUT   typOtBumonNmAry                 --���喼
  ,OtStrSyainCD   OUT   typOtSyainCDAry                 --�Ј��R�[�h
  ,OtStrSimeikanji  OUT   typOtSimeiKanjiAry                --��������
  ,OtStrNyukingaku  OUT   typOtNyukingakuAry                --�����z
  ,OtStrZandaka   OUT   typOtZandakaAry                 --�c��
  ,OtNumGendo     OUT   typOtGendoAry                 --���x�z
  ,OtNumNyukinYMD   OUT   typOtNyukinYMDAry               --�������t
  ,OtNumRecCount    OUT   NUMBER                      --����������
  ,OtNumAryCount    OUT   NUMBER                      --�z��i�[����
  ,OtStrEndFlg    OUT   VARCHAR2                    --�����I���t���O
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE);

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt040DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);       --�R���s���[�^��


END QPAP_CEnt040PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  �Q  �{�f�B�[                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt040PkG IS

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt040SelList                                                                            */
/* �@�\          �F��������f�[�^�擾                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt040SelList (
   InStrYMD1    IN    CHAR                      --���o�L�[  �J�n�N����
  ,InStrYMD2    IN    CHAR                      --�I���N����
  ,InStrKBN   IN    CHAR                      --�敪
  ,InNumMaxRec    IN    NUMBER                      --�ő�z��i�[����
  ,IoNumCursor    IN    OUT NUMBER                    --�J�[�\���h�c
  ,OtStrTorokuYMD   OUT   typOtTorokuYMDAry               --�������t
  ,OtStrMiseNM    OUT   typOtMiseNMAry                  --�X��
  ,OtStrBumonNM   OUT   typOtBumonNmAry                 --���喼
  ,OtStrSyainCD   OUT   typOtSyainCDAry                 --�Ј��R�[�h
  ,OtStrSimeikanji  OUT   typOtSimeiKanjiAry                --��������
  ,OtStrNyukingaku  OUT   typOtNyukingakuAry                --�����z
  ,OtStrZandaka   OUT   typOtZandakaAry                 --�c��
  ,OtNumGendo   OUT   typOtGendoAry                 --���x�z
  ,OtNumNyukinYMD   OUT   typOtNyukinYMDAry               --�������t
  ,OtNumRecCount    OUT   NUMBER                      --����������
  ,OtNumAryCount    OUT   NUMBER                      --�z��i�[����
  ,OtStrEndFlg    OUT   VARCHAR2                  --�����I���t���O
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE) IS

  /* �����ŗL�̕ϐ� */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_CursorID2     NUMBER := 0;
  v_CursorID3     NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_Dummy2      INTEGER;
  v_Dummy3      INTEGER;
  NumIdx        NUMBER;

  v_SyainCD1      QPA5_KGCNYUKINT.QPA5_SYAINCD1%TYPE;
  v_SyainCD2      QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE;
  v_NyukinYMD     CHAR(8);
  v_Nyukingaku    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_TorokuYMD     CHAR(8);
  v_SimeiKanji    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD      QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM      QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD     QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM     QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku     QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka    QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD    CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin      QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  w_TorokuYMD     QPAJ_NYUKINW.QPAJ_TOROKUYMD%TYPE;
  w_MiseNM      QPAJ_NYUKINW.QPAJ_MISENM%TYPE;
  w_BumonNM     QPAJ_NYUKINW.QPAJ_BUMONNM%TYPE;
  w_SyainCD     QPAJ_NYUKINW.QPAJ_SYAINCD%TYPE;
  w_SimeiKanji    QPAJ_NYUKINW.QPAJ_SIMEIKANJI%TYPE;
  w_Nyukingaku    QPAJ_NYUKINW.QPAJ_NYUKINGAKU%TYPE;
  w_Zandaka     QPAJ_NYUKINW.QPAJ_ZANDAKA%TYPE;
  w_Gendo       QPAJ_NYUKINW.QPAJ_GENDO%TYPE;
  w_NyukinYMD     QPAJ_NYUKINW.QPAJ_NYUKINYMD%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     -- 11/01 ADD

BEGIN

/* ----- �r�s�d�o�P �v�s�f�[�^�쐬 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* �T�[�o�[�r�x�r�s�d�l���t */
    v_SysDate := '00000000';
    SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;



    /* �O�X�񋋗^�����Z�o */
/* 2001/10/02 �s��C��
    IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
    ELSE
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
    END IF;
*/
    /* �O�񋋗^�����Z�o */
    IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
      v_ZenKyuyoYMD := SUBSTR(v_SysDate,1,6) || '25';
    ELSE
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
    END IF;

    OtstrEndFlg := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount := 0;

    /* ���[�N�e�[�u���̏����� */
    DELETE FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID = InStrUserID
      AND QPAJ_COMPUTERNM = InStrComputerNM;

    /* �����Z�������e�[�u�����݃`�F�b�N�r�p�k */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT COUNT(*)';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    IF InStrKBN = '0' THEN
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    ELSE
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    END IF;

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrYMD2);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �����e�[�u�������� �� �G���[ */
    IF v_NumCount = 0 THEN
      RETURN;
    END IF;

    /* �����Z�������e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA5_SYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA5_SYAINCD2,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(QPA5_NYUKINGAKU,0),';
    StrSQL := StrSQL || ' TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'')';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    IF InStrKBN = '0' THEN
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    ELSE
      StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    END IF;
    StrSQL := StrSQL || ' ORDER BY QPA5_TOROKUYMD,QPA5_NYUKINYMD,QPA5_SYAINCD1,QPA5_SYAINCD2';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrYMD2);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_NyukinYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Nyukingaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_TorokuYMD,8);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_NyukinYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Nyukingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_TorokuYMD);

      /* �Ј������擾 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(A.QPAC_SIMEIKANJI,'' ''),';
      StrSQL := StrSQL || ' NVL(A.QPAC_MISECD,'' ''),';
      StrSQL := StrSQL || ' NVL(B.QPAE_MISENM,'' ''),';
      StrSQL := StrSQL || ' NVL(A.QPAC_BUMONCD,'' ''),';
      StrSQL := StrSQL || ' NVL(C.QPAF_BUMONNM,'' ''),';
      StrSQL := StrSQL || ' NVL(D.QPA1_GENDOGAKU,0),';
      StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0)';
      StrSQL := StrSQL || ' FROM QPAC_SYAINM A,QPAE_MISEM B,QPAF_BUMONM C,QPA1_KGCDAICYOT D';
      StrSQL := StrSQL || ' WHERE A.QPAC_PRMSYAINCD1 = :CODE1';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = :CODE2';
      StrSQL := StrSQL || ' AND A.QPAC_MISECD = B.QPAE_PRMMISECD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_MISECD = C.QPAF_PRMMISECD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_BUMONCD = C.QPAF_PRMBUMONCD (+)';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD1 = D.QPA1_PRMSYAINCD1 (+)';
      StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = D.QPA1_PRMSYAINCD2 (+)';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_SimeiKanji,20);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_MiseCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_MiseNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_BumonCD,6);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,5,v_BumonNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,6,v_Gendogaku);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,7,v_KyuyoZandaka);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      /* FETCH */
      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_SimeiKanji);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_MiseCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_MiseNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_BumonCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,5,v_BumonNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,6,v_Gendogaku);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,7,v_KyuyoZandaka);
      END LOOP;

      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* �����Z���c���������� */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' TO_CHAR(MAX(QPA3_PRMZANDAKAYMD),''YYYYMMDD'')';
      StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
      StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :CODE1';
      StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :CODE2';
      StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :CODE3';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
      StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE3', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',v_ZenKyuyoYMD);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_ZandakaYMD,8);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      LOOP
        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);

        /* 11/01 ADD �����p�Ώۓ��t�ύX */
        v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

        /* �����Z���ݕt���� */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
        StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
        StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') >= :YMD1';
--2001/12/18 Del        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';

-- Modified by imz.yoshida ����t���O�̏������C�� 2003/09/17 ==>
-- --2001/11/30 ����t���O�̏������C��
-- --        StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
-- --        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';
--        StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
--        StrSQL := StrSQL || '   OR RTRIM(QPA6_TORIKESHIFLG) = '''' ';
        StrSQL := StrSQL || ' AND (RTRIM(QPA6_TORIKESHIFLG) IS NULL';
-- Modified by imz.yoshida <==

        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

        StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD2);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':FLG', '1');
        /* �o�͕ϐ��̃o�C���h */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kasituke);
        /* SQL�̎��s */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* �J�����l��ϐ��֊i�[ */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kasituke);
          v_KyuyoZandaka := v_KyuyoZandaka + v_Kasituke;
        END LOOP;
        /* �J�[�\���̃N���[�Y */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

        /* �����Z���������� */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
        StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
        StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :CODE2';
--MOD 20100225 TR1001-001 NBC SAWAME START
--        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') >= :YMD1';
        --�ŏI�T���̌��̌������܂܂Ȃ�
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';
--MOD 20100225 TR1001-001 NBC SAWAME END
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
        /* �o�͕ϐ��̃o�C���h */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Nyukin);
        /* SQL�̎��s */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* �J�����l��ϐ��֊i�[ */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Nyukin);
          v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukin;
        END LOOP;
        /* �J�[�\���̃N���[�Y */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);

/****************************************************************************/
/* �ܗ^�T���͌��Ȃ����ƂƂ���                                               */
/* 2001/12/06 �ܗ^�T�������͌���  �����  �R�����g�͂���  */
/***********************************************************************/
----���R�����g�O��
        /* �����Z���ܗ^�T������ */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
        StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
        StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :CODE2';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') >= :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
        /* �o�͕ϐ��̃o�C���h */
        DBMS_SQL.DEFINE_COLUMN(v_CursorID3,1,v_Kojo);
        /* SQL�̎��s */
        v_Dummy3 := DBMS_SQL.EXECUTE (v_CursorID3);
        LOOP
          IF DBMS_SQL.FETCH_ROWS(v_CursorID3) = 0 THEN
            EXIT;
          END IF;
          /* �J�����l��ϐ��֊i�[ */
          DBMS_SQL.COLUMN_VALUE(v_CursorID3,1,v_Kojo);
          v_KyuyoZandaka := v_KyuyoZandaka - v_Kojo;
        END LOOP;
        /* �J�[�\���̃N���[�Y */
        DBMS_SQL.CLOSE_CURSOR (v_CursorID3);
----���R�����g�O��
      END LOOP;

      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* STOP PRESS!! ***************************/
      /* ���߂��c������A����̓����z���������� */
      /* ���̏����͖{���ɕK�v�Ȃ̂��H           */
      /* �Q�d���������Ă���̂ł́H             */
      /* STOP PRESS!! ***************************/
--      v_KyuyoZandaka := v_KyuyoZandaka - v_Nyukingaku;

      /* ���[�N�e�[�u���ǉ� */
      INSERT INTO QPAJ_NYUKINW VALUES (
         NVL(v_MiseCD,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(v_Nyukingaku,0)
        ,NVL(v_KyuyoZandaka,0)
        ,NVL(v_Gendogaku,0)
        ,NVL(v_NyukinYMD,' ')
        ,NVL(v_TorokuYMD,' ')
        ,1
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;
  END IF;

/* ----- �r�s�d�o�Q �\���f�[�^�������擾 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* ���[�N�e�[�u�����݃`�F�b�N�r�p�k */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAJ_NYUKINW
    WHERE QPAJ_USERID = InStrUserID AND QPAJ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- �r�s�d�o�R �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* �����Z���ݕt�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAJ_TOROKUYMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAJ_NYUKINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_ZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_GENDO,0),';
    StrSQL := StrSQL || ' NVL(QPAJ_NYUKINYMD,'' '')';
    StrSQL := StrSQL || ' FROM QPAJ_NYUKINW';
    StrSQL := StrSQL || ' WHERE QPAJ_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAJ_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' ORDER BY QPAJ_TOROKUYMD,QPAJ_SYOZOKUTENCD,';
    StrSQL := StrSQL || ' QPAJ_SYOZOKUBUMONCD,QPAJ_SYAINCD,QPAJ_NYUKINYMD';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ��̃o�C���h */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;   --�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_TorokuYMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_BumonNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SyainCD,7);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SimeiKanji,20);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_Nyukingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Zandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_Gendo);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_NyukinYMD,8);
  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_TorokuYMD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_BumonNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SyainCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_Nyukingaku);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Zandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_Gendo);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_NyukinYMD);

    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrTorokuYMD(NumIdx) := w_TorokuYMD;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtStrBumonNM(NumIdx) := w_BumonNM;
    OtStrSyainCD(NumIdx) := w_SyainCD;
    OtStrSimeikanji(NumIdx) := w_SimeiKanji;
    OtStrNyukingaku(NumIdx) := w_Nyukingaku;
    OtStrZandaka(NumIdx) := w_Zandaka;
    OtNumGendo(NumIdx) := w_Gendo;
    OtNumNyukinYMD(NumIdx) := w_NyukinYMD;

    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;      --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';       --�p�����[�^�ɃZ�b�g�i�����I���j

  /* ���I�J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID3) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID3);
    END IF;
    RAISE ;
END QPAP_CEnt040SelList;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt040DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt040DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN
    DELETE  FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID     = InStrUserID
        AND QPAJ_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt040DelWorkTbl;



END QPAP_CEnt040PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
