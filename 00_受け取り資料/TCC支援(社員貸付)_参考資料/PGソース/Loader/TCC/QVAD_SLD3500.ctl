--   NAME
--    QVAD_SLD3500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン融資実行一覧表データ>
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
   INFILE * "FIX 157"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEY_YuusiT
   (
    QVEY_RecLen                                   CONSTANT 0,
    QVEY_Yobi                                     CONSTANT 0,
    QVEY_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEY_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEY_KigyouCd      POSITION(*)    CHAR(04),
    QVEY_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEY_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEY_TantouShaCd   POSITION(*)    CHAR(07),
    QVEY_SystemKbn     POSITION(*)    CHAR(01),
    QVEY_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEY_ProcessKbn    POSITION(*)    CHAR(01),
    QVEY_ProcessNo     POSITION(*)    CHAR(02),
    QVEY_ProgramNo     POSITION(*)    CHAR(02),
    QVEY_ModuleNo      POSITION(*)    CHAR(01),
    QVEY_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEY_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEY_YouBi         POSITION(*)    CHAR(01),
    QVEY_KyouShoriTime POSITION(*)    CHAR(08),
    QVEY_LOGShubetu    POSITION(*)    CHAR(01),
    QVEY_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEY_ShoriNo       POSITION(*)    CHAR(02),
    QVEY_YoteiYmd      POSITION(*)    DECIMAL(7),
    QVEY_KanriTen      POSITION(*)    CHAR(02),
    QVEY_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEY_HyouId        POSITION(*)    CHAR(08),
    QVEY_SyoriYmd      POSITION(*)    DECIMAL(7),
    QVEY_ToritugiTen   POSITION(*)    CHAR(02),
    QVEY_MousikomiYmd  POSITION(*)    DECIMAL(7),
    QVEY_UketukeNo     POSITION(*)    CHAR(09),
    QVEY_ShiMei        POSITION(*)    CHAR(30),
    QVEY_RoanMei       POSITION(*)    CHAR(22),
    QVEY_YuusiKng      POSITION(*)    DECIMAL(11)
   )
