#!bin/bash

### Entry App ###

# Set up jupyter notebook deployment
kubectl apply -f entry/bdp-app-deployment.yaml
# Set up jupyter notebook service
kubectl apply -f entry/bdp-app-service.yaml