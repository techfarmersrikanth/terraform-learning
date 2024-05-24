variable "ami" {
  description = "This is AMI for the instance"
  default = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  description = "This is the instance type, for example: t2.micro"
  default = "t2.micro"
}