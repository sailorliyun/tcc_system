--   NAME
--    QVAD_SLD1000.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 同口座預り金結果リストデータ>
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
   INFILE * "FIX 199"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE0_DouAzukariT
   (
    QVE0_RecLen                                      CONSTANT 0,
    QVE0_Yobi                                        CONSTANT 0,
    QVE0_TanmatuMei       POSITION(*+04) CHAR(08),
    QVE0_KyouTouzaiKbn    POSITION(*)    CHAR(01),
    QVE0_KigyouCd         POSITION(*)    CHAR(04),
    QVE0_JigyoubuCd       POSITION(*)    CHAR(02),
    QVE0_KyouMiseCd       POSITION(*)    CHAR(02),
    QVE0_TantouShaCd      POSITION(*)    CHAR(07),
    QVE0_SystemKbn        POSITION(*)    CHAR(01),
    QVE0_SubSystemKbn     POSITION(*)    CHAR(01),
    QVE0_ProcessKbn       POSITION(*)    CHAR(01),
    QVE0_ProcessNo        POSITION(*)    CHAR(02),
    QVE0_ProgramNo        POSITION(*)    CHAR(02),
    QVE0_ModuleNo         POSITION(*)    CHAR(01),
    QVE0_KyouShoriKbn     POSITION(*)    CHAR(01),
    QVE0_KyouShoriYmd     POSITION(*)    CHAR(07),
    QVE0_YouBi            POSITION(*)    CHAR(01),
    QVE0_KyouShoriTime    POSITION(*)    CHAR(08),
    QVE0_LOGShubetu       POSITION(*)    CHAR(01),
    QVE0_SSubSystemKbn    POSITION(*)    CHAR(01),
    QVE0_ShoriNo          POSITION(*)    CHAR(02),
    QVE0_MiseCd           POSITION(*)    CHAR(02),
    QVE0_58Kbn            POSITION(*)    CHAR(03),
    QVE0_KaiinNo          POSITION(*)    DECIMAL(16),
    QVE0_Shimei           POSITION(*)    CHAR(30),
    QVE0_NyukinYmd        POSITION(*)    DECIMAL(7),
    QVE0_FurikaeKng       POSITION(*)    DECIMAL(11),
    QVE0_IDOMiseiriKng    POSITION(*)    DECIMAL(11),
    QVE0_IDOTeijiHenKng   POSITION(*)    DECIMAL(11),
    QVE0_IDOShikyHenKng   POSITION(*)    DECIMAL(11),
    QVE0_IDOTomeokiKng    POSITION(*)    DECIMAL(11),
    QVE0_IDOHenMiseiriKng POSITION(*)    DECIMAL(11),
    QVE0_IDOHenTeijHenKng POSITION(*)    DECIMAL(11),
    QVE0_IDOHenSikyHenKng POSITION(*)    DECIMAL(11),
    QVE0_KEKMiseiriKng    POSITION(*)    DECIMAL(11),
    QVE0_KEKTeijiHenKng   POSITION(*)    DECIMAL(11),
    QVE0_KEKShikyHenKng   POSITION(*)    DECIMAL(11),
    QVE0_KEKTomeokiKng    POSITION(*)    DECIMAL(11),
    QVE0_KEKHenMiseiriKng POSITION(*)    DECIMAL(11),
    QVE0_KEKHenTeijHenKng POSITION(*)    DECIMAL(11),
    QVE0_KEKHenSikyHenKng POSITION(*)    DECIMAL(11),
    QVE0_HenkinYmd        POSITION(*)    DECIMAL(7)
   )
