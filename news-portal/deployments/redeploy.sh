#!/bin/bash

#delete previous replicaset
echo "Deleting v1 data..."
kubectl delete configmap portal-noticias-configmap
kubectl delete service svc-noticias-portal-v2
kubectl delete pod portal-de-noticias

#create deployment
echo "Applying v2 deployment"
kubectl apply -f ./news-portal.deployment.yaml

#checkout portal-noticias deployments
echo "Checkout portal deployments"
kubectl rollout history deployment news-portal-deployment

#annotate deployment
echo "Annotating portal deployment"
kubectl annotate deployment news-portal-deployment kubernetes.io/change-cause="News Portal v2.0.0 Deployment"

echo "Checkout new deployments"
kubectl rollout history deployment news-portal-deployment

echo "checkout pods, run: kubectl get pods"
echo "checkout portal app, go to: http://{localhost_or_minikube_Internal_ip}:31500"