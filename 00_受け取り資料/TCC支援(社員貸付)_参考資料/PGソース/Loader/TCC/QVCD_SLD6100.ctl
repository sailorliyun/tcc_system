--   NAME
--    QVCD_SLD6100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン立替金決済データ 9日用>
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
   INFILE * "FIX 178"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVH0_LoanDT
   (
    QVH0_RecLen                                   CONSTANT 0,
    QVH0_Yobi                                     CONSTANT 0,
    QVH0_TanmatuMei    POSITION(*+04) CHAR(08),
    QVH0_TouzaiKbn     POSITION(*)    CHAR(01),
    QVH0_KigyouCd      POSITION(*)    CHAR(04),
    QVH0_JigyoubuCd    POSITION(*)    CHAR(02),
    QVH0_MiseCd        POSITION(*)    CHAR(02),
    QVH0_TantouSyaCd   POSITION(*)    CHAR(07),
    QVH0_SystemKbn     POSITION(*)    CHAR(01),
    QVH0_SubSystemKbn  POSITION(*)    CHAR(01),
    QVH0_ProcessKbn    POSITION(*)    CHAR(01),
    QVH0_ProcessNo     POSITION(*)    CHAR(02),
    QVH0_ProgramNo     POSITION(*)    CHAR(02),
    QVH0_ModuleNo      POSITION(*)    CHAR(01),
    QVH0_SyoriKbn      POSITION(*)    CHAR(01),
    QVH0_SyoriYmd      POSITION(*)    CHAR(07),
    QVH0_YouBi         POSITION(*)    CHAR(01),
    QVH0_SyoriTime     POSITION(*)    CHAR(08),
    QVH0_LOGSyubetu    POSITION(*)    CHAR(01),
    QVH0_SSubSystemKbn POSITION(*)    CHAR(01),
    QVH0_SyoriNo       POSITION(*)    CHAR(02),
    QVH0_HasseiTenCD   POSITION(*)    CHAR(02),
    QVH0_KihonRyoukin  POSITION(*)    DECIMAL(07), 
    QVH0_SyukeiYmdFrom POSITION(*)    DECIMAL(07),
    QVH0_SyukeiYmdTo   POSITION(*)    DECIMAL(07),
    QVH0_RiyouYmd      POSITION(*)    DECIMAL(04),
    QVH0_KeiJouYmd     POSITION(*)    DECIMAL(04),
    QVH0_KaiinNo       POSITION(*)    DECIMAL(16),

    QVH0_Shimei        POSITION(*)    CHAR(30),
    QVH0_ShiharaiSyousai POSITION(*)  CHAR(02),
    QVH0_RoanSyubetu   POSITION(*)    CHAR(05),
    QVH0_ShouhinMei    POSITION(*)    CHAR(40),
    QVH0_Kaisu         POSITION(*)    ZONED(03),
    QVH0_ToriatukaiKng POSITION(*)    DECIMAL(11),
    QVH0_JyuteRitu     POSITION(*)    DECIMAL(4,2),
    QVH0_HanteRitu     POSITION(*)    DECIMAL(4,2),
    QVH0_UkeKbn        CONSTANT 5
   )
