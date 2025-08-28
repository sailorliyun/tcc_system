CREATE OR REPLACE PACKAGE  QPAP_CEnt150PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt150PkG                                                                                */
/* �@�\          �F�ݕt���c���\                                                                                   */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------*/
/*�X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                             */
/*20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��                                                    */
/*                           ����A�o�͔N�����u�Q���i�������j�v�܂��́u�W���i������j�v�̎��̂ݕ\��               */
/*                           ���Ă���u�����������^���A�ܗ^���A���v�v���A�u�T���i�l�������j�v�����               */
/*                           �u�P�P���v�ɂ��\������悤�ύX����B                                                 */
/*20100715  1004091          ���o�����ɂ��铌���敪���폜                                                         */
/*                           �������̃f�[�^����x�ɕ\���E������s��                                               */
/*----------------------------------------------------------------------------------------------------------------*/
/******************************************************************************************************************/
/*  �P  �錾��                            */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typOtCodeAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE                --�R�[�h
    INDEX BY BINARY_INTEGER;

  TYPE typOtMiseNMAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE            --�X��
    INDEX BY BINARY_INTEGER;

  TYPE typOtSCountAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE       --�؏�����
    INDEX BY BINARY_INTEGER;

  TYPE typOtKCountAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE      --��������
    INDEX BY BINARY_INTEGER;

  TYPE typOtSZandakaAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE   --�؏��c��
    INDEX BY BINARY_INTEGER;

  TYPE typOtKZandakaAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE  --�����c��
    INDEX BY BINARY_INTEGER;

  TYPE typOtSMisyuKAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE     --�؏������������^
    INDEX BY BINARY_INTEGER;

  TYPE typOtSMisyuSAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE     --�؏����������ܗ^
    INDEX BY BINARY_INTEGER;

  TYPE typOtKMisyuAry IS TABLE OF QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE      --������������
    INDEX BY BINARY_INTEGER;

/* �ݕt�f�[�^�擾 �ܗ^�c���X�V�O�f�[�^ (QPAY_SYNDAICYOWT���擾) */
PROCEDURE QPAP_CEnt150SelList_Before (
   InStrYMD           IN     CHAR                                --��������  �o�͔N����
  ,InStrTozaiKBN      IN     CHAR                                --          �����敪
  ,InStrTyuSeiMM      IN     CHAR                                --          ���Ԍ��Z��
  ,InStrSeiMM         IN     CHAR                                --          ���Z��
  ,InStrKyuyoYMD      IN     CHAR                                --          ���^���t
  ,InNumKyuyoNisu     IN     NUMBER                              --          ���^����
  ,InNumKyuyoNisuFrom IN     CHAR                                --          ���^�����̂e�q�n�l
  ,InNumKyuyoNisuTo   IN     CHAR                                --          ���^�����̂s�n
  ,InNumMaxRec        IN     NUMBER                              --�ő�z��i�[����
  ,IoNumCursor        IN OUT NUMBER                              --�Ăяo����
  ,OtNumRecCount         OUT NUMBER                              --����������
  ,OtNumAryCount         OUT NUMBER                              --�z��i�[����
  ,OtStrEndFlg           OUT VARCHAR2                            --�����I���t���O
  ,OtStrCode             OUT typOtCodeAry                        --�R�[�h
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --�X��
  ,OtNumSCount           OUT typOtSCountAry                      --�؏��J�E���g
  ,OtNumKCount           OUT typOtKCountAry                      --�����J�E���g
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --�؏��c��
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --�����c��
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --�؏������������^
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --�؏����������ܗ^
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --������������
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --�R���s���[�^��

/* �ݕt�f�[�^�擾 �ܗ^�c���X�V��f�[�^ (QPA8_SYNDAICYOT���擾) */
PROCEDURE QPAP_CEnt150SelList_After (
   InStrYMD           IN     CHAR                                --��������  �o�͔N����
  ,InStrTozaiKBN      IN     CHAR                                --          �����敪
  ,InStrTyuSeiMM      IN     CHAR                                --          ���Ԍ��Z��
  ,InStrSeiMM         IN     CHAR                                --          ���Z��
  ,InStrKyuyoYMD      IN     CHAR                                --          ���^���t
  ,InNumKyuyoNisu     IN     NUMBER                              --          ���^����
  ,InNumKyuyoNisuFrom IN     CHAR                                --          ���^�����̂e�q�n�l
  ,InNumKyuyoNisuTo   IN     CHAR                                --          ���^�����̂s�n
  ,InNumMaxRec        IN     NUMBER                              --�ő�z��i�[����
  ,IoNumCursor        IN OUT NUMBER                              --�Ăяo����
  ,OtNumRecCount         OUT NUMBER                              --����������
  ,OtNumAryCount         OUT NUMBER                              --�z��i�[����
  ,OtStrEndFlg           OUT VARCHAR2                            --�����I���t���O
  ,OtStrCode             OUT typOtCodeAry                        --�R�[�h
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --�X��
  ,OtNumSCount           OUT typOtSCountAry                      --�؏��J�E���g
  ,OtNumKCount           OUT typOtKCountAry                      --�����J�E���g
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --�؏��c��
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --�����c��
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --�؏������������^
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --�؏����������ܗ^
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --������������
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE);    --�R���s���[�^��

/* �����Z�������擾 */
FUNCTION QPAP_CEnt150GetRiritu(
   InStrYMD          IN     CHAR)
RETURN NUMBER;

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt150DelWorkTbl(
   InStrUserID       IN     VARCHAR2,                            --���[�U�[�h�c
   InStrComputerNM   IN     VARCHAR2);                           --�R���s���[�^��

END QPAP_CEnt150PkG;
/
show error
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt150PkG                                                                                */
/* �@�\          �F�ݕt���c���\                                                                                   */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�Q  �{�f�B�[                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt150PkG IS

  /* �����������̂݊J������J�[�\�� */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
  CURSOR CurMiseV IS
    SELECT QPAV_MISECD,QPAV_MISENM,QPAV_TOZAIKBNE,
    QPAV_TOZAIKBNW,QPAV_CODE
    FROM     QPAV_MISEV
    ORDER BY   QPAV_MISECD;
*/
	CURSOR CurMiseV IS
			-- ��
			SELECT
				 QPAV_MISECD
				,QPAV_MISENM
				,QPAV_TOZAIKBNE
				,QPAV_TOZAIKBNW
				,QPAV_CODE
				,QPAV_TOZAIKBNE		AS QPAV_TOZAIKBN
			FROM
				QPAV_MISEV
			WHERE
				QPAV_TOZAIKBNE		= '1'
		UNION
			-- ��
			SELECT
				 QPAV_MISECD
				,QPAV_MISENM
				,QPAV_TOZAIKBNE
				,QPAV_TOZAIKBNW
				,QPAV_CODE
				,QPAV_TOZAIKBNW		AS QPAV_TOZAIKBN
			FROM
				QPAV_MISEV
			WHERE
				QPAV_TOZAIKBNW		= '2'
		ORDER BY
			 QPAV_TOZAIKBN
			,QPAV_MISECD
		;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt150SelList_Before                                                                     */
/* �@�\          �F�c���f�[�^�擾                                                                                 */
/*                 �ܗ^�c���X�V�O�f�[�^                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt150SelList_Before (
   InStrYMD           IN     CHAR                                --��������  �o�͔N����
  ,InStrTozaiKBN      IN     CHAR                                --          �����敪
  ,InStrTyuSeiMM      IN     CHAR                                --          ���Ԍ��Z��
  ,InStrSeiMM         IN     CHAR                                --          ���Z��
  ,InStrKyuyoYMD      IN     CHAR                                --          ���^���t
  ,InNumKyuyoNisu     IN     NUMBER                              --          ���^����
  ,InNumKyuyoNisuFrom IN     CHAR                                --          ���^�����̂e�q�n�l
  ,InNumKyuyoNisuTo   IN     CHAR                                --          ���^�����̂s�n
  ,InNumMaxRec        IN     NUMBER                              --�ő�z��i�[����
  ,IoNumCursor        IN OUT NUMBER                              --�Ăяo����
  ,OtNumRecCount         OUT NUMBER                              --����������
  ,OtNumAryCount         OUT NUMBER                              --�z��i�[����
  ,OtStrEndFlg           OUT VARCHAR2                            --�����I���t���O
  ,OtStrCode             OUT typOtCodeAry                        --�R�[�h
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --�X��
  ,OtNumSCount           OUT typOtSCountAry                      --�؏��J�E���g
  ,OtNumKCount           OUT typOtKCountAry                      --�����J�E���g
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --�؏��c��
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --�����c��
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --�؏������������^
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --�؏����������ܗ^
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --������������
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --�R���s���[�^��

  /* �����ŗL�̕ϐ� */
  StrSQL                    VARCHAR2(1000);
  v_CursorID                NUMBER := 0;
  v_CursorID2               NUMBER := 0;
  v_NumCount                NUMBER;
  v_Dummy                   INTEGER;
  v_Dummy2                  INTEGER;
  NumIdx                    NUMBER;

  v_SysCng                  CHAR(8) := '20000301';

  v_Index                   CHAR(3);
  v_KaisyaNM                VARCHAR2(24);
  v_MiseCD                  QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM                  QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD                 QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM                 QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SyainCD1                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_SimeiKanji              QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YusiYMD                 CHAR(8);
  v_KyuyoZandaka            QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZandaka            QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_Riritu                  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_TozaiKBN                QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_TozaiKBNE               QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_TozaiKBNW               QPAE_MISEM.QPAE_TOZAIKBNW%TYPE;
  v_BonusYMD1               QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BonusYMD2               QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_ZenBonusYMD1            CHAR(8);
  v_ZenBonusYMD2            CHAR(8);
  v_ZenBonusYMD             CHAR(8);
  v_TDATE                   CHAR(8);
  v_KDATE                   CHAR(8);
  v_ZenYMD                  CHAR(8);
  v_RisokuNisu              NUMBER;
  v_Risoku                  NUMBER;
  v_CRRisoku                NUMBER;
  v_SyosyoRisokuKyuyo       NUMBER;
  v_SyosyoRisokuSyoyo       NUMBER;
  v_CRRisokuKyuyo           NUMBER;
  v_Zandaka                 NUMBER;
  v_ZenZandaka              NUMBER;
  v_ZenRiritu               NUMBER;
  v_NowRiritu               NUMBER;
  v_Count                   NUMBER;
  v_KBN                     QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD                     QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku                 QPAS_KGCW.QPAS_KINGAKU%TYPE;

  w_Sybt                    CHAR(1);
  w_SZan                    NUMBER := 0;
  w_KZan                    NUMBER := 0;
  w_SMK                     NUMBER := 0;
  w_SMS                     NUMBER := 0;
  w_KMK                     NUMBER := 0;
  w_Cnt                     NUMBER := 0;

  v_SZan                    NUMBER := 0;
  v_KZan                    NUMBER := 0;
  v_SMK                     NUMBER := 0;
  v_SMS                     NUMBER := 0;
  v_KMK                     NUMBER := 0;
  v_SCnt                    NUMBER := 0;
  v_KCnt                    NUMBER := 0;

  w_Code                    QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE;
  w_MiseCD                  QPAX_ZANDAKATOTALW.QPAX_MISECD%TYPE;
  w_MiseNM                  QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE;
  w_SCount                  QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE;
  w_KCount                  QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE;
  w_SyosyoZandaka           QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE;
  w_KoguchiZandaka          QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE;
  w_SyosyoMisyuK            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE;
  w_SyosyoMisyuS            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE;
  w_KoguchiMisyu            QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE;

  /* �؏������s���Ή��@2001/09/28 */
  v_NumFirst                NUMBER;
  v_SyainCD1_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;

  /* �s�ϐ� */
   RowQPAG                  CurMiseV%ROWTYPE;

  v_SysCng2                 CHAR(8) := '20011101';          -- 10/23 ADD
  v_Riritu2                 NUMBER;                         -- 10/23 ADD

  /*2003/01/24 �����v�Z*/
  W_LoopCNT			NUMBER;						--�����v�Z�p���[�v�J�E���^
  W_ENDLOOPCNT		NUMBER;						--�����v�Z�p���[�v�I���l
  v_GetRiritu		NUMBER;						--�����v�Z�p������(��)
  v_GetRiritu2		NUMBER;						--�����v�Z�p������(�V)
  v_StartRiritu		NUMBER;						--�����v�Z�p�������߂�͈͊J�n���ł̓K�p����
  v_NextRiritu		NUMBER;						--�����v�Z�p�������߂�͈͏I�����ł̓K�p����
  strworkwork		NUMBER;						
  /*2003/01/24 �����v�Z*/

--ADD 20100225 0908047 NBC SAWAME START
  w_Str14SeiMM               CHAR(2);           --���l�������ό�
  w_Str34SeiMM               CHAR(2);           --��O�l�������ό�
--ADD 20100225 0908047 NBC SAWAME END

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
	v_wkTozaiKBN			CHAR(1);		--���[�N�F�����敪
	v_wkKaisyaCD			CHAR(3);		--���[�N�F��ЃR�[�h
	v_wkKaisyaNM			VARCHAR2(24);	--���[�N�F��Ж�
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

BEGIN

/* ----- �r�s�d�o�P �\���f�[�^�������擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    OtstrEndFlg   := '0';
    OtNumRecCount :=  0;
    OtNumAryCount :=  0;
    v_NumCount    :=  0;
    v_NumFirst    :=  0;	--�؏������s���Ή��@2001/09/28

    /* �v�j�e�[�u�������� */
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID   = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID   = InStrUserID
      AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID   = InStrUserID
      AND QPAX_COMPUTERNM = InStrComputerNM;

    /******************/
    /* �؏�           */
    /******************/
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(D.QPAY_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(D.QPAY_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPAY_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPAY_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPAY_SYNDAICYOWT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE TO_CHAR(D.QPAY_PRMYUSIYMD,''YYYYMMDD'') <= :YMD';
    StrSQL := StrSQL || ' AND D.QPAY_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 (+)';
--    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 (+)';
--    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPAY_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPAY_PRMSYAINCD1,D.QPAY_PRMSYAINCD2,D.QPAY_PRMYUSIYMD';

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_YusiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_SyoyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_Riritu);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 14,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 15,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 16,v_BonusYMD2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock1>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_YusiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_SyoyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_Riritu);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 14,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 15,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 16,v_BonusYMD2);

      /* �����敪���ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock1;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* ���������ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '��������';
      END IF;

--2002/1/11 �����敪�l������Ή�
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock1;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 �����敪�l������Ή�


      /*�ܗ^�N�����P*/
      IF TO_NUMBER(v_BonusYMD1) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
      ELSE
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
        v_ZenBonusYMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD1,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /*�ܗ^�N�����Q*/
      If TO_NUMBER(v_BonusYMD2) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
      ELSE
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
        v_ZenBonusYMD2 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD2,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /* ��L�ŋ��߂��ܗ^�N�����̂����傫������O��ܗ^�N�����Ƃ���B*/
      IF TO_DATE(v_ZenBonusYMD1,'YYYYMMDD') < TO_DATE(v_ZenBonusYMD2,'YYYYMMDD') THEN
        v_ZenBonusYMD := v_ZenBonusYMD2;
      ELSE
        v_ZenBonusYMD := v_ZenBonusYMD1;
      END IF;
--DEL 20100225 0908047 NBC SAWAME START
--      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      --���l�������Z��
      IF TO_NUMBER(InStrTyuSeiMM) + 3 > 12 THEN
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3 - 12);
      ELSE
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3);
      END IF;
      --��O�l�������Z��
      IF TO_NUMBER(InStrSeiMM) + 3 > 12 THEN
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3 - 12);
      ELSE
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3);
      END IF;
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
          /****************************************************************************/
          /* �Z������ "2000/03/01" �ȍ~�͐V�v�Z���ŁA������O�͋��v�Z���Ōv�Z����B  /
          /****************************************************************************/
          IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng,'YYYYMMDD') THEN
              /************/
              /* �V�v�Z��  /
              /************/
              /*************************/
              /* ���^�̖��������v�Z    */
              /*************************/
              /* �Z�����ɂ��v�Z��������𔻒f����B*/
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* �Z�������A�w�茎�̑O���ȑO�̏ꍇ�i�w�茎�̂Q�T���ɓV����������j*/
                  /* �w�茎�̂Q�U�� �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := SUBSTR(InStrYMD,1,6) || '25';
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              ELSE
                  /* �Z�������A�w�茎�̏ꍇ�i�w�茎�̂Q�T���ɓV�������Ȃ��j*/
                  /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* �v�Z�����������狋�^�̖����������v�Z����B*/
---              v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�� */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�O */                                                    -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;
              /*************************/
              /* �ܗ^�̖��������v�Z    */
              /*************************/
              /* �Z�����ɂ��v�Z��������𔻒f����B*/
              v_TDATE := SUBSTR(InStrYMD,1,6) || '01';
              IF TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) < TO_NUMBER(SUBSTR(v_TDATE,1,6)) THEN
                  /* �Z�������A�w�茎�̑O���ȑO�̏ꍇ*/
                  /*******************************/
                  /* �ܗ^�̓����̔��f            */
                  /*******************************/
                  /* �Z���N�����O��ܗ^�N���ȍ~�̏ꍇ�́A�Z��������������v�Z����B*/
                  IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                      /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                      v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  ELSE
                      /* �O��ܗ^�N���� �` �w�茎���� �̓������v�Z����B*/
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  END IF;
              ELSE
                  /* �Z�������A�w�茎�̏ꍇ�i�w�茎���ܗ^�����Ƃ��Ă��A�V�����͂Ȃ��j*/
                  /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* �v�Z������������ܗ^�̖����������v�Z����B*/
---              v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�� */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�O */                                                    -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;                                                                               -- 10/23 UPD
          ELSE
              /************/
              /* ���v�Z��  /
              /************/
              /* ���^�̖��������v�Z */
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* �w�茎�̌��������O�̗Z�����̏ꍇ�i2000/03/01 �̃V�X�e���ύX��͂����������ʂ�Ȃ��j*/
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * InNumKyuyoNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* �w�茎�̌������ȍ~�̗Z�����̏ꍇ�i2000/03/01 �̃V�X�e���ύX��͂������͒ʂ�Ȃ��j*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YusiYMD,'YYYYMMDD') + 1;
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
              /* �ܗ^�̖��������v�Z */
              IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                  /* �Z���N�����O��ܗ^�N���ȍ~�̏ꍇ�A�Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓����Ōv�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* �Z�������O��ܗ^���ȑO�̏ꍇ�A�O��ܗ^�� �` �w�茎���� �̓����Ōv�Z����B*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
          END IF;
      ELSE
          v_SyosyoRisokuKyuyo := 0;
          v_SyosyoRisokuSyoyo := 0;
      END IF;
      v_Zandaka := NVL(v_KyuyoZandaka,0) + NVL(v_SyoyoZandaka,0);

      /* �؏������s���Ή��@2001/09/28 DELETE
      IF v_Zandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;  */
      IF v_KaisyaNM = '��������' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;
      /* �؏������s���Ή��@2001/09/28 */
      IF v_Zandaka = 0 THEN
         GOTO l_InnerBlock1;
      END IF;
      IF v_NumFirst = 0 THEN
         v_Count := 1;
         v_SyainCD1_Save := v_SyainCD1;
         v_SyainCD2_Save := v_SyainCD2;
         v_NumFirst := 1;
      ELSE
        IF   v_SyainCD1 = v_SyainCD1_Save  AND
             v_SyainCD2 = v_SyainCD2_Save  THEN
             v_Count := 0;
        ELSE
             v_Count := 1;
             v_SyainCD1_Save := v_SyainCD1;
             v_SyainCD2_Save := v_SyainCD2;
        END IF;
      END IF;

      /* �ݕt�c���s�ɒǉ� */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'2'
        ,NVL(v_YusiYMD,' ')
        ,NVL(v_Zandaka,0)
        ,0
        ,NVL(v_SyosyoRisokuKyuyo,0)
        ,NVL(v_SyosyoRisokuSyoyo,0)
        ,0
        ,v_Count
        ,0
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'2'
			,NVL(v_YusiYMD,' ')
			,NVL(v_Zandaka,0)
			,0
			,NVL(v_SyosyoRisokuKyuyo,0)
			,NVL(v_SyosyoRisokuSyoyo,0)
			,0
			,v_Count
			,0
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;

    /******************/
    /* ����           */
    /******************/
    /* �w�茎�ƑO���̗��������߂� */
    v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
    v_ZenRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_ZenRiritu := TRUNC(v_ZenRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

    v_TDATE := TO_CHAR(TO_DATE(InStrKyuyoYMD,'YYYYMMDD') + 1,'YYYYMMDD');
    v_NowRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_NowRiritu := TRUNC(v_NowRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

--    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) - 1,'YYYYMMDD');
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');

    /* �����ޔ��e�[�u���ɑޔ� */
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
      WHERE ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= InStrYMD))
      AND    (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
/* 11/01 UPD �����Ώ۔͈͕ύX�̂��ߓ������͌��Ȃ����ƂƂ��� */
    /* ���� */
--    INSERT INTO QPAS_KGCW
--      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
--      SELECT  NVL(QPA5_SYAINCD1,' '),
--        NVL(QPA5_SYAINCD2,' '),
--        '2',
--        TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
--       NVL(QPA5_NYUKINGAKU,0),
--        InStrUserID,
--        InStrComputerNM
--      FROM QPA5_KGCNYUKINT
--      WHERE ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenYMD)
--      AND    (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= InStrYMD));
    /* �ܗ^ */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  NVL(QPA4_SYAINCD1,' '),
        NVL(QPA4_SYAINCD2,' '),
        '4',
        TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
        NVL(QPA4_KOJOGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA4_KGCKOJOT
      WHERE ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= InStrYMD));

    /* �R�~�b�g */
    COMMIT;

    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE D.QPA1_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA1_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA1_PRMSYAINCD1,D.QPA1_PRMSYAINCD2';

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_BonusYMD2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock2>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_BonusYMD2);

      /* �����敪���ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock2;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* ���������ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '��������';
      END IF;

--2002/1/11 �����敪�l������Ή�
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock2;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 �����敪�l������Ή�

      /* �O�O�����^�c���Q�� */
      v_ZenZandaka := 0;
      v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT NVL(QPA3_ZANDAKA,0)';
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

      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_TDATE);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_ZenZandaka);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_ZenZandaka);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      v_Zandaka := v_ZenZandaka;

--����������������������������������������������������������������������������������������������������������������
		/* ���Z������ђ��Ԍ��Z���̂ݖ��������v�Z���s�� */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			v_StartRiritu := QPAP_CEnt150GetRiritu(InNumKyuyoNisuFrom + 1);											--�����v�Z�J�n�����_�ł̗�����
			v_NextRiritu  := QPAP_CEnt150GetRiritu(InNumKyuyoNisuTo);											--�����v�Z�I�������_�ł̗�����

			IF v_StartRiritu <> v_NextRiritu THEN
				--�����̕ύX������Ƃ�
				W_LoopCNT        := InNumKyuyoNisuFrom + 1;						--�����v�Z���[�v�J�n
				W_ENDLOOPCNT := InNumKyuyoNisuTo;							--�����v�Z���[�v�I��

				LOOP
					IF W_LoopCNT > W_ENDLOOPCNT THEN
						EXIT;																	--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
					END IF;

					v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);								--�����ƂɓK�p����闘��(�����x)���擾����
					v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					����(�V���x)���擾����

					IF v_KyuyoZandaka > 0 Then
						v_CRRisokuKyuyo := v_CRRisokuKyuyo + FLOOR(v_KyuyoZandaka * v_GetRiritu2);
						v_CRRisoku      := v_CRRisoku      + FlOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
					ELSE
						v_CRRisokuKyuyo := 0;
						v_CRRisoku := 0;
					END IF;
					W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
				END LOOP;
			ELSE
				--�����̕ύX���Ȃ��Ƃ�
				IF v_KyuyoZandaka > 0 Then
---					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 / 100);			-- 10/23 UPD
---					v_CRRisoku      := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 * 10);				-- 10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu);						-- 10/23 UPD
					v_CRRisoku      := FlOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu * 1000000);				-- 10/23 UPD
				ELSE
					v_CRRisokuKyuyo := 0;
					v_CRRisoku := 0;
				END IF;
			END IF;
		ELSE
			v_CRRisokuKyuyo := 0;
			v_CRRisoku := 0;
		END IF;
--����������������������������������������������������������������������������������������������������������������
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
      StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Usr', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Cmp', InStrComputerNM);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KBN,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_YMD,8);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_Kingaku);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_Kingaku);

        IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
          IF v_KBN = '1' THEN
            v_KyuyoZandaka := v_KyuyoZandaka + v_Kingaku;
          ELSE
            v_KyuyoZandaka := v_KyuyoZandaka - v_Kingaku;
          END IF;
        ELSE
          IF v_KBN = '1' THEN
            v_Zandaka := v_Zandaka + v_Kingaku;
          ELSE
            v_Zandaka := v_Zandaka - v_Kingaku;
          END IF;
        END IF;
