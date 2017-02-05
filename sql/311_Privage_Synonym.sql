-- define logfile = &header..log
define logfile = &header.311_Privage_Synonym.log

spool &logfile.

set heading off
select '######- 311_Privage_Synonym.log' from dual;
set heading on

clear col

col DB_LINK		for a40

select
	OWNER
	, SYNONYM_NAME
	, TABLE_OWNER
	, TABLE_NAME
	, DB_LINK
from
	DBA_SYNONYMS
where
	OWNER <> 'PUBLIC'
	and
	OWNER not in ( &excluded_users. )
order by
	OWNER
	, SYNONYM_NAME
	, TABLE_OWNER
	, TABLE_NAME
	, DB_LINK
/


spool off
