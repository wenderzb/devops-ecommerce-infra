variable "bucket_backend_name" {
  type        = string
  description = "Bucket Name - Should be Unique for a region!"
  default = "tfstate-ecommerce"
}

variable "extra_tags" {
  type        = map(string)
  description = "Extra tags specific to the environment"
  default     = {}
}

variable "project" {
  type        = string
  description = "Project Name"
  default     = "ecommerce"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}
