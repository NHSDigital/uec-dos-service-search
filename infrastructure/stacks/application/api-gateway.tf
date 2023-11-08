module "ss_rest_api" {
  source = "../../modules/api-gateway-rest-api"
  rest_api_name = var.rest_api_name
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = module.ss_rest_api.rest_api_id
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_api_gateway_method.service_search_post,
    module.service_search_integrations_post,
  ]
  triggers = {
    redeployment = sha1(jsonencode([
      module.ss_rest_api
    ]))
  }
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = module.ss_rest_api.rest_api_id
  stage_name    = "default"
}
