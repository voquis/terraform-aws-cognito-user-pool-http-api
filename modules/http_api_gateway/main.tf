terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# Create HTTP API Gateway
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/apigatewayv2_api.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_api" "this" {
  name          = var.api_gateway_name
  protocol_type = "HTTP"
}

# ---------------------------------------------------------------------------------------------------------------------
# Create JWT Authorizer for HTP API Gateway
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/apigatewayv2_authorizer.html
# Additional Docs: https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-verifying-a-jwt.html#amazon-cognito-user-pools-using-tokens-step-3
# JWT Audience should match the Cognito App Client ID
# JWT Issuer should match the Cognito user pool endpoint, e.g. https://cognito-idp.us-east-1.amazonaws.com/<userpoolID>
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_authorizer" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  authorizer_type  = "JWT"
  identity_sources = var.identity_sources
  name             = var.authorizer_name

  jwt_configuration {
    audience = var.jwt_audience
    issuer   = var.jwt_issuer
  }
}

