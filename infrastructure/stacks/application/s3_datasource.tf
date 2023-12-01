module "ss_datasource_bucket" {
  source      = "../../modules/s3"
  bucket_name = "${var.ss_datasource_bucket_name}${local.workspace_suffix}"
}