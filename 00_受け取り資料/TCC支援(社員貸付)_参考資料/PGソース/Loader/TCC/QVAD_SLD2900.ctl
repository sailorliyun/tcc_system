--   NAME
--    QVAD_SLD2900.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ショッピング約定チェックリストデータ>
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
   INTO TABLE QVES_ShopT
   (
    QVES_RecLen                                     CONSTANT 0,
    QVES_Yobi                                       CONSTANT 0,
    QVES_TanmatuMei      POSITION(*+04) CHAR(08),
    QVES_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVES_KigyouCd        POSITION(*)    CHAR(04),
    QVES_JigyoubuCd      POSITION(*)    CHAR(02),
    QVES_KyouMiseCd      POSITION(*)    CHAR(02),
    QVES_TantouShaCd     POSITION(*)    CHAR(07),
    QVES_SystemKbn       POSITION(*)    CHAR(01),
    QVES_SubSystemKbn    POSITION(*)    CHAR(01),
    QVES_ProcessKbn      POSITION(*)    CHAR(01),
    QVES_ProcessNo       POSITION(*)    CHAR(02),
    QVES_ProgramNo       POSITION(*)    CHAR(02),
    QVES_ModuleNo        POSITION(*)    CHAR(01),
    QVES_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVES_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVES_YouBi           POSITION(*)    CHAR(01),
    QVES_KyouShoriTime   POSITION(*)    CHAR(08),
    QVES_LOGShubetu      POSITION(*)    CHAR(01),
    QVES_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVES_ShoriNo         POSITION(*)    CHAR(02),
    QVES_UketukeNo       POSITION(*)    DECIMAL(8),
    QVES_KaiinNo         POSITION(*)    DECIMAL(16),
    QVES_RoanKbn         POSITION(*)    CHAR(01),
    QVES_MiseCd          POSITION(*)    CHAR(02),
    QVES_MousikomiYmd    POSITION(*)    DECIMAL(7),
    QVES_RoanShubetu     POSITION(*)    CHAR(05),
    QVES_Shiharai        POSITION(*)    CHAR(02),
    QVES_RoanMei         POSITION(*)    CHAR(40),
    QVES_SyouhinMei      POSITION(*)    CHAR(40),
    QVES_GoukeiKng       POSITION(*)    DECIMAL(11),
    QVES_AtamaKng        POSITION(*)    DECIMAL(11),
    QVES_RoanKng         POSITION(*)    DECIMAL(11),
    QVES_BonusKng        POSITION(*)    DECIMAL(11),
    QVES_RisokuRitu      POSITION(*)    DECIMAL(4, 2),
    QVES_RisokuKng       POSITION(*)    DECIMAL(9),
    QVES_FuriKng         POSITION(*)    DECIMAL(9),
    QVES_InsiKng         POSITION(*)    DECIMAL(9),
    QVES_JimuteKng       POSITION(*)    DECIMAL(9),
    QVES_RoanHensaiKng   POSITION(*)    DECIMAL(11),
    QVES_HensaiKaisu     POSITION(*)    CHAR(03),
    QVES_MaitukiKng      POSITION(*)    DECIMAL(11),
    QVES_BonusKasanKng   POSITION(*)    DECIMAL(11),
    QVES_BonusKaisu      POSITION(*)    CHAR(02),
    QVES_SyokaiBonusYm   POSITION(*)    DECIMAL(5),
    QVES_KaisiYmd        POSITION(*)    DECIMAL(7),
    QVES_SaisyuYmd       POSITION(*)    DECIMAL(7),
    QVES_ShokaiHensaiKng POSITION(*)    DECIMAL(11),
    QVES_IkouHensaiKng   POSITION(*)    DECIMAL(11),
    QVES_SaisyuHensaiKng POSITION(*)    DECIMAL(11),
    QVES_ShokaiBonusKng  POSITION(*)    DECIMAL(11),
    QVES_FRIGinYubinKbn  POSITION(*)    CHAR(01),
    QVES_FRIGinkouCd     POSITION(*)    DECIMAL(4),
    QVES_FRIGinkouMei    POSITION(*)    CHAR(20),
    QVES_FRISitenCd      POSITION(*)    DECIMAL(05),
    QVES_FRISitenMei     POSITION(*)    CHAR(20),
    QVES_FRIShumoku      POSITION(*)    CHAR(01),
    QVES_FRIKouzaNo      POSITION(*)    DECIMAL(7),
    QVES_FRIKouzaMei     POSITION(*)    CHAR(30),
    QVES_KeiyakuYoteiYmd POSITION(*)    DECIMAL(7),
    QVES_KibouYmd        POSITION(*)    DECIMAL(7),
    QVES_YusiYoteiYmd    POSITION(*)    DECIMAL(7),
    QVES_KeijouYmd       POSITION(*)    DECIMAL(7),
    QVES_KisanYmd        POSITION(*)    DECIMAL(7),
    QVES_HoshouUmu       POSITION(*)    CHAR(01),
    QVES_TanpoKbn        POSITION(*)    CHAR(01),
    QVES_KNRSyounin      POSITION(*)    CHAR(02),
    QVES_KNRSyouninKbn   POSITION(*)    CHAR(01),
    QVES_KNRSyazetu      POSITION(*)    CHAR(02),
    QVES_KNRSyouninYmd   POSITION(*)    DECIMAL(7),
    QVES_KNRSyazetuYmd   POSITION(*)    DECIMAL(7),
    QVES_KNRKeijouFlg    POSITION(*)    CHAR(01),
    QVES_KNRSyazetuFlg   POSITION(*)    CHAR(01),
    QVES_KNRMeisaiFlg    POSITION(*)    CHAR(01),
    QVES_KNRFurikomiFlg  POSITION(*)    CHAR(01),
    QVES_TatenaosiKbn    POSITION(*)    CHAR(01),
    QVES_SeikyuMinyuKng  POSITION(*)    DECIMAL(9),
    QVES_TorihikiNo      POSITION(*)    DECIMAL(7),
    QVES_Sekushon                                   CONSTANT 0,
    QVES_Yobi1           POSITION(*+02) CHAR(24),
    QVES_Shimei          POSITION(*)    CHAR(30),
    QVES_Riyumei         POSITION(*)    CHAR(40),
    QVES_Bikou           POSITION(*)    CHAR(40)
   )
