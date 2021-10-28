#!bin/bash

# Create cluster
gcloud container clusters create cluster-bdp --zone us-east1-b --node-locations us-east1-b,us-east1-c

# Get node ip
kubectl get nodes -o wide