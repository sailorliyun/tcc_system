--   NAME
--    QVAD_SLD4650.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 事務手数料算出表データ・ＪＲ名古屋>
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
   INFILE * "FIX 200"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVF8_JimuteMTJR 
   (
    QVF8_RecLen                                   CONSTANT 0,
    QVF8_Yobi                                     CONSTANT 0,
    QVF8_TanmatuMei    POSITION(*+04) CHAR(08),
    QVF8_TouzaiKbn     POSITION(*)    CHAR(01),
    QVF8_KigyouCd      POSITION(*)    CHAR(04),
    QVF8_JigyoubuCd    POSITION(*)    CHAR(02),
    QVF8_MiseCd        POSITION(*)    CHAR(02),
    QVF8_TantouSyaCd   POSITION(*)    CHAR(07),
    QVF8_SystemKbn     POSITION(*)    CHAR(01),
    QVF8_SubSystemKbn  POSITION(*)    CHAR(01),
    QVF8_ProcessKbn    POSITION(*)    CHAR(01),
    QVF8_ProcessNo     POSITION(*)    CHAR(02),
    QVF8_ProgramNo     POSITION(*)    CHAR(02),
    QVF8_ModuleNo      POSITION(*)    CHAR(01),
    QVF8_SyoriKbn      POSITION(*)    CHAR(01),
    QVF8_SyoriYmd      POSITION(*)    CHAR(07),
    QVF8_YouBi         POSITION(*)    CHAR(01),
    QVF8_SyoriTime     POSITION(*)    CHAR(08),
    QVF8_LOGSyubetu    POSITION(*)    CHAR(01),
    QVF8_SSubSystemKbn POSITION(*)    CHAR(01),
    QVF8_SyoriNo       POSITION(*)    CHAR(02),
    QVF8_SyukeiYmdFrom POSITION(*)    DECIMAL(7),
    QVF8_SyukeiYmdTo   POSITION(*)    DECIMAL(7),
    QVF8_HasseiTenCD   POSITION(*)    CHAR(02),
    QVF8_KanriTenCd    POSITION(*)    CHAR(02),
    QVF8_58Kbn         POSITION(*)    CHAR(03),
    QVF8_58KbnMei      POSITION(*)    CHAR(20),
    QVF8_HASTenKbn     POSITION(*)    CHAR(01),
    QVF8_HASTZKbn      POSITION(*)    CHAR(01),
    QVF8_KANTenKbn     POSITION(*)    CHAR(01),
    QVF8_KANTZKbn      POSITION(*)    CHAR(01),
    QVF8_CardSyubetu   POSITION(*)    CHAR(01),
    QVF8_1KAIRitu      POSITION(*)    ZONED(4, 2),
    QVF8_1KAISyukeiKng POSITION(*)    DECIMAL(11),
    QVF8_1KAITesuu     POSITION(*)    DECIMAL(9),
    QVF8_2KAIRitu      POSITION(*)    ZONED(4, 2),
    QVF8_2KAISyukeiKng POSITION(*)    DECIMAL(11),
    QVF8_2KAITesuu     POSITION(*)    DECIMAL(9),
    QVF8_BO1Ritu       POSITION(*)    ZONED(4, 2),
    QVF8_BO1SyukeiKng  POSITION(*)    DECIMAL(11),
    QVF8_BO1Tesuu      POSITION(*)    DECIMAL(9),
    QVF8_BO2Ritu       POSITION(*)    ZONED(4, 2),
    QVF8_BO2SyukeiKng  POSITION(*)    DECIMAL(11),
    QVF8_BO2Tesuu      POSITION(*)    DECIMAL(9),
    QVF8_BUNRitu       POSITION(*)    ZONED(4, 2),
    QVF8_BUNSyukeiKng  POSITION(*)    DECIMAL(11),
    QVF8_BUNTesuu      POSITION(*)    DECIMAL(9),
    QVF8_RIBORitu      POSITION(*)    ZONED(4, 2),
    QVF8_RIBOSyukeiKng POSITION(*)    DECIMAL(11),
    QVF8_RIBOTesuu     POSITION(*)    DECIMAL(9),
    QVF8_KEISyukeiKng  POSITION(*)    DECIMAL(13),
    QVF8_KEITesuu      POSITION(*)    DECIMAL(11),
    QVF8_UkeKbn                                   CONSTANT 5
   )
