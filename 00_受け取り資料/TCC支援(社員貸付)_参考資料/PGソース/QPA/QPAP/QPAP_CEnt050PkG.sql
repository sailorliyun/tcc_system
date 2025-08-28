CREATE OR REPLACE PACKAGE  QPAP_CEnt050PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt050PkG                                                                                */
/* �@�\          �F�ݕt������                                                                                     */
/* �쐬��        �F2001/07/07                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtTorihikiHMSAry IS TABLE OF CHAR(6)
    INDEX BY BINARY_INTEGER;
  TYPE typOtKasitukeAry IS TABLE OF QPAK_KASITUKEW.QPAK_KASITUKETEN%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtWSNameAry IS TABLE OF QPAK_KASITUKEW.QPAK_WSNAME%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtMiseCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_MISECD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtBumonCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_BUMONCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyainCDAry IS TABLE OF QPAK_KASITUKEW.QPAK_SYAINCD%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtSimeiKanjiAry IS TABLE OF QPAK_KASITUKEW.QPAK_SIMEIKANJI%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtKingakuAry IS TABLE OF QPAK_KASITUKEW.QPAK_KINGAKU%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAK_KASITUKEW.QPAK_ZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE typOtGendoAry IS TABLE OF QPAK_KASITUKEW.QPAK_GENDO%TYPE
    INDEX BY BINARY_INTEGER;

/* �ݕt������f�[�^�擾 */
PROCEDURE QPAP_CEnt050SelList (
   InStrTorihikiYMD   IN    CHAR                    --���o�L�[  ����N����
  ,InStrUserID      IN    VARCHAR2                  --���[�U�[ID
  ,InStrCompNM      IN    VARCHAR2                  --�R���s���[�^�[����
  ,InNumMaxRec      IN    NUMBER                    --�ő�z��i�[����
  ,IoNumCursor      IN    OUT NUMBER                  --�J�[�\���h�c
  ,OtStrTorihikiHMS   OUT   typOtTorihikiHMSAry             --�������
  ,OtStrKasituketen   OUT   typOtKasitukeAry              --�ݕt�X
  ,OtStrWSName      OUT   typOtWSNameAry                --�v�r��
  ,OtStrMiseCD      OUT   typOtMiseCDAry                --�X�R�[�h
  ,OtStrBumonCD     OUT   typOtBumonCDAry               --����R�[�h
  ,OtStrSyainCD     OUT   typOtSyainCDAry               --�Ј��R�[�h
  ,OtStrSimeiKanji    OUT   typOtSimeiKanjiAry              --��������
  ,OtNumKingaku     OUT   typOtKingakuAry               --���z
  ,OtNumZandaka     OUT   typOtZandakaAry               --�c��
  ,OtNumGendo       OUT   typOtGendoAry               --���x�z
  ,OtNumRecCount      OUT   NUMBER                    --����������
  ,OtNumAryCount      OUT   NUMBER                    --�z��i�[����
  ,OtStrEndFlg      OUT   VARCHAR2);                  --�����I���t���O

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt050DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);       --�R���s���[�^��

END QPAP_CEnt050PkG;

/
SHOW ERROR

/******************************************************************************************************************/
/*  �Q  �{�f�B�[                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt050PkG IS

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt050SelList                                                                            */
/* �@�\          �F�ݕt������f�[�^�擾                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt050SelList (
   InStrTorihikiYMD   IN    CHAR                    --���o�L�[  ����N����
  ,InStrUserID      IN    VARCHAR2                  --���[�U�[ID
  ,InStrCompNM      IN    VARCHAR2                  --�R���s���[�^�[����
  ,InNumMaxRec      IN    NUMBER                    --�ő�z��i�[����
  ,IoNumCursor      IN    OUT NUMBER                  --�J�[�\���h�c
  ,OtStrTorihikiHMS   OUT   typOtTorihikiHMSAry             --�������
  ,OtStrKasituketen   OUT   typOtKasitukeAry              --�ݕt�X
  ,OtStrWSName      OUT   typOtWSNameAry                --�v�r��
  ,OtStrMiseCD      OUT   typOtMiseCDAry                --�X�R�[�h
  ,OtStrBumonCD     OUT   typOtBumonCDAry               --����R�[�h
  ,OtStrSyainCD     OUT   typOtSyainCDAry               --�Ј��R�[�h
  ,OtStrSimeiKanji    OUT   typOtSimeiKanjiAry              --��������
  ,OtNumKingaku     OUT   typOtKingakuAry               --���z
  ,OtNumZandaka     OUT   typOtZandakaAry               --�c��
  ,OtNumGendo       OUT   typOtGendoAry               --���x�z
  ,OtNumRecCount      OUT   NUMBER                    --����������
  ,OtNumAryCount      OUT   NUMBER                    --�z��i�[����
  ,OtStrEndFlg      OUT   VARCHAR2) IS                --�����I���t���O

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID        NUMBER := 0;
  v_CursorID2       NUMBER := 0;
  v_CursorID3       NUMBER := 0;
  v_NumCount        NUMBER;
  v_Dummy         INTEGER;
  v_Dummy2        INTEGER;
  v_Dummy3        INTEGER;
  NumIdx          NUMBER;

  v_TorihikiYMD     CHAR(8);
  v_TorihikiHMS     CHAR(6);
  v_SyainCD       QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE;
  v_Kingaku       QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_WSName        QPA6_KGCKASITUKET.QPA6_WSNAME%TYPE;
  v_Kanriten        QPA6_KGCKASITUKET.QPA6_KANRITEN%TYPE;
  v_SimeiKanji      QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD       QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku       QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka      QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_KanritenNM      QPAE_MISEM.QPAE_MISENM%TYPE;
  v_ZandakaYMD      CHAR(8);
  v_Kasituke        QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  w_TorhikiHMS      QPAK_KASITUKEW.QPAK_TORIHIKIHMS%TYPE;
  w_Kasituketen     QPAK_KASITUKEW.QPAK_KASITUKETEN%TYPE;
  w_WSName        QPAK_KASITUKEW.QPAK_WSNAME%TYPE;
  w_MiseCD        QPAK_KASITUKEW.QPAK_MISECD%TYPE;
  w_BumonCD       QPAK_KASITUKEW.QPAK_BUMONCD%TYPE;
  w_SyainCD       QPAK_KASITUKEW.QPAK_SYAINCD%TYPE;
  w_SimeiKanji      QPAK_KASITUKEW.QPAK_SIMEIKANJI%TYPE;
  w_Kingaku       QPAK_KASITUKEW.QPAK_KINGAKU%TYPE;
  w_Zandaka       QPAK_KASITUKEW.QPAK_ZANDAKA%TYPE;
  w_Gendogaku       QPAK_KASITUKEW.QPAK_GENDO%TYPE;
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
    DELETE FROM  QPAK_KASITUKEW
    WHERE QPAK_USERID = InStrUserID
    AND QPAK_COMPUTERNM = InStrCompNM;

    /* �����Z���ݕt�e�[�u�����݃`�F�b�N�r�p�k */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' COUNT(*)';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') = :YMD';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrTorihikiYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
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

    /* �Ј��}�X�^������ �� �G���[ */
--    IF v_NumCount = 0 THEN
--      RETURN;
--    END IF;

    /* �����Z���ݕt�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
    StrSQL := StrSQL || ' NVL(QPA6_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPA6_WSNAME,'' ''),';
    StrSQL := StrSQL || ' NVL(QPA6_KANRITEN,'' '')';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') = :YMD';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';
    StrSQL := StrSQL || ' ORDER BY QPA6_SYAINCD,QPA6_TORIHIKIHMS';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrTorihikiYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SyainCD,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kingaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_WSName,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_Kanriten,3);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    /* FETCH */
    LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SyainCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_WSName);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_Kanriten);

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
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD);
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

      /* �Ǘ��X���̂̎擾 */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(QPAE_MISENM,'' '')';
      StrSQL := StrSQL || ' FROM QPAE_MISEM';
      StrSQL := StrSQL || ' WHERE QPAE_PRMMISECD = :MISE';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':MISE', v_Kanriten);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KanritenNM,24);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      /* FETCH */
      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KanritenNM);
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
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE2', v_SyainCD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':CODE3', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD',v_ZenKyuyoYMD);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_ZandakaYMD,8);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);

      LOOP
--2001/11/30 �c�����������݂��Ȃ��ꍇ���������s�ɕύX
--        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
--          EXIT;
--        END IF;
--        /* �J�����l��ϐ��֊i�[ */
--        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);


--2001/11/30 �c�����������݂��Ȃ��ꍇ���������s�ɕύX
        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          v_ZandakaYMD := '19880101';
        ELSE
          /* �J�����l��ϐ��֊i�[ */
          DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_ZandakaYMD);
        END IF;

        /* 11/01 ADD �����p�Ώۓ��t�ύX */
        v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

        /* �����Z���ݕt���� */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
        StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
        StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';

