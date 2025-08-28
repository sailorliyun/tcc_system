CREATE VIEW QBVF_QB00006P ( 
QBVF_UKETSUKENO
,QBVF_HONKNNAME
,QBVF_AESKESSAITANTO
,QBVF_ETNMEIKAN
,QBVF_CARDMEI
,QBVF_ERRNAIYOU
,QBVF_MAKEDATE
 ) AS 
SELECT   QBE4_UketsukeNo QBVF_UketsukeNo,                            /* 受付番号 */
         QBA1_HONKNName QBVF_HONKNName,                              /* カナ氏名 */
         QBA7_AESKessaiTanto QBVF_AESKessaiTanto,                    /* 決裁担当者 */
         QBAP_EntryPKG.QBAP_GetETenMei(QBE4_ErrKbn) QBVF_ETNMeiKan,  /* 営業店 */
         substr(QBE4_ERRNAIYOU, 21, 10) QBVF_CardMei,                /* カード区分名称 */
         substr(QBE4_ErrNaiyou, 1, 20) QBVF_ErrNaiyou,               /* エラー内容 */
         QBE4_MakeDate QBVF_MakeDate                                 /* 作成日 */
FROM     QBA1_MoshikomiT,                                            /* 申込書テーブル */
         QBA7_ShinsaKekkaT,                                          /* 審査結果テーブル */
         QBE4_PrinttShijiT                                           /* 帳票指示テーブル */
WHERE    QBA7_KankeiKbn = '1'
AND      QBA7_KazokuRbn = '0'
AND      QBA1_UketsukeNo = QBA7_UketsukeNo
AND      QBE4_UketsukeNo = QBA7_UketsukeNo
AND      QBE4_UketsukeNo = QBA1_UketsukeNo
AND      QBE4_ChohyoID = 'QB00006P';
