provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "sandbox_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "sandbox_vpc"
  }
}

resource "aws_subnet" "sandbox_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sandbox_subnet"
  }
}

resource "aws_security_group" "sandbox_sg" {
  name   = "sandbox_sg"
  vpc_id = aws_vpc.sandbox_vpc.id

  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  ingress {
    description = "Allows HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  ingress {
    description = "Allows HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  # more ingress rules here...

  tags = {
    Name = "sandbox_sg"
  }
}

# 🔹 EC2 Instance
resource "aws_instance" "web" {
  ami                         = "ami-0360c520857e3138f" # Amazon Linux 2 (update if needed)
  instance_type               = "t2.nano"
  subnet_id                   = aws_subnet.sandbox_subnet.id
  vpc_security_group_ids      = [aws_security_group.sandbox_sg.id]
  associate_public_ip_address = true
  key_name                    = "my-key" # replace with your key pair

  tags = {
    Name = "web-instance"
  }
}
