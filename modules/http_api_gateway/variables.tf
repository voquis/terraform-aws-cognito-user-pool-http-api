# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "api_gateway_name" {
  description = "API gateway v2 name"
  type = string
}

variable "authorizer_name" {
  description = "API gateway v2 authorizer name"
  type = string
}

variable "jwt_audience" {
  description = "JWT Audience (Cognito app client ids)"
  type = list(string)
}

variable "jwt_issuer" {
  description = "JWT Issuer (Cognito user pool endpoint)"
  type = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "identity_sources" {
  description = "Identity sources (location of JWT in request)"
  type = list(string)
  default = ["$request.header.Authorization"]
}

