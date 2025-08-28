--   NAME
--    QVAD_SLD1400.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 他口座預り金結果リストデータ>
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
   INFILE * "FIX 154"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVED_TaAzukariT
   (
    QVED_RecLen                                   CONSTANT 0,
    QVED_Yobi                                     CONSTANT 0,
    QVED_TanmatuMei    POSITION(*+04) CHAR(08),
    QVED_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVED_KigyouCd      POSITION(*)    CHAR(04),
    QVED_JigyoubuCd    POSITION(*)    CHAR(02),
    QVED_KyouMiseCd    POSITION(*)    CHAR(02),
    QVED_TantouShaCd   POSITION(*)    CHAR(07),
    QVED_SystemKbn     POSITION(*)    CHAR(01),
    QVED_SubSystemKbn  POSITION(*)    CHAR(01),
    QVED_ProcessKbn    POSITION(*)    CHAR(01),
    QVED_ProcessNo     POSITION(*)    CHAR(02),
    QVED_ProgramNo     POSITION(*)    CHAR(02),
    QVED_ModuleNo      POSITION(*)    CHAR(01),
    QVED_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVED_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVED_YouBi         POSITION(*)    CHAR(01),
    QVED_KyouShoriTime POSITION(*)    CHAR(08),
    QVED_LOGShubetu    POSITION(*)    CHAR(01),
    QVED_SSubSystemKbn POSITION(*)    CHAR(01),
    QVED_ShoriNo       POSITION(*)    CHAR(02),
    QVED_MiseCd        POSITION(*)    CHAR(02),
    QVED_58Kbn         POSITION(*)    CHAR(03),
    QVED_GoKaiinNo     POSITION(*)    DECIMAL(16),
    QVED_GoKaiinMei    POSITION(*)    CHAR(30),
    QVED_SeiKaiinNo    POSITION(*)    DECIMAL(16),
    QVED_SeiKaiinMei   POSITION(*)    CHAR(30),
    QVED_NyukinYmd     POSITION(*)    DECIMAL(7),
    QVED_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVED_FuriKng       POSITION(*)    DECIMAL(11)
   )
