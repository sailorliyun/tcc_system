--   NAME
--    QVAD_SLD0100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 事故カードデータ>
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
   INFILE * "FIX 233"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE1_JikoT
   (
    QVE1_RecLen                                    CONSTANT 0,
    QVE1_Yobi                                      CONSTANT 0,
    QVE1_TanmatuMei     POSITION(*+04) CHAR(08),
    QVE1_KyouTouzaiKbn  POSITION(*)    CHAR(01),
    QVE1_KigyouCd       POSITION(*)    CHAR(04),
    QVE1_JigyoubuCd     POSITION(*)    CHAR(02),
    QVE1_KyouMiseCd     POSITION(*)    CHAR(02),
    QVE1_TantouShaCd    POSITION(*)    CHAR(07),
    QVE1_SystemKbn      POSITION(*)    CHAR(01),
    QVE1_SubSystemKbn   POSITION(*)    CHAR(01),
    QVE1_ProcessKbn     POSITION(*)    CHAR(01),
    QVE1_ProcessNo      POSITION(*)    CHAR(02),
    QVE1_ProgramNo      POSITION(*)    CHAR(02),
    QVE1_ModuleNo       POSITION(*)    CHAR(01),
    QVE1_KyouShoriKbn   POSITION(*)    CHAR(01),
    QVE1_KyouShoriYmd   POSITION(*)    CHAR(07),
    QVE1_YouBi          POSITION(*)    CHAR(01),
    QVE1_KyouShoriTime  POSITION(*)    CHAR(08),
    QVE1_LOGShubetu     POSITION(*)    CHAR(01),
    QVE1_SSubSystemKbn  POSITION(*)    CHAR(01),
    QVE1_ShoriNo        POSITION(*)    CHAR(02),
    QVE1_MiseCd         POSITION(*)    CHAR(02),
    QVE1_58Kbn          POSITION(*)    CHAR(03),
    QVE1_KaiinNo        POSITION(*)    DECIMAL(16),
    QVE1_Shimei         POSITION(*)    CHAR(30),
    QVE1_KameiTenNo     POSITION(*)    CHAR(10),
    QVE1_KeijouYmd      POSITION(*)    DECIMAL(7),
    QVE1_RiyouYmd       POSITION(*)    DECIMAL(7),
    QVE1_DenNo          POSITION(*)    CHAR(12),
    QVE1_HinMei         POSITION(*)    CHAR(40),
    QVE1_RiyouKng       POSITION(*)    DECIMAL(11),
    QVE1_JikoRiyu       POSITION(*)    CHAR(16),
    QVE1_JikoRiyuCd     POSITION(*)    CHAR(02),
    QVE1_Tel            POSITION(*)    CHAR(15),
    QVE1_KeijouKozNo    POSITION(*)    DECIMAL(16),
    QVE1_Shiharai       POSITION(*)    CHAR(02),
    QVE1_TorihikiNo     POSITION(*)    DECIMAL(7),
    QVE1_LoanShubetu    POSITION(*)    DECIMAL(5),
    QVE1_DenShubetu     POSITION(*)    CHAR(04),
    QVE1_SeikyuHoryuKbn POSITION(*)    CHAR(01)
   )
