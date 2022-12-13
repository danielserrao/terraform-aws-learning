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

# EC2 instance that will be deployed to AWS
resource "aws_instance" "web" {
  ami           = "ami-04706e771f950937f"
  instance_type = "t2.micro"

  # https://stackoverflow.com/questions/71643844/terraform-whats-the-difference-between-tags-and-tags-all
  tags = {
    Name = "HelloWorld"
  }
}