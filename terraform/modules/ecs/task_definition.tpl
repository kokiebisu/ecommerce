[
  {
    "name": "${var.namespace}",
    "image": "776733965771.dkr.ecr.us-east-1.amazonaws.com/ecommerce-product",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 512,
    "cpu": 256,
    "networkMode" = "awsvpc"
  }
]