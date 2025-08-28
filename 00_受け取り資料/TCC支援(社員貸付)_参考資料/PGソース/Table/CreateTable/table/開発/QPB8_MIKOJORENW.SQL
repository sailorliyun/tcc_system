CREATE TABLE TCCUSER.QPB8_MIKOJORENW
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* テーブル名    ：QPB8_MIKOJORENW                                                                                */
/* 作成日        ：2010/07/30                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
(
	QPB8_KAISYACD				CHAR(3),
	QPB8_KAISYANM				VARCHAR(24),
	QPB8_TOZAIKBN				CHAR(1),
	QPB8_MISECD					CHAR(3),
	QPB8_MISENM					VARCHAR(24),
	QPB8_BUMONCD				CHAR(6),
	QPB8_BUMONNM				VARCHAR(24),
	QPB8_SYAINCD1				CHAR(1),
	QPB8_SYAINCD2				CHAR(7),
	QPB8_SIMEIKANJI				VARCHAR(40),
	QPB8_SYUBETU				CHAR(1),
	QPB8_YUSIYMD				CHAR(8),
	QPB8_ZANDAKA				NUMBER(7,0),
	QPB8_TAISYOKUYMD			CHAR(8),
	QPB8_USERID					VARCHAR(8),
	QPB8_COMPUTERNM				VARCHAR(20)
)
PCTFREE 10
MAXTRANS 255
TABLESPACE TCCUSERSP
STORAGE(INITIAL 64K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
