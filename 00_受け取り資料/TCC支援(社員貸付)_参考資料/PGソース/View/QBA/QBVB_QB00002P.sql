CREATE OR REPLACE VIEW QBVB_QB00002P ( 
QBVB_UKETSUKENO
,QBVB_ETNMEIKAN
,QBVB_CARDMEI
,QBVB_MAKEDATE
,QBVB_ERRNAIYOU
 ) AS 
SELECT QBE4_UketsukeNo,                             /* 受付番号 */
       QTAB_ETNMeiKan,                              /* 営業店 */
       QTA6_CardMei,                                /* カード管理テーブル */
       TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD HH24:MI'),  /* 作成日 */
       QBE4_ERRNAIYOU                               /* エラー内容 */
FROM   QBE4_PrinttShijiT,                           /* 帳票指示テーブル */
       QBA1_MoshikomiT,                             /* 申込書テーブル */
       QTA6_CardCTRLT,                              /* カード管理テーブル */
       QTAB_MiseT                                   /* 店テーブル */
WHERE  QBA1_CardKbn = QTA6_PRMCardKbn
AND    QBA1_EigyoTen = QTAB_PRMEigyouTenCd
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00002P'  /* 1999.04.23 */

UNION

SELECT QBE4_UketsukeNo,
       NVL(QTAB_ETNMeiKan,NULL),
       NVL(QTA6_CardMei,NULL),
       TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD HH24:MI'),
       QBE4_ERRNAIYOU
FROM   QTA1_KAIINM,
       QTA6_CardCTRLT,
       QTAB_MiseT,
       (SELECT QBE4_UketsukeNo,
               QBE4_MakeDate,
               QBE4_ERRNAIYOU
        FROM   QBE4_PrinttShijiT
        WHERE  QBE4_ChohyoID = 'QB00002P'  
        AND    QBE4_UketsukeNo NOT IN(SELECT QBA1_UKETSUKENO FROM QBA1_MOSHIKOMIT))
WHERE  QBE4_UketsukeNo = QTA1_NYKUKETSUKENO(+)
       AND     QTA1_CARDKBN = QTA6_PRMCardKbn(+)
       AND     QTA1_TENEIGYOU = QTAB_PRMEigyouTenCd(+)
;
