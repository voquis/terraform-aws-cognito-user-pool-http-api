module "cognito-user-pool-http-api" {
  source = "voquis/cognito-user-pool-http-api"
  version = "0.0.2"

  cognito_user_pool_name = "my-pool"
  cognito_user_pool_client_name = "my-pool-client"
  cognito_user_pool_callback_urls = ["https://127.0.0.1:3000"]
  api_gateway_name = "my-api-gateway"
  authorizer_name = "my-authorizer"
}

