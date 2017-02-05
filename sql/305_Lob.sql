-- define logfile = &header..log
define logfile = &header.305_Lob.log

spool &logfile.

set heading off
select '######- 305_Lob.log' from dual;
set heading on

clear col

col COLUMN_NAME		for a70

select
	OWNER
	, TABLE_NAME
	, COLUMN_NAME
	, SEGMENT_NAME
	, TABLESPACE_NAME
	, INDEX_NAME
	, LOGGING
--	, ENCRYPT
--	, COMPRESSION
--	, PARTITIONED
	, SECUREFILE
--	, SEGMENT_CREATED
from
	DBA_LOBS
where
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, TABLE_NAME
	, COLUMN_NAME
	, SEGMENT_NAME
	, TABLESPACE_NAME
	, INDEX_NAME
	, LOGGING
--	, ENCRYPT
--	, COMPRESSION
--	, PARTITIONED
	, SECUREFILE
--	, SEGMENT_CREATED
/

spool off