--����������������������������������������������������������������������������������������������������������������
		/* ���Z������ђ��Ԍ��Z���̂ݖ��������v�Z���s�� */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			/* �ݕt�E�����̂� */
			IF v_KBN = '1' OR v_KBN = '2' THEN
				/* ���^���ȍ~�̓��t */
				IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
					/* �ݕt */
					IF v_KBN = '1' THEN
						/* �c������ */
						IF v_KyuyoZandaka > 0 THEN
							--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);						--�����v�Z�J�n�����_�ł̗�����
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);					--�����v�Z�I�������_�ł̗�����

							IF v_YMD = '20021225' AND InStrYMD = '20030125' THEN
								--2002/12/26 �` 2003/01/25�Ԃ̌v�Z��2002/12/26���_�ł̗����Ōv�Z����(�C�����_�Ŋ��ɒ��߂Ă��܂�����)
								v_GetRiritu  := v_STARTRiritu;										--�����ƂɓK�p����闘��(�����x)���擾����
								v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

								IF v_KyuyoZandaka >= v_Kingaku THEN
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_GetRiritu2 * 1000000);			--10/23 UPD
								/* �ݕt�����c�������Ȃ� */
								ELSE
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_GetRiritu2 * 1000000);	--10/23 UPD
								End IF;

							ELSE
								IF v_YMD = '20030225' THEN
									v_GetRiritu := '7.5';												--2003/02/25���^�̎c���Z�o�Ɍ���A���߂�1���c���ɔ��f�ł��Ȃ�����
									v_GetRiritu  := v_GetRiritu / 100;									--�����̌v�Z���s��
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									IF v_KyuyoZandaka >= v_Kingaku THEN
										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * 6 * v_GetRiritu2 * 1000000);			--10/23 UPD

										v_GetRiritu := '5.9';
										v_GetRiritu  := v_GetRiritu / 100;									--
										v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * 25 * v_GetRiritu2 * 1000000);			--10/23 UPD

									/* �ݕt�����c�������Ȃ� */
									ELSE
										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * 6 * v_GetRiritu2 * 1000000);	--10/23 UPD
										v_GetRiritu := '5.9';
										v_GetRiritu  := v_GetRiritu / 100;									--
										v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * 25 * v_GetRiritu2 * 1000000);	--10/23 UPD
									End IF;
								ELSE

									IF v_StartRiritu <> v_NextRiritu THEN	
										--�Z�o���Ԃɗ����ύX���������ꍇ
										--�P�����Ƃɗ��������擾���ė����v�Z����
										W_LoopCNT        := v_YMD;
										W_ENDLOOPCNT := InStrYMD;

										LOOP
											IF W_LoopCNT > W_ENDLOOPCNT THEN
												EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
											END IF;

											v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--�����ƂɓK�p����闘��(�����x)���擾����
											v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

											/* �ݕt�����c�������� */
											IF v_KyuyoZandaka >= v_Kingaku THEN
												v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
											/* �ݕt�����c�������Ȃ� */
											ELSE
												v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
											End IF;
											W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');			--���ı���
										END LOOP;
									ELSE	--�]���̏���
										/* �ݕt�����c�������� */
										IF v_KyuyoZandaka >= v_Kingaku THEN
											v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
			---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
											v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);			--10/23 UPD
										/* �ݕt�����c�������Ȃ� */
										ELSE
											v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
			---								v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu / 365 * 10);	--10/23 UPD
											v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);	--10/23 UPD
										End IF;
									END IF;
								END IF;
							END IF;
						END IF;
					/* ���� */
					ELSE
						--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);											--�����v�Z�J�n�����_�ł̗�����
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);											--�����v�Z�I�������_�ł̗�����

						IF v_YMD = '20021225' AND InStrYMD = '20030125' THEN
							--2002/12/26 �` 2003/01/25�Ԃ̌v�Z��2002/12/26���_�ł̗����Ōv�Z����(�C�����_�Ŋ��ɒ��߂Ă��܂�����)
							v_GetRiritu  := v_STARTRiritu;										--�����ƂɓK�p����闘��(�����x)���擾����
							v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

							/* �c������ */
							IF v_KyuyoZandaka > 0 Then
								v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_GetRiritu2 * 1000000);				--10/23 UPD
							END IF;

						ELSE
							IF v_YMD = '20030225' THEN
								/* �c������ */
								IF v_KyuyoZandaka > 0 Then
									v_GetRiritu := '7.5';												--2003/02/25���^�̎c���Z�o�Ɍ���A���߂�1���c���ɔ��f�ł��Ȃ�����
									v_GetRiritu  := v_GetRiritu / 100;									--�����̌v�Z���s��
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * 6 * v_GetRiritu2 * 1000000);				--10/23 UPD

									v_GetRiritu := '5.9';												--2003/02/25���^�̎c���Z�o�Ɍ���A���߂�1���c���ɔ��f�ł��Ȃ�����
									v_GetRiritu  := v_GetRiritu / 100;									--�����̌v�Z���s��
									v_GetRiritu2 := TRUNC(v_GetRiritu / 365 * 1000000) / 1000000;		--

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * 25 * v_GetRiritu2 * 1000000);				--10/23 UPD
								END IF;
							ELSE
								IF v_StartRiritu <> v_NextRiritu THEN
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_LoopCNT        := v_YMD + 1;
									W_ENDLOOPCNT := InStrYMD;

									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;																			--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);										--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;						--					����(�V���x)���擾����

										/* �c������ */
										IF v_KyuyoZandaka > 0 Then
											v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
										END IF;
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--���ı���
									END LOOP;
								ELSE
									/* �c������ */
									IF v_KyuyoZandaka > 0 Then
										v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
			---							v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);			--10/23 UPD
										v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);				--10/23 UPD
									END IF;
								END IF;
							END IF;
						END IF;
					End IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);     --10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);     --10/23 UPD
				/* ���^���ȑO�̓��t */
				ELSE
					/* �ݕt */
					IF v_KBN = '1' Then
						/* �c������ */
						IF v_Zandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);								--�����v�Z�J�n�����_�ł̗�����
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);						--�����v�Z�I�������_�ł̗�����

							/* �ݕt�����c�������� */
							IF v_Zandaka >= v_Kingaku Then
								IF v_StartRiritu <> v_NextRiritu THEN
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_LoopCNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--���ı���
									END LOOP;

								ELSE	--�]���̏���
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);			--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);				--10/23 UPD
								END IF;

							/* �ݕt�����c�������Ȃ� */
							ELSE

								IF v_StartRiritu <> v_NextRiritu THEN
									--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_LoopCNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;
								
									LOOP
										IF W_LoopCNT > W_ENDLOOPCNT THEN
											EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);						--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾����

										v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_GetRiritu2 * 1000000);      --10/23 UPD
										W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');				--���ı���

									END LOOP;

								ELSE	--�]���̏���
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu / 365 * 10);  --10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);      --10/23 UPD
								END IF;
							END IF;
						END IF;
					/* ���� */
					ELSE
						/* �c������ */
						IF v_Zandaka > 0 Then
							--TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);									--�����v�Z�J�n�����_�ł̗�����
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);								--�����v�Z�I�������_�ł̗�����

							IF v_StartRiritu <> v_NextRiritu THEN
								LOOP
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_LoopCNT        := v_YMD + 1;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																			--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(W_LoopCNT);										--�����ƂɓK�p����闘��(�����x)���擾����
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;						--					����(�V���x)���擾����

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);				--10/23 UPD
									W_LoopCNT := TO_NUMBER(TO_CHAR(TO_DATE(W_LoopCNT,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');	--���ı���

								END LOOP;
							ELSE	--�]���̏���
								v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
	---							v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);    --10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);        --10/23 UPD
							END IF;
						END IF;
					END IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);      --10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);      --10/23 UPD
				END IF;
			END IF;
		END IF;
	END LOOP;
