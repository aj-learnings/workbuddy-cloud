# [Worbuddy Application](https://www.youtube.com/watch?v=0F-E_kD6Spw)

Here, we will see how can we deploy the complete workbuddy application(both UI and API) with the help of **Terraform** on **AWS**.

### Prerequisites

We need to have [Terraform](https://developer.hashicorp.com/terraform/install) installed.

### Steps
1. **Clone the Repository**

   Clone the repository using the following command:

   ```bash
   git clone https://github.com/aj-learnings/workbuddy-cloud.git
   cd terraform
   ``` 
   
2. Put your AWS access key and secret key [here](https://github.com/aj-learnings/workbuddy-cloud/blob/master/terraform/provider.tf). You can also use AWS environment variables.
   

3. Run terraform init to initialize terraform.
    ```bash
   terraform init
   ```
   
4. (Optional but Recommended) Run terraform plan and view the changes listed in the console.
    ```bash
   terraform plan
    ```
   
5. Finally, deploy the application using terraform apply.
    ```bash
   terraform apply
    ```
   Again, view the changes listed and type 'yes' in the console.

The application URL will come up in the console once the resources are created. However, it may take some time for the app to be accessible since a [script](https://github.com/aj-learnings/workbuddy-cloud/blob/master/terraform/deploy-workbuddy-docker.sh) is getting executed on the EC2 instance.