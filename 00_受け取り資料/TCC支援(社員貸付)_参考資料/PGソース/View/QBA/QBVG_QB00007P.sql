CREATE VIEW QBVG_QB00007P ( 
QBVG_UKETSUKENO
,QBVG_MAKEDATE
,QBVG_TOUROKUYMD
,QBVG_USERMEI
,QBVG_MEMONAME
 ) AS 
SELECT QBE4_UketsukeNo,                                             /* 受付番号 */
       TO_CHAR(QBE4_MakeDate, 'YYYY/MM/DD'),                        /* 作成日 */
       SUBSTR(QBE4_ErrNaiyou, 1, 10),                               /* エラー内容 */
       SUBSTR(QBE4_ErrNaiyou, 11, (LENGTH(QBE4_ErrNaiyou) - 18)),   /* ユーザ名 */
       QBT3_MemoName                                                /* メモ内容 */
FROM   QBE4_PrinttShijiT,                                           /* 帳票指示テーブル */
--       QUA2_UserIDV,                                                /* ユーザＩＤビュー */
       QBT3_MemoCodeT                                               /* メモコードテーブル */
WHERE  SUBSTR(QBE4_ErrNaiyou, (LENGTH(QBE4_ErrNaiyou) - 7), 8) = QBT3_MemoCd2
--AND    SUBSTR(QBE4_ErrNaiyou, 11, (LENGTH(QBE4_ErrNaiyou) - 18)) = RTRIM(QUA1_UserID)
AND    QBE4_ChohyoID = 'QB00007P'
;
