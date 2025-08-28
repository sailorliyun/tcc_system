CREATE OR REPLACE PACKAGE  QPAP_CEnt010PkG IS
/********************************************************************************/
/*	�V�X�e�����@�F�������N���W�b�g�V�X�e��										*/
/*	�Ɩ����@�@�@�F�Ј��ݕt�V�X�e��												*/
/*	���W���[�����FQPAP_CEnt010PkG												*/
/*	�@�\�@�@�@�@�F�����Z���䒠													*/
/*	�쐬���@�@�@�F2001/07/07													*/
/*	�쐬�ҁ@�@�@�FFIP															*/
/*------------------------------------------------------------------------------*/
/*								�C	��	��	��									*/
/*	�Ǘ�No					�C	��	��	�R					�S����	 �C�����t	*/
/*	000001	��Q�Ή��@�����Z���������͕s���Ή�				��@��	2004.06.24	*/
/*			�����Z���������͓o�^���ɁA�c���s�i�p�o�`�R�j��						*/
/*			�c����񂪂P�����Ȃ��ꍇ�i�䒠�o�^��P�x���c��						*/
/*			�X�V���s���Ă��Ȃ��ꍇ�j�A�������͓o�^���ł���						*/
/*			���ׁA�c����񂪂Ȃ��ꍇ�́A�Z���䒠�i�p�o�`�P						*/
/*			�j�o�^���ɁA�O�����̎c���e�[�u����ǉ�����B						*/
/*	999999	�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m	�m�m�m	9999.99.99	*/
/********************************************************************************/
/******************************************************************************************************************/
/*�P  �錾��                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|';                           --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtHenkoYMAry IS TABLE OF CHAR(6)                  --�ԍϊz�ύX��
    INDEX BY BINARY_INTEGER;
  TYPE typOtKyuyoAry IS TABLE OF QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE    --���^�ԍϊz
    INDEX BY BINARY_INTEGER;
  TYPE typOtSyoyoAry IS TABLE OF QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE    --�ܗ^�ԍϊz
    INDEX BY BINARY_INTEGER;

/* �����Z���䒠�f�[�^�擾 */
PROCEDURE QPAP_CEnt010SelList (
	 InStrSyainCD		IN		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE		--���o�L�[  �Ј��R�[�h
	,OtStrEndFlg			OUT	VARCHAR2								--�����I���t���O
	,OtStrSimeKn			OUT	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE			--�����J�i
	,OtStrSimeKj			OUT	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE		--��������
	,OtStrMiseCD			OUT	QPAC_SYAINM.QPAC_MISECD%TYPE			--�X�R�[�h
	,OtStrMiseNM			OUT	QPAE_MISEM.QPAE_MISENM%TYPE				--�X����
	,OtStrTozaiKBN			OUT	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE			--�����敪
	,OtStrBumonCD			OUT	QPAC_SYAINM.QPAC_BUMONCD%TYPE			--����R�[�h
	,OtStrBumonNM			OUT	QPAF_BUMONM.QPAF_BUMONNM%TYPE			--���喼��
	,OtStrSIKAKUCD			OUT	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE			--���i�R�[�h
	,OtStrTOKYUCD			OUT	QPAC_SYAINM.QPAC_TOKYUCD%TYPE			--�����R�[�h
	,OtNumGendo				OUT	QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE		--���x�z
	,OtNumZandaka			OUT	QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE	--�c��
	,OtStrNewFLG			OUT	CHAR
	,OtStrZandakaYM			OUT	CHAR									--�c����
	,OtStrKogutiUmu			OUT	CHAR);									--�����f�[�^�L���t���O�@0=����,1=�L��   2002/07/23 �ǉ�

/* �����Z���䒠�ԍϊz�f�[�^�擾 */
PROCEDURE QPAP_CEnt011SelList (
	 InStrSyainCD	IN			QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE	--���o�L�[  �Ј��R�[�h
	,InNumMaxRec	IN			NUMBER									--�ő�z��i�[����
	,OtNumRecCount		OUT		NUMBER									--����������
	,OtNumAryCount		OUT		NUMBER									--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2								--�����I���t���O
	,OtStrHenkoYM		OUT		typOtHenkoYMAry							--�ԍϊz�ύX���z��
	,OtNumKyuyo			OUT		typOtKyuyoAry							--���^�ԍϊz�z��
	,OtNumSyoyo			OUT		typOtSyoyoAry);							--�ܗ^�ԍϊz�z��

/* �����Z���䒠�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt010DatAdd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrKeiyakuYMD  IN    CHAR                      --�_���
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --���x�z
  ,InNumKyuyoHensai IN    QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyoHensai IN    QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);                    --�S�����i�I�y���O�p�j

/* �ԍϊz�����f�[�^�d���`�F�b�N */
PROCEDURE QPAP_CEnt011DatChk (
   InStrSyainCD     IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�ύX�N����
  ,InStrHenkoYM     IN    QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE     --�ύX�N����
  ,OtStrFlg       OUT   CHAR);                      --����t���O

/* �����Z���ԍϊz�f�[�^�o�^���� */
PROCEDURE QPAP_CEnt011DatAdd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM   IN    CHAR                      --�ύX��
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);                    --�S�����i�I�y���O�p�j

/* �����Z���䒠�f�[�^�X�V���� */
PROCEDURE QPAP_CEnt010DatUpd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --���x�z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);                    --�S�����i�I�y���O�p�j

/* �����Z���ԍϊz�f�[�^�X�V���� */
PROCEDURE QPAP_CEnt011DatUpd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM_O   IN    CHAR                      --�ύX���i�C���O�j
  ,InStrHenkoYM_N   IN    CHAR                      --�ύX���i�C����j
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);                    --�S�����i�I�y���O�p�j

/* �����Z���ԍϊz�f�[�^�폜���� */
PROCEDURE QPAP_CEnt011DatDel (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM   IN    CHAR                      --�ύX��
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2);                    --�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt010OpeLog(
   InStrMenuID      IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[�h�c
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --�v���O�����h�c
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE         --���[�U�h�c
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^
  ,InStrTouzaiKBN   IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --�����敪
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE          --�����R�[�h
  ,InStrMsg     IN    QUS2_OpeLogT.QUS2_MSG%TYPE);          --���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt010Lock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type       --���ʃR�[�h
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type
  ,InStrProgramID   IN    QSA4_HaitaT.QSA4_ProgramID%type         --�v���O�����h�c
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type       --�R���s���[�^��
  ,InStrOperatorID  IN    QSA4_HaitaT.QSA4_OperatorID%type);        --�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt010UnLock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type       --���ʃR�[�h
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type);       --�R���s���[�^�[��

END QPAP_CEnt010PkG;
/
SHOW ERRORS;
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                     */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                             */
/* ���W���[����  �FQPAP_CEnt010PkG                                                              */
/* �@�\          �F�����Z���䒠                                                                 */
/* �쐬��        �F2001/07/07                                                                   */
/* �쐬��        �FFIP                                                                          */
/******************************************************************************************************************/
/******************************************************************************************************************/
/*  �Q  �{�f�B�[                                                          */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt010PkG IS

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
/* ���W���[����  �FQPAP_CEnt010SelList                                                          */
/* �@�\          �F�����Z���䒠�f�[�^�擾                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010SelList (
	 InStrSyainCD		IN		QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE		--���o�L�[  �Ј��R�[�h
	,OtStrEndFlg			OUT	VARCHAR2								--�����I���t���O
	,OtStrSimeKn			OUT	QPAC_SYAINM.QPAC_SIMEIKANA%TYPE			--�����J�i
	,OtStrSimeKj			OUT	QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE		--��������
	,OtStrMiseCD			OUT	QPAC_SYAINM.QPAC_MISECD%TYPE			--�X�R�[�h
	,OtStrMiseNM			OUT	QPAE_MISEM.QPAE_MISENM%TYPE				--�X����
	,OtStrTozaiKBN			OUT	QPAC_SYAINM.QPAC_TOZAIKBN%TYPE			--�����敪
	,OtStrBumonCD			OUT	QPAC_SYAINM.QPAC_BUMONCD%TYPE			--����R�[�h
	,OtStrBumonNM			OUT	QPAF_BUMONM.QPAF_BUMONNM%TYPE			--���喼��
	,OtStrSIKAKUCD			OUT	QPAC_SYAINM.QPAC_SIKAKUCD%TYPE			--���i�R�[�h
	,OtStrTOKYUCD			OUT	QPAC_SYAINM.QPAC_TOKYUCD%TYPE			--�����R�[�h
	,OtNumGendo				OUT	QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE		--���x�z
	,OtNumZandaka			OUT	QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE	--�c��
	,OtStrNewFLG			OUT	CHAR
	,OtStrZandakaYM			OUT	CHAR									--�c����
	,OtStrKogutiUmu			OUT	CHAR) IS								--�����f�[�^�L���t���O�@0=����,1=�L��   2002/07/23 �ǉ�

  /* �����ŗL�̕ϐ� */
  StrSQL          VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy         INTEGER;
  v_SimeiKana     QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;
  v_SimeiKanji    QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseCD        QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM        QPAE_MISEM.QPAE_MISENM%TYPE;
  v_TozaiKBN      QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_BumonCD       QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM       QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SIkakuCD      QPAC_SYAINM.QPAC_SIKAKUCD%TYPE;
  v_TokyuCD       QPAC_SYAINM.QPAC_TOKYUCD%TYPE;
  v_Gendogaku     QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE;
  v_Zandaka       QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_ZandakaYMD    CHAR(8);
  v_Kasituke      QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
  v_Nyukin        QPA5_KGCNYUKINT.QPA5_NYUKINGAKU%TYPE;
  v_Kojo          QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
  v_Code          QPAH_OTHERM.QPAH_PRMCODE%TYPE;
  v_KyuyoZandaka  QPA1_KGCDAICYOT.QPA1_KYUYOZANDAKA%TYPE;
  v_SysDate       Char(8);
  v_ZenKyuyoYMD   Char(8);
  v_ZandakaYMD_N  CHAR(8);     -- 11/01 ADD

  NumKogutiDataCNT NUMBER;     --2002/07/23  �ǉ�

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

/* �Ј��}�X�^���݃`�F�b�N�r�p�k */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPAC_SYAINM ';
  StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
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
    /* �ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �Ј��}�X�^������ �� �G���[ */
  IF v_NumCount = 0 THEN
    RETURN;
  END IF;

/* �Ј��}�X�^���� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANA,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANJI,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_MISECD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_MISENM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_TOZAIKBN,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_BUMONCD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAF_BUMONM.QPAF_BUMONNM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIKAKUCD,'' ''),';
  StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_TOKYUCD,'' '')';
  StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM,QPAF_BUMONM';
  StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAF_BUMONM.QPAF_PRMMISECD (+)';
  StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_BUMONCD = QPAF_BUMONM.QPAF_PRMBUMONCD (+)';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SimeiKana,15);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SimeiKanji,20);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_MiseCD,3);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_TozaiKBN,1);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_BumonCD,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_BumonNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_SikakuCD,2);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_TokyuCD,2);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SimeiKana);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SimeiKanji);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_MiseCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_TozaiKBN);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_BumonCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_BumonNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_SikakuCD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_TokyuCD);
    /* �p�����[�^�ɓn�� */
    OtStrSimeKn := v_SimeiKana;
    OtStrSimeKj := v_SimeiKanji;
    OtStrMiseCD := v_MiseCD;
    OtStrMiseNM := v_MiseNM;
    OtStrTozaiKBN := v_TozaiKBN;
    OtStrBumonCD := v_BumonCD;
    OtStrBumonNM := v_BumonNM;
    OtStrSIKAKUCD := v_SikakuCD;
    OtStrTOKYUCD := v_TokyuCD;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

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

/* ���x�z�E�c���擾 */
  OtNumGendo := 0;
  OtNumZandaka := 0;
  OtStrZandakaYM := '00000000';

  IF v_NumCount = 0 THEN
    /* �V�K�t���O���O�� */
    OtStrNewFLG := '0';
    /* ���ʃR�[�h�w�� */
    v_Code := 'GE' || v_SikakuCD || v_TokyuCD;
    /* ���̑��}�X�^���W�����x�z�擾 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAH_KGENDO,0)';
    StrSQL := StrSQL || ' FROM QPAH_OTHERM ';
    StrSQL := StrSQL || ' WHERE QPAH_PRMCODE = :Code';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', v_Code);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Gendogaku);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Gendogaku);
      /* �p�����[�^�ɓn�� */
      OtNumGendo := v_Gendogaku;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  ELSE
    /* �V�K�t���O���P�� */
    OtStrNewFLG := '1';
    /* �����Z���䌟�� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA1_GENDOGAKU,0),';
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
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Gendogaku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_KyuyoZandaka);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Gendogaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_KyuyoZandaka);
      /* �p�����[�^�ɓn�� */
      OtNumGendo := v_Gendogaku;
      OtNumZandaka := v_KyuyoZandaka;
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
    IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZandakaYMD);
      /* �p�����[�^�ɓn�� */
      OtStrZandakaYM := v_ZandakaYMD;
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
      StrSQL := StrSQL || ' AND (         QPA6_TORIKESHIFLG <> :FLG';
      StrSQL := StrSQL || '      OR RTRIM(QPA6_TORIKESHIFLG) = ''''';
      StrSQL := StrSQL || '      OR       QPA6_TORIKESHIFLG IS NULL)';
      StrSQL := StrSQL || ' GROUP BY QPA6_SYAINCD';
      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
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
        OtNumZandaka := OtNumZandaka + v_Kasituke;
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
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
--      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);      -- 11/01 UPD
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
        OtNumZandaka := OtNumZandaka - v_Nyukin;
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/***********************************************************************/
/* �ܗ^�T�������͌��Ȃ����Ƃɂ���                                      */
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
      StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') > :YMD1';
      StrSQL := StrSQL || ' AND TO_CHAR(QPA4_KOJOYMD,''YYYYMMDD'') <= :YMD2';
      StrSQL := StrSQL || ' GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2';
      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID, StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1' , v_ZandakaYMD);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2' , v_SysDate);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kojo);
      /* SQL�̎��s */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
      v_Kasituke := 0;
      IF DBMS_SQL.FETCH_ROWS(v_CursorID) <> 0 THEN
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kojo);
        /* �p�����[�^�ɓn�� */
        OtNumZandaka := OtNumZandaka - v_Kojo;
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
----���R�����g�O��
    END IF;

    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;

  END IF;


--�� 2002/07/23 �ǉ�
--�����䒠�s�ɑ��݂��邩�`�F�b�N
	OtStrKogutiUmu   := '0';
	NumKogutiDataCNT := 0;

	SELECT	COUNT (*)
	INTO	NumKogutiDataCNT
	FROM	QPA1_KGCDAICYOT
	WHERE	QPA1_PRMSYAINCD1 = ' '
	AND		QPA1_PRMSYAINCD2 = InStrSyainCD;

	IF NumKogutiDataCNT = 0 THEN
		OtStrKogutiUmu   := '0';
	ELSE
		OtStrKogutiUmu   := '1';
	END IF;
--�� 2002/07/23 �ǉ�

  OtStrEndFlg := '1';       --�p�����[�^�ɃZ�b�g�i�����I���j

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt010SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt011SelList                                                                            */
/* �@�\          �F�����Z���䒠�ԍϊz�f�[�^�擾����                                                               */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011SelList (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --���o�L�[  �Ј��R�[�h
  ,InNumMaxRec    IN    NUMBER                      --�ő�z��i�[����
  ,OtNumRecCount    OUT   NUMBER                      --����������
  ,OtNumAryCount    OUT   NUMBER                      --�z��i�[����
  ,OtStrEndFlg    OUT   VARCHAR2                    --�����I���t���O
  ,OtStrHenkoYM   OUT   typOtHenkoYMAry                 --�ԍϊz�ύX���z��
  ,OtNumKyuyo     OUT   typOtKyuyoAry                   --���^�ԍϊz�z��
  ,OtNumSyoyo     OUT   typOtSyoyoAry) IS                 --�ܗ^�ԍϊz�z��

  /* �����ŗL�̕ϐ� */
  NumIdx        NUMBER;
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  V_NumCount      NUMBER;
  V_Dummy       INTEGER;

  v_HenkoYM     CHAR(6);
  v_Kyuyo       QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_Syoyo       QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;

BEGIN

  OtstrEndFlg := '0';

/* �����ԍϊz���݃`�F�b�N */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' COUNT(*) ';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT ';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
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
    /* �ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_NumCount);
  END IF;

  OtNumRecCount := v_NumCount;

  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* �����ԍϊz���� */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA2_PRMHENKOUYM,'' ''),';
  StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT ';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQl || ' ORDER BY QPA2_PRMHENKOUYM DESC';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYM,6);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Kyuyo);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Syoyo);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  NumIdx := 0;
  WHILE DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 LOOP
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Kyuyo);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Syoyo);
    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrHenkoYM(NumIdx) := v_HenkoYM;
    OtNumKyuyo(NumIdx) := v_Kyuyo;
    OtNumSyoyo(NumIdx) := v_Syoyo;
    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      /* ���I�J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
      RETURN;
    END IF;
  END LOOP;
  /* ���I�J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  OtNumAryCount := NumIdx;      --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';       --�p�����[�^�ɃZ�b�g�i�����I���j

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt011SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt011DatChk                                                                             */
/* �@�\          �F�ԍϊz�����f�[�^�d���`�F�b�N                                                                   */
/******************************************************************************************************************/
/* �ԍϊz�����f�[�^�d���`�F�b�N */
PROCEDURE QPAP_CEnt011DatChk (
   InStrSyainCD     IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�ύX�N����
  ,InStrHenkoYM     IN    QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE     --�ύX�N����
  ,OtStrFlg       OUT   CHAR) IS                    --����t���O

  v_NumCount      NUMBER;

BEGIN
  OtStrFlg := '1';

  SELECT COUNT(*) INTO v_NumCount FROM QPA2_KGCHENSAIT
  WHERE QPA2_PRMSYAINCD1 = ' '
  AND QPA2_PRMSYAINCD2 = InStrSyainCD
  AND QPA2_PRMHENKOUYM = InStrHenkoYM;

  IF v_NumCount = 0 THEN
    OtStrFlg := '0';
  END IF;

EXCEPTION
  WHEN  OTHERS  THEN
    RAISE ;
END QPAP_CEnt011DatChk;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt010DatAdd                                                                             */
/* �@�\          �F�����Z���䒠�f�[�^�o�^����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010DatAdd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrKeiyakuYMD  IN    CHAR                      --�_���
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --���x�z
  ,InNumKyuyoHensai IN    QPA1_KGCDAICYOT.QPA1_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyoHensai IN    QPA1_KGCDAICYOT.QPA1_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS                  --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;                      /* �����X�e�b�v  */
  numErr        NUMBER   := 0;                      /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);                      /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

--20040624�����Z���������͕s���Ή� by FIP.UEHARA
  numCNT		NUMBER	:= 0;						--�c���e�[�u������
  chrSysDate	CHAR(8);							--�V�X�e�����t�i�[�p
  chrZenDate	CHAR(8);							--�O�����^���i�[�p
--20040624

BEGIN

  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';                 --�e�[�u����
  recMsg.fldKousinKBN := '1';                         --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;                    --�X�V�L�[

  /*  �����Z���䒠T�̓o�^  */
  INSERT INTO QPA1_KGCDAICYOT VALUES (
     ' '                                  --�Ј��R�[�h�P
    ,NVL(InStrSyainCD,' ')                          --�Ј��R�[�h�Q
    ,TO_DATE(InStrKeiyakuYMD,'YYYYMMDD')                  --�_���
    ,NVL(InNumGendogaku,0)                          --�Z�����x�z
    ,NVL(InNumKyuyoHensai,0)                        --���^�ԍϊz
    ,NVL(InNumSyoyoHensai,0)                        --�ܗ^�ԍϊz
    ,0                                    --���^�c��
    ,0                                    --�ܗ^�c��
    ,NULL);                                 --�T�����~�t���O

--20040624�����Z���������͕s���Ή� by FIP.UEHARA
	SELECT COUNT(*) INTO numCNT
	FROM QPA3_KGCZANDAKAT
	WHERE QPA3_PRMSYAINCD1 = ' '
	AND QPA3_PRMSYAINCD2 = InStrSyainCD
	AND QPA3_PRMYUSIKBN = '3';

	--�c���e�[�u���Ȃ��̏ꍇ
	IF numCNT = 0 THEN
		--�V�X�e�����t�擾
		SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO chrSysDate FROM DUAL;
		--�O�����^���擾
		chrZenDate := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(chrSysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';

		--�c�������e�[�u���ǉ�
		INSERT INTO QPA3_KGCZANDAKAT (
			 QPA3_PRMSYAINCD1
			,QPA3_PRMSYAINCD2
			,QPA3_PRMYUSIKBN
			,QPA3_PRMZANDAKAYMD
			,QPA3_ZANDAKA)
		VALUES ( ' '
			,NVL(InStrSyainCD,' ')
			,'3'
			,TO_DATE(chrZenDate,'YYYYMMDD')
			,0);
	END IF;
--20040624

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���䒠�̍X�V�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���䒠�̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt010DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt011DatAdd                                                                             */
/* �@�\          �F�����Z���ԍϊz�f�[�^�o�^����                                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatAdd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM   IN    CHAR                      --�ύX��
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS                  --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;                      /* �����X�e�b�v  */
  numErr        NUMBER   := 0;                      /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);                      /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN

  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --�e�[�u����
  recMsg.fldKousinKBN := '1';                         --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;                    --�X�V�L�[

  /*  �����Z���ԍϊz����T�̓o�^  */
  INSERT INTO QPA2_KGCHENSAIT VALUES (
     ' '                                  --�Ј��R�[�h�P
    ,NVL(InStrSyainCD,' ')                          --�Ј��R�[�h�Q
    ,NVL(InStrHenkoYM,' ')                          --�ύX��
    ,NVL(InNumKyuyo,0)                            --���^�ԍϊz
    ,NVL(InNumSyoyo,0)                            --�ܗ^�ԍϊz
  );

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���ԍϊz�����f�[�^�̓o�^�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���ԍϊz�����f�[�^�̓o�^�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt011DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt010DatUpd                                                           */
/* �@�\          �F�����Z���䒠�f�[�^�X�V����                                                   */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010DatUpd (
   InStrSyainCD   IN    QPA1_KGCDAICYOT.QPA1_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InNumGendogaku   IN    QPA1_KGCDAICYOT.QPA1_GENDOGAKU%TYPE       --���x�z
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS                  --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;                      /* �����X�e�b�v  */
  numErr        NUMBER   := 0;                      /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);                      /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA1_KGCDAICYOT';                 --�e�[�u����
  recMsg.fldKousinKBN := '2';                         --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;                    --�X�V�L�[

  /* �����Z���䒠�̍X�V */
  UPDATE QPA1_KGCDAICYOT SET
    QPA1_GENDOGAKU = NVL(InNumGendogaku,0)                  --���x�z
    WHERE QPA1_PRMSYAINCD1 = ' '                      --�X�V�L�[ �Ј��R�[�h�P
    AND QPA1_PRMSYAINCD2  = InStrSyainCD;                 --�Ј��R�[�h�Q

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���䒠�̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�����Z���䒠�̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt010DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt011DatUpd                                                           */
/* �@�\          �F�����Z���ԍϊz�f�[�^�X�V����                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatUpd (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM_O   IN    CHAR                      --�ύX���i�C���O�j
  ,InStrHenkoYM_N   IN    CHAR                      --�ύX���i�C����j
  ,InNumKyuyo     IN    QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE     --���^�ԍϊz
  ,InNumSyoyo     IN    QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE     --�ܗ^�ԍϊz
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS                  --�S�����i�I�y���O�p�j

  numStep   NUMBER   := 0;                          /* �����X�e�b�v  */
  numErr    NUMBER   := 0;                          /* SQLCODE�̑ޔ� */
  strErrMsg VARCHAR2(100);                          /* SQLERRM�̑ޔ� */
  recMsg    typMsg;
  strLogMsg QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --�e�[�u����
  recMsg.fldKousinKBN := '2';                         --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;                    --�X�V�L�[

  /* �����Z���ԍϊz�����s�̍X�V */
  UPDATE QPA2_KGCHENSAIT SET
     QPA2_PRMHENKOUYM = NVL(InStrHenkoYM_N,' ')               --�ύX��
    ,QPA2_KYUYOHENSAI = NVL(InNumKyuyo,0)                 --���^�ԍϊz
    ,QPA2_SYOYOHENSAI = NVL(InNumSyoyo,0)                 --�ܗ^�ԍϊz
    WHERE QPA2_PRMSYAINCD1 = ' '                      --�X�V�L�[ �Ј��R�[�h�P
    AND QPA2_PRMSYAINCD2  = InStrSyainCD                  --�Ј��R�[�h�Q
    AND QPA2_PRMHENKOUYM  = InStrHenkoYM_O;                 --�ύX��

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���ԍϊz�����f�[�^�̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�����Z���ԍϊz�����f�[�^�̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt011DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt011DelPrintT                                                        */
/* �@�\          �F�����Z���ԍϊz�f�[�^�폜����                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt011DatDel (
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE     --�Ј��R�[�h
  ,InStrHenkoYM   IN    CHAR                      --�ύX��
  ,InStrMenuID    IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[ID�i�I�y���O�p�j
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --���W���[��ID�i�I�y���O�p�j
  ,InStrUserID    IN    VARCHAR2                    --���[�U�[ID�i�I�y���O�p�j
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN    IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --���p�敪�i�I�y���O�p�j
  ,InStrBushoCD   IN    VARCHAR2                    --�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM   IN    VARCHAR2) IS                  --�S�����i�I�y���O�p�j

  numStep       NUMBER   := 0;                      /* �����X�e�b�v  */
  numErr        NUMBER   := 0;                      /* SQLCODE�̑ޔ� */
  strErrMsg     VARCHAR2(100);                      /* SQLERRM�̑ޔ� */
  recMsg        typMsg;
  strLogMsg     QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA2_KGCHENSAIT';                 --�e�[�u����
  recMsg.fldKousinKBN := '3';                         --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD;                    --�X�V�L�[

  /* �����Z���ԍϊz����T�̍폜 */
  DELETE FROM QPA2_KGCHENSAIT
    WHERE QPA2_PRMSYAINCD1 = ' '
    AND QPA2_PRMSYAINCD2  = InStrSyainCD
    AND QPA2_PRMHENKOUYM  = InStrHenkoYM;

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���ԍϊz�����f�[�^�̍폜�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKBN
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt010OpeLog( InStrMenuID,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����Z���ԍϊz�����f�[�^�̍폜�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKBN
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt010OpeLog( InStrMenuID,
            InStrModuleID,
            InStrUserID,
            InStrComputerNM,
            InStrRiyouKBN,
            InStrBushoCD, strLogMsg);
    END IF;

    RAISE;
END QPAP_CEnt011DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt010OpeLog                                                                             */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                               */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt010OpeLog(
   InStrMenuID      IN    QUS2_OpeLogT.QUS2_MENUID%TYPE         --���j���[�h�c
  ,InStrModuleID    IN    QUS2_OpeLogT.QUS2_MODULEID%TYPE         --�v���O�����h�c
  ,InStrUserID      IN    QUS2_OpeLogT.QUS2_USERID%TYPE         --���[�U�h�c
  ,InStrComputerNM  IN    QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE        --�R���s���[�^
  ,InStrTouzaiKBN   IN    QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE        --�����敪
  ,InStrBushoCD   IN    QUS2_OpeLogT.QUS2_BUSHOCD%TYPE          --�����R�[�h
  ,InStrMsg     IN    QUS2_OpeLogT.QUS2_MSG%TYPE) IS          --���b�Z�[�W

BEGIN
  QUSP_LogPkg.QUSP_WriteOpeLog(
      InStrMenuID,
      InStrModuleID,
      InStrUserID,
      InStrComputerNM,
      InStrTouzaiKBN,
      InStrBushoCD,
      InStrMsg);
EXCEPTION
  WHEN  OTHERS  THEN
    RAISE;    /* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt010OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt010Lock                                                                               */
/* �@�\          �F�����Z���䒠�s�̃��b�N                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010Lock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --���ʃR�[�h
  ,InStrKeyInfo1    IN    QSA4_HaitaT.QSA4_PRMKeyInfo1%type --�Ј��R�[�h
  ,InStrProgramID   IN    QSA4_HaitaT.QSA4_ProgramID%type   --�v���O�����h�c
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type --�R���s���[�^��
  ,InStrOperatorID  IN    QSA4_HaitaT.QSA4_OperatorID%type) IS  --�I�y���[�^�h�c

  fldComputerMei    QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN
  /* �����Z���䒠�s�̊m�F */
  numErr  := 0;
  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerMei, fldOperatorID
      from QSA4_HaitaT
     where QSA4_PRMJobKbn  = 'P'
       and QSA4_PRMSikibetu  = InStrSikibetu
       and QSA4_PRMKeyInfo1  = InStrKeyInfo1;       -- �Ј��ԍ�
  exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    /* �T�����~�̊m�F */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerMei, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '160'
         and QSA4_PRMKeyInfo1  = ' '            -- �Ј��ԍ�1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo1;       -- �Ј��ԍ�2
    exception
      WHEN NO_DATA_FOUND THEN
        numErr := SQLCODE;
      WHEN OTHERS THEN
        RAISE;
    end;

  end if;

  if numErr = 0 then
    RAISE W_HAITASeikyu;
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
      'P',InStrSikibetu,
      InStrKeyInfo1,'P','P','P','P',
      InStrProgramID, InStrComputerNM, InStrOperatorID,
      sysdate);
  end if;

  commit;
EXCEPTION
  WHEN W_HAITADUPLICATE THEN  --��ƒ�
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt010Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN  --�Q�d�L�[
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt010Lock DUPLICATE KEY' );
  WHEN W_HAITASeikyu THEN   --�T�����~��ƒ�
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt010Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt010Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt010UnLock                                                 */
/* �@�\          �F�����Z���䒠�s�̃��b�N����                                             */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt010UnLock(
   InStrSikibetu    IN    QSA4_HaitaT.QSA4_PRMSikibetu%type --���ʃR�[�h
  ,InStrComputerNM  IN    QSA4_HaitaT.QSA4_ComputerMei%type)IS  --�R���s���[�^�[��

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

END QPAP_CEnt010UnLock;

END QPAP_CEnt010PkG;
/***END of LINE***************************************************************************************************/
/
SHOW ERRORS;
