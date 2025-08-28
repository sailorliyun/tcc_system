LOAD DATA
CHARACTERSET JA16SJIS
APPEND
PRESERVE BLANKS
INTO TABLE QCS8_NAMESEARCHMS
FIELDS TERMINATED BY "q"
(
    QCS8_PRMCIFNo            CHAR, -- CHAR(8) NOT NULL,
    QCS8_Shimei              CHAR, -- VARCHAR2(30) NOT NULL,
    QCS8_TelNo               CHAR, -- CHAR(15) NOT NULL,
    QCS8_NOJUketsukeNo       CHAR, -- NUMBER(8) NOT NULL,
    QCS8_NOJNaibuKaiinNo     CHAR, -- CHAR(8) NOT NULL,
    QCS8_NOJBlackNo          CHAR, -- CHAR(8) NOT NULL,
    QCS8_HONSeinengappi      CHAR, -- NUMBER(8) NOT NULL,
    QCS8_HONMaeShimei        CHAR, -- VARCHAR2(30) NOT NULL,
    QCS8_HONMaeTelNo         CHAR, -- CHAR(15) NOT NULL,
    QCS8_HONSexCd            CHAR, -- NUMBER(1) NOT NULL,
    QCS8_HONSiyouKbn         CHAR, -- CHAR(1) NOT NULL,
    QCS8_KigyouCd            CHAR, -- CHAR(4) NOT NULL,
    QCS8_SubRangeKey         CHAR, -- CHAR(4) NULL,
    QCS8_HostShoriYmd        CHAR, -- CHAR(8) NOT NULL,
    QCS8_HostShoriTime       CHAR, -- CHAR(6) NOT NULL,
    QCS8_SvrKoushinYmd       DATE NULLIF (QCS8_SvrKoushinYmd="00000000")   --  DATE NULL,
)
