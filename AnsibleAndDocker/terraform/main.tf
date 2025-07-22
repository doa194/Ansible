# This Terraform configuration file provisions an EC2 instance in AWS with a security group that allows SSH and HTTP access. It uses variables for AWS region, instance type, key name, VPC ID, and subnet ID.

# The EC2 instance is tagged with the name "devops-ansible-docker". The security group allows inbound traffic on port 22 (SSH) and port 80 (HTTP) and allows all outbound traffic.

resource "aws_instance" "devops_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 22.04 LTS us-east-1
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "devops-ansible-docker"
  }
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}