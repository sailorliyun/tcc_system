--   NAME
--    QVAD_SLD4300.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 店間決済データ（総合斡旋分)決算>
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
   INTO TABLE QVF3_TenkessaiAMT 
   (
    QVF3_RecLen                                     CONSTANT 0,
    QVF3_Yobi                                       CONSTANT 0,
    QVF3_TanmatuMei      POSITION(*+04) CHAR(08),
    QVF3_TouzaiKbn       POSITION(*)    CHAR(01),
    QVF3_KigyouCd        POSITION(*)    CHAR(04),
    QVF3_JigyoubuCd      POSITION(*)    CHAR(02),
    QVF3_MiseCd          POSITION(*)    CHAR(02),
    QVF3_TantouSyaCd     POSITION(*)    CHAR(07),
    QVF3_SystemKbn       POSITION(*)    CHAR(01),
    QVF3_SubSystemKbn    POSITION(*)    CHAR(01),
    QVF3_ProcessKbn      POSITION(*)    CHAR(01),
    QVF3_ProcessNo       POSITION(*)    CHAR(02),
    QVF3_ProgramNo       POSITION(*)    CHAR(02),
    QVF3_ModuleNo        POSITION(*)    CHAR(01),
    QVF3_SyoriKbn        POSITION(*)    CHAR(01),
    QVF3_SyoriYmd        POSITION(*)    CHAR(07),
    QVF3_YouBi           POSITION(*)    CHAR(01),
    QVF3_SyoriTime       POSITION(*)    CHAR(08),
    QVF3_LOGSyubetu      POSITION(*)    CHAR(01),
    QVF3_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVF3_SyoriNo         POSITION(*)    CHAR(02),
    QVF3_SyukeiYmdFrom   POSITION(*)    DECIMAL(7),
    QVF3_SyukeiYmdTo     POSITION(*)    DECIMAL(7),
    QVF3_SaikenTZKbn     POSITION(*)    CHAR(01),
    QVF3_SaikenTenKbn    POSITION(*)    CHAR(01),
    QVF3_SaikenTenCD     POSITION(*)    CHAR(02),
    QVF3_SaimuTZKbn      POSITION(*)    CHAR(01),
    QVF3_SaimuTenKbn     POSITION(*)    CHAR(01),
    QVF3_SaimutenCD      POSITION(*)    CHAR(02),
    QVF3_UriageKng       POSITION(*)    DECIMAL(12),
    QVF3_BubikiKng       POSITION(*)    DECIMAL(12),
    QVF3_SyouhizeiModosi POSITION(*)    DECIMAL(12),
    QVF3_Dankeitesuuryou POSITION(*)    DECIMAL(12),
    QVF3_UriageKngKei    POSITION(*)    DECIMAL(12),
    QVF3_NyuukinKng      POSITION(*)    DECIMAL(12),
    QVF3_SeikyuuKng      POSITION(*)    DECIMAL(15),
    QVF3_SHanbaiDaikin   POSITION(*)    DECIMAL(12),
    QVF3_UkeKbn                                     CONSTANT 5
   )
