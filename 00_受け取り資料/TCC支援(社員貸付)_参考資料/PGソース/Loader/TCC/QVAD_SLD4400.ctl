--   NAME
--    QVAD_SLD4400.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 店間決済合計データ 決算>
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
   INTO TABLE QVF4_TenkessaiGMT
   (
    QVF4_RecLen                                   CONSTANT 0,
    QVF4_Yobi                                     CONSTANT 0,
    QVF4_TanmatuMei    POSITION(*+04) CHAR(08),
    QVF4_TouzaiKbn     POSITION(*)    CHAR(01),
    QVF4_KigyouCd      POSITION(*)    CHAR(04),
    QVF4_JigyoubuCd    POSITION(*)    CHAR(02),
    QVF4_MiseCd        POSITION(*)    CHAR(02),
    QVF4_TantouSyaCd   POSITION(*)    CHAR(07),
    QVF4_SystemKbn     POSITION(*)    CHAR(01),
    QVF4_SubSystemKbn  POSITION(*)    CHAR(01),
    QVF4_ProcessKbn    POSITION(*)    CHAR(01),
    QVF4_ProcessNo     POSITION(*)    CHAR(02),
    QVF4_ProgramNo     POSITION(*)    CHAR(02),
    QVF4_ModuleNo      POSITION(*)    CHAR(01),
    QVF4_SyoriKbn      POSITION(*)    CHAR(01),
    QVF4_SyoriYmd      POSITION(*)    CHAR(07),
    QVF4_YouBi         POSITION(*)    CHAR(01),
    QVF4_SyoriTime     POSITION(*)    CHAR(08),
    QVF4_LOGSyubetu    POSITION(*)    CHAR(01),
    QVF4_SSubSystemKbn POSITION(*)    CHAR(01),
    QVF4_SyoriNo       POSITION(*)    CHAR(02),
    QVF4_TZKbn         POSITION(*)    CHAR(01),
    QVF4_TenKbn        POSITION(*)    CHAR(01),
    QVF4_TenCD         POSITION(*)    CHAR(02),
    QVF4_FromYmd       POSITION(*)    DECIMAL(7),
    QVF4_ToYmd         POSITION(*)    DECIMAL(7),
    QVF4_JTKSaikenKng  POSITION(*)    DECIMAL(15),
    QVF4_JTKSaimuKng   POSITION(*)    DECIMAL(15),
    QVF4_JTKKessaiKng  POSITION(*)    DECIMAL(15),
    QVF4_JTKGaisanKng  POSITION(*)    DECIMAL(15),
    QVF4_JTKSeisanKng  POSITION(*)    DECIMAL(15),
    QVF4_ASNSaikenKng  POSITION(*)    DECIMAL(15),
    QVF4_ASNSaimuKng   POSITION(*)    DECIMAL(15),
    QVF4_ASNKessaiKng  POSITION(*)    DECIMAL(15),
    QVF4_ASNGaisanKng  POSITION(*)    DECIMAL(15),
    QVF4_ASNSeisanKng  POSITION(*)    DECIMAL(15),
    QVF4_SouKessaiKng  POSITION(*)    DECIMAL(15),
    QVF4_UkeKbn                                   CONSTANT 5
   )
