-- define logfile = &header..log
define logfile = &header.204_Object_privilege_granted_to_role.log

spool &logfile.

set heading off
select '######- 204_Object_privilege_granted_to_role.log' from dual;
set heading on

clear col

-- col ROLE		for a20
-- col OWNER		for a20
-- col TABLE_NAME	for a20
col COLUMN_NAME	for a20
col PRIVILEGE	for a20
col GRANTABLE	for a20

select
	ROLE
	, OWNER
	, TABLE_NAME
	, COLUMN_NAME
	, PRIVILEGE
	, GRANTABLE
from
	ROLE_TAB_PRIVS
where
	ROLE not in ( &excluded_roles. )
order by
	ROLE
	, OWNER
	, TABLE_NAME
	, COLUMN_NAME
	, PRIVILEGE
	, GRANTABLE
/

spool off
