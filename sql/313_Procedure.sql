-- define logfile = &header..log
define logfile = &header.313_Procedure.log

spool &logfile.

set heading off
select '######- 313_Procedure.log' from dual;
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
	OBJECT_TYPE like 'PROCEDURE%'
	and
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, OBJECT_TYPE
	, OBJECT_NAME
	, STATUS
/



spool off
