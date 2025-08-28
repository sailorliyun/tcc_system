--   NAME
--    QVAD_SLD2000.ctl
--   DESCRIPTION
--     <�V�X�e����: �N���W�b�g�V�X�e��>
--     <�Ɩ���    : �N���W�b�g���[>
--     <�Ώۃf�[�^: ���U�C���Ώێ҃f�[�^>
--   RETURNS
--
--   NOTES
--
--   MODIFIED   (MM/DD/YY)
--               04/01/99 -  �쐬
--   MODIFIED    10/27/03 -  �C���F�N���� �Ή�
--
--
--OPTIONS
--(DIRECT=TRUE)

LOAD DATA
--   INFILE * "FIX 244"
   INFILE * "FIX 256"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEJ_JifuriSyuseiT
   (
    QVEJ_RecLen                                   CONSTANT 0,
    QVEJ_Yobi                                     CONSTANT 0,
    QVEJ_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEJ_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEJ_KigyouCd      POSITION(*)    CHAR(04),
    QVEJ_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEJ_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEJ_TantouShaCd   POSITION(*)    CHAR(07),
    QVEJ_SystemKbn     POSITION(*)    CHAR(01),
    QVEJ_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEJ_ProcessKbn    POSITION(*)    CHAR(01),
    QVEJ_ProcessNo     POSITION(*)    CHAR(02),
    QVEJ_ProgramNo     POSITION(*)    CHAR(02),
    QVEJ_ModuleNo      POSITION(*)    CHAR(01),
    QVEJ_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEJ_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEJ_YouBi         POSITION(*)    CHAR(01),
    QVEJ_KyouShoriTime POSITION(*)    CHAR(08),
    QVEJ_LOGShubetu    POSITION(*)    CHAR(01),
    QVEJ_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEJ_ShoriNo       POSITION(*)    CHAR(02),
    QVEJ_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEJ_Shimei        POSITION(*)    CHAR(30),
    QVEJ_ItakusyaCd    POSITION(*)    CHAR(10),
    QVEJ_ItakuTen      POSITION(*)    CHAR(02),
    QVEJ_GinkouCd      POSITION(*)    DECIMAL(4),
    QVEJ_GinkouMei     POSITION(*)    CHAR(30),
    QVEJ_SitenCd       POSITION(*)    DECIMAL(5),
    QVEJ_SitenMei      POSITION(*)    CHAR(30),
    QVEJ_Shumoku       POSITION(*)    CHAR(01),
    QVEJ_ShumokuMei    POSITION(*)    CHAR(04),
    QVEJ_KouzaNo       POSITION(*)    DECIMAL(8),
    QVEJ_KouzaMei      POSITION(*)    CHAR(30),
    QVEJ_ShubetuMei    POSITION(*)    CHAR(08),
    QVEJ_SijiYmd       POSITION(*)    DECIMAL(7),
    QVEJ_SeikyuKng     POSITION(*)    DECIMAL(11),
    QVEJ_ZougenKng     POSITION(*)    DECIMAL(11),
    QVEJ_IraiKng       POSITION(*)    DECIMAL(11),
    QVEJ_NenSeikyuKng  POSITION(*)    DECIMAL(07), -- 2003/10/27
    QVEJ_NenZougenKng  POSITION(*)    DECIMAL(07), -- 2003/10/27
    QVEJ_NenIraiKng    POSITION(*)    DECIMAL(07)  -- 2003/10/27
   )
