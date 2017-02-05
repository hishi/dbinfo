-- define logfile = &header..log
define logfile = &header.307_Materialized_View.log

spool &logfile.

set heading off
select '######- 307_Materialized_View.log' from dual;
set heading on

clear col

col MASTER_LINK		for a20

select
	OWNER
	, MVIEW_NAME
	, UPDATABLE
	, UPDATE_LOG
	, MASTER_LINK
	, REFRESH_MODE
	, REFRESH_METHOD
	, FAST_REFRESHABLE
	, LAST_REFRESH_TYPE
	, LAST_REFRESH_DATE
from
	DBA_MVIEWS
where
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, MVIEW_NAME
	, UPDATABLE
	, UPDATE_LOG
	, MASTER_LINK
	, REFRESH_MODE
	, REFRESH_METHOD
	, FAST_REFRESHABLE
	, LAST_REFRESH_TYPE
	, LAST_REFRESH_DATE
/


spool off
