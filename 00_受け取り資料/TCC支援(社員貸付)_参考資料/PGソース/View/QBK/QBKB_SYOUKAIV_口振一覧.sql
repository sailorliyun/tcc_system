--DROP   VIEW QBKB_SYOUKAIV;

CREATE VIEW QBKB_SYOUKAIV ( 
QBKB_PRMUKETSUKENO
,QBKB_PRMHASOUINYMD
,QBKB_PRMNAIBUKAIINNO
,QBKB_KIGYOUCD
,QBKB_SUBRANGEKEY
,QBKB_GAIBUKAIINNO
,QBKB_BLACKNO
,QBKB_CARDKBN
,QBKB_SAIKENKANRI
,QBKB_TOUZAIKBN
,QBKB_GYOUMUKBN
,QBKB_DATHASOUYMD
,QBKB_DATHENKYAKUYMD
,QBKB_DATJFHENREIYMD
,QBKB_HEKHENKYAKUKBN
,QBKB_JFHSEIKYUYM
,QBKB_JFHHURIKAEKEKACD
,QBKB_HONSHIMEIKAN
,QBKB_HONSHIMEIKANA
,QBKB_TELSHIGAI
,QBKB_TELKYOKU
,QBKB_TELNO
,QBKB_HONKJNAME
,QBKB_HONKNNAME
,QBKB_TEL1
,QBKB_TEL2
,QBKB_TEL3
,QBKB_HEKRIYUCD1
,QBKB_HEKRIYUCD2
,QBKB_HEKRIYUCD3
,QBKB_HEKRIYUCD4
,QBKB_HEKRIYUCD5
,QBKB_HEKRIYUCD6
,QBKB_RIYUMEI1
,QBKB_RIYUMEI2
,QBKB_RIYUMEI3
,QBKB_RIYUMEI4
,QBKB_RIYUMEI5
,QBKB_RIYUMEI6
,QBKB_SOHTOUZAIKBN
,QBKB_SOHSOUFUSAKIKBN
,QBKB_SOHGINKOUCD
,QBKB_SOHSHITENCD
,QBKB_SOHATENA
,QBKB_SOHSHITENMEI
,QBKB_SOHTEL
,QBKB_SOHKAKUNINKBN
,QBKB_SOHTANTOMEI
,QBKB_KOZYUCHOSAIHATU
,QBKB_KOZSHUMOKU
,QBKB_KOZNO
,QBKB_KOZMEIGI
,QBKB_KOZGINKOUCD
,QBKB_KOZSHITENCD
,QBKB_KOZGINKOUMEI
,QBKB_KOZSHITENMEI
 ) AS 
