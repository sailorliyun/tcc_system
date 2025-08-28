CREATE OR REPLACE PACKAGE  QPAP_CEnt060PkG IS
/******************************************************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                                                       */
/* �Ɩ���        �F�Ј��ݕt�V�X�e��                                                                               */
/* ���W���[����  �FQPAP_CEnt060PkG                                                                                */
/* �@�\          �F�ݕt���f�[�^�v����                                                                           */
/* �쐬��        �F2001/07/07                                                                                     */
/* �쐬��        �FFIP                                                                                            */
/******************************************************************************************************************/

/******************************************************************************************************************/
/*�P  �錾��								                                                                      */
/******************************************************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typOtTorihikiYMDAry IS TABLE OF CHAR(8)
		INDEX BY BINARY_INTEGER;
	TYPE typOtTorihikiHMSAry IS TABLE OF CHAR(6)
		INDEX BY BINARY_INTEGER;
	TYPE typOtKingakuAry IS TABLE OF QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE
		INDEX BY BINARY_INTEGER;
	TYPE typOtDelFlgAry IS TABLE OF CHAR(1)
		INDEX BY BINARY_INTEGER;

/* �Ј������̕\�� */
PROCEDURE	QPAP_Cent060SelSyainZoku (
	InStrPRMSyainCD1	IN		QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--�Ј��R�[�h�P
	InStrPRMSyainCD2	IN		QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--�Ј��R�[�h�Q
	OtStrSimeiKana		OUT		QPAC_SyainM.QPAC_SimeiKana%TYPE,	--�����J�i
	OtStrSimeiKanji		OUT		QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--��������
	OtStrMiseCD		OUT		QPAC_SyainM.QPAC_MiseCD%TYPE,		--�����X�R�[�h
	OtStrMiseName		OUT		QPAE_MiseM.QPAE_MiseNm%TYPE,		--�X����
	OtStrTozaiKBN		OUT		QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--�����敪
	OtStrBumonCD		OUT		QPAC_SyainM.QPAC_BumonCD%TYPE,		--��������R�[�h
	OtStrBumonName		OUT		QPAF_BumonM.QPAF_BumonNm%TYPE,		--���喼��
	OtStrSikakuCD		OUT		QPAC_SyainM.QPAC_SikakuCD%TYPE,		--���i�R�[�h
	OtStrTokyuCD		OUT		QPAC_SyainM.QPAC_TokyuCD%TYPE,		--�����R�[�h
	OtStrBornYMD		OUT		VARCHAR2,				--���N����
	OtStrSonzaiFlg		OUT		VARCHAR2);				--����Flg (����̑��� Check)

/* �ݕt�f�[�^�擾 */
PROCEDURE QPAP_CEnt060SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--���o�L�[  �Ј��R�[�h
	,InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,IoNumCursor		IN		OUT	NUMBER										--�J�[�\���h�c
	,OtStrTorihikiYMD	OUT		typOtTorihikiYMDAry								--������t
	,OtStrTorihikiHMS	OUT		typOtTorihikiHMSAry								--�������
	,OtNumKingaku		OUT		typOtKingakuAry									--���z
	,OtStrDelFLG		OUT		typOtDelFlgAry									--����t���O
	,OtNumRecCount		OUT		NUMBER											--����������
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2);										--�����I���t���O

/* �����Z���ݕt�f�[�^�X�V���� */
PROCEDURE QPAP_CEnt060DatUpd (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR											--������t
	,InStrTorihikiHMS	IN		CHAR											--�������
	,InStrDelFLG		IN		CHAR											--����t���O
	,InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID		IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID		IN		VARCHAR2										--�o�^�E�S���ҁi�I�y���O�p�j
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrRiyouKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD		IN		VARCHAR2										--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM		IN		VARCHAR2);	 									--�S�����i�I�y���O�p�j

/* �R���\�[�����O�ւ̏o��  */
PROCEDURE  QPAP_CEnt060OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[�h�c
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--�v���O�����h�c
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--�����敪
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE); 					--���b�Z�[�W

/* �Ɩ��r������ */
/* ���b�N */
PROCEDURE QPAP_CEnt060Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type			--���ʃR�[�h
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type			--�Ј��R�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type				--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type			--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type);			--�I�y���[�^�h�c

/* �� �� */
PROCEDURE QPAP_CEnt060UnLock(
	 InStrSikibetu		IN QSA4_HaitaT.QSA4_PRMSikibetu%type				--���ʃR�[�h
	,InStrComputerNM	IN QSA4_HaitaT.QSA4_ComputerMei%type);				--�R���s���[�^�[��

END QPAP_CEnt060PkG;
/
SHOW ERROR

/******************************************************************************************************************/
/*	�Q  �{�f�B�[							    												                  */
/******************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt060PkG IS

	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),												/* �e�[�u����   */
		fldKousinKBN	CHAR(1),												/* �X�V�敪     */
		fldAcsKey		CHAR(50),												/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)												/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);

/******************************************************************************************************************/
/* ���W���[�����@�FQPAP_Cent060SelSyainZoku                                  					  */
/* �@�\      �@�@�F�Ј������̕\��                                            					  */
/******************************************************************************************************************/
PROCEDURE	QPAP_Cent060SelSyainZoku (
	InStrPRMSyainCD1		IN	QPAC_SyainM.QPAC_PRMSyainCD1%TYPE,	--�Ј��R�[�h�P
	InStrPRMSyainCD2		IN	QPAC_SyainM.QPAC_PRMSyainCD2%TYPE,	--�Ј��R�[�h�Q
	OtStrSimeiKana			OUT	QPAC_SyainM.QPAC_SimeiKana%TYPE,	--�����J�i
	OtStrSimeiKanji			OUT	QPAC_SyainM.QPAC_SimeiKanji%TYPE,	--��������
	OtStrMiseCD			OUT	QPAC_SyainM.QPAC_MiseCD%TYPE,		--�����X�R�[�h
	OtStrMiseName			OUT	QPAE_MiseM.QPAE_MiseNm%TYPE,		--�X����
	OtStrTozaiKBN			OUT	QPAC_SyainM.QPAC_TozaiKBN%TYPE,		--�����敪
	OtStrBumonCD			OUT	QPAC_SyainM.QPAC_BumonCD%TYPE,		--��������R�[�h
	OtStrBumonName			OUT	QPAF_BumonM.QPAF_BumonNm%TYPE,		--���喼��
	OtStrSikakuCD			OUT	QPAC_SyainM.QPAC_SikakuCD%TYPE,		--���i�R�[�h
	OtStrTokyuCD			OUT	QPAC_SyainM.QPAC_TokyuCD%TYPE,		--�����R�[�h
	OtStrBornYMD			OUT	VARCHAR2,				--���N����
	OtStrSonzaiFlg			OUT	VARCHAR2) IS				--����Flg (����̑��� Check)

	/* �����ŗL�̕ϐ� */

BEGIN
	/* �o�̓p�����[�^�̃N���A */
	OtStrSimeiKana			:= ' ';
	OtStrSimeiKanji			:= ' ';
	OtStrMiseCD			:= ' ';
	OtStrMiseName			:= ' ';
	OtStrTozaiKBN			:= ' ';
	OtStrBumonCD			:= ' ';
	OtStrBumonName			:= ' ';
	OtStrSikakuCD			:= ' ';
	OtStrTokyuCD			:= ' ';
	OtStrBornYMD			:= ' ';
	OtStrSonzaiFlg			:= '0';

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
		FROM	QPAC_SyainM,QPAE_MiseM,QPAF_BumonM
		WHERE	QPAC_PRMSyainCD1	= InStrPRMSyainCD1
		AND	QPAC_PRMSyainCD2	= InStrPRMSyainCD2
		AND	QPAC_MiseCD		= QPAE_PRMMiseCD(+)
		AND	QPAC_MiseCD		= QPAF_PRMMiseCD(+)
		AND	QPAC_BumonCD		= QPAF_PRMBumonCD(+);

	OtStrSonzaiFlg	:= '1';

EXCEPTION
	WHEN	NO_DATA_FOUND	THEN
				RETURN;							--�����I��

END	QPAP_Cent060SelSyainZoku;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt060SelList                                                                            */
/* �@�\          �F�����Z���ݕt�f�[�^�擾                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060SelList (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--���o�L�[  �Ј��R�[�h
	,InNumMaxRec		IN		NUMBER											--�ő�z��i�[����
	,IoNumCursor		IN		OUT	NUMBER										--�J�[�\���h�c
	,OtStrTorihikiYMD	OUT		typOtTorihikiYMDAry								--������t
	,OtStrTorihikiHMS	OUT		typOtTorihikiHMSAry								--�������
	,OtNumKingaku		OUT		typOtKingakuAry									--���z
	,OtStrDelFLG		OUT		typOtDelFlgAry									--����t���O
	,OtNumRecCount		OUT		NUMBER											--����������
	,OtNumAryCount		OUT		NUMBER											--�z��i�[����
	,OtStrEndFlg		OUT		VARCHAR2) IS									--�����I���t���O

	/* �����ŗL�̕ϐ� */
	StrSQL				VARCHAR2(1000);
	v_CursorID			NUMBER := 0;
	v_NumCount			NUMBER;
	v_Dummy				INTEGER;
	NumIdx				NUMBER;
	v_ZandakaYMD		CHAR(8);
	v_TorihikiYMD		CHAR(8);
	v_TorihikiHMS		CHAR(6);
	v_Kingaku			QPA6_KGCKASITUKET.QPA6_KINGAKU%TYPE;
	v_TorikeshiFLG		QPA6_KGCKASITUKET.QPA6_TORIKESHIFLG%TYPE;
	v_SysDate		Char(8);
	v_ZenKyuyoYMD		Char(8);

BEGIN

/* ----- �r�s�d�o�P �\���f�[�^�������擾 ----- */
	IF IoNumCursor = 0 THEN		--�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
		/* �T�[�o�[�r�x�r�s�d�l���t */
		v_SysDate := '00000000';
		SELECT TO_CHAR(SYSDATE,'YYYYMMDD') INTO v_SysDate FROM DUAL;

		/* �O�X�񋋗^�����Z�o */
		IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
			v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
		ELSE
			v_ZenKyuyoYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-2),'YYYYMMDD'),1,6) || '25';
		END IF;

		OtstrEndFlg	:= '0';
		OtNumRecCount	:= 0;
		OtNumAryCount	:= 0;
		v_NumCount	:= 0;

		/* �����Z���c���������� */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(MAX(QPA3_PRMZANDAKAYMD),''YYYYMMDD'')';
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
		END IF;
		/* �J�[�\���̃N���[�Y */
		DBMS_SQL.CLOSE_CURSOR (v_CursorID);

		v_NumCount := 0;
		/* �����Z���ݕt�e�[�u�����݃`�F�b�N�r�p�k */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' COUNT(*) ';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';
		/* �J�[�\���̃I�[�v�� */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQL�̉�� */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* ���͕ϐ����o�C���h���� */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
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
	END IF;

/* ----- �r�s�d�o�Q �\���f�[�^�擾 ----- */
	IF IoNumCursor = 0 THEN		--�P��ڂ̂r�o�̋N���̏ꍇ�i�J�[�\���h�c���̔Ԃ���Ă��Ȃ��ꍇ�j
		/* �����Z���ݕt�e�[�u������ */
		StrSQL := NULL;
		StrSQL := StrSQL || 'SELECT';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD''),';
		StrSQL := StrSQL || ' TO_CHAR(QPA6_TORIHIKIHMS,''HH24MISS''),';
		StrSQL := StrSQL || ' NVL(QPA6_KINGAKU,0),';
		StrSQL := StrSQL || ' NVL(QPA6_TORIKESHIFLG,'' '')';
		StrSQL := StrSQL || ' FROM QPA6_KGCKASITUKET ';
		StrSQL := StrSQL || ' WHERE QPA6_SYAINCD = :Code';
		StrSQL := StrSQL || ' AND TO_CHAR(QPA6_TORIHIKIYMD,''YYYYMMDD'') > :YMD';
		StrSQL := StrSQL || ' ORDER BY QPA6_TORIHIKIYMD DESC,QPA6_TORIHIKIHMS DESC';
		/* ���I�J�[�\���̃I�[�v�� */
		v_CursorID  := DBMS_SQL.OPEN_CURSOR;
		/* SQL�̉�� */
		DBMS_SQL.PARSE (v_CursorID,StrSQL, DBMS_SQL.v7);
		/* ���͕ϐ����o�C���h���� */
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':Code', InStrSyainCD);
		DBMS_SQL.BIND_VARIABLE(v_CursorID,':YMD', v_ZandakaYMD);
		/* SQL�̎��s */
		v_Dummy := DBMS_SQL.EXECUTE (v_CursorID);
	ELSE
		/* �Q��ڈȍ~�̓J�[�\�����ė��p���� */
		v_CursorID  := IoNumCursor;
	END IF;

	IoNumCursor :=  v_CursorID;		--�p�����[�^�ɃZ�b�g

/* ----- �r�s�d�o�R �\���f�[�^�ҏW ----- */
	/* �o�͕ϐ��̃o�C���h */
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,1,v_TorihikiYMD,8);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,2,v_TorihikiHMS,6);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,3,v_Kingaku);
	DBMS_SQL.DEFINE_COLUMN(v_CursorID,4,v_TorikeshiFLG,1);
	/* FETCH */
	NumIdx := 0;
	LOOP
		IF DBMS_SQL.FETCH_ROWS (v_CursorID) = 0 THEN
			EXIT;
		END IF;
		/* �J�����l��ϐ��֊i�[ */
		DBMS_SQL.COLUMN_VALUE(v_CursorID,1,v_TorihikiYMD);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,2,v_TorihikiHMS);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,3,v_Kingaku);
		DBMS_SQL.COLUMN_VALUE(v_CursorID,4,v_TorikeshiFLG);
		/* ���ޯ�� ���� ���� */
		NumIdx	:= NumIdx + 1;
		/* �p�����[�^�ɓn�� */
		OtStrTorihikiYMD(NumIdx) := v_TorihikiYMD;
		OtStrTorihikiHMS(NumIdx) := v_TorihikiHMS;
		OtNumKingaku(NumIdx) := v_Kingaku;
		OtStrDelFLG(NumIdx) := v_TorikeshiFLG;

		/* �z��̌������l�`�w�ɂȂ����ꍇ */
		IF InNumMaxRec <= NumIdx	THEN
			OtNumAryCount	:=	NumIdx;
			RETURN;
		END IF;
	END LOOP;

	OtNumAryCount	:= NumIdx;			--�p�����[�^�ɃZ�b�g
	OtStrEndFlg	:= '1';				--�p�����[�^�ɃZ�b�g�i�����I���j

	/* �J�[�\���̃N���[�Y */
	DBMS_SQL.CLOSE_CURSOR (v_CursorID);

EXCEPTION
	WHEN	OTHERS	THEN
		IF DBMS_SQL.IS_OPEN (v_CursorID) THEN
			DBMS_SQL.CLOSE_CURSOR (v_CursorID);
		END IF;
		RAISE ;
END	QPAP_CEnt060SelList;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt060DatUpd                                                                             */
/* �@�\          �F�����Z�������f�[�^�X�V����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060DatUpd (
	 InStrSyainCD		IN		QPA6_KGCKASITUKET.QPA6_SYAINCD%TYPE				--�Ј��R�[�h
	,InStrTorihikiYMD	IN		CHAR											--������t
	,InStrTorihikiHMS	IN		CHAR											--�������
	,InStrDelFLG		IN		CHAR											--����t���O
	,InStrMenuID		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[ID�i�I�y���O�p�j
	,InStrModuleID		IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--���W���[��ID�i�I�y���O�p�j
	,InStrUserID		IN		VARCHAR2										--�o�^�E�S���ҁi�I�y���O�p�j
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^���i�I�y���O�p�j
	,InStrRiyouKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--���p�敪�i�I�y���O�p�j
	,InStrBushoCD		IN		VARCHAR2										--�����R�[�h�i�I�y���O�p�j
	,InStrTantoNM		IN		VARCHAR2) IS 									--�S�����i�I�y���O�p�j

	numStep		NUMBER   := 0;													/* �����X�e�b�v  */
	numErr		NUMBER   := 0;													/* SQLCODE�̑ޔ� */
	strErrMsg	VARCHAR2(100);													/* SQLERRM�̑ޔ� */
	recMsg		typMsg;
	strLogMsg	QUS2_OpeLogT.QUS2_MSG%TYPE;

BEGIN
	/* �I�y���[�V�������O�ݒ� */
	recMsg.fldTableID	:= 'QPA2_KGCHENSAIT';									--�e�[�u����
	recMsg.fldKousinKBN	:= '2';													--�X�V�敪
	recMsg.fldAcsKey	:= InStrSyainCD;										--�X�V�L�[

	/* �����Z���ݕt�s�̍X�V */
	UPDATE QPA6_KGCKASITUKET SET
		 QPA6_TORIKESHIFLG = NVL(InStrDelFLG,' ')								--������
		WHERE	TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') = InStrTorihikiYMD			--�X�V�L�[ �Ј��R�[�h�P
		AND	TO_CHAR(QPA6_TORIHIKIHMS,'HH24MISS')  = InStrTorihikiHMS			--�ύX��
		AND	QPA6_SYAINCD  = InStrSyainCD;										--�Ј��R�[�h�Q

	/* �R�~�b�g */
	COMMIT;

	/* �I�y���[�V�������O�o�� */
	numStep := 1;		/* �����X�e�b�v */
	recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̍X�V�𐳏�ɍs����';
	strLogMsg		:= recMsg.fldTableID
				|| recMsg.fldKousinKBN
				|| recMsg.fldAcsKey
				|| recMsg.fldMsg;
	QPAP_CEnt060OpeLog(	InStrMenuID,
				InStrModuleID,
				InStrUserID,
				InStrComputerNM,
				InStrRiyouKBN,
				InStrBushoCD,
				strLogMsg);

EXCEPTION
	WHEN	OTHERS	THEN
		numErr		:= SQLCODE;
		strErrMsg	:= SUBSTR(SQLERRM, 1, 100);
		/* ���[���o�b�N */
		ROLLBACK;

		/* �I�y���[�V�������O�o�� */
		IF numStep < 1 THEN
			recMsg.fldMsg	:= '�i' || InStrTantoNM || '�j�����Z���ݕt�e�[�u���̍X�V�Ɏ��s����';
			strLogMsg		:= recMsg.fldTableID
						|| recMsg.fldKousinKBN
						|| recMsg.fldAcsKey
						|| recMsg.fldMsg
						|| numErr || ' ' || strErrMsg;
			QPAP_CEnt060OpeLog(	InStrMenuID,
						InStrModuleID,
						InStrUserID,
						InStrComputerNM,
						InStrRiyouKBN,
						InStrBushoCD, strLogMsg);
		END IF;

		RAISE;
END	QPAP_CEnt060DatUpd;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt060OpeLog                                       �@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*/
/* �@�\          �F�I�y���O�ւ̒ǉ�                                                                               */
/******************************************************************************************************************/
PROCEDURE  QPAP_CEnt060OpeLog(
	 InStrMenuID  		IN		QUS2_OpeLogT.QUS2_MENUID%TYPE					--���j���[�h�c
	,InStrModuleID  	IN		QUS2_OpeLogT.QUS2_MODULEID%TYPE					--�v���O�����h�c
	,InStrUserId  		IN		QUS2_OpeLogT.QUS2_USERID%TYPE					--���[�U�h�c
	,InStrComputerNM	IN		QUS2_OpeLogT.QUS2_COMPUTERMEI%TYPE				--�R���s���[�^
	,InStrTozaiKBN		IN		QUS2_OpeLogT.QUS2_TOUZAIKBN%TYPE				--�����敪
	,InStrBushoCD		IN		QUS2_OpeLogT.QUS2_BUSHOCD%TYPE					--�����R�[�h
	,InStrMsg			IN		QUS2_OpeLogT.QUS2_MSG%TYPE) IS 					--���b�Z�[�W

BEGIN
	QUSP_LogPkg.QUSP_WriteOpeLog(
			InStrMenuID,
			InStrModuleID,
			InStrUserId,
			InStrComputerNM,
			InStrTozaiKBN,
			InStrBushoCD,
			InStrMsg);
EXCEPTION
	WHEN	OTHERS	THEN
		RAISE ;		/* �I�y���O�̃G���[��F�߂� */
END  QPAP_CEnt060OpeLog;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt060Lock                                                                               */
/* �@�\          �F�����Z���ݕt�s�̃��b�N                                                                         */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060Lock(
	 InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type		--���ʃR�[�h
	,InStrKeyInfo1		IN 		QSA4_HaitaT.QSA4_PRMKeyInfo1%type		--�Ј��R�[�h
	,InStrProgramID		IN 		QSA4_HaitaT.QSA4_ProgramID%type			--�v���O�����h�c
	,InStrComputerNM	IN 		QSA4_HaitaT.QSA4_ComputerMei%type		--�R���s���[�^��
	,InStrOperatorID	IN 		QSA4_HaitaT.QSA4_OperatorID%type) IS		--�I�y���[�^�h�c

	fldComputerNM		QSA4_HaitaT.QSA4_ComputerMei%type;
	fldOperatorID		QSA4_HaitaT.QSA4_OperatorID%type;
	numErr				number := 0;

BEGIN
	/* �v�����^�s�̊m�F */
	begin
		select QSA4_ComputerMei, QSA4_OperatorID
		  into fldComputerNM, fldOperatorID
		  from QSA4_HaitaT
		 where QSA4_PRMJobKbn	 = 'P'
		   and QSA4_PRMSikibetu	 = InStrSikibetu
		   and QSA4_PRMKeyInfo1	 = InStrKeyInfo1;
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
			'P', InStrSikibetu,
			InStrKeyInfo1,'P','P','P','P',
			InStrProgramID, InStrComputerNM, InStrOperatorID,
			sysdate);
	end if;

	commit;
EXCEPTION
	WHEN W_HAITADUPLICATE THEN	--��ƒ�
		RAISE_APPLICATION_ERROR(-20021, 'QPAP_CEnt060Lock DUPLICATE KEY');
	WHEN DUP_VAL_ON_INDEX THEN	--�Q�d�L�[
		RAISE_APPLICATION_ERROR(-20022, 'QPAP_CEnt060Lock DUPLICATE KEY' );
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt060Lock ;

/******************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt060UnLock                                                                             */
/* �@�\          �F�����Z���ݕt�s�̃��b�N����                                                                     */
/******************************************************************************************************************/
PROCEDURE QPAP_CEnt060UnLock(
	InStrSikibetu		IN 		QSA4_HaitaT.QSA4_PRMSikibetu%type,
	InStrComputerNM		IN 		QSA4_HaitaT.QSA4_ComputerMei%type) IS

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

END QPAP_CEnt060UnLock;

END QPAP_CEnt060PkG;
/***END of LINE****************************************************************************************************/
/
SHOW ERROR
