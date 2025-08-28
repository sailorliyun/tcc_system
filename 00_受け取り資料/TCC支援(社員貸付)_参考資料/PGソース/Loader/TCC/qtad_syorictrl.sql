LOAD DATA
CHARACTERSET JA16SJIS
TRUNCATE
PRESERVE BLANKS
INTO TABLE QTAA_SYORICTRLT
fields terminated by "q"
(QTAA_PRMRRecKbn               CHAR,
 QTAA_SKNSeikyuNen             CHAR,
 QTAA_SKNSeikyuTsuki           CHAR,
 QTAA_SMNSimeNen               CHAR,
 QTAA_SMNSimeTsuki             CHAR,
 QTAA_SMNSimeBi                CHAR,
 QTAA_SYNShoriNen              CHAR,
 QTAA_SYNShoriTsuki            CHAR,
 QTAA_SYNShoriBi               CHAR,
 QTAA_ShoriYouBi               CHAR,
 QTAA_KENKeijouNen             CHAR,
 QTAA_KENKeijouTsuki           CHAR,
 QTAA_KENKeijouBi              CHAR,
 QTAA_URISimeNen               CHAR,
 QTAA_URISimeTsuki             CHAR,
 QTAA_TATSimeNen               CHAR,
 QTAA_TATSimeTsuki             CHAR,
 QTAA_TATSimeBi                CHAR,
 QTAA_SeikyuJotaiFlg           CHAR,
 QTAA_HostShoriYmd             CHAR, -- CHAR(8) NOT NULL,
 QTAA_HostShoriTime            CHAR, -- CHAR(6) NOT NULL,
 QTAA_SvrKoushinYmd            DATE NULLIF (QTAA_SvrKoushinYmd="00000000") --  DATE NULL,
) 
