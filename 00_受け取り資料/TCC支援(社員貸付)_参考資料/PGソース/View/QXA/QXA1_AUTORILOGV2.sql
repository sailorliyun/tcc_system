CREATE OR REPLACE VIEW QXA1_AUTORILOGV2 ( 
KAIINNO
,QXA1_SHORIYMD
,QXA1_JYUSHINTIME
,TORIHIKI
,YOKYU
,OUTOU
,NYURYOKU
,SHIHARAI
,HANTEI
,QXA1_ERRORCODE
,KINGAKU
,KAMEITENNO
,YUKOKIGEN
,QXA1_FDSSCORE
,QXA1_CENTERID
,QXA1_CAFISTUBAN
,QXA1_CENTERSHIKIBETU
,QXA1_TORIHIKIKBN
,QXA1_KIGYOUCD
,QXA1_SUBRANGEKEY
,QXA1_NAIBUKAIINNO
,QXA1_RIYOUDATETIME
,QXA1_YOKYUDENBUNSBT
,QXA1_GAIBUKAIINNO
,QXA1_KAMEITENNO
,QXA1_CARDENTRYDEV
,QXA1_KINGAKU
 ) AS 
Select 
--�\������
	Substr(QXA1_GaibuKaiinNo,1,4) || '-' || 
	Substr(QXA1_GaibuKaiinNo,5,4) || '-' || 
	Substr(QXA1_GaibuKaiinNo,9,4) || '-' || 
	Substr(QXA1_GaibuKaiinNo,13,4) As KaiinNo,
	QXA1_ShoriYMD,
	QXA1_JyushinTime,
	g.QSA2_Mei As Torihiki,
	c.QSA2_Mei As Yokyu,
--	f.QSA2_Mei As Outou,			--DEL 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<
-- Start  Of ADD 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<  ---------------------------------------------
	Decode(QXA1_ErrorCode,'CAF','����',
	   Decode(Substr(QXA1_SHIMUKEKAISHA,3,5),'50001',
               Decode(QXA1_DENBUNSOSHINKBN,'1',
                   Decode(Substr(QXA1_SHONINNO,2,1),'G','����',f.QSA2_Mei),
               f.QSA2_Mei),
	   f.QSA2_Mei)
	) As Outou,
-- Finish Of ADD 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<  ---------------------------------------------
	d.QSA2_Mei As Nyuryoku,
	e.QSA2_Mei As Shiharai,
	Decode(
		QXA1_ErrorCode,NULL,'OK',
--20010905����߲�đΉ��i����߲�Ď���OK�Ƃ���j
--			'NG'
            DECODE(SUBSTR(QXA1_ErrorCode,1,1),'P','OK','NG')
--20010905
	) As Hantei,
--	QXA1_ErrorCode					--DEL 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<
-- Start  Of ADD 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<  ---------------------------------------------
	Decode(Substr(QXA1_SHIMUKEKAISHA,3,5),'50001',
               Decode(QXA1_DENBUNSOSHINKBN,'1',
                      Decode(Substr(QXA1_SHONINNO,2,1),'G',Substr(QXA1_SHONINNO,1,1) || QXA1_ErrorCode,QXA1_ErrorCode),
               QXA1_ErrorCode),
	QXA1_ErrorCode
	) As QXA1_ErrorCode,
-- Finish Of ADD 2006.02.28 by ALPHA.YOKOYAMA >> ��g���s�I�[�\�����ʔ��f�Ή� <<  ---------------------------------------------
	To_Char(QXA1_Kingaku,'99,999,999') As Kingaku,
	Decode(
		Length(QXA1_KameitenNo),13,
			Substr(QXA1_KameitenNo,1,5) || '-' || 
			Substr(QXA1_KameitenNo,6,2) || '-' || 
			Substr(QXA1_KameitenNo,8,1) || '-' || 
			Substr(QXA1_KameitenNo,9,5),
			QXA1_KameitenNo
	) As KameitenNo,
--�L������99XX��To_Date�֐���yyyy/mm�ɕϊ������2099/XX�ɂȂ��Ă��܂��B
--����āA�N�iyy�j����T�O���������l���}�C�i�X�̏ꍇ�́A2000�N��Ƃ݂Ȃ��A0���̓v���X�̏ꍇ�́A1900�N��Ƃ݂Ȃ�
	Decode(QXA1_YukoKigen,Null,Null,
               Decode(QXA1_YukoKigen,'0000',Null,
--20010731�L��������Q�����f������50�N��70�N�ɕύX
--                        Decode(Sign(To_Number(Substr(QXA1_YukoKigen,1,2)) - 50),-1,'20' || Substr(QXA1_YukoKigen,1,2) || '/' || Substr(QXA1_YukoKigen,3,2),
                        Decode(Sign(To_Number(Substr(QXA1_YukoKigen,1,2)) - 70),-1,'20' || Substr(QXA1_YukoKigen,1,2) || '/' || Substr(QXA1_YukoKigen,3,2),
--20010731
                               '19' || Substr(QXA1_YukoKigen,1,2) || '/' || Substr(QXA1_YukoKigen,3,2)
                              )
                     )
	) As YukoKigen,
        QXA1_FDSScore,
--�\�����ڂ����܂�
--��\������
	QXA1_CenterID,
	QXA1_CAFISTuban,
	QXA1_CenterShikibetu,
	QXA1_TorihikiKbn,
	QXA1_KigyouCd,
	QXA1_SubRangeKey,
	QXA1_NaibuKaiinNo,
--��\�����ڂ����܂�
--������������
	QXA1_RIYOUDATETIME,	
	QXA1_YOKYUDENBUNSBT,
	QXA1_GAIBUKAIINNO,
	QXA1_KAMEITENNO,
	QXA1_CARDENTRYDEV,
	QXA1_Kingaku
From 
QXA1_AuthoriLogT a,
(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSC') c,
(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DSA') d,
(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DXA') e,
(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DX1') f,
(Select QSA2_PRMCodeNo,QSA2_Mei From QSA2_SCodeT Where QSA2_PRMCodeKbn='DS9') g
Where 
(RTrim(c.QSA2_PRMCodeNo(+))=Substr(QXA1_YokyuDenbunSbt,1,2)) And 
(RTrim(d.QSA2_PRMCodeNo(+))=QXA1_CardEntryDev) And 
(RTrim(e.QSA2_PRMCodeNo(+))=QXA1_TorihikiKbn || QXA1_ShiharaiKbn) And 
(RTrim(f.QSA2_PRMCodeNo(+))=Substr(QXA1_OutouDenbunSbt,3,2)) And 
(RTrim(g.QSA2_PRMCodeNo(+))=QXA1_TorihikiKbn) 
/
SHOW ERRORS;
