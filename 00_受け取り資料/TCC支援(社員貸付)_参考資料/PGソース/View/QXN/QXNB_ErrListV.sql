CREATE OR REPLACE VIEW QXNB_ErrListV (
        QXNB_Cardkaisha,           --�J�[�h��Ў��
        QXNB_TouzaiKbn,            --�����敪
        QXNB_KaiinNo,              --����ԍ�
        QXNB_Sakuseibi,            --�쐬��(������)
        QXNB_TorihikiA,            --���A
        QXNB_TorihikiB,            --���B
        QXNB_TorihikiC,            --���C
        QXNB_kameitenNo,           --�����X���̂P
        QXNB_KameitenMei1,         --�����X���̂P
        QXNB_KameitenMei2,         --�����X���̂Q
        QXNB_Riyoubi,              --���p��
        QXNB_TosiMei,              --�����X�s�s��
        QXNB_UriageKng,            --������z
        QXNB_GentiTuka,            --���n�ʉ݊z
        QXNB_ZeiSoryo,             --�ť����
        QXNB_KansanRate,           --���Zڰ�
        QXNB_UriageGokei,          --���㍇�v
        QXNB_Kuni,                 --��
        QXNB_Gyosyu,               --�Ǝ�
        QXNB_KokuKaiSikibetu,      --�������O����
        QXNB_Usage,                --USAGE
        QXNB_TeikeiSyokaiNo,       --��g��Ɖ�ԍ�
        QXNB_ErrNaiyou,            --�G���[���e
        QXNB_HasseiTen,            --�����X ADD2004-02-18 BY NBC
        QXNB_SyuCode) AS           --�B�R�[�h
     SELECT
        SUBSTR(QXN3_RYMCardNo,1,4),
        QXN3_TouzaiKbn,
        QXN3_RYMCardNo,
        DECODE(QXN3_BATSyoriBi,NULL,' ',TO_CHAR(QXN3_BATSyoriBi,'YYYYMMDD')),
        NVL(QXN3_KGDTorihikiA,' '),
        NVL(QXN3_KGDTorihikiB,' '),
        NVL(QXN3_KGDTorihikiC,' '),
        QXN3_KGDkameitenNo,
        NVL(QXN3_KGDKameitenMei1,' '),
        NVL(QXN3_KGDKameitenMei2,' '),
        DECODE(QXN3_KGDRiyouBi,NULL,' ',TO_CHAR(QXN3_KGDRiyouBi,'YYYYMMDD')),
        NVL(QXN3_KGDToshiMei,' '),
        QXN3_KGDRiyouKng,
        QXN3_KGDGenchiTsuka,
        QXN3_KGDZeiTesuryo,
        QXN3_KGDKansanRate,
        QXN3_KGDUriGoukei,
        QXN3_KGDKuniCD,
        QXN3_KGDGyosyuCD,
        QXN3_KGDKokunaiGai,
        QXN3_RYMRepKbn,
        QXN3_KGDSyoukaiNo1,
        NVL(QSA3_MEI,' '),
        QXN3_RYMHasseiTen,         --�����X ADD2004-02-18 BY NBC
        QXN3_KGDSyuuCD
     FROM
        QXN3_ErrDataT,       --�����s�^���㴃G���[�f�[�^�e�[�u��
        (SELECT QSA3_PRMCODENO,
         QSA3_MEI
         FROM QSA3_CodeV
         WHERE QSA3_PRMCODEKBN = 'C87'
         ) QSA3_CodeV		--�R�[�h�u�h�d�v
     WHERE QXN3_RYMJIKORIYU =  QSA3_PRMCodeNo(+)
;