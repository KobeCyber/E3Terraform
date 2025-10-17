#Work in progress

resource "aws_instance" "example" {
  count = length(data.aws_subnets.default_subnets.ids)
  ...
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = [for inst in aws_instance.example : inst.public_ip]
}

output "instance_private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = [for inst in aws_instance.example : inst.private_ip]
}

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = [for inst in aws_instance.example : inst.id]
}

output "instance_ami" {
  description = "AMI ID used by the EC2 instances"
  value       = var.ami
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.example.id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.example.id
}
