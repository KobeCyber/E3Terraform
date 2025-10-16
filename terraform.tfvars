#Still a work in progress

#allowed_ip is allowed to everyone be careful


region        = "us-east-1"
instance_type = "t3.micro"
allowed_ip    = "0.0.0.0/0"    # Your IP or office IP for SSH access
ami_id       = "ami_id       = "ami-0c02fb55956c7d316"  # Ubuntu Linux 24 LTS  AMI
key_name     = "my-ssh-key"        # Your EC2 key pair name
vpc_id       = "vpc-0123456789abcdef0"  # Your VPC ID if required
subnet_id    = "subnet-0123456789abcdef0" # Subnet ID