SELECT QBK1_PRMUketukeNo QBKB_PRMUketsukeNo,
       QBK1_PRMHasouInYmd QBKB_PRMHasouInYmd,
       QBK1_PRMNaibuKaiinNo QBKB_PRMNaibuKaiinNo,
       QBK1_KigyouCd QBKB_KigyouCd,
       QBK1_SubRangeKey QBKB_SubRangeKey,
       REPLACE(QSAP_EdKaiinNoPkg.QSAP_EdKaiinNoFnc(2, QBK1_GaibuKaiinNo), '00-00-0000-0-0', ' ') QBKB_GaibuKaiinNo,
       QBK1_BlackNo QBKB_BlackNo,
       QBK1_CardKbn QBKB_CardKbn,
       QBK1_SAIKENKANRI QBKB_SAIKENKANRI,          /* 2002.10.31 ’Ç‰Á */
       QTAB.QTAB_TOUZAIKBN QBKB_TOUZAIKBN,         /* 2002.10.31 ’Ç‰Á */
       QBK1_GyoumuKbn QBKB_GyoumuKbn,
       QBK1_DATHasouYmd QBKB_DATHasouYmd,
       QBK1_DATHenkyakuYmd QBKB_DATHenkyakuYmd,
       QBK1_DATJFHenreiYmd QBKB_DATJFHenreiYmd,
       QBK1_HEKHenkyakuKbn QBKB_HEKHenkyakuKbn,
       QBK1_JFHSeikyuYm QBKB_JFHSeikyuYm,
       QBK1_JFHHurikaeKekaCd QBKB_JFHHurikaeKekaCd,
       QTA1_HONShimeiKan QBKB_HONShimeiKan,
       QTA1_HONShimeiKana QBKB_HONShimeiKana,       /* 1999.06.07 ’Ç‰Á */
       QTA1_JTKTelShigai QBKB_TelShigai,
       QTA1_JTKTelKyoku QBKB_TelKyoku,
       QTA1_JTKTelNo QBKB_TelNo,
       QBA1_HONKJName QBKB_HONKJName,
       QBA1_HONKNName QBKB_HONKNName,               /* 1999.06.07 ’Ç‰Á */
       QBA1_HONTel1 QBKB_Tel1,
       QBA1_HONTel2 QBKB_Tel2,
       QBA1_HONTel3 QBKB_Tel3,
       QBK1_HEKRiyuCd1 QBKB_HEKRiyuCd1,
       QBK1_HEKRiyuCd2 QBKB_HEKRiyuCd2,
       QBK1_HEKRiyuCd3 QBKB_HEKRiyuCd3,
       QBK1_HEKRiyuCd4 QBKB_HEKRiyuCd4,
       QBK1_HEKRiyuCd5 QBKB_HEKRiyuCd5,
       QBK1_HEKRiyuCd6 QBKB_HEKRiyuCd6,
       QBK4_A.QBK4_RyakuMei QBKB_RiyuMei1,
       QBK4_B.QBK4_RyakuMei QBKB_RiyuMei2,
       QBK4_C.QBK4_RyakuMei QBKB_RiyuMei3,
       QBK4_D.QBK4_RyakuMei QBKB_RiyuMei4,
       QBK4_E.QBK4_RyakuMei QBKB_RiyuMei5,
       QBK4_F.QBK4_RyakuMei QBKB_RiyuMei6,
       QBK9_SOHTouzaiKbn QBKB_SOHTouzaiKbn,
       QBK9_SOHSoufusakiKbn QBKB_SOHSoufusakiKbn,
       QBK9_SOHGinkouCd QBKB_SOHGinkouCd,
       QBK9_SOHShitenCd QBKB_SOHShitenCd,
       QBK9_SOHAtena QBKB_SOHAtena,
       QBK9_SOHShitenMei QBKB_SOHShitenMei,
       QBK9_SOHTel QBKB_SOHTel,
       QBK1_SOHKakuninKbn QBKB_SOHKakuninKbn,
       QBK9_SOHTantoMei QBKB_SOHTantoMei,
       QBK1_KOZYuchosaihatu QBKB_KOZYuchosaihatu,
       QBK1_KOZShumoku QBKB_KOZShumoku,
       QBK1_KOZNo QBKB_KOZNo,
       QBK1_KOZMeigi QBKB_KOZMeigi,
       QBKA_KOZGinkouCd QBKB_KOZGinkouCd,
       QBKA_KOZShitenCd QBKB_KOZShitenCd,
       QBKA_KOZGinkouMei QBKB_KOZGinkouMei,
       QBKA_KOZShitenMei QBKB_KOZShitenMei
FROM   QBK1_KFURIT,
       QBA1_MOSHIKOMIT,
       QTA1_KAIINM,
/* 2002.10.31 ’Ç‰Á >> */
      (SELECT QTAB_PRMEigyouTenCd,
              QTAB_TOUZAIKBN
       FROM   QTAB_MISET
       WHERE  QTAB_PRMKigyouCd = '1203'
         AND  QTAB_PRMYukoKaishi <= SYSDATE
         AND  QTAB_PRMYukoOwari  >= SYSDATE) QTAB,
/* 2002.10.31 ’Ç‰Á << */
       QBK9_SoufusakiV,
       QBKA_KouzaV,
       QBK4_KFubiRiyuM QBK4_A,
       QBK4_KFubiRiyuM QBK4_B,
       QBK4_KFubiRiyuM QBK4_C,
       QBK4_KFubiRiyuM QBK4_D,
       QBK4_KFubiRiyuM QBK4_E,
       QBK4_KFubiRiyuM QBK4_F
