--   NAME
--    QVAD_SLD1800.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 銀行引落不能変更データデータ>
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
   INFILE * "FIX 213"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEH_FunouT
   (
    QVEH_RecLen                                   CONSTANT 0,
    QVEH_Yobi                                     CONSTANT 0,
    QVEH_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEH_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEH_KigyouCd      POSITION(*)    CHAR(04),
    QVEH_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEH_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEH_TantouShaCd   POSITION(*)    CHAR(07),
    QVEH_SystemKbn     POSITION(*)    CHAR(01),
    QVEH_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEH_ProcessKbn    POSITION(*)    CHAR(01),
    QVEH_ProcessNo     POSITION(*)    CHAR(02),
    QVEH_ProgramNo     POSITION(*)    CHAR(02),
    QVEH_ModuleNo      POSITION(*)    CHAR(01),
    QVEH_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEH_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEH_YouBi         POSITION(*)    CHAR(01),
    QVEH_KyouShoriTime POSITION(*)    CHAR(08),
    QVEH_LOGShubetu    POSITION(*)    CHAR(01),
    QVEH_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEH_ShoriNo       POSITION(*)    CHAR(02),
    QVEH_MiseCd        POSITION(*)    CHAR(02),
    QVEH_58Kbn         POSITION(*)    CHAR(03),
    QVEH_BukaCd        POSITION(*)    CHAR(04),
    QVEH_KakariCd      POSITION(*)    CHAR(02),
    QVEH_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEH_Shimei        POSITION(*)    CHAR(30),
    QVEH_TelNo         POSITION(*)    CHAR(17),
    QVEH_GikouCd       POSITION(*)    CHAR(04),
    QVEH_SitenCd       POSITION(*)    CHAR(05),
    QVEH_Shumoku       POSITION(*)    CHAR(01),
    QVEH_KouzaNo       POSITION(*)    CHAR(08),
    QVEH_SeikyuKng     POSITION(*)    DECIMAL(9),
    QVEH_IraiKng       POSITION(*)    DECIMAL(9),
    QVEH_HenkouMei     POSITION(*)    CHAR(20),
    QVEH_HikiotosiKng  POSITION(*)    DECIMAL(9),
    QVEH_RiyuuMei      POSITION(*)    CHAR(20),
    QVEH_HikiotosiYmd  POSITION(*)    DECIMAL(7),
    QVEH_RiyuCd1       POSITION(*)    CHAR(01),
    QVEH_RiyuCd2       POSITION(*)    CHAR(01),
    QVEH_RiyuCd3       POSITION(*)    CHAR(01),
    QVEH_RiyuCd4       POSITION(*)    CHAR(01),
    QVEH_RiyuCd5       POSITION(*)    CHAR(01),
    QVEH_RiyuCd6       POSITION(*)    CHAR(01),
    QVEH_RiyuCd7       POSITION(*)    CHAR(01),
    QVEH_RiyuCd8       POSITION(*)    CHAR(01),
    QVEH_RiyuCd9       POSITION(*)    CHAR(01),
    QVEH_RiyuCd10      POSITION(*)    CHAR(01),
    QVEH_RiyuCd11      POSITION(*)    CHAR(01),
    QVEH_RiyuCd12      POSITION(*)    CHAR(01)
   )
