CREATE OR REPLACE PACKAGE  QPAP_CEnt120PkG IS
/****************************************************************************/
/* �V�X�e����	�F�������N���W�b�g�V�X�e��									*/
/* �Ɩ���		�F�Ј��ݕt�V�X�e��											*/
/* ���W���[����	�FQPAP_CEnt120PkG											*/
/* �@�\			�F�ԍϊz�ꗗ�\												*/
/* �쐬��		�F2001/08/23												*/
/* �쐬��		�FFIP														*/
/****************************************************************************/

/****************************************************************************/
/*								�P	�錾��									*/
/****************************************************************************/

	StrDLM	CHAR(1) := '|';	--��ؕ���

/* �e�s���i�[���邽�߂̔z���` */
	TYPE typKSKBNAry		IS TABLE OF CHAR(1)		INDEX BY BINARY_INTEGER;	--���^�^�ܗ^����t���O�z��
	TYPE typPAGEKBNAry		IS TABLE OF NUMBER(1)	INDEX BY BINARY_INTEGER;	--�y�[�W�敪�z��
	TYPE typGYOUKBNAry		IS TABLE OF NUMBER(2)	INDEX BY BINARY_INTEGER;	--�s�敪�z��
	TYPE typYUSIGAKU		IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�Z���z�z��
	TYPE typSIHARAI06Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��06�z��
	TYPE typSIHARAI12Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��12�z��
	TYPE typSIHARAI18Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��18�z��
	TYPE typSIHARAI24Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��24�z��
	TYPE typSIHARAI30Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��30�z��
	TYPE typSIHARAI36Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��36�z��
	TYPE typSIHARAI42Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��42�z��
	TYPE typSIHARAI48Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��48�z��
	TYPE typSIHARAI54Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��54�z��
	TYPE typSIHARAI60Ary	IS TABLE OF NUMBER(7)	INDEX BY BINARY_INTEGER;	--�x��60�z��
	TYPE typNEXTSYOYOMAry	IS TABLE OF CHAR(2)		INDEX BY BINARY_INTEGER;	--����ܗ^���z��
	TYPE typSEQNOAry		IS TABLE OF NUMBER(3)	INDEX BY BINARY_INTEGER;	--�V�[�P���X�ԍ�

/* ���������i�V�X�e�����t�擾�j */
PROCEDURE QPAP_CEnt120Init (
	 OtStrSysDate		OUT	VARCHAR2			--�T�[�o�[�r�x�r�s�d�l���t
	,OtStrBonusDate1	OUT	VARCHAR2			-- �{�[�i�X�x�����P
	,OtStrBonusDate2	OUT	VARCHAR2);			-- �{�[�i�X�x�����Q

/* ����p�e�[�u���ɓo�^ */
PROCEDURE QPAP_CEnt120PrintAdd (
	 InNumAryCount			IN		NUMBER				--�z�񌏐�
	,InStrCOMPUTERMEI		IN		VARCHAR2			--�R���s���[�^��
	,InStrYuushiDate		IN		VARCHAR2			--�Z����
	,InStrRiritu			IN		VARCHAR2			--����
	,InStrKSKbnAry			IN		typKSKBNAry			--���^�^�ܗ^����t���O�z��
	,InNumPageKBNAry		IN		typPAGEKBNAry		--�y�[�W�敪�z��
	,InNumGyouKBNAry		IN		typGYOUKBNAry		--�s�敪�z��
	,InNumYuusigakuAry		IN		typYUSIGAKU			--�Z���z�z��
	,InNumShiharai06Ary		IN		typSIHARAI06Ary		--�x��06�z��
	,InNumShiharai12Ary		IN		typSIHARAI12Ary		--�x��12�z��
	,InNumShiharai18Ary		IN		typSIHARAI18Ary		--�x��18�z��
	,InNumShiharai24Ary		IN		typSIHARAI24Ary		--�x��24�z��
	,InNumShiharai30Ary		IN		typSIHARAI30Ary		--�x��30�z��
	,InNumShiharai36Ary		IN		typSIHARAI36Ary		--�x��36�z��
	,InNumShiharai42Ary		IN		typSIHARAI42Ary		--�x��42�z��
	,InNumShiharai48Ary		IN		typSIHARAI48Ary		--�x��48�z��
	,InNumShiharai54Ary		IN		typSIHARAI54Ary		--�x��54�z��
	,InNumShiharai60Ary		IN		typSIHARAI60Ary		--�x��60�z��
	,InStrJikaiSyouyoAry	IN		typNEXTSYOYOMAry	--����ܗ^���z��
	,InNumSeqNoAry			IN		typSEQNOAry);		--�V�[�P���X�ԍ�

/* ����p�e�[�u������폜 */
PROCEDURE QPAP_CEnt120PrintDel (
	InStrCOMPUTERMEI	IN		VARCHAR2 );								--�R���s���[�^�[��

END QPAP_CEnt120PkG;
/
SHOW ERROR

/****************************************************************************/
/*								�Q	�{�f�B�[								*/
/****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt120PkG IS

	/***  ���O���b�Z�[�W��`	*/
	TYPE	typMsg	IS	RECORD (
		fldTableID		CHAR(19),		/* �e�[�u����   */
		fldKousinKbn	CHAR(1),		/* �X�V�敪     */
		fldAcsKey		CHAR(50),		/* �A�N�Z�X�L�[ */
		fldMsg			CHAR(100)		/* �����R�[�h   */
	);
	TYPE 	typMsgIdx	IS	TABLE	OF	typMsg	INDEX	BY	BINARY_INTEGER;

	/***  ���[�U��`��O��`	*/
	W_HAITADUPLICATE	EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITADUPLICATE, -20021);
	W_HAITASeikyu		EXCEPTION;
	PRAGMA EXCEPTION_INIT(W_HAITASeikyu   , -20022);


/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt120Init											*/
/* �@�\			�F�V�X�e�����t�擾											*/
/****************************************************************************/
PROCEDURE QPAP_CEnt120Init (
	 OtStrSysDate		OUT	VARCHAR2			--�T�[�o�[�r�x�r�s�d�l���t
	,OtStrBonusDate1	OUT	VARCHAR2			-- �{�[�i�X�x�����P
	,OtStrBonusDate2	OUT	VARCHAR2) IS		-- �{�[�i�X�x�����Q

BEGIN

	/* �T�[�o�[�r�x�r�s�d�l���t�擾 */
	SELECT	TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
	INTO	OtStrSysDate
	FROM	DUAL;

	/* �X�}�X�^����X���́A�ܗ^�x�����P�A�ܗ^�x�����Q�擾 */
	BEGIN
		SELECT	 NVL(QPAE_BONUSYMD1,' ')
				,NVL(QPAE_BONUSYMD2,' ')
		INTO	 OtStrBonusDate1
				,OtStrBonusDate2
		FROM	QPAE_MISEM
		WHERE	QPAE_PRMMISECD	= '001'
		ORDER BY QPAE_PRMMISECD;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RAISE;
	END;

END	QPAP_CEnt120Init;

/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt120PrintAdd										*/
/* �@�\			�F����p�e�[�u���Ƀf�[�^��o�^								*/
/****************************************************************************/
/* ����p�e�[�u���ɓo�^ */
PROCEDURE QPAP_CEnt120PrintAdd (
	 InNumAryCount			IN		NUMBER					--�z�񌏐�
	,InStrCOMPUTERMEI		IN		VARCHAR2				--�R���s���[�^��
	,InStrYuushiDate		IN		VARCHAR2				--�Z����
	,InStrRiritu			IN		VARCHAR2				--����
	,InStrKSKbnAry			IN		typKSKBNAry				--���^�^�ܗ^����t���O�z��
	,InNumPageKBNAry		IN		typPAGEKBNAry			--�y�[�W�敪�z��
	,InNumGyouKBNAry		IN		typGYOUKBNAry			--�s�敪�z��
	,InNumYuusigakuAry		IN		typYUSIGAKU				--�Z���z�z��
	,InNumShiharai06Ary		IN		typSIHARAI06Ary			--�x��06�z��
	,InNumShiharai12Ary		IN		typSIHARAI12Ary			--�x��12�z��
	,InNumShiharai18Ary		IN		typSIHARAI18Ary			--�x��18�z��
	,InNumShiharai24Ary		IN		typSIHARAI24Ary			--�x��24�z��
	,InNumShiharai30Ary		IN		typSIHARAI30Ary			--�x��30�z��
	,InNumShiharai36Ary		IN		typSIHARAI36Ary			--�x��36�z��
	,InNumShiharai42Ary		IN		typSIHARAI42Ary			--�x��42�z��
	,InNumShiharai48Ary		IN		typSIHARAI48Ary			--�x��48�z��
	,InNumShiharai54Ary		IN		typSIHARAI54Ary			--�x��54�z��
	,InNumShiharai60Ary		IN		typSIHARAI60Ary			--�x��60�z��
	,InStrJikaiSyouyoAry	IN		typNEXTSYOYOMAry		--����ܗ^���z��
	,InNumSeqNoAry			IN		typSEQNOAry) IS		--�V�[�P���X�ԍ�

BEGIN

	<<LoopPrintAdd>>
	FOR i IN 1..InNumAryCount LOOP


		/* ����p�e�[�u���ւ̓o�^ */
		INSERT INTO QPAN_HenIchiW VALUES (
			 InNumSeqNoAry(i)					--�V�[�P���X�ԍ�
			,InStrKSKbnAry(i)					--���^�^�ܗ^����t���O�z��
			,InNumPageKBNAry(i)					--�y�[�W�敪�z��
			,InNumGyouKBNAry(i)					--�s�敪�z��
			,TO_DATE(InStrYuushiDate)			--�ʎj��
			,TO_NUMBER(InNumYuusigakuAry(i)) 	--�Z���z�z��
			,TO_NUMBER(InStrRiritu)				--����
			,InNumShiharai06Ary(i)				--�x��06�z��
			,InNumShiharai12Ary(i)				--�x��12�z��
			,InNumShiharai18Ary(i)				--�x��18�z��
			,InNumShiharai24Ary(i)				--�x��24�z��
			,InNumShiharai30Ary(i)				--�x��30�z��
			,InNumShiharai36Ary(i)				--�x��36�z��
			,InNumShiharai42Ary(i)				--�x��42�z��
			,InNumShiharai48Ary(i)				--�x��48�z��
			,InNumShiharai54Ary(i)				--�x��54�z��
			,InNumShiharai60Ary(i)				--�x��60�z��
			,InStrJikaiSyouyoAry(i)				--����ܗ^���z��
			,InStrCOMPUTERMEI);					--�R���s���[�^��

	END LOOP LoopPrintAdd;
		COMMIT;

EXCEPTION
	WHEN	OTHERS	THEN
		/* ���[���o�b�N */
		ROLLBACK;

		RAISE ;
END QPAP_CEnt120PrintAdd;
/****************************************************************************/
/* ���W���[����	�FQPAP_CEnt120PrintDel										*/
/* �@�\			�F����p�e�[�u������f�[�^���폜							*/
/****************************************************************************/
PROCEDURE QPAP_CEnt120PrintDel (
	InStrCOMPUTERMEI	IN		VARCHAR2 )IS						--�R���s���[�^�[��
BEGIN

	/* ����p�e�[�u������f�[�^���폜 */
	DELETE	FROM QPAN_HENICHIW
	WHERE	QPAN_COMPUTERMEI = InStrCOMPUTERMEI;

	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt120PrintDel;

END QPAP_CEnt120PkG;
/***END of LINE***************************************************************/
/
SHOW ERROR