WHERE  QBK1_PRMUketukeNo = QBA1_UketsukeNo(+)
AND    QBK1_KigyouCd = QTA1_PRMKigyouCd(+)
AND    QBK1_SubRangeKey = QTA1_PRMSubRangeKey(+)
AND    QBK1_PRMNaibuKaiinNo = QTA1_PRMNaibuKaiinNo(+)
AND    QBK1_HEKRiyuCd1 = QBK4_A.QBK4_PRMRiyuCd
AND    QBK1_HEKRiyuCd2 = QBK4_B.QBK4_PRMRiyuCd
AND    QBK1_HEKRiyuCd3 = QBK4_C.QBK4_PRMRiyuCd
AND    QBK1_HEKRiyuCd4 = QBK4_D.QBK4_PRMRiyuCd
AND    QBK1_HEKRiyuCd5 = QBK4_E.QBK4_PRMRiyuCd
AND    QBK1_HEKRiyuCd6 = QBK4_F.QBK4_PRMRiyuCd
AND    QBK1_PRMUketukeNo = QBK9_PRMUketsukeNo
AND    QBK1_PRMNaibuKaiinNo = QBK9_PRMNaibuKaiinNo
AND    QBK1_PRMHasouInYmd = QBK9_PRMHasouInYmd
AND    QBK1_PRMUketukeNo = QBKA_PRMUketsukeNo
AND    QBK1_PRMNaibuKaiinNo = QBKA_PRMNaibuKaiinNo
AND    QBK1_PRMHasouInYmd = QBKA_PRMHasouInYmd
AND    QBK1_SAIKENKANRI = QTAB.QTAB_PRMEigyouTenCd(+)
GROUP BY QBK1_PRMHasouInYmd,
         QBK1_PRMNaibuKaiinNo,
         QBK1_PRMUketukeNo,
         QBK1_KigyouCd,
         QBK1_SubRangeKey,
         QBK1_GaibuKaiinNo,
         QBK1_BlackNo,
         QBK1_CardKbn,
         QBK1_SAIKENKANRI,          /* 2002.10.31 ’Ç‰Á */
         QTAB.QTAB_TOUZAIKBN,       /* 2002.10.31 ’Ç‰Á */
         QBK1_GyoumuKbn,
         QBK1_DATHasouYmd,
         QBK1_DATHenkyakuYmd,
         QBK1_DATJFHenreiYmd,
         QBK1_HEKHenkyakuKbn,
         QBK1_JFHSeikyuYm,
         QBK1_JFHHurikaeKekaCd,
         QTA1_HONShimeiKan,
         QTA1_HONShimeiKana,        /* 1999.06.07 ’Ç‰Á */
         QTA1_JTKTelShigai,
         QTA1_JTKTelKyoku,
         QTA1_JTKTelNo,
         QBA1_HONKJName,
         QBA1_HONKNName,            /* 1999.06.07 ’Ç‰Á */
         QBA1_HONTel1,
         QBA1_HONTel2,
         QBA1_HONTel3,
         QBK1_HEKRiyuCd1,
         QBK1_HEKRiyuCd2,
         QBK1_HEKRiyuCd3,
         QBK1_HEKRiyuCd4,
         QBK1_HEKRiyuCd5,
         QBK1_HEKRiyuCd6,
         QBK4_A.QBK4_RyakuMei,
         QBK4_B.QBK4_RyakuMei,
         QBK4_C.QBK4_RyakuMei,
         QBK4_D.QBK4_RyakuMei,
         QBK4_E.QBK4_RyakuMei,
         QBK4_F.QBK4_RyakuMei,
         QBK9_SOHTouzaiKbn,
         QBK9_SOHSoufusakiKbn,
         QBK9_SOHGinkouCd,
         QBK9_SOHShitenCd,
         QBK9_SOHAtena,
         QBK9_SOHShitenMei,
         QBK9_SOHTel,
         QBK1_SOHKakuninKbn,
         QBK9_SOHTantoMei,
         QBK1_KOZYuchosaihatu,
         QBK1_KOZShumoku,
         QBK1_KOZNo,
         QBK1_KOZMeigi,
         QBKA_KOZGinkouCd,
         QBKA_KOZShitenCd,
         QBKA_KOZGinkouMei,
         QBKA_KOZShitenMei

;
