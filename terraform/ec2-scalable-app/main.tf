# Backend - Location where the TF statefile will be.
terraform {
    backend "local" {
        path = "terraform.tfstate"
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
    ami           = "ami-04706e771f950937f"
    instance_type = "t2.micro"

    # https://stackoverflow.com/questions/71643844/terraform-whats-the-difference-between-tags-and-tags-all
    tags = {
        Name = "HelloWorld"
    }

    key_name = "web1"

    depends_on = [
        aws_key_pair.web1
    ]
}

