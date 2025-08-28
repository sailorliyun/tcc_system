CREATE TABLE TCCUSER.QPB4_NEWZANDAKAW
(
    QPB4_TOUZAIKBN                 CHAR(1) NOT NULL,
    QPB4_KAISYACD                  CHAR(3),
    QPB4_KAISYANM                  VARCHAR2(24),
    QPB4_MISECD                    CHAR(3),
    QPB4_MISENM                    VARCHAR2(24),
    QPB4_BUMONCD                   CHAR(6),
    QPB4_BUMONNM                   VARCHAR2(24),
    QPB4_SYAINCD1                  CHAR(1) NOT NULL,
    QPB4_SYAINCD2                  CHAR(7) NOT NULL,
    QPB4_SIMEIKANJI                VARCHAR2(20),
    QPB4_SYUBETU                   CHAR(1) NOT NULL,
    QPB4_YUSIYMD                   CHAR(8),
    QPB4_K_ZENZANDAKA              NUMBER(7,0),
    QPB4_S_ZENZANDAKA              NUMBER(7,0),
    QPB4_K_KASITUKE                NUMBER(7,0),
    QPB4_S_KASITUKE                NUMBER(7,0),
    QPB4_K_NYUKIN                  NUMBER(7,0),
    QPB4_S_NYUKIN                  NUMBER(7,0),
    QPB4_K_ZANDAKA                 NUMBER(7,0),
    QPB4_S_ZANDAKA                 NUMBER(7,0),
    QPB4_K_RISOKU                  NUMBER(7,0),
    QPB4_S_RISOKU                  NUMBER(7,0),
    QPB4_K_MISYUK                  NUMBER(7,0),
    QPB4_S_MISYUK                  NUMBER(7,0),
    QPB4_K_MISYUS                  NUMBER(7,0),
    QPB4_S_MISYUS                  NUMBER(7,0),
    QPB4_USERID                    VARCHAR2(8) NOT NULL,
    QPB4_COMPUTERNM                VARCHAR2(20) NOT NULL
)
PCTFREE 20
INITRANS 2
MAXTRANS 255
TABLESPACE SYAINLON3
STORAGE(INITIAL 1072K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
