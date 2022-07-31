# Sample for deploying kubernetes cluster with minikube

Scripts on this repository are designed for running `minikube` with `--vm-driver=none` option on VM.

1. Create VM with `libvirt` or any VM manager.
2. Install requirements by reffering to [minikube document](https://minikube.sigs.k8s.io/docs/drivers/none/#requirements).
3. Checkout this repo on the VM.
4. Run following:
    ```bash
    ./clean-start-minikube.sh
    ```
