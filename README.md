# AWS Infrastructure with Terraform

This project sets up a web application infrastructure on AWS using Terraform. It includes the following components:

- **VPC**: A Virtual Private Cloud to host the resources.
- **Subnets**: Public and private subnets for the application and database.
- **EC2 Instances**: Two EC2 instances, one for the web application and another for the PostgreSQL database.
- **Application Load Balancer (ALB)**: To distribute incoming traffic to the web application instances.
- **SSL Certificate**: Managed by AWS Certificate Manager for secure HTTPS connections.
- **S3 Bucket**: For storing Terraform state files.

## Directory Structure

- **modules/**: Contains reusable Terraform modules for different resources.
  - **alb/**: Module for the Application Load Balancer.
  - **ec2/**: Module for EC2 instances.
  - **postgres/**: Module for the PostgreSQL database instance.
  - **vpc/**: Module for the VPC and networking resources.
  - **ssl_certificate/**: Module for managing SSL certificates.

- **environments/**: Contains environment-specific configurations.
  - **development/**: Configuration for the development environment.
  - **production/**: Configuration for the production environment.

- **global/**: Contains global configurations, such as the S3 backend for state management.

## Setup Instructions

1. **Prerequisites**:
   - Install Terraform.
   - Configure AWS CLI with appropriate credentials.

2. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd aws-terraform-infra
   ```

3. **Configure Backend**:
   Update the `global/s3_backend.tf` file with your desired S3 bucket name.

4. **Initialize Terraform**:
   Navigate to the desired environment directory (e.g., `environments/development`) and run:
   ```bash
   terraform init
   ```

5. **Plan the Infrastructure**:
   Run the following command to see the resources that will be created:
   ```bash
   terraform plan
   ```

6. **Apply the Configuration**:
   To create the resources, run:
   ```bash
   terraform apply
   ```

7. **Access the Application**:
   After the resources are created, you can access the web application using the DNS name of the load balancer.

## Usage Guidelines

- Use the `development` environment for testing and development purposes.
- Use the `production` environment for live applications.
- Modify the `variables.tf` files in each environment to customize instance types, AMIs, and other configurations as needed.

## Cleanup

To destroy the resources created by Terraform, run the following command in the respective environment directory:
```bash
terraform destroy
```

This will remove all resources created by the Terraform configuration.