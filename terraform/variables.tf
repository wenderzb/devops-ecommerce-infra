####################################
### VPC and Networking Variables ### 
####################################

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

###########
### ECR ###
###########

variable "repositories" {
  description = "Map of ECR repositories"
  type = map(object({
    scan_on_push = optional(bool, true)
    mutable_tags = optional(bool, true)
  }))
  default = {}
}