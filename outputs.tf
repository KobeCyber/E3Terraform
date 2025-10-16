#Work in progress

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.example.private_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_ami" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.example.ami
}

output "security_group_id" {
  description = "The ID of the security group attached to the EC2 instance"
  value       = aws_security_group.example.id
}

output "vpc_id" {
  description = "The ID of the VPC where the EC2 instance is deployed"
  value       = aws_vpc.example.id
}
