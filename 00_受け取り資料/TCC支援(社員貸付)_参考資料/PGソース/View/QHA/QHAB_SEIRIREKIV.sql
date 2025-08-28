CREATE VIEW QHAB_SEIRIREKIV ( 
QHAB_SEIKYUYM
,QHAB_SEQNO
,QHAB_BUNKATSUNO
,QHAB_VERSIONNO
,QHAB_KAIINNO
,QHAB_SAGYOKBN
,QHAB_TOUZAIKBN
,QHAB_SEIKYUKNG
,QHAB_SEIKYUKNGMOTO
,QHAB_MEMO
,QHAB_HONSHIMEIKAN
,QHAB_KANRITENCD
,QHAB_KANRITENMEI
,QHAB_KOUSHINTANTOCD
,QHAB_KOUSHINTANTOMEI
,QHAB_KOUSHINYMD
,QHAB_KOUSHINTIME
,QHAB_SAKUJOTANTOCD
,QHAB_SAKUJOTANTOMEI
,QHAB_SAKUJOYMD
,QHAB_SAKUJOTIME
,QHAB_TOUROKUTANTOCD
,QHAB_TOUROKUTANTOMEI
,QHAB_TOUROKUYMD
,QHAB_TOUROKUTIME
 ) AS 
SELECT
  T1.QHA5_KeySeikyuYm,
  T1.QHA5_KeySeqNo,
  TO_CHAR(T1.QHA5_KeyBunkatsuNo,'FM00'),
  TO_CHAR(T1.QHA5_KeyVersionNo,'FM00'),
  T1.QHA5_KaiinNo,
  T1.QHA5_SagyoKbn,
  T1.QHA5_TouzaiKbn,
  T1.QHA5_SeikyuKng,
  DECODE(T2.QHA5_SeikyuKng,NULL,T3.QHA3_SeikyuKng,T2.QHA5_SeikyuKng),
  NVL(T1.QHA5_Memo,' '),
  NVL(RTRIM(QTA1_HonshimeiKan),' '),
  T1.QHA5_TenCd,
  NVL(RTRIM(QTAB_CtnmeiKan1),' '),
  NVL(RTRIM(T1.QHA5_KoushinTantoCd),' '),
  NVL(T1.QHA5_KoushinTantoMei,' '),
  DECODE(T1.QHA5_KoushinDateTime,NULL,' ',TO_CHAR(T1.QHA5_KoushinDateTime,'YYYYMMDD')),
  DECODE(T1.QHA5_KoushinDateTime,NULL,' ',TO_CHAR(T1.QHA5_KoushinDateTime,'HH24MISS')),
  NVL(RTRIM(T1.QHA5_SakujoTantoCd),' '),
  NVL(T1.QHA5_SakujoTantoMei,' '),
  DECODE(T1.QHA5_SakujoDateTime,NULL,' ',TO_CHAR(T1.QHA5_SakujoDateTime,'YYYYMMDD')),
  DECODE(T1.QHA5_SakujoDateTime,NULL,' ',TO_CHAR(T1.QHA5_SakujoDateTime,'HH24MISS')),
  NVL(RTRIM(T1.QHA5_TourokuTantoCd),' '),
  NVL(T1.QHA5_TourokuTantoMei,' '),
  DECODE(T1.QHA5_TourokuDateTime,NULL,' ',TO_CHAR(T1.QHA5_TourokuDateTime,'YYYYMMDD')),
  DECODE(T1.QHA5_TourokuDateTime,NULL,' ',TO_CHAR(T1.QHA5_TourokuDateTime,'HH24MISS'))
 FROM
  QHA5_SeiRirekiT T1, --請求書更新履歴テーブル
  QHA5_SeiRirekiT T2, --請求書更新履歴テーブル(修正前)
  QHA3_SeikyuKaiT T3, --請求書会員情報テーブル
  QTA1_KaiinM,  --会員マスタ
  QTAB_MiseT   --店テーブル
 WHERE
  T1.QHA5_KeySeikyuYm  = T2.QHA5_KeySeikyuYm(+)  AND
  T1.QHA5_KeySeqNo  = T2.QHA5_KeySeqNo(+)   AND
  T1.QHA5_MotoBunkatsuNo = T2.QHA5_KeyBunkatsuNo(+)  AND
  T1.QHA5_MotoVersionNo = T2.QHA5_KeyVersionNo(+)  AND
  '1'      = T3.QHA3_KeyRecShikibetsu(+) AND
  T1.QHA5_KeySeikyuYm  = T3.QHA3_KeySeikyuYm(+)  AND
  T1.QHA5_KeySeqNo  = T3.QHA3_KeySeqNo(+)   AND
  T1.QHA5_MotoBunkatsuNo = T3.QHA3_KeyBunkatsuNo(+)  AND
  T1.QHA5_MotoVersionNo = T3.QHA3_KeyVersionNo(+)  AND
  1      = T3.QHA3_KeyRecNo(+)   AND
  T1.QHA5_KigyoCd   = QTA1_PrmKigyouCd(+)   AND
  T1.QHA5_SubRng   = QTA1_PrmSubRangeKey(+)  AND
  T1.QHA5_NaibuKaiin  = QTA1_PrmNaibuKaiinNo(+)  AND
  T1.QHA5_KigyoCd   = QTAB_PrmKigyouCd(+)   AND
  T1.QHA5_TenCd   = QTAB_PrmEigyoutenCd(+)  AND
  T1.QHA5_SakujoDateTime IS NULL
;
