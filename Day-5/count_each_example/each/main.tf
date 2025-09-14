provider "aws" {
  region = "us-east-1"
}

# ----------------------
# Example 2: Using for_each
# ----------------------
variable "instances" {
  default = {
    dev  = "t2.micro"
    qa   = "t2.small"
    prod = "t2.medium"
  }
}

resource "aws_instance" "web_each" {
  for_each      = var.instances
  ami           = "ami-0360c520857e3138f" # Amazon Linux 2 AMI (replace for your region)
  instance_type = each.value

  tags = {
    Name = "web-each-${each.key}"
  }
}
