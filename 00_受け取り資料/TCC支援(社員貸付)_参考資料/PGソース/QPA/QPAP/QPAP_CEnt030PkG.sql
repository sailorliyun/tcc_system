CREATE OR REPLACE PACKAGE  QPAP_CEnt030PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt030PkG                                                                                */
/* �@�\          �F�����Z���v�Z���o��                                                                             */
/* �쐬��        �F2001/07/07                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
/* �C������  �Č��ԍ�  ���t  �C����       ���l                                                                    */
/* 00001    0811051 2009/08/28 NBC ISHIDA �@�u�����Z���v�Z���v�̋��^�T���̗���/�����́A                           */
/*                                           �O��̋��^�T����̎c�������ɎZ�o���Ă���̂ŁA                       */
/*                                           �Q�U���`�����̓�������������ꍇ�A�����������v�Z�����ꂸ�A           */
/*                                           �c��������Ă���̂ł���Ȃ��悤�ɂ���B                             */
/*                                                                                                                */
/*                                        �A �T�����~�w��������A���^�T��������Ȃ������ꍇ�ł��A                 */
/*                                          �u�����Z���v�Z���v��ł́A�S�Ă̋��^�T��/�ܗ^�T����                   */
/*                                           �T�����ꂽ�悤�ɕ\�������̂ŁA                                     */
/*                                           �T�����~���ꂽ�ꍇ�́A�\������Ȃ��悤�ɂ���B                       */
/*                                                                                                                */
/*                                        �B �����ɓ��z�̑ݕt���s�����ꍇ��A                                     */
/*                                           �Q�T���̋��^�T�����ɑݕt���s�����ꍇ���A                             */
/*                                           �������t�ɓ������������ꍇ�A�u�����Z���v�Z���v�̉��v������Ȃ��ꍇ�� */
/*                                           ����̂ō����悤�ɂ���B                                             */
/*                                                                                                                */
/* 00002    0811051 2009/11/06 NBC ISHIDA �@�n�o:����1���`5���ł̌v�Z���͋��^�T�����\������Ȃ��ׁA               */
/*                                          �V�~�����[�V�����Ōv�Z����B�@                                        */
/*                                                                                                                */
/*                                        �A�T�����~�t���O�������Ă��鎞�́A�V�~�����[�V�����ł̌v�Z�����Ȃ��B    */
/*                                                                                                                */
/*                                        �B���Z���̗����v�Z���ŏI���^�T��������v�Z����悤�ɂ���B              */
/*                                          �n�o���̋��^�T�������́A�n�o�O���̋��^�T��������v�Z����B            */
/*                                                                                                                */
/******************************************************************************************************************/
/*                                         �R�����g�L�q���@�ύX                                                   */
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100129  TR0911-003       11���V�K�ݕt�̌v�Z����11������12��25�����Z�ŏo�͂���ƁA                            */
/*                            12�����^�T���s�Ɛ��Z�s�̋��z������ĕ\�������B                                    */
/*                           �i12�����^�T���̗������ݕt���`11��25���̗����A����0�~�ƕ\�������                    */
/*                            �������͗����͑ݕt���`12��25���̗����A�����͕ԍϋ��z�|�����j                        */
/*                                                                                                                */
/* 20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��                                                   */
/*                            �@�����E����߂������v�Z���ɔ��f�����ĕ\��������                                    */
/*                            �A����������\��������                                                              */
/*                                                                                                                */
/* 20100319  TR1003-002       �����Z���v�Z����ʂ̓����ԍϊz�\�����                                              */
/*                            �����s�̕ԍϋ��z�������{�����ɏC������                                              */
/*                                                                                                                */
/*	20100827	1004091		IMZ SHIBUTANI	�U������̎擾���@�ύX�ւ̑Ή�									*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��                                                                                      */
/******************************************************************************************************************/

  StrDLM  CHAR(1) := '|'; --��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtYMDAry IS TABLE OF QPAI_KGCKEISANW.QPAI_YMD%TYPE                --�N����
    INDEX BY BINARY_INTEGER;
  TYPE typOtKBNAry IS TABLE OF QPAI_KGCKEISANW.QPAI_KBN%TYPE                --�敪
    INDEX BY BINARY_INTEGER;
  TYPE typOtYusiKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_YUSIKINGAKU%TYPE    --�Z�����z
    INDEX BY BINARY_INTEGER;
  TYPE typOtHenKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_HENSAIKINGAKU%TYPE   --�ԍϋ��z
    INDEX BY BINARY_INTEGER;
  TYPE typOtGanKinAry IS TABLE OF QPAI_KGCKEISANW.QPAI_GANKIN%TYPE          --����
    INDEX BY BINARY_INTEGER;
  TYPE typOtRisokuAry IS TABLE OF QPAI_KGCKEISANW.QPAI_RISOKU%TYPE          --����
    INDEX BY BINARY_INTEGER;
  TYPE typOtZandakaAry IS TABLE OF QPAI_KGCKEISANW.QPAI_ZANDAKA%TYPE        --�c��
    INDEX BY BINARY_INTEGER;

