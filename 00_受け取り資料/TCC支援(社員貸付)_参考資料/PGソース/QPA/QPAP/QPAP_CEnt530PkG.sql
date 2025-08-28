CREATE OR REPLACE PACKAGE  QPAP_CEnt530PkG IS
/****************************************************************************************************************/
/* �V�X�e����	 �F�������N���W�b�g�V�X�e��																		*/
/* �Ɩ���		 �F�Ј��ݕt�V�X�e��																				*/
/* ���W���[����  �FQPAP_CEnt530PkG																				*/
/* �@�\ 		 �F�V�ݕt���c���\																				*/
/* �쐬��		 �F2010/02/25																					*/
/* �쐬��		 �FFIP																							*/
/* �X�V��		 �F2010/07/16	1004091�O���[�v�Ј��ݕt�̍����n�ɔ����V�X�e���Ή�								*/
/* 				 �F				�E�Ј����[���c�����v�\�̒ǉ�													*/
/* 				 �F				�E�Ј����[���c�����X�g�̒ǉ�													*/
/****************************************************************************************************************/

/****************************************************************************************************************/
/*	�P	�錾��																									*/
/****************************************************************************************************************/

/* �f�[�^�����擾 */
PROCEDURE QPAP_CEnt530Search(
	 InStrYMD 		IN	CHAR					--�N��
	,OtNumRecCount	OUT	NUMBER);				--����

