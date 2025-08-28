CREATE TABLE TCCUSER.QPAQ_ZANDAKAW
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* テーブル名    ：QPAQ_ZANDAKAW                                                                                  */
/* 作成日        ：YYYY/MM/DD                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100712  1004091          帳票出力時の東西指定廃止によるソート項目追加                                        */
/******************************************************************************************************************/
(
	QPAQ_KAISYACD				CHAR(3),
	QPAQ_KAISYANM				VARCHAR2(24),
	QPAQ_MISECD					CHAR(3),
	QPAQ_MISENM					VARCHAR2(24),
	QPAQ_BUMONCD				CHAR(6),
	QPAQ_BUMONNM				VARCHAR2(24),
	QPAQ_SYAINCD1				CHAR(1),
	QPAQ_SYAINCD2				CHAR(7),
	QPAQ_SIMEIKANJI				VARCHAR2(40),
	QPAQ_SYUBETU				CHAR(1),
	QPAQ_YUSIYMD				CHAR(8),
	QPAQ_SYOSYOZANDAKA			NUMBER(7,0),
	QPAQ_KOGUCHIZANDAKA			NUMBER(7,0),
	QPAQ_SYOSYOMISYUK			NUMBER(7,0),
	QPAQ_SYOSYOMISYUS			NUMBER(7,0),
	QPAQ_KOGUCHIMISYU			NUMBER(7,0),
	QPAQ_SYOSYOCOUNT			NUMBER(1,0),
	QPAQ_KOGUCHICOUNT			NUMBER(1,0),
	QPAQ_USERID					VARCHAR2(8),
	QPAQ_COMPUTERNM				VARCHAR2(20),
	QPAQ_TOZAIKBN				CHAR(1)			-- ADD 20100712 1004091
)
PCTFREE 10
MAXTRANS 255
TABLESPACE TCCUSERSP
STORAGE(INITIAL 64K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
/
