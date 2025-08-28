CREATE OR REPLACE PACKAGE  QPAP_Cent160PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                             */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                                         */
/* ���W���[����  �FQPAP_Cent160PkG                                                      */
/* �@�\          �F�T�����~����                                                         */
/* �쐬��        �F2001/08/15                                                           */
/* �쐬��        �FFIP                                                                  */
/*                                                                                                                */
/*�C������*/
/* ---------------------------------------------------------------------------------------------------------------*/
/*  �X�V���t  �Č��ԍ�  �C���S��      �C�����R                                                                  �@*/
/*  20090828�@0811051   murayama@NBC  �T���X�V�������s�����ꍇ                                              �@�@�@*/
/*                                    �T�����~�e�[�u���Ƀf�[�^��ǉ�                                              */
/*  20090828�@0811051   NBC saitoh    ST-0003��Q�Ή�                                                       �@�@�@*/
/*                                    �T�����~�e�[�u���ŏ�Q�������̃��b�Z�[�W�o��                                */
/* ---------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*  �P  �錾��                                                  */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
    INDEX BY BINARY_INTEGER;

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent160SelSyainZoku (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana      OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,  --�����J�i
  OtStrSimeiKanji     OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE, --��������
  OtStrMiseCD     OUT QPAC_SyainM.QPAC_MiseCD%TYPE,   --�����X�R�[�h
  OtStrMiseName     OUT QPAE_MiseM.QPAE_MiseNm%TYPE,    --�X����
  OtStrTozaiKBN     OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --�����敪
  OtStrBumonCD      OUT QPAC_SyainM.QPAC_BumonCD%TYPE,    --��������R�[�h
  OtStrBumonName      OUT QPAF_BumonM.QPAF_BumonNm%TYPE,    --���喼��
  OtStrSikakuCD     OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,   --���i�R�[�h
  OtStrTokyuCD      OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,    --�����R�[�h
  OtStrBornYMD      OUT VARCHAR2,       --���N����
  OtStrSonzaiFlg      OUT VARCHAR2);        --����Flg (����̑��� Check)

/* �����ԍϊz���擾 */
PROCEDURE QPAP_Cent160GetKogutiInf (
  InStrPRMSyainCD1    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtNumKyuyoHensai    OUT QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE,  --���^�ԍϊz
  OtNumSyoyoHensai    OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --�ܗ^�ԍϊz
  OtNumZanHensai      OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --�c���ԍϊz
  OtStrKojoCyushiFlg    OUT QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE,--�T�����~Flg
  OtStrSonzaiFlg      OUT VARCHAR2);        --����Flg

/* �؏����׏��擾 */
PROCEDURE QPAP_Cent160GetSyouMeisaiInf (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  InNumMaxRec     IN  NUMBER,         --�ő�z��i�[����
  IoNumFetchCount   IN  OUT NUMBER,         --�ǂݍ��݌���
  IoNumRecCount   IN  OUT NUMBER,         --����������
  OtNumAryCount     OUT NUMBER,         --�z��i�[����
  OtStrDataAry      OUT typDataAry,       --�؏����� �z��
  OtStrEndFlg     OUT VARCHAR2);        --�����I���t���O

/* �T�����~�t���O�X�V */
PROCEDURE QPAP_CEnt160UpdKoujyo (
   InStrPRMSyainCD1   IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE --�Ј��R�[�h�P
  ,InStrPRMSyainCD2   IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE --�Ј��R�[�h�Q
  ,InStrKojoCyusiFLG    IN  VARCHAR2        --�T�����~�t���O
  ,OtUpdateFlg      OUT VARCHAR2        --�X�V�t���O
  ,InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID        IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID          IN  QUS2_OpeLogT.QUS2_USERID%TYPE   --���[�U�h�c�i�I�y���O�p�j
  ,InStrComputerNM      IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrTozaiKBN        IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD       IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM       IN  VARCHAR2);            --�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt160OpeLog(
   InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE     --���j���[�h�c
  ,InStrModuleID      IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE     --�v���O�����h�c
  ,InStrUserID        IN  QUS2_OpeLogT.QUS2_USERID%TYPE     --���[�U�h�c
  ,InStrComputerNM  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE    --�R���s���[�^
  ,InStrTozaiKBN      IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE    --�����敪
  ,InStrBushoCD     IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE      --�����R�[�h
  ,InStrMsg     IN  QUS2_OpeLogT.QUS2_MSG%TYPE);      --���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt160Lock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type       --���ʃR�[�h
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type       --��������ԍ�1
  ,InStrKeyInfo2    IN    QSA4_HaitaT.QSA4_PRMKeyInfo2%type       --��������ԍ�2
  ,InstrProgramID     IN      QSA4_HaitaT.QSA4_ProgramID%type         --�v���O�����h�c
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type       --�R���s���[�^��
  ,InstrOperatorID    IN      QSA4_HaitaT.QSA4_OperatorID%type);        --�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt160UnLock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type   --���ʃR�[�h
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type);   --�R���s���[�^�[��

END QPAP_Cent160PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  �Q  �{�f�B�[                              */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent160PkG IS

  /***  ���O���b�Z�[�W��`  */
  TYPE  typMsg  IS  RECORD (
    fldTableID    CHAR(19),         /* �e�[�u����   */

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    fldTableID2    CHAR(19),         /* �e�[�u����   */
/*ADD 20090828 0811051 NBC MURAYAMA END*/
   
    fldKousinKbn    CHAR(1),                /* �X�V�敪     */

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    fldKousinKbn2    CHAR(1),                /* �X�V�敪     */
/*ADD 20090828 0811051 NBC MURAYAMA END*/

    fldAcsKey   CHAR(50),         /* �A�N�Z�X�L�[ */
    fldMsg      CHAR(100)         /* �����R�[�h   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /* �؏����׈ꗗ�J�[�\�� */
  CURSOR CurSyouMei(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
    SELECT
      *
    FROM
      QPA8_SYNDAICYOT
    WHERE
      QPA8_PRMSYAINCD1  = SyainCD1_I  AND
      QPA8_PRMSYAINCD2  = SyainCD2_I
    ORDER BY QPA8_PRMSYAINCD1,QPA8_PRMSYAINCD2,QPA8_PRMYUSIYMD ASC;

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent160SelSyainZoku                                             */
/* �@�\      �@�@�F�Ј������̕\��                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160SelSyainZoku (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana      OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,  --�����J�i
  OtStrSimeiKanji     OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE, --��������
  OtStrMiseCD     OUT QPAC_SyainM.QPAC_MiseCD%TYPE,   --�����X�R�[�h
  OtStrMiseName     OUT QPAE_MiseM.QPAE_MiseNm%TYPE,    --�X����
  OtStrTozaiKBN     OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --�����敪
  OtStrBumonCD      OUT QPAC_SyainM.QPAC_BumonCD%TYPE,    --��������R�[�h
  OtStrBumonName      OUT QPAF_BumonM.QPAF_BumonNm%TYPE,    --���喼��
  OtStrSikakuCD     OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,   --���i�R�[�h
  OtStrTokyuCD      OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,    --�����R�[�h
  OtStrBornYMD      OUT VARCHAR2,       --���N����
  OtStrSonzaiFlg      OUT VARCHAR2) IS        --����Flg (����̑��� Check)

  /* �����ŗL�̕ϐ� */

BEGIN
  /* �o�̓p�����[�^�̃N���A */
  OtStrSimeiKana      := ' ';
  OtStrSimeiKanji     := ' ';
  OtStrMiseCD     := ' ';
  OtStrMiseName     := ' ';
  OtStrTozaiKBN     := ' ';
  OtStrBumonCD      := ' ';
  OtStrBumonName      := ' ';
  OtStrSikakuCD     := ' ';
  OtStrTokyuCD      := ' ';
  OtStrBornYMD      := ' ';
  OtStrSonzaiFlg      := '0';

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
      TO_CHAR(QPAC_BornYMD,'YYYYMMDD')
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
      OtStrBornYMD
    FROM  QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
    WHERE QPAC_PRMSyainCD1    = InStrPRMSyainCD1
      AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
--      AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
      AND QPAC_MiseCD   = QPAE_PRMMiseCD
      AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
      AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;     --�����I��

END QPAP_Cent160SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent160GetKogutiInf                                             */
/* �@�\      �@�@�F�����ԍϊz���擾                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160GetKogutiInf (
  InStrPRMSyainCD1    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPA1_KGCDAICYOT.QPA1_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtNumKyuyoHensai    OUT QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE,  --���^�ԍϊz
  OtNumSyoyoHensai    OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --�ܗ^�ԍϊz
  OtNumZanHensai      OUT QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE,  --�c���ԍϊz
  OtStrKojoCyushiFlg    OUT QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE,--�T�����~Flg
  OtStrSonzaiFlg      OUT VARCHAR2) IS        --����Flg

  /* �����ŗL�̕ϐ� */
  StrSysYM      VARCHAR2(6);
  StrSQL        VARCHAR2(1000);
  NumCount      NUMBER := 0;
  v_CursorID      NUMBER := 0;
  v_Dummy       INTEGER;

  v_KyuyoHensai     QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_SyoyoHensai     QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;
  v_KyuyoZandaka      QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_KojocyushuFLG     QPA1_KGCDAICYOT.QPA1_KOJOCYUSHIFLG%TYPE;
  v_ZandakaYMD      CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin      QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo        QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     -- 11/01 ADD

BEGIN
  /* �o�̓p�����[�^�̃N���A */
  OtNumKyuyoHensai  := 10000;           --�f�t�H���g���^�ԍϊz
  OtNumSyoyoHensai  := 40000;           --�f�t�H���g�ܗ^�ԍϊz
  OtNumZanHensai    := 0;             --�C���v
  OtStrSonzaiFlg    := '0';

  /* �T�[�o�[�r�x�r�s�d�l�N���擾 */
  SELECT TO_CHAR(SYSDATE,'YYYYMM') INTO StrSysYM FROM DUAL;

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

  /* �����Z���䒠���݃`�F�b�N */
  SELECT COUNT(*) INTO NumCount FROM QPA1_KGCDAICYOT
    WHERE QPA1_PRMSYAINCD1 = InStrPRMSyainCD1
    AND QPA1_PRMSYAINCD2 = InStrPRMSyainCD2;

  /* ���݂Ȃ����G���[ */
  IF NumCount = 0 THEN
    RETURN;
  END IF;

  /* �����Z���䒠�@���擾 */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA1_SYOYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOZANDAKA,0),';
  StrSQL := StrSQL || ' NVL(QPA1_KOJOCYUSHIFLG,'' '')';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';

  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyoyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KyuyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KojocyushuFLG,1);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyoyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KyuyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KojocyushuFLG);
    /* �p�����[�^�ɓn�� */
    OtNumKyuyoHensai := v_KyuyoHensai;
    OtNumSyoyoHensai := v_SyoyoHensai;
    OtNumZanHensai := v_KyuyoZandaka;
    OtStrKojoCyushiFlg := v_KojocyushuFLG;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

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
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', StrSysYM);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoHensai);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyoyoHensai);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoHensai);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyoyoHensai);
    /* �p�����[�^�ɓn�� */
    OtNumKyuyoHensai := v_KyuyoHensai;
    OtNumSyoyoHensai := v_SyoyoHensai;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �����Z���c���������� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' MAX(TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD''))';
  StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
  StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :Kbn';
  StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD';
  StrSQL := StrSQL || ' GROUP BY QPA3_PRMSYAINCD1,QPA3_PRMSYAINCD2,QPA3_PRMYUSIKBN';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Kbn', '3');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',v_ZenKyuyoYMD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZandakaYMD,8);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* 11/01 ADD �����p�Ώۓ��t�ύX */
    v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

    /* �����Z���ݕt���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';

--2001/11/30 ����t���O�̏������C��
--    StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

    StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrPRMSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':FLG', '1');
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kasituke);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kasituke);
      /* �p�����[�^�ɓn�� */
      OtNumZanHensai := OtNumZanHensai + v_Kasituke;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �����Z���������� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD';
    StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);      -- 11/01 UPD
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD_N);      -- 11/01 UPD
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Nyukin);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Nyukin);
      /* �p�����[�^�ɓn�� */
      OtNumZanHensai := OtNumZanHensai - v_Nyukin;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/****************************************************************************/
/* �ܗ^�T���͌��Ȃ����ƂƂ���                                               */
/* 2001/12/06 �ܗ^�T�������͌���@����ā@�R�����g�͂���  */
/***********************************************************************/
----���R�����g�O��
    /* �����Z���ܗ^�T������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
    StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
    StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD';
    StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrPRMSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrPRMSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kojo);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kojo);
      /* �p�����[�^�ɓn�� */
      OtNumZanHensai := OtNumZanHensai - v_Kojo;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
----���R�����g�O��
  END IF;

  IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  END IF;

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;

END QPAP_Cent160GetKogutiInf;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_Cent160GetSyouMeisaiInf                                         */
/* �@�\          �F�؏����׏��̌������擾                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent160GetSyouMeisaiInf (
  InStrPRMSyainCD1    IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2    IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  InNumMaxRec     IN  NUMBER,         --�ő�z��i�[����
  IoNumFetchCount   IN  OUT NUMBER,         --�ǂݍ��݌���
  IoNumRecCount   IN  OUT NUMBER,         --����������
  OtNumAryCount     OUT NUMBER,         --�z��i�[����
  OtStrDataAry      OUT typDataAry,       --�؏����� �z��
  OtStrEndFlg     OUT VARCHAR2) IS        --�����I���t���O

  /* �����ŗL�̕ϐ� */
  NumIdx        NUMBER;
  NumSumCount     NUMBER;
  StrData       VARCHAR2(200);

  /* �������擾�J�[�\�� */
  CURSOR CurCount(SyainCD1_I  IN VARCHAR2,SyainCD2_I  IN VARCHAR2) IS
    SELECT
      COUNT(*) NumCount
    FROM
      QPA8_SYNDAICYOT
    WHERE
      QPA8_PRMSYAINCD1  = SyainCD1_I  AND
      QPA8_PRMSYAINCD2  = SyainCD2_I;

  /* �s�ϐ� */
  RowCount      CurCount%ROWTYPE;       --�؏����׈ꗗ�������J�[�\��
  RowSyouMei      CurSyouMei%ROWTYPE;       --�؏����׈ꗗ�J�[�\��

BEGIN
  /* �o�̓p�����[�^�̏����� */
  OtNumAryCount := 0;
  OtStrEndFlg := '0';

  IF CurSyouMei%ISOPEN = FALSE THEN
    /* �؏����׈ꗗ �������擾 */
    NumSumCount := 0;
    OPEN CurCount(InStrPRMSyainCD1,InStrPRMSyainCD2);     --�������J�[�\���̃I�[�v��
    LOOP
      FETCH CurCount INTO RowCount;
      IF  CurCount%NOTFOUND THEN
        EXIT;
      END IF;
      NumSumCount := NumSumCount + RowCount.NumCount;
    END LOOP;
    IoNumRecCount :=  NumSumCount;          --�p�����[�^�ɃZ�b�g
    CLOSE CurCount;               --�������J�[�\���̃N���[�Y

    /* �؏����׈ꗗ �J�[�\���̃I�[�v�� */
    OPEN CurSyouMei(InStrPRMSyainCD1,InStrPRMSyainCD2);
  END IF;

  NumIdx    := 0;
  OtStrEndFlg := '0';

  LOOP

    FETCH CurSyouMei INTO RowSyouMei;         --���ǂ�
    IoNumFetchCount := IoNumFetchCount + 1;
    IF  CurSyouMei%NOTFOUND THEN
      EXIT;               --���[�v�I��
    END IF;

    /* �؏����׈ꗗ�̏o�̓p�����[�^�̕ҏW */
    NumIdx := NumIdx + 1;

    StrData := Null;
    StrData := StrData || TO_CHAR(RowSyouMei.QPA8_PRMYUSIYMD,'YYYYMMDD')  || StrDLM;  --01)�Z����
    StrData := StrData || RowSyouMei.QPA8_GENDOGAKU       || StrDLM;  --02)�Z�����x�z
    StrData := StrData || RowSyouMei.QPA8_SYUBETU       || StrDLM;  --03)�Z�����
    StrData := StrData || RowSyouMei.QPA8_RIRITU        || StrDLM;  --04)�_�񗘗�
    StrData := StrData || RowSyouMei.QPA8_HENSAITUKISU      || StrDLM;  --05)�ԍό���
    StrData := StrData || RowSyouMei.QPA8_KYUYOHENSAIALL      || StrDLM;  --06)���^�ԍϑ��z
    StrData := StrData || RowSyouMei.QPA8_KYUYOHENSAI     || StrDLM;  --07)���^�ԍϊz
    StrData := StrData || RowSyouMei.QPA8_SYOYOHENSAIALL      || StrDLM;  --08)�ܗ^�ԍϑ��z
    StrData := StrData || RowSyouMei.QPA8_SYOYOHENSAI     || StrDLM;  --09)�ܗ^�ԍϊz
    StrData := StrData || RowSyouMei.QPA8_KYUYOZANDAKA      || StrDLM;  --10)���^�c��
    StrData := StrData || RowSyouMei.QPA8_SYOYOZANDAKA      || StrDLM;  --11)�ܗ^�c��
    StrData := StrData || RowSyouMei.QPA8_KOJOCYUSIFLG      || StrDLM;  --12)�T�����~�t���O
    StrData := StrData || RowSyouMei.QPA8_KANSAIYMD       || StrDLM;  --13)���ϓ�
    OtStrDataAry(NumIdx)  := StrData;             --�؏����׈ꗗ
    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <> 0   AND
       InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;               --�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
    END IF;

  END LOOP;

  OtStrEndFlg :=  '1';              --�����I��
  OtNumAryCount :=  NumIdx;
  /* �؏����׈ꗗ�J�[�\���̃N���[�Y */
  CLOSE CurSyouMei;

EXCEPTION
  WHEN  OTHERS  THEN
    IF CurCount%ISOPEN THEN
      CLOSE CurCount;
    END IF;
    IF CurSyouMei%ISOPEN THEN
      CLOSE CurSyouMei;
    END IF;
    RAISE ;
END QPAP_Cent160GetSyouMeisaiInf;


/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt160UpdKoujyo                                                */
/* �@�\          �F�T�����~�t���O�X�V                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160UpdKoujyo (
   InStrPRMSyainCD1   IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE --�Ј��R�[�h�P
  ,InStrPRMSyainCD2   IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE --�Ј��R�[�h�Q
  ,InStrKojoCyusiFLG    IN  VARCHAR2        --�T�����~�t���O
  ,OtUpdateFlg      OUT VARCHAR2        --�X�V�t���O
  ,InStrMenuID        IN  QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID        IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID          IN  QUS2_OpeLogT.QUS2_USERID%TYPE   --���[�U�h�c�i�I�y���O�p�j
  ,InStrComputerNM      IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrTozaiKBN        IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD       IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM       IN  VARCHAR2) IS        --�S�����i�I�y���O�p�j

  numStep   NUMBER   := 0;              /* �����X�e�b�v  */

  /*ADD 20090828 0811051 NBC MURAYAMA START*/
  /*DEL 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStepKT   NUMBER   := 0;              /* �����X�e�b�v  */
  /*DEL 20090828 0811051(ST-0003) NBC saitoh END*/
  /*ADD 20090828 0811051 NBC MURAYAMA END*/

  numErr    NUMBER   := 0;              /* SQLCODE�̑ޔ� */
  strErrMsg VARCHAR2(100);              /* SQLERRM�̑ޔ� */
  recMsg    typMsg;
  strLogMsg QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN

  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';         --�e�[�u����

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  recMsg.fldTableID2 := 'QPB1_KOJOCANCELT';       --�e�[�u���� �T�����~�e�[�u��
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  recMsg.fldKousinKbn := '2';              --�X�V�敪

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  recMsg.fldKousinKbn2 := '1';             --�X�V�敪�@1:�o�^ 
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  recMsg.fldAcsKey  := InStrPRMSyainCD2;          --�X�V�L�[

  OtUpdateFlg := '9';               --�X�V���s

  /* �����Z���䒠�̍X�V */
  UPDATE QPA1_KGCDAICYOT SET
    QPA1_KOJOCYUSHIFLG = NVL(InStrKojoCyusiFLG,' ')       --�T�����~�t���O
    WHERE QPA1_PRMSYAINCD1 = InStrPRMSyainCD1       --�X�V�L�[ �Ј��R�[�h�P
     AND  QPA1_PRMSYAINCD2 = InStrPRMSyainCD2;        --     �Ј��R�[�h�Q

  /* �Ј��Z���䒠�̍X�V */
  UPDATE QPA8_SYNDAICYOT SET
    QPA8_KOJOCYUSIFLG = NVL(InStrKojoCyusiFLG,' ')        --�T�����~�t���O
    WHERE QPA8_PRMSYAINCD1 = InStrPRMSyainCD1       --�X�V�L�[ �Ј��R�[�h�P
     AND  QPA8_PRMSYAINCD2 = InStrPRMSyainCD2;        --     �Ј��R�[�h�Q

/*ADD 20090828 0811051(ST-0003) NBC saitoh START*/
	numStep := 1;   /* �����X�e�b�v */
/*ADD 20090828 0811051(ST-0003) NBC saitoh END*/

/*ADD 20090828 0811051 NBC MURAYAMA START*/
	/* �T�����~�e�[�u���̓o�^ */
	/* �T�����~��*/
	IF InStrKojoCyusiFLG = 1 THEN
		INSERT INTO QPB1_KOJOCANCELT(
			QPB1_PRMSYAINCD1,				--�Ј��R�[�h�P
			QPB1_PRMSYAINCD2,				--�Ј��R�[�h�Q
			QPB1_KOJOSTATUS,				--�T���X�e�[�^�X
			QPB1_CANCELDATE,				--�T�����~�o�^��
			QPB1_TANTOCD,					--�o�^�S���҃R�[�h
			QPB1_INSERTDATE					--�o�^����
			)
			VALUES(
			InStrPRMSyainCD1,
			InStrPRMSyainCD2,
			'1',
			SYSDATE,
			InStrUserID,
			SYSDATE
			);
	ELSE
	/* �T�����~������*/
		INSERT INTO QPB1_KOJOCANCELT(
			QPB1_PRMSYAINCD1,				--�Ј��R�[�h�P
			QPB1_PRMSYAINCD2,				--�Ј��R�[�h�Q
			QPB1_KOJOSTATUS, 				--�T���X�e�[�^�X
			QPB1_CANCELDATE, 				--�T�����~�o�^��
			QPB1_TANTOCD,    				--�o�^�S���҃R�[�h
	    	QPB1_INSERTDATE  				--�o�^����
			)
			VALUES(
			InStrPRMSyainCD1,
			InStrPRMSyainCD2,
			'2',
			SYSDATE,
			InStrUserID,
			SYSDATE
			);
	END IF;

/*ADD 20090828 0811051 NBC MURAYAMA END*/

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */

/*DEL 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStep := 1;   /* �����X�e�b�v */
/*DEL 20090828 0811051(ST-0003) NBC saitoh END*/

  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���䒠�̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt160OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  /* �I�y���[�V�������O�o�� */
/*MOD 20090828 0811051(ST-0003) NBC saitoh START*/
--  numStepKT := 1;   /* �����X�e�b�v */
  numStep := 2;   /* �����X�e�b�v */
/*MOD 20090828 0811051(ST-0003) NBC saitoh END*/
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�T�����~�e�[�u���̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID2
        || recMsg.fldKousinKbn2
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt160OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
        InStrBushoCD,
        strLogMsg);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  OtUpdateFlg := '0';               --�X�V����

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);
    /* ���[���o�b�N */
    ROLLBACK;

    /* �I�y���[�V�������O�o�� */
    IF numStep < 1 THEN
      recMsg.fldMsg := '�i' || InStrTantoNM || '�����Z���䒠�̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt160OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    /* �I�y���[�V�������O�o�� */
/*MOD 20090828 0811051(ST-0003) NBC saitoh START*/
--    IF numStepKT < 1 THEN
    IF numStep = 1 THEN
/*MOD 20090828 0811051(ST-0003) NBC saitoh END*/
      recMsg.fldMsg := '�i' || InStrTantoNM || '�T�����~�e�[�u���̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID2
            || recMsg.fldKousinKbn2
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt160OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;
/*ADD 20090828 0811051 NBC MURAYAMA END*/

    RAISE ;
END QPAP_CEnt160UpdKoujyo;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt160OpeLog                                                   */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                     */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt160OpeLog(
   InStrMenuID      IN  QUS2_OpeLogT.QUS2_MENUID%TYPE     /* ���j���[�h�c   */
  ,InStrModuleID      IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE     /* �v���O�����h�c */
  ,InStrUserID        IN  QUS2_OpeLogT.QUS2_USERID%TYPE     /* ���[�U�h�c     */
  ,InStrComputerNM    IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE    /* �R���s���[�^   */
  ,InStrTozaiKBN      IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE    /* �����敪       */
  ,InStrBushoCD     IN  QUS2_OpeLogT.QUS2_BUSHOCD%TYPE      /* �����R�[�h     */
  ,InStrMsg     IN  QUS2_OpeLogT.QUS2_MSG%TYPE ) IS     /* ���b�Z�[�W     */
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
  WHEN  OTHERS  THEN
    RAISE ;                 /* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt160OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt160Lock                                                                               */
/* �@�\          �F�T�����~�����̃��b�N                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160Lock(
   InstrSikibetu      IN      QSA4_HaitaT.QSA4_PRMSikibetu%type       --���ʃR�[�h
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type       --��������ԍ�1
  ,InStrKeyInfo2    IN    QSA4_HaitaT.QSA4_PRMKeyInfo2%type       --��������ԍ�2
  ,InstrProgramID     IN      QSA4_HaitaT.QSA4_ProgramID%type         --�v���O�����h�c
  ,InstrComputerNM  IN      QSA4_HaitaT.QSA4_ComputerMei%type       --�R���s���[�^��
  ,InstrOperatorID    IN      QSA4_HaitaT.QSA4_OperatorID%type) IS      --�I�y���[�^�h�c

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN

  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerNM, fldOperatorID
      from QSA4_HaitaT
    where QSA4_PRMJobKbn   = 'P'
      and QSA4_PRMSikibetu   = InstrSikibetu
      and QSA4_PRMKeyInfo1   = InStrKeyInfo1    --��������ԍ�1
      and QSA4_PRMKeyInfo1   = InStrKeyInfo2;   --��������ԍ�2

exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
        and QSA4_PRMSikibetu  = '010'
          and QSA4_PRMKeyInfo1   = InStrKeyInfo1    --��������ԍ�1
          and QSA4_PRMKeyInfo1   = InStrKeyInfo2;   --��������ԍ�2
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;
  end if;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu = '080'
           and QSA4_PRMKeyInfo1  = InStrKeyInfo1    --��������ԍ�1
           and QSA4_PRMKeyInfo1  = InStrKeyInfo2;   --��������ԍ�2
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;
  end if;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
      where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu = '090'
           and QSA4_PRMKeyInfo1  = InStrKeyInfo1    --��������ԍ�1
           and QSA4_PRMKeyInfo1  = InStrKeyInfo2;   --��������ԍ�2
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;
  end if;

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
      'P',
      InstrSikibetu,
      InStrKeyInfo1,
      InStrKeyInfo2,
      'P',
      'P',
      'P',
      InstrProgramID,
      InStrComputerNM,
      InstrOperatorID,
      sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN              --�Ј��Z�������e�[�u����ƒ�
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt160Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN              --�Ј��Z�������e�[�u���Q�d�L�[
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt160Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt160Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt160UnLock                                                                             */
/* �@�\          �F�T�����~�����̃��b�N����                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt160UnLock(
  InstrSikibetu   IN  QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM   IN  QSA4_HaitaT.QSA4_ComputerMei%type) IS
BEGIN
  delete from QSA4_HaitaT
   where QSA4_PRMJobKbn = 'P'
     and QSA4_PRMSikibetu = InstrSikibetu
     and QSA4_ComputerMei = InStrComputerNM;
  commit;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;

END QPAP_CEnt160UnLock ;

END QPAP_Cent160PkG;

/***END of LINE****************************************************************************************************/
/
SHOW ERROR
