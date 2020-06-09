provider "aws" {
  version = "2.65.0"
}

module "cognito-user-pool-http-api" {
  source  = "voquis/cognito-user-pool-http-api/aws"
  version = "0.2.0"
  # Required parameters
  cognito_user_pool_name          = "my-pool"
  cognito_user_pool_client_name   = "my-pool-client"
  cognito_user_pool_callback_urls = ["https://127.0.0.1:3000"]
  api_gateway_name                = "my-api-gateway"
  authorizer_name                 = "my-authorizer"
  stage_name                      = "my-stage"
  # optional parameters
  cors_allow_headers              = ["Authorization"]
  cors_allow_methods              = ["GET", "POST", "DELETE", "PUT"]
  cors_allow_origins              = ["https://*"]
  cors_max_age                    = 300
  log_group_name                  = "my-api-gateway-logs"
  log_format                      = "$context.identity.sourceIp,$context.requestTime,$context.httpMethod,$context.routeKey,$context.protocol,$context.status,$context.requestId,$context.extendedRequestId,$context.integrationErrorMessage"
  log_retention_in_days           = 14
  stage_autodeploy                = true
}

