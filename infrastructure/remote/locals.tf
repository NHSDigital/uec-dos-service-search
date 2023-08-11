# ==============================================================================
# Context

locals {

  terraform-git-repo = "uec-dos-service-search"
  account_id         = data.aws_caller_identity.current.id
}
