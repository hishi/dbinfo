-- define logfile = &header..log
define logfile = &header.317_Job.log

spool &logfile.

set heading off
select '######- 317_Job.log' from dual;
set heading on

clear col




spool off
