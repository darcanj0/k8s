#!/bin/bash

# Clone the project
git clone https://github.com/darcanj0/k8s.git

# Enter the project dir
cd k8s

# Apply all the config maps
kubectl apply -f ./configMaps/db.configmap.yaml
kubectl apply -f ./configMaps/sistema-noticias.configmap.yaml
kubectl apply -f ./configMaps/portal-noticias.configmap.yaml

# Enter the pods dir
cd pods

# Apply all the pods
kubectl apply -f ./db-noticias.yaml
kubectl apply -f ./sistema-noticias.yaml
kubectl apply -f ./portal-de-noticias.yaml

# Enter the services dir
cd ../services

# Apply all the services
kubectl apply -f ./svc-db-noticias.yaml
kubectl apply -f ./svc-noticias-sistema.yaml
kubectl apply -f ./svc-noticias-portal-v2.yaml