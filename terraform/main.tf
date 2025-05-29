terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "nginx_server" {
  ami           = "ami-04f7a54071e74f488" # Ubuntu 24.04 LTS
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              echo "Welcome to the Terraform-managed Nginx Server on Ubuntu" > /var/www/html/index.html
              EOF
  vpc_security_group_ids = [aws_security_group.nginx_sg_unique.id]

  tags = {
    Name = "NginxServer"
  }
}

resource "aws_security_group" "nginx_sg_unique" {
  name        = "nginx_sg_unique"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
