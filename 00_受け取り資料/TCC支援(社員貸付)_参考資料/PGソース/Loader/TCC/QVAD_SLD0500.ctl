--   NAME
--    QVAD_SLD0500.ctl
--   DESCRIPTION
--     <システム名: クレジットシステム>
--     <業務名    : クレジット帳票>
--     <対象データ: 請求留置指示者データ>
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
   INFILE * "FIX 184"
   APPEND
   PRESERVE BLANKS
   INTO TABLE QVE5_TomeokiT
   (
    QVE5_RecLen                                   CONSTANT 0,
    QVE5_Yobi                                     CONSTANT 0,
    QVE5_TanmatuMei    POSITION(*+04) CHAR(08),
    QVE5_KyouTouzaiKbn POSITION(*)    CHAR(01),
    QVE5_KigyouCd      POSITION(*)    CHAR(04),
    QVE5_JigyoubuCd    POSITION(*)    CHAR(02),
    QVE5_KyouMiseCd    POSITION(*)    CHAR(02),
    QVE5_TantouShaCd   POSITION(*)    CHAR(07),
    QVE5_SystemKbn     POSITION(*)    CHAR(01),
    QVE5_SubSystemKbn  POSITION(*)    CHAR(01),
    QVE5_ProcessKbn    POSITION(*)    CHAR(01),
    QVE5_ProcessNo     POSITION(*)    CHAR(02),
    QVE5_ProgramNo     POSITION(*)    CHAR(02),
    QVE5_ModuleNo      POSITION(*)    CHAR(01),
    QVE5_KyouShoriKbn  POSITION(*)    CHAR(01),
    QVE5_KyouShoriYmd  POSITION(*)    CHAR(07),
    QVE5_YouBi         POSITION(*)    CHAR(01),
    QVE5_KyouShoriTime POSITION(*)    CHAR(08),
    QVE5_LOGShubetu    POSITION(*)    CHAR(01),
    QVE5_SSubSystemKbn POSITION(*)    CHAR(01),
    QVE5_ShoriNo       POSITION(*)    CHAR(02),
    QVE5_EntryKey1     POSITION(*)    DECIMAL(4),
    QVE5_EntryKey2     POSITION(*)    DECIMAL(4),
    QVE5_EntryKey3     POSITION(*)    DECIMAL(8),
    QVE5_KaiinNo       POSITION(*)    DECIMAL(16),
    QVE5_Shimei        POSITION(*)    CHAR(30),
    QVE5_58Kbn         POSITION(*)    CHAR(03),
    QVE5_58KbnMei      POSITION(*)    CHAR(20),
    QVE5_KanriTen      POSITION(*)    CHAR(02),
    QVE5_TantouTen     POSITION(*)    CHAR(02),
    QVE5_SijiKbn1      POSITION(*)    CHAR(01),
    QVE5_Riyuu1        POSITION(*)    CHAR(02),
    QVE5_KigenYm1      POSITION(*)    DECIMAL(5),
    QVE5_SijiYmd1      POSITION(*)    DECIMAL(7),
    QVE5_SijiKbn2      POSITION(*)    CHAR(01),
    QVE5_Riyuu2        POSITION(*)    CHAR(02),
    QVE5_KigenYm2      POSITION(*)    DECIMAL(5),
    QVE5_SijiYmd2      POSITION(*)    DECIMAL(7),
    QVE5_SijiKbn3      POSITION(*)    CHAR(01),
    QVE5_Riyuu3        POSITION(*)    CHAR(02),
    QVE5_KigenYm3      POSITION(*)    DECIMAL(5),
    QVE5_SijiYmd3      POSITION(*)    DECIMAL(7),
    QVE5_SijiKbn4      POSITION(*)    CHAR(01),
    QVE5_Riyuu4        POSITION(*)    CHAR(02),
    QVE5_KigenYm4      POSITION(*)    DECIMAL(5),
    QVE5_SijiYmd4      POSITION(*)    DECIMAL(7),
    QVE5_SijiKbn5      POSITION(*)    CHAR(01),
    QVE5_Riyuu5        POSITION(*)    CHAR(02),
    QVE5_KigenYm5      POSITION(*)    DECIMAL(5),
    QVE5_SijiYmd5      POSITION(*)    DECIMAL(7),
    QVE5_HostKekka     CONSTANT ' '
   )