/* �c���X�V���擾 */
PROCEDURE QPAP_CEnt030GetZanYMD (
   OtStrZanYMD          OUT   CHAR);

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent030SelSyainZoku (
  InStrPRMSyainCD1   IN       QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2   IN       QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana        OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,    --�����J�i
  OtStrSimeiKanji       OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE,   --��������
  OtStrMiseCD           OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,       --�����X�R�[�h
  OtStrMiseName         OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,        --�X����
  OtStrTozaiKBN         OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,     --�����敪
  OtStrBumonCD          OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,      --��������R�[�h
  OtStrBumonName        OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,      --���喼��
  OtStrSikakuCD         OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,     --���i�R�[�h
  OtStrTokyuCD          OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,      --�����R�[�h
  OtStrBornYMD          OUT   VARCHAR2,                           --���N����
  OtStrSonzaiFlg        OUT   VARCHAR2);                          --����Flg (����̑��� Check)

/* �����Z���v�Z���f�[�^�擾 */
PROCEDURE QPAP_CEnt030SelList (
   InStrSyainCD      IN       QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE   --���o�L�[  �Ј��R�[�h
  ,InStrSeiKBN       IN       CHAR                                --          ���Z�敪
  ,InStrSeiYMD       IN       CHAR                                --          ���Z�N����
  ,InStrStrYMD1      IN       CHAR                                --          �����J�n���P
  ,InStrStrYMD2      IN       CHAR                                --          �����J�n���Q
  ,InStrStrYMD3      IN       CHAR                                --          �����J�n���R
  ,InStrEndYMD       IN       CHAR                                --          �����I����
  ,InStrShoYYYY      IN       CHAR                                --          �����N�x
  ,InNumMaxRec       IN       NUMBER                              --�ő�z��i�[����
  ,IoNumCursor       IN OUT   NUMBER                              --�J�[�\���h�c
  ,OtNumRecCount        OUT   NUMBER                              --����������
  ,OtNumAryCount        OUT   NUMBER                              --�z��i�[����
  ,OtStrEndFlg          OUT   VARCHAR2                            --�����I���t���O
  ,OtStrYMD             OUT   typOtYMDAry                         --�N����
  ,OtStrKBN             OUT   typOtKBNAry                         --�敪
  ,OtNumYusiKin         OUT   typOtYusiKinAry                     --�Z�����z
  ,OtNumHenKin          OUT   typOtHenKinAry                      --�ԍϋ��z
  ,OtNumGanKin          OUT   typOtGanKinAry                      --����
  ,OtNumRisoku          OUT   typOtRisokuAry                      --����
  ,OtStrZandaka         OUT   typOtZandakaAry                     --�c��
/* ADD 20100225 0908047 NBC ISHIDA START */
  ,OtNumGanKinMod       OUT   NUMBER                              --����߂�����
  ,OtNumRisokuMod       OUT   NUMBER                              --����߂�����
/* ADD 20100225 0908047 NBC ISHIDA END */
  ,InStrUserID       IN       QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM   IN       QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --�R���s���[�^��

/* �����Z���ԍϊz�擾 */
FUNCTION QPAP_CEnt030GetHensaigaku(
   InStrSyainCD      IN       QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrKBN          IN       CHAR
  ,InStrYM           IN       CHAR) RETURN NUMBER;

/* �����Z���ԍϊz�ύX���擾 */
FUNCTION QPAP_CEnt030GetHensaiYMD(
   InStrSyainCD      IN      QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrYM           IN      CHAR) RETURN CHAR;

/* �����Z�������擾 */
FUNCTION QPAP_CEnt030GetRiritu(
   InStrYMD          IN      CHAR) RETURN NUMBER;

/* �����Z�������ύX���擾 */
FUNCTION QPAP_CEnt030GetRirituYMD(
   InStrYMD          IN      CHAR) RETURN CHAR;

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt030DelWorkTbl(
   InStrUserID       IN     VARCHAR2,                             --���[�U�[�h�c
   InStrComputerNM   IN     VARCHAR2);                            --�R���s���[�^��

END QPAP_CEnt030PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*  �Q  �{�f�B�[                                                                                    */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt030PkG IS

  TYPE typeRisokuAry IS TABLE OF NUMBER                          --����
    INDEX BY BINARY_INTEGER;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030GetZanYMD                                                                          */
/* �@�\          �F�c���X�V���擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt030GetZanYMD (
    OtStrZanYMD    OUT   CHAR) IS

BEGIN

    SELECT    MAX(TO_CHAR(QPAT_YMD,'YYYYMMDD'))
      INTO    OtStrZanYMD
      FROM    QPAT_ZANYMD;

EXCEPTION
    WHEN  OTHERS  THEN
        RAISE ;
END QPAP_CEnt030GetZanYMD;

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent030SelSyainZoku                                             */
/* �@�\      �@�@�F�Ј������̕\��                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_Cent030SelSyainZoku (
  InStrPRMSyainCD1   IN       QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,  --�Ј��R�[�h�P
  InStrPRMSyainCD2   IN       QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,  --�Ј��R�[�h�Q
  OtStrSimeiKana        OUT   QPAC_SyainM.QPAC_SimeiKana%TYPE,    --�����J�i
  OtStrSimeiKanji       OUT   QPAC_SyainM.QPAC_SimeiKanji%TYPE,   --��������
  OtStrMiseCD           OUT   QPAC_SyainM.QPAC_MiseCD%TYPE,       --�����X�R�[�h
  OtStrMiseName         OUT   QPAE_MiseM.QPAE_MiseNm%TYPE,        --�X����
  OtStrTozaiKBN         OUT   QPAC_SyainM.QPAC_TozaiKBN%TYPE,     --�����敪
  OtStrBumonCD          OUT   QPAC_SyainM.QPAC_BumonCD%TYPE,      --��������R�[�h
  OtStrBumonName        OUT   QPAF_BumonM.QPAF_BumonNm%TYPE,      --���喼��
  OtStrSikakuCD         OUT   QPAC_SyainM.QPAC_SikakuCD%TYPE,     --���i�R�[�h
  OtStrTokyuCD          OUT   QPAC_SyainM.QPAC_TokyuCD%TYPE,      --�����R�[�h
  OtStrBornYMD          OUT   VARCHAR2,                           --���N����
  OtStrSonzaiFlg        OUT   VARCHAR2) IS                        --����Flg (����̑��� Check)

  /* �����ŗL�̕ϐ� */

BEGIN
  /* �o�̓p�����[�^�̃N���A */
  OtStrSimeiKana      := ' ';
  OtStrSimeiKanji     := ' ';
  OtStrMiseCD         := ' ';
  OtStrMiseName       := ' ';
  OtStrTozaiKBN       := ' ';
  OtStrBumonCD        := ' ';
  OtStrBumonName      := ' ';
  OtStrSikakuCD       := ' ';
  OtStrTokyuCD        := ' ';
  OtStrBornYMD        := ' ';
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
--    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAE_PRMMiseCD
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --�����I��

END QPAP_Cent030SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030SelList                                                                            */
/* �@�\          �F�����Z���v�Z���f�[�^�擾                                                                       */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt030SelList (
   InStrSyainCD      IN       QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE   --���o�L�[  �Ј��R�[�h
  ,InStrSeiKBN       IN       CHAR                                --          ���Z�敪
  ,InStrSeiYMD       IN       CHAR                                --          ���Z�N����
  ,InStrStrYMD1      IN       CHAR                                --          �����J�n���P
  ,InStrStrYMD2      IN       CHAR                                --          �����J�n���Q
  ,InStrStrYMD3      IN       CHAR                                --          �����J�n���R
  ,InStrEndYMD       IN       CHAR                                --          �����I����
  ,InStrShoYYYY      IN       CHAR                                --          �����N�x
  ,InNumMaxRec       IN       NUMBER                              --�ő�z��i�[����
  ,IoNumCursor       IN OUT   NUMBER                              --�J�[�\���h�c
  ,OtNumRecCount        OUT   NUMBER                              --����������
  ,OtNumAryCount        OUT   NUMBER                              --�z��i�[����
  ,OtStrEndFlg          OUT   VARCHAR2                            --�����I���t���O
  ,OtStrYMD             OUT   typOtYMDAry                         --�N����
  ,OtStrKBN             OUT   typOtKBNAry                         --�敪
  ,OtNumYusiKin         OUT   typOtYusiKinAry                     --�Z�����z
  ,OtNumHenKin          OUT   typOtHenKinAry                      --�ԍϋ��z
  ,OtNumGanKin          OUT   typOtGanKinAry                      --����
  ,OtNumRisoku          OUT   typOtRisokuAry                      --����
  ,OtStrZandaka         OUT   typOtZandakaAry                     --�c��
/* ADD 20100225 0908047 NBC ISHIDA START */
  ,OtNumGanKinMod       OUT   NUMBER                              --����߂�����
  ,OtNumRisokuMod       OUT   NUMBER                              --����߂�����
/* ADD 20100225 0908047 NBC ISHIDA END */
  ,InStrUserID       IN       QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM   IN       QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --�R���s���[�^��

  /* �����ŗL�̕ϐ� */
  StrSQL                      VARCHAR2(1000);
  v_CursorID                  NUMBER := 0;
  v_NumCount                  NUMBER;
  v_Dummy                     INTEGER;
  NumIdx                      NUMBER;
/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--  v_Zaimu                     QPAB_JISYAM.QPAB_ZAIMUKYOKUCD%TYPE;
--  v_Syozai                    QPAB_JISYAM.QPAB_SYOZAICHI%TYPE;
--  v_Kaisya                    QPAB_JISYAM.QPAB_KAISYANM%TYPE;
--  v_Bank                      QPAB_JISYAM.QPAB_FURIKOMIBK%TYPE;
--  v_KozaNo                    QPAB_JISYAM.QPAB_KOZANO%TYPE;
--  v_KozaNm                    QPAB_JISYAM.QPAB_KOZANM%TYPE;
	v_Zaimu						QPB9_FURIKOMISKM.QPB9_SYOZAICHI1%TYPE;
	v_Syozai					QPB9_FURIKOMISKM.QPB9_SYOZAICHI2%TYPE;
	v_Kaisya					QPB9_FURIKOMISKM.QPB9_KAISYANM%TYPE;
	v_Bank						QPB9_FURIKOMISKM.QPB9_FURIKOMIBK%TYPE;
	v_KozaNo					QPB9_FURIKOMISKM.QPB9_KOZANO%TYPE;
	v_KozaNm					QPB9_FURIKOMISKM.QPB9_KOZANM%TYPE;
/* MOD 20100827 1004091 IMZ SHIBUTANI END */
  v_SimeiKanji                QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_MiseNM                    QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BonusYMD1                 CHAR(8);
  v_BonusYMD2                 CHAR(8);
  w_BonusYMD1                 CHAR(4);
  w_BonusYMD2                 CHAR(4);
  v_KeiyakuRiritu             NUMBER;
  v_NextRirituYMD             CHAR(8);
  v_KyuyoHensai               NUMBER;
  v_SyoyoHensai               NUMBER;
  v_NextHensaiYMD             CHAR(8);
  w_YMD                       CHAR(8);
  w_YMD1                      CHAR(8);
  w_YMD2                      CHAR(8);
  w_IntSyoFLG                 CHAR(1);
  v_BonusFLG                  CHAR(1);
  v_SihaFLG                   BOOLEAN;
  w_IDX                       NUMBER := 0;
  w_IDX1                      NUMBER := 0;
  w_IDX2                      NUMBER := 0;
  w_IDX3                      NUMBER := 0;
  w_IDX4                      NUMBER := 0;
  w_IDX5                      NUMBER := 0;
  v_Zandaka                   NUMBER;
  v_ZenYMD                    CHAR(8);
  v_ZenZandaka                NUMBER;
  w_ZenYMD                    CHAR(8);
  w_KonYMD                    CHAR(8);
  w_Zan                       NUMBER;
  w_GenZan                    NUMBER;
  w_ZenZan                    NUMBER;
  s_Hensai                    NUMBER;
  v_DateCnt                   NUMBER;
  w_Risoku                    NUMBER;
  v_Hensai                    NUMBER;
  v_KBN                       CHAR(1);
  v_YMD                       CHAR(8);
  v_Kingaku                   NUMBER;
  k_Date                      CHAR(8);
  t_Date                      CHAR(8);
  RisokuAry                   typeRisokuAry;
  z_YMD                       QPAI_KGCKEISANW.QPAI_YMD%TYPE;
  z_KBN                       QPAI_KGCKEISANW.QPAI_KBN%TYPE;
  z_YusiKingaku               QPAI_KGCKEISANW.QPAI_YUSIKINGAKU%TYPE;
  z_HensaiKingaku             QPAI_KGCKEISANW.QPAI_HENSAIKINGAKU%TYPE;
  z_Gankin                    QPAI_KGCKEISANW.QPAI_GANKIN%TYPE;
  z_Risoku                    QPAI_KGCKEISANW.QPAI_RISOKU%TYPE;
  z_Zandaka                   QPAI_KGCKEISANW.QPAI_ZANDAKA%TYPE;

  v_SysCng2                   CHAR(8) := '20011101';          -- 10/24 ADD
  v_SysCng3                   CHAR(8) := '20011201';          -- 11/01 ADD
  /* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
  v_SysCng4                   CHAR(8) := '20080301';
  /* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
  v_KeiyakuRiritu2            NUMBER;                         -- 10/24 ADD

  v_NyuYMD_N                  CHAR(8);      --�����p          -- 11/01 ADD

--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή�
  v_ZanZeroFlg                CHAR(1):= '0'; --0:OFF 1ON:     -- 12/05 ADD
--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή��@�����܂�

--2003/01/23 �����v�Z�C��
	W_CNT					NUMBER;
	W_ENDLOOPCNT			NUMBER;
	v_GetRiritu				NUMBER;
	v_GetRiritu2			NUMBER;
	v_STARTRiritu			NUMBER;
	v_ENDRiritu				NUMBER;
	strworkwork				NUMBER;

	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
	v_Kangaku				QPAA_KOJOT.QPAA_KANGAKU%TYPE;
	v_RIsoku				QPAA_KOJOT.QPAA_RISOKU%TYPE;
	v_Kojogaku				QPA4_KGCKOJOT.QPA4_KOJOGAKU%TYPE;
	v_QPAI_SEQ				NUMBER;							--�v�Z���\�����ԗp�V�[�P���X
	w_QPAI_SEQ				CHAR(3);
	v_SysDate				CHAR(8);
	v_KojoFlg 				BOOLEAN;						--�T���f�[�^����p�t���O
	v_Max_Syouyo			QSA2_SCODET.QSA2_MEI%TYPE;		--�ŐV�ܗ^�T���N��
	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA STERT */
	v_kojocyushiFlg         CHAR(1);                        --�T�����~�t���O
	v_TogetuKojoFlg         BOOLEAN := False;               --�������^�T������t���O
	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

	/*ADD 20100129 TR0911-003 NBC ISHIDA START */
	w_TRisoku				NUMBER := 0;                    --��������
	w_YRisoku				NUMBER := 0;                    --��������
	w_KRisoku				NUMBER := 0;                    --�J�z����
	/*ADD 20100129 TR0911-003 NBC ISHIDA END */

/* ADD 20100225 0908047 NBC ISHIDA START */
	v_NyuRisoku             NUMBER := 0;                    --�������̗���
	v_CursorID2             NUMBER := 0;
	v_ModFlg                CHAR(1);                        --0:����߂��A1:����
	v_GanKinMod             NUMBER := 0;                    --����߂�����
	v_RisokuMod             NUMBER := 0;                    --����߂�����
	v_KBN2                  CHAR(4);
	v_BeforeBunkaiYMD       CHAR(8):= ' ';                  --�O��QPAI��INSERT�������������
/* ADD 20100225 0908047 NBC ISHIDA END */


BEGIN

/* ----- �r�s�d�o�P �v�s�f�[�^�쐬 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    OtstrEndFlg   := '0';
    OtNumRecCount := 0;
    OtNumAryCount := 0;
    v_NumCount    := 0;
    w_IDX         := 1;

    /* �����z��̏����� */
    LOOP
      IF w_IDX > 80 THEN
        EXIT;
      END IF;
      RisokuAry(w_IDX) := 0;
      w_IDX := w_IDX + 1;
    END LOOP;

/* MOD 20100827 1004091 IMZ SHIBUTANI START */
--	�U������̎擾��ύX
--	�����Ѓ}�X�^���U����}�X�^
--    /* ���Ѓ}�X�^���� */
--    BEGIN
--        SELECT
--            NVL(QPAB_ZAIMUKYOKUCD,' '),
--            NVL(QPAB_SYOZAICHI,' '),
--            NVL(QPAB_KAISYANM,' '),
--            NVL(QPAB_FURIKOMIBK,' '),
--            NVL(QPAB_KOZANO,' '),
--            NVL(QPAB_KOZANM,' ')
--        INTO
--            v_Zaimu,
--            v_Syozai,
--            v_Kaisya,
--            v_Bank,
--            v_KozaNo,
--            v_KozaNm
--        FROM QPAB_JISYAM
--        WHERE QPAB_PRMKAISYACD = '01';
--    EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            v_Zaimu   := ' ';
--            v_Syozai  := ' ';
--            v_Kaisya  := ' ';
--            v_Bank    := ' ';
--            v_KozaNo  := ' ';
--            v_KozaNm  := ' ';
--        WHEN OTHERS THEN
--            RAISE;
--    END;

	BEGIN
		SELECT
			 NVL(QPB9_SYOZAICHI1, ' ')
			,NVL(QPB9_SYOZAICHI2, ' ')
			,NVL(QPB9_KAISYANM, ' ')
			,NVL(QPB9_FURIKOMIBK, ' ')
			,NVL(QPB9_KOZANO, ' ')
			,NVL(QPB9_KOZANM, ' ')
		INTO
			 v_Zaimu
			,v_Syozai
			,v_Kaisya
			,v_Bank
			,v_KozaNo
			,v_KozaNm
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
			AND	QPAC_PRMSYAINCD2	= InStrSyainCD
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
			v_Bank    := ' ';
			v_KozaNo  := ' ';
			v_KozaNm  := ' ';
		WHEN OTHERS THEN
			RAISE;
	END;

/* MOD 20100827 1004091 IMZ SHIBUTANI END */

--    StrSQL := NULL;
--    StrSQL := StrSQL || 'SELECT';
--    StrSQL := StrSQL || ' NVL(QPAB_ZAIMUKYOKUCD,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_SYOZAICHI,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KAISYANM,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_FURIKOMIBK,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KOZANO,'' ''),';
--    StrSQL := StrSQL || ' NVL(QPAB_KOZANM,'' '')';
--    StrSQL := StrSQL || ' FROM QPAB_JISYAM';
--    StrSQL := StrSQL || ' WHERE QPAB_PRMKAISYACD = :Code';
    /* ���I�J�[�\���̃I�[�v�� */
--    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
--    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', '01');
    /* �o�͕ϐ��̃o�C���h */
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zaimu,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Syozai,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kaisya,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Bank,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_KozaNo,40);
--    DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_KozaNm,40);
    /* SQL�̎��s */
--    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
--    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zaimu);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Syozai);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kaisya);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Bank);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_KozaNo);
--      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_KozaNm);
--    END IF;
    /* �J�[�\���̃N���[�Y */
--    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �Ј��}�X�^���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAC_SYAINM.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAE_MISEM.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAC_SYAINM,QPAE_MISEM';
    StrSQL := StrSQL || ' WHERE QPAC_SYAINM.QPAC_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_PRMSYAINCD2 = :Code2';
--    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND QPAC_SYAINM.QPAC_MISECD = QPAE_MISEM.QPAE_PRMMISECD';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_BonusYMD2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_BonusYMD2);
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �ܗ^�x�����𓖔N�N�����ɕύX */
    v_BonusYMD1 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD1));
    v_BonusYMD2 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD2));
    IF TO_DATE(v_BonusYMD1,'YYYYMMDD') > TO_DATE(v_BonusYMD2,'YYYYMMDD') THEN
        v_BonusYMD1 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD2));
        v_BonusYMD2 := InStrShoYYYY || RTRIM(LTRIM(w_BonusYMD1));
    END IF;

    /* �_�񗘗� */
    w_YMD := TO_CHAR(TO_DATE(InStrStrYMD2,'YYYYMMDD') + 1,'YYYYMMDD');
    v_KeiyakuRiritu  :=  QPAP_CEnt030GetRiritu(w_YMD);
    v_KeiyakuRiritu  :=  v_KeiyakuRiritu / 100;
    v_KeiyakuRiritu2 :=  TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;    -- 10/24 UPD

    /* ���񗘗��ύX�� */
    v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(w_YMD);
    /* ���^�ԍϋ��z */
    v_KyuyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'1',SUBSTR(InStrStrYMD1,1,6));
    /* �ܗ^�ԍϋ��z */
    v_SyoyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'2',SUBSTR(InStrStrYMD1,1,6));
    /* ����ԍϊz�ύX�� */
    v_NextHensaiYMD := QPAP_CEnt030GetHensaiYMD(InStrSyainCD,SUBSTR(InStrStrYMD1,1,6));

    IF TO_NUMBER(SUBSTR(v_BonusYMD1,7,2)) > 25 OR TO_NUMBER(SUBSTR(v_BonusYMD2,7,2)) > 25 THEN
        w_IntSyoFLG := '0';
    ELSE
        w_IntSyoFLG := '1';
    END IF;

   /* 11/01 ADD �����͈͎w��p�ɒǉ�*/
    v_NyuYMD_N := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD2,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01';

	/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
	/* �ŐV�ܗ^���̎擾 */
	/* �ŐV�ܗ^�T���N���̎擾 */
    SELECT    NVL(QSA2_MEI,'000000')
      INTO    v_Max_Syouyo
      FROM    QSA2_SCODET
     WHERE    QSA2_PRMCODEKBN  = 'DP3'
       AND    QSA2_PRMCODENO   = '0000';

	/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
	/* �T�����~�t���O�̎擾                                      */

	SELECT
		NVL(QPA1_KOJOCYUSHIFLG,'0')
	INTO
		v_kojocyushiFlg
	FROM  QPA1_KGCDAICYOT
	WHERE QPA1_PRMSYAINCD1 = ' '
	AND   QPA1_PRMSYAINCD2 = InStrSyainCD;

	/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

  /**************************/
  /* �v�s�e�[�u���̏�����   */
  /**************************/
    DELETE FROM QPAS_KGCW
        WHERE QPAS_USERID = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAI_KGCKEISANW
        WHERE QPAI_USERID = InStrUserID
        AND QPAI_COMPUTERNM = InStrComputerNM;

  /**************************/
  /* �����ޔ��e�[�u���ɑޔ� */
  /**************************/
    /* �ݕt */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  ' ',
        NVL(QPA6_SYAINCD,' '),
        '1',
        TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD'),
        NVL(QPA6_KINGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA6_KGCKASITUKET
      WHERE QPA6_SYAINCD = InStrSyainCD
      AND (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') BETWEEN InStrStrYMD2 AND InStrEndYMD)
      AND (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');

    /* ���� */
    IF TO_DATE(InStrStrYMD1,'YYYYMMDD') - 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN               -- 11/01 UPD
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
          SELECT  NVL(QPA5_SYAINCD1,' '),
            NVL(QPA5_SYAINCD2,' '),
            '2',
            TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
            NVL(QPA5_NYUKINGAKU,0),
            InStrUserID,
            InStrComputerNM
          FROM QPA5_KGCNYUKINT
          WHERE QPA5_SYAINCD1 = ' '
          AND QPA5_SYAINCD2 = InStrSyainCD
          AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') BETWEEN v_NyuYMD_N AND InStrEndYMD;
    ELSE
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
          SELECT  NVL(QPA5_SYAINCD1,' '),
            NVL(QPA5_SYAINCD2,' '),
            '2',
            TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
            NVL(QPA5_NYUKINGAKU,0),
            InStrUserID,
            InStrComputerNM
          FROM QPA5_KGCNYUKINT
          WHERE QPA5_SYAINCD1 = ' '
          AND QPA5_SYAINCD2 = InStrSyainCD
          AND TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') BETWEEN InStrStrYMD2 AND InStrEndYMD;
    END IF;

    w_YMD1 := SUBSTR(InStrStrYMD1,1,6) || '25';
--    w_YMD2 := InStrSeiYMD;                       -- 11/02 UPD
    w_YMD2 := InStrEndYMD;                         -- 11/02 UPD
    LOOP
--     IF TO_DATE(w_YMD1) > TO_DATE(w_YMD2) THEN                               -- 11/02 UPD
      IF TO_NUMBER(SUBSTR(w_YMD1,1,6)) > TO_NUMBER(SUBSTR(w_YMD2,1,6)) THEN    -- 11/02 UPD
          EXIT;
      END IF;

      /* �ԍϊz�̎Q�� */
      IF v_NextHensaiYMD <> 'NOTHIN' then
          IF TO_NUMBER(v_NextHensaiYMD) <= TO_NUMBER(SUBSTR(w_YMD1,1,6)) THEN
              /* ���^�ԍϋ��z */
              v_KyuyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'1',SUBSTR(w_YMD1,1,6));
              /* �ܗ^�ԍϋ��z */
              v_SyoyoHensai := QPAP_CEnt030GetHensaigaku(InStrSyainCD,'2',SUBSTR(w_YMD1,1,6));
              /* ���񗘗��ύX�� */
              v_NextHensaiYMD := QPAP_CEnt030GetHensaiYMD(InStrSyainCD,SUBSTR(w_YMD1,1,6));
          END IF;
      END IF;

      /* ���^�ԍϊz */
      INSERT INTO QPAS_KGCW
        (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      VALUES
        (' ',InStrSyainCD,'3',w_YMD1,v_KyuyoHensai,InStrUserID,InStrComputerNM);

      /* �ܗ^�ԍϊz */
      IF TO_NUMBER(SUBSTR(w_YMD1,5,2)) = TO_NUMBER(SUBSTR(v_BonusYMD1,5,2)) THEN
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
        VALUES
          (' ',InStrSyainCD,'4',SUBSTR(w_YMD1,1,4) || SUBSTR(v_BonusYMD1,5,4),v_SyoyoHensai,InStrUserID,InStrComputerNM);
      END IF;
      IF TO_NUMBER(SUBSTR(w_YMD1,5,2)) = TO_NUMBER(SUBSTR(v_BonusYMD2,5,2)) THEN
        INSERT INTO QPAS_KGCW
          (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
        VALUES
          (' ',InStrSyainCD,'4',SUBSTR(w_YMD1,1,4) || SUBSTR(v_BonusYMD2,5,4),v_SyoyoHensai,InStrUserID,InStrComputerNM);
      END IF;

      w_YMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(w_YMD1,'YYYYMMDD'),1),'YYYYMMDD');

    END LOOP;

/* ADD 20100225 0908047 NBC ISHIDA START */
    /* ���� */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT NVL(QPB2_SYAINCD1,' '),
        NVL(QPB2_SYAINCD2,' '),
        '5',
        TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD'),
        '0',
        InStrUserID,
        InStrComputerNM
      FROM QPB2_BUNKAI
      WHERE QPB2_SYAINCD1  = ' '
      AND   QPB2_SYAINCD2  = InStrSyainCD
      AND   QPB2_SYUBETU   = '1'
      AND   QPB2_BUNMODFLG = '1'
      AND  (TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD') >= InStrStrYMD1 AND TO_CHAR(QPB2_BUNKAIYMD,'YYYYMMDD') <= InStrEndYMD);
/* ADD 20100225 0908047 NBC ISHIDA END */


    /* �R�~�b�g */
    COMMIT;

  /****************************/
  /* �J�z�����̎擾           */
  /****************************/

    /* ���^�J�z���z�Q�� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '3');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrStrYMD3);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_Zandaka);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    IF  DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_Zandaka);
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    IF v_Zandaka IS NULL THEN
        v_Zandaka := 0;
    END IF;

    /* �����J�n���R�̑O�������߂� */
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),-1),'YYYYMMDD');

    /* ���^�J�z�O�����z�Q�� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPA3_ZANDAKA,0)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND QPA3_PRMZANDAKAYMD = (SELECT MAX(QPA3_PRMZANDAKAYMD)';
    StrSQL := StrSQL || ' FROM QPA3_KGCZANDAKAT';
    StrSQL := StrSQL || ' WHERE QPA3_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA3_PRMSYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPA3_PRMYUSIKBN = :KBN';
    StrSQL := StrSQL || ' AND TO_CHAR(QPA3_PRMZANDAKAYMD,''YYYYMMDD'') <= :YMD)';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', '3');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZenYMD);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_ZenZandaka);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

    IF  DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_ZenZandaka);
    END IF;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    IF v_ZenZandaka IS NULL THEN
        v_ZenZandaka := 0;
    END IF;

    w_ZenYMD := InStrStrYMD3;   --�O�񋋗^��
    w_Zan    := v_Zandaka;      --�c��
    w_GenZan := v_Zandaka;      --���c��
    w_ZenZan :=  v_ZenZandaka;  --�O���c��
    s_Hensai := 0;              --�ԍϊz

    w_IDX1 := 1;
    w_IDX2 := 0;

    /* �����ޔ��e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAS_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAS_USERID = :Usr';
    StrSQL := StrSQL || ' AND QPAS_COMPUTERNM = :Cmp';
--**2003/03/06 �C��**
    StrSQL := StrSQL || ' AND QPAS_YMD < :YMD';
--    StrSQL := StrSQL || ' AND QPAS_YMD <= :YMD';
--**2003/03/06 �C��**

    StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN,QPAS_KINGAKU desc';
    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrStrYMD1);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
            EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
        /* �����̎Q�� */
        IF v_NextRirituYMD <> 'NOTHING1' THEN
            IF TO_DATE(v_NextRirituYMD,'YYYYMMDD') <= TO_DATE(v_YMD,'YYYYMMDD') THEN
                /* �_�񗘗� */
                v_KeiyakuRiritu  := QPAP_CEnt030GetRiritu(v_YMD);
                v_KeiyakuRiritu  := v_KeiyakuRiritu / 100;
                v_KeiyakuRiritu2 := TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;         -- 10/24 UPD
                /* ���񗘗��ύX�� */
                v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(v_YMD);
            END IF;
        END IF;

		/* �ݕt */
		w_Risoku := 0;
		IF v_KBN = '1' THEN
			IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_YMD,'YYYYMMDD') THEN
				v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
				IF v_ZenZandaka + v_Kingaku > 0 THEN
					IF v_ZenZandaka >= 0 THEN
						--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;	--�o�ߓ���
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);										--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);								--�W�v�I�����̗������擾
						IF v_STARTRiritu <> v_ENDRiritu THEN												--�����Ⴄ
							W_CNT        := TO_NUMBER(v_YMD);												--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);										--�W�v�I����

							--��2003/01/23��
							--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);								--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;											--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;				--�V�������擾����

								IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + v_Kingaku * v_GetRiritu2 * 1000000;					--�V
								ELSE
									w_Risoku := w_Risoku + (v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;			--��
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���
							END LOOP;

							w_Risoku := TRUNC(w_Risoku);
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--�]���̌v�Z���@
	---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
							ELSE																						-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
							END IF;																						-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					ELSE
						--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;				--�o�ߓ���
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);											--�W�v�I�����̗������擾

						IF v_STARTRiritu <> v_ENDRiritu THEN															--�����Ⴄ
							W_CNT        := TO_NUMBER(v_YMD);															--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);													--�W�v�I����

							--��2003/01/23��
							--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);													--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;																--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;									--�V�������擾����

								IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + v_ZenZandaka) * v_GetRiritu2 * 1000000);			--�V
								ELSE
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + v_ZenZandaka) * v_GetRiritu / 365 * 1000) * 1000;	--��
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(1) := RisokuAry(1) + w_Risoku;
							w_TRisoku := w_TRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--�]���̏���
							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := TRUNC((v_Kingaku + v_ZenZandaka) * v_KeiyakuRiritu2 * v_DateCnt * 1000000);
							ELSE
								w_Risoku := TRUNC((v_Kingaku + v_ZenZandaka) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;
							END IF;
						END IF;
					END IF;
				END IF;
				v_ZenZandaka := v_ZenZandaka + v_Kingaku;
				w_IDX4 := 1;
			ELSE
				t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),1),'YYYYMMDD');
				v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
				IF w_GenZan + v_Kingaku > 0 THEN
					IF w_GenZan >= 0 THEN
