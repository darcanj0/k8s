#!/bin/bash

#delete previous replicaset
echo "Deleting v1 replicaset..."
kubectl delete -f ../replicaSets/portal-noticias.replicaset.yaml

#create deployment
echo "Applying v2 deployment"
kubectl apply -f ./portal-noticias.deployment.yaml

#checkout portal-noticias deployments
echo "Checkout portal deployments"
kubectl rollout history deployment portal-noticias-deployment

#annotate deployment
echo "Annotating portal deployment"
kubectl annotate deployment portal-noticias-deployment kubernetes.io/change-cause="News Portal v2.0.0 Deployment"

echo "checkout pods, run: kubectl get pods"
echo "checkout portal app, go to: http://{localhost_or_minikube_Internal_ip}:31500"