# [Worbuddy Application](https://www.youtube.com/watch?v=0F-E_kD6Spw)

Here, we will see how can we deploy the [workbuddy-api](https://github.com/aj-learnings/workbuddy-api) application with the help of **Kubernetes** on any system.

### Prerequisites

We need to have [Kubernetes](https://kubernetes.io/releases/download/) or [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download) installed.


### Steps
1. **Clone the Repository**

   Clone the repository using the following command:

   ```bash
   git clone https://github.com/aj-learnings/workbuddy-cloud.git
   cd workbuddy-cloud/api/k8s
   ```
2. **Run the k8s config files**

    ```bash
   kubectl create -f .
   ```

3. **Get the IP where the application is running**

    ```bash
   APP_IP=$(kubectl -n workbuddy-app get svc workbuddy-app -o jsonpath='{.spec.clusterIP}')
   ```

The application will be served at http://$APP_IP:80/api/workbuddy