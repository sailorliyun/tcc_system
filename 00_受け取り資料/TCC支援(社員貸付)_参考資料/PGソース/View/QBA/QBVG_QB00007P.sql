CREATE VIEW QBVG_QB00007P ( 
QBVG_UKETSUKENO
,QBVG_MAKEDATE
,QBVG_TOUROKUYMD
,QBVG_USERMEI
,QBVG_MEMONAME
 ) AS 
SELECT QBE4_UketsukeNo,                                             /* ��t�ԍ� */
       TO_CHAR(QBE4_MakeDate, 'YYYY/MM/DD'),                        /* �쐬�� */
       SUBSTR(QBE4_ErrNaiyou, 1, 10),                               /* �G���[���e */
       SUBSTR(QBE4_ErrNaiyou, 11, (LENGTH(QBE4_ErrNaiyou) - 18)),   /* ���[�U�� */
       QBT3_MemoName                                                /* �������e */
FROM   QBE4_PrinttShijiT,                                           /* ���[�w���e�[�u�� */
--       QUA2_UserIDV,                                                /* ���[�U�h�c�r���[ */
       QBT3_MemoCodeT                                               /* �����R�[�h�e�[�u�� */
WHERE  SUBSTR(QBE4_ErrNaiyou, (LENGTH(QBE4_ErrNaiyou) - 7), 8) = QBT3_MemoCd2
--AND    SUBSTR(QBE4_ErrNaiyou, 11, (LENGTH(QBE4_ErrNaiyou) - 18)) = RTRIM(QUA1_UserID)
AND    QBE4_ChohyoID = 'QB00007P'
;