--2001/11/30 ����t���O�̏������C��
--        StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
        StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
        StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

        StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
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
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', ' ');
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD);
--        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);      -- 11/01 UPD
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
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

/*****************************************************************************/
/* �ܗ^�T���͌��Ȃ����ƂƂ���                                                */
/*****************************************************************************/
        /* �����Z���ܗ^�T������ */
        StrSQL := NULL;
        StrSQL := StrSQL || 'SELECT';
        StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
        StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
        StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :CODE1';
        StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :CODE2';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD1';
        StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
        StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';

        /* ���I�J�[�\���̃I�[�v�� */
        v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
        /* SQL�̉�� */
        DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
        /* ���͕ϐ����o�C���h���� */
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', ' ');
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', InStrTorihikiYMD);
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

--2001/11/30 �c�����������݂��Ȃ��ꍇ���������s�ɕύX
--        IF DBMS_SQL.FETCH_ROWS(v_CursorID2) = 0 THEN
          EXIT;
--        END IF;

      END LOOP;

      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      /* ���[�N�e�[�u���ǉ� */
      INSERT INTO QPAK_KASITUKEW VALUES (
         NVL(v_TorihikiYMD,' ')
        ,NVL(v_TorihikiHMS,' ')
        ,NVL(v_WSName,' ')
        ,NVL(v_KanritenNM,' ')
        ,NVL(v_SyainCD,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(v_Kingaku,0)
        ,NVL(v_KyuyoZandaka,0)
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_Gendogaku,0)
        ,1
        ,InStrUserID
        ,InStrCompNM);
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
    SELECT COUNT(*) INTO v_NumCount FROM QPAK_KASITUKEW
    WHERE QPAK_USERID = InStrUserID AND QPAK_COMPUTERNM = InStrCompNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- �r�s�d�o�R �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* �����Z���ݕt�e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAK_TORIHIKIHMS,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_KASITUKETEN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_WSNAME,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_SYAINCD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAK_KINGAKU,0),';
    StrSQL := StrSQL || ' NVL(QPAK_ZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAK_GENDO,0)';
    StrSQL := StrSQL || ' FROM QPAK_KASITUKEW';
    StrSQL := StrSQL || ' WHERE QPAK_USERID = :UserID';
    StrSQL := StrSQL || ' AND QPAK_COMPUTERNM = :CompNM';
    StrSQL := StrSQL || ' ORDER BY QPAK_SYAINCD,QPAK_TORIHIKIHMS';

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

    --���͕ϐ����o�C���h����
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':UserID',InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CompNM',InStrCompNM);

    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

  ELSE
    /* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;   --�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_TorhikiHMS,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_Kasituketen,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_WSName,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_MiseCD,3);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_BumonCD,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SyainCD,7);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SimeiKanji,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_Kingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Zandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,w_Gendogaku);
  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_TorhikiHMS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_Kasituketen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_WSName);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_MiseCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_BumonCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SyainCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_Kingaku);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Zandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,10,w_Gendogaku);

    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrTorihikiHMS(NumIdx) := w_TorhikiHMS;
    OtStrKasituketen(NumIdx) := w_Kasituketen;
    OtStrWSName(NumIdx) := w_WSName;
    OtStrMiseCD(NumIdx) := w_MiseCD;
    OtStrBumonCD(NumIdx) := w_BumonCD;
    OtStrSyainCD(NumIdx) := w_SyainCD;
    OtStrSimeiKanji(NumIdx) := w_SimeiKanji;
    OtNumKingaku(NumIdx) := w_Kingaku;
    OtNumZandaka(NumIdx) := w_Zandaka;
    OtNumGendo(NumIdx) := w_Gendogaku;

    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;                          --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';                             --�p�����[�^�ɃZ�b�g�i�����I���j

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
END QPAP_CEnt050SelList;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt050DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt050DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN
    DELETE FROM  QPAK_KASITUKEW
     WHERE QPAK_USERID     = InStrUserID
       AND QPAK_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt050DelWorkTbl;


END QPAP_CEnt050PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
