--   NAME
--    QVAD_SLD2100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 管理店別引落依頼表データ>
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
   INFILE * "FIX 102"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEK_HikiotosiT
   (
    QVEK_RecLen                                    CONSTANT 0,
    QVEK_Yobi                                      CONSTANT 0,
    QVEK_TanmatuMei     POSITION(*+04) CHAR(08),
    QVEK_KyouTouzaiKbn  POSITION(*)    CHAR(01),
    QVEK_KigyouCd       POSITION(*)    CHAR(04),
    QVEK_JigyoubuCd     POSITION(*)    CHAR(02),
    QVEK_KyouMiseCd     POSITION(*)    CHAR(02),
    QVEK_TantouShaCd    POSITION(*)    CHAR(07),
    QVEK_SystemKbn      POSITION(*)    CHAR(01),
    QVEK_SubSystemKbn   POSITION(*)    CHAR(01),
    QVEK_ProcessKbn     POSITION(*)    CHAR(01),
    QVEK_ProcessNo      POSITION(*)    CHAR(02),
    QVEK_ProgramNo      POSITION(*)    CHAR(02),
    QVEK_ModuleNo       POSITION(*)    CHAR(01),
    QVEK_KyouShoriKbn   POSITION(*)    CHAR(01),
    QVEK_KyouShoriYmd   POSITION(*)    CHAR(07),
    QVEK_YouBi          POSITION(*)    CHAR(01),
    QVEK_KyouShoriTime  POSITION(*)    CHAR(08),
    QVEK_LOGShubetu     POSITION(*)    CHAR(01),
    QVEK_SSubSystemKbn  POSITION(*)    CHAR(01),
    QVEK_ShoriNo        POSITION(*)    CHAR(02),
    QVEK_IraiYm         POSITION(*)    DECIMAL(5),
    QVEK_ItakuTen       POSITION(*)    CHAR(02),
    QVEK_ItakuTenTouzai POSITION(*)    CHAR(01),
    QVEK_ItakuTenKbn    POSITION(*)    CHAR(01),
    QVEK_KanriTen       POSITION(*)    CHAR(02),
    QVEK_TUJShopKng     POSITION(*)    DECIMAL(11),
    QVEK_TUJCashKng     POSITION(*)    DECIMAL(11),
    QVEK_TUJKensu       POSITION(*)    DECIMAL(11),
    QVEK_UWAShopKng     POSITION(*)    DECIMAL(11),
    QVEK_UWACashKng     POSITION(*)    DECIMAL(11),
    QVEK_UWAKensu       POSITION(*)    DECIMAL(11)
   ) 
