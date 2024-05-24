provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-031258d5bbd326b57"  # replace this
}

module "sri_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0bb84b8ffd87024d8"
  instance_type_value = "t2.nano"
  subnet_id_value = "subnet-031258d5bbd326b57"
}

module "demo_devops" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0bb84b8ffd87024d8"
  instance_type_value = "t2.medium"
  subnet_id_value = "subnet-031258d5bbd326b57"
}