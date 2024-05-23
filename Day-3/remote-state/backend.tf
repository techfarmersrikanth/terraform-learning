terraform {
  backend "s3" {
    bucket         = "sri-s3-demo-xyz" # change this
    key            = "sri/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}