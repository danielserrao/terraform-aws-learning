# Backend - Location where the TF statefile will be.
terraform {
    backend "local" {
        path = "terraform.tfstate" # This statefile should be in a remote location (e.g.: S3) when collaborating with other developers
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
    region = "eu-west-2"
}

resource "aws_key_pair" "web1" {
  key_name   = "web1"
  public_key = file("/home/danielserrao/.ssh/id_rsa.pub")
}

# EC2 instance that will be deployed to AWS
resource "aws_instance" "web1" {
    ami           = "ami-09744628bed84e434" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
    instance_type = "t2.micro"

    # https://stackoverflow.com/questions/71643844/terraform-whats-the-difference-between-tags-and-tags-all
    tags = {
        Name = "HelloWorld"
    }

    key_name = "web1"

    # In the real world having a customized AMI with all the packages and the 
    # web application installed instead of using user_data is ideal to avoid 
    # dependency issues when deploying a new EC2 instance
    user_data = <<EOF
#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
EOF

    depends_on = [
        aws_key_pair.web1
    ]
}

