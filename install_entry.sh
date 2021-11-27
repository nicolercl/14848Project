#!bin/bash

### Entry App ###

NODE_IP=$(kubectl get nodes -o jsonpath='{ $.items[0].status.addresses[?(@.type=="ExternalIP")].address }')
search="MY_NODE_IP"
filename="entry/bdp-app-deployment.yaml"
sed -i "s/$search/$NODE_IP/" $filename

# Set up jupyter notebook deployment
kubectl apply -f entry/bdp-app-deployment.yaml
# Set up jupyter notebook service
kubectl apply -f entry/bdp-app-service.yaml