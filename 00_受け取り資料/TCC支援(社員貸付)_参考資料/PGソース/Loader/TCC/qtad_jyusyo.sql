LOAD DATA
CHARACTERSET JA16SJIS
TRUNCATE
PRESERVE BLANKS
INTO TABLE QTA9_JUSHOM
fields terminated by "q"
(QTA9_PRMTodouhuken            CHAR,
 QTA9_PRMshikugun              CHAR,
 QTA9_PRMChouson               CHAR,
 QTA9_PRMAzaChoume             CHAR,
 QTA9_PRMCD                    CHAR,
 QTA9_YubinNo                  CHAR,
 QTA9_KanaKenMei               CHAR,
 QTA9_KanaJyushoMei            CHAR,
 QTA9_KJJYukoZenKeta           CHAR,
 QTA9_KJJTodohukenKeta         CHAR,
 QTA9_KJJSikugunKeta           CHAR,
 QTA9_KJJChousonKeta           CHAR,
 QTA9_KJJJyushoMei             CHAR,
 QTA9_YubinMark                CHAR,
 QTA9_TNGKanaTouroku           CHAR,
 QTA9_TNGKanjiTouroku          CHAR,
 QTA9_CH                       CHAR,
 QTA9_HostShoriYmd             CHAR, -- CHAR(8) NOT NULL,
 QTA9_HostShoriTime            CHAR, -- CHAR(6) NOT NULL,
 QTA9_SvrKoushinYmd            DATE NULLIF (QTA9_SvrKoushinYmd="00000000")  -- DATE NULL,
) 
