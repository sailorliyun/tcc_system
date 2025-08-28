LOAD DATA
CHARACTERSET JA16SJIS
APPEND
PRESERVE BLANKS
INTO TABLE QTAS_NAMESEARCHMS
fields terminated by "q"
(
QTAS_PRMCIFNo           CHAR,  --  CHAR(8) NOT NULL,
QTAS_Shimei             CHAR,  --  VARCHAR2(30) NOT NULL,
QTAS_TelNo              CHAR,  --  CHAR(15) NOT NULL,
QTAS_NOJUketsukeNo      CHAR, --  NUMBER(8) NOT NULL,
QTAS_NOJNaibuKaiinNo    CHAR,  --  CHAR(8) NOT NULL,
QTAS_NOJBlackNo         CHAR,  --  CHAR(8) NOT NULL,
QTAS_HONSeinengappi     CHAR, --  NUMBER(8) NOT NULL,
QTAS_HONMaeShimei       CHAR,  --  VARCHAR2(30) NOT NULL,
QTAS_HONMaeTelNo        CHAR,  --  CHAR(15) NOT NULL,
QTAS_HONSexCd           CHAR, --  NUMBER(1) NOT NULL,
QTAS_HONSiyouKbn        CHAR,  --  CHAR(1) NOT NULL,
QTAS_KigyouCd           CHAR,  --  CHAR(4) NOT NULL,
QTAS_SubRangeKey        CHAR,  --  CHAR(4) NULL,
QTAS_HostShoriYmd       CHAR,  --  CHAR(8) NOT NULL,
QTAS_HostShoriTime      CHAR,  --  CHAR(6) NOT NULL,
QTAS_SvrKoushinYmd      DATE NULLIF (QTAS_SvrKoushinYmd="00000000")   --  DATE NULL,
)
