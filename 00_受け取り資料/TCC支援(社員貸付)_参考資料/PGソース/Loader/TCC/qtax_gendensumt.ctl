LOAD DATA
CHARACTERSET JA16SJIS
-- INFILE '*' "fix 100"
APPEND
INTO TABLE QTAX_GendenSumT
(
    QTAX_PRMDensoDate         POSITION(0001:0007)    CHAR,                                      --伝送日
    QTAX_PRMSEQ               POSITION(0008:0014)    CHAR,                                      --SEQNO
    QTAX_CardKBN              POSITION(0015:0020)    CHAR,                                      --カード区分
    QTAX_PRMSMTakaKBN         POSITION(0021:0021)    CHAR  "NVL(:QTAX_PRMSMTakaKBN,' ')",       --高島屋区分
    QTAX_PRMSMTeikeiKBN       POSITION(0022:0022)    CHAR,                                      --提携区分
    QTAX_PRMSMKeijyoDate      POSITION(0023:0027)    CHAR,                                      --計上年月
    QTAX_PRMSMJyogeKBN        POSITION(0028:0028)    CHAR,                                      --上下区分
    QTAX_URITorihikiKBN       POSITION(0029:0029)    CHAR  NULLIF QTAX_URITorihikiKBN=BLANKS,   --取引区分
    QTAX_URIKokunaigai        POSITION(0030:0030)    CHAR  NULLIF QTAX_URIKokunaigai=BLANKS,    --国内・外識別
    QTAX_URIShiharaiHoho      POSITION(0031:0032)    CHAR,                                      --支払方法
    QTAX_URIBunkatsu          POSITION(0033:0035)    CHAR,                                      --分割回数
    QTAX_Kensu                POSITION(0036:0042)    CHAR,                                      --件数
    QTAX_GakuGokei            POSITION(0043:0054)    CHAR,                                      --利用額合計
    QTAX_Daigaku              POSITION(0055:0066)    CHAR,                                      --商品代金
    QTAX_Zeigaku              POSITION(0067:0078)    CHAR,                                      --税金額
    QTAX_Warigaku             POSITION(0079:0090)    CHAR                                       --割引金額
)
