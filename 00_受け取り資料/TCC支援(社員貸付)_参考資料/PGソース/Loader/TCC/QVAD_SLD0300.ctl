--   NAME
--    QVAD_SLD0300.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 返品消し込み未処理リストデータ>
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
   INFILE * "FIX 194"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE3_HenpinKesiT
   (
    QVE3_RecLen                                   CONSTANT 0,
    QVE3_Yobi                                     CONSTANT 0,
    QVE3_TanmatuMei    POSITION(*+04) CHAR(08),
    QVE3_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVE3_KigyouCd      POSITION(*)    CHAR(04),
    QVE3_JigyoubuCd    POSITION(*)    CHAR(02),
    QVE3_KyouMiseCd    POSITION(*)    CHAR(02),
    QVE3_TantouShaCd   POSITION(*)    CHAR(07),
    QVE3_SystemKbn     POSITION(*)    CHAR(01),
    QVE3_SubSystemKbn  POSITION(*)    CHAR(01),
    QVE3_ProcessKbn    POSITION(*)    CHAR(01),
    QVE3_ProcessNo     POSITION(*)    CHAR(02),
    QVE3_ProgramNo     POSITION(*)    CHAR(02),
    QVE3_ModuleNo      POSITION(*)    CHAR(01),
    QVE3_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVE3_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVE3_YouBi         POSITION(*)    CHAR(01),
    QVE3_KyouShoriTime POSITION(*)    CHAR(08),
    QVE3_LOGShubetu    POSITION(*)    CHAR(01),
    QVE3_SSubSystemKbn POSITION(*)    CHAR(01),
    QVE3_ShoriNo       POSITION(*)    CHAR(02),
    QVE3_MiseCd        POSITION(*)    CHAR(02),
    QVE3_58Kbn         POSITION(*)    DECIMAL(6),
    QVE3_NaibuKaiinNo  POSITION(*)    DECIMAL(8),
    QVE3_TorihikiNo    POSITION(*)    DECIMAL(7),
    QVE3_KameiTenNo    POSITION(*)    CHAR(10),
    QVE3_KaiinNo       POSITION(*)    DECIMAL(16),
    QVE3_Shimei        POSITION(*)    CHAR(30),
    QVE3_NyuryokuRoute POSITION(*)    CHAR(01),
    QVE3_HPNRiyouYmd   POSITION(*)    DECIMAL(7),
    QVE3_HPNKeijouYmd  POSITION(*)    DECIMAL(7),
    QVE3_HPNDenShubetu POSITION(*)    CHAR(04),
    QVE3_HPNDenNo      POSITION(*)    CHAR(12),
    QVE3_HPNShiharai   POSITION(*)    CHAR(02),
    QVE3_HPNHinmei     POSITION(*)    CHAR(40),
    QVE3_HPNKng        POSITION(*)    DECIMAL(11)
   )
