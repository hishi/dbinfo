-- define logfile = &header..log
define logfile = &header.302_Database_link.log

spool &logfile.

set heading off
select '######- 302_Database_link.log' from dual;
set heading on

clear col

col DB_LINK	for a40
col HOST	for a40
select
	OWNER
	, DB_LINK
	, USERNAME
	, HOST
	, CREATED
from
	DBA_DB_LINKS
order by
	OWNER
	, DB_LINK
	, USERNAME
	, HOST
	, CREATED
/

spool off
