variable "env" {
  type        = string
  description = "Environment name (dev, uat, prod)"
  default     = "dev"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project" {
  type        = string
  description = "Project name (ex: logistics-dev, factory-dev)"
}

variable "extra_tags" {
  type        = map(string)
  description = "Extra tags specific to the environment"
  default     = {}
}

# ============================================================================
# RDS/Database Variables (optional - use when needed)
# ============================================================================

variable "db_name" {
  type        = string
  description = "RDS database name"
  default     = null
}

variable "db_username" {
  type        = string
  description = "RDS master username"
  default     = null
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "RDS master password"
  default     = null
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage (GB) for RDS"
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  description = "Maximum allocated storage for autoscaling (in GB)"
  default     = null
}

variable "engine_version" {
  type        = string
  description = "PostgreSQL engine version"
  default     = "18.1"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class (e.g. db.t4g.medium)"
  default     = "db.t4g.medium"
}

variable "storage_type" {
  type        = string
  description = "Storage type (gp2, gp3, io1, io2)"
  default     = "gp3"

  validation {
    condition     = contains(["gp2", "gp3", "io1", "io2"], var.storage_type)
    error_message = "Storage type must be one of: gp2, gp3, io1, io2."
  }
}

variable "storage_throughput" {
  type        = number
  default     = null
  description = "GP3 throughput in MiB/s (125–1000). Null to use AWS default."

  validation {
    condition     = var.storage_throughput == null || try(var.storage_throughput >= 125 && var.storage_throughput <= 1000, false)
    error_message = "storage_throughput must be null or between 125 and 1000."
  }
}

variable "iops" {
  type        = number
  description = "IOPS for the storage. For GP3: 3000-16000. For io1/io2: 100-64000."
  default     = null
}

variable "name" {
  type        = string
  description = "Logical name of the database (used in identifiers and tags)"
  default     = null
}

# ============================================================================
# Network Variables (optional - use when needed)
# ============================================================================

variable "vpc_name" {
  type        = string
  description = "VPC Name tag used to lookup existing VPC"
  default     = null
}

variable "db_sg_id" {
  type        = string
  description = "Security Group ID for database access"
  default     = null
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to be used by RDS and DMS (db subnet group / replication subnet group)"
  default     = []
}

# ============================================================================
# DMS Variables (optional - use when needed)
# ============================================================================

variable "dms_source_server" {
  type        = string
  description = "DMS source database server"
  default     = null
}

variable "dms_source_username" {
  type        = string
  description = "DMS source database username"
  default     = null
}

variable "dms_source_password" {
  type        = string
  sensitive   = true
  description = "DMS source database password"
  default     = null
}

variable "dms_source_database" {
  type        = string
  default     = null
  description = "DMS source database name"
}

# ============================================================================
# S3 Variables (optional - use when needed)
# ============================================================================

variable "s3_buckets" {
  type        = list(string)
  description = "List of S3 buckets to create"
  default     = []
}
