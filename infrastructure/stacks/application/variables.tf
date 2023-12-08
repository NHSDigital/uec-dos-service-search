variable "rest_api_name" {
  description = "Name of the api gateway"
}
variable "gateway_authorizer" {
  description = "Name of api gateway authoriser"
}
variable "logs_retention_days" {
  description = "Number of days to retain logs"
}
variable "cognito_pool_name" {
  description = "Name of cognito user pool"
}
variable "commissioning_profiler_function_name" {
  description = "Name of lambda function for commissioning profiler"
}
variable "commissioning_profiler_dynamodb_table_name" {
  description = "Name of dynamodb table for commissioning profiler"
}
variable "cloudwatch_log_group_name" {
  description = "Name of cloudwatch log group"
}
variable "ss_datasource_bucket_name" {
  description = "Name of Service Search data bucket"
}
