terraform {
  required_version = ">= 0.12"
}

module "cognito" {
  source                          = "./modules/cognito"
  cognito_user_pool_name          = var.cognito_user_pool_name
  cognito_user_pool_client_name   = var.cognito_user_pool_client_name
  cognito_user_pool_callback_urls = var.cognito_user_pool_callback_urls
}

module "http_api_gateway" {
  source                = "./modules/http_api_gateway"
  api_gateway_name      = var.api_gateway_name
  authorizer_name       = var.authorizer_name
  cors_allow_headers    = var.cors_allow_headers
  cors_allow_methods    = var.cors_allow_methods
  cors_allow_origins    = var.cors_allow_origins
  cors_max_age          = var.cors_max_age
  identity_sources      = var.identity_sources
  jwt_audience          = [module.cognito.user_pool_client.id]
  jwt_issuer            = "https://${module.cognito.user_pool.endpoint}"
  log_format            = var.log_format
  log_group_name        = var.log_group_name
  log_retention_in_days = var.log_retention_in_days
  stage_autodeploy      = var.stage_autodeploy
  stage_name            = var.stage_name
}

