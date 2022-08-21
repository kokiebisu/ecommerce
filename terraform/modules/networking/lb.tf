resource "aws_lb" "products_lb" {
  name               = "products-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in module.vpc.public_subnets : subnet]


}
