resource "aws_api_gateway_rest_api_policy" "ingress_policy" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id

  policy = <<EOF
  {
    Version = "2012-10-17",
    Statement = [{
      Effect = "Deny",
      Principal = "*",
      Action = "execute-api:Invoke",
      Resource = "execute-api:/*/*/*
    },
    {
      Effect = "Allow",
      Principal = "*",
      Action = "execute-api:Invoke",
      Resource = "execute-api:/*/*/*,
      Condition = {
        NotIpAddress = {
          "aws:SourceIp" = ["10.0.0.0/24", "10.10.0.0/24"]
        }
      }
    }]
  }
  EOF
}
