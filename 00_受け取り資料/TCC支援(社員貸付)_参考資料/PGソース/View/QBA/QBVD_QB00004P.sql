CREATE VIEW QBVD_QB00004P ( 
QBVD_UKETSUKENO
,QBVD_RONSYURUI
,QBVD_NOKAIINNO
,QBVD_HONKNNAME
,QBVD_ETNMEIKAN
,QBVD_CARDMEI
,QBVD_AESKESSAITANTO
,QBVD_MAKEDATE
 ) AS 
SELECT QBE4_UketsukeNo QBVD_UketsukeNo,         /* 受付番号 */
       QBA1_RonSyurui QBVD_RonSyurui,           /* ローン種類 */
--       REPLACE(QSAP_EdKaiinNoPkg.QSAP_EdKaiinNoFnc(2, QBA1_NOKaiinNo),'---',' ') QBVD_NOKaiinNo,
       QBAP_CENT200PKG.QBAP_GETGAIBUKAIINNO(QBA1_CardKbn, substr(QBA1_NOKaiinNo, 1, 12), substr(QBA1_NOKaiinNo, 13, 1)) QBVD_NOKaiinNo,
       QBA1_HONKNName QBVD_HONKNName,           /* カナ氏名 */
       QTAB_ETNMeiKan QBVD_ETNMeiKan,           /* 営業店 */
       QTA6_CardMei QBVD_CardMei,               /* カード名称 */
       QBA7_AESKessaiTanto QBVD_AESKessaiTanto, /* 決裁担当者 */
--       '自動審査' QBVD_UserMei,                 /* ユーザ名 */
       QBE4_MAKEDATE QBVD_MakeDate              /* 作成日 */
FROM   QBA1_MoshikomiT,                         /* 申込書テーブル */
       QBA7_ShinsaKekkaT,                       /* 審査結果テーブル */
       QBE4_PrinttShijiT,                       /* 帳票指示テーブル */
       QTAB_MiseT,                              /* 店テーブル */
       QTA6_CardCTRLT                           /* カード管理テーブル */
WHERE  QBA1_EigyoTen = QTAB_PRMEigyouTenCd
AND    QBA1_CardKbn = QTA6_PRMCardKbn
AND    QBA7_KankeiKbn = '1'
AND    QBA7_KazokuRbn = '0'
--AND    QBA7_AESKessaiTanto IS NULL              /* 決裁担当者がＮＵＬＬの場合 */
AND    QBA1_UketsukeNo = QBA7_UketsukeNo
AND    QBE4_UketsukeNo = QBA7_UketsukeNo
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00004P'

;
