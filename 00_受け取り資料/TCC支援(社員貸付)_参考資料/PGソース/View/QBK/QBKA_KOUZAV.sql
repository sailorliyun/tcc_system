CREATE VIEW QBKA_KOUZAV ( 
QBKA_PRMHASOUINYMD
,QBKA_PRMNAIBUKAIINNO
,QBKA_PRMUKETSUKENO
,QBKA_KOZGINKOUCD
,QBKA_KOZSHITENCD
,QBKA_KOZGINKOUMEI
,QBKA_KOZSHITENMEI
 ) AS 
SELECT QBK1_PRMHasouInYmd QBKA_PRMHasouInYmd,
       QBK1_PRMNaibuKaiinNo QBKA_PRMNaibuKaiinNo,
       QBK1_PRMUketukeNo QBKA_PRMUketsukeNo,
       QBK1_KOZGinkouCd QBKA_KOZGinkouCd,
       QBK1_KOZShitenCd QBKA_KOZShitenCd,
       QTA7_KinyuKikanNMKJ QBKA_KOZGinkouMei,
       QTA7_SitenNMKJ QBKA_KOZShitenMei
FROM   QBK1_KFuriT,
       QTA7_GinkouM
WHERE  QBK1_KOZGinkouCd != '9900'
AND    QBK1_KOZGinkouCd = QTA7_PRMKikanCd (+)
AND    SUBSTR(QBK1_KOZShitenCd, 3, 3) = QTA7_PRMShitenCd (+)
GROUP BY QBK1_PRMHasouInYmd,
         QBK1_PRMNaibuKaiinNo,
         QBK1_PRMUketukeNo,
         QBK1_KOZGinkouCd,
         QBK1_KOZShitenCd,
         QTA7_KinyuKikanNMKJ,
         QTA7_SitenNMKJ
UNION
SELECT QBK1_PRMHasouInYmd QBKA_PRMHasouInYmd,
       QBK1_PRMNaibuKaiinNo QBKA_PRMNaibuKaiinNo,
       QBK1_PRMUketukeNo QBKA_PRMUketsukeNo,
       QBK1_KOZGinkouCd QBKA_KOZGinkouCd,
       QBK1_KOZShitenCd QBKA_KOZShitenCd,
       '—X•Ö‹Ç' QBKA_KOZGinkouMei,
       ' ' QBKA_KOZShitenMei
FROM   QBK1_KFuriT
WHERE  QBK1_KOZGinkouCd = '9900'
GROUP BY QBK1_PRMHasouInYmd,
         QBK1_PRMNaibuKaiinNo,
         QBK1_PRMUketukeNo,
         QBK1_KOZGinkouCd,
         QBK1_KOZShitenCd

;
