Create Or Replace View QXA3_Monitoring5V As
Select Riyoubi, ErrCode, Taisho, Kensu
From (Select QXA3_SHORIYMD As Riyoubi, QXA3_ERRCODE As ErrCode, QXA3_TAISHO As Taisho, Count(QXA3_GAIBUKAIINNO) As Kensu 
      From QXA3_MonitoringT Where QXA3_MONITORINGKBN<'3' 
      Group by QXA3_SHORIYMD,QXA3_ERRCODE,QXA3_TAISHO) Union All 
     (Select QXA3_SHORIYMD As Riyoubi, 'Score' As ErrCode, QXA3_TAISHO As Taisho, Count(QXA3_GAIBUKAIINNO) As Kensu  
      From QXA3_MonitoringT Where QXA3_MONITORINGKBN='3' 
      Group by QXA3_SHORIYMD,QXA3_TAISHO)
     
