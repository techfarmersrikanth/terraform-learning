Dynamic Block

Purpose → Used inside a resource to dynamically generate nested arguments.

Scope → Works within a single resource.

Use Case → When you need repeated blocks (e.g., multiple ingress rules in a security_group, multiple ebs_block_device in an EC2).

Implementation → Uses for_each or for expressions.

✅ Example: Security group with multiple rules

variable "ingress_rules" {
  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  ]
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}


👉 Instead of manually writing 10 ingress blocks, one dynamic loop handles all.

🔹 Module

Purpose → A reusable collection of resources (a higher-level abstraction).

Scope → Works across multiple resources (can include VPC, subnets, EC2, SG, etc.).

Use Case → When you want to reuse infrastructure patterns (e.g., a complete VPC setup, an EC2 + SG combo).

Implementation → Defined in a separate folder and called with module block.

✅ Example: VPC Module

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
  azs    = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}


👉 Instead of re-writing VPC + subnets + routes everywhere, you call the module and pass variables.

⚖️ Key Differences
Feature	Dynamic Block	Module
Level	Inside a single resource	Across multiple resources
Purpose	Generate repeated nested blocks dynamically	Package and reuse infrastructure
Scope	Local to one resource	Global, reusable across projects
Reusability	Limited (only inside one resource)	High (can be shared across repos/teams)
Example Use Case	Multiple SG rules	Entire VPC, multiple EC2s, networking setup

✅ Rule of Thumb

Use dynamic blocks if you’re repeating nested arguments inside one resource.

Use modules if you’re repeating infrastructure patterns across resources/environments.