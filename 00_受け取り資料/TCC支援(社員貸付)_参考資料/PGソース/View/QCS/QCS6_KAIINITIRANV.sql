--�b�r����ꗗ
--DROP   VIEW QCS6_KAIINITIRANV;
CREATE VIEW QCS6_KAIINITIRANV ( 
 QCS1_GKNSHIKIBETSUNO           --�O������ԍ��E���ʔԍ�(�����b�r�s�J�[�h�ԍ�)
,QCS1_GKNEDABAN                 --�O������ԍ��E�{�l�}��
,QCS1_TKSCARDNO                 --�b�r�s�J�[�h�ԍ�
,QCS1_TENEIGYOU                 --�X���E�c�ƓX
,QCS1_TENKAKUTOKU               --�X���E�l���X
,QCS1_CARDKBN                   --�J�[�h�敪
,QCS1_HONSHIMEIKANA             --�J�i����
,QCS1_HONSHIMEIKAN              --��������
,QCS1_HONSEINENGAPPI            --���N����
,QCS1_HONSEX                    --����
,QCS1_JTKTELSHIGAI              --����E�s�O�ǔ�
,QCS1_JTKTELKYOKU               --����E�ǔ�
,QCS1_JTKTELNO                  --����E�ԍ�
,QCS1_JTKJUSHOKANA              --����E�s��S�`�����ڃJ�i
,QCS1_JTKJUSHOKAN               --����E�s���{�����`�����ڊ���
,QCS1_JTKBANCHIKANA             --����E�Ԓn�J�i
,QCS1_JTKBANCHIKAN              --����E�Ԓn����
,QCS1_JTKKATAKANA               --����E�����J�i
,QCS1_JTKKATAKAN                --����E��������
,QCS1_CIFNO                     --�b�h�e�ԍ�
,QCS1_KOZGINKOUCD               --�������E��s�R�[�h
,QCS1_KOZGINKOUMEI              --�������E��s��
,QCS1_KOZSHITENCD               --�������E�x�X�R�[�h
,QCS1_KOZSHITENMEI              --�������E�x�X��
,QCS1_KOZSHUMOKU                --�������E�a�����
,QCS1_KOZNO                     --�������E�����ԍ�
,QCS1_KOZMEIGI                  --�������E�������`
,QCS1_ATUKAKARI                 --�����W���E�����یW
,QCS8_SHIMEI                    --���ʁE���k�J�i����
,QCS8_TELNO                     --���ʁE���kTEL����
,QCS8_HONMAESHIMEI              --�{�l�E���k�O�J�i����
,QCS8_HONMAETELNO               --�{�l�E���k�OTEL����
,QCS8_PRMCIFNO                  --��L�[�ECIFNo
,QCS8_KIGYOUCD                  --���ʁE��ƃR�[�h
,QCS8_SUBRANGEKEY               --���ʁE�T�u�����W�m�n
,QCS8_NOJNAIBUKAIINNO           --�ԍ����E��������ԍ�
,QCS8_HONSEINENGAPPI            --�{�l�E���N����
 ) AS 
SELECT
	QCS1_KIKKYUUNO QCS1_GKNShikibetsuNo,
	'1' QCS1_GKNEdaban,
	QCS1_TKSCARDNO,
	' ' QCS1_TENEigyou,
	QCS1_TENKakutoku,
	QCS1_CardKbn,
	QCS1_HONShimeiKana,
	QCS1_HONShimeiKan,
	QCS1_HONSeinengappi,
	QCS1_HONSex,
	QCS1_JTKTelShigai,
	QCS1_JTKTelKyoku,
	QCS1_JTKTelNo,
	QCS1_JTKJushokana,
	QCS1_JTKJushoKan,
	QCS1_JTKBanchiKana,
	QCS1_JTKBanchiKan,
	QCS1_JTKKataKana,
	QCS1_JTKKataKan,
	QCS1_CIFNo,
	' ' QCS1_KOZGinkouCD,
	' ' QCS1_KOZGinkouMei,
	' ' QCS1_KOZShitenCd,
	' ' QCS1_KOZShitenMei,
	' ' QCS1_KOZShumoku,
	' ' QCS1_KOZNo,
	' ' QCS1_KOZMeigi,
	' ' QCS1_ATUKakari,
	QCS8_Shimei,
	QCS8_TelNo,
	QCS8_HONMaeShimei,
	QCS8_HONMaeTelNo,
	QCS8_PRMCIFNo,
	QCS8_KigyouCd,
	QCS8_SubRangeKey,
	QCS8_NOJNaibuKaiinNo,
	QCS8_HONSeinengappi
 FROM  	QCS1_KAIINM KainM, QCS8_NameSearchMS NameS
 WHERE 	(NameS.QCS8_KigyouCd = KainM.QCS1_PRMKigyouCd(+)
 AND	NameS.QCS8_SubRangeKey = KainM.QCS1_PRMSubRangeKey(+)
 AND	NameS.QCS8_NOJNaibuKaiinNo = KainM.QCS1_PRMNaibuKaiinNo(+))
;
