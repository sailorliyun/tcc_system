CREATE OR REPLACE VIEW QXNB_ErrListV (
        QXNB_Cardkaisha,           --カード会社種別
        QXNB_TouzaiKbn,            --東西区分
        QXNB_KaiinNo,              --会員番号
        QXNB_Sakuseibi,            --作成日(処理日)
        QXNB_TorihikiA,            --取引A
        QXNB_TorihikiB,            --取引B
        QXNB_TorihikiC,            --取引C
        QXNB_kameitenNo,           --加盟店名称１
        QXNB_KameitenMei1,         --加盟店名称１
        QXNB_KameitenMei2,         --加盟店名称２
        QXNB_Riyoubi,              --利用日
        QXNB_TosiMei,              --加盟店都市名
        QXNB_UriageKng,            --売上金額
        QXNB_GentiTuka,            --現地通貨額
        QXNB_ZeiSoryo,             --税･送料
        QXNB_KansanRate,           --換算ﾚｰﾄ
        QXNB_UriageGokei,          --売上合計
        QXNB_Kuni,                 --国
        QXNB_Gyosyu,               --業種
        QXNB_KokuKaiSikibetu,      --国内内外識別
        QXNB_Usage,                --USAGE
        QXNB_TeikeiSyokaiNo,       --提携先照会番号
        QXNB_ErrNaiyou,            --エラー内容
        QXNB_HasseiTen,            --発生店 ADD2004-02-18 BY NBC
        QXNB_SyuCode) AS           --州コード
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
        QXN3_RYMHasseiTen,         --発生店 ADD2004-02-18 BY NBC
        QXN3_KGDSyuuCD
     FROM
        QXN3_ErrDataT,       --未発行／売上ｴエラーデータテーブル
        (SELECT QSA3_PRMCODENO,
         QSA3_MEI
         FROM QSA3_CodeV
         WHERE QSA3_PRMCODEKBN = 'C87'
         ) QSA3_CodeV		--コードＶＩＥＷ
     WHERE QXN3_RYMJIKORIYU =  QSA3_PRMCodeNo(+)
;