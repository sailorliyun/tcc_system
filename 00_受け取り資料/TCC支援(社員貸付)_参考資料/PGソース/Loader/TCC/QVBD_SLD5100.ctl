--   NAME
--    QVBD_SLD5100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 経理異動データ >
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
   INFILE * "FIX 380"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVG3_IdouDT
   (
    QVG3_KeijouYm      POSITION(*+80)    CHAR(06),
    QVG3_JyougeKbn     POSITION(*)    CHAR(01),
    QVG3_NaibuKaiinNo  POSITION(*)    CHAR(08),
    QVG3_Shimei        POSITION(*)    CHAR(30),
    QVG3_KaiinNo       POSITION(*)    CHAR(16),
    QVG3_MAE58Kbn      POSITION(*)    CHAR(03),
    QVG3_MAECardKbn    POSITION(*)    CHAR(06),
    QVG3_MAEKanriTen   POSITION(*)    CHAR(02),
    QVG3_ATO58Kbn      POSITION(*)    CHAR(03),
    QVG3_ATOCardKbn    POSITION(*)    CHAR(06),
    QVG3_ATOKanriTen   POSITION(*)    CHAR(02),
    QVG3_ZANAzukarikng POSITION(*)    DECIMAL(11),
    QVG3_ZANShiharai1  POSITION(*)    CHAR(02),
    QVG3_ZANGankng1    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu1     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute1    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai2  POSITION(*)    CHAR(02),
    QVG3_ZANGankng2    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu2     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute2    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai3  POSITION(*)    CHAR(02),
    QVG3_ZANGankng3    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu3     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute3    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai4  POSITION(*)    CHAR(02),
    QVG3_ZANGankng4    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu4     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute4    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai5  POSITION(*)    CHAR(02),
    QVG3_ZANGankng5    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu5     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute5    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai6  POSITION(*)    CHAR(02),
    QVG3_ZANGankng6    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu6     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute6    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai7  POSITION(*)    CHAR(02),
    QVG3_ZANGankng7    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu7     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute7    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai8  POSITION(*)    CHAR(02),
    QVG3_ZANGankng8    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu8     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute8    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai9  POSITION(*)    CHAR(02),
    QVG3_ZANGankng9    POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu9     POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute9    POSITION(*)    DECIMAL(09),
    QVG3_ZANShiharai10 POSITION(*)    CHAR(02),
    QVG3_ZANGankng10   POSITION(*)    DECIMAL(11),
    QVG3_ZANTesuu10    POSITION(*)    DECIMAL(09),
    QVG3_ZANJimute10   POSITION(*)    DECIMAL(09)
   )
