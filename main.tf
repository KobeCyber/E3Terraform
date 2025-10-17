provider "aws" {
  region = "us-east-1"    # Change as needed
}

# VPC & Subnet - Assume default VPC used (or define explicitly if company uses custom VPC)

# Security Group allowing SSH and HTTP
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "SSH from allowed IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.allowed_ip]
  }

  ingress {
    description      = "HTTPs from anywhere"
    from_port        = 443
    to_port          = 443
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
    Name = "web-sg"
  }
}

# Fetch default VPC info
data "aws_vpc" "default" {
  default = true
}

# Fetch default subnet
data "aws_subnets" "default_subnets" {
  vpc_id = data.aws_vpc.default.id
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                         = "ami-0e8459476fed2e23b"  # Ubuntu Linux 24 LTS AMI in us-east-1
  instance_type               = var.instance_type
  key_name                   = var.key_name
  subnet_id                  = data.aws_subnets.default_subnets.ids[0]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]

  tags = {
    Name = "terraform-web-server"
    Environment = "production"
    Owner = "devops-team"
  }

  # Optional user data to bootstrap the instance
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt  install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello, Terraform!" > /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
