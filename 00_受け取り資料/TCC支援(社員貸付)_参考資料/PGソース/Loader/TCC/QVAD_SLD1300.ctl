--   NAME
--    QVAD_SLD1300.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 自振データ修正ログデータ>
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
   INFILE * "FIX 410"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEC_JifuriT
   (
    QVEC_RecLen                                   CONSTANT 0,
    QVEC_Yobi                                     CONSTANT 0,
    QVEC_TanmatuMei    POSITION(*+04) CHAR(08),
    QVEC_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVEC_KigyouCd      POSITION(*)    CHAR(04),
    QVEC_JigyoubuCd    POSITION(*)    CHAR(02),
    QVEC_KyouMiseCd    POSITION(*)    CHAR(02),
    QVEC_TantouShaCd   POSITION(*)    CHAR(07),
    QVEC_SystemKbn     POSITION(*)    CHAR(01),
    QVEC_SubSystemKbn  POSITION(*)    CHAR(01),
    QVEC_ProcessKbn    POSITION(*)    CHAR(01),
    QVEC_ProcessNo     POSITION(*)    CHAR(02),
    QVEC_ProgramNo     POSITION(*)    CHAR(02),
    QVEC_ModuleNo      POSITION(*)    CHAR(01),
    QVEC_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVEC_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVEC_YouBi         POSITION(*)    CHAR(01),
    QVEC_KyouShoriTime POSITION(*)    CHAR(08),
    QVEC_LOGShubetu    POSITION(*)    CHAR(01),
    QVEC_SSubSystemKbn POSITION(*)    CHAR(01),
    QVEC_ShoriNo       POSITION(*)    CHAR(02),
    QVEC_EntryKey1     POSITION(*)    DECIMAL(4),
    QVEC_EntryKey2     POSITION(*)    DECIMAL(4),
    QVEC_EntryKey3     POSITION(*)    DECIMAL(8),
    QVEC_ShubetuMei    POSITION(*)    CHAR(08),
    QVEC_KaiinNo       POSITION(*)    DECIMAL(16),
    QVEC_Shimei        POSITION(*)    CHAR(30),
    QVEC_SijiYmd       POSITION(*)    DECIMAL(7),
    QVEC_ItakusyaCd    POSITION(*)    CHAR(10),
    QVEC_ItakuTen      POSITION(*)    CHAR(02),
    QVEC_GikouCd       POSITION(*)    DECIMAL(4),
    QVEC_GinkouMei     POSITION(*)    CHAR(30),
    QVEC_SitenCd       POSITION(*)    DECIMAL(5),
    QVEC_SitenMei      POSITION(*)    CHAR(30),
    QVEC_Shumoku       POSITION(*)    CHAR(01),
    QVEC_ShumokuMei    POSITION(*)    CHAR(04),
    QVEC_KouzaNo       POSITION(*)    DECIMAL(8),
    QVEC_KouzaMei      POSITION(*)    CHAR(30),
    QVEC_SeikyuYmd     POSITION(*)    DECIMAL(5),
    QVEC_MishuSts      POSITION(*)    CHAR(02),
    QVEC_Shiharai1     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng1    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng1    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng1      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai2     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng2    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng2    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng2      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai3     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng3    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng3    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng3      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai4     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng4    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng4    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng4      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai5     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng5    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng5    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng5      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai6     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng6    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng6    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng6      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai7     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng7    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng7    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng7      POSITION(*)    DECIMAL(11),
    QVEC_Shiharai8     POSITION(*)    CHAR(02),
    QVEC_SeikyuKng8    POSITION(*)    DECIMAL(11),
    QVEC_ShuseiKng8    POSITION(*)    DECIMAL(11),
    QVEC_IraiKng8      POSITION(*)    DECIMAL(11),
    QVEC_EntaiCd       POSITION(*)    CHAR(01),
    QVEC_UmuFlg        POSITION(*)    CHAR(01),
    QVEC_CardKbn       POSITION(*)    CHAR(06)
   )
