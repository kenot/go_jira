#!/bin/bash -l

### Automatically opens jira session
export jira_pass=6xbyVMMvRnssfKQ8rQQ8
echo -n $jira_pass | jira login -u gxl-ops

### Variable for the timestamp
EXT=$(date +%d-%m-%Y)

### Variable for the logfile
LOGFILE=/var/log/go-jira-automatic-tickets/thursday-only-pt.$EXT.log


### Commands for creation of the tickets
jira create --noedit -i Story -o summary="Test" -o customfield_10911="MAX-3552" -o duedate="'${ISSUEDUEDATE=$(date -d '+10 days' +%Y-%m-%d"T:00:00.0+0000")}'" -o labels="Label1 , Label2" -o components="Airflow , WebSSU" -o description="Testing go-jira" -o assignee="toncho.dinkov" >> "$LOGFILE" 2>&1

jira create --noedit -i Story -o summary="Test" -o customfield_10911="MAX-3552" -o duedate="'${ISSUEDUEDATE=$(date -d '+10 days' +%Y-%m-%d"T:00:00.0+0000")}'" -o labels="Label1 , Label2" -o components="Airflow , WebSSU" -o description="Testing go-jira" -o assignee="stoyan.kiryazov" >> "$LOGFILE" 2>&1

jira create --noedit -i Story -o summary="Test" -o customfield_10911="MAX-3552" -o duedate="'${ISSUEDUEDATE=$(date -d '+10 days' +%Y-%m-%d"T:00:00.0+0000")}'" -o labels="Label1 , Label2" -o components="Airflow , WebSSU" -o description="Testing go-jira" -o assignee="olesea.stanilevici" >> "$LOGFILE" 2>&1

jira create --noedit -i Story -o summary="Test" -o customfield_10911="MAX-3552" -o duedate="'${ISSUEDUEDATE=$(date -d '+10 days' +%Y-%m-%d"T:00:00.0+0000")}'" -o labels="Label1 , Label2" -o components="Airflow , WebSSU" -o description="Testing go-jira" -o assignee="denitsa.viktorova" >> "$LOGFILE" 2>&1

jira create --noedit -i Story -o summary="Test" -o customfield_10911="MAX-3552" -o duedate="'${ISSUEDUEDATE=$(date -d '+10 days' +%Y-%m-%d"T:00:00.0+0000")}'" -o labels="Label1 , Label2" -o components="Airflow , WebSSU" -o description="Testing go-jira" -o assignee="yana.bogdanova" >> "$LOGFILE" 2>&1


### Removes the variables
unset ISSUEDUEDATE
unset TIMESPEC


### Cleanup the old log files older than 2 days

find /var/log/go-jira-automatic-tickets -name "thursday-only-pt.*.log" -type f -mtime +2 -delete

### Terminates the active jira session
jira logout
