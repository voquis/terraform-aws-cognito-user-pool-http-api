# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

# Cognito parameters
variable "cognito_user_pool_name" {
  type = string
}

variable "cognito_user_pool_client_name" {
  type = string
}

variable "cognito_user_pool_callback_urls" {
  type = list(string)
}

# HTTP API gateway parameters
variable "api_gateway_name" {
  description = "API gateway v2 name"
  type        = string
}

variable "authorizer_name" {
  description = "API gateway v2 authorizer name"
  type        = string
}

variable "stage_name" {
  description = "API deployment stage name"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

# HTTP API gateway parameters
variable "cors_allow_headers" {
  description = "Set Access-Control-Allow-Headers header, tells pre-flight OPTIONS requests which HTTP headers can be used during the actual request"
  type        = list(string)
  default     = []
}

variable "cors_allow_methods" {
  description = "Set Access-Control-Allow-Methods header, tells pre-flight OPTIONS request which methods are allowed during the actual request"
  type        = list(string)
  default     = []
}

variable "cors_allow_origins" {
  description = "Set Access-Control-Allow-Origin header, tells pre-flight OPTIONS request which originating hosts are allowed to make the actual request"
  type        = list(string)
  default     = []
}

variable "cors_max_age" {
  description = "Set Access-Control-Max-Age header, how long pre-flight OPTIONS requests may be cached"
  type        = number
  default     = 0
}


variable "identity_sources" {
  description = "Identity sources (location of JWT in request)"
  type        = list(string)
  default     = ["$request.header.Authorization"]
}

variable "log_group_name" {
  description = "CloudWatch log group name, random unique name will be given if omitted"
  type        = string
  default     = null
}

# https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-logging-variables.html
variable "log_format" {
  description = "Integration access log format"
  type        = string
  default     = "$context.identity.sourceIp,$context.requestTime,$context.httpMethod,$context.routeKey,$context.protocol,$context.status,$context.responseLength,$context.requestId,$context.extendedRequestId,$context.integrationErrorMessage"
}

variable "log_retention_in_days" {
  description = "Number of days to keep CloudWatch logs"
  type        = number
  default     = 30
}

variable "stage_autodeploy" {
  description = "Whether the API stage should be automatically redeployed on every eligible change, e.g. updating a route or authorization"
  type        = bool
  default     = true
}

