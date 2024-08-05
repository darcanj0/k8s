## GCE Pod with a Volume access managed by a Persistent Volume Claim + Storage Class

- Your disk will be dinamically managed by k8s' Storage Class resource

- Apply your Storage Class

```bash
    kubectl apply -f ./gce-sc.yaml
```

- Apply your PVC

```bash
    kubectl apply -f ./gce-pvc.v2.yaml
```

- Apply your pod that uses your PVC:

```bash
    kubectl apply -f ./pod-gce-pvc-2.yaml
```