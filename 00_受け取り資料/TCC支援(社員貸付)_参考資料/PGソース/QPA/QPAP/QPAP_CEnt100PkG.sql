CREATE OR REPLACE PACKAGE  QPAP_CEnt100PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt100PkG                                                                                */
/* �@�\          �F�l�ݕt����                                                                                   */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/*                                                                                                                */
/*�C������*/
/* ---------------------------------------------------------------------------------------------------------------*/
/*  �X�V���t  �Č��ԍ�  �C���S��      �C�����R                                                                  �@*/
/*  20090828�@0811051   murayama@NBC  �O���[�v�Ј��؏��ݕt���[������                                              */
/*                                    �ܗ^�T����d���Z�̗}�~��ǉ�                                                */
/* ---------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------*/
/*�X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                             */
/*20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��                                                    */
/*                           ����߂��Ή��A�ԑ����z�̎Z�o���@�C��                                                 */
/*	20100827	1004091		IMZ SHIBUTANI	�U������̎擾���@�ύX�ւ̑Ή�									*/
/*----------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*  �P  �錾��                            */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtYusiYMDAry IS TABLE OF CHAR(8)
    INDEX BY BINARY_INTEGER;

  TYPE typOtRirituAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKaisuAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoYusiAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoYusiAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoHenAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoHenAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoZanAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoZanAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE
    INDEX BY BINARY_INTEGER;

--ADD 20100225 0908047 NBC SAWAME START
  TYPE typOtKyuyoModAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModRisokuAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModRisokuAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModAllAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModAllAry IS TABLE OF QPB2_BUNKAI.QPB2_GANKIN%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtKyuyoModRisokuAllAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;

  TYPE typOtSyoyoModRisokuAllAry IS TABLE OF QPB2_BUNKAI.QPB2_RISOKU%TYPE
    INDEX BY BINARY_INTEGER;
