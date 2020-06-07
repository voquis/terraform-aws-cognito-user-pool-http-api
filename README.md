# cognito-user-pool-http-api
Terraform module to provision HTTP API (v2) authorizer with Cognito user pool

Creates the following resources:
* Cognito user pool
* Cognito user pool clien (app)
* HTTP API gateway (v2)
* HTTP API gatway (v2) authorizer that uses the user pool for JWT token verification

See [examples](examples) directory for usage.
