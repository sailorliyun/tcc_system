--tccadmin���[�U�Ŏ��s�̂���
--���s��͈��S�̂��߁A�Ō�ɂc�a�ڑ���ؒf���邱�ƁI

CREATE TABLESPACE CICTBS
DATAFILE '/d301/DBF/qs_tcc/CICtbs.dbf' SIZE 500K    --�G�N�X�e���g�ŏ��l�ϓ��ƁA�����̊g�����������A(128+64+64)���Q�ŎZ�o
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


--tccuser�ɕ\�̈抄�蓖��
alter user tccuser
quota unlimited on CICTBS
;


alter user tccuser
quota unlimited on CICIDX
;

/* DB�ؒf */
disc
