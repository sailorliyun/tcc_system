--DROP   VIEW QBK_KAIINV;
CREATE VIEW QBK_KAIINV ( 
SYUBETU       --Ží•Ê--
,UKETSUKENO   --Žó•t”Ô†--
,KIGYOUCD     --Šé‹ÆƒR[ƒh--
,SUBRANGEKEY  --ƒTƒuƒŒƒ“ƒW--
,NAIBUKAIINNO --“à•”‰ïˆõ”Ô†--
,KAIINNO      --ŠO•”‰ïˆõ”Ô†--
,BLACKNO      --ƒuƒ‰ƒbƒN”Ô†--
,CARDKBN      --ƒJ[ƒh‹æ•ª--
,GKNSHIKIBETSUNO --‰ïˆõŽ¯•Ê--
,GKNEDABAN    --Ž}”Ô--
,TOUZAIKBN    --“Œ¼‹æ•ª--
,TENSAIKENKANRI  --ÂŒ ŠÇ—“X--
,KAIINNAME    --‰ïˆõŽ–¼--
,JSHJUSHOKBN  --ZŠ‹æ•ª--
,JSHYUBINNO   --—X•Ö”Ô†--
,JSHJUSHO1    --ZŠ‚P--
,JSHJUSHO2    --ZŠ‚Q--
,JSHJUSHO3    --ZŠ‚R--
,JSHJUSHO4    --ZŠ‚S--
,JSHATENA     --ˆ¶–¼--
--2004.05.10-->
,TOUROKUDATE  --“o˜^“ú--
--2004.05.10<--
 ) AS 
Select
 '1'						SYUBETU,      --Ží•Ê--
 QTA1_NYKUKETSUKENO			UKETSUKENO,   --Žó•t”Ô†--
 QTA1_PRMKIGYOUCD			KIGYOUCD,     --Šé‹ÆƒR[ƒh--
 QTA1_PRMSUBRANGEKEY		SUBRANGEKEY,  --ƒTƒuƒŒƒ“ƒW--
 QTA1_PRMNAIBUKAIINNO		NAIBUKAIINNO, --“à•”‰ïˆõ”Ô†--
 '0000000000000000'			KAIINNO,      --ŠO•”‰ïˆõ”Ô†--
 '00000000'					BLACKNO,      --ƒuƒ‰ƒbƒN”Ô†--
 QTA1_CARDKBN				CARDKBN,      --ƒJ[ƒh‹æ•ª--
 QTA1_GKNSHIKIBETSUNO		GKNSHIKIBETSUNO, --‰ïˆõŽ¯•Ê--
 QTA1_GKNEDABAN				GKNEDABAN,    --Ž}”Ô--
 ' '						TOUZAIKBN,    --“Œ¼‹æ•ª--
 QTA1_TENSAIKENKANRI		TENSAIKENKANRI,  --ÂŒ ŠÇ—“X--
 QTA1_HONSHIMEIKAN			KAIINNAME,    --‰ïˆõŽ–¼--
 '1'						JSHJUSHOKBN,  --ZŠ‹æ•ª--
 QTA1_JTKYUUBINNO			JSHYUBINNO,   --—X•Ö”Ô†--
-- QTA1_JTKJUSHOKAN                         VARCHAR2(50)
-- QTA1_JTKBANCHIKAN                        VARCHAR2(30)
-- QTA1_JTKKATAKAN                          VARCHAR2(64)
 '@'						JSHJUSHO1,    --ZŠ‚P--
 '@'						JSHJUSHO2,    --ZŠ‚Q--
 '@'						JSHJUSHO3,    --ZŠ‚R--
 '@'						JSHJUSHO4,    --ZŠ‚S--
 QTA1_HONSHIMEIKAN			JSHATENA,     --ˆ¶–¼--
--2004.05.10-->
 QTA1_NYKKESSAIYMD			TOUROKUDATE   --“o˜^“ú--
--2004.05.10<--
 FROM  QTA1_KAIINM
union
Select
-- ŒûÀî•ñ‚ªŽæ“¾‚Å‚«‚È‚¢‚Ì‚Å—Dæ“x•ÏX‚µ‚½B 2004.03.04 IMZ.YAMADA
-- '2'						SYUBETU,      --Ží•Ê--
 '4'						SYUBETU,      --Ží•Ê--
 QTAC_UKETSUKENO			UKETSUKENO,   --Žó•t”Ô†--
 '9999'						KIGYOUCD,     --Šé‹ÆƒR[ƒh--
 '9999'						SUBRANGEKEY,  --ƒTƒuƒŒƒ“ƒW--
 '99999999'					NAIBUKAIINNO, --“à•”‰ïˆõ”Ô†--
 '0000000000000000'			KAIINNO,      --ŠO•”‰ïˆõ”Ô†--
 QTAC_PRMBLACKNO			BLACKNO,      --ƒuƒ‰ƒbƒN”Ô†--
 QTAC_CARDKBN				CARDKBN,      --ƒJ[ƒh‹æ•ª--
 ' '						GKNSHIKIBETSUNO, --‰ïˆõŽ¯•Ê--
 ' '						GKNEDABAN,    --Ž}”Ô--
 ' '						TOUZAIKBN,    --“Œ¼‹æ•ª--
 QTAC_TENKAKUTOKU			TENSAIKENKANRI,  --ÂŒ ŠÇ—“X--
 QTAC_HONSHIMEIKAN			KAIINNAME,    --‰ïˆõŽ–¼--
 '1'						JSHJUSHOKBN,  --ZŠ‹æ•ª--
 QTAC_YUBINNO				JSHYUBINNO,   --—X•Ö”Ô†--
 '@'						JSHJUSHO1,    --ZŠ‚P--
 '@'						JSHJUSHO2,    --ZŠ‚Q--
 '@'						JSHJUSHO3,    --ZŠ‚R--
 '@'						JSHJUSHO4,    --ZŠ‚S--
 QTAC_HONSHIMEIKAN			JSHATENA,     --ˆ¶–¼--
--2004.05.10-->
 QTAC_TOUROKUYMD			TOUROKUDATE   --“o˜^“ú--
--2004.05.10<--
 FROM  QTAC_BLACKT
union
Select
 '3'						SYUBETU,      --Ží•Ê--
 QBA1_UKETSUKENO			UKETSUKENO,   --Žó•t”Ô†--
 '9999'						KIGYOUCD,     --Šé‹ÆƒR[ƒh--
 '9999'						SUBRANGEKEY,  --ƒTƒuƒŒƒ“ƒW--
 '99999999'					NAIBUKAIINNO, --“à•”‰ïˆõ”Ô†--
 '0000000000000000'			KAIINNO,      --ŠO•”‰ïˆõ”Ô†--
 '00000000'					BLACKNO,      --ƒuƒ‰ƒbƒN”Ô†--
 QBA1_CARDKBN				CARDKBN,      --ƒJ[ƒh‹æ•ª--
 ' '						GKNSHIKIBETSUNO, --‰ïˆõŽ¯•Ê--
 ' '						GKNEDABAN,    --Ž}”Ô--
-- ŒûUî•ñ‚ª‚È‚¢\ž‘ƒe[ƒuƒ‹‚Ì‘Î‰ž 2004.03.04 IMZ.YAMADA
-- QBA1_ELSTOZAIKBN			TOUZAIKBN,    --“Œ¼‹æ•ª--
-- QBA1_CTLKANRITEN			TENSAIKENKANRI,  --ÂŒ ŠÇ—“X--
-- QBA1_HONKJNAME			KAIINNAME,    --‰ïˆõŽ–¼--
 Nvl(QBA1_ELSTOZAIKBN,'1')	TOUZAIKBN,    --“Œ¼‹æ•ª--
 Nvl(QBA1_CTLKANRITEN,'95')	TENSAIKENKANRI,  --ÂŒ ŠÇ—“X--
 Nvl(QBA1_HONKJNAME,'±')	KAIINNAME,    --‰ïˆõŽ–¼--
 '1'						JSHJUSHOKBN,  --ZŠ‹æ•ª--
-- QBA1_HONYUBINNO			JSHYUBINNO,   --—X•Ö”Ô†--
 Nvl(QBA1_HONYUBINNO,' ')	JSHYUBINNO,   --—X•Ö”Ô†--
 '@'						JSHJUSHO1,    --ZŠ‚P--
 '@'						JSHJUSHO2,    --ZŠ‚Q--
 '@'						JSHJUSHO3,    --ZŠ‚R--
 '@'						JSHJUSHO4,    --ZŠ‚S--
-- QBA1_HONKJNAME			JSHATENA      --ˆ¶–¼--
 Nvl(QBA1_HONKJNAME,'±')	JSHATENA,     --ˆ¶–¼--
--2004.05.10-->
 QBA1_STRDATE				TOUROKUDATE   --“o˜^“ú--
--2004.05.10<--
 FROM  QBA1_MOSHIKOMIT
;
