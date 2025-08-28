OPTIONS (LOAD=-1,SKIP=0,ERRORS=0,ROWS=1000,BINDSIZE=3354000,readsize=3354000)
LOAD DATA
APPEND
INTO TABLE  QTB1_CDMEISAIT
FIELDS TERMINATED BY ","
(
        QTB1_BANKCD              ,
        QTB1_SHITENCD            ,
        QTB1_TANMATSUID          ,
        QTB1_TORIHIKIYMD         ,
        QTB1_TORIHIKITIME        ,
        QTB1_KAIINNO             ,
        QTB1_TORIHIKIKBN         ,
        QTB1_SHIHARAIKBN         ,
        QTB1_JIKANGAIKBN	 ,
        QTB1_TORIHIKIKEKKA       ,
        QTB1_TORIKESIFLG         ,
        QTB1_RIYOUKIN            ,
        QTB1_ERRCD               
)
