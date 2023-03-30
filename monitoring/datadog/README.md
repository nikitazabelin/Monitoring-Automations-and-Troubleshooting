# Datadog API Script and Apache Install

This repository contains two scripts: `datadog-api.sh` and `datadog_agent_apache_install.sh`. 

## Datadog API Script(datadog-api.sh)

This script (`datadog-api.sh`) pushes Apache logs to the Datadog API and parses it on the same level as the Datadog agent. 

The purpose of this script is to push Apache access logs to Datadog using the Datadog API. The script reads each line of the Apache access log file, parses the log string, and builds a JSON payload to be sent to the Datadog API. The JSON payload includes information such as the IP address of the client, the date of the request, the request itself, the HTTP response code, and the user agent.

To use this script, you will need to set your Datadog API key in the `API_KEY` variable, and specify the location of your Apache access log file in the `LOG_FILE` variable. You can then run the script using a cron job or some other scheduling mechanism.

### Prerequisites

Make sure that you have a relevant API key for Datadog.

### Usage

1. Replace `<Your API key>` with your actual API key in the script.
2. Set the correct value for the `LOG_FILE` variable.
3. Make the script executable using the command:
```
chmod +x datadog-api.sh
```
4. Add the script to your cron job to execute it periodically.

### Notes

- This script can be modified for use with other APIs.
- The error log is disabled to save money.

## Datadog Agent Apache Install Script(datadog_agent_apache_install.sh)

This script (`datadog_agent_apache_install`) installs the Datadog Agent and sets up Apache log monitoring in Datadog.

The purpose of this script is to install the Datadog agent on an Apache server and enable Apache access log monitoring in Datadog. The script installs the Datadog agent, enables logs in the agent's configuration, adds the Apache access log configuration to the agent's configuration, sets read access for the agent user on the Apache access log file, and restarts the agent.

To use this script, you will need to set your Datadog API key in the `DD_API_KEY` variable, and specify the site for your Datadog account in the `DD_SITE` variable. You can then run the script as a privileged user.

Note that these scripts are designed to work on an Amazon Linux 2 server running Apache. If you are using a different operating system or web server, you will need to modify the scripts accordingly.
### Prerequisites

This script is intended for use on Amazon Linux 2.

### Usage

1. Replace `00000000000000000` with your actual Datadog API key in the `DD_API_KEY` variable.
2. Set the correct `DD_SITE` value if necessary.
3. Run the script.

### Notes

- Logs are enabled in Datadog by default.
- Apache log monitoring is added to Datadog by modifying the `/etc/datadog-agent/conf.d/apache.d/conf.yaml` file.
- The `dd-agent` user is given read access to the Apache log directory using the `setfacl` command.
- The Datadog Agent is restarted at the end of the script.
