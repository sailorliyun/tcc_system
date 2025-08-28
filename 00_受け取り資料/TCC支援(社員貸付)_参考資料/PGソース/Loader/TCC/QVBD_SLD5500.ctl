--   NAME
--    QVBD_SLD5500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 経理売掛残データ 年計分>
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
   INFILE * "FIX 230"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVG4_UriZanDT
   (
    QVG4_KeijouYm      POSITION(*+80)    CHAR(06),
    QVG4_JyougeKbn     POSITION(*)    CHAR(01),
    QVG4_KanriTen      POSITION(*)    CHAR(02),
    QVG4_58Kbn         POSITION(*)    CHAR(03),
    QVG4_Shiharai      POSITION(*)    CHAR(02),
    QVG4_ZENGankng     POSITION(*)    DECIMAL(11),
    QVG4_ZENTesuu      POSITION(*)    DECIMAL(09),
    QVG4_ZENJimute     POSITION(*)    DECIMAL(09),
    QVG4_ZENAzukari    POSITION(*)    DECIMAL(11),
    QVG4_MAEGankng     POSITION(*)    DECIMAL(11),
    QVG4_MAETesuu      POSITION(*)    DECIMAL(09),
    QVG4_MAEJimute     POSITION(*)    DECIMAL(09),
    QVG4_MAEAzukari    POSITION(*)    DECIMAL(11),
    QVG4_URIGankng     POSITION(*)    DECIMAL(11),
    QVG4_URIBubiki     POSITION(*)    DECIMAL(09),
    QVG4_URIBubikiZei  POSITION(*)    DECIMAL(09),
    QVG4_URITesuu      POSITION(*)    DECIMAL(09),
    QVG4_URIJimute     POSITION(*)    DECIMAL(09),
    QVG4_NYUGankng     POSITION(*)    DECIMAL(11),
    QVG4_NYUTesuu      POSITION(*)    DECIMAL(09),
    QVG4_NYUJimute     POSITION(*)    DECIMAL(09),
    QVG4_NYUEntai      POSITION(*)    DECIMAL(09),
    QVG4_NYUAzukari    POSITION(*)    DECIMAL(11),
    QVG4_ATOGankng     POSITION(*)    DECIMAL(11),
    QVG4_ATOTesuu      POSITION(*)    DECIMAL(09),
    QVG4_ATOJimute     POSITION(*)    DECIMAL(09),
    QVG4_ATOAzukari    POSITION(*)    DECIMAL(11),
    QVG4_UkeKbn        CONSTANT 4
   )
