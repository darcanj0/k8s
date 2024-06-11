#!/bin/bash

#delete previous replicaset
echo "Deleting v1 data..."
kubectl delete configmap sistema-noticias-configmap
kubectl delete service svc-sistema-noticias
kubectl delete pod sistema-noticias

#create deployment
echo "Applying v2 deployment"
kubectl apply -f ./news-system.deployment.yaml

#checkout news-system deployments
echo "Checkout news system deployments"
kubectl rollout history deployment news-system-deployment

#annotate deployment
echo "Annotating system deployment"
kubectl annotate deployment news-system-deployment kubernetes.io/change-cause="News System v2.0.0 Deployment"

echo "Checkout new deployments"
kubectl rollout history deployment news-system-deployment

echo "checkout pods, run: kubectl get pods"
echo "checkout portal app, go to: http://{localhost_or_minikube_Internal_ip}:31750"