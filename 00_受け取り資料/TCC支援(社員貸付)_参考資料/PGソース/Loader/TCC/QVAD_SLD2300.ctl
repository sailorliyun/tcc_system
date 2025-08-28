--   NAME
--    QVAD_SLD2300.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン謝絶状データ>
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
   INFILE * "FIX 282"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEN_SyazetuT
   (
    QVEN_RecLen                                   CONSTANT 0,
    QVEN_Yobi                                     CONSTANT 0,
    QVEN_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEN_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEN_KigyouCd      POSITION(*)    CHAR(04),
    QVEN_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEN_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEN_TantouShaCd   POSITION(*)    CHAR(07),
    QVEN_SystemKbn     POSITION(*)    CHAR(01),
    QVEN_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEN_ProcessKbn    POSITION(*)    CHAR(01),
    QVEN_ProcessNo     POSITION(*)    CHAR(02),
    QVEN_ProgramNo     POSITION(*)    CHAR(02),
    QVEN_ModuleNo      POSITION(*)    CHAR(01),
    QVEN_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEN_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEN_YouBi         POSITION(*)    CHAR(01),
    QVEN_KyouShoriTime POSITION(*)    CHAR(08),
    QVEN_LOGShubetu    POSITION(*)    CHAR(01),
    QVEN_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEN_ShoriNo       POSITION(*)    CHAR(02),
    QVEN_SakuseiYmd    POSITION(*)    DECIMAL(7),
    QVEN_Shimei        POSITION(*)    CHAR(30),
    QVEN_YubinNo       POSITION(*)    CHAR(08),
    QVEN_Jhusho        POSITION(*)    CHAR(50),
    QVEN_Banti         POSITION(*)    CHAR(30),
    QVEN_Katagaki      POSITION(*)    CHAR(64),
    QVEN_RoanMei       POSITION(*)    CHAR(40),
    QVEN_RiyuCd        POSITION(*)    CHAR(02)
   )
