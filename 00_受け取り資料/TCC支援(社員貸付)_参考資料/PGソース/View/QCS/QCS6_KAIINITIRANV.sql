--ＣＳ会員一覧
--DROP   VIEW QCS6_KAIINITIRANV;
CREATE VIEW QCS6_KAIINITIRANV ( 
 QCS1_GKNSHIKIBETSUNO           --外部会員番号・識別番号(即発ＣＳＴカード番号)
,QCS1_GKNEDABAN                 --外部会員番号・本人枝番
,QCS1_TKSCARDNO                 --ＣＳＴカード番号
,QCS1_TENEIGYOU                 --店情報・営業店
,QCS1_TENKAKUTOKU               --店情報・獲得店
,QCS1_CARDKBN                   --カード区分
,QCS1_HONSHIMEIKANA             --カナ氏名
,QCS1_HONSHIMEIKAN              --漢字氏名
,QCS1_HONSEINENGAPPI            --生年月日
,QCS1_HONSEX                    --性別
,QCS1_JTKTELSHIGAI              --自宅・市外局番
,QCS1_JTKTELKYOKU               --自宅・局番
,QCS1_JTKTELNO                  --自宅・番号
,QCS1_JTKJUSHOKANA              --自宅・市区郡～字丁目カナ
,QCS1_JTKJUSHOKAN               --自宅・都道府県名～字丁目漢字
,QCS1_JTKBANCHIKANA             --自宅・番地カナ
,QCS1_JTKBANCHIKAN              --自宅・番地漢字
,QCS1_JTKKATAKANA               --自宅・方書カナ
,QCS1_JTKKATAKAN                --自宅・方書漢字
,QCS1_CIFNO                     --ＣＩＦ番号
,QCS1_KOZGINKOUCD               --口座情報・銀行コード
,QCS1_KOZGINKOUMEI              --口座情報・銀行名
,QCS1_KOZSHITENCD               --口座情報・支店コード
,QCS1_KOZSHITENMEI              --口座情報・支店名
,QCS1_KOZSHUMOKU                --口座情報・預金種目
,QCS1_KOZNO                     --口座情報・口座番号
,QCS1_KOZMEIGI                  --口座情報・口座名義
,QCS1_ATUKAKARI                 --扱部係情報・扱部課係
,QCS8_SHIMEI                    --共通・圧縮カナ氏名
,QCS8_TELNO                     --共通・圧縮TEL自宅
,QCS8_HONMAESHIMEI              --本人・圧縮前カナ氏名
,QCS8_HONMAETELNO               --本人・圧縮前TEL自宅
,QCS8_PRMCIFNO                  --主キー・CIFNo
,QCS8_KIGYOUCD                  --共通・企業コード
,QCS8_SUBRANGEKEY               --共通・サブレンジＮＯ
,QCS8_NOJNAIBUKAIINNO           --番号情報・内部会員番号
,QCS8_HONSEINENGAPPI            --本人・生年月日
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
