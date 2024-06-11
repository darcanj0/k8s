//TODO: update readme for v2

# k8s

A Kubernetes app. Built while I was taking a k8s course in Alura.

The goal of this project is to dive in core concepts, such as **Pods, Services and Config Maps**


## Minimum Requirements

In order to run the app, you must have a functional k8s cluster running on your machine. You need to be able to run ´kubectl´ commands locally.


## Running

### By using the script (automatically):

```bash
  # in root folder: 

  chmod +x ./run/run.sh

  ./run/run.sh
```


### If you want to or must to, you can do it manually:

Clone the project

```bash
  git clone https://github.com/darcanj0/k8s.git
```

Enter the project dir

```bash
  cd k8s
```

Enter the configMaps dir

```bash
  cd configMaps
```

Apply all the config maps*

#### OBS*: If you are using Linux, you must edit the /configMaps/portal-noticias.configmap.yaml. Insead of 'localhost', you must provide the correct IP address of your INTERNAL_IP**

#### You can find out your INTERNAL_IP** by running:

```bash
  kubectl get nodes -o wide

  # then, search for the INTERNAL_IP of your minikube and use it (change 'localhost' for your INTERNAL_IP value)
```

```bash
  kubectl apply -f ./db.configmap.yaml
  kubectl apply -f ./sistema-noticias.configmap.yaml
  kubectl apply -f ./portal-noticias.configmap.yaml
```

Enter the pods dir

```bash
  cd ../pods
```

Apply all the pods

```bash
  kubectl apply -f ./db-noticias.yaml
  kubectl apply -f ./sistema-noticias.yaml
  kubectl apply -f ./portal-de-noticias.yaml
```

Enter the services dir

```bash
  cd ../services
```

Apply all the services

```bash
  kubectl apply -f svc-db-noticias.yaml
  kubectl apply -f svc-noticias-sistema.yaml
  kubectl apply -f svc-noticias-portal-v2.yaml
```


## Checkout the app Database

You may check the app database afterwards, by accessing the db pod directly:

```bash
  News Portal: 
  kubectl exec -it db-noticias -- bash

  # then, inside the pod

  mysql -u root -p

  #enter root password defined in configmap (default is "Senha123!")

  show databases

  # The 'empresa' database should show up
```

## Checkout the app locally

You may check the app afterwards, by accessing the services urls if you are running locally:

```bash
  News Portal: 
  http://localhost:31500

  News Admin:
  http://localhost:31750

  # if you are using Linux, use the minikube ip address

  News Portal:
  http://{minikube_internal_ip}:31500

  News Admin:
  http://{minikube_internal_ip}:31750
```

