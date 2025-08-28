--   NAME
--    QVAD_SLD3400.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン実行一覧表データ>
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
   INFILE * "FIX 170"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEX_JikkouT
   (
    QVEX_RecLen                                   CONSTANT 0,
    QVEX_Yobi                                     CONSTANT 0,
    QVEX_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEX_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEX_KigyouCd      POSITION(*)    CHAR(04),
    QVEX_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEX_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEX_TantouShaCd   POSITION(*)    CHAR(07),
    QVEX_SystemKbn     POSITION(*)    CHAR(01),
    QVEX_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEX_ProcessKbn    POSITION(*)    CHAR(01),
    QVEX_ProcessNo     POSITION(*)    CHAR(02),
    QVEX_ProgramNo     POSITION(*)    CHAR(02),
    QVEX_ModuleNo      POSITION(*)    CHAR(01),
    QVEX_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEX_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEX_YouBi         POSITION(*)    CHAR(01),
    QVEX_KyouShoriTime POSITION(*)    CHAR(08),
    QVEX_LOGShubetu    POSITION(*)    CHAR(01),
    QVEX_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEX_ShoriNo       POSITION(*)    CHAR(02),
    QVEX_RoanKbn       POSITION(*)    CHAR(01),
    QVEX_KanriTen      POSITION(*)    CHAR(02),
    QVEX_KeijouYmd     POSITION(*)    DECIMAL(7),
    QVEX_ToritugiTen   POSITION(*)    CHAR(02),
    QVEX_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEX_HyouId        POSITION(*)    CHAR(08),
    QVEX_RoanMei       POSITION(*)    CHAR(22),
    QVEX_SyoriYmd      POSITION(*)    DECIMAL(7),
    QVEX_Syukei1Ymd    POSITION(*)    DECIMAL(7),
    QVEX_Syukei2Ymd    POSITION(*)    DECIMAL(7),
    QVEX_JikkouYmd     POSITION(*)    DECIMAL(7),
    QVEX_MousikomiYmd  POSITION(*)    DECIMAL(7),
    QVEX_UketukeNo     POSITION(*)    CHAR(09),
    QVEX_ShiMei        POSITION(*)    CHAR(30),
    QVEX_YuusiKng      POSITION(*)    DECIMAL(11)
   )
