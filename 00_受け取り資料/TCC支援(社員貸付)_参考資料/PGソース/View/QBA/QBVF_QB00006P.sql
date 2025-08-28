CREATE VIEW QBVF_QB00006P ( 
QBVF_UKETSUKENO
,QBVF_HONKNNAME
,QBVF_AESKESSAITANTO
,QBVF_ETNMEIKAN
,QBVF_CARDMEI
,QBVF_ERRNAIYOU
,QBVF_MAKEDATE
 ) AS 
SELECT   QBE4_UketsukeNo QBVF_UketsukeNo,                            /* ��t�ԍ� */
         QBA1_HONKNName QBVF_HONKNName,                              /* �J�i���� */
         QBA7_AESKessaiTanto QBVF_AESKessaiTanto,                    /* ���ْS���� */
         QBAP_EntryPKG.QBAP_GetETenMei(QBE4_ErrKbn) QBVF_ETNMeiKan,  /* �c�ƓX */
         substr(QBE4_ERRNAIYOU, 21, 10) QBVF_CardMei,                /* �J�[�h�敪���� */
         substr(QBE4_ErrNaiyou, 1, 20) QBVF_ErrNaiyou,               /* �G���[���e */
         QBE4_MakeDate QBVF_MakeDate                                 /* �쐬�� */
FROM     QBA1_MoshikomiT,                                            /* �\�����e�[�u�� */
         QBA7_ShinsaKekkaT,                                          /* �R�����ʃe�[�u�� */
         QBE4_PrinttShijiT                                           /* ���[�w���e�[�u�� */
WHERE    QBA7_KankeiKbn = '1'
AND      QBA7_KazokuRbn = '0'
AND      QBA1_UketsukeNo = QBA7_UketsukeNo
AND      QBE4_UketsukeNo = QBA7_UketsukeNo
AND      QBE4_UketsukeNo = QBA1_UketsukeNo
AND      QBE4_ChohyoID = 'QB00006P';
