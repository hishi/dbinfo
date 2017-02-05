set termout on  heading off
select '[[[ Start ]]]' from dual;
set termout off heading on

-------------------------------------------------------------------------------
-- set variable
-------------------------------------------------------------------------------
set pages		50000
set lines		1000
set long		10000
set colsep		'|'
set null		<n>
set trimspool	on
set termout		off
set verify		off
set feedback	off
--set underline	off

alter session set nls_date_format='YYYYMMDD HH24:Mi:SS';
alter session set nls_language=american;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- define logfile header
-------------------------------------------------------------------------------
col host_name		new_value host_name
col instance_name	new_value instance_name
col yyyymmdd		new_value yyyymmdd
col hhmmss			new_value hhmmss
select
	host_name
	, instance_name
	, to_char(sysdate, 'yyyymmdd') yyyymmdd
	, to_char(sysdate, 'hh24mmss') hhmmss
from
	v$instance
/
define header = ./log/&yyyymmdd._&host_name._&instance_name._
spool &header..log
spool off
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- define excluded users
-------------------------------------------------------------------------------
col excluded_users new_value excluded_users
select '''AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA''' -
	|| ',' || '''ANONYMOUS''' -
	|| ',' || '''APEX_030200''' -
	|| ',' || '''APEX_PUBLIC_USER''' -
	|| ',' || '''APPQOSSYS''' -
	|| ',' || '''CTXSYS''' -
	|| ',' || '''DBSNMP''' -
	|| ',' || '''DIP''' -
	|| ',' || '''EXFSYS''' -
	|| ',' || '''FLOWS_FILES''' -
	|| ',' || '''MDSYS''' -
	|| ',' || '''ORACLE_OCM''' -
	|| ',' || '''ORDDATA''' -
	|| ',' || '''ORDPLUGINS''' -
	|| ',' || '''ORDSYS''' -
	|| ',' || '''OUTLN''' -
	|| ',' || '''SI_INFORMTN_SCHEMA''' -
	|| ',' || '''SYS''' -
	|| ',' || '''SYSTEM''' -
	|| ',' || '''WMSYS''' -
	|| ',' || '''XDB''' -
	|| ',' || '''XS$NULL''' -
	excluded_users
from
	dual;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- define excluded roles
-------------------------------------------------------------------------------
col excluded_roles new_value excluded_roles
select '''AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA''' -
	|| ',' || '''ADM_PARALLEL_EXECUTE_TASK''' -
	|| ',' || '''APEX_ADMINISTRATOR_ROLE''' -
	|| ',' || '''AQ_ADMINISTRATOR_ROLE''' -
	|| ',' || '''AQ_USER_ROLE''' -
	|| ',' || '''AUTHENTICATEDUSER''' -
	|| ',' || '''CONNECT''' -
	|| ',' || '''CTXAPP''' -
	|| ',' || '''DATAPUMP_EXP_FULL_DATABASE''' -
	|| ',' || '''DATAPUMP_IMP_FULL_DATABASE''' -
	|| ',' || '''DBA''' -
	|| ',' || '''DBFS_ROLE''' -
	|| ',' || '''DELETE_CATALOG_ROLE''' -
	|| ',' || '''EJBCLIENT''' -
	|| ',' || '''EXECUTE_CATALOG_ROLE''' -
	|| ',' || '''EXP_FULL_DATABASE''' -
	|| ',' || '''GATHER_SYSTEM_STATISTICS''' -
	|| ',' || '''HS_ADMIN_EXECUTE_ROLE''' -
	|| ',' || '''HS_ADMIN_ROLE''' -
	|| ',' || '''HS_ADMIN_SELECT_ROLE''' -
	|| ',' || '''IMP_FULL_DATABASE''' -
	|| ',' || '''JAVADEBUGPRIV''' -
	|| ',' || '''JAVAIDPRIV''' -
	|| ',' || '''JAVASYSPRIV''' -
	|| ',' || '''JAVAUSERPRIV''' -
	|| ',' || '''JAVA_ADMIN''' -
	|| ',' || '''JAVA_DEPLOY''' -
	|| ',' || '''JMXSERVER''' -
	|| ',' || '''LOGSTDBY_ADMINISTRATOR''' -
	|| ',' || '''OEM_ADVISOR''' -
	|| ',' || '''OEM_MONITOR''' -
	|| ',' || '''ORDADMIN''' -
	|| ',' || '''RECOVERY_CATALOG_OWNER''' -
	|| ',' || '''RESOURCE''' -
	|| ',' || '''SCHEDULER_ADMIN''' -
	|| ',' || '''SELECT_CATALOG_ROLE''' -
	|| ',' || '''WM_ADMIN_ROLE''' -
	|| ',' || '''XDBADMIN''' -
	|| ',' || '''XDB_SET_INVOKER''' -
	|| ',' || '''XDB_WEBSERVICES''' -
	|| ',' || '''XDB_WEBSERVICES_OVER_HTTP''' -
	|| ',' || '''XDB_WEBSERVICES_WITH_PUBLIC''' -
	excluded_roles
from
	dual;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- System information
-------------------------------------------------------------------------------
set termout on  heading off
select '## Get System information ... ' from dual;
set termout off heading on
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- User information
-------------------------------------------------------------------------------
set termout on  heading off
select '## Get User information ... ' from dual;
set termout off heading on

@@./sql/201_Role.sql
@@./sql/202_Role_granted_to_role.sql
@@./sql/203_System_privilege_granted_to_role.sql
@@./sql/204_Object_privilege_granted_to_role.sql
@@./sql/205_User.sql
@@./sql/206_Role_granted_to_user.sql
@@./sql/207_System_privilege_granted_to_user.sql
@@./sql/208_Object_privilege_granted_to_user.sql
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Object information
-------------------------------------------------------------------------------
set termout on  heading off
select '## Get Object information ... ' from dual;
set termout off heading on

@@./sql/301_Object_count.sql
@@./sql/302_Database_link.sql
@@./sql/303_Table.sql
@@./sql/304_Index.sql
@@./sql/305_Lob.sql
@@./sql/306_View.sql
@@./sql/307_Materialized_View.sql
@@./sql/308_Trigger.sql
@@./sql/309_Sequence.sql
@@./sql/310_Public_Synonym.sql
@@./sql/311_Privage_Synonym.sql
@@./sql/312_Function.sql
@@./sql/313_Procedure.sql
@@./sql/314_Package.sql
@@./sql/315_Type.sql
@@./sql/316_Directory.sql
@@./sql/317_Job.sql
@@./sql/318_Other_objects.sql
-------------------------------------------------------------------------------

set termout on  heading off
select '[[[ End ]]]' from dual;
set termout off heading on

exit

