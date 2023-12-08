module "dynamodb_commissioning_profiler_table" {
  source = "../../modules/dynamodb"

  table_name = var.commissioning_profiler_dynamodb_table_name
}
