locals {
  common_tags = merge(
    {
      Environment = var.env
      Project     = var.project
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}

#module "iam" {
#  source      = "../../modules/iam"
#  environment = var.project
#  tags        = local.common_tags
#
#  create_dms_vpc_roles                = true
#  create_dms_compat_role              = true
#  create_dms_service_linked_role      = true
#  create_datasync_roles               = true
#  create_datasync_service_linked_role = true
#  create_rds_service_linked_role      = true
#  create_elasticache_service_linked_role = true
#}