/* �c�������e�[�u������f�[�^���擾���A���[�N�e�[�u���֊i�[ */
PROCEDURE QPAP_CEnt530SetWorkTable(
	 InStrYMD 		IN	CHAR					--�N��
	,InStrUserID		IN	VARCHAR2			--���[�U�[�h�c
	,InStrComputerNM	IN	VARCHAR2);			--�R���s���[�^��

/* �g�p���[�N�e�[�u���S�폜 */
PROCEDURE QPAP_CEnt530DelWorkTbl(
	 InStrUserID		IN	VARCHAR2			--���[�U�[�h�c
	,InStrComputerNM	IN	VARCHAR2);			--�R���s���[�^��

/* ADD 20100716 1004091 IMZ NISHIKADO START */
/* �g�p���[�N�e�[�u���폜�i�Ј����[���c���ٓ����X�g�p�j */
PROCEDURE QPAP_CEnt530DelWorkTblIdou(
	 InStrUserID 	IN	VARCHAR2				--���[�U�[�h�c
	,InStrComputerNM IN	VARCHAR2);				--�R���s���[�^��

/* �f�[�^�����擾�i�Ј����[���c���ٓ����X�g�p�j */
PROCEDURE QPAP_CEnt530SearchIdou(
	 InStrYMD 		IN	CHAR					--����
	,InStrYMDZen 	IN	CHAR					--�O��
	,OtNumRecCount	OUT	NUMBER);				--����

/* �c�������e�[�u������f�[�^���擾���A���[�N�e�[�u���֊i�[�i�Ј����[���c���ٓ����X�g�p�j */
PROCEDURE QPAP_CEnt530SetWorkTableIdou(
	 InStrYMD 			IN	CHAR				--����
	,InStrYMDZen 		IN	CHAR				--�O��
	,InStrUserID		IN	VARCHAR2			--���[�U�[�h�c
	,InStrComputerNM	IN	VARCHAR2);			--�R���s���[�^��
/* ADD 20100716 1004091 IMZ NISHIKADO END   */

END QPAP_CEnt530PkG;
/

show error
/****************************************************************************************************************/
/*�Q  �{�f�B�[																									*/
/****************************************************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt530PkG IS

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt530Search																			*/
/* �@�\ 		 �F�f�[�^�����擾																				*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530Search (
	 InStrYMD		IN	CHAR					--��������  �o�͔N����
	,OtNumRecCount	OUT	NUMBER) IS 				--�f�[�^����

BEGIN
  SELECT COUNT(*) INTO OtNumRecCount
  FROM	 QPB3_ZNDKRRK
  WHERE  QPB3_SYORIYMD = To_date(InStrYMD,'YYYYMMDD')
	AND  QPB3_SYORIKBN = '9';
  
EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530Search;

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt530SetWorkTable 																	*/
/* �@�\ 		 �F�c�������e�[�u������f�[�^���擾���A���[�N�e�[�u���֊i�[ 									*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SetWorkTable (
    InStrYMD 		 IN 	CHAR					--�N��
   ,InStrUserID		 IN 	VARCHAR2				--���[�U�[�h�c
   ,InStrComputerNM	 IN 	VARCHAR2) IS			--�R���s���[�^��

BEGIN
	--���[�N�e�[�u�����폜
	DELETE FROM QPB4_NEWZANDAKAW
	WHERE QPB4_USERID     = InStrUserID
	  AND QPB4_COMPUTERNM = InStrComputerNM;

	--���[�N�e�[�u����INSERT	
	INSERT INTO QPB4_NEWZANDAKAW
	(SELECT 
		QPAC_TOZAIKBN									--�����敪
	   ,CASE WHEN OTHER.NAMEX is NULL THEN QPAC_MISECD
			 ELSE '000' END								--��ЃR�[�h
	   ,CASE WHEN OTHER.NAMEX is NULL THEN QPAE_MISENM
			 ELSE '��������' END						--��Ж�
	   ,QPAC_MISECD							--�X�R�[�h
	   ,QPAE_MISENM							--�X��
	   ,QPAC_BUMONCD						--����R�[�h
	   ,QPAF_BUMONNM						--���喼
	   ,QPB3_SYAINCD1						--�Ј��R�[�h1
	   ,QPB3_SYAINCD2						--�Ј��R�[�h2
	   ,QPAC_SIMEIKANJI						--��������
	   ,QPB3_SYUBETU						--���[�����(1�F�����A2�F�؏�)
	   ,To_Char(QPB3_YUSIYMD,'YYYYMMDD')	--�Z����
	   ,Decode(QPB3_SYUBETU,'1',QPB3_FZANDAKA,Null)		--���� �O�����c��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_FZANDAKA,Null)		--�؏� �O�����c��
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KASHITSUKE,Null)	--���� �����ݕt���z
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KASHITSUKE,Null)	--�؏� �����ݕt���z
	   ,Decode(QPB3_SYUBETU,'1',QPB3_GANKIN,Null)		--���� ���������z(���{)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_GANKIN,Null)		--�؏� ���������z(���{)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_ZANDAKA,Null)		--���� �������c��(���{)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_ZANDAKA,Null)		--�؏� �������c��(���{)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKU,Null)		--���� �����������
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKU,Null)		--�؏� �����������
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUK,Null)	--���� �����������^��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUK,Null)	--�؏� �����������^��
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUS,Null)	--���� ���������ܗ^��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUS,Null)	--�؏� ���������ܗ^��
	   ,InStrUserID							--���[�UID
	   ,InStrComputerNM						--�R���s���[�^��
	FROM
		QPB3_ZNDKRRK
	   ,QPAC_SYAINM
	   ,QPAE_MISEM
	   ,QPAF_BUMONM
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER
	WHERE
		QPB3_SYORIYMD = To_date(InStrYMD,'YYYYMMDD')
	AND QPB3_SYORIKBN = '9'
	AND QPB3_SYAINCD1 = QPAC_PRMSYAINCD1
	AND QPB3_SYAINCD2 = QPAC_PRMSYAINCD2
	AND QPAC_MISECD   = QPAE_PRMMISECD
	AND QPAC_BUMONCD  = QPAF_PRMBUMONCD(+)
	AND QPAC_MISECD   = QPAF_PRMMISECD(+)
	AND QPAC_MISECD   = OTHER.NAMEX(+)
	);

	COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SetWorkTable;

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt530DelWorkTbl									 */
/* �@�\ 		 �F�g�p���[�N�e�[�u���S�폜 								 */
/*****************************************************************************/
PROCEDURE QPAP_CEnt530DelWorkTbl(
	InStrUserID 	IN	VARCHAR2,		  --���[�U�[�h�c
	InStrComputerNM IN	VARCHAR2) IS	  --�R���s���[�^��

BEGIN
	DELETE FROM QPB4_NEWZANDAKAW
	  WHERE QPB4_USERID 	= InStrUserID
		AND QPB4_COMPUTERNM = InStrComputerNM;

	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt530DelWorkTbl;

/* ADD 20100716 1004091 IMZ NISHIKADO START */

/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt530DelWorkTblIdou								 */
/* �@�\ 		 �F�Ј����[���c���ٓ����X�g�g�p���[�N�e�[�u���폜			 */
/*****************************************************************************/
PROCEDURE QPAP_CEnt530DelWorkTblIdou(
	InStrUserID 	IN	VARCHAR2,		  --���[�U�[�h�c
	InStrComputerNM IN	VARCHAR2) IS	  --�R���s���[�^��

BEGIN
	DELETE FROM QPB7_ZNDKIDOUW
	  WHERE QPB7_USERID 	= InStrUserID
		AND QPB7_COMPUTERNM = InStrComputerNM;

	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
END QPAP_CEnt530DelWorkTblIdou;

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt530SearchIdou																		*/
/* �@�\ 		 �F�f�[�^�����擾(�Ј����[���c���ٓ����X�g�o�͑Ώی���)											*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SearchIdou (
	 InStrYMD		IN	CHAR					--��������  �o�͔N����
	,InStrYMDZen	IN	CHAR					--��������  �o�͔N�����̑O������
	,OtNumRecCount	OUT	NUMBER) IS 				--�f�[�^����

BEGIN
  SELECT COUNT(*) INTO OtNumRecCount
	FROM 
			(SELECT	 QPB3_SYAINCD1
					,QPB3_SYAINCD2
					,QPB3_SYUBETU
					,QPB3_YUSIYMD
					,QPB3_TOZAIKBN
					,QPB3_SYOZOKUCD
					,QPB3_SYOZOKUNM
			FROM	QPB3_ZNDKRRK
			WHERE	QPB3_SYORIYMD=To_date(InStrYMD,'YYYYMMDD')
			AND		QPB3_SYORIKBN='9'
			) TOUGETU,
			(SELECT	 QPB3_SYAINCD1
					,QPB3_SYAINCD2
					,QPB3_SYUBETU
					,QPB3_YUSIYMD
					,QPB3_TOZAIKBN
					,QPB3_SYOZOKUCD
					,QPB3_SYOZOKUNM
			FROM	QPB3_ZNDKRRK
			WHERE	QPB3_SYORIYMD=To_date(InStrYMDZen,'YYYYMMDD')
			AND		(QPB3_ZANDAKA<>0 OR QPB3_KJRISOKUK<>0 OR QPB3_KJRISOKUS<>0)
			AND		QPB3_SYORIKBN='9'
			) ZENGETU
	WHERE	TOUGETU.QPB3_SYAINCD1 = ZENGETU.QPB3_SYAINCD1
	AND		TOUGETU.QPB3_SYAINCD2 = ZENGETU.QPB3_SYAINCD2
	AND		TOUGETU.QPB3_SYUBETU = ZENGETU.QPB3_SYUBETU
	AND		NVL(To_Char(TOUGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(ZENGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ')
	AND		(TOUGETU.QPB3_TOZAIKBN <> ZENGETU.QPB3_TOZAIKBN
	        OR	TOUGETU.QPB3_SYOZOKUCD <> ZENGETU.QPB3_SYOZOKUCD)
	;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SearchIdou;

/****************************************************************************************************************/
/* ���W���[����  �FQPAP_CEnt530SetWorkTable 																	*/
/* �@�\ 		 �F�c�������e�[�u������f�[�^���擾���A�c���ٓ����[�N�e�[�u���֊i�[ 							*/
/****************************************************************************************************************/
PROCEDURE QPAP_CEnt530SetWorkTableIdou (
    InStrYMD 		 IN 	CHAR					--����
   ,InStrYMDZen		 IN 	CHAR					--�O��
   ,InStrUserID		 IN 	VARCHAR2				--���[�U�[�h�c
   ,InStrComputerNM	 IN 	VARCHAR2) IS			--�R���s���[�^��

BEGIN
	--���[�N�e�[�u�����폜
	QPAP_CEnt530DelWorkTblIdou(InStrUserID,InStrComputerNM);

	INSERT INTO QPB7_ZNDKIDOUW
	(SELECT 
	    Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,'1','2')					--�ٓ��敪�i����=1(�]��)�A�O��=2(�]�o)�j
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD
	   		,CASE WHEN OTHER1.NAMEX is NULL THEN SYOZOKUCD1 ELSE '000' END
			,CASE WHEN OTHER2.NAMEX is NULL THEN SYOZOKUCD2 ELSE '000' END)			--��ЃR�[�h
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD
	   		,CASE WHEN OTHER1.NAMEX is NULL THEN SYOZOKUNM1 ELSE '��������' END
			,CASE WHEN OTHER2.NAMEX is NULL THEN SYOZOKUNM2 ELSE '��������' END)	--��Ж�
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.TOZAIKBN1,IDOUSYAIN.TOZAIKBN2)		--�����敪
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUCD1,IDOUSYAIN.SYOZOKUCD2)	--�����X�P�i����=�ٓ���A�O��=�ٓ����j
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUNM1,IDOUSYAIN.SYOZOKUNM2)
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUCD2,IDOUSYAIN.SYOZOKUCD1)	--�����X�Q�i����=�ٓ����A�O��=�ٓ���j
	   ,Decode(to_char(QPB3_SYORIYMD,'YYYYMMDD'),InStrYMD,IDOUSYAIN.SYOZOKUNM2,IDOUSYAIN.SYOZOKUNM1)
	   ,QPB3_SYAINCD1									--�Ј��R�[�h1
	   ,QPB3_SYAINCD2									--�Ј��R�[�h2
	   ,QPAC_SIMEIKANJI									--��������
	   ,QPB3_SYUBETU									--���[�����(1�F�����A2�F�؏�)
	   ,To_Char(QPB3_YUSIYMD,'YYYYMMDD')				--�Z����
	   ,Decode(QPB3_SYUBETU,'1',QPB3_FZANDAKA,Null)		--���� �O�����c��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_FZANDAKA,Null)		--�؏� �O�����c��
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KASHITSUKE,Null)	--���� �����ݕt���z
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KASHITSUKE,Null)	--�؏� �����ݕt���z
	   ,Decode(QPB3_SYUBETU,'1',QPB3_GANKIN,Null)		--���� ���������z(���{)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_GANKIN,Null)		--�؏� ���������z(���{)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_ZANDAKA,Null)		--���� �������c��(���{)
	   ,Decode(QPB3_SYUBETU,'2',QPB3_ZANDAKA,Null)		--�؏� �������c��(���{)
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKU,Null)		--���� �����������
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKU,Null)		--�؏� �����������
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUK,Null)	--���� �����������^��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUK,Null)	--�؏� �����������^��
	   ,Decode(QPB3_SYUBETU,'1',QPB3_KJRISOKUS,Null)	--���� ���������ܗ^��
	   ,Decode(QPB3_SYUBETU,'2',QPB3_KJRISOKUS,Null)	--�؏� ���������ܗ^��
	   ,InStrUserID										--���[�UID
	   ,InStrComputerNM									--�R���s���[�^��
	FROM
		QPB3_ZNDKRRK
	   ,QPAC_SYAINM
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER1
	   ,(SELECT TRIM(QPAH_NAMEX) NAMEX FROM QPAH_OTHERM WHERE QPAH_PRMCODE LIKE 'TMISE%') OTHER2
	   ,(
			SELECT	 TOUGETU.QPB3_SYAINCD1 IDOUSYAINCD1
					,TOUGETU.QPB3_SYAINCD2 IDOUSYAINCD2
					,TOUGETU.QPB3_SYUBETU IDOUSYUBETU
					,TOUGETU.QPB3_YUSIYMD IDOUYUSIYMD
					,TOUGETU.QPB3_TOZAIKBN TOZAIKBN1
					,TOUGETU.QPB3_SYOZOKUCD SYOZOKUCD1
					,TOUGETU.QPB3_SYOZOKUNM SYOZOKUNM1
					,ZENGETU.QPB3_TOZAIKBN TOZAIKBN2
					,ZENGETU.QPB3_SYOZOKUCD SYOZOKUCD2
					,ZENGETU.QPB3_SYOZOKUNM SYOZOKUNM2
			FROM 
					(SELECT	 QPB3_SYAINCD1
							,QPB3_SYAINCD2
							,QPB3_SYUBETU
							,QPB3_YUSIYMD
							,QPB3_TOZAIKBN
							,QPB3_SYOZOKUCD
							,QPB3_SYOZOKUNM
					FROM	QPB3_ZNDKRRK
					WHERE	QPB3_SYORIYMD=To_date(InStrYMD,'YYYYMMDD')
					AND		QPB3_SYORIKBN='9'
					) TOUGETU,
					(SELECT	 QPB3_SYAINCD1
							,QPB3_SYAINCD2
							,QPB3_SYUBETU
							,QPB3_YUSIYMD
							,QPB3_TOZAIKBN
							,QPB3_SYOZOKUCD
							,QPB3_SYOZOKUNM
					FROM	QPB3_ZNDKRRK
					WHERE	QPB3_SYORIYMD=To_date(InStrYMDZen,'YYYYMMDD')
					AND		(QPB3_ZANDAKA<>0 OR QPB3_KJRISOKUK<>0 OR QPB3_KJRISOKUS<>0)
					AND		QPB3_SYORIKBN='9'
					) ZENGETU
			WHERE	TOUGETU.QPB3_SYAINCD1 = ZENGETU.QPB3_SYAINCD1
			AND		TOUGETU.QPB3_SYAINCD2 = ZENGETU.QPB3_SYAINCD2
			AND		TOUGETU.QPB3_SYUBETU = ZENGETU.QPB3_SYUBETU
			AND		NVL(To_Char(TOUGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(ZENGETU.QPB3_YUSIYMD,'YYYYMMDD'),' ')
			AND		(TOUGETU.QPB3_TOZAIKBN <> ZENGETU.QPB3_TOZAIKBN
			        OR	TOUGETU.QPB3_SYOZOKUCD <> ZENGETU.QPB3_SYOZOKUCD)
		) IDOUSYAIN
	WHERE
		QPB3_SYORIYMD >= To_date(InStrYMDZen,'YYYYMMDD') 
	AND QPB3_SYORIYMD <= To_date(InStrYMD,'YYYYMMDD')
	AND QPB3_SYORIKBN = '9'
	AND QPB3_SYAINCD1 = IDOUSYAINCD1
	AND QPB3_SYAINCD2 = IDOUSYAINCD2
	AND QPB3_SYUBETU = IDOUSYUBETU
	AND NVL(To_Char(QPB3_YUSIYMD,'YYYYMMDD'),' ') = NVL(To_Char(IDOUYUSIYMD,'YYYYMMDD'),' ')
	AND QPB3_SYAINCD1 = QPAC_PRMSYAINCD1
	AND QPB3_SYAINCD2 = QPAC_PRMSYAINCD2
	AND SYOZOKUCD1    = OTHER1.NAMEX(+)
	AND SYOZOKUCD2    = OTHER2.NAMEX(+)
	);

	COMMIT;

EXCEPTION
  WHEN	OTHERS	THEN
	RAISE ;

END QPAP_CEnt530SetWorkTableIdou;
/* ADD 20100716 1004091 IMZ NISHIKADO END */

END QPAP_CEnt530PkG;
/****************************************************************************************************************/
/* END of LINE																									*/
/****************************************************************************************************************/
/
show error
