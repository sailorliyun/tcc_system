--   NAME
--    QVAD_SLD3200.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 総振台帳データ>
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
   INFILE * "FIX 193"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEV_SoufuriT
   (
    QVEV_RecLen                                   CONSTANT 0,
    QVEV_Yobi                                     CONSTANT 0,
    QVEV_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEV_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEV_KigyouCd      POSITION(*)    CHAR(04),
    QVEV_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEV_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEV_TantouShaCd   POSITION(*)    CHAR(07),
    QVEV_SystemKbn     POSITION(*)    CHAR(01),
    QVEV_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEV_ProcessKbn    POSITION(*)    CHAR(01),
    QVEV_ProcessNo     POSITION(*)    CHAR(02),
    QVEV_ProgramNo     POSITION(*)    CHAR(02),
    QVEV_ModuleNo      POSITION(*)    CHAR(01),
    QVEV_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEV_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEV_YouBi         POSITION(*)    CHAR(01),
    QVEV_KyouShoriTime POSITION(*)    CHAR(08),
    QVEV_LOGShubetu    POSITION(*)    CHAR(01),
    QVEV_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEV_ShoriNo       POSITION(*)    CHAR(02),
    QVEV_NaibuKaiinNo  POSITION(*)    DECIMAL(8),
    QVEV_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEV_KaiinMei      POSITION(*)    CHAR(30),
    QVEV_HenkinYmd     POSITION(*)    DECIMAL(7),
    QVEV_GikouCd       POSITION(*)    DECIMAL(4),
    QVEV_GinkouMei     POSITION(*)    CHAR(20),
    QVEV_SitenCd       POSITION(*)    DECIMAL(3),
    QVEV_SitenMei      POSITION(*)    CHAR(20),
    QVEV_Shumoku       POSITION(*)    CHAR(01),
    QVEV_KouzaNo       POSITION(*)    DECIMAL(8),
    QVEV_KouzaMei      POSITION(*)    CHAR(30),
    QVEV_HenkinKng     POSITION(*)    DECIMAL(11),
    QVEV_HenkinKbn     POSITION(*)    CHAR(01)
   )
