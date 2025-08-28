CREATE OR REPLACE PACKAGE  QPAP_CEnt090PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt090PkG                                                                                */
/* �@�\          �F�؏��ݕt��������                                                                               */
/* �쐬��        �F2001/07/10                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/
/* �C����        �F2005/01/25                                                                                     */
/* �C����        �FFIP SEKINE                                                                                     */
/* �C�����e      �F���ϒʒm���o�͂ɔ����C���B����������ǉ��i�R�[�h���e���擾�j                                   */
/*                 ���ӁIQPAP_CEnt410PkG���ɃR���p�C���̂���                                                    */
/******************************************************************************************************************/
------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20100225  0908047          �O���[�v�Ј��؏��ݕt���[������2��
--                           �P�D���ϓ��̓��̓`�F�b�N��ǉ�(�{�����܂ޓ����������̂݉�)
--                           �Q�D�����E����߂��ɑΉ�
--                               �E�O���b�h�Ǝq��ʂ̎c���\���ɕ���߂����̋��z��������
--                               �E����߂����܂ތ_�񂪊��ς��ꂽ�ꍇ�A����߂��f�[�^�𕪉�����
--                               �E��L���ς��������ꂽ�ꍇ�A�Ăѕ���߂��ɂ���
--                           �R�D�ܗ^�̎c���擾���@���ܗ^�T�������f�����O�̎c�����擾����悤�ɕύX����
--                               (1���̌l�ݕt���ׂł̑Ή��Ɠ��l)
--                           �S�D���Z���z�̌v�Z���W�b�N���l�ݕt���ׂƓ��l�ɂ���
--                               (�ŏI�������~�����v�Z�������ɑΉ�)
------------------------------------------------------------------------------------------------

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

--ADD 20100225 0908047 NBC YOKOYAMA START
	TYPE typOtKyuyoModAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_KYUYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;

	TYPE typOtSyoyoModAry IS TABLE OF QPA8_SYNDAICYOT.QPA8_SYOYOZANDAKA%TYPE
		INDEX BY BINARY_INTEGER;
--ADD 20100225 0908047 NBC YOKOYAMA END

	TYPE typOtKansaiYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;

/* �Ј������̕\�� */
PROCEDURE	QPAP_Cent090SelSyainZoku (
	InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--�Ј��R�[�h�P
	InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--�Ј��R�[�h�Q
	OtStrSimeiKana		OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,		--�����J�i
	OtStrSimeiKanji		OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--��������
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,			--�����X�R�[�h
	OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,			--�X����
	OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--�����敪
	OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,			--��������R�[�h
	OtStrBumonName		OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,			--���喼��
	OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,			--���i�R�[�h
	OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,			--�����R�[�h
	OtStrBornYMD		OUT	VARCHAR2,								--���N����
	OtStrSonzaiFlg		OUT	VARCHAR2);								--����Flg (����̑��� Check)

/* �ݕt�f�[�^�擾 */
PROCEDURE	QPAP_CEnt090SelList (
	InStrSyainCD1		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE,	--��������  �Ј��R�[�h�P
	InStrSyainCD2		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE,	--          �Ј��R�[�h�Q
	InNumMaxRec			IN	NUMBER,									--�ő�z��i�[����
	IoNumCursor		IN	OUT	NUMBER,									--�Ăяo����
	OtNumRecCount		OUT	NUMBER,									--����������
	OtNumAryCount		OUT	NUMBER,									--�z��i�[����
	OtStrEndFlg			OUT	VARCHAR2,								--�����I���t���O
	OtStrBonus1			OUT	CHAR,									--�ܗ^�x�����P
	OtStrBonus2			OUT	CHAR,									--�ܗ^�x�����Q
	OtStrZanYMD			OUT	CHAR,									--�c���X�V��
	OtStrYusiYMD		OUT	typOtYusiYMDAry,						--�Z����
	OtNumRiritu			OUT	typOtRirituAry,							--����
	OtNumKaisu			OUT	typOtKaisuAry,							--��
	OtNumKyuyoYusi		OUT	typOtKyuyoYusiAry,						--���^�Z���z
	OtNumSyoyoYusi		OUT	typOtSyoyoYusiAry,						--�ܗ^�Z���z
	OtNumKyuyoHen		OUT	typOtKyuyoHenAry,						--���^�ԍϊz
	OtNumSyoyoHen		OUT	typOtSyoyoHenAry,						--�ܗ^�ԍϊz
	OtNumKyuyoZan		OUT	typOtKyuyoZanAry,						--���^�c��
	OtNumSyoyoZan		OUT	typOtSyoyoZanAry,						--�ܗ^�c��
--ADD 20100225 0908047 NBC YOKOYAMA START
	OtNumKyuyoMod		OUT	typOtKyuyoModAry,						--���^�c��(����߂���)
	OtNumSyoyoMod		OUT	typOtSyoyoModAry,						--�ܗ^�c��(����߂���)
--ADD 20100225 0908047 NBC YOKOYAMA END
	OtStrKansaiYMD		OUT	typOtKansaiYMDAry);						--���ϓ�

/* �����f�[�^�o�^���� */
PROCEDURE	QPAP_CEnt090DatAdd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrNyukinYMD		IN	CHAR,									--������
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--�����z
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku		IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,			--����
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2);								--�S�����i�I�y���O�p�j

/* �����f�[�^�X�V���� */
PROCEDURE	QPAP_CEnt090DatUpd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrNyukinYMD		IN	CHAR,									--������
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--�����z
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku		IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,			--����
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2);								--�S�����i�I�y���O�p�j

/* �����f�[�^�폜���� */
PROCEDURE	QPAP_CEnt090DatDel (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2);								--�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE	QPAP_CEnt090OpeLog(
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[�h�c
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--�v���O�����h�c
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--�����敪
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h
	InStrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE	QPAP_CEnt090Lock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--���ʃR�[�h
	InStrKeyInfo1		IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type,
	InStrKeyInfo2		IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type,
	InstrProgramID		IN	QSA4_HaitaT.QSA4_ProgramID%type,		--�v���O�����h�c
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type,		--�R���s���[�^��
	InstrOperatorID		IN	QSA4_HaitaT.QSA4_OperatorID%type);		--�I�y���[�^�h�c

/* �� �� */
PROCEDURE	QPAP_CEnt090UnLock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--���ʃR�[�h
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type);		--�R���s���[�^�[��

--ADD 2005/01/25 FROM
/* ��������  */
PROCEDURE	QPAP_CEnt090Init (
	OtNumDP4Count		OUT	NUMBER,									--DP4 ���s��     �z��i�[����
	OtStrDP4Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               �z��
	OtNumDP5Count		OUT	NUMBER,									--DP5 ���s�ҏ�� �z��i�[����
	OtStrDP5Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               �z��
	OtNumDP6Count		OUT	NUMBER,									--DP6 ���[������ �z��i�[����
	OtStrDP6Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary);			--               �z��
--ADD 2005/01/25 TO

--ADD 2005/02/10 FROM
/* ���ϒʒm�v�j�e�[�u���̓o�^ */
PROCEDURE	QPAP_CEnt090InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,		--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,		--�R���s���[�^��
	InStrSyainCd1		IN	QPAZ_KansaiWT.QPAZ_SYAINCD1%TYPE,		--�Ј��R�[�h�P �z��
	InStrSyainCd2		IN	QPAZ_KansaiWT.QPAZ_SYAINCD2%TYPE,		--�Ј��R�[�h�Q �z��
	InStrYushibi		IN	QPAZ_KansaiWT.QPAZ_YUSHIBI%TYPE,		--�Z���� �z��
	InStrYushibiWa		IN	QPAZ_KansaiWT.QPAZ_YUSHIBIWA%TYPE,		--�Z�����i�a��j �z��
	InStrDispNm			IN	QPAZ_KansaiWT.QPAZ_SHIMEIDISP%TYPE,		--�\���p�Ј����� �z��
	InStrTenCd			IN	QPAZ_KansaiWT.QPAZ_TENCD%TYPE,			--�����X�R�[�h �z��
	InStrTenNm			IN	QPAZ_KansaiWT.QPAZ_TENNM%TYPE,			--�����X���� �z��
	InStrTozai			IN	QPAZ_KansaiWT.QPAZ_TOZAI%TYPE,			--�����敪
	InStrBumonCd		IN	QPAZ_KansaiWT.QPAZ_BUMONCD%TYPE,		--��������R�[�h �z��
	InStrBumonNm		IN	QPAZ_KansaiWT.QPAZ_BUMONNM%TYPE,		--�������喼�� �z��
	InStrYushiKng		IN	QPAZ_KansaiWT.QPAZ_YUSHIKNG%TYPE,		--�Z�����z �z��
	InStrKansaibi		IN	QPAZ_KansaiWT.QPAZ_KANSAIBI%TYPE,		--���ϓ� �z��
	InStrKansaibiWa		IN	QPAZ_KansaiWT.QPAZ_KANSAIBIWA%TYPE,		--���ϓ��i�a��j �z��
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,		--�Œ荀�ځF���s��
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,		--        �F���s�ҏ��P
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,		--        �F���s�ҏ��Q
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,		--        �F���s�ҏ��R
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,		--        �F���s�ҏ��S
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,			--        �F���[������
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE);	--        �F�Ώێ҈ꗗ�^�C�g��

/* ���ϒʒm�v�j�e�[�u���̍폜 */
PROCEDURE	QPAP_CEnt090DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE);			--�R���s���[�^��
--ADD 2005/02/10 TO


END QPAP_CEnt090PkG;
/
show error

/******************************************************************************************************************/
/*�Q  �{�f�B�[                            */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt090PkG IS

  /***  ���O���b�Z�[�W��`  */
  TYPE  typMsg  IS  RECORD (
    fldTableID  CHAR(19),           /* �e�[�u����   */
    fldKousinKbn  CHAR(1),            /* �X�V�敪     */
    fldAcsKey CHAR(50),           /* �A�N�Z�X�L�[ */
    fldMsg    CHAR(100)           /* �����R�[�h   */
  );
  TYPE  typMsgIdx IS  TABLE OF  typMsg  INDEX BY  BINARY_INTEGER;

  /***  ���[�U��`��O��`  */
  W_HAITADUPLICATE  EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent090SelSyainZoku                                             */
/* �@�\      �@�@�F�Ј������̕\��                                                       */
/******************************************************************************************************************/
PROCEDURE	QPAP_Cent090SelSyainZoku (
	InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,		--�Ј��R�[�h�P
	InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,		--�Ј��R�[�h�Q
	OtStrSimeiKana		OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,		--�����J�i
	OtStrSimeiKanji		OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,		--��������
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,			--�����X�R�[�h
	OtStrMiseName		OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,			--�X����
	OtStrTozaiKBN		OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,			--�����敪
	OtStrBumonCD		OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,			--��������R�[�h
	OtStrBumonName		OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,			--���喼��
	OtStrSikakuCD		OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,			--���i�R�[�h
	OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,			--�����R�[�h
	OtStrBornYMD		OUT	VARCHAR2,								--���N����
	OtStrSonzaiFlg		OUT	VARCHAR2) IS							--����Flg (����̑��� Check)

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
--    AND QPAC_MiseCD   = QPAE_PRMMiseCD(+)
    AND QPAC_MiseCD   = QPAE_PRMMiseCD
    AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
    AND QPAC_BumonCD    = QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN  NO_DATA_FOUND THEN
        RETURN;             --�����I��

END QPAP_Cent090SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090SelList                                                                            */
/* �@�\          �F�ݕt�f�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090SelList (
	InStrSyainCD1		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD1%TYPE,	--��������  �Ј��R�[�h�P
	InStrSyainCD2		IN	QPA8_SYNDAICYOT.QPA8_PRMSYAINCD2%TYPE,	--          �Ј��R�[�h�Q
	InNumMaxRec			IN	NUMBER,									--�ő�z��i�[����
	IoNumCursor		IN	OUT	NUMBER,									--�Ăяo����
	OtNumRecCount		OUT	NUMBER,									--����������
	OtNumAryCount		OUT	NUMBER,									--�z��i�[����
	OtStrEndFlg			OUT	VARCHAR2,								--�����I���t���O
	OtStrBonus1			OUT	CHAR,									--�ܗ^�x�����P
	OtStrBonus2			OUT	CHAR,									--�ܗ^�x�����Q
	OtStrZanYMD			OUT	CHAR,									--�c���X�V��
	OtStrYusiYMD		OUT	typOtYusiYMDAry,						--�Z����
	OtNumRiritu			OUT	typOtRirituAry,							--����
	OtNumKaisu			OUT	typOtKaisuAry,							--��
	OtNumKyuyoYusi		OUT	typOtKyuyoYusiAry,						--���^�Z���z
	OtNumSyoyoYusi		OUT	typOtSyoyoYusiAry,						--�ܗ^�Z���z
	OtNumKyuyoHen		OUT	typOtKyuyoHenAry,						--���^�ԍϊz
	OtNumSyoyoHen		OUT	typOtSyoyoHenAry,						--�ܗ^�ԍϊz
	OtNumKyuyoZan		OUT	typOtKyuyoZanAry,						--���^�c��
	OtNumSyoyoZan		OUT	typOtSyoyoZanAry,						--�ܗ^�c��
--ADD 20100225 0908047 NBC YOKOYAMA START
	OtNumKyuyoMod		OUT	typOtKyuyoModAry,						--���^�c��(����߂���)
	OtNumSyoyoMod		OUT	typOtSyoyoModAry,						--�ܗ^�c��(����߂���)
--ADD 20100225 0908047 NBC YOKOYAMA END
	OtStrKansaiYMD		OUT	typOtKansaiYMDAry) IS					--���ϓ�

  /* �����ŗL�̕ϐ� */
  StrSQL        VARCHAR2(1000);
  v_CursorID      NUMBER := 0;
  v_NumCount      NUMBER;
  v_Dummy       INTEGER;
  NumIdx        NUMBER;

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
--ADD 20100225 0908047 NBC YOKOYAMA START
  v_SyoyoZandk    QPAY_SYNDAICYOWT.QPAY_SYOYOZANDAKA%TYPE;
--ADD 20100225 0908047 NBC YOKOYAMA END
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
    /* �Ј��Z���䒠���� */
    StrSQL := NULL;
    StrSQL := StrSQL || 'SELECT';
    StrSQL := StrSQL || ' TO_CHAR(QPA8_PRMYUSIYMD,''YYYYMMDD''),';
    StrSQL := StrSQL || ' NVL(QPA8_RIRITU,0),';
    StrSQL := StrSQL || ' NVL(QPA8_HENSAITUKISU,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAIALL,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOHENSAI,0),';
    StrSQL := StrSQL || ' NVL(QPA8_KYUYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(QPA8_SYOYOZANDAKA,0),';
    StrSQL := StrSQL || ' NVL(TO_CHAR(QPA8_KANSAIYMD,''YYYYMMDD''),'' '')';
--ADD 20100225 0908047 NBC YOKOYAMA START
    StrSQL := StrSQL || ' ,NVL(QPAY_SYOYOZANDAKA,0)';
--ADD 20100225 0908047 NBC YOKOYAMA END
--MOD 20100225 0908047 NBC YOKOYAMA START
--    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT';
    StrSQL := StrSQL || ' FROM QPA8_SYNDAICYOT , QPAY_SYNDAICYOWT ';
--MOD 20100225 0908047 NBC YOKOYAMA END
    StrSQL := StrSQL || ' WHERE QPA8_PRMSYAINCD1 = :Code1';
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = :Code2';
--ADD 20100225 0908047 NBC YOKOYAMA START
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD1 = QPAY_PRMSYAINCD1 (+)';
    StrSQL := StrSQL || ' AND QPA8_PRMSYAINCD2 = QPAY_PRMSYAINCD2 (+)';
    StrSQL := StrSQL || ' AND QPA8_PRMYUSIYMD  = QPAY_PRMYUSIYMD (+)';
--ADD 20100225 0908047 NBC YOKOYAMA END
    StrSQL := StrSQL || ' ORDER BY QPA8_PRMYUSIYMD';

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
--ADD 20100225 0908047 NBC YOKOYAMA START
  DBMS_SQL.DEFINE_COLUMN(v_CursorID,11,v_SyoyoZandk);
--ADD 20100225 0908047 NBC YOKOYAMA END

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
--ADD 20100225 0908047 NBC YOKOYAMA START
    DBMS_SQL.COLUMN_VALUE(v_CursorID,11,v_SyoyoZandk);
--ADD 20100225 0908047 NBC YOKOYAMA END

    /* ���ޯ�� ���� ���� */
    NumIdx  := NumIdx + 1;
    OtStrYusiYMD(NumIdx) := v_YusiYMD;
    OtNumRiritu(NumIdx) := v_Riritu;
    OtNumKaisu(NumIdx) := v_Kaisu;
    OtNumKyuyoYusi(NumIdx) := v_KyuyoYusi;
    OtNumSyoyoYusi(NumIdx) := v_SyoyoYusi;
    OtNumKyuyoHen(NumIdx) := v_KyuyoHen;
    OtNumSyoyoHen(NumIdx) := v_SyoyoHen;
    OtNumKyuyoZan(NumIdx) := v_KyuyoZan;
--MOD 20100225 0908047 NBC YOKOYAMA START
--    OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
    IF v_SyoyoZandk = 0 THEN
        OtNumSyoyoZan(NumIdx) := v_SyoyoZan;
    ELSE
        OtNumSyoyoZan(NumIdx) := v_SyoyoZandk;
    END IF;
--MOD 20100225 0908047 NBC YOKOYAMA END
    OtStrKansaiYMD(NumIdx) := v_KansaiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
    --����߂������擾
    SELECT
      SUM(CASE QPB2_YUSIKBN WHEN '3' THEN NVL(QPB2_GANKIN + QPB2_RISOKU,0) END) 
     ,SUM(CASE QPB2_YUSIKBN WHEN '4' THEN NVL(QPB2_GANKIN + QPB2_RISOKU,0) END) 
    INTO 
      OtNumKyuyoMod(NumIdx) 
     ,OtNumSyoyoMod(NumIdx)
    FROM QPB2_BUNKAI
    WHERE QPB2_SYAINCD1 = InStrSyainCD1
      AND QPB2_SYAINCD2 = InStrSyainCD2
      AND QPB2_SYUBETU = '2'	--�؏�
      AND QPB2_YUSIYMD = v_YusiYMD
      AND QPB2_BUNMODFLG = '0';

    IF OtNumKyuyoMod(NumIdx) is NULL THEN
        OtNumKyuyoMod(NumIdx) := 0;
    END IF;
    IF OtNumSyoyoMod(NumIdx) is NULL THEN
        OtNumSyoyoMod(NumIdx) := 0;
    END IF;
--ADD 20100225 0908047 NBC YOKOYAMA END

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
    RAISE ;
END QPAP_CEnt090SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090DatAdd                                                                             */
/* �@�\          �F�����f�[�^�̓o�^                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatAdd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrNyukinYMD		IN	CHAR,									--������
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--�����z
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku			IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,		--����
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2) IS							--�S�����i�I�y���O�p�j

  numStep     NUMBER   := 0;            /* �����X�e�b�v  */
  numErr      NUMBER   := 0;            /* SQLCODE�̑ޔ� */
  strErrMsg   VARCHAR2(100);            /* SQLERRM�̑ޔ� */
  recMsg      typMsg;
  strLogMsg   QUS2_OpeLogT.QUS2_MSG%TYPE;

  v_SysDate   CHAR(8);

BEGIN

  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --�e�[�u����
  recMsg.fldKousinKbn := '1';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD2;         --�X�V�L�[

  /* �T�[�o�[�r�x�r�s�d�l���t */
  SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

  /*  �Ј��Z�������e�[�u���o�^  */
  INSERT INTO QPA9_SYNNYUKINT VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,TO_DATE(InStrYusiYMD,'YYYYMMDD')
    ,TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,NVL(InNumNyukin,0)
    ,TO_DATE(v_SysDate,'YYYYMMDD')
    );

  /* �Ј��Z���䒠�e�[�u���̍X�V */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* ���𗘑��e�[�u���o�^ */
  INSERT INTO QPB5_BUNKAIRSK VALUES (
     NVL(InStrSyainCD1,' ')
    ,NVL(InStrSyainCD2,' ')
    ,'2'				--���[�����
    ,TO_DATE(InStrYusiYMD,'YYYYMMDD')
    ,TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,NVL(InNumRisoku,0)
    ,InStrUserID
    ,InStrComputerNM
    ,Sysdate
    );

  /* �����e�[�u���X�V */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNMODFLG  = '1'					--�����E����߂��t���O
      ,QPB2_KNSIFLG    = '1'					--���σt���O
      ,QPB2_BUNKAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')		--����������
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--�X�V�����t���O(0��1�𔽓])
      ,QPB2_TANTOCD    = InstrUserID				--���[�U�[��
      ,QPB2_COMPUTERNM = InstrComputerNM				--�R���s���[�^��
      ,QPB2_KOUSINYMD  = Sysdate					--�X�V����
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1				--�Ј��R�[�h�P
  AND QPB2_SYAINCD2  = InStrSyainCD2				--�Ј��R�[�h�Q
  AND QPB2_SYUBETU   = '2'						--���[�����(1�F�����A2�F�؏�)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--�Z����
  AND QPB2_BUNMODFLG = '0';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�Ј��Z�������e�[�u���̓o�^�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�Ј��Z�������e�[�u���̓o�^�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatAdd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090DatUpd                                                                             */
/* �@�\          �F�����f�[�^�̍X�V                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatUpd (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrNyukinYMD		IN	CHAR,									--������
	InNumNyukin			IN	QPA9_SYNNYUKINT.QPA9_NYUKINGAKU%TYPE,	--�����z
--ADD 20100225 0908047 NBC YOKOYAMA START
	InNumRisoku			IN	QPB5_BUNKAIRSK.QPB5_RISOKU%TYPE,		--����
--ADD 20100225 0908047 NBC YOKOYAMA END
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2) IS							--�S�����i�I�y���O�p�j

   numStep      NUMBER   := 0;          /* �����X�e�b�v  */
   numErr       NUMBER   := 0;          /* SQLCODE�̑ޔ� */
   strErrMsg      VARCHAR2(100);          /* SQLERRM�̑ޔ� */
   recMsg       typMsg;
   strLogMsg      QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --�e�[�u����
  recMsg.fldKousinKbn := '2';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD2;         --�X�V�L�[

  /* �Ј��Z�������e�[�u���̍X�V */
  UPDATE QPA9_SYNNYUKINT SET
     QPA9_NYUKINYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
    ,QPA9_NYUKINGAKU = InNumNyukin
  WHERE QPA9_PRMSYAINCD1 = InStrSyainCD1
  AND QPA9_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA9_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

  /* �Ј��Z���䒠�e�[�u���̍X�V */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* ���𗘑��e�[�u���X�V */
  UPDATE QPB5_BUNKAIRSK SET
      QPB5_NYUKINYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')
     ,QPB5_RISOKU     = InNumRisoku
     ,QPB5_TANTOCD    = InstrUserID				--���[�U�[��
     ,QPB5_COMPUTERNM = InstrComputerNM			--�R���s���[�^��
     ,QPB5_TOUROKUYMD = Sysdate					--�X�V����
  WHERE
      QPB5_SYAINCD1  = InStrSyainCD1			--�Ј��R�[�h�P
  AND QPB5_SYAINCD2  = InStrSyainCD2			--�Ј��R�[�h�Q
  AND QPB5_SYUBETU   = '2'						--���[�����(1�F�����A2�F�؏�)
  AND QPB5_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--�Z����
  ;

  /* �����e�[�u���X�V */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNKAIYMD  = TO_DATE(InStrNyukinYMD,'YYYYMMDD')		--����������
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--�X�V�����t���O(0��1�𔽓])
      ,QPB2_TANTOCD    = InstrUserID							--���[�U�[��
      ,QPB2_COMPUTERNM = InstrComputerNM						--�R���s���[�^��
      ,QPB2_KOUSINYMD  = Sysdate								--�X�V����
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1							--�Ј��R�[�h�P
  AND QPB2_SYAINCD2  = InStrSyainCD2							--�Ј��R�[�h�Q
  AND QPB2_SYUBETU   = '2'										--���[�����(1�F�����A2�F�؏�)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--�Z����
  AND QPB2_BUNMODFLG = '1'
  AND QPB2_KNSIFLG   = '1';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�Ј��Z�������e�[�u���̍X�V�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�Ј��Z�������e�[�u���̍X�V�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090Del                                                                                */
/* �@�\          �F�����f�[�^�̍폜                                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090DatDel (
	InStrSyainCD1		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD1%TYPE,	--�Ј��R�[�h�P
	InStrSyainCD2		IN	QPA9_SYNNYUKINT.QPA9_PRMSYAINCD2%TYPE,	--�Ј��R�[�h�Q
	InStrYusiYMD		IN	CHAR,									--�Z����
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[ID�i�I�y���O�p�j
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--���W���[��ID�i�I�y���O�p�j
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c�i�I�y���O�p�j
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^���i�I�y���O�p�j
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--���p�敪�i�I�y���O�p�j
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h�i�I�y���O�p�j
	InStrTantoNM		IN	VARCHAR2) IS							--�S�����i�I�y���O�p�j

   numStep      NUMBER   := 0;          /* �����X�e�b�v  */
   numErr             NUMBER   := 0;          /* SQLCODE�̑ޔ� */
   strErrMsg      VARCHAR2(100);          /* SQLERRM�̑ޔ� */
   recMsg       typMsg;
   strLogMsg      QUS2_OpeLogT.QUS2_MSG%TYPE;
BEGIN

  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPA9_SYNNYUKINT';         --�e�[�u����
  recMsg.fldKousinKbn := '3';             --�X�V�敪
  recMsg.fldAcsKey  := InStrSyainCD2;         --�X�V�L�[

  /* �Ј��Z�������e�[�u���̍폜 */
  DELETE FROM     QPA9_SYNNYUKINT
         WHERE  QPA9_PRMSYAINCD1 = InStrSyainCD1
         AND  QPA9_PRMSYAINCD2 = InStrSyainCD2
         AND  TO_CHAR(QPA9_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

  /* �Ј��Z���䒠�e�[�u���̍X�V */
  UPDATE QPA8_SYNDAICYOT SET
     QPA8_KANSAIYMD  = NULL
  WHERE QPA8_PRMSYAINCD1 = InStrSyainCD1
  AND QPA8_PRMSYAINCD2 = InStrSyainCD2
  AND TO_CHAR(QPA8_PRMYUSIYMD,'YYYYMMDD') = InStrYusiYMD;

--ADD 20100225 0908047 NBC YOKOYAMA START
  /* ���𗘑��e�[�u���̍폜 */
  DELETE FROM QPB5_BUNKAIRSK
  WHERE 
      QPB5_SYAINCD1  = InStrSyainCD1				--�Ј��R�[�h�P
  AND QPB5_SYAINCD2  = InStrSyainCD2				--�Ј��R�[�h�Q
  AND QPB5_SYUBETU   = '2'					--���[�����(1�F�����A2�F�؏�)
  AND QPB5_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--�Z����
  ;

  /* �����e�[�u���X�V */
  UPDATE QPB2_BUNKAI SET 
       QPB2_BUNMODFLG  = '0'					--�����E����߂��t���O
      ,QPB2_KNSIFLG    = '0'					--���σt���O
      ,QPB2_BUNKAIYMD  = Null					--����������
      ,QPB2_RRKFLG     = Decode(QPB2_RRKFLG,'0','1','1','0') 	--�X�V�����t���O(0��1�𔽓])
      ,QPB2_TANTOCD    = InstrUserID				--���[�U�[��
      ,QPB2_COMPUTERNM = InstrComputerNM			--�R���s���[�^��
      ,QPB2_KOUSINYMD  = Sysdate				--�X�V����
  WHERE
      QPB2_SYAINCD1  = InStrSyainCD1				--�Ј��R�[�h�P
  AND QPB2_SYAINCD2  = InStrSyainCD2				--�Ј��R�[�h�Q
  AND QPB2_SYUBETU   = '2'					--���[�����(1�F�����A2�F�؏�)
  AND QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')   	--�Z����
  AND QPB2_KNSIFLG   = '1';
--ADD 20100225 0908047 NBC YOKOYAMA END

  /* �R�~�b�g */
  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�Ј��Z�������e�[�u���̍폜�𐳏�ɍs����';
  strLogMsg   := recMsg.fldTableID
        || recMsg.fldKousinKbn
        || recMsg.fldAcsKey
        || recMsg.fldMsg;
  QPAP_CEnt090OpeLog( InstrMenuId,
        InstrModuleId,
        InStrUserID,
        InStrComputerNM,
        InStrTozaiKBN,
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
      recMsg.fldMsg := '�i' || InStrTantoNM || '�j�Ј��Z�������e�[�u���̍폜�Ɏ��s����';
      strLogMsg   := recMsg.fldTableID
            || recMsg.fldKousinKbn
            || recMsg.fldAcsKey
            || recMsg.fldMsg
            || numErr || ' ' || strErrMsg;
      QPAP_CEnt090OpeLog( InstrMenuId,
            InstrModuleId,
            InStrUserID,
            InStrComputerNM,
            InStrTozaiKBN,
            InStrBushoCD,
            strLogMsg);
    END IF ;

    RAISE ;
END QPAP_CEnt090DatDel;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090OpeLog                                                   */
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                     */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090OpeLog(
	InStrMenuID			IN	QUS2_OpeLogT.QUS2_MENUID%TYPE,			--���j���[�h�c
	InStrModuleID		IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE,		--�v���O�����h�c
	InStrUserID			IN	QUS2_OpeLogT.QUS2_USERID%TYPE,			--���[�U�h�c
	InStrComputerNM		IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE,		--�R���s���[�^
	InStrTozaiKBN		IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE,		--�����敪
	InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE,			--�����R�[�h
	InStrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE) IS			--���b�Z�[�W

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
END  QPAP_CEnt090OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090Lock                                                                               */
/* �@�\          �F�Ј��Z�������e�[�u���̃��b�N                                                               */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090Lock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--���ʃR�[�h
	InStrKeyInfo1		IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type,
	InStrKeyInfo2		IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type,
	InstrProgramID		IN	QSA4_HaitaT.QSA4_ProgramID%type,		--�v���O�����h�c
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type,		--�R���s���[�^��
	InstrOperatorID		IN	QSA4_HaitaT.QSA4_OperatorID%type) IS	--�I�y���[�^�h�c

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr        number := 0;

BEGIN
  /* �Ј��Z�������e�[�u���̊m�F */
  numErr  := 0;
  begin
    select QSA4_ComputerMei, QSA4_OperatorID
      into fldComputerNM, fldOperatorID
      from QSA4_HaitaT
     where QSA4_PRMJobKbn  = 'P'
       and QSA4_PRMSikibetu  = InstrSikibetu
       and QSA4_PRMKeyInfo1  = InStrKeyInfo1
       and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
  exception
    WHEN NO_DATA_FOUND THEN
      numErr := SQLCODE;
    WHEN OTHERS THEN
      RAISE;
  end;

  if numErr = 0 then
    RAISE W_HAITADUPLICATE;
  else
    /* �Ј��Z���䒠�̊m�F */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '080'
         and QSA4_PRMKeyInfo1  = InStrKeyInfo1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
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
    /* �T�����~�̊m�F */
    numErr  := 0;
    begin
      select QSA4_ComputerMei, QSA4_OperatorID
        into fldComputerNM, fldOperatorID
        from QSA4_HaitaT
       where QSA4_PRMJobKbn  = 'P'
         and QSA4_PRMSikibetu  = '160'
         and QSA4_PRMKeyInfo1  = InStrKeyInfo1
         and QSA4_PRMKeyInfo2  = InStrKeyInfo2;
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
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt090Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN              --�Ј��Z�������e�[�u���Q�d�L�[
    RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt090Lock DUPLICATE KEY' );
  WHEN W_HAITASeikyu THEN   --�T�����~��ƒ�
    RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt090Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END QPAP_CEnt090Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt090UnLock                                                                             */
/* �@�\          �F�Ј��Z�������e�[�u���̃��b�N����                                                           */
/******************************************************************************************************************/
PROCEDURE	QPAP_CEnt090UnLock(
	InstrSikibetu		IN	QSA4_HaitaT.QSA4_PRMSikibetu%type,		--���ʃR�[�h
	InstrComputerNM		IN	QSA4_HaitaT.QSA4_ComputerMei%type) IS	--�R���s���[�^�[��

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

END QPAP_CEnt090UnLock ;

--ADD 2005/01/25 FROM
/*****************************************************************************/
/* ���W���[����		�FQPAP_CEnt090Init										 */
/* �@�\				�F��������												 */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt090Init (
	OtNumDP4Count		OUT	NUMBER,									--DP4 ���s��     �z��i�[����
	OtStrDP4Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               �z��
	OtNumDP5Count		OUT	NUMBER,									--DP5 ���s�ҏ�� �z��i�[����
	OtStrDP5Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary,				--               �z��
	OtNumDP6Count		OUT	NUMBER,									--DP6 ���[������ �z��i�[����
	OtStrDP6Ary			OUT	QPAP_CEnt410PKG.typQSA3Ary) IS			--               �z��
	--�����ʂ̕ϐ�
	NumWk				NUMBER;

BEGIN

	/* ���s�� �i�����E���́j */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP4',								--�R�[�h�敪
		OtNumDP4Count,						--���s�� ����
		OtStrDP4Ary);						--���s�� �z��

	/* ���s�ҏ��i�����E���́j */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP5',								--�R�[�h�敪
		OtNumDP5Count,						--���s�ҏ�� ����
		OtStrDP5Ary);						--���s�ҏ�� �z��

	/* ���[�����́i�����E���́j */
	QPAP_CEnt410PKG.QPAP_CEnt410SelCodeV (
		'DP6',								--�R�[�h�敪
		OtNumDP6Count,						--���[������ ����
		OtStrDP6Ary);						--���[������ �z��

END QPAP_CEnt090Init;
--ADD 2005/01/25 TO
--ADD 2005/02/10 FROM
/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt090InsWkTbl                                      */
/* �@�\          �F���ϒʒm�v�j�e�[�u���̓o�^                                */
/*****************************************************************************/
PROCEDURE	QPAP_CEnt090InsWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE,				--�R���s���[�^��
	InStrSyainCd1		IN	QPAZ_KansaiWT.QPAZ_SYAINCD1%TYPE,				--�Ј��R�[�h�P �z��
	InStrSyainCd2		IN	QPAZ_KansaiWT.QPAZ_SYAINCD2%TYPE,				--�Ј��R�[�h�Q �z��
	InStrYushibi		IN	QPAZ_KansaiWT.QPAZ_YUSHIBI%TYPE,				--�Z���� �z��
	InStrYushibiWa		IN	QPAZ_KansaiWT.QPAZ_YUSHIBIWA%TYPE,				--�Z�����i�a��j �z��
	InStrDispNm			IN	QPAZ_KansaiWT.QPAZ_SHIMEIDISP%TYPE,				--�\���p�Ј����� �z��
	InStrTenCd			IN	QPAZ_KansaiWT.QPAZ_TENCD%TYPE,					--�����X�R�[�h �z��
	InStrTenNm			IN	QPAZ_KansaiWT.QPAZ_TENNM%TYPE,					--�����X���� �z��
	InStrTozai			IN	QPAZ_KansaiWT.QPAZ_TOZAI%TYPE,					--�����敪
	InStrBumonCd		IN	QPAZ_KansaiWT.QPAZ_BUMONCD%TYPE,				--��������R�[�h �z��
	InStrBumonNm		IN	QPAZ_KansaiWT.QPAZ_BUMONNM%TYPE,				--�������喼�� �z��
	InStrYushiKng		IN	QPAZ_KansaiWT.QPAZ_YUSHIKNG%TYPE,				--�Z�����z �z��
	InStrKansaibi		IN	QPAZ_KansaiWT.QPAZ_KANSAIBI%TYPE,				--���ϓ� �z��
	InStrKansaibiWa		IN	QPAZ_KansaiWT.QPAZ_KANSAIBIWA%TYPE,				--���ϓ��i�a��j �z��
	InStrHakkoubi		IN	QPAZ_KansaiWT.QPAZ_HAKKOUBI%TYPE,				--�Œ荀�ځF���s��
	InStrHakkouInfo1	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO1%TYPE,				--        �F���s�ҏ��P
	InStrHakkouInfo2	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO2%TYPE,				--        �F���s�ҏ��Q
	InStrHakkouInfo3	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO3%TYPE,				--        �F���s�ҏ��R
	InStrHakkouInfo4	IN	QPAZ_KansaiWT.QPAZ_HAKKOINFO4%TYPE,				--        �F���s�ҏ��S
	InStrLoanNm			IN	QPAZ_KansaiWT.QPAZ_LOANNM%TYPE,					--        �F���[������
	InStrTitle			IN	QPAZ_KansaiWT.QPAZ_TAISYONENDO%TYPE) IS			--        �F�Ώێ҈ꗗ�^�C�g��

	/* �����ŗL�̕ϐ� */

BEGIN

	/* ����f�[�^�̃N���A�r�o */
	QPAP_CEnt090DelWkTbl(
		InStrOperatorID			--�I�y���[�^�h�c
	,	InStrComputerMei		--�R���s���[�^��
	);

	/* �h�m�r�d�q�s */
	INSERT INTO QPAZ_KansaiWT VALUES
	   (SUBSTRB(InStrComputerMei,1,20)		--01 �R���s���[�^�[��
	,   SUBSTRB(InStrOperatorID,1,8)		--02 �I�y���[�^�[�h�c
	,	InStrSyainCd1						--03 �Ј��R�[�h�P
	,	InStrSyainCd2						--04 �Ј��R�[�h�Q
	,	InStrYushibi						--05 �Z����
	,	InStrYushibiWa						--06 �Z�����i�a��j
	,	InStrDispNm							--07 �\���p����
	,	InStrTenCd							--08 �����X�R�[�h
	,	InStrTenNm							--09 �����X��
	,	InStrTozai							--10 �����敪
	,	InStrBumonCd						--11 ��������R�[�h
	,	InStrBumonNm						--12 �������喼
	,	InStrYushiKng						--13 �Z�����z
	,	InStrKansaibi						--14 ���ϓ�
	,	InStrKansaibiWa						--15 ���ϓ��i�a��j
	,	InStrHakkoubi						--16 ���s��
	,	InStrHakkouInfo1					--17 ���s�ҏ��P
	,	InStrHakkouInfo2					--18 ���s�ҏ��Q
	,	InStrHakkouInfo3					--19 ���s�ҏ��R
	,	InStrHakkouInfo4					--20 ���s�ҏ��S
	,	InStrLoanNm							--21 ���[������
	,	InStrTitle							--22 �Ώێ҈ꗗ�^�C�g��
	);

	--COMMIT
	COMMIT;

 EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt090InsWkTbl;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt090DelWkTbl                                      */
/* �@�\          �F���ϒʒm�v�j�e�[�u���̍폜                                */
/*****************************************************************************/
PROCEDURE QPAP_CEnt090DelWkTbl (
	InStrOperatorID		IN	QPAZ_KansaiWT.QPAZ_TANTOID%TYPE,				--�I�y���[�^�h�c
	InStrComputerMei	IN	QPAZ_KansaiWT.QPAZ_TANMATSUID%TYPE) IS			--�R���s���[�^��

BEGIN

	DELETE
		FROM QPAZ_KansaiWT
	WHERE
			QPAZ_TANMATSUID		= InStrComputerMei
		AND	QPAZ_TANTOID		= InStrOperatorID;

	COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		ROLLBACK;
		RAISE ;

END QPAP_CEnt090DelWkTbl;
--ADD 2005/02/10 TO

END QPAP_CEnt090PkG;
/******************************************************************************************************************/
/* END of LINE                                                                                                    */
/******************************************************************************************************************/
/
show error
