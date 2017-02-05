-- define logfile = &header..log
define logfile = &header.318_Other_objects.log

spool &logfile.

set heading off
select '######- 318_Other_objects.log' from dual;
set heading on

clear col

col OBJECT_NAME		for a40
col TEMPORARY		for a10
col GENERATED		for a10
select
	OWNER
	, OBJECT_TYPE
	, OBJECT_NAME
--	, SUBOBJECT_NAME
--	, CREATED
--	, LAST_DDL_TIME
--	, TIMESTAMP
	, STATUS
	, TEMPORARY
	, GENERATED
from
	DBA_OBJECTS
where
	OWNER not in ( &excluded_users. )
	and
	OBJECT_TYPE not in (
		'DATABASE LINK'
		, 'TABLE'
		, 'INDEX'
		, 'LOB'
		, 'VIEW'
		, 'MATERIALIZED VIEW'
		, 'TRIGGER'
		, 'SEQUENCE'
		, 'SYNONYM'
		, 'FUNCTION'
		, 'PROCEDURE'
		, 'PACKAGE'
		, 'PACKAGE BODY'
		, 'TYPE'
	)
order by
	OWNER
	, OBJECT_TYPE
	, OBJECT_NAME
--	, SUBOBJECT_NAME
--	, CREATED
--	, LAST_DDL_TIME
--	, TIMESTAMP
	, STATUS
	, TEMPORARY
	, GENERATED
/

spool off
