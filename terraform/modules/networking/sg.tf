resource "aws_security_group" "lb_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "lb_sg"
  }
}

# module "lb_sg" {
#     source = "terraform-in-action/sg/aws"
#     vpc_id = module.vpc.vpc_id
#     ingress_rules = [{
#         port = 80
#         cidr_blocks = ["0.0.0.0/0"]
#     }]
# }

# module "server_sg" {
#     source = "terraform-in-action/sg/aws"
#     vpc_id = module.vpc.vpc_id
#     ingress_rules = [{
#         port = 80
#         cidr_blocks = ["0.0.0.0/0"]
#     }]
# }

# module "db_sg" {
#     source = "terraform-in-action/sg/aws"
#     vpc_id = module.vpc.vpc_id
#     ingress_rules = [{
#         port = 3306
#         security_groups = [module.web]
#     }]
# }

