--   NAME
--    QVBD_SLD4800.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 経理月次データ ２２日分>
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
   INFILE * "FIX 180"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVG2_CardGekkeiDT
   (
    QVG2_KeijouYm      POSITION(*+80)    CHAR(06),
    QVG2_JyougeKbn     POSITION(*)    CHAR(01),
    QVG2_HasseiTen     POSITION(*)    CHAR(02),
    QVG2_KameitenKbn   POSITION(*)    CHAR(01),
    QVG2_KameitenNo    POSITION(*)    CHAR(05),
    QVG2_KanriTen      POSITION(*)    CHAR(02),
    QVG2_58Kbn         POSITION(*)    CHAR(03),
    QVG2_Shiharai      POSITION(*)    CHAR(02),
    QVG2_KokunaiKaigai POSITION(*)    CHAR(01),
    QVG2_ShohinKng     POSITION(*)    DECIMAL(11),
    QVG2_BubikiKng     POSITION(*)    DECIMAL(11),
    QVG2_BubikiMaeZei  POSITION(*)    DECIMAL(11),
    QVG2_ZeiModoshi    POSITION(*)    DECIMAL(11),
    QVG2_Tesuuryo      POSITION(*)    DECIMAL(11),
    QVG2_UkeKbn        CONSTANT 2
   )
