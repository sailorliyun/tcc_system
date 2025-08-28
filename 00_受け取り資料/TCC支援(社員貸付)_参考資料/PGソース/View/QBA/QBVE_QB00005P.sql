CREATE VIEW QBVE_QB00005P ( 
QBVE_UKETSUKENO
,QBVE_CARDMEI
,QBVE_HONKJNAME
,QBVE_CTLCANS
,QBVE_MAKEDATE
,QBVE_IMAGESTRDATE
 ) AS 
SELECT QBA1_UketsukeNo,                         /* 受付番号 */
       QTA6_CardMei,                            /* カード名 */
       QBA1_HONKJName,                          /* 名前 */
       QBA1_CTLCans,                            /* 却下・キャンセル */
       TO_CHAR(QBE4_MakeDate, 'YYYY/MM/DD'),    /* 作成日 */
       TO_CHAR(QBA1_ImageSTRDate, 'YYYY/MM/DD') /* イメージ登録日 5/27*/
FROM   QBA1_MoshikomiT,                         /* 申込書テーブル */
       QBE4_PrinttShijiT,                       /* 帳票指示テーブル */
       QTA6_CardCTRLT                           /* カード管理テーブル */
WHERE  QBA1_CardKbn = QTA6_PRMCardKbn
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00005P'
;
