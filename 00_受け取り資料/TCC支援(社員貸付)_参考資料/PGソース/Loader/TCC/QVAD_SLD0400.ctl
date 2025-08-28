--   NAME
--    QVAD_SLD0400.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 入金相殺結果リストデータ>
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
   INFILE * "FIX 138"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE4_SousaiT
   (
    QVE4_RecLen                                     CONSTANT 0,
    QVE4_Yobi                                       CONSTANT 0,
    QVE4_TanmatuMei      POSITION(*+04) CHAR(08),
    QVE4_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVE4_KigyouCd        POSITION(*)    CHAR(04),
    QVE4_JigyoubuCd      POSITION(*)    CHAR(02),
    QVE4_KyouMiseCd      POSITION(*)    CHAR(02),
    QVE4_TantouShaCd     POSITION(*)    CHAR(07),
    QVE4_SystemKbn       POSITION(*)    CHAR(01),
    QVE4_SubSystemKbn    POSITION(*)    CHAR(01),
    QVE4_ProcessKbn      POSITION(*)    CHAR(01),
    QVE4_ProcessNo       POSITION(*)    CHAR(02),
    QVE4_ProgramNo       POSITION(*)    CHAR(02),
    QVE4_ModuleNo        POSITION(*)    CHAR(01),
    QVE4_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVE4_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVE4_YouBi           POSITION(*)    CHAR(01),
    QVE4_KyouShoriTime   POSITION(*)    CHAR(08),
    QVE4_LOGShubetu      POSITION(*)    CHAR(01),
    QVE4_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVE4_ShoriNo         POSITION(*)    CHAR(02),
    QVE4_MiseCd          POSITION(*)    CHAR(02),
    QVE4_58Kbn           POSITION(*)    CHAR(03),
    QVE4_KaiinNo         POSITION(*)    DECIMAL(16),
    QVE4_Shimei          POSITION(*)    CHAR(30),
    QVE4_NyukinYmd       POSITION(*)    DECIMAL(7),
    QVE4_NyukinKeijouYmd POSITION(*)    DECIMAL(7),
    QVE4_NyukinSousaiKng POSITION(*)    DECIMAL(10),
    QVE4_SousaiCd        POSITION(*)    CHAR(03),
    QVE4_SousaiCdMei     POSITION(*)    CHAR(20)
   )
