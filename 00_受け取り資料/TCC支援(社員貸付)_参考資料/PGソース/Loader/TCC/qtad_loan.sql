LOAD DATA
CHARACTERSET JA16SJIS
TRUNCATE
PRESERVE BLANKS
INTO TABLE QTAI_LOANSBTT
fields terminated by "q"
(
    QTAI_PRMLoanShubetsu     CHAR, -- CHAR(5) NOT NULL,
    QTAI_ShouhinRankCd       CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIMiseRankCd1      CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIHanbaiRitsu1     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIJyuchuRitsu1     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIMiseRankCd2      CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIHanbaiRitsu2     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIJyuchuRitsu2     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIMiseRankCd3      CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIHanbaiRitsu3     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIJuchuRitsu3      CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIMiseRank4        CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIHanbaiRitsu4     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIJUchuRitsu4      CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIMiseRankCd5      CHAR, -- CHAR(1) NOT NULL,
    QTAI_TRIHanbaiRitsu5     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_TRIJuchuRitsu5      CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_SHOSiharaiHoho      CHAR, -- CHAR(2) NOT NULL,
    QTAI_SHOYakujoRiritsu    CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_SHOEntaiRiritsu     CHAR, -- NUMBER(4,2) NOT NULL,
    QTAI_SHOLoanMei          CHAR, -- VARCHAR2(40) NULL,
    QTAI_SHOKaisuKagen       CHAR, -- NUMBER(3) NOT NULL,
    QTAI_SHOKaisuJogen       CHAR, -- NUMBER(3) NOT NULL,
    QTAI_SHOYusigakuTani     CHAR, -- NUMBER(5) NOT NULL,
    QTAI_SHOHensaigaku       CHAR, -- NUMBER(5) NOT NULL,
    QTAI_SHOYusigakuJogen    CHAR, -- NUMBER(5) NOT NULL,
    QTAI_SHOBoHeiyoWariai    CHAR, -- NUMBER(3) NOT NULL,
    QTAI_SHOTorihikiKaisi    DATE NULLIF (QTAI_SHOTorihikiKaisi="00000000"), -- DATE NULL,
    QTAI_HostShoriYmd        CHAR, -- CHAR(8) NOT NULL,
    QTAI_HostShoriTime       CHAR, -- CHAR(6) NOT NULL,
    QTAI_SvrKoushinYmd       DATE NULLIF (QTAI_SvrKoushinYmd="00000000")  -- DATE NULL,
)
