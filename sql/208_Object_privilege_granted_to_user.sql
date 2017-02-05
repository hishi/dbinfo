-- define logfile = &header..log
define logfile = &header.208_Object_privilege_granted_to_user.log

spool &logfile.

set heading off
select '######- 208_Object_privilege_granted_to_user.log' from dual;
set heading on

clear col

col GRANTABLE	for a10
col HIERARCHY	for a10
select
	GRANTEE
	, OWNER
	, TABLE_NAME
	, GRANTOR
	, PRIVILEGE
	, GRANTABLE
	, HIERARCHY
from
	DBA_TAB_PRIVS
where
	GRANTEE in (
		select
			USERNAME
		from
			DBA_USERS
		where
			USERNAME not in (
				&excluded_users.
			)
	)
order by
	GRANTEE
	, OWNER
	, TABLE_NAME
	, GRANTOR
	, PRIVILEGE
	, GRANTABLE
	, HIERARCHY
/


spool off
