#!/bin/bash
#make sure that you are import relevant API key for Datadog

API_KEY="<Your API key>"

LOG_FILE="/var/log/httpd/access_log"

NAMED_PIPE=$(mktemp -u)
mkfifo $NAMED_PIPE

cat $LOG_FILE | while read line; do
    # Parse the log string
    IP_ADDRESS=$(echo $line | awk '{print $1}')
    DATE=$(echo $line | awk -F[ '{print $2}' | awk -F] '{print $1}')
    REQUEST=$(echo $line | awk '{print $7}' | awk -F\" '{print $2}')
    RESPONSE_CODE=$(echo $line | awk '{print $9}')
    BYTES_SENT=$(echo $line | awk '{print $10}')
    USER_AGENT=$(echo $line | awk -F\" '{print $6}')

    # Build the JSON payload
    PAYLOAD="{\"ddsource\":\"access_log\",\"service\":\"apache\",\"ddtags\":[\"environment:production\",\"apache\"],\"hostname\":\"ec2-apache\",\"message\":\"$IP_ADDRESS - - [$DATE] $REQUEST $RESPONSE_CODE $BYTES_SENT \\\"-\\\" $USER_AGENT\"}"

    echo $PAYLOAD > $NAMED_PIPE
done &

curl -H "Content-type: application/json" \
  -X POST \
  -d @$NAMED_PIPE \
  "https://http-intake.logs.datadoghq.com/v1/input?api_key=${API_KEY}"


rm $NAMED_PIPE
~   

# Script will push logs to datadog API and parse it on the same level as datadog agent
# to initate the script we should use cron-job
# Can be rebuild for other APIs as well
