-- define logfile = &header..log
define logfile = &header.316_Directory.log

spool &logfile.

set heading off
select '######- 316_Directory.log' from dual;
set heading on

clear col

col DIRECTORY_PATH	for a60

select
	OWNER
	, DIRECTORY_NAME
	, DIRECTORY_PATH
from
	DBA_DIRECTORIES
order by
	OWNER
	, DIRECTORY_NAME
	, DIRECTORY_PATH
/

spool off
