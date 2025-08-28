CREATE VIEW QBVJ_QB00010P ( 
NO
,CODE
,STRYEAR
,NUMMONTH
 ) AS 
select
QBE3_UKETSUKENO NO,
'01' CODE,
to_char(add_months(a.QBE3_WFSTRDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(a.QBE3_WFSTRDATE,-2),'MM')) numMonth
from QBE3_TOKEIT a
where a.QBE3_WFSTRDATE is not null
union
select
QBE3_UKETSUKENO NO,
'02' CODE,
to_char(add_months(b.QBE3_PASSWORDNRKDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(b.QBE3_PASSWORDNRKDATE,-2),'MM')) numMonth
from QBE3_TOKEIT b
where b.QBE3_PASSWORDNRKDATE is not null
union
select
QBE3_UKETSUKENO NO,
'03' CODE,
to_char(add_months(c.QBE3_PASSWORDSISDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(c.QBE3_PASSWORDSISDATE,-2),'MM')) numMonth
from QBE3_TOKEIT c
where c.QBE3_PASSWORDSISDATE is not null
union
select
QBE3_UKETSUKENO NO,
'04' CODE,
to_char(add_months(d.QBE3_MOUSINRKDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(d.QBE3_MOUSINRKDATE,-2),'MM')) numMonth
from QBE3_TOKEIT d
where d.QBE3_MOUSINRKDATE is not null
union
select
QBE3_UKETSUKENO NO,
'05' CODE,
to_char(add_months(e.QBE3_MOUSISISDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(e.QBE3_MOUSISISDATE,-2),'MM')) numMonth
from QBE3_TOKEIT e
where e.QBE3_MOUSISISDATE is not null
union
select
QBE3_UKETSUKENO NO,
'06' CODE,
to_char(add_months(f.QBE3_INQIRAIDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(f.QBE3_INQIRAIDATE,-2),'MM')) numMonth
from QBE3_TOKEIT f
where f.QBE3_INQIRAIDATE is not null
union
select
QBE3_UKETSUKENO NO,
'07' CODE,
to_char(add_months(g.QBE3_INQKAKUTEIDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(g.QBE3_INQKAKUTEIDATE,-2),'MM')) numMonth
from QBE3_TOKEIT g
where g.QBE3_INQKAKUTEIDATE is not null
union
select
QBE3_UKETSUKENO NO,
'08' CODE,
to_char(add_months(h.QBE3_ZAIKAKUWAKEDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(h.QBE3_ZAIKAKUWAKEDATE,-2),'MM')) numMonth
from QBE3_TOKEIT h
where h.QBE3_ZAIKAKUWAKEDATE is not null
union
select
QBE3_UKETSUKENO NO,
'09' CODE,
to_char(add_months(i.QBE3_ZAIKAKUDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(i.QBE3_ZAIKAKUDATE,-2),'MM')) numMonth
from QBE3_TOKEIT i
where i.QBE3_ZAIKAKUDATE is not null
union
select
QBE3_UKETSUKENO NO,
'10' CODE,
to_char(add_months(j.QBE3_JIDOUSINSADATE,-2),'YYYY') strYear,
to_number(to_char(add_months(j.QBE3_JIDOUSINSADATE,-2),'MM')) numMonth
from QBE3_TOKEIT j
where j.QBE3_JIDOUSINSADATE is not null
union
select
QBE3_UKETSUKENO NO,
'11' CODE,
to_char(add_months(k.QBE3_2JISINSAIRAIDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(k.QBE3_2JISINSAIRAIDATE,-2),'MM')) numMonth
from QBE3_TOKEIT k
where k.QBE3_2JISINSAIRAIDATE is not null
union
select
QBE3_UKETSUKENO NO,
'12' CODE,
to_char(add_months(l.QBE3_2JISINSAKNRDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(l.QBE3_2JISINSAKNRDATE,-2),'MM')) numMonth
from QBE3_TOKEIT l
where l.QBE3_2JISINSAKNRDATE is not null
union
select
QBE3_UKETSUKENO NO,
'13' CODE,
to_char(add_months(m.QBE3_ISHIKAKUWAKEDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(m.QBE3_ISHIKAKUWAKEDATE,-2),'MM')) numMonth
from QBE3_TOKEIT m
where m.QBE3_ISHIKAKUWAKEDATE is not null
union
select
QBE3_UKETSUKENO NO,
'14' CODE,
to_char(add_months(n.QBE3_ISHIKAKUDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(n.QBE3_ISHIKAKUDATE,-2),'MM')) numMonth
from QBE3_TOKEIT n
where n.QBE3_ISHIKAKUDATE is not null
union
select
QBE3_UKETSUKENO NO,
'15' CODE,
to_char(add_months(o.QBE3_MASTERSTRIRAIDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(o.QBE3_MASTERSTRIRAIDATE,-2),'MM')) numMonth
from QBE3_TOKEIT o
where o.QBE3_MASTERSTRIRAIDATE is not null
union
select
QBE3_UKETSUKENO NO,
'16' CODE,
to_char(add_months(p.QBE3_MASTERSTRKNRDATE,-2),'YYYY') strYear,
to_number(to_char(add_months(p.QBE3_MASTERSTRKNRDATE,-2),'MM')) numMonth
from QBE3_TOKEIT p
where p.QBE3_MASTERSTRKNRDATE is not null
;
