--   NAME
--    QVAD_SLD0200.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 返品確認リストデータ  >
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
   INFILE * "FIX 209"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE2_HenpinT
   (
    QVE2_RecLen                                   CONSTANT 0,
    QVE2_Yobi                                     CONSTANT 0,
    QVE2_TanmatuMei    POSITION(*+04) CHAR(08),
    QVE2_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVE2_KigyouCd      POSITION(*)    CHAR(04),
    QVE2_JigyoubuCd    POSITION(*)    CHAR(02),
    QVE2_KyouMiseCd    POSITION(*)    CHAR(02),
    QVE2_TantouShaCd   POSITION(*)    CHAR(07),
    QVE2_SystemKbn     POSITION(*)    CHAR(01),
    QVE2_SubSystemKbn  POSITION(*)    CHAR(01),
    QVE2_ProcessKbn    POSITION(*)    CHAR(01),
    QVE2_ProcessNo     POSITION(*)    CHAR(02),
    QVE2_ProgramNo     POSITION(*)    CHAR(02),
    QVE2_ModuleNo      POSITION(*)    CHAR(01),
    QVE2_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVE2_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVE2_YouBi         POSITION(*)    CHAR(01),
    QVE2_KyouShoriTime POSITION(*)    CHAR(08),
    QVE2_LOGShubetu    POSITION(*)    CHAR(01),
    QVE2_SSubSystemKbn POSITION(*)    CHAR(01),
    QVE2_ShoriNo       POSITION(*)    CHAR(02),
    QVE2_MiseCd        POSITION(*)    CHAR(02),
    QVE2_58Kbn         POSITION(*)    DECIMAL(6),
    QVE2_NaibuKaiinNo  POSITION(*)    DECIMAL(8),
    QVE2_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVE2_KameiTenNo    POSITION(*)    CHAR(10),
    QVE2_TantouCd      POSITION(*)    DECIMAL(7),
    QVE2_KaiinNo       POSITION(*)    DECIMAL(16),
    QVE2_Shimei        POSITION(*)    CHAR(30),
    QVE2_ShoriKbn      POSITION(*)    CHAR(01),
    QVE2_NyuryokuRoute POSITION(*)    CHAR(01),
    QVE2_HenpinAtoKng  POSITION(*)    DECIMAL(11),
    QVE2_AtamaKng      POSITION(*)    DECIMAL(11),
    QVE2_AzukariKng    POSITION(*)    DECIMAL(11),
    QVE2_HPNRiyouYmd   POSITION(*)    DECIMAL(7),
    QVE2_HPNKeijouYmd  POSITION(*)    DECIMAL(7),
    QVE2_HPNDenShubetu POSITION(*)    CHAR(04),
    QVE2_HPNDenNo      POSITION(*)    CHAR(12),
    QVE2_HPNShiharai   POSITION(*)    CHAR(02),
    QVE2_HPNKng        POSITION(*)    DECIMAL(11),
    QVE2_MTORiyouYmd   POSITION(*)    DECIMAL(7),
    QVE2_MTOKeijouYmd  POSITION(*)    DECIMAL(7),
    QVE2_MTODenShubetu POSITION(*)    CHAR(04),
    QVE2_MTODenNo      POSITION(*)    CHAR(12),
    QVE2_MTOShiharai   POSITION(*)    CHAR(02),
    QVE2_MTOKng        POSITION(*)    DECIMAL(11)
   )
