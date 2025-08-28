CREATE VIEW QBK9_SOUFUSAKIV ( 
QBK9_PRMHASOUINYMD
,QBK9_PRMNAIBUKAIINNO
,QBK9_PRMUKETSUKENO
,QBK9_SOHTOUZAIKBN
,QBK9_SOHSOUFUSAKIKBN
,QBK9_SOHGINKOUCD
,QBK9_SOHSHITENCD
,QBK9_SOHATENA
,QBK9_SOHSHITENMEI
,QBK9_SOHTEL
,QBK9_SOHTANTOMEI
 ) AS 
SELECT QBK1_PRMHasouInYmd QBK9_PRMHasouInYmd,
       QBK1_PRMNaibuKaiinNo QBK9_PRMNaibuKaiinNo,
       QBK1_PRMUketukeNo QBK9_PRMUketsukeNo,
       QBK1_SOHTouzaiKbn QBK9_SOHTouzaiKbn,
       QBK1_SOHSoufusakiKbn QBK9_SOHSoufusakiKbn,
       QBK1_SOHGinkouCd QBK9_SOHGinkouCd,
       QBK1_SOHShitenCd QBK9_SOHShitenCd,
       QBK2_SOHAtena QBK9_SOHAtena,
       '' QBK9_SOHShitenMei,
       RTRIM(QBK2_SOHTelShigai) || '-' || RTRIM(QBK2_SOHTelKyoku) || '-' || RTRIM(QBK2_SOHTelNo) QBK9_SOHTel,
       QBK2_SOHTantoMei QBK9_SOHTantoMei
FROM   QBK1_KFuriT,
       QBK2_TGinkoM
WHERE  QBK1_SOHShitenCd = '00000'
AND    QBK1_SOHTouzaiKbn = QBK2_PRMTouzaiKbn (+)
AND    QBK1_SOHSoufusakiKbn = QBK2_PRMSoufusakiKbn (+)
AND    QBK1_SOHGinkouCd = QBK2_PRMGinkouCd (+)
UNION
SELECT QBK1_PRMHasouInYmd QBK9_PRMHasouInYmd,
       QBK1_PRMNaibuKaiinNo QBK9_PRMNaibuKaiinNo,
       QBK1_PRMUketukeNo QBK9_PRMUketsukeNo,
       QBK1_SOHTouzaiKbn QBK9_SOHTouzaiKbn,
       QBK1_SOHSoufusakiKbn QBK9_SOHSoufusakiKbn,
       QBK1_SOHGinkouCd QBK9_SOHGinkouCd,
       QBK1_SOHShitenCd QBK9_SOHShitenCd,
       QTA7_KinyuKikanNMKJ QBK9_SOHAtena,
       QTA7_SitenNMKJ QBK9_SOHShitenMei,
       QTA7_Tel QBK9_SOHTel,
       '' QBK9_SOHTantoMei
FROM   QBK1_KFuriT,
       QTA7_GinkouM
WHERE  QBK1_SOHShitenCd != '00000'
AND    QTA7_PRMHukaCd = '1'
AND    QTA7_PRMKikanCd = QBK1_SOHGinkouCd
AND    QTA7_PRMShitenCd = SUBSTR(QBK1_SOHShitenCd, 3, 3)

;
