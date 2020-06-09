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
  cors_configuration {
    allow_origins = var.cors_allow_origins
    allow_methods = var.cors_allow_methods
    allow_headers = var.cors_allow_headers
    max_age       = var.cors_max_age
  }
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

# ---------------------------------------------------------------------------------------------------------------------
# Create autodeploy stage
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/apigatewayv2_stage.html
# Note that the initial stage will not autodeploy unless integrations are added
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_stage" "this" {
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.this.arn
    format          = var.log_format
  }
  api_id      = aws_apigatewayv2_api.this.id
  auto_deploy = var.stage_autodeploy
  name        = var.stage_name
}

# ---------------------------------------------------------------------------------------------------------------------
# Create Cloudwatch log group
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html
# ---------------------------------------------------------------------------------------------------------------------


resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = var.log_retention_in_days
}