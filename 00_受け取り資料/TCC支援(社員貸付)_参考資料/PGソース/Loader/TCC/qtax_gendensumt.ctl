LOAD DATA
CHARACTERSET JA16SJIS
-- INFILE '*' "fix 100"
APPEND
INTO TABLE QTAX_GendenSumT
(
    QTAX_PRMDensoDate         POSITION(0001:0007)    CHAR,                                      --�`����
    QTAX_PRMSEQ               POSITION(0008:0014)    CHAR,                                      --SEQNO
    QTAX_CardKBN              POSITION(0015:0020)    CHAR,                                      --�J�[�h�敪
    QTAX_PRMSMTakaKBN         POSITION(0021:0021)    CHAR  "NVL(:QTAX_PRMSMTakaKBN,' ')",       --�������敪
    QTAX_PRMSMTeikeiKBN       POSITION(0022:0022)    CHAR,                                      --��g�敪
    QTAX_PRMSMKeijyoDate      POSITION(0023:0027)    CHAR,                                      --�v��N��
    QTAX_PRMSMJyogeKBN        POSITION(0028:0028)    CHAR,                                      --�㉺�敪
    QTAX_URITorihikiKBN       POSITION(0029:0029)    CHAR  NULLIF QTAX_URITorihikiKBN=BLANKS,   --����敪
    QTAX_URIKokunaigai        POSITION(0030:0030)    CHAR  NULLIF QTAX_URIKokunaigai=BLANKS,    --�����E�O����
    QTAX_URIShiharaiHoho      POSITION(0031:0032)    CHAR,                                      --�x�����@
    QTAX_URIBunkatsu          POSITION(0033:0035)    CHAR,                                      --������
    QTAX_Kensu                POSITION(0036:0042)    CHAR,                                      --����
    QTAX_GakuGokei            POSITION(0043:0054)    CHAR,                                      --���p�z���v
    QTAX_Daigaku              POSITION(0055:0066)    CHAR,                                      --���i���
    QTAX_Zeigaku              POSITION(0067:0078)    CHAR,                                      --�ŋ��z
    QTAX_Warigaku             POSITION(0079:0090)    CHAR                                       --�������z
)
