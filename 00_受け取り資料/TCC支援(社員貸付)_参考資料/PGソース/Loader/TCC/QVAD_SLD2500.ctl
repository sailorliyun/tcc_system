--   NAME
--    QVAD_SLD2500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 償還明細書データ      >
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
   INFILE * "FIX 525"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEP_SyoukanT
   (
    QVEP_RecLen                                       CONSTANT 0,
    QVEP_Yobi                                         CONSTANT 0,
    QVEP_TanmatuMei        POSITION(*+04) CHAR(08),
    QVEP_KyouTouzaiKbn     POSITION(*)    CHAR(01),
    QVEP_KigyouCd          POSITION(*)    CHAR(04),
    QVEP_JigyoubuCd        POSITION(*)    CHAR(02),
    QVEP_KyouMiseCd        POSITION(*)    CHAR(02),
    QVEP_TantouShaCd       POSITION(*)    CHAR(07),
    QVEP_SystemKbn         POSITION(*)    CHAR(01),
    QVEP_SubSystemKbn      POSITION(*)    CHAR(01),
    QVEP_ProcessKbn        POSITION(*)    CHAR(01),
    QVEP_ProcessNo         POSITION(*)    CHAR(02),
    QVEP_ProgramNo         POSITION(*)    CHAR(02),
    QVEP_ModuleNo          POSITION(*)    CHAR(01),
    QVEP_KyouShoriKbn      POSITION(*)    CHAR(01),
    QVEP_KyouShoriYmd      POSITION(*)    CHAR(07),
    QVEP_YouBi             POSITION(*)    CHAR(01),
    QVEP_KyouShoriTime     POSITION(*)    CHAR(08),
    QVEP_LOGShubetu        POSITION(*)    CHAR(01),
    QVEP_SSubSystemKbn     POSITION(*)    CHAR(01),
    QVEP_ShoriNo           POSITION(*)    CHAR(02),
    QVEP_KanriTen          POSITION(*)    CHAR(02),
    QVEP_GaibuKaiinNo      POSITION(*)    DECIMAL(16) ,
    QVEP_Shimei            POSITION(*)    CHAR(30),
    QVEP_JYUYubinNo        POSITION(*)    CHAR(05),
    QVEP_JYUYubinNoYobi    POSITION(*)    CHAR(03),
    QVEP_JYUUSHO1          POSITION(*)    CHAR(30),
    QVEP_JYUUSHO2          POSITION(*)    CHAR(40),
    QVEP_JYUUSHO3          POSITION(*)    CHAR(40),
    QVEP_JYUUSHO4          POSITION(*)    CHAR(40),
    QVEP_FRIGinkouCd       POSITION(*)    CHAR(04),
    QVEP_FRIGinkouMei      POSITION(*)    CHAR(20),
    QVEP_FRISitenCd        POSITION(*)    CHAR(03),
    QVEP_FRISitenMei       POSITION(*)    CHAR(20),
    QVEP_FRIShumoku        POSITION(*)    CHAR(01),
    QVEP_FRIKouzaNo        POSITION(*)    DECIMAL(8),
    QVEP_FRIKouzaMei       POSITION(*)    CHAR(30) ,
    QVEP_UketukeNo         POSITION(*)    DECIMAL(8),
    QVEP_HanbaiTen         POSITION(*)    CHAR(02),
    QVEP_ShouhinMei        POSITION(*)    CHAR(40),
    QVEP_YusiYmd           POSITION(*)    DECIMAL(7),
    QVEP_SimeYmd           POSITION(*)    DECIMAL(7),
    QVEP_SyokaiYmd         POSITION(*)    DECIMAL(7),
    QVEP_SaisyuYmd         POSITION(*)    DECIMAL(7),
    QVEP_RoanKbn           POSITION(*)    CHAR(01),
    QVEP_RoanShubetu       POSITION(*)    CHAR(05),
    QVEP_Shiharai          POSITION(*)    CHAR(02),
    QVEP_TesuryouRitu      POSITION(*)    DECIMAL(4, 2),
    QVEP_GetuRi            POSITION(*)    DECIMAL(6, 4),
    QVEP_GoukeiKng         POSITION(*)    DECIMAL(11),
    QVEP_AtamaKng          POSITION(*)    DECIMAL(11),
    QVEP_RoanKng           POSITION(*)    DECIMAL(11),
    QVEP_BonusKng          POSITION(*)    DECIMAL(11),
    QVEP_RisokuKng         POSITION(*)    DECIMAL(9),
    QVEP_JimuteKng         POSITION(*)    DECIMAL(9),
    QVEP_RoanHensaiKng     POSITION(*)    DECIMAL(11),
    QVEP_MaitukiKng        POSITION(*)    DECIMAL(11),
    QVEP_BonusKasanKng     POSITION(*)    DECIMAL(11),
    QVEP_MTKShokaiGanKng   POSITION(*)    DECIMAL(11),
    QVEP_MTKShokaiTesuuKng POSITION(*)    DECIMAL(9),
    QVEP_MTKIkouGanKng     POSITION(*)    DECIMAL(11),
    QVEP_MTKIkouTesuuKng   POSITION(*)    DECIMAL(9),
    QVEP_BNSShokaiGanKng   POSITION(*)    DECIMAL(11),
    QVEP_BNSShokaiTesuuKng POSITION(*)    DECIMAL(9),
    QVEP_BNSIkouKasanKng   POSITION(*)    DECIMAL(11),
    QVEP_HensaiKaisu       POSITION(*)    CHAR(03),
    QVEP_BonusKaisu        POSITION(*)    CHAR(02),
    QVEP_BonusTuki1        POSITION(*)    CHAR(02),
    QVEP_BonusTuki2        POSITION(*)    CHAR(02),
    QVEP_KigyouCD_2        CONSTANT       '    ',
    QVEP_Subrange          CONSTANT       '    ',
    QVEP_NaibuKaiinNo      POSITION(*)    CHAR(08)
     )
