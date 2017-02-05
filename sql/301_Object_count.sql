-- define logfile = &header..log
define logfile = &header.301_Object_count.log

spool &logfile.

set heading off
select '######- 301_Object_count.log' from dual;
set heading on

clear col

col OBJECT_NAME		for a40
select
	OWNER
	, OBJECT_TYPE
	, count(*)
from
	DBA_OBJECTS
where
	OWNER <> 'PUBLIC'
	and
	OWNER not in ( &excluded_users. )
group by
	OWNER
	, OBJECT_TYPE
order by
	OWNER
	, OBJECT_TYPE
/

spool off
