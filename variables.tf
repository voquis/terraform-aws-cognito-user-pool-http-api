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

# HTTP API gateway parameters
variable "identity_sources" {
  description = "Identity sources (location of JWT in request)"
  type        = list(string)
  default     = ["$request.header.Authorization"]
}

variable "stage_autodeploy" {
  description = "Whether the API stage should be automatically redeployed on every eligible change, e.g. updating a route or authorization"
  type        = bool
  default     = true
}

