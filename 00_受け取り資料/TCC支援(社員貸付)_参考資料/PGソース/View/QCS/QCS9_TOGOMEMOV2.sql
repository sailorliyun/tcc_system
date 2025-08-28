--�b�r�Ή�����
--DROP   VIEW QCS9_TOGOMEMOV2;
-- 2004/09/11 ���o�����x���̑Ή�
-- IMZ.YAMADA �����Ǘ��e�[�u���p�̃r���[
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
		substr(QWA3_BUNSHOMEI || '�@�@�@�@�@�@�@�@�@�@',1,10) || 
						'  ������ ' || nvl(to_char(QWA3_HASSOUYMD,'yyyy/mm/dd'),'          ') ||
						'  �ԋp�� ' || nvl(to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd'),'          ') 
								VCS9_MEMONM,
		'�莆���@�@�F' || QWA3_BUNSHOMEI || chr(13) || chr(10) || 
			'�E�������@�F' || to_char(QWA3_HASSOUYMD,'yyyy/mm/dd') || '�@�@�@�@�@' ||
			'�E�ԋp���@�F' || to_char(QWA3_HENKYAKUYMD,'yyyy/mm/dd') || '�@�@�@�@�@' || chr(13) || chr(10) ||
			'�E�����ԍ��F' || QWA3_SEIRINO || '�@�@�@�@�@' || chr(13) || chr(10) ||
			'�E�߂藝�R�F' || QWA3_HENKYAKURIYU || ' ' || a.QSA2_MEI || chr(13) || chr(10) ||
			'�E�󋵋敪�F' || QWA3_JOKYOKBN || ' ' || b.QSA2_MEI 
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
