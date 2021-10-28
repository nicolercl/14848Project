#!bin/bash
SPARK_PORT=30080
JUPYTER_PORT=30088
NAMENODE_PORT=30070
SONAR_PORT=30000

### Firewall Rules for NodePorts ###
gcloud compute firewall-rules create spark --allow tcp:$SPARK_PORT
gcloud compute firewall-rules create jupyter-notebook --allow tcp:$JUPYTER_PORT
gcloud compute firewall-rules create namenode --allow tcp:$NAMENODE_PORT
gcloud compute firewall-rules create sonarqube --allow tcp:$SONAR_PORT