--						v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;						--�o�ߓ���

						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);													--�W�v�I�����̗������擾

						IF v_STARTRiritu <> v_ENDRiritu THEN															--�����Ⴄ
							W_CNT        := TO_NUMBER(v_YMD);															--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(t_Date);															--�W�v�I����
							--��2003/01/23��
							--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
							--
							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;														--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;							--�V�������擾����

								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--�]���̏���
	---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN							-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
							ELSE																						-- 10/24 UPD
								w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
							END IF;																						-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					ELSE
						--��2003/01/23��
						--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
						--
						--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;						--�o�ߓ���
						v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD);													--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);													--�W�v�I�����̗������擾

						IF v_STARTRiritu <> v_ENDRiritu THEN															--�����Ⴄ
							W_CNT        := TO_NUMBER(v_YMD);															--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(t_Date);															--�W�v�I����

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);												--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;															--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;								--�V�������擾����

								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + w_GenZan) * v_GetRiritu2 * 1000000);				--�V
								ELSE
									w_Risoku := w_Risoku + TRUNC((v_Kingaku + w_GenZan) * v_GetRiritu / 365 * 1000) * 1000;		--��
								END IF;

								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--���ı���

							END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						ELSE	--�]���̌v�Z���@
	---						w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN									-- 10/24 UPD
								w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
							ELSE																								-- 10/24 UPD
								w_Risoku := TRUNC((v_Kingaku + w_GenZan) * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;	-- 10/24 UPD
							END IF;																								-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
--							RisokuAry(2) := RisokuAry(2) + w_Risoku;
							w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
						END IF;
					END IF;
				END IF;
				w_GenZan := w_GenZan + v_Kingaku;
				w_IDX4 := 2;
			END IF;
		END IF;

		/* ���� */
		IF v_KBN = '2' THEN
			IF TO_DATE(InStrStrYMD1,'YYYYMMDD') - 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN				-- 11/01 UPD
				v_DateCnt := TO_DATE(InStrStrYMD1,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') - 1;			-- 11/01 UPD
				--��2003/01/23��
				--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
				--
				--v_DateCnt := TO_DATE(InStrStrYMD1,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') - 1;			--�o�ߓ���
				v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);											--�W�v�J�n���̗������擾
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD1 - 1);									--�W�v�I�����̗������擾

				IF v_STARTRiritu <> v_ENDRiritu THEN														--�����Ⴄ
					W_CNT        := TO_NUMBER(v_YMD) + 1;													--�W�v�J�n��
					W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD1) -1;													--�W�v�I����

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
						v_GetRiritu  := v_GetRiritu / 100;												--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--�V�������擾����

						w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
					END LOOP;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(1) := RisokuAry(1) - w_Risoku;												-- 11/01 UPD
