CREATE OR REPLACE PACKAGE  QPAP_ActX010PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  					  */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                          					  */
/* ���W���[����  �FQPAP_ActX010PkG                                           					  */
/* �@�\          �F���񂹌�������	                                     					�@*/
/* �쐬��        �F2001/07/07                                                					�@*/
/* �쐬��        �FFIP                                                       					�@*/
/******************************************************************************************************************/

/******************************************************************************************************************/
/*								                                      �P  �錾��  */
/******************************************************************************************************************/

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtSyaCD1Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE	--�Ј��R�[�h�P
						INDEX BY BINARY_INTEGER;
	TYPE typOtSyaCD2Ary IS TABLE OF QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE	--�Ј��R�[�h�Q
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKnAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANA%TYPE		--�����J�i
						INDEX BY BINARY_INTEGER;
	TYPE typOtSimeKjAry IS TABLE OF QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE	--��������
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseCDAry IS TABLE OF QPAC_SYAINM.QPAC_MISECD%TYPE		--�X�R�[�h
						INDEX BY BINARY_INTEGER;
	TYPE typOtMiseNMAry IS TABLE OF QPAE_MISEM.QPAE_MISENM%TYPE		--�X����
						INDEX BY BINARY_INTEGER;
	TYPE typOtTziKBNAry IS TABLE OF QPAC_SYAINM.QPAC_TOZAIKBN%TYPE		--�����敪
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnCDAry IS TABLE OF QPAC_SYAINM.QPAC_BUMONCD%TYPE		--����R�[�h
						INDEX BY BINARY_INTEGER;
	TYPE typOtBumnNMAry IS TABLE OF QPAF_BUMONM.QPAF_BUMONNM%TYPE		--���喼��
						INDEX BY BINARY_INTEGER;

/******************************************************************************************************************/
/*	�P  �錾��							     					�@*/
/******************************************************************************************************************/

/* �Ј��f�[�^�擾 */
PROCEDURE QPAP_ActX010SelList (
	 InStrName		IN	VARCHAR2				--���o�L�[�@��������
	,InNumMaxRec		IN	NUMBER					--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER					--�Ăяo����
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--�Ј��R�[�h�P�z��
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--�Ј��R�[�h�Q�z��
	,OtSimeiKana		OUT	typOtSimeKnAry				--�����J�i�z��
	,OtSimeiKanji		OUT	typOtSimeKjAry				--���������z��
	,OtMiseCD		OUT	typOtMiseCDAry				--�X�R�[�h�z��
	,OtMiseNM		OUT	typOtMiseNMAry				--�X���̔z��
	,OtTozaiKBN		OUT	typOtTziKBNAry				--�����敪�z��
	,OtBumonCD		OUT	typOtBumnCDAry				--����R�[�h�z��
	,OtBumonNM		OUT	typOtBumnNMAry				--���喼�̔z��
	,OtNumAryCount		OUT	NUMBER					--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2);				--�����I���t���O

END QPAP_ActX010PkG;
/
show error

/******************************************************************************************************************/
/*�Q  �{�f�B�[  												  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_ActX010PkG IS
	/***  ���O���b�Z�[�W��`	*/
--	TYPE	typMsg	IS	   RECORD (
--		fldTableID	   CHAR(19),				/* �e�[�u����   */
--		fldKousinKbn	   CHAR(1),		        	/* �X�V�敪     */
--		fldAcsKey	   CHAR(50),				/* �A�N�Z�X�L�[ */
--		fldMsg		   CHAR(100)				/* �����R�[�h   */
--	);
--	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_ActX010SelList                                                                            */
/* �@�\          �F�Ј��f�[�^�擾                                                                                 */
/******************************************************************************************************************/
PROCEDURE QPAP_ActX010SelList (
	 InStrName		IN	VARCHAR2				--���o�L�[�@��������
	,InNumMaxRec		IN	NUMBER					--�ő�z��i�[����
	,IoNumSpCnt		IN OUT	NUMBER					--�Ăяo����
	,OtSyainCD1		OUT	typOtSyaCD1Ary				--�Ј��R�[�h�P�z��
	,OtSyainCD2		OUT	typOtSyaCD2Ary				--�Ј��R�[�h�Q�z��
	,OtSimeiKana		OUT	typOtSimeKnAry				--�����J�i�z��
	,OtSimeiKanji		OUT	typOtSimeKjAry				--���������z��
	,OtMiseCD		OUT	typOtMiseCDAry				--�X�R�[�h�z��
	,OtMiseNM		OUT	typOtMiseNMAry				--�X���̔z��
	,OtTozaiKBN		OUT	typOtTziKBNAry				--�����敪�z��
	,OtBumonCD		OUT	typOtBumnCDAry				--����R�[�h�z��
	,OtBumonNM		OUT	typOtBumnNMAry				--���喼�̔z��
	,OtNumAryCount		OUT	NUMBER					--�z��i�[����
	,OtStrEndFlg		OUT	VARCHAR2) IS				--�����I���t���O

	/* �����ŗL�̕ϐ� */
	NumIdx				NUMBER;					--�z��pIDX
	v_CursorID			INTEGER;				--�J�[�\��ID
	v_SelectStmt			VARCHAR2(1000);				--SQL������
	v_WhereStmt			VARCHAR2(500);				--SQL������
	v_SyainCD1     			QPAC_SYAINM.QPAC_PRMSYAINCD1%TYPE;	--�o�C���h�p�Ј��R�[�h1
	v_SyainCD2     			QPAC_SYAINM.QPAC_PRMSYAINCD2%TYPE;	--�o�C���h�p�Ј��R�[�h2
	v_SimeiKana    			QPAC_SYAINM.QPAC_SIMEIKANA%TYPE;	--�o�C���h�p�����J�i
	v_SimeiKanji   			QPAC_SYAINM.QPAC_SIMEIKANJI%TYPE;	--�o�C���h�p��������
	v_MiseCD       			QPAC_SYAINM.QPAC_MISECD%TYPE;		--�o�C���h�p�����X�R�[�h
	v_MiseNM			QPAE_MISEM.QPAE_MISENM%TYPE;		--�o�C���h�p�����X����
	v_TozaiKBN     			QPAC_SYAINM.QPAC_TOZAIKBN%TYPE;		--�o�C���h�p�����敪
	v_BumonCD      			QPAC_SYAINM.QPAC_BUMONCD%TYPE;		--�o�C���h�p��������R�[�h
        v_BumonNM			QPAF_BUMONM.QPAF_BUMONNM%TYPE;		--�o�C���h�p�������喼��
	v_Dummy				INTEGER;				--Dummy


BEGIN

	/* ������ */
	OtstrEndFlg	:= '0';
	NumIdx		:= 0;

	--�������Ɏg�p����J�[�\�����I�[�v������
	IF IoNumSpCnt = 0 THEN
		v_CursorID := DBMS_SQL.OPEN_CURSOR;

		--�⍇��������̍쐬
	        v_SelectStmt := NULL;
		v_SelectStmt := 'SELECT	  C.QPAC_PRMSYAINCD1,C.QPAC_PRMSYAINCD2,C.QPAC_SIMEIKANA,
					  C.QPAC_SIMEIKANJI,C.QPAC_MISECD,E.QPAE_MISENM,C.QPAC_TOZAIKBN,
					  C.QPAC_BUMONCD,F.QPAF_BUMONNM
				 FROM 	  QPAC_SYAINM C,QPAD_SYASEIM D,QPAE_MISEM E,QPAF_BUMONM F
				 WHERE    C.QPAC_BUMONCD = F.QPAF_PRMBUMONCD (+)
				 AND      C.QPAC_MISECD  = F.QPAF_PRMMISECD (+)
				 AND      C.QPAC_MISECD  = E.QPAE_PRMMISECD (+)
				 AND      C.QPAC_PRMSYAINCD1 = D.QPAD_PRMSYAINCD1 (+)
				 AND      C.QPAC_PRMSYAINCD2 = D.QPAD_PRMSYAINCD2 (+)
				 AND 	  C.QPAC_SIMEIKANA  LIKE :LikeName
				 ORDER BY C.QPAC_PRMSYAINCD2';

		--�⍇������͂���
	  	DBMS_SQL.PARSE(v_CursorID,v_SelectStmt,DBMS_SQL.V7);

		--���͕ϐ����o�C���h����
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':LikeName',InStrName || '%');

		--���s����
		v_Dummy := DBMS_SQL.EXECUTE(v_CursorID);
	ELSE
		v_CursorID := IoNumSpCnt;
	END IF;


	--�o�͕ϐ����`����
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_SyainCD1,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_SyainCD2,7);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_SimeiKana,15);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_SimeiKanji,20);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,5,v_MiseCD,3);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,6,v_MiseNM,24);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,7,v_TozaiKBN,1);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,8,v_BumonCD,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,9,v_BumonNM,24);

	--FETCH LOOP��
	LOOP
		NumIdx := NumIdx + 1;

		--��A�̍s���o�b�t�@�Ɏ��o��������LOOP�̏I���������`�F�b�N����
		IF DBMS_SQL.FETCH_ROWS(v_CursorID) = 0 THEN
			OtNumAryCount := NumIdx - 1;
			OtStrEndFlg := '1';					--�����I��
			EXIT;							--���[�v�I��
		END IF;

		--��A�̍s���o�b�t�@����PLSQL�ϐ���FETCH����
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_SyainCD1);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_SyainCD2);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_SimeiKana);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_SimeiKanji);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,5,v_MiseCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,6,v_MiseNM);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,7,v_TozaiKBN);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,8,v_BumonCD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,9,v_BumonNM);

		OtSyainCD1(NumIdx)    := NVL(v_SyainCD1,' ');
		OtSyainCD2(NumIdx)    := NVL(v_SyainCD2,' ');
		OtSimeiKana(NumIdx)   := NVL(v_SimeiKana,' ');
		OtSimeiKanji(NumIdx)  := NVL(v_SimeiKanji,' ');
		OtMiseCD(NumIdx)      := NVL(v_MiseCD,' ');
		OtMiseNM(NumIdx)      := NVL(v_MiseNM,' ');
		OtTozaiKBN(NumIdx)    := NVL(v_TozaiKBN,' ');
		OtBumonCD(NumIdx)     := NVL(v_BumonCD,' ');
		OtBumonNM(NumIdx)     := NVL(v_BumonNM,' ');

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount := NumIdx;
			IoNumSpCnt := v_CursorID;
			RETURN;							--�v���V�[�W���̏I���i�J�[�\�����N���[�Y���Ȃ��j
		END IF;
	END LOOP;

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR(v_CursorID);

	OtStrEndFlg	:=	'1';					--�����I��

EXCEPTION
	WHEN	OTHERS	THEN
		DBMS_SQL.CLOSE_CURSOR(v_CursorID);
		RAISE ;

END	QPAP_ActX010SelList;
END QPAP_ActX010PkG;
/
show error
