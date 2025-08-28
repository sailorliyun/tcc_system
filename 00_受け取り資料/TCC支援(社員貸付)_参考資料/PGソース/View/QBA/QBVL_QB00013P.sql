--委託戻り未確認受付一覧
--DROP   VIEW QBVL_QB00013P;
CREATE VIEW QBVL_QB00013P ( 
 QBVL_UKETSUKENO
,QBVL_KAKUTOKUTEN
,QBVL_ETNMEIKAN
,QBVL_CARDKBN
,QBVL_CARDMEI
,QBVL_DATE
,QBVL_HONKNNAME
,QBVL_UKETSUKEYMD
,QBVL_HORYUYMD
,QBVL_MEMOYMD
 ) AS 
Select 
A.A1                             QBVL_UKETSUKENO,    --受付番号
A.A2                             QBVL_KAKUTOKUTEN,   --獲得店
B.QTAB_ETNMEIKAN                 QBVL_ETNMEIKAN,     --獲得店名
A.A3                             QBVL_CARDKBN,       --カード区分
C.QTA6_CARDMEI                   QBVL_CARDMEI,       --カード区分名称
A.A4                             QBVL_DATE,          --スキャン日
A.A5                             QBVL_HONKNNAME,     --申込者カナ氏名
A.A6                             QBVL_UKETSUKEYMD,   --入会受付日
A.A7                             QBVL_HORYUYMD,      --審査保留日
A.A8                             QBVL_MEMOYMD        --別メモ登録日
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --受付番号
         M.QBA1_KAKUTOKUTEN                                           A2, --獲得店
         M.QBA1_CARDKBN                                               A3, --カード区分
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A4, --スキャン日
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --申込者カナ氏名
         Nvl(To_Char(M.QBA1_CTLSEISADATE ,'YYYY/MM/DD'),' ')          A6, --入会受付日
         Memo1.YMD                                                    A7, --審査保留日
         Memo2.YMD                                                    A8  --別メモ登録日
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       = 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo1,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00013P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  Memo1.UKETSUKENO(+)
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
