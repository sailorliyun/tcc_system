--ＣＳ対応履歴
--DROP   VIEW QCS9_TOGOMEMOV2;
-- 2004/09/11 抽出処理遅延の対応
-- IMZ.YAMADA 期日管理テーブル用のビュー
CREATE VIEW QCS9_TOGOMEMOV2 ( 
 QCS9_KBN
,QCS9_MAKEDATE
,QCS9_SYSTEMSKBCD
,QCS9_MEMOBNRCD
,QCS9_MEMOCD
,QCS9_NKNO
,QCS9_BLACKNO
,QCS9_UKETSUKENO
,QCS9_TANTOID
,QCS9_TANTONM
,QCS9_MEMONM
,QCS9_MEMO
,QCS9_DELDate
,QWA3_PRMKIGYOUCD
,QWA3_PRMSUBRANGEKEY
,QWA3_PRMNAIBUKAIINNO
 ) AS 
select	'2'                  VCS9_KBN,
		QWA3_PRMSAKUSEIBI    VCS9_MAKEDATE,
		'W'                  VCS9_SYSTEMSKBCD,
		null                 VCS9_MEMOBNRCD,
		QWA3_BUNSHOKANRINO   VCS9_MEMOCD,
		QWA3_PRMNAIBUKAIINNO VCS9_NKNO,
		null                 VCS9_BLACKNO,
		null                 VCS9_UKETSUKENO,
		QWA3_TOUTANTOUSHACD  VCS9_TANTOID ,
		QWA3_TOUTANTOUSHAMEI VCS9_TANTONM,
		substr(QWA3_BUNSHOMEI || '　　　　　　　　　　',1,10) || 
						'  発送日 ' || nvl(to_char(QWA3_HASSOUYMD,'yyyy/mm/dd'),'          ') ||
						'  返却日 ' || nvl(to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd'),'          ') 
								VCS9_MEMONM,
		'手紙名　　：' || QWA3_BUNSHOMEI || chr(13) || chr(10) || 
			'・発送日　：' || to_char(QWA3_HASSOUYMD,'yyyy/mm/dd') || '　　　　　' ||
			'・返却日　：' || to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd') || '　　　　　' || chr(13) || chr(10) ||
			'・整理番号：' || QWA3_SEIRINO || '　　　　　' || chr(13) || chr(10) ||
			'・戻り理由：' || QWA3_HENKYAKURIYU || ' ' || a.QSA2_MEI || chr(13) || chr(10) ||
			'・状況区分：' || QWA3_JOKYOKBN || ' ' || b.QSA2_MEI 
								VCS9_MEMO,
		Null                 VCS9_DELDate,
		QWA3_PRMKIGYOUCD,
		QWA3_PRMSUBRANGEKEY,
		QWA3_PRMNAIBUKAIINNO
		from QWA3_KIJITSUT,QSA2_SCODET a,QSA2_SCODET b
		Where  QWA3_PRMNAIBUKAIINNO <> '99999999'
		  and  a.QSA2_PRMCODEKBN(+) = 'DE2' and  QWA3_HENKYAKURIYU = a.QSA2_PRMCODENO(+)
		  and  b.QSA2_PRMCODEKBN(+) = 'DE5' and  QWA3_JOKYOKBN     = b.QSA2_PRMCODENO(+)
;
