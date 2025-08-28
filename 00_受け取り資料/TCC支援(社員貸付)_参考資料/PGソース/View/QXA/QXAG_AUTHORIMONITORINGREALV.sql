CREATE OR REPLACE VIEW QXAG_AUTHORIMONITORINGREALV AS
Select Substr(QXAG_GaibuKaiinNo,1,4) || '-' || Substr(QXAG_GaibuKaiinNo,5,4) || '-' || Substr(QXAG_GaibuKaiinNo,9,4) || '-' || Substr(QXAG_GaibuKaiinNo,13,4) As KaiinNo,
	QXAG_ShoriYMD,
	QXAG_JyushinTime,
	g.QSA2_Mei As Torihiki,  --�����i�S�ݓX�A�����X�j�|�󖼏�
	c.QSA2_Mei As Yokyu,     --�v���d����ʖ|�󖼏�
	f.QSA2_Mei As Outou,     --�����d����ʖ|�󖼏�
	d.QSA2_Mei As Nyuryoku,  --���͕��@�|�󖼏�
	e.QSA2_Mei As Shiharai,  --�x���敪�|�󖼏�
	Decode(QXAG_ErrorCode,NULL,'OK',
               Decode(Substr(QXAG_ErrorCode,1,1),'P','OK','NG')) As Hantei,
	QXAG_ErrorCode,
	To_Char(QXAG_Kingaku,'99,999,999') As Kingaku,
	Decode(Length(QXAG_KameitenNo),13,Substr(QXAG_KameitenNo,1,5) || '-' || Substr(QXAG_KameitenNo,6,2) || '-'|| Substr(QXAG_KameitenNo,8,1) || '-' || Substr(QXAG_KameitenNo,9,5),QXAG_KameitenNo) As KameitenNo,
--�L������99XX��To_Date�֐���yyyy/mm�ɕϊ������2099/XX�ɂȂ��Ă��܂��B
--����āA�N�iyy�j����T�O���������l���}�C�i�X�̏ꍇ�́A2000�N��Ƃ݂Ȃ��A0���̓v���X�̏ꍇ�́A1900�N��Ƃ݂Ȃ�
	Decode(QXAG_YukoKigen,Null,Null,
		Decode(QXAG_YukoKigen,Null,Null,
               		Decode(QXAG_YukoKigen,'0000',Null,
                        	Decode(Sign(To_Number(Substr(QXAG_YukoKigen,1,2)) - 50),-1,
						'20' || Substr(QXAG_YukoKigen,1,2) || '/' || Substr(QXAG_YukoKigen,3,2),
                               	'19' || Substr(QXAG_YukoKigen,1,2) || '/' || Substr(QXAG_YukoKigen,3,2)
                				)
                     		)
			)
		) As YukoKigen,
	QXAG_FDSScore,
	QXA3_ShoriTanto,
	h.QSA2_Mei As Taisho,
	QXAG_CenterID,
	QXAG_CAFISTuban,
	QXAG_CenterShikibetu,
	QXAG_TorihikiKbn,
	QXAG_KigyouCd,
	QXAG_SubRangeKey,
	QXAG_NaibuKaiinNo,
	QXAG_GaibuKaiinNo,
	QXAG_KameitenNo,
	QXAG_YokyuDenbunSbt,
	QXAG_OutouDenbunSbt,
	QXAG_CardEntryDev,
	QXAG_ShiharaiKbn,
	QXA3_MonitoringKbn,
	QXA3_Taisho,
	i.QTA8_Mei As StsKoza,  --�����X�e�[�^�X����
	j.QTA8_Mei As StsCard,  --�J�[�h�X�e�[�^�X����
	Decode(QXAG_MSTYukoKigen,Null,QXAG_MSTYukoKigen,To_Char(To_Date(Substr(QXAG_MSTYukoKigen,1,2) || '/' || Substr(QXAG_MSTYukoKigen,3,2),'yy/mm'),'yyyy/mm')) As MstYukoKigen,
	QXAG_MSTSozandaka,
	QXAG_MSTNobeZandaka,
	QXAG_MSTCashingZandaka
From
	QXAG_RealAuthoriLogT a,
	(Select QXA3_CenterID,QXA3_CAFISTuban,QXA3_CenterSkb,QXA3_TorihikiKbn,
         QXA3_ShoriYMD,QXA3_JyushinTime,QXA3_KigyouCd,QXA3_SubRangeKey,QXA3_NaibuKaiinNo,QXA3_Taisho,
         QXA3_MonitoringKbn,QXA3_ShoriTanto
         From QXA3_MonitoringT Where QXA3_ONBATCHKBN = 'R') b,
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSC') c,  --�v���d����ʂ̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSA') d,  --���͕��@�̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXA') e,  --�x���敪�̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX1') f,  --�����d����ʂ̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DS9') g,  --�����̖|��
	(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX2') h,   --�Ώ��i���u�j�̖|��
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S02') i,   --�����X�e�[�^�X�̖|��
	(Select QTA8_PRMCodeNo,QTA8_Mei From QTA8_CodeT Where QTA8_PRMCodeKbn='S03') j   --�J�[�h�X�e�[�^�X�̖|��

Where
	(QXAG_CenterID=QXA3_CenterID(+)
    And  QXAG_CAFISTuban=QXA3_CAFISTuban(+)
    And  QXAG_CenterShikibetu=QXA3_CenterSkb(+)
    And  QXAG_TorihikiKbn=QXA3_TorihikiKbn(+)
    And  QXAG_ShoriYMD=QXA3_ShoriYMD(+)
    And  QXAG_JyushinTime=QXA3_JyushinTime(+)
    And  QXAG_KigyouCd=QXA3_KigyouCd(+)
    And  QXAG_SubRangeKey=QXA3_SubRangeKey(+)
    And  QXAG_NaibuKaiinNo=QXA3_NaibuKaiinNo(+))
    And (RTrim(c.QSA2_PRMCodeNo(+))=Substr(QXAG_YokyuDenbunSbt,1,2))
    And (RTrim(d.QSA2_PRMCodeNo(+))=QXAG_CardEntryDev)
    And (RTrim(e.QSA2_PRMCodeNo(+))=QXAG_TorihikiKbn || QXAG_ShiharaiKbn)
    And (RTrim(f.QSA2_PRMCodeNo(+))=Substr(QXAG_OutouDenbunSbt,3,2))
    And (RTrim(g.QSA2_PRMCodeNo(+))=QXAG_TorihikiKbn)
    And (RTrim(h.QSA2_PRMCodeNo(+))=QXA3_Taisho)
    And (RTrim(i.QTA8_PRMCodeNo(+))=QXAG_MstStsKoza)
    And (RTrim(j.QTA8_PRMCodeNo(+))=QXAG_MstStsCard)
;
