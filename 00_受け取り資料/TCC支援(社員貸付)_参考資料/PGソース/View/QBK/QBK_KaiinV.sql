--DROP   VIEW QBK_KAIINV;
CREATE VIEW QBK_KAIINV ( 
SYUBETU       --���--
,UKETSUKENO   --��t�ԍ�--
,KIGYOUCD     --��ƃR�[�h--
,SUBRANGEKEY  --�T�u�����W--
,NAIBUKAIINNO --��������ԍ�--
,KAIINNO      --�O������ԍ�--
,BLACKNO      --�u���b�N�ԍ�--
,CARDKBN      --�J�[�h�敪--
,GKNSHIKIBETSUNO --�������--
,GKNEDABAN    --�}��--
,TOUZAIKBN    --�����敪--
,TENSAIKENKANRI  --���Ǘ��X--
,KAIINNAME    --�������--
,JSHJUSHOKBN  --�Z���敪--
,JSHYUBINNO   --�X�֔ԍ�--
,JSHJUSHO1    --�Z���P--
,JSHJUSHO2    --�Z���Q--
,JSHJUSHO3    --�Z���R--
,JSHJUSHO4    --�Z���S--
,JSHATENA     --����--
--2004.05.10-->
,TOUROKUDATE  --�o�^��--
--2004.05.10<--
 ) AS 
Select
 '1'						SYUBETU,      --���--
 QTA1_NYKUKETSUKENO			UKETSUKENO,   --��t�ԍ�--
 QTA1_PRMKIGYOUCD			KIGYOUCD,     --��ƃR�[�h--
 QTA1_PRMSUBRANGEKEY		SUBRANGEKEY,  --�T�u�����W--
 QTA1_PRMNAIBUKAIINNO		NAIBUKAIINNO, --��������ԍ�--
 '0000000000000000'			KAIINNO,      --�O������ԍ�--
 '00000000'					BLACKNO,      --�u���b�N�ԍ�--
 QTA1_CARDKBN				CARDKBN,      --�J�[�h�敪--
 QTA1_GKNSHIKIBETSUNO		GKNSHIKIBETSUNO, --�������--
 QTA1_GKNEDABAN				GKNEDABAN,    --�}��--
 ' '						TOUZAIKBN,    --�����敪--
 QTA1_TENSAIKENKANRI		TENSAIKENKANRI,  --���Ǘ��X--
 QTA1_HONSHIMEIKAN			KAIINNAME,    --�������--
 '1'						JSHJUSHOKBN,  --�Z���敪--
 QTA1_JTKYUUBINNO			JSHYUBINNO,   --�X�֔ԍ�--
-- QTA1_JTKJUSHOKAN                         VARCHAR2(50)
-- QTA1_JTKBANCHIKAN                        VARCHAR2(30)
-- QTA1_JTKKATAKAN                          VARCHAR2(64)
 '�@'						JSHJUSHO1,    --�Z���P--
 '�@'						JSHJUSHO2,    --�Z���Q--
 '�@'						JSHJUSHO3,    --�Z���R--
 '�@'						JSHJUSHO4,    --�Z���S--
 QTA1_HONSHIMEIKAN			JSHATENA,     --����--
--2004.05.10-->
 QTA1_NYKKESSAIYMD			TOUROKUDATE   --�o�^��--
--2004.05.10<--
 FROM  QTA1_KAIINM
union
Select
-- ������񂪎擾�ł��Ȃ��̂ŗD��x�ύX�����B 2004.03.04 IMZ.YAMADA
-- '2'						SYUBETU,      --���--
 '4'						SYUBETU,      --���--
 QTAC_UKETSUKENO			UKETSUKENO,   --��t�ԍ�--
 '9999'						KIGYOUCD,     --��ƃR�[�h--
 '9999'						SUBRANGEKEY,  --�T�u�����W--
 '99999999'					NAIBUKAIINNO, --��������ԍ�--
 '0000000000000000'			KAIINNO,      --�O������ԍ�--
 QTAC_PRMBLACKNO			BLACKNO,      --�u���b�N�ԍ�--
 QTAC_CARDKBN				CARDKBN,      --�J�[�h�敪--
 ' '						GKNSHIKIBETSUNO, --�������--
 ' '						GKNEDABAN,    --�}��--
 ' '						TOUZAIKBN,    --�����敪--
 QTAC_TENKAKUTOKU			TENSAIKENKANRI,  --���Ǘ��X--
 QTAC_HONSHIMEIKAN			KAIINNAME,    --�������--
 '1'						JSHJUSHOKBN,  --�Z���敪--
 QTAC_YUBINNO				JSHYUBINNO,   --�X�֔ԍ�--
 '�@'						JSHJUSHO1,    --�Z���P--
 '�@'						JSHJUSHO2,    --�Z���Q--
 '�@'						JSHJUSHO3,    --�Z���R--
 '�@'						JSHJUSHO4,    --�Z���S--
 QTAC_HONSHIMEIKAN			JSHATENA,     --����--
--2004.05.10-->
 QTAC_TOUROKUYMD			TOUROKUDATE   --�o�^��--
--2004.05.10<--
 FROM  QTAC_BLACKT
union
Select
 '3'						SYUBETU,      --���--
 QBA1_UKETSUKENO			UKETSUKENO,   --��t�ԍ�--
 '9999'						KIGYOUCD,     --��ƃR�[�h--
 '9999'						SUBRANGEKEY,  --�T�u�����W--
 '99999999'					NAIBUKAIINNO, --��������ԍ�--
 '0000000000000000'			KAIINNO,      --�O������ԍ�--
 '00000000'					BLACKNO,      --�u���b�N�ԍ�--
 QBA1_CARDKBN				CARDKBN,      --�J�[�h�敪--
 ' '						GKNSHIKIBETSUNO, --�������--
 ' '						GKNEDABAN,    --�}��--
-- ���U��񂪂Ȃ��\�����e�[�u���̑Ή� 2004.03.04 IMZ.YAMADA
-- QBA1_ELSTOZAIKBN			TOUZAIKBN,    --�����敪--
-- QBA1_CTLKANRITEN			TENSAIKENKANRI,  --���Ǘ��X--
-- QBA1_HONKJNAME			KAIINNAME,    --�������--
 Nvl(QBA1_ELSTOZAIKBN,'1')	TOUZAIKBN,    --�����敪--
 Nvl(QBA1_CTLKANRITEN,'95')	TENSAIKENKANRI,  --���Ǘ��X--
 Nvl(QBA1_HONKJNAME,'�')	KAIINNAME,    --�������--
 '1'						JSHJUSHOKBN,  --�Z���敪--
-- QBA1_HONYUBINNO			JSHYUBINNO,   --�X�֔ԍ�--
 Nvl(QBA1_HONYUBINNO,' ')	JSHYUBINNO,   --�X�֔ԍ�--
 '�@'						JSHJUSHO1,    --�Z���P--
 '�@'						JSHJUSHO2,    --�Z���Q--
 '�@'						JSHJUSHO3,    --�Z���R--
 '�@'						JSHJUSHO4,    --�Z���S--
-- QBA1_HONKJNAME			JSHATENA      --����--
 Nvl(QBA1_HONKJNAME,'�')	JSHATENA,     --����--
--2004.05.10-->
 QBA1_STRDATE				TOUROKUDATE   --�o�^��--
--2004.05.10<--
 FROM  QBA1_MOSHIKOMIT
;
