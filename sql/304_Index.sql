-- define logfile = &header..log
define logfile = &header.304_Index.log

spool &logfile.

set heading off
select '######- 304_Index.log' from dual;
set heading on

clear col


col TEMPORARY	for a10
select
	OWNER
	, INDEX_NAME
	, INDEX_TYPE
	, TABLESPACE_NAME
	, TABLE_OWNER
	, TABLE_NAME
--	, TABLE_TYPE
--	, COMPRESSION
	, STATUS
	, LOGGING
--	, NUM_ROWS
	, TEMPORARY
	, LAST_ANALYZED
--	, DEGREE
--	, PARTITIONED
--	, BUFFER_POOL
--	, FLASH_CACHE
--	, CELL_FLASH_CACHE
--	, VISIBILITY
from
	DBA_INDEXES
where
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, INDEX_NAME
	, INDEX_TYPE
	, TABLESPACE_NAME
	, TABLE_OWNER
	, TABLE_NAME
--	, TABLE_TYPE
--	, COMPRESSION
	, STATUS
	, LOGGING
--	, NUM_ROWS
	, TEMPORARY
	, LAST_ANALYZED
--	, DEGREE
--	, PARTITIONED
--	, BUFFER_POOL
--	, FLASH_CACHE
--	, CELL_FLASH_CACHE
--	, VISIBILITY
/


spool off
