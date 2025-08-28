--   NAME
--    QVAD_SLD1100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 職員月賦天引修正ログデータ>
--   RETURNS
--
--   NOTES
--
--   MODIFIED   (MM/DD/YY)
--               04/01/99 -  作成
--
--
--OPTIONS
--(DIRECT=TRUE)

LOAD DATA
   INFILE * "FIX 123"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEA_GeppuT
   (
    QVEA_RecLen                                   CONSTANT 0,
    QVEA_Yobi                                     CONSTANT 0,
    QVEA_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEA_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEA_KigyouCd      POSITION(*)    CHAR(04),
    QVEA_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEA_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEA_TantouShaCd   POSITION(*)    CHAR(07),
    QVEA_SystemKbn     POSITION(*)    CHAR(01),
    QVEA_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEA_ProcessKbn    POSITION(*)    CHAR(01),
    QVEA_ProcessNo     POSITION(*)    CHAR(02),
    QVEA_ProgramNo     POSITION(*)    CHAR(02),
    QVEA_ModuleNo      POSITION(*)    CHAR(01),
    QVEA_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEA_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEA_YouBi         POSITION(*)    CHAR(01),
    QVEA_KyouShoriTime POSITION(*)    CHAR(08),
    QVEA_LOGShubetu    POSITION(*)    CHAR(01),
    QVEA_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEA_ShoriNo       POSITION(*)    CHAR(02),
    QVEA_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEA_Shimei        POSITION(*)    CHAR(30),
    QVEA_ShozokuTen    POSITION(*)    CHAR(02),
    QVEA_BumonCd       POSITION(*)    CHAR(06),
    QVEA_YoteiKng      POSITION(*)    DECIMAL(9),
    QVEA_TenbikiKng    POSITION(*)    DECIMAL(9),
    QVEA_ShuseiYmd     POSITION(*)    DECIMAL(7),
    QVEA_YobiKng       POSITION(*)    DECIMAL(9)
   )
