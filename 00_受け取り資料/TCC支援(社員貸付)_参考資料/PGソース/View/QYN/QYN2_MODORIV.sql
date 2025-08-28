/**********************************************************************/
/*  �N�����D�N���m�}�X�^�E���m�߂��t�e�[�u��                */
/**********************************************************************/
--DROP   VIEW  QYN2_MODORIV;
CREATE VIEW  QYN2_MODORIV (
    VYN2_PRMKIGYOUCD         ,
    VYN2_PRMSUBRANGEKEY      ,
    VYN2_PRMNAIBUKAIINNO     ,
    VYN2_MAKEDATE            ,
    VYN2_MEMOFLG             ,
    VYN2_HENKYAKUYMD         ,          --�߂�o�^��
    VYN2_HENKYAKURIYU        ,          --�߂藝�R(���/�s�ݖ߂�/����Ȃ�/�Ȃ�)
    VYN2_JOKYOKBN            ,          --�󋵋敪(����/������)
    VYN2_KOKUCHI             ,          --���m�t���O(���m�Ȃ�/���m�ς�/���m�s��)
    VYN2_DOUI                ,          --���Ӄt���O(����/����/���E��/�L���s��)
    VYN2_DOUISYUBETU         ,          --�ԐM���(�͂���/�d�b)
    VYN2_SEIRINO             ,          --�����ԍ�
    VYN2_HUPIRAIDATE         ,          --�z�X�g���M������
    VYN2_OPID                
 ) AS 
select		QYN2_PRMKIGYOUCD	VYN2_PRMKIGYOUCD,
		QYN2_PRMSUBRANGEKEY		VYN2_PRMSUBRANGEKEY,
		QYN2_PRMNAIBUKAIINNO	VYN2_PRMNAIBUKAIINNO,
		QYN2_MAKEDATE			VYN2_MAKEDATE,
		QYN2_MEMOFLG			VYN2_MEMOFLG,
		TO_Char(QYN2_HENKYAKUYMD,'YYYY/MM/DD')
								VYN2_HENKYAKUYMD,
		QYN2_HENKYAKURIYU		VYN2_HENKYAKURIYU,
		QYN2_JOKYOKBN			VYN2_JOKYOKBN ,
		QYN2_KOKUCHI			VYN2_KOKUCHI,
		QYN2_DOUI				VYN2_DOUI,
		QYN2_DOUISYUBETU		VYN2_DOUISYUBETU,
		QYN2_SEIRINO			VYN2_SEIRINO,
		TO_Char(QYN2_HUPIRAIDATE,'YYYY/MM/DD')
								VYN2_HUPIRAIDATE,
		QYN2_OPID				VYN2_OPID
		from  QYN2_MODORIT
		Where QYN2_DELDATE is null
union all
select		QYN1_PRMKIGYOUCD	VYN2_PRMKIGYOUCD,
		QYN1_PRMSUBRANGEKEY		VYN2_PRMSUBRANGEKEY,
		QYN1_PRMNAIBUKAIINNO	VYN2_PRMNAIBUKAIINNO,
		TO_DATE(TO_NUMBER(DECODE(QYN1_STRDATE,'0000000',Null,QYN1_STRDATE)) +19000000,'YYYYMMDD')
								VYN2_MAKEDATE,
		' '						VYN2_MEMOFLG,
		Null					VYN2_HENKYAKUYMD,
		Null					VYN2_HENKYAKURIYU,
		Null					VYN2_JOKYOKBN,
		QYN1_KOKUCHI			VYN2_KOKUCHI,
		QYN1_DOUI				VYN2_DOUI,
		Null					VYN2_DOUISYUBETU,
		Null					VYN2_SEIRINO,
		Null					VYN2_HUPIRAIDATE,
		Null					VYN2_OPID
		from  QYN1_NENKAIHIM
;