--					w_IDX4 := 1;
					w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				ELSE
					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 11/01 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(1) := RisokuAry(1) - w_Risoku;												-- 11/01 UPD
--					w_IDX4 := 1;
					w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				END IF;

			ELSE
				IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_YMD,'YYYYMMDD') THEN
					v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(InStrStrYMD3,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');					--�o�ߓ���
					v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);												--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrStrYMD3);											--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(v_YMD) + 1;														--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(InStrStrYMD3);													--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;														--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);								--�V
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;						--��
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
						END LOOP;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--						RisokuAry(1) := RisokuAry(1) - w_Risoku;
--						w_IDX4 := 1;
						w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
					ELSE	--�]���̏���
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
						IF TO_DATE(InStrStrYMD3,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
						ELSE																						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
						END IF;																						-- 10/24 UPD
	---					RisokuAry(1) := RisokuAry(1) + w_Risoku;													-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--						RisokuAry(1) := RisokuAry(1) - w_Risoku;													-- 10/24 UPD
--						w_IDX4 := 1;
						w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
					END IF;
				ELSE
					t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(InStrStrYMD3,'YYYYMMDD'),1),'YYYYMMDD');
					v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');

					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(v_YMD + 1);											--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);												--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(v_YMD) + 1;													--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(t_Date);														--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
							END IF;
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
						END LOOP;

					ELSE	--�]���̌v�Z���@
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;

---					RisokuAry(2) := RisokuAry(2) + w_Risoku;													-- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--					RisokuAry(2) := RisokuAry(2) - w_Risoku;													-- 10/24 UPD
					w_GenZan := w_GenZan - v_Kingaku;
--					w_IDX4 := 2;
					w_YRisoku := w_YRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
				END IF;
			END IF;
		END IF;
	END LOOP;

    /* �J�z���z��INSERT */
    INSERT INTO QPAI_KGCKEISANW VALUES (
         NVL(InStrSyainCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_SimeiKanji,' ')
        ,NVL(InStrStrYMD1,' ')
		/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
		/* 1�`3���F�V�[�P���X�ԍ�,4���F�敪 */
--        ,'1�J'
		,'0001'
		/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NVL(w_GenZan,0)
        ,NVL(InStrSeiKBN,' ')
        ,NVL(v_Zaimu,' ')
        ,NVL(v_Syozai,' ')
        ,NVL(v_Kaisya,' ')
        ,NVL(v_Bank,' ')
        ,NVL(v_KozaNo,' ')
        ,NVL(v_KozaNm,' ')
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));

    /****************************/
    /* ���׋��z�̎擾           */
    /****************************/

    w_IDX1 := w_IDX1 + 1;
    w_IDX2 := w_IDX2 + 1;

	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
	v_QPAI_SEQ  := 1;
	SELECT TO_CHAR(sysdate,'YYYYMMDD') INTO v_SysDate FROM DUAL;
	/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

    /* �����Z���ޔ��e�[�u������ */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAS_KBN,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_YMD,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAS_KINGAKU,0)';
    StrSQL := StrSQL || ' FROM QPAS_KGCW';
    StrSQL := StrSQL || ' WHERE QPAS_SYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPAS_SYAINCD2 = :Code2';
    StrSQL := StrSQL || ' AND QPAS_USERID = :Usr';
    StrSQL := StrSQL || ' AND QPAS_COMPUTERNM = :Cmp';
--2003/03/06 �C��
    StrSQL := StrSQL || ' AND (QPAS_YMD >= :YMD1';
--    StrSQL := StrSQL || ' AND (QPAS_YMD > :YMD1';
--2003/03/06 �C��
    StrSQL := StrSQL || ' AND QPAS_YMD <= :YMD2)';

--2001/12/06 �����s���Ή�
    StrSQL := StrSQL || ' ORDER BY QPAS_YMD, QPAS_KBN, QPAS_KINGAKU desc';
--    StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';  --del
--2001/12/06 �����s���Ή� �����܂�

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrStrYMD1);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrEndYMD);
    /* �o�͕ϐ��̃o�C���h */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_YMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
            EXIT;
        END IF;

		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
		/* �v�Z���\���p�V�[�P���X�ԍ��𕶎���ɕϊ� */
		w_QPAI_SEQ := TO_CHAR(v_QPAI_SEQ,'FM000');
		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
        /* �����̎Q�� */
        IF v_NextRirituYMD <> 'NOTHING1' THEN
            IF TO_DATE(v_NextRirituYMD,'YYYYMMDD') <= TO_DATE(v_YMD,'YYYYMMDD') THEN
               /* �_�񗘗� */
               v_KeiyakuRiritu  := QPAP_CEnt030GetRiritu(v_YMD);
               v_KeiyakuRiritu  := v_KeiyakuRiritu / 100;
               v_KeiyakuRiritu2 := TRUNC(v_KeiyakuRiritu / 365 * 1000000) / 1000000;   -- 10/24 UPD
               /* ���񗘗��ύX�� */
               v_NextRirituYMD := QPAP_CEnt030GetRirituYMD(v_YMD);
            END IF;
        END IF;

		/* �ݕt */
		IF v_KBN = '1' THEN
			IF w_Zan = 0 THEN
				IF w_IDX1 > 1 THEN
					w_IDX2 := w_IDX1 - 1;
				END IF;
			END IF;
			w_GenZan := w_GenZan + v_Kingaku;
			IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
				t_Date := SUBSTR(v_YMD,1,6) || '25';
				k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
			ELSE
				k_Date := SUBSTR(v_YMD,1,6) || '25';
			END IF;
			IF InStrSeiKBN = '0' THEN
				IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
					k_Date := InStrSeiYMD;
				END IF;
			END IF;
			t_Date := v_YMD;
			v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
			w_Risoku := 0;
			IF w_GenZan > 0 THEN
				IF w_GenZan >= v_Kingaku THEN
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date);												--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date);														--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);				--�V
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;		--��
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���

						END LOOP;
					ELSE	--�]���̏���
---						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;

				ELSE
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD') + 1;
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date);												--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date);														--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(w_GenZan * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(w_GenZan * v_GetRiritu / 365 * 1000) * 1000;
							END IF;
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
						END LOOP;

					ELSE	--�]���̏���
	---					w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(w_GenZan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;
				END IF;
			END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
--                t_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
--            END IF;
--            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 1;
--            RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) + w_Risoku;
            w_YRisoku := w_YRisoku + w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

            /* ���ׂ�INSERT */
            INSERT INTO QPAI_KGCKEISANW VALUES (
                 NVL(InStrSyainCD,' ')
                ,NVL(v_MiseNM,' ')
                ,NVL(v_SimeiKanji,' ')
                ,NVL(v_YMD,' ')
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--                ,'4��'
                ,w_QPAI_SEQ || '4'
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
                ,NVL(v_Kingaku,0)
                ,NULL
                ,NULL
                ,NULL
                ,NVL(w_GenZan,0)
                ,NVL(InStrSeiKBN,' ')
                ,NVL(v_Zaimu,' ')
                ,NVL(v_Syozai,' ')
                ,NVL(v_Kaisya,' ')
                ,NVL(v_Bank,' ')
                ,NVL(v_KozaNo,' ')
                ,NVL(v_KozaNm,' ')
                ,NVL(InStrUserID,' ')
                ,NVL(InStrComputerNM,' '));

		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
		v_QPAI_SEQ := v_QPAI_SEQ +1;
		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

        END IF;
        /* ���� */
        IF v_KBN = '2' THEN

--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή�
            IF TO_DATE(v_YMD,'YYYYMMDD')  >= TO_DATE('20011025','YYYYMMDD') AND                         -- 12/05 UPD
               TO_DATE(v_YMD,'YYYYMMDD')  <= TO_DATE('20011031','YYYYMMDD') THEN                        -- 12/05 UPD
                w_GenZan      := 0;                                                                     -- 12/05 UPD
                w_Risoku      := 0;                                                                     -- 12/05 UPD
                w_Zan         := 0;                                                                     -- 12/05 UPD
                v_ZanZeroFlg  := '1';                                                                   -- 12/05 UPD
            ELSE                                                                                        -- 12/05 UPD
                w_GenZan := w_GenZan -v_Kingaku;                                                        -- 12/05 UPD
				/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
				/* 26���`�����ɓ��������������Ɏc�������炷�Ή�              */
				IF SUBSTR(v_YMD,7,2) >= '26' THEN
					w_Zan := w_GenZan;
				END IF;
				/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
            END IF;                                                                                     -- 12/05 UPD
--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή��@�����܂�


			t_Date := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_YMD,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01';  -- 11/01 ADD
			k_Date := TO_CHAR(TO_DATE(t_Date,'YYYYMMDD') - 1,'YYYYMMDD');                               -- 11/01 ADD
			IF TO_DATE(k_Date,'YYYYMMDD') + 1 >= TO_DATE(v_SysCng3,'YYYYMMDD') THEN                     -- 11/01 ADD
				IF InStrSeiKBN = '0' THEN
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
						k_Date := InStrSeiYMD;
					END IF;
				END IF;
				t_Date := v_YMD;
				v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
				w_Risoku := 0;
				IF w_GenZan > 0 THEN
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--�o�ߓ�����
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);												--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date) + 1;													--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���

						END LOOP;
					ELSE
						w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);
					END IF;
				END IF;
				v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(TO_CHAR(TO_DATE(InStrStrYMD1,'YYYYMMDD')- 1,'YYYYMMDD'),1,6),'YYYYMM'))) + 1;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--				RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
				w_YRisoku := w_YRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			ELSE
				IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
					t_Date := SUBSTR(v_YMD,1,6) || '25';
					k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(t_Date,'YYYYMMDD'),1),'YYYYMMDD');
				ELSE
					k_Date := SUBSTR(v_YMD,1,6) || '25';
				END IF;

				IF InStrSeiKBN = '0' THEN
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
						k_Date := InStrSeiYMD;
					END IF;
				END IF;

				t_Date := v_YMD;
				v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
				w_Risoku := 0;

				IF w_GenZan > 0 THEN
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);												--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

					IF v_STARTRiritu <> v_ENDRiritu THEN
						W_CNT        := TO_NUMBER(t_Date) + 1;													--�W�v�J�n��
						W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

						LOOP
							IF W_CNT > W_ENDLOOPCNT THEN
								EXIT;
							END IF;

							v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
							v_GetRiritu  := v_GetRiritu / 100;													--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu2 * 1000000);
							ELSE
								w_Risoku := w_Risoku + TRUNC(v_Kingaku * v_GetRiritu / 365 * 1000) * 1000;
							END IF;

							w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
						END LOOP;
					ELSE	--�]���̏���
	---					w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
						IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
						ELSE																					-- 10/24 UPD
							w_Risoku := TRUNC(v_Kingaku * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
						END IF;																					-- 10/24 UPD
					END IF;
				END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
				IF TO_NUMBER(SUBSTR(v_YMD,7,2)) > 25 THEN
--					v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 2;
				w_TRisoku := w_TRisoku - w_Risoku;
				ELSE
--					v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) + 1;
				w_YRisoku := w_YRisoku - w_Risoku;
				END IF;
