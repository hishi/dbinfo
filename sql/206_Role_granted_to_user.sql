-- define logfile = &header..log
define logfile = &header.206_Role_granted_to_user.log

spool &logfile.

set heading off
select '######- 206_Role_granted_to_user.log' from dual;
set heading on

clear col

-- col GRANTEE			for a20
-- col GRANTED_ROLE	for a20
col ADMIN_OPTION	for a20
col DEFAULT_ROLE	for a20

select
	GRANTEE
	, GRANTED_ROLE
	, ADMIN_OPTION
	, DEFAULT_ROLE
from
	DBA_ROLE_PRIVS
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
	, GRANTED_ROLE
	, ADMIN_OPTION
	, DEFAULT_ROLE
/

spool off
