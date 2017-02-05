-- define logfile = &header..log
define logfile = &header.203_System_privilege_granted_to_role.log

spool &logfile.

set heading off
select '######- 203_System_privilege_granted_to_role.log' from dual;
set heading on

clear col

col ADMIN_OPTION	for a20

select
	ROLE
	, PRIVILEGE
	, ADMIN_OPTION
from
	ROLE_SYS_PRIVS
where
	ROLE not in ( &excluded_roles. )
order by
	ROLE
	, PRIVILEGE
	, ADMIN_OPTION
/

spool off
