
drop view  QXA8_KameitenInfV;

create view QXA8_KameitenInfV As 
Select Decode(Length(QXA8_KameitenNo),13,Substr(QXA8_KameitenNo,1,5) || '-' || Substr(QXA8_KameitenNo,6,2) || '-' 
             || Substr(QXA8_KameitenNo,8,1) || '-' || Substr(QXA8_KameitenNo,9,5),QXA8_KameitenNo) As KameitenNo,
             QXA8_KameitenMeiKana,QXA8_KameitenMeiKanji,QXA8_KameitenTelNo,
             Decode(Length(QXA8_KameitenZipCode),Null,QXA8_KameitenZipCode,Substr(QXA8_KameitenZipCode,1,3) || '-' || Substr(QXA8_KameitenZipCode,4,4)) As ZipCode,
             b.QSA2_Mei As Gyoushu,c.QSA2_Mei As ToriShohin,QXA8_KameitenAddr,Decode(Length(e.QXAE_Memo),Null,'–³','—L') As MemoUmu,
             d.QSA2_Bikou As Moto,
             e.QXAE_Memo,QXA8_KameitenNo,QXA8_GyoushuCd,QXA8_ToriShohinCd,QXA8_SakuseiMotoSign 
From QXA8_KameitenInfM a,
     (Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXB') b,
     (Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXC') c,
     (Select QSA2_PRMCodeNo,QSA2_Bikou From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXD') d,
     QXAE_KameiAttrMemoT e 
Where (RTrim(b.QSA2_PRMCodeNo(+))=QXA8_GyoushuCd) And 
      (RTrim(c.QSA2_PRMCodeNo(+))=QXA8_ToriShohinCd) And
      (RTrim(d.QSA2_PRMCodeNo(+))=QXA8_SakuseiMotoSign) And
      QXAE_KameitenNo(+)=QXA8_KameitenNo;
