LOAD DATA
CHARACTERSET JA16SJIS
APPEND
PRESERVE BLANKS
INTO TABLE QTAH_RIYOUDTLBBKT
FIELDS TERMINATED BY "q"
(
       QTAH_PRMKigyouCd            CHAR, --  CHAR(4) NOT NULL,
       QTAH_PRMSubRangeKey         CHAR, --  CHAR(4) NOT NULL,
       QTAH_PRMNaibuKaiinNo        CHAR, --  CHAR(8) NOT NULL,
       QTAH_PRMTorihikiNo          CHAR, --  NUMBER(7) NOT NULL,
       QTAH_DenpyouNo              CHAR, --  CHAR(12) NOT NULL,
       QTAH_RecKbn                 CHAR, --  CHAR(1) NOT NULL,
       QTAH_SakujoKbn              CHAR, --  CHAR(1) NOT NULL,
       QTAH_DenpyouShubetsu        CHAR, --  CHAR(4) NOT NULL,
       QTAH_BatchNo                CHAR, --  NUMBER(4) NOT NULL,
       QTAH_GNOBatchNo             CHAR, --  NUMBER(4) NOT NULL,
       QTAH_GNODenSequence         CHAR, --  NUMBER(3) NOT NULL,
       QTAH_CardNo                 CHAR, --  CHAR(16) NOT NULL,
       QTAH_RiyouBi                DATE NULLIF(QTAH_RiyouBi="00000000"),
       QTAH_UketsukeBi             DATE NULLIF(QTAH_UketsukeBi="00000000"),
       QTAH_KeijyouBi              DATE NULLIF(QTAH_KeijyouBi="00000000"),
       QTAH_HasseiTen              CHAR, --  CHAR(2) NOT NULL,
       QTAH_SiharaiHoho            CHAR, --  CHAR(2) NOT NULL,
       QTAH_SeikyuKanji            CHAR, --  VARCHAR2(40) NULL,
       QTAH_ShuseiGaku             CHAR, --  NUMBER(11) NOT NULL,
       QTAH_BubikiShouhiZei        CHAR, --  NUMBER(9) NOT NULL,
       QTAH_ZeiKbn                 CHAR, --  CHAR(1) NOT NULL,
       QTAH_ChushutuSumiSign       CHAR, --  CHAR(1) NOT NULL,
       QTAH_HasseiRoute            CHAR, --  CHAR(1) NOT NULL,
       QTAH_DenNyuryokuTen         CHAR, --  CHAR(2) NOT NULL,
       QTAH_HostShoriYmd           CHAR, --  CHAR(8) NOT NULL,
       QTAH_HostShoriTime          CHAR, --  CHAR(6) NOT NULL,
       -- MOD 2011/09/01 1006060 IMZ YOSHIDA START
       -- QTAH_SvrKoushinYmd          DATE NULLIF(QTAH_SvrKoushinYmd="00000000")
       QTAH_SvrKoushinYmd          DATE NULLIF(QTAH_SvrKoushinYmd="00000000"),
       -- MOD 2011/09/01 1006060 IMZ YOSHIDA END
       -- ADD 2011/09/01 1006060 IMZ YOSHIDA START
       QTAH_URIBAKUKAKU            CHAR, -- CHAR(5) NOT NULL,
       QTAH_BUMON                  CHAR, -- CHAR(2) NOT NULL,
       QTAH_HINGUNCD               CHAR, -- CHAR(3) NOT NULL,
       QTAH_HGCHECKDIGIT           CHAR, -- CHAR(1) NOT NULL,
       QTAH_FLOOR                  CHAR, -- CHAR(1) NOT NULL,
       QTAH_HINMEICD               CHAR, -- CHAR(3) NOT NULL,
       QTAH_HMCHECKDIGIT           CHAR, -- CHAR(1) NOT NULL,
       QTAH_HINMEISAISAI           CHAR  -- CHAR(4) NOT NULL
       -- ADD 2011/09/01 1006060 IMZ YOSHIDA END
)
