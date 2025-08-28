--   NAME
--    QVAD_SLD1200.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 依頼返却ログデータ>
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
   INFILE * "FIX 242"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEB_HenkyakuT
   (
    QVEB_RecLen                                   CONSTANT 0,
    QVEB_Yobi                                     CONSTANT 0,
    QVEB_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEB_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEB_KigyouCd      POSITION(*)    CHAR(04),
    QVEB_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEB_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEB_TantouShaCd   POSITION(*)    CHAR(07),
    QVEB_SystemKbn     POSITION(*)    CHAR(01),
    QVEB_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEB_ProcessKbn    POSITION(*)    CHAR(01),
    QVEB_ProcessNo     POSITION(*)    CHAR(02),
    QVEB_ProgramNo     POSITION(*)    CHAR(02),
    QVEB_ModuleNo      POSITION(*)    CHAR(01),
    QVEB_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEB_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEB_YouBi         POSITION(*)    CHAR(01),
    QVEB_KyouShoriTime POSITION(*)    CHAR(08),
    QVEB_LOGShubetu    POSITION(*)    CHAR(01),
    QVEB_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEB_ShoriNo       POSITION(*)    CHAR(02),
    QVEB_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEB_Shimei        POSITION(*)    CHAR(30),
    QVEB_SijiKbn       POSITION(*)    CHAR(01),
    QVEB_KanriTen      POSITION(*)    CHAR(02),
    QVEB_ItakuTen      POSITION(*)    CHAR(02),
    QVEB_ItakusyaCd    POSITION(*)    CHAR(10),
    QVEB_GikouCd       POSITION(*)    DECIMAL(4),
    QVEB_GinkouMei     POSITION(*)    CHAR(30),
    QVEB_SitenCd       POSITION(*)    DECIMAL(5),
    QVEB_SitenMei      POSITION(*)    CHAR(30),
    QVEB_Shumoku       POSITION(*)    CHAR(01),
    QVEB_ShumokuMei    POSITION(*)    CHAR(04),
    QVEB_KouzaNo       POSITION(*)    DECIMAL(8),
    QVEB_KouzaMei      POSITION(*)    CHAR(30),
    QVEB_JifuriKng     POSITION(*)    DECIMAL(11),
    QVEB_RiyuuCd       POSITION(*)    CHAR(01),
    QVEB_RiyuuMei      POSITION(*)    CHAR(10),
    QVEB_SijiYmd       POSITION(*)    DECIMAL(7),
    QVEB_TuutiYmd      POSITION(*)    DECIMAL(7)
   )
