CREATE TABLE TCCUSER.QPAX_ZANDAKATOTALW
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* テーブル名    ：QPAX_ZANDAKATOTALW                                                                             */
/* 作成日        ：YYYY/MM/DD                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100712  1004091          帳票出力時の東西指定廃止によるソート項目追加                                        */
/******************************************************************************************************************/
(
	QPAX_TOZAIKBNE				CHAR(1),
	QPAX_TOZAIKBNW				CHAR(1),
	QPAX_CODE					CHAR(10),
	QPAX_MISECD					CHAR(3),
	QPAX_MISENM					VARCHAR2(24),
	QPAX_SYOSYOZANDAKA			NUMBER(10,0),
	QPAX_KOGUCHIZANDAKA			NUMBER(10,0),
	QPAX_SYOSYOMISYUK			NUMBER(10,0),
	QPAX_SYOSYOMISYUS			NUMBER(10,0),
	QPAX_KOGUCHIMISYU			NUMBER(10,0),
	QPAX_SYOSYOCOUNT			NUMBER(7,0),
	QPAX_KOGUCHICOUNT			NUMBER(7,0),
	QPAX_USERID					VARCHAR2(8),
	QPAX_COMPUTERNM				VARCHAR2(20),
	QPAX_KAISYACD				CHAR(3),			-- ADD 20100712 1004091
	QPAX_KAISYANM				VARCHAR2(24),		-- ADD 20100712 1004091
	QPAX_TOZAIKBN				CHAR(1)				-- ADD 20100712 1004091
)
PCTFREE 10
MAXTRANS 255
TABLESPACE SYAINLOAN
STORAGE(INITIAL 1M MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
