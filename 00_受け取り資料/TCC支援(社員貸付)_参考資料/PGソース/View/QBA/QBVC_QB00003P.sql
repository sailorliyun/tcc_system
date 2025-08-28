CREATE VIEW QBVC_QB00003P ( 
QBVC_UKETSUKENO
,QBVC_HONKJNAME
,QBVC_ETNMEIKAN
,QBVC_KTNMEIKAN
,QBVC_RONKNG
,QBVC_MAKEDATE
 ) AS 
SELECT QBE4_UketsukeNo,                     /* ��t�ԍ� */
       QBA1_HONKJName,                      /* �������� */
       Mise1.QTAB_ETNMeiKan,                /* �c�ƓX */
       Mise2.QTAB_ETNMeiKan,                /* �l���X */
       QBA1_RONKng,                         /* ���[�����z */
       TO_CHAR(QBE4_MakeDate,'YYYY/MM/DD')  /* �쐬�� */
FROM   QBE4_PrinttShijiT,                   /* ���[�w���e�[�u�� */
       QBA1_MoshikomiT,                     /* �\�����e�[�u�� */
       QTAB_MiseT Mise1,                    /* �X�e�[�u�� */
       QTAB_MiseT Mise2                     /* �X�e�[�u�� */
WHERE  QBA1_KakutokuTen = Mise2.QTAB_PRMEigyouTenCd
AND    QBA1_EigyoTen = Mise1.QTAB_PRMEigyouTenCd
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00003P'  /* 1999.04.23 */
;
