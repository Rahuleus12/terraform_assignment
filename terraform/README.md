# Terraform Nginx on Ubuntu

This project demonstrates how to use Terraform to provision an EC2 instance running Nginx web server with a custom configuration.

## Prerequisites

*   [Terraform](https://www.terraform.io/downloads.html) installed
*   [AWS CLI](https://aws.amazon.com/cli/) installed and configured with your AWS credentials

## Instructions

1.  Initialize Terraform:

    ```bash
    terraform init
    ```

2.  Plan the changes:

    ```bash
    terraform plan
    ```

3.  Apply the changes:

    ```bash
    terraform apply
    ```

4.  Access the Nginx server in your browser using the public IP outputted by Terraform.

5.  To destroy the resources:

    ```bash
    terraform destroy
    ```

## Resources Created

*   **aws\_instance.nginx\_server:** An EC2 instance running Ubuntu 20.04 LTS with Nginx installed.
*   **aws\_security\_group.nginx\_sg:** A security group allowing HTTP (port 80) and SSH (port 22) traffic.

## Screenshots

The Nginx server is running and serving the custom HTML page. You can access the server in your browser using the public IP: 54.193.235.252


![Nginx Output](output.png)







