data "aws_availability_zones" "available_zones" {}


resource "aws_vpc" "default" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "${var.namespace}-vpc"
    }
}
