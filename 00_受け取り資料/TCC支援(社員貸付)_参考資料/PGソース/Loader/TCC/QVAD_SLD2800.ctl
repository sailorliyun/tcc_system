--   NAME
--    QVAD_SLD2800.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: キャッシング取消追加リストデータ>
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
   INFILE * "FIX 168"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVER_CashT
   (
    QVER_RecLen                                   CONSTANT 0,
    QVER_Yobi                                     CONSTANT 0,
    QVER_TanmatuMei    POSITION(*+04) CHAR(08),
    QVER_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVER_KigyouCd      POSITION(*)    CHAR(04),
    QVER_JigyoubuCd    POSITION(*)    CHAR(02),
    QVER_KyouMiseCd    POSITION(*)    CHAR(02),
    QVER_TantouShaCd   POSITION(*)    CHAR(07),
    QVER_SystemKbn     POSITION(*)    CHAR(01),
    QVER_SubSystemKbn  POSITION(*)    CHAR(01),
    QVER_ProcessKbn    POSITION(*)    CHAR(01),
    QVER_ProcessNo     POSITION(*)    CHAR(02),
    QVER_ProgramNo     POSITION(*)    CHAR(02),
    QVER_ModuleNo      POSITION(*)    CHAR(01),
    QVER_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVER_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVER_YouBi         POSITION(*)    CHAR(01),
    QVER_KyouShoriTime POSITION(*)    CHAR(08),
    QVER_LOGShubetu    POSITION(*)    CHAR(01),
    QVER_SSubSystemKbn POSITION(*)    CHAR(01),
    QVER_ShoriNo       POSITION(*)    CHAR(02),
    QVER_MiseCd        POSITION(*)    CHAR(02),
    QVER_58Kbn         POSITION(*)    CHAR(03),
    QVER_KaiinNo       POSITION(*)    DECIMAL(16),
    QVER_Shimei        POSITION(*)    CHAR(30),
    QVER_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVER_JyoutaiMei    POSITION(*)    CHAR(06),
    QVER_Shiharai      POSITION(*)    CHAR(02),
    QVER_TorihikiKng   POSITION(*)    DECIMAL(11),
    QVER_RisokuKng     POSITION(*)    DECIMAL(9),
    QVER_TorihikiYmd   POSITION(*)    DECIMAL(7),
    QVER_KeijouYmd     POSITION(*)    DECIMAL(7),
    QVER_CDTanmatu     POSITION(*)    CHAR(08),
    QVER_Uriba         POSITION(*)    CHAR(06),
    QVER_Mise          POSITION(*)    CHAR(02),
    QVER_AtukaiNo      POSITION(*)    CHAR(08),
    QVER_TSyoriYmd     POSITION(*)    DECIMAL(7),
    QVER_TKeijuoYmd    POSITION(*)    DECIMAL(7),
    QVER_TantouCd      POSITION(*)    DECIMAL(7)
   )
