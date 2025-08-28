--   NAME
--    QVAD_SLD3000.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 目的ローン約定チェックリストデータ>
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
   INFILE * "FIX 537"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVET_YakujyouT
   (
    QVET_RecLen                                     CONSTANT 0,
    QVET_Yobi                                       CONSTANT 0,
    QVET_TanmatuMei      POSITION(*+04) CHAR(08),
    QVET_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVET_KigyouCd        POSITION(*)    CHAR(04),
    QVET_JigyoubuCd      POSITION(*)    CHAR(02),
    QVET_KyouMiseCd      POSITION(*)    CHAR(02),
    QVET_TantouShaCd     POSITION(*)    CHAR(07),
    QVET_SystemKbn       POSITION(*)    CHAR(01),
    QVET_SubSystemKbn    POSITION(*)    CHAR(01),
    QVET_ProcessKbn      POSITION(*)    CHAR(01),
    QVET_ProcessNo       POSITION(*)    CHAR(02),
    QVET_ProgramNo       POSITION(*)    CHAR(02),
    QVET_ModuleNo        POSITION(*)    CHAR(01),
    QVET_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVET_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVET_YouBi           POSITION(*)    CHAR(01),
    QVET_KyouShoriTime   POSITION(*)    CHAR(08),
    QVET_LOGShubetu      POSITION(*)    CHAR(01),
    QVET_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVET_ShoriNo         POSITION(*)    CHAR(02),
    QVET_UketukeNo       POSITION(*)    DECIMAL(8),
    QVET_KaiinNo         POSITION(*)    DECIMAL(16),
    QVET_RoanKbn         POSITION(*)    CHAR(01),
    QVET_MiseCd          POSITION(*)    CHAR(02),
    QVET_MousikomiYmd    POSITION(*)    DECIMAL(7),
    QVET_RoanShubetu     POSITION(*)    CHAR(05),
    QVET_Shiharai        POSITION(*)    CHAR(02),
    QVET_RoanMei         POSITION(*)    CHAR(40),
    QVET_SyouhinMei      POSITION(*)    CHAR(40),
    QVET_GoukeiKng       POSITION(*)    DECIMAL(11),
    QVET_AtamaKng        POSITION(*)    DECIMAL(11),
    QVET_RoanKng         POSITION(*)    DECIMAL(11),
    QVET_BonusKng        POSITION(*)    DECIMAL(11),
    QVET_RisokuRitu      POSITION(*)    DECIMAL(4, 2),
    QVET_RisokuKng       POSITION(*)    DECIMAL(9),
    QVET_FuriKng         POSITION(*)    DECIMAL(9),
    QVET_InsiKng         POSITION(*)    DECIMAL(9),
    QVET_JimuteKng       POSITION(*)    DECIMAL(9),
    QVET_RoanHensaiKng   POSITION(*)    DECIMAL(11),
    QVET_HensaiKaisu     POSITION(*)    CHAR(03),
    QVET_MaitukiKng      POSITION(*)    DECIMAL(11),
    QVET_BonusKasanKng   POSITION(*)    DECIMAL(11),
    QVET_BonusKaisu      POSITION(*)    CHAR(02),
    QVET_SyokaiBonusYm   POSITION(*)    DECIMAL(5),
    QVET_KaisiYmd        POSITION(*)    DECIMAL(7),
    QVET_SaisyuYmd       POSITION(*)    DECIMAL(7),
    QVET_ShokaiHensaiKng POSITION(*)    DECIMAL(11),
    QVET_IkouHensaiKng   POSITION(*)    DECIMAL(11),
    QVET_SaisyuHensaiKng POSITION(*)    DECIMAL(11),
    QVET_ShokaiBonusKng  POSITION(*)    DECIMAL(11),
    QVET_FRIGinYubinKbn  POSITION(*)    CHAR(01),
    QVET_FRIGinkouCd     POSITION(*)    DECIMAL(4),
    QVET_FRIGinkouMei    POSITION(*)    CHAR(20),
    QVET_FRISitenCd      POSITION(*)    DECIMAL(05),
    QVET_FRISitenMei     POSITION(*)    CHAR(20),
    QVET_FRIShumoku      POSITION(*)    CHAR(01),
    QVET_FRIKouzaNo      POSITION(*)    DECIMAL(7),
    QVET_FRIKouzaMei     POSITION(*)    CHAR(30),
    QVET_KeiyakuYoteiYmd POSITION(*)    DECIMAL(7),
    QVET_KibouYmd        POSITION(*)    DECIMAL(7),
    QVET_YusiYoteiYmd    POSITION(*)    DECIMAL(7),
    QVET_KeijouYmd       POSITION(*)    DECIMAL(7),
    QVET_KisanYmd        POSITION(*)    DECIMAL(7),
    QVET_HoshouUmu       POSITION(*)    CHAR(01),
    QVET_TanpoKbn        POSITION(*)    CHAR(01),
    QVET_KNRSyounin      POSITION(*)    CHAR(02),
    QVET_KNRSyouninKbn   POSITION(*)    CHAR(01),
    QVET_KNRSyazetu      POSITION(*)    CHAR(02),
    QVET_KNRSyouninYmd   POSITION(*)    DECIMAL(7),
    QVET_KNRSyazetuYmd   POSITION(*)    DECIMAL(7),
    QVET_KNRKeijouFlg    POSITION(*)    CHAR(01),
    QVET_KNRSyazetuFlg   POSITION(*)    CHAR(01),
    QVET_KNRMeisaiFlg    POSITION(*)    CHAR(01),
    QVET_KNRFurikomiFlg  POSITION(*)    CHAR(01),
    QVET_TatenaosiKbn    POSITION(*)    CHAR(01),
    QVET_SeikyuMinyuKng  POSITION(*)    DECIMAL(9),
    QVET_TorihikiNo      POSITION(*)    DECIMAL(7),
    QVET_Sekushon                                   CONSTANT 0,
    QVET_Yobi1           POSITION(*+02) CHAR(24),
    QVET_Shimei          POSITION(*)    CHAR(30),
    QVET_Riyumei         POSITION(*)    CHAR(40),
    QVET_Bikou           POSITION(*)    CHAR(40)
   )
