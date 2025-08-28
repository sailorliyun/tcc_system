CREATE VIEW QBK6_SOUFUPRINTV ( 
QBK6_SOHTOUZAIKBN
,QBK6_SOHSOUFUSAKIKBN
,QBK6_SOHGINKOUCD
,QBK6_SOHSHITENCD
,QBK6_SOHYUUBINNO
,QBK6_SOHJUSHO1
,QBK6_SOHJUSHO2
,QBK6_SOHJUSHO3
,QBK6_SOHJUSHO4
,QBK6_SOHATENA
,QBK6_SOHATENA1
,QBK6_SOHATENA2
,QBK6_SOHCOUNT
,QBK6_DATSOHUYMD
,QBK6_SOHPRDATE
 ) AS 
select
QBK1_SOHTouzaiKbn QBK6_SOHTouzaiKbn,
QBK1_SOHSoufusakiKbn QBK6_SOHSoufusakiKbn,
QBK1_SOHGinkouCd QBK6_SOHGinkouCd,
QBK1_SOHShitenCd QBK6_SOHShitenCd,
QSAP_EDYubinNoPKG.QSAP_EDYubinNoFNC(QBK2_SOHYuubinNo) QBK6_SOHYuubinNo,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(1, QBK2_SOHJushoKan, QBK2_SOHBanchiKan, QBK2_SOHKataKan, '', '') QBK6_SOHJusho1,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(2, QBK2_SOHJushoKan, QBK2_SOHBanchiKan, QBK2_SOHKataKan, '', '') QBK6_SOHJusho2,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(3, QBK2_SOHJushoKan, QBK2_SOHBanchiKan, QBK2_SOHKataKan, '', '') QBK6_SOHJusho3,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(4, QBK2_SOHJushoKan, QBK2_SOHBanchiKan, QBK2_SOHKataKan, '', '') QBK6_SOHJusho4,
QBK2_SOHAtena QBK6_SOHAtena,
QBK2_SOHAtena1 QBK6_SOHAtena1,
QBK2_SOHAtena2 QBK6_SOHAtena2,
count(QBK1_SOHGinkouCd) QBK6_SOHCount,
QBK1_DATSohuYmd QBK6_DATSohuYmd,
sysdate QBK6_SOHPrDate
 from QBK1_KFuriT, QBK2_TGinkoM
where QBK1_SOHShitenCd = '00000'
  and QBK1_DATHasouYmd is not NULL
  and QBK1_DATHenkyakuYmd is NULL
  and QBK1_HEKHenkyakuKbn = '0'
  and QBK1_SOHTouzaiKbn = QBK2_PRMTouzaiKbn
  and QBK1_SOHSoufusakiKbn = QBK2_PRMSoufusakiKbn
  and QBK1_SOHGinkouCd = QBK2_PRMGinkouCd
  and QBK1_SOHKakuninKbn != '1'
group by QBK1_SOHTouzaiKbn,QBK1_SOHSoufusakiKbn,
QBK1_SOHGinkouCd,QBK1_SOHShitenCd,
QBK2_SOHAtena,
QBK2_SOHAtena1,
QBK2_SOHAtena2,
QBK2_SOHKataKan,
QBK2_SOHBanchiKan,
QBK2_SOHJushoKan,
QBK2_SOHYuubinNo,
QBK1_DATSohuYmd
union
select
QBK1_SOHTouzaiKbn QBK6_SOHTouzaiKbn,
QBK1_SOHSoufusakiKbn QBK6_SOHSoufusakiKbn,
QBK1_SOHGinkouCd QBK6_SOHGinkouCd,
QBK1_SOHShitenCd QBK6_SOHShitenCd,
QSAP_EDYubinNoPKG.QSAP_EDYubinNoFNC(QTA7_YubinNo) QBK6_SOHYuubinNo,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(1, QTA7_KJJTenpo, QTA7_KJJBKatagaki1, QTA7_KJJBKatagaki2, '', '') QBK6_SOHJusho1,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(2, QTA7_KJJTenpo, QTA7_KJJBKatagaki1, QTA7_KJJBKatagaki2, '', '') QBK6_SOHJusho2,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(3, QTA7_KJJTenpo, QTA7_KJJBKatagaki1, QTA7_KJJBKatagaki2, '', '') QBK6_SOHJusho3,
QSAP_EDJusyoPKG.QSAP_EDJusyoFUNC(4, QTA7_KJJTenpo, QTA7_KJJBKatagaki1, QTA7_KJJBKatagaki2, '', '') QBK6_SOHJusho4,
QTA7_KinyuKikanNMKJ QBK6_SOHAtena,
QTA7_SitenNMKJ QBK6_SOHAtena1,
'å˚ç¿êUë÷Ç≤íSìñé“ól' QBK6_SOHAtena2,
count(QBK1_SOHGinkouCd) QBK6_SOHCount,
QBK1_DATSohuYmd QBK6_DATSohuYmd,
sysdate QBK6_SOHPrDate
 from QBK1_KFuriT, QTA7_GinkouM
where QBK1_SOHShitenCd != '00000'
  and QBK1_SOHGinkouCd != '9900'
  and QBK1_DATHasouYmd is not NULL
  and QBK1_DATHenkyakuYmd is NULL
  and QBK1_HEKHenkyakuKbn = '0'
  and QTA7_PRMHukaCd = '1'
  and QTA7_PRMShitenCd = substr(QBK1_SOHShitenCd, 3, 3)
  and QBK1_SOHGinkouCd = QTA7_PRMKikanCd
  and QBK1_SOHKakuninKbn != '1'
group by QBK1_SOHTouzaiKbn,QBK1_SOHSoufusakiKbn,
QBK1_SOHGinkouCd,QBK1_SOHShitenCd,
QTA7_YubinNo,
QTA7_KJJTenpo,
QTA7_KinyuKikanNMKJ,
QTA7_KJJBKatagaki1,
QTA7_KJJBKatagaki2,
QTA7_SitenNMKJ,
QTA7_KJJAKenKeta,
QTA7_KJJAGunKeta,
QTA7_KJJAMuraKeta,
QBK1_DATSohuYmd
;
