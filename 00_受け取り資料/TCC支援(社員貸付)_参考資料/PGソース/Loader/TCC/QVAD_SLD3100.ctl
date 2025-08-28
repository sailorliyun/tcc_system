--   NAME
--    QVAD_SLD3100.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: ローン承認実行チェックリストデータ>
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
   INTO TABLE QVEU_SyouninT
   (
    QVEU_RecLen                                     CONSTANT 0,
    QVEU_Yobi                                       CONSTANT 0,
    QVEU_TanmatuMei      POSITION(*+04) CHAR(08),
    QVEU_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVEU_KigyouCd        POSITION(*)    CHAR(04),
    QVEU_JigyoubuCd      POSITION(*)    CHAR(02),
    QVEU_KyouMiseCd      POSITION(*)    CHAR(02),
    QVEU_TantouShaCd     POSITION(*)    CHAR(07),
    QVEU_SystemKbn       POSITION(*)    CHAR(01),
    QVEU_SubSystemKbn    POSITION(*)    CHAR(01),
    QVEU_ProcessKbn      POSITION(*)    CHAR(01),
    QVEU_ProcessNo       POSITION(*)    CHAR(02),
    QVEU_ProgramNo       POSITION(*)    CHAR(02),
    QVEU_ModuleNo        POSITION(*)    CHAR(01),
    QVEU_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVEU_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVEU_YouBi           POSITION(*)    CHAR(01),
    QVEU_KyouShoriTime   POSITION(*)    CHAR(08),
    QVEU_LOGShubetu      POSITION(*)    CHAR(01),
    QVEU_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVEU_ShoriNo         POSITION(*)    CHAR(02),
    QVEU_UketukeNo       POSITION(*)    DECIMAL(8),
    QVEU_KaiinNo         POSITION(*)    DECIMAL(16),
    QVEU_RoanKbn         POSITION(*)    CHAR(01),
    QVEU_MiseCd          POSITION(*)    CHAR(02),
    QVEU_MousikomiYmd    POSITION(*)    DECIMAL(7),
    QVEU_RoanShubetu     POSITION(*)    CHAR(05),
    QVEU_Shiharai        POSITION(*)    CHAR(02),
    QVEU_RoanMei         POSITION(*)    CHAR(40),
    QVEU_SyouhinMei      POSITION(*)    CHAR(40),
    QVEU_GoukeiKng       POSITION(*)    DECIMAL(11),
    QVEU_AtamaKng        POSITION(*)    DECIMAL(11),
    QVEU_RoanKng         POSITION(*)    DECIMAL(11),
    QVEU_BonusKng        POSITION(*)    DECIMAL(11),
    QVEU_RisokuRitu      POSITION(*)    DECIMAL(4, 2),
    QVEU_RisokuKng       POSITION(*)    DECIMAL(9),
    QVEU_FuriKng         POSITION(*)    DECIMAL(9),
    QVEU_InsiKng         POSITION(*)    DECIMAL(9),
    QVEU_JimuteKng       POSITION(*)    DECIMAL(9),
    QVEU_RoanHensaiKng   POSITION(*)    DECIMAL(11),
    QVEU_HensaiKaisu     POSITION(*)    CHAR(03),
    QVEU_MaitukiKng      POSITION(*)    DECIMAL(11),
    QVEU_BonusKasanKng   POSITION(*)    DECIMAL(11),
    QVEU_BonusKaisu      POSITION(*)    CHAR(02),
    QVEU_SyokaiBonusYm   POSITION(*)    DECIMAL(5),
    QVEU_KaisiYmd        POSITION(*)    DECIMAL(7),
    QVEU_SaisyuYmd       POSITION(*)    DECIMAL(7),
    QVEU_ShokaiHensaiKng POSITION(*)    DECIMAL(11),
    QVEU_IkouHensaiKng   POSITION(*)    DECIMAL(11),
    QVEU_SaisyuHensaiKng POSITION(*)    DECIMAL(11),
    QVEU_ShokaiBonusKng  POSITION(*)    DECIMAL(11),
    QVEU_FRIGinYubinKbn  POSITION(*)    CHAR(01),
    QVEU_FRIGinkouCd     POSITION(*)    DECIMAL(4),
    QVEU_FRIGinkouMei    POSITION(*)    CHAR(20),
    QVEU_FRISitenCd      POSITION(*)    DECIMAL(05),
    QVEU_FRISitenMei     POSITION(*)    CHAR(20),
    QVEU_FRIShumoku      POSITION(*)    CHAR(01),
    QVEU_FRIKouzaNo      POSITION(*)    DECIMAL(7),
    QVEU_FRIKouzaMei     POSITION(*)    CHAR(30) ,
    QVEU_KeiyakuYoteiYmd POSITION(*)    DECIMAL(7),
    QVEU_KibouYmd        POSITION(*)    DECIMAL(7),
    QVEU_YusiYoteiYmd    POSITION(*)    DECIMAL(7),
    QVEU_KeijouYmd       POSITION(*)    DECIMAL(7),
    QVEU_KisanYmd        POSITION(*)    DECIMAL(7),
    QVEU_HoshouUmu       POSITION(*)    CHAR(01),
    QVEU_TanpoKbn        POSITION(*)    CHAR(01),
    QVEU_KNRSyounin      POSITION(*)    CHAR(02),
    QVEU_KNRSyouninKbn   POSITION(*)    CHAR(01),
    QVEU_KNRSyazetu      POSITION(*)    CHAR(02),
    QVEU_KNRSyouninYmd   POSITION(*)    DECIMAL(7),
    QVEU_KNRSyazetuYmd   POSITION(*)    DECIMAL(7),
    QVEU_KNRKeijouFlg    POSITION(*)    CHAR(01),
    QVEU_KNRSyazetuFlg   POSITION(*)    CHAR(01),
    QVEU_KNRMeisaiFlg    POSITION(*)    CHAR(01),
    QVEU_KNRFurikomiFlg  POSITION(*)    CHAR(01),
    QVEU_TatenaosiKbn    POSITION(*)    CHAR(01),
    QVEU_SeikyuMinyuKng  POSITION(*)    DECIMAL(9),
    QVEU_TorihikiNo      POSITION(*)    DECIMAL(7),
    QVEU_Sekushon                                   CONSTANT 0,
    QVEU_Yobi1           POSITION(*+02) CHAR(24),
    QVEU_Shimei          POSITION(*)    CHAR(30),
    QVEU_Riyumei         POSITION(*)    CHAR(40),
    QVEU_Bikou           POSITION(*)    CHAR(40)
   )
