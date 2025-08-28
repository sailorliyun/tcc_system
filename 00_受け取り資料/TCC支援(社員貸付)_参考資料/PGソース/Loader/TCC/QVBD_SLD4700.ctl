--   NAME
--    QVBD_SLD4700.ctl
--   DESCRIPTION
--     <�V�X�e����: �N���W�b�g�V�X�e��>
--     <�Ɩ���    : �N���W�b�g���[>
--     <�Ώۃf�[�^: �o�������f�[�^ >
--   RETURNS
--
--   NOTES
-- 
--   MODIFIED   (MM/DD/YY)
--               04/01/99 -  �쐬
--
--
--OPTIONS
--(DIRECT=TRUE)

LOAD DATA
   INFILE * "FIX 180"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVG1_CardNikkeiDT
   (
    QVG1_ShoriYmd      POSITION(*+80)    CHAR(08),
    QVG1_KeijouYmd     POSITION(*)    CHAR(08),
    QVG1_HasseiTen     POSITION(*)    CHAR(02),
    QVG1_KanriTen      POSITION(*)    CHAR(02),
    QVG1_KakutokuTen   POSITION(*)    CHAR(02),
    QVG1_58Kbn         POSITION(*)    CHAR(03),
    QVG1_CardKbn       POSITION(*)    CHAR(06),
    QVG1_Shiharai      POSITION(*)    CHAR(02),
    QVG1_KokunaiKaigai POSITION(*)    CHAR(01),
    QVG1_ShohinKng     POSITION(*)    DECIMAL(11),
    QVG1_BubikiKng     POSITION(*)    DECIMAL(11),
    QVG1_BubikiMaeZei  POSITION(*)    DECIMAL(11),
    QVG1_ZeiModoshi    POSITION(*)    DECIMAL(11),
    QVG1_Tesuuryo      POSITION(*)    DECIMAL(11)
   )
