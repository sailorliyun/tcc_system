--   NAME
--    QVAD_SLD0900.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 赤黒非表示追加プルーフリストデータ>
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
   INFILE * "FIX 184"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE9_AkakuroT
   (
    QVE9_RecLen                                   CONSTANT 0,
    QVE9_Yobi                                     CONSTANT 0,
    QVE9_TanmatuMei    POSITION(*+04) CHAR(08),
    QVE9_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVE9_KigyouCd      POSITION(*)    CHAR(04),
    QVE9_JigyoubuCd    POSITION(*)    CHAR(02),
    QVE9_KyouMiseCd    POSITION(*)    CHAR(02),
    QVE9_TantouShaCd   POSITION(*)    CHAR(07),
    QVE9_SystemKbn     POSITION(*)    CHAR(01),
    QVE9_SubSystemKbn  POSITION(*)    CHAR(01),
    QVE9_ProcessKbn    POSITION(*)    CHAR(01),
    QVE9_ProcessNo     POSITION(*)    CHAR(02),
    QVE9_ProgramNo     POSITION(*)    CHAR(02),
    QVE9_ModuleNo      POSITION(*)    CHAR(01),
    QVE9_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVE9_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVE9_YouBi         POSITION(*)    CHAR(01),
    QVE9_KyouShoriTime POSITION(*)    CHAR(08),
    QVE9_LOGShubetu    POSITION(*)    CHAR(01),
    QVE9_SSubSystemKbn POSITION(*)    CHAR(01),
    QVE9_ShoriNo       POSITION(*)    CHAR(02),
    QVE9_Mise          POSITION(*)    CHAR(02),
    QVE9_58Kbn         POSITION(*)    CHAR(03),
    QVE9_KaiinNo       POSITION(*)    DECIMAL(16),
    QVE9_Shimei        POSITION(*)    CHAR(30),
    QVE9_Shiharai      POSITION(*)    CHAR(02),
    QVE9_TantouCd      POSITION(*)    DECIMAL(7),
    QVE9_SijiKbn       POSITION(*)    CHAR(01),
    QVE9_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVE9_HasseiTen     POSITION(*)    CHAR(02),
    QVE9_Shubetu       POSITION(*)    CHAR(04),
    QVE9_DenNo         POSITION(*)    CHAR(12),
    QVE9_KeijouYmd     POSITION(*)    DECIMAL(7),
    QVE9_RiyouYmd      POSITION(*)    DECIMAL(7),
    QVE9_Hinmei        POSITION(*)    CHAR(40),
    QVE9_RiyouKng      POSITION(*)    DECIMAL(11)
   )
