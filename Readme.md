# ECS Microservices Infrastructure using Terraform

This project provisions an **AWS ECS-based microservices architecture** using **Terraform**.  
It sets up networking, ECS cluster, ECS services, IAM roles, and AWS Cloud Map for service discovery in a fully automated and repeatable way.

---

## Architecture Overview

The infrastructure includes:

- Amazon VPC and Subnet
- ECS Cluster
- Multiple ECS Services (service-a, service-b, service-c)
- AWS Cloud Map (Private DNS Namespace)
- IAM Roles and Policies
- Infrastructure as Code using Terraform

---

## Prerequisites

Before running this project, make sure you have:

- An AWS Account
- Windows Operating System
- Terraform installed
- AWS CLI installed
- An IAM User with programmatic access

---

## Step 2: Install Terraform (Windows)

### Download Terraform
Download Terraform from the official HashiCorp website:

https://developer.hashicorp.com/terraform/downloads

Select:
- Windows (AMD64)

---

### Extract Terraform
Extract the downloaded ZIP file and place `terraform.exe` in a directory, for example:

C:\terraform\


---

### Add Terraform to PATH
1. Open **Environment Variables**
2. Edit **System Variables → Path**
3. Add:


C:\terraform\


---

### Verify Terraform Installation
Open Command Prompt and run:


terraform -v


If Terraform is installed correctly, the version will be displayed.

---

## Step 3: Install AWS CLI (Windows)

### Download AWS CLI
Download AWS CLI from the official AWS documentation:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Choose:
- AWS CLI MSI Installer for Windows

---

### Verify AWS CLI Installation


aws --version


---

## Step 4: Create AWS Access Key and Secret Key

Terraform requires AWS credentials to create and manage cloud resources.

---

### Create an IAM User

1. Log in to the **AWS Management Console**
2. Navigate to **IAM → Users**
3. Click **Create user**
4. Enter user name:


terraform-user

5. Select **Programmatic access**

---

### Attach Permissions

Attach one of the following:
- `AdministratorAccess` (recommended for learning/demo purposes)

---

### Generate Credentials

After creating the user, AWS will generate:
- Access Key ID
- Secret Access Key

Download or copy these credentials and store them securely.

---

### Configure AWS CLI

Run the following command:


aws configure


Enter the details:


AWS Access Key ID: <your-access-key>
AWS Secret Access Key: <your-secret-key>
Default region name: ap-south-1
Default output format: json


Terraform will automatically use these credentials.

---

## Step 5: Run the Terraform Project

### Clone or Copy the Project


git clone <repository-url>
cd ecs-microservices-terraform


---

### Initialize Terraform


terraform init


This downloads the AWS provider and initializes the project.

---

### Validate Terraform Files


terraform validate


Checks if the Terraform configuration is valid.

---

### Preview Infrastructure Changes


terraform plan


Displays the execution plan and resources that will be created.

---

### Apply the Infrastructure


terraform apply


Type:


yes


Terraform will now create all AWS resources defined in the project.

---

### Destroy Infrastructure (Optional)


terraform destroy


Deletes all resources created by Terraform.