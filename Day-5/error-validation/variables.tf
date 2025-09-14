
# ----------------------------
# Variables with VALIDATION
# ----------------------------

variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "❌ Environment must be one of: dev, qa, prod."
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "❌ Allowed instance types: t2.micro, t2.small, t2.medium."
  }
}

variable "allowed_cidr" {
  type    = string
  default = "0.0.0.0/0"

  validation {
    condition     = can(cidrhost(var.allowed_cidr, 0))
    error_message = "❌ Must be a valid CIDR block (e.g., 10.0.0.0/24)."
  }
}