--����������������������������������������������������������������������������������������������������������������
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      IF v_KyuyoZandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;
      IF v_KaisyaNM = '��������' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;

      /* �ݕt�c���s�ɒǉ� */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'1'
        ,NULL
        ,0
        ,NVL(v_KyuyoZandaka,0)
        ,0
        ,0
        ,NVL(v_CRRisokuKyuyo,0)
        ,0
        ,v_Count
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'1'
			,NULL
			,0
			,NVL(v_KyuyoZandaka,0)
			,0
			,0
			,NVL(v_CRRisokuKyuyo,0)
			,0
			,v_Count
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;

    /* �ݕt�c�����v�\���[�N�e�[�u���쐬 */
    --�J�[�\���I�[�v��
    IF CurMiseV%ISOPEN = FALSE THEN
      OPEN CurMiseV();
    END IF;

    --�e�d�s�b�g
    LOOP
      FETCH CurMiseV INTO RowQPAG;                      --���ǂ�
      IF CurMiseV%NOTFOUND THEN
        EXIT;                               --���[�v�I��
      END IF;

      v_SZan := 0;
      v_KZan := 0;
      v_SMK := 0;
      v_SMS := 0;
      v_KMK := 0;
      v_SCnt := 0;
      v_KCnt := 0;

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
		v_wkKaisyaCD	:= '';
		v_wkKaisyaNM	:= '';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' NVL(QPAV_KAISYACD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAV_KAISYANM,'' ''),';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' NVL(QPAV_SYUBETU,'' ''),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUK),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUS),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIMISYU),';
      StrSQL := StrSQL || ' COUNT(QPAV_SYAINCD2)';
      StrSQL := StrSQL || ' FROM QPAV_ZANDAKASUMV';
      StrSQL := StrSQL || ' WHERE QPAV_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAV_COMPUTERNM = :CMP';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' AND QPAV_TOZAIKBN = :Tozai';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' AND QPAV_MISECD = :Mise';
      StrSQL := StrSQL || ' GROUP BY QPAV_USERID,QPAV_COMPUTERNM,';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' QPAV_KAISYACD,QPAV_KAISYANM,QPAV_TOZAIKBN,';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' QPAV_MISECD,QPAV_SYUBETU';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Mise', RowQPAG.QPAV_MISECD);
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Tozai', RowQPAG.QPAV_TOZAIKBN);
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      /* �o�͕ϐ��̃o�C���h */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Cnt);
*/
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_wkKaisyaCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_wkKaisyaNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* SQL�̎��s */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
			--�c���f�[�^�����݂��Ȃ����́A�X�R�[�h�����Џ����m�肷��
			v_NumCount := 0;
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT COUNT(*)';
			StrSQL := StrSQL || ' FROM QPAH_OTHERM';
			StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
			StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
			/* �J�[�\���̃I�[�v�� */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQL�̉�� */
			DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
			/* ���͕ϐ����o�C���h���� */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', RowQPAG.QPAV_MISECD);
			/* ���[�J���ϐ��ւ̊֘A�Â� */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
			/* SQL�̎��s */
			v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
			END IF;
			/* �J�[�\���̃N���[�Y */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			IF v_NumCount = 0 THEN
				v_wkKaisyaCD	:= RowQPAG.QPAV_MISECD;
				v_wkKaisyaNM	:= RowQPAG.QPAV_MISENM;
			ELSE
				v_wkKaisyaCD	:= '000';
				v_wkKaisyaNM	:= '��������';
			END IF;
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

          EXIT;
        END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Cnt);
*/
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_wkKaisyaCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_wkKaisyaNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
        v_SZan := v_SZan + w_SZan;
        v_KZan := v_KZan + w_KZan;
        v_SMK  := v_SMK  + w_SMK;
        v_SMS  := v_SMS  + w_SMS;
        v_KMK  := v_KMK  + w_KMK;
        IF w_Sybt = '1' THEN
          v_KCnt := w_Cnt;
  ELSE
          v_SCnt := w_Cnt;
  END IF;
      END LOOP;
      /* ���I�J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAX_ZANDAKATOTALW VALUES (
         NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
        ,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
        ,NVL(RowQPAG.QPAV_CODE,' ')
        ,NVL(RowQPAG.QPAV_MISECD,' ')
        ,NVL(RowQPAG.QPAV_MISENM,' ')
        ,NVL(v_SZan,0)
        ,NVL(v_KZan,0)
        ,NVL(v_SMK,0)
        ,NVL(v_SMS,0)
        ,NVL(v_KMK,0)
        ,NVL(v_SCnt,0)
        ,NVL(v_KCnt,0)
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
*/
		INSERT INTO QPAX_ZANDAKATOTALW VALUES (
			 NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
			,NVL(RowQPAG.QPAV_CODE,' ')
			,NVL(RowQPAG.QPAV_MISECD,' ')
			,NVL(RowQPAG.QPAV_MISENM,' ')
			,NVL(v_SZan,0)
			,NVL(v_KZan,0)
			,NVL(v_SMK,0)
			,NVL(v_SMS,0)
			,NVL(v_KMK,0)
			,NVL(v_SCnt,0)
			,NVL(v_KCnt,0)
			,NVL(InStrUserID,' ')
			,NVL(InStrComputerNM,' ')
			,NVL(v_wkKaisyaCD,' ')
			,NVL(v_wkKaisyaNM,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBN,' ')
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
    END LOOP;

    /* �J�[�\���̃N���[�Y */
    CLOSE CurMiseV;

    /* �R�~�b�g */
    COMMIT;

    /* �������擾 */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- �r�s�d�o�Q �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* �ݕt�c�����v�s���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAX_CODE,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOCOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHICOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUK,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUS,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIMISYU,0)';
    StrSQL := StrSQL || ' FROM QPAX_ZANDAKATOTALW';
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' WHERE (QPAX_TOZAIKBNE = :KBN';
--    StrSQL := StrSQL || ' OR QPAX_TOZAIKBNW = :KBN)';
--    StrSQL := StrSQL || ' AND QPAX_USERID = :USR';
--    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' WHERE';
    StrSQL := StrSQL || '     QPAX_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' ORDER BY QPAX_MISECD';
    StrSQL := StrSQL || ' ORDER BY';
    StrSQL := StrSQL || '     QPAX_KAISYACD,';
    StrSQL := StrSQL || '     QPAX_TOZAIKBN,';
    StrSQL := StrSQL || '     QPAX_MISECD';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
/* DEL 20100715 1004091 IMZ SHIBUTANI START */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', InStrTozaiKBN);
/* DEL 20100715 1004091 IMZ SHIBUTANI END */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Code,10);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_SCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_KCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SyosyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KoguchiZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SyosyoMisyuK);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_SyosyoMisyuS);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_KoguchiMisyu);

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Code);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_SCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_KCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SyosyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KoguchiZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SyosyoMisyuK);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_SyosyoMisyuS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_KoguchiMisyu);

    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrCode(NumIdx) := w_Code;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtNumSCount(NumIdx) := w_SCount;
    OtNumKCount(NumIdx) := w_KCount;
    OtNumSyosyoZandaka(NumIdx) := w_SyosyoZandaka;
    OtNumKoguchiZandaka(NumIdx) := w_KoguchiZandaka;
    OtNumSyosyoMisyuK(NumIdx) := w_SyosyoMisyuK;
    OtNumSyosyoMisyuS(NumIdx) := w_SyosyoMisyuS;
    OtNumKoguchiMisyu(NumIdx) := w_KoguchiMisyu;

    /* �z��̌������l�`�w�ɂȂ����ꍇ */
    IF InNumMaxRec <= NumIdx  THEN
      OtNumAryCount :=  NumIdx;
      RETURN;
    END IF;
  END LOOP;

  OtNumAryCount := NumIdx;              --�p�����[�^�ɃZ�b�g
  OtStrEndFlg := '1';               --�p�����[�^�ɃZ�b�g�i�����I���j
  IoNumCursor := TO_NUMBER(InStrKyuyoYMD);
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
    IF CurMiseV%ISOPEN THEN
      CLOSE CurMiseV;
    END IF;
    RAISE ;

END QPAP_CEnt150SelList_Before;



/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt150SelList_After                                                                      */
/* �@�\          �F�c���f�[�^�擾                                                                                 */
/*                 �ܗ^�c���X�V��f�[�^                                                                           */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt150SelList_After (
   InStrYMD           IN     CHAR                                --��������  �o�͔N����
  ,InStrTozaiKBN      IN     CHAR                                --          �����敪
  ,InStrTyuSeiMM      IN     CHAR                                --          ���Ԍ��Z��
  ,InStrSeiMM         IN     CHAR                                --          ���Z��
  ,InStrKyuyoYMD      IN     CHAR                                --          ���^���t
  ,InNumKyuyoNisu     IN     NUMBER                              --          ���^����
  ,InNumKyuyoNisuFrom IN     CHAR                                --          ���^�����̂e�q�n�l
  ,InNumKyuyoNisuTo   IN     CHAR                                --          ���^�����̂s�n
  ,InNumMaxRec        IN     NUMBER                              --�ő�z��i�[����
  ,IoNumCursor        IN OUT NUMBER                              --�Ăяo����
  ,OtNumRecCount         OUT NUMBER                              --����������
  ,OtNumAryCount         OUT NUMBER                              --�z��i�[����
  ,OtStrEndFlg           OUT VARCHAR2                            --�����I���t���O
  ,OtStrCode             OUT typOtCodeAry                        --�R�[�h
  ,OtStrMiseNM           OUT typOtMiseNMAry                      --�X��
  ,OtNumSCount           OUT typOtSCountAry                      --�؏��J�E���g
  ,OtNumKCount           OUT typOtKCountAry                      --�����J�E���g
  ,OtNumSyosyoZandaka    OUT typOtSZandakaAry                    --�؏��c��
  ,OtNumKoguchiZandaka   OUT typOtKZandakaAry                    --�����c��
  ,OtNumSyosyoMisyuK     OUT typOtSMisyuKAry                     --�؏������������^
  ,OtNumSyosyoMisyuS     OUT typOtSMisyuSAry                     --�؏����������ܗ^
  ,OtNumKoguchiMisyu     OUT typOtKMisyuAry                      --������������
  ,InStrUserID        IN     QPAS_KGCW.QPAS_USERID%TYPE          --���[�U�h�c
  ,InStrComputerNM    IN     QPAS_KGCW.QPAS_COMPUTERNM%TYPE) IS  --�R���s���[�^��

  /* �����ŗL�̕ϐ� */
  StrSQL                    VARCHAR2(1000);
  v_CursorID                NUMBER := 0;
  v_CursorID2               NUMBER := 0;
  v_NumCount                NUMBER;
  v_Dummy                   INTEGER;
  v_Dummy2                  INTEGER;
  NumIdx                    NUMBER;

  v_SysCng                  CHAR(8) := '20000301';

  v_Index                   CHAR(3);
  v_KaisyaNM                VARCHAR2(24);
  v_MiseCD                  QPAC_SYAINM.QPAC_MISECD%TYPE;
  v_MiseNM                  QPAE_MISEM.QPAE_MISENM%TYPE;
  v_BumonCD                 QPAC_SYAINM.QPAC_BUMONCD%TYPE;
  v_BumonNM                 QPAF_BUMONM.QPAF_BUMONNM%TYPE;
  v_SyainCD1                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2                QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;
  v_SimeiKanji              QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;
  v_YusiYMD                 CHAR(8);
  v_KyuyoZandaka            QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE;
  v_SyoyoZandaka            QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE;
  v_Riritu                  QPA8_SYNDAICYOT.QPA8_RIRITU%TYPE;
  v_TozaiKBN                QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;
  v_TozaiKBNE               QPAE_MISEM.QPAE_TOZAIKBNE%TYPE;
  v_TozaiKBNW               QPAE_MISEM.QPAE_TOZAIKBNW%TYPE;
  v_BonusYMD1               QPAE_MISEM.QPAE_BONUSYMD1%TYPE;
  v_BonusYMD2               QPAE_MISEM.QPAE_BONUSYMD2%TYPE;
  v_ZenBonusYMD1            CHAR(8);
  v_ZenBonusYMD2            CHAR(8);
  v_ZenBonusYMD             CHAR(8);
  v_TDATE                   CHAR(8);
  v_KDATE                   CHAR(8);
  v_ZenYMD                  CHAR(8);
  v_RisokuNisu              NUMBER;
  v_Risoku                  NUMBER;
  v_CRRisoku                NUMBER;
  v_SyosyoRisokuKyuyo       NUMBER;
  v_SyosyoRisokuSyoyo       NUMBER;
  v_CRRisokuKyuyo           NUMBER;
  v_Zandaka                 NUMBER;
  v_ZenZandaka              NUMBER;
  v_ZenRiritu               NUMBER;
  v_NowRiritu               NUMBER;
  v_Count                   NUMBER;
  v_KBN                     QPAS_KGCW.QPAS_KBN%TYPE;
  v_YMD                     QPAS_KGCW.QPAS_YMD%TYPE;
  v_Kingaku                 QPAS_KGCW.QPAS_KINGAKU%TYPE;

  w_Sybt                    CHAR(1);
  w_SZan                    NUMBER := 0;
  w_KZan                    NUMBER := 0;
  w_SMK                     NUMBER := 0;
  w_SMS                     NUMBER := 0;
  w_KMK                     NUMBER := 0;
  w_Cnt                     NUMBER := 0;

  v_SZan                    NUMBER := 0;
  v_KZan                    NUMBER := 0;
  v_SMK                     NUMBER := 0;
  v_SMS                     NUMBER := 0;
  v_KMK                     NUMBER := 0;
  v_SCnt                    NUMBER := 0;
  v_KCnt                    NUMBER := 0;

  w_Code                    QPAX_ZANDAKATOTALW.QPAX_CODE%TYPE;
  w_MiseCD                  QPAX_ZANDAKATOTALW.QPAX_MISECD%TYPE;
  w_MiseNM                  QPAX_ZANDAKATOTALW.QPAX_MISENM%TYPE;
  w_SCount                  QPAX_ZANDAKATOTALW.QPAX_SYOSYOCOUNT%TYPE;
  w_KCount                  QPAX_ZANDAKATOTALW.QPAX_KOGUCHICOUNT%TYPE;
  w_SyosyoZandaka           QPAX_ZANDAKATOTALW.QPAX_SYOSYOZANDAKA%TYPE;
  w_KoguchiZandaka          QPAX_ZANDAKATOTALW.QPAX_KOGUCHIZANDAKA%TYPE;
  w_SyosyoMisyuK            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUK%TYPE;
  w_SyosyoMisyuS            QPAX_ZANDAKATOTALW.QPAX_SYOSYOMISYUS%TYPE;
  w_KoguchiMisyu            QPAX_ZANDAKATOTALW.QPAX_KOGUCHIMISYU%TYPE;

  /* �؏������s���Ή��@2001/09/28 */
  v_NumFirst                NUMBER;
  v_SyainCD1_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE;
  v_SyainCD2_Save           QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE;

  /* �s�ϐ� */
   RowQPAG                  CurMiseV%ROWTYPE;

  v_SysCng2                 CHAR(8) := '20011101';          -- 10/23 ADD
  v_Riritu2                 NUMBER;                         -- 10/23 ADD

  /*2003/01/24 �����v�Z*/
  W_LoopCNT			NUMBER;						--�����v�Z�p���[�v�J�E���^
  W_ENDLOOPCNT		NUMBER;						--�����v�Z�p���[�v�I���l
  v_GetRiritu		NUMBER;						--�����v�Z�p������(��)
  v_GetRiritu2		NUMBER;						--�����v�Z�p������(�V)
  v_StartRiritu		NUMBER;						--�����v�Z�p�������߂�͈͊J�n���ł̓K�p����
  v_NextRiritu		NUMBER;						--�����v�Z�p�������߂�͈͏I�����ł̓K�p����
  strworkwork		NUMBER;						
  /*2003/01/24 �����v�Z*/

--ADD 20100225 0908047 NBC SAWAME START
 w_Str14SeiMM               CHAR(2);            --���l�������ό�
 w_Str34SeiMM               CHAR(2);            --��O�l�������ό�
--ADD 20100225 0908047 NBC SAWAME END

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
	v_wkTozaiKBN			CHAR(1);		--���[�N�F�����敪
	v_wkKaisyaCD			CHAR(3);		--���[�N�F��ЃR�[�h
	v_wkKaisyaNM			VARCHAR2(24);	--���[�N�F��Ж�
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

BEGIN

/* ----- �r�s�d�o�P �\���f�[�^�������擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    OtstrEndFlg   := '0';
    OtNumRecCount :=  0;
    OtNumAryCount :=  0;
    v_NumCount    :=  0;
    v_NumFirst    :=  0;	--�؏������s���Ή��@2001/09/28

    /* �v�j�e�[�u�������� */
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID   = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID   = InStrUserID
      AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID   = InStrUserID
      AND QPAX_COMPUTERNM = InStrComputerNM;

    /******************/
    /* �؏�           */
    /******************/
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' TO_CHAR(D.QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(D.QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(D.QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE TO_CHAR(D.QPA8_PRMYUSIYMD,''YYYYMMDD'') <= :YMD';
    StrSQL := StrSQL || ' AND D.QPA8_KANSAIYMD IS NULL';
--    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 (+)';
--    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 (+)';
--    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA8_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA8_PRMSYAINCD1,D.QPA8_PRMSYAINCD2,D.QPA8_PRMYUSIYMD';

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', InStrYMD);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_YusiYMD,8);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_SyoyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_Riritu);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 14,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 15,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 16,v_BonusYMD2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock1>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_YusiYMD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_SyoyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_Riritu);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 14,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 15,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 16,v_BonusYMD2);

      /* �����敪���ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock1;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock1;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* ���������ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '��������';
      END IF;

--2002/1/11 �����敪�l������Ή�
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock1;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock1;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 �����敪�l������Ή�


      /*�ܗ^�N�����P*/
      IF TO_NUMBER(v_BonusYMD1) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
      ELSE
        v_ZenBonusYMD1 := SUBSTR(InStrYMD,1,4) || v_BonusYMD1;
        v_ZenBonusYMD1 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD1,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /*�ܗ^�N�����Q*/
      If TO_NUMBER(v_BonusYMD2) <= TO_NUMBER(SUBSTR(InStrYMD,5,4)) THEN
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
      ELSE
        v_ZenBonusYMD2 := SUBSTR(InStrYMD,1,4) || v_BonusYMD2;
        v_ZenBonusYMD2 := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenBonusYMD2,'YYYYMMDD'),-12),'YYYYMMDD');
      END IF;
      /* ��L�ŋ��߂��ܗ^�N�����̂����傫������O��ܗ^�N�����Ƃ���B*/
      IF TO_DATE(v_ZenBonusYMD1,'YYYYMMDD') < TO_DATE(v_ZenBonusYMD2,'YYYYMMDD') THEN
        v_ZenBonusYMD := v_ZenBonusYMD2;
      ELSE
        v_ZenBonusYMD := v_ZenBonusYMD1;
      END IF;
--DEL 20100225 0908047 NBC SAWAME START
--      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      --���l�������Z��
      IF TO_NUMBER(InStrTyuSeiMM) + 3 > 12 THEN
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3 - 12);
      ELSE
         w_Str14SeiMM := TO_CHAR(TO_NUMBER(InStrTyuSeiMM) + 3);
      END IF;
      --��O�l�������Z��
      IF TO_NUMBER(InStrSeiMM) + 3 > 12 THEN
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3 - 12);
      ELSE
         w_Str34SeiMM := TO_CHAR(TO_NUMBER(InStrSeiMM) + 3);
      END IF;
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
          /****************************************************************************/
          /* �Z������ "2000/03/01" �ȍ~�͐V�v�Z���ŁA������O�͋��v�Z���Ōv�Z����B  /
          /****************************************************************************/
          IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng,'YYYYMMDD') THEN
              /************/
              /* �V�v�Z��  /
              /************/
              /*************************/
              /* ���^�̖��������v�Z    */
              /*************************/
              /* �Z�����ɂ��v�Z��������𔻒f����B*/
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* �Z�������A�w�茎�̑O���ȑO�̏ꍇ�i�w�茎�̂Q�T���ɓV����������j*/
                  /* �w�茎�̂Q�U�� �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := SUBSTR(InStrYMD,1,6) || '25';
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              ELSE
                  /* �Z�������A�w�茎�̏ꍇ�i�w�茎�̂Q�T���ɓV�������Ȃ��j*/
                  /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* �v�Z�����������狋�^�̖����������v�Z����B*/
---              v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�� */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�O */                                                    -- 10/23 UPD
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;
              /*************************/
              /* �ܗ^�̖��������v�Z    */
              /*************************/
              /* �Z�����ɂ��v�Z��������𔻒f����B*/
              v_TDATE := SUBSTR(InStrYMD,1,6) || '01';
              IF TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) < TO_NUMBER(SUBSTR(v_TDATE,1,6)) THEN
                  /* �Z�������A�w�茎�̑O���ȑO�̏ꍇ*/
                  /*******************************/
                  /* �ܗ^�̓����̔��f            */
                  /*******************************/
                  /* �Z���N�����O��ܗ^�N���ȍ~�̏ꍇ�́A�Z��������������v�Z����B*/
                  IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                      /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                      v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  ELSE
                      /* �O��ܗ^�N���� �` �w�茎���� �̓������v�Z����B*/
                      v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  END IF;
              ELSE
                  /* �Z�������A�w�茎�̏ꍇ�i�w�茎���ܗ^�����Ƃ��Ă��A�V�����͂Ȃ��j*/
                  /* �Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓������v�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
              END IF;
              /* �v�Z������������ܗ^�̖����������v�Z����B*/
---              v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);    -- 10/23 UPD
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') >= TO_DATE(v_SysCng2,'YYYYMMDD') THEN                -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�� */                                                    -- 10/23 UPD
                  v_Riritu2 := TRUNC(v_Riritu / 36500 * 1000000) / 1000000;                         -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu2);          -- 10/23 UPD
              ELSE                                                                                  -- 10/23 UPD
                  /* �Z�������V�V�X�e���ڍs�O */                                                    -- 10/23 UPD
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 36500);   -- 10/23 UPD
              END IF;                                                                               -- 10/23 UPD
          ELSE
              /************/
              /* ���v�Z��  /
              /************/
              /* ���^�̖��������v�Z */
              v_TDATE := SUBSTR(InStrKyuyoYMD,1,6) || '01';
              IF TO_DATE(v_YusiYMD,'YYYYMMDD') < TO_DATE(v_TDATE,'YYYYMMDD') THEN
                  /* �w�茎�̌��������O�̗Z�����̏ꍇ�i2000/03/01 �̃V�X�e���ύX��͂����������ʂ�Ȃ��j*/
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * InNumKyuyoNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* �w�茎�̌������ȍ~�̗Z�����̏ꍇ�i2000/03/01 �̃V�X�e���ύX��͂������͒ʂ�Ȃ��j*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YusiYMD,'YYYYMMDD') + 1;
                  v_SyosyoRisokuKyuyo := TRUNC(v_KyuyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
              /* �ܗ^�̖��������v�Z */
              IF TO_NUMBER(SUBSTR(v_ZenBonusYMD,1,6)) <= TO_NUMBER(SUBSTR(v_YusiYMD,1,6)) THEN
                  /* �Z���N�����O��ܗ^�N���ȍ~�̏ꍇ�A�Z�����i�v�Z���鎞�́|�P������j �` �w�茎���� �̓����Ōv�Z����B*/
                  v_KDATE := TO_CHAR(TO_DATE(v_YusiYMD,'YYYYMMDD') - 1,'YYYYMMDD');
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_KDATE,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              ELSE
                  /* �Z�������O��ܗ^���ȑO�̏ꍇ�A�O��ܗ^�� �` �w�茎���� �̓����Ōv�Z����B*/
                  v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_ZenBonusYMD,'YYYYMMDD');
                  v_SyosyoRisokuSyoyo := TRUNC(v_SyoyoZandaka * v_RisokuNisu * v_Riritu / 12 / 3000);
              END IF;
          END IF;
      ELSE
          v_SyosyoRisokuKyuyo := 0;
          v_SyosyoRisokuSyoyo := 0;
      END IF;
      v_Zandaka := NVL(v_KyuyoZandaka,0) + NVL(v_SyoyoZandaka,0);

      /* �؏������s���Ή��@2001/09/28 DELETE
      IF v_Zandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;  */
      IF v_KaisyaNM = '��������' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;
      /* �؏������s���Ή��@2001/09/28 */
      IF v_Zandaka = 0 THEN
         GOTO l_InnerBlock1;
      END IF;
      IF v_NumFirst = 0 THEN
         v_Count := 1;
         v_SyainCD1_Save := v_SyainCD1;
         v_SyainCD2_Save := v_SyainCD2;
         v_NumFirst := 1;
      ELSE
        IF   v_SyainCD1 = v_SyainCD1_Save  AND
             v_SyainCD2 = v_SyainCD2_Save  THEN
             v_Count := 0;
        ELSE
             v_Count := 1;
             v_SyainCD1_Save := v_SyainCD1;
             v_SyainCD2_Save := v_SyainCD2;
        END IF;
      END IF;
      /* �ݕt�c���s�ɒǉ� */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'2'
        ,NVL(v_YusiYMD,' ')
        ,NVL(v_Zandaka,0)
        ,0
        ,NVL(v_SyosyoRisokuKyuyo,0)
        ,NVL(v_SyosyoRisokuSyoyo,0)
        ,0
        ,v_Count
        ,0
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'2'
			,NVL(v_YusiYMD,' ')
			,NVL(v_Zandaka,0)
			,0
			,NVL(v_SyosyoRisokuKyuyo,0)
			,NVL(v_SyosyoRisokuSyoyo,0)
			,0
			,v_Count
			,0
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;

    /******************/
    /* ����           */
    /******************/
    /* �w�茎�ƑO���̗��������߂� */
    v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1) + 1,'YYYYMMDD');
    v_ZenRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_ZenRiritu := TRUNC(v_ZenRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

    v_TDATE := TO_CHAR(TO_DATE(InStrKyuyoYMD,'YYYYMMDD') + 1,'YYYYMMDD');
    v_NowRiritu := QPAP_CEnt150GetRiritu(v_TDATE);
    v_NowRiritu := TRUNC(v_NowRiritu / 100 / 365 * 1000000) / 1000000;                        -- 10/23 ADD

--    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrYMD,'YYYYMMDD'),-1) - 1,'YYYYMMDD');
    v_ZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');

    /* �����ޔ��e�[�u���ɑޔ� */
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
      WHERE ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= InStrYMD))
      AND    (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ');
/* 11/01 UPD �����Ώ۔͈͕ύX�̂��ߓ������͌��Ȃ����ƂƂ��� */
    /* ���� */
--    INSERT INTO QPAS_KGCW
--      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
--      SELECT  NVL(QPA5_SYAINCD1,' '),
--        NVL(QPA5_SYAINCD2,' '),
--        '2',
--        TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD'),
--       NVL(QPA5_NYUKINGAKU,0),
--        InStrUserID,
--        InStrComputerNM
--      FROM QPA5_KGCNYUKINT
--      WHERE ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenYMD)
--      AND    (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= InStrYMD));
    /* �ܗ^ */
    INSERT INTO QPAS_KGCW
      (QPAS_SYAINCD1,QPAS_SYAINCD2,QPAS_KBN,QPAS_YMD,QPAS_KINGAKU,QPAS_USERID,QPAS_COMPUTERNM)
      SELECT  NVL(QPA4_SYAINCD1,' '),
        NVL(QPA4_SYAINCD2,' '),
        '4',
        TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD'),
        NVL(QPA4_KOJOGAKU,0),
        InStrUserID,
        InStrComputerNM
      FROM QPA4_KGCKOJOT
      WHERE ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenYMD)
      AND    (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= InStrYMD));

    /* �R�~�b�g */
    COMMIT;

    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT NVL(S.QPAC_MISECD,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_BUMONCD,'' ''),';
    StrSQL := StrSQL || ' NVL(B.QPAF_BUMONNM,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD1,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_PRMSYAINCD2,'' ''),';
    StrSQL := StrSQL || ' NVL(S.QPAC_SIMEIKANJI,'' ''),';
    StrSQL := StrSQL || ' NVL(D.QPA1_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(S.QPAC_TOZAIKBN,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNE,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_TOZAIKBNW,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD1,'' ''),';
    StrSQL := StrSQL || ' NVL(M.QPAE_BONUSYMD2,'' '')';
    StrSQL := StrSQL || ' FROM QPA1_KGCDAICYOT D,';
    StrSQL := StrSQL || ' QPAC_SYAINM S,';
    StrSQL := StrSQL || ' QPAE_MISEM M,';
    StrSQL := StrSQL || ' QPAF_BUMONM B';
    StrSQL := StrSQL || ' WHERE D.QPA1_PRMSYAINCD1 = S.QPAC_PRMSYAINCD1 ';
    StrSQL := StrSQL || ' AND D.QPA1_PRMSYAINCD2 = S.QPAC_PRMSYAINCD2 ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = M.QPAE_PRMMISECD ';
    StrSQL := StrSQL || ' AND S.QPAC_MISECD = B.QPAF_PRMMISECD (+)';
    StrSQL := StrSQL || ' AND S.QPAC_BUMONCD = B.QPAF_PRMBUMONCD (+)';
    StrSQL := StrSQL || ' ORDER BY D.QPA1_PRMSYAINCD1,D.QPA1_PRMSYAINCD2';

    /* �J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���[�J���ϐ��ւ̊֘A�Â� */
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 1,v_MiseCD,3);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 2,v_MiseNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 3,v_BumonCD,6);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 4,v_BumonNM,24);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 5,v_SyainCD1,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 6,v_SyainCD2,7);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 7,v_SimeiKanji,20);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 8,v_KyuyoZandaka);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 9,v_TozaiKBN,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 10,v_TozaiKBNE,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 11,v_TozaiKBNW,1);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 12,v_BonusYMD1,4);
    DBMS_SQL.DEFINE_COLUMN(v_CursorID, 13,v_BonusYMD2,4);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
    /* FETCH */
    LOOP
      <<l_InnerBlock2>>
      IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
        EXIT;
      END IF;
      /* �ϐ��֊i�[ */
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 1,v_MiseCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 2,v_MiseNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 3,v_BumonCD);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 4,v_BumonNM);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 5,v_SyainCD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 6,v_SyainCD2);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 7,v_SimeiKanji);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 8,v_KyuyoZandaka);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 9,v_TozaiKBN);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 10,v_TozaiKBNE);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 11,v_TozaiKBNW);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 12,v_BonusYMD1);
      DBMS_SQL.COLUMN_VALUE(v_CursorID, 13,v_BonusYMD2);

      /* �����敪���ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TKHON%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      IF v_NumCount = 0 THEN
        IF InStrTozaiKBN <> v_TozaiKBNE THEN
          IF InStrTozaiKBN <> v_TozaiKBNW THEN
            GOTO l_InnerBlock2;
          END IF;
        END IF;
      ELSE
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
      END IF;
*/
		IF v_NumCount = 0 THEN
			IF v_TozaiKBNE = '1' THEN
				v_wkTozaiKBN := v_TozaiKBNE;
			ELSIF v_TozaiKBNW = '2' THEN
				v_wkTozaiKBN := v_TozaiKBNW;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		ELSE
			IF v_TozaiKBN <> '0' THEN
				v_wkTozaiKBN := v_TozaiKBN;
			ELSE
				GOTO l_InnerBlock2;
			END IF;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* ���������ǂ��� */
      v_NumCount := 0;
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT COUNT(*)';
      StrSQL := StrSQL || ' FROM QPAH_OTHERM';
      StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
      StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', v_MiseCD);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      IF v_NumCount = 0 THEN
        v_KaisyaNM := v_MiseNM;
      ELSE
        v_KaisyaNM := '��������';
      END IF;
