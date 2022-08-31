### /v1

resource "aws_api_gateway_resource" "v1" {
  rest_api_id = aws_api_gateway_rest_api.default.id
  parent_id = aws_api_gateway_rest_api.default.root_resource_id
  path_part = "v1"
}

resource "aws_api_gateway_method" "v1" {
  rest_api_id   = aws_api_gateway_rest_api.default.id
  resource_id   = aws_api_gateway_resource.v1.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "v1" {
  rest_api_id          = aws_api_gateway_rest_api.default.id
  resource_id          = aws_api_gateway_resource.v1.id
  http_method          = aws_api_gateway_method.v1.http_method
  type                     = "HTTP_PROXY"
  integration_http_method  = "ANY"
  # uri                      = "${format("%s/{proxy}", "${var.load_balancer_url}")}"
  uri = "http://${var.load_balancer_dns_name}"
  passthrough_behavior     = "WHEN_NO_MATCH"
  # request_parameters       = "${var.aws_api_gateway_integration_request_parameters}"
}

### /v1/products

resource "aws_api_gateway_resource" "product" {
  rest_api_id = aws_api_gateway_rest_api.default.id
  parent_id = aws_api_gateway_resource.v1.id
  path_part = "products"
}

resource "aws_api_gateway_method" "product" {
  rest_api_id   = aws_api_gateway_rest_api.default.id
  resource_id   = aws_api_gateway_resource.product.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "product" {
  rest_api_id          = aws_api_gateway_rest_api.default.id
  resource_id          = aws_api_gateway_resource.product.id
  http_method          = aws_api_gateway_method.product.http_method
  type                     = "HTTP_PROXY"
  integration_http_method  = "ANY"
  # uri                      = "${format("%s/{proxy}", "${var.load_balancer_url}")}"
  uri = "http://${var.load_balancer_dns_name}"
  passthrough_behavior     = "WHEN_NO_MATCH"
  # request_parameters       = "${var.aws_api_gateway_integration_request_parameters}"
}
