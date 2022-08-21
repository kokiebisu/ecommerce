data "aws_availability_zones" "available_zones" {}

# module "vpc" {
#     source = "terraform-aws-modules/vpc/aws"
#     version = "2.64.0"
#     name = "${var.namespace}-vpc"
#     cidr = "10.0.0.0/16"
#     azs = data.aws_availability_zones.available_zones.names
#     private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#     public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
#     enable_nat_gateway = true
#     single_nat_gateway = true
# }

resource "aws_vpc" "default" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "${var.namespace}-vpc"
    }
}