--2002/1/11 �����敪�l������Ή�
      IF v_MiseCD = '095' THEN
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        IF InStrTozaiKBN <> v_TozaiKBN THEN
          GOTO l_InnerBlock2;
        END IF;
*/
		IF v_TozaiKBN = '0' THEN
			GOTO l_InnerBlock2;
		END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
      END IF;
--2002/1/11 �����敪�l������Ή�

      /* �O�O�����^�c���Q�� */
      v_ZenZandaka := 0;
      v_TDATE := TO_CHAR(ADD_MONTHS(TO_DATE(InStrKyuyoYMD,'YYYYMMDD'),-1),'YYYYMMDD');
      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT NVL(QPA3_ZANDAKA,0)';
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

      /* �J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':KBN', '3');
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':YMD', v_TDATE);
      /* ���[�J���ϐ��ւ̊֘A�Â� */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_ZenZandaka);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
        DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_ZenZandaka);
      END IF;
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

      v_Zandaka := v_ZenZandaka;
--����������������������������������������������������������������������������������������������������������������
		/* ���Z������ђ��Ԍ��Z���̂ݖ��������v�Z���s�� */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			IF v_KyuyoZandaka > 0 Then

				v_StartRiritu := QPAP_CEnt150GetRiritu(InNumKyuyoNisuFrom + 1);									--�����v�Z�J�n�����_�ł̗����� 2003/01/24
				v_NextRiritu  := QPAP_CEnt150GetRiritu(InNumKyuyoNisuTo);										--�����v�Z�I�������_�ł̗����� 2003/01/24

				IF v_StartRiritu <> v_NextRiritu THEN															-- 2003/01/24
					--�P�����Ƃɗ��������擾���ė����v�Z����
					W_CNT        := InNumKyuyoNisuFrom + 1;														--�W�v���[�v�̊J�n 2003/01/24
					W_ENDLOOPCNT := InNumKyuyoNisuTo;															--�W�v���[�v�̏I�� 2003/01/24

					LOOP
						IF W_CNT > W_ENDLOOPCNT THEN
							EXIT;															--�����Z�o�͈͂̏I���𒴂����烋�[�v�I�� 2003/01/24
						END IF;

						v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);						--�����ƂɓK�p����闘��(�����x)���擾���� 2003/01/24
						v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;		--					����(�V���x)���擾���� 2003/01/24

						v_CRRisokuKyuyo := v_CRRisokuKyuyo + FLOOR(v_KyuyoZandaka * v_GetRiritu2);
						v_CRRisoku      := v_CRRisoku + FlOOR(v_KyuyoZandaka * v_GetRiritu2 * 1000000);
					END LOOP;
				ELSE	--�]���̏���
---					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 / 100);			-- 10/23 UPD
---					v_CRRisoku      := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu / 365 * 10);				-- 10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu);						-- 10/23 UPD
					v_CRRisoku      := FlOOR(v_KyuyoZandaka * InNumKyuyoNisu * v_NowRiritu * 1000000);				-- 10/23 UPD
				END IF;
			ELSE
				v_CRRisokuKyuyo := 0;
				v_CRRisoku := 0;
			END IF;
		ELSE
			v_CRRisokuKyuyo := 0;
			v_CRRisoku := 0;
		END IF;
