CREATE TABLE TCCUSER.QPB9_FURIKOMISKM
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* テーブル名    ：QPB9_FURIKOMISKM                                                                               */
/* 作成日        ：2010/08/24                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
(
	QPB9_PRMKAISYACD			CHAR(3),
	QPB9_SYOZAICHI1				VARCHAR(40),
	QPB9_SYOZAICHI2				VARCHAR(40),
	QPB9_KAISYANM				VARCHAR(40),
	QPB9_FURIKOMIBK				VARCHAR(40),
	QPB9_KOZANO					VARCHAR(40),
	QPB9_KOZANM					VARCHAR(40),
	PRIMARY KEY (QPB9_PRMKAISYACD) USING INDEX
)
PCTFREE 10
MAXTRANS 255
TABLESPACE TCCUSERSP
STORAGE(INITIAL 64K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
