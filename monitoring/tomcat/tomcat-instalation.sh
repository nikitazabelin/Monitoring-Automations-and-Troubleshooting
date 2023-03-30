#!/bin/bash

# Step 1: Create config for Tomcat
sudo cp /etc/datadog-agent/conf.d/tomcat.d/conf.yaml.example /etc/datadog-agent/conf.d/tomcat.d/conf.yaml

# Step 2: Modify the config for Tomcat
sudo sed -i 's/# port: 7199/port: 7199/' /etc/datadog-agent/conf.d/tomcat.d/conf.yaml

# Step 3: Create config for JMX
sudo cp /etc/datadog-agent/conf.d/jmx.d/conf.yaml.example /etc/datadog-agent/conf.d/jmx.d/conf.yaml

# Step 4: Modify the config for JMX
sudo sed -i 's/# port: 7199/port: 7199/' /etc/datadog-agent/conf.d/jmx.d/conf.yaml

# Step 5: Create or modify setenv.sh for Tomcat
sudo echo 'JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=7199 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"' | sudo tee -a /usr/share/tomcat/bin/setenv.sh

