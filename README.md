# Terraform AWS Infrastructure Deployment

This Terraform project allows you to provision AWS resources, including EC2 instances and security groups, in your chosen AWS region. It's designed to be easily configurable for different environments.

## Prerequisites

Before using this Terraform configuration, make sure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed locally.
- AWS credentials with appropriate permissions configured either via environment variables, AWS CLI configuration, or other secure methods.

## Configuration

1. Clone this repository to your local machine.

2. Customize the Terraform variables by creating a `terraform.tfvars` file in the project directory. You can use the `terraform.tfvars.example` file as a template.

3. Modify the `terraform.tfvars` file with your own values for AWS region, instance type, security group rules, etc.

## User Data

The user data script `user_data.sh` included in this project is executed on each EC2 instance during provisioning. It performs the following actions:

1. Installs [K3s](https://k3s.io/) - A lightweight Kubernetes distribution.
2. Initializes a K3s cluster on the instance.
3. Sets the `KUBECONFIG` environment variable to point to the cluster configuration file.

You can customize the `user_data.sh` script as needed for your specific setup.

## Usage

1. Initialize the Terraform working directory:

   ```bash
   terraform init
   ```

2. View the execution plan to ensure that the changes will be made as expected:

   ```bash
   terraform plan
   ```

3. Apply the configuration to create AWS resources:

   ```bash
   terraform apply
   ```

4. When you're finished, you can destroy the created resources:

   ```bash
   terraform destroy
   ```

## Terraform Files

- `variables.tf`: Defines the variables used in this configuration.

- `main.tf`: Specifies the AWS resources to be provisioned, such as EC2 instances and security groups.

- `user_data.sh`: A Bash script that is executed on each EC2 instance during provisioning.

## .gitignore

The `.gitignore` file is configured to exclude sensitive files like `terraform.tfvars` from version control.

## Security Notice

Do not upload sensitive information, such as AWS access keys or secret keys, to public repositories. Use environment variables or a secrets management system to securely provide credentials to Terraform.
