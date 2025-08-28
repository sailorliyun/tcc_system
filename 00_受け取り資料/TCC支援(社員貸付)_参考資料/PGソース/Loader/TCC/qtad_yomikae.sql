LOAD DATA
CHARACTERSET JA16SJIS
TRUNCATE
PRESERVE BLANKS
INTO TABLE QTAD_10TO16T
fields terminated by "q"
(
 QTAD_PRMKyukozaTenCd          CHAR,
 QTAD_PRMKyukozaOtoCd          CHAR,
 QTAD_PRMKyukozaRenban         CHAR,
 QTAD_PRMKyukozaEdaban         CHAR,
 QTAD_SKBIsoKigyouCd           CHAR,
 QTAD_SKBRyutsuKigyoCd         CHAR,
 QTAD_SKBRenban                CHAR,
 QTAD_SKBEdaban                CHAR,
 QTAD_YNGNenTsukiNen           CHAR,
 QTAD_YNGNentsukiTsuki         CHAR,
 QTAD_YNPNengappiNen           CHAR,
 QTAD_YNPNengappiTsuki         CHAR,
 QTAD_YNPNengappiHi            CHAR,
 QTAD_Jiyu                     CHAR,
 QTAD_HostShoriYmd             CHAR, -- CHAR(8) NOT NULL,
 QTAD_HostShoriTime            CHAR, -- CHAR(6) NOT NULL,
 QTAD_SvrKoushinYmd            CHAR NULLIF (QTAD_SvrKoushinYmd="00000000")  -- DATE NULL,
) 
