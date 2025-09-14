provider "aws" {
  region = "us-east-1"
}
# ----------------------------
# Security Group with Validation
# ----------------------------
resource "aws_security_group" "web_sg" {
  name        = "web-sg-${var.environment}"
  description = "Web SG for ${var.environment}"
  vpc_id      = "vpc-03769464f0102e22c" # replace with your VPC id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ----------------------------
# EC2 Instance
# ----------------------------
resource "aws_instance" "web" {
  ami           = "ami-0360c520857e3138f" # Amazon Linux 2 (replace per region)
  instance_type = var.instance_type
  subnet_id     = "subnet-01a931d73333a604f" # replace with your subnet id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-${var.environment}"
  }
}
