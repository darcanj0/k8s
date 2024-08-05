## GCE Pod with a Volume access managed by a Persistent Volume Claim

- Make sure you have a GCE disk (10Gi, ext4). Its name must be 'gce-pv-disk'

- Apply your PV

```bash
    kubectl apply -f ./gce-pv.yaml
```

- Apply your PVC

```bash
    kubectl apply -f ./gce-pvc.yaml
```

- Apply your pod that uses your PVC:

```bash
    kubectl apply -f ./pod-gce-pvc.yaml
```