--   NAME
--    QVAD_SLD2600.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 償還明細書月別データ>
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
   INFILE * "FIX 137"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEQ_SyoukanTukiT
   (
    QVEQ_RecLen                                   CONSTANT 0,
    QVEQ_Yobi                                     CONSTANT 0,
    QVEQ_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEQ_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEQ_KigyouCd      POSITION(*)    CHAR(04),
    QVEQ_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEQ_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEQ_TantouShaCd   POSITION(*)    CHAR(07),
    QVEQ_SystemKbn     POSITION(*)    CHAR(01),
    QVEQ_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEQ_ProcessKbn    POSITION(*)    CHAR(01),
    QVEQ_ProcessNo     POSITION(*)    CHAR(02),
    QVEQ_ProgramNo     POSITION(*)    CHAR(02),
    QVEQ_ModuleNo      POSITION(*)    CHAR(01),
    QVEQ_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEQ_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEQ_YouBi         POSITION(*)    CHAR(01),
    QVEQ_KyouShoriTime POSITION(*)    CHAR(08),
    QVEQ_LOGShubetu    POSITION(*)    CHAR(01),
    QVEQ_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEQ_ShoriNo       POSITION(*)    CHAR(02),
    QVEQ_KigyouCd_2    POSITION(*)    CHAR(04),
    QVEQ_SubRange      POSITION(*)    CHAR(04),
    QVEQ_NaibuKaiinNo  POSITION(*)    CHAR(08),
    QVEQ_UketukeNo     POSITION(*)    CHAR(08),
    QVEQ_LoanSyubetu   POSITION(*)    CHAR(05),
    QVEQ_SeikyuYm      POSITION(*)    CHAR(06),
    QVEQ_GanKng        POSITION(*)    DECIMAL(11),
    QVEQ_TesuuKng      POSITION(*)    DECIMAL(9),
    QVEQ_BonusGanKng   POSITION(*)    DECIMAL(11),
    QVEQ_BonusTesuuKng POSITION(*)    DECIMAL(9),
    QVEQ_Yobi_2        POSITION(*)    CHAR(23)
   )
