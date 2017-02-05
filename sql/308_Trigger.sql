-- define logfile = &header..log
define logfile = &header.308_Trigger.log

spool &logfile.

set heading off
select '######- 308_Trigger.log' from dual;
set heading on

clear col

col TRIGGERING_EVENT	for a30
col COLUMN_NAME			for a20

select
	OWNER
	, TRIGGER_NAME
	, TRIGGER_TYPE
	, TRIGGERING_EVENT
	, TABLE_OWNER
	, BASE_OBJECT_TYPE
	, TABLE_NAME
	, COLUMN_NAME
	, STATUS
	, BEFORE_STATEMENT
	, BEFORE_ROW
	, AFTER_ROW
	, AFTER_STATEMENT
	, INSTEAD_OF_ROW
from
	DBA_TRIGGERS
where
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, TRIGGER_NAME
	, TRIGGER_TYPE
	, TRIGGERING_EVENT
	, TABLE_OWNER
	, BASE_OBJECT_TYPE
	, TABLE_NAME
	, COLUMN_NAME
	, STATUS
	, BEFORE_STATEMENT
	, BEFORE_ROW
	, AFTER_ROW
	, AFTER_STATEMENT
	, INSTEAD_OF_ROW
/


spool off