--				RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			END IF;

/* ADD 20100225 0908047 NBC ISHIDA START */
			/********************************************************/
			/* �����������̕�������(����)�œ������ꂽ�萔�����擾�� */
			/* �v�Z���ŕ\������                                     */
			/********************************************************/
			BEGIN
				SELECT NVL(QPB5_RISOKU,0)
				INTO v_NyuRisoku
				FROM QPB5_BUNKAIRSK
				WHERE Nvl(QPB5_SYAINCD1,' ') = ' '
				AND   QPB5_SYAINCD2 = InStrSyainCD
				AND   QPB5_SYUBETU  = '1'
				AND   TO_CHAR(QPB5_NYUKINYMD,'YYYYMMDD') = v_YMD;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_NyuRisoku := 0;
				WHEN OTHERS THEN
					RAISE;
			END;
/* ADD 20100225 0908047 NBC ISHIDA END */

            /* ���ׂ�INSERT */
            INSERT INTO QPAI_KGCKEISANW VALUES (
                 NVL(InStrSyainCD,' ')
                ,NVL(v_MiseNM,' ')
                ,NVL(v_SimeiKanji,' ')
                ,NVL(v_YMD,' ')
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--                ,'5��'
                ,w_QPAI_SEQ || '5'
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
                ,NULL
/* MOD 20100319 TR1003-002 NBC YOKOYAMA START */
--                ,NVL(v_Kingaku,0)
                ,NVL(v_Kingaku,0) + NVL(v_NyuRisoku,0)	--�ԍϋ��z
/* MOD 20100319 TR1003-002 NBC YOKOYAMA END */
                ,NVL(v_Kingaku,0)
/* ADD 20100225 0908047 NBC ISHIDA START */
--                ,NULL
                ,NVL(v_NyuRisoku,0)
/* ADD 20100225 0908047 NBC ISHIDA END */
                ,NVL(w_GenZan,0)
                ,NVL(InStrSeiKBN,' ')
                ,NVL(v_Zaimu,' ')
                ,NVL(v_Syozai,' ')
                ,NVL(v_Kaisya,' ')
                ,NVL(v_Bank,' ')
                ,NVL(v_KozaNo,' ')
                ,NVL(v_KozaNm,' ')
                ,NVL(InStrUserID,' ')
                ,NVL(InStrComputerNM,' '));

		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
		v_QPAI_SEQ := v_QPAI_SEQ +1;
		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
        END IF;

		/* ���^�ԍ� */
		IF v_KBN = '3' THEN
			w_ZenYMD := v_YMD;
			t_Date := v_YMD;				--���^��
			k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(v_YMD,'YYYYMMDD'),-1),'YYYYMMDD');
			v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(k_Date,'YYYYMMDD');
			w_Risoku := 0;
			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
			v_Hensai := 0;
			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
			/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
			v_KojoFlg  := False;
			/* �T������2008�N3������A�I�y���[�V�������܂ł�             */
			/* ���^�T���̕ԍϋ��z�Ɨ��������f�[�^����擾����B          */
			IF v_YMD >= v_SysCng4 AND SUBSTR(v_YMD,1,6) <= SUBSTR(v_SysDate,1,6) THEN
				/* ���^�T���z */
				/* �������^�T���̊m�F */
				IF SUBSTR(v_YMD,1,6) = SUBSTR(v_SysDate,1,6) THEN
					BEGIN
						SELECT
							  QPAA_KANGAKU
							 ,QPAA_RISOKU
						INTO
							  v_Kangaku
							 ,v_Risoku
						FROM  QPAA_KOJOT
						WHERE QPAA_SYAINCD1 = ' '
						AND   QPAA_SYAINCD2 = InStrSyainCD
						AND   QPAA_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD')
						AND   QPAA_SYUBETU  = '1'
						AND   QPAA_YUSIKBN  = '3';
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kangaku  := '0';
								v_Risoku  := '0';
								/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--								v_KojoFlg := true;
								v_TogetuKojoFlg := true;
								/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
							  WHEN OTHERS THEN
								RAISE;
					END;

					/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
					IF v_TogetuKojoFlg = False THEN
						v_Hensai := v_Kangaku;
						w_Risoku := v_Risoku;
			            s_Hensai := 0;
			            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--			            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
					END IF;
					/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

				ELSE
					BEGIN
						SELECT
							  QPB0_KANGAKU
							 ,QPB0_RISOKU
						INTO
							  v_Kangaku
							 ,v_Risoku
						FROM  QPB0_KOJORRKT
						WHERE QPB0_SYAINCD1 = ' '
						AND   QPB0_SYAINCD2 = InStrSyainCD
						AND   QPB0_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD')
						AND   QPB0_SYUBETU  = '1'
						AND   QPB0_YUSIKBN  = '3';
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kangaku  := '0';
								v_Risoku  := '0';
								v_KojoFlg := True;
							  WHEN OTHERS THEN
								RAISE;
					END;
				/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--				END IF;
				/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
				v_Hensai := v_Kangaku;
				w_Risoku := v_Risoku;
	            s_Hensai := 0;
	            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--	            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
				END IF;
			END IF;
			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

			/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--			ELSE
			/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START            */
