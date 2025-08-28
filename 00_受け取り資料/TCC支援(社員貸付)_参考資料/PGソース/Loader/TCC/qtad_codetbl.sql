LOAD DATA
CHARACTERSET JA16SJIS
TRUNCATE
PRESERVE BLANKS
INTO TABLE QTA8_CODET
fields terminated by "q"
(QTA8_PRMCodeKbn               CHAR,
 QTA8_PRMCodeNo                CHAR,
 QTA8_Mei                      CHAR,
 QTA8_SuuchiBu                 CHAR,
 QTA8_HostShoriYmd             CHAR, -- CHAR(8) NOT NULL,
 QTA8_HostShoriTime            CHAR, -- CHAR(6) NOT NULL,
 QTA8_SvrKoushinYmd            DATE NULLIF (QTA8_SvrKoushinYmd="00000000")  -- DATE NULL,
)
