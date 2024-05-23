provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://3.110.83.159:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "59f3943b-e251-5f9c-d89d-6230e0b8e771"
      secret_id = "dcb85e60-a8b7-9d49-256d-81275b615642"
    }
  }
}
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.srikanth-secret.data["Name"]
  }
}

data "vault_kv_secret_v2" "srikanth-secret" {
  mount = "kv"
  name = "sri"
}

