# worbuddy-app

Here, we will see how can we deploy the [workbuddy-api](https://github.com/aj-learnings/workbuddy-api) application with the help of **Docker** on any system.

### Prerequisites

We need to have Docker and Docker-compose installed. 

However, in local machine installing [Docker Desktop](https://www.docker.com/products/docker-desktop/) application will work too.

### Steps
1. **Clone the Repository**

   Clone the repository using the following command:

   ```bash
   git clone https://github.com/aj-learnings/workbuddy-cloud.git
   cd workbuddy-cloud/api/docker
   ```
2. **Run the docker compose file**

    ```bash
   docker-compose up -d
   ```


The application will be served at http://localhost:9400