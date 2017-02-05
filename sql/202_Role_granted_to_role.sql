-- define logfile = &header..log
define logfile = &header.202_Role_granted_to_role.log

spool &logfile.

set heading off
select '######- 202_Role_granted_to_role.log' from dual;
set heading on

clear col

col ADMIN_OPTION	for a15
col DEFAULT_ROLE	for a15

select
	ROLE
	, GRANTED_ROLE
	, ADMIN_OPTION
from
	ROLE_ROLE_PRIVS
where
	ROLE not in ( &excluded_roles. )
order by
	ROLE
	, GRANTED_ROLE
	, ADMIN_OPTION
/

spool off
