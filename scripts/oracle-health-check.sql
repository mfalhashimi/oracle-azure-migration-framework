-- Oracle Database Health Check

SET LINESIZE 200
SET PAGESIZE 100

PROMPT === DATABASE STATUS ===

SELECT name, open_mode, database_role
FROM v$database;

PROMPT === INSTANCE STATUS ===

SELECT instance_name, status, host_name
FROM v$instance;

PROMPT === TABLESPACE USAGE ===

SELECT
    tablespace_name,
    ROUND(used_percent,2) AS used_percent
FROM dba_tablespace_usage_metrics
ORDER BY used_percent DESC;

PROMPT === INVALID OBJECTS ===

SELECT owner, object_type, COUNT(*) total
FROM dba_objects
WHERE status='INVALID'
GROUP BY owner, object_type
ORDER BY total DESC;

PROMPT === BLOCKING SESSIONS ===

SELECT blocking_session, sid, serial#
FROM v$session
WHERE blocking_session IS NOT NULL;

PROMPT === ARCHIVE LOG STATUS ===

SELECT sequence#, applied
FROM v$archived_log
ORDER BY sequence# DESC FETCH FIRST 10 ROWS ONLY;
