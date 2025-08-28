--委託戻り未埒空き受付一覧
--DROP   VIEW QBVN_QB00015P;
CREATE VIEW QBVN_QB00015P ( 
 QBVN_UKETSUKENO
,QBVN_KAKUTOKUTEN
,QBVN_ETNMEIKAN
,QBVN_CARDKBN
,QBVN_CARDMEI
,QBVN_DATE
,QBVN_HONKNNAME
,QBVN_FUBIYMD
,QBVN_SAIYMD
,QBVN_MEMOYMD
 ) AS 
Select 
A.A1                             QBVN_UKETSUKENO,    --受付番号
A.A2                             QBVN_KAKUTOKUTEN,   --獲得店
B.QTAB_ETNMEIKAN                 QBVN_ETNMEIKAN,     --獲得店名
A.A3                             QBVN_CARDKBN,       --カード区分
C.QTA6_CARDMEI                   QBVN_CARDMEI,       --カード区分名称
A.A4                             QBVN_DATE,          --スキャン日
A.A5                             QBVN_HONKNNAME,     --申込者カナ氏名
A.A6                             QBVN_FUBIYMD,       --戻り登録日
A.A7                             QBVN_SAIYMD,        --再依頼日
A.A8                             QBVN_MEMOYMD        --別メモ登録日
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --受付番号
         M.QBA1_KAKUTOKUTEN                                           A2, --獲得店
         M.QBA1_CARDKBN                                               A3, --カード区分
         Nvl(To_Char(M.QBA1_STRDATE      ,'YYYY/MM/DD'),' ')          A4, --スキャン日
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --申込者カナ氏名
         Nvl(To_Char(M.QBA1_UPDDATE      ,'YYYY/MM/DD'),' ')          A6, --戻り登録日
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A7, --再依頼日
         Memo2.YMD                                                    A8  --別メモ登録日
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00015P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
