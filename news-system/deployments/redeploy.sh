#!/bin/bash

#delete previous replicaset
echo "Deleting v1 data..."
kubectl delete configmap sistema-noticias-configmap
kubectl delete service svc-sistema-noticias
kubectl delete pod sistema-noticias

#set pvc's
kubectl apply -f ../statefulSets/images.pvc.yaml
kubectl apply -f ../statefulSets/sessions.pvc.yaml

#apply news system as stateful set
kubectl apply -f ../statefulSets/news-system.ss.yaml

# ALTERNATIVE: USE AS DEPLOYMENT

# #create deployment
# echo "Applying v2 deployment"
# kubectl apply -f ./news-system.deployment.yaml

# #checkout news-system deployments
# echo "Checkout news system deployments"
# kubectl rollout history deployment news-system-deployment

# #annotate deployment
# echo "Annotating system deployment"
# kubectl annotate deployment news-system-deployment kubernetes.io/change-cause="News System v2.0.0 Deployment"

# #apply v2.0.0 service
# kubectl apply -f ../services/news-system.service.yaml

# echo "Checkout new deployments"
# kubectl rollout history deployment news-system-deployment

# echo "checkout pods, run: kubectl get pods"
# echo "checkout portal app, go to: http://{localhost_or_minikube_Internal_ip}:31750"