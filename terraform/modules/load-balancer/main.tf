resource "aws_lb" "default" {
    name = "${var.namespace}-lb"
    load_balancer_type = "application"
    subnets = var.subnet.public.*.id
    security_groups = [aws_security_group.load_balancer.id]
    internal = false

    tags = {
        Name = "${var.namespace}-lb"
    }
}

resource "aws_lb_target_group" "default" {
    name = "${var.namespace}-ecs"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc.id
    target_type = "ip"
    
    tags = {
        Name = "${var.namespace}-lb-starget-group"
    }
}

resource "aws_lb_listener" "default" {
    load_balancer_arn = aws_lb.default.id
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.default.id
    }

    tags = {
        Name = "${var.namespace}-lb-listener"
    }
}
