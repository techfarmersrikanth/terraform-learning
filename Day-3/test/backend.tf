terraform {
  backend "s3" {
    bucket = "sri-s3-terraform-demo-abc"
    region = "us-east-1"
    key = "sri/terraform.tfstate"
}
}