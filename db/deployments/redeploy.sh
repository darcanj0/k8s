#!/bin/bash

#delete previous data
echo "Deleting v1 data..."
kubectl delete configmap db-noticias-configmap
kubectl delete pod db-noticias
kubectl delete service svc-db-noticias

#create deployment
echo "Applying v2 deployment"
kubectl apply -f ./db-news.deployment.yaml

#checkout db-news deployments
echo "Checkout db deployments"
kubectl rollout history deployment db-news-deployment

#annotate deployment
echo "Annotating db deployment"
kubectl annotate deployment db-news-deployment kubernetes.io/change-cause="DB News v2.0.0 Deployment"

#apply v2.0.0 service
echo "Applying v2.0.0 service..."
kubectl apply -f ../services/db-news.service.yaml

echo "Checkout new deployments"
kubectl rollout history deployment db-news-deployment

echo "checkout pods, run: kubectl get pods"