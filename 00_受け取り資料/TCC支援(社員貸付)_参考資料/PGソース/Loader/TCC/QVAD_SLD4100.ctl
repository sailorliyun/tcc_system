--   NAME
--    QVAD_SLD4100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 事務手数料算出表データ>
--   RETURNS
--
--   NOTES
--
--   MODIFIED   (MM/DD/YY)
--               04/01/99 -  作成
--               28/09/99 -  金額の順番を修正
--                           １回, ２回, ボ１, ボ２, 分割, リボ
--                           の順でホストより送信されている
--
-- 
--
--OPTIONS
--(DIRECT=TRUE)

LOAD DATA
   INFILE * "FIX 200"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVF7_JimuteMT 
   (
    QVF7_RecLen                                   CONSTANT 0,
    QVF7_Yobi                                     CONSTANT 0,
    QVF7_TanmatuMei    POSITION(*+04) CHAR(08),
    QVF7_TouzaiKbn     POSITION(*)    CHAR(01),
    QVF7_KigyouCd      POSITION(*)    CHAR(04),
    QVF7_JigyoubuCd    POSITION(*)    CHAR(02),
    QVF7_MiseCd        POSITION(*)    CHAR(02),
    QVF7_TantouSyaCd   POSITION(*)    CHAR(07),
    QVF7_SystemKbn     POSITION(*)    CHAR(01),
    QVF7_SubSystemKbn  POSITION(*)    CHAR(01),
    QVF7_ProcessKbn    POSITION(*)    CHAR(01),
    QVF7_ProcessNo     POSITION(*)    CHAR(02),
    QVF7_ProgramNo     POSITION(*)    CHAR(02),
    QVF7_ModuleNo      POSITION(*)    CHAR(01),
    QVF7_SyoriKbn      POSITION(*)    CHAR(01),
    QVF7_SyoriYmd      POSITION(*)    CHAR(07),
    QVF7_YouBi         POSITION(*)    CHAR(01),
    QVF7_SyoriTime     POSITION(*)    CHAR(08),
    QVF7_LOGSyubetu    POSITION(*)    CHAR(01),
    QVF7_SSubSystemKbn POSITION(*)    CHAR(01),
    QVF7_SyoriNo       POSITION(*)    CHAR(02),
    QVF7_SyukeiYmdFrom POSITION(*)    DECIMAL(7),
    QVF7_SyukeiYmdTo   POSITION(*)    DECIMAL(7),
    QVF7_HasseiTenCD   POSITION(*)    CHAR(02),
    QVF7_KanriTenCd    POSITION(*)    CHAR(02),
    QVF7_58Kbn         POSITION(*)    CHAR(03),
    QVF7_58KbnMei      POSITION(*)    CHAR(20),
    QVF7_HASTenKbn     POSITION(*)    CHAR(01),
    QVF7_HASTZKbn      POSITION(*)    CHAR(01),
    QVF7_KANTenKbn     POSITION(*)    CHAR(01),
    QVF7_KANTZKbn      POSITION(*)    CHAR(01),
    QVF7_CardSyubetu   POSITION(*)    CHAR(01),
    QVF7_1KAIRitu      POSITION(*)    ZONED(4, 2),
    QVF7_1KAISyukeiKng POSITION(*)    DECIMAL(11),
    QVF7_1KAITesuu     POSITION(*)    DECIMAL(9),
    QVF7_2KAIRitu      POSITION(*)    ZONED(4, 2),
    QVF7_2KAISyukeiKng POSITION(*)    DECIMAL(11),
    QVF7_2KAITesuu     POSITION(*)    DECIMAL(9),
    QVF7_BO1Ritu       POSITION(*)    ZONED(4, 2),
    QVF7_BO1SyukeiKng  POSITION(*)    DECIMAL(11),
    QVF7_BO1Tesuu      POSITION(*)    DECIMAL(9),
    QVF7_BO2Ritu       POSITION(*)    ZONED(4, 2),
    QVF7_BO2SyukeiKng  POSITION(*)    DECIMAL(11),
    QVF7_BO2Tesuu      POSITION(*)    DECIMAL(9),
    QVF7_BUNRitu       POSITION(*)    ZONED(4, 2),
    QVF7_BUNSyukeiKng  POSITION(*)    DECIMAL(11),
    QVF7_BUNTesuu      POSITION(*)    DECIMAL(9),
    QVF7_RIBORitu      POSITION(*)    ZONED(4, 2),
    QVF7_RIBOSyukeiKng POSITION(*)    DECIMAL(11),
    QVF7_RIBOTesuu     POSITION(*)    DECIMAL(9),
    QVF7_KEISyukeiKng  POSITION(*)    DECIMAL(13),
    QVF7_KEITesuu      POSITION(*)    DECIMAL(11),
    QVF7_UkeKbn                                   CONSTANT 2
   )
