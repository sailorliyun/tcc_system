--   NAME
--    QVAD_SLD1600.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 賞与差引額修正ログデータ>
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
   INFILE * "FIX 123"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEF_SyouyoT
   (
    QVEF_RecLen                                   CONSTANT 0,
    QVEF_Yobi                                     CONSTANT 0,
    QVEF_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEF_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEF_KigyouCd      POSITION(*)    CHAR(04),
    QVEF_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEF_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEF_TantouShaCd   POSITION(*)    CHAR(07),
    QVEF_SystemKbn     POSITION(*)    CHAR(01),
    QVEF_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEF_ProcessKbn    POSITION(*)    CHAR(01),
    QVEF_ProcessNo     POSITION(*)    CHAR(02),
    QVEF_ProgramNo     POSITION(*)    CHAR(02),
    QVEF_ModuleNo      POSITION(*)    CHAR(01),
    QVEF_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEF_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEF_YouBi         POSITION(*)    CHAR(01),
    QVEF_KyouShoriTime POSITION(*)    CHAR(08),
    QVEF_LOGShubetu    POSITION(*)    CHAR(01),
    QVEF_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEF_ShoriNo       POSITION(*)    CHAR(02),
    QVEF_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEF_Shimei        POSITION(*)    CHAR(30),
    QVEF_ShozokuTen    POSITION(*)    CHAR(02),
    QVEF_BumonCd       POSITION(*)    CHAR(06),
    QVEF_YoteiKng      POSITION(*)    DECIMAL(9),
    QVEF_TenbikiKng    POSITION(*)    DECIMAL(9),
    QVEF_ShuseiYmd     POSITION(*)    DECIMAL(7),
    QVEF_GeppuKng      POSITION(*)    DECIMAL(9)
   )
