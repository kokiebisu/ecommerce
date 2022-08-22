resource "aws_ecs_cluster" "default" {
    name = "${var.namespace}"

    tags = {
        Name = "${var.namespace}-ecs-cluster"
    }
}

resource "aws_ecs_task_definition" "default" {
    family = "${var.namespace}"
    network_mode = "awsvpc" # tells that an elastic network interface and a private IP address should be assigned to the task
    requires_compatibilities = [ "FARGATE" ]
    cpu = 256
    memory = 512
    execution_role_arn = aws_iam_role.ecs-task-execution.arn


    container_definitions = jsonencode([
        {
   
            image = "776733965771.dkr.ecr.us-east-1.amazonaws.com/ecommerce-product",
            cpu = 256,
            memory = 512,
            name = var.namespace,
            networkMode = "awsvpc",
            portMappings = [
                {
                    "containerPort": 80,
                    "hostPort": 80
                }
            ],
        }
    ])
}

resource "aws_ecs_service" "service" {
    name = "ecommerce-product-service"
    cluster = aws_ecs_cluster.default.id
    task_definition = aws_ecs_task_definition.default.arn
    desired_count = 1
    launch_type = "FARGATE"

    network_configuration {
      subnets = var.subnet.private.*.id
      security_groups = [aws_security_group.ecs.id, var.load_balancer_security_group.id]
      assign_public_ip = false
    }

    load_balancer {
      target_group_arn = var.load_balancer_target_group.arn
      container_name = var.namespace
      container_port = 80
    }

    depends_on = [var.load_balancer_listener]
}
