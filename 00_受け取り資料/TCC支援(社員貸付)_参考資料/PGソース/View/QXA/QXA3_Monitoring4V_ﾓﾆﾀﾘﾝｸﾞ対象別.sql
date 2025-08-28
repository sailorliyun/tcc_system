CREATE OR REPLACE VIEW QXA3_Monitoring4V AS 
Select QXA3_ShoriYMD As riyoubi,
       'SCR' As errcode,
       Count(qxa3_gaibukaiinno) As kensu,
       0 As sumkensu 
From   QXA3_MonitoringT
Where  QXA3_ErrCode is null 
Group by QXA3_ShoriYMD 
Union All
Select Decode(a.riyoubi,null,QXAB_SumDate,a.riyoubi),
       QXAB_SumTaishoFrom,
       kensu,
       sumkensu 
From
     (Select QXA3_ShoriYMD as riyoubi,
             QXA3_ErrCode As errcd,
             Count(QXA3_GaibuKaiinNo) as kensu 
      From QXA3_MonitoringT
      Where QXA3_ErrCode is not null 
      Group by QXA3_ShoriYMD,QXA3_ErrCode) a,
     (Select QXAB_SumDate,
             QXAB_SumTaishoFrom,
             QXAB_Kensu As sumkensu 
      From QXAB_MonitoringSumT 
      Where QXAB_SumKbn='1') b 
Where a.riyoubi(+)=b.QXAB_SumDate 
And   a.errcd(+)=b.QXAB_SumTaishoFrom
