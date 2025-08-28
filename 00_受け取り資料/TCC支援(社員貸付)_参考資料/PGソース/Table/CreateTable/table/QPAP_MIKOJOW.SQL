CREATE TABLE TCCUSER.QPAP_MIKOJOW
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* テーブル名    ：QPAQ_ZANDAKAW                                                                                  */
/* 作成日        ：YYYY/MM/DD                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100803  1004091          ソート順変更及び、東西データ分割出力廃止対応                                        */
/******************************************************************************************************************/
(
	QPAP_MISECD					CHAR(3),
	QPAP_MISENM					VARCHAR2(24),
	QPAP_BUMONCD				CHAR(6),
	QPAP_BUMONNM				VARCHAR2(24),
	QPAP_SYAINCD1				CHAR(1),
	QPAP_SYAINCD2				CHAR(7),
	QPAP_SIMEIKANJI				VARCHAR2(40),
	QPAP_SYUBETU				CHAR(1),
	QPAP_KYUYOZANDAKA			NUMBER(7,0),
	QPAP_SYOYOZANDAKA			NUMBER(7,0),
	QPAP_USERID					VARCHAR2(8),
	QPAP_COMPUTERNM				VARCHAR2(20),
	QPAP_KAISYACD				CHAR(3),			-- ADD 20100803 1004091
	QPAP_KAISYANM				VARCHAR2(24),		-- ADD 20100803 1004091
	QPAP_TOZAIKBN				CHAR(1)				-- ADD 20100803 1004091
)
PCTFREE 10
MAXTRANS 255
TABLESPACE SYAINLOAN
STORAGE(INITIAL 700K MINEXTENTS 1 MAXEXTENTS 100 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
