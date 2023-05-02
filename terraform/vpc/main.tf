# # Backend - Location where the TF statefile will be.
# terraform {
#     backend "local" {
#         path = "terraform.tfstate" # This statefile should be in a remote location (e.g.: S3) when collaborating with other developers
#     }

#     required_providers {
#         aws = {
#             source  = "hashicorp/aws"
#             version = "~> 4.0"
#         }
#     }
# }

# # Configure the AWS Provider
# provider "aws" {
#     region = "eu-west-2"
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["eu-west-2a", "eu-west-2b"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"] # Public IPs created random?

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }