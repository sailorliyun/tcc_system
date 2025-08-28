CREATE VIEW QBVE_QB00005P ( 
QBVE_UKETSUKENO
,QBVE_CARDMEI
,QBVE_HONKJNAME
,QBVE_CTLCANS
,QBVE_MAKEDATE
,QBVE_IMAGESTRDATE
 ) AS 
SELECT QBA1_UketsukeNo,                         /* ��t�ԍ� */
       QTA6_CardMei,                            /* �J�[�h�� */
       QBA1_HONKJName,                          /* ���O */
       QBA1_CTLCans,                            /* �p���E�L�����Z�� */
       TO_CHAR(QBE4_MakeDate, 'YYYY/MM/DD'),    /* �쐬�� */
       TO_CHAR(QBA1_ImageSTRDate, 'YYYY/MM/DD') /* �C���[�W�o�^�� 5/27*/
FROM   QBA1_MoshikomiT,                         /* �\�����e�[�u�� */
       QBE4_PrinttShijiT,                       /* ���[�w���e�[�u�� */
       QTA6_CardCTRLT                           /* �J�[�h�Ǘ��e�[�u�� */
WHERE  QBA1_CardKbn = QTA6_PRMCardKbn
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00005P'
;
