--   NAME
--    QVAD_SLD0700.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 残一括請求指示者データ>
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
   INFILE * "FIX 160"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE7_ZanIkkatuT
   (
    QVE7_RecLen                                     CONSTANT 0,
    QVE7_Yobi                                       CONSTANT 0,
    QVE7_TanmatuMei      POSITION(*+04) CHAR(08),
    QVE7_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVE7_KigyouCd        POSITION(*)    CHAR(04),
    QVE7_JigyoubuCd      POSITION(*)    CHAR(02),
    QVE7_KyouMiseCd      POSITION(*)    CHAR(02),
    QVE7_TantouShaCd     POSITION(*)    CHAR(07),
    QVE7_SystemKbn       POSITION(*)    CHAR(01),
    QVE7_SubSystemKbn    POSITION(*)    CHAR(01),
    QVE7_ProcessKbn      POSITION(*)    CHAR(01),
    QVE7_ProcessNo       POSITION(*)    CHAR(02),
    QVE7_ProgramNo       POSITION(*)    CHAR(02),
    QVE7_ModuleNo        POSITION(*)    CHAR(01),
    QVE7_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVE7_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVE7_YouBi           POSITION(*)    CHAR(01),
    QVE7_KyouShoriTime   POSITION(*)    CHAR(08),
    QVE7_LOGShubetu      POSITION(*)    CHAR(01),
    QVE7_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVE7_ShoriNo         POSITION(*)    CHAR(02),
    QVE7_ENTKigyoCd      POSITION(*)    DECIMAL(4),
    QVE7_ENTSubRangeKey  POSITION(*)    DECIMAL(4),
    QVE7_ENTNaibuKaiinNo POSITION(*)    DECIMAL(8),
    QVE7_KZKKaiinNo      POSITION(*)    DECIMAL(16),
    QVE7_KZKShimei       POSITION(*)    CHAR(30),
    QVE7_KZK58Kbn        POSITION(*)    CHAR(03),
    QVE7_KZK58KbnMei     POSITION(*)    CHAR(20),
    QVE7_KZKKanritenCd   POSITION(*)    CHAR(02),
    QVE7_KZKSeikyuUmu    POSITION(*)    CHAR(01),
    QVE7_SJIKbn          POSITION(*)    CHAR(01),
    QVE7_SJIKbnMei       POSITION(*)    CHAR(08),
    QVE7_SJISeikyuYm     POSITION(*)    DECIMAL(5),
    QVE7_SJITeChokyuKbn  POSITION(*)    CHAR(01),
    QVE7_SJITeChokyuMei  POSITION(*)    CHAR(10),
    QVE7_SJIYmd          POSITION(*)    DECIMAL(7)
   )
