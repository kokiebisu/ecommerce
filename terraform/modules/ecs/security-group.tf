resource "aws_security_group" "ecs" {
    name = "${var.namespace}-ecs-sg"
    vpc_id = var.vpc.id

    ingress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        # protocol = "tcp"
        # from_port = 3000
        # to_port = 3000
        security_groups = [var.load_balancer_security_group.id]
    }

    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.namespace}-ecs-sg"
    }
}
