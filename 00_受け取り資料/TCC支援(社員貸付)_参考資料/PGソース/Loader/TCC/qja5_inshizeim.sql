LOAD DATA
CHARACTERSET JA16SJIS
INFILE '../ikou_data/inshi.dat.sjis'
INTO TABLE QJA5_inshizeim
(
       QJA5_PRMInshizeiCd       char,
       QJA5_INZRyoshuKngKagen   char,
       QJA5_INZRyoshuKngJyougen char,
       QJA5_INZInshizeiGaku     char,
       QJA5_INZKazeiTaishou     char,
       QJA5_INZInshiDaiMei      char,
       QJA5_KOUTantoushaCd      char,
       QJA5_KOUTantoushaMei     char,
       QJA5_KOUYmd                      char,
       QJA5_KOUTime       char,
       QJA5_TOUTantoushaCd      char,
       QJA5_TOUTantoushaMei     char,
       QJA5_TOUYmd       char,
       QJA5_TOUTime  char
)
