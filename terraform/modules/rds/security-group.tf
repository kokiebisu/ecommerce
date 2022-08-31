resource "aws_security_group" "rds" {
    vpc_id = var.vpc.id
    name = "${var.namespace}-rds-sg"

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [var.ecs_security_group.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.namespace}-rds-sg"
    }
}
