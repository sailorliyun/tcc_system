--   NAME
--    QVAD_SLD3600.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン未承認一覧表データ>
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
   INFILE * "FIX 158"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEZ_MisyouninT
   (
    QVEZ_RecLen                                   CONSTANT 0,
    QVEZ_Yobi                                     CONSTANT 0,
    QVEZ_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEZ_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEZ_KigyouCd      POSITION(*)    CHAR(04),
    QVEZ_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEZ_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEZ_TantouShaCd   POSITION(*)    CHAR(07),
    QVEZ_SystemKbn     POSITION(*)    CHAR(01),
    QVEZ_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEZ_ProcessKbn    POSITION(*)    CHAR(01),
    QVEZ_ProcessNo     POSITION(*)    CHAR(02),
    QVEZ_ProgramNo     POSITION(*)    CHAR(02),
    QVEZ_ModuleNo      POSITION(*)    CHAR(01),
    QVEZ_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEZ_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEZ_YouBi         POSITION(*)    CHAR(01),
    QVEZ_KyouShoriTime POSITION(*)    CHAR(08),
    QVEZ_LOGShubetu    POSITION(*)    CHAR(01),
    QVEZ_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEZ_ShoriNo       POSITION(*)    CHAR(02),
    QVEZ_RoanKbn       POSITION(*)    CHAR(01),
    QVEZ_KanriTen      POSITION(*)    CHAR(02),
    QVEZ_MousikomiYmd  POSITION(*)    DECIMAL(7),
    QVEZ_ToritugiTen   POSITION(*)    CHAR(02),
    QVEZ_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEZ_HyouId        POSITION(*)    CHAR(08),
    QVEZ_RoanMei       POSITION(*)    CHAR(22),
    QVEZ_SyoriYmd      POSITION(*)    DECIMAL(7),
    QVEZ_KibouYmd      POSITION(*)    DECIMAL(7),
    QVEZ_UketukeNo     POSITION(*)    CHAR(09),
    QVEZ_ShiMei        POSITION(*)    CHAR(30),
    QVEZ_YuusiKng      POSITION(*)    DECIMAL(11)
   )
