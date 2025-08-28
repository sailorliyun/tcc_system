CREATE TABLE TCCUSER.QPB3_ZNDKRRK
(
    QPB3_SYAINCD1                  CHAR(1),
    QPB3_SYAINCD2                  CHAR(7) NOT NULL,
    QPB3_SYUBETU                   CHAR(1) NOT NULL,
    QPB3_YUSIYMD                   DATE,
    QPB3_SYORIYMD                  DATE NOT NULL,
    QPB3_SYORIKBN                  CHAR(1) NOT NULL,
    QPB3_FZANDAKA                  NUMBER(7,0),
    QPB3_KASHITSUKE                NUMBER(7,0),
    QPB3_GANKIN                    NUMBER(7,0),
    QPB3_KJRISOKU                  NUMBER(7,0),
    QPB3_ZANDAKA                   NUMBER(7,0),
    QPB3_MKOJOYMD                  DATE,
    QPB3_MGANKINK                  NUMBER(7,0),
    QPB3_KJRISOKUK                 NUMBER(7,0),
    QPB3_MGANKINS                  NUMBER(7,0),
    QPB3_KJRISOKUS                 NUMBER(7,0),
    QPB3_KUSNFLG                   CHAR(1),
    QPB3_TURKYMD                   DATE NOT NULL,
    QPB3_KUSNYMD                   DATE NOT NULL
)
PCTFREE 20
INITRANS 2
MAXTRANS 255
TABLESPACE SYAINLON3
STORAGE(INITIAL 360K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