--����������������������������������������������������������������������������������������������������������������
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
      StrSQL := StrSQL || ' ORDER BY QPAS_YMD,QPAS_KBN';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code1', v_SyainCD1);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code2', v_SyainCD2);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Usr', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Cmp', InStrComputerNM);
      /* �o�͕ϐ��̃o�C���h */
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,1,v_KBN,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,2,v_YMD,8);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID2,3,v_Kingaku);
      /* SQL�̎��s */
      v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
      LOOP
        IF  DBMS_SQL.FETCH_ROWS (v_CursorID2) = 0 THEN
          EXIT;
        END IF;
        /* �J�����l��ϐ��֊i�[ */
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,1,v_KBN);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,2,v_YMD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID2,3,v_Kingaku);

        IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
          IF v_KBN = '1' THEN
            v_KyuyoZandaka := v_KyuyoZandaka + v_Kingaku;
          ELSE
            v_KyuyoZandaka := v_KyuyoZandaka - v_Kingaku;
          END IF;
        ELSE
          IF v_KBN = '1' THEN
            v_Zandaka := v_Zandaka + v_Kingaku;
          ELSE
            v_Zandaka := v_Zandaka - v_Kingaku;
          END IF;
        END IF;
--����������������������������������������������������������������������������������������������������������������
		/* ���Z������ђ��Ԍ��Z���̂ݖ��������v�Z���s�� */
