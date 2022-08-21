data "aws_iam_policy_document" "assume_role_policy" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type = "Service"
            identifiers = ["ecs-tasks.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "ecs-task-execution" {
    name = "${var.namespace}-execution-task-role"
    assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

    tags = {
        Name = "${var.namespace}-ecs-role"
    }
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution" {
    role = aws_iam_role.ecs-task-execution.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}