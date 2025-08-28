--DROP   VIEW QBVA_QB00001P;
CREATE VIEW QBVA_QB00001P ( 
QBVA_UKETSUKEDATE
,QBVA_ETNMEIKAN
,QBVA_CARDMEI
,QBVA_UKETSUKECOUNT
 ) AS 
Select 
A1                               QBVA_UKETSUKEDATE,  /* ��t�N���� */
DECODE(B5,Null,'* ','  ') || A2  QBVA_ETNMEIKAN,     /* �c�ƓX */
A3                               QBVA_CARDMEI,       /* �J�[�h�� */
A4                               QBVA_UKETSUKECOUNT  /* ��t���� */
From (
SELECT   TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD')  A1,
         QTAB_ETNMeiKan                       A2,
         QTA6_CardMei                         A3,
         COUNT(QBE4_UketsukeNo)               A4,
         QBA1_CardKbn                         A5
FROM     QBA1_MoshikomiT,                         /* �\�����e�[�u�� */
         QBE4_PrinttShijiT,                       /* ���[�w���e�[�u�� */
         QTAB_MiseT,                              /* �X�e�[�u�� */
         QTA6_CardCTRLT                           /* �J�[�h�Ǘ��e�[�u�� */
WHERE    QBA1_Eigyoten   = QTAB_PRMEigyouTenCd
AND      QBA1_CardKbn    = QTA6_PRMCardKbn
AND      QBE4_UketsukeNo = QBA1_UketsukeNo
AND      QBE4_ChohyoID   = 'QB00001P'
GROUP BY TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD'),
         QTAB_ETNMeiKan,
         QBA1_CardKbn,
         QTA6_CardMei),(
SELECT   SUBSTR(QSA3_MEI, 7,6)                B5
FROM     QSA3_CODEV
WHERE    QSA3_PRMCODEKBN = 'DC2'
AND      SUBSTR(QSA3_MEI,13,1) = '1'
GROUP BY SUBSTR(QSA3_MEI, 7,6) )
Where A5 = B5(+);