--DEL 20100225 0908047 NBC SAWAME START
--		IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
--			OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) THEN
--DEL 20100225 0908047 NBC SAWAME END
--ADD 20100225 0908047 NBC SAWAME START
      /* ���l�������ό��A��O�l�������ό��ǉ� */
      IF TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrTyuSeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(InStrSeiMM) 
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str14SeiMM)
          OR TO_NUMBER(SUBSTR(InStrYMD,5,2)) = TO_NUMBER(w_Str34SeiMM) THEN
--ADD 20100225 0908047 NBC SAWAME END
			/* �ݕt�E�����̂� */
			IF v_KBN = '1' OR v_KBN = '2' THEN
				/* ���^���ȍ~�̓��t */
				IF TO_DATE(InStrKyuyoYMD,'YYYYMMDD') < TO_DATE(v_YMD,'YYYYMMDD') THEN
					/* �ݕt */
					IF v_KBN = '1' THEN
						/* �c������ */
						--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);							--�����v�Z�J�n�����_�ł̗�����
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrYMD);						--�����v�Z�I�������_�ł̗�����

						IF v_KyuyoZandaka > 0 THEN
							/* �ݕt�����c�������� */
							IF v_KyuyoZandaka >= v_Kingaku THEN
								--�P�����Ƃɗ��������擾���ė����v�Z����
								IF v_StartRiritu <> v_NextRiritu THEN
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					����(�V���x)���擾����

										v_CRRisoku   := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);					--10/23 UPD
										w_Cnt        := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
									END LOOP;
								ELSE	--�]���̏���
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);			--10/23 UPD
								END IF;
							/* �ݕt�����c�������Ȃ� */
							ELSE
								IF v_StartRiritu <> v_NextRiritu THEN
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := v_ZenYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																	--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);								--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					����(�V���x)���擾����

										v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);		--10/23 UPD
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');		--���ı���
									END LOOP;
								ELSE
									v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_KyuyoZandaka * v_RisokuNisu * v_NowRiritu * 1000000);		--10/23 UPD
								END IF;

							End IF;
						END IF;
					/* ���� */
					ELSE
						/* �c������ */
						IF v_KyuyoZandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
							v_StartRiritu  := QPAP_CEnt150GetRiritu(v_YMD + 1);							--�����v�Z�J�n�����_�ł̗�����
							v_NextRiritu   := QPAP_CEnt150GetRiritu(InStrYMD);						--�����v�Z�I�������_�ł̗�����

							IF v_StartRiritu <> v_NextRiritu THEN
								W_CNT        := v_YMD;
								W_ENDLOOPCNT := v_ZenYMD;

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																	--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);								--�����ƂɓK�p����闘��(�����x)���擾����
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;				--					����(�V���x)���擾����

									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
								END LOOP;
							ELSE
								v_RisokuNisu := TO_DATE(InStrYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
---								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu / 365 * 10);			--10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_NowRiritu * 1000000);				--10/23 UPD
							END IF;
						END IF;
					End IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);						--10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);						--10/23 UPD
				/* ���^���ȑO�̓��t */
				ELSE
					/* �ݕt */
					IF v_KBN = '1' Then
					/* �c������ */
						IF v_Zandaka > 0 Then
							--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
							v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD);						--�����v�Z�J�n�����_�ł̗�����
							v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);							--�����v�Z�I�������_�ł̗�����

							/* �ݕt�����c�������� */
							IF v_Zandaka >= v_Kingaku Then
								IF v_StartRiritu <> v_NextRiritu THEN
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					����(�V���x)���擾����

										v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);					--10/23 UPD
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
									END LOOP;
								ELSE	--�]���̏���
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);		--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);			--10/23 UPD
								END IF;
								/* �ݕt�����c�������Ȃ� */
							ELSE

								IF v_StartRiritu <> v_NextRiritu THEN
									--�P�����Ƃɗ��������擾���ė����v�Z����
									W_CNT        := v_YMD;
									W_ENDLOOPCNT := InStrKyuyoYMD;

									LOOP
										IF W_CNT > W_ENDLOOPCNT THEN
											EXIT;																				--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
										END IF;

										v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--�����ƂɓK�p����闘��(�����x)���擾����
										v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					����(�V���x)���擾����

										v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);
										w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
									END LOOP;
								ELSE	--�����̕ύX��������
									v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD') + 1;
	---								v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu / 365 * 10);			--10/23 UPD
									v_CRRisoku := v_CRRisoku + FLOOR(v_Zandaka * v_RisokuNisu * v_ZenRiritu * 1000000);				--10/23 UPD
								END IF;

							END IF;
						END IF;
					/* ���� */
					ELSE
						--v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
						v_StartRiritu := QPAP_CEnt150GetRiritu(v_YMD + 1);						--�����v�Z�J�n�����_�ł̗�����
						v_NextRiritu  := QPAP_CEnt150GetRiritu(InStrKyuyoYMD);					--�����v�Z�I�������_�ł̗�����

						/* �c������ */
						IF v_Zandaka > 0 Then
							IF v_StartRiritu <> v_NextRiritu THEN
								--�P�����Ƃɗ��������擾���ė����v�Z����
								W_CNT        := v_YMD + 1;
								W_ENDLOOPCNT := InStrKyuyoYMD;

								LOOP
									IF W_CNT > W_ENDLOOPCNT THEN
										EXIT;																				--�����Z�o�͈͂̏I���𒴂����烋�[�v�I��
									END IF;

									v_GetRiritu  := QPAP_CEnt150GetRiritu(w_Cnt);											--�����ƂɓK�p����闘��(�����x)���擾����
									v_GetRiritu2 := TRUNC(v_GetRiritu / 36500 * 1000000) / 1000000;							--					����(�V���x)���擾����
									v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_GetRiritu2 * 1000000);
									w_Cnt := TO_NUMBER(TO_CHAR(TO_DATE(w_Cnt,'YYYYMMDD') + 1,'YYYYMMDD'),'99999999');
								END LOOP;
							ELSE
								v_RisokuNisu := TO_DATE(InStrKyuyoYMD,'YYYYMMDD') - TO_DATE(v_YMD,'YYYYMMDD');
