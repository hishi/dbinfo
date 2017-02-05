-- define logfile = &header..log
define logfile = &header.205_User.log

spool &logfile.

set heading off
select '######- 205_User.log' from dual;
set heading on

clear col

col USERNAME				for a20
col DEFAULT_TABLESPACE		for a20
col TEMPORARY_TABLESPACE	for a20
col PROFILE					for a20
col ACCOUNT_STATUS			for a20
col AUTHENTICATION_TYPE		for a20
col CREATED					for a20
col LOCK_DATE				for a20
col EXPIRY_DATE				for a20
select
	USERNAME
	, DEFAULT_TABLESPACE
	, TEMPORARY_TABLESPACE
	, PROFILE
	, ACCOUNT_STATUS
	, AUTHENTICATION_TYPE
	, CREATED
	, LOCK_DATE
	, EXPIRY_DATE
from
	dba_users
where
	USERNAME not in ( &excluded_users. )
order by
	USERNAME
	, DEFAULT_TABLESPACE
	, TEMPORARY_TABLESPACE
	, PROFILE
	, ACCOUNT_STATUS
	, AUTHENTICATION_TYPE
	, CREATED
	, LOCK_DATE
	, EXPIRY_DATE
/

spool off
