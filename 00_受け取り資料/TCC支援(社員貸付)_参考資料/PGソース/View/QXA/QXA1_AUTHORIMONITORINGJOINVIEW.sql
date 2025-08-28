CREATE OR REPLACE VIEW QXA1_AUTHORIMONITORINGJOINVIEW AS
Select Substr(QXA1_GaibuKaiinNo,1,4) || '-' || Substr(QXA1_GaibuKaiinNo,5,4) || '-' || Substr(QXA1_GaibuKaiinNo,9,4) || '-' || Substr(QXA1_GaibuKaiinNo,13,4) As KaiinNo,
	QXA1_ShoriYMD,
	QXA1_JyushinTime,
	g.QSA2_Mei As Torihiki,  --取引先（百貨店、加盟店）翻訳名称
	c.QSA2_Mei As Yokyu,     --要求電文種別翻訳名称
	f.QSA2_Mei As Outou,     --応答電文種別翻訳名称
	d.QSA2_Mei As Nyuryoku,  --入力方法翻訳名称
	e.QSA2_Mei As Shiharai,  --支払区分翻訳名称
	Decode(QXA1_ErrorCode,NULL,'OK',
               DECODE(SUBSTR(QXA1_ErrorCode,1,1),'P','OK','NG')) As Hantei,
	QXA1_ErrorCode,
	To_Char(QXA1_Kingaku,'99,999,999') As Kingaku,
	Decode(Length(QXA1_KameitenNo),13,Substr(QXA1_KameitenNo,1,5) || '-' || Substr(QXA1_KameitenNo,6,2) || '-'|| Substr(QXA1_KameitenNo,8,1) || '-' || Substr(QXA1_KameitenNo,9,5),QXA1_KameitenNo) As KameitenNo,
--有効期限99XXはTo_Date関数でyyyy/mmに変換すると2099/XXになってしまう。
--よって、年（yy）から５０を引いた値がマイナスの場合は、2000年代とみなし、0又はプラスの場合は、1900年代とみなす
	Decode(QXA1_YukoKigen,Null,Null,
		Decode(QXA1_YukoKigen,Null,Null,
               		Decode(QXA1_YukoKigen,'0000',Null,
                        	Decode(Sign(To_Number(Substr(QXA1_YukoKigen,1,2)) - 50),-1,
						'20' || Substr(QXA1_YukoKigen,1,2) || '/' || Substr(QXA1_YukoKigen,3,2),
                               	'19' || Substr(QXA1_YukoKigen,1,2) || '/' || Substr(QXA1_YukoKigen,3,2)
                				)
                     		)
			)
		) As YukoKigen,
	QXA1_FDSScore,
	QXA3_ShoriTanto,
	h.QSA2_Mei As Taisho,
	QXA1_CenterID,
	QXA1_CAFISTuban,
	QXA1_CenterShikibetu,
	QXA1_TorihikiKbn,
	QXA1_KigyouCd,
	QXA1_SubRangeKey,
	QXA1_NaibuKaiinNo,
	QXA1_GaibuKaiinNo,
	QXA1_KameitenNo,
	QXA1_YokyuDenbunSbt,
	QXA1_OutouDenbunSbt,
	QXA1_CardEntryDev,
	QXA1_ShiharaiKbn,
	QXA3_MonitoringKbn,
	QXA3_Taisho,
	i.QTA8_Mei As StsKoza,  --口座ステータス名称
	j.QTA8_Mei As StsCard,  --カードステータス名称
	Decode(QXA1_MSTYukoKigen,Null,QXA1_MSTYukoKigen,To_Char(To_Date(Substr(QXA1_MSTYukoKigen,1,2) || '/' || Substr(QXA1_MSTYukoKigen,3,2),'yy/mm'),'yyyy/mm')) As MstYukoKigen,
	QXA1_MSTSozandaka,
	QXA1_MSTNobeZandaka,
	QXA1_MSTCashingZandaka

From
	QXA1_AuthoriLogT a,
	(Select QXA3_CenterID,QXA3_CAFISTuban,QXA3_CenterSkb,QXA3_TorihikiKbn,
         QXA3_ShoriYMD,QXA3_JyushinTime,QXA3_KigyouCd,QXA3_SubRangeKey,QXA3_NaibuKaiinNo,QXA3_Taisho,
         QXA3_MonitoringKbn,QXA3_ShoriTanto
         From QXA3_MonitoringT ) b,
--                                 Where QXA3_ONBATCHKBN = 'B') b,
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSC') c,  --要求電文種別の翻訳
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSA') d,  --入力方法の翻訳
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXA') e,  --支払区分の翻訳
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX1') f,  --応答電文種別の翻訳
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DS9') g,  --取引先の翻訳
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX2') h,  --対処（処置）の翻訳
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S02') i,   --口座ステータスの翻訳
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S03') j   --カードステータスの翻訳

Where
	(QXA1_CenterID=QXA3_CenterID(+)
    And  QXA1_CAFISTuban=QXA3_CAFISTuban(+)
    And  QXA1_CenterShikibetu=QXA3_CenterSkb(+)
    And  QXA1_TorihikiKbn=QXA3_TorihikiKbn(+)
    And  QXA1_ShoriYMD=QXA3_ShoriYMD(+)
    And  QXA1_JyushinTime=QXA3_JyushinTime(+)
    And  QXA1_KigyouCd=QXA3_KigyouCd(+)
    And  QXA1_SubRangeKey=QXA3_SubRangeKey(+)
    And  QXA1_NaibuKaiinNo=QXA3_NaibuKaiinNo(+))
    And (RTrim(c.QSA2_PRMCodeNo(+))=Substr(QXA1_YokyuDenbunSbt,1,2))
    And (RTrim(d.QSA2_PRMCodeNo(+))=QXA1_CardEntryDev)
    And (RTrim(e.QSA2_PRMCodeNo(+))=QXA1_TorihikiKbn || QXA1_ShiharaiKbn)
    And (RTrim(f.QSA2_PRMCodeNo(+))=Substr(QXA1_OutouDenbunSbt,3,2))
    And (RTrim(g.QSA2_PRMCodeNo(+))=QXA1_TorihikiKbn)
    And (RTrim(h.QSA2_PRMCodeNo(+))=QXA3_Taisho)
    And (RTrim(i.QTA8_PRMCodeNo(+))=QXA1_MstStsKoza)
    And (RTrim(j.QTA8_PRMCodeNo(+))=QXA1_MstStsCard)
;
