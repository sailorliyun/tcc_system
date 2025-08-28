CREATE OR REPLACE PACKAGE  QPAP_Cent510PkG IS
/****************************************************************************************************************/
/* �V�X�e����	�F�������N���W�b�g�V�X�e��																		*/
/* �Ɩ���		�F�����E����߂�����																			*/
/* ���W���[����	�FQPAP_Cent510PkG																				*/
/* �@�\			�F�����E����߂�����																			*/
/* �쐬��		�F2010/02/25																					*/
/* �쐬��		�FFIP																							*/
/****************************************************************************************************************/

/****************************************************************************************************************/
/*	�P	�錾��																									*/
/****************************************************************************************************************/

  StrDLM  CHAR(1) := '|';				--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
  TYPE typDataAry IS TABLE OF VARCHAR2(200)
	INDEX BY BINARY_INTEGER;

/* �Ј������̕\�� */
PROCEDURE QPAP_Cent510SelSyainZoku (
   InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE	--�Ј��R�[�h�P
  ,InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE	--�Ј��R�[�h�Q
  ,OtStrSimeiKana	OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE		--�����J�i
  ,OtStrSimeiKanji	OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE	--��������
  ,OtStrMiseCD		OUT	QPAC_SyainM.QPAC_MiseCD%TYPE		--�����X�R�[�h
  ,OtStrMiseName	OUT	QPAE_MiseM.QPAE_MiseNm%TYPE			--�X����
  ,OtStrTozaiKBN	OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE		--�����敪
  ,OtStrBumonCD 	OUT	QPAC_SyainM.QPAC_BumonCD%TYPE		--��������R�[�h
  ,OtStrBumonName	OUT	QPAF_BumonM.QPAF_BumonNm%TYPE		--���喼��
  ,OtStrSikakuCD	OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE		--���i�R�[�h
  ,OtStrTokyuCD		OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE		--�����R�[�h
  ,OtStrBornYMD		OUT	VARCHAR2							--���N����
  ,OtStrSonzaiFlg	OUT	VARCHAR2);							--����Flg (����̑��� Check)

/*�O���b�h�\�����擾 */
PROCEDURE QPAP_CEnt510GetGridData (
   InStrPRMSyainCD1	IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE	--�Ј��R�[�h�P
  ,InStrPRMSyainCD2	IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE	--�Ј��R�[�h�Q
  ,InNumMaxRec		IN	NUMBER								--�ő�z��i�[����
  ,IoNumFetchCount	IN	OUT NUMBER							--�ǂݍ��݌���
  ,IoNumRecCount	IN	OUT NUMBER							--����������
  ,OtNumAryCount	OUT	NUMBER								--�z��i�[����
  ,OtStrDataAry		OUT	typDataAry							--�؏����� �z��
  ,OtStrEndFlg		OUT	VARCHAR2);							--�����I���t���O

/*����߂�(INSERT)*/
PROCEDURE QPAP_CEnt510ModoshiINS (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD			IN  CHAR								--�Z����
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD			IN  CHAR								--�T����
  ,InNumGankin			IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE		--����
  ,InNumRisoku			IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE		--����
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID			IN  VARCHAR2							--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD			IN  VARCHAR2							--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM			IN  VARCHAR2);							--�S�����i�I�y���O�p�j

/*����߂�(UPDATE)*/
PROCEDURE QPAP_CEnt510ModoshiUPD (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD			IN  CHAR								--�Z����
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD			IN  CHAR								--�T����
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID			IN  VARCHAR2							--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD			IN  VARCHAR2							--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM			IN  VARCHAR2);							--�S�����i�I�y���O�p�j

/*����*/
PROCEDURE QPAP_CEnt510Bunkai (
   InStrPRMSyainCD1		IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2		IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu	IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE		--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD			IN  CHAR								--�Z����
  ,InstrKyuyoSyoyoKBN	IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE		--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD			IN  CHAR								--�T����
  ,InStrMenuID			IN  QUS2_OpeLogT.QUS2_MENUID%TYPE		--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID		IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID			IN  VARCHAR2							--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM		IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN		IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD			IN  VARCHAR2 							--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM			IN  VARCHAR2);							--�S�����i�I�y���O�p�j

/* �I�y���O�ւ̏o��  */
PROCEDURE QPAP_CEnt510OpeLog (
   InStrMenuID		IN	QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[�h�c
  ,InStrModuleID	IN	QUS2_OpeLogT.QUS2_MODULEID%TYPE			--�v���O�����h�c
  ,InStrUserID		IN	QUS2_OpeLogT.QUS2_USERID%TYPE			--���[�U�h�c
  ,InStrComputerNM	IN	QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE		--�R���s���[�^
  ,InStrTozaiKBN	IN	QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--�����敪
  ,InStrBushoCD		IN	QUS2_OpeLogT.QUS2_BUSHOCD%TYPE			--�����R�[�h
  ,InstrMsg			IN	QUS2_OpeLogT.QUS2_MSG%TYPE);			--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt510Lock(
   InStrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type	/* ���ʃR�[�h		*/
  ,InStrKeyInfo1	IN	QSA4_HaitaT.QSA4_PRMKeyInfo1%type	/* ��������ԍ�1	*/
  ,InStrKeyInfo2	IN	QSA4_HaitaT.QSA4_PRMKeyInfo2%type	/* ��������ԍ�2	*/
  ,InStrProgramID	IN	QSA4_HaitaT.QSA4_ProgramID%type		/* �v���O�����h�c	*/
  ,InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type	/* �R���s���[�^��	*/
  ,InStrOperatorID	IN	QSA4_HaitaT.QSA4_OperatorID%type);	/* �I�y���[�^�h�c	*/

/* �� �� */
PROCEDURE QPAP_CEnt510UnLock(
   InstrSikibetu	IN	QSA4_HaitaT.QSA4_PRMSikibetu%type	--���ʃR�[�h
  ,InstrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type);	--�R���s���[�^�[��

END QPAP_Cent510PkG;
/
SHOW ERROR

/****************************************************************************************************************/
/*	�Q	�{�f�B�[																								*/
/****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_Cent510PkG IS

  /* �؏����׈ꗗ�J�[�\�� */
  CURSOR CurSyouMei(SyainCD1_I	IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	SELECT
	  *
	FROM
	  QPA8_SYNDAICYOT
	WHERE
	  QPA8_PRMSYAINCD1	= SyainCD1_I  AND
	  QPA8_PRMSYAINCD2	= SyainCD2_I
	ORDER BY QPA8_PRMSYAINCD1,QPA8_PRMSYAINCD2,QPA8_PRMYUSIYMD ASC;

  /* �������擾�J�[�\�� */
  CURSOR CurCount(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	-->>>>>>>>>>>>�P�T��T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select Sum(CNT) NumCount From (
	Select
		count(*) CNT
	From 
		QPAA_KOJOT
		,QPA8_SYNDAICYOT
	Where 
		QPAA_SYAINCD1 = SyainCD1_I
	And QPAA_SYAINCD2 = SyainCD2_I
	--�O���T��
	And (TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--�I�y��>=6���̂ݓ����T����
	Or TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--�I�y��5/21�`6/30�̂�6���ܗ^�T����
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPAA_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂�12���ܗ^�T����
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPAA_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--�؏��䒠T�ƌ���
	And QPAA_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPAA_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPAA_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�P�T��T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union All
	-->>>>>>>>>>>>�Q�T������T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		count(*) CNT   	
	From 
		QPB0_KOJORRKT
		,QPA8_SYNDAICYOT
	Where 
		QPB0_SYAINCD1 = SyainCD1_I
	And QPB0_SYAINCD2 = SyainCD2_I
	--�O���T��
	And (TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--�I�y��>=6���̂ݓ����T����
	Or TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--�I�y��5/21�`6/30�̂�6���ܗ^�T����
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPB0_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂�12���ܗ^�T����
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPB0_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--�؏��䒠T�ƌ���
	And QPB0_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB0_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB0_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�Q�T������T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union All
	-->>>>>>>>>>>>�R����T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select 
		count(*) CNT
	From
		 QPB2_BUNKAI
		,QPA8_SYNDAICYOT
	Where
		QPB2_SYAINCD1 = SyainCD1_I
	And QPB2_SYAINCD2 = SyainCD2_I
	And (QPB2_BUNMODFLG = '0'
	--����O���T��
	Or (QPB2_BUNMODFLG = '1' And TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25')
	--�I�y��>=6���̂ݕ��𓖌��T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
		 And  QPB2_BUNMODFLG			 = Case When to_char(sysdate,'dd') >= '06' Then
											  '1' End)
	--�I�y��5/21�`6/30�̂ݕ���6���ܗ^�T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											 To_char(Sysdate,'YYYY') || '06' End
		 And  QPB2_BUNMODFLG		   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '1' End
		 And  QPB2_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂ݕ���12���ܗ^�T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 To_char(Sysdate,'YYYY') || '12' End
		 And  QPB2_BUNMODFLG		   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '1' End
		 And  QPB2_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '4' End))
	--�؏��䒠T�ƌ���
	And QPB2_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB2_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB2_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�R����T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	);

  /* �O���b�h�\���p�J�[�\�� */
  CURSOR CurGrid(SyainCD1_I  IN VARCHAR2, SyainCD2_I IN VARCHAR2) IS
	-->>>>>>>>>>>>�P�T��T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		 Nvl(QPAA_YUSIYMD,'')		YUSIYMD		--�Z����(�؏��̂�)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--����(�؏��̂�)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--�ԍω�(�؏��̂�)
		,QPAA_KOJOYMD				KOJOYMD		--�T����
		,QPAA_GANKIN				GANKIN		--����
		,QPAA_RISOKU				RISOKU		--����
		,null						BUNKAIYMD	--�����
		,'0'						BUNKAIMEMO	--��������
		,Decode(QPAA_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--�ܗ^����
		,''							KANSAIFLG	--���σt���O
	From 
		QPAA_KOJOT
		,QPA8_SYNDAICYOT
	Where 
		QPAA_SYAINCD1 = SyainCD1_I
	And QPAA_SYAINCD2 = SyainCD2_I
	--�O���T��
	And (TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--�I�y��>=6���̂ݓ����T����
	Or TO_CHAR(QPAA_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--�I�y��5/21�`6/30�̂�6���ܗ^�T����
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPAA_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂�12���ܗ^�T����
	Or (TO_CHAR(QPAA_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPAA_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--�؏��䒠T�ƌ���
	And QPAA_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPAA_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPAA_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�P�T��T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union
	-->>>>>>>>>>>>�Q�T������T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select
		 Nvl(QPB0_YUSIYMD,'')		YUSIYMD		--�Z����(�؏��̂�)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--����(�؏��̂�)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--�ԍω�(�؏��̂�)
		,QPB0_KOJOYMD				KOJOYMD		--�T����
		,QPB0_GANKIN				GANKIN		--����
		,QPB0_RISOKU				RISOKU		--����
		,null						BUNKAIYMD	--�����
		,'0'						BUNKAIMEMO	--��������
		,Decode(QPB0_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--�ܗ^����
		,''							KANSAIFLG	--���σt���O
	From 
		QPB0_KOJORRKT
		,QPA8_SYNDAICYOT
	Where 
		QPB0_SYAINCD1 = SyainCD1_I
	And QPB0_SYAINCD2 = SyainCD2_I
	--�O���T��
	And (TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25'
	--�I�y��>=6���̂ݓ����T����
	Or TO_CHAR(QPB0_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
	--�I�y��5/21�`6/30�̂�6���ܗ^�T����
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  To_char(Sysdate,'YYYY') || '06' End
		And  QPB0_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂�12���ܗ^�T����
	Or (TO_CHAR(QPB0_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  To_char(Sysdate,'YYYY') || '12' End
		And  QPB0_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											  '4' End))
	--�؏��䒠T�ƌ���
	And QPB0_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB0_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB0_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�Q�T������T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Union
	-->>>>>>>>>>>>�R����T>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	Select 
		 Nvl(QPB2_YUSIYMD,'')		YUSIYMD		--�Z����(�؏��̂�)
		,Nvl(QPA8_RIRITU,'')		RIRITU		--����(�؏��̂�)
		,Nvl(QPA8_HENSAITUKISU,'')	HENSAIKAISU	--�ԍω�(�؏��̂�)
		,QPB2_KOJOYMD				KOJOYMD		--�T����
		,QPB2_GANKIN				GANKIN		--����
		,QPB2_RISOKU				RISOKU		--����
		,QPB2_BUNKAIYMD				BUNKAIYMD	--�����
		,Decode(QPB2_BUNMODFLG,'0','1','1','2','')	BUNKAIMEMO--��������
		,Decode(QPB2_YUSIKBN,'3','0','4','1','')	SYOYOMEMO--�ܗ^����
		,QPB2_KNSIFLG				KANSAIFLG	--���σt���O
	From
		 QPB2_BUNKAI
		,QPA8_SYNDAICYOT
	Where
		QPB2_SYAINCD1 = SyainCD1_I
	And QPB2_SYAINCD2 = SyainCD2_I
	And (QPB2_BUNMODFLG = '0'
	--����O���T��
	Or (QPB2_BUNMODFLG = '1' And TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(Sysdate,-1),'YYYYMM') || '25')
	--�I�y��>=6���̂ݕ��𓖌��T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMMDD') = Case When to_char(sysdate,'dd') >= '06' Then
											  TO_CHAR(Sysdate,'YYYYMM') || '25' End
		 And  QPB2_BUNMODFLG			 = Case When to_char(sysdate,'dd') >= '06' Then
											  '1' End)
	--�I�y��5/21�`6/30�̂ݕ���6���ܗ^�T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											 To_char(Sysdate,'YYYY') || '06' End
		 And  QPB2_BUNMODFLG		   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '1' End
		 And  QPB2_YUSIKBN			   = Case When To_Char(sysdate,'MMDD') Between '0521' And '0630' Then
											  '4' End)
	--�I�y��11/11�`12/31�̂ݕ���12���ܗ^�T����
	Or (TO_CHAR(QPB2_KOJOYMD,'YYYYMM') = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 To_char(Sysdate,'YYYY') || '12' End
		 And  QPB2_BUNMODFLG		   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '1' End
		 And  QPB2_YUSIKBN			   = Case When to_char(sysdate,'MMDD') Between '1111' And '1231' Then
											 '4' End))
	--�؏��䒠T�ƌ���
	And QPB2_SYAINCD1 = QPA8_PRMSYAINCD1(+)
	And QPB2_SYAINCD2 = QPA8_PRMSYAINCD2(+)
	And QPB2_YUSIYMD  = QPA8_PRMYUSIYMD(+)
	--<<<<<<<<<<<<�R����T<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Order By
		KOJOYMD Desc,YUSIYMD Asc,BUNKAIMEMO Desc;

  /***	���O���b�Z�[�W��`	*/
  TYPE	typMsg	IS	RECORD (
	fldTableID	  CHAR(19), 					/* �e�[�u����	*/
	fldKousinKBN  CHAR(1),						/* �X�V�敪		*/
	fldAcsKey	CHAR(50),						/* �A�N�Z�X�L�[	*/
	fldMsg		CHAR(100)						/* �����R�[�h	*/
  );
  TYPE	typMsgIdx IS  TABLE OF	typMsg	INDEX BY  BINARY_INTEGER;

  /***	���[�U��`��O��`	*/
  W_HAITADUPLICATE	EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
  W_HAITASeikyu   EXCEPTION;
  PRAGMA EXCEPTION_INIT(W_HAITASeikyu	, -20022);

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_Cent510SelSyainZoku 																	*/
/* �@�\ 		 �F�Ј������̕\��																				*/
/****************************************************************************************************************/
PROCEDURE QPAP_Cent510SelSyainZoku (
  InStrPRMSyainCD1	IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--�Ј��R�[�h�P
  InStrPRMSyainCD2	IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--�Ј��R�[�h�Q
  OtStrSimeiKana	OUT QPAC_SyainM.QPAC_SimeiKana%TYPE,	--�����J�i
  OtStrSimeiKanji	OUT QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--��������
  OtStrMiseCD		OUT QPAC_SyainM.QPAC_MiseCD%TYPE,		--�����X�R�[�h
  OtStrMiseName 	OUT QPAE_MiseM.QPAE_MiseNm%TYPE,		--�X����
  OtStrTozaiKBN 	OUT QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--�����敪
  OtStrBumonCD		OUT QPAC_SyainM.QPAC_BumonCD%TYPE,		--��������R�[�h
  OtStrBumonName	OUT QPAF_BumonM.QPAF_BumonNm%TYPE,		--���喼��
  OtStrSikakuCD 	OUT QPAC_SyainM.QPAC_SikakuCD%TYPE,		--���i�R�[�h
  OtStrTokyuCD		OUT QPAC_SyainM.QPAC_TokyuCD%TYPE,		--�����R�[�h
  OtStrBornYMD		OUT VARCHAR2,							--���N����
  OtStrSonzaiFlg	OUT VARCHAR2) IS						--����Flg (����̑��� Check)

  /* �����ŗL�̕ϐ� */

BEGIN
  /* �o�̓p�����[�^�̃N���A */
  OtStrSimeiKana	:= ' ';
  OtStrSimeiKanji	:= ' ';
  OtStrMiseCD		:= ' ';
  OtStrMiseName		:= ' ';
  OtStrTozaiKBN		:= ' ';
  OtStrBumonCD		:= ' ';
  OtStrBumonName	:= ' ';
  OtStrSikakuCD		:= ' ';
  OtStrTokyuCD		:= ' ';
  OtStrBornYMD		:= ' ';
  OtStrSonzaiFlg	:= '0';

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
	WHERE QPAC_PRMSyainCD1	= InStrPRMSyainCD1
	AND QPAC_PRMSyainCD2  = InStrPRMSyainCD2
--	  AND QPAC_MiseCD	= QPAE_PRMMiseCD(+)
	AND QPAC_MiseCD   = QPAE_PRMMiseCD
	AND QPAC_MiseCD   = QPAF_PRMMiseCD(+)
	AND QPAC_BumonCD	= QPAF_PRMBumonCD(+);

  OtStrSonzaiFlg  := '1';

EXCEPTION
  WHEN	NO_DATA_FOUND THEN
		RETURN; 			--�����I��

END QPAP_Cent510SelSyainZoku;

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt510GetGridData																		*/
/* �@�\ 		 �F�O���b�h�\�����̌������擾 																*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510GetGridData (
  InStrPRMSyainCD1	IN  QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--�Ј��R�[�h�P
  InStrPRMSyainCD2	IN  QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--�Ј��R�[�h�Q
  InNumMaxRec		IN  NUMBER,								--�ő�z��i�[����
  IoNumFetchCount	IN  OUT NUMBER,							--�ǂݍ��݌���
  IoNumRecCount		IN  OUT NUMBER,							--����������
  OtNumAryCount		OUT NUMBER,								--�z��i�[����
  OtStrDataAry		OUT typDataAry,							--�؏����� �z��
  OtStrEndFlg		OUT VARCHAR2) IS						--�����I���t���O

  /* �����ŗL�̕ϐ� */
  NumIdx		NUMBER;
  NumSumCount	NUMBER;
  StrData		VARCHAR2(200);

  /* �s�ϐ� */
  RowCount		CurCount%ROWTYPE;		--�������J�[�\��
  RowGrid		CurGrid%ROWTYPE;		--�O���b�h�\���f�[�^�J�[�\��

BEGIN
  /* �o�̓p�����[�^�̏����� */
  OtNumAryCount	:= 0;
  OtStrEndFlg	:= '0';

  IF CurGrid%ISOPEN = FALSE THEN
	/* �O���b�h�\����� �������擾 */
	NumSumCount := 0;
	OPEN CurCount(InStrPRMSyainCD1,InStrPRMSyainCD2);	  --�������J�[�\���̃I�[�v��
	LOOP
	  FETCH CurCount INTO RowCount;
	  IF  CurCount%NOTFOUND THEN
		EXIT;
	  END IF;
	  NumSumCount := NumSumCount + RowCount.NumCount;
	END LOOP;
	IoNumRecCount :=  NumSumCount;			--�p�����[�^�ɃZ�b�g
	CLOSE CurCount; 			  --�������J�[�\���̃N���[�Y

	/* �O���b�h�\����� �J�[�\���̃I�[�v�� */
	OPEN CurGrid(InStrPRMSyainCD1,InStrPRMSyainCD2);
  END IF;

  NumIdx	  := 0;
  OtStrEndFlg	:= '0';

  LOOP

	FETCH CurGrid INTO RowGrid; 		--���ǂ�
	IoNumFetchCount := IoNumFetchCount + 1;
	IF	CurGrid%NOTFOUND THEN
	  EXIT; 			  --���[�v�I��
	END IF;

	/* �O���b�h�\�����̏o�̓p�����[�^�̕ҏW */
	NumIdx := NumIdx + 1;

	StrData := Null;
	StrData := StrData || TO_CHAR(RowGrid.YUSIYMD,'YYYYMMDD')	|| StrDLM;	--�Z����
	StrData := StrData || RowGrid.RIRITU						|| StrDLM;	--�_�񗘗�
	StrData := StrData || RowGrid.HENSAIKAISU					|| StrDLM;	--�ԍω�
	StrData := StrData || TO_CHAR(RowGrid.KOJOYMD,'YYYYMMDD')	|| StrDLM;	--�T����
	StrData := StrData || RowGrid.GANKIN						|| StrDLM;	--����
	StrData := StrData || RowGrid.RISOKU						|| StrDLM;	--����
	StrData := StrData || TO_CHAR(RowGrid.BUNKAIYMD,'YYYYMMDD')	|| StrDLM;	--�����
	StrData := StrData || RowGrid.BUNKAIMEMO					|| StrDLM;	--��������
	StrData := StrData || RowGrid.SYOYOMEMO						|| StrDLM;	--�ܗ^����
	StrData := StrData || RowGrid.KANSAIFLG						|| StrDLM;	--���σt���O
	OtStrDataAry(NumIdx)  := StrData;

	/* �z��̌������l�`�w�ɂȂ����ꍇ */
	IF InNumMaxRec <> 0 	AND
	   InNumMaxRec <= NumIdx  THEN
	  OtNumAryCount :=	NumIdx;
	  RETURN;				--�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
	END IF;

  END LOOP;

  OtStrEndFlg :=  '1';				--�����I��
  OtNumAryCount :=	NumIdx;
  /* �O���b�h�\�����J�[�\���̃N���[�Y */
  CLOSE CurGrid;

EXCEPTION
  WHEN	OTHERS	THEN
	IF CurCount%ISOPEN THEN
	  CLOSE CurCount;
	END IF;
	IF CurGrid%ISOPEN THEN
	  CLOSE CurGrid;
	END IF;
	RAISE ;
END QPAP_CEnt510GetGridData;

/****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt510ModoshiINS																		*/
/* �@�\			�F����߂����s��(����T��INSERT)																	*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510ModoshiINS (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD		  IN  CHAR									--�Z����
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD		  IN  CHAR									--�T����
  ,InNumGankin		  IN  QPB2_BUNKAI.QPB2_GANKIN%TYPE			--����
  ,InNumRisoku		  IN  QPB2_BUNKAI.QPB2_RISOKU%TYPE			--����
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID		  IN  VARCHAR2								--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD 	  IN  VARCHAR2								--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM 	  IN  VARCHAR2) IS							--�S�����i�I�y���O�p�j

  numStep		NUMBER	 := 0;			/* �����X�e�b�v  */
  numErr		NUMBER	 := 0;			/* SQLCODE�̑ޔ� */
  strErrMsg 	VARCHAR2(100);			/* SQLERRM�̑ޔ� */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPB2_BUNKAI';		--�e�[�u����
  recMsg.fldKousinKBN := '1';				--�X�V�敪
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--�X�V�L�[

  INSERT INTO QPB2_BUNKAI VALUES(
	 InStrPRMSyainCD1						--�Ј��R�[�h�P
	,InStrPRMSyainCD2						--�Ј��R�[�h�Q
	,InstrLoanSyubetsu						--���[�����(1�F�����A2�F�؏�)
	,TO_DATE(InstrYusiYMD,'YYYY/MM/DD')		--�Z����
	,InstrKyuyoSyoyoKBN						--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
	,TO_DATE(InstrKojoYMD,'YYYY/MM/DD')		--�T����
	,'0'									--�����E����߂��t���O
	,Null									--����������
	,'0'									--���σt���O
	,InNumGankin							--����
	,InNumRisoku							--����
	,'0'									--�X�V�����t���O
	,InStrUserID							--���[�U�[��
	,InstrComputerNM						--�R���s���[�^��
	,Sysdate								--�o�^����
	,Sysdate								--�X�V����
	);

  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̓o�^�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ���[���o�b�N */
	ROLLBACK;

	/* �I�y���[�V�������O�o�� */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̓o�^�Ɏ��s����';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510ModoshiINS ;

/****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt510ModoshiUPD																		*/
/* �@�\			�F����߂����s��(����T��UPDATE)																	*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510ModoshiUPD (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD		  IN  CHAR									--�Z����
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD		  IN  CHAR									--�T����
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID		  IN  VARCHAR2								--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD		  IN  VARCHAR2								--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM		  IN  VARCHAR2) IS							--�S�����i�I�y���O�p�j

  numStep		NUMBER	 := 0;			/* �����X�e�b�v  */
  numErr		NUMBER	 := 0;			/* SQLCODE�̑ޔ� */
  strErrMsg 	VARCHAR2(100);			/* SQLERRM�̑ޔ� */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPB2_BUNKAI';	--�e�[�u����
  recMsg.fldKousinKBN := '2';		--�X�V�敪
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--�X�V�L�[

  UPDATE QPB2_BUNKAI SET
	 QPB2_BUNMODFLG  = '0'									--�����E����߂��t���O
	,QPB2_BUNKAIYMD  = Null									--����������
	,QPB2_RRKFLG	 = Decode(QPB2_RRKFLG,'0','1','1','0')	--�X�V�����t���O(0��1�𔽓])
	,QPB2_TANTOCD	 = InstrUserID							--���[�U�[��
	,QPB2_COMPUTERNM = InstrComputerNM						--�R���s���[�^��
	,QPB2_KOUSINYMD  = Sysdate								--�X�V����
  WHERE
	   QPB2_SYAINCD1  = InStrPRMSyainCD1					--�Ј��R�[�h�P
   AND QPB2_SYAINCD2  = InStrPRMSyainCD2					--�Ј��R�[�h�Q
   AND QPB2_SYUBETU   = InstrLoanSyubetsu					--���[�����(1�F�����A2�F�؏�)
   AND (QPB2_YUSIYMD  = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')	--�Z����
		OR QPB2_YUSIYMD IS NULL)
   AND QPB2_YUSIKBN   = InstrKyuyoSyoyoKBN					--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
   AND QPB2_KOJOYMD   = TO_DATE(InstrKojoYMD,'YYYY/MM/DD')	--�T����
   AND QPB2_BUNMODFLG = '1';

  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̍X�V�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ���[���o�b�N */
	ROLLBACK;

	/* �I�y���[�V�������O�o�� */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̍X�V�Ɏ��s����';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510ModoshiUPD ;

/****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt510Bunkai																			*/
/* �@�\			�F�������s��(����T��UPDATE)																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510Bunkai (
   InStrPRMSyainCD1	  IN  QPB2_BUNKAI.QPB2_SyainCD1%TYPE		--�Ј��R�[�h�P
  ,InStrPRMSyainCD2	  IN  QPB2_BUNKAI.QPB2_SyainCD2%TYPE		--�Ј��R�[�h�Q
  ,InstrLoanSyubetsu  IN  QPB2_BUNKAI.QPB2_SYUBETU%TYPE			--���[�����(1�F�����A2�F�؏�)
  ,InstrYusiYMD		  IN  CHAR									--�Z����
  ,InstrKyuyoSyoyoKBN IN  QPB2_BUNKAI.QPB2_YUSIKBN%TYPE			--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
  ,InstrKojoYMD		  IN  CHAR									--�T����
  ,InStrMenuID		  IN  QUS2_OpeLogT.QUS2_MENUID%TYPE			--���j���[ID�i�I�y���O�p�j
  ,InStrModuleID	  IN  QUS2_OpeLogT.QUS2_MODULEID%TYPE		--���W���[��ID�i�I�y���O�p�j
  ,InStrUserID		  IN  VARCHAR2								--�S����ID�i�I�y���O�p�j
  ,InStrComputerNM	  IN  QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE	--�R���s���[�^���i�I�y���O�p�j
  ,InStrRiyouKBN	  IN  QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE		--���p�敪�i�I�y���O�p�j
  ,InStrBushoCD		  IN  VARCHAR2								--�����R�[�h�i�I�y���O�p�j
  ,InStrTantoNM		  IN  VARCHAR2) IS							--�S�����i�I�y���O�p�j

  numStep		NUMBER	 := 0;			/* �����X�e�b�v  */
  numErr		NUMBER	 := 0;			/* SQLCODE�̑ޔ� */
  strErrMsg 	VARCHAR2(100);			/* SQLERRM�̑ޔ� */
  recMsg		typMsg;
  strLogMsg 	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
  /* �I�y���[�V�������O�ݒ� */
  recMsg.fldTableID := 'QPB2_BUNKAI';		--�e�[�u����
  recMsg.fldKousinKBN := '2';				--�X�V�敪
  recMsg.fldAcsKey	:= InStrPRMSyainCD2;	--�X�V�L�[

  UPDATE QPB2_BUNKAI SET
	 QPB2_BUNMODFLG  = '1'									--�����E����߂��t���O
	,QPB2_BUNKAIYMD  = Sysdate								--����������
	,QPB2_RRKFLG	 = Decode(QPB2_RRKFLG,'0','1','1','0')	--�X�V�����t���O(0��1�𔽓])
	,QPB2_TANTOCD	 = InstrUserID							--���[�U�[��
	,QPB2_COMPUTERNM = InstrComputerNM						--�R���s���[�^��
	,QPB2_KOUSINYMD  = Sysdate								--�X�V����
  WHERE
	   QPB2_SYAINCD1  = InStrPRMSyainCD1					--�Ј��R�[�h�P
   AND QPB2_SYAINCD2  = InStrPRMSyainCD2					--�Ј��R�[�h�Q
   AND QPB2_SYUBETU   = InstrLoanSyubetsu					--���[�����(1�F�����A2�F�؏�)
   AND (QPB2_YUSIYMD   = TO_DATE(InstrYusiYMD,'YYYY/MM/DD')	--�Z����
		OR QPB2_YUSIYMD IS NULL)
   AND QPB2_YUSIKBN   = InstrKyuyoSyoyoKBN					--���^�ܗ^�敪(3�F���^�A4�F�ܗ^)
   AND QPB2_KOJOYMD   = TO_DATE(InstrKojoYMD,'YYYY/MM/DD')	--�T����
   AND QPB2_BUNMODFLG = '0';

  COMMIT;

  /* �I�y���[�V�������O�o�� */
  numStep := 1;   /* �����X�e�b�v */
  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̍X�V�𐳏�ɍs�����B';
  strLogMsg   := recMsg.fldTableID
		|| recMsg.fldKousinKBN
		|| recMsg.fldAcsKey
		|| recMsg.fldMsg;
  QPAP_CEnt510OpeLog( InStrMenuID,
		InStrModuleID,
		InStrUserID,
		InStrComputerNM,
		InStrRiyouKBN,
		InStrBushoCD,
		strLogMsg);

EXCEPTION
  WHEN	OTHERS	THEN
	numErr	  := SQLCODE;
	strErrMsg := SUBSTR(SQLERRM, 1, 100);
	/* ���[���o�b�N */
	ROLLBACK;

	/* �I�y���[�V�������O�o�� */
	IF numStep < 1 THEN
	  recMsg.fldMsg := '�i' || InStrTantoNM || '�j�����e�[�u���̍X�V�Ɏ��s����';
	  strLogMsg   := recMsg.fldTableID
			|| recMsg.fldKousinKBN
			|| recMsg.fldAcsKey
			|| recMsg.fldMsg
			|| numErr || ' ' || strErrMsg;
	  QPAP_CEnt510OpeLog( InStrMenuID,
			InStrModuleID,
			InStrUserID,
			InStrComputerNM,
			InStrRiyouKBN,
			InStrBushoCD, strLogMsg);
	END IF;

	RAISE;
END QPAP_CEnt510Bunkai ;

/****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt510OpeLog																			*/
/* �@�\			�F�I�y���O�ւ̒ǉ�																				*/
/****************************************************************************************************************/
PROCEDURE  QPAP_CEnt510OpeLog(
   InStrMenuID	   IN	 QUS2_OpeLogT.QUS2_MENUID%TYPE		/* ���j���[�h�c   */
  ,InStrModuleID   IN	 QUS2_OpeLogT.QUS2_MODULEID%TYPE	/* �v���O�����h�c */
  ,InStrUserID	   IN	 QUS2_OpeLogT.QUS2_USERID%TYPE		/* ���[�U�h�c	  */
  ,InStrComputerNM IN	 QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE /* �R���s���[�^   */
  ,InStrTozaiKBN   IN	 QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE	/* �����敪 	  */
  ,InStrBushoCD    IN	 QUS2_OpeLogT.QUS2_BUSHOCD%TYPE 	/* �����R�[�h	  */
  ,InstrMsg		   IN	 QUS2_OpeLogT.QUS2_MSG%TYPE ) IS	/* ���b�Z�[�W	  */

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
  WHEN	OTHERS	THEN
	RAISE;	  /* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt510OpeLog;

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt510Lock 																			*/
/* �@�\ 		 �F�ݕt�⍇���̃��b�N																			*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510Lock(
  InStrSikibetu   IN	QSA4_HaitaT.QSA4_PRMSikibetu%type		/* ���ʃR�[�h	*/
  ,InStrKeyInfo1	IN	  QSA4_HaitaT.QSA4_PRMKeyInfo1%type 	  /* ��������ԍ�1	*/
  ,InStrKeyInfo2	IN	  QSA4_HaitaT.QSA4_PRMKeyInfo2%type 	  /* ��������ԍ�2	*/
  ,InStrProgramID	IN	  QSA4_HaitaT.QSA4_ProgramID%type		  /* �v���O�����h�c */
  ,InStrComputerNM	IN	  QSA4_HaitaT.QSA4_ComputerMei%type 	  /* �R���s���[�^�� */
  ,InStrOperatorID	IN	  QSA4_HaitaT.QSA4_OperatorID%type) IS		/* �I�y���[�^�h�c */

  fldComputerNM   QSA4_HaitaT.QSA4_ComputerMei%type;
  fldOperatorID   QSA4_HaitaT.QSA4_OperatorID%type;
  numErr		number := 0;

BEGIN

  begin
	select QSA4_ComputerMei, QSA4_OperatorID
	  into fldComputerNM, fldOperatorID
	  from QSA4_HaitaT
	 where QSA4_PRMJobKbn  = 'P'
	   and QSA4_PRMSikibetu  = InstrSikibetu
	   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--��������ԍ�1
	   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--��������ԍ�2
  exception
	WHEN NO_DATA_FOUND THEN
	  numErr := SQLCODE;
	WHEN OTHERS THEN
	  RAISE;
  end;

  if numErr = 0 then
	RAISE W_HAITADUPLICATE;
  else
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		and QSA4_PRMSikibetu  = '010'
		  and QSA4_PRMKeyInfo1	 = InStrKeyInfo1	--��������ԍ�1
		  and QSA4_PRMKeyInfo1	 = InStrKeyInfo2;	--��������ԍ�2
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
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		 and QSA4_PRMSikibetu = '080'
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--��������ԍ�1
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--��������ԍ�2
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
	numErr	:= 0;
	begin
	  select QSA4_ComputerMei, QSA4_OperatorID
		into fldComputerNM, fldOperatorID
		from QSA4_HaitaT
	  where QSA4_PRMJobKbn	= 'P'
		 and QSA4_PRMSikibetu = '090'
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo1	--��������ԍ�1
		   and QSA4_PRMKeyInfo1  = InStrKeyInfo2;	--��������ԍ�2
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
  WHEN W_HAITADUPLICATE THEN			  --�ݕt�c���e�[�u����ƒ�
	RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt510Lock DUPLICATE KEY');
  WHEN DUP_VAL_ON_INDEX THEN			  --�ݕt�c���e�[�u���Q�d�L�[
	RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt510Lock DUPLICATE KEY' );
  WHEN OTHERS THEN
	ROLLBACK;
	RAISE;
END QPAP_CEnt510Lock ;

/****************************************************************************************************************/
/* ���W���[����	�FQPAP_CEnt510UnLock																			*/
/* �@�\			�F�ݕt�⍇���̃��b�N����																		*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt510UnLock(
  InstrSikibetu   IN  QSA4_HaitaT.QSA4_PRMSikibetu%type,
  InStrComputerNM	IN	QSA4_HaitaT.QSA4_ComputerMei%type) IS
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

END QPAP_CEnt510UnLock ;

END QPAP_Cent510PkG;

/***END of LINE****************************************************************************************************/
/
SHOW ERROR
