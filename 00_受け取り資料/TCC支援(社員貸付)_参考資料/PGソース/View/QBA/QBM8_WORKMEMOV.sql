--DROP   VIEW QBM8_WORKMEMOV;
CREATE VIEW QBM8_WORKMEMOV ( 
QBM8_UKETSUKENO
,QBM8_MAKEDATE
,QBM8_MEMOCD
,QBM8_MEMOBNR
,QBM8_MEMO
,QBM8_STRDATE
,QBM8_UPDDATE
,QBM8_DELDATE
,QBM8_OPID
,QBM8_WSID
 ) AS 	-- 作業メモテーブル --
Select
	QBM8_UKETSUKENO,
	QBM8_MAKEDATE,
	QBM8_MEMOCD,
	QBM8_MEMOBNR,
	QBM8_MEMO,
	QBM8_STRDATE,
	QBM8_UPDDATE,
	QBM8_DELDATE,
	QBM8_OPID,
	QBM8_WSID
from QBM8_WORKMEMOT
union all	-- 統合メモテーブル --
	Select
		QBMA_UKETSUKENO  QBM8_UKETSUKENO,
		QSA7_MAKEDATE    QBM8_MAKEDATE,
		'019' || '00001' QBM8_MEMOCD,
		Null             QBM8_MEMOBNR,
		QSA7_MEMO        QBM8_MEMO,
		QSA7_STRDATE     QBM8_STRDATE,
		QSA7_UPDDATE     QBM8_UPDDATE,
		QSA7_DELDATE     QBM8_DELDATE,
		QSA7_TANTOID     QBM8_OPID,
		QSA7_WSID        QBM8_WSID
	From QBMA_LINKMEMOT,QSA7_TOGOMEMOT
	where  QBMA_LINKNAIBUKAIIN || '      ' =      QSA7_NKNO
	  and  QBMA_LINKNAIBUKAIIN             Is Not Null
	  and  QBMA_MEMOCD                     =      '15900001' --既存会員紐付けメモ
	  and  QBMA_DELDate                    Is     Null
	  and  QSA7_DELDate                    Is     Null
union all	-- 期日管理テーブル --
	Select
		QBMA_UKETSUKENO      QBM8_UKETSUKENO,
		 to_date(to_char(QWA3_PRMSAKUSEIBI,'yyyy/mm/dd') || ' ' || substr(QWA3_PRMSAKUSEITIME,1,2) || ':' || substr(QWA3_PRMSAKUSEITIME,3,2) || ':' || substr(QWA3_PRMSAKUSEITIME,5,2),'yyyy/mm/dd hh24:mi:ss')  QBM8_MAKEDATE,
		'019' || '00002'     QBM8_MEMOCD,
		Null                 QBM8_MEMOBNR,
		 '手紙名　　：' || QWA3_BUNSHOMEI || chr(13) || chr(10) || '・発送日　：' || to_char(QWA3_HASSOUYMD,'yyyy/mm/dd') || '　　　　　' || '・返却日　：' || to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd') || '　　　　　' || chr(13) || chr(10) || '・整理番号：' || QWA3_SEIRINO || '　　　　　' || chr(13) || chr(10) || '・戻り理由：' || QWA3_HENKYAKURIYU || ' ' || a.QSA2_MEI || chr(13) || chr(10) || '・状況区分：' || QWA3_JOKYOKBN || ' ' || b.QSA2_MEI QBM8_MEMO,
		QBMA_STRDATE         QBM8_STRDATE,
		QBMA_UPDDATE         QBM8_UPDDATE,
		QBMA_DELDATE         QBM8_DELDATE,
		QWA3_TOUTANTOUSHACD  QBM8_OPID,
		Null                 QBM8_WSID
		From QBMA_LINKMEMOT,QWA3_KIJITSUT,QSA2_SCODET a,QSA2_SCODET b
		Where  QBMA_LINKKIGYO                  =      QWA3_PRMKIGYOUCD
		  and  QBMA_LINKSUBRANGE               =      QWA3_PRMSUBRANGEKEY
		  and  QBMA_LINKNAIBUKAIIN             =      QWA3_PRMNAIBUKAIINNO
		  and  QBMA_MEMOCD                     =      '15900001' --既存会員紐付けメモ
		  and  QBMA_DELDate                    Is     Null
		  and  a.QSA2_PRMCODEKBN(+) = 'DE2'
		  and  QWA3_HENKYAKURIYU = a.QSA2_PRMCODENO(+)
		  and  b.QSA2_PRMCODEKBN(+) = 'DE5'
		  and  QWA3_JOKYOKBN     = b.QSA2_PRMCODENO(+);
