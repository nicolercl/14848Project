#!bin/bash

export PROJECT_ID=big-data-processing-toolbox

### Prepare images ###
# docker pull wwweiweiii/jupyter-notebook
# docker tag wwweiweiii/jupyter-notebook gcr.io/$PROJECT_ID/wwweiweiii/jupyter-notebook
# docker push gcr.io/$PROJECT_ID/wwweiweiii/jupyter-notebook

# docker pull bitnami/spark
# docker tag bitnami/spark gcr.io/$PROJECT_ID/bitnami/spark
# docker push gcr.io/$PROJECT_ID/bitnami/spark

# docker pull wwweiweiii/hadoop-datanode
# docker tag wwweiweiii/hadoop-datanode gcr.io/$PROJECT_ID/wwweiweiii/hadoop-datanode
# docker push gcr.io/$PROJECT_ID/wwweiweiii/hadoop-datanode

# docker pull wwweiweiii/hadoop-namenode
# docker tag wwweiweiii/hadoop-namenode gcr.io/$PROJECT_ID/wwweiweiii/hadoop-namenode
# docker push gcr.io/$PROJECT_ID/wwweiweiii/hadoop-namenode

# docker pull wwweiweiii/sonarqubescanner
# docker tag wwweiweiii/sonarqubescanner gcr.io/$PROJECT_ID/wwweiweiii/sonarqubescanner
# docker push gcr.io/$PROJECT_ID/wwweiweiii/sonarqubescanner

### Jupyter Notebook ###

# Set up jupyter notebook deployment
kubectl apply -f jupyter/jupyter-deployment.yaml
# Set up jupyter notebook service
kubectl apply -f jupyter/jupyter-service.yaml

### Apache Spark ###

# Set up spark deployment
kubectl apply -f spark/spark-deployment.yaml
# Set up jupyter notebook service
kubectl apply -f spark/spark-service.yaml

### Apache Hadoop ###

# Set up hadoop namenode & datanodes deployment
kubectl apply -f hadoop/namenode-deployment.yaml
kubectl apply -f hadoop/datanode1-deployment.yaml
kubectl apply -f hadoop/datanode2-deployment.yaml
# Set up hadoop namenode & datanodes service
kubectl apply -f hadoop/namenode-service.yaml
kubectl apply -f hadoop/datanode1-service.yaml
kubectl apply -f hadoop/datanode2-service.yaml

### Sonarqube + scanner and postgres ###

# Create persistentVolumeClaim for postgresql
kubectl apply -f sonarqube/postgres-pv.yaml
# Set up postgresql deployment
kubectl apply -f sonarqube/postgres-deployment.yaml
# Set up postgresql service
kubectl apply -f sonarqube/postgres-service.yaml
# Create persistentVolumeClaim for sonar data 
kubectl apply -f sonarqube/sonar-data.yaml
# Create persistentVolumeClaim for sonar extensions
kubectl apply -f sonarqube/sonar-ext.yaml
# Create Sonarqube + scanner deployment
kubectl apply -f sonarqube/sonar-deployment.yaml
# Expose sonar as NodePort service
kubectl apply -f sonarqube/sonar-service.yaml