--			/************************************************************************/-
--			/* ���^�T������2008�N3�����O�A�܂��́A�����ȍ~�ōT�����~�ł͂Ȃ��ꍇ  */
--			/* �܂��́A�����T���f�[�^���Ȃ��A�T�����~�ł͂Ȃ��ꍇ�A                 */
--			/* �V�~�����[�V�����Ōv�Z                                               */
--			/************************************************************************/
--			IF v_YMD < v_SysCng4 OR (SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg <> '1')
--			   OR (v_TogetuKojoFlg = True AND v_kojocyushiFlg <> '1') THEN
--			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
			/************************************************************************/
			/*���L�����̎��A�V�~�����[�V�����ŗ����̌v�Z���s��                      */
			/*1.���^�T������2008�N3���ȑO                                           */
			/*2.���^�T�������I�y���̗����ȍ~                                        */
			/*3.�������^�T�����������Ă��Ȃ���(1������5���T�����\������Ȃ���Q�Ή�)*/
			/************************************************************************/
			IF  v_YMD < v_SysCng4 OR SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6)
				OR v_TogetuKojoFlg = True THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

				IF w_Zan > 0 THEN
					--��2003/01/23��
					--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
					--
					--v_DateCnt := TO_DATE(t_Date,'YYYYMMDD') - TO_DATE(k_Date,'YYYYMMDD');
					v_STARTRiritu := QPAP_CEnt030GetRiritu(k_Date + 1);											--�W�v�J�n���̗������擾
					v_ENDRiritu   := QPAP_CEnt030GetRiritu(t_Date);												--�W�v�I�����̗������擾

					IF k_Date = '20021225' AND t_Date = '20030125' THEN
						--2002/12/26 �` 2003/01/25�Ԃ̌v�Z��2002/12/26���_�ł̗����Ōv�Z����(�C�����_�Ŋ��ɒ��߂Ă��܂�����)
						v_GetRiritu  := v_STARTRiritu;														--�������擾����
						v_GetRiritu  := v_GetRiritu / 100;													--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

						IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * v_DateCnt * 1000000);
						ELSE
							w_Risoku := TRUNC(w_Zan * v_GetRiritu * v_DateCnt / 365 * 1000) * 1000;
						END IF;
					ELSE
						IF t_Date = '20030225' THEN
							v_GetRiritu := '7.5';												--2003/02/25���^�̎c���Z�o�Ɍ���A���߂�1���c���ɔ��f�ł��Ȃ�����
							v_GetRiritu  := v_GetRiritu / 100;									--�����̌v�Z���s��
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--
							w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * 6 * 1000000);
							v_GetRiritu := '5.9';
							v_GetRiritu  := v_GetRiritu / 100;									--
							v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 25 * 1000000);	--
						ELSE
							IF v_STARTRiritu <> v_ENDRiritu THEN
								W_CNT        := TO_NUMBER(k_Date) + 1;													--�W�v�J�n��
								W_ENDLOOPCNT := TO_NUMBER(t_Date);														--�W�v�I����

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;
									END IF;

									v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
									v_GetRiritu  := v_GetRiritu / 100;													--
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

									IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
										w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
									ELSE
										w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
									END IF;

									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
								END LOOP;
							ELSE	--�]���̏���
				---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);					-- 10/24 UPD
								IF TO_DATE(t_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
									w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);					-- 10/24 UPD
								ELSE																					-- 10/24 UPD
									w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;			-- 10/24 UPD
								END IF;																					-- 10/24 UPD
							END IF;
						END IF;
					END IF;
				END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--	            v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
--	            w_Risoku := w_Risoku + RisokuAry(v_DateCnt);
	---         w_Risoku := TRUNC(w_Risoku / 1000);      -- 10/24 UPD
--	            w_Risoku := TRUNC(w_Risoku / 1000000);   -- 10/24 UPD
                w_Risoku      := w_Risoku + w_TRisoku;
                w_Risoku      := TRUNC(w_Risoku / 1000000);
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
	            IF (w_Zan - s_Hensai) > (v_Kingaku - w_Risoku) THEN
	                v_Hensai := v_Kingaku;
	            ELSE
	                IF w_Zan - s_Hensai + w_Risoku > 0 THEN
	                    v_Hensai := w_Zan - s_Hensai + w_Risoku;
	                ELSE
	                    v_Hensai := 0;
	                END IF;
	            END IF;

	            s_Hensai := 0;
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
				IF (v_TogetuKojoFlg = True AND v_kojocyushiFlg <> '1')
				   OR (SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg <> '1') THEN
		            w_GenZan := w_GenZan - (v_Hensai - w_Risoku);
				END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
			END IF;
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
	            v_SihaFLG := False;
	            IF w_Risoku = 0 THEN
	                IF w_Zan <= 0 THEN
	                    v_SihaFLG := True;
	                    w_IDX1 := w_IDX1 - 1;
	                    w_IDX2 := w_IDX2 - 1;
	                END IF;
	            END IF;
	--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή�
	            IF v_ZanZeroFlg = '1' THEN                      -- 12/05 UPD
	                    v_SihaFLG := True;                      -- 12/05 UPD
	                    w_IDX1 := w_IDX1 - 1;                   -- 12/05 UPD
	                    w_IDX2 := w_IDX2 - 1;                   -- 12/05 UPD
	            END IF;
	--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή��@�����܂�

			/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--            w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
--            w_Zan := w_GenZan;
--            w_IDX4 := v_DateCnt;
			/* DEL 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
			IF v_TogetuKojoFlg = True AND v_kojocyushiFlg = '1'
			   OR SUBSTR(v_YMD,1,6) > SUBSTR(v_SysDate,1,6) AND v_kojocyushiFlg = '1' THEN
				v_KojoFlg := true;
			END IF;
			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

/*ADD 20100129 TR0911-003 NBC ISHIDA START */
			IF v_KojoFlg = False THEN
				w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
			END IF;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */
			w_Zan := w_GenZan;

            IF v_SihaFLG = False THEN
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
				IF v_KojoFlg = False THEN
	                /* ���ׂ�INSERT */
	                INSERT INTO QPAI_KGCKEISANW VALUES (
	                     NVL(InStrSyainCD,' ')
	                    ,NVL(v_MiseNM,' ')
	                    ,NVL(v_SimeiKanji,' ')
	                    ,NVL(v_YMD,' ')
						/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
	--                    ,'2��'
	                    ,w_QPAI_SEQ || '2'
						/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
	                    ,NULL
	                    ,NVL(v_Hensai,0)
	                    ,NVL(v_Hensai,0) - NVL(w_Risoku,0)
	                    ,NVL(w_Risoku,0)
	                    ,NVL(w_GenZan,0)
	                    ,NVL(InStrSeiKBN,' ')
	                    ,NVL(v_Zaimu,' ')
	                    ,NVL(v_Syozai,' ')
	                    ,NVL(v_Kaisya,' ')
	                    ,NVL(v_Bank,' ')
	                    ,NVL(v_KozaNo,' ')
	                    ,NVL(v_KozaNm,' ')
	                    ,NVL(InStrUserID,' ')
	                    ,NVL(InStrComputerNM,' '));

					/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

/*ADD 20100129 TR0911-003 NBC ISHIDA START */
					w_TRisoku     := w_YRisoku;
					w_YRisoku     := 0;
					w_KRisoku     := 0;
				ELSE
					w_KRisoku     := w_KRisoku + w_Risoku;
					w_TRisoku     := w_YRisoku;
					w_YRisoku     := 0;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
--					/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--		            w_ZenZan := w_Zan - (v_Hensai - w_Risoku);
--		            w_Zan := w_GenZan;
--		            w_IDX4 := v_DateCnt;
/*DEL 20100129 TR0911-003 NBC ISHIDA END */
					/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
				END IF;
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
/*ADD 20100129 TR0911-003 NBC ISHIDA START */
			ELSE
				w_KRisoku     := w_KRisoku + w_Risoku;
				w_TRisoku     := w_YRisoku;
				w_YRisoku     := 0;
/*ADD 20100129 TR0911-003 NBC ISHIDA END */
            END IF;

        END IF;

        /* �ܗ^�ԍ� */
        IF v_KBN = '4' THEN
            v_BonusFLG := '1';
            IF v_SihaFLG = True THEN
                v_BonusFLG := '0';
                v_SihaFLG := False;
                w_IDX1 := w_IDX1 - 1;
                w_IDX2 := w_IDX2 - 1;
            END IF;
            IF w_ZenZan <= 0 THEN
                v_BonusFLG := '0';
                v_SihaFLG := False;
                w_IDX1 := w_IDX1 - 1;
                w_IDX2 := w_IDX2 - 1;
            END IF;
            IF v_BonusFLG = '1' THEN
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
				v_KojoFlg := False;
				/* �T������2008�N3������A�I�y���[�V�������܂ł�             */
				/* �ܗ^�T���̕ԍϋ��z�����f�[�^����擾����B          */
				IF v_YMD >= v_SysCng4 AND SUBSTR(v_YMD,1,6) <= v_Max_Syouyo THEN
					BEGIN
						SELECT QPA4_KOJOGAKU
						INTO   v_Kojogaku
						FROM   QPA4_KGCKOJOT
						WHERE  QPA4_SYAINCD1 = ' '
						AND    QPA4_SYAINCD2 = InStrSyainCD
						AND    QPA4_KOJOYMD  = TO_DATE(v_YMD,'YYYYMMDD');
						EXCEPTION
							  WHEN NO_DATA_FOUND THEN
								v_Kojogaku  := '0';
								v_KojoFlg := True;
							  WHEN OTHERS THEN
								RAISE;
					END;
					v_Hensai := v_Kojogaku;

				/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--				ELSE
				/* �T�����~�t���O�������Ă��Ȃ��Ƃ��́A�V�~�����[�V�����Ōv�Z������ */
				ELSIF v_YMD < v_SysCng4 OR (v_YMD >= v_SysCng4 AND v_kojocyushiFlg <> '1') THEN
				/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

	                IF w_ZenZan > v_Kingaku THEN
	                    v_Hensai := v_Kingaku;
	                ELSE
	                    v_Hensai := w_ZenZan;
	                END IF;

				/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
				ELSE
					v_Hensai := 0;
					v_KojoFlg := True;
				/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

				END IF;
                s_Hensai := v_Hensai;
                w_GenZan := w_GenZan - v_Hensai;

				IF v_KojoFlg = False THEN
	/**************************************/
	/* 10/24 UPD �ܗ^�㋋�^���̎w��Ɍ�� */
	--                k_Date := v_YMD;
	--                k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),1),'YYYYMMDD');
	--                k_Date := SUBSTR(k_Date,1,6) || '25';
	--                t_Date := v_YMD;
	                k_Date := v_YMD;
	                t_Date := v_YMD;
	                IF w_IntSyoFLG = '0' THEN
	                    k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),1),'YYYYMMDD');
	                    k_Date := SUBSTR(k_Date,1,6) || '25';
	                ELSE
	                    k_Date := SUBSTR(k_Date,1,6) || '25';
	                END IF;
	/**************************************/
	                IF InStrSeiKBN = '0' THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
/* ���̏����ɖ߂� */
--						/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
----	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
--	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD')
--						   OR v_kojocyushiFlg = '1' THEN
--						/* MOD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
	                    IF TO_DATE(InStrSeiYMD,'YYYYMMDD') < TO_DATE(k_Date,'YYYYMMDD') THEN
/*MOD 20100129 TR0911-003 NBC ISHIDA  */
	                        k_Date := InStrSeiYMD;
	                    END IF;
	                END IF;

					IF w_IntSyoFLG = '0' THEN
						v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');

						--��2003/01/23��
						--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
						--
						--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
						v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);											--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

						IF v_STARTRiritu <> v_ENDRiritu THEN
							W_CNT        := TO_NUMBER(t_Date) + 1;													--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;													--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

								IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu / 365 * 1000) * 1000;
								END IF;
								w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
							END LOOP;
							w_Risoku := TRUNC(w_Risoku);
						ELSE	--�]���̌v�Z���@
		---					w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);								-- 10/24 UPD
							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN									-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu2 * v_DateCnt * 1000000);							-- 10/24 UPD
							ELSE																								-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;					-- 10/24 UPD
							END IF;																								-- 10/24 UPD
						END IF;

						v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM'))) +1;
					ELSE
	--					k_Date := TO_CHAR(ADD_MONTHS(TO_DATE(k_Date,'YYYYMMDD'),-1),'YYYYMMDD');					-- 10/24 DEL
						v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
	---					w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
						--��2003/01/23��
						--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
						--
						--v_DateCnt := TO_DATE(k_Date,'YYYYMMDD') - TO_DATE(t_Date,'YYYYMMDD');
						v_STARTRiritu := QPAP_CEnt030GetRiritu(t_Date + 1);											--�W�v�J�n���̗������擾
						v_ENDRiritu   := QPAP_CEnt030GetRiritu(k_Date);												--�W�v�I�����̗������擾

						IF v_STARTRiritu <> v_ENDRiritu THEN
							W_CNT        := TO_NUMBER(t_Date) + 1;													--�W�v�J�n��
							W_ENDLOOPCNT := TO_NUMBER(k_Date);														--�W�v�I����

							LOOP
								IF W_CNT > W_ENDLOOPCNT THEN
									EXIT;
								END IF;

								v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
								v_GetRiritu  := v_GetRiritu / 100;													--
								v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

								IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu2 * 1000000);
								ELSE
									w_Risoku := w_Risoku + TRUNC(v_Hensai * v_GetRiritu / 365 * 1000) * 1000;
								END IF;
							END LOOP;
							w_Risoku := TRUNC(w_Risoku);
						ELSE	--�]���̏���
							IF TO_DATE(k_Date,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu2 * v_DateCnt * 1000000);				-- 10/24 UPD
							ELSE																					-- 10/24 UPD
								w_Risoku := TRUNC(v_Hensai * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;		-- 10/24 UPD
							END IF;																					-- 10/24 UPD
						END IF;

						v_DateCnt := TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(t_Date,1,6),'YYYYMM'),TO_DATE(SUBSTR(InStrStrYMD3,1,6),'YYYYMM')));
					END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--	                RisokuAry(v_DateCnt) := RisokuAry(v_DateCnt) - w_Risoku;
	                w_TRisoku := w_TRisoku - w_Risoku;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
	                /* ���ׂ�INSERT */
	                INSERT INTO QPAI_KGCKEISANW VALUES (
	                     NVL(InStrSyainCD,' ')
	                    ,NVL(v_MiseNM,' ')
	                    ,NVL(v_SimeiKanji,' ')
	                    ,NVL(v_YMD,' ')
						/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
	--                    ,'3��'
	                    ,w_QPAI_SEQ || '3'
						/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
	                    ,NULL
	                    ,NVL(v_Hensai,0)
	                    ,NVL(v_Hensai,0)
	                    ,NULL
	                    ,NVL(w_GenZan,0)
	                    ,NVL(InStrSeiKBN,' ')
	                    ,NVL(v_Zaimu,' ')
	                    ,NVL(v_Syozai,' ')
	                    ,NVL(v_Kaisya,' ')
	                    ,NVL(v_Bank,' ')
	                    ,NVL(v_KozaNo,' ')
	                    ,NVL(v_KozaNm,' ')
	                    ,NVL(InStrUserID,' ')
	                    ,NVL(InStrComputerNM,' '));

					/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
				END IF;
				/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
            END IF;
        END IF;


/* ADD 20100225 0908047 NBC ISHIDA START */
        /* ���� */
		IF v_KBN = '5' THEN
			/* QPAS�ɓ����������2�������QPAI��4��INSERT�����B3������9�� */
			/* �h�����߂ɓ�����������������ꍇ�͏��������Ȃ�     */
			IF v_BeforeBunkaiYMD <> v_YMD THEN
				v_BeforeBunkaiYMD := v_YMD;

				/* ���������E�����̎擾 */
				StrSQL := NULL;
				StrSQL := StrSQL || 'SELECT';
				StrSQL := StrSQL || ' NVL(QPB2_GANKIN,0),';
				StrSQL := StrSQL || ' NVL(QPB2_RISOKU,0)';
				StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
				StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
				StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
				StrSQL := StrSQL || ' AND QPB2_SYUBETU  = ''1''';
				StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') = :YMD';
				StrSQL := StrSQL || ' ORDER BY QPB2_KOJOYMD';
	
				v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
	
				/* SQL�̉�� */
				DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
	
				/* ���͕ϐ����o�C���h���� */
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', ' ');
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', InStrSyainCD);
				DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_YMD);
	
				/* �o�͕ϐ��̃o�C���h */
				DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_Kangaku);
				DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_Risoku);
	
				/* SQL�̎��s */
				v_Dummy := DBMS_SQL.EXECUTE (v_CursorID2);
				LOOP
	
					IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
						EXIT;
					END IF;
	
					DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_Kangaku);
					DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_Risoku);
	
					/* ���𖾍ׂ�INSERT */
					INSERT INTO QPAI_KGCKEISANW VALUES (
						NVL(InStrSyainCD,' ')
						,NVL(v_MiseNM,' ')
						,NVL(v_SimeiKanji,' ')
						,NVL(v_YMD,' ')
						,w_QPAI_SEQ || '7'
						,NULL
						,NVL(v_Kangaku,0) + NVL(v_Risoku,0)
						,NVL(v_Kangaku,0)
						,NVL(v_Risoku,0)
						,NVL(w_GenZan,0)
						,NVL(InStrSeiKBN,' ')
						,NVL(v_Zaimu,' ')
						,NVL(v_Syozai,' ')
						,NVL(v_Kaisya,' ')
						,NVL(v_Bank,' ')
						,NVL(v_KozaNo,' ')
						,NVL(v_KozaNm,' ')
						,NVL(InStrUserID,' ')
						,NVL(InStrComputerNM,' '));
	
					v_QPAI_SEQ := v_QPAI_SEQ +1;
					w_QPAI_SEQ := TO_CHAR(TO_NUMBER(w_QPAI_SEQ) +1,'FM000');	--@@@@@@@@@@@yoko
				END LOOP;
	
				/* �J�[�\���̃N���[�Y */
				DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
			END IF;
		END IF;
/* ADD 20100225 0908047 NBC ISHIDA END */

    END LOOP;

    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;

  /****************************/
  /* ���Z���z�̎擾           */
  /****************************/

    IF InStrSeiKBN = '0' THEN

		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
		/* �v�Z���\���p�V�[�P���X�ԍ��𕶎���ɕϊ� */
		w_QPAI_SEQ := TO_CHAR(v_QPAI_SEQ,'FM000');
		/* ADD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή�
        IF v_ZanZeroFlg  = '1' THEN                                                   -- 12/05 UPD
           w_GenZan  := 0;                                                            -- 12/05 UPD
           w_Risoku  := 0;                                                            -- 12/05 UPD
           w_Zan     := 0;                                                            -- 12/05 UPD
        END IF;                                                                       -- 12/05 UPD
--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή��@�����܂�

		w_Risoku := 0;
		w_KonYMD := TO_CHAR(ADD_MONTHS(TO_DATE(w_ZenYMD,'YYYYMMDD'),1),'YYYYMMDD'); --���񋋗^��
		IF TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD') > 0 THEN
			v_DateCnt := TO_DATE(w_KonYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
			IF w_Zan > 0 THEN
				--��2003/01/23��
				--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
				--
				--v_DateCnt := TO_DATE(w_KonYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_ZenYMD + 1);											--�W�v�J�n���̗������擾
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(w_KonYMD);												--�W�v�I�����̗������擾

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_ZenYMD) + 1;													--�W�v�J�n��
					W_ENDLOOPCNT := TO_NUMBER(w_KonYMD);														--�W�v�I����

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);											--�������擾����
						v_GetRiritu  := v_GetRiritu / 100;														--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;							--�V�������擾����

						IF TO_DATE(w_KonYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���

					END LOOP;
				ELSE
					--�]���̏���
	---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
					IF TO_DATE(w_KonYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);						-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;				-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			ELSE
				w_Risoku := 0;
			END IF;

			v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD');
			IF w_Zan - s_Hensai > 0 THEN
				--��2003/01/23��
				--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
				--
				--v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_KonYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_KonYMD + 1);											--�W�v�J�n���̗������擾
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrSeiYMD);												--�W�v�I�����̗������擾

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_KonYMD) + 1;													--�W�v�J�n��
					W_ENDLOOPCNT := TO_NUMBER(InStrSeiYMD);														--�W�v�I����

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);										--�������擾����
						v_GetRiritu  := v_GetRiritu / 100;													--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;						--�V�������擾����

						IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;
						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
					END LOOP;
				ELSE	--�]���̏���
	---				w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);				-- 10/24 UPD
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
						w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu2 * v_DateCnt * 1000000);			-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := w_Risoku + TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000) * 1000;	-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			END IF;
		ELSE

/*DEL 20100129 TR0911-003 NBC ISHIDA START */
/* �����Ƃɗ������v�Z����悤�ɏC���������ׁA�폜
--			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--			/***************************************************************/
--			/* �ŏI���^�T�����̔���                                        */
--			/* 1.�������^�T���L��A�T�����~�̏ꍇ = �������^�T����         */
--			/* 2.�������^�T�������A�T�����~�̏ꍇ = OP���̑O�����^�T����   */
--			/* 3.��L�ȊO�̏ꍇ�́A               = �]���ʂ�               */
--			/***************************************************************/
--			IF v_TogetuKojoFlg = False and v_kojocyushiFlg = '1' THEN
--				w_ZenYMD := SUBSTR(v_SysDate,1,6) || '25';
--			ELSIF v_TogetuKojoFlg = True and v_kojocyushiFlg = '1' THEN
--				w_ZenYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
--			ELSE
--				w_ZenYMD := w_ZenYMD;
--			END IF;
--			/* ADD 00002 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
/*DEL 20100129 TR0911-003 NBC ISHIDA START */

			v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
			IF w_Zan > 0 THEN
				--��2003/01/23��
				--�o�ߓ����̊��Ԃɗ����̕ύX���������ꍇ�A������Ƃɗ������擾���v�Z����
				--
				--v_DateCnt := TO_DATE(InStrSeiYMD,'YYYYMMDD') - TO_DATE(w_ZenYMD,'YYYYMMDD');
				v_STARTRiritu := QPAP_CEnt030GetRiritu(w_ZenYMD + 1);								--�W�v�J�n���̗������擾
				v_ENDRiritu   := QPAP_CEnt030GetRiritu(InStrSeiYMD);								--�W�v�I�����̗������擾

				IF v_STARTRiritu <> v_ENDRiritu THEN
					W_CNT        := TO_NUMBER(w_ZenYMD) + 1;												--�W�v�J�n��
					W_ENDLOOPCNT := TO_NUMBER(InStrSeiYMD);													--�W�v�I����

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;
						END IF;

						v_GetRiritu  := QPAP_CEnt030GetRiritu(W_CNT);									--�������擾����
						v_GetRiritu  := v_GetRiritu / 100;												--
						v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--�V�������擾����

						IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu2 * 1000000);
						ELSE
							w_Risoku := w_Risoku + TRUNC(w_Zan * v_GetRiritu / 365 * 1000) * 1000;
						END IF;

						w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���
					END LOOP;
				ELSE	--�]���̏���
					v_GetRiritu  := v_STARTRiritu / 100;												--
					v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;					--�V�������擾����
	---				w_Risoku := TRUNC(w_Zan * v_KeiyakuRiritu * v_DateCnt / 365 * 1000);						-- 10/24 UPD
					IF TO_DATE(InStrSeiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN					-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_GetRiritu2 * v_DateCnt * 1000000);						-- 10/24 UPD
					ELSE																						-- 10/24 UPD
						w_Risoku := TRUNC(w_Zan * v_GetRiritu * v_DateCnt / 365 * 1000) * 1000;				-- 10/24 UPD
					END IF;																						-- 10/24 UPD
				END IF;
			ELSE
				w_Risoku := 0;
			END IF;
		END IF;

/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--        w_IDX5 := w_IDX4 + 1;
--        LOOP
--            IF w_IDX5 > 8 THEN
--                EXIT;
--            END IF;
--            w_Risoku := w_Risoku + RisokuAry(w_IDX5);
--            w_IDX5 := w_IDX5 + 1;
--        END LOOP;
        w_TRisoku := w_TRisoku + w_Risoku;

        w_TRisoku     := TRUNC(w_TRisoku / 1000000);
        w_YRisoku     := TRUNC(w_YRisoku / 1000000);
        /* ���Z���̗������v�Z */
        w_Risoku := w_TRisoku + w_YRisoku + w_KRisoku;

        IF w_Risoku <= 0 THEN
           w_Risoku := 0;
        END IF;
/*MOD 20100129 TR0911-003 NBC ISHIDA END */

--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή�
        IF v_ZanZeroFlg  = '1' THEN                                                   -- 12/05 UPD
           w_GenZan  := 0;                                                            -- 12/05 UPD
           w_Risoku  := 0;                                                            -- 12/05 UPD
           w_Zan     := 0;                                                            -- 12/05 UPD
        END IF;                                                                       -- 12/05 UPD
--2001/12/05 �Ј����ށ@6111518�i���V�X�e���o�O�j�Ή��@�����܂�

        /* ���ׂ�INSERT */
        INSERT INTO QPAI_KGCKEISANW VALUES (
             NVL(InStrSyainCD,' ')
            ,NVL(v_MiseNM,' ')
            ,NVL(v_SimeiKanji,' ')
            ,NVL(InStrSeiYMD,' ')
			/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--            ,'6��'
            ,w_QPAI_SEQ || '6'
			/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */
            ,NULL
---            ,NVL(w_GenZan,0) + TRUNC(w_Risoku / 1000)   -- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            ,NVL(w_GenZan,0) + TRUNC(w_Risoku / 1000000)   -- 10/24 UPD
            ,NVL(w_GenZan,0) + w_Risoku
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
            ,NVL(w_GenZan,0)
---            ,TRUNC(w_Risoku / 1000)                     -- 10/24 UPD
/*MOD 20100129 TR0911-003 NBC ISHIDA START */
--            ,TRUNC(w_Risoku / 1000000)                     -- 10/24 UPD
            ,w_Risoku
/*MOD 20100129 TR0911-003 NBC ISHIDA END */
            ,0
            ,NVL(InStrSeiKBN,' ')
            ,NVL(v_Zaimu,' ')
            ,NVL(v_Syozai,' ')
            ,NVL(v_Kaisya,' ')
            ,NVL(v_Bank,' ')
            ,NVL(v_KozaNo,' ')
            ,NVL(v_KozaNm,' ')
            ,NVL(InStrUserID,' ')
            ,NVL(InStrComputerNM,' '));
    END IF;

    /* �R�~�b�g */
    COMMIT;

  END IF;


/* ADD 20100225 0908047 NBC ISHIDA START */
	/**************************/
	/*   �������v�Z���ɔ��f   */
	/**************************/

	/* �����Z���v�Z��WT���番�����̎擾 */

	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' QPAI_KBN,';
	StrSQL := StrSQL || ' QPAI_GANKIN';
	StrSQL := StrSQL || ' FROM QPAI_KGCKEISANW';
	StrSQL := StrSQL || ' WHERE QPAI_SYAINCD = :Code';
	StrSQL := StrSQL || ' AND SUBSTR(QPAI_KBN,4,1) = ''7''';
	StrSQL := StrSQL || ' AND QPAI_USERID = :Usr';
	StrSQL := StrSQL || ' AND QPAI_COMPUTERNM = :Cmp';

	v_CursorID  := DBMS_SQL.OPEN_CURSOR;

	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

	/* ���͕ϐ����o�C���h���� */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Usr', InStrUserID);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Cmp', InStrComputerNM);

	/* �o�͕ϐ��̃o�C���h */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_KBN2,4);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_Kangaku);

	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	LOOP

		IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* ���͕ϐ����o�C���h���� */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_KBN2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_Kangaku);

		/* ������ȍ~�̎c�����番������������ */

		BEGIN
			UPDATE QPAI_KGCKEISANW
			SET QPAI_ZANDAKA = QPAI_ZANDAKA - v_Kangaku
			WHERE QPAI_SYAINCD      = InStrSyainCD
			AND   QPAI_KBN         >= v_KBN2
			AND   QPAI_USERID       = InStrUserID
			AND   QPAI_COMPUTERNM   = InStrComputerNM;
		EXCEPTION
			WHEN  OTHERS  THEN
			RAISE;
		END;

	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	commit;

	/**************************/
	/* ����߂����v�Z���ɔ��f */
	/**************************/

	/* �����E����߂�T����f�[�^�̎擾 */

	StrSQL := NULL;
	StrSQL := StrSQL || 'SELECT';
	StrSQL := StrSQL || ' TO_CHAR(QPB2_KOJOYMD,''YYYYMMDD''),';
	StrSQL := StrSQL || ' QPB2_BUNMODFLG,';
	StrSQL := StrSQL || ' DECODE(QPB2_YUSIKBN,''3'',''2'',''4'',''3''),';
	StrSQL := StrSQL || ' NVL(QPB2_GANKIN,0),';
	StrSQL := StrSQL || ' NVL(QPB2_RISOKU,0)';
	StrSQL := StrSQL || ' FROM QPB2_BUNKAI';
	StrSQL := StrSQL || ' WHERE QPB2_SYAINCD1 = :Code1';
	StrSQL := StrSQL || ' AND QPB2_SYAINCD2 = :Code2';
	StrSQL := StrSQL || ' AND QPB2_SYUBETU  = ''1''';
	StrSQL := StrSQL || ' AND ((QPB2_BUNMODFLG = ''0''';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_KOJOYMD,''YYYYMMDD'') <= :YMD1)';
	StrSQL := StrSQL || ' OR  (QPB2_BUNMODFLG = ''1''';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') >= :YMD2';
	StrSQL := StrSQL || ' AND TO_CHAR(QPB2_BUNKAIYMD,''YYYYMMDD'') <= :YMD1))';

	v_CursorID  := DBMS_SQL.OPEN_CURSOR;

	/* SQL�̉�� */
	DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);

	/* ���͕ϐ����o�C���h���� */
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD1', InStrEndYMD);
	DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD2', InStrStrYMD1);


	/* �o�͕ϐ��̃o�C���h */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_YMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_ModFlg,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_KBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_Kangaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_Risoku);

	/* SQL�̎��s */
	v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

	LOOP

		IF  DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;

		/* ���͕ϐ����o�C���h���� */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_YMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_ModFlg);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_KBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_Kangaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_Risoku);


		/* �v�Z���o�͔͈͓��̍T�����z��0�~�ɂ��� */
		IF v_YMD >= InStrStrYMD1 AND v_YMD <= InStrEndYMD THEN
			UPDATE QPAI_KGCKEISANW
			SET  QPAI_HENSAIKINGAKU = 0
				,QPAI_GANKIN        = 0
				,QPAI_RISOKU        = 0
			WHERE QPAI_SYAINCD      = InStrSyainCD
			AND   QPAI_YMD          = v_YMD
			AND   SUBSTR(QPAI_KBN,4,1) = v_KBN
			AND   QPAI_USERID       = InStrUserID
			AND   QPAI_COMPUTERNM   = InStrComputerNM;
		END IF;


		/* �T�����ȍ~�̎c���Ɍ����������� */
		IF v_YMD <= InStrEndYMD THEN

			BEGIN
				SELECT QPAI_KBN
				INTO v_KBN2
				FROM QPAI_KGCKEISANW
				WHERE QPAI_SYAINCD      = InStrSyainCD
				AND   QPAI_YMD          = v_YMD
				AND   SUBSTR(QPAI_KBN,4,1) = v_KBN
				AND   QPAI_USERID       = InStrUserID
				AND   QPAI_COMPUTERNM   = InStrComputerNM;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_KBN2 := '0000';
				WHEN  OTHERS  THEN
					RAISE;
			END;

			BEGIN
				UPDATE QPAI_KGCKEISANW
				SET QPAI_ZANDAKA = QPAI_ZANDAKA + v_Kangaku
				WHERE QPAI_SYAINCD      = InStrSyainCD
				AND   QPAI_KBN         >= v_KBN2
				AND   QPAI_USERID       = InStrUserID
				AND   QPAI_COMPUTERNM   = InStrComputerNM;
			EXCEPTION
				WHEN  OTHERS  THEN
				RAISE;
			END;
		END IF;

		/* ����߂������Ă��錳���Ɨ������W�v */
		IF v_ModFlg = '0' THEN
			v_GanKinMod := v_GanKinMod + v_Kangaku;
			v_RisokuMod := v_RisokuMod + v_Risoku;
		END IF;

	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

	/* �u���Z����v�̏ꍇ�A���Z�s�ɕ���߂����̗�����ǉ� */

    IF InStrSeiKBN = '0' THEN

		UPDATE QPAI_KGCKEISANW
		SET QPAI_HENSAIKINGAKU = QPAI_HENSAIKINGAKU + v_GanKinMod + v_RisokuMod
			,QPAI_GANKIN = QPAI_GANKIN + v_GanKinMod
			,QPAI_RISOKU = QPAI_RISOKU + v_RisokuMod
			,QPAI_ZANDAKA = 0
		WHERE QPAI_SYAINCD      = InStrSyainCD
		AND   SUBSTR(QPAI_KBN,4,1) = '6'
		AND   QPAI_USERID       = InStrUserID
		AND   QPAI_COMPUTERNM   = InStrComputerNM;

	END IF;

	commit;
/* ADD 20100225 0908047 NBC ISHIDA END */

/* ----- �r�s�d�o�Q �\���f�[�^�������擾 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
      /* ���[�N�e�[�u�����݃`�F�b�N�r�p�k */
      v_NumCount := 0;
      SELECT COUNT(*) INTO v_NumCount FROM QPAI_KGCKEISANW
          WHERE QPAI_USERID = InStrUserID
          AND QPAI_COMPUTERNM = InStrComputerNM;

      OtNumRecCount := v_NumCount;
  END IF;

