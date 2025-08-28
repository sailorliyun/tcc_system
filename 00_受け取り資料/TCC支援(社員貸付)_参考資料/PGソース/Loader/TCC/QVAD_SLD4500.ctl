--   NAME
--    QVAD_SLD4500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 関係会社決済データ 決算>
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
   INFILE * "FIX 122"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVF5_KkessaiMT 
   (
    QVF5_RecLen                                   CONSTANT 0,
    QVF5_Yobi                                     CONSTANT 0,
    QVF5_TanmatuMei    POSITION(*+04) CHAR(08),
    QVF5_TouzaiKbn     POSITION(*)    CHAR(01),
    QVF5_KigyouCd      POSITION(*)    CHAR(04),
    QVF5_JigyoubuCd    POSITION(*)    CHAR(02),
    QVF5_MiseCd        POSITION(*)    CHAR(02),
    QVF5_TantouSyaCd   POSITION(*)    CHAR(07),
    QVF5_SystemKbn     POSITION(*)    CHAR(01),
    QVF5_SubSystemKbn  POSITION(*)    CHAR(01),
    QVF5_ProcessKbn    POSITION(*)    CHAR(01),
    QVF5_ProcessNo     POSITION(*)    CHAR(02),
    QVF5_ProgramNo     POSITION(*)    CHAR(02),
    QVF5_ModuleNo      POSITION(*)    CHAR(01),
    QVF5_SyoriKbn      POSITION(*)    CHAR(01),
    QVF5_SyoriYmd      POSITION(*)    CHAR(07),
    QVF5_YouBi         POSITION(*)    CHAR(01),
    QVF5_SyoriTime     POSITION(*)    CHAR(08),
    QVF5_LOGSyubetu    POSITION(*)    CHAR(01),
    QVF5_SSubSystemKbn POSITION(*)    CHAR(01),
    QVF5_SyoriNo       POSITION(*)    CHAR(02),
    QVF5_SyukeiYmdFrom POSITION(*)    DECIMAL(7),
    QVF5_SyukeiYmdTo   POSITION(*)    DECIMAL(7),
    QVF5_SaikenTenCD   POSITION(*)    CHAR(02),
    QVF5_SaikenTenKbn  POSITION(*)    CHAR(01),
    QVF5_SaikenTZKbn   POSITION(*)    CHAR(01),
    QVF5_SaimutenCD    POSITION(*)    CHAR(02),
    QVF5_SaimuTenKbn   POSITION(*)    CHAR(01),
    QVF5_SaimuTZKbn    POSITION(*)    CHAR(01),
    QVF5_UriageKng     POSITION(*)    DECIMAL(12),
    QVF5_BubikiKng     POSITION(*)    DECIMAL(12),
    QVF5_BubikiMaeZei  POSITION(*)    DECIMAL(12),
    QVF5_ZeiModosiKng  POSITION(*)    DECIMAL(12),
    QVF5_KameitenTesuu POSITION(*)    DECIMAL(12),
    QVF5_Dankeitesuu   POSITION(*)    DECIMAL(12),
    QVF5_SeikyuuKng    POSITION(*)    DECIMAL(12),
    QVF5_UkeKbn                                   CONSTANT 5
   )
