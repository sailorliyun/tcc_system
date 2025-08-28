--   NAME
--    QVAD_SLD3300.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン完済通知書データ>
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
   INFILE * "FIX 318"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEW_KansaiT
   (
    QVEW_RecLen                                   CONSTANT 0,
    QVEW_Yobi                                     CONSTANT 0,
    QVEW_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEW_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEW_KigyouCd      POSITION(*)    CHAR(04),
    QVEW_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEW_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEW_TantouShaCd   POSITION(*)    CHAR(07),
    QVEW_SystemKbn     POSITION(*)    CHAR(01),
    QVEW_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEW_ProcessKbn    POSITION(*)    CHAR(01),
    QVEW_ProcessNo     POSITION(*)    CHAR(02),
    QVEW_ProgramNo     POSITION(*)    CHAR(02),
    QVEW_ModuleNo      POSITION(*)    CHAR(01),
    QVEW_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEW_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEW_YouBi         POSITION(*)    CHAR(01),
    QVEW_KyouShoriTime POSITION(*)    CHAR(08),
    QVEW_LOGShubetu    POSITION(*)    CHAR(01),
    QVEW_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEW_ShoriNo       POSITION(*)    CHAR(02),
    QVEW_HakkouYmd     POSITION(*)    DECIMAL(7),
    QVEW_YubinNo       POSITION(*)    CHAR(08),
    QVEW_Jyusho1       POSITION(*)    CHAR(30),
    QVEW_Jyusho2       POSITION(*)    CHAR(40),
    QVEW_Jyusho3       POSITION(*)    CHAR(40),
    QVEW_Jyusho4       POSITION(*)    CHAR(40),
    QVEW_ShiMei        POSITION(*)    CHAR(30),
    QVEW_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEW_RoanMei       POSITION(*)    CHAR(40),
    QVEW_YuusiYmd      POSITION(*)    DECIMAL(7),
    QVEW_YuusiKng      POSITION(*)    DECIMAL(9),
    QVEW_KansaiYmd     POSITION(*)    DECIMAL(7),
    QVEW_SeiriNo       POSITION(*)    CHAR(05)
   )
