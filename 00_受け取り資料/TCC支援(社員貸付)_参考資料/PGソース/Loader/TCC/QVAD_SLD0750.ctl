--   NAME
--    QVAD_SLD0750.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 年会費徴求指示者データ>
--   RETURNS
--
--   NOTES
--
--   MODIFIED   (MM/DD/YY)
--               09/26/03 -  作成
--
--
--OPTIONS
--(DIRECT=TRUE)

LOAD DATA
   INFILE * "FIX 185"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVEL_NENKAIHIT
   (
    QVEL_RecLen                                     CONSTANT 0,
    QVEL_Yobi                                       CONSTANT 0,
    QVEL_TanmatuMei      POSITION(*+04) CHAR(08),
    QVEL_KyouTouzaiKbn   POSITION(*)    CHAR(01),
    QVEL_KigyouCd        POSITION(*)    CHAR(04),
    QVEL_JigyoubuCd      POSITION(*)    CHAR(02),
    QVEL_KyouMiseCd      POSITION(*)    CHAR(02),
    QVEL_TantouShaCd     POSITION(*)    CHAR(07),
    QVEL_SystemKbn       POSITION(*)    CHAR(01),
    QVEL_SubSystemKbn    POSITION(*)    CHAR(01),
    QVEL_ProcessKbn      POSITION(*)    CHAR(01),
    QVEL_ProcessNo       POSITION(*)    CHAR(02),
    QVEL_ProgramNo       POSITION(*)    CHAR(02),
    QVEL_ModuleNo        POSITION(*)    CHAR(01),
    QVEL_KyouShoriKbn    POSITION(*)    CHAR(01),
    QVEL_KyouShoriYmd    POSITION(*)    CHAR(07),
    QVEL_YouBi           POSITION(*)    CHAR(01),
    QVEL_KyouShoriTime   POSITION(*)    CHAR(08),
    QVEL_LOGShubetu      POSITION(*)    CHAR(01),
    QVEL_SSubSystemKbn   POSITION(*)    CHAR(01),
    QVEL_ShoriNo         POSITION(*)    CHAR(02),
    QVEL_ENTKigyoCd      POSITION(*)    CHAR(04),
    QVEL_ENTSubRangeKey  POSITION(*)    CHAR(04),
    QVEL_ENTNaibuKaiinNo POSITION(*)    CHAR(08),
    QVEL_KZKKaiinNo      POSITION(*)    CHAR(16),
    QVEL_KZKShimei       POSITION(*)    CHAR(30),
    QVEL_KZK58Kbn        POSITION(*)    CHAR(03),
    QVEL_KZK58KbnMei     POSITION(*)    CHAR(20),
    QVEL_KZKKanritenCd   POSITION(*)    CHAR(02),
    QVEL_KZKSeikyuUmu    POSITION(*)    CHAR(01),
    QVEL_BefSyoriKBN     POSITION(*)    CHAR(01),
    QVEL_BefSyoriKBNMei  POSITION(*)    CHAR(12),
    QVEL_AftSyoriKBN     POSITION(*)    CHAR(01),
    QVEL_AftSyoriKBNMei  POSITION(*)    CHAR(12),
    QVEL_SJISeikyuYm     POSITION(*)    CHAR(06),
    QVEL_SJIYmd          POSITION(*)    CHAR(08)
   )
