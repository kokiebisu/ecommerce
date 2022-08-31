resource "aws_security_group" "ecs" {
    name = "${var.namespace}-ecs-sg"
    vpc_id = var.vpc.id

    ingress {
        protocol = "tcp"
        from_port = 0
        to_port = 0
        # protocol = "tcp"
        # from_port = 3000
        # to_port = 3000
        security_groups = [var.load_balancer_security_group.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.namespace}-ecs-sg"
    }
}
