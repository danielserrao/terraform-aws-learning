# Configure the AWS Provider
provider "aws" {
    region = var.region
}

resource "aws_key_pair" "web1" {
  key_name   = var.ssh_key_name
  public_key = file("${var.ssh_public_key}")
}

# EC2 instance that will be deployed to AWS
resource "aws_instance" "web1" {
    ami           = "ami-09744628bed84e434" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
    instance_type = "t2.micro"

    security_groups = ["allow_http_${var.environment}","allow_ssh_${var.environment}"]

    # https://stackoverflow.com/questions/71643844/terraform-whats-the-difference-between-tags-and-tags-all
    tags = {
        Name = "HelloWorld-${var.environment}"
    }

    key_name = var.ssh_key_name

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

# Without setting up the "public_ip", the IP created will be random.
# In the real world we might want to use static IPs to allow us to redeploy our EC2 instances and maintain the same IPs
# To do this, you would need to create a VPC before creating the ElasticIP with one or more public subnets and then 
# assign an IP in the CIDR range of one of these subnets to the variable "public_ip"
# It is a good practice to deploy VPCs and Subnets separated from the rest and NOT using the same Statefile.
resource "aws_eip" "example" {
  vpc        = false
  #public_ip  = "54.12.34.56" 
}

resource "aws_eip_association" "example" {
  instance_id   = aws_instance.web1.id
  allocation_id = aws_eip.example.id
}