--ADD 20100225 0908047 NBC SAWAME END

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent100SelSyainZoku (
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

/* �ݕt�f�[�^�擾 */
PROCEDURE QPAP_CEnt100SelList (
   InStrSyainCD1    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE   --��������  �Ј��R�[�h�P
  ,InStrSyainCD2    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE   --          �Ј��R�[�h�Q
  ,InNumMaxRec    IN  NUMBER            --�ő�z��i�[����
  ,IoNumCursor    IN OUT  NUMBER            --�Ăяo����
  ,OtNumRecCount    OUT NUMBER            --����������
  ,OtNumAryCount    OUT NUMBER            --�z��i�[����
  ,OtStrEndFlg    OUT VARCHAR2          --�����I���t���O
  ,OtStrBonus1    OUT CHAR            --�ܗ^�x�����P
  ,OtStrBonus2    OUT CHAR            --�ܗ^�x�����Q
  ,OtStrZanYMD    OUT CHAR            --�c���X�V��
  ,OtStrYusiYMD   OUT typOtYusiYMDAry         --�Z����
  ,OtNumRiritu    OUT typOtRirituAry                --����
  ,OtNumKaisu   OUT typOtKaisuAry               --��
  ,OtNumKyuyoYusi   OUT typOtKyuyoYusiAry             --���^�Z���z
  ,OtNumSyoyoYusi   OUT typOtSyoyoYusiAry             --�ܗ^�Z���z
  ,OtNumKyuyoHen    OUT typOtKyuyoHenAry              --���^�ԍϊz
  ,OtNumSyoyoHen    OUT typOtSyoyoHenAry              --�ܗ^�ԍϊz
  ,OtNumKyuyoZan    OUT typOtKyuyoZanAry              --���^�c��
--MOD 20100225 0908047 NBC SAWAME START
--  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry);              --�ܗ^�c��
  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry               --�ܗ^�c��
  ,OtNumKyuyoMod    OUT typOtKyuyoModAry               --���^�c��(����߂������{(sysdate�ȑO))
  ,OtNumSyoyoMod    OUT typOtSyoyoModAry               --�ܗ^�c��(����߂������{(sysdate�ȑO))
  ,OtNumKyuyoModRisoku    OUT typOtKyuyoModRisokuAry   --���^�c��(����߂�������(sysdate�ȑO))
  ,OtNumSyoyoModRisoku    OUT typOtSyoyoModRisokuAry   --�ܗ^�c��(����߂�������(sysdate�ȑO))
  ,OtNumKyuyoModAll    OUT typOtKyuyoModAllAry               --���^�c��(����߂������{(�S��))
  ,OtNumSyoyoModAll    OUT typOtSyoyoModAllAry               --�ܗ^�c��(����߂������{(�S��))
  ,OtNumKyuyoModRisokuAll    OUT typOtKyuyoModRisokuAllAry   --���^�c��(����߂�������(�S��))
  ,OtNumSyoyoModRisokuAll    OUT typOtSyoyoModRisokuAllAry); --�ܗ^�c��(����߂�������(�S��))
--MOD 20100225 0908047 NBC SAWAME END

/* �v�Z���f�[�^�o�^���� */
PROCEDURE QPAP_CEnt100DatAdd (
   InStrSyainCD1      IN  QPAM_SYNKEISANW.QPAM_SYAINCD1%TYPE    --�Ј��R�[�h�P
  ,InStrSyainCD2      IN  QPAM_SYNKEISANW.QPAM_SYAINCD2%TYPE    --�Ј��R�[�h�Q
  ,InStrSimeiKanji    IN  QPAM_SYNKEISANW.QPAM_SIMEIKANJI%TYPE    --��������
  ,InStrMiseNM      IN  QPAM_SYNKEISANW.QPAM_MISENM%TYPE    --�X����
  ,InStrYusiYMD     IN  QPAM_SYNKEISANW.QPAM_YUSIYMD%TYPE   --�Z����
  ,InNumKyuyoHen      IN  QPAM_SYNKEISANW.QPAM_KYUYOYUSIGAKU%TYPE   --���^�ԍϊz
  ,InNUMSyoyoHen      IN  QPAM_SYNKEISANW.QPAM_SYOYOYUSIGAKU%TYPE   --�ܗ^�ԍϊz
  ,InNumKyuyoZan      IN  QPAM_SYNKEISANW.QPAM_KYUYOZANGANPON%TYPE  --���^�c���{
  ,InNUMSyoyoZan      IN  QPAM_SYNKEISANW.QPAM_SYOYOZANGANPON%TYPE  --�ܗ^�Z���{
  ,InStrKyuyoStr    IN  QPAM_SYNKEISANW.QPAM_KYUYOKEISANS%TYPE    --���^�v�Z�J�n��
  ,InStrSyoyoStr    IN  QPAM_SYNKEISANW.QPAM_SYOYOKEISANS%TYPE    --�ܗ^�v�Z�J�n��
  ,InStrSeisanYMD   IN  QPAM_SYNKEISANW.QPAM_SEISANYMD%TYPE   --���Z�N����
  ,InNumRiritu    IN  QPAM_SYNKEISANW.QPAM_RIRITU%TYPE    --����
  ,InNumKyuyoRisoku IN  QPAM_SYNKEISANW.QPAM_KYUYORISOKU%TYPE   --���^����
  ,InNumSyoyoRisoku IN  QPAM_SYNKEISANW.QPAM_SYOYORISOKU%TYPE   --�ܗ^����
  ,InStrTenbikiKBN  IN  QPAM_SYNKEISANW.QPAM_TENBIKIKBN%TYPE    --�V���敪
  ,InNumKyuyoTen    IN  QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE  --���^�V���z
  ,InNumSyoyoTen    IN  QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE  --�ܗ^�V���z
  ,InStrKyuyoKBN    IN  QPAM_SYNKEISANW.QPAM_KYUYOKOSINKBN%TYPE   --���^�X�V�敪
  ,InStrSyoyoKBN    IN  QPAM_SYNKEISANW.QPAM_SYOYOKOSINKBN%TYPE   --�ܗ^�X�V�敪
  ,InNumKyuyoNisu   IN  QPAM_SYNKEISANW.QPAM_KYUYONISU%TYPE   --���^����
  ,InNumSyoyoNisu   IN  QPAM_SYNKEISANW.QPAM_SYOYONISU%TYPE   --�ܗ^����
  ,InStrUserID        IN  QPAM_SYNKEISANW.QPAM_USERID%TYPE    --���[�U�h�c
  ,InStrComputerNM    IN  QPAM_SYNKEISANW.QPAM_COMPUTERNM%TYPE    --�R���s���[�^��
);

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt100DelWorkTbl(
   InStrUserID     IN  VARCHAR2,        --���[�U�[�h�c
   InStrComputerNM IN  VARCHAR2);       --�R���s���[�^��

--ADD 20100225 0908047 NBC YOKOYAMA START
/* �T���\�肪����߂�����Ă��Ȃ����ǂ����𔻒f */
PROCEDURE QPAP_CEnt100CheckModoshi (
   InStrSyainCD1    IN  QPB2_BUNKAI.QPB2_SYAINCD1%TYPE   --��������  �Ј��R�[�h�P
  ,InStrSyainCD2    IN  QPB2_BUNKAI.QPB2_SYAINCD2%TYPE   --          �Ј��R�[�h�Q
  ,InStrYusiYMD     IN  CHAR                             --          �Z����
  ,InStrKojoYMD     IN  CHAR                             --          �T����
  ,InStrYusiKBN     IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE    --          ���^�ܗ^�敪(�R�F���^�A�S�F�ܗ^)
  ,OtStrFLG         OUT CHAR);                           --���݃t���O
--ADD 20100225 0908047 NBC YOKOYAMA END
END QPAP_CEnt100PkG;
/
show error
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt100PkG                                                                                */
/* �@�\          �F�l�ݕt����                                                                                   */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/*�Q  �{�f�B�[                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt100PkG IS

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent100SelSyainZoku                                             */
/* �@�\      �@�@�F�Ј������̕\��                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent100SelSyainZoku (
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
    WHERE QPAC_PRMSyainCD1  = InStrPRMSyainCD1
    AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --�����I��

END QPAP_Cent100SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt100SelList                                                                            */
/* �@�\          �F�ݕt�f�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt100SelList (
   InStrSyainCD1    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE   --��������  �Ј��R�[�h�P
  ,InStrSyainCD2    IN  QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE   --          �Ј��R�[�h�Q
  ,InNumMaxRec    IN  NUMBER            --�ő�z��i�[����
  ,IoNumCursor    IN OUT  NUMBER            --�Ăяo����
  ,OtNumRecCount    OUT NUMBER            --����������
  ,OtNumAryCount    OUT NUMBER            --�z��i�[����
  ,OtStrEndFlg    OUT VARCHAR2          --�����I���t���O
  ,OtStrBonus1    OUT CHAR            --�ܗ^�x�����P
  ,OtStrBonus2    OUT CHAR            --�ܗ^�x�����Q
  ,OtStrZanYMD    OUT CHAR            --�c���X�V��
  ,OtStrYusiYMD   OUT typOtYusiYMDAry         --�Z����
  ,OtNumRiritu    OUT typOtRirituAry                --����
  ,OtNumKaisu   OUT typOtKaisuAry               --��
  ,OtNumKyuyoYusi   OUT typOtKyuyoYusiAry             --���^�Z���z
  ,OtNumSyoyoYusi   OUT typOtSyoyoYusiAry             --�ܗ^�Z���z
  ,OtNumKyuyoHen    OUT typOtKyuyoHenAry              --���^�ԍϊz
  ,OtNumSyoyoHen    OUT typOtSyoyoHenAry              --�ܗ^�ԍϊz
  ,OtNumKyuyoZan    OUT typOtKyuyoZanAry              --���^�c��
--MOD 20100225 0908047 NBC SAWAME START
--  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry) IS              --�ܗ^�c��
  ,OtNumSyoyoZan    OUT typOtSyoyoZanAry                    --�ܗ^�c��
  ,OtNumKyuyoMod    OUT typOtKyuyoModAry                    --���^�c��(����߂������{(sysdate�ȑO))
  ,OtNumSyoyoMod    OUT typOtSyoyoModAry                    --�ܗ^�c��(����߂������{(sysdate�ȑO))
  ,OtNumKyuyoModRisoku    OUT typOtKyuyoModRisokuAry        --���^�c��(����߂�������(sysdate�ȑO))
  ,OtNumSyoyoModRisoku    OUT typOtSyoyoModRisokuAry        --�ܗ^�c��(����߂�������(sysdate�ȑO))
  ,OtNumKyuyoModAll    OUT typOtKyuyoModAllAry                    --���^�c��(����߂������{(�S��))
  ,OtNumSyoyoModAll    OUT typOtSyoyoModAllAry                    --�ܗ^�c��(����߂������{(�S��))
  ,OtNumKyuyoModRisokuAll    OUT typOtKyuyoModRisokuAllAry        --���^�c��(����߂�������(�S��))
  ,OtNumSyoyoModRisokuAll    OUT typOtSyoyoModRisokuAllAry) IS    --�ܗ^�c��(����߂�������(�S��))
--MOD 20100225 0908047 NBC SAWAME END

  /* �����ŗL�̕ϐ� */	
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;
--ADD 20100225 0908047 NBC SAWAME START
  v_CursorID2   NUMBER := 0;
  v_Dummy2      INTEGER;
--ADD 20100225 0908047 NBC SAWAME END

  v_Bonus1      CHAR(4);
  v_Bonus2      CHAR(4);
  v_ZanYMD      CHAR(8);

  v_YusiYMD     CHAR(8);
  v_Riritu      QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_Kaisu       QPA8_SYNDAICYOT.QPA8_HENSAITUKISU%TYPE;
  v_KyuyoYusi     QPA8_SYNDAICYOT.QPA8_KYUYOHENSAIALL%TYPE;
  v_SyoyoYusi     QPA8_SYNDAICYOT.QPA8_SYOYOHENSAIALL%TYPE;
  v_KyuyoHen      QPA8_SYNDAICYOT.QPA8_KYUYOHENSAI%TYPE;
  v_SyoyoHen      QPA8_SYNDAICYOT.QPA8_SYOYOHENSAI%TYPE;
  v_KyuyoZan      QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZan      QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_KansaiYMD     CHAR(8);

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  v_SyoyoZandk    QPAY_SYNDAICYOWT.QPAY_SYOYOZANDAKA%TYPE;
/*ADD 20090828 0811051 NBC MURAYAMA END*/

--ADD 20100225 0908047 NBC SAWAME START
  v_KyuyoMod      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_SyoyoMod      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_KyuyoModRisoku   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_SyoyoModRisoku   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_KyuyoModAll      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_SyoyoModAll      QPB2_BUNKAI.QPB2_GANKIN%TYPE;
  v_KyuyoModRisokuAll   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
  v_SyoyoModRisokuAll   QPB2_BUNKAI.QPB2_RISOKU%TYPE;
--ADD 20100225 0908047 NBC SAWAME END

BEGIN

/* ----- �r�s�d�o�P �\���f�[�^�������擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    OtstrEndFlg := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount := 0;

    /* �Ј��}�X�^���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAC_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAC_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Bonus1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Bonus2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Bonus1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Bonus2);
      /* �p�����[�^�ɓn�� */
      OtStrBonus1 := v_Bonus1;
      OtStrBonus2 := v_Bonus2;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �ŐV�c���X�V���擾 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(MAX(QPAT_YMD),''YYYYMMDD'')';
    StrSQL := StrSQL || ' FROM QPAT_ZANYMD';
    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_ZanYMD,8);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,  1,v_ZanYMD);
      OtStrZanYMD := v_ZanYMD;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �Ј��Z���䒠���݃`�F�b�N�r�p�k */
    v_NumCount  := 0;
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
      OtNumRecCount := v_NumCount;
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);
  END IF;

/* ----- �r�s�d�o�Q �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j

/*DEL 20090828 0811051 NBC MURAYAMA START*/
    /* �Ј��Z���䒠���� */
--  StrSQL := NULL;  
--  StrSQL := StrSQL || 'SELECT';  
--  StrSQL := StrSQL || ' TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD''),';  
--  StrSQL := StrSQL || ' NVL(QPA8_RIRITU,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_HENSAITUKISU,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAIALL,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAIALL,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAI,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAI,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_KYUYOZANDAKA,0),';  
--  StrSQL := StrSQL || ' NVL(QPA8_SYOYOZANDAKA,0),';  
--  StrSQL := StrSQL || ' TO_CHAR(QPA8_KANSAIYMD,''YYYYMMDD'')';  
--  StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';  */
--  StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';  
--  StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';  
--  StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';  
/*DEL 20090828 0811051 NBC MURAYAMA END*/

/*MOD 20090828 0811051 NBC MURAYAMA START*/
	/* �ܗ^�T���̓�d���Z��}�~ */
    /* �Ј��Z���䒠���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(P8.QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_HENSAITUKISU,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(P8.QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' TO_CHAR(P8.QPA8_KANSAIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' PY.QPAY_SYOYOZANDAKA';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT P8, QPAY_SYNDAICYOWT PY';
    StrSQL := StrSQL || ' WHERE P8.QPA8_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD1 = PY.QPAY_PRMSYAINCD1 (+)';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMSYAINCD2 = PY.QPAY_PRMSYAINCD2 (+)';
    StrSQL := StrSQL || ' AND P8.QPA8_PRMYUSIYMD = PY.QPAY_PRMYUSIYMD (+)';
    StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';
/*MOD 20090828 0811051 NBC MURAYAMA END

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_YusiYMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Riritu);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisu);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_KyuyoYusi);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_SyoyoYusi);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_KyuyoHen);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_SyoyoHen);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_KyuyoZan);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_SyoyoZan);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,10,v_KansaiYMD,8);

/*ADD 20090828 0811051 NBC MURAYAMA START*/
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SyoyoZandk);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_YusiYMD);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Riritu);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisu);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_KyuyoYusi);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_SyoyoYusi);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_KyuyoHen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_SyoyoHen);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_KyuyoZan);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_SyoyoZan);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,10,v_KansaiYMD);

/*ADD 20090828 0811051 NBC MURAYAMA START*/
    DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SyoyoZandk);
/*ADD 20090828 0811051 NBC MURAYAMA END*/

--ADD 20100225 0908047 NBC SAWAME START
    /* ����߂����iSYSDATE�ȑO�j�擾 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_GANKIN,0) END) AS KYUYOGANALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_GANKIN,0) END) AS SYOYOGANALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_RISOKU,0) END) AS KYUYORISOKUALL';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_RISOKU,0) END) AS SYOYORISOKUALL';
    StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
    StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPB2_SYUBETU = ''2''';
    StrSQL := StrSQL || ' AND QPB2_YUSIYMD = :YMD';
    StrSQL := StrSQL || ' AND QPB2_BUNMODFLG = ''0''';
    StrSQL := StrSQL || ' AND QPB2_KOJOYMD <= TO_DATE(TO_CHAR(SYSDATE,''YYYYMMDD''),''YYYYMMDD'')';
    
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YusiYMD,8);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KyuyoMod);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SyoyoMod);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KyuyoModRisoku);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_SyoyoModRisoku);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    /* �J�����l��ϐ��֊i�[ */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_KyuyoMod);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SyoyoMod);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KyuyoModRisoku);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_SyoyoModRisoku);
    END IF;
    /* ���I�J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    
    /* ����߂����i�S�āj�擾 */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_GANKIN,0) END) AS KYUYOGAN';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_GANKIN,0) END) AS SYOYOGAN';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''3'' THEN NVL(QPB2_RISOKU,0) END) AS KYUYORISOKU';
    StrSQL := StrSQL || ' ,SUM(CASE QPB2_YUSIKBN WHEN ''4'' THEN NVL(QPB2_RISOKU,0) END) AS SYOYORISOKU';
    StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
    StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPB2_SYUBETU = ''2''';
    StrSQL := StrSQL || ' AND QPB2_YUSIYMD = :YMD';
    StrSQL := StrSQL || ' AND QPB2_BUNMODFLG = ''0''';
    
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', InStrSyainCD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD2);
    DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YusiYMD,8);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KyuyoModAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_SyoyoModAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_KyuyoModRisokuAll);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID2,4,v_SyoyoModRisokuAll);
    /* SQL�̎��s */
    v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
    /* �J�����l��ϐ��֊i�[ */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_KyuyoModAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_SyoyoModAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_KyuyoModRisokuAll);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,4,v_SyoyoModRisokuAll);
    END IF;
    /* ���I�J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
--ADD 20100225 0908047 NBC SAWAME END
    
    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrYusiYMD(NumIdx) := v_YusiYMD;
    OtNumRiritu(NumIdx) := v_Riritu;
    OtNumKaisu(NumIdx) := v_Kaisu;
    OtNumKyuyoYusi(NumIdx) := v_KyuyoYusi;
    OtNumSyoyoYusi(NumIdx) := v_SyoyoYusi;
    OtNumKyuyoHen(NumIdx) := v_KyuyoHen;
    OtNumSyoyoHen(NumIdx) := v_SyoyoHen;
    IF (v_KansaiYMD IS NULL)
        OR (RTRIM(LTRIM(v_KansaiYMD)) = '') THEN
      OtNumKyuyoZan(NumIdx) := v_KyuyoZan;

/*DEL 20090828 0811051 NBC MURAYAMA START*/
--      OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
/*DEL 20090828 0811051 NBC MURAYAMA END*/

/*MOD 20090828 0811051 NBC MURAYAMA START*/
	  IF (v_SyoyoZandk = 0) or (v_SyoyoZandk is null) THEN
        OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
	  ELSE
		OtNumSyoyoZan(NumIdx) := v_SyoyoZandk;
	  END IF;
/*MOD 20090828 0811051 NBC MURAYAMA END*/

    ELSE
      OtNumKyuyoZan(NumIdx) := 0;
      OtNumSyoyoZan(NumIdx) := 0;
    END IF;
    
--ADD 20100225 0908047 NBC SAWAME START
   OtNumKyuyoMod(NumIdx) := NVL(v_KyuyoMod,0);
   OtNumSyoyoMod(NumIdx) := NVL(v_SyoyoMod,0);
   OtNumKyuyoModRisoku(NumIdx) := NVL(v_KyuyoModRisoku,0);
   OtNumSyoyoModRisoku(NumIdx) := NVL(v_SyoyoModRisoku,0);
   OtNumKyuyoModAll(NumIdx) := NVL(v_KyuyoModAll,0);
   OtNumSyoyoModAll(NumIdx) := NVL(v_SyoyoModAll,0);
   OtNumKyuyoModRisokuAll(NumIdx) := NVL(v_KyuyoModRisokuAll,0);
   OtNumSyoyoModRisokuAll(NumIdx) := NVL(v_SyoyoModRisokuAll,0);
--ADD 20100225 0908047 NBC SAWAME END

    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;              --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';               --�p�����[�^�ɃZ�b�g�i�����I���j

  /* ���I�J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
--ADD 20100225 0908047 NBC SAWAME START
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
--ADD 20100225 0908047 NBC SAWAME END
    RAISE ;

END QPAP_CEnt100SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt100DatAdd                                                                             */
/* �@�\          �F�v�Z���f�[�^�o�^����                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt100DatAdd (
   InStrSyainCD1      IN  QPAM_SYNKEISANW.QPAM_SYAINCD1%TYPE    --�Ј��R�[�h�P
  ,InStrSyainCD2      IN  QPAM_SYNKEISANW.QPAM_SYAINCD2%TYPE    --�Ј��R�[�h�Q
  ,InStrSimeiKanji    IN  QPAM_SYNKEISANW.QPAM_SIMEIKANJI%TYPE    --��������
  ,InStrMiseNM      IN  QPAM_SYNKEISANW.QPAM_MISENM%TYPE    --�X����
  ,InStrYusiYMD     IN  QPAM_SYNKEISANW.QPAM_YUSIYMD%TYPE   --�Z����
  ,InNumKyuyoHen      IN  QPAM_SYNKEISANW.QPAM_KYUYOYUSIGAKU%TYPE   --���^�ԍϊz
  ,InNUMSyoyoHen      IN  QPAM_SYNKEISANW.QPAM_SYOYOYUSIGAKU%TYPE   --�ܗ^�ԍϊz
  ,InNumKyuyoZan      IN  QPAM_SYNKEISANW.QPAM_KYUYOZANGANPON%TYPE  --���^�c���{
  ,InNUMSyoyoZan      IN  QPAM_SYNKEISANW.QPAM_SYOYOZANGANPON%TYPE  --�ܗ^�Z���{
  ,InStrKyuyoStr    IN  QPAM_SYNKEISANW.QPAM_KYUYOKEISANS%TYPE    --���^�v�Z�J�n��
  ,InStrSyoyoStr    IN  QPAM_SYNKEISANW.QPAM_SYOYOKEISANS%TYPE    --�ܗ^�v�Z�J�n��
  ,InStrSeisanYMD   IN  QPAM_SYNKEISANW.QPAM_SEISANYMD%TYPE   --���Z�N����
  ,InNumRiritu    IN  QPAM_SYNKEISANW.QPAM_RIRITU%TYPE    --����
  ,InNumKyuyoRisoku IN  QPAM_SYNKEISANW.QPAM_KYUYORISOKU%TYPE   --���^����
  ,InNumSyoyoRisoku IN  QPAM_SYNKEISANW.QPAM_SYOYORISOKU%TYPE   --�ܗ^����
  ,InStrTenbikiKBN  IN  QPAM_SYNKEISANW.QPAM_TENBIKIKBN%TYPE    --�V���敪
  ,InNumKyuyoTen    IN  QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE  --���^�V���z
  ,InNumSyoyoTen    IN  QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE  --�ܗ^�V���z
  ,InStrKyuyoKBN    IN  QPAM_SYNKEISANW.QPAM_KYUYOKOSINKBN%TYPE   --���^�X�V�敪
  ,InStrSyoyoKBN    IN  QPAM_SYNKEISANW.QPAM_SYOYOKOSINKBN%TYPE   --�ܗ^�X�V�敪
  ,InNumKyuyoNisu   IN  QPAM_SYNKEISANW.QPAM_KYUYONISU%TYPE   --���^����
  ,InNumSyoyoNisu   IN  QPAM_SYNKEISANW.QPAM_SYOYONISU%TYPE   --�ܗ^����
  ,InStrUserID        IN  QPAM_SYNKEISANW.QPAM_USERID%TYPE    --���[�U�h�c
  ,InStrComputerNM    IN  QPAM_SYNKEISANW.QPAM_COMPUTERNM%TYPE    --�R���s���[�^��
) IS

  /* �����ŗL�̕ϐ� */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--  v_Zaimu       QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE;
--  v_Syozai      QPAB_JISYAM.QPAB_SYOZAICHI%TYPE;
--  v_Kaisya      QPAB_JISYAM.QPAB_KAISYANM%TYPE;
	v_Zaimu						QPB9_FURIKOMISKM.QPB9_SYOZAICHI1%TYPE;
	v_Syozai					QPB9_FURIKOMISKM.QPB9_SYOZAICHI2%TYPE;
	v_Kaisya					QPB9_FURIKOMISKM.QPB9_KAISYANM%TYPE;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */
  w_SeisanM     NUMBER;
  v_SeisanM     QPAM_SYNKEISANW.QPAM_SEISANM%TYPE;

  v_Kingaku     QPAA_KOJOT.QPAA_KANGAKU%TYPE;
  v_YusiKBN     QPAA_KOJOT.QPAA_YUSIKBN%TYPE;
  v_KyuyoTen      QPAM_SYNKEISANW.QPAM_KYUYOTENBIKIGAKU%TYPE;
  v_SyoyoTen      QPAM_SYNKEISANW.QPAM_SYOYOTENBIKIGAKU%TYPE;

BEGIN

  w_SeisanM := TO_NUMBER(SUBSTR(InStrSeisanYMD,5,2));
  v_SeisanM := TO_CHAR(w_SeisanM);

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--	�U������̎擾��ύX
--	�����Ѓ}�X�^���U����}�X�^
--  /* ���Ѓ}�X�^���� */
--  StrSQL := NULL;
--  StrSQL := StrSQL || 'SELECT';
--  StrSQL := StrSQL || ' NVL(QPAB_ZAIMUKYOKUCD,'' ''),';
--  StrSQL := StrSQL || ' NVL(QPAB_SYOZAICHI,'' ''),';
--  StrSQL := StrSQL || ' NVL(QPAB_KAISYANM,'' '')';
--  StrSQL := StrSQL || ' FROM QPAB_JISYAM';
--  StrSQL := StrSQL || ' WHERE QPAB_PRMKAISYACD = :Code';
--  /* ���I�J�[�\���̃I�[�v�� */
--  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--  /* SQL�̉�� */
--  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--  /* ���͕ϐ����o�C���h���� */
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', '01');
--  /* �o�͕ϐ��̃o�C���h */
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zaimu,40);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Syozai,40);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisya,40);
--  /* SQL�̎��s */
--  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--  /* FETCH */
--  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
--    /* �J�����l��ϐ��֊i�[ */
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zaimu);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Syozai);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisya);
--  END IF;
--  /* �J�[�\���̃N���[�Y */
--  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	BEGIN
		SELECT
			 NVL(QPB9_SYOZAICHI1, ' ')
			,NVL(QPB9_SYOZAICHI2, ' ')
			,NVL(QPB9_KAISYANM, ' ')
		INTO
			 v_Zaimu
			,v_Syozai
			,v_Kaisya
		FROM
			(
			SELECT
				 QPAC_PRMSYAINCD1		AS SYAINCD1
				,QPAC_PRMSYAINCD2		AS SYAINCD2
				,QPAC_MISECD			AS MISECD
				,(
				CASE NVL(Q_CHECK_KAISYA.CNT, 0)
					WHEN 0 THEN	QPAC_MISECD
					ELSE		'000'
				END)					AS KAISYACD
			FROM
				QPAC_SYAINM
				,(
				SELECT
					 LTRIM(RTRIM(QPAH_NAMEX))	AS MISECD
					,COUNT(*)					AS CNT
				FROM
					QPAH_OTHERM
				WHERE
					QPAH_PRMCODE LIKE 'TMISE%'
				GROUP BY
					LTRIM(RTRIM(QPAH_NAMEX))
				)	Q_CHECK_KAISYA
			WHERE
				QPAC_PRMSYAINCD1	= ' '
			AND	QPAC_PRMSYAINCD2	= InStrSyainCD2
			AND	QPAC_MISECD			= Q_CHECK_KAISYA.MISECD(+)
			)	Q_MAIN
			,QPB9_FURIKOMISKM
		WHERE
			Q_MAIN.KAISYACD		= QPB9_PRMKAISYACD(+)
		;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			v_Zaimu   := ' ';
			v_Syozai  := ' ';
			v_Kaisya  := ' ';
		WHEN OTHERS THEN
			RAISE;
	END;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */

  v_KyuyoTen := InNumKyuyoTen;
  v_SyoyoTen := InNumSyoyoTen;

--DEL 20100225 0908047 NBC YOKOYAMA START
--  /* �T���t�@�C������ */
--  StrSQL := NULL;
--  StrSQL := StrSQL || 'SELECT';
--  StrSQL := StrSQL || ' NVL(QPAA_KANGAKU,0),';
--  StrSQL := StrSQL || ' NVL(QPAA_YUSIKBN,'' '')';
--  StrSQL := StrSQL || ' FROM QPAA_KOJOT';
--  StrSQL := StrSQL || ' WHERE QPAA_SYAINCD1 = :Code1';
--  StrSQL := StrSQL || ' AND QPAA_SYAINCD2 = :Code2';
--  StrSQL := StrSQL || ' AND QPAA_SYUBETU = :KBN';
--  StrSQL := StrSQL || ' AND TO_CHAR(QPAA_YUSIYMD,''YYYYMMDD'') = :YMD';
--  /* ���I�J�[�\���̃I�[�v�� */
--  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
--  /* SQL�̉�� */
--  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
--  /* ���͕ϐ����o�C���h���� */
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', InStrSyainCD1);
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD2);
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '2');
--  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYusiYMD);
--  /* �o�͕ϐ��̃o�C���h */
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Kingaku);
--  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YusiKBN,1);
--  /* SQL�̎��s */
--  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
--  /* FETCH */
--  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
--    /* �J�����l��ϐ��֊i�[ */
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Kingaku);
--    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YusiKBN);
--    IF v_YusiKBN = '3' THEN
--      v_KyuyoTen := v_Kingaku;
--    ELSE
--      v_SyoyoTen := v_Kingaku;
--    END IF;
--  END IF;
--  /* �J�[�\���̃N���[�Y */
--  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
--DEL 20100225 0908047 NBC YOKOYAMA END

  /*  �v�Z���f�[�^������  */
  DELETE FROM QPAM_SYNKEISANW
      WHERE QPAM_USERID = InStrUserID
      AND QPAM_COMPUTERNM = InStrComputerNM;

  /*  �v�Z���f�[�^�o�^  */
  INSERT INTO QPAM_SYNKEISANW VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,NVL(InStrSimeiKanji,' ')
    ,NVL(InStrMiseNM,' ')
    ,NVL(InStrYusiYMD,' ')
    ,NVL(InNumKyuyoHen,0)
    ,NVL(InNUMSyoyoHen,0)
    ,NVL(InNumKyuyoZan,0)
    ,NVL(InNUMSyoyoZan,0)
    ,NVL(InStrKyuyoStr,' ')
    ,NVL(InStrSyoyoStr,' ')
    ,NVL(InStrSeisanYMD,' ')
    ,NVL(InNumRiritu,0)
    ,NVL(InNumKyuyoRisoku,0)
    ,NVL(InNumSyoyoRisoku,0)
    ,NVL(InStrTenbikiKBN,' ')
    ,NVL(v_KyuyoTen,0)
    ,NVL(v_SyoyoTen,0)
    ,NVL(InStrKyuyoKBN,' ')
    ,NVL(InStrSyoyoKBN,' ')
    ,NVL(v_SeisanM,' ')
    ,NVL(InNumKyuyoNisu,0)
    ,NVL(InNumSyoyoNisu,0)
    ,NVL(v_Zaimu,' ')
    ,NVL(v_Syozai,' ')
    ,NVL(v_Kaisya,' ')
    ,NVL(InStrUserID,' ')
    ,NVL(InStrComputerNM,' ')
    );

  /* �R�~�b�g */
  COMMIT;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    /* ���[���o�b�N */
    ROLLBACK;
    RAISE ;
END QPAP_CEnt100DatAdd;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt100DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt100DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��
    
BEGIN
  DELETE FROM QPAM_SYNKEISANW
      WHERE QPAM_USERID     = InStrUserID
        AND QPAM_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt100DelWorkTbl;

--ADD 20100225 0908047 NBC YOKOYAMA START
/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt100CheckModoshi                                  */
/* �@�\          �F�T���\�肪����߂�����Ă��Ȃ����ǂ����𔻒f              */
/*****************************************************************************/
PROCEDURE QPAP_CEnt100CheckModoshi (
   InStrSyainCD1    IN  QPB2_BUNKAI.QPB2_SYAINCD1%TYPE   --��������  �Ј��R�[�h�P
  ,InStrSyainCD2    IN  QPB2_BUNKAI.QPB2_SYAINCD2%TYPE   --          �Ј��R�[�h�Q
  ,InStrYusiYMD     IN  CHAR                             --          �Z����
  ,InStrKojoYMD     IN  CHAR                             --          �T����
  ,InStrYusiKBN     IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE    --          ���^�ܗ^�敪(�R�F���^�A�S�F�ܗ^)
  ,OtStrFLG         OUT CHAR) IS                         --���݃t���O

	/* �����ŗL�̕ϐ� */
	v_CNT      NUMBER := 0;
BEGIN
	SELECT COUNT(*) 
	INTO  v_CNT
	FROM QPB2_BUNKAI
	WHERE QPB2_SYAINCD1  = NVL(InStrSyainCD1,' ')
	  AND QPB2_SYAINCD2  = InStrSyainCD2
	  AND QPB2_SYUBETU   = '2'				--�؏�
	  AND QPB2_YUSIYMD   = TO_DATE(InStrYusiYMD,'YYYY/MM/DD')
	  AND QPB2_KOJOYMD   = TO_DATE(InStrKojoYMD,'YYYY/MM/DD')
	  AND QPB2_YUSIKBN   = InStrYusiKBN
	  AND QPB2_BUNMODFLG = '0';				--����߂�

	IF v_CNT = 0 THEN
		OtStrFLG := '0';
	ELSE
		OtStrFLG := '1';
	END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END QPAP_CEnt100CheckModoshi;
--ADD 20100225 0908047 NBC YOKOYAMA END
END QPAP_CEnt100PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
