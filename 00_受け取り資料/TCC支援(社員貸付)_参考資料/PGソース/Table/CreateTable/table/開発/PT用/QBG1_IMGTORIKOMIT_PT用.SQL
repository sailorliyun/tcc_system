CREATE TABLE FIPPTUSER.QBG1_IMGTORIKOMIT
/*
******************************************************************************************
システム名		：TCC支援システム
サブシステム名		：入会管理
テーブル名		：JR旧Gイメージ取込み情報テーブル
作成日			：2013/01/25
作成者			：IMZ.Kemmochi
------------------------------------------------------------------------------------------
更新日付	案件/障害番号	氏名				理由
YYYYMMDD	XXXXXXXXXX		XXX.NNNNNNNNNN		XXXXXXXXXX
******************************************************************************************
*/
(
	QBG1_FILENM				VARCHAR2(100) NOT NULL,
	QBG1_SYORIBI				CHAR(8) NOT NULL,
	QBG1_SYORIBIEDANO			CHAR(3) NOT NULL,
	QBG1_HAKONO				VARCHAR2(20),
	QBG1_KAIINNO				VARCHAR2(20),
	QBG1_UKETUKENO				VARCHAR2(20),
	QBG1_JYOUTAI				CHAR(1) NOT NULL,
	QBG1_ERRORNAIYOU			VARCHAR2(100),
	QBG1_TOUROKUBI				DATE,
	QBG1_KOUSHINBI				DATE,
    PRIMARY KEY (QBG1_FILENM, QBG1_SYORIBI, QBG1_SYORIBIEDANO)
)
PCTFREE 10
PCTUSED 85
MAXTRANS 255
TABLESPACE FIPPT01
STORAGE(INITIAL 1M NEXT 64K MINEXTENTS 1 MAXEXTENTS 100 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING

