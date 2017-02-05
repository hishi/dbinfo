-- define logfile = &header..log
define logfile = &header.201_Role.log

spool &logfile.

set heading off
select '######- 201_Role.log' from dual;
set heading on

clear col
-- col ROLE					for a40
col PASSWORD_REQUIRED		for a20
col AUTHENTICATION_TYPE		for a20

select
	ROLE
	, PASSWORD_REQUIRED
	, AUTHENTICATION_TYPE
from
	DBA_ROLES
order by
	ROLE
	, PASSWORD_REQUIRED
	, AUTHENTICATION_TYPE
/

spool off
