--金融機関宛発送待ち受付一覧
--DROP   VIEW QBVM_QB00014P;
CREATE VIEW QBVM_QB00014P ( 
 QBVM_UKETSUKENO
,QBVM_KAKUTOKUTEN
,QBVM_ETNMEIKAN
,QBVM_CARDKBN
,QBVM_CARDMEI
,QBVM_DATE
,QBVM_HONKNNAME
,QBVM_SHINSAYMD
,QBVM_BANKCD
,QBVM_MEMOYMD
 ) AS 
Select 
A.A1                             QBVM_UKETSUKENO,    --受付番号
A.A2                             QBVM_KAKUTOKUTEN,   --獲得店
B.QTAB_ETNMEIKAN                 QBVM_ETNMEIKAN,     --獲得店名
A.A3                             QBVM_CARDKBN,       --カード区分
C.QTA6_CARDMEI                   QBVM_CARDMEI,       --カード区分名称
A.A4                             QBVM_DATE,          --スキャン日
A.A5                             QBVM_HONKNNAME,     --申込者カナ氏名
A.A6                             QBVM_SHINSAYMD,     --審査判定日
A.A7                             QBVM_BANKCD,        --銀行ＣＤ
A.A8                             QBVM_MEMOYMD        --別メモ登録日
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --受付番号
         M.QBA1_KAKUTOKUTEN                                           A2, --獲得店
         M.QBA1_CARDKBN                                               A3, --カード区分
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A4, --スキャン日
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --申込者カナ氏名
         Nvl(To_Char(M.QBA1_CTLFSTSGDATE ,'YYYY/MM/DD'),' ')          A6, --審査判定日
         JIF.QBA4_BANKCD                                              A7, --銀行ＣＤ
         Memo2.YMD                                                    A8  --別メモ登録日
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         QBA4_JIFURIT JIF,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00014P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  JIF.QBA4_UKETSUKENO(+)
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
