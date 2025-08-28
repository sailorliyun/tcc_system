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
SELECT QBE4_UketsukeNo QBVD_UketsukeNo,         /* ��t�ԍ� */
       QBA1_RonSyurui QBVD_RonSyurui,           /* ���[����� */
--       REPLACE(QSAP_EdKaiinNoPkg.QSAP_EdKaiinNoFnc(2, QBA1_NOKaiinNo),'---',' ') QBVD_NOKaiinNo,
       QBAP_CENT200PKG.QBAP_GETGAIBUKAIINNO(QBA1_CardKbn, substr(QBA1_NOKaiinNo, 1, 12), substr(QBA1_NOKaiinNo, 13, 1)) QBVD_NOKaiinNo,
       QBA1_HONKNName QBVD_HONKNName,           /* �J�i���� */
       QTAB_ETNMeiKan QBVD_ETNMeiKan,           /* �c�ƓX */
       QTA6_CardMei QBVD_CardMei,               /* �J�[�h���� */
       QBA7_AESKessaiTanto QBVD_AESKessaiTanto, /* ���ْS���� */
--       '�����R��' QBVD_UserMei,                 /* ���[�U�� */
       QBE4_MAKEDATE QBVD_MakeDate              /* �쐬�� */
FROM   QBA1_MoshikomiT,                         /* �\�����e�[�u�� */
       QBA7_ShinsaKekkaT,                       /* �R�����ʃe�[�u�� */
       QBE4_PrinttShijiT,                       /* ���[�w���e�[�u�� */
       QTAB_MiseT,                              /* �X�e�[�u�� */
       QTA6_CardCTRLT                           /* �J�[�h�Ǘ��e�[�u�� */
WHERE  QBA1_EigyoTen = QTAB_PRMEigyouTenCd
AND    QBA1_CardKbn = QTA6_PRMCardKbn
AND    QBA7_KankeiKbn = '1'
AND    QBA7_KazokuRbn = '0'
--AND    QBA7_AESKessaiTanto IS NULL              /* ���ْS���҂��m�t�k�k�̏ꍇ */
AND    QBA1_UketsukeNo = QBA7_UketsukeNo
AND    QBE4_UketsukeNo = QBA7_UketsukeNo
AND    QBE4_UketsukeNo = QBA1_UketsukeNo
AND    QBE4_ChohyoID = 'QB00004P'

;
