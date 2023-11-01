module "service_search_bucket" {
  source      = "../../modules/s3"
  bucket_name = var.service_search_bucket_name
}
