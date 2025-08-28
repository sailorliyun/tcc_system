CREATE VIEW QBVI_QB00009P ( 
CARDKBN
,CARDMEI
,STR_YEAR
,NUM_MON
,NUM_DAYS
 ) AS 
SELECT
QBE3_CARDKBN CARDKBN,
QTA6_CARDMEI CARDMEI,
-- 99/12/20 計上日の変更　登録日　→　発券日
to_char(add_months(QBE3_HAKKENDATE,-2),'YYYY') STR_YEAR,
to_number(to_char(add_months(QBE3_HAKKENDATE,-2),'MM')) NUM_MON,
-- to_char(add_months(QBE3_WFSTRDATE,-2),'YYYY') STR_YEAR,
-- to_number(to_char(add_months(QBE3_WFSTRDATE,-2),'MM')) NUM_MON,
-- 99/12/09 日数の計算方法の変更
to_date(to_char(QBE3_HAKKENDATE,'yyyy/mm/dd')) - to_date(to_char(QBE3_WFSTRDATE,'yyyy/mm/dd')) NUM_DAYS
--to_number(to_char(to_char(QBE3_HAKKENDATE,'yyyymmdd') - 
--to_char(QBE3_WFSTRDATE,'yyyymmdd'))) NUM_DAYS
from qbe3_tokeit, qta6_cardctrlt
where QBE3_CARDKBN = QTA6_PRMCARDKBN
  and QBE3_HAKKENDATE is not null
  and QBE3_WFSTRDATE is not null
;