/* ----- �r�s�d�o�R �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN   --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
      /* �����Z���v�Z���e�[�u������ */
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
      StrSQL := StrSQL || ' NVL(QPAI_YMD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAI_KBN,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAI_YUSIKINGAKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_HENSAIKINGAKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_GANKIN,0),';
      StrSQL := StrSQL || ' NVL(QPAI_RISOKU,0),';
      StrSQL := StrSQL || ' NVL(QPAI_ZANDAKA,0)';
      StrSQL := StrSQL || ' FROM QPAI_KGCKEISANW';
      StrSQL := StrSQL || ' WHERE QPAI_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAI_COMPUTERNM = :CMP';

--2001/12/06 �����s���Ή�
--      StrSQL := StrSQL || ' ORDER BY QPAI_YMD,QPAI_KBN,QPAI_YUSIKINGAKU desc';
--      StrSQL := StrSQL || ' ORDER BY QPAI_YMD';  del
--2001/12/06 �����s���Ή��@�@�����܂�

--2002/01/29 �����s���Ή�

	/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START */
--	StrSQL := StrSQL || ' ORDER BY QPAI_YMD,QPAI_KBN ASC,QPAI_YUSIKINGAKU desc';
	StrSQL := StrSQL || ' ORDER BY QPAI_KBN ASC';
	/* MOD 00001 �O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END */

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
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,z_YMD,8);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,z_KBN,4);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,z_YusiKingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,z_HensaiKingaku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,z_Gankin);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,z_Risoku);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,z_Zandaka);
  /* FETCH */
  NumIdx := 0;
  LOOP
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
          EXIT;
      END IF;
      /* �J�����l��ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID,1,z_YMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,2,z_KBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,3,z_YusiKingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,4,z_HensaiKingaku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,5,z_Gankin);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,6,z_Risoku);
      DBMS_SQL.COLUMN_VALUE(v_CursorID,7,z_Zandaka);

      /* ���ޯ�� ���� ���� */
      NumIdx               := NumIdx + 1;
      OtStrYMD(NumIdx)     := z_YMD;
      OtStrKBN(NumIdx)     := z_KBN;
      OtNumYusiKin(NumIdx) := z_YusiKingaku;
      OtNumHenKin(NumIdx)  := z_HensaiKingaku;
      OtNumGanKin(NumIdx)  := z_Gankin;
      OtNumRisoku(NumIdx)  := z_Risoku;
      OtStrZandaka(NumIdx) := z_Zandaka;

      /* �z��̌������l�`�w�ɂȂ����ꍇ */
      IF InNumMaxRec <= NumIdx  THEN
          OtNumAryCount :=  NumIdx;
          RETURN;
      END IF;
  END LOOP;

  OtNumAryCount := NumIdx;      --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';           --�p�����[�^�ɃZ�b�g�i�����I���j

