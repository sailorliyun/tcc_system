--   NAME
--    QVAD_SLD0800.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 月分ずらしプルーフリストデータ>
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
   INFILE * "FIX 241"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE8_ZurasiT
   (
    QVE8_RecLen                                   CONSTANT 0,
    QVE8_Yobi                                     CONSTANT 0,
    QVE8_TanmatuMei    POSITION(*+04) CHAR(08),
    QVE8_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVE8_KigyouCd      POSITION(*)    CHAR(04),
    QVE8_JigyoubuCd    POSITION(*)    CHAR(02),
    QVE8_KyouMiseCd    POSITION(*)    CHAR(02),
    QVE8_TantouShaCd   POSITION(*)    CHAR(07),
    QVE8_SystemKbn     POSITION(*)    CHAR(01),
    QVE8_SubSystemKbn  POSITION(*)    CHAR(01),
    QVE8_ProcessKbn    POSITION(*)    CHAR(01),
    QVE8_ProcessNo     POSITION(*)    CHAR(02),
    QVE8_ProgramNo     POSITION(*)    CHAR(02),
    QVE8_ModuleNo      POSITION(*)    CHAR(01),
    QVE8_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVE8_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVE8_YouBi         POSITION(*)    CHAR(01),
    QVE8_KyouShoriTime POSITION(*)    CHAR(08),
    QVE8_LOGShubetu    POSITION(*)    CHAR(01),
    QVE8_SSubSystemKbn POSITION(*)    CHAR(01),
    QVE8_ShoriNo       POSITION(*)    CHAR(02),
    QVE8_Mise          POSITION(*)    CHAR(02),
    QVE8_58Kbn         POSITION(*)    CHAR(03),
    QVE8_KaiinNo       POSITION(*)    DECIMAL(16),
    QVE8_Shimei        POSITION(*)    CHAR(30),
    QVE8_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVE8_GNo           POSITION(*)    CHAR(07),
    QVE8_KaiTen        POSITION(*)    CHAR(02),
    QVE8_KaiYmd        POSITION(*)    DECIMAL(7),
    QVE8_Hinmei        POSITION(*)    CHAR(40),
    QVE8_KeijouYmd     POSITION(*)    DECIMAL(7),
    QVE8_RiyouKng      POSITION(*)    DECIMAL(11),
    QVE8_Kaisu         POSITION(*)    CHAR(03),
    QVE8_MaeKng        POSITION(*)    DECIMAL(11),
    QVE8_MAEKaisiYm    POSITION(*)    DECIMAL(5),
    QVE8_MAEOwariYm    POSITION(*)    DECIMAL(5),
    QVE8_MAESeikyu     POSITION(*)    DECIMAL(11),
    QVE8_MAEJuutou     POSITION(*)    DECIMAL(11),
    QVE8_MAENSeikyu    POSITION(*)    DECIMAL(11),
    QVE8_ATOKaisiYm    POSITION(*)    DECIMAL(5),
    QVE8_ATOOwariYm    POSITION(*)    DECIMAL(5),
    QVE8_ATOSeikyu     POSITION(*)    DECIMAL(11),
    QVE8_ATOJuutou     POSITION(*)    DECIMAL(11),
    QVE8_ATONSeikyu    POSITION(*)    DECIMAL(11),
    QVE8_Tantou        POSITION(*)    DECIMAL(7),
    QVE8_DenNo         POSITION(*)    CHAR(12)
   )
