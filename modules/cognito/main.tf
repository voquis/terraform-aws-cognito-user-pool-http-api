terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# Create Cognito User pool
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/cognito_user_pool.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_cognito_user_pool" "this" {
  admin_create_user_config {
    allow_admin_create_user_only = true
  }
  mfa_configuration = "ON"
  name              = var.cognito_user_pool_name
  software_token_mfa_configuration {
    enabled = true
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Create Cognito User pool App Client
# Provider Docs: https://www.terraform.io/docs/providers/aws/r/cognito_user_pool_client.html
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_cognito_user_pool_client" "this" {
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["openid"]
  callback_urls                        = var.cognito_user_pool_callback_urls
  name                                 = var.cognito_user_pool_client_name
  supported_identity_providers         = ["COGNITO"]
  user_pool_id                         = aws_cognito_user_pool.this.id
}

