# Oracle to Azure Cutover Runbook

## Objective

Controlled production cutover from Oracle environment to Azure SQL Managed Instance with minimal downtime and rollback capability.

---

# Pre-Cutover Validation

- Confirm replication health
- Validate Azure SQL MI availability
- Validate backup completion
- Confirm rollback procedures
- Notify stakeholders

---

# Cutover Activities

## Step 1 — Freeze Changes
- Stop application writes
- Pause scheduled jobs
- Freeze schema modifications

## Step 2 — Final Synchronization
- Complete incremental replication
- Validate transaction consistency
- Verify row counts

## Step 3 — Application Redirection
- Update connection strings
- Redirect traffic to Azure SQL MI
- Restart application services

## Step 4 — Validation
- Validate application functionality
- Validate reporting workloads
- Monitor database performance

---

# Rollback Plan

If critical validation fails:
- Redirect applications back to Oracle
- Resume Oracle services
- Restore replication state

---

# Post-Cutover Monitoring

- Monitor CPU and memory utilization
- Review slow queries
- Validate backup jobs
- Review Azure Monitor alerts
