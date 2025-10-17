output "instance_public_ips" {
  description = "Public IPs of the EC2 instances (null if no public IP assigned)"
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
  description = "AMI ID used by the EC2 instances (from first instance if created, fallback to var.ami)"
  value       = length(aws_instance.example) > 0 ? aws_instance.example[0].ami : var.ami
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.example.id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.example.id
}
