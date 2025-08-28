--   NAME
--    QVAD_SLD1900.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 売掛金銀行別集計表データ>
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
   INFILE * "FIX 125"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEI_UrikakeKeiT
   (
    QVEI_RecLen                                   CONSTANT 0,
    QVEI_Yobi                                     CONSTANT 0,
    QVEI_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEI_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEI_KigyouCd      POSITION(*)    CHAR(04),
    QVEI_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEI_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEI_TantouShaCd   POSITION(*)    CHAR(07),
    QVEI_SystemKbn     POSITION(*)    CHAR(01),
    QVEI_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEI_ProcessKbn    POSITION(*)    CHAR(01),
    QVEI_ProcessNo     POSITION(*)    CHAR(02),
    QVEI_ProgramNo     POSITION(*)    CHAR(02),
    QVEI_ModuleNo      POSITION(*)    CHAR(01),
    QVEI_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEI_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEI_YouBi         POSITION(*)    CHAR(01),
    QVEI_KyouShoriTime POSITION(*)    CHAR(08),
    QVEI_LOGShubetu    POSITION(*)    CHAR(01),
    QVEI_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEI_ShoriNo       POSITION(*)    CHAR(02),
    QVEI_MiseCd        POSITION(*)    CHAR(02),
    QVEI_GikouCd       POSITION(*)    CHAR(04),
    QVEI_GinkouMei     POSITION(*)    CHAR(30),
    QVEI_IraiKensu     POSITION(*)    DECIMAL(5),
    QVEI_IraiKng       POSITION(*)    DECIMAL(11),
    QVEI_SumiKensu     POSITION(*)    DECIMAL(5),
    QVEI_SumiKng       POSITION(*)    DECIMAL(11),
    QVEI_FunouKensu    POSITION(*)    DECIMAL(5),
    QVEI_FunouKng      POSITION(*)    DECIMAL(11),
    QVEI_HenreiMark    POSITION(*)    CHAR(01),
    QVEI_HikiotosiYmd  POSITION(*)    DECIMAL(7) 
   )
