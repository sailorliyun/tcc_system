--��t�ԍ��A���[���ꗗ
--DROP   VIEW QBVQ_QB00018P;
CREATE VIEW QBVQ_QB00018P (
 QBVQ_MAKEDATE
,QBVQ_UKETSUKENO
,QBVQ_ERRKBN
,QBVQ_KANANM
,QBVQ_ALERM
 ) AS 
SELECT
	 TO_DATE(TO_CHAR(QBE4_MAKEDATE,'YYYY/MM/DD'),'YYYY/MM/DD') QBVQ_MAKEDATE   -- �쐬��
	,QBE4_UKETSUKENO                                           QBVQ_UKETSUKENO -- ��t�ԍ�
	,QBE4_ERRKBN                                               QBVQ_ERRKBN     -- �A���[���敪
	,SUBSTR(RPAD(QBE4_ERRNAIYOU,31,' '),1,30)                  QBVQ_KANANM     -- �A���[�������J�i
	,SUBSTR(RPAD(QBE4_ERRNAIYOU,81,' '),31,80)                 QBVQ_ALERM      -- �A���[�����e
FROM
	QBE4_PRINTTSHIJIT
WHERE
	QBE4_CHOHYOID = 'QB00018P';
