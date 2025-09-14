provider "aws" {
  region = "us-east-1"
}

# ----------------------
# Example 1: Using count
# ----------------------
resource "aws_instance" "web_count" {
  count         = 2
  ami           = "ami-0360c520857e3138f" # Amazon Linux 2 AMI (replace for your region)
  instance_type = "t2.micro"

  tags = {
    Name = "web-count-${count.index}"
  }
}
