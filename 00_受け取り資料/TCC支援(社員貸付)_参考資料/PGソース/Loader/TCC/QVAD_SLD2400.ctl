--   NAME
--    QVAD_SLD2400.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 償還明細件数表日次データ>
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
   INFILE * "FIX 156"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEO_SyoukanKensuT
   (
    QVEO_RecLen                                   CONSTANT 0,
    QVEO_Yobi                                     CONSTANT 0,
    QVEO_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEO_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEO_KigyouCd      POSITION(*)    CHAR(04),
    QVEO_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEO_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEO_TantouShaCd   POSITION(*)    CHAR(07),
    QVEO_SystemKbn     POSITION(*)    CHAR(01),
    QVEO_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEO_ProcessKbn    POSITION(*)    CHAR(01),
    QVEO_ProcessNo     POSITION(*)    CHAR(02),
    QVEO_ProgramNo     POSITION(*)    CHAR(02),
    QVEO_ModuleNo      POSITION(*)    CHAR(01),
    QVEO_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEO_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEO_YouBi         POSITION(*)    CHAR(01),
    QVEO_KyouShoriTime POSITION(*)    CHAR(08),
    QVEO_LOGShubetu    POSITION(*)    CHAR(01),
    QVEO_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEO_ShoriNo       POSITION(*)    CHAR(02),
    QVEO_CenterCd      POSITION(*)    CHAR(02),
    QVEO_Centermei     POSITION(*)    CHAR(40),
    QVEO_ShoriYmd      POSITION(*)    DECIMAL(7),
    QVEO_SakuseiYmd    POSITION(*)    DECIMAL(7),
    QVEO_RoanMei       POSITION(*)    CHAR(40),
    QVEO_RoanKbn       POSITION(*)    CHAR(01),
    QVEO_Tuusu         POSITION(*)    DECIMAL(7),
    QVEO_Maisu         POSITION(*)    DECIMAL(7)
   )
