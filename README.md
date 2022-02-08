# Sample for deploying kubernetes cluster with minikube

Scripts on this repository are designed for running `minikube` with `--vm-driver=none` option on VM.

1. Create VM with `libvirt` or any VM manager.
2. Checkout this repo on the VM.
3. Run following:
    ```bash
    ./clean-start-minikube.sh
    ```
