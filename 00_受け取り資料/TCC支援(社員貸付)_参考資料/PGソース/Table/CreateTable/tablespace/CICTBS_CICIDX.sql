--tccadminユーザで実行のこと
--実行後は安全のため、最後にＤＢ接続を切断すること！

CREATE TABLESPACE CICTBS
DATAFILE '/d301/DBF/qs_tcc/CICtbs.dbf' SIZE 500K    --エクステント最小値変動と、将来の拡張を加味し、(128+64+64)＊２で算出
EXTENT MANAGEMENT LOCAL
LOGGING
ONLINE
;


CREATE TABLESPACE CICIDX
-- DATAFILE '/d301/DBF/qs_tcc/CICidx.dbf' SIZE 300K
DATAFILE '/d301/DBF/qs_tcc/CICidx.dbf' SIZE 640K
EXTENT MANAGEMENT LOCAL
LOGGING
ONLINE
;


--tccuserに表領域割り当て
alter user tccuser
quota unlimited on CICTBS
;


alter user tccuser
quota unlimited on CICIDX
;

/* DB切断 */
disc
