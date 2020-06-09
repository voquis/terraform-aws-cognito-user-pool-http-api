output "apigatewayv2_api" {
  value = module.http_api_gateway.apigatewayv2_api
}

output "apigatewayv2_authorizer" {
  value = module.http_api_gateway.apigatewayv2_authorizer
}

output "apigatewayv2_stage" {
  value = module.http_api_gateway.apigatewayv2_stage
}

output "cloudwatch_log_group" {
  value = module.http_api_gateway.cloudwatch_log_group
}

output "cognito_user_pool" {
  value = module.cognito.user_pool
}

output "cognito_user_pool_client" {
  value = module.cognito.user_pool_client
}