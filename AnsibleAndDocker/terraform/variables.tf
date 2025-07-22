variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name for EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC to launch instance in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet to launch instance in"
  type        = string
}