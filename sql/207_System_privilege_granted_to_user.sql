-- define logfile = &header..log
define logfile = &header.207_System_privilege_granted_to_user.log

spool &logfile.

set heading off
select '######- 207_System_privilege_granted_to_user.log' from dual;
set heading on

clear col

col ADMIN_OPTION	for a20

select
	GRANTEE
	, PRIVILEGE
	, ADMIN_OPTION
from
	DBA_SYS_PRIVS
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
	, PRIVILEGE
	, ADMIN_OPTION
/


spool off
