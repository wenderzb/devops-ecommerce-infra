variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "repositories" {
  description = "Map of ECR repositories to create"
  type = map(object({
    scan_on_push = optional(bool, true)
    mutable_tags = optional(bool, true)
  }))
}

variable "extra_tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}