resource "aws_api_gateway_rest_api_policy" "ingress_policy" {
  rest_api_id = aws_api_gateway_rest_api.default.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Effect = "Allow",
            Principal = "*",
            Action = "execute-api:Invoke",
            Resource = [
                "execute-api:/*"
            ]
        },
        # {
        #     Effect = "Deny",
        #     Principal = "*",
        #     Action = "execute-api:Invoke",
        #     Resource = [
        #         "execute-api:/*"
        #     ],
        #     Condition = {
        #         "StringNotEquals": {
        #            "aws:SourceVpc": var.vpc.id
        #         }
        #     }
        # }
    ]
  })
}
