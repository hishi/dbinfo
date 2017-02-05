-- define logfile = &header..log
define logfile = &header.309_Sequence.log

spool &logfile.

set heading off
select '######- 309_Sequence.log' from dual;
set heading on

clear col

select
	SEQUENCE_OWNER
	,SEQUENCE_NAME
	,MIN_VALUE
	,MAX_VALUE
	,INCREMENT_BY
	,CYCLE_FLAG
	,ORDER_FLAG
	,CACHE_SIZE
	,LAST_NUMBER
from
	DBA_SEQUENCES
where
	SEQUENCE_OWNER not in ( &excluded_users. )
order by
	SEQUENCE_OWNER
	,SEQUENCE_NAME
	,MIN_VALUE
	,MAX_VALUE
	,INCREMENT_BY
	,CYCLE_FLAG
	,ORDER_FLAG
	,CACHE_SIZE
	,LAST_NUMBER
/

spool off
