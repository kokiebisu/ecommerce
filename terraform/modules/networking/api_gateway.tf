resource "aws_api_gateway_rest_api" "rest_api" {
  name = "${var.namespace}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "productsResource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part = "products"
}

resource "aws_api_gateway_method" "productsGetMethod" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.productsResource.id
  http_method   = "GET"
  authorization = "NONE"
}

# resource "aws_api_gateway_integration" "productsGetIntegration" {
#   rest_api_id          = aws_api_gateway_rest_api.rest_api.id
#   resource_id          = aws_api_gateway_resource.productsResource.id
#   http_method          = aws_api_gateway_method.productsGetMethod.http_method
#   type                     = "HTTP_PROXY"
#   integration_http_method  = "ANY"
#   uri                      = "${format("%s/{proxy}", "${var.base_url}")}"
#   passthrough_behavior     = "WHEN_NO_MATCH"
#   request_parameters       = "${var.aws_api_gateway_integration_request_parameters}"
# }

# resource "aws_api_gateway_rest_api_policy" "ingress_policy" {
#   rest_api_id = aws_api_gateway_rest_api.rest_api.id

#   policy = <<EOF
#   {
#     Version = "2012-10-17",
#     Statement = [{
#       Effect = "Deny",
#       Principal = "*",
#       Action = "execute-api:Invoke",
#       Resource = "execute-api:/*/*/*
#     },
#     {
#       Effect = "Allow",
#       Principal = "*",
#       Action = "execute-api:Invoke",
#       Resource = "execute-api:/*/*/*,
#       Condition = {
#         NotIpAddress = {
#           "aws:SourceIp" = ["10.0.0.0/24", "10.10.0.0/24"]
#         }
#       }
#     }]
#   }
#   EOF
# }
