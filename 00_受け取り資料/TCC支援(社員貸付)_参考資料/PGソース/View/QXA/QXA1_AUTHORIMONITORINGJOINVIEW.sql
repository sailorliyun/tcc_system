CREATE OR REPLACE VIEW QXA1_AUTHORIMONITORINGJOINVIEW AS
Select Substr(QXA1_GaibuKaiinNo,1,4) || '-' || Substr(QXA1_GaibuKaiinNo,5,4) || '-' || Substr(QXA1_GaibuKaiinNo,9,4) || '-' || Substr(QXA1_GaibuKaiinNo,13,4) As KaiinNo,
	QXA1_ShoriYMD,
	QXA1_JyushinTime,
	g.QSA2_Mei As Torihiki,  --�����i�S�ݓX�A�����X�j�|�󖼏�
	c.QSA2_Mei As Yokyu,     --�v���d����ʖ|�󖼏�
	f.QSA2_Mei As Outou,     --�����d����ʖ|�󖼏�
	d.QSA2_Mei As Nyuryoku,  --���͕��@�|�󖼏�
	e.QSA2_Mei As Shiharai,  --�x���敪�|�󖼏�
	Decode(QXA1_ErrorCode,NULL,'OK',
               DECODE(SUBSTR(QXA1_ErrorCode,1,1),'P','OK','NG')) As Hantei,
	QXA1_ErrorCode,
	To_Char(QXA1_Kingaku,'99,999,999') As Kingaku,
	Decode(Length(QXA1_KameitenNo),13,Substr(QXA1_KameitenNo,1,5) || '-' || Substr(QXA1_KameitenNo,6,2) || '-'|| Substr(QXA1_KameitenNo,8,1) || '-' || Substr(QXA1_KameitenNo,9,5),QXA1_KameitenNo) As KameitenNo,
--�L������99XX��To_Date�֐���yyyy/mm�ɕϊ������2099/XX�ɂȂ��Ă��܂��B
--����āA�N�iyy�j����T�O���������l���}�C�i�X�̏ꍇ�́A2000�N��Ƃ݂Ȃ��A0���̓v���X�̏ꍇ�́A1900�N��Ƃ݂Ȃ�
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
	i.QTA8_Mei As StsKoza,  --�����X�e�[�^�X����
	j.QTA8_Mei As StsCard,  --�J�[�h�X�e�[�^�X����
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
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSC') c,  --�v���d����ʂ̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSA') d,  --���͕��@�̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXA') e,  --�x���敪�̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX1') f,  --�����d����ʂ̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DS9') g,  --�����̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX2') h,  --�Ώ��i���u�j�̖|��
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S02') i,   --�����X�e�[�^�X�̖|��
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S03') j   --�J�[�h�X�e�[�^�X�̖|��

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
