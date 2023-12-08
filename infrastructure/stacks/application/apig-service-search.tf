resource "aws_api_gateway_resource" "service_search_resource" {
  parent_id   = module.ss_rest_api.root_resource_id
  path_part   = "service_search"
  rest_api_id = module.ss_rest_api.rest_api_id
}
resource "aws_api_gateway_method" "service_search_post" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.service_search_resource.id
  rest_api_id   = module.ss_rest_api.rest_api_id

  depends_on = [
    aws_api_gateway_resource.service_search_resource
  ]
}
module "service_search_integrations_post" {
  source              = "../../modules/api-gateway-integrations"
  aws_region          = var.aws_region
  account_id          = local.account_id
  rest_api_id         = module.ss_rest_api.rest_api_id
  http_method         = aws_api_gateway_method.service_search_post.http_method
  gateway_resource_id = aws_api_gateway_resource.service_search_resource.id

  depends_on = [
    aws_api_gateway_resource.service_search_resource,
    aws_api_gateway_method.service_search_post
  ]
}

######
# Lambda permissions
######
module "service_search_aws_lambda_permission" {
  source               = "../../modules/api-gateway-permissions"
  aws_region           = var.aws_region
  account_id           = local.account_id
  lambda_function_name = var.commissioning_profiler_function_name
  rest_api_id          = module.ss_rest_api.rest_api_id
}

#####
# CORS
#####
/* module "service_search_enable_cors_on_service_search" {
  source          = "squidfunk/api-gateway-enable-cors/aws"
  version         = "0.3.3"
  api_id          = module.ss_rest_api.rest_api_id
  api_resource_id = aws_api_gateway_resource.service_search_resource.id

  depends_on = [
    aws_api_gateway_resource.service_search_resource,
    module.ss_rest_api
  ]
} */


