resource "aws_api_gateway_rest_api" "default" {
  name = "${var.namespace}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

