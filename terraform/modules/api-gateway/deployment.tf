resource "aws_api_gateway_deployment" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id

  depends_on = [
    aws_api_gateway_resource.v1, 
    aws_api_gateway_method.v1,
    aws_api_gateway_resource.products,
    aws_api_gateway_method.products,
    aws_api_gateway_integration.products
  ]

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.default.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "default" {
  deployment_id = aws_api_gateway_deployment.default.id
  rest_api_id   = aws_api_gateway_rest_api.default.id
  stage_name    = "default"
}