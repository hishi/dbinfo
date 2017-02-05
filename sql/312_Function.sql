-- define logfile = &header..log
define logfile = &header.312_Function.log

spool &logfile.

set heading off
select '######- 312_Function.log' from dual;
set heading on

clear col

col OBJECT_NAME		for a40

select
	OWNER
	, OBJECT_TYPE
	, OBJECT_NAME
	, STATUS
from
	DBA_OBJECTS
where
	OBJECT_TYPE like 'FUNCTION%'
	and
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, OBJECT_TYPE
	, OBJECT_NAME
	, STATUS
/



spool off
