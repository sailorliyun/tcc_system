--   NAME
--    QVAD_SLD2200.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 請求書件数表データ          >
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
   INFILE * "FIX 79"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEM_SeiKensuT
   (
    QVEM_RecLen                                   CONSTANT 0,
    QVEM_Yobi                                     CONSTANT 0,
    QVEM_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEM_TouzaiKbn     POSITION(*)    CHAR(01),
    QVEM_KigyouCd      POSITION(*)    CHAR(04),
    QVEM_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEM_MiseCd        POSITION(*)    CHAR(02),
    QVEM_TantouSyaCd   POSITION(*)    CHAR(07),
    QVEM_SystemKbn     POSITION(*)    CHAR(01),
    QVEM_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEM_ProcessKbn    POSITION(*)    CHAR(01),
    QVEM_ProcessNo     POSITION(*)    CHAR(02),
    QVEM_ProgramNo     POSITION(*)    CHAR(02),
    QVEM_ModuleNo      POSITION(*)    CHAR(01),
    QVEM_SyoriKbn      POSITION(*)    CHAR(01),
    QVEM_SyoriYmd      POSITION(*)    CHAR(07),
    QVEM_YouBi         POSITION(*)    CHAR(01),
    QVEM_SyoriTime     POSITION(*)    CHAR(08),
    QVEM_LOGSyubetu    POSITION(*)    CHAR(01),
    QVEM_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEM_SyoriNo       POSITION(*)    CHAR(02),
    QVEM_SeikyuYm      POSITION(*)    DECIMAL(5),
    QVEM_Syukei58      POSITION(*)    CHAR(03),
    QVEM_EigyouTenCd   POSITION(*)    CHAR(02),
    QVEM_Tomeoki       POSITION(*)    CHAR(01),
    QVEM_SeikyuKensu   POSITION(*)    DECIMAL(6),
    QVEM_SeikyuKng     POSITION(*)    DECIMAL(11),
    QVEM_UkeKbn                                   CONSTANT '2' 
   )
