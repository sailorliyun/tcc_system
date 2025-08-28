--   NAME
--    QVAD_SLD1700.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 自振入金合計表データ>
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
   INFILE * "FIX 177"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEG_NyukinT
   (
    QVEG_RecLen                                   CONSTANT 0,
    QVEG_Yobi                                     CONSTANT 0,
    QVEG_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEG_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEG_KigyouCd      POSITION(*)    CHAR(04),
    QVEG_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEG_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEG_TantouShaCd   POSITION(*)    CHAR(07),
    QVEG_SystemKbn     POSITION(*)    CHAR(01),
    QVEG_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEG_ProcessKbn    POSITION(*)    CHAR(01),
    QVEG_ProcessNo     POSITION(*)    CHAR(02),
    QVEG_ProgramNo     POSITION(*)    CHAR(02),
    QVEG_ModuleNo      POSITION(*)    CHAR(01),
    QVEG_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEG_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEG_YouBi         POSITION(*)    CHAR(01),
    QVEG_KyouShoriTime POSITION(*)    CHAR(08),
    QVEG_LOGShubetu    POSITION(*)    CHAR(01),
    QVEG_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEG_ShoriNo       POSITION(*)    CHAR(02),
    QVEG_ShoriYmd      POSITION(*)    DECIMAL(7),
    QVEG_HikiotosiYmd  POSITION(*)    DECIMAL(7),
    QVEG_IraiKensu     POSITION(*)    DECIMAL(7),
    QVEG_IraiKng       POSITION(*)    DECIMAL(11),
    QVEG_SumiKensu     POSITION(*)    DECIMAL(7),
    QVEG_SumiKng       POSITION(*)    DECIMAL(11),
    QVEG_FunouKensu    POSITION(*)    DECIMAL(7),
    QVEG_FunouKng      POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu1  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng1    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu2  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng2    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu3  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng3    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu4  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng4    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu5  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng5    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu7  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng7    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu8  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng8    POSITION(*)    DECIMAL(11),
    QVEG_FusokuKensu9  POSITION(*)    DECIMAL(7),
    QVEG_FusokuKng9    POSITION(*)    DECIMAL(11),
    QVEG_Fil           POSITION(*)    CHAR(02) 
   )
