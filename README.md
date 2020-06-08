# cognito-user-pool-http-api
Terraform module to provision HTTP API (v2) and authorizer with Cognito user pool.
This module may be useful when building simple pass-through APIs (e.g. to lambdas or EC2 servers) called by ajax/xhr based applications.

Creates the following resources:
* Cognito user pool
* Cognito user pool client (app)
* HTTP API gateway (v2)
* HTTP API gatway (v2) authorizer that uses the user pool for JWT token verification

Also features:
- Configurable CORS configuration
- Autodeploy stage (can be disabled)

See examples directory for usage.
