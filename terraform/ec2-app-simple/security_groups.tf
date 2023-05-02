resource "aws_security_group" "allow_http" {
    name        = "allow_http_${var.environment}"
    description = "Allow HTTP inbound traffic"
    #vpc_id      = aws_vpc.main.id # Without defining the "vpc_id" it defaults to the region's default VPC

    ingress {
        description      = "HTTP from ALL"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_http_${var.environment}"
    }
}

resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh_${var.environment}"
    description = "Allow SSH inbound traffic"

    ingress {
        description      = "SSH from Internet"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh_${var.environment}"
    }
}