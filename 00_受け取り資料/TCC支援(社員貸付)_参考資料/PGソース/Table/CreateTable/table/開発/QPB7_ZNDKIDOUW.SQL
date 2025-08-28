CREATE TABLE TCCUSER.QPB7_ZNDKIDOUW
(
    QPB7_IDOUKBN                   CHAR(1) NOT NULL,
    QPB7_KAISYACD                  CHAR(3),
    QPB7_KAISYANM                  VARCHAR2(24),
    QPB7_TOUZAIKBN                 CHAR(1) NOT NULL,
    QPB7_SYOZOKUCD1                CHAR(3),
    QPB7_SYOZOKUNM1                VARCHAR2(24),
    QPB7_SYOZOKUCD2                CHAR(3),
    QPB7_SYOZOKUNM2                VARCHAR2(24),
    QPB7_SYAINCD1                  CHAR(1) NOT NULL,
    QPB7_SYAINCD2                  CHAR(7) NOT NULL,
    QPB7_SIMEIKANJI                VARCHAR2(20),
    QPB7_SYUBETU                   CHAR(1) NOT NULL,
    QPB7_YUSIYMD                   CHAR(8),
    QPB7_K_ZENZANDAKA              NUMBER(7,0),
    QPB7_S_ZENZANDAKA              NUMBER(7,0),
    QPB7_K_KASITUKE                NUMBER(7,0),
    QPB7_S_KASITUKE                NUMBER(7,0),
    QPB7_K_NYUKIN                  NUMBER(7,0),
    QPB7_S_NYUKIN                  NUMBER(7,0),
    QPB7_K_ZANDAKA                 NUMBER(7,0),
    QPB7_S_ZANDAKA                 NUMBER(7,0),
    QPB7_K_RISOKU                  NUMBER(7,0),
    QPB7_S_RISOKU                  NUMBER(7,0),
    QPB7_K_MISYUK                  NUMBER(7,0),
    QPB7_S_MISYUK                  NUMBER(7,0),
    QPB7_K_MISYUS                  NUMBER(7,0),
    QPB7_S_MISYUS                  NUMBER(7,0),
    QPB7_USERID                    VARCHAR2(8) NOT NULL,
    QPB7_COMPUTERNM                VARCHAR2(20) NOT NULL
)
PCTFREE 20
INITRANS 2
MAXTRANS 255
TABLESPACE SYAINLON3
STORAGE(INITIAL 1072K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/


