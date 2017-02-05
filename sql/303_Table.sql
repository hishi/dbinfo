-- define logfile = &header..log
define logfile = &header.303_Table.log

spool &logfile.

set heading off
select '######- 303_Table.log' from dual;
set heading on

clear col

col DEGREE		for a10
col TEMPORARY	for a10
select
	OWNER
	, TABLE_NAME
	, TABLESPACE_NAME
	, STATUS
	, LOGGING
--	, NUM_ROWS
--	, DEGREE
	, TEMPORARY
	, LAST_ANALYZED
--	, PARTITIONED
--	, BUFFER_POOL
--	, FLASH_CACHE
--	, CELL_FLASH_CACHE
--	, COMPRESSION
--	, COMPRESS_FOR
--	, RESULT_CACHE
from
	DBA_TABLES
where
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, TABLE_NAME
	, TABLESPACE_NAME
	, STATUS
	, LOGGING
--	, NUM_ROWS
--	, DEGREE
	, TEMPORARY
	, LAST_ANALYZED
--	, PARTITIONED
--	, BUFFER_POOL
--	, FLASH_CACHE
--	, CELL_FLASH_CACHE
--	, COMPRESSION
--	, COMPRESS_FOR
--	, RESULT_CACHE
/


spool off
