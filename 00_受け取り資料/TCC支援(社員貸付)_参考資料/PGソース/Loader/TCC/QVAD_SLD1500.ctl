--   NAME
--    QVAD_SLD1500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 返金登録依頼データ>
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
   INTO TABLE QVEE_HenkinT
   (
    QVEE_RecLen                                   CONSTANT 0,
    QVEE_Yobi                                     CONSTANT 0,
    QVEE_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEE_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEE_KigyouCd      POSITION(*)    CHAR(04),
    QVEE_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEE_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEE_TantouShaCd   POSITION(*)    CHAR(07),
    QVEE_SystemKbn     POSITION(*)    CHAR(01),
    QVEE_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEE_ProcessKbn    POSITION(*)    CHAR(01),
    QVEE_ProcessNo     POSITION(*)    CHAR(02),
    QVEE_ProgramNo     POSITION(*)    CHAR(02),
    QVEE_ModuleNo      POSITION(*)    CHAR(01),
    QVEE_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEE_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEE_YouBi         POSITION(*)    CHAR(01),
    QVEE_KyouShoriTime POSITION(*)    CHAR(08),
    QVEE_LOGShubetu    POSITION(*)    CHAR(01),
    QVEE_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEE_ShoriNo       POSITION(*)    CHAR(02),
    QVEE_NaibuKaiinNo  POSITION(*)    DECIMAL(8),
    QVEE_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEE_KaiinMei      POSITION(*)    CHAR(30),
    QVEE_HenkinYmd     POSITION(*)    DECIMAL(7),
    QVEE_GikouCd       POSITION(*)    DECIMAL(4),
    QVEE_GinkouMei     POSITION(*)    CHAR(20),
    QVEE_SitenCd       POSITION(*)    DECIMAL(3),
    QVEE_SitenMei      POSITION(*)    CHAR(20),
    QVEE_Shumoku       POSITION(*)    CHAR(01),
    QVEE_KouzaNo       POSITION(*)    DECIMAL(8),
    QVEE_KouzaMei      POSITION(*)    CHAR(30),
    QVEE_HenkinKng     POSITION(*)    DECIMAL(11),
    QVEE_HenkinKbn     POSITION(*)    CHAR(01)
   )