/* ADD 20100225 0908047 NBC ISHIDA START */
      OtNumGanKinMod       := v_GanKinMod;
      OtNumRisokuMod       := v_RisokuMod;
/* ADD 20100225 0908047 NBC ISHIDA END */


EXCEPTION
  WHEN  OTHERS  THEN
      IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
          DBMS_SQL.CLOSE_CURSOR (v_CursorID);
      END IF;
/* ADD 20100225 0908047 NBC ISHIDA START */
      IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
          DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      END IF;
/* ADD 20100225 0908047 NBC ISHIDA END */
      RAISE ;

END QPAP_CEnt030SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030GetHensaigaku                                                                      */
/* �@�\          �F�����Z���ԍϊz�擾                                                                             */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetHensaigaku(
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrKBN     IN    CHAR
  ,InStrYM      IN    CHAR) RETURN NUMBER IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_Hensaigaku    NUMBER := 0;
  v_KyuyoHensai   QPA2_KGCHENSAIT.QPA2_KYUYOHENSAI%TYPE;
  v_SyoyoHensai   QPA2_KGCHENSAIT.QPA2_SYOYOHENSAI%TYPE;

BEGIN
  /* �敪�ɂ���ď����l�ύX */
  IF InStrKBN = 1 THEN
    v_Hensaigaku := 10000;
  END IF;
  IF InStrKBN = 2 THEN
    v_Hensaigaku := 40000;
  END IF;

  /* �����Z���ԍϊz�����e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA2_KYUYOHENSAI,0),';
  StrSQL := StrSQL || ' NVL(QPA2_SYOYOHENSAI,0)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM = (SELECT MAX(QPA2_PRMHENKOUYM)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM <= :YM';
  StrSQL := StrSQL || ' GROUP BY QPA2_PRMSYAINCD1,QPA2_PRMSYAINCD2)';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', InStrYM);
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
    IF InStrKBN = 1 THEN
      v_Hensaigaku := v_KyuyoHensai;
    END IF;
    IF InStrKBN = 2 THEN
      v_Hensaigaku := v_SyoyoHensai;
    END IF;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  /* �ԋp�l�ɓ��Ă͂߂� */
  RETURN v_Hensaigaku;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetHensaigaku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030GetHensaiYMD                                                                       */
/* �@�\          �F�����Z���ԍϊz�ύX���擾                                                                       */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetHensaiYMD(
   InStrSyainCD   IN    QPA2_KGCHENSAIT.QPA2_PRMSYAINCD2%TYPE
  ,InStrYM      IN    CHAR) RETURN CHAR IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  v_HensaiYM      CHAR(6);
  v_HenkoYM     QPA2_KGCHENSAIT.QPA2_PRMHENKOUYM%TYPE;

BEGIN
  v_HensaiYM := 'NOTHIN';

  /* �����Z���ԍϊz�����e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' MIN(QPA2_PRMHENKOUYM)';
  StrSQL := StrSQL || ' FROM QPA2_KGCHENSAIT';
  StrSQL := StrSQL || ' WHERE QPA2_PRMSYAINCD1 = :Code1';
  StrSQL := StrSQL || ' AND QPA2_PRMSYAINCD2 = :Code2';
  StrSQL := StrSQL || ' AND QPA2_PRMHENKOUYM > :YM';
  StrSQL := StrSQL || ' GROUP BY QPA2_PRMSYAINCD1,QPA2_PRMSYAINCD2';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code1', ' ');
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code2', InStrSyainCD);
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YM', InStrYM);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYM,6);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYM);
    v_HensaiYM := v_HenkoYM;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  IF v_HensaiYM IS NULL OR v_HensaiYM = ' ' THEN
    v_HensaiYM := 'NOTHIN';
  END IF;

  /* �ԋp�l�ɓ��Ă͂߂� */
  RETURN v_HensaiYM;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetHensaiYMD;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030GetRiritu                                                                          */
/* �@�\          �F�����Z�������擾                                                                               */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt030GetRiritu(
   InStrYMD   IN    CHAR) RETURN NUMBER IS

  StrSQL      VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_NumCount    NUMBER;
  v_Dummy     INTEGER;
  v_Riritu    NUMBER := 0;
  v_HenkoRiritu QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

BEGIN
  /* �����Z�������e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' NVL(QPA7_RIRITU,0)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE QPA7_PRMHENKOYMD = (SELECT MAX(QPA7_PRMHENKOYMD)';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') <= :YMD)';
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
END QPAP_CEnt030GetRiritu;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt030GetRirituYMD                                                                       */
/* �@�\          �F�����Z�������ύX���擾                                                                         */
/******************************************************************************************************************/
/* �����Z�������ύX���擾 */
FUNCTION QPAP_CEnt030GetRirituYMD(
   InStrYMD   IN    CHAR) RETURN CHAR IS

  StrSQL      VARCHAR2(1000);
  v_CursorID    NUMBER := 0;
  v_NumCount    NUMBER;
  v_Dummy     INTEGER;
  v_RirituYMD   CHAR(8);
  v_HenkoYMD    CHAR(8);

BEGIN
  v_RirituYMD := 'NOTHING1';

  /* �����Z���ԍϊz�����e�[�u������ */
  StrSQL := NULL;
  StrSQL := StrSQL || 'SELECT';
  StrSQL := StrSQL || ' TO_CHAR(MIN(QPA7_PRMHENKOYMD),''YYYYMMDD'')';
  StrSQL := StrSQL || ' FROM QPA7_KGCRIRITUT';
  StrSQL := StrSQL || ' WHERE TO_CHAR(QPA7_PRMHENKOYMD,''YYYYMMDD'') > :YMD';
  /* ���I�J�[�\���̃I�[�v�� */
  v_CursorID  := DBMS_SQL.OPEN_CURSOR;
  /* SQL�̉�� */
  DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
  /* ���͕ϐ����o�C���h���� */
  DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_HenkoYMD,8);
  /* SQL�̎��s */
  v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  /* FETCH */
  IF DBMS_SQL.FETCH_ROWS (v_CursorID) <> 0 THEN
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_HenkoYMD);
    v_RirituYMD := v_HenkoYMD;
  END IF;
  /* �J�[�\���̃N���[�Y */
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);

  IF v_RirituYMD IS NULL OR v_RirituYMD = ' ' THEN
    v_RirituYMD := 'NOTHING1';
  END IF;

  /* �ԋp�l�ɓ��Ă͂߂� */
  RETURN v_RirituYMD;

EXCEPTION
  WHEN  OTHERS  THEN
    IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);
    END IF;
    RAISE ;
END QPAP_CEnt030GetRirituYMD;


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt030DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt030DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN

    DELETE  FROM QPAS_KGCW
      WHERE QPAS_USERID     = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE  FROM QPAI_KGCKEISANW
      WHERE QPAI_USERID     = InStrUserID
        AND QPAI_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt030DelWorkTbl;



END QPAP_CEnt030PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