---								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu / 365 * 10);		--10/23 UPD
								v_CRRisoku := v_CRRisoku - FLOOR(v_Kingaku * v_RisokuNisu * v_ZenRiritu * 1000000);			--10/23 UPD
							END IF;
						END IF;
					END IF;
---					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000);			--10/23 UPD
					v_CRRisokuKyuyo := FLOOR(v_CRRisoku / 1000000);			--10/23 UPD
				END IF;
			END IF;
		END IF;

      END LOOP;
--����������������������������������������������������������������������������������������������������������������
      /* �J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
      IF v_KyuyoZandaka <> 0 THEN
        v_Count := 1;
      ELSE
        v_Count := 0;
      END IF;
      IF v_KaisyaNM = '��������' THEN
        v_Index := '000';
      ELSE
        v_Index := v_MiseCD;
      END IF;

      /* �ݕt�c���s�ɒǉ� */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAQ_ZANDAKAW VALUES (
         NVL(v_Index,' ')
        ,NVL(v_KaisyaNM,' ')
        ,NVL(v_MiseCD,' ')
        ,NVL(v_MiseNM,' ')
        ,NVL(v_BumonCD,' ')
        ,NVL(v_BumonNM,' ')
        ,NVL(v_SyainCD1,' ')
        ,NVL(v_SyainCD2,' ')
        ,NVL(v_SimeiKanji,' ')
        ,'1'
        ,NULL
        ,0
        ,NVL(v_KyuyoZandaka,0)
        ,0
        ,0
        ,NVL(v_CRRisokuKyuyo,0)
        ,0
        ,v_Count
        ,InStrUserID
        ,InStrComputerNM);
*/
		INSERT INTO QPAQ_ZANDAKAW VALUES (
			 NVL(v_Index,' ')
			,NVL(v_KaisyaNM,' ')
			,NVL(v_MiseCD,' ')
			,NVL(v_MiseNM,' ')
			,NVL(v_BumonCD,' ')
			,NVL(v_BumonNM,' ')
			,NVL(v_SyainCD1,' ')
			,NVL(v_SyainCD2,' ')
			,NVL(v_SimeiKanji,' ')
			,'1'
			,NULL
			,0
			,NVL(v_KyuyoZandaka,0)
			,0
			,0
			,NVL(v_CRRisokuKyuyo,0)
			,0
			,v_Count
			,InStrUserID
			,InStrComputerNM
			,v_wkTozaiKBN
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    END LOOP;
    /* �J�[�\���̃N���[�Y */
    DBMS_SQL.CLOSE_CURSOR (v_CursorID);

    /* �R�~�b�g */
    COMMIT;

    /* �ݕt�c�����v�\���[�N�e�[�u���쐬 */
    --�J�[�\���I�[�v��
    IF CurMiseV%ISOPEN = FALSE THEN
      OPEN CurMiseV();
    END IF;

    --�e�d�s�b�g
    LOOP
      FETCH CurMiseV INTO RowQPAG;                      --���ǂ�
      IF CurMiseV%NOTFOUND THEN
        EXIT;                               --���[�v�I��
      END IF;

      v_SZan := 0;
      v_KZan := 0;
      v_SMK := 0;
      v_SMS := 0;
      v_KMK := 0;
      v_SCnt := 0;
      v_KCnt := 0;

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
		v_wkKaisyaCD	:= '';
		v_wkKaisyaNM	:= '';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      StrSQL := NULL;
      StrSQL := StrSQL || 'SELECT';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' NVL(QPAV_KAISYACD,'' ''),';
      StrSQL := StrSQL || ' NVL(QPAV_KAISYANM,'' ''),';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' NVL(QPAV_SYUBETU,'' ''),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIZANDAKA),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUK),';
      StrSQL := StrSQL || ' SUM(QPAV_SYOSYOMISYUS),';
      StrSQL := StrSQL || ' SUM(QPAV_KOGUCHIMISYU),';
      StrSQL := StrSQL || ' COUNT(QPAV_SYAINCD2)';
      StrSQL := StrSQL || ' FROM QPAV_ZANDAKASUMV';
      StrSQL := StrSQL || ' WHERE QPAV_USERID = :USR';
      StrSQL := StrSQL || ' AND QPAV_COMPUTERNM = :CMP';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' AND QPAV_TOZAIKBN = :Tozai';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' AND QPAV_MISECD = :Mise';
      StrSQL := StrSQL || ' GROUP BY QPAV_USERID,QPAV_COMPUTERNM,';
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      StrSQL := StrSQL || ' QPAV_KAISYACD,QPAV_KAISYANM,QPAV_TOZAIKBN,';
/* ADD 20100715 1004091 IMZ SHIBUTANI END */
      StrSQL := StrSQL || ' QPAV_MISECD,QPAV_SYUBETU';

      /* ���I�J�[�\���̃I�[�v�� */
      v_CursorID  := DBMS_SQL.OPEN_CURSOR;
      /* SQL�̉�� */
      DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
      /* ���͕ϐ����o�C���h���� */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Mise', RowQPAG.QPAV_MISECD);
/* ADD 20100715 1004091 IMZ SHIBUTANI START */
      DBMS_SQL.BIND_VARIABLE(v_CursorID,':Tozai', RowQPAG.QPAV_TOZAIKBN);
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

      /* �o�͕ϐ��̃o�C���h */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_Cnt);
*/
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_wkKaisyaCD,3);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_wkKaisyaNM,24);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_Sybt,1);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_SZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_KZan);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_SMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SMS);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_KMK);
      DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

      /* SQL�̎��s */
      v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);

      LOOP
        IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN

