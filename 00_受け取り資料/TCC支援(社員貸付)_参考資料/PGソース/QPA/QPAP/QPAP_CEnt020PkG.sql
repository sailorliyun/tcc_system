CREATE OR REPLACE PACKAGE  QPAP_CEnt020PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt020PkG                                                                                */
/* �@�\          �F�����Z����������                                                                               */
/* �쐬��        �F2001/07/07                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtNyukinYMDAry IS TABLE OF CHAR(8)          --������
    INDEX BY BINARY_INTEGER;
  TYPE typOtNyukingakuAry IS TABLE OF QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE  --�����z
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF NUMBER           --�c��
    INDEX BY BINARY_INTEGER;

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent020SelSyainZoku (
  InStrPRMSyainCD1  IN    QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2  IN    QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana    OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,  --�����J�i
  OtStrSimeiKanji   OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE, --��������
  OtStrMiseCD   OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,   --�����X�R�[�h
  OtStrMiseName   OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,    --�X����
  OtStrTozaiKBN   OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --�����敪
  OtStrBumonCD    OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,    --��������R�[�h
  OtStrBumonName    OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,    --���喼��
  OtStrSikakuCD   OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,   --���i�R�[�h
  OtStrTokyuCD    OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,    --�����R�[�h
  OtStrBornYMD    OUT   VARCHAR2,       --���N����
  OtStrSonzaiFlg    OUT   VARCHAR2);        --����Flg (����̑��� Check)

/* �����Z�������f�[�^�擾 */
PROCEDURE QPAP_CEnt020SelList (
   InStrSyainCD   IN    QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE --���o�L�[  �Ј��R�[�h
  ,InNumMaxRec    IN    NUMBER          --�ő�z��i�[����
  ,OtNumRecCount    OUT   NUMBER          --����������
  ,OtNumAryCount    OUT   NUMBER          --�z��i�[����
  ,OtStrEndFlg    OUT   VARCHAR2        --�����I���t���O
  ,OtStrNyukinYMD   OUT   typOtNyukinYMDAry     --������
  ,OtNumNyukingaku  OUT   typOtNyukingakuAry      --�����z
  ,OtNumZandaka   OUT   typOtZandakaAry       --�c��
  ,OtStrZandakaYM   OUT   CHAR);          --�c����

/* �����Z�������f�[�^�d���`�F�b�N */
PROCEDURE QPAP_CEnt020DatChk (
   InStrSyainCD     IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD     IN    CHAR          --�ύX�N����
  ,OtStrFlg     OUT   CHAR);          --����t���O

/* �����Z�������f�[�^�o�^���� */
PROCEDURE QPAP_CEnt020DatAdd (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD   IN    CHAR          --������
  ,InNumNyukingaku  IN    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE  --�����z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);        --�S�����i�I�y���O�p�j

/* �����Z�������f�[�^�X�V���� */
PROCEDURE QPAP_CEnt020DatUpd (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD_O IN    CHAR          --�C���O������
  ,InStrNyukinYMD_N IN    CHAR          --�C���������
  ,InNumNyukingaku  IN    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE  --�����z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);        --�S�����i�I�y���O�p�j

/* �����Z�������f�[�^�폜���� */
PROCEDURE QPAP_CEnt020DatDel (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD   IN    CHAR          --������
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);        --�S�����i�I�y���O�p�j

/* ��������f�[�^�쐬 */
PROCEDURE QPAP_CEnt020List (
   InStrYMD   IN    CHAR          --���o�L�[  �J�n�N����
  ,OtNumRecCount    OUT   NUMBER          --����������
  ,OtStrEndFlg    OUT   VARCHAR2        --�����I���t���O
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE);

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt020OpeLog(
   InStrMenuID      IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[�h�c
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --�v���O�����h�c
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE   --���[�U�h�c
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^
  ,InStrTozaiKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --�����敪
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    --�����R�[�h
  ,InstrMsg   IN    QUS2_OpeLogT.QUS2_MSG%TYPE);    --���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt020Lock(
   InstrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --���ʃR�[�h
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type --�Ј��R�[�h
  ,InstrProgramID   IN    QSA4_HaitaT.QSA4_ProgramID%type   --�v���O�����h�c
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type --�R���s���[�^��
  ,InstrOperatorID  IN    QSA4_HaitaT.QSA4_OperatorID%type);  --�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt020UnLock(
   InstrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --���ʃR�[�h
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type); --�R���s���[�^�[��

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt020DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);       --�R���s���[�^��



END QPAP_CEnt020PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  �Q  �{�f�B�[                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt020PkG IS

  /***  ���O���b�Z�[�W��`  */
  TYPE  typMsg  IS  RECORD (
    fldTableID    CHAR(19),                       /* �e�[�u����   */
    fldKousinKBN  CHAR(1),                        /* �X�V�敪     */
    fldAcsKey   CHAR(50),                       /* �A�N�Z�X�L�[ */
    fldMsg      CHAR(100)                       /* �����R�[�h   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent020SelSyainZoku                                             */
/* �@�\      �@�@�F�Ј������̕\��                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent020SelSyainZoku (
  InStrPRMSyainCD1  IN    QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2  IN    QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana    OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,  --�����J�i
  OtStrSimeiKanji   OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE, --��������
  OtStrMiseCD   OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,   --�����X�R�[�h
  OtStrMiseName   OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,    --�X����
  OtStrTozaiKBN   OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,   --�����敪
  OtStrBumonCD    OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,    --��������R�[�h
  OtStrBumonName    OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,    --���喼��
  OtStrSikakuCD   OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,   --���i�R�[�h
  OtStrTokyuCD    OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,    --�����R�[�h
  OtStrBornYMD    OUT   VARCHAR2,       --���N����
  OtStrSonzaiFlg    OUT   VARCHAR2) IS        --����Flg (����̑��� Check)

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
    WHERE QPAC_PRMSyainCD1  = InStrPRMSyainCD1
    AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --�����I��

END QPAP_Cent020SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020SelList                                                                            */
/* �@�\          �F�����Z�������f�[�^�擾                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020SelList (
   InStrSyainCD   IN    QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE --���o�L�[  �Ј��R�[�h
  ,InNumMaxRec    IN    NUMBER          --�ő�z��i�[����
  ,OtNumRecCount    OUT   NUMBER          --����������
  ,OtNumAryCount    OUT   NUMBER          --�z��i�[����
  ,OtStrEndFlg    OUT   VARCHAR2        --�����I���t���O
  ,OtStrNyukinYMD   OUT   typOtNyukinYMDAry     --������
  ,OtNumNyukingaku  OUT   typOtNyukingakuAry      --�����z
  ,OtNumZandaka   OUT   typOtZandakaAry       --�c��
  ,OtStrZandakaYM   OUT   CHAR) IS        --�c����

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID        NUMBER := 0;
  v_CursorID2       NUMBER := 0;
  v_NumCount        NUMBER;
  v_Dummy         INTEGER;
  v_Dummy2        INTEGER;
  NumIdx          NUMBER;
  v_Zandaka       QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD        CHAR(8);
  v_Kasituke        QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_KyuyoZandaka        QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_Nyukinbi        CHAR(8);
  v_Nyukingaku        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     -- 11/01 ADD

BEGIN

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
  v_NumCount  := 0;

  /* �����Z���䒠���݃`�F�b�N�r�p�k */
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
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ���[�J���ϐ��ւ̊֘A�Â� */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �䒠�f�[�^���� �� �G���[ */
  IF v_NumCount = 0 THEN
    RETURN;
  END IF;

  /* �����Z���䒠���� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA1_KYUYOZANDAKA,0)';
  StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT ';
  StrSQL := StrSQL || ' WHERE QPA1_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA1_PRMSYAINCD2 = :Code2';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KyuyoZandaka);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KyuyoZandaka);
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
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Kbn', '3');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD',v_ZenKyuyoYMD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZandakaYMD,8);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  OtStrZandakaYM := '00000000';
  IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);

    /* 11/01 ADD �����p�Ώۓ��t�ύX */
    v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

    /* �p�����[�^�ɓn�� */
--    OtStrZandakaYM := v_ZandakaYMD;     -- 11/01 UPD
    OtStrZandakaYM := v_ZandakaYMD_N;     -- 11/01 UPD
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  v_NumCount := 0;
  /* �����Z�������e�[�u�����݃`�F�b�N�r�p�k */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT ';
  StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
  /* �J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* ���[�J���ϐ��ւ̊֘A�Â� */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_NumCount);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
    OtNumRecCount := v_NumCount;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �����Z�������e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD''),';
  StrSQL := StrSQL || ' NVL(QPA5_NYUKINGAKU,0)';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT ';
  StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
  StrSQL := StrSQL || ' ORDER BY QPA5_NYUKINYMD DESC';


  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Nyukinbi,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Nyukingaku);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Nyukinbi);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Nyukingaku);
    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    /* �p�����[�^�ɓn�� */
    OtStrNyukinYMD(NumIdx) := v_Nyukinbi;
    OtNumNyukingaku(NumIdx) := v_Nyukingaku;
    OtNumZandaka(NumIdx) := v_KyuyoZandaka;

    /* �����Z���ݕt���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
    StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
    StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';

--2001/11/30 ����t���O�̏������C��
--    StrSQL := StrSQL || ' AND QPA6_TORIKESHIFLG <> :FLG';
    StrSQL := StrSQL || ' AND (QPA6_TORIKESHIFLG IS NULL';
    StrSQL := StrSQL || '   OR QPA6_TORIKESHIFLG <> :FLG)';

    StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', InStrSyainCD);


--2002/01/29 �c�����擾���@�C��
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', TO_CHAR(TO_NUMBER(v_ZandakaYMD) + 1 ));


    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':FLG', '1');
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kasituke);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    v_Kasituke := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kasituke);
      /* �p�����[�^�ɓn�� */
      OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) + v_Kasituke;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);


    /* �����Z���������� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA5_NYUKINGAKU)';
    StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
    StrSQL := StrSQL || ' WHERE QPA5_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA5_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
--    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);      -- 11/01 UPD
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD_N);      -- 11/01 UPD
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Nyukin);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    v_Nyukin := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Nyukin);
      /* �p�����[�^�ɓn�� */
      OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) - v_Nyukin;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/************************************************************************************/
/* �ܗ^�T�������͌��Ȃ����ƂƂ���                                                   */
/* 2001/12/06 �ܗ^�T�������͌���@����ā@�R�����g�͂���  */
/************************************************************************************/
----���R�����g�O��
    /* �����Z���ܗ^�T������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(QPA4_KOJOGAKU)';
    StrSQL := StrSQL || ' FROM QPA4_KGCKOJOT';
    StrSQL := StrSQL || ' WHERE QPA4_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA4_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') BETWEEN :YMD1 AND :YMD2';
    StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2, StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD1', v_ZandakaYMD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD2', v_Nyukinbi);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kojo);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    v_Kojo := 0;
    IF DBMS_SQL.FETCH_ROWS(v_CursorID2) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kojo);
      /* �p�����[�^�ɓn�� */
      OtNumZandaka(NumIdx) := OtNumZandaka(NumIdx) - v_Kojo;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
----���R�����g�O��

    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      /* ���I�J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
      RETURN;
    END IF;
  END LOOP;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  OtNumAryCount := NumIdx;              --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';               --�p�����[�^�ɃZ�b�g�i�����I���j

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    RAISE ;
END QPAP_CEnt020SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020DatChk                                                                             */
/* �@�\          �F�����Z�������f�[�^�d���`�F�b�N                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020DatChk (
   InStrSyainCD     IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD     IN    CHAR          --�ύX�N����
  ,OtStrFlg     OUT   CHAR) IS        --����t���O

  v_NumCount      NUMBER;

BEGIN
  OtStrFlg := '1';
  v_NumCount := 0;

  SELECT COUNT(*) INTO v_NumCount FROM QPA5_KGCNYUKINT
  WHERE QPA5_SYAINCD1 = ' '
  AND QPA5_SYAINCD2 = InStrSyainCD
  AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') = InStrNyukinYMD;

  IF v_NumCount = 0 THEN
    OtStrFlg := '0';
  END IF;

EXCEPTION
  WHEN  OTHERS  THEN
    RAISE ;
END QPAP_CEnt020DatChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020DatAdd                                                                             */
/* �@�\          �F�����Z�������f�[�^�o�^����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020DatAdd (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD   IN    CHAR          --������
  ,InNumNyukingaku  IN    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE  --�����z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS        --�S�����i�I�y���O�p�j

  numStep         NUMBER   := 0;        /* �����X�e�b�v  */
  numErr          NUMBER   := 0;        /* SQLCODE�̑ޔ� */
  strErrMsg       VARCHAR2(100);        /* SQLERRM�̑ޔ� */
  recMsg          typMsg;
  strLogMsg       QUS2_OpeLogT.QUS2_MSG%TYPE;
  v_SysDate       VARCHAR2(8);

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';         --�e�[�u����
  recMsg.fldKousinKBN := '1';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;          --�X�V�L�[

  /* �T�[�o�[�r�x�r�s�d�l���t */
  v_SysDate := '00000000';
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

  /*  �����Z������T�̓o�^  */
  INSERT INTO QPA5_KGCNYUKINT VALUES (
     ' '                  --�Ј��R�[�h�P
    ,NVL(InStrSyainCD,' ')              --�Ј��R�[�h�Q
    ,TO_DATE(InStrNyukinYMD,'YYYYMMDD')         --������
    ,NVL(InNumNyukingaku,0)                         --�����z
    ,v_SysDate);                              --�o�^��

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z�������e�[�u���̓o�^�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt020OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
        InStrBushoCD,
        strLogMsg);

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);
    /* ���[���o�b�N */
    ROLLBACK;

    /* �I�y���[�V�������O�o�� */
    IF numStep < 1 THEN
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z�������e�[�u���̓o�^�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt020OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt020DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020DatUpd                                                                             */
/* �@�\          �F�����Z�������f�[�^�X�V����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020DatUpd (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD_O IN    CHAR          --�C���O������
  ,InStrNyukinYMD_N IN    CHAR          --�C���������
  ,InNumNyukingaku  IN    QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE  --�����z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS        --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;          /* �����X�e�b�v  */
  numErr        NUMBER   := 0;          /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);          /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';         --�e�[�u����
  recMsg.fldKousinKBN := '2';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;          --�X�V�L�[

  /* �����Z���ԍϊz�����s�̍X�V */
  UPDATE QPA5_KGCNYUKINT SET
     QPA5_NYUKINYMD = TO_DATE(InStrNyukinYMD_N,'YYYYMMDD')      --������
    ,QPA5_NYUKINGAKU = NVL(InNumNyukingaku,0)       --�����z
    WHERE QPA5_SYAINCD1 = ' '           --�X�V�L�[ �Ј��R�[�h�P
    AND QPA5_SYAINCD2  = InStrSyainCD         --�Ј��R�[�h�Q
    AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD')  = InStrNyukinYMD_O;   --�ύX��

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z�������e�[�u���̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt020OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
        InStrBushoCD,
        strLogMsg);

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);
    /* ���[���o�b�N */
    ROLLBACK;

    /* �I�y���[�V�������O�o�� */
    IF numStep < 1 THEN
      recMsg.fldMsg := '�i' || InStrTantoNM || '�����Z�������e�[�u���̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt020OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt020DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020Del                                                                                */
/* �@�\          �F�����Z�������f�[�^�폜����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020DatDel (
   InStrSyainCD   IN    QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE  --�Ј��R�[�h
  ,InStrNyukinYMD   IN    CHAR          --������
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2        --�o�^�E�S���ҁi�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2        --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS        --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;          /* �����X�e�b�v  */
  numErr        NUMBER   := 0;          /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);          /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA5_KGCNYUKINT';         --�e�[�u����
  recMsg.fldKousinKBN := '3';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;          --�X�V�L�[

  /* �����Z���ԍϊz����T�̍폜 */
  DELETE FROM QPA5_KGCNYUKINT
    WHERE QPA5_SYAINCD1 = ' '
    AND QPA5_SYAINCD2  = InStrSyainCD
    AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD')  = InStrNyukinYMD;

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z�������e�[�u���̍폜�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt020OpeLog( InStrMenuID,
        InStrModuleID,
        InStrUserID,
        InStrComputerNM,
        InStrRiyouKBN,
        InStrBushoCD,
        strLogMsg);

EXCEPTION
  WHEN  OTHERS  THEN
    numErr    := SQLCODE;
    strErrMsg := SUBSTR(SQLERRM, 1, 100);
    /* ���[���o�b�N */
    ROLLBACK;

    /* �I�y���[�V�������O�o�� */
    IF numStep < 1 THEN
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z�������e�[�u���̍폜�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt020OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt020DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020List                                                                               */
/* �@�\          �F��������f�[�^�쐬                                                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020List (
   InStrYMD   IN    CHAR          --���o�L�[  �J�n�N����
  ,OtNumRecCount    OUT   NUMBER          --����������
  ,OtStrEndFlg    OUT   VARCHAR2        --�����I���t���O
  ,InStrUserID        IN    QPAJ_NYUKINW.QPAJ_USERID%TYPE
  ,InStrComputerNM    IN    QPAJ_NYUKINW.QPAJ_COMPUTERNM%TYPE) IS

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

  v_SyainCD1        QPA5_KGCNYUKINT.QPA5_SYAINCD1%TYPE;
  v_SyainCD2        QPA5_KGCNYUKINT.QPA5_SYAINCD2%TYPE;
  v_NyukinYMD       CHAR(8);
  v_Nyukingaku        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_TorokuYMD       CHAR(8);
  v_SimeiKanji        QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD       QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_Gendogaku       QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_KyuyoZandaka        QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD        CHAR(8);
  v_Kasituke        QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_SysDate   Char(8);
  v_ZenKyuyoYMD   Char(8);

  v_ZandakaYMD_N    CHAR(8);     --2002/10/17

BEGIN

  /* �T�[�o�[�r�x�r�s�d�l���t */
  v_SysDate := '00000000';
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

--2002/01/29
--  /* �O�X�񋋗^�����Z�o */
--  IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
--    v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
--  ELSE
--    v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
--  END IF;

    /* �O�񋋗^�����Z�o */
    IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
      v_ZenKyuyoYMD := SUBSTR(v_SysDate,1,6) || '25';
    ELSE
      v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
    END IF;
--2002/01/29


  OtstrEndFlg := '0';
  OtNumRecCount := 0;
  v_NumCount := 0;

  /* ���[�N�e�[�u���̏����� */
  DELETE FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID = InStrUserID
      AND QPAJ_COMPUTERNM = InStrComputerNM;

  /* �����Z�������e�[�u�����݃`�F�b�N�r�p�k */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT COUNT(*)';
  StrSQL := StrSQL || ' FROM QPA5_KGCNYUKINT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') = :YMD';

  /* �J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_SysDate);
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
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA5_TOROKUYMD,''YYYYMMDD'') = :YMD';
  StrSQL := StrSQL || ' ORDER BY QPA5_TOROKUYMD,QPA5_NYUKINYMD,QPA5_SYAINCD1,QPA5_SYAINCD2';

  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_SysDate);
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
    StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD1 = D.QPA1_PRMSYAINCD1';
    StrSQL := StrSQL || ' AND A.QPAC_PRMSYAINCD2 = D.QPA1_PRMSYAINCD2';

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
    StrSQL := StrSQL || ' MAX(TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD''))';
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

        /* --2002/10/17 ADD �����p�Ώۓ��t�ύX */
        v_ZandakaYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_ZandakaYMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');

      /* �����Z���ݕt���� */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' SUM(QPA6_KINGAKU)';
      StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET';
      StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :CODE';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD1';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') <= :YMD2';
      StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD2', v_NyukinYMD);
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
--      StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') > :YMD1';	--2002/10/17�@���L�ɕύX
      StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') >= :YMD1';		--2002/10/17
      StrSQL := StrSQL || ' AND TO_CHAR(QPA5_NYUKINYMD,''YYYYMMDD'') <= :YMD2';
      StrSQL := StrSQL || ' GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID3  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID3, StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':CODE2', v_SyainCD2);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD);		--2002/10/17 ���L�ɕύX
        DBMS_SQL.BIND_VARIABLE(v_CursorID3,':YMD1', v_ZandakaYMD_N);      -- --2002/10/17

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

/******************************************************************************/
/* �ܗ^�T���͌��Ȃ����ƂƂ���                                                 */
/* 2001/12/06 �ܗ^�T�������͌���@����ā@�R�����g�͂���  */
/******************************************************************************/
----���R�����g�O��
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

  /* ���[�N�e�[�u�����݃`�F�b�N�r�p�k */
  v_NumCount := 0;
  SELECT COUNT(*) INTO v_NumCount FROM QPAJ_NYUKINW
      WHERE QPAJ_USERID = InStrUserID
      AND QPAJ_COMPUTERNM = InStrComputerNM;

  OtNumRecCount := v_NumCount;
  OtStrEndFlg := '1';       --�p�����[�^�ɃZ�b�g�i�����I���j

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
END QPAP_CEnt020List;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020OpeLog                                                                             */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                               */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt020OpeLog(
   InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE   /* ���j���[�h�c   */
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE   /* �v���O�����h�c */
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE   /* ���[�U�h�c     */
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE  /* �R���s���[�^   */
  ,InStrTozaiKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE  /* �����敪       */
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE    /* �����R�[�h     */
  ,InstrMsg   IN    QUS2_OpeLogT.QUS2_MSG%TYPE ) IS   /* ���b�Z�[�W     */

BEGIN
  QUSP_LogPkg.QUSP_WriteOpeLog(
      InStrMenuID,
      InStrModuleID,
      InStrUserID,
      InStrComputerNM,
      InStrTozaiKBN,
      InStrBushoCD,
      InstrMsg);
EXCEPTION
  WHEN  OTHERS  THEN
    RAISE;    /* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt020OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020Lock                                                                               */
/* �@�\          �F�����Z�������s�̃��b�N                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020Lock(
  InstrSikibetu   IN    QSA4_HaitaT.QSA4_PRMSikibetu%type,  /* ���ʃR�[�h   */
  InStrKeyInfo1   IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type,  /* �Ј��R�[�h     */
  InstrProgramID    IN    QSA4_HaitaT.QSA4_ProgramID%type,  /* �v���O�����h�c */
  InStrComputerNM   IN    QSA4_HaitaT.QSA4_ComputerMei%type,  /* �R���s���[�^�� */
  InstrOperatorID   IN    QSA4_HaitaT.QSA4_OperatorID%type) IS  /* �I�y���[�^�h�c */

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN
  /* �����Z�������s�̊m�F */
  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerNM, fldOperatorID
      from QSA4_HaitaT
    where QSA4_PRMJobKbn   = 'P'
       and QSA4_PRMSikibetu  = InstrSikibetu
       and QSA4_PRMKeyInfo1  = InStrKeyInfo1;
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
      'P', InstrSikibetu,
      InStrKeyInfo1,'P','P','P','P',
      InstrProgramID, InStrComputerNM, InstrOperatorID,
      sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN  --��ƒ�
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt020Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN  --�Q�d�L�[
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt020Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt020Lock;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt020UnLock                                                                             */
/* �@�\          �F�v�����^�s�̃��b�N����                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt020UnLock(
  InstrSikibetu   IN    QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM   IN    QSA4_HaitaT.QSA4_ComputerMei%type) IS

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

END QPAP_CEnt020UnLock;


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt020DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt020DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN
    DELETE  FROM  QPAJ_NYUKINW
      WHERE QPAJ_USERID     = InStrUserID
      AND   QPAJ_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt020DelWorkTbl;

END QPAP_CEnt020PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
