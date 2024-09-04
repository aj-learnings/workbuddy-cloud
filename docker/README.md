# Worbuddy Application

Here, we will see how can we deploy the complete workbuddy application(both UI and API) with the help of **Docker** on any system.

### Prerequisites

We need to have Docker and Docker-compose installed.

However, in local machine installing [Docker Desktop](https://www.docker.com/products/docker-desktop/) application will work too.

### Steps
1. **Clone the Repository**

   Clone the repository using the following command:

   ```bash
   git clone https://github.com/aj-learnings/workbuddy-cloud.git
   cd docker
   ```
2. **Run the docker compose file**

    ```bash
   docker-compose up -d
   ```
    However, if we want to deploy it in an EC2 instance, then before executing step 2, we need to replace the API_URL with the public ip of the instance.
    
    ```
    sed -i "s#API_URL:.*#API_URL: http://<PUBLIC_IP>:9401#g" docker-compose.yaml
   ```

The application will be served at http://PUBLIC_IP:9400

For local system, PUBLIC_IP=localhost.