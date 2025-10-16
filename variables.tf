variable "instance_type" {
  default = "t3.micro"
}

variable "kobekey" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "allowed_ip" {
  description = "IP allowed to SSH"
  type        = string
  default     = "0.0.0.0/0"   # Change to your IP range for security
}
