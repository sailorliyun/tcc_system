--   NAME
--    QVAD_SLD4200.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 店間決済データ(受託分）決算 >
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
   INFILE * "FIX 130"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVF1_TenkessaiJMT 
   (
    QVF1_RecLen                                      CONSTANT 0,
    QVF1_Yobi                                        CONSTANT 0,
    QVF1_TanmatuMei       POSITION(*+04) CHAR(08),
    QVF1_TouzaiKbn        POSITION(*)    CHAR(01),
    QVF1_KigyouCd         POSITION(*)    CHAR(04),
    QVF1_JigyoubuCd       POSITION(*)    CHAR(02),
    QVF1_MiseCd           POSITION(*)    CHAR(02),
    QVF1_TantouSyaCd      POSITION(*)    CHAR(07),
    QVF1_SystemKbn        POSITION(*)    CHAR(01),
    QVF1_SubSystemKbn     POSITION(*)    CHAR(01),
    QVF1_ProcessKbn       POSITION(*)    CHAR(01),
    QVF1_ProcessNo        POSITION(*)    CHAR(02),
    QVF1_ProgramNo        POSITION(*)    CHAR(02),
    QVF1_ModuleNo         POSITION(*)    CHAR(01),
    QVF1_SyoriKbn         POSITION(*)    CHAR(01),
    QVF1_SyoriYmd         POSITION(*)    CHAR(07),
    QVF1_YouBi            POSITION(*)    CHAR(01),
    QVF1_SyoriTime        POSITION(*)    CHAR(08),
    QVF1_LOGSyubetu       POSITION(*)    CHAR(01),
    QVF1_SSubSystemKbn    POSITION(*)    CHAR(01),
    QVF1_SyoriNo          POSITION(*)    CHAR(02),
    QVF1_SyukeiYmdFrom    POSITION(*)    DECIMAL(7),
    QVF1_SyukeiYmdTo      POSITION(*)    DECIMAL(7),
    QVF1_SaikenTZKbn      POSITION(*)    CHAR(01),
    QVF1_SaikenTenKbn     POSITION(*)    CHAR(01),
    QVF1_SaikenTenCD      POSITION(*)    CHAR(02),
    QVF1_SaimuTZKbn       POSITION(*)    CHAR(01),
    QVF1_SaimuTenKbn      POSITION(*)    CHAR(01),
    QVF1_SaimutenCD       POSITION(*)    CHAR(02),
    QVF1_UriageKng        POSITION(*)    DECIMAL(12),
    QVF1_BubikiKng        POSITION(*)    DECIMAL(12),
    QVF1_SyouhizeiModosi  POSITION(*)    DECIMAL(12),
    QVF1_Dankeitesyuuryou POSITION(*)    DECIMAL(12),
    QVF1_UriageKngKei     POSITION(*)    DECIMAL(12),
    QVF1_NyuukinKng       POSITION(*)    DECIMAL(12),
    QVF1_SeikyuuKng       POSITION(*)    DECIMAL(15),
    QVF1_SHanbaiDaikin    POSITION(*)    DECIMAL(12),
    QVF1_UkeKbn                                      CONSTANT 5
   )
