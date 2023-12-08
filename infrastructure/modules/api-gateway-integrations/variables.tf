# ==============================================================================
# Mandatory variables
variable "aws_region" {
  description = "AWS region identifier"
}
variable "http_method" {
  description = "Http method for integration - GET POST etc"
}
variable "rest_api_id" {
  description = "Id of rest api"
}
variable "gateway_resource_id" {
  description = "Id of api gateway resource"
}
variable "account_id" {
  description = "Id of AWS account"
}
variable "lambda_function_name" {
  description = "Name of lambda function"
  default     = "commissioning-profiler"
}
# ==============================================================================
# Default variables

