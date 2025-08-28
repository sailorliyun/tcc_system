CREATE OR REPLACE VIEW TCCUSER.QPAV_ZANDAKASUMV
/******************************************************************************************************************/
/* システム名    ：高島屋クレジットシステム                                                                       */
/* 業務名        ：社員貸付システム                                                                               */
/* ビュー名      ：QPAV_ZANDAKASUMV                                                                               */
/* 作成日        ：YYYY/MM/DD                                                                                     */
/* 作成者        ：FIP                                                                                            */
/******************************************************************************************************************/
/******************************************************************************************************************/
/* 更新日付  案件/障害番号    修正理由                                                                            */
/* 20100712  1004091          ワークテーブル修正に伴う変更                                                        */
/******************************************************************************************************************/
	(
	 QPAV_USERID
	,QPAV_COMPUTERNM
	,QPAV_KAISYACD		-- ADD 20100712 1004091
	,QPAV_KAISYANM		-- ADD 20100712 1004091
	,QPAV_TOZAIKBN		-- ADD 20100712 1004091
	,QPAV_MISECD
	,QPAV_SYUBETU
	,QPAV_SYAINCD1
	,QPAV_SYAINCD2
	,QPAV_SYOSYOZANDAKA
	,QPAV_KOGUCHIZANDAKA
	,QPAV_SYOSYOMISYUK
	,QPAV_SYOSYOMISYUS
	,QPAV_KOGUCHIMISYU
	)
AS
	SELECT
		 QPAQ_USERID
		,QPAQ_COMPUTERNM
		,QPAQ_KAISYACD		-- ADD 20100712 1004091
		,QPAQ_KAISYANM		-- ADD 20100712 1004091
		,QPAQ_TOZAIKBN		-- ADD 20100712 1004091
		,QPAQ_MISECD
		,QPAQ_SYUBETU
		,QPAQ_SYAINCD1
		,QPAQ_SYAINCD2
		,SUM(QPAQ_SYOSYOZANDAKA)
		,SUM(QPAQ_KOGUCHIZANDAKA)
		,SUM(QPAQ_SYOSYOMISYUK)
		,SUM(QPAQ_SYOSYOMISYUS)
		,SUM(QPAQ_KOGUCHIMISYU)
	FROM
		QPAQ_ZANDAKAW
	WHERE
		(
			QPAQ_SYOSYOZANDAKA	<> 0
		OR	QPAQ_KOGUCHIZANDAKA	<> 0
		)
	GROUP BY
		 QPAQ_USERID
		,QPAQ_COMPUTERNM
		,QPAQ_KAISYACD		-- ADD 20100712 1004091
		,QPAQ_KAISYANM		-- ADD 20100712 1004091
		,QPAQ_TOZAIKBN		-- ADD 20100712 1004091
		,QPAQ_MISECD
		,QPAQ_SYUBETU
		,QPAQ_SYAINCD1
		,QPAQ_SYAINCD2
/
