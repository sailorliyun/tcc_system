CREATE VIEW QBVC_QB00003P ( 
QBVC_UKETSUKENO
,QBVC_HONKJNAME
,QBVC_ETNMEIKAN
,QBVC_KTNMEIKAN
,QBVC_RONKNG
,QBVC_MAKEDATE
 ) AS 
SELECT QBE4_UketsukeNo,                     /* 受付番号 */
       QBA1_HONKJName,                      /* 氏名漢字 */
       Mise1.QTAB_ETNMeiKan,                /* 営業店 */
       Mise2.QTAB_ETNMeiKan,                /* 獲得店 */
       QBA1_RONKng,                         /* ローン金額 */
       TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD')  /* 作成日 */
FROM   QBE4_PrinttShijiT,                   /* 帳票指示テーブル */
       QBA1_MoshikomiT,                     /* 申込書テーブル */
       QTAB_MiseT Mise1,                    /* 店テーブル */
       QTAB_MiseT Mise2                     /* 店テーブル */
WHERE  QBA1_KakutokuTen = Mise2.QTAB_PRMEigyouTenCd
AND    QBA1_EigyoTen = Mise1.QTAB_PRMEigyouTenCd
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00003P'  /* 1999.04.23 */
;
