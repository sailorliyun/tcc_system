CREATE VIEW QSA7_TOGOMEMOV ( 
VSA7_MAKEDATE
,VSA7_SYSTEMSKBCD
,VSA7_MEMOBNRCD
,VSA7_MEMOCD
,VSA7_NKNO
,VSA7_BLACKNO
,VSA7_UKETSUKENO
,VSA7_TANTOID
,VSA7_TANTONM
,VSA7_MEMONM
,VSA7_MEMO
 ) AS 
select 		QSA7_MAKEDATE    VSA7_MAKEDATE,
		QSA7_SYSTEMSKBCD VSA7_SYSTEMSKBCD,
		QSA7_MEMOBNRCD   VSA7_MEMOBNRCD,
		QSA7_MEMOCD      VSA7_MEMOCD,
		rtrim(QSA7_NKNO) VSA7_NKNO,
		QSA7_BLACKNO     VSA7_BLACKNO,
		QSA7_UKETSUKENO  VSA7_UKETSUKENO,
		QSA7_TANTOID     VSA7_TANTOID ,
		nvl(QSA7_TANTONM,QSA7_TANTOID) VSA7_TANTONM,
		QSA7_MEMONM      VSA7_MEMONM,
		QSA7_MEMO        VSA7_MEMO
		from QSA7_TOGOMEMOT
		Where QSA7_DELDate is null
union all

select 		QWA3_PRMSAKUSEIBI    VSA7_MAKEDATE,
		'W'                  VSA7_SYSTEMSKBCD,
		null                 VSA7_MEMOBNRCD,
		QWA3_BUNSHOKANRINO   VSA7_MEMOCD,
		QWA3_PRMNAIBUKAIINNO VSA7_NKNO,
		null                 VSA7_BLACKNO,
		null                 VSA7_UKETSUKENO,
		QWA3_TOUTANTOUSHACD  VSA7_TANTOID ,
		QWA3_TOUTANTOUSHAMEI VSA7_TANTONM,
		substr(QWA3_BUNSHOMEI || '　　　　　　　　　　',1,10) || 
						'  発送日 ' || nvl(to_char(QWA3_HASSOUYMD,'yyyy/mm/dd'),'          ') ||
						'  返却日 ' || nvl(to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd'),'          ') 
                                 VSA7_MEMONM,
		'手紙名　　：' || QWA3_BUNSHOMEI || chr(13) || chr(10) || 
			'・発送日　：' || to_char(QWA3_HASSOUYMD,'yyyy/mm/dd') || '　　　　　' ||
			'・返却日　：' || to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd') || '　　　　　' || chr(13) || chr(10) ||
			'・整理番号：' || QWA3_SEIRINO || '　　　　　' || chr(13) || chr(10) ||
			'・戻り理由：' || QWA3_HENKYAKURIYU || ' ' || a.QSA2_MEI || chr(13) || chr(10) ||
			'・状況区分：' || QWA3_JOKYOKBN || ' ' || b.QSA2_MEI 
                                 VSA7_MEMO
		from QWA3_KIJITSUT,QSA2_SCODET a,QSA2_SCODET b
		Where  QWA3_PRMNAIBUKAIINNO <> '99999999'
		  and  a.QSA2_PRMCODEKBN(+) = 'DE2' and  QWA3_HENKYAKURIYU = a.QSA2_PRMCODENO(+)
		  and  b.QSA2_PRMCODEKBN(+) = 'DE5' and  QWA3_JOKYOKBN     = b.QSA2_PRMCODENO(+)

union all

select 	QBK1_PRMHASOUINYMD VSA7_MAKEDATE,
		'K' VSA7_SYSTEMSKBCD,
		null VSA7_MEMOBNRCD,
		null VSA7_MEMOCD,
		QBK1_PRMNAIBUKAIINNO VSA7_NKNO,
		null VSA7_BLACKNO,
		null VSA7_UKETSUKENO,
		null VSA7_TANTOID ,
		QBK1_KOUHASOTANTOMEI VSA7_TANTONM,
		'発送日 ' || nvl(to_char(QBK1_DATHASOUYMD,'yyyy/mm/dd'),'          ') ||
			'  返却日 ' || nvl(to_char(QBK1_DATHENKYAKUYMD,'yyyy/mm/dd'),'          ') || 
			'  結果 ' || QBK1_HEKHENKYAKUKBN VSA7_MEMONM,
		QSAP_ActX701PKG.QSAP_ActX7011 ( QBK1_SOHGINKOUCD	,
							            QBK1_SOHSHITENCD	,
							            QBK1_SOHKAKUNINKBN	,
							            QBK1_HEKHENKYAKUKBN	,
							            QBK1_HEKRIYUCD1		,
							            QBK1_HEKRIYUCD2		,
							            QBK1_HEKRIYUCD3		,
							            QBK1_HEKRIYUCD4		,
							            QBK1_HEKRIYUCD5		,
							            QBK1_HEKRIYUCD6		,
							            QBK1_KOZGINKOUCD	,
							            QBK1_KOZSHITENCD	,
							            QBK1_KOZSHUMOKU		,
							            QBK1_KOZYUCHOSAIHATU,
							            QBK1_KOZNO			,
							            QBK1_KOZMEIGI		,
							            QBK1_DATHASOUYMD	,
							            QBK1_DATHENKYAKUYMD	,
							            QBK1_GYOUMUKBN		,
							            QBK1_JFHSEIKYUYM	,
							            QBK1_JFHHURIKAEKEKACD,
										QBK1_SOHTOUZAIKBN	,
										QBK1_SOHSOUFUSAKIKBN
									  ) VSA7_MEMO
		from QBK1_KFURIT
		Where  QBK1_PRMNAIBUKAIINNO <> '99999999'
;
