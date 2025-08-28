--   NAME
--    QVAD_SLD0600.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 自振上乗指示者データ>
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
   INFILE * "FIX 239"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE6_UwanoseT
   (
    QVE6_RecLen                                      CONSTANT 0,
    QVE6_Yobi                                        CONSTANT 0,
    QVE6_TanmatuMei       POSITION(*+04) CHAR(08),
    QVE6_KyouTouzaiKbn    POSITION(*)    CHAR(01),
    QVE6_KigyouCd         POSITION(*)    CHAR(04),
    QVE6_JigyoubuCd       POSITION(*)    CHAR(02),
    QVE6_KyouMiseCd       POSITION(*)    CHAR(02),
    QVE6_TantouShaCd      POSITION(*)    CHAR(07),
    QVE6_SystemKbn        POSITION(*)    CHAR(01),
    QVE6_SubSystemKbn     POSITION(*)    CHAR(01),
    QVE6_ProcessKbn       POSITION(*)    CHAR(01),
    QVE6_ProcessNo        POSITION(*)    CHAR(02),
    QVE6_ProgramNo        POSITION(*)    CHAR(02),
    QVE6_ModuleNo         POSITION(*)    CHAR(01),
    QVE6_KyouShoriKbn     POSITION(*)    CHAR(01),
    QVE6_KyouShoriYmd     POSITION(*)    CHAR(07),
    QVE6_YouBi            POSITION(*)    CHAR(01),
    QVE6_KyouShoriTime    POSITION(*)    CHAR(08),
    QVE6_LOGShubetu       POSITION(*)    CHAR(01),
    QVE6_SSubSystemKbn    POSITION(*)    CHAR(01),
    QVE6_ShoriNo          POSITION(*)    CHAR(02),
    QVE6_ENTKigyoCd       POSITION(*)    DECIMAL(4),
    QVE6_ENTSubRangeKey   POSITION(*)    DECIMAL(4),
    QVE6_ENTNaibuKaiinNo  POSITION(*)    DECIMAL(8),
    QVE6_KZKKaiinNo       POSITION(*)    DECIMAL(16),
    QVE6_KZKShimei        POSITION(*)    CHAR(30),
    QVE6_KZK58Kbn         POSITION(*)    CHAR(03),
    QVE6_KZKKanritenCd    POSITION(*)    CHAR(02),
    QVE6_KZKTantotenCd    POSITION(*)    CHAR(02),
    QVE6_JKZItakushaCd    POSITION(*)    CHAR(10),
    QVE6_JKZGinkouCd      POSITION(*)    DECIMAL(4),
    QVE6_JKZGinkouMei     POSITION(*)    CHAR(30),
    QVE6_JKZShitenCd      POSITION(*)    DECIMAL(5),
    QVE6_JKZShitenMei     POSITION(*)    CHAR(30),
    QVE6_JKZYokinShumkMei POSITION(*)    CHAR(04),
    QVE6_JKZKouzaNo       POSITION(*)    DECIMAL(8),
    QVE6_JKZKouzameigi    POSITION(*)    CHAR(30),
    QVE6_ZDKKiSeikyuzan   POSITION(*)    DECIMAL(9),
    QVE6_SJIKbn           POSITION(*)    CHAR(01),
    QVE6_SJIYmd           POSITION(*)    DECIMAL(7)
   )