/* ADD 20100715 1004091 IMZ SHIBUTANI START */
			--�c���f�[�^�����݂��Ȃ����́A�X�R�[�h�����Џ����m�肷��
			v_NumCount := 0;
			StrSQL := NULL;
			StrSQL := StrSQL || 'SELECT COUNT(*)';
			StrSQL := StrSQL || ' FROM QPAH_OTHERM';
			StrSQL := StrSQL || ' WHERE QPAH_OTHERM.QPAH_PRMCODE Like ''TMISE%''';
			StrSQL := StrSQL || ' AND LTRIM(RTRIM(QPAH_OTHERM.QPAH_NAMEX))  = :Code';
			/* �J�[�\���̃I�[�v�� */
			v_CursorID2  := DBMS_SQL.OPEN_CURSOR;
			/* SQL�̉�� */
			DBMS_SQL.PARSE (v_CursorID2,StrSQL, DBMS_SQL.v7);
			/* ���͕ϐ����o�C���h���� */
			DBMS_SQL.BIND_VARIABLE(v_CursorID2,':Code', RowQPAG.QPAV_MISECD);
			/* ���[�J���ϐ��ւ̊֘A�Â� */
			DBMS_SQL.DEFINE_COLUMN(v_CursorID2, 1,v_NumCount);
			/* SQL�̎��s */
			v_Dummy2 := DBMS_SQL.EXECUTE (v_CursorID2);
			IF DBMS_SQL.FETCH_ROWS (v_CursorID2) <> 0 THEN
				DBMS_SQL.COLUMN_VALUE(v_CursorID2, 1,v_NumCount);
			END IF;
			/* �J�[�\���̃N���[�Y */
			DBMS_SQL.CLOSE_CURSOR (v_CursorID2);

			IF v_NumCount = 0 THEN
				v_wkKaisyaCD	:= RowQPAG.QPAV_MISECD;
				v_wkKaisyaNM	:= RowQPAG.QPAV_MISENM;
			ELSE
				v_wkKaisyaCD	:= '000';
				v_wkKaisyaNM	:= '��������';
			END IF;
/* ADD 20100715 1004091 IMZ SHIBUTANI END */

          EXIT;
        END IF;
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_Cnt);
*/
        DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_wkKaisyaCD);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_wkKaisyaNM);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_Sybt);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_SZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_KZan);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_SMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SMS);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_KMK);
        DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_Cnt);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
        v_SZan := v_SZan + w_SZan;
        v_KZan := v_KZan + w_KZan;
        v_SMK  := v_SMK  + w_SMK;
        v_SMS  := v_SMS  + w_SMS;
        v_KMK  := v_KMK  + w_KMK;
        IF w_Sybt = '1' THEN
          v_KCnt := w_Cnt;
  ELSE
          v_SCnt := w_Cnt;
  END IF;
      END LOOP;
      /* ���I�J�[�\���̃N���[�Y */
      DBMS_SQL.CLOSE_CURSOR (v_CursorID);

/* MOD 20100715 1004091 IMZ SHIBUTANI START */
/*
      INSERT INTO QPAX_ZANDAKATOTALW VALUES (
         NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
        ,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
        ,NVL(RowQPAG.QPAV_CODE,' ')
        ,NVL(RowQPAG.QPAV_MISECD,' ')
        ,NVL(RowQPAG.QPAV_MISENM,' ')
        ,NVL(v_SZan,0)
        ,NVL(v_KZan,0)
        ,NVL(v_SMK,0)
        ,NVL(v_SMS,0)
        ,NVL(v_KMK,0)
        ,NVL(v_SCnt,0)
        ,NVL(v_KCnt,0)
        ,NVL(InStrUserID,' ')
        ,NVL(InStrComputerNM,' '));
*/
		INSERT INTO QPAX_ZANDAKATOTALW VALUES (
			 NVL(RowQPAG.QPAV_TOZAIKBNE,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBNW,' ')
			,NVL(RowQPAG.QPAV_CODE,' ')
			,NVL(RowQPAG.QPAV_MISECD,' ')
			,NVL(RowQPAG.QPAV_MISENM,' ')
			,NVL(v_SZan,0)
			,NVL(v_KZan,0)
			,NVL(v_SMK,0)
			,NVL(v_SMS,0)
			,NVL(v_KMK,0)
			,NVL(v_SCnt,0)
			,NVL(v_KCnt,0)
			,NVL(InStrUserID,' ')
			,NVL(InStrComputerNM,' ')
			,NVL(v_wkKaisyaCD,' ')
			,NVL(v_wkKaisyaNM,' ')
			,NVL(RowQPAG.QPAV_TOZAIKBN,' ')
			);
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
    END LOOP;

    /* �J�[�\���̃N���[�Y */
    CLOSE CurMiseV;

    /* �R�~�b�g */
    COMMIT;

    /* �������擾 */
    v_NumCount := 0;
    SELECT COUNT(*) INTO v_NumCount FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID = InStrUserID
      AND QPAQ_COMPUTERNM = InStrComputerNM;

    OtNumRecCount := v_NumCount;
  END IF;

/* ----- �r�s�d�o�Q �\���f�[�^�擾 ----- */
  IF IoNumCursor = 0 THEN       --�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
    /* �ݕt�c�����v�s���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' NVL(QPAX_CODE,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_MISENM,'' ''),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOCOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHICOUNT,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUK,0),';
    StrSQL := StrSQL || ' NVL(QPAX_SYOSYOMISYUS,0),';
    StrSQL := StrSQL || ' NVL(QPAX_KOGUCHIMISYU,0)';
    StrSQL := StrSQL || ' FROM QPAX_ZANDAKATOTALW';
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' WHERE (QPAX_TOZAIKBNE = :KBN';
--    StrSQL := StrSQL || ' OR QPAX_TOZAIKBNW = :KBN)';
--    StrSQL := StrSQL || ' AND QPAX_USERID = :USR';
--    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
    StrSQL := StrSQL || ' WHERE';
    StrSQL := StrSQL || '     QPAX_USERID = :USR';
    StrSQL := StrSQL || ' AND QPAX_COMPUTERNM = :CMP';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */
/* MOD 20100715 1004091 IMZ SHIBUTANI START */
--    StrSQL := StrSQL || ' ORDER BY QPAX_MISECD';
    StrSQL := StrSQL || ' ORDER BY';
    StrSQL := StrSQL || '     QPAX_KAISYACD,';
    StrSQL := StrSQL || '     QPAX_TOZAIKBN,';
    StrSQL := StrSQL || '     QPAX_MISECD';
/* MOD 20100715 1004091 IMZ SHIBUTANI END */

    /* ���I�J�[�\���̃I�[�v�� */
    v_CursorID  := DBMS_SQL.OPEN_CURSOR;
    /* SQL�̉�� */
    DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
    /* ���͕ϐ����o�C���h���� */
/* DEL 20100715 1004091 IMZ SHIBUTANI START */
--    DBMS_SQL.BIND_VARIABLE(v_CursorID,':KBN', InStrTozaiKBN);
/* DEL 20100715 1004091 IMZ SHIBUTANI END */
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':USR', InStrUserID);
    DBMS_SQL.BIND_VARIABLE(v_CursorID,':CMP', InStrComputerNM);
    /* SQL�̎��s */
    v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
  ELSE
    /* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
    v_CursorID  := IoNumCursor;
  END IF;

  IoNumCursor :=  v_CursorID;             --�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
  /* �o�͕ϐ��̃o�C���h */
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,w_Code,10);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,w_MiseNM,24);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,w_SCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,w_KCount);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,w_SyosyoZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,w_KoguchiZandaka);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,w_SyosyoMisyuK);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,w_SyosyoMisyuS);
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,w_KoguchiMisyu);

  /* FETCH */
  NumIdx := 0;
  LOOP
    IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
      EXIT;
    END IF;
    /* �J�����l��ϐ��֊i�[ */
    DBMS_SQL.COLUMN_VALUE(v_CursorID,1,w_Code);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,2,w_MiseNM);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,3,w_SCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,4,w_KCount);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,5,w_SyosyoZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,6,w_KoguchiZandaka);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,7,w_SyosyoMisyuK);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,8,w_SyosyoMisyuS);
    DBMS_SQL.COLUMN_VALUE(v_CursorID,9,w_KoguchiMisyu);

    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrCode(NumIdx) := w_Code;
    OtStrMiseNM(NumIdx) := w_MiseNM;
    OtNumSCount(NumIdx) := w_SCount;
    OtNumKCount(NumIdx) := w_KCount;
    OtNumSyosyoZandaka(NumIdx) := w_SyosyoZandaka;
    OtNumKoguchiZandaka(NumIdx) := w_KoguchiZandaka;
    OtNumSyosyoMisyuK(NumIdx) := w_SyosyoMisyuK;
    OtNumSyosyoMisyuS(NumIdx) := w_SyosyoMisyuS;
    OtNumKoguchiMisyu(NumIdx) := w_KoguchiMisyu;

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
    IF DBMS_SQL.IS_OPEN (v_CursorID2) THEN
      DBMS_SQL.CLOSE_CURSOR (v_CursorID2);
    END IF;
    IF CurMiseV%ISOPEN THEN
      CLOSE CurMiseV;
    END IF;
    RAISE ;

END QPAP_CEnt150SelList_After;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt150GetRiritu                                                */
/* �@�\          �F�����Z�������擾                                                     */
/******************************************************************************************************************/
FUNCTION QPAP_CEnt150GetRiritu(
   InStrYMD   IN  CHAR) RETURN NUMBER IS

  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_Dummy       INTEGER;
  v_Riritu      NUMBER := 0;
  v_HenkoRiritu     QPA7_KGCRIRITUT.QPA7_RIRITU%TYPE;

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
END QPAP_CEnt150GetRiritu;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt150DelWorkTbl                                    */
/* �@�\          �F�g�p���[�N�e�[�u���S�폜                                  */
/*****************************************************************************/
PROCEDURE QPAP_CEnt150DelWorkTbl(
    InStrUserID     IN  VARCHAR2,         --���[�U�[�h�c
    InStrComputerNM IN  VARCHAR2) IS      --�R���s���[�^��

BEGIN
    DELETE FROM QPAQ_ZANDAKAW
      WHERE QPAQ_USERID     = InStrUserID
        AND QPAQ_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAS_KGCW
      WHERE QPAS_USERID     = InStrUserID
        AND QPAS_COMPUTERNM = InStrComputerNM;

    DELETE FROM QPAX_ZANDAKATOTALW
      WHERE QPAX_USERID     = InStrUserID
        AND QPAX_COMPUTERNM = InStrComputerNM;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END QPAP_CEnt150DelWorkTbl;

END QPAP_CEnt150PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
